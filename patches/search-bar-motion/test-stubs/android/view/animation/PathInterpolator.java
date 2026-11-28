package android.view.animation;
public class PathInterpolator {
    public PathInterpolator(float a,float b,float c,float d) {
        if (a != .2f || b != 0f || c != 0f || d != 1f) throw new AssertionError();
    }
}
