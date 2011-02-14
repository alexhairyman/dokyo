/* Converted to D from tctdb.h by htod */
module tctdb;
/*************************************************************************************************
 * The table database API of Tokyo Cabinet
 *                                                               Copyright (C) 2006-2010 FAL Labs
 * This file is part of Tokyo Cabinet.
 * Tokyo Cabinet is free software; you can redistribute it and/or modify it under the terms of
 * the GNU Lesser General Public License as published by the Free Software Foundation; either
 * version 2.1 of the License or any later version.  Tokyo Cabinet is distributed in the hope
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
 * License for more details.
 * You should have received a copy of the GNU Lesser General Public License along with Tokyo
 * Cabinet; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA 02111-1307 USA.
 *************************************************************************************************/


//C     #ifndef _TCTDB_H                         /* duplication check */
//C     #define _TCTDB_H

//C     #if defined(__cplusplus)
//C     #define __TCTDB_CLINKAGEBEGIN extern "C" {
//C     #define __TCTDB_CLINKAGEEND }
//C     #else
//C     #define __TCTDB_CLINKAGEBEGIN
//C     #define __TCTDB_CLINKAGEEND
//C     #endif
//C     __TCTDB_CLINKAGEBEGIN


//C     #include <tcutil.h>
import std.c.tcutil;
//C     #include <tchdb.h>
import std.c.tchdb;
//C     #include <tcbdb.h>
import std.c.tcbdb;



/*************************************************************************************************
 * API
 *************************************************************************************************/


//C     typedef struct {                         /* type of structure for a column index */
//C       char *name;                            /* column name */
//C       int type;                              /* data type */
//C       void *db;                              /* internal database object */
//C       void *cc;                              /* internal cache object */
//C     } TDBIDX;
struct _N30
{
    char *name;
    int type;
    void *db;
    void *cc;
}
extern (C):
alias _N30 TDBIDX;

//C     typedef struct {                         /* type of structure for a table database */
//C       void *mmtx;                            /* mutex for method */
//C       TCHDB *hdb;                            /* internal database object */
//C       bool open;                             /* whether the internal database is opened */
//C       bool wmode;                            /* whether to be writable */
//C       uint8_t opts;                          /* options */
//C       int32_t lcnum;                         /* max number of cached leaves */
//C       int32_t ncnum;                         /* max number of cached nodes */
//C       int64_t iccmax;                        /* maximum size of the inverted cache */
//C       double iccsync;                        /* synchronization ratio of the inverted cache */
//C       TDBIDX *idxs;                          /* column indices */
//C       int inum;                              /* number of column indices */
//C       bool tran;                             /* whether in the transaction */
//C     } TCTDB;
struct _N31
{
    void *mmtx;
    TCHDB *hdb;
    bool open;
    bool wmode;
    uint8_t opts;
    int32_t lcnum;
    int32_t ncnum;
    int64_t iccmax;
    double iccsync;
    TDBIDX *idxs;
    int inum;
    bool tran;
}
alias _N31 TCTDB;

//C     enum {                                   /* enumeration for additional flags */
//C       TDBFOPEN = HDBFOPEN,                   /* whether opened */
//C       TDBFFATAL = HDBFFATAL                  /* whether with fatal error */
//C     };
enum
{
    TDBFOPEN = 1,
    TDBFFATAL,
}

//C     enum {                                   /* enumeration for tuning options */
//C       TDBTLARGE = 1 << 0,                    /* use 64-bit bucket array */
//C       TDBTDEFLATE = 1 << 1,                  /* compress each page with Deflate */
//C       TDBTBZIP = 1 << 2,                     /* compress each record with BZIP2 */
//C       TDBTTCBS = 1 << 3,                     /* compress each page with TCBS */
//C       TDBTEXCODEC = 1 << 4                   /* compress each record with outer functions */
//C     };
enum
{
    TDBTLARGE = 1,
    TDBTDEFLATE,
    TDBTBZIP = 4,
    TDBTTCBS = 8,
    TDBTEXCODEC = 16,
}

//C     enum {                                   /* enumeration for open modes */
//C       TDBOREADER = 1 << 0,                   /* open as a reader */
//C       TDBOWRITER = 1 << 1,                   /* open as a writer */
//C       TDBOCREAT = 1 << 2,                    /* writer creating */
//C       TDBOTRUNC = 1 << 3,                    /* writer truncating */
//C       TDBONOLCK = 1 << 4,                    /* open without locking */
//C       TDBOLCKNB = 1 << 5,                    /* lock without blocking */
//C       TDBOTSYNC = 1 << 6                     /* synchronize every transaction */
//C     };
enum
{
    TDBOREADER = 1,
    TDBOWRITER,
    TDBOCREAT = 4,
    TDBOTRUNC = 8,
    TDBONOLCK = 16,
    TDBOLCKNB = 32,
    TDBOTSYNC = 64,
}

//C     enum {                                   /* enumeration for index types */
//C       TDBITLEXICAL,                          /* lexical string */
//C       TDBITDECIMAL,                          /* decimal string */
//C       TDBITTOKEN,                            /* token inverted index */
//C       TDBITQGRAM,                            /* q-gram inverted index */
//C       TDBITOPT = 9998,                       /* optimize */
//C       TDBITVOID = 9999,                      /* void */
//C       TDBITKEEP = 1 << 24                    /* keep existing index */
//C     };
enum
{
    TDBITLEXICAL,
    TDBITDECIMAL,
    TDBITTOKEN,
    TDBITQGRAM,
    TDBITOPT = 9998,
    TDBITVOID,
    TDBITKEEP = 16777216,
}

//C     typedef struct {                         /* type of structure for a condition */
//C       char *name;                            /* column name */
//C       int nsiz;                              /* size of the column name */
//C       int op;                                /* operation type */
//C       bool sign;                             /* positive sign */
//C       bool noidx;                            /* no index flag */
//C       char *expr;                            /* operand expression */
//C       int esiz;                              /* size of the operand expression */
//C       void *regex;                           /* regular expression object */
//C       void *ftsunits;                        /* full-text search units */
//C       int ftsnum;                            /* number of full-text search units */
//C       bool alive;                            /* alive flag */
//C     } TDBCOND;
struct _N36
{
    char *name;
    int nsiz;
    int op;
    bool sign;
    bool noidx;
    char *expr;
    int esiz;
    void *regex;
    void *ftsunits;
    int ftsnum;
    bool alive;
}
alias _N36 TDBCOND;

//C     typedef struct {                         /* type of structure for a query */
//C       TCTDB *tdb;                            /* database object */
//C       TDBCOND *conds;                        /* condition objects */
//C       int cnum;                              /* number of conditions */
//C       char *oname;                           /* column name for ordering */
//C       int otype;                             /* type of order */
//C       int max;                               /* max number of retrieval */
//C       int skip;                              /* skipping number of retrieval */
//C       TCXSTR *hint;                          /* hint string */
//C       int count;                             /* count of corresponding records */
//C     } TDBQRY;
struct _N37
{
    TCTDB *tdb;
    TDBCOND *conds;
    int cnum;
    char *oname;
    int otype;
    int max;
    int skip;
    TCXSTR *hint;
    int count;
}
alias _N37 TDBQRY;

//C     enum {                                   /* enumeration for query conditions */
//C       TDBQCSTREQ,                            /* string is equal to */
//C       TDBQCSTRINC,                           /* string is included in */
//C       TDBQCSTRBW,                            /* string begins with */
//C       TDBQCSTREW,                            /* string ends with */
//C       TDBQCSTRAND,                           /* string includes all tokens in */
//C       TDBQCSTROR,                            /* string includes at least one token in */
//C       TDBQCSTROREQ,                          /* string is equal to at least one token in */
//C       TDBQCSTRRX,                            /* string matches regular expressions of */
//C       TDBQCNUMEQ,                            /* number is equal to */
//C       TDBQCNUMGT,                            /* number is greater than */
//C       TDBQCNUMGE,                            /* number is greater than or equal to */
//C       TDBQCNUMLT,                            /* number is less than */
//C       TDBQCNUMLE,                            /* number is less than or equal to */
//C       TDBQCNUMBT,                            /* number is between two tokens of */
//C       TDBQCNUMOREQ,                          /* number is equal to at least one token in */
//C       TDBQCFTSPH,                            /* full-text search with the phrase of */
//C       TDBQCFTSAND,                           /* full-text search with all tokens in */
//C       TDBQCFTSOR,                            /* full-text search with at least one token in */
//C       TDBQCFTSEX,                            /* full-text search with the compound expression of */
//C       TDBQCNEGATE = 1 << 24,                 /* negation flag */
//C       TDBQCNOIDX = 1 << 25                   /* no index flag */
//C     };
enum
{
    TDBQCSTREQ,
    TDBQCSTRINC,
    TDBQCSTRBW,
    TDBQCSTREW,
    TDBQCSTRAND,
    TDBQCSTROR,
    TDBQCSTROREQ,
    TDBQCSTRRX,
    TDBQCNUMEQ,
    TDBQCNUMGT,
    TDBQCNUMGE,
    TDBQCNUMLT,
    TDBQCNUMLE,
    TDBQCNUMBT,
    TDBQCNUMOREQ,
    TDBQCFTSPH,
    TDBQCFTSAND,
    TDBQCFTSOR,
    TDBQCFTSEX,
    TDBQCNEGATE = 16777216,
    TDBQCNOIDX = 33554432,
}

//C     enum {                                   /* enumeration for order types */
//C       TDBQOSTRASC,                           /* string ascending */
//C       TDBQOSTRDESC,                          /* string descending */
//C       TDBQONUMASC,                           /* number ascending */
//C       TDBQONUMDESC                           /* number descending */
//C     };
enum
{
    TDBQOSTRASC,
    TDBQOSTRDESC,
    TDBQONUMASC,
    TDBQONUMDESC,
}

//C     enum {                                   /* enumeration for set operation types */
//C       TDBMSUNION,                            /* union */
//C       TDBMSISECT,                            /* intersection */
//C       TDBMSDIFF                              /* difference */
//C     };
enum
{
    TDBMSUNION,
    TDBMSISECT,
    TDBMSDIFF,
}

//C     enum {                                   /* enumeration for post treatments */
//C       TDBQPPUT = 1 << 0,                     /* modify the record */
//C       TDBQPOUT = 1 << 1,                     /* remove the record */
//C       TDBQPSTOP = 1 << 24                    /* stop the iteration */
//C     };
enum
{
    TDBQPPUT = 1,
    TDBQPOUT,
    TDBQPSTOP = 16777216,
}

/* type of the pointer to a iterator function for each table record.
   `pkbuf' specifies the pointer to the region of the primary key.
   `pksiz' specifies the size of the region of the primary key.
   `cols' specifies a map object containing columns.
   `op' specifies the pointer to the optional opaque object.
   The return value is flags of the post treatment by bitwise-or: `TDBQPPUT' to modify the
   record, `TDBQPOUT' to remove the record, `TDBQPSTOP' to stop the iteration. */
//C     typedef int (*TDBQRYPROC)(const void *pkbuf, int pksiz, TCMAP *cols, void *op);
alias int  function(void *pkbuf, int pksiz, TCMAP *cols, void *op)TDBQRYPROC;


/* Get the message string corresponding to an error code.
   `ecode' specifies the error code.
   The return value is the message string of the error code. */
//C     const char *tctdberrmsg(int ecode);
char * tctdberrmsg(int ecode);


/* Create a table database object.
   The return value is the new table database object. */
//C     TCTDB *tctdbnew(void);
TCTDB * tctdbnew();


/* Delete a table database object.
   `tdb' specifies the table database object.
   If the database is not closed, it is closed implicitly.  Note that the deleted object and its
   derivatives can not be used anymore. */
//C     void tctdbdel(TCTDB *tdb);
void  tctdbdel(TCTDB *tdb);


/* Get the last happened error code of a table database object.
   `tdb' specifies the table database object.
   The return value is the last happened error code.
   The following error code is defined: `TCESUCCESS' for success, `TCETHREAD' for threading
   error, `TCEINVALID' for invalid operation, `TCENOFILE' for file not found, `TCENOPERM' for no
   permission, `TCEMETA' for invalid meta data, `TCERHEAD' for invalid record header, `TCEOPEN'
   for open error, `TCECLOSE' for close error, `TCETRUNC' for trunc error, `TCESYNC' for sync
   error, `TCESTAT' for stat error, `TCESEEK' for seek error, `TCEREAD' for read error,
   `TCEWRITE' for write error, `TCEMMAP' for mmap error, `TCELOCK' for lock error, `TCEUNLINK'
   for unlink error, `TCERENAME' for rename error, `TCEMKDIR' for mkdir error, `TCERMDIR' for
   rmdir error, `TCEKEEP' for existing record, `TCENOREC' for no record found, and `TCEMISC' for
   miscellaneous error. */
//C     int tctdbecode(TCTDB *tdb);
int  tctdbecode(TCTDB *tdb);


/* Set mutual exclusion control of a table database object for threading.
   `tdb' specifies the table database object which is not opened.
   If successful, the return value is true, else, it is false.
   Note that the mutual exclusion control is needed if the object is shared by plural threads and
   this function should be called before the database is opened. */
//C     bool tctdbsetmutex(TCTDB *tdb);
bool  tctdbsetmutex(TCTDB *tdb);


/* Set the tuning parameters of a table database object.
   `tdb' specifies the table database object which is not opened.
   `bnum' specifies the number of elements of the bucket array.  If it is not more than 0, the
   default value is specified.  The default value is 131071.  Suggested size of the bucket array
   is about from 0.5 to 4 times of the number of all records to be stored.
   `apow' specifies the size of record alignment by power of 2.  If it is negative, the default
   value is specified.  The default value is 4 standing for 2^4=16.
   `fpow' specifies the maximum number of elements of the free block pool by power of 2.  If it
   is negative, the default value is specified.  The default value is 10 standing for 2^10=1024.
   `opts' specifies options by bitwise-or: `TDBTLARGE' specifies that the size of the database
   can be larger than 2GB by using 64-bit bucket array, `TDBTDEFLATE' specifies that each record
   is compressed with Deflate encoding, `TDBTBZIP' specifies that each record is compressed with
   BZIP2 encoding, `TDBTTCBS' specifies that each record is compressed with TCBS encoding.
   If successful, the return value is true, else, it is false.
   Note that the tuning parameters should be set before the database is opened. */
//C     bool tctdbtune(TCTDB *tdb, int64_t bnum, int8_t apow, int8_t fpow, uint8_t opts);
bool  tctdbtune(TCTDB *tdb, int64_t bnum, int8_t apow, int8_t fpow, uint8_t opts);


/* Set the caching parameters of a table database object.
   `tdb' specifies the table database object which is not opened.
   `rcnum' specifies the maximum number of records to be cached.  If it is not more than 0, the
   record cache is disabled.  It is disabled by default.
   `lcnum' specifies the maximum number of leaf nodes to be cached.  If it is not more than 0,
   the default value is specified.  The default value is 4096.
   `ncnum' specifies the maximum number of non-leaf nodes to be cached.  If it is not more than 0,
   the default value is specified.  The default value is 512.
   If successful, the return value is true, else, it is false.
   Note that the caching parameters should be set before the database is opened.  Leaf nodes and
   non-leaf nodes are used in column indices. */
//C     bool tctdbsetcache(TCTDB *tdb, int32_t rcnum, int32_t lcnum, int32_t ncnum);
bool  tctdbsetcache(TCTDB *tdb, int32_t rcnum, int32_t lcnum, int32_t ncnum);


/* Set the size of the extra mapped memory of a table database object.
   `tdb' specifies the table database object which is not opened.
   `xmsiz' specifies the size of the extra mapped memory.  If it is not more than 0, the extra
   mapped memory is disabled.  The default size is 67108864.
   If successful, the return value is true, else, it is false.
   Note that the mapping parameters should be set before the database is opened. */
//C     bool tctdbsetxmsiz(TCTDB *tdb, int64_t xmsiz);
bool  tctdbsetxmsiz(TCTDB *tdb, int64_t xmsiz);


/* Set the unit step number of auto defragmentation of a table database object.
   `tdb' specifies the table database object which is not opened.
   `dfunit' specifie the unit step number.  If it is not more than 0, the auto defragmentation
   is disabled.  It is disabled by default.
   If successful, the return value is true, else, it is false.
   Note that the defragmentation parameters should be set before the database is opened. */
//C     bool tctdbsetdfunit(TCTDB *tdb, int32_t dfunit);
bool  tctdbsetdfunit(TCTDB *tdb, int32_t dfunit);


/* Open a database file and connect a table database object.
   `tdb' specifies the table database object which is not opened.
   `path' specifies the path of the database file.
   `omode' specifies the connection mode: `TDBOWRITER' as a writer, `TDBOREADER' as a reader.
   If the mode is `TDBOWRITER', the following may be added by bitwise-or: `TDBOCREAT', which
   means it creates a new database if not exist, `TDBOTRUNC', which means it creates a new
   database regardless if one exists, `TDBOTSYNC', which means every transaction synchronizes
   updated contents with the device.  Both of `TDBOREADER' and `TDBOWRITER' can be added to by
   bitwise-or: `TDBONOLCK', which means it opens the database file without file locking, or
   `TDBOLCKNB', which means locking is performed without blocking.
   If successful, the return value is true, else, it is false. */
//C     bool tctdbopen(TCTDB *tdb, const char *path, int omode);
bool  tctdbopen(TCTDB *tdb, char *path, int omode);


/* Close a table database object.
   `tdb' specifies the table database object.
   If successful, the return value is true, else, it is false.
   Update of a database is assured to be written when the database is closed.  If a writer opens
   a database but does not close it appropriately, the database will be broken. */
//C     bool tctdbclose(TCTDB *tdb);
bool  tctdbclose(TCTDB *tdb);


/* Store a record into a table database object.
   `tdb' specifies the table database object connected as a writer.
   `pkbuf' specifies the pointer to the region of the primary key.
   `pksiz' specifies the size of the region of the primary key.
   `cols' specifies a map object containing columns.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, it is overwritten. */
//C     bool tctdbput(TCTDB *tdb, const void *pkbuf, int pksiz, TCMAP *cols);
bool  tctdbput(TCTDB *tdb, void *pkbuf, int pksiz, TCMAP *cols);


/* Store a string record into a table database object with a zero separated column string.
   `tdb' specifies the table database object connected as a writer.
   `pkbuf' specifies the pointer to the region of the primary key.
   `pksiz' specifies the size of the region of the primary key.
   `cbuf' specifies the pointer to the region of the zero separated column string where the name
   and the value of each column are situated one after the other.
   `csiz' specifies the size of the region of the column string.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, it is overwritten. */
//C     bool tctdbput2(TCTDB *tdb, const void *pkbuf, int pksiz, const void *cbuf, int csiz);
bool  tctdbput2(TCTDB *tdb, void *pkbuf, int pksiz, void *cbuf, int csiz);


/* Store a string record into a table database object with a tab separated column string.
   `tdb' specifies the table database object connected as a writer.
   `pkstr' specifies the string of the primary key.
   `cstr' specifies the string of the the tab separated column string where the name and the
   value of each column are situated one after the other.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, it is overwritten. */
//C     bool tctdbput3(TCTDB *tdb, const char *pkstr, const char *cstr);
bool  tctdbput3(TCTDB *tdb, char *pkstr, char *cstr);


/* Store a new record into a table database object.
   `tdb' specifies the table database object connected as a writer.
   `pkbuf' specifies the pointer to the region of the primary key.
   `pksiz' specifies the size of the region of the primary key.
   `cols' specifies a map object containing columns.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, this function has no effect. */
//C     bool tctdbputkeep(TCTDB *tdb, const void *pkbuf, int pksiz, TCMAP *cols);
bool  tctdbputkeep(TCTDB *tdb, void *pkbuf, int pksiz, TCMAP *cols);


/* Store a new string record into a table database object with a zero separated column string.
   `tdb' specifies the table database object connected as a writer.
   `pkbuf' specifies the pointer to the region of the primary key.
   `pksiz' specifies the size of the region of the primary key.
   `cbuf' specifies the pointer to the region of the zero separated column string where the name
   and the value of each column are situated one after the other.
   `csiz' specifies the size of the region of the column string.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, this function has no effect. */
//C     bool tctdbputkeep2(TCTDB *tdb, const void *pkbuf, int pksiz, const void *cbuf, int csiz);
bool  tctdbputkeep2(TCTDB *tdb, void *pkbuf, int pksiz, void *cbuf, int csiz);


/* Store a new string record into a table database object with a tab separated column string.
   `tdb' specifies the table database object connected as a writer.
   `pkstr' specifies the string of the primary key.
   `cstr' specifies the string of the the tab separated column string where the name and the
   value of each column are situated one after the other.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, this function has no effect. */
//C     bool tctdbputkeep3(TCTDB *tdb, const char *pkstr, const char *cstr);
bool  tctdbputkeep3(TCTDB *tdb, char *pkstr, char *cstr);


/* Concatenate columns of the existing record in a table database object.
   `tdb' specifies the table database object connected as a writer.
   `pkbuf' specifies the pointer to the region of the primary key.
   `pksiz' specifies the size of the region of the primary key.
   `cols' specifies a map object containing columns.
   If successful, the return value is true, else, it is false.
   If there is no corresponding record, a new record is created. */
//C     bool tctdbputcat(TCTDB *tdb, const void *pkbuf, int pksiz, TCMAP *cols);
bool  tctdbputcat(TCTDB *tdb, void *pkbuf, int pksiz, TCMAP *cols);


/* Concatenate columns in a table database object with a zero separated column string.
   `tdb' specifies the table database object connected as a writer.
   `pkbuf' specifies the pointer to the region of the primary key.
   `pksiz' specifies the size of the region of the primary key.
   `cbuf' specifies the pointer to the region of the zero separated column string where the name
   and the value of each column are situated one after the other.
   `csiz' specifies the size of the region of the column string.
   If successful, the return value is true, else, it is false.
   If there is no corresponding record, a new record is created. */
//C     bool tctdbputcat2(TCTDB *tdb, const void *pkbuf, int pksiz, const void *cbuf, int csiz);
bool  tctdbputcat2(TCTDB *tdb, void *pkbuf, int pksiz, void *cbuf, int csiz);


/* Concatenate columns in a table database object with with a tab separated column string.
   `tdb' specifies the table database object connected as a writer.
   `pkstr' specifies the string of the primary key.
   `cstr' specifies the string of the the tab separated column string where the name and the
   value of each column are situated one after the other.
   If successful, the return value is true, else, it is false.
   If there is no corresponding record, a new record is created. */
//C     bool tctdbputcat3(TCTDB *tdb, const char *pkstr, const char *cstr);
bool  tctdbputcat3(TCTDB *tdb, char *pkstr, char *cstr);


/* Remove a record of a table database object.
   `tdb' specifies the table database object connected as a writer.
   `pkbuf' specifies the pointer to the region of the primary key.
   `pksiz' specifies the size of the region of the primary key.
   If successful, the return value is true, else, it is false. */
//C     bool tctdbout(TCTDB *tdb, const void *pkbuf, int pksiz);
bool  tctdbout(TCTDB *tdb, void *pkbuf, int pksiz);


/* Remove a string record of a table database object.
   `tdb' specifies the table database object connected as a writer.
   `pkstr' specifies the string of the primary key.
   If successful, the return value is true, else, it is false. */
//C     bool tctdbout2(TCTDB *tdb, const char *pkstr);
bool  tctdbout2(TCTDB *tdb, char *pkstr);


/* Retrieve a record in a table database object.
   `tdb' specifies the table database object.
   `pkbuf' specifies the pointer to the region of the primary key.
   `pksiz' specifies the size of the region of the primary key.
   If successful, the return value is a map object of the columns of the corresponding record.
   `NULL' is returned if no record corresponds.
   Because the object of the return value is created with the function `tcmapnew', it should be
   deleted with the function `tcmapdel' when it is no longer in use. */
//C     TCMAP *tctdbget(TCTDB *tdb, const void *pkbuf, int pksiz);
TCMAP * tctdbget(TCTDB *tdb, void *pkbuf, int pksiz);


/* Retrieve a record in a table database object as a zero separated column string.
   `tdb' specifies the table database object.
   `pkbuf' specifies the pointer to the region of the primary key.
   `pksiz' specifies the size of the region of the primary key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the column string of the
   corresponding record.  `NULL' is returned if no record corresponds.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when
   it is no longer in use. */
//C     char *tctdbget2(TCTDB *tdb, const void *pkbuf, int pksiz, int *sp);
char * tctdbget2(TCTDB *tdb, void *pkbuf, int pksiz, int *sp);


/* Retrieve a string record in a table database object as a tab separated column string.
   `tdb' specifies the table database object.
   `pkstr' specifies the string of the primary key.
   If successful, the return value is the tab separated column string of the corresponding
   record.  `NULL' is returned if no record corresponds.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tctdbget3(TCTDB *tdb, const char *pkstr);
char * tctdbget3(TCTDB *tdb, char *pkstr);


/* Get the size of the value of a record in a table database object.
   `tdb' specifies the table database object.
   `kbuf' specifies the pointer to the region of the primary key.
   `ksiz' specifies the size of the region of the primary key.
   If successful, the return value is the size of the value of the corresponding record, else,
   it is -1. */
//C     int tctdbvsiz(TCTDB *tdb, const void *pkbuf, int pksiz);
int  tctdbvsiz(TCTDB *tdb, void *pkbuf, int pksiz);


/* Get the size of the value of a string record in a table database object.
   `tdb' specifies the table database object.
   `kstr' specifies the string of the primary key.
   If successful, the return value is the size of the value of the corresponding record, else,
   it is -1. */
//C     int tctdbvsiz2(TCTDB *tdb, const char *pkstr);
int  tctdbvsiz2(TCTDB *tdb, char *pkstr);


/* Initialize the iterator of a table database object.
   `tdb' specifies the table database object.
   If successful, the return value is true, else, it is false.
   The iterator is used in order to access the primary key of every record stored in a
   database. */
//C     bool tctdbiterinit(TCTDB *tdb);
bool  tctdbiterinit(TCTDB *tdb);


/* Get the next primary key of the iterator of a table database object.
   `tdb' specifies the table database object.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the next primary key, else, it
   is `NULL'.  `NULL' is returned when no record is to be get out of the iterator.
   Because an additional zero code is appended at the end of the region of the return value, the
   return value can be treated as a character string.  Because the region of the return value is
   allocated with the `malloc' call, it should be released with the `free' call when it is no
   longer in use.  It is possible to access every record by iteration of calling this function.
   It is allowed to update or remove records whose keys are fetched while the iteration.
   However, it is not assured if updating the database is occurred while the iteration.  Besides,
   the order of this traversal access method is arbitrary, so it is not assured that the order of
   storing matches the one of the traversal access. */
//C     void *tctdbiternext(TCTDB *tdb, int *sp);
void * tctdbiternext(TCTDB *tdb, int *sp);


/* Get the next primary key string of the iterator of a table database object.
   `tdb' specifies the table database object.
   If successful, the return value is the string of the next primary key, else, it is `NULL'.
   `NULL' is returned when no record is to be get out of the iterator.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use.  It is possible to access every
   record by iteration of calling this function.  However, it is not assured if updating the
   database is occurred while the iteration.  Besides, the order of this traversal access method
   is arbitrary, so it is not assured that the order of storing matches the one of the traversal
   access. */
//C     char *tctdbiternext2(TCTDB *tdb);
char * tctdbiternext2(TCTDB *tdb);


/* Get the columns of the next record of the iterator of a table database object.
   `tdb' specifies the table database object.
   If successful, the return value is a map object of the columns of the next record, else, it is
   `NULL'.  `NULL' is returned when no record is to be get out of the iterator.  The primary key
   is added into the map as a column of an empty string key.
   Because the object of the return value is created with the function `tcmapnew', it should be
   deleted with the function `tcmapdel' when it is no longer in use.  It is possible to access
   every record by iteration of calling this function.  However, it is not assured if updating
   the database is occurred while the iteration.  Besides, the order of this traversal access
   method is arbitrary, so it is not assured that the order of storing matches the one of the
   traversal access. */
//C     TCMAP *tctdbiternext3(TCTDB *tdb);
TCMAP * tctdbiternext3(TCTDB *tdb);


/* Get forward matching primary keys in a table database object.
   `tdb' specifies the table database object.
   `pbuf' specifies the pointer to the region of the prefix.
   `psiz' specifies the size of the region of the prefix.
   `max' specifies the maximum number of keys to be fetched.  If it is negative, no limit is
   specified.
   The return value is a list object of the corresponding keys.  This function does never fail.
   It returns an empty list even if no key corresponds.
   Because the object of the return value is created with the function `tclistnew', it should be
   deleted with the function `tclistdel' when it is no longer in use.  Note that this function
   may be very slow because every key in the database is scanned. */
//C     TCLIST *tctdbfwmkeys(TCTDB *tdb, const void *pbuf, int psiz, int max);
TCLIST * tctdbfwmkeys(TCTDB *tdb, void *pbuf, int psiz, int max);


/* Get forward matching string primary keys in a table database object.
   `tdb' specifies the table database object.
   `pstr' specifies the string of the prefix.
   `max' specifies the maximum number of keys to be fetched.  If it is negative, no limit is
   specified.
   The return value is a list object of the corresponding keys.  This function does never fail.
   It returns an empty list even if no key corresponds.
   Because the object of the return value is created with the function `tclistnew', it should be
   deleted with the function `tclistdel' when it is no longer in use.  Note that this function
   may be very slow because every key in the database is scanned. */
//C     TCLIST *tctdbfwmkeys2(TCTDB *tdb, const char *pstr, int max);
TCLIST * tctdbfwmkeys2(TCTDB *tdb, char *pstr, int max);


/* Add an integer to a column of a record in a table database object.
   `tdb' specifies the table database object connected as a writer.
   `kbuf' specifies the pointer to the region of the primary key.
   `ksiz' specifies the size of the region of the primary key.
   `num' specifies the additional value.
   If successful, the return value is the summation value, else, it is `INT_MIN'.
   The additional value is stored as a decimal string value of a column whose name is "_num".
   If no record corresponds, a new record with the additional value is stored. */
//C     int tctdbaddint(TCTDB *tdb, const void *pkbuf, int pksiz, int num);
int  tctdbaddint(TCTDB *tdb, void *pkbuf, int pksiz, int num);


/* Add a real number to a column of a record in a table database object.
   `tdb' specifies the table database object connected as a writer.
   `kbuf' specifies the pointer to the region of the primary key.
   `ksiz' specifies the size of the region of the primary key.
   `num' specifies the additional value.
   If successful, the return value is the summation value, else, it is Not-a-Number.
   The additional value is stored as a decimal string value of a column whose name is "_num".
   If no record corresponds, a new record with the additional value is stored. */
//C     double tctdbadddouble(TCTDB *tdb, const void *pkbuf, int pksiz, double num);
double  tctdbadddouble(TCTDB *tdb, void *pkbuf, int pksiz, double num);


/* Synchronize updated contents of a table database object with the file and the device.
   `tdb' specifies the table database object connected as a writer.
   If successful, the return value is true, else, it is false.
   This function is useful when another process connects to the same database file. */
//C     bool tctdbsync(TCTDB *tdb);
bool  tctdbsync(TCTDB *tdb);


/* Optimize the file of a table database object.
   `tdb' specifies the table database object connected as a writer.
   `bnum' specifies the number of elements of the bucket array.  If it is not more than 0, the
   default value is specified.  The default value is two times of the number of records.
   `apow' specifies the size of record alignment by power of 2.  If it is negative, the current
   setting is not changed.
   `fpow' specifies the maximum number of elements of the free block pool by power of 2.  If it
   is negative, the current setting is not changed.
   `opts' specifies options by bitwise-or: `BDBTLARGE' specifies that the size of the database
   can be larger than 2GB by using 64-bit bucket array, `BDBTDEFLATE' specifies that each record
   is compressed with Deflate encoding, `BDBTBZIP' specifies that each record is compressed with
   BZIP2 encoding, `BDBTTCBS' specifies that each record is compressed with TCBS encoding.  If it
   is `UINT8_MAX', the current setting is not changed.
   If successful, the return value is true, else, it is false.
   This function is useful to reduce the size of the database file with data fragmentation by
   successive updating. */
//C     bool tctdboptimize(TCTDB *tdb, int64_t bnum, int8_t apow, int8_t fpow, uint8_t opts);
bool  tctdboptimize(TCTDB *tdb, int64_t bnum, int8_t apow, int8_t fpow, uint8_t opts);


/* Remove all records of a table database object.
   `tdb' specifies the table database object connected as a writer.
   If successful, the return value is true, else, it is false. */
//C     bool tctdbvanish(TCTDB *tdb);
bool  tctdbvanish(TCTDB *tdb);


/* Copy the database file of a table database object.
   `tdb' specifies the table database object.
   `path' specifies the path of the destination file.  If it begins with `@', the trailing
   substring is executed as a command line.
   If successful, the return value is true, else, it is false.  False is returned if the executed
   command returns non-zero code.
   The database file is assured to be kept synchronized and not modified while the copying or
   executing operation is in progress.  So, this function is useful to create a backup file of
   the database file. */
//C     bool tctdbcopy(TCTDB *tdb, const char *path);
bool  tctdbcopy(TCTDB *tdb, char *path);


/* Begin the transaction of a table database object.
   `tdb' specifies the table database object connected as a writer.
   If successful, the return value is true, else, it is false.
   The database is locked by the thread while the transaction so that only one transaction can be
   activated with a database object at the same time.  Thus, the serializable isolation level is
   assumed if every database operation is performed in the transaction.  Because all pages are
   cached on memory while the transaction, the amount of referred records is limited by the
   memory capacity.  If the database is closed during transaction, the transaction is aborted
   implicitly. */
//C     bool tctdbtranbegin(TCTDB *tdb);
bool  tctdbtranbegin(TCTDB *tdb);


/* Commit the transaction of a table database object.
   `tdb' specifies the table database object connected as a writer.
   If successful, the return value is true, else, it is false.
   Update in the transaction is fixed when it is committed successfully. */
//C     bool tctdbtrancommit(TCTDB *tdb);
bool  tctdbtrancommit(TCTDB *tdb);


/* Abort the transaction of a table database object.
   `tdb' specifies the table database object connected as a writer.
   If successful, the return value is true, else, it is false.
   Update in the transaction is discarded when it is aborted.  The state of the database is
   rollbacked to before transaction. */
//C     bool tctdbtranabort(TCTDB *tdb);
bool  tctdbtranabort(TCTDB *tdb);


/* Get the file path of a table database object.
   `tdb' specifies the table database object.
   The return value is the path of the database file or `NULL' if the object does not connect to
   any database file. */
//C     const char *tctdbpath(TCTDB *tdb);
char * tctdbpath(TCTDB *tdb);


/* Get the number of records ccccof a table database object.
   `tdb' specifies the table database object.
   The return value is the number of records or 0 if the object does not connect to any database
   file. */
//C     uint64_t tctdbrnum(TCTDB *tdb);
uint64_t  tctdbrnum(TCTDB *tdb);


/* Get the size of the database file of a table database object.
   `tdb' specifies the table database object.
   The return value is the size of the database file or 0 if the object does not connect to any
   database file. */
//C     uint64_t tctdbfsiz(TCTDB *tdb);
uint64_t  tctdbfsiz(TCTDB *tdb);


/* Set a column index to a table database object.
   `tdb' specifies the table database object connected as a writer.
   `name' specifies the name of a column.  If the name of an existing index is specified, the
   index is rebuilt.  An empty string means the primary key.
   `type' specifies the index type: `TDBITLEXICAL' for lexical string, `TDBITDECIMAL' for decimal
   string, `TDBITTOKEN' for token inverted index, `TDBITQGRAM' for q-gram inverted index.  If it
   is `TDBITOPT', the index is optimized.  If it is `TDBITVOID', the index is removed.  If
   `TDBITKEEP' is added by bitwise-or and the index exists, this function merely returns failure.
   If successful, the return value is true, else, it is false.
   Note that the setting indices should be set after the database is opened. */
//C     bool tctdbsetindex(TCTDB *tdb, const char *name, int type);
bool  tctdbsetindex(TCTDB *tdb, char *name, int type);


/* Generate a unique ID number of a table database object.
   `tdb' specifies the table database object connected as a writer.
   The return value is the new unique ID number or -1 on failure. */
//C     int64_t tctdbgenuid(TCTDB *tdb);
int64_t  tctdbgenuid(TCTDB *tdb);


/* Create a query object.
   `tdb' specifies the table database object.
   The return value is the new query object. */
//C     TDBQRY *tctdbqrynew(TCTDB *tdb);
TDBQRY * tctdbqrynew(TCTDB *tdb);


/* Delete a query object.
   `qry' specifies the query object. */
//C     void tctdbqrydel(TDBQRY *qry);
void  tctdbqrydel(TDBQRY *qry);


/* Add a narrowing condition to a query object.
   `qry' specifies the query object.
   `name' specifies the name of a column.  An empty string means the primary key.
   `op' specifies an operation type: `TDBQCSTREQ' for string which is equal to the expression,
   `TDBQCSTRINC' for string which is included in the expression, `TDBQCSTRBW' for string which
   begins with the expression, `TDBQCSTREW' for string which ends with the expression,
   `TDBQCSTRAND' for string which includes all tokens in the expression, `TDBQCSTROR' for string
   which includes at least one token in the expression, `TDBQCSTROREQ' for string which is equal
   to at least one token in the expression, `TDBQCSTRRX' for string which matches regular
   expressions of the expression, `TDBQCNUMEQ' for number which is equal to the expression,
   `TDBQCNUMGT' for number which is greater than the expression, `TDBQCNUMGE' for number which is
   greater than or equal to the expression, `TDBQCNUMLT' for number which is less than the
   expression, `TDBQCNUMLE' for number which is less than or equal to the expression, `TDBQCNUMBT'
   for number which is between two tokens of the expression, `TDBQCNUMOREQ' for number which is
   equal to at least one token in the expression, `TDBQCFTSPH' for full-text search with the
   phrase of the expression, `TDBQCFTSAND' for full-text search with all tokens in the expression,
   `TDBQCFTSOR' for full-text search with at least one token in the expression, `TDBQCFTSEX' for
   full-text search with the compound expression.  All operations can be flagged by bitwise-or:
   `TDBQCNEGATE' for negation, `TDBQCNOIDX' for using no index.
   `expr' specifies an operand exression. */
//C     void tctdbqryaddcond(TDBQRY *qry, const char *name, int op, const char *expr);
void  tctdbqryaddcond(TDBQRY *qry, char *name, int op, char *expr);


/* Set the order of a query object.
   `qry' specifies the query object.
   `name' specifies the name of a column.  An empty string means the primary key.
   `type' specifies the order type: `TDBQOSTRASC' for string ascending, `TDBQOSTRDESC' for
   string descending, `TDBQONUMASC' for number ascending, `TDBQONUMDESC' for number descending. */
//C     void tctdbqrysetorder(TDBQRY *qry, const char *name, int type);
void  tctdbqrysetorder(TDBQRY *qry, char *name, int type);


/* Set the limit number of records of the result of a query object.
   `qry' specifies the query object.
   `max' specifies the maximum number of records of the result.  If it is negative, no limit is
   specified.
   `skip' specifies the number of skipped records of the result.  If it is not more than 0, no
   record is skipped. */
//C     void tctdbqrysetlimit(TDBQRY *qry, int max, int skip);
void  tctdbqrysetlimit(TDBQRY *qry, int max, int skip);


/* Execute the search of a query object.
   `qry' specifies the query object.
   The return value is a list object of the primary keys of the corresponding records.  This
   function does never fail.  It returns an empty list even if no record corresponds.
   Because the object of the return value is created with the function `tclistnew', it should
   be deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tctdbqrysearch(TDBQRY *qry);
TCLIST * tctdbqrysearch(TDBQRY *qry);


/* Remove each record corresponding to a query object.
   `qry' specifies the query object of the database connected as a writer.
   If successful, the return value is true, else, it is false. */
//C     bool tctdbqrysearchout(TDBQRY *qry);
bool  tctdbqrysearchout(TDBQRY *qry);


/* Process each record corresponding to a query object.
   `qry' specifies the query object of the database connected as a writer.
   `proc' specifies the pointer to the iterator function called for each record.  It receives
   four parameters.  The first parameter is the pointer to the region of the primary key.  The
   second parameter is the size of the region of the primary key.  The third parameter is a map
   object containing columns.  The fourth parameter is the pointer to the optional opaque object.
   It returns flags of the post treatment by bitwise-or: `TDBQPPUT' to modify the record,
   `TDBQPOUT' to remove the record, `TDBQPSTOP' to stop the iteration.
   `op' specifies an arbitrary pointer to be given as a parameter of the iterator function.  If
   it is not needed, `NULL' can be specified.
   If successful, the return value is true, else, it is false. */
//C     bool tctdbqryproc(TDBQRY *qry, TDBQRYPROC proc, void *op);
bool  tctdbqryproc(TDBQRY *qry, TDBQRYPROC proc, void *op);


/* Get the hint string of a query object.
   `qry' specifies the query object.
   The return value is the hint string.
   This function should be called after the query execution by `tctdbqrysearch' and so on.  The
   region of the return value is overwritten when this function is called again. */
//C     const char *tctdbqryhint(TDBQRY *qry);
char * tctdbqryhint(TDBQRY *qry);


/* Retrieve records with multiple query objects and get the set of the result.
   `qrys' specifies an array of the query objects.
   `num' specifies the number of elements of the array.
   `type' specifies a set operation type: `TDBMSUNION' for the union set, `TDBMSISECT' for the
   intersection set, `TDBMSDIFF' for the difference set.
   The return value is a list object of the primary keys of the corresponding records.  This
   function does never fail.  It returns an empty list even if no record corresponds.
   If the first query object has the order setting, the result array is sorted by the order.
   Because the object of the return value is created with the function `tclistnew', it should be
   deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tctdbmetasearch(TDBQRY **qrys, int num, int type);
TCLIST * tctdbmetasearch(TDBQRY **qrys, int num, int type);



/*************************************************************************************************
 * features for experts
 *************************************************************************************************/


/* Set the error code of a table database object.
   `tdb' specifies the table database object.
   `ecode' specifies the error code.
   `file' specifies the file name of the code.
   `line' specifies the line number of the code.
   `func' specifies the function name of the code. */
//C     void tctdbsetecode(TCTDB *tdb, int ecode, const char *filename, int line, const char *func);
void  tctdbsetecode(TCTDB *tdb, int ecode, char *filename, int line, char *func);


/* Set the file descriptor for debugging output.
   `tdb' specifies the table database object.
   `fd' specifies the file descriptor for debugging output. */
//C     void tctdbsetdbgfd(TCTDB *tdb, int fd);
void  tctdbsetdbgfd(TCTDB *tdb, int fd);


/* Get the file descriptor for debugging output.
   `tdb' specifies the table database object.
   The return value is the file descriptor for debugging output. */
//C     int tctdbdbgfd(TCTDB *tdb);
int  tctdbdbgfd(TCTDB *tdb);


/* Check whether mutual exclusion control is set to a table database object.
   `tdb' specifies the table database object.
   If mutual exclusion control is set, it is true, else it is false. */
//C     bool tctdbhasmutex(TCTDB *tdb);
bool  tctdbhasmutex(TCTDB *tdb);


/* Synchronize updating contents on memory of a table database object.
   `tdb' specifies the table database object connected as a writer.
   `phys' specifies whether to synchronize physically.
   If successful, the return value is true, else, it is false. */
//C     bool tctdbmemsync(TCTDB *tdb, bool phys);
bool  tctdbmemsync(TCTDB *tdb, bool phys);


/* Get the number of elements of the bucket array of a table database object.
   `tdb' specifies the table database object.
   The return value is the number of elements of the bucket array or 0 if the object does not
   connect to any database file. */
//C     uint64_t tctdbbnum(TCTDB *tdb);
uint64_t  tctdbbnum(TCTDB *tdb);


/* Get the record alignment of a table database object.
   `tdb' specifies the table database object.
   The return value is the record alignment or 0 if the object does not connect to any database
   file. */
//C     uint32_t tctdbalign(TCTDB *tdb);
uint32_t  tctdbalign(TCTDB *tdb);


/* Get the maximum number of the free block pool of a table database object.
   `tdb' specifies the table database object.
   The return value is the maximum number of the free block pool or 0 if the object does not
   connect to any database file. */
//C     uint32_t tctdbfbpmax(TCTDB *tdb);
uint32_t  tctdbfbpmax(TCTDB *tdb);


/* Get the inode number of the database file of a table database object.
   `tdb' specifies the table database object.
   The return value is the inode number of the database file or 0 if the object does not connect
   to any database file. */
//C     uint64_t tctdbinode(TCTDB *tdb);
uint64_t  tctdbinode(TCTDB *tdb);


/* Get the modification time of the database file of a table database object.
   `tdb' specifies the table database object.
   The return value is the inode number of the database file or 0 if the object does not connect
   to any database file. */
//C     time_t tctdbmtime(TCTDB *tdb);
time_t  tctdbmtime(TCTDB *tdb);


/* Get the additional flags of a table database object.
   `tdb' specifies the table database object.
   The return value is the additional flags. */
//C     uint8_t tctdbflags(TCTDB *tdb);
uint8_t  tctdbflags(TCTDB *tdb);


/* Get the options of a table database object.
   `tdb' specifies the table database object.
   The return value is the options. */
//C     uint8_t tctdbopts(TCTDB *tdb);
uint8_t  tctdbopts(TCTDB *tdb);


/* Get the pointer to the opaque field of a table database object.
   `tdb' specifies the table database object.
   The return value is the pointer to the opaque field whose size is 128 bytes. */
//C     char *tctdbopaque(TCTDB *tdb);
char * tctdbopaque(TCTDB *tdb);


/* Get the number of used elements of the bucket array of a table database object.
   `tdb' specifies the table database object.
   The return value is the number of used elements of the bucket array or 0 if the object does not
   connect to any database file. */
//C     uint64_t tctdbbnumused(TCTDB *tdb);
uint64_t  tctdbbnumused(TCTDB *tdb);


/* Get the number of column indices of a table database object.
   `tdb' specifies the table database object.
   The return value is the number of column indices or 0 if the object does not connect to any
   database file. */
//C     int tctdbinum(TCTDB *tdb);
int  tctdbinum(TCTDB *tdb);


/* Get the seed of unique ID unumbers of a table database object.
   `tdb' specifies the table database object.
   The return value is the seed of unique ID numbers or -1 on failure. */
//C     int64_t tctdbuidseed(TCTDB *tdb);
int64_t  tctdbuidseed(TCTDB *tdb);


/* Set the seed of unique ID unumbers of a table database object.
   `tdb' specifies the table database object connected as a writer.
   If successful, the return value is true, else, it is false. */
//C     bool tctdbsetuidseed(TCTDB *tdb, int64_t seed);
bool  tctdbsetuidseed(TCTDB *tdb, int64_t seed);


/* Set the parameters of the inverted cache of a table database object.
   `tdb' specifies the table database object.
   `iccmax' specifies the maximum size.  If it is not more than 0, the default value is
   specified.  The default value is 67108864.
   `iccsync' specifies synchronization ratio.  If it is not more than 0, the default value is
   specified.  The default value is 0.01.
   If successful, the return value is true, else, it is false.
   Note that the caching parameters should be set before the database is opened. */
//C     bool tctdbsetinvcache(TCTDB *tdb, int64_t iccmax, double iccsync);
bool  tctdbsetinvcache(TCTDB *tdb, int64_t iccmax, double iccsync);


/* Set the custom codec functions of a table database object.
   `tdb' specifies the table database object.
   `enc' specifies the pointer to the custom encoding function.  It receives four parameters.
   The first parameter is the pointer to the region.  The second parameter is the size of the
   region.  The third parameter is the pointer to the variable into which the size of the region
   of the return value is assigned.  The fourth parameter is the pointer to the optional opaque
   object.  It returns the pointer to the result object allocated with `malloc' call if
   successful, else, it returns `NULL'.
   `encop' specifies an arbitrary pointer to be given as a parameter of the encoding function.
   If it is not needed, `NULL' can be specified.
   `dec' specifies the pointer to the custom decoding function.
   `decop' specifies an arbitrary pointer to be given as a parameter of the decoding function.
   If it is not needed, `NULL' can be specified.
   If successful, the return value is true, else, it is false.
   Note that the custom codec functions should be set before the database is opened and should be
   set every time the database is being opened. */
//C     bool tctdbsetcodecfunc(TCTDB *tdb, TCCODEC enc, void *encop, TCCODEC dec, void *decop);
bool  tctdbsetcodecfunc(TCTDB *tdb, TCCODEC enc, void *encop, TCCODEC dec, void *decop);


/* Get the unit step number of auto defragmentation of a table database object.
   `tdb' specifies the table database object.
   The return value is the unit step number of auto defragmentation. */
//C     uint32_t tctdbdfunit(TCTDB *tdb);
uint32_t  tctdbdfunit(TCTDB *tdb);


/* Perform dynamic defragmentation of a table database object.
   `tdb' specifies the table database object connected as a writer.
   `step' specifie the number of steps.  If it is not more than 0, the whole file is defragmented
   gradually without keeping a continuous lock.
   If successful, the return value is true, else, it is false. */
//C     bool tctdbdefrag(TCTDB *tdb, int64_t step);
bool  tctdbdefrag(TCTDB *tdb, int64_t step);


/* Clear the cache of a table tree database object.
   `tdb' specifies the table tree database object.
   If successful, the return value is true, else, it is false. */
//C     bool tctdbcacheclear(TCTDB *tdb);
bool  tctdbcacheclear(TCTDB *tdb);


/* Store a record into a table database object with a duplication handler.
   `tdb' specifies the table database object connected as a writer.
   `pkbuf' specifies the pointer to the region of the primary key.
   `pksiz' specifies the size of the region of the primary key.
   `cbuf' specifies the pointer to the region of the zero separated column string where the name
   and the value of each column are situated one after the other.  `NULL' means that record
   addition is ommited if there is no corresponding record.
   `csiz' specifies the size of the region of the column string.
   `proc' specifies the pointer to the callback function to process duplication.  It receives
   four parameters.  The first parameter is the pointer to the region of the value.  The second
   parameter is the size of the region of the value.  The third parameter is the pointer to the
   variable into which the size of the region of the return value is assigned.  The fourth
   parameter is the pointer to the optional opaque object.  It returns the pointer to the result
   object allocated with `malloc'.  It is released by the caller.  If it is `NULL', the record is
   not modified.  If it is `(void *)-1', the record is removed.
   `op' specifies an arbitrary pointer to be given as a parameter of the callback function.  If
   it is not needed, `NULL' can be specified.
   If successful, the return value is true, else, it is false.
   Note that the callback function can not perform any database operation because the function
   is called in the critical section guarded by the same locks of database operations. */
//C     bool tctdbputproc(TCTDB *tdb, const void *pkbuf, int pksiz, const void *cbuf, int csiz,
//C                       TCPDPROC proc, void *op);
bool  tctdbputproc(TCTDB *tdb, void *pkbuf, int pksiz, void *cbuf, int csiz, TCPDPROC proc, void *op);


/* Retrieve the value of a column of a record in a table database object.
   `tdb' specifies the table database object.
   `pkbuf' specifies the pointer to the region of the primary key.
   `pksiz' specifies the size of the region of the primary key.
   `nbuf' specifies the pointer to the region of the column name.
   `nsiz' specifies the size of the region of the column name.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the value of the column of the
   corresponding record.  `NULL' is returned if no record corresponds or there is no column.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when
   it is no longer in use. */
//C     char *tctdbget4(TCTDB *tdb, const void *pkbuf, int pksiz, const void *nbuf, int nsiz, int *sp);
char * tctdbget4(TCTDB *tdb, void *pkbuf, int pksiz, void *nbuf, int nsiz, int *sp);


/* Move the iterator to the record corresponding a key of a table database object.
   `tdb' specifies the table database object.
   `pkbuf' specifies the pointer to the region of the primary key.
   `pksiz' specifies the size of the region of the primary key.
   If successful, the return value is true, else, it is false.  False is returned if there is
   no record corresponding the condition. */
//C     bool tctdbiterinit2(TCTDB *tdb, const void *pkbuf, int pksiz);
bool  tctdbiterinit2(TCTDB *tdb, void *pkbuf, int pksiz);


/* Move the iterator to the record corresponding a key string of a table database object.
   `tdb' specifies the table database object.
   `kstr' specifies the string of the primary key.
   If successful, the return value is true, else, it is false.  False is returned if there is
   no record corresponding the condition. */
//C     bool tctdbiterinit3(TCTDB *tdb, const char *kstr);
bool  tctdbiterinit3(TCTDB *tdb, char *kstr);


/* Process each record atomically of a table database object.
   `tdb' specifies the table database object.
   `iter' specifies the pointer to the iterator function called for each record.  It receives
   five parameters.  The first parameter is the pointer to the region of the key.  The second
   parameter is the size of the region of the key.  The third parameter is the pointer to the
   region of the value.  The fourth parameter is the size of the region of the value.  The fifth
   parameter is the pointer to the optional opaque object.  It returns true to continue iteration
   or false to stop iteration.
   `op' specifies an arbitrary pointer to be given as a parameter of the iterator function.  If
   it is not needed, `NULL' can be specified.
   If successful, the return value is true, else, it is false.
   Note that the callback function can not perform any database operation because the function
   is called in the critical section guarded by the same locks of database operations. */
//C     bool tctdbforeach(TCTDB *tdb, TCITER iter, void *op);
bool  tctdbforeach(TCTDB *tdb, TCITER iter, void *op);


/* Process each record corresponding to a query object with non-atomic fashion.
   `qry' specifies the query object of the database connected as a writer.
   `proc' specifies the pointer to the iterator function called for each record.  It receives
   four parameters.  The first parameter is the pointer to the region of the primary key.  The
   second parameter is the size of the region of the primary key.  The third parameter is a map
   object containing columns.  The fourth parameter is the pointer to the optional opaque object.
   It returns flags of the post treatment by bitwise-or: `TDBQPPUT' to modify the record,
   `TDBQPOUT' to remove the record, `TDBQPSTOP' to stop the iteration.
   `op' specifies an arbitrary pointer to be given as a parameter of the iterator function.  If
   it is not needed, `NULL' can be specified.
   If successful, the return value is true, else, it is false. */
//C     bool tctdbqryproc2(TDBQRY *qry, TDBQRYPROC proc, void *op);
bool  tctdbqryproc2(TDBQRY *qry, TDBQRYPROC proc, void *op);


/* Remove each record corresponding to a query object with non-atomic fashion.
   `qry' specifies the query object of the database connected as a writer.
   If successful, the return value is true, else, it is false. */
//C     bool tctdbqrysearchout2(TDBQRY *qry);
bool  tctdbqrysearchout2(TDBQRY *qry);


/* Convert a string into the index type number.
   `str' specifies a string.
   The return value is the index type number or -1 on failure. */
//C     int tctdbstrtoindextype(const char *str);
int  tctdbstrtoindextype(char *str);


/* Convert a string into the meta search type number.
   `str' specifies a string.
   The return value is the meta search type number or -1 on failure. */
//C     int tctdbstrtometasearcytype(const char *str);
int  tctdbstrtometasearcytype(char *str);


/* Get the count of corresponding records of a query object.
   `qry' specifies the query object.
   The return value is the count of corresponding records. */
//C     int tctdbqrycount(TDBQRY *qry);
int  tctdbqrycount(TDBQRY *qry);


/* Generate keyword-in-context strings from a query object.
   `qry' specifies the query object.
   `cols' specifies a map object containing columns.
   `name' specifies the name of a column.  If it is `NULL', the first column of the query is
   specified.
   `width' specifies the width of strings picked up around each keyword.
   `opts' specifies options by bitwise-or: `TCKWMUTAB' specifies that each keyword is marked up
   between two tab characters, `TCKWMUCTRL' specifies that each keyword is marked up by the STX
   (0x02) code and the ETX (0x03) code, `TCKWMUBRCT' specifies that each keyword is marked up by
   the two square brackets, `TCKWNOOVER' specifies that each context does not overlap,
   `TCKWPULEAD' specifies that the lead string is picked up forcibly.
   The return value is the list object whose elements are strings around keywords.
   Because the object of the return value is created with the function `tclistnew', it should
   be deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tctdbqrykwic(TDBQRY *qry, TCMAP *cols, const char *name, int width, int opts);
TCLIST * tctdbqrykwic(TDBQRY *qry, TCMAP *cols, char *name, int width, int opts);


/* Convert a string into the query operation number.
   `str' specifies a string.
   The return value is the query operation number or -1 on failure. */
//C     int tctdbqrystrtocondop(const char *str);
int  tctdbqrystrtocondop(char *str);


/* Convert a string into the query order type number.
   `str' specifies a string.
   The return value is the query order type or -1 on failure. */
//C     int tctdbqrystrtoordertype(const char *str);
int  tctdbqrystrtoordertype(char *str);


/* Convert a string into the set operation type number.
   `str' specifies a string.
   The return value is the set operation type or -1 on failure. */
//C     int tctdbmetastrtosettype(const char *str);
int  tctdbmetastrtosettype(char *str);



//C     __TCTDB_CLINKAGEEND
//C     #endif                                   /* duplication check */


/* END OF FILE */
