package ginlemon.flower.glance;

public final class SLGlancePolicyTest {
    public static void main(String[] args) {
        check(1, 20, true, true, true, true); check(2, 21, true, true, true, true);
        check(2, -1, true, true, true, true); check(2, 2, false, true, true, true);
        check(3, 50, true, false, true, true); check(4, 50, true, false, false, true);
        check(0, 50, true, false, false, false); check(1, 0, true, false, false, false);
        if (!SLGlancePolicy.eventVisible(3_600_000L, 7_200_000L, 0)) throw new AssertionError("one hour boundary");
        if (SLGlancePolicy.eventVisible(3_600_001L, 7_200_000L, 0)) throw new AssertionError("not yet upcoming");
        if (!SLGlancePolicy.eventVisible(1, 10, 5)) throw new AssertionError("ongoing event");
        if (SLGlancePolicy.eventVisible(1, 9, 10)) throw new AssertionError("finished event");
        System.out.println("PASS: priority, battery boundary, disabled source and event time boundaries");
    }
    static void check(int expected, int battery, boolean b, boolean m, boolean e, boolean t) {
        int actual = SLGlancePolicy.choose(battery, b, m, e, t);
        if (actual != expected) throw new AssertionError(actual + " != " + expected);
    }
}
