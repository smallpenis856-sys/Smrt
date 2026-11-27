import android.content.Context;
import android.view.View;
public final class SLGlassCardTest {
    private static void checkSize(SLGlassCard card, View glass, int width, int height) {
        card.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                     View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        if (glass.getMeasuredWidth() != width || glass.getMeasuredHeight() != height)
            throw new AssertionError("Glass did not track card size");
    }
    public static void main(String[] args) {
        Context context = new Context();
        SLGlassCard card = new SLGlassCard(context);
        View glass = new View(context);
        card.setGlass(glass);
        if (card.lastParams.width != 0 || card.lastParams.height != 0) throw new AssertionError("Glass must not determine card size");
        checkSize(card, glass, 220, 56);
        checkSize(card, glass, 300, 84);
        checkSize(card, glass, 0, 0);
        SLGlassCard noGlass = new SLGlassCard(context);
        noGlass.measure(View.MeasureSpec.makeMeasureSpec(100, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(56, View.MeasureSpec.EXACTLY));
        System.out.println("PASS: background follows card dimensions, resize and empty fallback (fake Android views)");
    }
}
