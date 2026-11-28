package android.view;
public class ViewTreeObserver {
    public interface OnPreDrawListener { boolean onPreDraw(); }
    public OnPreDrawListener listener;
    public boolean isAlive() { return true; }
    public void addOnPreDrawListener(OnPreDrawListener l) { listener = l; }
    public void removeOnPreDrawListener(OnPreDrawListener l) { if (listener == l) listener = null; }
}
