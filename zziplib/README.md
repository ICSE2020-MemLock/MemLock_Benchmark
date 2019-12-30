### zziplib v0.13.68
- Bug type: uncontrolled-memory-allocation, memory leak
- CVE ID: 
  - [CVE-2018-6869](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-6869)
  - the meory leak is very easy to find in CVE website, lots of memory leak
- Download:
  ```
  git clone https://github.com/gdraheim/zziplib
  git checkout bf4584fb06d5f9c5813616dbadc0129024c9c0f9
  ```
- Reproduce: `zzdir @@` || `unzzip @@`
- ASAN dumps the backtrace:

`CVE-2018-6869`
```
==10395==ERROR: AddressSanitizer failed to allocate 0x8064b8000 (34465349632) bytes of LargeMmapAllocator (errno: 12)
==10395==Process memory map follows:
0x000000400000-0x000000403000	./product/zziplib/master/exe_asan/bin/zzdir
0x000000602000-0x000000603000	./product/zziplib/master/exe_asan/bin/zzdir
0x000000603000-0x000000604000	./product/zziplib/master/exe_asan/bin/zzdir
0x00007fff7000-0x00008fff7000
0x00008fff7000-0x02008fff7000
0x02008fff7000-0x10007fff8000
0x600000000000-0x60c000000000
0x60c000000000-0x60c000010000
0x60c000010000-0x619000000000
0x619000000000-0x619000020000
0x619000020000-0x640000000000
0x640000000000-0x640000003000
0x7ff68ba00000-0x7ff68bb00000
0x7ff68bc00000-0x7ff68bd00000
0x7ff68bdb5000-0x7ff68e107000
0x7ff68e107000-0x7ff68e11c000	/usr/lib64/libgcc_s-4.8.5-20150702.so.1
0x7ff68e11c000-0x7ff68e31b000	/usr/lib64/libgcc_s-4.8.5-20150702.so.1
0x7ff68e31b000-0x7ff68e31c000	/usr/lib64/libgcc_s-4.8.5-20150702.so.1
0x7ff68e31c000-0x7ff68e31d000	/usr/lib64/libgcc_s-4.8.5-20150702.so.1
0x7ff68e31d000-0x7ff68e41e000	/usr/lib64/libm-2.17.so
0x7ff68e41e000-0x7ff68e61d000	/usr/lib64/libm-2.17.so
0x7ff68e61d000-0x7ff68e61e000	/usr/lib64/libm-2.17.so
0x7ff68e61e000-0x7ff68e61f000	/usr/lib64/libm-2.17.so
0x7ff68e61f000-0x7ff68e708000	/usr/lib64/libstdc++.so.6.0.19
0x7ff68e708000-0x7ff68e908000	/usr/lib64/libstdc++.so.6.0.19
0x7ff68e908000-0x7ff68e910000	/usr/lib64/libstdc++.so.6.0.19
0x7ff68e910000-0x7ff68e912000	/usr/lib64/libstdc++.so.6.0.19
0x7ff68e912000-0x7ff68e927000
0x7ff68e927000-0x7ff68e929000	/usr/lib64/libdl-2.17.so
0x7ff68e929000-0x7ff68eb29000	/usr/lib64/libdl-2.17.so
0x7ff68eb29000-0x7ff68eb2a000	/usr/lib64/libdl-2.17.so
0x7ff68eb2a000-0x7ff68eb2b000	/usr/lib64/libdl-2.17.so
0x7ff68eb2b000-0x7ff68eb42000	/usr/lib64/libpthread-2.17.so
0x7ff68eb42000-0x7ff68ed41000	/usr/lib64/libpthread-2.17.so
0x7ff68ed41000-0x7ff68ed42000	/usr/lib64/libpthread-2.17.so
0x7ff68ed42000-0x7ff68ed43000	/usr/lib64/libpthread-2.17.so
0x7ff68ed43000-0x7ff68ed47000
0x7ff68ed47000-0x7ff68eeff000	/usr/lib64/libc-2.17.so
0x7ff68eeff000-0x7ff68f0ff000	/usr/lib64/libc-2.17.so
0x7ff68f0ff000-0x7ff68f103000	/usr/lib64/libc-2.17.so
0x7ff68f103000-0x7ff68f105000	/usr/lib64/libc-2.17.so
0x7ff68f105000-0x7ff68f10a000
0x7ff68f10a000-0x7ff68f11f000	/usr/lib64/libz.so.1.2.7
0x7ff68f11f000-0x7ff68f31e000	/usr/lib64/libz.so.1.2.7
0x7ff68f31e000-0x7ff68f31f000	/usr/lib64/libz.so.1.2.7
0x7ff68f31f000-0x7ff68f320000	/usr/lib64/libz.so.1.2.7
0x7ff68f320000-0x7ff68f339000	./product/zziplib/master/exe_asan/lib/libzzip-0.so.13.0.65
0x7ff68f339000-0x7ff68f538000	./product/zziplib/master/exe_asan/lib/libzzip-0.so.13.0.65
0x7ff68f538000-0x7ff68f539000	./product/zziplib/master/exe_asan/lib/libzzip-0.so.13.0.65
0x7ff68f539000-0x7ff68f53a000	./product/zziplib/master/exe_asan/lib/libzzip-0.so.13.0.65
0x7ff68f53a000-0x7ff68f53b000
0x7ff68f53b000-0x7ff68f632000	/usr/lib64/libasan.so.2.0.0
0x7ff68f632000-0x7ff68f832000	/usr/lib64/libasan.so.2.0.0
0x7ff68f832000-0x7ff68f835000	/usr/lib64/libasan.so.2.0.0
0x7ff68f835000-0x7ff68f836000	/usr/lib64/libasan.so.2.0.0
0x7ff68f836000-0x7ff6904ab000
0x7ff6904ab000-0x7ff6904cc000	/usr/lib64/ld-2.17.so
0x7ff690662000-0x7ff690669000
0x7ff690683000-0x7ff6906c0000
0x7ff6906c1000-0x7ff6906cc000
0x7ff6906cc000-0x7ff6906cd000	/usr/lib64/ld-2.17.so
0x7ff6906cd000-0x7ff6906ce000	/usr/lib64/ld-2.17.so
0x7ff6906ce000-0x7ff6906cf000
0x7ffcd3484000-0x7ffcd34a5000	[stack]
0x7ffcd34ff000-0x7ffcd3501000	[vdso]
0xffffffffff600000-0xffffffffff601000	[vsyscall]
==10395==End of process memory map.
==10395==AddressSanitizer CHECK failed: ../../../../libsanitizer/sanitizer_common/sanitizer_posix.cc:121 "(("unable to mmap" && 0)) != (0)" (0x0, 0x0)
#0 0x7ff68f5dba31 (/lib64/libasan.so.2+0xa0a31)
#1 0x7ff68f5e09e3 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) (/lib64/libasan.so.2+0xa59e3)
#2 0x7ff68f5e8a11 (/lib64/libasan.so.2+0xada11)
#3 0x7ff68f55e0cc (/lib64/libasan.so.2+0x230cc)
#4 0x7ff68f5d39e7 in malloc (/lib64/libasan.so.2+0x989e7)
#5 0x7ff68f325fc3 in __zzip_parse_root_directory ./product/zziplib/master/src/zzip/zip.c:409
#6 0x7ff68f327b8c in __zzip_dir_parse ./product/zziplib/master/src/zzip/zip.c:738
#7 0x7ff68f327b8c in zzip_dir_fdopen_ext_io ./product/zziplib/master/src/zzip/zip.c:696
#8 0x7ff68f330f8b in zzip_opendir_ext_io ./product/zziplib/master/src/zzip/dir.c:288
#9 0x400f2e in main ./product/zziplib/master/src/bins/zzdir.c:41
#10 0x7ff68ed68c04 in __libc_start_main (/lib64/libc.so.6+0x21c04)
#11 0x4015ec (./product/zziplib/master/exe_asan/bin/zzdir+0x4015ec)
```