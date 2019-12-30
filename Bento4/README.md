### Bento4 1.5.1-627
- Bug type: uncontrolled-memory-allocation, memory leak
- CVE ID: 
  - [CVE-2018-20186](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20186)
  - [CVE-2018-20659](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20659)
  - [CVE-2019-7698](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-7698)
  - [CVE-2019-6966](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6966)
  - the meory leak is very easy to find in CVE website, lots of memory leak
- Download:
  ```
  git clone https://github.com/axiomatic-systems/Bento4
  git checkout 590312125c833bc496faf815c583cfd053509d2c
  ```
- Reproduce: `mp42hls @@`
- ASAN dumps the backtrace:

`CVE-2018-20186`
```
==92387==ERROR: AddressSanitizer failed to allocate 0x80003000 (2147495936) bytes of LargeMmapAllocator (errno: 12)
==92387==Process memory map follows:
	0x000000400000-0x0000005aa000	/home/jas/Downloads/Bento4-SRC-1-5-1-627/cmakebuild/mp42hls
	0x0000007a9000-0x0000007aa000	/home/jas/Downloads/Bento4-SRC-1-5-1-627/cmakebuild/mp42hls
	0x0000007aa000-0x0000007b9000	/home/jas/Downloads/Bento4-SRC-1-5-1-627/cmakebuild/mp42hls
	0x0000007b9000-0x0000007ba000	
	0x00007fff7000-0x00008fff7000	
	0x00008fff7000-0x02008fff7000	
	0x02008fff7000-0x10007fff8000	
	0x600000000000-0x602000000000	
	0x602000000000-0x602000010000	
	0x602000010000-0x603000000000	
	0x603000000000-0x603000010000	
	0x603000010000-0x604000000000	
	0x604000000000-0x604000010000	
	0x604000010000-0x606000000000	
	0x606000000000-0x606000010000	
	0x606000010000-0x607000000000	
	0x607000000000-0x607000010000	
	0x607000010000-0x608000000000	
	0x608000000000-0x608000010000	
	0x608000010000-0x60b000000000	
	0x60b000000000-0x60b000010000	
	0x60b000010000-0x60c000000000	
	0x60c000000000-0x60c000010000	
	0x60c000010000-0x60d000000000	
	0x60d000000000-0x60d000010000	
	0x60d000010000-0x60e000000000	
	0x60e000000000-0x60e000010000	
	0x60e000010000-0x610000000000	
	0x610000000000-0x610000010000	
	0x610000010000-0x611000000000	
	0x611000000000-0x611000010000	
	0x611000010000-0x613000000000	
	0x613000000000-0x613000010000	
	0x613000010000-0x614000000000	
	0x614000000000-0x614000020000	
	0x614000020000-0x615000000000	
	0x615000000000-0x615000020000	
	0x615000020000-0x616000000000	
	0x616000000000-0x616000020000	
	0x616000020000-0x619000000000	
	0x619000000000-0x619000020000	
	0x619000020000-0x61c000000000	
	0x61c000000000-0x61c000020000	
	0x61c000020000-0x621000000000	
	0x621000000000-0x621000020000	
	0x621000020000-0x624000000000	
	0x624000000000-0x624000020000	
	0x624000020000-0x626000000000	
	0x626000000000-0x626000020000	
	0x626000020000-0x629000000000	
	0x629000000000-0x629000010000	
	0x629000010000-0x62d000000000	
	0x62d000000000-0x62d000020000	
	0x62d000020000-0x631000000000	
	0x631000000000-0x631000030000	
	0x631000030000-0x640000000000	
	0x640000000000-0x640000003000	
	0x7fe341500000-0x7fe341600000	
	0x7fe341700000-0x7fe341800000	
	0x7fe3418fe000-0x7fe343c50000	
	0x7fe343c50000-0x7fe343d58000	/lib/x86_64-linux-gnu/libm-2.23.so
	0x7fe343d58000-0x7fe343f57000	/lib/x86_64-linux-gnu/libm-2.23.so
	0x7fe343f57000-0x7fe343f58000	/lib/x86_64-linux-gnu/libm-2.23.so
	0x7fe343f58000-0x7fe343f59000	/lib/x86_64-linux-gnu/libm-2.23.so
	0x7fe343f59000-0x7fe343f5c000	/lib/x86_64-linux-gnu/libdl-2.23.so
	0x7fe343f5c000-0x7fe34415b000	/lib/x86_64-linux-gnu/libdl-2.23.so
	0x7fe34415b000-0x7fe34415c000	/lib/x86_64-linux-gnu/libdl-2.23.so
	0x7fe34415c000-0x7fe34415d000	/lib/x86_64-linux-gnu/libdl-2.23.so
	0x7fe34415d000-0x7fe344175000	/lib/x86_64-linux-gnu/libpthread-2.23.so
	0x7fe344175000-0x7fe344374000	/lib/x86_64-linux-gnu/libpthread-2.23.so
	0x7fe344374000-0x7fe344375000	/lib/x86_64-linux-gnu/libpthread-2.23.so
	0x7fe344375000-0x7fe344376000	/lib/x86_64-linux-gnu/libpthread-2.23.so
	0x7fe344376000-0x7fe34437a000	
	0x7fe34437a000-0x7fe34453a000	/lib/x86_64-linux-gnu/libc-2.23.so
	0x7fe34453a000-0x7fe34473a000	/lib/x86_64-linux-gnu/libc-2.23.so
	0x7fe34473a000-0x7fe34473e000	/lib/x86_64-linux-gnu/libc-2.23.so
	0x7fe34473e000-0x7fe344740000	/lib/x86_64-linux-gnu/libc-2.23.so
	0x7fe344740000-0x7fe344744000	
	0x7fe344744000-0x7fe34475a000	/lib/x86_64-linux-gnu/libgcc_s.so.1
	0x7fe34475a000-0x7fe344959000	/lib/x86_64-linux-gnu/libgcc_s.so.1
	0x7fe344959000-0x7fe34495a000	/lib/x86_64-linux-gnu/libgcc_s.so.1
	0x7fe34495a000-0x7fe344acc000	/usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.21
	0x7fe344acc000-0x7fe344ccc000	/usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.21
	0x7fe344ccc000-0x7fe344cd6000	/usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.21
	0x7fe344cd6000-0x7fe344cd8000	/usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.21
	0x7fe344cd8000-0x7fe344cdc000	
	0x7fe344cdc000-0x7fe344dd0000	/usr/lib/x86_64-linux-gnu/libasan.so.2.0.0
	0x7fe344dd0000-0x7fe344fd0000	/usr/lib/x86_64-linux-gnu/libasan.so.2.0.0
	0x7fe344fd0000-0x7fe344fd3000	/usr/lib/x86_64-linux-gnu/libasan.so.2.0.0
	0x7fe344fd3000-0x7fe344fd4000	/usr/lib/x86_64-linux-gnu/libasan.so.2.0.0
	0x7fe344fd4000-0x7fe345c49000	
	0x7fe345c49000-0x7fe345c6f000	/lib/x86_64-linux-gnu/ld-2.23.so
	0x7fe345d54000-0x7fe345e58000	
	0x7fe345e58000-0x7fe345e6e000	
	0x7fe345e6e000-0x7fe345e6f000	/lib/x86_64-linux-gnu/ld-2.23.so
	0x7fe345e6f000-0x7fe345e70000	/lib/x86_64-linux-gnu/ld-2.23.so
	0x7fe345e70000-0x7fe345e71000	
	0x7fffeaa6e000-0x7fffeaa8f000	[stack]
	0x7fffeaae9000-0x7fffeaaeb000	[vvar]
	0x7fffeaaeb000-0x7fffeaaed000	[vdso]
	0xffffffffff600000-0xffffffffff601000	[vsyscall]
==92387==End of process memory map.
==92387==AddressSanitizer CHECK failed: ../../../../src/libsanitizer/sanitizer_common/sanitizer_posix.cc:121 "(("unable to mmap" && 0)) != (0)" (0x0, 0x0)
    #0 0x7fe344d7c631  (/usr/lib/x86_64-linux-gnu/libasan.so.2+0xa0631)
    #1 0x7fe344d815e3 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) (/usr/lib/x86_64-linux-gnu/libasan.so.2+0xa55e3)
    #2 0x7fe344d89611  (/usr/lib/x86_64-linux-gnu/libasan.so.2+0xad611)
    #3 0x7fe344cfec0c  (/usr/lib/x86_64-linux-gnu/libasan.so.2+0x22c0c)
    #4 0x7fe344d7567e in operator new[](unsigned long) (/usr/lib/x86_64-linux-gnu/libasan.so.2+0x9967e)
    #5 0x4abb54 in AP4_DataBuffer::ReallocateBuffer(unsigned int) /home/jas/Downloads/Bento4-SRC-1-5-1-627/Source/C++/Core/Ap4DataBuffer.cpp:210
    #6 0x4abb54 in AP4_DataBuffer::SetDataSize(unsigned int) /home/jas/Downloads/Bento4-SRC-1-5-1-627/Source/C++/Core/Ap4DataBuffer.cpp:151
    #7 0x48ba72 in AP4_Sample::ReadData(AP4_DataBuffer&, unsigned int, unsigned int) /home/jas/Downloads/Bento4-SRC-1-5-1-627/Source/C++/Core/Ap4Sample.cpp:147
    #8 0x48ba72 in AP4_Sample::ReadData(AP4_DataBuffer&) /home/jas/Downloads/Bento4-SRC-1-5-1-627/Source/C++/Core/Ap4Sample.cpp:127
    #9 0x4449dd in ReadSample /home/jas/Downloads/Bento4-SRC-1-5-1-627/Source/C++/Apps/Mp42Hls/Mp42Hls.cpp:976
    #10 0x4485af in WriteSamples /home/jas/Downloads/Bento4-SRC-1-5-1-627/Source/C++/Apps/Mp42Hls/Mp42Hls.cpp:1251
    #11 0x4412a0 in main /home/jas/Downloads/Bento4-SRC-1-5-1-627/Source/C++/Apps/Mp42Hls/Mp42Hls.cpp:2088
    #12 0x7fe34439a82f in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x2082f)
    #13 0x4445b8 in _start (/home/jas/Downloads/Bento4-SRC-1-5-1-627/cmakebuild/mp42hls+0x4445b8)
```

`CVE-2018-20659`
```
==7565==WARNING: AddressSanitizer failed to allocate 0x10000000000 bytes
==7565==AddressSanitizer's allocator is terminating the process instead of returning 0
==7565==If you don't like this behavior set allocator_may_return_null=1
==7565==AddressSanitizer CHECK failed: /build/llvm-toolchain-4.0-euGZ6h/llvm-toolchain-4.0-4.0/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:221 "((0)) != (0)" (0x0, 0x0)
    #0 0x52701f in __asan::AsanCheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) (/home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/mp42hls+0x52701f)
    #1 0x541f95 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) (/home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/mp42hls+0x541f95)
    #2 0x52c632 in __sanitizer::ReportAllocatorCannotReturnNull(bool) (/home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/mp42hls+0x52c632)
    #3 0x46e784 in __asan::Allocator::Allocate(unsigned long, unsigned long, __sanitizer::BufferedStackTrace*, __asan::AllocType, bool) (/home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/mp42hls+0x46e784)
    #4 0x51ce64 in __interceptor_malloc (/home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/mp42hls+0x51ce64)
    #5 0x55ad06 in instr_MallocAndSize /home/wencheng/Documents/GitHub/MemFuzz/Code/llvm_mode/trace_function.c
    #6 0x608a2c in AP4_StcoAtom::AP4_StcoAtom(unsigned int, unsigned char, unsigned int, AP4_ByteStream&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4StcoAtom.cpp:81:17
    #7 0x608172 in AP4_StcoAtom::Create(unsigned int, AP4_ByteStream&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4StcoAtom.cpp:52:16
    #8 0x5b3e5b in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned int, unsigned int, unsigned long long, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:434:20
    #9 0x5aff64 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned long long&, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:221:14
    #10 0x5aa6b5 in AP4_ContainerAtom::ReadChildren(AP4_AtomFactory&, AP4_ByteStream&, unsigned long long) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4ContainerAtom.cpp:194:12
    #11 0x5c3e8f in AP4_SampleEntry::Read(AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4SampleEntry.cpp:115:9
    #12 0x5cc1a4 in AP4_VisualSampleEntry::AP4_VisualSampleEntry(unsigned int, unsigned int, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4SampleEntry.cpp:742:5
    #13 0x5cef21 in AP4_AvcSampleEntry::AP4_AvcSampleEntry(unsigned int, unsigned int, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4SampleEntry.cpp:994:5
    #14 0x5b18c0 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned int, unsigned int, unsigned long long, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:306:24
    #15 0x5aff64 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned long long&, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:221:14
    #16 0x74abd9 in AP4_StsdAtom::AP4_StsdAtom(unsigned int, unsigned char, unsigned int, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4StsdAtom.cpp:101:13
    #17 0x749bb8 in AP4_StsdAtom::Create(unsigned int, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4StsdAtom.cpp:57:16
    #18 0x5b3c67 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned int, unsigned int, unsigned long long, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:424:20
    #19 0x5aff64 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned long long&, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:221:14
    #20 0x5aa6b5 in AP4_ContainerAtom::ReadChildren(AP4_AtomFactory&, AP4_ByteStream&, unsigned long long) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4ContainerAtom.cpp:194:12
    #21 0x5aa269 in AP4_ContainerAtom::AP4_ContainerAtom(unsigned int, unsigned long long, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4ContainerAtom.cpp:139:5
    #22 0x5a94d9 in AP4_ContainerAtom::Create(unsigned int, unsigned long long, bool, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4ContainerAtom.cpp:88:20
    #23 0x5b7c51 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned int, unsigned int, unsigned long long, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:764:20
    #24 0x5aff64 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned long long&, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:221:14
    #25 0x5aa6b5 in AP4_ContainerAtom::ReadChildren(AP4_AtomFactory&, AP4_ByteStream&, unsigned long long) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4ContainerAtom.cpp:194:12
    #26 0x5aa269 in AP4_ContainerAtom::AP4_ContainerAtom(unsigned int, unsigned long long, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4ContainerAtom.cpp:139:5
    #27 0x5a94d9 in AP4_ContainerAtom::Create(unsigned int, unsigned long long, bool, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4ContainerAtom.cpp:88:20
    #28 0x5b7c51 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned int, unsigned int, unsigned long long, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:764:20
    #29 0x5aff64 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned long long&, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:221:14
    #30 0x5aa6b5 in AP4_ContainerAtom::ReadChildren(AP4_AtomFactory&, AP4_ByteStream&, unsigned long long) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4ContainerAtom.cpp:194:12
    #31 0x5aa269 in AP4_ContainerAtom::AP4_ContainerAtom(unsigned int, unsigned long long, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4ContainerAtom.cpp:139:5
    #32 0x5a94d9 in AP4_ContainerAtom::Create(unsigned int, unsigned long long, bool, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4ContainerAtom.cpp:88:20
    #33 0x5b7c51 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned int, unsigned int, unsigned long long, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:764:20
    #34 0x5aff64 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned long long&, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:221:14
    #35 0x5aa6b5 in AP4_ContainerAtom::ReadChildren(AP4_AtomFactory&, AP4_ByteStream&, unsigned long long) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4ContainerAtom.cpp:194:12
    #36 0x5aa269 in AP4_ContainerAtom::AP4_ContainerAtom(unsigned int, unsigned long long, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4ContainerAtom.cpp:139:5
    #37 0x6d53bb in AP4_TrakAtom::AP4_TrakAtom(unsigned int, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4TrakAtom.cpp:165:5
    #38 0x5ba0e0 in AP4_TrakAtom::Create(unsigned int, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4TrakAtom.h:58:20
    #39 0x5b3396 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned int, unsigned int, unsigned long long, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:379:20
    #40 0x5aff64 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned long long&, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:221:14
    #41 0x5aa6b5 in AP4_ContainerAtom::ReadChildren(AP4_AtomFactory&, AP4_ByteStream&, unsigned long long) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4ContainerAtom.cpp:194:12
    #42 0x5aa269 in AP4_ContainerAtom::AP4_ContainerAtom(unsigned int, unsigned long long, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4ContainerAtom.cpp:139:5
    #43 0x6f7038 in AP4_MoovAtom::AP4_MoovAtom(unsigned int, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4MoovAtom.cpp:79:5
    #44 0x5b9f80 in AP4_MoovAtom::Create(unsigned int, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4MoovAtom.h:56:20
    #45 0x5b2fa7 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned int, unsigned int, unsigned long long, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:359:20
    #46 0x5aff64 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned long long&, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:221:14
    #47 0x5aeedc in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, AP4_Atom*&) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4AtomFactory.cpp:151:12
    #48 0x77ebf3 in AP4_File::ParseStream(AP4_ByteStream&, AP4_AtomFactory&, bool) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4File.cpp:104:12
    #49 0x77f72a in AP4_File::AP4_File(AP4_ByteStream&, bool) /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Core/Ap4File.cpp:78:5
    #50 0x567704 in main /home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/Source/C++/Apps/Mp42Hls/Mp42Hls.cpp:1837:32
    #51 0x7febe5fe682f in __libc_start_main /build/glibc-LK5gWL/glibc-2.23/csu/../csu/libc-start.c:291
    #52 0x464808 in _start (/home/wencheng/Documents/OOM_Object/Bento4-1.5.1-627_Mem/mp42hls+0x464808)
```

`CVE-2019-7698` && `CVE-2019-6966`
```
==9673==ERROR: AddressSanitizer failed to allocate 0x6eff83000 (29795823616) bytes of LargeMmapAllocator (error code: 12)
==9673==Process memory map follows:
        0x000000400000-0x000000852000   /home/wencheng/Documents/Experiment/Bento4/Build/mp4dump
        0x000000a52000-0x000000a53000   /home/wencheng/Documents/Experiment/Bento4/Build/mp4dump
        0x000000a53000-0x000000a6c000   /home/wencheng/Documents/Experiment/Bento4/Build/mp4dump
        0x000000a6c000-0x00000176e000
        0x00007fff7000-0x00008fff7000
        0x00008fff7000-0x02008fff7000
        0x02008fff7000-0x10007fff8000
        0x600000000000-0x602000000000
        0x602000000000-0x602000010000
        0x602000010000-0x603000000000
        0x603000000000-0x603000010000
        0x603000010000-0x604000000000
        0x604000000000-0x604000010000
        0x604000010000-0x606000000000
        0x606000000000-0x606000010000
        0x606000010000-0x607000000000
        0x607000000000-0x607000010000
        0x607000010000-0x608000000000
        0x608000000000-0x608000010000
        0x608000010000-0x60b000000000
        0x60b000000000-0x60b000010000
        0x60b000010000-0x60c000000000
        0x60c000000000-0x60c000010000
        0x60c000010000-0x60d000000000
        0x60d000000000-0x60d000010000
        0x60d000010000-0x60e000000000
        0x60e000000000-0x60e000010000
        0x60e000010000-0x611000000000
        0x611000000000-0x611000010000
        0x611000010000-0x615000000000
        0x615000000000-0x615000020000
        0x615000020000-0x616000000000
        0x616000000000-0x616000020000
        0x616000020000-0x619000000000
        0x619000000000-0x619000020000
        0x619000020000-0x621000000000
        0x621000000000-0x621000020000
        0x621000020000-0x624000000000
        0x624000000000-0x624000020000
        0x624000020000-0x631000000000
        0x631000000000-0x631000030000
        0x631000030000-0x640000000000
        0x640000000000-0x640000003000
        0x7ff5abd25000-0x7ff5ae077000
        0x7ff5ae077000-0x7ff5ae237000   /lib/x86_64-linux-gnu/libc-2.23.so
        0x7ff5ae237000-0x7ff5ae437000   /lib/x86_64-linux-gnu/libc-2.23.so
        0x7ff5ae437000-0x7ff5ae43b000   /lib/x86_64-linux-gnu/libc-2.23.so
        0x7ff5ae43b000-0x7ff5ae43d000   /lib/x86_64-linux-gnu/libc-2.23.so
        0x7ff5ae43d000-0x7ff5ae441000
        0x7ff5ae441000-0x7ff5ae457000   /lib/x86_64-linux-gnu/libgcc_s.so.1
        0x7ff5ae457000-0x7ff5ae656000   /lib/x86_64-linux-gnu/libgcc_s.so.1
        0x7ff5ae656000-0x7ff5ae657000   /lib/x86_64-linux-gnu/libgcc_s.so.1
        0x7ff5ae657000-0x7ff5ae65a000   /lib/x86_64-linux-gnu/libdl-2.23.so
        0x7ff5ae65a000-0x7ff5ae859000   /lib/x86_64-linux-gnu/libdl-2.23.so
        0x7ff5ae859000-0x7ff5ae85a000   /lib/x86_64-linux-gnu/libdl-2.23.so
        0x7ff5ae85a000-0x7ff5ae85b000   /lib/x86_64-linux-gnu/libdl-2.23.so
        0x7ff5ae85b000-0x7ff5ae862000   /lib/x86_64-linux-gnu/librt-2.23.so
        0x7ff5ae862000-0x7ff5aea61000   /lib/x86_64-linux-gnu/librt-2.23.so
        0x7ff5aea61000-0x7ff5aea62000   /lib/x86_64-linux-gnu/librt-2.23.so
        0x7ff5aea62000-0x7ff5aea63000   /lib/x86_64-linux-gnu/librt-2.23.so
        0x7ff5aea63000-0x7ff5aea7b000   /lib/x86_64-linux-gnu/libpthread-2.23.so
        0x7ff5aea7b000-0x7ff5aec7a000   /lib/x86_64-linux-gnu/libpthread-2.23.so
        0x7ff5aec7a000-0x7ff5aec7b000   /lib/x86_64-linux-gnu/libpthread-2.23.so
        0x7ff5aec7b000-0x7ff5aec7c000   /lib/x86_64-linux-gnu/libpthread-2.23.so
        0x7ff5aec7c000-0x7ff5aec80000
        0x7ff5aec80000-0x7ff5aed88000   /lib/x86_64-linux-gnu/libm-2.23.so
        0x7ff5aed88000-0x7ff5aef87000   /lib/x86_64-linux-gnu/libm-2.23.so
        0x7ff5aef87000-0x7ff5aef88000   /lib/x86_64-linux-gnu/libm-2.23.so
        0x7ff5aef88000-0x7ff5aef89000   /lib/x86_64-linux-gnu/libm-2.23.so
        0x7ff5aef89000-0x7ff5af0fb000   /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.21
        0x7ff5af0fb000-0x7ff5af2fb000   /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.21
        0x7ff5af2fb000-0x7ff5af305000   /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.21
        0x7ff5af305000-0x7ff5af307000   /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.21
        0x7ff5af307000-0x7ff5af30b000
        0x7ff5af30b000-0x7ff5af331000   /lib/x86_64-linux-gnu/ld-2.23.so
        0x7ff5af4bf000-0x7ff5af507000
        0x7ff5af507000-0x7ff5af530000
        0x7ff5af530000-0x7ff5af531000   /lib/x86_64-linux-gnu/ld-2.23.so
        0x7ff5af531000-0x7ff5af532000   /lib/x86_64-linux-gnu/ld-2.23.so
        0x7ff5af532000-0x7ff5af533000
        0x7fff7f5cf000-0x7fff7f5f0000   [stack]
        0x7fff7f5fa000-0x7fff7f5fd000   [vvar]
        0x7fff7f5fd000-0x7fff7f5ff000   [vdso]
        0xffffffffff600000-0xffffffffff601000   [vsyscall]
==9673==End of process memory map.
==9673==AddressSanitizer CHECK failed: /build/llvm-toolchain-3.8-_PD09B/llvm-toolchain-3.8-3.8/projects/compiler-rt/lib/sanitizer_common/sanitizer_common.cc:183 "((0 && "unable to mmap")) != (0)" (0x0, 0x0)
    #0 0x50989d in __asan::AsanCheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) (/home/wencheng/Documents/Experiment/Bento4/Build/mp4dump+0x50989d)
    #1 0x5104c3 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) (/home/wencheng/Documents/Experiment/Bento4/Build/mp4dump+0x5104c3)
    #2 0x5106b1 in __sanitizer::ReportMmapFailureAndDie(unsigned long, char const*, char const*, int, bool) (/home/wencheng/Documents/Experiment/Bento4/Build/mp4dump+0x5106b1)
    #3 0x519622 in __sanitizer::MmapOrDie(unsigned long, char const*, bool) (/home/wencheng/Documents/Experiment/Bento4/Build/mp4dump+0x519622)
    #4 0x46741c in __asan::asan_memalign(unsigned long, unsigned long, __sanitizer::BufferedStackTrace*, __asan::AllocType) (/home/wencheng/Documents/Experiment/Bento4/Build/mp4dump+0x46741c)
    #5 0x531838 in operator new(unsigned long) (/home/wencheng/Documents/Experiment/Bento4/Build/mp4dump+0x531838)
    #6 0x6b6a4e in AP4_Array<AP4_CttsTableEntry>::EnsureCapacity(unsigned int) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4Array.h:172:25
    #7 0x6b5768 in AP4_Array<AP4_CttsTableEntry>::SetItemCount(unsigned int) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4Array.h:210:25
    #8 0x6b3771 in AP4_CttsAtom::AP4_CttsAtom(unsigned int, unsigned char, unsigned int, AP4_ByteStream&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4CttsAtom.cpp:79:5
    #9 0x6b2fd2 in AP4_CttsAtom::Create(unsigned int, AP4_ByteStream&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4CttsAtom.cpp:52:16
    #10 0x5669ad in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned int, unsigned int, unsigned long long, AP4_Atom*&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4AtomFactory.cpp:459:20
    #11 0x56266e in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned long long&, AP4_Atom*&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4AtomFactory.cpp:221:14
    #12 0x55cf1f in AP4_ContainerAtom::ReadChildren(AP4_AtomFactory&, AP4_ByteStream&, unsigned long long) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4ContainerAtom.cpp:194:12
    #13 0x55cad9 in AP4_ContainerAtom::AP4_ContainerAtom(unsigned int, unsigned long long, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4ContainerAtom.cpp:139:5
    #14 0x55bddb in AP4_ContainerAtom::Create(unsigned int, unsigned long long, bool, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4ContainerAtom.cpp:88:20
    #15 0x56a2c1 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned int, unsigned int, unsigned long long, AP4_Atom*&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4AtomFactory.cpp:764:20
    #16 0x56266e in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned long long&, AP4_Atom*&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4AtomFactory.cpp:221:14
    #17 0x55cf1f in AP4_ContainerAtom::ReadChildren(AP4_AtomFactory&, AP4_ByteStream&, unsigned long long) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4ContainerAtom.cpp:194:12
    #18 0x55cad9 in AP4_ContainerAtom::AP4_ContainerAtom(unsigned int, unsigned long long, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4ContainerAtom.cpp:139:5
    #19 0x55bddb in AP4_ContainerAtom::Create(unsigned int, unsigned long long, bool, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4ContainerAtom.cpp:88:20
    #20 0x56a2c1 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned int, unsigned int, unsigned long long, AP4_Atom*&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4AtomFactory.cpp:764:20
    #21 0x56266e in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned long long&, AP4_Atom*&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4AtomFactory.cpp:221:14
    #22 0x55cf1f in AP4_ContainerAtom::ReadChildren(AP4_AtomFactory&, AP4_ByteStream&, unsigned long long) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4ContainerAtom.cpp:194:12
    #23 0x55cad9 in AP4_ContainerAtom::AP4_ContainerAtom(unsigned int, unsigned long long, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4ContainerAtom.cpp:139:5
    #24 0x55bddb in AP4_ContainerAtom::Create(unsigned int, unsigned long long, bool, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4ContainerAtom.cpp:88:20
    #25 0x56a2c1 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned int, unsigned int, unsigned long long, AP4_Atom*&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4AtomFactory.cpp:764:20
    #26 0x56266e in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned long long&, AP4_Atom*&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4AtomFactory.cpp:221:14
    #27 0x55cf1f in AP4_ContainerAtom::ReadChildren(AP4_AtomFactory&, AP4_ByteStream&, unsigned long long) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4ContainerAtom.cpp:194:12
    #28 0x55cad9 in AP4_ContainerAtom::AP4_ContainerAtom(unsigned int, unsigned long long, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4ContainerAtom.cpp:139:5
    #29 0x677a2b in AP4_TrakAtom::AP4_TrakAtom(unsigned int, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4TrakAtom.cpp:165:5
    #30 0x56c6e0 in AP4_TrakAtom::Create(unsigned int, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4TrakAtom.h:58:20
    #31 0x565a06 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned int, unsigned int, unsigned long long, AP4_Atom*&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4AtomFactory.cpp:379:20
    #32 0x56266e in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned long long&, AP4_Atom*&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4AtomFactory.cpp:221:14
    #33 0x55cf1f in AP4_ContainerAtom::ReadChildren(AP4_AtomFactory&, AP4_ByteStream&, unsigned long long) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4ContainerAtom.cpp:194:12
    #34 0x55cad9 in AP4_ContainerAtom::AP4_ContainerAtom(unsigned int, unsigned long long, bool, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4ContainerAtom.cpp:139:5
    #35 0x6996dd in AP4_MoovAtom::AP4_MoovAtom(unsigned int, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4MoovAtom.cpp:79:5
    #36 0x56c580 in AP4_MoovAtom::Create(unsigned int, AP4_ByteStream&, AP4_AtomFactory&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4MoovAtom.h:56:20
    #37 0x565617 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned int, unsigned int, unsigned long long, AP4_Atom*&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4AtomFactory.cpp:359:20
    #38 0x56266e in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, unsigned long long&, AP4_Atom*&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4AtomFactory.cpp:221:14
    #39 0x5615f7 in AP4_AtomFactory::CreateAtomFromStream(AP4_ByteStream&, AP4_Atom*&) /home/wencheng/Documents/Experiment/Bento4/Source/C++/Core/Ap4AtomFactory.cpp:151:12
    #40 0x5383ad in main /home/wencheng/Documents/Experiment/Bento4/Source/C++/Apps/Mp4Dump/Mp4Dump.cpp:342:12
    #41 0x7ff5ae09782f in __libc_start_main /build/glibc-Cl5G7W/glibc-2.23/csu/../csu/libc-start.c:291
    #42 0x460168 in _start (/home/wencheng/Documents/Experiment/Bento4/Build/mp4dump+0x460168)

Aborted
```