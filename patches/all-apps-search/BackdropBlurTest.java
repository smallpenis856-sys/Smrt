package ginlemon.flower.glass;
import java.util.Arrays;

public final class BackdropBlurTest {
    public static void main(String[] args) {
        int[] solid = new int[35];
        Arrays.fill(solid, 0xff80c040);
        SLLiveBackdrop.blur(solid, new int[35], 7, 5, 2);
        for (int p : solid) check(p == 0xff80c040, "solid color must remain unchanged");
        int[] empty = new int[35];
        SLLiveBackdrop.blur(empty, new int[35], 7, 5, 2);
        for (int p : empty) check(p == 0, "transparent background must stay transparent");
        int[] impulse = new int[81];
        impulse[40] = 0xffff0000;
        SLLiveBackdrop.blur(impulse, new int[81], 9, 9, 1);
        check((impulse[40] >>> 24) < 255, "center must soften");
        check((impulse[39] >>> 24) > 0, "blur must spread to adjacent pixels");
        for (int p : impulse)
            if ((p >>> 24) > 0) check((p & 0x00ffffff) == 0x00ff0000, "no black fringe on red edges");
        int[] tiny = {0xff123456};
        SLLiveBackdrop.blur(tiny, new int[1], 1, 1, 9);
        check(tiny[0] == 0xff123456, "tiny image edge clamping");
        boolean rejected = false;
        try { SLLiveBackdrop.blur(new int[1], new int[2], 1, 1, 1); }
        catch (IllegalArgumentException expected) { rejected = true; }
        check(rejected, "invalid buffers must fail");
        System.out.println("PASS: solid/transparent pixels, live icon softening, premultiplied edges, tiny images, invalid buffers");
    }
    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
}
