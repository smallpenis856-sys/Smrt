import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.AccelerateDecelerateInterpolator;
import java.util.ArrayList;

/** One-shot horizontal squeeze when entering search; never delays focus or navigation. */
public final class SLSearchAnimation implements ViewTreeObserver.OnPreDrawListener {
    private final ViewGroup root;
    private final View editor, results, menu;
    private final ArrayList<View> views = new ArrayList<>();
    private float[] scales, translations, offsets;
    private ViewTreeObserver observer;
    private ValueAnimator animator;

    public SLSearchAnimation(ViewGroup root, View editor, View results, View menu) {
        this.root = root; this.editor = editor; this.results = results; this.menu = menu;
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
        for (int i = 0; i < views.size(); i++) {
            views.get(i).setScaleX(scales[i]);
            views.get(i).setTranslationX(translations[i]);
        }
        views.clear();
    }
    @Override public boolean onPreDraw() {
        removeListener();
        if (!root.isShown() || editor.getWidth() == 0) return true;
        float center = editor.getLeft() + editor.getWidth() / 2f;
        for (int i = 0; i < root.getChildCount(); i++) {
            View child = root.getChildAt(i);
            if (child != results && child != menu) views.add(child);
        }
        int n = views.size();
        scales = new float[n]; translations = new float[n]; offsets = new float[n];
        for (int i = 0; i < n; i++) {
            View child = views.get(i);
            scales[i] = child.getScaleX();
            translations[i] = child.getTranslationX();
            offsets[i] = center - child.getLeft() - child.getPivotX() - translations[i];
        }
        animator = ValueAnimator.ofFloat(1f, 0.16f, 1f);
        animator.setDuration(460);
        animator.setInterpolator(new AccelerateDecelerateInterpolator());
        animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
            @Override public void onAnimationUpdate(ValueAnimator a) {
                float value = (Float) a.getAnimatedValue();
                for (int i = 0; i < views.size(); i++) {
                    views.get(i).setScaleX(scales[i] * value);
                    views.get(i).setTranslationX(translations[i] + offsets[i] * (1f - value));
                }
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
