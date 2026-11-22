package ginlemon.flower.glance;

import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.ContentUris;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.database.ContentObserver;
import android.database.Cursor;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.media.MediaMetadata;
import android.media.session.MediaController;
import android.media.session.MediaSessionManager;
import android.media.session.PlaybackState;
import android.net.Uri;
import android.os.BatteryManager;
import android.os.Handler;
import android.os.Looper;
import android.provider.CalendarContract;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONObject;

/** A home-panel-only, opt-in contextual summary. No location or network polling. */
public final class SLGlanceIsland extends FrameLayout implements ViewTreeObserver.OnPreDrawListener {
    private static final String PREF = "sl_glance_island_v1";
    private static final ExecutorService WORK = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private final SharedPreferences prefs, agenda;
    private final Rect rect = new Rect();
    private final TextView pill;
    private final ArrayList<MediaController> controllers = new ArrayList<>();
    private final MediaSessionManager media;
    private final ComponentName listener;
    private boolean active, receiverRegistered, observerRegistered, mediaRegistered;
    private int battery = -1, generation;
    private String event = "", task = "";
    private CalendarItem calendarItem;
    private static final class CalendarItem {
        final String title; final long begin, end;
        CalendarItem(String title, long begin, long end) { this.title = title; this.begin = begin; this.end = end; }
    }
    private MediaController playing, selected;
    private AlertDialog dialog;

    public SLGlanceIsland(Context context, AttributeSet attrs) {
        super(context, attrs);
        prefs = context.getSharedPreferences(PREF, 0);
        agenda = context.getSharedPreferences("sl_agenda_panel_v1", 0);
        media = (MediaSessionManager) context.getSystemService(Context.MEDIA_SESSION_SERVICE);
        listener = new ComponentName(context.getPackageName(), "ginlemon.notifications.listener.NotificationListener");
        pill = new TextView(context);
        pill.setGravity(Gravity.CENTER);
        pill.setTextColor(Color.WHITE);
        pill.setTextSize(14);
        pill.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        pill.setSingleLine(true);
        pill.setEllipsize(TextUtils.TruncateAt.END);
        pill.setPadding(dp(18), 0, dp(18), 0);
        pill.setMinWidth(dp(96));
        pill.setMaxWidth(dp(280));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(0xb82a2a2e);
        bg.setCornerRadius(dp(28));
        bg.setStroke(dp(1), 0x55ffffff);
        pill.setBackground(bg);
        pill.setElevation(dp(4));
        LayoutParams lp = new LayoutParams(LayoutParams.WRAP_CONTENT, dp(44), Gravity.CENTER);
        addView(pill, lp);
        pill.setOnClickListener(new OnClickListener() { public void onClick(View v) { showDetails(); }});
        pill.setOnLongClickListener(new OnLongClickListener() { public boolean onLongClick(View v) { showSettings(); return true; }});
        updatePill();
    }

    private int dp(float n) { return Math.round(getResources().getDisplayMetrics().density * n); }
    private boolean enabled(String key, boolean def) { return prefs.getBoolean(key, def); }
    private Activity activity() {
        Context c = getContext();
        while (c instanceof ContextWrapper && !(c instanceof Activity)) {
            Context next = ((ContextWrapper)c).getBaseContext();
            if (next == c) return null;
            c = next;
        }
        return c instanceof Activity ? (Activity)c : null;
    }
    private void move() {
        if (!(getLayoutParams() instanceof FrameLayout.LayoutParams)) return;
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams)getLayoutParams();
        lp.gravity = Gravity.CENTER_HORIZONTAL | (prefs.getBoolean("bottom", false) ? Gravity.BOTTOM : Gravity.TOP);
        lp.topMargin = dp(64); lp.bottomMargin = dp(96);
        setLayoutParams(lp);
    }
    @Override protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        move();
        getViewTreeObserver().addOnPreDrawListener(this);
    }
    @Override protected void onDetachedFromWindow() {
        if (getViewTreeObserver().isAlive()) getViewTreeObserver().removeOnPreDrawListener(this);
        stop();
        super.onDetachedFromWindow();
    }
    @Override protected void onWindowVisibilityChanged(int visibility) {
        super.onWindowVisibilityChanged(visibility);
        if (visibility != VISIBLE) stop();
    }
    @Override public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        // Recheck permissions and sessions after returning from system settings.
        if (hasFocus && active) { stop(); start(); }
    }
    @Override public boolean onPreDraw() {
        // Home panel may stay attached while the user swipes to other panels.
        boolean visible = getWindowVisibility() == VISIBLE && isShown() && getGlobalVisibleRect(rect)
                && rect.width() >= getWidth() / 2 && rect.height() >= getHeight() / 2;
        if (visible && !active) start();
        else if (!visible && active) stop();
        return true;
    }
    private final BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override public void onReceive(Context c, Intent i) {
            if (!active) return;
            if (Intent.ACTION_BATTERY_CHANGED.equals(i.getAction())) {
                int level = i.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
                int scale = i.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
                battery = level >= 0 && scale > 0 ? Math.min(100, level * 100 / scale) : -1;
                updatePill();
            } else if (Intent.ACTION_TIME_TICK.equals(i.getAction())) {
                if (calendarItem != null && calendarItem.end < System.currentTimeMillis()) refreshData();
                else { updateCalendarDisplay(); updatePill(); }
            } else refreshData();
        }
    };
    private final SharedPreferences.OnSharedPreferenceChangeListener agendaChanged = new SharedPreferences.OnSharedPreferenceChangeListener() {
        public void onSharedPreferenceChanged(SharedPreferences p, String key) {
            if (active && "items_json".equals(key)) refreshData();
        }
    };
    private final ContentObserver calendarChanged = new ContentObserver(main) {
        @Override public void onChange(boolean selfChange) { if (active) refreshData(); }
    };
    private final MediaSessionManager.OnActiveSessionsChangedListener sessionsChanged = new MediaSessionManager.OnActiveSessionsChangedListener() { public void onActiveSessionsChanged(List<MediaController> sessions) { bindSessions(sessions); }};
    private final MediaController.Callback mediaChanged = new MediaController.Callback() {
        @Override public void onPlaybackStateChanged(PlaybackState state) { selectPlaying(); }
        @Override public void onMetadataChanged(MediaMetadata metadata) { selectPlaying(); }
        @Override public void onSessionDestroyed() { reconnectMedia(); }
    };
    private void start() {
        if (active) return;
        active = true;
        IntentFilter filter = new IntentFilter(Intent.ACTION_BATTERY_CHANGED);
        filter.addAction(Intent.ACTION_TIME_TICK); filter.addAction(Intent.ACTION_TIME_CHANGED);
        filter.addAction(Intent.ACTION_TIMEZONE_CHANGED); filter.addAction(Intent.ACTION_DATE_CHANGED);
        try { getContext().registerReceiver(receiver, filter); receiverRegistered = true; }
        catch (RuntimeException ignored) { }
        agenda.registerOnSharedPreferenceChangeListener(agendaChanged);
        if (calendarAllowed()) try {
            getContext().getContentResolver().registerContentObserver(CalendarContract.Events.CONTENT_URI, true, calendarChanged);
            observerRegistered = true;
        } catch (RuntimeException ignored) { }
        reconnectMedia();
        refreshData();
    }
    private void stop() {
        if (!active) return;
        active = false; generation++;
        if (receiverRegistered) { try { getContext().unregisterReceiver(receiver); } catch (IllegalArgumentException ignored) {} receiverRegistered = false; }
        agenda.unregisterOnSharedPreferenceChangeListener(agendaChanged);
        if (observerRegistered) { getContext().getContentResolver().unregisterContentObserver(calendarChanged); observerRegistered = false; }
        unbindMedia();
        if (dialog != null) { dialog.dismiss(); dialog = null; }
    }
    private boolean calendarAllowed() {
        return enabled("calendar", false) && getContext().checkSelfPermission(Manifest.permission.READ_CALENDAR) == PackageManager.PERMISSION_GRANTED;
    }
    private void unbindMedia() {
        if (mediaRegistered && media != null) { media.removeOnActiveSessionsChangedListener(sessionsChanged); mediaRegistered = false; }
        for (MediaController c : controllers) c.unregisterCallback(mediaChanged);
        controllers.clear(); playing = null; selected = null;
    }
    private void reconnectMedia() {
        unbindMedia();
        if (!active || !enabled("music", false) || media == null) { updatePill(); return; }
        try {
            media.addOnActiveSessionsChangedListener(sessionsChanged, listener, main);
            mediaRegistered = true;
            bindSessions(media.getActiveSessions(listener));
        } catch (SecurityException ignored) { updatePill(); }
    }
    private void bindSessions(List<MediaController> sessions) {
        if (!active) return;
        for (MediaController c : controllers) c.unregisterCallback(mediaChanged);
        controllers.clear();
        if (sessions != null) for (MediaController c : sessions) { controllers.add(c); c.registerCallback(mediaChanged, main); }
        selectPlaying();
    }
    private void selectPlaying() {
        playing = null; selected = null;
        for (MediaController c : controllers) {
            PlaybackState state = c.getPlaybackState();
            if (state == null) continue;
            if (selected == null && state.getState() == PlaybackState.STATE_PAUSED) selected = c;
            if (state.getState() == PlaybackState.STATE_PLAYING) { playing = c; selected = c; break; }
        }
        updatePill();
    }
    private String musicTitle() {
        if (selected == null) return "";
        MediaMetadata metadata = selected.getMetadata();
        CharSequence title = metadata == null ? null : metadata.getText(MediaMetadata.METADATA_KEY_TITLE);
        return title == null || title.length() == 0 ? "Music" : title.toString();
    }
    private void updatePill() {
        int choice = SLGlancePolicy.choose(battery, enabled("battery", true),
                playing != null && enabled("music", false), enabled("calendar", false) && !event.isEmpty(),
                enabled("agenda", true) && !task.isEmpty());
        String label = choice == 1 ? "Battery " + battery + "%" : choice == 2 ? "♫  " + musicTitle()
                : choice == 3 ? "◷  " + event : choice == 4 ? "✓  " + task : "✦  Glance";
        pill.setText(label);
        pill.setContentDescription("Smart Glance: " + pill.getText());
    }
    private void refreshData() {
        if (!active) return;
        final int request = ++generation;
        final boolean readCalendar = calendarAllowed();
        final boolean readAgenda = enabled("agenda", true);
        final String json = readAgenda ? agenda.getString("items_json", "[]") : "[]";
        WORK.execute(new Runnable() { public void run() {
            final String nextTask = findTask(json);
            final CalendarItem nextEvent = readCalendar ? findEvent() : null;
            main.post(new Runnable() { public void run() {
                if (!active || request != generation) return;
                task = nextTask; calendarItem = nextEvent; updateCalendarDisplay(); updatePill();
            }});
        }});
    }
    private static String findTask(String json) {
        String today = new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date());
        try {
            JSONArray items = new JSONArray(json);
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.optJSONObject(i);
                if (item != null && item.optInt("type", 2) == 2 && !item.optBoolean("completed", false)
                        && today.equals(item.optString("dateKey", ""))) {
                    String title = item.optString("title", "").trim();
                    if (!title.isEmpty()) return title;
                }
            }
        } catch (Exception ignored) { }
        return "";
    }
    private void updateCalendarDisplay() {
        long now = System.currentTimeMillis();
        CalendarItem item = calendarItem;
        event = item != null && SLGlancePolicy.eventVisible(item.begin, item.end, now)
                ? DateFormat.getTimeInstance(DateFormat.SHORT).format(new Date(item.begin)) + "  " + item.title : "";
    }
    private CalendarItem findEvent() {
        long now = System.currentTimeMillis();
        Uri.Builder b = CalendarContract.Instances.CONTENT_URI.buildUpon();
        ContentUris.appendId(b, now); ContentUris.appendId(b, now + 24 * 60 * 60 * 1000L);
        String[] cols = {CalendarContract.Instances.TITLE, CalendarContract.Instances.BEGIN,
                CalendarContract.Instances.END, CalendarContract.Instances.ALL_DAY};
        try (Cursor c = getContext().getContentResolver().query(b.build(), cols, null, null, CalendarContract.Instances.BEGIN + " ASC")) {
            if (c != null) while (c.moveToNext()) {
                if (c.getInt(3) != 0) continue;
                String title = c.getString(0);
                if (!TextUtils.isEmpty(title)) return new CalendarItem(title, c.getLong(1), c.getLong(2));
            }
        } catch (RuntimeException ignored) { }
        return null;
    }
    private void showDetails() {
        Activity a = activity(); if (a == null || a.isFinishing()) return;
        LinearLayout layout = new LinearLayout(a); layout.setOrientation(LinearLayout.VERTICAL);
        layout.setPadding(dp(24), dp(8), dp(24), dp(4));
        if (enabled("battery", true) && battery >= 0) addRow(layout, "Battery  ·  " + battery + "%", null);
        if (enabled("music", false)) {
            addRow(layout, selected == null ? "No active music session" : "♫  " + musicTitle(), null);
            final MediaController controller = selected;
            if (controller != null) {
                PlaybackState state = controller.getPlaybackState();
                long actions = state == null ? 0 : state.getActions();
                final boolean pause = playing != null;
                if ((actions & (pause ? PlaybackState.ACTION_PAUSE : PlaybackState.ACTION_PLAY)) != 0
                        || (actions & PlaybackState.ACTION_PLAY_PAUSE) != 0) {
                    addRow(layout, pause ? "Pause music" : "Play music", new Runnable() { public void run() {
                        try { if (pause) controller.getTransportControls().pause(); else controller.getTransportControls().play(); }
                        catch (RuntimeException ignored) { }
                    }});
                }
            }
        }
        if (enabled("calendar", false)) addRow(layout, calendarAllowed() ? (event.isEmpty() ? "No event in the next hour" : "Upcoming  ·  " + event) : "Calendar permission needed", calendarAllowed() ? null : new Runnable() { public void run() { requestCalendar(); }});
        if (enabled("agenda", true)) addRow(layout, task.isEmpty() ? "No open task for today" : "Today  ·  " + task, null);
        if (layout.getChildCount() == 0) addRow(layout, "Choose what to show in settings", null);
        dialog = new AlertDialog.Builder(a).setTitle("Smart Glance").setView(layout)
                .setPositiveButton("Done", null).setNeutralButton("Settings", new DialogInterface.OnClickListener() { public void onClick(DialogInterface d, int w) { showSettings(); }}).create();
        dialog.show();
    }
    private void addRow(LinearLayout parent, String text, Runnable action) {
        TextView row = new TextView(parent.getContext()); row.setText(text); row.setTextSize(16);
        row.setPadding(0, dp(12), 0, dp(12));
        if (action != null) { row.setOnClickListener(new OnClickListener() { public void onClick(View v) { if (dialog != null) dialog.dismiss(); action.run(); }}); row.setContentDescription(text); }
        parent.addView(row);
    }
    private void requestCalendar() {
        Activity a = activity(); if (a != null) a.requestPermissions(new String[]{Manifest.permission.READ_CALENDAR}, 8971);
    }
    private void showSettings() {
        final Activity a = activity(); if (a == null || a.isFinishing()) return;
        final String[] keys = {"battery", "music", "calendar", "agenda", "bottom"};
        String[] names = {"Battery status", "Music (notification access)", "Upcoming calendar (permission required)", "Today's agenda tasks", "Move capsule to bottom"};
        final boolean[] values = {enabled("battery", true), enabled("music", false), enabled("calendar", false), enabled("agenda", true), enabled("bottom", false)};
        dialog = new AlertDialog.Builder(a).setTitle("Glance settings").setMultiChoiceItems(names, values, new DialogInterface.OnMultiChoiceClickListener() { public void onClick(DialogInterface d, int which, boolean checked) { values[which] = checked; }})
                .setPositiveButton("Save", new DialogInterface.OnClickListener() { public void onClick(DialogInterface d, int w) {
                    boolean musicWas = enabled("music", false), calendarWas = enabled("calendar", false);
                    SharedPreferences.Editor e = prefs.edit(); for (int i = 0; i < keys.length; i++) e.putBoolean(keys[i], values[i]); e.apply();
                    move();
                    if (active) { stop(); start(); }
                    updatePill();
                    if (values[2] && !calendarWas && !calendarAllowed()) requestCalendar();
                    else if (values[1] && !musicWas && !mediaRegistered) {
                        try { a.startActivity(new Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS)); } catch (RuntimeException ignored) { }
                    }
                }}).setNegativeButton("Cancel", null)
                .setNeutralButton("Notification access", new DialogInterface.OnClickListener() { public void onClick(DialogInterface d, int w) {
                    try { a.startActivity(new Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS)); } catch (RuntimeException ignored) { }
                }}).create();
        dialog.show();
    }
}
