import java.util.Arrays;
public final class GifValidationTest {
    private static void check(boolean b) { if (!b) throw new AssertionError(); }
    public static void main(String[] args) {
        byte[] good = new byte[]{'G','I','F','8','9','a', 1,0, 2,0, 0,0,0};
        check(SLGifIcons.valid(good));
        byte[] a = good.clone(); a[0] = 'X'; check(!SLGifIcons.valid(a));
        a = good.clone(); a[6] = 0; check(!SLGifIcons.valid(a));
        a = good.clone(); a[6] = 1; a[7] = 2; check(!SLGifIcons.valid(a));
        a = good.clone(); a[6] = 0; a[7] = 2; check(SLGifIcons.valid(a));
        check(!SLGifIcons.valid(Arrays.copyOf(good, 12)));
        check(!SLGifIcons.valid(Arrays.copyOf(good, 1024 * 1024 + 1)));
        System.out.println("PASS GIF header and size validation");
    }
}
