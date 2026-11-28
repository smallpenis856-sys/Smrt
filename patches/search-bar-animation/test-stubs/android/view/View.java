package android.view;
public class View {
    public int left, width = 100;
    public float scale = 1, translation = 0, pivot = 50;
    public boolean shown = true;
    public boolean isShown() { return shown; }
    public int getWidth() { return width; }
    public int getLeft() { return left; }
    public float getScaleX() { return scale; }
    public void setScaleX(float v) { scale = v; }
    public float getTranslationX() { return translation; }
    public void setTranslationX(float v) { translation = v; }
    public float getPivotX() { return pivot; }
}
