public final class SLPhotoPolicyTest {
    private static void check(int w, int h, int t, int expected) {
        int actual = SLPhotoPolicy.sampleSize(w, h, t);
        if (actual != expected) throw new AssertionError(w + "x" + h + " target " + t + " got " + actual);
    }
    public static void main(String[] args) {
        check(96, 96, 96, 1);
        check(1024, 768, 96, 8);
        check(64, 2000, 96, 16);
        check(0, 10, 96, 0);
        check(10, -1, 96, 0);
        check(32769, 100, 96, 0);
        check(Integer.MAX_VALUE, 100, 1, 0);
        check(100, 100, 0, 0);
        for (int n = 1; n <= 32768; n++) {
            int sample = SLPhotoPolicy.sampleSize(n, n, 96);
            if ((sample & (sample - 1)) != 0 || (sample != 1 && n / sample >= 192)) throw new AssertionError(n);
        }
        System.out.println("PASS: sampled contact photos, oversized and invalid bounds");
    }
}
