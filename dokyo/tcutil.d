/* Converted to D from tcutil.h by htod */
module tcutil;
/*************************************************************************************************
 * The utility API of Tokyo Cabinet
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


//C     #ifndef _TCUTIL_H                        /* duplication check */
//C     #define _TCUTIL_H

//C     #if defined(__cplusplus)
//C     #define __TCUTIL_CLINKAGEBEGIN extern "C" {
//C     #define __TCUTIL_CLINKAGEEND }
//C     #else
//C     #define __TCUTIL_CLINKAGEBEGIN
//C     #define __TCUTIL_CLINKAGEEND
//C     #endif
//C     __TCUTIL_CLINKAGEBEGIN


//C     #include <stdlib.h>
public import tango.stdc.stdlib;
//C     #if ! defined(__cplusplus)
//C     #include <stdbool.h>
//import std.c.stdbool;
//C     #endif
//C     #include <stdint.h>
public import tango.stdc.stdint;
//C     #include <time.h>
public import tango.stdc.time;
//C     #include <limits.h>
public import tango.stdc.limits;
//C     #include <math.h>
public import tango.stdc.math;



/*************************************************************************************************
 * basic utilities
 *************************************************************************************************/


/* String containing the version information. */
//C     extern const char *tcversion;
extern (C):
extern char *tcversion;


/* Pointer to the call back function for handling a fatal error.
   The argument specifies the error message.
   The initial value of this variable is `NULL'.  If the value is `NULL', the default function is
   called when a fatal error occurs.  A fatal error occurs when memory allocation is failed. */
//C     extern void (*tcfatalfunc)(const char *);
extern void  function(char *)tcfatalfunc;


/* Allocate a region on memory.
   `size' specifies the size of the region.
   The return value is the pointer to the allocated region.
   This function handles failure of memory allocation implicitly.  Because the region of the
   return value is allocated with the `malloc' call, it should be released with the `free' call
   when it is no longer in use. */
//C     void *tcmalloc(size_t size);
void * tcmalloc(size_t size);


/* Allocate a nullified region on memory.
   `nmemb' specifies the number of elements.
   `size' specifies the size of each element.
   The return value is the pointer to the allocated nullified region.
   This function handles failure of memory allocation implicitly.  Because the region of the
   return value is allocated with the `calloc' call, it should be released with the `free' call
   when it is no longer in use. */
//C     void *tccalloc(size_t nmemb, size_t size);
void * tccalloc(size_t nmemb, size_t size);


/* Re-allocate a region on memory.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   The return value is the pointer to the re-allocated region.
   This function handles failure of memory allocation implicitly.  Because the region of the
   return value is allocated with the `realloc' call, it should be released with the `free' call
   when it is no longer in use. */
//C     void *tcrealloc(void *ptr, size_t size);
void * tcrealloc(void *ptr, size_t size);


/* Duplicate a region on memory.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   The return value is the pointer to the allocated region of the duplicate.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when
   it is no longer in use. */
//C     void *tcmemdup(const void *ptr, size_t size);
void * tcmemdup(void *ptr, size_t size);


/* Duplicate a string on memory.
   `str' specifies the string.
   The return value is the allocated string equivalent to the specified string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcstrdup(const void *str);
char * tcstrdup(void *str);


/* Free a region on memory.
   `ptr' specifies the pointer to the region.  If it is `NULL', this function has no effect.
   Although this function is just a wrapper of `free' call, this is useful in applications using
   another package of the `malloc' series. */
//C     void tcfree(void *ptr);
void  tcfree(void *ptr);



/*************************************************************************************************
 * basic utilities (for experts)
 *************************************************************************************************/


/* type of the pointer to a comparison function.
   `aptr' specifies the pointer to the region of one key.
   `asiz' specifies the size of the region of one key.
   `bptr' specifies the pointer to the region of the other key.
   `bsiz' specifies the size of the region of the other key.
   `op' specifies the pointer to the optional opaque object.
   The return value is positive if the former is big, negative if the latter is big, 0 if both
   are equivalent. */
//C     typedef int (*TCCMP)(const char *aptr, int asiz, const char *bptr, int bsiz, void *op);
alias int  function(char *aptr, int asiz, char *bptr, int bsiz, void *op)TCCMP;

/* type of the pointer to a encoding or decoding function.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   `op' specifies the pointer to the optional opaque object.
   If successful, the return value is the pointer to the result object allocated with `malloc'
   call, else, it is `NULL'. */
//C     typedef void *(*TCCODEC)(const void *ptr, int size, int *sp, void *op);
alias void * function(void *ptr, int size, int *sp, void *op)TCCODEC;

/* type of the pointer to a callback function to process record duplication.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   `op' specifies the pointer to the optional opaque object.
   The return value is the pointer to the result object allocated with `malloc'.  It is
   released by the caller.  If it is `NULL', the record is not modified. */
//C     typedef void *(*TCPDPROC)(const void *vbuf, int vsiz, int *sp, void *op);
alias void * function(void *vbuf, int vsiz, int *sp, void *op)TCPDPROC;

/* type of the pointer to a iterator function.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   `op' specifies the pointer to the optional opaque object.
   The return value is true to continue iteration or false to stop iteration. */
//C     typedef bool (*TCITER)(const void *kbuf, int ksiz, const void *vbuf, int vsiz, void *op);
alias bool  function(void *kbuf, int ksiz, void *vbuf, int vsiz, void *op)TCITER;



/*************************************************************************************************
 * extensible string
 *************************************************************************************************/


//C     typedef struct {                         /* type of structure for an extensible string object */
//C       char *ptr;                             /* pointer to the region */
//C       int size;                              /* size of the region */
//C       int asize;                             /* size of the allocated region */
//C     } TCXSTR;
struct _N1
{
    char *ptr;
    int size;
    int asize;
}
alias _N1 TCXSTR;


/* Create an extensible string object.
   The return value is the new extensible string object. */
//C     TCXSTR *tcxstrnew(void);
TCXSTR * tcxstrnew();


/* Create an extensible string object from a character string.
   `str' specifies the string of the initial content.
   The return value is the new extensible string object containing the specified string. */
//C     TCXSTR *tcxstrnew2(const char *str);
TCXSTR * tcxstrnew2(char *str);


/* Create an extensible string object with the initial allocation size.
   `asiz' specifies the initial allocation size.
   The return value is the new extensible string object. */
//C     TCXSTR *tcxstrnew3(int asiz);
TCXSTR * tcxstrnew3(int asiz);


/* Copy an extensible string object.
   `xstr' specifies the extensible string object.
   The return value is the new extensible string object equivalent to the specified object. */
//C     TCXSTR *tcxstrdup(const TCXSTR *xstr);
TCXSTR * tcxstrdup(TCXSTR *xstr);


/* Delete an extensible string object.
   `xstr' specifies the extensible string object.
   Note that the deleted object and its derivatives can not be used anymore. */
//C     void tcxstrdel(TCXSTR *xstr);
void  tcxstrdel(TCXSTR *xstr);


/* Concatenate a region to the end of an extensible string object.
   `xstr' specifies the extensible string object.
   `ptr' specifies the pointer to the region to be appended.
   `size' specifies the size of the region. */
//C     void tcxstrcat(TCXSTR *xstr, const void *ptr, int size);
void  tcxstrcat(TCXSTR *xstr, void *ptr, int size);


/* Concatenate a character string to the end of an extensible string object.
   `xstr' specifies the extensible string object.
   `str' specifies the string to be appended. */
//C     void tcxstrcat2(TCXSTR *xstr, const char *str);
void  tcxstrcat2(TCXSTR *xstr, char *str);


/* Get the pointer of the region of an extensible string object.
   `xstr' specifies the extensible string object.
   The return value is the pointer of the region of the object.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string. */
//C     const void *tcxstrptr(const TCXSTR *xstr);
void * tcxstrptr(TCXSTR *xstr);


/* Get the size of the region of an extensible string object.
   `xstr' specifies the extensible string object.
   The return value is the size of the region of the object. */
//C     int tcxstrsize(const TCXSTR *xstr);
int  tcxstrsize(TCXSTR *xstr);


/* Clear an extensible string object.
   `xstr' specifies the extensible string object.
   The internal buffer of the object is cleared and the size is set zero. */
//C     void tcxstrclear(TCXSTR *xstr);
void  tcxstrclear(TCXSTR *xstr);


/* Perform formatted output into an extensible string object.
   `xstr' specifies the extensible string object.
   `format' specifies the printf-like format string.  The conversion character `%' can be used
   with such flag characters as `s', `d', `o', `u', `x', `X', `c', `e', `E', `f', `g', `G', `@',
   `?', `b', and `%'.  `@' works as with `s' but escapes meta characters of XML.  `?' works as
   with `s' but escapes meta characters of URL.  `b' converts an integer to the string as binary
   numbers.  The other conversion character work as with each original.
   The other arguments are used according to the format string. */
//C     void tcxstrprintf(TCXSTR *xstr, const char *format, ...);
void  tcxstrprintf(TCXSTR *xstr, char *format,...);


/* Allocate a formatted string on memory.
   `format' specifies the printf-like format string.  The conversion character `%' can be used
   with such flag characters as `s', `d', `o', `u', `x', `X', `c', `e', `E', `f', `g', `G', `@',
   `?', `b', and `%'.  `@' works as with `s' but escapes meta characters of XML.  `?' works as
   with `s' but escapes meta characters of URL.  `b' converts an integer to the string as binary
   numbers.  The other conversion character work as with each original.
   The other arguments are used according to the format string.
   The return value is the pointer to the region of the result string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcsprintf(const char *format, ...);
char * tcsprintf(char *format,...);



/*************************************************************************************************
 * extensible string (for experts)
 *************************************************************************************************/


/* Convert an extensible string object into a usual allocated region.
   `xstr' specifies the extensible string object.
   The return value is the pointer to the allocated region of the object.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when it
   is no longer in use.  Because the region of the original object is deleted, it should not be
   deleted again. */
//C     void *tcxstrtomalloc(TCXSTR *xstr);
void * tcxstrtomalloc(TCXSTR *xstr);


/* Create an extensible string object from an allocated region.
   `ptr' specifies the pointer to the region allocated with `malloc' call.
   `size' specifies the size of the region.
   The return value is the new extensible string object wrapping the specified region.
   Note that the specified region is released when the object is deleted. */
//C     TCXSTR *tcxstrfrommalloc(void *ptr, int size);
TCXSTR * tcxstrfrommalloc(void *ptr, int size);



/*************************************************************************************************
 * array list
 *************************************************************************************************/


//C     typedef struct {                         /* type of structure for an element of a list */
//C       char *ptr;                             /* pointer to the region */
//C       int size;                              /* size of the effective region */
//C     } TCLISTDATUM;
struct _N2
{
    char *ptr;
    int size;
}
alias _N2 TCLISTDATUM;

//C     typedef struct {                         /* type of structure for an array list */
//C       TCLISTDATUM *array;                    /* array of data */
//C       int anum;                              /* number of the elements of the array */
//C       int start;                             /* start index of used elements */
//C       int num;                               /* number of used elements */
//C     } TCLIST;
struct _N3
{
    TCLISTDATUM *array;
    int anum;
    int start;
    int num;
}
alias _N3 TCLIST;


/* Create a list object.
   The return value is the new list object. */
//C     TCLIST *tclistnew(void);
TCLIST * tclistnew();


/* Create a list object with expecting the number of elements.
   `anum' specifies the number of elements expected to be stored in the list.
   The return value is the new list object. */
//C     TCLIST *tclistnew2(int anum);
TCLIST * tclistnew2(int anum);


/* Create a list object with initial string elements.
   `str' specifies the string of the first element.
   The other arguments are other elements.  They should be trailed by a `NULL' argument.
   The return value is the new list object. */
//C     TCLIST *tclistnew3(const char *str, ...);
TCLIST * tclistnew3(char *str,...);


/* Copy a list object.
   `list' specifies the list object.
   The return value is the new list object equivalent to the specified object. */
//C     TCLIST *tclistdup(const TCLIST *list);
TCLIST * tclistdup(TCLIST *list);


/* Delete a list object.
   `list' specifies the list object.
   Note that the deleted object and its derivatives can not be used anymore. */
//C     void tclistdel(TCLIST *list);
void  tclistdel(TCLIST *list);


/* Get the number of elements of a list object.
   `list' specifies the list object.
   The return value is the number of elements of the list. */
//C     int tclistnum(const TCLIST *list);
int  tclistnum(TCLIST *list);


/* Get the pointer to the region of an element of a list object.
   `list' specifies the list object.
   `index' specifies the index of the element.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the value.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  If `index' is equal to or more than
   the number of elements, the return value is `NULL'. */
//C     const void *tclistval(const TCLIST *list, int index, int *sp);
void * tclistval(TCLIST *list, int index, int *sp);


/* Get the string of an element of a list object.
   `list' specifies the list object.
   `index' specifies the index of the element.
   The return value is the string of the value.
   If `index' is equal to or more than the number of elements, the return value is `NULL'. */
//C     const char *tclistval2(const TCLIST *list, int index);
char * tclistval2(TCLIST *list, int index);


/* Add an element at the end of a list object.
   `list' specifies the list object.
   `ptr' specifies the pointer to the region of the new element.
   `size' specifies the size of the region. */
//C     void tclistpush(TCLIST *list, const void *ptr, int size);
void  tclistpush(TCLIST *list, void *ptr, int size);


/* Add a string element at the end of a list object.
   `list' specifies the list object.
   `str' specifies the string of the new element. */
//C     void tclistpush2(TCLIST *list, const char *str);
void  tclistpush2(TCLIST *list, char *str);


/* Remove an element of the end of a list object.
   `list' specifies the list object.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the removed element.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when it
   is no longer in use.  If the list is empty, the return value is `NULL'. */
//C     void *tclistpop(TCLIST *list, int *sp);
void * tclistpop(TCLIST *list, int *sp);


/* Remove a string element of the end of a list object.
   `list' specifies the list object.
   The return value is the string of the removed element.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use.  If the list is empty, the return
   value is `NULL'. */
//C     char *tclistpop2(TCLIST *list);
char * tclistpop2(TCLIST *list);


/* Add an element at the top of a list object.
   `list' specifies the list object.
   `ptr' specifies the pointer to the region of the new element.
   `size' specifies the size of the region. */
//C     void tclistunshift(TCLIST *list, const void *ptr, int size);
void  tclistunshift(TCLIST *list, void *ptr, int size);


/* Add a string element at the top of a list object.
   `list' specifies the list object.
   `str' specifies the string of the new element. */
//C     void tclistunshift2(TCLIST *list, const char *str);
void  tclistunshift2(TCLIST *list, char *str);


/* Remove an element of the top of a list object.
   `list' specifies the list object.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the removed element.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when it
   is no longer in use.  If the list is empty, the return value is `NULL'. */
//C     void *tclistshift(TCLIST *list, int *sp);
void * tclistshift(TCLIST *list, int *sp);


/* Remove a string element of the top of a list object.
   `list' specifies the list object.
   The return value is the string of the removed element.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use.  If the list is empty, the return
   value is `NULL'. */
//C     char *tclistshift2(TCLIST *list);
char * tclistshift2(TCLIST *list);


/* Add an element at the specified location of a list object.
   `list' specifies the list object.
   `index' specifies the index of the new element.
   `ptr' specifies the pointer to the region of the new element.
   `size' specifies the size of the region.
   If `index' is equal to or more than the number of elements, this function has no effect. */
//C     void tclistinsert(TCLIST *list, int index, const void *ptr, int size);
void  tclistinsert(TCLIST *list, int index, void *ptr, int size);


/* Add a string element at the specified location of a list object.
   `list' specifies the list object.
   `index' specifies the index of the new element.
   `str' specifies the string of the new element.
   If `index' is equal to or more than the number of elements, this function has no effect. */
//C     void tclistinsert2(TCLIST *list, int index, const char *str);
void  tclistinsert2(TCLIST *list, int index, char *str);


/* Remove an element at the specified location of a list object.
   `list' specifies the list object.
   `index' specifies the index of the element to be removed.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the removed element.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when it
   is no longer in use.  If `index' is equal to or more than the number of elements, no element
   is removed and the return value is `NULL'. */
//C     void *tclistremove(TCLIST *list, int index, int *sp);
void * tclistremove(TCLIST *list, int index, int *sp);


/* Remove a string element at the specified location of a list object.
   `list' specifies the list object.
   `index' specifies the index of the element to be removed.
   The return value is the string of the removed element.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use.  If `index' is equal to or more
   than the number of elements, no element is removed and the return value is `NULL'. */
//C     char *tclistremove2(TCLIST *list, int index);
char * tclistremove2(TCLIST *list, int index);


/* Overwrite an element at the specified location of a list object.
   `list' specifies the list object.
   `index' specifies the index of the element to be overwritten.
   `ptr' specifies the pointer to the region of the new content.
   `size' specifies the size of the new content.
   If `index' is equal to or more than the number of elements, this function has no effect. */
//C     void tclistover(TCLIST *list, int index, const void *ptr, int size);
void  tclistover(TCLIST *list, int index, void *ptr, int size);


/* Overwrite a string element at the specified location of a list object.
   `list' specifies the list object.
   `index' specifies the index of the element to be overwritten.
   `str' specifies the string of the new content.
   If `index' is equal to or more than the number of elements, this function has no effect. */
//C     void tclistover2(TCLIST *list, int index, const char *str);
void  tclistover2(TCLIST *list, int index, char *str);


/* Sort elements of a list object in lexical order.
   `list' specifies the list object. */
//C     void tclistsort(TCLIST *list);
void  tclistsort(TCLIST *list);


/* Search a list object for an element using liner search.
   `list' specifies the list object.
   `ptr' specifies the pointer to the region of the key.
   `size' specifies the size of the region.
   The return value is the index of a corresponding element or -1 if there is no corresponding
   element.
   If two or more elements correspond, the former returns. */
//C     int tclistlsearch(const TCLIST *list, const void *ptr, int size);
int  tclistlsearch(TCLIST *list, void *ptr, int size);


/* Search a list object for an element using binary search.
   `list' specifies the list object.  It should be sorted in lexical order.
   `ptr' specifies the pointer to the region of the key.
   `size' specifies the size of the region.
   The return value is the index of a corresponding element or -1 if there is no corresponding
   element.
   If two or more elements correspond, which returns is not defined. */
//C     int tclistbsearch(const TCLIST *list, const void *ptr, int size);
int  tclistbsearch(TCLIST *list, void *ptr, int size);


/* Clear a list object.
   `list' specifies the list object.
   All elements are removed. */
//C     void tclistclear(TCLIST *list);
void  tclistclear(TCLIST *list);


/* Serialize a list object into a byte array.
   `list' specifies the list object.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the result serial region.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     void *tclistdump(const TCLIST *list, int *sp);
void * tclistdump(TCLIST *list, int *sp);


/* Create a list object from a serialized byte array.
   `ptr' specifies the pointer to the region of serialized byte array.
   `size' specifies the size of the region.
   The return value is a new list object.
   Because the object of the return value is created with the function `tclistnew', it should
   be deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tclistload(const void *ptr, int size);
TCLIST * tclistload(void *ptr, int size);



/*************************************************************************************************
 * array list (for experts)
 *************************************************************************************************/


/* Add an allocated element at the end of a list object.
   `list' specifies the list object.
   `ptr' specifies the pointer to the region allocated with `malloc' call.
   `size' specifies the size of the region.
   Note that the specified region is released when the object is deleted. */
//C     void tclistpushmalloc(TCLIST *list, void *ptr, int size);
void  tclistpushmalloc(TCLIST *list, void *ptr, int size);


/* Sort elements of a list object in case-insensitive lexical order.
   `list' specifies the list object. */
//C     void tclistsortci(TCLIST *list);
void  tclistsortci(TCLIST *list);


/* Sort elements of a list object by an arbitrary comparison function.
   `list' specifies the list object.
   `cmp' specifies the pointer to the comparison function.  The structure TCLISTDATUM has the
   member "ptr" which is the pointer to the region of the element, and the member "size" which is
   the size of the region. */
//C     void tclistsortex(TCLIST *list, int (*cmp)(const TCLISTDATUM *, const TCLISTDATUM *));
void  tclistsortex(TCLIST *list, int  function(TCLISTDATUM *, TCLISTDATUM *)cmp);


/* Invert elements of a list object.
   `list' specifies the list object. */
//C     void tclistinvert(TCLIST *list);
void  tclistinvert(TCLIST *list);


/* Perform formatted output into a list object.
   `list' specifies the list object.
   `format' specifies the printf-like format string.  The conversion character `%' can be used
   with such flag characters as `s', `d', `o', `u', `x', `X', `c', `e', `E', `f', `g', `G', `@',
   `?', `b', and `%'.  `@' works as with `s' but escapes meta characters of XML.  `?' works as
   with `s' but escapes meta characters of URL.  `b' converts an integer to the string as binary
   numbers.  The other conversion character work as with each original.
   The other arguments are used according to the format string. */
//C     void tclistprintf(TCLIST *list, const char *format, ...);
void  tclistprintf(TCLIST *list, char *format,...);



/*************************************************************************************************
 * hash map
 *************************************************************************************************/


//C     typedef struct _TCMAPREC {               /* type of structure for an element of a map */
//C       int32_t ksiz;                          /* size of the region of the key */
//C       int32_t vsiz;                          /* size of the region of the value */
//C       struct _TCMAPREC *left;                /* pointer to the left child */
//C       struct _TCMAPREC *right;               /* pointer to the right child */
//C       struct _TCMAPREC *prev;                /* pointer to the previous element */
//C       struct _TCMAPREC *next;                /* pointer to the next element */
//C     } TCMAPREC;
struct _TCMAPREC
{
    int32_t ksiz;
    int32_t vsiz;
    _TCMAPREC *left;
    _TCMAPREC *right;
    _TCMAPREC *prev;
    _TCMAPREC *next;
}
alias _TCMAPREC TCMAPREC;

//C     typedef struct {                         /* type of structure for a map */
//C       TCMAPREC **buckets;                    /* bucket array */
//C       TCMAPREC *first;                       /* pointer to the first element */
//C       TCMAPREC *last;                        /* pointer to the last element */
//C       TCMAPREC *cur;                         /* pointer to the current element */
//C       uint32_t bnum;                         /* number of buckets */
//C       uint64_t rnum;                         /* number of records */
//C       uint64_t msiz;                         /* total size of records */
//C     } TCMAP;
struct _N4
{
    TCMAPREC **buckets;
    TCMAPREC *first;
    TCMAPREC *last;
    TCMAPREC *cur;
    uint32_t bnum;
    uint64_t rnum;
    uint64_t msiz;
}
alias _N4 TCMAP;


/* Create a map object.
   The return value is the new map object. */
//C     TCMAP *tcmapnew(void);
TCMAP * tcmapnew();


/* Create a map object with specifying the number of the buckets.
   `bnum' specifies the number of the buckets.
   The return value is the new map object. */
//C     TCMAP *tcmapnew2(uint32_t bnum);
TCMAP * tcmapnew2(uint32_t bnum);


/* Create a map object with initial string elements.
   `str' specifies the string of the first element.
   The other arguments are other elements.  They should be trailed by a `NULL' argument.
   The return value is the new map object.
   The key and the value of each record are situated one after the other. */
//C     TCMAP *tcmapnew3(const char *str, ...);
TCMAP * tcmapnew3(char *str,...);


/* Copy a map object.
   `map' specifies the map object.
   The return value is the new map object equivalent to the specified object. */
//C     TCMAP *tcmapdup(const TCMAP *map);
TCMAP * tcmapdup(TCMAP *map);


/* Delete a map object.
   `map' specifies the map object.
   Note that the deleted object and its derivatives can not be used anymore. */
//C     void tcmapdel(TCMAP *map);
void  tcmapdel(TCMAP *map);


/* Store a record into a map object.
   `map' specifies the map object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If a record with the same key exists in the map, it is overwritten. */
//C     void tcmapput(TCMAP *map, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
void  tcmapput(TCMAP *map, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a string record into a map object.
   `map' specifies the map object.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If a record with the same key exists in the map, it is overwritten. */
//C     void tcmapput2(TCMAP *map, const char *kstr, const char *vstr);
void  tcmapput2(TCMAP *map, char *kstr, char *vstr);


/* Store a new record into a map object.
   `map' specifies the map object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the map, this function has no effect. */
//C     bool tcmapputkeep(TCMAP *map, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
bool  tcmapputkeep(TCMAP *map, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a new string record into a map object.
   `map' specifies the map object.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the map, this function has no effect. */
//C     bool tcmapputkeep2(TCMAP *map, const char *kstr, const char *vstr);
bool  tcmapputkeep2(TCMAP *map, char *kstr, char *vstr);


/* Concatenate a value at the end of the value of the existing record in a map object.
   `map' specifies the map object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If there is no corresponding record, a new record is created. */
//C     void tcmapputcat(TCMAP *map, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
void  tcmapputcat(TCMAP *map, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Concatenate a string value at the end of the value of the existing record in a map object.
   `map' specifies the map object.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If there is no corresponding record, a new record is created. */
//C     void tcmapputcat2(TCMAP *map, const char *kstr, const char *vstr);
void  tcmapputcat2(TCMAP *map, char *kstr, char *vstr);


/* Remove a record of a map object.
   `map' specifies the map object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   If successful, the return value is true.  False is returned when no record corresponds to
   the specified key. */
//C     bool tcmapout(TCMAP *map, const void *kbuf, int ksiz);
bool  tcmapout(TCMAP *map, void *kbuf, int ksiz);


/* Remove a string record of a map object.
   `map' specifies the map object.
   `kstr' specifies the string of the key.
   If successful, the return value is true.  False is returned when no record corresponds to
   the specified key. */
//C     bool tcmapout2(TCMAP *map, const char *kstr);
bool  tcmapout2(TCMAP *map, char *kstr);


/* Retrieve a record in a map object.
   `map' specifies the map object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the value of the
   corresponding record.  `NULL' is returned when no record corresponds.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string. */
//C     const void *tcmapget(const TCMAP *map, const void *kbuf, int ksiz, int *sp);
void * tcmapget(TCMAP *map, void *kbuf, int ksiz, int *sp);


/* Retrieve a string record in a map object.
   `map' specifies the map object.
   `kstr' specifies the string of the key.
   If successful, the return value is the string of the value of the corresponding record.
   `NULL' is returned when no record corresponds. */
//C     const char *tcmapget2(const TCMAP *map, const char *kstr);
char * tcmapget2(TCMAP *map, char *kstr);


/* Move a record to the edge of a map object.
   `map' specifies the map object.
   `kbuf' specifies the pointer to the region of a key.
   `ksiz' specifies the size of the region of the key.
   `head' specifies the destination which is the head if it is true or the tail if else.
   If successful, the return value is true.  False is returned when no record corresponds to
   the specified key. */
//C     bool tcmapmove(TCMAP *map, const void *kbuf, int ksiz, bool head);
bool  tcmapmove(TCMAP *map, void *kbuf, int ksiz, bool head);


/* Move a string record to the edge of a map object.
   `map' specifies the map object.
   `kstr' specifies the string of a key.
   `head' specifies the destination which is the head if it is true or the tail if else.
   If successful, the return value is true.  False is returned when no record corresponds to
   the specified key. */
//C     bool tcmapmove2(TCMAP *map, const char *kstr, bool head);
bool  tcmapmove2(TCMAP *map, char *kstr, bool head);


/* Initialize the iterator of a map object.
   `map' specifies the map object.
   The iterator is used in order to access the key of every record stored in the map object. */
//C     void tcmapiterinit(TCMAP *map);
void  tcmapiterinit(TCMAP *map);


/* Get the next key of the iterator of a map object.
   `map' specifies the map object.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the next key, else, it is
   `NULL'.  `NULL' is returned when no record can be fetched from the iterator.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.
   The order of iteration is assured to be the same as the stored order. */
//C     const void *tcmapiternext(TCMAP *map, int *sp);
void * tcmapiternext(TCMAP *map, int *sp);


/* Get the next key string of the iterator of a map object.
   `map' specifies the map object.
   If successful, the return value is the pointer to the region of the next key, else, it is
   `NULL'.  `NULL' is returned when no record can be fetched from the iterator.
   The order of iteration is assured to be the same as the stored order. */
//C     const char *tcmapiternext2(TCMAP *map);
char * tcmapiternext2(TCMAP *map);


/* Get the number of records stored in a map object.
   `map' specifies the map object.
   The return value is the number of the records stored in the map object. */
//C     uint64_t tcmaprnum(const TCMAP *map);
uint64_t  tcmaprnum(TCMAP *map);


/* Get the total size of memory used in a map object.
   `map' specifies the map object.
   The return value is the total size of memory used in a map object. */
//C     uint64_t tcmapmsiz(const TCMAP *map);
uint64_t  tcmapmsiz(TCMAP *map);


/* Create a list object containing all keys in a map object.
   `map' specifies the map object.
   The return value is the new list object containing all keys in the map object.
   Because the object of the return value is created with the function `tclistnew', it should
   be deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tcmapkeys(const TCMAP *map);
TCLIST * tcmapkeys(TCMAP *map);


/* Create a list object containing all values in a map object.
   `map' specifies the map object.
   The return value is the new list object containing all values in the map object.
   Because the object of the return value is created with the function `tclistnew', it should
   be deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tcmapvals(const TCMAP *map);
TCLIST * tcmapvals(TCMAP *map);


/* Add an integer to a record in a map object.
   `map' specifies the map object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `num' specifies the additional value.
   The return value is the summation value.
   If the corresponding record exists, the value is treated as an integer and is added to.  If no
   record corresponds, a new record of the additional value is stored. */
//C     int tcmapaddint(TCMAP *map, const void *kbuf, int ksiz, int num);
int  tcmapaddint(TCMAP *map, void *kbuf, int ksiz, int num);


/* Add a real number to a record in a map object.
   `map' specifies the map object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `num' specifies the additional value.
   The return value is the summation value.
   If the corresponding record exists, the value is treated as a real number and is added to.  If
   no record corresponds, a new record of the additional value is stored. */
//C     double tcmapadddouble(TCMAP *map, const void *kbuf, int ksiz, double num);
double  tcmapadddouble(TCMAP *map, void *kbuf, int ksiz, double num);


/* Clear a map object.
   `map' specifies the map object.
   All records are removed. */
//C     void tcmapclear(TCMAP *map);
void  tcmapclear(TCMAP *map);


/* Remove front records of a map object.
   `map' specifies the map object.
   `num' specifies the number of records to be removed. */
//C     void tcmapcutfront(TCMAP *map, int num);
void  tcmapcutfront(TCMAP *map, int num);


/* Serialize a map object into a byte array.
   `map' specifies the map object.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the result serial region.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     void *tcmapdump(const TCMAP *map, int *sp);
void * tcmapdump(TCMAP *map, int *sp);


/* Create a map object from a serialized byte array.
   `ptr' specifies the pointer to the region of serialized byte array.
   `size' specifies the size of the region.
   The return value is a new map object.
   Because the object of the return value is created with the function `tcmapnew', it should be
   deleted with the function `tcmapdel' when it is no longer in use. */
//C     TCMAP *tcmapload(const void *ptr, int size);
TCMAP * tcmapload(void *ptr, int size);



/*************************************************************************************************
 * hash map (for experts)
 *************************************************************************************************/


/* Store a record and make it semivolatile in a map object.
   `map' specifies the map object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If a record with the same key exists in the map, it is overwritten.  The record is moved to
   the tail. */
//C     void tcmapput3(TCMAP *map, const void *kbuf, int ksiz, const char *vbuf, int vsiz);
void  tcmapput3(TCMAP *map, void *kbuf, int ksiz, char *vbuf, int vsiz);


/* Store a record of the value of two regions into a map object.
   `map' specifies the map object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `fvbuf' specifies the pointer to the former region of the value.
   `fvsiz' specifies the size of the former region of the value.
   `lvbuf' specifies the pointer to the latter region of the value.
   `lvsiz' specifies the size of the latter region of the value.
   If a record with the same key exists in the map, it is overwritten. */
//C     void tcmapput4(TCMAP *map, const void *kbuf, int ksiz,
//C                    const void *fvbuf, int fvsiz, const void *lvbuf, int lvsiz);
void  tcmapput4(TCMAP *map, void *kbuf, int ksiz, void *fvbuf, int fvsiz, void *lvbuf, int lvsiz);


/* Concatenate a value at the existing record and make it semivolatile in a map object.
   `map' specifies the map object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If there is no corresponding record, a new record is created. */
//C     void tcmapputcat3(TCMAP *map, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
void  tcmapputcat3(TCMAP *map, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a record into a map object with a duplication handler.
   `map' specifies the map object.
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
   If successful, the return value is true, else, it is false. */
//C     bool tcmapputproc(TCMAP *map, const void *kbuf, int ksiz, const void *vbuf, int vsiz,
//C                       TCPDPROC proc, void *op);
bool  tcmapputproc(TCMAP *map, void *kbuf, int ksiz, void *vbuf, int vsiz, TCPDPROC proc, void *op);


/* Retrieve a semivolatile record in a map object.
   `map' specifies the map object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the value of the
   corresponding record.  `NULL' is returned when no record corresponds.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  The internal region of the returned
   record is moved to the tail so that the record will survive for a time under LRU cache
   algorithm removing records from the head. */
//C     const void *tcmapget3(TCMAP *map, const void *kbuf, int ksiz, int *sp);
void * tcmapget3(TCMAP *map, void *kbuf, int ksiz, int *sp);


/* Retrieve a string record in a map object with specifying the default value string.
   `map' specifies the map object.
   `kstr' specifies the string of the key.
   `dstr' specifies the string of the default value.
   The return value is the string of the value of the corresponding record or the default value
   string. */
//C     const char *tcmapget4(TCMAP *map, const char *kstr, const char *dstr);
char * tcmapget4(TCMAP *map, char *kstr, char *dstr);


/* Initialize the iterator of a map object at the record corresponding a key.
   `map' specifies the map object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   If there is no record corresponding the condition, the iterator is not modified. */
//C     void tcmapiterinit2(TCMAP *map, const void *kbuf, int ksiz);
void  tcmapiterinit2(TCMAP *map, void *kbuf, int ksiz);


/* Initialize the iterator of a map object at the record corresponding a key string.
   `map' specifies the map object.
   `kstr' specifies the string of the key.
   If there is no record corresponding the condition, the iterator is not modified. */
//C     void tcmapiterinit3(TCMAP *map, const char *kstr);
void  tcmapiterinit3(TCMAP *map, char *kstr);


/* Get the value bound to the key fetched from the iterator of a map object.
   `kbuf' specifies the pointer to the region of the iteration key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the value of the corresponding record.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string. */
//C     const void *tcmapiterval(const void *kbuf, int *sp);
void * tcmapiterval(void *kbuf, int *sp);


/* Get the value string bound to the key fetched from the iterator of a map object.
   `kstr' specifies the string of the iteration key.
   The return value is the pointer to the region of the value of the corresponding record. */
//C     const char *tcmapiterval2(const char *kstr);
char * tcmapiterval2(char *kstr);


/* Create an array of strings of all keys in a map object.
   `map' specifies the map object.
   `np' specifies the pointer to a variable into which the number of elements of the return value
   is assigned.
   The return value is the pointer to the array of all string keys in the map object.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call if when is no longer in use.  Note that elements of the array
   point to the inner objects, whose life duration is synchronous with the map object. */
//C     const char **tcmapkeys2(const TCMAP *map, int *np);
char ** tcmapkeys2(TCMAP *map, int *np);


/* Create an array of strings of all values in a map object.
   `map' specifies the map object.
   `np' specifies the pointer to a variable into which the number of elements of the return value
   is assigned.
   The return value is the pointer to the array of all string values in the map object.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call if when is no longer in use.  Note that elements of the array
   point to the inner objects, whose life duration is synchronous with the map object. */
//C     const char **tcmapvals2(const TCMAP *map, int *np);
char ** tcmapvals2(TCMAP *map, int *np);


/* Extract a map record from a serialized byte array.
   `ptr' specifies the pointer to the region of serialized byte array.
   `size' specifies the size of the region.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the value of the
   corresponding record.  `NULL' is returned when no record corresponds.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string. */
//C     void *tcmaploadone(const void *ptr, int size, const void *kbuf, int ksiz, int *sp);
void * tcmaploadone(void *ptr, int size, void *kbuf, int ksiz, int *sp);


/* Perform formatted output into a map object.
   `map' specifies the map object.
   `kstr' specifies the string of the key.
   `format' specifies the printf-like format string.  The conversion character `%' can be used
   with such flag characters as `s', `d', `o', `u', `x', `X', `c', `e', `E', `f', `g', `G', `@',
   `?', `b', and `%'.  `@' works as with `s' but escapes meta characters of XML.  `?' works as
   with `s' but escapes meta characters of URL.  `b' converts an integer to the string as binary
   numbers.  The other conversion character work as with each original.
   The other arguments are used according to the format string. */
//C     void tcmapprintf(TCMAP *map, const char *kstr, const char *format, ...);
void  tcmapprintf(TCMAP *map, char *kstr, char *format,...);



/*************************************************************************************************
 * ordered tree
 *************************************************************************************************/


//C     typedef struct _TCTREEREC {              /* type of structure for an element of a tree */
//C       int32_t ksiz;                          /* size of the region of the key */
//C       int32_t vsiz;                          /* size of the region of the value */
//C       struct _TCTREEREC *left;               /* pointer to the left child */
//C       struct _TCTREEREC *right;              /* pointer to the right child */
//C     } TCTREEREC;
struct _TCTREEREC
{
    int32_t ksiz;
    int32_t vsiz;
    _TCTREEREC *left;
    _TCTREEREC *right;
}
alias _TCTREEREC TCTREEREC;

//C     typedef struct {                         /* type of structure for a tree */
//C       TCTREEREC *root;                       /* pointer to the root element */
//C       TCTREEREC *cur;                        /* pointer to the current element */
//C       uint64_t rnum;                         /* number of records */
//C       uint64_t msiz;                         /* total size of records */
//C       TCCMP cmp;                             /* pointer to the comparison function */
//C       void *cmpop;                           /* opaque object for the comparison function */
//C     } TCTREE;
struct _N5
{
    TCTREEREC *root;
    TCTREEREC *cur;
    uint64_t rnum;
    uint64_t msiz;
    TCCMP cmp;
    void *cmpop;
}
alias _N5 TCTREE;


/* Create a tree object.
   The return value is the new tree object. */
//C     TCTREE *tctreenew(void);
TCTREE * tctreenew();


/* Create a tree object with specifying the custom comparison function.
   `cmp' specifies the pointer to the custom comparison function.  It receives five parameters.
   The first parameter is the pointer to the region of one key.  The second parameter is the size
   of the region of one key.  The third parameter is the pointer to the region of the other key.
   The fourth parameter is the size of the region of the other key.  The fifth parameter is the
   pointer to the optional opaque object.  It returns positive if the former is big, negative if
   the latter is big, 0 if both are equivalent.
   `cmpop' specifies an arbitrary pointer to be given as a parameter of the comparison function.
   If it is not needed, `NULL' can be specified.
   The return value is the new tree object.
   The default comparison function compares keys of two records by lexical order.  The functions
   `tccmplexical' (dafault), `tccmpdecimal', `tccmpint32', and `tccmpint64' are built-in. */
//C     TCTREE *tctreenew2(TCCMP cmp, void *cmpop);
TCTREE * tctreenew2(TCCMP cmp, void *cmpop);


/* Copy a tree object.
   `tree' specifies the tree object.
   The return value is the new tree object equivalent to the specified object. */
//C     TCTREE *tctreedup(const TCTREE *tree);
TCTREE * tctreedup(TCTREE *tree);


/* Delete a tree object.
   `tree' specifies the tree object.
   Note that the deleted object and its derivatives can not be used anymore. */
//C     void tctreedel(TCTREE *tree);
void  tctreedel(TCTREE *tree);


/* Store a record into a tree object.
   `tree' specifies the tree object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If a record with the same key exists in the tree, it is overwritten. */
//C     void tctreeput(TCTREE *tree, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
void  tctreeput(TCTREE *tree, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a string record into a tree object.
   `tree' specifies the tree object.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If a record with the same key exists in the tree, it is overwritten. */
//C     void tctreeput2(TCTREE *tree, const char *kstr, const char *vstr);
void  tctreeput2(TCTREE *tree, char *kstr, char *vstr);


/* Store a new record into a tree object.
   `tree' specifies the tree object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the tree, this function has no effect. */
//C     bool tctreeputkeep(TCTREE *tree, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
bool  tctreeputkeep(TCTREE *tree, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a new string record into a tree object.
   `tree' specifies the tree object.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the tree, this function has no effect. */
//C     bool tctreeputkeep2(TCTREE *tree, const char *kstr, const char *vstr);
bool  tctreeputkeep2(TCTREE *tree, char *kstr, char *vstr);


/* Concatenate a value at the end of the value of the existing record in a tree object.
   `tree' specifies the tree object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If there is no corresponding record, a new record is created. */
//C     void tctreeputcat(TCTREE *tree, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
void  tctreeputcat(TCTREE *tree, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Concatenate a string value at the end of the value of the existing record in a tree object.
   `tree' specifies the tree object.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If there is no corresponding record, a new record is created. */
//C     void tctreeputcat2(TCTREE *tree, const char *kstr, const char *vstr);
void  tctreeputcat2(TCTREE *tree, char *kstr, char *vstr);


/* Store a record into a tree object with a duplication handler.
   `tree' specifies the tree object.
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
   If successful, the return value is true, else, it is false. */
//C     bool tctreeputproc(TCTREE *tree, const void *kbuf, int ksiz, const void *vbuf, int vsiz,
//C                        TCPDPROC proc, void *op);
bool  tctreeputproc(TCTREE *tree, void *kbuf, int ksiz, void *vbuf, int vsiz, TCPDPROC proc, void *op);


/* Remove a record of a tree object.
   `tree' specifies the tree object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   If successful, the return value is true.  False is returned when no record corresponds to
   the specified key. */
//C     bool tctreeout(TCTREE *tree, const void *kbuf, int ksiz);
bool  tctreeout(TCTREE *tree, void *kbuf, int ksiz);


/* Remove a string record of a tree object.
   `tree' specifies the tree object.
   `kstr' specifies the string of the key.
   If successful, the return value is true.  False is returned when no record corresponds to
   the specified key. */
//C     bool tctreeout2(TCTREE *tree, const char *kstr);
bool  tctreeout2(TCTREE *tree, char *kstr);


/* Retrieve a record in a tree object.
   `tree' specifies the tree object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the value of the
   corresponding record.  `NULL' is returned when no record corresponds.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string. */
//C     const void *tctreeget(TCTREE *tree, const void *kbuf, int ksiz, int *sp);
void * tctreeget(TCTREE *tree, void *kbuf, int ksiz, int *sp);


/* Retrieve a string record in a tree object.
   `tree' specifies the tree object.
   `kstr' specifies the string of the key.
   If successful, the return value is the string of the value of the corresponding record.
   `NULL' is returned when no record corresponds. */
//C     const char *tctreeget2(TCTREE *tree, const char *kstr);
char * tctreeget2(TCTREE *tree, char *kstr);


/* Initialize the iterator of a tree object.
   `tree' specifies the tree object.
   The iterator is used in order to access the key of every record stored in the tree object. */
//C     void tctreeiterinit(TCTREE *tree);
void  tctreeiterinit(TCTREE *tree);


/* Get the next key of the iterator of a tree object.
   `tree' specifies the tree object.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the next key, else, it is
   `NULL'.  `NULL' is returned when no record can be fetched from the iterator.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.
   The order of iteration is assured to be ascending of the keys. */
//C     const void *tctreeiternext(TCTREE *tree, int *sp);
void * tctreeiternext(TCTREE *tree, int *sp);


/* Get the next key string of the iterator of a tree object.
   `tree' specifies the tree object.
   If successful, the return value is the pointer to the region of the next key, else, it is
   `NULL'.  `NULL' is returned when no record can be fetched from the iterator.
   The order of iteration is assured to be ascending of the keys. */
//C     const char *tctreeiternext2(TCTREE *tree);
char * tctreeiternext2(TCTREE *tree);


/* Get the number of records stored in a tree object.
   `tree' specifies the tree object.
   The return value is the number of the records stored in the tree object. */
//C     uint64_t tctreernum(const TCTREE *tree);
uint64_t  tctreernum(TCTREE *tree);


/* Get the total size of memory used in a tree object.
   `tree' specifies the tree object.
   The return value is the total size of memory used in a tree object. */
//C     uint64_t tctreemsiz(const TCTREE *tree);
uint64_t  tctreemsiz(TCTREE *tree);


/* Create a list object containing all keys in a tree object.
   `tree' specifies the tree object.
   The return value is the new list object containing all keys in the tree object.
   Because the object of the return value is created with the function `tclistnew', it should
   be deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tctreekeys(const TCTREE *tree);
TCLIST * tctreekeys(TCTREE *tree);


/* Create a list object containing all values in a tree object.
   `tree' specifies the tree object.
   The return value is the new list object containing all values in the tree object.
   Because the object of the return value is created with the function `tclistnew', it should
   be deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tctreevals(const TCTREE *tree);
TCLIST * tctreevals(TCTREE *tree);


/* Add an integer to a record in a tree object.
   `tree' specifies the tree object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `num' specifies the additional value.
   The return value is the summation value.
   If the corresponding record exists, the value is treated as an integer and is added to.  If no
   record corresponds, a new record of the additional value is stored. */
//C     int tctreeaddint(TCTREE *tree, const void *kbuf, int ksiz, int num);
int  tctreeaddint(TCTREE *tree, void *kbuf, int ksiz, int num);


/* Add a real number to a record in a tree object.
   `tree' specifies the tree object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `num' specifies the additional value.
   The return value is the summation value.
   If the corresponding record exists, the value is treated as a real number and is added to.  If
   no record corresponds, a new record of the additional value is stored. */
//C     double tctreeadddouble(TCTREE *tree, const void *kbuf, int ksiz, double num);
double  tctreeadddouble(TCTREE *tree, void *kbuf, int ksiz, double num);


/* Clear a tree object.
   `tree' specifies the tree object.
   All records are removed. */
//C     void tctreeclear(TCTREE *tree);
void  tctreeclear(TCTREE *tree);


/* Remove fringe records of a tree object.
   `tree' specifies the tree object.
   `num' specifies the number of records to be removed. */
//C     void tctreecutfringe(TCTREE *tree, int num);
void  tctreecutfringe(TCTREE *tree, int num);


/* Serialize a tree object into a byte array.
   `tree' specifies the tree object.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the result serial region.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     void *tctreedump(const TCTREE *tree, int *sp);
void * tctreedump(TCTREE *tree, int *sp);


/* Create a tree object from a serialized byte array.
   `ptr' specifies the pointer to the region of serialized byte array.
   `size' specifies the size of the region.
   `cmp' specifies the pointer to the custom comparison function.
   `cmpop' specifies an arbitrary pointer to be given as a parameter of the comparison function.
   If it is not needed, `NULL' can be specified.
   The return value is a new tree object.
   Because the object of the return value is created with the function `tctreenew', it should be
   deleted with the function `tctreedel' when it is no longer in use. */
//C     TCTREE *tctreeload(const void *ptr, int size, TCCMP cmp, void *cmpop);
TCTREE * tctreeload(void *ptr, int size, TCCMP cmp, void *cmpop);



/*************************************************************************************************
 * ordered tree (for experts)
 *************************************************************************************************/


/* Store a record into a tree object without balancing nodes.
   `tree' specifies the tree object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If a record with the same key exists in the tree, it is overwritten.  The structure of the
   tree is not modifed by this function. */
//C     void tctreeput3(TCTREE *tree, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
void  tctreeput3(TCTREE *tree, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a new record into a tree object without balancing nodes.
   `tree' specifies the tree object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the tree, this function has no effect.  The structure
   of the tree is not modifed by this function. */
//C     bool tctreeputkeep3(TCTREE *tree, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
bool  tctreeputkeep3(TCTREE *tree, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Concatenate a value at the existing record in a tree object without balancing nodes.
   `tree' specifies the tree object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If there is no corresponding record, a new record is created.  The structure of the tree is
   not modifed by this function. */
//C     void tctreeputcat3(TCTREE *tree, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
void  tctreeputcat3(TCTREE *tree, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Retrieve a record in a tree object without balancing nodes.
   `tree' specifies the tree object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the value of the
   corresponding record.  `NULL' is returned when no record corresponds.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  The structure of the tree is not
   modifed by this function. */
//C     const void *tctreeget3(const TCTREE *tree, const void *kbuf, int ksiz, int *sp);
void * tctreeget3(TCTREE *tree, void *kbuf, int ksiz, int *sp);


/* Retrieve a string record in a tree object with specifying the default value string.
   `tree' specifies the tree object.
   `kstr' specifies the string of the key.
   `dstr' specifies the string of the default value.
   The return value is the string of the value of the corresponding record or the default value
   string. */
//C     const char *tctreeget4(TCTREE *tree, const char *kstr, const char *dstr);
char * tctreeget4(TCTREE *tree, char *kstr, char *dstr);


/* Initialize the iterator of a tree object in front of records corresponding a key.
   `tree' specifies the tree object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   The iterator is set to the first record corresponding the key or the next substitute if
   completely matching record does not exist. */
//C     void tctreeiterinit2(TCTREE *tree, const void *kbuf, int ksiz);
void  tctreeiterinit2(TCTREE *tree, void *kbuf, int ksiz);


/* Initialize the iterator of a tree object in front of records corresponding a key string.
   `tree' specifies the tree object.
   `kstr' specifies the string of the key.
   The iterator is set to the first record corresponding the key or the next substitute if
   completely matching record does not exist. */
//C     void tctreeiterinit3(TCTREE *tree, const char *kstr);
void  tctreeiterinit3(TCTREE *tree, char *kstr);


/* Get the value bound to the key fetched from the iterator of a tree object.
   `kbuf' specifies the pointer to the region of the iteration key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the value of the corresponding record.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string. */
//C     const void *tctreeiterval(const void *kbuf, int *sp);
void * tctreeiterval(void *kbuf, int *sp);


/* Get the value string bound to the key fetched from the iterator of a tree object.
   `kstr' specifies the string of the iteration key.
   The return value is the pointer to the region of the value of the corresponding record. */
//C     const char *tctreeiterval2(const char *kstr);
char * tctreeiterval2(char *kstr);


/* Create an array of strings of all keys in a tree object.
   `tree' specifies the tree object.
   `np' specifies the pointer to a variable into which the number of elements of the return value
   is assigned.
   The return value is the pointer to the array of all string keys in the tree object.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call if when is no longer in use.  Note that elements of the array
   point to the inner objects, whose life duration is synchronous with the tree object. */
//C     const char **tctreekeys2(const TCTREE *tree, int *np);
char ** tctreekeys2(TCTREE *tree, int *np);


/* Create an array of strings of all values in a tree object.
   `tree' specifies the tree object.
   `np' specifies the pointer to a variable into which the number of elements of the return value
   is assigned.
   The return value is the pointer to the array of all string values in the tree object.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call if when is no longer in use.  Note that elements of the array
   point to the inner objects, whose life duration is synchronous with the tree object. */
//C     const char **tctreevals2(const TCTREE *tree, int *np);
char ** tctreevals2(TCTREE *tree, int *np);


/* Extract a tree record from a serialized byte array.
   `ptr' specifies the pointer to the region of serialized byte array.
   `size' specifies the size of the region.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the value of the
   corresponding record.  `NULL' is returned when no record corresponds.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string. */
//C     void *tctreeloadone(const void *ptr, int size, const void *kbuf, int ksiz, int *sp);
void * tctreeloadone(void *ptr, int size, void *kbuf, int ksiz, int *sp);


/* Perform formatted output into a tree object.
   `map' specifies the tree object.
   `kstr' specifies the string of the key.
   `format' specifies the printf-like format string.  The conversion character `%' can be used
   with such flag characters as `s', `d', `o', `u', `x', `X', `c', `e', `E', `f', `g', `G', `@',
   `?', `b', and `%'.  `@' works as with `s' but escapes meta characters of XML.  `?' works as
   with `s' but escapes meta characters of URL.  `b' converts an integer to the string as binary
   numbers.  The other conversion character work as with each original.
   The other arguments are used according to the format string. */
//C     void tctreeprintf(TCTREE *tree, const char *kstr, const char *format, ...);
void  tctreeprintf(TCTREE *tree, char *kstr, char *format,...);



/*************************************************************************************************
 * on-memory hash database
 *************************************************************************************************/


//C     typedef struct {                         /* type of structure for a on-memory hash database */
//C       void **mmtxs;                          /* mutexes for method */
//C       void *imtx;                            /* mutex for iterator */
//C       TCMAP **maps;                          /* internal map objects */
//C       int iter;                              /* index of maps for the iterator */
//C     } TCMDB;
struct _N6
{
    void **mmtxs;
    void *imtx;
    TCMAP **maps;
    int iter;
}
alias _N6 TCMDB;


/* Create an on-memory hash database object.
   The return value is the new on-memory hash database object.
   The object can be shared by plural threads because of the internal mutex. */
//C     TCMDB *tcmdbnew(void);
TCMDB * tcmdbnew();


/* Create an on-memory hash database object with specifying the number of the buckets.
   `bnum' specifies the number of the buckets.
   The return value is the new on-memory hash database object.
   The object can be shared by plural threads because of the internal mutex. */
//C     TCMDB *tcmdbnew2(uint32_t bnum);
TCMDB * tcmdbnew2(uint32_t bnum);


/* Delete an on-memory hash database object.
   `mdb' specifies the on-memory hash database object. */
//C     void tcmdbdel(TCMDB *mdb);
void  tcmdbdel(TCMDB *mdb);


/* Store a record into an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If a record with the same key exists in the database, it is overwritten. */
//C     void tcmdbput(TCMDB *mdb, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
void  tcmdbput(TCMDB *mdb, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a string record into an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If a record with the same key exists in the database, it is overwritten. */
//C     void tcmdbput2(TCMDB *mdb, const char *kstr, const char *vstr);
void  tcmdbput2(TCMDB *mdb, char *kstr, char *vstr);


/* Store a new record into an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, this function has no effect. */
//C     bool tcmdbputkeep(TCMDB *mdb, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
bool  tcmdbputkeep(TCMDB *mdb, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a new string record into an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, this function has no effect. */
//C     bool tcmdbputkeep2(TCMDB *mdb, const char *kstr, const char *vstr);
bool  tcmdbputkeep2(TCMDB *mdb, char *kstr, char *vstr);


/* Concatenate a value at the end of the existing record in an on-memory hash database.
   `mdb' specifies the on-memory hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If there is no corresponding record, a new record is created. */
//C     void tcmdbputcat(TCMDB *mdb, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
void  tcmdbputcat(TCMDB *mdb, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Concatenate a string at the end of the existing record in an on-memory hash database.
   `mdb' specifies the on-memory hash database object.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If there is no corresponding record, a new record is created. */
//C     void tcmdbputcat2(TCMDB *mdb, const char *kstr, const char *vstr);
void  tcmdbputcat2(TCMDB *mdb, char *kstr, char *vstr);


/* Remove a record of an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   If successful, the return value is true.  False is returned when no record corresponds to
   the specified key. */
//C     bool tcmdbout(TCMDB *mdb, const void *kbuf, int ksiz);
bool  tcmdbout(TCMDB *mdb, void *kbuf, int ksiz);


/* Remove a string record of an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kstr' specifies the string of the key.
   If successful, the return value is true.  False is returned when no record corresponds to
   the specified key. */
//C     bool tcmdbout2(TCMDB *mdb, const char *kstr);
bool  tcmdbout2(TCMDB *mdb, char *kstr);


/* Retrieve a record in an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the value of the
   corresponding record.  `NULL' is returned when no record corresponds.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when
   it is no longer in use. */
//C     void *tcmdbget(TCMDB *mdb, const void *kbuf, int ksiz, int *sp);
void * tcmdbget(TCMDB *mdb, void *kbuf, int ksiz, int *sp);


/* Retrieve a string record in an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kstr' specifies the string of the key.
   If successful, the return value is the string of the value of the corresponding record.
   `NULL' is returned when no record corresponds.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcmdbget2(TCMDB *mdb, const char *kstr);
char * tcmdbget2(TCMDB *mdb, char *kstr);


/* Get the size of the value of a record in an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   If successful, the return value is the size of the value of the corresponding record, else,
   it is -1. */
//C     int tcmdbvsiz(TCMDB *mdb, const void *kbuf, int ksiz);
int  tcmdbvsiz(TCMDB *mdb, void *kbuf, int ksiz);


/* Get the size of the value of a string record in an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kstr' specifies the string of the key.
   If successful, the return value is the size of the value of the corresponding record, else,
   it is -1. */
//C     int tcmdbvsiz2(TCMDB *mdb, const char *kstr);
int  tcmdbvsiz2(TCMDB *mdb, char *kstr);


/* Initialize the iterator of an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   The iterator is used in order to access the key of every record stored in the on-memory
   database. */
//C     void tcmdbiterinit(TCMDB *mdb);
void  tcmdbiterinit(TCMDB *mdb);


/* Get the next key of the iterator of an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the next key, else, it is
   `NULL'.  `NULL' is returned when no record can be fetched from the iterator.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when
   it is no longer in use.  The order of iteration is assured to be the same as the stored
   order. */
//C     void *tcmdbiternext(TCMDB *mdb, int *sp);
void * tcmdbiternext(TCMDB *mdb, int *sp);


/* Get the next key string of the iterator of an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   If successful, the return value is the pointer to the region of the next key, else, it is
   `NULL'.  `NULL' is returned when no record can be fetched from the iterator.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use.  The order of iteration is assured
   to be the same as the stored order. */
//C     char *tcmdbiternext2(TCMDB *mdb);
char * tcmdbiternext2(TCMDB *mdb);


/* Get forward matching keys in an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `pbuf' specifies the pointer to the region of the prefix.
   `psiz' specifies the size of the region of the prefix.
   `max' specifies the maximum number of keys to be fetched.  If it is negative, no limit is
   specified.
   The return value is a list object of the corresponding keys.  This function does never fail.
   It returns an empty list even if no key corresponds.
   Because the object of the return value is created with the function `tclistnew', it should be
   deleted with the function `tclistdel' when it is no longer in use.  Note that this function
   may be very slow because every key in the database is scanned. */
//C     TCLIST *tcmdbfwmkeys(TCMDB *mdb, const void *pbuf, int psiz, int max);
TCLIST * tcmdbfwmkeys(TCMDB *mdb, void *pbuf, int psiz, int max);


/* Get forward matching string keys in an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `pstr' specifies the string of the prefix.
   `max' specifies the maximum number of keys to be fetched.  If it is negative, no limit is
   specified.
   The return value is a list object of the corresponding keys.  This function does never fail.
   It returns an empty list even if no key corresponds.
   Because the object of the return value is created with the function `tclistnew', it should be
   deleted with the function `tclistdel' when it is no longer in use.  Note that this function
   may be very slow because every key in the database is scanned. */
//C     TCLIST *tcmdbfwmkeys2(TCMDB *mdb, const char *pstr, int max);
TCLIST * tcmdbfwmkeys2(TCMDB *mdb, char *pstr, int max);


/* Get the number of records stored in an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   The return value is the number of the records stored in the database. */
//C     uint64_t tcmdbrnum(TCMDB *mdb);
uint64_t  tcmdbrnum(TCMDB *mdb);


/* Get the total size of memory used in an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   The return value is the total size of memory used in the database. */
//C     uint64_t tcmdbmsiz(TCMDB *mdb);
uint64_t  tcmdbmsiz(TCMDB *mdb);


/* Add an integer to a record in an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `num' specifies the additional value.
   The return value is the summation value.
   If the corresponding record exists, the value is treated as an integer and is added to.  If no
   record corresponds, a new record of the additional value is stored. */
//C     int tcmdbaddint(TCMDB *mdb, const void *kbuf, int ksiz, int num);
int  tcmdbaddint(TCMDB *mdb, void *kbuf, int ksiz, int num);


/* Add a real number to a record in an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `num' specifies the additional value.
   The return value is the summation value.
   If the corresponding record exists, the value is treated as a real number and is added to.  If
   no record corresponds, a new record of the additional value is stored. */
//C     double tcmdbadddouble(TCMDB *mdb, const void *kbuf, int ksiz, double num);
double  tcmdbadddouble(TCMDB *mdb, void *kbuf, int ksiz, double num);


/* Clear an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   All records are removed. */
//C     void tcmdbvanish(TCMDB *mdb);
void  tcmdbvanish(TCMDB *mdb);


/* Remove front records of an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `num' specifies the number of records to be removed. */
//C     void tcmdbcutfront(TCMDB *mdb, int num);
void  tcmdbcutfront(TCMDB *mdb, int num);



/*************************************************************************************************
 * on-memory hash database (for experts)
 *************************************************************************************************/


/* Store a record and make it semivolatile in an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If a record with the same key exists in the map, it is overwritten.  The record is moved to
   the tail. */
//C     void tcmdbput3(TCMDB *mdb, const void *kbuf, int ksiz, const char *vbuf, int vsiz);
void  tcmdbput3(TCMDB *mdb, void *kbuf, int ksiz, char *vbuf, int vsiz);


/* Store a record of the value of two regions into an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `fvbuf' specifies the pointer to the former region of the value.
   `fvsiz' specifies the size of the former region of the value.
   `lvbuf' specifies the pointer to the latter region of the value.
   `lvsiz' specifies the size of the latter region of the value.
   If a record with the same key exists in the database, it is overwritten. */
//C     void tcmdbput4(TCMDB *mdb, const void *kbuf, int ksiz,
//C                    const void *fvbuf, int fvsiz, const void *lvbuf, int lvsiz);
void  tcmdbput4(TCMDB *mdb, void *kbuf, int ksiz, void *fvbuf, int fvsiz, void *lvbuf, int lvsiz);


/* Concatenate a value and make it semivolatile in on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If there is no corresponding record, a new record is created. */
//C     void tcmdbputcat3(TCMDB *mdb, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
void  tcmdbputcat3(TCMDB *mdb, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a record into a on-memory hash database object with a duplication handler.
   `mdb' specifies the on-memory hash database object.
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
   If successful, the return value is true, else, it is false. */
//C     bool tcmdbputproc(TCMDB *mdb, const void *kbuf, int ksiz, const void *vbuf, int vsiz,
//C                       TCPDPROC proc, void *op);
bool  tcmdbputproc(TCMDB *mdb, void *kbuf, int ksiz, void *vbuf, int vsiz, TCPDPROC proc, void *op);


/* Retrieve a record and move it astern in an on-memory hash database object.
   `mdb' specifies the on-memory hash database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the value of the
   corresponding record.  `NULL' is returned when no record corresponds.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return value
   is allocated with the `malloc' call, it should be released with the `free' call when it is no
   longer in use.  The internal region of the returned record is moved to the tail so that the
   record will survive for a time under LRU cache algorithm removing records from the head. */
//C     void *tcmdbget3(TCMDB *mdb, const void *kbuf, int ksiz, int *sp);
void * tcmdbget3(TCMDB *mdb, void *kbuf, int ksiz, int *sp);


/* Initialize the iterator of an on-memory map database object in front of a key.
   `mdb' specifies the on-memory map database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   If there is no record corresponding the condition, the iterator is not modified. */
//C     void tcmdbiterinit2(TCMDB *mdb, const void *kbuf, int ksiz);
void  tcmdbiterinit2(TCMDB *mdb, void *kbuf, int ksiz);


/* Initialize the iterator of an on-memory map database object in front of a key string.
   `mdb' specifies the on-memory map database object.
   `kstr' specifies the string of the key.
   If there is no record corresponding the condition, the iterator is not modified. */
//C     void tcmdbiterinit3(TCMDB *mdb, const char *kstr);
void  tcmdbiterinit3(TCMDB *mdb, char *kstr);


/* Process each record atomically of an on-memory hash database object.
   `iter' specifies the pointer to the iterator function called for each record.  It receives
   five parameters.  The first parameter is the pointer to the region of the key.  The second
   parameter is the size of the region of the key.  The third parameter is the pointer to the
   region of the value.  The fourth parameter is the size of the region of the value.  The fifth
   parameter is the pointer to the optional opaque object.  It returns true to continue iteration
   or false to stop iteration.
   `op' specifies an arbitrary pointer to be given as a parameter of the iterator function.  If
   it is not needed, `NULL' can be specified. */
//C     void tcmdbforeach(TCMDB *mdb, TCITER iter, void *op);
void  tcmdbforeach(TCMDB *mdb, TCITER iter, void *op);



/*************************************************************************************************
 * on-memory tree database
 *************************************************************************************************/


//C     typedef struct {                         /* type of structure for a on-memory tree database */
//C       void *mmtx;                            /* mutex for method */
//C       TCTREE *tree;                          /* internal tree object */
//C     } TCNDB;
struct _N7
{
    void *mmtx;
    TCTREE *tree;
}
alias _N7 TCNDB;


/* Create an on-memory tree database object.
   The return value is the new on-memory tree database object.
   The object can be shared by plural threads because of the internal mutex. */
//C     TCNDB *tcndbnew(void);
TCNDB * tcndbnew();


/* Create an on-memory tree database object with specifying the custom comparison function.
   `cmp' specifies the pointer to the custom comparison function.
   `cmpop' specifies an arbitrary pointer to be given as a parameter of the comparison function.
   If it is not needed, `NULL' can be specified.
   The return value is the new on-memory tree database object.
   The default comparison function compares keys of two records by lexical order.  The functions
   `tccmplexical' (dafault), `tccmpdecimal', `tccmpint32', and `tccmpint64' are built-in.  The
   object can be shared by plural threads because of the internal mutex. */
//C     TCNDB *tcndbnew2(TCCMP cmp, void *cmpop);
TCNDB * tcndbnew2(TCCMP cmp, void *cmpop);


/* Delete an on-memory tree database object.
   `ndb' specifies the on-memory tree database object. */
//C     void tcndbdel(TCNDB *ndb);
void  tcndbdel(TCNDB *ndb);


/* Store a record into an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If a record with the same key exists in the database, it is overwritten. */
//C     void tcndbput(TCNDB *ndb, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
void  tcndbput(TCNDB *ndb, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a string record into an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If a record with the same key exists in the database, it is overwritten. */
//C     void tcndbput2(TCNDB *ndb, const char *kstr, const char *vstr);
void  tcndbput2(TCNDB *ndb, char *kstr, char *vstr);


/* Store a new record into an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, this function has no effect. */
//C     bool tcndbputkeep(TCNDB *ndb, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
bool  tcndbputkeep(TCNDB *ndb, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a new string record into an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, this function has no effect. */
//C     bool tcndbputkeep2(TCNDB *ndb, const char *kstr, const char *vstr);
bool  tcndbputkeep2(TCNDB *ndb, char *kstr, char *vstr);


/* Concatenate a value at the end of the existing record in an on-memory tree database.
   `ndb' specifies the on-memory tree database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If there is no corresponding record, a new record is created. */
//C     void tcndbputcat(TCNDB *ndb, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
void  tcndbputcat(TCNDB *ndb, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Concatenate a string at the end of the existing record in an on-memory tree database.
   `ndb' specifies the on-memory tree database object.
   `kstr' specifies the string of the key.
   `vstr' specifies the string of the value.
   If there is no corresponding record, a new record is created. */
//C     void tcndbputcat2(TCNDB *ndb, const char *kstr, const char *vstr);
void  tcndbputcat2(TCNDB *ndb, char *kstr, char *vstr);


/* Remove a record of an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   If successful, the return value is true.  False is returned when no record corresponds to
   the specified key. */
//C     bool tcndbout(TCNDB *ndb, const void *kbuf, int ksiz);
bool  tcndbout(TCNDB *ndb, void *kbuf, int ksiz);


/* Remove a string record of an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `kstr' specifies the string of the key.
   If successful, the return value is true.  False is returned when no record corresponds to
   the specified key. */
//C     bool tcndbout2(TCNDB *ndb, const char *kstr);
bool  tcndbout2(TCNDB *ndb, char *kstr);


/* Retrieve a record in an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the value of the
   corresponding record.  `NULL' is returned when no record corresponds.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when
   it is no longer in use. */
//C     void *tcndbget(TCNDB *ndb, const void *kbuf, int ksiz, int *sp);
void * tcndbget(TCNDB *ndb, void *kbuf, int ksiz, int *sp);


/* Retrieve a string record in an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `kstr' specifies the string of the key.
   If successful, the return value is the string of the value of the corresponding record.
   `NULL' is returned when no record corresponds.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcndbget2(TCNDB *ndb, const char *kstr);
char * tcndbget2(TCNDB *ndb, char *kstr);


/* Get the size of the value of a record in an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   If successful, the return value is the size of the value of the corresponding record, else,
   it is -1. */
//C     int tcndbvsiz(TCNDB *ndb, const void *kbuf, int ksiz);
int  tcndbvsiz(TCNDB *ndb, void *kbuf, int ksiz);


/* Get the size of the value of a string record in an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `kstr' specifies the string of the key.
   If successful, the return value is the size of the value of the corresponding record, else,
   it is -1. */
//C     int tcndbvsiz2(TCNDB *ndb, const char *kstr);
int  tcndbvsiz2(TCNDB *ndb, char *kstr);


/* Initialize the iterator of an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   The iterator is used in order to access the key of every record stored in the on-memory
   database. */
//C     void tcndbiterinit(TCNDB *ndb);
void  tcndbiterinit(TCNDB *ndb);


/* Get the next key of the iterator of an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the next key, else, it is
   `NULL'.  `NULL' is returned when no record can be fetched from the iterator.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when
   it is no longer in use.  The order of iteration is assured to be the same as the stored
   order. */
//C     void *tcndbiternext(TCNDB *ndb, int *sp);
void * tcndbiternext(TCNDB *ndb, int *sp);


/* Get the next key string of the iterator of an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   If successful, the return value is the pointer to the region of the next key, else, it is
   `NULL'.  `NULL' is returned when no record can be fetched from the iterator.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use.  The order of iteration is assured
   to be the same as the stored order. */
//C     char *tcndbiternext2(TCNDB *ndb);
char * tcndbiternext2(TCNDB *ndb);


/* Get forward matching keys in an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `pbuf' specifies the pointer to the region of the prefix.
   `psiz' specifies the size of the region of the prefix.
   `max' specifies the maximum number of keys to be fetched.  If it is negative, no limit is
   specified.
   The return value is a list object of the corresponding keys.  This function does never fail.
   It returns an empty list even if no key corresponds.
   Because the object of the return value is created with the function `tclistnew', it should be
   deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tcndbfwmkeys(TCNDB *ndb, const void *pbuf, int psiz, int max);
TCLIST * tcndbfwmkeys(TCNDB *ndb, void *pbuf, int psiz, int max);


/* Get forward matching string keys in an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `pstr' specifies the string of the prefix.
   `max' specifies the maximum number of keys to be fetched.  If it is negative, no limit is
   specified.
   The return value is a list object of the corresponding keys.  This function does never fail.
   It returns an empty list even if no key corresponds.
   Because the object of the return value is created with the function `tclistnew', it should be
   deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tcndbfwmkeys2(TCNDB *ndb, const char *pstr, int max);
TCLIST * tcndbfwmkeys2(TCNDB *ndb, char *pstr, int max);


/* Get the number of records stored in an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   The return value is the number of the records stored in the database. */
//C     uint64_t tcndbrnum(TCNDB *ndb);
uint64_t  tcndbrnum(TCNDB *ndb);


/* Get the total size of memory used in an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   The return value is the total size of memory used in the database. */
//C     uint64_t tcndbmsiz(TCNDB *ndb);
uint64_t  tcndbmsiz(TCNDB *ndb);


/* Add an integer to a record in an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `num' specifies the additional value.
   The return value is the summation value.
   If the corresponding record exists, the value is treated as an integer and is added to.  If no
   record corresponds, a new record of the additional value is stored. */
//C     int tcndbaddint(TCNDB *ndb, const void *kbuf, int ksiz, int num);
int  tcndbaddint(TCNDB *ndb, void *kbuf, int ksiz, int num);


/* Add a real number to a record in an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `num' specifies the additional value.
   The return value is the summation value.
   If the corresponding record exists, the value is treated as a real number and is added to.  If
   no record corresponds, a new record of the additional value is stored. */
//C     double tcndbadddouble(TCNDB *ndb, const void *kbuf, int ksiz, double num);
double  tcndbadddouble(TCNDB *ndb, void *kbuf, int ksiz, double num);


/* Clear an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   All records are removed. */
//C     void tcndbvanish(TCNDB *ndb);
void  tcndbvanish(TCNDB *ndb);


/* Remove fringe records of an on-memory tree database object.
   `ndb' specifies the on-memory tree database object.
   `num' specifies the number of records to be removed. */
//C     void tcndbcutfringe(TCNDB *ndb, int num);
void  tcndbcutfringe(TCNDB *ndb, int num);



/*************************************************************************************************
 * ordered tree (for experts)
 *************************************************************************************************/


/* Store a record into a on-memory tree database without balancing nodes.
   `ndb' specifies the on-memory tree database.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If a record with the same key exists in the database, it is overwritten.  The structure of the
   tree is not modifed by this function. */
//C     void tcndbput3(TCNDB *ndb, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
void  tcndbput3(TCNDB *ndb, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a new record into a on-memory tree database object without balancing nodes.
   `ndb' specifies the on-memory tree database.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If successful, the return value is true, else, it is false.
   If a record with the same key exists in the database, this function has no effect.  The
   structure of the tree is not modifed by this function. */
//C     bool tcndbputkeep3(TCNDB *ndb, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
bool  tcndbputkeep3(TCNDB *ndb, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Concatenate a value in a on-memory tree database without balancing nodes.
   `ndb' specifies the on-memory tree database.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `vbuf' specifies the pointer to the region of the value.
   `vsiz' specifies the size of the region of the value.
   If there is no corresponding record, a new record is created.  The structure of the tree is
   not modifed by this function. */
//C     void tcndbputcat3(TCNDB *ndb, const void *kbuf, int ksiz, const void *vbuf, int vsiz);
void  tcndbputcat3(TCNDB *ndb, void *kbuf, int ksiz, void *vbuf, int vsiz);


/* Store a record into a on-memory tree database object with a duplication handler.
   `ndb' specifies the on-memory tree database.
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
   If successful, the return value is true, else, it is false. */
//C     bool tcndbputproc(TCNDB *ndb, const void *kbuf, int ksiz, const void *vbuf, int vsiz,
//C                       TCPDPROC proc, void *op);
bool  tcndbputproc(TCNDB *ndb, void *kbuf, int ksiz, void *vbuf, int vsiz, TCPDPROC proc, void *op);


/* Retrieve a record in an on-memory tree database object without balancing nodes.
   `ndb' specifies the on-memory tree database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the region of the value of the
   corresponding record.  `NULL' is returned when no record corresponds.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return value
   is allocated with the `malloc' call, it should be released with the `free' call when it is no
   longer in use.  The structure of the tree is not modifed by this function. */
//C     void *tcndbget3(TCNDB *ndb, const void *kbuf, int ksiz, int *sp);
void * tcndbget3(TCNDB *ndb, void *kbuf, int ksiz, int *sp);


/* Initialize the iterator of an on-memory tree database object in front of a key.
   `ndb' specifies the on-memory tree database object.
   `kbuf' specifies the pointer to the region of the key.
   `ksiz' specifies the size of the region of the key.
   The iterator is set to the first record corresponding the key or the next substitute if
   completely matching record does not exist. */
//C     void tcndbiterinit2(TCNDB *ndb, const void *kbuf, int ksiz);
void  tcndbiterinit2(TCNDB *ndb, void *kbuf, int ksiz);


/* Initialize the iterator of an on-memory tree database object in front of a key string.
   `ndb' specifies the on-memory tree database object.
   `kstr' specifies the string of the key.
   The iterator is set to the first record corresponding the key or the next substitute if
   completely matching record does not exist. */
//C     void tcndbiterinit3(TCNDB *ndb, const char *kstr);
void  tcndbiterinit3(TCNDB *ndb, char *kstr);


/* Process each record atomically of an on-memory tree database object.
   `iter' specifies the pointer to the iterator function called for each record.  It receives
   five parameters.  The first parameter is the pointer to the region of the key.  The second
   parameter is the size of the region of the key.  The third parameter is the pointer to the
   region of the value.  The fourth parameter is the size of the region of the value.  The fifth
   parameter is the pointer to the optional opaque object.  It returns true to continue iteration
   or false to stop iteration.
   `op' specifies an arbitrary pointer to be given as a parameter of the iterator function.  If
   it is not needed, `NULL' can be specified. */
//C     void tcndbforeach(TCNDB *ndb, TCITER iter, void *op);
void  tcndbforeach(TCNDB *ndb, TCITER iter, void *op);



/*************************************************************************************************
 * memory pool
 *************************************************************************************************/


//C     typedef struct {                         /* type of an element of memory pool */
//C       void *ptr;                             /* pointer */
//C       void (*del)(void *);                   /* deleting function */
//C     } TCMPELEM;
struct _N8
{
    void *ptr;
    void  function(void *)del;
}
alias _N8 TCMPELEM;

//C     typedef struct {                         /* type of structure for a memory pool object */
//C       void *mutex;                           /* mutex for operations */
//C       TCMPELEM *elems;                       /* array of elements */
//C       int anum;                              /* number of the elements of the array */
//C       int num;                               /* number of used elements */
//C     } TCMPOOL;
struct _N9
{
    void *mutex;
    TCMPELEM *elems;
    int anum;
    int num;
}
alias _N9 TCMPOOL;


/* Create a memory pool object.
   The return value is the new memory pool object. */
//C     TCMPOOL *tcmpoolnew(void);
TCMPOOL * tcmpoolnew();


/* Delete a memory pool object.
   `mpool' specifies the memory pool object.
   Note that the deleted object and its derivatives can not be used anymore. */
//C     void tcmpooldel(TCMPOOL *mpool);
void  tcmpooldel(TCMPOOL *mpool);


/* Relegate an arbitrary object to a memory pool object.
   `mpool' specifies the memory pool object.
   `ptr' specifies the pointer to the object to be relegated.  If it is `NULL', this function has
   no effect.
   `del' specifies the pointer to the function to delete the object.
   The return value is the pointer to the given object.
   This function assures that the specified object is deleted when the memory pool object is
   deleted. */
//C     void *tcmpoolpush(TCMPOOL *mpool, void *ptr, void (*del)(void *));
void * tcmpoolpush(TCMPOOL *mpool, void *ptr, void  function(void *)del);


/* Relegate an allocated region to a memory pool object.
   `mpool' specifies the memory pool object.
   `ptr' specifies the pointer to the region to be relegated.  If it is `NULL', this function has
   no effect.
   The return value is the pointer to the given object.
   This function assures that the specified region is released when the memory pool object is
   deleted. */
//C     void *tcmpoolpushptr(TCMPOOL *mpool, void *ptr);
void * tcmpoolpushptr(TCMPOOL *mpool, void *ptr);


/* Relegate an extensible string object to a memory pool object.
   `mpool' specifies the memory pool object.
   `xstr' specifies the extensible string object.  If it is `NULL', this function has no effect.
   The return value is the pointer to the given object.
   This function assures that the specified object is deleted when the memory pool object is
   deleted. */
//C     TCXSTR *tcmpoolpushxstr(TCMPOOL *mpool, TCXSTR *xstr);
TCXSTR * tcmpoolpushxstr(TCMPOOL *mpool, TCXSTR *xstr);


/* Relegate a list object to a memory pool object.
   `mpool' specifies the memory pool object.
   `list' specifies the list object.  If it is `NULL', this function has no effect.
   The return value is the pointer to the given object.
   This function assures that the specified object is deleted when the memory pool object is
   deleted. */
//C     TCLIST *tcmpoolpushlist(TCMPOOL *mpool, TCLIST *list);
TCLIST * tcmpoolpushlist(TCMPOOL *mpool, TCLIST *list);


/* Relegate a map object to a memory pool object.
   `mpool' specifies the memory pool object.
   `map' specifies the map object.  If it is `NULL', this function has no effect.
   The return value is the pointer to the given object.
   This function assures that the specified object is deleted when the memory pool object is
   deleted. */
//C     TCMAP *tcmpoolpushmap(TCMPOOL *mpool, TCMAP *map);
TCMAP * tcmpoolpushmap(TCMPOOL *mpool, TCMAP *map);


/* Relegate a tree object to a memory pool object.
   `mpool' specifies the memory pool object.
   `tree' specifies the tree object.  If it is `NULL', this function has no effect.
   The return value is the pointer to the given object.
   This function assures that the specified object is deleted when the memory pool object is
   deleted. */
//C     TCTREE *tcmpoolpushtree(TCMPOOL *mpool, TCTREE *tree);
TCTREE * tcmpoolpushtree(TCMPOOL *mpool, TCTREE *tree);


/* Allocate a region relegated to a memory pool object.
   `mpool' specifies the memory pool object.
   The return value is the pointer to the allocated region under the memory pool. */
//C     void *tcmpoolmalloc(TCMPOOL *mpool, size_t size);
void * tcmpoolmalloc(TCMPOOL *mpool, size_t size);


/* Create an extensible string object relegated to a memory pool object.
   The return value is the new extensible string object under the memory pool. */
//C     TCXSTR *tcmpoolxstrnew(TCMPOOL *mpool);
TCXSTR * tcmpoolxstrnew(TCMPOOL *mpool);


/* Create a list object relegated to a memory pool object.
   The return value is the new list object under the memory pool. */
//C     TCLIST *tcmpoollistnew(TCMPOOL *mpool);
TCLIST * tcmpoollistnew(TCMPOOL *mpool);


/* Create a map object relegated to a memory pool object.
   The return value is the new map object under the memory pool. */
//C     TCMAP *tcmpoolmapnew(TCMPOOL *mpool);
TCMAP * tcmpoolmapnew(TCMPOOL *mpool);


/* Create a tree object relegated to a memory pool object.
   The return value is the new tree object under the memory pool. */
//C     TCTREE *tcmpooltreenew(TCMPOOL *mpool);
TCTREE * tcmpooltreenew(TCMPOOL *mpool);


/* Remove the most recently installed cleanup handler of a memory pool object.
   `mpool' specifies the memory pool object.
   `exe' specifies whether to execute the destructor of the removed handler. */
//C     void tcmpoolpop(TCMPOOL *mpool, bool exe);
void  tcmpoolpop(TCMPOOL *mpool, bool exe);


/* Remove all cleanup handler of a memory pool object.
   `mpool' specifies the memory pool object.
   `exe' specifies whether to execute the destructors of the removed handlers. */
//C     void tcmpoolclear(TCMPOOL *mpool, bool exe);
void  tcmpoolclear(TCMPOOL *mpool, bool exe);


/* Get the global memory pool object.
   The return value is the global memory pool object.
   The global memory pool object is a singleton and assured to be deleted when the porcess is
   terminating normally. */
//C     TCMPOOL *tcmpoolglobal(void);
TCMPOOL * tcmpoolglobal();



/*************************************************************************************************
 * miscellaneous utilities
 *************************************************************************************************/


/* Get the larger value of two integers.
   `a' specifies an integer.
   `b' specifies the other integer.
   The return value is the larger value of the two. */
//C     long tclmax(long a, long b);
int  tclmax(int a, int b);


/* Get the lesser value of two integers.
   `a' specifies an integer.
   `b' specifies the other integer.
   The return value is the lesser value of the two. */
//C     long tclmin(long a, long b);
int  tclmin(int a, int b);


/* Get a random number as long integer based on uniform distribution.
   The return value is the random number between 0 and `ULONG_MAX'.
   This function uses the random number source device and generates a real random number if
   possible. */
//C     unsigned long tclrand(void);
uint  tclrand();


/* Get a random number as double decimal based on uniform distribution.
   The return value is the random number equal to or greater than 0, and less than 1.0.
   This function uses the random number source device and generates a real random number if
   possible. */
//C     double tcdrand(void);
double  tcdrand();


/* Get a random number as double decimal based on normal distribution.
   `avg' specifies the average.
   `sd' specifies the standard deviation.
   The return value is the random number.
   This function uses the random number source device and generates a real random number if
   possible. */
//C     double tcdrandnd(double avg, double sd);
double  tcdrandnd(double avg, double sd);


/* Compare two strings with case insensitive evaluation.
   `astr' specifies a string.
   `bstr' specifies of the other string.
   The return value is positive if the former is big, negative if the latter is big, 0 if both
   are equivalent. */
//C     int tcstricmp(const char *astr, const char *bstr);
int  tcstricmp(char *astr, char *bstr);


/* Check whether a string begins with a key.
   `str' specifies the target string.
   `key' specifies the forward matching key string.
   The return value is true if the target string begins with the key, else, it is false. */
//C     bool tcstrfwm(const char *str, const char *key);
bool  tcstrfwm(char *str, char *key);


/* Check whether a string begins with a key with case insensitive evaluation.
   `str' specifies the target string.
   `key' specifies the forward matching key string.
   The return value is true if the target string begins with the key, else, it is false. */
//C     bool tcstrifwm(const char *str, const char *key);
bool  tcstrifwm(char *str, char *key);


/* Check whether a string ends with a key.
   `str' specifies the target string.
   `key' specifies the backward matching key string.
   The return value is true if the target string ends with the key, else, it is false. */
//C     bool tcstrbwm(const char *str, const char *key);
bool  tcstrbwm(char *str, char *key);


/* Check whether a string ends with a key with case insensitive evaluation.
   `str' specifies the target string.
   `key' specifies the backward matching key string.
   The return value is true if the target string ends with the key, else, it is false. */
//C     bool tcstribwm(const char *str, const char *key);
bool  tcstribwm(char *str, char *key);


/* Calculate the edit distance of two strings.
   `astr' specifies a string.
   `bstr' specifies of the other string.
   The return value is the edit distance which is known as the Levenshtein distance.  The cost is
   calculated by byte. */
//C     int tcstrdist(const char *astr, const char *bstr);
int  tcstrdist(char *astr, char *bstr);


/* Calculate the edit distance of two UTF-8 strings.
   `astr' specifies a string.
   `bstr' specifies of the other string.
   The return value is the edit distance which is known as the Levenshtein distance.  The cost is
   calculated by Unicode character. */
//C     int tcstrdistutf(const char *astr, const char *bstr);
int  tcstrdistutf(char *astr, char *bstr);


/* Convert the letters of a string into upper case.
   `str' specifies the string to be converted.
   The return value is the string itself. */
//C     char *tcstrtoupper(char *str);
char * tcstrtoupper(char *str);


/* Convert the letters of a string into lower case.
   `str' specifies the string to be converted.
   The return value is the string itself. */
//C     char *tcstrtolower(char *str);
char * tcstrtolower(char *str);


/* Cut space characters at head or tail of a string.
   `str' specifies the string to be converted.
   The return value is the string itself. */
//C     char *tcstrtrim(char *str);
char * tcstrtrim(char *str);


/* Squeeze space characters in a string and trim it.
   `str' specifies the string to be converted.
   The return value is the string itself. */
//C     char *tcstrsqzspc(char *str);
char * tcstrsqzspc(char *str);


/* Substitute characters in a string.
   `str' specifies the string to be converted.
   `rstr' specifies the string containing characters to be replaced.
   `sstr' specifies the string containing characters to be substituted.
   If the substitute string is shorter then the replacement string, corresponding characters are
   removed. */
//C     char *tcstrsubchr(char *str, const char *rstr, const char *sstr);
char * tcstrsubchr(char *str, char *rstr, char *sstr);


/* Count the number of characters in a string of UTF-8.
   `str' specifies the string of UTF-8.
   The return value is the number of characters in the string. */
//C     int tcstrcntutf(const char *str);
int  tcstrcntutf(char *str);


/* Cut a string of UTF-8 at the specified number of characters.
   `str' specifies the string of UTF-8.
   `num' specifies the number of characters to be kept.
   The return value is the string itself. */
//C     char *tcstrcututf(char *str, int num);
char * tcstrcututf(char *str, int num);


/* Convert a UTF-8 string into a UCS-2 array.
   `str' specifies the UTF-8 string.
   `ary' specifies the pointer to the region into which the result UCS-2 codes are written.  The
   size of the buffer should be sufficient.
   `np' specifies the pointer to a variable into which the number of elements of the result array
   is assigned. */
//C     void tcstrutftoucs(const char *str, uint16_t *ary, int *np);
void  tcstrutftoucs(char *str, uint16_t *ary, int *np);


/* Convert a UCS-2 array into a UTF-8 string.
   `ary' specifies the array of UCS-2 codes.
   `num' specifies the number of the array.
   `str' specifies the pointer to the region into which the result UTF-8 string is written.  The
   size of the buffer should be sufficient.
   The return value is the length of the result string. */
//C     int tcstrucstoutf(const uint16_t *ary, int num, char *str);
int  tcstrucstoutf(uint16_t *ary, int num, char *str);


/* Create a list object by splitting a string.
   `str' specifies the source string.
   `delim' specifies a string containing delimiting characters.
   The return value is a list object of the split elements.
   If two delimiters are successive, it is assumed that an empty element is between the two.
   Because the object of the return value is created with the function `tclistnew', it should be
   deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tcstrsplit(const char *str, const char *delims);
TCLIST * tcstrsplit(char *str, char *delims);


/* Create a string by joining all elements of a list object.
   `list' specifies a list object.
   `delim' specifies a delimiting character.
   The return value is the result string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcstrjoin(const TCLIST *list, char delim);
char * tcstrjoin(TCLIST *list, char delim);


/* Convert a string to an integer.
   `str' specifies the string.
   The return value is the integer.  If the string does not contain numeric expression, 0 is
   returned.
   This function is equivalent to `atoll' except that it does not depend on the locale. */
//C     int64_t tcatoi(const char *str);
int64_t  tcatoi(char *str);


/* Convert a string with a metric prefix to an integer.
   `str' specifies the string, which can be trailed by a binary metric prefix.  "K", "M", "G",
   "T", "P", and "E" are supported.  They are case-insensitive.
   The return value is the integer.  If the string does not contain numeric expression, 0 is
   returned.  If the integer overflows the domain, `INT64_MAX' or `INT64_MIN' is returned
   according to the sign. */
//C     int64_t tcatoix(const char *str);
int64_t  tcatoix(char *str);


/* Convert a string to a real number.
   `str' specifies the string.
   The return value is the real number.  If the string does not contain numeric expression, 0.0
   is returned.
   This function is equivalent to `atof' except that it does not depend on the locale. */
//C     double tcatof(const char *str);
double  tcatof(char *str);


/* Check whether a string matches a regular expression.
   `str' specifies the target string.
   `regex' specifies the regular expression string.  If it begins with `*', the trailing
   substring is used as a case-insensitive regular expression.
   The return value is true if matching is success, else, it is false. */
//C     bool tcregexmatch(const char *str, const char *regex);
bool  tcregexmatch(char *str, char *regex);


/* Replace each substring matching a regular expression string.
   `str' specifies the target string.
   `regex' specifies the regular expression string for substrings.  If it begins with `*', the
   trailing substring is used as a case-insensitive regular expression.
   `alt' specifies the alternative string with which each substrings is replaced.  Each `&' in
   the string is replaced with the matched substring.  Each `\' in the string escapes the
   following character.  Special escapes "\1" through "\9" referring to the corresponding
   matching sub-expressions in the regular expression string are supported.
   The return value is a new converted string.  Even if the regular expression is invalid, a copy
   of the original string is returned.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcregexreplace(const char *str, const char *regex, const char *alt);
char * tcregexreplace(char *str, char *regex, char *alt);


/* Get the MD5 hash value of a serial object.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `buf' specifies the pointer to the region into which the result string is written.  The size
   of the buffer should be equal to or more than 48 bytes. */
//C     void tcmd5hash(const void *ptr, int size, char *buf);
void  tcmd5hash(void *ptr, int size, char *buf);


/* Cipher or decipher a serial object with the Arcfour stream cipher.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `kbuf' specifies the pointer to the region of the cipher key.
   `ksiz' specifies the size of the region of the cipher key.
   `obuf' specifies the pointer to the region into which the result data is written.  The size
   of the buffer should be equal to or more than the input region. */
//C     void tcarccipher(const void *ptr, int size, const void *kbuf, int ksiz, void *obuf);
void  tcarccipher(void *ptr, int size, void *kbuf, int ksiz, void *obuf);


/* Get the time of day in seconds.
   The return value is the time of day in seconds.  The accuracy is in microseconds. */
//C     double tctime(void);
double  tctime();


/* Get the Gregorian calendar of a time.
   `t' specifies the source time in seconds from the epoch.  If it is `INT64_MAX', the current
   time is specified.
   `jl' specifies the jet lag of a location in seconds.  If it is `INT_MAX', the local jet lag is
   specified.
   `yearp' specifies the pointer to a variable to which the year is assigned.  If it is `NULL',
   it is not used.
   `monp' specifies the pointer to a variable to which the month is assigned.  If it is `NULL',
   it is not used.  1 means January and 12 means December.
   `dayp' specifies the pointer to a variable to which the day of the month is assigned.  If it
   is `NULL', it is not used.
   `hourp' specifies the pointer to a variable to which the hours is assigned.  If it is `NULL',
   it is not used.
   `minp' specifies the pointer to a variable to which the minutes is assigned.  If it is `NULL',
   it is not used.
   `secp' specifies the pointer to a variable to which the seconds is assigned.  If it is `NULL',
   it is not used. */
//C     void tccalendar(int64_t t, int jl, int *yearp, int *monp, int *dayp,
//C                     int *hourp, int *minp, int *secp);
void  tccalendar(int64_t t, int jl, int *yearp, int *monp, int *dayp, int *hourp, int *minp, int *secp);


/* Format a date as a string in W3CDTF.
   `t' specifies the source time in seconds from the epoch.  If it is `INT64_MAX', the current
   time is specified.
   `jl' specifies the jet lag of a location in seconds.  If it is `INT_MAX', the local jet lag is
   specified.
   `buf' specifies the pointer to the region into which the result string is written.  The size
   of the buffer should be equal to or more than 48 bytes.
   W3CDTF represents a date as "YYYY-MM-DDThh:mm:ddTZD". */
//C     void tcdatestrwww(int64_t t, int jl, char *buf);
void  tcdatestrwww(int64_t t, int jl, char *buf);


/* Format a date as a string in RFC 1123 format.
   `t' specifies the source time in seconds from the epoch.  If it is `INT64_MAX', the current
   time is specified.
   `jl' specifies the jet lag of a location in seconds.  If it is `INT_MAX', the local jet lag is
   specified.
   `buf' specifies the pointer to the region into which the result string is written.  The size
   of the buffer should be equal to or more than 48 bytes.
   RFC 1123 format represents a date as "Wdy, DD-Mon-YYYY hh:mm:dd TZD". */
//C     void tcdatestrhttp(int64_t t, int jl, char *buf);
void  tcdatestrhttp(int64_t t, int jl, char *buf);


/* Get the time value of a date string.
   `str' specifies the date string in decimal, hexadecimal, W3CDTF, or RFC 822 (1123).  Decimal
   can be trailed by "s" for in seconds, "m" for in minutes, "h" for in hours, and "d" for in
   days.
   The return value is the time value of the date or `INT64_MIN' if the format is invalid. */
//C     int64_t tcstrmktime(const char *str);
int64_t  tcstrmktime(char *str);


/* Get the jet lag of the local time.
   The return value is the jet lag of the local time in seconds. */
//C     int tcjetlag(void);
int  tcjetlag();


/* Get the day of week of a date.
   `year' specifies the year of a date.
   `mon' specifies the month of the date.
   `day' specifies the day of the date.
   The return value is the day of week of the date.  0 means Sunday and 6 means Saturday. */
//C     int tcdayofweek(int year, int mon, int day);
int  tcdayofweek(int year, int mon, int day);



/*************************************************************************************************
 * miscellaneous utilities (for experts)
 *************************************************************************************************/


//C     enum {                                   /* enumeration for UCS normalization */
//C       TCUNSPACE = 1 << 0,                    /* white space normalization */
//C       TCUNLOWER = 1 << 1,                    /* lower case normalization */
//C       TCUNNOACC = 1 << 2,                    /* strip accent marks */
//C       TCUNWIDTH = 1 << 3                     /* half-width normalization */
//C     };
enum
{
    TCUNSPACE = 1,
    TCUNLOWER,
    TCUNNOACC = 4,
    TCUNWIDTH = 8,
}

//C     enum {                                   /* enumeration for KWIC generator */
//C       TCKWMUTAB = 1 << 0,                    /* mark up by tabs */
//C       TCKWMUCTRL = 1 << 1,                   /* mark up by control characters */
//C       TCKWMUBRCT = 1 << 2,                   /* mark up by brackets */
//C       TCKWNOOVER = 1 << 24,                  /* no overlap */
//C       TCKWPULEAD = 1 << 25                   /* pick up the lead string */
//C     };
enum
{
    TCKWMUTAB = 1,
    TCKWMUCTRL,
    TCKWMUBRCT = 4,
    TCKWNOOVER = 16777216,
    TCKWPULEAD = 33554432,
}

//C     typedef struct {                         /* type of structure for a consistent hashing node */
//C       uint32_t seq;                          /* sequential number */
//C       uint32_t hash;                         /* hash value */
//C     } TCCHIDXNODE;
struct _N12
{
    uint32_t seq;
    uint32_t hash;
}
alias _N12 TCCHIDXNODE;

//C     typedef struct {                         /* type of structure for a consistent hashing object */
//C       TCCHIDXNODE *nodes;                    /* node array */
//C       int nnum;                              /* number of the node array */
//C     } TCCHIDX;
struct _N13
{
    TCCHIDXNODE *nodes;
    int nnum;
}
alias _N13 TCCHIDX;


/* Check whether a string is numeric completely or not.
   `str' specifies the string to be checked.
   The return value is true if the string is numeric, else, it is false. */
//C     bool tcstrisnum(const char *str);
bool  tcstrisnum(char *str);


/* Convert a hexadecimal string to an integer.
   `str' specifies the string.
   The return value is the integer.  If the string does not contain numeric expression, 0 is
   returned. */
//C     int64_t tcatoih(const char *str);
int64_t  tcatoih(char *str);


/* Skip space characters at head of a string.
   `str' specifies the string.
   The return value is the pointer to the first non-space character. */
//C     const char *tcstrskipspc(const char *str);
char * tcstrskipspc(char *str);


/* Normalize a UTF-8 string.
   `str' specifies the string of UTF-8.
   `opts' specifies options by bitwise-or: `TCUNSPACE' specifies that white space characters are
   normalized into the ASCII space and they are squeezed into one, `TCUNLOWER' specifies that
   alphabetical characters are normalized into lower cases, `TCUNNOACC' specifies that
   alphabetical characters with accent marks are normalized without accent marks, `TCUNWIDTH'
   specifies that full-width characters are normalized into half-width characters.
   The return value is the string itself. */
//C     char *tcstrutfnorm(char *str, int opts);
char * tcstrutfnorm(char *str, int opts);


/* Normalize a UCS-2 array.
   `ary' specifies the array of UCS-2 codes.
   `num' specifies the number of elements of the array.
   `opts' specifies options by bitwise-or: `TCUNSPACE' specifies that white space characters are
   normalized into the ASCII space and they are squeezed into one, `TCUNLOWER' specifies that
   alphabetical characters are normalized into lower cases, `TCUNNOACC' specifies that
   alphabetical characters with accent marks are normalized without accent marks, `TCUNWIDTH'
   specifies that full-width characters are normalized into half-width characters.
   The return value is the number of elements of the result array. */
//C     int tcstrucsnorm(uint16_t *ary, int num, int opts);
int  tcstrucsnorm(uint16_t *ary, int num, int opts);


/* Generate a keyword-in-context string from a text and keywords.
   `str' specifies the text string of UTF-8.
   `words' specifies a list object of the keyword strings.
   `width' specifies the width of strings picked up around each keyword.
   `opts' specifies options by bitwise-or: `TCKWMUTAB' specifies that each keyword is marked up
   between two tab characters, `TCKWMUCTRL' specifies that each keyword is marked up by the STX
   (0x02) code and the ETX (0x03) code, `TCKWMUBRCT' specifies that each keyword is marked up by
   the two square brackets, `TCKWNOOVER' specifies that each context does not overlap,
   `TCKWPULEAD' specifies that the lead string is picked up forcibly.
   The return value is the list object whose elements are strings around keywords.
   Because the object of the return value is created with the function `tclistnew', it should
   be deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tcstrkwic(const char *str, const TCLIST *words, int width, int opts);
TCLIST * tcstrkwic(char *str, TCLIST *words, int width, int opts);


/* Tokenize a text separating by white space characters.
   `str' specifies the string.
   The return value is the list object whose elements are extracted tokens.
   Because the object of the return value is created with the function `tclistnew', it should
   be deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tcstrtokenize(const char *str);
TCLIST * tcstrtokenize(char *str);


/* Create a list object by splitting a region by zero code.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   The return value is a list object of the split elements.
   If two delimiters are successive, it is assumed that an empty element is between the two.
   Because the object of the return value is created with the function `tclistnew', it should be
   deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tcstrsplit2(const void *ptr, int size);
TCLIST * tcstrsplit2(void *ptr, int size);


/* Create a map object by splitting a string.
   `str' specifies the source string where the key and the value of each record are situated one
   after the other.
   `delim' specifies a string containing delimiting characters.
   The return value is a map object of the split records.
   Because the object of the return value is created with the function `tcmapnew', it should be
   deleted with the function `tcmapdel' when it is no longer in use. */
//C     TCMAP *tcstrsplit3(const char *str, const char *delims);
TCMAP * tcstrsplit3(char *str, char *delims);


/* Create a map object by splitting a region by zero code.
   `ptr' specifies the pointer to the region where the key and the value of each record are
   situated one after the other.
   `size' specifies the size of the region.
   The return value is a map object of the split records.
   Because the object of the return value is created with the function `tcmapnew', it should be
   deleted with the function `tcmapdel' when it is no longer in use. */
//C     TCMAP *tcstrsplit4(const void *ptr, int size);
TCMAP * tcstrsplit4(void *ptr, int size);


/* Create a region separated by zero code by joining all elements of a list object.
   `list' specifies a list object.
   The return value is the result region.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     void *tcstrjoin2(const TCLIST *list, int *sp);
void * tcstrjoin2(TCLIST *list, int *sp);


/* Create a string by joining all records of a map object.
   `map' specifies a map object.
   `delim' specifies a delimiting character.
   The return value is the result string where the key and the value of each record are situated
   one after the other.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcstrjoin3(const TCMAP *map, char delim);
char * tcstrjoin3(TCMAP *map, char delim);


/* Create a region separated by zero code by joining all records of a map object.
   `list' specifies a list object.
   The return value is the result region, where the key and the value of each record are
   situated one after the other.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     void *tcstrjoin4(const TCMAP *map, int *sp);
void * tcstrjoin4(TCMAP *map, int *sp);


/* Sort top records of an array.
   `base' spacifies the pointer to an array.
   `nmemb' specifies the number of elements of the array.
   `size' specifies the size of each element.
   `top' specifies the number of top records.
   `compar' specifies the pointer to comparing function.  The two arguments specify the pointers
   of elements.  The comparing function should returns positive if the former is big, negative
   if the latter is big, 0 if both are equal. */
//C     void tctopsort(void *base, size_t nmemb, size_t size, size_t top,
//C                    int(*compar)(const void *, const void *));
void  tctopsort(void *base, size_t nmemb, size_t size, size_t top, int  function(void *, void *)compar);


/* Suspend execution of the current thread.
   `sec' specifies the interval of the suspension in seconds.
   If successful, the return value is true, else, it is false. */
//C     bool tcsleep(double sec);
bool  tcsleep(double sec);


/* Get the current system information.
   The return value is a map object of the current system information or `NULL' on failure.
   The key "utime" indicates the user time of the CPU.  The key "stime" indicates the system time
   of the CPU.  The key "size" indicates the process size in bytes.  The "rss" indicates the
   resident set size in bytes.  "total" indicates the total size of the real memory.  "free"
   indicates the free size of the real memory.  "cached" indicates the cached size of the real
   memory.
   Because the object of the return value is created with the function `tcmapnew', it should be
   deleted with the function `tcmapdel' when it is no longer in use. */
//C     TCMAP *tcsysinfo(void);
TCMAP * tcsysinfo();


/* Create a consistent hashing object.
   `range' specifies the number of nodes.  It should be more than 0.  The range of hash values is
   from 0 to less than the specified number.
   The return value is the new consistent hashing object.
   Consistent hashing is useful because the addition or removal of one node does not
   significantly change the mapping of keys to nodes. */
//C     TCCHIDX *tcchidxnew(int range);
TCCHIDX * tcchidxnew(int range);


/* Delete a consistent hashing object.
   `chidx' specifies the consistent hashing object. */
//C     void tcchidxdel(TCCHIDX *chidx);
void  tcchidxdel(TCCHIDX *chidx);


/* Get the consistent hashing value of a record.
   `chidx' specifies the consistent hashing object.
   `ptr' specifies the pointer to the region of the record.
   `size' specifies the size of the region.
   The return value is the hash value of the record. */
//C     int tcchidxhash(TCCHIDX *chidx, const void *ptr, int size);
int  tcchidxhash(TCCHIDX *chidx, void *ptr, int size);



/*************************************************************************************************
 * filesystem utilities
 *************************************************************************************************/


/* Get the canonicalized absolute path of a file.
   `path' specifies the path of the file.
   The return value is the canonicalized absolute path of a file, or `NULL' if the path is
   invalid.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcrealpath(const char *path);
char * tcrealpath(char *path);


/* Get the status information of a file.
   `path' specifies the path of the file.
   `isdirp' specifies the pointer to a variable into which whether the file is a directory is
   assigned.  If it is `NULL', it is ignored.
   `sizep' specifies the pointer to a variable into which the size of the file is assigned.  If
   it is `NULL', it is ignored.
   `ntimep' specifies the pointer to a variable into which the size of the file is assigned.  If
   it is `NULL', it is ignored.
   If successful, the return value is true, else, it is false. */
//C     bool tcstatfile(const char *path, bool *isdirp, int64_t *sizep, int64_t *mtimep);
bool  tcstatfile(char *path, bool *isdirp, int64_t *sizep, int64_t *mtimep);


/* Read whole data of a file.
   `path' specifies the path of the file.  If it is `NULL', the standard input is specified.
   `limit' specifies the limiting size of reading data.  If it is not more than 0, the limitation
   is not specified.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.  If it is `NULL', it is not used.
   The return value is the pointer to the allocated region of the read data, or `NULL' if the
   file could not be opened.
   Because an additional zero code is appended at the end of the region of the return value, the
   return value can be treated as a character string.  Because the region of the return value is
   allocated with the `malloc' call, it should be released with the `free' call when when is no
   longer in use.  */
//C     void *tcreadfile(const char *path, int limit, int *sp);
void * tcreadfile(char *path, int limit, int *sp);


/* Read every line of a file.
   `path' specifies the path of the file.  If it is `NULL', the standard input is specified.
   The return value is a list object of every lines if successful, else it is `NULL'.
   Line separators are cut out.  Because the object of the return value is created with the
   function `tclistnew', it should be deleted with the function `tclistdel' when it is no longer
   in use. */
//C     TCLIST *tcreadfilelines(const char *path);
TCLIST * tcreadfilelines(char *path);


/* Write data into a file.
   `path' specifies the path of the file.  If it is `NULL', the standard output is specified.
   `ptr' specifies the pointer to the data region.
   `size' specifies the size of the region.
   If successful, the return value is true, else, it is false. */
//C     bool tcwritefile(const char *path, const void *ptr, int size);
bool  tcwritefile(char *path, void *ptr, int size);


/* Copy a file.
   `src' specifies the path of the source file.
   `dest' specifies the path of the destination file.
   The return value is true if successful, else, it is false.
   If the destination file exists, it is overwritten. */
//C     bool tccopyfile(const char *src, const char *dest);
bool  tccopyfile(char *src, char *dest);


/* Read names of files in a directory.
   `path' specifies the path of the directory.
   The return value is a list object of names if successful, else it is `NULL'.
   Links to the directory itself and to the parent directory are ignored.
   Because the object of the return value is created with the function `tclistnew', it should
   be deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tcreaddir(const char *path);
TCLIST * tcreaddir(char *path);


/* Expand a pattern into a list of matched paths.
   `pattern' specifies the matching pattern.
   The return value is a list object of matched paths.  If no path is matched, an empty list is
   returned.
   Because the object of the return value is created with the function `tclistnew', it should
   be deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tcglobpat(const char *pattern);
TCLIST * tcglobpat(char *pattern);


/* Remove a file or a directory and its sub ones recursively.
   `path' specifies the path of the link.
   If successful, the return value is true, else, it is false.  False is returned when the link
   does not exist or the permission is denied. */
//C     bool tcremovelink(const char *path);
bool  tcremovelink(char *path);


/* Write data into a file.
   `fd' specifies the file descriptor.
   `buf' specifies the buffer to be written.
   `size' specifies the size of the buffer.
   The return value is true if successful, else, it is false. */
//C     bool tcwrite(int fd, const void *buf, size_t size);
bool  tcwrite(int fd, void *buf, size_t size);


/* Read data from a file.
   `fd' specifies the file descriptor.
   `buf' specifies the buffer to store into.
   `size' specifies the size of the buffer.
   The return value is true if successful, else, it is false. */
//C     bool tcread(int fd, void *buf, size_t size);
bool  tcread(int fd, void *buf, size_t size);


/* Lock a file.
   `fd' specifies the file descriptor.
   `ex' specifies whether an exclusive lock or a shared lock is performed.
   `nb' specifies whether to request with non-blocking.
   The return value is true if successful, else, it is false. */
//C     bool tclock(int fd, bool ex, bool nb);
bool  tclock(int fd, bool ex, bool nb);


/* Unlock a file.
   `fd' specifies the file descriptor.
   The return value is true if successful, else, it is false. */
//C     bool tcunlock(int fd);
bool  tcunlock(int fd);


/* Execute a shell command.
   `args' specifies an array of the command name and its arguments.
   `anum' specifies the number of elements of the array.
   The return value is the exit code of the command or `INT_MAX' on failure.
   The command name and the arguments are quoted and meta characters are escaped. */
//C     int tcsystem(const char **args, int anum);
int  tcsystem(char **args, int anum);



/*************************************************************************************************
 * encoding utilities
 *************************************************************************************************/


/* Encode a serial object with URL encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   The return value is the result string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call if when is no longer in use. */
//C     char *tcurlencode(const char *ptr, int size);
char * tcurlencode(char *ptr, int size);


/* Decode a string encoded with URL encoding.
   `str' specifies the encoded string.
   `sp' specifies the pointer to a variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the result.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when
   it is no longer in use. */
//C     char *tcurldecode(const char *str, int *sp);
char * tcurldecode(char *str, int *sp);


/* Break up a URL into elements.
   `str' specifies the URL string.
   The return value is the map object whose keys are the name of elements.  The key "self"
   specifies the URL itself.  The key "scheme" indicates the scheme.  The key "host" indicates
   the host of the server.  The key "port" indicates the port number of the server.  The key
   "authority" indicates the authority information.  The key "path" indicates the path of the
   resource.  The key "file" indicates the file name without the directory section.  The key
   "query" indicates the query string.  The key "fragment" indicates the fragment string.
   Supported schema are HTTP, HTTPS, FTP, and FILE.  Absolute URL and relative URL are supported.
   Because the object of the return value is created with the function `tcmapnew', it should be
   deleted with the function `tcmapdel' when it is no longer in use. */
//C     TCMAP *tcurlbreak(const char *str);
TCMAP * tcurlbreak(char *str);


/* Resolve a relative URL with an absolute URL.
   `base' specifies the absolute URL of the base location.
   `target' specifies the URL to be resolved.
   The return value is the resolved URL.  If the target URL is relative, a new URL of relative
   location from the base location is returned.  Else, a copy of the target URL is returned.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcurlresolve(const char *base, const char *target);
char * tcurlresolve(char *base, char *target);


/* Encode a serial object with Base64 encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   The return value is the result string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call if when is no longer in use. */
//C     char *tcbaseencode(const char *ptr, int size);
char * tcbaseencode(char *ptr, int size);


/* Decode a string encoded with Base64 encoding.
   `str' specifies the encoded string.
   `sp' specifies the pointer to a variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the result.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when
   it is no longer in use. */
//C     char *tcbasedecode(const char *str, int *sp);
char * tcbasedecode(char *str, int *sp);


/* Encode a serial object with Quoted-printable encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   The return value is the result string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call if when is no longer in use. */
//C     char *tcquoteencode(const char *ptr, int size);
char * tcquoteencode(char *ptr, int size);


/* Decode a string encoded with Quoted-printable encoding.
   `str' specifies the encoded string.
   `sp' specifies the pointer to a variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the result.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when
   it is no longer in use. */
//C     char *tcquotedecode(const char *str, int *sp);
char * tcquotedecode(char *str, int *sp);


/* Encode a string with MIME encoding.
   `str' specifies the string.
   `encname' specifies the string of the name of the character encoding.
   `base' specifies whether to use Base64 encoding.  If it is false, Quoted-printable is used.
   The return value is the result string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcmimeencode(const char *str, const char *encname, bool base);
char * tcmimeencode(char *str, char *encname, bool base);


/* Decode a string encoded with MIME encoding.
   `str' specifies the encoded string.
   `enp' specifies the pointer to the region into which the name of encoding is written.  If it
   is `NULL', it is not used.  The size of the buffer should be equal to or more than 32 bytes.
   The return value is the result string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcmimedecode(const char *str, char *enp);
char * tcmimedecode(char *str, char *enp);


/* Split a string of MIME into headers and the body.
   `ptr' specifies the pointer to the region of MIME data.
   `size' specifies the size of the region.
   `headers' specifies a map object to store headers.  If it is `NULL', it is not used.  Each key
   of the map is an uncapitalized header name.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the body data.
   If the content type is defined, the header map has the key "TYPE" specifying the type.  If the
   character encoding is defined, the key "CHARSET" indicates the encoding name.  If the boundary
   string of multipart is defined, the key "BOUNDARY" indicates the string.  If the content
   disposition is defined, the key "DISPOSITION" indicates the direction.  If the file name is
   defined, the key "FILENAME" indicates the name.  If the attribute name is defined, the key
   "NAME" indicates the name.  Because the region of the return value is allocated with the
   `malloc' call, it should be released with the `free' call when it is no longer in use. */
//C     char *tcmimebreak(const char *ptr, int size, TCMAP *headers, int *sp);
char * tcmimebreak(char *ptr, int size, TCMAP *headers, int *sp);


/* Split multipart data of MIME into its parts.
   `ptr' specifies the pointer to the region of multipart data of MIME.
   `size' specifies the size of the region.
   `boundary' specifies the boundary string.
   The return value is a list object.  Each element of the list is the data of a part.
   Because the object of the return value is created with the function `tclistnew', it should be
   deleted with the function `tclistdel' when it is no longer in use. */
//C     TCLIST *tcmimeparts(const char *ptr, int size, const char *boundary);
TCLIST * tcmimeparts(char *ptr, int size, char *boundary);


/* Encode a serial object with hexadecimal encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   The return value is the result string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call if when is no longer in use. */
//C     char *tchexencode(const char *ptr, int size);
char * tchexencode(char *ptr, int size);


/* Decode a string encoded with hexadecimal encoding.
   `str' specifies the encoded string.
   `sp' specifies the pointer to a variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the result.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when
   it is no longer in use. */
//C     char *tchexdecode(const char *str, int *sp);
char * tchexdecode(char *str, int *sp);


/* Compress a serial object with Packbits encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the result object, else, it is `NULL'.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcpackencode(const char *ptr, int size, int *sp);
char * tcpackencode(char *ptr, int size, int *sp);


/* Decompress a serial object compressed with Packbits encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `sp' specifies the pointer to a variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the result object, else, it is `NULL'.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when it
   is no longer in use. */
//C     char *tcpackdecode(const char *ptr, int size, int *sp);
char * tcpackdecode(char *ptr, int size, int *sp);


/* Compress a serial object with TCBS encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the result object, else, it is `NULL'.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcbsencode(const char *ptr, int size, int *sp);
char * tcbsencode(char *ptr, int size, int *sp);


/* Decompress a serial object compressed with TCBS encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `sp' specifies the pointer to a variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the result object, else, it is `NULL'.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when it
   is no longer in use. */
//C     char *tcbsdecode(const char *ptr, int size, int *sp);
char * tcbsdecode(char *ptr, int size, int *sp);


/* Compress a serial object with Deflate encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the result object, else, it is `NULL'.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcdeflate(const char *ptr, int size, int *sp);
char * tcdeflate(char *ptr, int size, int *sp);


/* Decompress a serial object compressed with Deflate encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `sp' specifies the pointer to a variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the result object, else, it is `NULL'.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when it
   is no longer in use. */
//C     char *tcinflate(const char *ptr, int size, int *sp);
char * tcinflate(char *ptr, int size, int *sp);


/* Compress a serial object with GZIP encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the result object, else, it is `NULL'.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcgzipencode(const char *ptr, int size, int *sp);
char * tcgzipencode(char *ptr, int size, int *sp);


/* Decompress a serial object compressed with GZIP encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `sp' specifies the pointer to a variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the result object, else, it is `NULL'.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when it
   is no longer in use. */
//C     char *tcgzipdecode(const char *ptr, int size, int *sp);
char * tcgzipdecode(char *ptr, int size, int *sp);


/* Get the CRC32 checksum of a serial object.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   The return value is the CRC32 checksum of the object. */
//C     unsigned int tcgetcrc(const char *ptr, int size);
uint  tcgetcrc(char *ptr, int size);


/* Compress a serial object with BZIP2 encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `sp' specifies the pointer to the variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the result object, else, it is `NULL'.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcbzipencode(const char *ptr, int size, int *sp);
char * tcbzipencode(char *ptr, int size, int *sp);


/* Decompress a serial object compressed with BZIP2 encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `sp' specifies the pointer to a variable into which the size of the region of the return
   value is assigned.
   If successful, the return value is the pointer to the result object, else, it is `NULL'.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when it
   is no longer in use. */
//C     char *tcbzipdecode(const char *ptr, int size, int *sp);
char * tcbzipdecode(char *ptr, int size, int *sp);


/* Encode an array of nonnegative integers with BER encoding.
   `ary' specifies the pointer to the array of nonnegative integers.
   `anum' specifies the size of the array.
   `sp' specifies the pointer to a variable into which the size of the region of the return
   value is assigned.
   The return value is the pointer to the region of the result.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call if when is no longer in use. */
//C     char *tcberencode(const unsigned int *ary, int anum, int *sp);
char * tcberencode(uint *ary, int anum, int *sp);


/* Decode a serial object encoded with BER encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `np' specifies the pointer to a variable into which the number of elements of the return value
   is assigned.
   The return value is the pointer to the array of the result.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call if when is no longer in use. */
//C     unsigned int *tcberdecode(const char *ptr, int size, int *np);
uint * tcberdecode(char *ptr, int size, int *np);


/* Escape meta characters in a string with the entity references of XML.
   `str' specifies the string.
   The return value is the pointer to the escaped string.
   This function escapes only `&', `<', `>', and `"'.  Because the region of the return value
   is allocated with the `malloc' call, it should be released with the `free' call when it is no
   longer in use. */
//C     char *tcxmlescape(const char *str);
char * tcxmlescape(char *str);


/* Unescape entity references in a string of XML.
   `str' specifies the string.
   The return value is the unescaped string.
   This function restores only `&amp;', `&lt;', `&gt;', and `&quot;'.  Because the region of the
   return value is allocated with the `malloc' call, it should be released with the `free' call
   when it is no longer in use. */
//C     char *tcxmlunescape(const char *str);
char * tcxmlunescape(char *str);



/*************************************************************************************************
 * encoding utilities (for experts)
 *************************************************************************************************/


/* Encode a map object into a string in the x-www-form-urlencoded format.
   `params' specifies a map object of parameters.
   The return value is the result string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tcwwwformencode(const TCMAP *params);
char * tcwwwformencode(TCMAP *params);


/* Decode a query string in the x-www-form-urlencoded format.
   `str' specifies the query string.
   `params' specifies a map object into which the result parameters are stored. */
//C     void tcwwwformdecode(const char *str, TCMAP *params);
void  tcwwwformdecode(char *str, TCMAP *params);


/* Decode a data region in the x-www-form-urlencoded or multipart-form-data format.
   `ptr' specifies the pointer to the data region.
   `size' specifies the size of the data region.
   `type' specifies the value of the content-type header.  If it is `NULL', the type is specified
   as x-www-form-urlencoded.
   `params' specifies a map object into which the result parameters are stored. */
//C     void tcwwwformdecode2(const void *ptr, int size, const char *type, TCMAP *params);
void  tcwwwformdecode2(void *ptr, int size, char *type, TCMAP *params);


/* Split an XML string into tags and text sections.
   `str' specifies the string.
   The return value is the list object whose elements are strings of tags or text sections.
   Because the object of the return value is created with the function `tclistnew', it should
   be deleted with the function `tclistdel' when it is no longer in use.  Because this function
   does not check validation, it can handle also HTML and SGML. */
//C     TCLIST *tcxmlbreak(const char *str);
TCLIST * tcxmlbreak(char *str);


/* Get the map of attributes of an XML tag.
   `str' specifies the pointer to the region of a tag string.
   The return value is the map object containing attribute names and their values which are
   unescaped.  You can get the name of the tag with the key of an empty string.
   Because the object of the return value is created with the function `tcmapnew', it should
   be deleted with the function `tcmapdel' when it is no longer in use. */
//C     TCMAP *tcxmlattrs(const char *str);
TCMAP * tcxmlattrs(char *str);


/* Escape meta characters in a string with backslash escaping of the C language.
   `str' specifies the string.
   The return value is the pointer to the escaped string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call if when is no longer in use. */
//C     char *tccstrescape(const char *str);
char * tccstrescape(char *str);


/* Unescape a string escaped by backslash escaping of the C language.
   `str' specifies the string.
   The return value is the unescaped string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call if when is no longer in use. */
//C     char *tccstrunescape(const char *str);
char * tccstrunescape(char *str);


/* Escape meta characters in a string with backslash escaping of JSON.
   `str' specifies the string.
   The return value is the pointer to the escaped string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call if when is no longer in use. */
//C     char *tcjsonescape(const char *str);
char * tcjsonescape(char *str);


/* Unescape a string escaped by backslash escaping of JSON.
   `str' specifies the string.
   The return value is the unescaped string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call if when is no longer in use. */
//C     char *tcjsonunescape(const char *str);
char * tcjsonunescape(char *str);



/*************************************************************************************************
 * template serializer
 *************************************************************************************************/


//C     typedef struct {                         /* type of structure for a template */
//C       TCLIST *elems;                         /* elements separated by the separators */
//C       char *begsep;                          /* beginning separator */
//C       char *endsep;                          /* ending separator */
//C       TCMAP *conf;                           /* configuration variables */
//C     } TCTMPL;
struct _N14
{
    TCLIST *elems;
    char *begsep;
    char *endsep;
    TCMAP *conf;
}
alias _N14 TCTMPL;


/* Create a template object.
   The return value is the new template object. */
//C     TCTMPL *tctmplnew(void);
TCTMPL * tctmplnew();


/* Delete a template object.
   `tmpl' specifies the template object. */
//C     void tctmpldel(TCTMPL *tmpl);
void  tctmpldel(TCTMPL *tmpl);


/* Set the separator strings of a template object.
   `tmpl' specifies the template object.
   `begsep' specifies the beginning separator string.  By default, it is "[%".
   `endsep' specifies the ending separator string.  By default, it is "%]". */
//C     void tctmplsetsep(TCTMPL *tmpl, const char *begsep, const char *endsep);
void  tctmplsetsep(TCTMPL *tmpl, char *begsep, char *endsep);


/* Load a template string into a template object.
   `tmpl' specifies the template object.
   `str' specifies the template string.  Directives between "[%" and "%]" can be included in the
   template string.  If the variable name is specified in the directive, it is expanded as the
   value of the variable.  "." is used in order to access a record of a hash variable.  For
   example, "[% foo.bar.baz %]" is expanded as the value of the record whose key is "baz" in the
   hash variable of the record whose key is "bar" in the hash variable whose name is "foo".
   Moreover, control flow directives are also supported.  "[% IF ... %]", "[% ELSE %]", and
   "[% END %]" are conditional directives.  "[% FOREACH ... %]" and "[% END %]" are iterator
   directives for a list object.  "[% SET ... %]" is a session variable setting directive.
   "[% CONF ... %]" is a configuration directive.  If the ending separator of a directive is
   leaded by "\", the next linefeed character is ignored.  Variable expansion directive needs the
   parameter for the variable name.  The optional parameter "DEF" trailed by a string specifies
   the default value.  The optional parameter "ENC" trailed by a string specifies the encoding
   format.  "URL" for the URL escape encoding, "XML" for the XML escape encoding, "CSTR" for
   C-string escape encoding, and "JSON" for JSON escape encoding are supported.  The conditional
   directive needs the parameter for the variable name.  If the variable exists, the block to the
   correspondent ending directive is evaluated, else, the block is ignored.  The optional
   parameter "EQ" trailed by a string specifies the string full matching test.  The optional
   parameter "INC" trailed by a string specifies the string including matching test.  The
   optional parameter "PRT" indicates the printable test.  The optional parameter "RX" trailed by
   a string specifies the regular expression matching test.  The optional parameter "NOT" inverts
   the logical determination.  The iterator directive needs the parameter for the variable name
   of a list object.  The block to the correspondent ending directive is evaluated for each
   element of the list.  The optional parameter specifies the local variable name of each
   element.  The session variable setting directive needs the parameters for the variable name
   and its value.  The configuration directive needs the parameters for the variable name and
   its value. */
//C     void tctmplload(TCTMPL *tmpl, const char *str);
void  tctmplload(TCTMPL *tmpl, char *str);


/* Load a template string from a file into a template object.
   `tmpl' specifies the template object.
   `path' specifies the input file.
   If successful, the return value is true, else, it is false. */
//C     bool tctmplload2(TCTMPL *tmpl, const char *path);
bool  tctmplload2(TCTMPL *tmpl, char *path);


/* Serialize the template string of a template object.
   `tmpl' specifies the template object.
   `vars' specifies the variables to be applied into the template.
   The return value is the dumped template string.
   Because the region of the return value is allocated with the `malloc' call, it should be
   released with the `free' call when it is no longer in use. */
//C     char *tctmpldump(TCTMPL *tmpl, const TCMAP *vars);
char * tctmpldump(TCTMPL *tmpl, TCMAP *vars);


/* Get the value of a configuration variable of a template object.
   `tmpl' specifies the template object.
   `name' specifies the name of the configuration variable.
   The return value is the string value of the configuration variable or `NULL' if it is not
   defined. */
//C     const char *tctmplconf(TCTMPL *tmpl, const char *name);
char * tctmplconf(TCTMPL *tmpl, char *name);


/* Store a list object into a list object with the type information.
   `list' specifies the container list object.
   `obj' specifies the list object to be stored. */
//C     void tclistpushlist(TCLIST *list, const TCLIST *obj);
void  tclistpushlist(TCLIST *list, TCLIST *obj);


/* Store a map object into a list object with the type information.
   `list' specifies the container list object.
   `obj' specifies the map object to be stored. */
//C     void tclistpushmap(TCLIST *list, const TCMAP *obj);
void  tclistpushmap(TCLIST *list, TCMAP *obj);


/* Store a list object into a map object with the type information.
   `map' specifies the container map object.
   `kstr' specifies the string of the key.
   `obj' specifies the list object to be stored. */
//C     void tcmapputlist(TCMAP *map, const char *kstr, const TCLIST *obj);
void  tcmapputlist(TCMAP *map, char *kstr, TCLIST *obj);


/* Store a map object into a map object with the type information.
   `map' specifies the container map object.
   `kstr' specifies the string of the key.
   `obj' specifies the map object to be stored. */
//C     void tcmapputmap(TCMAP *map, const char *kstr, const TCMAP *obj);
void  tcmapputmap(TCMAP *map, char *kstr, TCMAP *obj);



/*************************************************************************************************
 * pointer list
 *************************************************************************************************/


//C     typedef struct {                         /* type of structure for a pointer list */
//C       void **array;                          /* array of pointers */
//C       int anum;                              /* number of the elements of the array */
//C       int start;                             /* start index of used elements */
//C       int num;                               /* number of used elements */
//C     } TCPTRLIST;
struct _N15
{
    void **array;
    int anum;
    int start;
    int num;
}
alias _N15 TCPTRLIST;


/* Create a pointer list object.
   The return value is the new pointer list object. */
//C     TCPTRLIST *tcptrlistnew(void);
TCPTRLIST * tcptrlistnew();


/* Create a pointer list object with expecting the number of elements.
   `anum' specifies the number of elements expected to be stored in the list.
   The return value is the new pointer list object. */
//C     TCPTRLIST *tcptrlistnew2(int anum);
TCPTRLIST * tcptrlistnew2(int anum);


/* Copy a pointer list object.
   `ptrlist' specifies the pointer list object.
   The return value is the new pointer list object equivalent to the specified object. */
//C     TCPTRLIST *tcptrlistdup(const TCPTRLIST *ptrlist);
TCPTRLIST * tcptrlistdup(TCPTRLIST *ptrlist);


/* Delete a pointer list object.
   `ptrlist' specifies the pointer list object.
   Note that the deleted object and its derivatives can not be used anymore. */
//C     void tcptrlistdel(TCPTRLIST *ptrlist);
void  tcptrlistdel(TCPTRLIST *ptrlist);


/* Get the number of elements of a pointer list object.
   `ptrlist' specifies the pointer list object.
   The return value is the number of elements of the list. */
//C     int tcptrlistnum(const TCPTRLIST *ptrlist);
int  tcptrlistnum(TCPTRLIST *ptrlist);


/* Get the pointer to the region of an element of a pointer list object.
   `ptrlist' specifies the pointer list object.
   `index' specifies the index of the element.
   The return value is the pointer to the region of the value.
   If `index' is equal to or more than the number of elements, the return value is `NULL'. */
//C     void *tcptrlistval(const TCPTRLIST *ptrlist, int index);
void * tcptrlistval(TCPTRLIST *ptrlist, int index);


/* Add an element at the end of a pointer list object.
   `ptrlist' specifies the pointer list object.
   `ptr' specifies the pointer to the region of the new element. */
//C     void tcptrlistpush(TCPTRLIST *ptrlist, void *ptr);
void  tcptrlistpush(TCPTRLIST *ptrlist, void *ptr);


/* Remove an element of the end of a pointer list object.
   `ptrlist' specifies the pointer list object.
   The return value is the pointer to the region of the removed element.
   If the list is empty, the return value is `NULL'. */
//C     void *tcptrlistpop(TCPTRLIST *ptrlist);
void * tcptrlistpop(TCPTRLIST *ptrlist);


/* Add an element at the top of a pointer list object.
   `ptrlist' specifies the pointer list object.
   `ptr' specifies the pointer to the region of the new element. */
//C     void tcptrlistunshift(TCPTRLIST *ptrlist, void *ptr);
void  tcptrlistunshift(TCPTRLIST *ptrlist, void *ptr);


/* Remove an element of the top of a pointer list object.
   `ptrlist' specifies the pointer list object.
   The return value is the pointer to the region of the removed element.
   If the list is empty, the return value is `NULL'. */
//C     void *tcptrlistshift(TCPTRLIST *ptrlist);
void * tcptrlistshift(TCPTRLIST *ptrlist);


/* Add an element at the specified location of a pointer list object.
   `ptrlist' specifies the pointer list object.
   `index' specifies the index of the new element.
   `ptr' specifies the pointer to the region of the new element.
   If `index' is equal to or more than the number of elements, this function has no effect. */
//C     void tcptrlistinsert(TCPTRLIST *ptrlist, int index, void *ptr);
void  tcptrlistinsert(TCPTRLIST *ptrlist, int index, void *ptr);


/* Remove an element at the specified location of a pointer list object.
   `ptrlist' specifies the pointer list object.
   `index' specifies the index of the element to be removed.
   The return value is the pointer to the region of the removed element.
   If `index' is equal to or more than the number of elements, no element is removed and the
   return value is `NULL'. */
//C     void *tcptrlistremove(TCPTRLIST *ptrlist, int index);
void * tcptrlistremove(TCPTRLIST *ptrlist, int index);


/* Overwrite an element at the specified location of a pointer list object.
   `ptrlist' specifies the pointer list object.
   `index' specifies the index of the element to be overwritten.
   `ptr' specifies the pointer to the region of the new content.
   If `index' is equal to or more than the number of elements, this function has no effect. */
//C     void tcptrlistover(TCPTRLIST *ptrlist, int index, void *ptr);
void  tcptrlistover(TCPTRLIST *ptrlist, int index, void *ptr);


/* Clear a pointer list object.
   `ptrlist' specifies the pointer list object.
   All elements are removed. */
//C     void tcptrlistclear(TCPTRLIST *ptrlist);
void  tcptrlistclear(TCPTRLIST *ptrlist);



/*************************************************************************************************
 * bit operation utilities
 *************************************************************************************************/


//C     typedef struct {                         /* type of structure for a bit stream object */
//C       uint8_t *sp;                           /* start pointer */
//C       uint8_t *cp;                           /* current pointer */
//C       int idx;                               /* bit index */
//C       int size;                              /* size of used region */
//C     } TCBITSTRM;
struct _N16
{
    uint8_t *sp;
    uint8_t *cp;
    int idx;
    int size;
}
alias _N16 TCBITSTRM;

//C     typedef unsigned char TCBITMAP;          /* type of a bit map object */
alias ubyte TCBITMAP;


/* Create a bitmap object. */
//C     #define TCBITMAPNEW(TC_num)   tccalloc(((TC_num) >> 3) + 1, 1);


/* Delete a bitmap object */
//C     #define TCBITMAPDEL(TC_bitmap)   do {     tcfree((TC_bitmap));   } while(false);


/* Turn on a field of a bitmap object. */
//C     #define TCBITMAPON(TC_bitmap, TC_idx)   do {     (TC_bitmap)[(TC_idx)>>3] |= 0x1 << ((TC_idx) & 0x7);   } while(false);


/* Turn off a field of a bitmap object. */
//C     #define TCBITMAPOFF(TC_bitmap, TC_idx)   do {     (TC_bitmap)[(TC_idx)>>3] &= ~(0x1 << ((TC_idx) & 0x7));   } while(false);


/* Check a field of a bitmap object. */
//C     #define TCBITMAPCHECK(TC_bitmap, TC_idx)   ((TC_bitmap)[(TC_idx)>>3] & 0x1 << ((TC_idx) & 0x7))


/* Initialize a bit stream object as writer. */
//C     #define TCBITSTRMINITW(TC_bitstrm, TC_ptr)   do {     (TC_bitstrm).sp = (uint8_t *)(TC_ptr);     (TC_bitstrm).cp = (TC_bitstrm).sp;     *(TC_bitstrm).cp = 0;     (TC_bitstrm).idx = 3;     (TC_bitstrm).size = 1;   } while(false);


/* Concatenate a bit to a bit stream object. */
//C     #define TCBITSTRMCAT(TC_bitstrm, sign)   do {     if((TC_bitstrm).idx >= 8){       *(++(TC_bitstrm).cp) = 0;       (TC_bitstrm).idx = 0;       (TC_bitstrm).size++;     }     *(TC_bitstrm).cp |= (sign << (TC_bitstrm).idx);     (TC_bitstrm).idx++;   } while(false);


/* Set the end mark to a bit stream object. */
//C     #define TCBITSTRMSETEND(TC_bitstrm)   do {     if((TC_bitstrm).idx >= 8){       *(++(TC_bitstrm).cp) = 0;       (TC_bitstrm).idx = 0;       (TC_bitstrm).size++;     }     *(TC_bitstrm).sp |= (TC_bitstrm).idx & 7;   } while(false);


/* Get the size of the used region of a bit stream object. */
//C     #define TCBITSTRMSIZE(TC_bitstrm)   ((TC_bitstrm).size)


/* Initialize a bit stream object as reader. */
//C     #define TCBITSTRMINITR(TC_bitstrm, TC_ptr, TC_size)   do {     (TC_bitstrm).sp = (uint8_t *)(TC_ptr);     (TC_bitstrm).cp = (TC_bitstrm).sp;     (TC_bitstrm).idx = 3;     (TC_bitstrm).size = (TC_size);   } while(false);


/* Read a bit from a bit stream object. */
//C     #define TCBITSTRMREAD(TC_bitstrm, TC_sign)   do {     if((TC_bitstrm).idx >= 8){       (TC_bitstrm).cp++;       (TC_bitstrm).idx = 0;     }     (TC_sign) = (*((TC_bitstrm).cp) & (1 << (TC_bitstrm).idx)) > 0;     (TC_bitstrm).idx++;   } while(false);


/* Get the number of bits of a bit stream object. */
//C     #define TCBITSTRMNUM(TC_bitstrm)   ((((TC_bitstrm).size - 1) << 3) + (*(TC_bitstrm).sp & 7) - 3)



/*************************************************************************************************
 * features for experts
 *************************************************************************************************/


//C     #include <stdio.h>
public import tango.stdc.stdio;

//C     #define _TC_VERSION    "1.4.46"
//C     #define _TC_LIBVER     909
//C     #define _TC_FORMATVER  "1.0"
const _TC_LIBVER = 909;

//C     enum {                                   /* enumeration for error codes */
//C       TCESUCCESS,                            /* success */
//C       TCETHREAD,                             /* threading error */
//C       TCEINVALID,                            /* invalid operation */
//C       TCENOFILE,                             /* file not found */
//C       TCENOPERM,                             /* no permission */
//C       TCEMETA,                               /* invalid meta data */
//C       TCERHEAD,                              /* invalid record header */
//C       TCEOPEN,                               /* open error */
//C       TCECLOSE,                              /* close error */
//C       TCETRUNC,                              /* trunc error */
//C       TCESYNC,                               /* sync error */
//C       TCESTAT,                               /* stat error */
//C       TCESEEK,                               /* seek error */
//C       TCEREAD,                               /* read error */
//C       TCEWRITE,                              /* write error */
//C       TCEMMAP,                               /* mmap error */
//C       TCELOCK,                               /* lock error */
//C       TCEUNLINK,                             /* unlink error */
//C       TCERENAME,                             /* rename error */
//C       TCEMKDIR,                              /* mkdir error */
//C       TCERMDIR,                              /* rmdir error */
//C       TCEKEEP,                               /* existing record */
//C       TCENOREC,                              /* no record found */
//C       TCEMISC = 9999                         /* miscellaneous error */
//C     };
enum
{
    TCESUCCESS,
    TCETHREAD,
    TCEINVALID,
    TCENOFILE,
    TCENOPERM,
    TCEMETA,
    TCERHEAD,
    TCEOPEN,
    TCECLOSE,
    TCETRUNC,
    TCESYNC,
    TCESTAT,
    TCESEEK,
    TCEREAD,
    TCEWRITE,
    TCEMMAP,
    TCELOCK,
    TCEUNLINK,
    TCERENAME,
    TCEMKDIR,
    TCERMDIR,
    TCEKEEP,
    TCENOREC,
    TCEMISC = 9999,
}

//C     enum {                                   /* enumeration for database type */
//C       TCDBTHASH,                             /* hash table */
//C       TCDBTBTREE,                            /* B+ tree */
//C       TCDBTFIXED,                            /* fixed-length */
//C       TCDBTTABLE                             /* table */
//C     };
enum
{
    TCDBTHASH,
    TCDBTBTREE,
    TCDBTFIXED,
    TCDBTTABLE,
}


/* Get the message string corresponding to an error code.
   `ecode' specifies the error code.
   The return value is the message string of the error code. */
//C     const char *tcerrmsg(int ecode);
char * tcerrmsg(int ecode);


/* Show error message on the standard error output and exit.
   `message' specifies an error message.
   This function does not return. */
//C     void *tcmyfatal(const char *message);
void * tcmyfatal(char *message);


/* Allocate a large nullified region.
   `size' specifies the size of the region.
   The return value is the pointer to the allocated nullified region.
   This function handles failure of memory allocation implicitly.  The region of the return value
   should be released with the function `tczerounmap' when it is no longer in use. */
//C     void *tczeromap(uint64_t size);
void * tczeromap(uint64_t size);


/* Free a large nullfied region.
   `ptr' specifies the pointer to the region. */
//C     void tczerounmap(void *ptr);
void  tczerounmap(void *ptr);


/* Lock the global mutex object.
   If successful, the return value is true, else, it is false. */
//C     bool tcglobalmutexlock(void);
bool  tcglobalmutexlock();


/* Lock the global mutex object by shared locking.
   If successful, the return value is true, else, it is false. */
//C     bool tcglobalmutexlockshared(void);
bool  tcglobalmutexlockshared();


/* Unlock the global mutex object.
   If successful, the return value is true, else, it is false. */
//C     bool tcglobalmutexunlock(void);
bool  tcglobalmutexunlock();


/* Lock the absolute path of a file.
   `path' specifies the path of the file.
   If successful, the return value is true, else, it is false. */
//C     bool tcpathlock(const char *path);
bool  tcpathlock(char *path);


/* Unock the absolute path of a file.
   `path' specifies the path of the file.
   If successful, the return value is true, else, it is false. */
//C     bool tcpathunlock(const char *path);
bool  tcpathunlock(char *path);


/* Convert an integer to the string as binary numbers.
   `num' specifies the integer.
   `buf' specifies the pointer to the region into which the result string is written.  The size
   of the buffer should be equal to or more than 65 bytes.
   `col' specifies the number of columns.  If it is not more than 0, it depends on the integer.
   `fc' specifies the filling character.
   The return value is the length of the result string. */
//C     int tcnumtostrbin(uint64_t num, char *buf, int col, int fc);
int  tcnumtostrbin(uint64_t num, char *buf, int col, int fc);


/* Compare two keys by lexical order.
   `aptr' specifies the pointer to the region of one key.
   `asiz' specifies the size of the region of one key.
   `bptr' specifies the pointer to the region of the other key.
   `bsiz' specifies the size of the region of the other key.
   `op' is ignored.
   The return value is positive if the former is big, negative if the latter is big, 0 if both
   are equivalent. */
//C     int tccmplexical(const char *aptr, int asiz, const char *bptr, int bsiz, void *op);
int  tccmplexical(char *aptr, int asiz, char *bptr, int bsiz, void *op);


/* Compare two keys as decimal strings of real numbers.
   `aptr' specifies the pointer to the region of one key.
   `asiz' specifies the size of the region of one key.
   `bptr' specifies the pointer to the region of the other key.
   `bsiz' specifies the size of the region of the other key.
   `op' is ignored.
   The return value is positive if the former is big, negative if the latter is big, 0 if both
   are equivalent. */
//C     int tccmpdecimal(const char *aptr, int asiz, const char *bptr, int bsiz, void *op);
int  tccmpdecimal(char *aptr, int asiz, char *bptr, int bsiz, void *op);


/* Compare two keys as 32-bit integers in the native byte order.
   `aptr' specifies the pointer to the region of one key.
   `asiz' specifies the size of the region of one key.
   `bptr' specifies the pointer to the region of the other key.
   `bsiz' specifies the size of the region of the other key.
   `op' is ignored.
   The return value is positive if the former is big, negative if the latter is big, 0 if both
   are equivalent. */
//C     int tccmpint32(const char *aptr, int asiz, const char *bptr, int bsiz, void *op);
int  tccmpint32(char *aptr, int asiz, char *bptr, int bsiz, void *op);


/* Compare two keys as 64-bit integers in the native byte order.
   `aptr' specifies the pointer to the region of one key.
   `asiz' specifies the size of the region of one key.
   `bptr' specifies the pointer to the region of the other key.
   `bsiz' specifies the size of the region of the other key.
   `op' is ignored.
   The return value is positive if the former is big, negative if the latter is big, 0 if both
   are equivalent. */
//C     int tccmpint64(const char *aptr, int asiz, const char *bptr, int bsiz, void *op);
int  tccmpint64(char *aptr, int asiz, char *bptr, int bsiz, void *op);


/* Encode a serial object with BWT encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `idxp' specifies the pointer to the variable into which the index of the original string in
   the rotation array is assigned.
   The return value is the pointer to the result object.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when it
   is no longer in use. */
//C     char *tcbwtencode(const char *ptr, int size, int *idxp);
char * tcbwtencode(char *ptr, int size, int *idxp);


/* Decode a serial object encoded with BWT encoding.
   `ptr' specifies the pointer to the region.
   `size' specifies the size of the region.
   `idx' specifies the index of the original string in the rotation array is assigned.
   The return value is the pointer to the result object.
   Because an additional zero code is appended at the end of the region of the return value,
   the return value can be treated as a character string.  Because the region of the return
   value is allocated with the `malloc' call, it should be released with the `free' call when it
   is no longer in use. */
//C     char *tcbwtdecode(const char *ptr, int size, int idx);
char * tcbwtdecode(char *ptr, int size, int idx);


/* Get the binary logarithm of an integer.
   `num' specifies an integer.
   The return value is the binary logarithm. */
//C     long tclog2l(long num);
int  tclog2l(int num);


/* Get the binary logarithm of a real number.
   `num' specifies a real number.
   The return value is the binary logarithm. */
//C     double tclog2d(double num);
double  tclog2d(double num);


/* Get the aligned offset of a file offset.
   `off' specifies the file offset.
   The return value is the aligned offset. */
//C     uint64_t tcpagealign(uint64_t off);
uint64_t  tcpagealign(uint64_t off);


/* Print debug information with a formatted string as with `printf'. */
//C     #if __STDC_VERSION__ >= 199901L
//C     #define TCDPRINTF(...)   do {     fprintf(stderr, "%s:%d:%s: ", __FILE__, __LINE__, __func__);     fprintf(stderr, __VA_ARGS__);     fprintf(stderr, "\n");   } while(false);
//C     #else
//C     #define TCDPRINTF(TC_str)   do {     fprintf(stderr, "%s:%d:%s: %s\n", __FILE__, __LINE__, __func__, TC_str);   } while(false);
//C     #endif


/* Print hexadecimal pattern of a binary region. */
//C     #define TCPRINTHEX(TC_ptr, TC_size)   do {     for(int TC_i = 0; TC_i < (TC_size); TC_i++){       if(TC_i > 0) putchar(' ');       printf("%02X", ((unsigned char *)(TC_ptr))[TC_i]);     }     putchar('\n');   } while(false);


/* Print an extensible string object. */
//C     #define TCPRINTXSTR(TC_xstr)   do {     fwrite(tcxstrptr((TC_xstr)), tcxstrsize((TC_xstr)), 1, stdout);     putchar('\n');   } while(false);


/* Print all elements of a list object. */
//C     #define TCPRINTLIST(TC_list)   do {     for(int TC_i = 0; TC_i < tclistnum((TC_list)); TC_i++){       int TC_size;       const char *TC_ptr = tclistval((TC_list), TC_i, &TC_size);       printf("%p\t", (void *)(TC_list));       fwrite(TC_ptr, TC_size, 1, stdout);       putchar('\n');     }     putchar('\n');   } while(false);


/* Print all records of a list object. */
//C     #define TCPRINTMAP(TC_map)   do {     TCLIST *TC_keys = tcmapkeys((TC_map));     for(int TC_i = 0; TC_i < tclistnum(TC_keys); TC_i++){       int TC_ksiz;       const char *TC_kbuf = tclistval(TC_keys, TC_i, &TC_ksiz);       int TC_vsiz;       const char *TC_vbuf = tcmapget((TC_map), TC_kbuf, TC_ksiz, &TC_vsiz);       printf("%p\t", (void *)(TC_map));       fwrite(TC_kbuf, TC_ksiz, 1, stdout);       putchar('\t');       fwrite(TC_vbuf, TC_vsiz, 1, stdout);       putchar('\n');     }     putchar('\n');     tclistdel(TC_keys);   } while(false);


/* Alias of `tcmalloc'. */
//C     #if defined(_MYFASTEST)
//C     #define TCMALLOC(TC_res, TC_size)   do {     (TC_res) = MYMALLOC(TC_size);   } while(false)
//C     #else
//C     #define TCMALLOC(TC_res, TC_size)   do {     if(!((TC_res) = MYMALLOC(TC_size))) tcmyfatal("out of memory");   } while(false)
//C     #endif


/* Alias of `tccalloc'. */
//C     #if defined(_MYFASTEST)
//C     #define TCCALLOC(TC_res, TC_nmemb, TC_size)   do {     (TC_res) = MYCALLOC((TC_nmemb), (TC_size));   } while(false)
//C     #else
//C     #define TCCALLOC(TC_res, TC_nmemb, TC_size)   do {     if(!((TC_res) = MYCALLOC((TC_nmemb), (TC_size)))) tcmyfatal("out of memory");   } while(false)
//C     #endif


/* Alias of `tcrealloc'. */
//C     #if defined(_MYFASTEST)
//C     #define TCREALLOC(TC_res, TC_ptr, TC_size)   do {     (TC_res) = MYREALLOC((TC_ptr), (TC_size));   } while(false)
//C     #else
//C     #define TCREALLOC(TC_res, TC_ptr, TC_size)   do {     if(!((TC_res) = MYREALLOC((TC_ptr), (TC_size)))) tcmyfatal("out of memory");   } while(false)
//C     #endif


/* Alias of `tcmemdup'. */
//C     #define TCMEMDUP(TC_res, TC_ptr, TC_size)   do {     TCMALLOC((TC_res), (TC_size) + 1);     memcpy((TC_res), (TC_ptr), (TC_size));     (TC_res)[TC_size] = '\0';   } while(false)


/* Alias of `tcfree'. */
//C     #define TCFREE(TC_ptr)   do {     MYFREE(TC_ptr);   } while(false)


/* Get the alignment of a variable type. */
//C     #define TCALIGNOF(TC_a)   ((int)offsetof(struct { int8_t TC_top; TC_a TC_bot; }, TC_bot))


/* Get the size of padding bytes for pointer alignment. */
//C     typedef union { int32_t i; int64_t l; double d; void *p; TCCMP f; } tcgeneric_t;
union _N19
{
    int32_t i;
    int64_t l;
    double d;
    void *p;
    TCCMP f;
}
alias _N19 tcgeneric_t;
//C     #define TCALIGNPAD(TC_hsiz)   (((TC_hsiz | ~-TCALIGNOF(tcgeneric_t)) + 1) - TC_hsiz)


/* Alias of `tcxstrcat'. */
//C     #define TCXSTRCAT(TC_xstr, TC_ptr, TC_size)   do {     int TC_mysize = (TC_size);     int TC_nsize = (TC_xstr)->size + TC_mysize + 1;     if((TC_xstr)->asize < TC_nsize){       while((TC_xstr)->asize < TC_nsize){         (TC_xstr)->asize *= 2;         if((TC_xstr)->asize < TC_nsize) (TC_xstr)->asize = TC_nsize;       }       TCREALLOC((TC_xstr)->ptr, (TC_xstr)->ptr, (TC_xstr)->asize);     }     memcpy((TC_xstr)->ptr + (TC_xstr)->size, (TC_ptr), TC_mysize);     (TC_xstr)->size += TC_mysize;     (TC_xstr)->ptr[(TC_xstr)->size] = '\0';   } while(false)


/* Alias of `tcxstrptr'. */
//C     #define TCXSTRPTR(TC_xstr)   ((TC_xstr)->ptr)


/* Alias of `tcxstrsize'. */
//C     #define TCXSTRSIZE(TC_xstr)   ((TC_xstr)->size)


/* Alias of `tclistnum'. */
//C     #define TCLISTNUM(TC_list)   ((TC_list)->num)


/* Alias of `tclistval' but not checking size. */
//C     #define TCLISTVAL(TC_ptr, TC_list, TC_index, TC_size)   do {     (TC_ptr) = (TC_list)->array[(TC_index)+(TC_list)->start].ptr;     (TC_size) = (TC_list)->array[(TC_index)+(TC_list)->start].size;   } while(false)


/* Alias of `tclistval' but not checking size and not using the third parameter. */
//C     #define TCLISTVALPTR(TC_list, TC_index)   ((void *)((TC_list)->array[(TC_index)+(TC_list)->start].ptr))


/* Alias of `tclistval' but not checking size and returning the size of the value. */
//C     #define TCLISTVALSIZ(TC_list, TC_index)   ((TC_list)->array[(TC_index)+(TC_list)->start].size)


/* Alias of `tclistpush'. */
//C     #define TCLISTPUSH(TC_list, TC_ptr, TC_size)   do {     int TC_mysize = (TC_size);     int TC_index = (TC_list)->start + (TC_list)->num;     if(TC_index >= (TC_list)->anum){       (TC_list)->anum += (TC_list)->num + 1;       TCREALLOC((TC_list)->array, (TC_list)->array,                 (TC_list)->anum * sizeof((TC_list)->array[0]));     }     TCLISTDATUM *array = (TC_list)->array;     TCMALLOC(array[TC_index].ptr, TC_mysize + 1);         memcpy(array[TC_index].ptr, (TC_ptr), TC_mysize);     array[TC_index].ptr[TC_mysize] = '\0';     array[TC_index].size = TC_mysize;     (TC_list)->num++;   } while(false)


/* Alias of `tclistinsert'. */
//C     #define TCLISTINSERT(TC_list, TC_index, TC_ptr, TC_size)   do {     int TC_myindex = (TC_index);     TC_myindex += (TC_list)->start;     if((TC_list)->start + (TC_list)->num >= (TC_list)->anum){       (TC_list)->anum += (TC_list)->num + 1;       TCREALLOC((TC_list)->array, (TC_list)->array,                 (TC_list)->anum * sizeof((TC_list)->array[0]));     }     memmove((TC_list)->array + TC_myindex + 1, (TC_list)->array + TC_myindex,             sizeof((TC_list)->array[0]) * ((TC_list)->start + (TC_list)->num - TC_myindex));     TCMALLOC((TC_list)->array[TC_myindex].ptr, (TC_size) + 1);     memcpy((TC_list)->array[TC_myindex].ptr, (TC_ptr), (TC_size));     (TC_list)->array[TC_myindex].ptr[(TC_size)] = '\0';     (TC_list)->array[TC_myindex].size = (TC_size);     (TC_list)->num++;   } while(false)


/* Truncate a list object. */
//C     #define TCLISTTRUNC(TC_list, TC_num)   do {     while((TC_list)->num > (TC_num)){       TCFREE((TC_list)->array[--(TC_list)->num].ptr);     }   } while(false)


/* Alias of `tcmaprnum'. */
//C     #define TCMAPRNUM(TC_map)   ((TC_map)->rnum)


/* Alias of `tcptrlistnum'. */
//C     #define TCPTRLISTNUM(TC_ptrlist)   ((TC_ptrlist)->num)


/* Alias of `tcptrlistval'. */
//C     #define TCPTRLISTVAL(TC_ptrlist, TC_index)   ((void *)((TC_ptrlist)->array[(TC_index)+(TC_ptrlist)->start]))


/* Alias of `tcptrlistpush'. */
//C     #define TCPTRLISTPUSH(TC_ptrlist, TC_ptr)   do {     int TC_index = (TC_ptrlist)->start + (TC_ptrlist)->num;     if(TC_index >= (TC_ptrlist)->anum){       (TC_ptrlist)->anum += (TC_ptrlist)->num + 1;       TCREALLOC((TC_ptrlist)->array, (TC_ptrlist)->array,                 (TC_ptrlist)->anum * sizeof((TC_ptrlist)->array[0]));     }     (TC_ptrlist)->array[TC_index] = (TC_ptr);     (TC_ptrlist)->num++;   } while(false)


/* Alias of `tcptrlistinsert'. */
//C     #define TCPTRLISTINSERT(TC_ptrlist, TC_index, TC_ptr)   do {     int TC_myindex = (TC_index);     TC_myindex += (TC_ptrlist)->start;     if((TC_ptrlist)->start + (TC_ptrlist)->num >= (TC_ptrlist)->anum){       (TC_ptrlist)->anum += (TC_ptrlist)->num + 1;       TCREALLOC((TC_ptrlist)->array, (TC_ptrlist)->array,                 (TC_ptrlist)->anum * sizeof((TC_ptrlist)->array[0]));     }     memmove((TC_ptrlist)->array + TC_myindex + 1, (TC_ptrlist)->array + TC_myindex,             sizeof((TC_ptrlist)->array[0]) * ((TC_ptrlist)->start +                                               (TC_ptrlist)->num - TC_myindex));     (TC_ptrlist)->array[TC_myindex] = (TC_ptr);     (TC_ptrlist)->num++;   } while(false)


/* Truncate a pointer list object. */
//C     #define TCPTRLISTTRUNC(TC_ptrlist, TC_num)   do {     (TC_ptrlist)->num = (TC_num);   } while(false)


/* tricks for backward compatibility
//C     #define BDBCMP            TCCMP
//C     #define tcbdbrange3       tcbdbfwmkeys2
alias TCCMP BDBCMP;
//C     #define tcbdbcmplexical   tccmplexical
alias tcbdbfwmkeys2 tcbdbrange3;
//C     #define tcbdbcmpdecimal   tccmpdecimal
alias tccmplexical tcbdbcmplexical;
//C     #define tcbdbcmpint32     tccmpint32
alias tccmpdecimal tcbdbcmpdecimal;
//C     #define tcbdbcmpint64     tccmpint64
alias tccmpint32 tcbdbcmpint32;
//C     #define tctdbqryprocout   tctdbqrysearchout
alias tccmpint64 tcbdbcmpint64;
//C     #define tctdbqrysetmax(TC_tdb, TC_max)   tctdbqrysetlimit((TC_tdb), (TC_max), 0)
alias tctdbqrysearchout tctdbqryprocout;
*/


//C     __TCUTIL_CLINKAGEEND
//C     #endif                                   /* duplication check */


/* END OF FILE */
