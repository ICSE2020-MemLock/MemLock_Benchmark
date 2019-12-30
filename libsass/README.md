### Libsass 3.5.4
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
- ASAN dumps the backtrace:

`CVE-2018-19837`
```
ASAN:DEADLYSIGNAL
=================================================================
==7972==ERROR: AddressSanitizer: stack-overflow on address 0x7fff04f5af98 (pc 0x7f94c61d73c1 bp 0x7fff04f5d910 sp 0x7fff04f5afa0 T0)
    #0 0x7f94c61d73c0 in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:563
    #1 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #2 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #3 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #4 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #5 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #6 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #7 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #8 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #9 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #10 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #11 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #12 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #13 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #14 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #15 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #16 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #17 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #18 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #19 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #20 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #21 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #22 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #23 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #24 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #25 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #26 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #27 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #28 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #29 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #30 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #31 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #32 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #33 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #34 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #35 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #36 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #37 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #38 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #39 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #40 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #41 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #42 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #43 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #44 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #45 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #46 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #47 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #48 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #49 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #50 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #51 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #52 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #53 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #54 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #55 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #56 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #57 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #58 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #59 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #60 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #61 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #62 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #63 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #64 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #65 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #66 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #67 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #68 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #69 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #70 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #71 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #72 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #73 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #74 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #75 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #76 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #77 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #78 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #79 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #80 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #81 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #82 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #83 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #84 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #85 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #86 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #87 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #88 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #89 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #90 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #91 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #92 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #93 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #94 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #95 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #96 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #97 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #98 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #99 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #100 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #101 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #102 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #103 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #104 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #105 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #106 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #107 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #108 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #109 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #110 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #111 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #112 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #113 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #114 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #115 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #116 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #117 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #118 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #119 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #120 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #121 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #122 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #123 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #124 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #125 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #126 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #127 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #128 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #129 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #130 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #131 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #132 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #133 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #134 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #135 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #136 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #137 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #138 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #139 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #140 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #141 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #142 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #143 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #144 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #145 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #146 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #147 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #148 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #149 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #150 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #151 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #152 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #153 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #154 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #155 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #156 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #157 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #158 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #159 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #160 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #161 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #162 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #163 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #164 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #165 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #166 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #167 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #168 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #169 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #170 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #171 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #172 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #173 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #174 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #175 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #176 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #177 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #178 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #179 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #180 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #181 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #182 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #183 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #184 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #185 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #186 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #187 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #188 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #189 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #190 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #191 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #192 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #193 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #194 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #195 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #196 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #197 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #198 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #199 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #200 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #201 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #202 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #203 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #204 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #205 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #206 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #207 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #208 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #209 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #210 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #211 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #212 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #213 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #214 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #215 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #216 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #217 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #218 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #219 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #220 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #221 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #222 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #223 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #224 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #225 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #226 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #227 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #228 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #229 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #230 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #231 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #232 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #233 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #234 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #235 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #236 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #237 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #238 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #239 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #240 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #241 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #242 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #243 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #244 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #245 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #246 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #247 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #248 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #249 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13
    #250 0x7f94c61d9e9d in Sass::Eval::operator()(Sass::Binary_Expression*) /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:595:13

SUMMARY: AddressSanitizer: stack-overflow /home/wencheng/Documents/SO_Object/libsass/src/eval.cpp:563 in Sass::Eval::operator()(Sass::Binary_Expression*)
==7972==ABORTING
```

`CVE-2018-20821`
```
ASAN:DEADLYSIGNAL
=================================================================
==13418==ERROR: AddressSanitizer: stack-overflow on address 0x7fff38081f58 (pc 0x0000004bcbc2 bp 0x7fff380827d0 sp 0x7fff38081f60 T0)
    #0 0x4bcbc1 in __asan_memcpy (/home/wencheng/Documents/SO_Object/libsass/.libs/lt-tester+0x4bcbc1)
    #1 0x7f76b48e85cd in Sass::String::String(Sass::ParserState, bool) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:1682:13
    #2 0x7f76b4c4d1da in Sass::String_Schema::String_Schema(Sass::ParserState, unsigned long, bool) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:1708:7
    #3 0x7f76b4c1585e in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1808:32
    #4 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #5 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #6 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #7 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #8 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #9 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #10 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #11 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #12 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #13 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #14 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #15 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #16 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #17 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #18 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #19 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #20 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #21 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #22 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #23 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #24 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #25 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #26 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #27 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #28 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #29 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #30 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #31 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #32 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #33 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #34 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #35 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #36 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #37 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #38 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #39 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #40 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #41 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #42 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #43 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #44 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #45 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #46 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #47 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #48 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #49 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #50 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #51 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #52 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #53 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #54 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #55 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #56 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #57 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #58 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #59 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #60 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #61 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #62 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #63 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #64 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #65 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #66 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #67 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #68 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #69 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #70 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #71 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #72 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #73 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #74 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #75 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #76 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #77 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #78 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #79 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #80 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #81 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #82 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #83 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #84 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #85 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #86 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #87 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #88 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #89 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #90 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #91 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #92 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #93 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #94 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #95 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #96 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #97 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #98 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #99 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #100 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #101 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #102 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #103 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #104 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #105 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #106 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #107 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #108 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #109 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #110 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #111 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #112 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #113 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #114 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #115 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #116 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #117 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #118 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #119 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #120 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #121 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #122 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #123 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #124 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #125 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #126 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #127 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #128 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #129 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #130 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #131 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #132 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #133 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #134 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #135 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #136 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #137 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #138 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #139 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #140 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #141 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #142 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #143 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #144 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #145 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #146 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #147 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #148 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #149 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #150 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #151 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #152 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #153 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #154 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #155 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #156 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #157 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #158 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #159 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #160 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #161 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #162 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #163 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #164 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #165 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #166 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #167 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #168 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #169 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #170 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #171 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #172 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #173 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #174 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #175 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #176 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #177 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #178 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #179 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #180 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #181 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #182 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #183 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #184 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #185 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #186 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #187 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #188 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #189 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #190 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #191 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #192 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #193 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #194 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #195 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #196 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #197 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #198 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #199 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #200 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #201 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #202 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #203 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #204 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #205 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #206 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #207 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #208 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #209 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #210 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #211 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #212 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #213 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #214 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #215 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #216 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #217 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #218 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #219 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #220 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #221 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #222 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #223 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #224 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #225 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #226 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #227 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #228 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #229 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #230 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #231 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #232 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #233 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #234 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #235 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #236 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #237 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #238 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #239 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #240 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #241 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #242 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #243 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #244 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #245 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #246 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #247 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #248 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17
    #249 0x7f76b4c18842 in Sass::Parser::parse_css_variable_value_token(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1841:39
    #250 0x7f76b4be6155 in Sass::Parser::parse_css_variable_value(bool) /home/wencheng/Documents/SO_Object/libsass/src/parser.cpp:1794:17

SUMMARY: AddressSanitizer: stack-overflow (/home/wencheng/Documents/SO_Object/libsass/.libs/lt-tester+0x4bcbc1) in __asan_memcpy
==13418==ABORTING
```

`CVE-2018-20822`
```
ASAN:DEADLYSIGNAL
=================================================================
==15021==ERROR: AddressSanitizer: stack-overflow on address 0x7fff4fb64cf8 (pc 0x00000043f867 bp 0x7fff4fb65570 sp 0x7fff4fb64d00 T0)
    #0 0x43f866 in __interceptor_strlen.part.31 (/home/wencheng/Documents/SO_Object/libsass/.libs/lt-tester+0x43f866)
    #1 0x7f86b8c31c36 in std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::basic_string(char const*, std::allocator<char> const&) (/usr/lib/x86_64-linux-gnu/libstdc++.so.6+0x121c36)
    #2 0x7f86b98d6c13 in Sass::Inspect::operator()(Sass::Parent_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:916:48
    #3 0x7f86b9226559 in Sass::Parent_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2400:5
    #4 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #5 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #6 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #7 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #8 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #9 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #10 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #11 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #12 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #13 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #14 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #15 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #16 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #17 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #18 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #19 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #20 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #21 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #22 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #23 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #24 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #25 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #26 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #27 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #28 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #29 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #30 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #31 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #32 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #33 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #34 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #35 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #36 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #37 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #38 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #39 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #40 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #41 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #42 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #43 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #44 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #45 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #46 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #47 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #48 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #49 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #50 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #51 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #52 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #53 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #54 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #55 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #56 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #57 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #58 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #59 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #60 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #61 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #62 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #63 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #64 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #65 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #66 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #67 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #68 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #69 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #70 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #71 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #72 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #73 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #74 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #75 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #76 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #77 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #78 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #79 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #80 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #81 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #82 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #83 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #84 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #85 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #86 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #87 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #88 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #89 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #90 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #91 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #92 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #93 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #94 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #95 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #96 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #97 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #98 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #99 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #100 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #101 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #102 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #103 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #104 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #105 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #106 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #107 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #108 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #109 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #110 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #111 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #112 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #113 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #114 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #115 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #116 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #117 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #118 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #119 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #120 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #121 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #122 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #123 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #124 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #125 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #126 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #127 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #128 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #129 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #130 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #131 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #132 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #133 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #134 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #135 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #136 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #137 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #138 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #139 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #140 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #141 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #142 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #143 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #144 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #145 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #146 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #147 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #148 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #149 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #150 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #151 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #152 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #153 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #154 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #155 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #156 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #157 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #158 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #159 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #160 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #161 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #162 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #163 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #164 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #165 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #166 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #167 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #168 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #169 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #170 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #171 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #172 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #173 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #174 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #175 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #176 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #177 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #178 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #179 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #180 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #181 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #182 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #183 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #184 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #185 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #186 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #187 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #188 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #189 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #190 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #191 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #192 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #193 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #194 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #195 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #196 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #197 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #198 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #199 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #200 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #201 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #202 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #203 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #204 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #205 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #206 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #207 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #208 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #209 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #210 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #211 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #212 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #213 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #214 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #215 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #216 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #217 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #218 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #219 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #220 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #221 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #222 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #223 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #224 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #225 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #226 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #227 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #228 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #229 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #230 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #231 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #232 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #233 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #234 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #235 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #236 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #237 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #238 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #239 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #240 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22
    #241 0x7f86b922c5f9 in Sass::Wrapped_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2637:5
    #242 0x7f86b98da856 in Sass::Inspect::operator()(Sass::Compound_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:996:16
    #243 0x7f86b922d369 in Sass::Compound_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2742:5
    #244 0x7f86b98db772 in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1023:44
    #245 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #246 0x7f86b98dd40e in Sass::Inspect::operator()(Sass::Complex_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1061:21
    #247 0x7f86b922f449 in Sass::Complex_Selector::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2907:5
    #248 0x7f86b98decb0 in Sass::Inspect::operator()(Sass::Selector_List*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:1098:16
    #249 0x7f86b9230fa9 in Sass::Selector_List::perform(Sass::Operation<void>*) /home/wencheng/Documents/SO_Object/libsass/src/./ast.hpp:2984:5
    #250 0x7f86b98da0f6 in Sass::Inspect::operator()(Sass::Wrapped_Selector*) /home/wencheng/Documents/SO_Object/libsass/src/inspect.cpp:986:22

SUMMARY: AddressSanitizer: stack-overflow (/home/wencheng/Documents/SO_Object/libsass/.libs/lt-tester+0x43f866) in __interceptor_strlen.part.31
==15021==ABORTING
```

`NOT-CVE`
```
ASAN:DEADLYSIGNAL
=================================================================
==13403==ERROR: AddressSanitizer: stack-overflow on address 0x7ffed0ff8ff8 (pc 0x00000042472b bp 0x7ffed0ff98e0 sp 0x7ffed0ff8ff0 T0)
    #0 0x42472a in __asan::Allocator::Allocate(unsigned long, unsigned long, __sanitizer::BufferedStackTrace*, __asan::AllocType, bool) (/home/wencheng/Documents/SO_Object/libsass/.libs/lt-tester+0x42472a)
    #1 0x50cb68 in operator new(unsigned long) (/home/wencheng/Documents/SO_Object/libsass/.libs/lt-tester+0x50cb68)
    #2 0x7f4e56a65e2a in Sass::Complex_Selector::copy() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #3 0x7f4e56a65fed in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #4 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #5 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #6 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #7 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #8 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #9 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #10 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #11 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #12 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #13 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #14 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #15 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #16 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #17 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #18 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #19 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #20 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #21 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #22 0x7f4e56a48e99 in Sass::Selector_List::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1504:15
    #23 0x7f4e56a67073 in Sass::Selector_List::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2170:3
    #24 0x7f4e56a493a8 in Sass::Wrapped_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1510:14
    #25 0x7f4e56a66dc3 in Sass::Wrapped_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2169:3
    #26 0x7f4e56a488d9 in Sass::Compound_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1497:15
    #27 0x7f4e56a65da3 in Sass::Compound_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2163:3
    #28 0x7f4e56a47dfa in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1490:22
    #29 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #30 0x7f4e56a48e99 in Sass::Selector_List::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1504:15
    #31 0x7f4e56a67073 in Sass::Selector_List::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2170:3
    #32 0x7f4e56a493a8 in Sass::Wrapped_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1510:14
    #33 0x7f4e56a66dc3 in Sass::Wrapped_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2169:3
    #34 0x7f4e56a488d9 in Sass::Compound_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1497:15
    #35 0x7f4e56a65da3 in Sass::Compound_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2163:3
    #36 0x7f4e56a47dfa in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1490:22
    #37 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #38 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #39 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #40 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #41 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #42 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #43 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #44 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #45 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #46 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #47 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #48 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #49 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #50 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #51 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #52 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #53 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #54 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #55 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #56 0x7f4e56a48e99 in Sass::Selector_List::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1504:15
    #57 0x7f4e56a67073 in Sass::Selector_List::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2170:3
    #58 0x7f4e56a493a8 in Sass::Wrapped_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1510:14
    #59 0x7f4e56a66dc3 in Sass::Wrapped_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2169:3
    #60 0x7f4e56a488d9 in Sass::Compound_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1497:15
    #61 0x7f4e56a65da3 in Sass::Compound_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2163:3
    #62 0x7f4e56a47dfa in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1490:22
    #63 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #64 0x7f4e56a48e99 in Sass::Selector_List::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1504:15
    #65 0x7f4e56a67073 in Sass::Selector_List::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2170:3
    #66 0x7f4e56a493a8 in Sass::Wrapped_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1510:14
    #67 0x7f4e56a66dc3 in Sass::Wrapped_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2169:3
    #68 0x7f4e56a488d9 in Sass::Compound_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1497:15
    #69 0x7f4e56a65da3 in Sass::Compound_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2163:3
    #70 0x7f4e56a47dfa in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1490:22
    #71 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #72 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #73 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #74 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #75 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #76 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #77 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #78 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #79 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #80 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #81 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #82 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #83 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #84 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #85 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #86 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #87 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #88 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #89 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #90 0x7f4e56a48e99 in Sass::Selector_List::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1504:15
    #91 0x7f4e56a67073 in Sass::Selector_List::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2170:3
    #92 0x7f4e56a493a8 in Sass::Wrapped_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1510:14
    #93 0x7f4e56a66dc3 in Sass::Wrapped_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2169:3
    #94 0x7f4e56a488d9 in Sass::Compound_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1497:15
    #95 0x7f4e56a65da3 in Sass::Compound_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2163:3
    #96 0x7f4e56a47dfa in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1490:22
    #97 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #98 0x7f4e56a48e99 in Sass::Selector_List::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1504:15
    #99 0x7f4e56a67073 in Sass::Selector_List::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2170:3
    #100 0x7f4e56a493a8 in Sass::Wrapped_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1510:14
    #101 0x7f4e56a66dc3 in Sass::Wrapped_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2169:3
    #102 0x7f4e56a488d9 in Sass::Compound_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1497:15
    #103 0x7f4e56a65da3 in Sass::Compound_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2163:3
    #104 0x7f4e56a47dfa in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1490:22
    #105 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #106 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #107 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #108 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #109 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #110 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #111 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #112 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #113 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #114 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #115 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #116 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #117 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #118 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #119 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #120 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #121 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #122 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #123 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #124 0x7f4e56a48e99 in Sass::Selector_List::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1504:15
    #125 0x7f4e56a67073 in Sass::Selector_List::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2170:3
    #126 0x7f4e56a493a8 in Sass::Wrapped_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1510:14
    #127 0x7f4e56a66dc3 in Sass::Wrapped_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2169:3
    #128 0x7f4e56a488d9 in Sass::Compound_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1497:15
    #129 0x7f4e56a65da3 in Sass::Compound_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2163:3
    #130 0x7f4e56a47dfa in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1490:22
    #131 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #132 0x7f4e56a48e99 in Sass::Selector_List::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1504:15
    #133 0x7f4e56a67073 in Sass::Selector_List::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2170:3
    #134 0x7f4e56a493a8 in Sass::Wrapped_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1510:14
    #135 0x7f4e56a66dc3 in Sass::Wrapped_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2169:3
    #136 0x7f4e56a488d9 in Sass::Compound_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1497:15
    #137 0x7f4e56a65da3 in Sass::Compound_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2163:3
    #138 0x7f4e56a47dfa in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1490:22
    #139 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #140 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #141 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #142 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #143 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #144 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #145 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #146 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #147 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #148 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #149 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #150 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #151 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #152 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #153 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #154 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #155 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #156 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #157 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #158 0x7f4e56a48e99 in Sass::Selector_List::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1504:15
    #159 0x7f4e56a67073 in Sass::Selector_List::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2170:3
    #160 0x7f4e56a493a8 in Sass::Wrapped_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1510:14
    #161 0x7f4e56a66dc3 in Sass::Wrapped_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2169:3
    #162 0x7f4e56a488d9 in Sass::Compound_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1497:15
    #163 0x7f4e56a65da3 in Sass::Compound_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2163:3
    #164 0x7f4e56a47dfa in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1490:22
    #165 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #166 0x7f4e56a48e99 in Sass::Selector_List::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1504:15
    #167 0x7f4e56a67073 in Sass::Selector_List::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2170:3
    #168 0x7f4e56a493a8 in Sass::Wrapped_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1510:14
    #169 0x7f4e56a66dc3 in Sass::Wrapped_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2169:3
    #170 0x7f4e56a488d9 in Sass::Compound_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1497:15
    #171 0x7f4e56a65da3 in Sass::Compound_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2163:3
    #172 0x7f4e56a47dfa in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1490:22
    #173 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #174 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #175 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #176 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #177 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #178 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #179 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #180 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #181 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #182 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #183 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #184 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #185 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #186 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #187 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #188 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #189 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #190 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #191 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #192 0x7f4e56a48e99 in Sass::Selector_List::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1504:15
    #193 0x7f4e56a67073 in Sass::Selector_List::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2170:3
    #194 0x7f4e56a493a8 in Sass::Wrapped_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1510:14
    #195 0x7f4e56a66dc3 in Sass::Wrapped_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2169:3
    #196 0x7f4e56a488d9 in Sass::Compound_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1497:15
    #197 0x7f4e56a65da3 in Sass::Compound_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2163:3
    #198 0x7f4e56a47dfa in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1490:22
    #199 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #200 0x7f4e56a48e99 in Sass::Selector_List::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1504:15
    #201 0x7f4e56a67073 in Sass::Selector_List::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2170:3
    #202 0x7f4e56a493a8 in Sass::Wrapped_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1510:14
    #203 0x7f4e56a66dc3 in Sass::Wrapped_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2169:3
    #204 0x7f4e56a488d9 in Sass::Compound_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1497:15
    #205 0x7f4e56a65da3 in Sass::Compound_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2163:3
    #206 0x7f4e56a47dfa in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1490:22
    #207 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #208 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #209 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #210 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #211 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #212 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #213 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #214 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #215 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #216 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #217 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #218 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #219 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #220 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #221 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #222 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #223 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #224 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #225 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #226 0x7f4e56a48e99 in Sass::Selector_List::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1504:15
    #227 0x7f4e56a67073 in Sass::Selector_List::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2170:3
    #228 0x7f4e56a493a8 in Sass::Wrapped_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1510:14
    #229 0x7f4e56a66dc3 in Sass::Wrapped_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2169:3
    #230 0x7f4e56a488d9 in Sass::Compound_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1497:15
    #231 0x7f4e56a65da3 in Sass::Compound_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2163:3
    #232 0x7f4e56a47dfa in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1490:22
    #233 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #234 0x7f4e56a48e99 in Sass::Selector_List::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1504:15
    #235 0x7f4e56a67073 in Sass::Selector_List::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2170:3
    #236 0x7f4e56a493a8 in Sass::Wrapped_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1510:14
    #237 0x7f4e56a66dc3 in Sass::Wrapped_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2169:3
    #238 0x7f4e56a488d9 in Sass::Compound_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1497:15
    #239 0x7f4e56a65da3 in Sass::Compound_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2163:3
    #240 0x7f4e56a47dfa in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1490:22
    #241 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #242 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #243 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #244 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #245 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #246 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #247 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #248 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22
    #249 0x7f4e56a66053 in Sass::Complex_Selector::clone() const /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:2164:3
    #250 0x7f4e56a48221 in Sass::Complex_Selector::cloneChildren() /home/wencheng/Documents/SO_Object/libsass/src/ast.cpp:1491:22

SUMMARY: AddressSanitizer: stack-overflow (/home/wencheng/Documents/SO_Object/libsass/.libs/lt-tester+0x42472a) in __asan::Allocator::Allocate(unsigned long, unsigned long, __sanitizer::BufferedStackTrace*, __asan::AllocType, bool)
==13403==ABORTING
```
