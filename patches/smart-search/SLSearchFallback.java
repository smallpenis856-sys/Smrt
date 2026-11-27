import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/** Additional local name matching, only used after the native matcher has no result. */
public final class SLSearchFallback {
    private SLSearchFallback() { }

    // Native callers filter scores <= 0; the native scorer returns much larger scores
    // for literal matches. Keep these conservative, below native literal matches.
    public static int score(String label, String query) {
        if (label == null || query == null || label.length() > 256 || query.length() > 128) return -1;
        List<String> names = tokens(label);
        List<String> terms = tokens(query);
        if (names.isEmpty() || terms.isEmpty() || names.size() > 32 || terms.size() > 8) return -1;
        if (terms.size() > 1) {
            boolean[] used = new boolean[names.size()];
            // Match longer prefixes first, so a short prefix cannot consume a needed word.
            for (int i = 1; i < terms.size(); i++) {
                String item = terms.get(i);
                int j = i;
                while (j > 0 && terms.get(j - 1).length() < item.length()) {
                    terms.set(j, terms.get(j - 1));
                    j--;
                }
                terms.set(j, item);
            }
            for (String term : terms) {
                if (term.length() < 2) return -1;
                int match = -1;
                for (int i = 0; i < names.size(); i++) {
                    if (!used[i] && names.get(i).startsWith(term)) { match = i; break; }
                }
                if (match < 0) return -1;
                used[match] = true;
            }
            return 5;
        }
        String term = terms.get(0);
        if (term.length() < 3) return -1;
        for (String name : names) {
            if (name.startsWith(term)) return 7;
        }
        if (term.length() < 5 || term.length() > 32 || !lettersOnly(term)) return -1;
        for (String name : names) {
            if (!lettersOnly(name)) continue;
            // Permit one edit against the beginning of a word; never guess for numbers.
            int min = Math.max(1, term.length() - 1);
            int max = Math.min(name.length(), term.length() + 1);
            for (int len = min; len <= max; len++) {
                if (oneEdit(term, name.substring(0, len))) return 3;
            }
        }
        return -1;
    }

    private static boolean lettersOnly(String s) {
        for (int i = 0; i < s.length(); i++) if (!Character.isLetter(s.charAt(i))) return false;
        return true;
    }

    // Distance of exactly one insertion, deletion, substitution, or adjacent swap.
    private static boolean oneEdit(String a, String b) {
        int la = a.length(), lb = b.length();
        if (Math.abs(la - lb) > 1) return false;
        int i = 0;
        while (i < la && i < lb && a.charAt(i) == b.charAt(i)) i++;
        if (i == la && i == lb) return false;
        if (la == lb && i + 1 < la && a.charAt(i) == b.charAt(i + 1)
                && a.charAt(i + 1) == b.charAt(i)) return a.regionMatches(i + 2, b, i + 2, la - i - 2);
        if (la == lb) return a.regionMatches(i + 1, b, i + 1, la - i - 1);
        if (la > lb) return a.regionMatches(i + 1, b, i, lb - i);
        return a.regionMatches(i, b, i + 1, la - i);
    }

    private static List<String> tokens(String input) {
        String normalized = Normalizer.normalize(input.toLowerCase(Locale.ROOT), Normalizer.Form.NFD);
        List<String> result = new ArrayList<>();
        StringBuilder token = new StringBuilder();
        boolean previousLatin = false;
        for (int i = 0; i < normalized.length();) {
            int cp = normalized.codePointAt(i);
            i += Character.charCount(cp);
            int type = Character.getType(cp);
            if (type == Character.NON_SPACING_MARK || type == Character.COMBINING_SPACING_MARK || type == Character.ENCLOSING_MARK) {
                // Only fold Latin accents; marks in other scripts can change meaning.
                if (!previousLatin && token.length() > 0) token.appendCodePoint(cp);
                continue;
            }
            if (Character.isLetterOrDigit(cp)) {
                token.appendCodePoint(cp);
                previousLatin = Character.UnicodeScript.of(cp) == Character.UnicodeScript.LATIN;
            } else {
                if (token.length() > 0) { result.add(token.toString()); token.setLength(0); }
                previousLatin = false;
            }
        }
        if (token.length() > 0) result.add(token.toString());
        return result;
    }
}
