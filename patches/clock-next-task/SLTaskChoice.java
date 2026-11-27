import java.util.List;

/** Read-only selection from the launcher agenda's date-keyed tasks. */
public final class SLTaskChoice {
    public static final class Item {
        public final String title, date, time;
        public final int type;
        public final boolean completed;
        public Item(String title, String date, String time, int type, boolean completed) {
            this.title = title; this.date = date; this.time = time;
            this.type = type; this.completed = completed;
        }
    }
    public static Item select(List<Item> items, String today) {
        Item best = null;
        for (Item item : items) {
            if (item == null || item.type != 2 || item.completed || item.title == null || item.title.trim().isEmpty()
                    || item.date == null || !item.date.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}")
                    || item.date.compareTo(today) < 0) continue;
            if (best == null || compare(item, best) < 0) best = item;
        }
        return best;
    }
    private static int compare(Item a, Item b) {
        int date = a.date.compareTo(b.date);
        if (date != 0) return date;
        return timeKey(a.time).compareTo(timeKey(b.time));
    }
    private static String timeKey(String time) {
        return time != null && time.matches("(?:[01][0-9]|2[0-3]):[0-5][0-9]") ? time : "99:99";
    }
}
