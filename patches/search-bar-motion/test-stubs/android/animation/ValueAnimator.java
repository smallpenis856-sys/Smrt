package android.animation;
import android.view.animation.PathInterpolator;
public class ValueAnimator extends Animator {
    public interface AnimatorUpdateListener { void onAnimationUpdate(ValueAnimator a); }
    public static ValueAnimator last;
    public AnimatorUpdateListener update; public AnimatorListenerAdapter listener; public float value;
    public static ValueAnimator ofFloat(float... v) { if (v.length != 2 || v[0] != .92f || v[1] != 1f) throw new AssertionError(); return last = new ValueAnimator(); }
    public void setDuration(long duration) { if (duration != 240) throw new AssertionError(); }
    public void setInterpolator(PathInterpolator i) {}
    public void addUpdateListener(AnimatorUpdateListener l) { update = l; }
    public void addListener(AnimatorListenerAdapter l) { listener = l; }
    public void start() {}
    public void cancel() { listener.onAnimationEnd(this); }
    public Object getAnimatedValue() { return value; }
    public void frame(float v) { value = v; update.onAnimationUpdate(this); }
    public void end() { listener.onAnimationEnd(this); }
}
