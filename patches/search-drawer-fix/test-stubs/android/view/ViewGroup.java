package android.view;
import java.util.*;
public class ViewGroup extends View {
    public final ArrayList<View> children=new ArrayList<>();
    public final ViewTreeObserver observer=new ViewTreeObserver();
    public int getChildCount(){return children.size();}
    public View getChildAt(int i){return children.get(i);}
    public ViewTreeObserver getViewTreeObserver(){return observer;}
}
