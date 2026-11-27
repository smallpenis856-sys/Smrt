import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Movie;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.util.Base64;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.Toast;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.Map;

/** GIF data uses the mod store already included in SLModBackup. Keys are launchable IDs, not packages. */
public final class SLGifIcons {
    private static final String STORE = "sl_mod_settings", PREFIX = "gif_icon_v1_";
    private static final int MAX_BYTES = 1024 * 1024, MAX_TOTAL = 16 * 1024 * 1024;
    private static final int REQUEST = 0x7461;
    private static SharedPreferences prefs(Context c) { return c.getSharedPreferences(STORE, 0); }
    private static String key(int id) { return PREFIX + id; }

    public static void prompt(final Activity a, final int id) {
        if (a.getIntent().getBooleanExtra("sl_gif_prompted", false)) return;
        a.getIntent().putExtra("sl_gif_prompted", true);
        a.getWindow().getDecorView().post(new Runnable() { public void run() {
            if (a.isFinishing()) return;
            new AlertDialog.Builder(a).setTitle("Edit icon")
                .setItems(new String[]{"Choose animated GIF", prefs(a).contains(key(id)) ? "Remove GIF and choose regular icon" : "Choose regular icon", "Remove animated GIF"}, new DialogInterface.OnClickListener() { public void onClick(DialogInterface dialog, int which) {
                    if (which == 0) {
                        try {
                            Intent i = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("image/gif");
                            a.startActivityForResult(i, REQUEST);
                        } catch (RuntimeException e) { Toast.makeText(a, "No file picker available", Toast.LENGTH_LONG).show(); }
                    } else if (which == 1 && prefs(a).contains(key(id))) {
                        if (!prefs(a).edit().remove(key(id)).commit()) { Toast.makeText(a, "Could not remove animated icon", Toast.LENGTH_LONG).show(); a.finish(); }
                    } else if (which == 2) {
                        if (prefs(a).edit().remove(key(id)).commit()) { Toast.makeText(a, "Animated icon removed", Toast.LENGTH_SHORT).show(); a.finish(); }
                        else Toast.makeText(a, "Could not remove animated icon", Toast.LENGTH_LONG).show();
                    }
                }}).setNegativeButton("Cancel", new DialogInterface.OnClickListener() { public void onClick(DialogInterface d, int w) { a.finish(); } }).setOnCancelListener(new DialogInterface.OnCancelListener() { public void onCancel(DialogInterface d) { a.finish(); } }).show();
        }});
    }
    // Returns false for other launcher's activity results.
    public static boolean result(final Activity a, final int id, int request, int result, Intent data) {
        if (request != REQUEST) return false;
        if (result != Activity.RESULT_OK || data == null || data.getData() == null) return true;
        final android.net.Uri uri = data.getData();
        new Thread(new Runnable() { public void run() {
            String error = null;
            try {
                ByteArrayOutputStream b = new ByteArrayOutputStream();
                try (InputStream in = a.getContentResolver().openInputStream(uri)) {
                    if (in == null) throw new IllegalArgumentException();
                    byte[] buf = new byte[8192]; int n;
                    while ((n = in.read(buf)) != -1) { if (b.size() + n > MAX_BYTES) throw new IllegalArgumentException(); b.write(buf, 0, n); }
                }
                byte[] bytes = b.toByteArray();
                if (!valid(bytes)) throw new IllegalArgumentException();
                Movie movie = Movie.decodeByteArray(bytes, 0, bytes.length);
                if (movie == null || movie.width() <= 0 || movie.height() <= 0 || movie.duration() <= 0) throw new IllegalArgumentException();
                String encoded = Base64.encodeToString(bytes, Base64.NO_WRAP);
                SharedPreferences p = prefs(a); long total = encoded.length();
                for (Map.Entry<String, ?> e : p.getAll().entrySet())
                    if (e.getKey().startsWith(PREFIX) && !e.getKey().equals(key(id)) && e.getValue() instanceof String) total += ((String)e.getValue()).length();
                if (total > MAX_TOTAL) throw new IllegalArgumentException();
                if (!p.edit().putString(key(id), encoded).commit()) throw new IllegalStateException();
            } catch (Exception e) { error = "Could not use GIF. Choose a valid animated GIF up to 1 MB and 512 × 512 pixels."; }
            final String message = error;
            a.runOnUiThread(new Runnable() { public void run() { if (!a.isFinishing()) { if (message == null) { Toast.makeText(a, "Animated icon saved", Toast.LENGTH_SHORT).show(); a.finish(); } else Toast.makeText(a, message, Toast.LENGTH_LONG).show(); } } });
        } }, "GIF icon import").start();
        return true;
    }
    static boolean valid(byte[] b) {
        if (b.length < 13 || b.length > MAX_BYTES || b[0] != 'G' || b[1] != 'I' || b[2] != 'F' || b[3] != '8' || (b[4] != '7' && b[4] != '9') || b[5] != 'a') return false;
        int w = (b[6]&255) | ((b[7]&255)<<8), h = (b[8]&255) | ((b[9]&255)<<8);
        return w > 0 && h > 0 && w <= 512 && h <= 512;
    }
    public static boolean bind(View owner, int id, ImageView image) {
        try {
            String s = prefs(owner.getContext()).getString(key(id), null);
            if (image.getDrawable() instanceof GifDrawable) image.setLayerType(View.LAYER_TYPE_NONE, null);
            if (s == null || s.length() > (MAX_BYTES * 4 / 3 + 8)) return false;
            byte[] bytes = Base64.decode(s, Base64.NO_WRAP);
            if (!valid(bytes)) return false;
            Movie movie = Movie.decodeByteArray(bytes, 0, bytes.length);
            if (movie == null || movie.duration() <= 0) return false;
            image.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
            image.setImageDrawable(new GifDrawable(owner, movie));
            return true;
        } catch (RuntimeException e) { return false; }
    }
    public static void refresh(final Activity a) {
        a.getWindow().getDecorView().post(new Runnable() { public void run() { refreshView(a.getWindow().getDecorView()); } });
    }
    private static void refreshView(View v) {
        // Only LaunchableView, never the drawer's independent DrawerItemView.
        try {
            Class<?> c = Class.forName("ginlemon.flower.launchable.view.LaunchableView");
            if (c.isInstance(v)) {
                Object tag = v.getTag();
                View first = ((ViewGroup)v).getChildAt(0);
                boolean currentGif = first instanceof ImageView && ((ImageView)first).getDrawable() instanceof GifDrawable;
                if ((tag instanceof Integer && prefs(v.getContext()).contains(key((Integer)tag))) || currentGif) { Method m = c.getMethod("n"); m.invoke(v); }
                return;
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) { }
        if (v instanceof ViewGroup) { ViewGroup g = (ViewGroup)v; for (int i = 0; i < g.getChildCount(); i++) refreshView(g.getChildAt(i)); }
    }
    private static final class GifDrawable extends Drawable implements Runnable {
        private final View owner; private final Movie movie; private final Rect visible = new Rect();
        private final long start = SystemClock.uptimeMillis();
        GifDrawable(View owner, Movie movie) { this.owner = owner; this.movie = movie; }
        public int getIntrinsicWidth() { return movie.width(); }
        public int getIntrinsicHeight() { return movie.height(); }
        public void draw(Canvas c) {
            Rect b = getBounds(); if (b.isEmpty()) return;
            movie.setTime((int)((SystemClock.uptimeMillis() - start) % movie.duration()));
            int save = c.save(); c.translate(b.left, b.top); c.scale((float)b.width()/movie.width(), (float)b.height()/movie.height()); movie.draw(c, 0, 0); c.restoreToCount(save);
            unscheduleSelf(this);
            // The drawer is panel 20; don't keep decoding frames behind it.
            if (owner.isAttachedToWindow() && owner.isShown() && owner.hasWindowFocus() && owner.getGlobalVisibleRect(visible) && !yb6.a(20)) scheduleSelf(this, SystemClock.uptimeMillis() + 50);
        }
        public void run() { invalidateSelf(); }
        public void setAlpha(int a) { }
        public void setColorFilter(ColorFilter f) { }
        public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
