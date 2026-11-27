import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.ColorStateList;
import android.database.Cursor;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.net.Uri;
import android.os.CancellationSignal;
import android.os.Handler;
import android.os.Looper;
import android.provider.ContactsContract;
import android.provider.Settings;
import android.telephony.PhoneNumberUtils;
import android.telephony.TelephonyManager;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/** Search phone contacts locally; only a tapped number is sent to the installed WhatsApp app. */
public final class SLWaContactSearch extends HorizontalScrollView {
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private final EditText editor;
    private final LinearLayout chips;
    private int generation;
    private Runnable pending;
    private CancellationSignal signal;
    private Future<?> query;

    public static void attach(EditText editor, LinearLayout resultsContainer) {
        if (editor == null || resultsContainer == null || resultsContainer.findViewWithTag("sl_wa_contact_search") != null) return;
        SLWaContactSearch view = new SLWaContactSearch(editor.getContext(), editor);
        view.setTag("sl_wa_contact_search");
        resultsContainer.addView(view, 1, new LinearLayout.LayoutParams(-1, -2));
    }
    private SLWaContactSearch(Context c, EditText editor) {
        super(c);
        this.editor = editor;
        setHorizontalScrollBarEnabled(false);
        setFillViewport(false);
        setVisibility(GONE);
        chips = new LinearLayout(c);
        chips.setOrientation(LinearLayout.HORIZONTAL);
        chips.setPadding(dp(16), dp(4), dp(16), dp(6));
        addView(chips, new LayoutParams(-2, -2));
    }
    private int dp(float x) { return Math.round(x * getResources().getDisplayMetrics().density); }
    private final TextWatcher watcher = new TextWatcher() {
        public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
        public void onTextChanged(CharSequence s, int start, int before, int count) { }
        public void afterTextChanged(Editable s) { schedule(); }
    };
    @Override protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        editor.addTextChangedListener(watcher);
        schedule();
    }
    @Override protected void onDetachedFromWindow() {
        editor.removeTextChangedListener(watcher);
        cancel();
        chips.removeAllViews();
        super.onDetachedFromWindow();
    }
    @Override public void onWindowFocusChanged(boolean focused) {
        super.onWindowFocusChanged(focused);
        if (focused && isAttachedToWindow()) schedule();
    }
    private void cancel() {
        generation++;
        if (pending != null) { main.removeCallbacks(pending); pending = null; }
        if (signal != null) { signal.cancel(); signal = null; }
        if (query != null) { query.cancel(true); query = null; }
    }
    private void schedule() {
        cancel();
        chips.removeAllViews();
        setVisibility(GONE);
        final String text = editor.getText() == null ? "" : editor.getText().toString().trim();
        if (text.length() < 2 || !isAttachedToWindow()) return;
        if (getContext().checkSelfPermission(Manifest.permission.READ_CONTACTS) != PackageManager.PERMISSION_GRANTED) {
            addChip("Allow contacts for WhatsApp", new OnClickListener() { public void onClick(View v) { askContacts(); }});
            setVisibility(VISIBLE);
            return;
        }
        final int request = generation;
        pending = new Runnable() { public void run() {
            pending = null;
            final CancellationSignal token = new CancellationSignal();
            signal = token;
            query = WORKER.submit(new Runnable() { public void run() {
                final List<Contact> found = findContacts(text, token);
                main.post(new Runnable() { public void run() {
                    if (request != generation || !isAttachedToWindow() || token.isCanceled()) return;
                    show(found);
                }});
            }});
        }};
        main.postDelayed(pending, 250);
    }
    private static final class Contact {
        final String name, phone;
        Contact(String name, String phone) { this.name = name; this.phone = phone; }
    }
    private List<Contact> findContacts(String input, CancellationSignal cancel) {
        List<Contact> found = new ArrayList<>();
        HashSet<String> seen = new HashSet<>();
        Context app = getContext().getApplicationContext();
        Uri uri = Uri.withAppendedPath(ContactsContract.CommonDataKinds.Phone.CONTENT_FILTER_URI, Uri.encode(input));
        String[] columns = { ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME_PRIMARY,
                ContactsContract.CommonDataKinds.Phone.NUMBER, ContactsContract.CommonDataKinds.Phone.NORMALIZED_NUMBER };
        String country = country(app);
        try (Cursor c = app.getContentResolver().query(uri, columns, null, null,
                ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME_PRIMARY + " COLLATE LOCALIZED ASC", cancel)) {
            // shortcut: at most five distinct numbers, add paging if more matches are needed.
            while (c != null && !cancel.isCanceled() && c.moveToNext() && found.size() < 5) {
                String name = c.getString(0), raw = c.getString(1);
                if (!SLWaPhone.plainNumber(raw)) continue;
                String number = SLWaPhone.digits(c.getString(2));
                if (number == null) number = SLWaPhone.digits(raw);
                if (number == null && !TextUtils.isEmpty(country))
                    number = SLWaPhone.digits(PhoneNumberUtils.formatNumberToE164(raw, country));
                if (!TextUtils.isEmpty(name) && number != null && seen.add(number)) found.add(new Contact(name, number));
            }
        } catch (RuntimeException ignored) { /* permission may be revoked or query cancelled */ }
        return found;
    }
    private static String country(Context c) {
        try {
            TelephonyManager t = (TelephonyManager)c.getSystemService(Context.TELEPHONY_SERVICE);
            if (t != null && !TextUtils.isEmpty(t.getSimCountryIso())) return t.getSimCountryIso().toUpperCase(Locale.US);
            if (t != null && !TextUtils.isEmpty(t.getNetworkCountryIso())) return t.getNetworkCountryIso().toUpperCase(Locale.US);
        } catch (RuntimeException ignored) { }
        return Locale.getDefault().getCountry().toUpperCase(Locale.US);
    }
    private void show(List<Contact> contacts) {
        chips.removeAllViews();
        if (!contacts.isEmpty()) {
            SLAgendaTheme theme = SLAgendaTheme.resolve(getContext(), null);
            Drawable icon = whatsappIcon();
            for (final Contact c : contacts) {
                addContactChip(c, theme, icon, new OnClickListener() {
                    public void onClick(View v) { openWhatsApp(c.phone); }
                });
            }
        }
        setVisibility(contacts.isEmpty() ? GONE : VISIBLE);
    }
    private Drawable whatsappIcon() {
        PackageManager pm = getContext().getPackageManager();
        for (String pkg : new String[]{"com.whatsapp", "com.whatsapp.w4b"}) {
            try { return pm.getApplicationIcon(pkg); }
            catch (PackageManager.NameNotFoundException | SecurityException ignored) { }
        }
        return null;
    }
    private void addContactChip(Contact c, SLAgendaTheme theme, Drawable icon, OnClickListener action) {
        Context context = getContext();
        LinearLayout chip = new LinearLayout(context);
        chip.setOrientation(LinearLayout.HORIZONTAL);
        chip.setGravity(Gravity.CENTER_VERTICAL);
        chip.setPaddingRelative(dp(12), dp(8), dp(14), dp(8));
        chip.setMinimumHeight(dp(56));
        GradientDrawable surface = new GradientDrawable();
        surface.setColor(theme.isLight ? 0xeeffffff : 0xe61b2028);
        surface.setCornerRadius(dp(16));
        surface.setStroke(dp(1), theme.isLight ? 0x381fa855 : 0x4d25d366);
        chip.setBackground(new RippleDrawable(ColorStateList.valueOf(theme.isLight ? 0x241fa855 : 0x3325d366), surface, null));

        View badge;
        if (icon != null) {
            ImageView image = new ImageView(context);
            image.setImageDrawable(icon.getConstantState() != null ? icon.getConstantState().newDrawable().mutate() : icon);
            image.setScaleType(ImageView.ScaleType.FIT_CENTER);
            badge = image;
        } else {
            TextView fallback = new TextView(context);
            fallback.setText("WA");
            fallback.setTextSize(11);
            fallback.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
            fallback.setTextColor(Color.WHITE);
            fallback.setGravity(Gravity.CENTER);
            GradientDrawable circle = new GradientDrawable();
            circle.setColor(0xff128c4a);
            circle.setCornerRadius(dp(18));
            fallback.setBackground(circle);
            badge = fallback;
        }
        badge.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(dp(36), dp(36));
        iconParams.setMarginEnd(dp(10));
        chip.addView(badge, iconParams);

        LinearLayout text = new LinearLayout(context);
        text.setOrientation(LinearLayout.VERTICAL);
        TextView name = new TextView(context);
        name.setText(c.name);
        name.setTextColor(theme.textPrimary);
        name.setTextSize(15);
        name.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        name.setSingleLine(true);
        name.setEllipsize(TextUtils.TruncateAt.END);
        name.setMaxWidth(dp(176));
        text.addView(name);
        TextView number = new TextView(context);
        number.setText("+" + c.phone);
        number.setTextColor(theme.textSecondary);
        number.setTextSize(12);
        number.setSingleLine(true);
        number.setTextDirection(View.TEXT_DIRECTION_LTR);
        number.setEllipsize(TextUtils.TruncateAt.END);
        number.setMaxWidth(dp(176));
        text.addView(number);
        text.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        chip.addView(text);
        chip.setContentDescription("WhatsApp, " + c.name + ", +" + c.phone);
        chip.setOnClickListener(action);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-2, -2);
        params.setMarginEnd(dp(8));
        chips.addView(chip, params);
    }
    private void addChip(String label, OnClickListener action) {
        TextView chip = new TextView(getContext());
        chip.setText(label); chip.setTextColor(Color.WHITE); chip.setTextSize(14);
        chip.setGravity(Gravity.CENTER_VERTICAL); chip.setMaxLines(2); chip.setEllipsize(TextUtils.TruncateAt.END);
        chip.setMaxWidth(dp(240)); chip.setMinHeight(dp(48)); chip.setPadding(dp(14), dp(5), dp(14), dp(5));
        GradientDrawable bg = new GradientDrawable(); bg.setColor(0xe025282b); bg.setCornerRadius(dp(20));
        chip.setBackground(bg); chip.setOnClickListener(action);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-2, -2); lp.setMarginEnd(dp(8)); chips.addView(chip, lp);
    }
    private Activity activity() {
        Context c = getContext();
        while (c instanceof ContextWrapper && !(c instanceof Activity)) {
            Context next = ((ContextWrapper)c).getBaseContext(); if (next == c) return null; c = next;
        }
        return c instanceof Activity ? (Activity)c : null;
    }
    private void askContacts() {
        final Activity a = activity(); if (a == null || a.isFinishing()) return;
        new AlertDialog.Builder(a).setTitle("Find WhatsApp contacts")
            .setMessage("Search matching phone contacts on this device. WhatsApp opens only when you tap a result. Chat messages are not read.")
            .setPositiveButton("Allow", new android.content.DialogInterface.OnClickListener() {
                public void onClick(android.content.DialogInterface d, int which) { a.requestPermissions(new String[]{Manifest.permission.READ_CONTACTS}, 0x7a31); }
            }).setNeutralButton("App settings", new android.content.DialogInterface.OnClickListener() {
                public void onClick(android.content.DialogInterface d, int which) {
                    try { a.startActivity(new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.parse("package:" + a.getPackageName()))); }
                    catch (ActivityNotFoundException ignored) { }
                }
            }).setNegativeButton("Cancel", null).show();
    }
    private void openWhatsApp(String digits) {
        Context c = getContext();
        Uri target = Uri.parse("whatsapp://send?phone=" + digits);
        for (String pkg : new String[]{"com.whatsapp", "com.whatsapp.w4b"}) {
            Intent i = new Intent(Intent.ACTION_VIEW, target).setPackage(pkg);
            if (!(c instanceof Activity)) i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            try { if (i.resolveActivity(c.getPackageManager()) != null) { c.startActivity(i); return; } }
            catch (ActivityNotFoundException | SecurityException ignored) { }
        }
        Toast.makeText(c, "WhatsApp is not available on this device", Toast.LENGTH_LONG).show();
    }
}
