public final class SLPillPositionTest {
    static void eq(int a,int b){if(a!=b)throw new AssertionError(a+" != "+b);}
    public static void main(String[] args){
        eq(SLPillPosition.top(1000,850,800,48,2,56),750);
        eq(SLPillPosition.top(1000,850,-1,48,2,56),800);
        eq(SLPillPosition.top(1000,0,800,48,2,56),750);
        eq(SLPillPosition.top(1000,0,-1,48,2,56),-1);
        eq(SLPillPosition.top(1000,100,-1,48,2,56),-1);
        eq(SLPillPosition.top(0,850,800,48,2,56),-1);
        eq(SLPillPosition.top(1000,850,800,0,2,56),-1);
        System.out.println("PASS: dynamic dock/indicator position, invalid layout and safe bounds");
    }
}
