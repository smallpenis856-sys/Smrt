import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;

/** Size the decorative native glass to the foreground, not the scroll viewport. */
public final class SLGlassCard extends FrameLayout {
    private View glass;
    public SLGlassCard(Context context) { super(context); }
    public void setGlass(View view) {
        // A MATCH_PARENT child can otherwise enlarge a WRAP_CONTENT card to the viewport.
        addView(view, new FrameLayout.LayoutParams(0, 0));
        glass = view;
    }
    @Override protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        if (glass != null) {
            glass.measure(View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(getMeasuredHeight(), View.MeasureSpec.EXACTLY));
        }
    }
}
