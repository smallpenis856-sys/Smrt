public final class SLGifGeometryTest {
    static void check(boolean v) { if (!v) throw new AssertionError(); }
    static void near(float a, float b) { check(Math.abs(a-b) < 0.0001f); }
    public static void main(String[] args) {
        check(SLGifGeometry.DEFAULT_SIZE == 90 && SLGifGeometry.DEFAULT_SHAPE == 0 && SLGifGeometry.DEFAULT_MODE == 0);
        check(SLGifGeometry.size(0) == 50 && SLGifGeometry.size(150) == 100 && SLGifGeometry.size(75) == 75);
        check(SLGifGeometry.shape(-1) == 0 && SLGifGeometry.shape(3) == 0 && SLGifGeometry.shape(2) == 2);
        check(SLGifGeometry.mode(-1) == 0 && SLGifGeometry.mode(7) == 0 && SLGifGeometry.mode(1) == 1);
        near(SLGifGeometry.scale(200, 100, 90, 0), .45f);
        near(SLGifGeometry.scale(200, 100, 90, 1), .9f);
        near(SLGifGeometry.scale(100, 200, 90, 0), .45f);
        near(SLGifGeometry.scale(0, 100, 90, 1), 0);
        near(SLGifGeometry.radius(100, 0), 22); near(SLGifGeometry.radius(100, 1), 50); near(SLGifGeometry.radius(100, 2), 0);
        System.out.println("PASS: size limits, fit/crop aspect ratio, shape radii, defaults and malformed options");
    }
}
