public final class SLSearchFallbackTest {
    private static void eq(int expected, String name, String query) {
        int got = SLSearchFallback.score(name, query);
        if (got != expected) throw new AssertionError(name + " / " + query + ": " + got + " expected " + expected);
    }
    public static void main(String[] args) {
        eq(7, "José García", "jose");
        eq(7, "Cafe\u0301", "café");
        eq(5, "Google Maps", "map goo");
        eq(5, "Alpha Alphabet", "al alp");
        eq(-1, "Alpha", "alpha alpha");
        eq(-1, "Alpha Beta", "a be");
        eq(3, "Settings", "settigns");
        eq(3, "Camera", "camrea");
        eq(3, "Camera", "xamera");
        eq(-1, "Camera", "xamxra");
        eq(-1, "Camera", "camx");
        eq(-1, "1234567", "1234568");
        eq(3, "Calendar", "caledar");
        eq(3, "Calendar", "calendaar");
        eq(7, "लखनऊ", "लखन");
        eq(-1, "Contacts", "");
        eq(-1, "Contacts", "co");
        eq(-1, null, "name");
        eq(-1, "x", new String(new char[129]).replace('\0', 'x'));
        System.out.println("PASS: Unicode, multiword, typo boundaries, digits and input limits");
    }
}
