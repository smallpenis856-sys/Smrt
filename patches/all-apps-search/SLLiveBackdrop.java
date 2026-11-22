package ginlemon.flower.glass;

import android.content.Context;
import android.graphics.*;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewTreeObserver;
import java.util.Arrays;

/** Samples only the drawer's sibling content, never the glass or its foreground. */
public final class SLLiveBackdrop extends View implements ViewTreeObserver.OnPreDrawListener {
    private static final int SCALE = 4;
    private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final Paint rim = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final Path clip = new Path();
    private final RectF bounds = new RectF();
    private final Rect sample = new Rect();
    private final int[] here = new int[2], there = new int[2];
    private View source;
    private Bitmap capture, blurred;
    private Canvas captureCanvas;
    private int[] pixels, previous, scratch;
    private int padding, radius;
    private boolean ready, failed;

    public SLLiveBackdrop(Context context, AttributeSet attrs) {
        super(context, attrs);
        setClickable(false);
        setFocusable(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        float density = getResources().getDisplayMetrics().density;
        padding = (int) Math.ceil(20 * density / SCALE) * SCALE;
        radius = Math.max(1, Math.round(6 * density / SCALE));
        paint.setAlpha(210);
        rim.setStyle(Paint.Style.STROKE);
        rim.setStrokeWidth(density);
        rim.setShader(new LinearGradient(0, 0, 0, 56 * density,
                0x80ffffff, 0x18ffffff, Shader.TileMode.CLAMP));
    }

    @Override protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        failed = false;
        getViewTreeObserver().addOnPreDrawListener(this);
    }

    @Override protected void onDetachedFromWindow() {
        getViewTreeObserver().removeOnPreDrawListener(this);
        source = null;
        release();
        super.onDetachedFromWindow();
    }

    private void release() {
        if (capture != null) capture.recycle();
        if (blurred != null) blurred.recycle();
        capture = blurred = null;
        captureCanvas = null;
        pixels = previous = scratch = null;
        ready = false;
    }

    @Override protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        release();
        bounds.set(0, 0, w, h);
        clip.reset();
        clip.addRoundRect(bounds, h / 2f, h / 2f, Path.Direction.CW);
    }

    @Override public boolean onPreDraw() {
        if (failed || !isShown() || getWidth() <= 0 || getHeight() <= 0) return true;
        if (source == null && getParent() instanceof View) {
            View wrapper = (View) getParent();
            if (wrapper.getParent() instanceof View)
                source = ((View) wrapper.getParent()).findViewWithTag("live_drawer_source");
        }
        if (source == null || !source.isShown()) return true;
        try {
            int w = (getWidth() + 2 * padding + SCALE - 1) / SCALE;
            int h = (getHeight() + 2 * padding + SCALE - 1) / SCALE;
            if (capture == null) {
                capture = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
                blurred = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
                captureCanvas = new Canvas(capture);
                pixels = new int[w * h];
                previous = new int[w * h];
                scratch = new int[w * h];
            }
            getLocationInWindow(here);
            source.getLocationInWindow(there);
            capture.eraseColor(Color.TRANSPARENT);
            int save = captureCanvas.save();
            try {
                captureCanvas.scale(1f / SCALE, 1f / SCALE);
                captureCanvas.translate(padding + there[0] - here[0], padding + there[1] - here[1]);
                source.draw(captureCanvas);
            } finally {
                captureCanvas.restoreToCount(save);
            }
            capture.getPixels(pixels, 0, w, 0, 0, w, h);
            if (ready && Arrays.equals(pixels, previous)) return true;
            System.arraycopy(pixels, 0, previous, 0, pixels.length);
            blur(pixels, scratch, w, h, radius);
            blurred.setPixels(pixels, 0, w, 0, 0, w, h);
            sample.set(padding / SCALE, padding / SCALE,
                    (padding + getWidth()) / SCALE, (padding + getHeight()) / SCALE);
            ready = true;
            invalidate();
        } catch (IllegalArgumentException | IllegalStateException exception) {
            // Some OEM icon drawables cannot be rendered onto a software Canvas.
            Log.w("SLLiveBackdrop", "Icon capture unavailable; retaining native glass", exception);
            failed = true;
            release();
            invalidate();
        }
        return true;
    }

    @Override protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (!ready) return;
        int save = canvas.save();
        canvas.clipPath(clip);
        canvas.drawBitmap(blurred, sample, bounds, paint);
        float inset = rim.getStrokeWidth() / 2;
        canvas.drawRoundRect(inset, inset, getWidth() - inset, getHeight() - inset,
                getHeight() / 2f, getHeight() / 2f, rim);
        canvas.restoreToCount(save);
    }

    // Premultiplied box blur avoids dark fringes around transparent icon edges.
    static void blur(int[] data, int[] temp, int width, int height, int radius) {
        if (width <= 0 || height <= 0 || radius < 1 || data.length != width * height || temp.length != data.length)
            throw new IllegalArgumentException("Invalid blur buffers");
        for (int i = 0; i < data.length; i++) {
            int p = data[i], a = p >>> 24;
            data[i] = (a << 24) | ((((p >>> 16) & 255) * a / 255) << 16)
                    | ((((p >>> 8) & 255) * a / 255) << 8) | ((p & 255) * a / 255);
        }
        for (int pass = 0; pass < 2; pass++) {
            box(data, temp, width, height, radius, true);
            box(temp, data, width, height, radius, false);
        }
        for (int i = 0; i < data.length; i++) {
            int p = data[i], a = p >>> 24;
            data[i] = a == 0 ? 0 : (a << 24) | (Math.min(255, ((p >>> 16) & 255) * 255 / a) << 16)
                    | (Math.min(255, ((p >>> 8) & 255) * 255 / a) << 8) | Math.min(255, (p & 255) * 255 / a);
        }
    }

    private static void box(int[] input, int[] output, int width, int height, int radius, boolean horizontal) {
        int length = horizontal ? width : height, lines = horizontal ? height : width;
        int step = horizontal ? 1 : width, size = 2 * radius + 1;
        for (int line = 0; line < lines; line++) {
            int base = horizontal ? line * width : line;
            int a = 0, r = 0, g = 0, b = 0;
            for (int x = -radius; x <= radius; x++) {
                int p = input[base + Math.max(0, Math.min(length - 1, x)) * step];
                a += p >>> 24; r += (p >>> 16) & 255; g += (p >>> 8) & 255; b += p & 255;
            }
            for (int x = 0; x < length; x++) {
                output[base + x * step] = ((a / size) << 24) | ((r / size) << 16) | ((g / size) << 8) | (b / size);
                int left = input[base + Math.max(0, x - radius) * step];
                int right = input[base + Math.min(length - 1, x + radius + 1) * step];
                a += (right >>> 24) - (left >>> 24);
                r += ((right >>> 16) & 255) - ((left >>> 16) & 255);
                g += ((right >>> 8) & 255) - ((left >>> 8) & 255);
                b += (right & 255) - (left & 255);
            }
        }
    }
}
