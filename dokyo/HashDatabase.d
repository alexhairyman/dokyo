module dokyo.HashDatabase;

private import dokyo.capi.tchdb;
private import tango.stdc.stringz;

class HashDatabase
{
    /* Tokyo Cabinet Hash Database */
    private TCHDB *hdb = null;

    this(char[] filename)
    {
        hdb = tchdbnew();

        int ecode;
        if(!tchdbopen(hdb, &filename[0], HDBOWRITER | HDBOCREAT)) {
            ecode = tchdbecode(hdb);
        }
    }

    ~this()
    {
        reset();
    }

    public char[] get(char[] key)
    {
        char *value = tchdbget2(hdb, &key[0]);

        int ecode;
        if (value)
        {
            // actually I don't know how Tokyo Cabinet
            // behaves with allocated values
            return fromStringz(value);
        }
        else
        {
            ecode = tchdbecode(hdb);
        }
    }

    public int set(char[] key, char[] value)
    {
        if (!tchdbput2(hdb, &key[0], &value[0]))
        {
            return tchdbecode(hdb);
        }
        else
        {
            return 0;
        }
    }

    private final HashDatabase reset()
    {
        tchdbdel(hdb);
        hdb = null;
        return this;
    }

    public final HashDatabase clear()
    {
        tchdbvanish(hdb);
        return this;
    }

    public final int size()
    {
        return tchdbrnum(hdb);
    }
}
