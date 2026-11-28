package android.animation;
import android.view.animation.PathInterpolator;
public class ValueAnimator extends Animator {
    public interface AnimatorUpdateListener {void onAnimationUpdate(ValueAnimator a);}
    public static ValueAnimator last; public float[] values; public long duration; public float value;
    public AnimatorUpdateListener update; public AnimatorListenerAdapter listener;
    public static ValueAnimator ofFloat(float... v){ValueAnimator a=last=new ValueAnimator();a.values=v;return a;}
    public void setDuration(long d){duration=d;} public void setInterpolator(PathInterpolator p){}
    public void addUpdateListener(AnimatorUpdateListener l){update=l;}
    public void addListener(AnimatorListenerAdapter l){listener=l;}
    public void start(){} public void cancel(){listener.onAnimationEnd(this);}
    public Object getAnimatedValue(){return value;}
    public void frame(float v){value=v;update.onAnimationUpdate(this);} public void end(){listener.onAnimationEnd(this);}
}
