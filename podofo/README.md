### podofo 0.9.5
- Bug type: uncontrolled-memory-allocation
- CVE ID: 
  - [CVE-2019-10723](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10723)
  - [CVE-2018-20797](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20797)
  - [CVE-2018-5783](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-5783)
  - [CVE-2018-5296](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-5296)
- Download:
  - [https://sourceforge.net/projects/podofo/files/podofo/0.9.5/](https://sourceforge.net/projects/podofo/files/podofo/0.9.5/)
- Reproduce: `podofoimgextract @@ ./out`
- ASAN dumps the backtrace:

`CVE-2019-10723`

```
<</Info 10 0 R/Root 1 0 R/Size 11>>
terminate called after throwing an instance of 'std::length_error'
  what():  deque::_M_new_elements_at_back
[1]    1096 abort      ../build/bin/podofoimgextract CVE-2019-10723 ./out
```
```
43 PdfPagesTreeCache::PdfPagesTreeCache( int nInitialSize )
44 {
45  m_deqPageObjs.resize( nInitialSize );
46 }
The poc can make nInitialSize equals to 0xffffffff, which make resize operation fails.
The debug process using gdb are shown below. 
execution command ./podofocrop poc out.pdf

gef➤Continuing.
Breakpoint 3, PoDoFo::PdfPagesTreeCache::PdfPagesTreeCache (this=0xa8e5b0, nInitialSize=0xffffffff) at /home/lt/vuln-fuzz/program/podofo-r1974/src/doc/PdfPagesTreeCache.cpp:45
45          m_deqPageObjs.resize( nInitialSize );
[ Legend: Modified register | Code | Heap | Stack | String ]
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── registers ────
$rax   : 0x0000000000a8e890  →  0x00007ffff69b3e38  →  0x00007ffff69b3e28  →  0x00007ffff69b3e18  →  0x00007ffff69b3e08  →  0x00007ffff69b3df8  →  0x00007ffff69b3de8  →  0x00007ffff69b3dd8
$rbx   : 0x0000000000a8e5b0  →  0x000000000082baf0  →  0x00000000005e0ca0  →  <PoDoFo::PdfPagesTreeCache::~PdfPagesTreeCache()+0> lea rsp, [rsp-0x98]
$rcx   : 0x0000000000a8ea90  →  0x0000000000000000
$rdx   : 0x0000000000a8e890  →  0x00007ffff69b3e38  →  0x00007ffff69b3e28  →  0x00007ffff69b3e18  →  0x00007ffff69b3e08  →  0x00007ffff69b3df8  →  0x00007ffff69b3de8  →  0x00007ffff69b3dd8
$rsp   : 0x00007fffffffdf70  →  0x0000000000a870b0  →  0x000000000082ae20  →  0x0000000000563b70  →  <PoDoFo::PdfInfo::~PdfInfo()+0> lea rsp, [rsp-0x98]
$rbp   : 0x0000000000a8df18  →  0x0000000000000000
$rsi   : 0x2000
$rdi   : 0xc0
$rip   : 0x00000000005e2c1f  →  <PoDoFo::PdfPagesTreeCache::PdfPagesTreeCache(int)+223> movsxd rdx, r12d
$r8    : 0x00007ffff69b3e38  →  0x00007ffff69b3e28  →  0x00007ffff69b3e18  →  0x00007ffff69b3e08  →  0x00007ffff69b3df8  →  0x00007ffff69b3de8  →  0x00007ffff69b3dd8  →  0x00007ffff69b3dc8
$r9    : 0x0
$r10   : 0x00007fffffffdf10  →  0x0000000000000200
$r11   : 0x00007ffff6783f90  →  0xfffda370fffda09f
$r12   : 0xffffffff
$r13   : 0x0000000000a870b0  →  0x000000000082ae20  →  0x0000000000563b70  →  <PoDoFo::PdfInfo::~PdfInfo()+0> lea rsp, [rsp-0x98]
$r14   : 0x0000000000a8af60  →  0x000000000082f2c8  →  0x0000000000695190  →  <PoDoFo::PdfParserObject::~PdfParserObject()+0> lea rsp, [rsp-0x98]
$r15   : 0x0000000000a8d6b0  →  0x000000000082f2c8  →  0x0000000000695190  →  <PoDoFo::PdfParserObject::~PdfParserObject()+0> lea rsp, [rsp-0x98]
$eflags: [carry PARITY adjust zero sign trap INTERRUPT direction overflow resume virtualx86 identification]
$cs: 0x0033 $ss: 0x002b $ds: 0x0000 $es: 0x0000 $fs: 0x0000 $gs: 0x0000
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── stack ────
0x00007fffffffdf70│+0x0000: 0x0000000000a870b0  →  0x000000000082ae20  →  0x0000000000563b70  →  <PoDoFo::PdfInfo::~PdfInfo()+0> lea rsp, [rsp-0x98]       ← $rsp
0x00007fffffffdf78│+0x0008: 0x0000000000a8af60  →  0x000000000082f2c8  →  0x0000000000695190  →  <PoDoFo::PdfParserObject::~PdfParserObject()+0> lea rsp, [rsp-0x98]
0x00007fffffffdf80│+0x0010: 0x0000000000a8d6b0  →  0x000000000082f2c8  →  0x0000000000695190  →  <PoDoFo::PdfParserObject::~PdfParserObject()+0> lea rsp, [rsp-0x98]
0x00007fffffffdf88│+0x0018: 0x00000000004446ad  →  <PoDoFo::PdfDictionary::GetKey(PoDoFo::PdfName+0> cmp rax, rbx
0x00007fffffffdf90│+0x0020: 0x0000000000a8b630  →  0x000000000082f2c8  →  0x0000000000695190  →  <PoDoFo::PdfParserObject::~PdfParserObject()+0> lea rsp, [rsp-0x98]
0x00007fffffffdf98│+0x0028: 0x000000000047c530  →  <PoDoFo::PdfObject::GetIndirectKey(PoDoFo::PdfName+0> cmp BYTE PTR [rax+0x13], 0x0
0x00007fffffffdfa0│+0x0030: 0x0000007365676150 ("Pages"?)
0x00007fffffffdfa8│+0x0038: 0x0000000000000000
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── code:x86:64 ────
     0x5e2c10 <PoDoFo::PdfPagesTreeCache::PdfPagesTreeCache(int)+208> add    rbp, rax
     0x5e2c13 <PoDoFo::PdfPagesTreeCache::PdfPagesTreeCache(int)+211> call   0x433bd0 <_Znwm@plt>
     0x5e2c18 <PoDoFo::PdfPagesTreeCache::PdfPagesTreeCache(int)+216> lea    rcx, [rax+0x200]
 →   0x5e2c1f <PoDoFo::PdfPagesTreeCache::PdfPagesTreeCache(int)+223> movsxd rdx, r12d
     0x5e2c22 <PoDoFo::PdfPagesTreeCache::PdfPagesTreeCache(int)+226> mov    QWORD PTR [rbp+0x0], rax
     0x5e2c26 <PoDoFo::PdfPagesTreeCache::PdfPagesTreeCache(int)+230> test   rdx, rdx
     0x5e2c29 <PoDoFo::PdfPagesTreeCache::PdfPagesTreeCache(int)+233> mov    QWORD PTR [rbx+0x30], rbp
     0x5e2c2d <PoDoFo::PdfPagesTreeCache::PdfPagesTreeCache(int)+237> mov    QWORD PTR [rbx+0x20], rax
     0x5e2c31 <PoDoFo::PdfPagesTreeCache::PdfPagesTreeCache(int)+241> mov    QWORD PTR [rbx+0x28], rcx
────────────────────────────────────────────────────────────────────────────────────────────────────────── source:/home/lt/vuln-f[...].cpp+45 ────
     40
     41  namespace PoDoFo {
     42
     43  PdfPagesTreeCache::PdfPagesTreeCache( int nInitialSize )
     44  {
             // nInitialSize=-0x1
 →   45      m_deqPageObjs.resize( nInitialSize );
     46  }
     47
     48  PdfPagesTreeCache::~PdfPagesTreeCache()
     49  {
     50      this->ClearCache();
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── threads ────
[#0] Id 1, Name: "podofocrop", stopped, reason: BREAKPOINT
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── trace ────
[#0] 0x5e2c1f → PoDoFo::PdfPagesTreeCache::PdfPagesTreeCache(this=0xa8e5b0, nInitialSize=0xffffffff)
[#1] 0x5ccd08 → PoDoFo::PdfPagesTree::PdfPagesTree(this=0xa8e5a0, pPagesRoot=<optimized out>)
[#2] 0x4dd5e4 → PoDoFo::PdfDocument::InitPagesTree(this=0x7fffffffe290)
[#3] 0x56f1b7 → PoDoFo::PdfMemDocument::InitFromParser(this=0x7fffffffe290, pParser=0xa87e50)
[#4] 0x57031a → PoDoFo::PdfMemDocument::Load(this=0x7fffffffe290, pszFilename=0x7fffffffe7a8 "output/crashes/id:000000,sig:06,src:000096,op:ext_UO,pos:181", bForUpdate=0x0)
[#5] 0x43587a → main(argc=<optimized out>, argv=0x7fffffffe538)
──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
gef➤  p nInitialSize
$4 = 0xffffffff
gef➤
```

`CVE-2018-20797`
```
==1145==WARNING: AddressSanitizer failed to allocate 0xfffffffffffffff2 bytes
==1145==AddressSanitizer's allocator is terminating the process instead of returning 0
==1145==If you don't like this behavior set allocator_may_return_null=1
==1145==AddressSanitizer CHECK failed: /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:225 "((0)) != (0)" (0x0, 0x0)
    #0 0x59c945 in __asan::AsanCheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_rtl.cc:69
    #1 0x5ba205 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_termination.cc:79
    #2 0x5a2d46 in __sanitizer::ReportAllocatorCannotReturnNull() /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:225
    #3 0x5a2d86 in __sanitizer::ReturnNullOrDieOnFailure::OnBadRequest() /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:241
    #4 0x4d8c99 in __asan::Allocator::Calloc(unsigned long, unsigned long, __sanitizer::BufferedStackTrace*) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_allocator.cc:665
    #5 0x4d8c99 in __asan::asan_calloc(unsigned long, unsigned long, __sanitizer::BufferedStackTrace*) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_allocator.cc:860
    #6 0x5939f2 in calloc /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_malloc_linux.cc:98
    #7 0x60fcd9 in PoDoFo::podofo_calloc(unsigned long, unsigned long) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfMemoryManagement.cpp:136:9
    #8 0x739758 in PoDoFo::PdfPredictorDecoder::PdfPredictorDecoder(PoDoFo::PdfDictionary const*) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfFiltersPrivate.cpp:112:38
    #9 0x72e1aa in PoDoFo::PdfFlateFilter::BeginDecodeImpl(PoDoFo::PdfDictionary const*) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfFiltersPrivate.cpp:557:39
    #10 0x72359a in PoDoFo::PdfFilter::BeginDecode(PoDoFo::PdfOutputStream*, PoDoFo::PdfDictionary const*) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfFilter.h:380:3
    #11 0x725cdc in PoDoFo::PdfFilteredDecodeStream::PdfFilteredDecodeStream(PoDoFo::PdfOutputStream*, PoDoFo::EPdfFilter, bool, PoDoFo::PdfDictionary const*) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfFilter.cpp:169:19
    #12 0x71eca3 in PoDoFo::PdfFilterFactory::CreateDecodeStream(std::vector<PoDoFo::EPdfFilter, std::allocator<PoDoFo::EPdfFilter> > const&, PoDoFo::PdfOutputStream*, PoDoFo::PdfDictionary const*) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfFilter.cpp:351:44
    #13 0x6319f6 in PoDoFo::PdfStream::GetFilteredCopy(char**, long*) const /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfStream.cpp:96:55
    #14 0x7fb785 in PoDoFo::PdfXRefStreamParserObject::ParseStream(long const*, std::vector<long, std::allocator<long> > const&) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfXRefStreamParserObject.cpp:127:24
    #15 0x7fa035 in PoDoFo::PdfXRefStreamParserObject::ReadXRefTable() /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfXRefStreamParserObject.cpp:118:5
    #16 0x7690e6 in PoDoFo::PdfParser::ReadXRefStreamContents(long, bool) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfParser.cpp:858:16
    #17 0x75efa9 in PoDoFo::PdfParser::ReadXRefContents(long, bool) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfParser.cpp:682:13
    #18 0x759937 in PoDoFo::PdfParser::ReadDocumentStructure() /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfParser.cpp:337:9
    #19 0x756a92 in PoDoFo::PdfParser::ParseFile(PoDoFo::PdfRefCountedInputDevice const&, bool) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfParser.cpp:220:9
    #20 0x755133 in PoDoFo::PdfParser::ParseFile(char const*, bool) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfParser.cpp:164:11
    #21 0x6ab69c in PoDoFo::PdfMemDocument::Load(char const*, bool) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/doc/PdfMemDocument.cpp:256:16
    #22 0x6aaed0 in PoDoFo::PdfMemDocument::PdfMemDocument(char const*, bool) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/doc/PdfMemDocument.cpp:102:11
    #23 0x5d1120 in ImageExtractor::Init(char const*, char const*, int*) /home/exp/Documents/Mem_obj/podofo-0.9.5/tools/podofoimgextract/ImageExtractor.cpp:51:20
    #24 0x5d71b4 in main /home/exp/Documents/Mem_obj/podofo-0.9.5/tools/podofoimgextract/podofoimgextract.cpp:54:17
    #25 0x7fee3de78b96 in __libc_start_main /build/glibc-OTsEL5/glibc-2.27/csu/../csu/libc-start.c:310
    #26 0x4d38b9 in _start (/home/exp/Documents/Mem_obj/podofo-0.9.5/build/bin/podofoimgextract+0x4d38b9)
```


`CVE-2018-5783`
```
terminate called after throwing an instance of 'std::length_error'
  what():  vector::reserve
[1]    1568 abort      ../build/bin/podofoimgextract CVE-2018-5783 ./out
```
```
(gdb) l
494	// -----------------------------------------------------
495	// 
496	// -----------------------------------------------------
497	inline void PdfVecObjects::Reserve( size_t size )
498	{
499	    m_vector.reserve( size );
500	}
501	
502	// -----------------------------------------------------
503	// 
(gdb) p size
$1 = 18446744073709551608
```

`CVE-2018-5296`
```
WARNING: There are more objects (9560000000000) in this XRef table than specified in the size key of the trailer directory (95)!
==1622==WARNING: AddressSanitizer failed to allocate 0xd0aca9b28000 bytes
==1622==AddressSanitizer's allocator is terminating the process instead of returning 0
==1622==If you don't like this behavior set allocator_may_return_null=1
==1622==AddressSanitizer CHECK failed: /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:225 "((0)) != (0)" (0x0, 0x0)
    #0 0x59c945 in __asan::AsanCheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_rtl.cc:69
    #1 0x5ba205 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_termination.cc:79
    #2 0x5a2d46 in __sanitizer::ReportAllocatorCannotReturnNull() /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:225
    #3 0x5a2d86 in __sanitizer::ReturnNullOrDieOnFailure::OnBadRequest() /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/sanitizer_common/sanitizer_allocator.cc:241
    #4 0x4d8e77 in __asan::asan_memalign(unsigned long, unsigned long, __sanitizer::BufferedStackTrace*, __asan::AllocType) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_allocator.cc:900
    #5 0x5cbd8f in operator new(unsigned long) /home/exp/Documents/llvm-6.0.1/projects/compiler-rt/lib/asan/asan_new_delete.cc:92
    #6 0x77b13d in __gnu_cxx::new_allocator<PoDoFo::PdfParser::TXRefEntry>::allocate(unsigned long, void const*) /usr/lib/gcc/x86_64-linux-gnu/7.4.0/../../../../include/c++/7.4.0/ext/new_allocator.h:111:27
    #7 0x77b02e in std::allocator_traits<std::allocator<PoDoFo::PdfParser::TXRefEntry> >::allocate(std::allocator<PoDoFo::PdfParser::TXRefEntry>&, unsigned long) /usr/lib/gcc/x86_64-linux-gnu/7.4.0/../../../../include/c++/7.4.0/bits/alloc_traits.h:436:20
    #8 0x77a4ef in std::_Vector_base<PoDoFo::PdfParser::TXRefEntry, std::allocator<PoDoFo::PdfParser::TXRefEntry> >::_M_allocate(unsigned long) /usr/lib/gcc/x86_64-linux-gnu/7.4.0/../../../../include/c++/7.4.0/bits/stl_vector.h:172:20
    #9 0x77980a in std::vector<PoDoFo::PdfParser::TXRefEntry, std::allocator<PoDoFo::PdfParser::TXRefEntry> >::_M_default_append(unsigned long) /usr/lib/gcc/x86_64-linux-gnu/7.4.0/../../../../include/c++/7.4.0/bits/vector.tcc:571:34
    #10 0x775e35 in std::vector<PoDoFo::PdfParser::TXRefEntry, std::allocator<PoDoFo::PdfParser::TXRefEntry> >::resize(unsigned long) /usr/lib/gcc/x86_64-linux-gnu/7.4.0/../../../../include/c++/7.4.0/bits/stl_vector.h:692:4
    #11 0x76bed3 in PoDoFo::PdfParser::ReadXRefSubsection(long&, long&) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfParser.cpp:772:13
    #12 0x75fb7c in PoDoFo::PdfParser::ReadXRefContents(long, bool) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfParser.cpp:725:17
    #13 0x759937 in PoDoFo::PdfParser::ReadDocumentStructure() /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfParser.cpp:337:9
    #14 0x756a92 in PoDoFo::PdfParser::ParseFile(PoDoFo::PdfRefCountedInputDevice const&, bool) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfParser.cpp:220:9
    #15 0x755133 in PoDoFo::PdfParser::ParseFile(char const*, bool) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/base/PdfParser.cpp:164:11
    #16 0x6ab69c in PoDoFo::PdfMemDocument::Load(char const*, bool) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/doc/PdfMemDocument.cpp:256:16
    #17 0x6aaed0 in PoDoFo::PdfMemDocument::PdfMemDocument(char const*, bool) /home/exp/Documents/Mem_obj/podofo-0.9.5/src/doc/PdfMemDocument.cpp:102:11
    #18 0x5d1120 in ImageExtractor::Init(char const*, char const*, int*) /home/exp/Documents/Mem_obj/podofo-0.9.5/tools/podofoimgextract/ImageExtractor.cpp:51:20
    #19 0x5d71b4 in main /home/exp/Documents/Mem_obj/podofo-0.9.5/tools/podofoimgextract/podofoimgextract.cpp:54:17
    #20 0x7fba0736bb96 in __libc_start_main /build/glibc-OTsEL5/glibc-2.27/csu/../csu/libc-start.c:310
    #21 0x4d38b9 in _start (/home/exp/Documents/Mem_obj/podofo-0.9.5/build/bin/podofoimgextract+0x4d38b9)
```