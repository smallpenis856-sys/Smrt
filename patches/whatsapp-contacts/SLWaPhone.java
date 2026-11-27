/** Accept only explicit international phone numbers, with common formatting. */
public final class SLWaPhone {
    private SLWaPhone() { }
    public static boolean plainNumber(String value) {
        if (value == null || value.trim().isEmpty()) return false;
        String s = value.trim();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c >= '0' && c <= '9') continue;
            if (c == '+' && i == 0) continue;
            if (c != ' ' && c != '-' && c != '(' && c != ')' && c != '.') return false;
        }
        return true;
    }
    public static String digits(String value) {
        if (value == null) return null;
        String s = value.trim();
        if (!s.startsWith("+")) return null;
        StringBuilder digits = new StringBuilder();
        for (int i = 1; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c >= '0' && c <= '9') digits.append(c);
            else if (c != ' ' && c != '-' && c != '(' && c != ')' && c != '.') return null;
        }
        if (digits.length() < 7 || digits.length() > 15 || digits.charAt(0) == '0') return null;
        return digits.toString();
    }
}
