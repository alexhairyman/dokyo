/* Converted to D from tchdb.h by htod */
module tchdb;
/*************************************************************************************************
 * The hash database API of Tokyo Cabinet
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


//C     #ifndef _TCHDB_H                         /* duplication check */
//C     #define _TCHDB_H

//C     #if defined(__cplusplus)
//C     #define __TCHDB_CLINKAGEBEGIN extern "C" {
//C     #define __TCHDB_CLINKAGEEND }
//C     #else
//C     #define __TCHDB_CLINKAGEBEGIN
//C     #define __TCHDB_CLINKAGEEND
//C     #endif
//C     __TCHDB_CLINKAGEBEGIN


//C     #include <tcutil.h>
import std.c.tcutil;



/*************************************************************************************************
 * API
 *************************************************************************************************/


//C     typedef struct {                         /* type of structure for a hash database */
//C       void *mmtx;                            /* mutex for method */
//C       void *rmtxs;                           /* mutexes for records */
//C       void *dmtx;                            /* mutex for the while database */
//C       void *wmtx;                            /* mutex for write ahead logging */
//C       void *eckey;                           /* key for thread specific error code */
//C       char *rpath;                           /* real path for locking */
//C       uint8_t type;                          /* database type */
//C       uint8_t flags;                         /* additional flags */
//C       uint64_t bnum;                         /* number of the bucket array */
//C       uint8_t apow;                          /* power of record alignment */
//C       uint8_t fpow;                          /* power of free block pool number */
//C       uint8_t opts;                          /* options */
//C       char *path;                            /* path of the database file */
//C       int fd;                                /* file descriptor of the database file */
//C       uint32_t omode;                        /* open mode */
//C       uint64_t rnum;                         /* number of the records */
//C       uint64_t fsiz;                         /* size of the database file */
//C       uint64_t frec;                         /* offset of the first record */
//C       uint64_t dfcur;                        /* offset of the cursor for defragmentation */
//C       uint64_t iter;                         /* offset of the iterator */
//C       char *map;                             /* pointer to the mapped memory */
//C       uint64_t msiz;                         /* size of the mapped memory */
//C       uint64_t xmsiz;                        /* size of the extra mapped memory */
//C       uint64_t xfsiz;                        /* extra size of the file for mapped memory */
//C       uint32_t *ba32;                        /* 32-bit bucket array */
//C       uint64_t *ba64;                        /* 64-bit bucket array */
//C       uint32_t align;                        /* record alignment */
//C       uint32_t runit;                        /* record reading unit */
//C       bool zmode;                            /* whether compression is used */
//C       int32_t fbpmax;                        /* maximum number of the free block pool */
//C       void *fbpool;                          /* free block pool */
//C       int32_t fbpnum;                        /* number of the free block pool */
//C       int32_t fbpmis;                        /* number of missing retrieval of the free block pool */
//C       bool async;                            /* whether asynchronous storing is called */
//C       TCXSTR *drpool;                        /* delayed record pool */
//C       TCXSTR *drpdef;                        /* deferred records of the delayed record pool */
//C       uint64_t drpoff;                       /* offset of the delayed record pool */
//C       TCMDB *recc;                           /* cache for records */
//C       uint32_t rcnum;                        /* maximum number of cached records */
//C       TCCODEC enc;                           /* pointer to the encoding function */
//C       void *encop;                           /* opaque object for the encoding functions */
//C       TCCODEC dec;                           /* pointer to the decoding function */
//C       void *decop;                           /* opaque object for the decoding functions */
//C       int ecode;                             /* last happened error code */
//C       bool fatal;                            /* whether a fatal error occured */
//C       uint64_t inode;                        /* inode number */
//C       time_t mtime;                          /* modification time */
//C       uint32_t dfunit;                       /* unit step number of auto defragmentation */
//C       uint32_t dfcnt;                        /* counter of auto defragmentation */
//C       bool tran;                             /* whether in the transaction */
//C       int walfd;                             /* file descriptor of write ahead logging */
//C       uint64_t walend;                       /* end offset of write ahead logging */
//C       int dbgfd;                             /* file descriptor for debugging */
//C       volatile int64_t cnt_writerec;         /* tesing counter for record write times */
//C       volatile int64_t cnt_reuserec;         /* tesing counter for record reuse times */
//C       volatile int64_t cnt_moverec;          /* tesing counter for record move times */
//C       volatile int64_t cnt_readrec;          /* tesing counter for record read times */
//C       volatile int64_t cnt_searchfbp;        /* tesing counter for FBP search times */
//C       volatile int64_t cnt_insertfbp;        /* tesing counter for FBP insert times */
//C       volatile int64_t cnt_splicefbp;        /* tesing counter for FBP splice times */
//C       volatile int64_t cnt_dividefbp;        /* tesing counter for FBP divide times */
//C       volatile int64_t cnt_mergefbp;         /* tesing counter for FBP merge times */
//C       volatile int64_t cnt_reducefbp;        /* tesing counter for FBP reduce times */
//C       volatile int64_t cnt_appenddrp;        /* tesing counter for DRP append times */
//C       volatile int64_t cnt_deferdrp;         /* tesing counter for DRP defer times */
//C       volatile int64_t cnt_flushdrp;         /* tesing counter for DRP flush times */
//C       volatile int64_t cnt_adjrecc;          /* tesing counter for record cache adjust times */
//C       volatile int64_t cnt_defrag;           /* tesing counter for defragmentation times */
//C       volatile int64_t cnt_shiftrec;         /* tesing counter for record shift times */
//C       volatile int64_t cnt_trunc;            /* tesing counter for truncation times */
//C     } TCHDB;
struct _N20
{
    void *mmtx;
    void *rmtxs;
    void *dmtx;
    void *wmtx;
    void *eckey;
    char *rpath;
    uint8_t type;
    uint8_t flags;
    uint64_t bnum;
    uint8_t apow;
    uint8_t fpow;
    uint8_t opts;
    char *path;
    int fd;
    uint32_t omode;
    uint64_t rnum;
    uint64_t fsiz;
    uint64_t frec;
    uint64_t dfcur;
    uint64_t iter;
    char *map;
    uint64_t msiz;
    uint64_t xmsiz;
    uint64_t xfsiz;
    uint32_t *ba32;
    uint64_t *ba64;
    uint32_t align;
    uint32_t runit;
    bool zmode;
    int32_t fbpmax;
    void *fbpool;
    int32_t fbpnum;
    int32_t fbpmis;
    bool async;
    TCXSTR *drpool;
    TCXSTR *drpdef;
    uint64_t drpoff;
    TCMDB *recc;
    uint32_t rcnum;
    TCCODEC enc;
    void *encop;
    TCCODEC dec;
    void *decop;
    int ecode;
    bool fatal;
    uint64_t inode;
    time_t mtime;
    uint32_t dfunit;
    uint32_t dfcnt;
    bool tran;
    int walfd;
    uint64_t walend;
    int dbgfd;
    int64_t cnt_writerec;
    int64_t cnt_reuserec;
    int64_t cnt_moverec;
    int64_t cnt_readrec;
    int64_t cnt_searchfbp;
    int64_t cnt_insertfbp;
    int64_t cnt_splicefbp;
    int64_t cnt_dividefbp;
    int64_t cnt_mergefbp;
    int64_t cnt_reducefbp;
    int64_t cnt_appenddrp;
    int64_t cnt_deferdrp;
    int64_t cnt_flushdrp;
    int64_t cnt_adjrecc;
    int64_t cnt_defrag;
    int64_t cnt_shiftrec;
    int64_t cnt_trunc;
}
extern (C):
alias _N20 TCHDB;

//C     enum {                                   /* enumeration for additional flags */
//C       HDBFOPEN = 1 << 0,                     /* whether opened */
//C       HDBFFATAL = 1 << 1                     /* whether with fatal error */
//C     };
enum
{
    HDBFOPEN = 1,
    HDBFFATAL,
}

//C     enum {                                   /* enumeration for tuning options */
//C       HDBTLARGE = 1 << 0,                    /* use 64-bit bucket array */
//C       HDBTDEFLATE = 1 << 1,                  /* compress each record with Deflate */
//C       HDBTBZIP = 1 << 2,                     /* compress each record with BZIP2 */
//C       HDBTTCBS = 1 << 3,                     /* compress each record with TCBS */
//C       HDBTEXCODEC = 1 << 4                   /* compress each record with custom functions */
//C     };
enum
{
    HDBTLARGE = 1,
    HDBTDEFLATE,
    HDBTBZIP = 4,
    HDBTTCBS = 8,
    HDBTEXCODEC = 16,
}

//C     enum {                                   /* enumeration for open modes */
//C       HDBOREADER = 1 << 0,                   /* open as a reader */
//C       HDBOWRITER = 1 << 1,                   /* open as a writer */
//C       HDBOCREAT = 1 << 2,                    /* writer creating */
//C       HDBOTRUNC = 1 << 3,                    /* writer truncating */
//C       HDBONOLCK = 1 << 4,                    /* open without locking */
//C       HDBOLCKNB = 1 << 5,                    /* lock without blocking */
//C       HDBOTSYNC = 1 << 6                     /* synchronize every transaction */
//C     };
enum
{
    HDBOREADER = 1,
    HDBOWRITER,
    HDBOCREAT = 4,
    HDBOTRUNC = 8,
    HDBONOLCK = 16,
    HDBOLCKNB = 32,
    HDBOTSYNC = 64,
}


/* Get the message string corresponding to an error code.
   `ecode' specifies the error code.
   The return value is the message string of the error code. */
//C     const char *tchdberrmsg(int ecode);
char * tchdberrmsg(int ecode);


/* Create a hash database object.
   The return value is the new hash database object. */
//C     TCHDB *tchdbnew(void);
TCHDB * tchdbnew();


/* Delete a hash database object.
   `hdb' specifies the hash database object.
   If the database is not closed, it is closed implicitly.  Note that the deleted object and its
   derivatives can not be used anymore. */
//C     void tchdbdel(TCHDB *hdb);
void  tchdbdel(TCHDB *hdb);


/* Get the last happened error code of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the last happened error code.
   The following error codes are defined: `TCESUCCESS' for success, `TCETHREAD' for threading
   error, `TCEINVALID' for invalid operation, `TCENOFILE' for file not found, `TCENOPERM' for no
   permission, `TCEMETA' for invalid meta data, `TCERHEAD' for invalid record header, `TCEOPEN'
   for open error, `TCECLOSE' for close error, `TCETRUNC' for trunc error, `TCESYNC' for sync
   error, `TCESTAT' for stat error, `TCESEEK' for seek error, `TCEREAD' for read error,
   `TCEWRITE' for write error, `TCEMMAP' for mmap error, `TCELOCK' for lock error, `TCEUNLINK'
   for unlink error, `TCERENAME' for rename error, `TCEMKDIR' for mkdir error, `TCERMDIR' for
   rmdir error, `TCEKEEP' for existing record, `TCENOREC' for no record found, and `TCEMISC' for
   miscellaneous error. */
//C     int tchdbecode(TCHDB *hdb);
int  tchdbecode(TCHDB *hdb);


/* Set mutual exclusion control of a hash database object for threading.
   `hdb' specifies the hash database object which is not opened.
   If successful, the return value is true, else, it is false.
   Note that the mutual exclusion control is needed if the object is shared by plural threads and
   this function should be called before the database is opened. */
//C     bool tchdbsetmutex(TCHDB *hdb);
bool  tchdbsetmutex(TCHDB *hdb);


/* Set the tuning parameters of a hash database object.
   `hdb' specifies the hash database object which is not opened.
   `bnum' specifies the number of elements of the bucket array.  If it is not more than 0, the
   default value is specified.  The default value is 131071.  Suggested size of the bucket array
   is about from 0.5 to 4 times of the number of all records to be stored.
   `apow' specifies the size of record alignment by power of 2.  If it is negative, the default
   value is specified.  The default value is 4 standing for 2^4=16.
   `fpow' specifies the maximum number of elements of the free block pool by power of 2.  If it
   is negative, the default value is specified.  The default value is 10 standing for 2^10=1024.
   `opts' specifies options by bitwise-or: `HDBTLARGE' specifies that the size of the database
   can be larger than 2GB by using 64-bit bucket array, `HDBTDEFLATE' specifies that each record
   is compressed with Deflate encoding, `HDBTBZIP' specifies that each record is compressed with
   BZIP2 encoding, `HDBTTCBS' specifies that each record is compressed with TCBS encoding.
   If successful, the return value is true, else, it is false.
   Note that the tuning parameters should be set before the database is opened. */
//C     bool tchdbtune(TCHDB *hdb, int64_t bnum, int8_t apow, int8_t fpow, uint8_t opts);
bool  tchdbtune(TCHDB *hdb, int64_t bnum, int8_t apow, int8_t fpow, uint8_t opts);


/* Set the caching parameters of a hash database object.
   `hdb' specifies the hash database object which is not opened.
   `rcnum' specifies the maximum number of records to be cached.  If it is not more than 0, the
   record cache is disabled.  It is disabled by default.
   If successful, the return value is true, else, it is false.
   Note that the caching parameters should be set before the database is opened. */
//C     bool tchdbsetcache(TCHDB *hdb, int32_t rcnum);
bool  tchdbsetcache(TCHDB *hdb, int32_t rcnum);


/* Set the size of the extra mapped memory of a hash database object.
   `hdb' specifies the hash database object which is not opened.
   `xmsiz' specifies the size of the extra mapped memory.  If it is not more than 0, the extra
   mapped memory is disabled.  The default size is 67108864.
   If successful, the return value is true, else, it is false.
   Note that the mapping parameters should be set before the database is opened. */
//C     bool tchdbsetxmsiz(TCHDB *hdb, int64_t xmsiz);
bool  tchdbsetxmsiz(TCHDB *hdb, int64_t xmsiz);


/* Set the unit step number of auto defragmentation of a hash database object.
   `hdb' specifies the hash database object which is not opened.
   `dfunit' specifie the unit step number.  If it is not more than 0, the auto defragmentation
   is disabled.  It is disabled by default.
   If successful, the return value is true, else, it is false.
   Note that the defragmentation parameters should be set before the database is opened. */
//C     bool tchdbsetdfunit(TCHDB *hdb, int32_t dfunit);
bool  tchdbsetdfunit(TCHDB *hdb, int32_t dfunit);


/* Open a database file and connect a hash database object.
   `hdb' specifies the hash database object which is not opened.
   `path' specifies the path of the database file.
   `omode' specifies the connection mode: `HDBOWRITER' as a writer, `HDBOREADER' as a reader.
   If the mode is `HDBOWRITER', the following may be added by bitwise-or: `HDBOCREAT', which
   means it creates a new database if not exist, `HDBOTRUNC', which means it creates a new
   database regardless if one exists, `HDBOTSYNC', which means every transaction synchronizes
   updated contents with the device.  Both of `HDBOREADER' and `HDBOWRITER' can be added to by
   bitwise-or: `HDBONOLCK', which means it opens the database file without file locking, or
   `HDBOLCKNB', which means locking is performed without blocking.
   If successful, the return value is true, else, it is false. */
//C     bool tchdbopen(TCHDB *hdb, const char *path, int omode);
bool  tchdbopen(TCHDB *hdb, char *path, int omode);


/* Close a hash database object.
   `hdb' specifies the hash database object.
   If successful, the return value is true, else, it is false.
   Update of a database is assured to be written when the database is closed.  If a writer opens
   a database but does not close it appropriately, the database will be broken. */
//C     bool tchdbclose(TCHDB *hdb);
bool  tchdbclose(TCHDB *hdb);


/* Store a record into a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, it is overwritten. */
//C     bool tchdbput(TCHDB *hdb, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
bool  tchdbput(TCHDB *hdb, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a string record into a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, it is overwritten. */
//C     bool tchdbput2(TCHDB *hdb, const char *kstr, const char *vstr);
bool  tchdbput2(TCHDB *hdb, char *kstr, char *vstr);


/* Store a new record into a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, this function has no effect. */
//C     bool tchdbputkeep(TCHDB *hdb, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
bool  tchdbputkeep(TCHDB *hdb, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a new string record into a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, this function has no effect. */
//C     bool tchdbputkeep2(TCHDB *hdb, const char *kstr, const char *vstr);
bool  tchdbputkeep2(TCHDB *hdb, char *kstr, char *vstr);


/* Concatenate a value at the end of the existing record in a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If successful, the return value is true, else, it is false.
   If there is no corresponding record, a new record is created. */
//C     bool tchdbputcat(TCHDB *hdb, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
bool  tchdbputcat(TCHDB *hdb, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Concatenate a string value at the end of the existing record in a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If successful, the return value is true, else, it is false.
   If there is no corresponding record, a new record is created. */
//C     bool tchdbputcat2(TCHDB *hdb, const char *kstr, const char *vstr);
bool  tchdbputcat2(TCHDB *hdb, char *kstr, char *vstr);


/* Store a record into a hash database object in asynchronous fashion.
   `hdb' specifies the hash database object connected as a writer.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, it is overwritten.  Records passed to
   this function are accumulated into the inner buffer and wrote into the file at a blast. */
//C     bool tchdbputasync(TCHDB *hdb, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
bool  tchdbputasync(TCHDB *hdb, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a string record into a hash database object in asynchronous fashion.
   `hdb' specifies the hash database object connected as a writer.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, it is overwritten.  Records passed to
   this function are accumulated into the inner buffer and wrote into the file at a blast. */
//C     bool tchdbputasync2(TCHDB *hdb, const char *kstr, const char *vstr);
bool  tchdbputasync2(TCHDB *hdb, char *kstr, char *vstr);


/* Remove a record of a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   If successful, the return value is true, else, it is false. */
//C     bool tchdbout(TCHDB *hdb, const void *kbuf, int ksiz);
bool  tchdbout(TCHDB *hdb, void *kbuf, int ksiz);


/* Remove a string record of a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   `kstr' specifies the string of the key.
   If successful, the return value is true, else, it is false. */
//C     bool tchdbout2(TCHDB *hdb, const char *kstr);
bool  tchdbout2(TCHDB *hdb, char *kstr);


/* Retrieve a record in a hash database object.
   `hdb' specifies the hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the value of the corresponding
   record.  `NULL' is returned if no record corresponds.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when
   it is no longer in use. */
//C     void *tchdbget(TCHDB *hdb, const void *kbuf, int ksiz, int *sp);
void * tchdbget(TCHDB *hdb, void *kbuf, int ksiz, int *sp);


/* Retrieve a string record in a hash database object.
   `hdb' specifies the hash database object.
   `kstr' specifies the string of the key.
   If successful, the return value is the string of the value of the corresponding record.
   `NULL' is returned if no record corresponds.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tchdbget2(TCHDB *hdb, const char *kstr);
char * tchdbget2(TCHDB *hdb, char *kstr);


/* Retrieve a record in a hash database object and write the value into a buffer.
   `hdb' specifies the hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the buffer into which the value of the corresponding record is
   written.
   `max' specifies the size of the buffer.
   If successful, the return value is the size of the written data, else, it is -1.  -1 is
   returned if no record corresponds to the specified key.
   Note that an additional zero code is not appended at the end of the region of the writing
   buffer. */
//C     int tchdbget3(TCHDB *hdb, const void *kbuf, int ksiz, void *vbuf, int max);
int  tchdbget3(TCHDB *hdb, void *kbuf, int ksiz, void *vbuf, int max);


/* Get the size of the value of a record in a hash database object.
   `hdb' specifies the hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   If successful, the return value is the size of the value of the corresponding record, else,
   it is -1. */
//C     int tchdbvsiz(TCHDB *hdb, const void *kbuf, int ksiz);
int  tchdbvsiz(TCHDB *hdb, void *kbuf, int ksiz);


/* Get the size of the value of a string record in a hash database object.
   `hdb' specifies the hash database object.
   `kstr' specifies the string of the key.
   If successful, the return value is the size of the value of the corresponding record, else,
   it is -1. */
//C     int tchdbvsiz2(TCHDB *hdb, const char *kstr);
int  tchdbvsiz2(TCHDB *hdb, char *kstr);


/* Initialize the iterator of a hash database object.
   `hdb' specifies the hash database object.
   If successful, the return value is true, else, it is false.
   The iterator is used in order to access the key of every record stored in a database. */
//C     bool tchdbiterinit(TCHDB *hdb);
bool  tchdbiterinit(TCHDB *hdb);


/* Get the next key of the iterator of a hash database object.
   `hdb' specifies the hash database object.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the next key, else, it is
   `NULL'.  `NULL' is returned when no record is to be get out of the iterator.
   Because an additional zero code is appended at the end of the region of the return value, the
   return value can be treated as a character string.  Because the region of the return value is
   allocated with the `malloc' call, it should be released with the `free' call when it is no
   longer in use.  It is possible to access every record by iteration of calling this function.
   It is allowed to update or remove records whose keys are fetched while the iteration.
   However, it is not assured if updating the database is occurred while the iteration.  Besides,
   the order of this traversal access method is arbitrary, so it is not assured that the order of
   storing matches the one of the traversal access. */
//C     void *tchdbiternext(TCHDB *hdb, int *sp);
void * tchdbiternext(TCHDB *hdb, int *sp);


/* Get the next key string of the iterator of a hash database object.
   `hdb' specifies the hash database object.
   If successful, the return value is the string of the next key, else, it is `NULL'.  `NULL' is
   returned when no record is to be get out of the iterator.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use.  It is possible to access every
   record by iteration of calling this function.  However, it is not assured if updating the
   database is occurred while the iteration.  Besides, the order of this traversal access method
   is arbitrary, so it is not assured that the order of storing matches the one of the traversal
   access. */
//C     char *tchdbiternext2(TCHDB *hdb);
char * tchdbiternext2(TCHDB *hdb);


/* Get the next extensible objects of the iterator of a hash database object.
   `hdb' specifies the hash database object.
   `kxstr' specifies the object into which the next key is wrote down.
   `vxstr' specifies the object into which the next value is wrote down.
   If successful, the return value is true, else, it is false.  False is returned when no record
   is to be get out of the iterator. */
//C     bool tchdbiternext3(TCHDB *hdb, TCXSTR *kxstr, TCXSTR *vxstr);
bool  tchdbiternext3(TCHDB *hdb, TCXSTR *kxstr, TCXSTR *vxstr);


/* Get forward matching keys in a hash database object.
   `hdb' specifies the hash database object.
   `pbuf' specifies the pointer to the region of the prefix.
   `psiz' specifies the size of the region of the prefix.
   `max' specifies the maximum number of keys to be fetched.  If it is negative, no limit is
   specified.
   The return value is a list object of the corresponding keys.  This function does never fail.
   It returns an empty list even if no key corresponds.
   Because the object of the return value is created with the function `tclistnew', it should be
   deleted with the function `tclistdel' when it is no longer in use.  Note that this function
   may be very slow because every key in the database is scanned. */
//C     TCLIST *tchdbfwmkeys(TCHDB *hdb, const void *pbuf, int psiz, int max);
TCLIST * tchdbfwmkeys(TCHDB *hdb, void *pbuf, int psiz, int max);


/* Get forward matching string keys in a hash database object.
   `hdb' specifies the hash database object.
   `pstr' specifies the string of the prefix.
   `max' specifies the maximum number of keys to be fetched.  If it is negative, no limit is
   specified.
   The return value is a list object of the corresponding keys.  This function does never fail.
   It returns an empty list even if no key corresponds.
   Because the object of the return value is created with the function `tclistnew', it should be
   deleted with the function `tclistdel' when it is no longer in use.  Note that this function
   may be very slow because every key in the database is scanned. */
//C     TCLIST *tchdbfwmkeys2(TCHDB *hdb, const char *pstr, int max);
TCLIST * tchdbfwmkeys2(TCHDB *hdb, char *pstr, int max);


/* Add an integer to a record in a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `num' specifies the additional value.
   If successful, the return value is the summation value, else, it is `INT_MIN'.
   If the corresponding record exists, the value is treated as an integer and is added to.  If no
   record corresponds, a new record of the additional value is stored. */
//C     int tchdbaddint(TCHDB *hdb, const void *kbuf, int ksiz, int num);
int  tchdbaddint(TCHDB *hdb, void *kbuf, int ksiz, int num);


/* Add a real number to a record in a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `num' specifies the additional value.
   If successful, the return value is the summation value, else, it is Not-a-Number.
   If the corresponding record exists, the value is treated as a real number and is added to.  If
   no record corresponds, a new record of the additional value is stored. */
//C     double tchdbadddouble(TCHDB *hdb, const void *kbuf, int ksiz, double num);
double  tchdbadddouble(TCHDB *hdb, void *kbuf, int ksiz, double num);


/* Synchronize updated contents of a hash database object with the file and the device.
   `hdb' specifies the hash database object connected as a writer.
   If successful, the return value is true, else, it is false.
   This function is useful when another process connects to the same database file. */
//C     bool tchdbsync(TCHDB *hdb);
bool  tchdbsync(TCHDB *hdb);


/* Optimize the file of a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   `bnum' specifies the number of elements of the bucket array.  If it is not more than 0, the
   default value is specified.  The default value is two times of the number of records.
   `apow' specifies the size of record alignment by power of 2.  If it is negative, the current
   setting is not changed.
   `fpow' specifies the maximum number of elements of the free block pool by power of 2.  If it
   is negative, the current setting is not changed.
   `opts' specifies options by bitwise-or: `HDBTLARGE' specifies that the size of the database
   can be larger than 2GB by using 64-bit bucket array, `HDBTDEFLATE' specifies that each record
   is compressed with Deflate encoding, `HDBTBZIP' specifies that each record is compressed with
   BZIP2 encoding, `HDBTTCBS' specifies that each record is compressed with TCBS encoding.  If it
   is `UINT8_MAX', the current setting is not changed.
   If successful, the return value is true, else, it is false.
   This function is useful to reduce the size of the database file with data fragmentation by
   successive updating. */
//C     bool tchdboptimize(TCHDB *hdb, int64_t bnum, int8_t apow, int8_t fpow, uint8_t opts);
bool  tchdboptimize(TCHDB *hdb, int64_t bnum, int8_t apow, int8_t fpow, uint8_t opts);


/* Remove all records of a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   If successful, the return value is true, else, it is false. */
//C     bool tchdbvanish(TCHDB *hdb);
bool  tchdbvanish(TCHDB *hdb);


/* Copy the database file of a hash database object.
   `hdb' specifies the hash database object.
   `path' specifies the path of the destination file.  If it begins with `@', the trailing
   substring is executed as a command line.
   If successful, the return value is true, else, it is false.  False is returned if the executed
   command returns non-zero code.
   The database file is assured to be kept synchronized and not modified while the copying or
   executing operation is in progress.  So, this function is useful to create a backup file of
   the database file. */
//C     bool tchdbcopy(TCHDB *hdb, const char *path);
bool  tchdbcopy(TCHDB *hdb, char *path);


/* Begin the transaction of a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   If successful, the return value is true, else, it is false.
   The database is locked by the thread while the transaction so that only one transaction can be
   activated with a database object at the same time.  Thus, the serializable isolation level is
   assumed if every database operation is performed in the transaction.  All updated regions are
   kept track of by write ahead logging while the transaction.  If the database is closed during
   transaction, the transaction is aborted implicitly. */
//C     bool tchdbtranbegin(TCHDB *hdb);
bool  tchdbtranbegin(TCHDB *hdb);


/* Commit the transaction of a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   If successful, the return value is true, else, it is false.
   Update in the transaction is fixed when it is committed successfully. */
//C     bool tchdbtrancommit(TCHDB *hdb);
bool  tchdbtrancommit(TCHDB *hdb);


/* Abort the transaction of a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   If successful, the return value is true, else, it is false.
   Update in the transaction is discarded when it is aborted.  The state of the database is
   rollbacked to before transaction. */
//C     bool tchdbtranabort(TCHDB *hdb);
bool  tchdbtranabort(TCHDB *hdb);


/* Get the file path of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the path of the database file or `NULL' if the object does not connect to
   any database file. */
//C     const char *tchdbpath(TCHDB *hdb);
char * tchdbpath(TCHDB *hdb);


/* Get the number of records of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the number of records or 0 if the object does not connect to any database
   file. */
//C     uint64_t tchdbrnum(TCHDB *hdb);
uint64_t  tchdbrnum(TCHDB *hdb);


/* Get the size of the database file of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the size of the database file or 0 if the object does not connect to any
   database file. */
//C     uint64_t tchdbfsiz(TCHDB *hdb);
uint64_t  tchdbfsiz(TCHDB *hdb);



/*************************************************************************************************
 * features for experts
 *************************************************************************************************/


/* Set the error code of a hash database object.
   `hdb' specifies the hash database object.
   `ecode' specifies the error code.
   `file' specifies the file name of the code.
   `line' specifies the line number of the code.
   `func' specifies the function name of the code. */
//C     void tchdbsetecode(TCHDB *hdb, int ecode, const char *filename, int line, const char *func);
void  tchdbsetecode(TCHDB *hdb, int ecode, char *filename, int line, char *func);


/* Set the type of a hash database object.
   `hdb' specifies the hash database object.
   `type' specifies the database type. */
//C     void tchdbsettype(TCHDB *hdb, uint8_t type);
void  tchdbsettype(TCHDB *hdb, uint8_t type);


/* Set the file descriptor for debugging output.
   `hdb' specifies the hash database object.
   `fd' specifies the file descriptor for debugging output. */
//C     void tchdbsetdbgfd(TCHDB *hdb, int fd);
void  tchdbsetdbgfd(TCHDB *hdb, int fd);


/* Get the file descriptor for debugging output.
   `hdb' specifies the hash database object.
   The return value is the file descriptor for debugging output. */
//C     int tchdbdbgfd(TCHDB *hdb);
int  tchdbdbgfd(TCHDB *hdb);


/* Check whether mutual exclusion control is set to a hash database object.
   `hdb' specifies the hash database object.
   If mutual exclusion control is set, it is true, else it is false. */
//C     bool tchdbhasmutex(TCHDB *hdb);
bool  tchdbhasmutex(TCHDB *hdb);


/* Synchronize updating contents on memory of a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   `phys' specifies whether to synchronize physically.
   If successful, the return value is true, else, it is false. */
//C     bool tchdbmemsync(TCHDB *hdb, bool phys);
bool  tchdbmemsync(TCHDB *hdb, bool phys);


/* Get the number of elements of the bucket array of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the number of elements of the bucket array or 0 if the object does not
   connect to any database file. */
//C     uint64_t tchdbbnum(TCHDB *hdb);
uint64_t  tchdbbnum(TCHDB *hdb);


/* Get the record alignment of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the record alignment or 0 if the object does not connect to any database
   file. */
//C     uint32_t tchdbalign(TCHDB *hdb);
uint32_t  tchdbalign(TCHDB *hdb);


/* Get the maximum number of the free block pool of a a hash database object.
   `hdb' specifies the hash database object.
   The return value is the maximum number of the free block pool or 0 if the object does not
   connect to any database file. */
//C     uint32_t tchdbfbpmax(TCHDB *hdb);
uint32_t  tchdbfbpmax(TCHDB *hdb);


/* Get the size of the extra mapped memory of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the size of the extra mapped memory or 0 if the object does not connect to
   any database file. */
//C     uint64_t tchdbxmsiz(TCHDB *hdb);
uint64_t  tchdbxmsiz(TCHDB *hdb);


/* Get the inode number of the database file of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the inode number of the database file or 0 if the object does not connect
   to any database file. */
//C     uint64_t tchdbinode(TCHDB *hdb);
uint64_t  tchdbinode(TCHDB *hdb);


/* Get the modification time of the database file of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the inode number of the database file or 0 if the object does not connect
   to any database file. */
//C     time_t tchdbmtime(TCHDB *hdb);
time_t  tchdbmtime(TCHDB *hdb);


/* Get the connection mode of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the connection mode. */
//C     int tchdbomode(TCHDB *hdb);
int  tchdbomode(TCHDB *hdb);


/* Get the database type of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the database type. */
//C     uint8_t tchdbtype(TCHDB *hdb);
uint8_t  tchdbtype(TCHDB *hdb);


/* Get the additional flags of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the additional flags. */
//C     uint8_t tchdbflags(TCHDB *hdb);
uint8_t  tchdbflags(TCHDB *hdb);


/* Get the options of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the options. */
//C     uint8_t tchdbopts(TCHDB *hdb);
uint8_t  tchdbopts(TCHDB *hdb);


/* Get the pointer to the opaque field of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the pointer to the opaque field whose size is 128 bytes. */
//C     char *tchdbopaque(TCHDB *hdb);
char * tchdbopaque(TCHDB *hdb);


/* Get the number of used elements of the bucket array of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the number of used elements of the bucket array or 0 if the object does
   not connect to any database file. */
//C     uint64_t tchdbbnumused(TCHDB *hdb);
uint64_t  tchdbbnumused(TCHDB *hdb);


/* Set the custom codec functions of a hash database object.
   `hdb' specifies the hash database object.
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
//C     bool tchdbsetcodecfunc(TCHDB *hdb, TCCODEC enc, void *encop, TCCODEC dec, void *decop);
bool  tchdbsetcodecfunc(TCHDB *hdb, TCCODEC enc, void *encop, TCCODEC dec, void *decop);


/* Get the custom codec functions of a hash database object.
   `hdb' specifies the hash database object.
   `ep' specifies the pointer to a variable into which the pointer to the custom encoding
   function is assigned
   `eop' specifies the pointer to a variable into which the arbitrary pointer to be given to the
   encoding function is assigned.
   `dp' specifies the pointer to a variable into which the pointer to the custom decoding
   function is assigned
   `dop' specifies the pointer to a variable into which the arbitrary pointer to be given to the
   decoding function is assigned. */
//C     void tchdbcodecfunc(TCHDB *hdb, TCCODEC *ep, void **eop, TCCODEC *dp, void **dop);
void  tchdbcodecfunc(TCHDB *hdb, TCCODEC *ep, void **eop, TCCODEC *dp, void **dop);


/* Get the unit step number of auto defragmentation of a hash database object.
   `hdb' specifies the hash database object.
   The return value is the unit step number of auto defragmentation. */
//C     uint32_t tchdbdfunit(TCHDB *hdb);
uint32_t  tchdbdfunit(TCHDB *hdb);


/* Perform dynamic defragmentation of a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   `step' specifie the number of steps.  If it is not more than 0, the whole file is defragmented
   gradually without keeping a continuous lock.
   If successful, the return value is true, else, it is false. */
//C     bool tchdbdefrag(TCHDB *hdb, int64_t step);
bool  tchdbdefrag(TCHDB *hdb, int64_t step);


/* Clear the cache of a hash tree database object.
   `hdb' specifies the hash tree database object.
   If successful, the return value is true, else, it is false. */
//C     bool tchdbcacheclear(TCHDB *hdb);
bool  tchdbcacheclear(TCHDB *hdb);


/* Store a record into a hash database object with a duplication handler.
   `hdb' specifies the hash database object connected as a writer.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.  `NULL' means that record addition is
   ommited if there is no corresponding record.
   `vsiz' specifies the size of the region of the value.
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
//C     bool tchdbputproc(TCHDB *hdb, const void *kbuf, int ksiz, const void *vbuf, int vsiz,
//C                       TCPDPROC proc, void *op);
bool  tchdbputproc(TCHDB *hdb, void *kbuf, int ksiz, void *vbuf, int vsiz, TCPDPROC proc, void *op);


/* Retrieve the next record of a record in a hash database object.
   `hdb' specifies the hash database object.
   `kbuf' specifies the pointer to the region of the key.  If it is `NULL', the first record is
   retrieved.
   `ksiz' specifies the size of the region of the key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the key of the next record.
   `NULL' is returned if no record corresponds.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when
   it is no longer in use. */
//C     void *tchdbgetnext(TCHDB *hdb, const void *kbuf, int ksiz, int *sp);
void * tchdbgetnext(TCHDB *hdb, void *kbuf, int ksiz, int *sp);


/* Retrieve the next string record in a hash database object.
   `hdb' specifies the hash database object.
   `kstr' specifies the string of the key.  If it is `NULL', the first record is retrieved.
   If successful, the return value is the string of the key of the next record.  `NULL' is
   returned if no record corresponds.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tchdbgetnext2(TCHDB *hdb, const char *kstr);
char * tchdbgetnext2(TCHDB *hdb, char *kstr);


/* Retrieve the key and the value of the next record of a record in a hash database object.
   `hdb' specifies the hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   `vbp' specifies the pointer to the variable into which the pointer to the value is assigned.
   `vsp' specifies the pointer to the variable into which the size of the value is assigned.
   If successful, the return value is the pointer to the region of the key of the next
   record.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use.  The retion pointed to by `vbp'
   should not be released. */
//C     char *tchdbgetnext3(TCHDB *hdb, const char *kbuf, int ksiz, int *sp, const char **vbp, int *vsp);
char * tchdbgetnext3(TCHDB *hdb, char *kbuf, int ksiz, int *sp, char **vbp, int *vsp);


/* Move the iterator to the record corresponding a key of a hash database object.
   `hdb' specifies the hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   If successful, the return value is true, else, it is false.  False is returned if there is
   no record corresponding the condition. */
//C     bool tchdbiterinit2(TCHDB *hdb, const void *kbuf, int ksiz);
bool  tchdbiterinit2(TCHDB *hdb, void *kbuf, int ksiz);


/* Move the iterator to the record corresponding a key string of a hash database object.
   `hdb' specifies the hash database object.
   `kstr' specifies the string of the key.
   If successful, the return value is true, else, it is false.  False is returned if there is
   no record corresponding the condition. */
//C     bool tchdbiterinit3(TCHDB *hdb, const char *kstr);
bool  tchdbiterinit3(TCHDB *hdb, char *kstr);


/* Process each record atomically of a hash database object.
   `hdb' specifies the hash database object.
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
//C     bool tchdbforeach(TCHDB *hdb, TCITER iter, void *op);
bool  tchdbforeach(TCHDB *hdb, TCITER iter, void *op);


/* Void the transaction of a hash database object.
   `hdb' specifies the hash database object connected as a writer.
   If successful, the return value is true, else, it is false.
   This function should be called only when no update in the transaction. */
//C     bool tchdbtranvoid(TCHDB *hdb);
bool  tchdbtranvoid(TCHDB *hdb);



//C     __TCHDB_CLINKAGEEND
//C     #endif                                   /* duplication check */


/* END OF FILE */
