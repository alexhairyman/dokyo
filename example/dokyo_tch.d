import dokyo.capi.tchdb;

int main(char[][] argv)
{
    TCHDB *hdb;
    int ecode;
    char *key;
    char *value;

    /* create the object */
    hdb = tchdbnew();
    /* open the database */
    if(!tchdbopen(hdb, "casket.hdb", HDBOWRITER | HDBOCREAT)){
        ecode = tchdbecode(hdb);
    }

    /* store records */
    if(!tchdbput2(hdb, "foo", "hop") ||
            !tchdbput2(hdb, "bar", "step") ||
            !tchdbput2(hdb, "baz", "jump")){
        ecode = tchdbecode(hdb);
    }

    /* retrieve records */
    value = tchdbget2(hdb, "foo");
    if(value){
    } else {
        ecode = tchdbecode(hdb);
    }

    /* traverse records */
    tchdbiterinit(hdb);
    while((key = tchdbiternext2(hdb)) != null){
        value = tchdbget2(hdb, key);
        if(value){
        }
    }

    /* close the database */
    if(!tchdbclose(hdb)){
        ecode = tchdbecode(hdb);
    }

    /* delete the object */
    tchdbdel(hdb);

    return 0;
}
