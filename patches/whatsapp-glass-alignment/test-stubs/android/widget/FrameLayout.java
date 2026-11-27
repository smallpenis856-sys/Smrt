package android.widget;
import android.content.Context;
import android.view.View;
public class FrameLayout extends View {
    public static class LayoutParams {
        public final int width, height;
        public LayoutParams(int width, int height) { this.width = width; this.height = height; }
    }
    public LayoutParams lastParams;
    public View lastView;
    public FrameLayout(Context c) { super(c); }
    public void addView(View view, LayoutParams params) { lastView = view; lastParams = params; }
}
