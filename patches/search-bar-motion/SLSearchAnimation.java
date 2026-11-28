import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.PathInterpolator;

/** A short, subtle horizontal reveal of the search bar backdrop on search entry. */
public final class SLSearchAnimation implements ViewTreeObserver.OnPreDrawListener {
    private final ViewGroup root;
    private final View editor;
    private ViewTreeObserver observer;
    private ValueAnimator animator;
    private View backdrop;
    private float originalScale;

    // Keep the existing hook's signature; the editor, results and menu remain untouched.
    public SLSearchAnimation(ViewGroup root, View editor, View results, View menu) {
        this.root = root; this.editor = editor;
    }
    public void start() {
        stop();
        observer = root.getViewTreeObserver();
        if (observer.isAlive()) observer.addOnPreDrawListener(this);
    }
    private void removeListener() {
        if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
        observer = null;
    }
    public void stop() {
        removeListener();
        if (animator != null) { animator.cancel(); animator = null; }
        restore();
    }
    private void restore() {
        if (backdrop != null) { backdrop.setScaleX(originalScale); backdrop = null; }
    }
    @Override public boolean onPreDraw() {
        removeListener();
        if (!root.isShown() || editor.getWidth() == 0 || root.getChildCount() == 0) return true;
        View candidate = root.getChildAt(0);
        // The first child is the decorative glass in this layout; never scale the editor.
        if (!candidate.getClass().getName().equals("ginlemon.flower.glass.SLDrawerSearchLayout")) return true;
        backdrop = candidate;
        originalScale = backdrop.getScaleX();
        animator = ValueAnimator.ofFloat(.92f, 1f);
        animator.setDuration(240);
        animator.setInterpolator(new PathInterpolator(.2f, 0f, 0f, 1f));
        animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
            @Override public void onAnimationUpdate(ValueAnimator a) {
                if (backdrop != null) backdrop.setScaleX(originalScale * (Float) a.getAnimatedValue());
            }
        });
        animator.addListener(new AnimatorListenerAdapter() {
            @Override public void onAnimationEnd(Animator a) {
                restore();
                if (animator == a) animator = null;
            }
        });
        animator.start();
        return true;
    }
}
