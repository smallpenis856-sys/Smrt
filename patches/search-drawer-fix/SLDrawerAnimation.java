package ginlemon.flower.glass;
import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewParent;
import android.view.animation.PathInterpolator;

/** Animate the tapped drawer bar before the existing no-flash search navigation. */
public final class SLDrawerAnimation implements View.OnAttachStateChangeListener {
    private static SLDrawerAnimation active;
    private final View bar, clicked;
    private final SLDrawerSearchClick action;
    private final Rect previous, clip=new Rect();
    private ValueAnimator animator;
    private boolean cancelled;
    private SLDrawerAnimation(View bar, View clicked, SLDrawerSearchClick action) {
        this.bar=bar; this.clicked=clicked; this.action=action; previous=bar.getClipBounds();
    }
    public static void start(View clicked, SLDrawerSearchClick action) {
        if (active != null) return;
        ViewParent parent=clicked.getParent();
        if (!(parent instanceof View) || !parent.getClass().getName().equals("ginlemon.flower.glass.SLDrawerSearchLayout")) {
            action.open(clicked); return;
        }
        View bar=(View)parent;
        if (!bar.isAttachedToWindow() || !bar.isShown() || bar.getWidth()==0 || bar.getHeight()==0) {
            action.open(clicked); return;
        }
        SLDrawerAnimation t=new SLDrawerAnimation(bar,clicked,action);
        active=t; bar.addOnAttachStateChangeListener(t); t.play();
    }
    private void play() {
        animator=ValueAnimator.ofFloat(1f,.55f); animator.setDuration(180);
        animator.setInterpolator(new PathInterpolator(.4f,0f,1f,1f));
        animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
            @Override public void onAnimationUpdate(ValueAnimator a) {
                float value=(Float)a.getAnimatedValue(); int w=bar.getWidth();
                int left=Math.round(w*(1f-value)/2f); clip.set(left,0,w-left,bar.getHeight());
                if (previous!=null && !clip.intersect(previous)) clip.set(0,0,0,0);
                bar.setClipBounds(clip);
            }
        });
        animator.addListener(new AnimatorListenerAdapter() {
            @Override public void onAnimationEnd(Animator a) {
                bar.setClipBounds(previous); bar.removeOnAttachStateChangeListener(SLDrawerAnimation.this);
                if (active==SLDrawerAnimation.this) active=null;
                animator=null;
                if (!cancelled && bar.isAttachedToWindow() && bar.isShown() && bar.hasWindowFocus()
                        && bar.getGlobalVisibleRect(new Rect())) action.open(clicked);
            }
        });
        animator.start();
    }
    @Override public void onViewAttachedToWindow(View v) {}
    @Override public void onViewDetachedFromWindow(View v) {
        cancelled=true;
        if (animator!=null) animator.cancel();
    }
}
