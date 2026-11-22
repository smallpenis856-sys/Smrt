package ginlemon.flower.glance;

/** Pure priority rule: low battery, playing music, upcoming event, today's task. */
public final class SLGlancePolicy {
    private SLGlancePolicy() {}
    public static boolean eventVisible(long start, long end, long now) {
        return end >= now && start - now <= 60 * 60 * 1000L;
    }
    public static int choose(int battery, boolean batteryEnabled, boolean music, boolean event, boolean task) {
        if (batteryEnabled && battery >= 0 && battery <= 20) return 1;
        if (music) return 2;
        if (event) return 3;
        if (task) return 4;
        return 0;
    }
}
