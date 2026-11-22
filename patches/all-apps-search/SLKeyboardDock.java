package ginlemon.flower.glass;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;

/** Owns keyboard layout only while the native search panel is active. */
public final class SLKeyboardDock implements ViewTreeObserver.OnGlobalLayoutListener {
    private final ViewGroup container;
    private final Rect visible = new Rect();
    private final int[] position = new int[2];
    private Window window;
    private int previousMode, previousBottom;
    private boolean started;

    public SLKeyboardDock(ViewGroup container) {
        this.container = container;
    }

    public void start() {
        if (started) return;
        Context context = container.getContext();
        while (!(context instanceof Activity) && context instanceof ContextWrapper) {
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) return;
            context = base;
        }
        if (!(context instanceof Activity)) return;
        window = ((Activity) context).getWindow();
        previousMode = window.getAttributes().softInputMode;
        previousBottom = container.getPaddingBottom();
        started = true;
        // Resize when supported; explicit overlap also handles edge-to-edge windows.
        window.setSoftInputMode((previousMode & ~WindowManager.LayoutParams.SOFT_INPUT_MASK_ADJUST)
                | WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        container.getViewTreeObserver().addOnGlobalLayoutListener(this);
        container.requestApplyInsets();
        onGlobalLayout();
    }

    public void stop() {
        if (!started) return;
        started = false;
        if (container.getViewTreeObserver().isAlive())
            container.getViewTreeObserver().removeOnGlobalLayoutListener(this);
        window.setSoftInputMode(previousMode);
        window = null;
        container.setPadding(container.getPaddingLeft(), container.getPaddingTop(),
                container.getPaddingRight(), previousBottom);
    }

    @Override public void onGlobalLayout() {
        if (!started || !container.isAttachedToWindow() || !container.isShown()) return;
        container.getWindowVisibleDisplayFrame(visible);
        int visibleBottom = visible.bottom;
        if (Build.VERSION.SDK_INT >= 30)
            visibleBottom = Api30.visibleBottom(container, visibleBottom);
        if (visibleBottom <= 0) return;
        container.getLocationOnScreen(position);
        int bottom = Math.max(previousBottom,
                bottomOverlap(position[1], container.getHeight(), visibleBottom));
        if (bottom != container.getPaddingBottom()) {
            container.setPadding(container.getPaddingLeft(), container.getPaddingTop(),
                    container.getPaddingRight(), bottom);
        }
    }

    // An already-resized container yields zero: never subtract the IME twice.
    static int bottomOverlap(int screenY, int height, int visibleBottom) {
        return (int) Math.min(Math.max(0, height),
                Math.max(0L, (long) screenY + height - visibleBottom));
    }

    private static final class Api30 {
        static int visibleBottom(View view, int fallback) {
            WindowInsets insets = view.getRootWindowInsets();
            WindowManager manager = (WindowManager) view.getContext().getSystemService(Context.WINDOW_SERVICE);
            if (insets == null || manager == null) return fallback;
            int obstruction = insets.getInsets(WindowInsets.Type.ime() | WindowInsets.Type.navigationBars()).bottom;
            return manager.getCurrentWindowMetrics().getBounds().bottom - obstruction;
        }
    }
}
