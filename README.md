# MemLock_Benchmark

This Benchmark collect some vulnerabilities related to "excessive memory consumption", which are used in MemLock's experiment.

To trigger these vulnerabilities, the testcase should consume lost of stack memory or heap memory, which can test the ability of fuzzer for generating inputs that consume lost of memory.

The Seeds and POCs are in the folder

If you Cannot reproduce the bug, try to reduce the memory limit.
For example:
- `ulimit -a` to see the information of memory limit.
- `sudo ulimit -s 8192` or `sudo ulimit -s 4096` to reduce the stack size.
- `sudo ulimit -m 36700160` to reduce the memory size.


The detail information of the benchmark can be seen as follow.

### 1. [cxxfilt 2.31](./cxxfilt/README.md)
- Bug type: stack-overflow
- CVE ID: 
  - [CVE-2018-9138](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-9138)
  - [CVE-2018-9996](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-9996)
  - [CVE-2018-17985](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17985)
  - [CVE-2018-18484](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18484)
  - [CVE-2018-18700](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18700)
- Download:
    - [https://ftp.gnu.org/gnu/binutils/](https://ftp.gnu.org/gnu/binutils/)
- Reproduce: `c++filt -t < @@`

### 2. [nm 2.31](./nm/README.md)
- Bug type: stack-overflow
- CVE ID: 
  - [CVE-2018-12641](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-12641)
  - [CVE-2018-17985](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17985)
  - [CVE-2018-18484](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18484)
  - [CVE-2018-18700](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18700)
  - [CVE-2018-18701](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-18701)
  - [CVE-2019-9070](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9070)
  - [CVE-2019-9071](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9071)


- Download:
    - [https://ftp.gnu.org/gnu/binutils/](https://ftp.gnu.org/gnu/binutils/)
- Reproduce: `nm -C @@`

### 3. [NASM 2.14.03rc1](./nasm/README.md)
- Bug type: stack-overflow
- CVE ID: 
  - [CVE-2019-6291](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6291)
  - [CVE-2019-6290](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6290)
  - [CVE-2018-1000886](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-1000886)
- Download:
  ```
  git clone git://repo.or.cz/nasm.git
  git checkout 81f98fe79be23174e2d6ddd9f17a5cfb9ca71ec7
  ```
- Reproduce: `nasm -f bin @@ -o ./tmp`

### 4. [mjs 1.20.1](./mjs/README.md)
- Bug type: stack-overflow
- CVE ID: 
  - [issue#58](https://github.com/cesanta/mjs/issues/58)
  - [issue#106](https://github.com/cesanta/mjs/issues/106)
- Download:
  ```
  git clone https://github.com/cesanta/mjs
  git checkout 2827bd00b59bdc176a010b22fc4acde9b580d6c2
  ```
- install:`clang mjs.c -DMJS_MAIN -fsanitize=address -g -o mjs.out -ldl`
- Reproduce: `mjs.out @@`
- ASAN dumps the backtrace:


### 5. [Flex 2.6.4](./flex/README.md)
- Bug type: stack-overflow
- CVE ID: 
  - [CVE-2019-6293](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6293)
- Download:
  ```
  git clone https://github.com/westes/flex
  git checkout 98018e3f58d79e082216d406866942841d4bdf8a
  ```
- Reproduce: `flex @@`


### 6. [Yaml-cpp 0.6.2](./yaml-cpp/README.md)
- Bug type: stack-overflow
- CVE ID: 
  - [CVE-2019-6292](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6292)
  - [CVE-2019-6285](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6285)
  - [CVE-2018-20573](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20573)
  - [CVE-2018-20574](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20574)
- Download:
  ```
  git clone https://github.com/jbeder/yaml-cpp
  git checkout 562aefc114938e388457e6a531ed7b54d9dc1b62
  ```
- Reproduce: `parse @@`


### 7. [Yara 3.5.0](./yara/README.md)
- Bug type: stack-overflow
- CVE ID: 
  - [CVE-2017-9438](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-9438)
  - [CVE-2017-9304](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-9304)
- Download:
  ```
  git clone https://github.com/VirusTotal/yara
  git checkout 012269756149ae99745b6dafefd415843d7420bb
  ```
- Reproduce: `yara @@ strings`

### 8. [Libsass 3.5.4](./libsass/README.md)
- Bug type: stack-overflow
- CVE ID: 
  - [CVE-2018-19837](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-19837)
  - [CVE-2018-20821](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20821)
  - [CVE-2018-20822](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20822)
- Download:
  ```
  git clone https://github.com/sass/libsass
  git checkout 45f50873962b7d1c66bd115ba6e644bdaaf6cac1
  ```
- Reproduce: `tester @@`

### 9. [Libming 0.4.8](./libming/README.md)
- Bug type: stack-overflow
- CVE ID: 
  - [issue#81](https://github.com/libming/libming/issues/181)
- Download:
  ```
  git clone https://github.com/libming/libming
  git checkout b72cc2fda0e8b3792b7b3f7361fc3f917f269433
  ```
- Reproduce: `listswf @@ `


### 10. [jasper 2.0.14](./jasper/README.md)
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


### 11. [Libming 0.4.8](./libming/README.md)
- Bug type: uncontrolled-memory-allocation, memory leak
- CVE ID: 
  - [issue#155](https://github.com/libming/libming/issues/155)
  - [CVE-2019-7581](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-7581)
  - [CVE-2018-7876](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-7876)
  - [CVE-2019-7582](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-7582)
  - [CVE-2018-13251](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-13251)
  - the meory leak is very easy to find in CVE website, lots of memory leak
- Download:
  ```
  git clone https://github.com/libming/libming
  git checkout b72cc2fda0e8b3792b7b3f7361fc3f917f269433
  ```
- Reproduce: `listswf @@`


### 12. [zziplib v0.13.68](./zziplib/README.md)
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


### 13. [Bento4 1.5.1-627](./Bento4/README.md)
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


### 14. [readelf 2.28](./readelf/README.md)
- Bug type: uncontrolled-memory-allocation
- CVE ID: 
  - [CVE-2017-15996](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-15996)
- Download:
  - https://ftp.gnu.org/gnu/binutils/
- Reproduce: `readelf -a @@`


### 15. [exiv2 0.26](./exiv2/README.md)
- Bug type: uncontrolled-memory-allocation
- CVE ID: 
  - [CVE-2018-4868](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-4868)
- Download:
	```
	git clone https://github.com/Exiv2/exiv2
	git checkout fa449a4d2c58d63f0d75ff259f25683a98a44630
	```
- Reproduce: `exiv2 -pX @@`


### 16. [openjpeg 2.3.0](./openjpeg/README.md)
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

### 17. [podofo 0.9.5](./podofo/README.md)
- Bug type: uncontrolled-memory-allocation
- CVE ID: 
  - [CVE-2019-10723](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10723)
  - [CVE-2018-20797](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-20797)
  - [CVE-2018-5783](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-5783)
  - [CVE-2018-5296](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-5296)
- Download:
  - [https://sourceforge.net/projects/podofo/files/podofo/0.9.5/](https://sourceforge.net/projects/podofo/files/podofo/0.9.5/)
- Reproduce: `podofoimgextract @@ ./out`
