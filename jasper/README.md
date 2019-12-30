### jasper 2.0.14
- Bug type: uncontrolled-memory-allocation, memory leak
- CVE ID: 
  - [CVE-2016-8886](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-7581)
  - [issue#207](https://github.com/libming/libming/issues/207)
  - the meory leak is very easy to find in CVE website, lots of memory leak
- Download:
  ```
  git clone https://github.com/mdadams/jasper
  git checkout 1a36ca39da535af2e67848f5f43ffd657746e632
  ```
- Reproduce: `jasper --input @@ --output test.bmp --output-format bmp`
- ASAN dumps the backtrace:

`CVE-2016-8886`
```
THE BMP FORMAT IS NOT FULLY SUPPORTED!
THAT IS, THE JASPER SOFTWARE CANNOT DECODE ALL TYPES OF BMP DATA.
IF YOU HAVE ANY PROBLEMS, PLEASE TRY CONVERTING YOUR IMAGE DATA
TO THE PNM FORMAT, AND USING THIS FORMAT INSTEAD.
==18448==AddressSanitizer's allocator is terminating the process instead of returning 0
==18448==If you don't like this behavior set allocator_may_return_null=1
==18448==AddressSanitizer CHECK failed: /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:225 "((0)) != (0)" (0x0, 0x0)
    #0 0x4ede5f in __asan::AsanCheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_rtl.cc:69
    #1 0x50add5 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_termination.cc:79
    #2 0x4f3c86 in __sanitizer::ReportAllocatorCannotReturnNull() /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:225
    #3 0x4f3cea in __sanitizer::ReturnNullOrDieOnFailure::OnOOM() /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:248
    #4 0x42b6d7 in __sanitizer::LargeMmapAllocator<__asan::AsanMapUnmapCallback, __sanitizer::ReturnNullOrDieOnFailure>::Allocate(__sanitizer::AllocatorStats*, unsigned long, unsigned long) /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/asan/../sanitizer_common/sanitizer_allocator_secondary.h:46
    #5 0x42b6d7 in __sanitizer::CombinedAllocator<__sanitizer::SizeClassAllocator64<__asan::AP64>, __sanitizer::SizeClassAllocatorLocalCache<__sanitizer::SizeClassAllocator64<__asan::AP64> >, __sanitizer::LargeMmapAllocator<__asan::AsanMapUnmapCallback, __sanitizer::ReturnNullOrDieOnFailure> >::Allocate(__sanitizer::SizeClassAllocatorLocalCache<__sanitizer::SizeClassAllocator64<__asan::AP64> >*, unsigned long, unsigned long) /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/asan/../sanitizer_common/sanitizer_allocator_combined.h:64
    #6 0x42b6d7 in __asan::Allocator::Allocate(unsigned long, unsigned long, __sanitizer::BufferedStackTrace*, __asan::AllocType, bool) /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_allocator.cc:443
    #7 0x424d96 in __asan::asan_malloc(unsigned long, __sanitizer::BufferedStackTrace*) /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_allocator.cc:856
    #8 0x4e4944 in malloc /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_malloc_linux.cc:89
    #9 0x56d523 in jas_malloc /home/hjwang/Mem_Obj/jasper-version-2.0.14/src/libjasper/base/jas_malloc.c:241:11
    #10 0x56db1d in jas_alloc2 /home/hjwang/Mem_Obj/jasper-version-2.0.14/src/libjasper/base/jas_malloc.c:274:9
    #11 0x58ad83 in bmp_getinfo /home/hjwang/Mem_Obj/jasper-version-2.0.14/src/libjasper/bmp/bmp_dec.c:399:25
    #12 0x587b68 in bmp_decode /home/hjwang/Mem_Obj/jasper-version-2.0.14/src/libjasper/bmp/bmp_dec.c:187:15
    #13 0x557149 in jas_image_decode /home/hjwang/Mem_Obj/jasper-version-2.0.14/src/libjasper/base/jas_image.c:442:16
    #14 0x51db00 in main /home/hjwang/Mem_Obj/jasper-version-2.0.14/src/appl/jasper.c:236:16
    #15 0x7ff32ff5982f in __libc_start_main /build/glibc-LK5gWL/glibc-2.23/csu/../csu/libc-start.c:291
    #16 0x420738 in _start (/home/hjwang/Mem_Obj/jasper/build/bin/jasper+0x420738)
```

`issue#207`
```
==23746==WARNING: AddressSanitizer failed to allocate 0xffffffffffff0004 bytes
==23746==AddressSanitizer's allocator is terminating the process instead of returning 0
==23746==If you don't like this behavior set allocator_may_return_null=1
==23746==AddressSanitizer CHECK failed: /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:225 "((0)) != (0)" (0x0, 0x0)
    #0 0x4ede5f in __asan::AsanCheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_rtl.cc:69
    #1 0x50add5 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_termination.cc:79
    #2 0x4f3c86 in __sanitizer::ReportAllocatorCannotReturnNull() /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:225
    #3 0x4f3cc3 in __sanitizer::ReturnNullOrDieOnFailure::OnBadRequest() /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:241
    #4 0x424d96 in __asan::asan_malloc(unsigned long, __sanitizer::BufferedStackTrace*) /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_allocator.cc:856
    #5 0x4e4944 in malloc /home/hjwang/Tools/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_malloc_linux.cc:89
    #6 0x56d523 in jas_malloc /home/hjwang/Mem_Obj/jasper-version-2.0.14/src/libjasper/base/jas_malloc.c:241:11
    #7 0x56db1d in jas_alloc2 /home/hjwang/Mem_Obj/jasper-version-2.0.14/src/libjasper/base/jas_malloc.c:274:9
    #8 0x6f8483 in jp2_colr_getdata /home/hjwang/Mem_Obj/jasper-version-2.0.14/src/libjasper/jp2/jp2_cod.c:440:22
    #9 0x6fd2f2 in jp2_box_get /home/hjwang/Mem_Obj/jasper-version-2.0.14/src/libjasper/jp2/jp2_cod.c:312:8
    #10 0x59c25f in jp2_decode /home/hjwang/Mem_Obj/jasper-version-2.0.14/src/libjasper/jp2/jp2_dec.c:159:16
    #11 0x557149 in jas_image_decode /home/hjwang/Mem_Obj/jasper-version-2.0.14/src/libjasper/base/jas_image.c:442:16
    #12 0x51db00 in main /home/hjwang/Mem_Obj/jasper-version-2.0.14/src/appl/jasper.c:236:16
    #13 0x7faa193de82f in __libc_start_main /build/glibc-LK5gWL/glibc-2.23/csu/../csu/libc-start.c:291
    #14 0x420738 in _start (/home/hjwang/Mem_Obj/jasper/build/bin/jasper+0x420738)
```
