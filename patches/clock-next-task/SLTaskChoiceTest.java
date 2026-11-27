import java.util.Arrays;
import java.util.Collections;
public final class SLTaskChoiceTest {
    static SLTaskChoice.Item task(String name, String date, String time, int type, boolean done) { return new SLTaskChoice.Item(name,date,time,type,done); }
    public static void main(String[] args) {
        SLTaskChoice.Item a = task("later", "2026-11-29", "", 2, false);
        SLTaskChoice.Item b = task("today", "2026-11-27", "14:30", 2, false);
        SLTaskChoice.Item c = task("earlier", "2026-11-27", "09:00", 2, false);
        SLTaskChoice.Item noTime = task("untimed", "2026-11-27", "", 2, false);
        assert SLTaskChoice.select(Arrays.asList(a,b,c,noTime, task("overdue", "2026-11-26", "",2,false), task("done", "2026-11-27", "00:01",2,true), task("event", "2026-11-27", "00:00",1,false), task("bad", "invalid", "",2,false)),"2026-11-27") == c;
        assert SLTaskChoice.select(Arrays.asList(a,noTime,b),"2026-11-27") == b;
        assert SLTaskChoice.select(Arrays.asList(a,b),"2026-11-28") == a;
        assert SLTaskChoice.select(Collections.singletonList(c),"2026-11-28") == null;
        assert SLTaskChoice.select(Collections.singletonList(task(" ", "2026-11-29", "",2,false)),"2026-11-27") == null;
        System.out.println("PASS: upcoming task selection, dates, completed tasks, events, time and empty state");
    }
}
