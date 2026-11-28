import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.animation.PathInterpolator;
import java.util.ArrayList;

/** Reveal the active search field from its center without stretching text or icons. */
public final class SLSearchAnimation implements ViewTreeObserver.OnPreDrawListener {
    private final ViewGroup root;
    private final View editor, results, menu;
    private final ArrayList<View> views = new ArrayList<>();
    private Rect[] previous, clips;
    private ViewTreeObserver observer;
    private ValueAnimator animator;
    public SLSearchAnimation(ViewGroup root, View editor, View results, View menu) {
        this.root=root; this.editor=editor; this.results=results; this.menu=menu;
    }
    public void start() {
        stop(); observer=root.getViewTreeObserver();
        if (observer.isAlive()) observer.addOnPreDrawListener(this);
    }
    private void removeListener() {
        if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
        observer=null;
    }
    public void stop() {
        removeListener();
        if (animator!=null) { animator.cancel(); animator=null; }
        restore();
    }
    private void restore() {
        for (int i=0; i<views.size(); i++) views.get(i).setClipBounds(previous[i]);
        views.clear();
    }
    @Override public boolean onPreDraw() {
        // w() can run before the panel becomes visible. Keep waiting until exit or a real frame.
        if (!root.isShown() || editor.getWidth()==0 || root.getChildCount()==0) return true;
        removeListener();
        if (!root.getChildAt(0).getClass().getName().equals("ginlemon.flower.glass.SLDrawerSearchLayout")) return true;
        for (int i=0; i<root.getChildCount(); i++) {
            View child=root.getChildAt(i);
            if (child!=results && child!=menu) views.add(child);
        }
        int n=views.size(); previous=new Rect[n]; clips=new Rect[n];
        for (int i=0; i<n; i++) { previous[i]=views.get(i).getClipBounds(); clips[i]=new Rect(); }
        animator=ValueAnimator.ofFloat(.55f,1f);
        animator.setDuration(280);
        animator.setInterpolator(new PathInterpolator(.2f,0f,0f,1f));
        animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
            @Override public void onAnimationUpdate(ValueAnimator a) {
                float fraction=(Float)a.getAnimatedValue();
                float center=editor.getLeft()+editor.getWidth()/2f;
                float half=editor.getWidth()*fraction/2f;
                for (int i=0; i<views.size(); i++) {
                    View child=views.get(i); float x=child.getLeft()+child.getTranslationX();
                    int left=Math.max(0,Math.min(child.getWidth(),Math.round(center-half-x)));
                    int right=Math.max(left,Math.min(child.getWidth(),Math.round(center+half-x)));
                    Rect r=clips[i]; r.set(left,0,right,child.getHeight());
                    Rect old=previous[i];
                    if (old!=null && !r.intersect(old)) r.set(0,0,0,0);
                    child.setClipBounds(r);
                }
            }
        });
        animator.addListener(new AnimatorListenerAdapter() {
            @Override public void onAnimationEnd(Animator a) { restore(); if (animator==a) animator=null; }
        });
        animator.start(); return true;
    }
}
