package android.content;
public class Context {
    public static final String INPUT_METHOD_SERVICE="input_method";
    public Object service;
    public Object getSystemService(String name) { return service; }
}
