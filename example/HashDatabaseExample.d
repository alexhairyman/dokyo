/*
 * Example of using dokyo.HashDatabase class to
 * perform common tasks with Tokyo Cabinet
 * Hash Database.
 */

module dokyo.HashDatabaseExample;

import dokyo.HashDatabase;
import tango.io.Stdout;

void main()
{
    auto db = new HashDatabase("test.tch");

    // clear() for fair testing
    db.clear();
    Stdout.formatln("db is cleaned up");

    // size()
    Stdout.formatln("db is empty");

    // get() non-existent key
    Stdout.formatln("db[\"{}\"] is {}", "foo", "null");

    // set() once
    db["foo"] = "bar";
    Stdout.formatln("db[\"{}\"] is {}", "foo", db["foo"]);
    Stdout.formatln("db size is {}", db.size());

    // set() again
    db.set("bar", "baz");
    Stdout.formatln("db[\"{}\"] is {}", "bar", db["bar"]);
    Stdout.formatln("db size is {}", db.size());

    // foreach
    foreach (key; db)
    {
        Stdout.formatln("foreach(k): \"{}\"", key);
    }

    // double foreach
    foreach (key, value; db)
    {
        Stdout.formatln("foreach(k, v): \"{}\" is \"{}\"", key, value);
    }

    // remove()
    db.remove("bar");
    Stdout.formatln("db[\"{}\"] is {}", "bar", "null");
    Stdout.formatln("db size is {}", db.size());

    delete db;
}
