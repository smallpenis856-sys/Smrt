/** Geometry is independent of Android so fit/crop and bad saved values can be host-tested. */
public final class SLGifGeometry {
    public static final int DEFAULT_SIZE = 90, DEFAULT_SHAPE = 0, DEFAULT_MODE = 0;
    public static int size(int n) { return Math.max(50, Math.min(100, n)); }
    public static int shape(int n) { return n >= 0 && n <= 2 ? n : DEFAULT_SHAPE; }
    public static int mode(int n) { return n == 1 ? 1 : DEFAULT_MODE; }
    public static float scale(int width, int height, float side, int mode) {
        if (width <= 0 || height <= 0 || side <= 0) return 0;
        float x = side / width, y = side / height;
        return mode(mode) == 1 ? Math.max(x, y) : Math.min(x, y);
    }
    public static float radius(float side, int shape) {
        switch (shape(shape)) { case 1: return side * .5f; case 2: return 0f; default: return side * .22f; }
    }
}
