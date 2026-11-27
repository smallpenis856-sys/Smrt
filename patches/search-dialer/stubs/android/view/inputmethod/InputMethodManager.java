package android.view.inputmethod;
import android.view.View;
public class InputMethodManager {
    public static final int SHOW_IMPLICIT=1;
    public int restarts, shows;
    public void restartInput(View view){restarts++;}
    public boolean showSoftInput(View view,int flags){shows++;return true;}
}
