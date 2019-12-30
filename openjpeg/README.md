### openjpeg 2.3.0
- Bug type: uncontrolled-memory-allocation
- CVE ID: 
  - [CVE-2019-6988](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6988)
  - [CVE-2017-12982](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-12982)
- Download:
	```
	git clone https://github.com/uclouvain/openjpeg
	git checkout 51f097e6d5754ddae93e716276fe8176b44ec548
	```
- Reproduce: `opj_decompress -i @@ -o ./tmp.png`
- ASAN dumps the backtrace:

`CVE-2019-6988`
```
[INFO] Start to read j2k main header (0).
[WARNING] Unknown marker
[WARNING] Unknown marker
[WARNING] Cannot take in charge mct data within multiple MCT records
[WARNING] Unknown marker
[ERROR] Unknown progression order in COD marker
[WARNING] Unknown marker
[WARNING] Cannot take in charge mct data within multiple MCT records
[WARNING] Unknown marker
[ERROR] Unknown progression order in COD marker
[WARNING] Unknown marker
[WARNING] Cannot take in charge mct data within multiple MCT records
[WARNING] Unknown marker
[ERROR] Unknown progression order in COD marker
[WARNING] Unknown marker
[INFO] Main header has been correctly decoded.
[INFO] No decoded area parameters, set the decoded area to the whole image
instru: consume too much memory. current memory try to up to 5061073940 bytes.
==32496==WARNING: AddressSanitizer failed to allocate 0x10000000000 bytes
==32496==AddressSanitizer's allocator is terminating the process instead of returning 0
==32496==If you don't like this behavior set allocator_may_return_null=1
==32496==AddressSanitizer CHECK failed: /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:225 "((0)) != (0)" (0x0, 0x0)
    #0 0x4e9665 in __asan::AsanCheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_rtl.cc:69
    #1 0x506f25 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_termination.cc:79
    #2 0x4efa66 in __sanitizer::ReportAllocatorCannotReturnNull() /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:225
    #3 0x4efaa6 in __sanitizer::ReturnNullOrDieOnFailure::OnBadRequest() /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:241
    #4 0x425956 in __asan::asan_malloc(unsigned long, __sanitizer::BufferedStackTrace*) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_allocator.cc:856
    #5 0x4e04eb in malloc /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_malloc_linux.cc:89
    #6 0x519067 in instr_CallocAndSize /home/exp/Documents/MemFuzz/Code/llvm_mode/trace_function.c
    #7 0x5d2b16 in opj_calloc /home/exp/Documents/Mem_obj/openjpeg/src/lib/openjp2/opj_malloc.c:204:5
    #8 0x6cbcba in opj_tgt_create /home/exp/Documents/Mem_obj/openjpeg/src/lib/openjp2/tgt.c:89:37
    #9 0x6b2a8c in opj_tcd_init_tile /home/exp/Documents/Mem_obj/openjpeg/src/lib/openjp2/tcd.c:1119:56
    #10 0x6b3eea in opj_tcd_init_decode_tile /home/exp/Documents/Mem_obj/openjpeg/src/lib/openjp2/tcd.c:1184:12
    #11 0x5f07b3 in opj_j2k_read_tile_header /home/exp/Documents/Mem_obj/openjpeg/src/lib/openjp2/j2k.c:8882:11
    #12 0x63927c in opj_j2k_decode_tiles /home/exp/Documents/Mem_obj/openjpeg/src/lib/openjp2/j2k.c:10717:19
    #13 0x5e9832 in opj_j2k_exec /home/exp/Documents/Mem_obj/openjpeg/src/lib/openjp2/j2k.c:8105:33
    #14 0x6054ac in opj_j2k_decode /home/exp/Documents/Mem_obj/openjpeg/src/lib/openjp2/j2k.c:11029:11
    #15 0x5cdb9c in opj_decode /home/exp/Documents/Mem_obj/openjpeg/src/lib/openjp2/openjpeg.c:483:16
    #16 0x522f51 in main /home/exp/Documents/Mem_obj/openjpeg/src/bin/jp2/opj_decompress.c:1542:19
    #17 0x7f0377ce7b96 in __libc_start_main /build/glibc-OTsEL5/glibc-2.27/csu/../csu/libc-start.c:310
    #18 0x4205d9 in _start (/home/exp/Documents/Mem_obj/openjpeg/build/bin/opj_decompress+0x4205d9)
```

`CVE-2017-12982`
```
# opj_compress -n 1 -i $FILE -o null.j2c
==78690==ERROR: AddressSanitizer failed to allocate 0x5ea7983000 (406538694656) bytes of LargeMmapAllocator (error code: 12)
==78690==Process memory map follows:
        0x000000400000-0x0000005a6000   /usr/bin/opj_compress
        0x0000007a5000-0x0000007a6000   /usr/bin/opj_compress
        0x0000007a6000-0x0000007b0000   /usr/bin/opj_compress
        0x0000007b0000-0x000001425000
        0x00007fff7000-0x00008fff7000
        0x00008fff7000-0x02008fff7000
        0x02008fff7000-0x10007fff8000
        0x600000000000-0x602000000000
        0x602000000000-0x602000010000
        0x602000010000-0x602e00000000
        0x602e00000000-0x602e00010000
        0x602e00010000-0x604000000000
        0x604000000000-0x604000010000
        0x604000010000-0x604e00000000
        0x604e00000000-0x604e00010000
        0x604e00010000-0x606000000000
        0x606000000000-0x606000010000
        0x606000010000-0x606e00000000
        0x606e00000000-0x606e00010000
        0x606e00010000-0x610000000000
        0x610000000000-0x610000010000
        0x610000010000-0x610e00000000
        0x610e00000000-0x610e00010000
        0x610e00010000-0x616000000000
        0x616000000000-0x616000010000
        0x616000010000-0x616e00000000
        0x616e00000000-0x616e00010000
        0x616e00010000-0x621000000000
        0x621000000000-0x621000010000
        0x621000010000-0x621e00000000
        0x621e00000000-0x621e00010000
        0x621e00010000-0x640000000000
        0x640000000000-0x640000003000
        0x7f2622bf7000-0x7f2623800000
        0x7f2623900000-0x7f2623a00000
        0x7f2623a5c000-0x7f2625dae000
        0x7f2625dae000-0x7f2625e16000   /usr/lib64/libjpeg.so.62.2.0
        0x7f2625e16000-0x7f2626016000   /usr/lib64/libjpeg.so.62.2.0
        0x7f2626016000-0x7f2626017000   /usr/lib64/libjpeg.so.62.2.0
        0x7f2626017000-0x7f2626018000   /usr/lib64/libjpeg.so.62.2.0
        0x7f2626018000-0x7f2626021000   /usr/lib64/libjbig.so
        0x7f2626021000-0x7f2626220000   /usr/lib64/libjbig.so
        0x7f2626220000-0x7f2626221000   /usr/lib64/libjbig.so
        0x7f2626221000-0x7f2626224000   /usr/lib64/libjbig.so
        0x7f2626224000-0x7f2626248000   /lib64/liblzma.so.5.2.3
        0x7f2626248000-0x7f2626448000   /lib64/liblzma.so.5.2.3
        0x7f2626448000-0x7f2626449000   /lib64/liblzma.so.5.2.3
        0x7f2626449000-0x7f262644a000   /lib64/liblzma.so.5.2.3
        0x7f262644a000-0x7f2626460000   /lib64/libz.so.1.2.11
        0x7f2626460000-0x7f262665f000   /lib64/libz.so.1.2.11
        0x7f262665f000-0x7f2626660000   /lib64/libz.so.1.2.11
        0x7f2626660000-0x7f2626661000   /lib64/libz.so.1.2.11
        0x7f2626661000-0x7f26267f0000   /lib64/libc-2.23.so
        0x7f26267f0000-0x7f26269f0000   /lib64/libc-2.23.so
        0x7f26269f0000-0x7f26269f4000   /lib64/libc-2.23.so
        0x7f26269f4000-0x7f26269f6000   /lib64/libc-2.23.so
        0x7f26269f6000-0x7f26269fa000
        0x7f26269fa000-0x7f2626a10000   /usr/lib64/gcc/x86_64-pc-linux-gnu/6.3.0/libgcc_s.so.1
        0x7f2626a10000-0x7f2626c0f000   /usr/lib64/gcc/x86_64-pc-linux-gnu/6.3.0/libgcc_s.so.1
        0x7f2626c0f000-0x7f2626c10000   /usr/lib64/gcc/x86_64-pc-linux-gnu/6.3.0/libgcc_s.so.1
        0x7f2626c10000-0x7f2626c11000   /usr/lib64/gcc/x86_64-pc-linux-gnu/6.3.0/libgcc_s.so.1
        0x7f2626c11000-0x7f2626c13000   /lib64/libdl-2.23.so
        0x7f2626c13000-0x7f2626e13000   /lib64/libdl-2.23.so
        0x7f2626e13000-0x7f2626e14000   /lib64/libdl-2.23.so
        0x7f2626e14000-0x7f2626e15000   /lib64/libdl-2.23.so
        0x7f2626e15000-0x7f2626e2c000   /lib64/libpthread-2.23.so
        0x7f2626e2c000-0x7f262702b000   /lib64/libpthread-2.23.so
        0x7f262702b000-0x7f262702c000   /lib64/libpthread-2.23.so
        0x7f262702c000-0x7f262702d000   /lib64/libpthread-2.23.so
        0x7f262702d000-0x7f2627031000
        0x7f2627031000-0x7f2627037000   /lib64/librt-2.23.so
        0x7f2627037000-0x7f2627237000   /lib64/librt-2.23.so
        0x7f2627237000-0x7f2627238000   /lib64/librt-2.23.so
        0x7f2627238000-0x7f2627239000   /lib64/librt-2.23.so
        0x7f2627239000-0x7f262733b000   /lib64/libm-2.23.so
        0x7f262733b000-0x7f262753a000   /lib64/libm-2.23.so
        0x7f262753a000-0x7f262753b000   /lib64/libm-2.23.so
        0x7f262753b000-0x7f262753c000   /lib64/libm-2.23.so
        0x7f262753c000-0x7f2627591000   /usr/lib64/liblcms2.so.2.0.8
        0x7f2627591000-0x7f2627790000   /usr/lib64/liblcms2.so.2.0.8
        0x7f2627790000-0x7f2627791000   /usr/lib64/liblcms2.so.2.0.8
        0x7f2627791000-0x7f2627796000   /usr/lib64/liblcms2.so.2.0.8
        0x7f2627796000-0x7f2627809000   /usr/lib64/libtiff.so.5.2.6
        0x7f2627809000-0x7f2627a08000   /usr/lib64/libtiff.so.5.2.6
        0x7f2627a08000-0x7f2627a0c000   /usr/lib64/libtiff.so.5.2.6
        0x7f2627a0c000-0x7f2627a0d000   /usr/lib64/libtiff.so.5.2.6
        0x7f2627a0d000-0x7f2627a3f000   /usr/lib64/libpng16.so.16.29.0
        0x7f2627a3f000-0x7f2627c3e000   /usr/lib64/libpng16.so.16.29.0
        0x7f2627c3e000-0x7f2627c3f000   /usr/lib64/libpng16.so.16.29.0
        0x7f2627c3f000-0x7f2627c40000   /usr/lib64/libpng16.so.16.29.0
        0x7f2627c40000-0x7f2627da7000   /usr/lib64/libopenjp2.so.2.2.0
        0x7f2627da7000-0x7f2627fa6000   /usr/lib64/libopenjp2.so.2.2.0
        0x7f2627fa6000-0x7f2627fa9000   /usr/lib64/libopenjp2.so.2.2.0
        0x7f2627fa9000-0x7f2627fb1000   /usr/lib64/libopenjp2.so.2.2.0
        0x7f2627fb1000-0x7f2627fd5000   /lib64/ld-2.23.so
        0x7f262804a000-0x7f26281c6000
        0x7f26281c6000-0x7f26281d4000
        0x7f26281d4000-0x7f26281d5000   /lib64/ld-2.23.so
        0x7f26281d5000-0x7f26281d6000   /lib64/ld-2.23.so
        0x7f26281d6000-0x7f26281d7000
        0x7ffeff1e8000-0x7ffeff209000   [stack]
        0x7ffeff28f000-0x7ffeff291000   [vdso]
        0x7ffeff291000-0x7ffeff293000   [vvar]
        0xffffffffff600000-0xffffffffff601000   [vsyscall]
==78690==End of process memory map.
==78690==AddressSanitizer CHECK failed: /var/tmp/portage/sys-libs/compiler-rt-sanitizers-4.0.1/work/compiler-rt-4.0.1.src/lib/sanitizer_common/sanitizer_common.cc:120 "((0 && "unable to mmap")) != (0)" (0x0, 0x0)
    #0 0x4db60f in AsanCheckFailed /var/tmp/portage/sys-libs/compiler-rt-sanitizers-4.0.1/work/compiler-rt-4.0.1.src/lib/asan/asan_rtl.cc:69
    #1 0x4f6375 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) /var/tmp/portage/sys-libs/compiler-rt-sanitizers-4.0.1/work/compiler-rt-4.0.1.src/lib/sanitizer_common/sanitizer_termination.cc:79
    #2 0x4e59a2 in __sanitizer::ReportMmapFailureAndDie(unsigned long, char const*, char const*, int, bool) /var/tmp/portage/sys-libs/compiler-rt-sanitizers-4.0.1/work/compiler-rt-4.0.1.src/lib/sanitizer_common/sanitizer_common.cc:120
    #3 0x4ef2a5 in __sanitizer::MmapOrDie(unsigned long, char const*, bool) /var/tmp/portage/sys-libs/compiler-rt-sanitizers-4.0.1/work/compiler-rt-4.0.1.src/lib/sanitizer_common/sanitizer_posix.cc:132
    #4 0x426caa in __sanitizer::LargeMmapAllocator<__asan::AsanMapUnmapCallback>::Allocate(__sanitizer::AllocatorStats*, unsigned long, unsigned long) /var/tmp/portage/sys-libs/compiler-rt-sanitizers-4.0.1/work/compiler-rt-4.0.1.src/lib/asan/../sanitizer_common/sanitizer_allocator_secondary.h:41
    #5 0x426caa in __sanitizer::CombinedAllocator<__sanitizer::SizeClassAllocator64<__asan::AP64>, __sanitizer::SizeClassAllocatorLocalCache<__sanitizer::SizeClassAllocator64<__asan::AP64> >, __sanitizer::LargeMmapAllocator<__asan::AsanMapUnmapCallback> >::Allocate(__sanitizer::SizeClassAllocatorLocalCache<__sanitizer::SizeClassAllocator64<__asan::AP64> >*, unsigned long, unsigned long, bool, bool) /var/tmp/portage/sys-libs/compiler-rt-sanitizers-4.0.1/work/compiler-rt-4.0.1.src/lib/asan/../sanitizer_common/sanitizer_allocator_combined.h:70
    #6 0x426caa in __asan::Allocator::Allocate(unsigned long, unsigned long, __sanitizer::BufferedStackTrace*, __asan::AllocType, bool) /var/tmp/portage/sys-libs/compiler-rt-sanitizers-4.0.1/work/compiler-rt-4.0.1.src/lib/asan/asan_allocator.cc:407
    #7 0x42138d in __asan::asan_posix_memalign(void**, unsigned long, unsigned long, __sanitizer::BufferedStackTrace*) /var/tmp/portage/sys-libs/compiler-rt-sanitizers-4.0.1/work/compiler-rt-4.0.1.src/lib/asan/asan_allocator.cc:815
    #8 0x4d206d in __interceptor_posix_memalign /var/tmp/portage/sys-libs/compiler-rt-sanitizers-4.0.1/work/compiler-rt-4.0.1.src/lib/asan/asan_malloc_linux.cc:144
    #9 0x7f2627d95aa4 in opj_aligned_alloc_n /var/tmp/portage/media-libs/openjpeg-2.2.0/work/openjpeg-2.2.0/src/lib/openjp2/opj_malloc.c:61:9
    #10 0x7f2627d95aa4 in opj_aligned_malloc /var/tmp/portage/media-libs/openjpeg-2.2.0/work/openjpeg-2.2.0/src/lib/openjp2/opj_malloc.c:209
    #11 0x7f2627c79d09 in opj_image_create /var/tmp/portage/media-libs/openjpeg-2.2.0/work/openjpeg-2.2.0/src/lib/openjp2/image.c:77:39
    #12 0x53437b in bmptoimage /var/tmp/portage/media-libs/openjpeg-2.2.0/work/openjpeg-2.2.0/src/bin/jp2/convertbmp.c:768:13
    #13 0x50b635 in main /var/tmp/portage/media-libs/openjpeg-2.2.0/work/openjpeg-2.2.0/src/bin/jp2/opj_compress.c:1844:21
    #14 0x7f2626681680 in __libc_start_main /var/tmp/portage/sys-libs/glibc-2.23-r4/work/glibc-2.23/csu/../csu/libc-start.c:289
    #15 0x41bc78 in _start (/usr/bin/opj_compress+0x41bc78)
```