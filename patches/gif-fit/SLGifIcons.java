import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Movie;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.util.Base64;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.SeekBar;
import android.widget.ScrollView;
import android.widget.TextView;
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
    private static String sizeKey(int id) { return "gif_size_v1_" + id; }
    private static String shapeKey(int id) { return "gif_shape_v1_" + id; }
    private static String modeKey(int id) { return "gif_mode_v1_" + id; }
    private static boolean remove(Context c, int id) {
        return prefs(c).edit().remove(key(id)).remove(sizeKey(id)).remove(shapeKey(id)).remove(modeKey(id)).commit();
    }
    private static int getInt(SharedPreferences p, String key, int def) {
        try { return p.getInt(key, def); } catch (ClassCastException e) { return def; }
    }
    private static final class Style {
        int size, mode, shape;
        Style(SharedPreferences p, int id) {
            size = SLGifGeometry.size(getInt(p, sizeKey(id), SLGifGeometry.DEFAULT_SIZE));
            mode = SLGifGeometry.mode(getInt(p, modeKey(id), SLGifGeometry.DEFAULT_MODE));
            shape = SLGifGeometry.shape(getInt(p, shapeKey(id), SLGifGeometry.DEFAULT_SHAPE));
        }
    }

    public static void prompt(final Activity a, final int id) {
        if (a.getIntent().getBooleanExtra("sl_gif_prompted", false)) return;
        a.getIntent().putExtra("sl_gif_prompted", true);
        a.getWindow().getDecorView().post(new Runnable() { public void run() {
            if (a.isFinishing()) return;
            final boolean hasGif = prefs(a).contains(key(id));
            String[] items = hasGif ? new String[]{"Choose animated GIF", "Adjust GIF size, fit and shape", "Remove GIF and choose regular icon", "Remove animated GIF"}
                                    : new String[]{"Choose animated GIF", "Choose regular icon"};
            new AlertDialog.Builder(a).setTitle("Edit icon")
                .setItems(items, new DialogInterface.OnClickListener() { public void onClick(DialogInterface dialog, int which) {
                    if (which == 0) {
                        try {
                            Intent i = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("image/gif");
                            a.startActivityForResult(i, REQUEST);
                        } catch (RuntimeException e) { Toast.makeText(a, "No file picker available", Toast.LENGTH_LONG).show(); }
                    } else if (hasGif && which == 1) {
                        adjust(a, id);
                    } else if (hasGif && which == 2) {
                        if (!remove(a, id)) { Toast.makeText(a, "Could not remove animated icon", Toast.LENGTH_LONG).show(); a.finish(); }
                    } else if (hasGif && which == 3) {
                        if (remove(a, id)) { Toast.makeText(a, "Animated icon removed", Toast.LENGTH_SHORT).show(); a.finish(); }
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
            a.runOnUiThread(new Runnable() { public void run() { if (!a.isFinishing()) { if (message == null) { Toast.makeText(a, "Animated icon saved", Toast.LENGTH_SHORT).show(); adjust(a, id); } else Toast.makeText(a, message, Toast.LENGTH_LONG).show(); } } });
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
            image.setImageDrawable(new GifDrawable(owner, movie, new Style(prefs(owner.getContext()), id), false));
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
    private static int dp(Context c, float n) { return (int)(n * c.getResources().getDisplayMetrics().density + .5f); }
    private static TextView label(Activity a, String text) {
        TextView v = new TextView(a); v.setText(text); v.setTextSize(15); return v;
    }
    private static RadioGroup group(Activity a, String[] titles, int selected, boolean horizontal) {
        RadioGroup g = new RadioGroup(a); g.setOrientation(horizontal ? RadioGroup.HORIZONTAL : RadioGroup.VERTICAL);
        for (int i = 0; i < titles.length; i++) {
            RadioButton b = new RadioButton(a); b.setText(titles[i]); b.setId(View.generateViewId());
            g.addView(b, horizontal ? new RadioGroup.LayoutParams(0, -2, 1) : new RadioGroup.LayoutParams(-1, -2));
        }
        g.check(g.getChildAt(selected).getId()); return g;
    }
    private static void adjust(final Activity a, final int id) {
        try {
            String encoded = prefs(a).getString(key(id), null);
            if (encoded == null || encoded.length() > (MAX_BYTES * 4 / 3 + 8)) throw new IllegalArgumentException();
            byte[] bytes = Base64.decode(encoded, Base64.NO_WRAP);
            if (!valid(bytes)) throw new IllegalArgumentException();
            Movie movie = Movie.decodeByteArray(bytes, 0, bytes.length);
            if (movie == null || movie.duration() <= 0 || movie.width() <= 0 || movie.height() <= 0) throw new IllegalArgumentException();
            final Style style = new Style(prefs(a), id);
            LinearLayout content = new LinearLayout(a); content.setOrientation(LinearLayout.VERTICAL);
            int pad = dp(a, 20); content.setPadding(pad, dp(a, 6), pad, 0);
            final ImageView preview = new ImageView(a); preview.setScaleType(ImageView.ScaleType.FIT_CENTER);
            preview.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
            LinearLayout.LayoutParams imageParams = new LinearLayout.LayoutParams(dp(a, 96), dp(a, 96)); imageParams.gravity = android.view.Gravity.CENTER_HORIZONTAL;
            content.addView(preview, imageParams);
            final GifDrawable drawable = new GifDrawable(preview, movie, style, true); preview.setImageDrawable(drawable);
            final TextView sizeLabel = label(a, "Size: " + style.size + "%"); content.addView(sizeLabel);
            final SeekBar slider = new SeekBar(a); slider.setContentDescription("GIF icon size, 50 to 100 percent"); slider.setMax(50); slider.setProgress(style.size - 50); content.addView(slider);
            slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
                public void onProgressChanged(SeekBar b, int progress, boolean user) { style.size = SLGifGeometry.size(progress + 50); sizeLabel.setText("Size: " + style.size + "%"); drawable.invalidateSelf(); }
                public void onStartTrackingTouch(SeekBar b) { } public void onStopTrackingTouch(SeekBar b) { }
            });
            content.addView(label(a, "Image fit"));
            final RadioGroup fit = group(a, new String[]{"Fit", "Crop"}, style.mode, true); content.addView(fit);
            fit.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() { public void onCheckedChanged(RadioGroup g, int checked) { style.mode = SLGifGeometry.mode(g.indexOfChild(g.findViewById(checked))); drawable.invalidateSelf(); } });
            content.addView(label(a, "Shape"));
            final RadioGroup shape = group(a, new String[]{"Rounded", "Circle", "Square"}, style.shape, false); content.addView(shape);
            shape.setOnCheckedChangeListener(new RadioGroup.OnCheckedChangeListener() { public void onCheckedChanged(RadioGroup g, int checked) { style.shape = SLGifGeometry.shape(g.indexOfChild(g.findViewById(checked))); drawable.invalidateSelf(); } });
            ScrollView scroll = new ScrollView(a); scroll.setFillViewport(false); scroll.addView(content);
            final AlertDialog dialog = new AlertDialog.Builder(a).setTitle("Adjust GIF icon").setView(scroll)
                .setPositiveButton("Save", null).setNegativeButton("Cancel", new DialogInterface.OnClickListener() { public void onClick(DialogInterface d, int w) { a.finish(); } })
                .setNeutralButton("Reset", null).setOnCancelListener(new DialogInterface.OnCancelListener() { public void onCancel(DialogInterface d) { a.finish(); } }).create();
            dialog.setOnShowListener(new DialogInterface.OnShowListener() { public void onShow(DialogInterface d) {
                dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() { public void onClick(View v) {
                    boolean saved = prefs(a).edit().putInt(sizeKey(id), SLGifGeometry.size(style.size)).putInt(modeKey(id), SLGifGeometry.mode(style.mode)).putInt(shapeKey(id), SLGifGeometry.shape(style.shape)).commit();
                    if (saved) { dialog.dismiss(); a.finish(); } else Toast.makeText(a, "Could not save GIF options", Toast.LENGTH_LONG).show();
                }});
                dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(new View.OnClickListener() { public void onClick(View v) {
                    slider.setProgress(SLGifGeometry.DEFAULT_SIZE - 50); fit.check(fit.getChildAt(SLGifGeometry.DEFAULT_MODE).getId()); shape.check(shape.getChildAt(SLGifGeometry.DEFAULT_SHAPE).getId());
                }});
            }});
            dialog.show();
        } catch (RuntimeException e) { Toast.makeText(a, "Could not open GIF options", Toast.LENGTH_LONG).show(); a.finish(); }
    }
    private static final class GifDrawable extends Drawable implements Runnable {
        private final View owner; private final Movie movie; private final Style style; private final boolean preview; private final Rect visible = new Rect();
        private final RectF clip = new RectF(); private final Path path = new Path();
        private final long start = SystemClock.uptimeMillis();
        GifDrawable(View owner, Movie movie, Style style, boolean preview) { this.owner = owner; this.movie = movie; this.style = style; this.preview = preview; }
        // A square intrinsic box gives non-square GIFs the same icon slot as normal icons.
        public int getIntrinsicWidth() { return 256; }
        public int getIntrinsicHeight() { return 256; }
        public void draw(Canvas c) {
            Rect b = getBounds(); if (b.isEmpty() || movie.width() <= 0 || movie.height() <= 0) return;
            float side = Math.min(b.width(), b.height()) * (SLGifGeometry.size(style.size) / 100f);
            float left = b.left + (b.width() - side) / 2f, top = b.top + (b.height() - side) / 2f;
            float scale = SLGifGeometry.scale(movie.width(), movie.height(), side, style.mode);
            movie.setTime((int)((SystemClock.uptimeMillis() - start) % movie.duration()));
            int save = c.save();
            clip.set(left, top, left + side, top + side); path.reset();
            float radius = SLGifGeometry.radius(side, style.shape); path.addRoundRect(clip, radius, radius, Path.Direction.CW); c.clipPath(path);
            c.translate(left + (side - movie.width() * scale) / 2f, top + (side - movie.height() * scale) / 2f);
            c.scale(scale, scale); movie.draw(c, 0, 0); c.restoreToCount(save);
            unscheduleSelf(this);
            if (owner.isAttachedToWindow() && owner.isShown() && owner.hasWindowFocus() && owner.getGlobalVisibleRect(visible) && (preview || !yb6.a(20))) scheduleSelf(this, SystemClock.uptimeMillis() + 50);
        }
        public void run() { invalidateSelf(); }
        public void setAlpha(int a) { }
        public void setColorFilter(ColorFilter f) { }
        public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
