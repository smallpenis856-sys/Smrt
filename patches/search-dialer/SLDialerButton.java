import android.content.Context;
import android.text.InputType;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;

/** Switch only the search editor's IME mode; preserve its normal clear callback. */
public final class SLDialerButton implements View.OnClickListener, View.OnLongClickListener {
    private final View button;
    private final EditText editor;
    private final View.OnClickListener clear;
    private final int originalType;
    private boolean numeric;

    public SLDialerButton(View button, EditText editor, View.OnClickListener clear) {
        this.button = button; this.editor = editor; this.clear = clear;
        originalType = editor.getInputType();
        button.setOnClickListener(this);
        button.setOnLongClickListener(this);
        updateLabel();
    }
    @Override public void onClick(View v) {
        numeric = !numeric;
        editor.setRawInputType(numeric ? InputType.TYPE_CLASS_PHONE : originalType);
        if (numeric) {
            CharSequence text = editor.getText();
            for (int i = 0; i < text.length(); i++) {
                if (Character.isLetter(text.charAt(i))) { editor.selectAll(); break; }
            }
        }
        editor.requestFocus();
        updateLabel();
        InputMethodManager imm = (InputMethodManager) editor.getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
        if (imm != null) {
            imm.restartInput(editor);
            imm.showSoftInput(editor, InputMethodManager.SHOW_IMPLICIT);
        }
    }
    @Override public boolean onLongClick(View v) {
        clear.onClick(v);
        return true;
    }
    public void reset() {
        if (numeric) { numeric = false; editor.setRawInputType(originalType); updateLabel(); }
    }
    private void updateLabel() {
        button.setContentDescription(numeric ? "Text keyboard; touch and hold to clear search" : "Number keyboard; touch and hold to clear search");
    }
}
