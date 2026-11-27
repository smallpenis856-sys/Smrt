import android.view.View;
import android.widget.EditText;
import android.view.inputmethod.InputMethodManager;
public class SLDialerButtonTest {
    public static void main(String[] args) {
        View b=new View(); EditText e=new EditText(); InputMethodManager imm=new InputMethodManager(); e.context.service=imm;
        final int[] clears={0}; SLDialerButton d=new SLDialerButton(b,e,new View.OnClickListener(){public void onClick(View v){clears[0]++;}});
        check(b.description.toString().contains("Number keyboard"));
        b.click.onClick(b); check(e.type==3 && e.text.equals("business") && e.selected && e.focused && imm.restarts==1 && imm.shows==1);
        check(b.description.toString().contains("Text keyboard"));
        check(b.hold.onLongClick(b) && clears[0]==1);
        b.click.onClick(b); check(e.type==0x10001 && imm.restarts==2);
        b.click.onClick(b); d.reset(); check(e.type==0x10001 && b.description.toString().contains("Number keyboard"));
        e.context.service=null; e.text="+923001234567"; e.selected=false; b.click.onClick(b); check(e.type==3 && !e.selected); d.reset();
        System.out.println("PASS: numeric/text toggle, query preservation, native clear delegation, reset, missing IME");
    }
    static void check(boolean b){if(!b)throw new AssertionError();}
}
