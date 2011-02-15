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
  * Unstable, undocumented, untested, but useful.
  *
  * TODO:
  *   1) foreach support
  *   2) more container methods like HashMap
  *   3) iterators
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
        if (!tchdbclose(hdb))
        {
            int ecode = tchdbecode(hdb);
            throw new PlatformException(getError(ecode));
        }
        tchdbdel(hdb);
        hdb = null;
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

        char[] value = fromStringz(zvalue);
        delete zvalue;
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

    /**
      * Remove anything from database.
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
}
