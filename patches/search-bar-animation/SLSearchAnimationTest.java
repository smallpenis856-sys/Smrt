import android.animation.ValueAnimator;
import android.view.View;
import android.view.ViewGroup;
public class SLSearchAnimationTest {
    static void near(float a,float b) { if (Math.abs(a-b) > 0.001f) throw new AssertionError(a+" != "+b); }
    public static void main(String[] args) {
        ViewGroup root = new ViewGroup(); View editor = new View(), icon = new View(), results = new View(), menu = new View();
        editor.left = 20; editor.width = 200; editor.pivot = 100;
        icon.left = 30; icon.width = 20; icon.pivot = 10; icon.scale = .9f; icon.translation = 4;
        root.children.add(editor); root.children.add(icon); root.children.add(results); root.children.add(menu);
        SLSearchAnimation a = new SLSearchAnimation(root, editor, results, menu);
        a.start(); if (root.observer.listener == null) throw new AssertionError("listener missing");
        root.observer.listener.onPreDraw(); if (root.observer.listener != null) throw new AssertionError("listener not removed");
        ValueAnimator.last.frame(.16f); near(editor.scale,.16f); near(icon.scale,.144f);
        near(icon.translation, 4 + (120-30-10-4)*.84f); near(results.scale,1); near(menu.scale,1);
        a.stop(); near(icon.scale,.9f); near(icon.translation,4); near(editor.scale,1);
        a.start(); a.stop(); if (root.observer.listener != null) throw new AssertionError("pending listener leaked");
        a.start(); root.observer.listener.onPreDraw(); ValueAnimator.last.frame(.16f); ValueAnimator.last.end();
        near(icon.scale,.9f); near(icon.translation,4); near(editor.scale,1);
        root.shown = false; a.start(); ValueAnimator prior=ValueAnimator.last; root.observer.listener.onPreDraw();
        if (prior != ValueAnimator.last) throw new AssertionError("animated hidden panel");
        System.out.println("PASS: shared center, excluded controls, cancellation, completion, listener cleanup and hidden panel");
    }
}
