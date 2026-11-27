public final class SLWaPhoneTest {
    public static void main(String[] args) {
        check("923001234567", "+92 (300) 123-4567");
        check("15551234567", "+1 555 123 4567");
        check(null, null); check(null, "03001234567"); check(null, "+03001234567");
        check(null, "+123456"); check(null, "+1234567890123456");
        check(null, "+923001234567 ext 12"); check(null, "+123;456789");
        check(null, "+123*456789"); check(null, "+123456789+999");
        if (!SLWaPhone.plainNumber("0300 123 4567") || !SLWaPhone.plainNumber("+1 (555) 123-4567")) throw new AssertionError("valid local formatting");
        if (SLWaPhone.plainNumber("0300-123-4567 ext 12") || SLWaPhone.plainNumber("+123;1234567")) throw new AssertionError("extension must not be guessed");
        System.out.println("PASS: international numbers, separators, length bounds and ambiguous input");
    }
    private static void check(String expected, String raw) {
        String actual = SLWaPhone.digits(raw);
        if (expected == null ? actual != null : !expected.equals(actual)) throw new AssertionError(raw + " => " + actual);
    }
}
