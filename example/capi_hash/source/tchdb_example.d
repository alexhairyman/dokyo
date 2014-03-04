import dokyo.capi.tchdb;
import std.string;

pragma(lib, "/Users/alexhairyman/usr/lib/libtcejdb.a");


void main()
{

  TCHDB* mhdb = tchdbnew();
  tchdbopen(mhdb, "hdb.db".dup.ptr, HDBOCREAT | HDBOWRITER);
  tchdbput2(mhdb, "hello".dup.ptr, "goodbye".dup.ptr);
  
  tchdbclose(mhdb);
  tchdbdel(mhdb);
}