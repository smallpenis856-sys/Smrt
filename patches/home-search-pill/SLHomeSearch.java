import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import ginlemon.flower.HomeScreen;

/** Small home-only search pill. Anchors to the existing dock/indicator without changing their layout. */
public final class SLHomeSearch extends FrameLayout implements View.OnLayoutChangeListener {
    private static final String TAG="sl_home_search_pill_v1";
    private final FrameLayout root;
    private final View dock, indicator, editOverlay;
    private boolean editMode;

    public static void install(FrameLayout root, View dock, View indicator, View editOverlay) {
        if (root.findViewWithTag(TAG)!=null) return;
        SLHomeSearch pill=new SLHomeSearch(root,dock,indicator,editOverlay);
        FrameLayout.LayoutParams p=new FrameLayout.LayoutParams(LayoutParams.WRAP_CONTENT,LayoutParams.WRAP_CONTENT,Gravity.TOP|Gravity.CENTER_HORIZONTAL);
        root.addView(pill,p);
    }
    public static void editVisibility(View overlay, int visibility) {
        if (!(overlay.getParent() instanceof ViewGroup)) return;
        View found=((ViewGroup)overlay.getParent()).findViewWithTag(TAG);
        if (found instanceof SLHomeSearch) {
            SLHomeSearch pill=(SLHomeSearch)found;
            pill.editMode=visibility==View.VISIBLE;
            pill.position();
        }
    }
    private SLHomeSearch(FrameLayout root, View dock, View indicator, View overlay) {
        super(root.getContext()); this.root=root;this.dock=dock;this.indicator=indicator;editOverlay=overlay;
        setTag(TAG);setMinimumWidth(dp(96));setMinimumHeight(dp(48));
        setClickable(true);setFocusable(true);
        String label=getContext().getString(0x7f1306ba);
        setContentDescription(label);
        TextView text=new TextView(getContext());
        text.setText(label);text.setTextSize(12);text.setTextColor(0xfff5f5f5);
        text.setGravity(Gravity.CENTER);text.setSingleLine(true);text.setEllipsize(TextUtils.TruncateAt.END);
        text.setIncludeFontPadding(false);text.setPadding(dp(10),dp(5),dp(10),dp(5));text.setMinHeight(dp(28));
        text.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        Magnifier icon=new Magnifier(); int size=dp(13);icon.setBounds(0,0,size,size);
        text.setCompoundDrawablesRelative(icon,null,null,null);text.setCompoundDrawablePadding(dp(4));
        GradientDrawable bg=new GradientDrawable();bg.setColor(0x664c4c4c);bg.setCornerRadius(dp(24));bg.setStroke(Math.max(1,dp(1)),0x66ffffff);text.setBackground(bg);
        addView(text,new FrameLayout.LayoutParams(LayoutParams.WRAP_CONTENT,LayoutParams.WRAP_CONTENT,Gravity.CENTER));
        setVisibility(INVISIBLE);
        setOnClickListener(new OnClickListener() { @Override public void onClick(View v) {
            if (editMode) return;
            Context c=getContext();
            while (c instanceof ContextWrapper && !(c instanceof HomeScreen)) {
                Context next=((ContextWrapper)c).getBaseContext();if (next==c) return;c=next;
            }
            if (c instanceof HomeScreen) ((HomeScreen)c).H();
        }});
    }
    private int dp(float value) { return Math.round(value*getResources().getDisplayMetrics().density); }
    @Override public CharSequence getAccessibilityClassName() { return "android.widget.Button"; }
    @Override protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        root.addOnLayoutChangeListener(this);dock.addOnLayoutChangeListener(this);indicator.addOnLayoutChangeListener(this);
        editMode=editOverlay.getVisibility()==VISIBLE;
        post(new Runnable(){@Override public void run(){position();}});
    }
    @Override protected void onDetachedFromWindow() {
        root.removeOnLayoutChangeListener(this);dock.removeOnLayoutChangeListener(this);indicator.removeOnLayoutChangeListener(this);
        super.onDetachedFromWindow();
    }
    @Override public void onLayoutChange(View v,int l,int t,int r,int b,int ol,int ot,int oright,int ob) { position(); }
    private void position() {
        if (!isAttachedToWindow() || editMode || dock.getVisibility()!=VISIBLE) {setVisibility(INVISIBLE);return;}
        int min=dp(56);
        int dockTop=dock.getTop();
        int indicatorTop=indicator.getVisibility()==VISIBLE && indicator.getHeight()>0 ? indicator.getTop() : -1;
        int y=SLPillPosition.top(root.getHeight(),dockTop,indicatorTop,getMeasuredHeight(),dp(2),min);
        if (y<0) {setVisibility(INVISIBLE);return;}
        setY(y);setVisibility(VISIBLE);
    }
    private final class Magnifier extends Drawable {
        final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
        @Override public void draw(Canvas c) {
            float s=getBounds().width();float x=getBounds().left,y=getBounds().top;
            paint.setColor(0xfff5f5f5);paint.setStyle(Paint.Style.STROKE);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeWidth(Math.max(1f,s*.12f));
            c.drawCircle(x+s*.42f,y+s*.42f,s*.27f,paint);c.drawLine(x+s*.62f,y+s*.62f,x+s*.88f,y+s*.88f,paint);
        }
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);invalidateSelf();}
        @Override public void setColorFilter(ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
        @Override public int getOpacity(){return PixelFormat.TRANSLUCENT;}
    }
}
