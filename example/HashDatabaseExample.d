/*
 * Example of using dokyo.HashDatabase class to
 * perform common tasks with Tokyo Cabinet
 * Hash Database.
 *
 * Also used as test suite, sorry guys.
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
    assert(db.size() == 0);
    Stdout.formatln("db is empty");

    // get() non-existent key
    assert(db["foo"] == null);
    assert(db.get("foo") == null);
    Stdout.formatln("db[\"{}\"] is {}", "foo", "null");

    // set() once
    db["foo"] = "bar";
    assert(db["foo"] == "bar");
    assert(db.get("foo") == "bar");
    assert(db.size() == 1);
    Stdout.formatln("db[\"{}\"] is {}", "foo", db["foo"]);
    Stdout.formatln("db size is {}", db.size());

    // set() again
    db.set("bar", "baz");
    assert(db["bar"] == "baz");
    assert(db.get("bar") == "baz");
    assert(db.size() == 2);
    Stdout.formatln("db[\"{}\"] is {}", "bar", db["bar"]);
    Stdout.formatln("db size is {}", db.size());

    // remove()
    db.remove("bar");
    assert(db["bar"] == null);
    assert(db.get("bar") == null);
    assert(db.size() == 1);
    Stdout.formatln("db[\"{}\"] is {}", "bar", "null");
    Stdout.formatln("db size is {}", db.size());

    delete db;
}
