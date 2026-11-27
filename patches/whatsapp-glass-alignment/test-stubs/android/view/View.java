package android.view;
import android.content.Context;
public class View {
    private int width, height;
    public View(Context c) { }
    public static class MeasureSpec {
        public static final int EXACTLY = 0x40000000;
        public static int makeMeasureSpec(int size, int mode) { return size | mode; }
        public static int getSize(int spec) { return spec & 0x3fffffff; }
    }
    public void measure(int widthSpec, int heightSpec) { onMeasure(widthSpec, heightSpec); }
    protected void onMeasure(int widthSpec, int heightSpec) { setMeasuredDimension(MeasureSpec.getSize(widthSpec), MeasureSpec.getSize(heightSpec)); }
    protected void setMeasuredDimension(int w, int h) { width = w; height = h; }
    public int getMeasuredWidth() { return width; }
    public int getMeasuredHeight() { return height; }
}
