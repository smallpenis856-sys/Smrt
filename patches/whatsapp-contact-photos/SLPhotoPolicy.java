/** Limits decoded image size for contact thumbnails. */
public final class SLPhotoPolicy {
    private SLPhotoPolicy() { }
    public static int sampleSize(int width, int height, int target) {
        if (width <= 0 || height <= 0 || width > 32768 || height > 32768 || target <= 0) return 0;
        int longest = Math.max(width, height);
        int sample = 1;
        while (sample <= 16384 && longest / (sample * 2) >= target) sample *= 2;
        return sample;
    }
}
