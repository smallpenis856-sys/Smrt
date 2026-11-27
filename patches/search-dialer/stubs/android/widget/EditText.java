package android.widget;
import android.content.Context;
import android.view.View;
public class EditText extends View {
    public int type = 0x10001; public String text="business"; public boolean selected, focused;
    public Context context = new Context();
    public int getInputType(){return type;}
    public void setRawInputType(int t){type=t;}
    public int length(){return text.length();}
    public CharSequence getText(){return text;}
    public void selectAll(){selected=true;}
    public boolean requestFocus(){focused=true;return true;}
    public Context getContext(){return context;}
}
