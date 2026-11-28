import android.animation.ValueAnimator;
import android.view.View;
import android.view.ViewGroup;
import ginlemon.flower.glass.SLDrawerSearchLayout;
public class SLSearchAnimationTest {
    static void near(float a,float b) { if (Math.abs(a-b) > .0001f) throw new AssertionError(a+" != "+b); }
    public static void main(String[] args) {
        ViewGroup root = new ViewGroup(); View bg = new SLDrawerSearchLayout(), editor = new View(), icon = new View(), results = new View(), menu = new View();
        bg.scale = .98f; bg.translation = 4;
        root.children.add(bg); root.children.add(editor); root.children.add(icon); root.children.add(results); root.children.add(menu);
        SLSearchAnimation a = new SLSearchAnimation(root, editor, results, menu);
        a.start(); if (root.observer.listener == null) throw new AssertionError("missing pre-draw");
        root.observer.listener.onPreDraw(); if (root.observer.listener != null) throw new AssertionError("listener leaked");
        ValueAnimator.last.frame(.92f); near(bg.scale,.98f*.92f); near(bg.translation,4);
        near(editor.scale,1); near(icon.scale,1); near(results.scale,1); near(menu.scale,1);
        a.stop(); near(bg.scale,.98f); near(bg.translation,4);
        a.start(); a.stop(); if (root.observer.listener != null) throw new AssertionError("pending listener leaked");
        a.start(); root.observer.listener.onPreDraw(); ValueAnimator.last.frame(.92f); ValueAnimator.last.end(); near(bg.scale,.98f);
        root.shown=false; a.start(); ValueAnimator prior=ValueAnimator.last; root.observer.listener.onPreDraw();
        if (prior!=ValueAnimator.last) throw new AssertionError("animated hidden panel");
        root.shown=true; root.children.set(0,editor); a.start(); root.observer.listener.onPreDraw();
        if (prior!=ValueAnimator.last) throw new AssertionError("animated unexpected view");
        System.out.println("PASS: subtle reveal, unchanged text/icons, cancellation, completion and hidden/mismatched views");
    }
}
