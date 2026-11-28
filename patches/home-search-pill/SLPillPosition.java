/** Calculates a safe top edge above the dock and any visible page indicator. */
public final class SLPillPosition {
    public static int top(int height, int dockTop, int indicatorTop, int pillHeight, int gap, int minimumTop) {
        if (height <= 0 || pillHeight <= 0) return -1;
        int anchor=height;
        if (dockTop > minimumTop && dockTop <= height) anchor=Math.min(anchor,dockTop);
        if (indicatorTop > minimumTop && indicatorTop <= height) anchor=Math.min(anchor,indicatorTop);
        if (anchor==height) return -1;
        int y=anchor-gap-pillHeight;
        return y>=minimumTop ? y : -1;
    }
}
