package android.view;
public class View {
    public interface OnClickListener { void onClick(View v); }
    public interface OnLongClickListener { boolean onLongClick(View v); }
    public OnClickListener click; public OnLongClickListener hold; public CharSequence description;
    public void setOnClickListener(OnClickListener v) { click=v; }
    public void setOnLongClickListener(OnLongClickListener v) { hold=v; }
    public void setContentDescription(CharSequence v) { description=v; }
}
