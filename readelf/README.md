### readelf 2.28
- Bug type: uncontrolled-memory-allocation
- CVE ID: 
  - [CVE-2017-15996](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-15996)
- Download:
  - https://ftp.gnu.org/gnu/binutils/
- Reproduce: `readelf -a @@`
- ASAN dumps the backtrace:

`CVE-2017-15996`
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

`get_program_headers`
```
readelf: Warning: Section 0 has an out of range sh_link value of 1280068684
readelf: Warning: Section 0 has an out of range sh_info value of 1280068684
readelf: Warning: Section 1 has an out of range sh_link value of 1280068684
readelf: Warning: Section 1 has an out of range sh_info value of 1280068684
readelf: Warning: Section 2 has an out of range sh_link value of 1280068684
readelf: Warning: Section 2 has an out of range sh_info value of 1280068684
readelf: Warning: Section 3 has an out of range sh_link value of 1280068684
readelf: Warning: Section 3 has an out of range sh_info value of 1280068684
readelf: Warning: [ 0]: Expected link to another section in info fieldreadelf: Warning: section 0: sh_link value of 1280068684 is larger than the number of sections
readelf: Warning: [ 1]: Expected link to another section in info fieldreadelf: Warning: section 1: sh_link value of 1280068684 is larger than the number of sections
readelf: Warning: [ 2]: Expected link to another section in info fieldreadelf: Warning: section 2: sh_link value of 1280068684 is larger than the number of sections
readelf: Warning: [ 3]: Expected link to another section in info fieldreadelf: Warning: section 3: sh_link value of 1280068684 is larger than the number of sections
==11060==ERROR: AddressSanitizer failed to allocate 0x1313134000 (81924407296) bytes of LargeMmapAllocator (error code: 12)
==11060==Process memory map follows:
	0x000000400000-0x00000078f000	/home/wencheng/Documents/OOM_Object/binutils-2.28/build/bin/readelf
	0x00000098e000-0x00000098f000	/home/wencheng/Documents/OOM_Object/binutils-2.28/build/bin/readelf
	0x00000098f000-0x000000a08000	/home/wencheng/Documents/OOM_Object/binutils-2.28/build/bin/readelf
	0x000000a08000-0x000001682000	
	0x00007fff7000-0x00008fff7000	
	0x00008fff7000-0x02008fff7000	
	0x02008fff7000-0x10007fff8000	
	0x600000000000-0x602000000000	
	0x602000000000-0x602000010000	
	0x602000010000-0x602e00000000	
	0x602e00000000-0x602e00010000	
	0x602e00010000-0x603000000000	
	0x603000000000-0x603000010000	
	0x603000010000-0x603e00000000	
	0x603e00000000-0x603e00010000	
	0x603e00010000-0x604000000000	
	0x604000000000-0x604000010000	
	0x604000010000-0x604e00000000	
	0x604e00000000-0x604e00010000	
	0x604e00010000-0x606000000000	
	0x606000000000-0x606000010000	
	0x606000010000-0x606e00000000	
	0x606e00000000-0x606e00010000	
	0x606e00010000-0x607000000000	
	0x607000000000-0x607000010000	
	0x607000010000-0x607e00000000	
	0x607e00000000-0x607e00010000	
	0x607e00010000-0x608000000000	
	0x608000000000-0x608000010000	
	0x608000010000-0x608e00000000	
	0x608e00000000-0x608e00010000	
	0x608e00010000-0x60b000000000	
	0x60b000000000-0x60b000010000	
	0x60b000010000-0x60be00000000	
	0x60be00000000-0x60be00010000	
	0x60be00010000-0x60c000000000	
	0x60c000000000-0x60c000010000	
	0x60c000010000-0x60ce00000000	
	0x60ce00000000-0x60ce00010000	
	0x60ce00010000-0x60f000000000	
	0x60f000000000-0x60f000010000	
	0x60f000010000-0x60fe00000000	
	0x60fe00000000-0x60fe00010000	
	0x60fe00010000-0x610000000000	
	0x610000000000-0x610000010000	
	0x610000010000-0x610e00000000	
	0x610e00000000-0x610e00010000	
	0x610e00010000-0x611000000000	
	0x611000000000-0x611000010000	
	0x611000010000-0x611e00000000	
	0x611e00000000-0x611e00010000	
	0x611e00010000-0x612000000000	
	0x612000000000-0x612000010000	
	0x612000010000-0x612e00000000	
	0x612e00000000-0x612e00010000	
	0x612e00010000-0x614000000000	
	0x614000000000-0x614000010000	
	0x614000010000-0x614e00000000	
	0x614e00000000-0x614e00010000	
	0x614e00010000-0x616000000000	
	0x616000000000-0x616000010000	
	0x616000010000-0x616e00000000	
	0x616e00000000-0x616e00010000	
	0x616e00010000-0x618000000000	
	0x618000000000-0x618000010000	
	0x618000010000-0x618e00000000	
	0x618e00000000-0x618e00010000	
	0x618e00010000-0x619000000000	
	0x619000000000-0x619000010000	
	0x619000010000-0x619e00000000	
	0x619e00000000-0x619e00010000	
	0x619e00010000-0x61b000000000	
	0x61b000000000-0x61b000010000	
	0x61b000010000-0x61be00000000	
	0x61be00000000-0x61be00010000	
	0x61be00010000-0x61d000000000	
	0x61d000000000-0x61d000010000	
	0x61d000010000-0x61de00000000	
	0x61de00000000-0x61de00010000	
	0x61de00010000-0x621000000000	
	0x621000000000-0x621000010000	
	0x621000010000-0x621e00000000	
	0x621e00000000-0x621e00010000	
	0x621e00010000-0x624000000000	
	0x624000000000-0x624000010000	
	0x624000010000-0x624e00000000	
	0x624e00000000-0x624e00010000	
	0x624e00010000-0x640000000000	
	0x640000000000-0x640000003000	
	0x7f68eb074000-0x7f68eb500000	/usr/lib/locale/locale-archive
	0x7f68eb500000-0x7f68eb600000	
	0x7f68eb700000-0x7f68eb800000	
	0x7f68eb900000-0x7f68eba00000	
	0x7f68eba97000-0x7f68edde9000	
	0x7f68edde9000-0x7f68edfa9000	/lib/x86_64-linux-gnu/libc-2.23.so
	0x7f68edfa9000-0x7f68ee1a9000	/lib/x86_64-linux-gnu/libc-2.23.so
	0x7f68ee1a9000-0x7f68ee1ad000	/lib/x86_64-linux-gnu/libc-2.23.so
	0x7f68ee1ad000-0x7f68ee1af000	/lib/x86_64-linux-gnu/libc-2.23.so
	0x7f68ee1af000-0x7f68ee1b3000	
	0x7f68ee1b3000-0x7f68ee1c9000	/lib/x86_64-linux-gnu/libgcc_s.so.1
	0x7f68ee1c9000-0x7f68ee3c8000	/lib/x86_64-linux-gnu/libgcc_s.so.1
	0x7f68ee3c8000-0x7f68ee3c9000	/lib/x86_64-linux-gnu/libgcc_s.so.1
	0x7f68ee3c9000-0x7f68ee3cc000	/lib/x86_64-linux-gnu/libdl-2.23.so
	0x7f68ee3cc000-0x7f68ee5cb000	/lib/x86_64-linux-gnu/libdl-2.23.so
	0x7f68ee5cb000-0x7f68ee5cc000	/lib/x86_64-linux-gnu/libdl-2.23.so
	0x7f68ee5cc000-0x7f68ee5cd000	/lib/x86_64-linux-gnu/libdl-2.23.so
	0x7f68ee5cd000-0x7f68ee6d5000	/lib/x86_64-linux-gnu/libm-2.23.so
	0x7f68ee6d5000-0x7f68ee8d4000	/lib/x86_64-linux-gnu/libm-2.23.so
	0x7f68ee8d4000-0x7f68ee8d5000	/lib/x86_64-linux-gnu/libm-2.23.so
	0x7f68ee8d5000-0x7f68ee8d6000	/lib/x86_64-linux-gnu/libm-2.23.so
	0x7f68ee8d6000-0x7f68ee8dd000	/lib/x86_64-linux-gnu/librt-2.23.so
	0x7f68ee8dd000-0x7f68eeadc000	/lib/x86_64-linux-gnu/librt-2.23.so
	0x7f68eeadc000-0x7f68eeadd000	/lib/x86_64-linux-gnu/librt-2.23.so
	0x7f68eeadd000-0x7f68eeade000	/lib/x86_64-linux-gnu/librt-2.23.so
	0x7f68eeade000-0x7f68eeaf6000	/lib/x86_64-linux-gnu/libpthread-2.23.so
	0x7f68eeaf6000-0x7f68eecf5000	/lib/x86_64-linux-gnu/libpthread-2.23.so
	0x7f68eecf5000-0x7f68eecf6000	/lib/x86_64-linux-gnu/libpthread-2.23.so
	0x7f68eecf6000-0x7f68eecf7000	/lib/x86_64-linux-gnu/libpthread-2.23.so
	0x7f68eecf7000-0x7f68eecfb000	
	0x7f68eecfb000-0x7f68eed21000	/lib/x86_64-linux-gnu/ld-2.23.so
	0x7f68eed81000-0x7f68eeef6000	
	0x7f68eeef6000-0x7f68eef20000	
	0x7f68eef20000-0x7f68eef21000	/lib/x86_64-linux-gnu/ld-2.23.so
	0x7f68eef21000-0x7f68eef22000	/lib/x86_64-linux-gnu/ld-2.23.so
	0x7f68eef22000-0x7f68eef23000	
	0x7fff02b8d000-0x7fff02bae000	[stack]
	0x7fff02bda000-0x7fff02bdd000	[vvar]
	0x7fff02bdd000-0x7fff02bdf000	[vdso]
	0xffffffffff600000-0xffffffffff601000	[vsyscall]
==11060==End of process memory map.
==11060==AddressSanitizer CHECK failed: /build/llvm-toolchain-4.0-euGZ6h/llvm-toolchain-4.0-4.0/projects/compiler-rt/lib/sanitizer_common/sanitizer_common.cc:120 "((0 && "unable to mmap")) != (0)" (0x0, 0x0)
    #0 0x4dc8ff in __asan::AsanCheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) (/home/wencheng/Documents/OOM_Object/binutils-2.28/build/bin/readelf+0x4dc8ff)
    #1 0x4f7875 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) (/home/wencheng/Documents/OOM_Object/binutils-2.28/build/bin/readelf+0x4f7875)
    #2 0x4e6d91 in __sanitizer::ReportMmapFailureAndDie(unsigned long, char const*, char const*, int, bool) (/home/wencheng/Documents/OOM_Object/binutils-2.28/build/bin/readelf+0x4e6d91)
    #3 0x4f09e6 in __sanitizer::MmapOrDie(unsigned long, char const*, bool) (/home/wencheng/Documents/OOM_Object/binutils-2.28/build/bin/readelf+0x4f09e6)
    #4 0x424434 in __asan::Allocator::Allocate(unsigned long, unsigned long, __sanitizer::BufferedStackTrace*, __asan::AllocType, bool) (/home/wencheng/Documents/OOM_Object/binutils-2.28/build/bin/readelf+0x424434)
    #5 0x4d2744 in __interceptor_malloc (/home/wencheng/Documents/OOM_Object/binutils-2.28/build/bin/readelf+0x4d2744)
    #6 0x68294c in xmalloc /home/wencheng/Documents/OOM_Object/binutils-2.28/libiberty/./xmalloc.c:148:12
    #7 0x5ff7d1 in cmalloc /home/wencheng/Documents/OOM_Object/binutils-2.28/binutils/dwarf.c:7450:10
    #8 0x568f59 in get_program_headers /home/wencheng/Documents/OOM_Object/binutils-2.28/binutils/readelf.c:4761:33
    #9 0x5347a5 in process_program_headers /home/wencheng/Documents/OOM_Object/binutils-2.28/binutils/readelf.c:4814:9
    #10 0x52412f in process_object /home/wencheng/Documents/OOM_Object/binutils-2.28/binutils/readelf.c:16751:7
    #11 0x511824 in process_file /home/wencheng/Documents/OOM_Object/binutils-2.28/binutils/readelf.c:17138:13
    #12 0x50f47c in main /home/wencheng/Documents/OOM_Object/binutils-2.28/binutils/readelf.c:17209:12
    #13 0x7f68ede0982f in __libc_start_main /build/glibc-LK5gWL/glibc-2.23/csu/../csu/libc-start.c:291
    #14 0x41a0e8 in _start (/home/wencheng/Documents/OOM_Object/binutils-2.28/build/bin/readelf+0x41a0e8)

Aborted
```