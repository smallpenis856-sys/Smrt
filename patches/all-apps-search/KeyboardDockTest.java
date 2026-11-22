package ginlemon.flower.glass;

public final class KeyboardDockTest {
    public static void main(String[] args) {
        check(0, SLKeyboardDock.bottomOverlap(24, 776, 800), "already resized");
        check(300, SLKeyboardDock.bottomOverlap(24, 1076, 800), "overlay keyboard");
        check(24, SLKeyboardDock.bottomOverlap(0, 1100, 1076), "navigation inset");
        check(0, SLKeyboardDock.bottomOverlap(0, 800, 1100), "no keyboard");
        check(0, SLKeyboardDock.bottomOverlap(-300, 1100, 800), "panned window");
        check(150, SLKeyboardDock.bottomOverlap(0, 450, 300), "landscape");
        check(0, SLKeyboardDock.bottomOverlap(0, 0, 0), "unmeasured view");
        check(400, SLKeyboardDock.bottomOverlap(0, 400, -500), "overlap bounded by height");
        check(100, SLKeyboardDock.bottomOverlap(Integer.MAX_VALUE, 100, 0), "no integer overflow");
        System.out.println("PASS: resized/overlay IME, navigation bars, panning, landscape, unmeasured view and bounds");
    }
    private static void check(int expected, int actual, String message) {
        if (expected != actual) throw new AssertionError(message + ": " + actual + " != " + expected);
    }
}
