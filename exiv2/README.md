### exiv2 0.26
- Bug type: uncontrolled-memory-allocation
- CVE ID: 
  - [CVE-2018-4868](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-4868)
- Download:
	```
	git clone https://github.com/Exiv2/exiv2
	git checkout fa449a4d2c58d63f0d75ff259f25683a98a44630
	```
- Reproduce: `exiv2 -pX @@`
- ASAN dumps the backtrace:

`CVE-2018-4868`
```
STRUCTURE OF JPEG2000 FILE: POC
 address |   length | box       | data
==31954==WARNING: AddressSanitizer failed to allocate 0xffffffffffffffff bytes
==31954==AddressSanitizer's allocator is terminating the process instead of returning 0
==31954==If you don't like this behavior set allocator_may_return_null=1
==31954==AddressSanitizer CHECK failed: /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:225 "((0)) != (0)" (0x0, 0x0)
    #0 0x4ff545 in __asan::AsanCheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_rtl.cc:69
    #1 0x51ce05 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_termination.cc:79
    #2 0x505946 in __sanitizer::ReportAllocatorCannotReturnNull() /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:225
    #3 0x505986 in __sanitizer::ReturnNullOrDieOnFailure::OnBadRequest() /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:241
    #4 0x43ba77 in __asan::asan_memalign(unsigned long, unsigned long, __sanitizer::BufferedStackTrace*, __asan::AllocType) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_allocator.cc:900
    #5 0x52eb4f in operator new[](unsigned long) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_new_delete.cc:95
    #6 0x5db1b4 in Exiv2::DataBuf::DataBuf(long) /home/exp/Documents/Mem_obj/exiv2/include/exiv2/types.hpp:204:46
    #7 0x7f5287c549bc in Exiv2::Jp2Image::printStructure(std::ostream&, Exiv2::PrintStructureOption, int) /home/exp/Documents/Mem_obj/exiv2/src/jp2image.cpp:496:37
    #8 0x58ccdd in Action::Print::printStructure(std::ostream&, Exiv2::PrintStructureOption) /home/exp/Documents/Mem_obj/exiv2/src/actions.cpp:276:16
    #9 0x57b418 in Action::Print::run(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) /home/exp/Documents/Mem_obj/exiv2/src/actions.cpp:256:23
    #10 0x5346f0 in main /home/exp/Documents/Mem_obj/exiv2/src/exiv2.cpp:170:25
    #11 0x7f52862a1b96 in __libc_start_main /build/glibc-OTsEL5/glibc-2.27/csu/../csu/libc-start.c:310
    #12 0x4364b9 in _start (/home/exp/Documents/Mem_obj/exiv2/build/bin/exiv2+0x4364b9)

```