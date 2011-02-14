import dokyo.HashDatabase;
import tango.io.Stdout;

int main(char[][] argv)
{
    HashDatabase db = new HashDatabase("test.tch");

    db.set("a", "b");
    Stdout.formatln("{}:{}", "a", db.get("a"));
    Stdout.formatln("size before clear(): {}", db.size());

    db.clear();
    Stdout.formatln("size after clear(): {}", db.size());

    delete db;

    return 0;
}
