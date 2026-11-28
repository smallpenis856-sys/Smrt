package android.view;
import android.graphics.Rect;
public class View implements ViewParent {
    public interface OnAttachStateChangeListener { void onViewAttachedToWindow(View v); void onViewDetachedFromWindow(View v); }
    public int left, width=100, height=56; public float translation=0,scale=1;
    public boolean shown=true, attached=true, focused=true; public ViewParent parent; public Rect clip;
    public OnAttachStateChangeListener listener;
    public boolean isShown(){return shown;} public boolean isAttachedToWindow(){return attached;} public boolean hasWindowFocus(){return focused;}
    public boolean getGlobalVisibleRect(Rect r){return shown && attached;}
    public int getWidth(){return width;} public int getHeight(){return height;} public int getLeft(){return left;} public float getTranslationX(){return translation;}
    public ViewParent getParent(){return parent;}
    public Rect getClipBounds(){return clip==null?null:new Rect(clip);}
    public void setClipBounds(Rect r){clip=r==null?null:new Rect(r);}
    public void addOnAttachStateChangeListener(OnAttachStateChangeListener l){listener=l;}
    public void removeOnAttachStateChangeListener(OnAttachStateChangeListener l){if(listener==l)listener=null;}
    public void detach(){attached=false; if(listener!=null)listener.onViewDetachedFromWindow(this);}
}
