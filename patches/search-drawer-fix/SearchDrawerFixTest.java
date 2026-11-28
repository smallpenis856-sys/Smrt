import android.animation.ValueAnimator;
import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import ginlemon.flower.glass.SLDrawerSearchLayout;
import ginlemon.flower.glass.SLDrawerSearchClick;
import ginlemon.flower.glass.SLDrawerAnimation;
public class SearchDrawerFixTest {
    static void check(boolean b){if(!b)throw new AssertionError();}
    public static void main(String[] args) {
        ViewGroup root=new ViewGroup(); View bg=new SLDrawerSearchLayout(), editor=new View(), results=new View(), menu=new View();
        editor.left=0; editor.width=200; bg.width=200; root.children.add(bg);root.children.add(editor);root.children.add(results);root.children.add(menu);
        editor.clip=new Rect(10,0,190,56);
        SLSearchAnimation a=new SLSearchAnimation(root,editor,results,menu);
        root.shown=false; a.start(); root.observer.listener.onPreDraw(); check(root.observer.listener!=null);
        root.shown=true; root.observer.listener.onPreDraw(); check(root.observer.listener==null);
        check(ValueAnimator.last.values[0]==.55f && ValueAnimator.last.values[1]==1f && ValueAnimator.last.duration==280);
        ValueAnimator.last.frame(.55f); check(bg.clip.left==45 && bg.clip.right==155 && editor.clip.left==45 && editor.clip.right==155);
        check(results.clip==null && menu.clip==null && editor.scale==1);
        a.stop(); check(bg.clip==null && editor.clip.left==10 && editor.clip.right==190);
        a.start(); a.stop(); check(root.observer.listener==null);
        a.start(); root.observer.listener.onPreDraw(); ValueAnimator.last.frame(.55f);ValueAnimator.last.end();check(bg.clip==null && editor.clip.left==10);
        SLDrawerSearchLayout bar=new SLDrawerSearchLayout();bar.width=200;View tapped=new View();tapped.parent=bar;
        SLDrawerSearchClick click=new SLDrawerSearchClick();
        SLDrawerAnimation.start(tapped,click);ValueAnimator close=ValueAnimator.last;
        check(close.values[0]==1f && close.values[1]==.55f && close.duration==180);
        SLDrawerAnimation.start(tapped,click); check(ValueAnimator.last==close && click.calls==0);
        close.frame(.55f);check(bar.clip.left==45 && bar.clip.right==155);close.end();check(bar.clip==null && click.calls==1 && bar.listener==null);
        SLDrawerAnimation.start(tapped,click);ValueAnimator.last.frame(.55f);bar.detach();check(bar.clip==null && click.calls==1 && bar.listener==null);
        bar.attached=true;bar.focused=false; SLDrawerAnimation.start(tapped,click);ValueAnimator.last.end();check(click.calls==1);
        tapped.parent=null;SLDrawerAnimation.start(tapped,click);check(click.calls==2);
        System.out.println("PASS: visible close/reveal, unchanged text geometry, duplicate tap, cancellation, visibility and clip restore");
    }
}
