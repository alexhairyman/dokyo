module dokyo.HashDatabase;

private import tango.stdc.stringz;
private import tango.core.Exception :
    PlatformException;

private import dokyo.capi.tchdb;
private import dokyo.capi.tcutil;

/**
  * Object-Oriented Wrapper for Tokyo Cabinet
  * Hash Database API.
  *
  * Unstable, well-documented, unit-tested and useful.
  */
class HashDatabase
{
    /* Tokyo Cabinet Hash Database */
    private TCHDB *hdb = null;

    /**
      * Create a new instance of HashDatabase, which will
      * open database in specified filename
      * with defined mode (default: read/write + create).
      */
    this(char[] filename, int mode = HDBOWRITER | HDBOCREAT)
    {
        hdb = tchdbnew();

        char *zfilename = toStringz(filename);
        if (!tchdbopen(hdb, zfilename, mode)) {
            int ecode = tchdbecode(hdb);
            throw new PlatformException(getError(ecode));
        }
        delete zfilename;
    }

    ~this()
    {
        try
        {
            close();
        }
        finally
        {
            tchdbdel(hdb);
            hdb = null;
        }
    }

    /**
      * Retrieve some record from database by defined key.
      * Returns null if there is no record and throws
      * PlatformException at any other error.
      */
    final char[] get(char[] key)
    {
        char *zkey = toStringz(key);
        char *zvalue = tchdbget2(hdb, zkey);
        delete zkey;

        if (!zvalue)
        {
            int ecode = tchdbecode(hdb);
            switch (ecode)
            {
                case TCENOREC: return null;
                default:
                {
                    char[] errmsg = getError(ecode);
                    throw new PlatformException(errmsg);
                }
            }
        }

        char[] value = fromStringz(zvalue).dup;
        tcfree(zvalue);
        return value;
    }

    alias get opIndex;

    /**
      * Store value in database with defined key. Always
      * returns true. When error occurs, throws
      * PlatformException.
      */
    final bool set(char[] key, char[] value)
    {
        char *zkey = toStringz(key);
        char *zvalue = toStringz(value);

        bool success = tchdbput2(hdb, zkey, zvalue);
        delete zkey;
        delete zvalue;

        if (!success)
        {
            int ecode = tchdbecode(hdb);
            throw new PlatformException(getError(ecode));
        }

        return true;
    }

    final bool opIndexAssign(char[] value, char[] key)
    {
        return set(key, value);
    }

    int opApply(int delegate(ref char[] key) dg)
    {
        tchdbiterinit(hdb);
        char *zkey;
        while ((zkey = tchdbiternext2(hdb)) != null)
        {
            try
            {
                char[] key = fromStringz(zkey).dup;

                int result = dg(key);
                if (result != 0)
                {
                    tcfree(zkey);
                    zkey = null;
                    return result;
                }
            }
            finally { tcfree(zkey); }
        }

        return 0;
    }

    int opApply(int delegate(ref char[] key, ref char[] value) dg)
    {
        tchdbiterinit(hdb);
        char *zkey;
        while ((zkey = tchdbiternext2(hdb)) != null)
        {
            try
            {
                char *zvalue = tchdbget2(hdb, zkey);
                if (zvalue)
                {
                    char[] key = fromStringz(zkey).dup;
                    char[] value = fromStringz(zvalue).dup;
                    tcfree(zvalue);
                    zvalue = null;

                    int result = dg(key, value);
                    if (result != 0)
                    {
                        tcfree(zkey);
                        zkey = null;
                        return result;
                    }
                }
                else
                {
                    int ecode = tchdbecode(hdb);
                    char[] errmsg = getError(ecode);
                    throw new PlatformException(errmsg);
                }
            }
            finally { tcfree(zkey); }
        }

        return 0;
    }

    /**
      * Remove record by specified key. Always returns
      * true. When error occurs, throws
      * PlatformException.
      */
    final bool remove(char[] key)
    {
        char *zkey = toStringz(key);
        bool success = tchdbout2(hdb, zkey);
        delete zkey;

        if (!success)
        {
            int ecode = tchdbecode(hdb);
            throw new PlatformException(getError(ecode));
        }

        return true;
    }

    /**
      * Remove everything from database.
      */
    final HashDatabase clear()
    {
        tchdbvanish(hdb);
        return this;
    }

    /**
      * Number of records, stored in this database.
      */
    final size_t size()
    {
        return tchdbrnum(hdb);
    }

    /**
      * Close the database.
      */
    private final void close()
    {
        if (!tchdbclose(hdb))
        {
            int ecode = tchdbecode(hdb);
            throw new PlatformException(getError(ecode));
        }
    }

    /**
      * Read an error message description from specified
      * error code and convert into string.
      */
    private char[] getError(int ecode)
    {
        char *zerrmsg = tchdberrmsg(ecode);
        char[] errmsg = fromStringz(zerrmsg);
        delete zerrmsg;
        return errmsg;
    }

    unittest
    {
        void main()
        {
            auto db = new HashDatabase("test.tch");
            db.clear();
            assert(db.size() == 0);

            assert(db["foo"] == null);
            assert(db.get("foo") == null);

            db["foo"] = "bar";
            assert(db["foo"] == "bar");
            assert(db.get("foo") == "bar");
            assert(db.size() == 1);

            db.set("bar", "baz");
            assert(db["bar"] == "baz");
            assert(db.get("bar") == "baz");
            assert(db.size() == 2);

            foreach (k; db)
            {
                assert(k == "foo" || k == "bar");
            }

            foreach (k, v; db)
            {
                assert((k == "foo" && v == "bar") ||
                       (k == "bar" && v == "baz"));
            }

            db.remove("bar");
            assert(db["bar"] == null);
            assert(db.get("bar") == null);
            assert(db.size() == 1);

            delete db;
        }
    }
}
