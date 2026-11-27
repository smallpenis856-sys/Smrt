import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.text.TextPaint;
import android.view.View;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONObject;

public final class SLClockTask implements SharedPreferences.OnSharedPreferenceChangeListener {
    private final View view;
    private final SharedPreferences prefs;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final TextPaint titlePaint = new TextPaint(3), datePaint = new TextPaint(3);
    private boolean stopped;
    private int generation;
    private String day = "", title = "No upcoming tasks", details = "";

    public SLClockTask(View view) {
        this.view = view;
        prefs = view.getContext().getSharedPreferences("sl_agenda_panel_v1", 0);
        prefs.registerOnSharedPreferenceChangeListener(this);
        refresh();
    }
    public void stop() {
        stopped = true;
        generation++;
        prefs.unregisterOnSharedPreferenceChangeListener(this);
        worker.shutdownNow();
        main.removeCallbacksAndMessages(null);
    }
    public void tick() {
        String now = key(Calendar.getInstance());
        if (!now.equals(day)) refresh();
    }
    @Override public void onSharedPreferenceChanged(SharedPreferences p, String key) {
        if (key == null || key.equals("items_json")) refresh();
    }
    private static String key(Calendar c) {
        return String.format(Locale.US, "%04d-%02d-%02d", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1, c.get(Calendar.DAY_OF_MONTH));
    }
    private void refresh() {
        if (stopped) return;
        final String today = key(Calendar.getInstance());
        day = today;
        final int request = ++generation;
        worker.execute(new Runnable() { public void run() {
            SLTaskChoice.Item selected = null;
            try {
                JSONArray data = new JSONArray(prefs.getString("items_json", "[]"));
                ArrayList<SLTaskChoice.Item> items = new ArrayList<SLTaskChoice.Item>();
                for (int i = 0; i < data.length(); i++) {
                    JSONObject o = data.optJSONObject(i);
                    if (o != null) items.add(new SLTaskChoice.Item(o.optString("title", ""), o.optString("dateKey", ""), o.optString("timeText", ""), o.optInt("type", 2), o.optBoolean("completed", false)));
                }
                selected = SLTaskChoice.select(items, today);
            } catch (Exception ignored) { }
            final SLTaskChoice.Item item = selected;
            main.post(new Runnable() { public void run() {
                if (stopped || request != generation) return;
                title = item == null ? "No upcoming tasks" : item.title.trim();
                if (item == null) details = "";
                else {
                    String date = item.date;
                    try { SimpleDateFormat parse = new SimpleDateFormat("yyyy-MM-dd", Locale.US); parse.setLenient(false); date = java.text.DateFormat.getDateInstance(java.text.DateFormat.MEDIUM).format(parse.parse(item.date)); }
                    catch (Exception ignored) { }
                    details = date + (item.time == null || item.time.isEmpty() ? "" : " • " + item.time);
                }
                view.invalidate();
            }});
        }});
    }
    public void draw(Canvas canvas, int width, int height, float left, Paint titleBase, Paint dateBase) {
        float density = view.getResources().getDisplayMetrics().density;
        float x = Math.max(left, width * .055f);
        float size = Math.max(13.5f * density, Math.min(19f * density, width * .05f));
        titlePaint.set(titleBase); datePaint.set(dateBase);
        titlePaint.setTextSize(size); datePaint.setTextSize(size * .86f);
        float bottom = height - 8f * density;
        float titleY = details.isEmpty() ? bottom : bottom - size * .86f * 1.24f;
        float available = Math.max(0, width - x - 8f * density);
        CharSequence safeTitle = TextUtils.ellipsize(title.replace('\n', ' ').replace('\r', ' '), titlePaint, available, TextUtils.TruncateAt.END);
        CharSequence safeDetails = TextUtils.ellipsize(details, datePaint, available, TextUtils.TruncateAt.END);
        canvas.drawText(safeTitle.toString(), x, titleY, titlePaint);
        if (safeDetails.length() > 0) canvas.drawText(safeDetails.toString(), x, bottom, datePaint);
    }
}
