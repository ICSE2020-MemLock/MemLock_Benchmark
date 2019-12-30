### Libming 0.4.8
- Bug type: stack-overflow, uncontrolled-memory-allocation, memory leak
- CVE ID: 
  - [issue#81](https://github.com/libming/libming/issues/181)
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
- ASAN dumps the backtrace:


`POC`
```
AddressSanitizer:DEADLYSIGNAL
=================================================================
==12691==ERROR: AddressSanitizer: stack-overflow on address 0x7ffcbf939fe8 (pc 0x0000005bdd62 bp 0x7ffcbf93a040 sp 0x7ffcbf939ff0 T0)
    #0 0x5bdd61 in readUInt8 /home/hjwang/Mem_Obj/libming/util/read.c:129
    #1 0x577446 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:911:45
    #2 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #3 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #4 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #5 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #6 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #7 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #8 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #9 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #10 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #11 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #12 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #13 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #14 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #15 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #16 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #17 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #18 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #19 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #20 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #21 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #22 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #23 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #24 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #25 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #26 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #27 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #28 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #29 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #30 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #31 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #32 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #33 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #34 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #35 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #36 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #37 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #38 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #39 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #40 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #41 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #42 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #43 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #44 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #45 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #46 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #47 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #48 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #49 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #50 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #51 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #52 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #53 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #54 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #55 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #56 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #57 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #58 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #59 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #60 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #61 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #62 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #63 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #64 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #65 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #66 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #67 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #68 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #69 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #70 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #71 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #72 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #73 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #74 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #75 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #76 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #77 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #78 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #79 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #80 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #81 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #82 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #83 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #84 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #85 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #86 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #87 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #88 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #89 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #90 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #91 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #92 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #93 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #94 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #95 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #96 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #97 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #98 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #99 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #100 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #101 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #102 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #103 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #104 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #105 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #106 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #107 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #108 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #109 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #110 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #111 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #112 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #113 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #114 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #115 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #116 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #117 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #118 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #119 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #120 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #121 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #122 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #123 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #124 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #125 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #126 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #127 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #128 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #129 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #130 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #131 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #132 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #133 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #134 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #135 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #136 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #137 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #138 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #139 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #140 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #141 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #142 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #143 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #144 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #145 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #146 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #147 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #148 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #149 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #150 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #151 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #152 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #153 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #154 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #155 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #156 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #157 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #158 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #159 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #160 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #161 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #162 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #163 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #164 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #165 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #166 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #167 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #168 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #169 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #170 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #171 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #172 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #173 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #174 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #175 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #176 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #177 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #178 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #179 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #180 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #181 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #182 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #183 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #184 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #185 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #186 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #187 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #188 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #189 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #190 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #191 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #192 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #193 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #194 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #195 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #196 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #197 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #198 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #199 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #200 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #201 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #202 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #203 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #204 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #205 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #206 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #207 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #208 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #209 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #210 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #211 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #212 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #213 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #214 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #215 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #216 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #217 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #218 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #219 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #220 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #221 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #222 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #223 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #224 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #225 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #226 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #227 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #228 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #229 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #230 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #231 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #232 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #233 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #234 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #235 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #236 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #237 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #238 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #239 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #240 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #241 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #242 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #243 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #244 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #245 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #246 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #247 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #248 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4
    #249 0x57e173 in parseSWF_ACTIONRECORD /home/hjwang/Mem_Obj/libming/util/parser.c:1250:4

SUMMARY: AddressSanitizer: stack-overflow /home/hjwang/Mem_Obj/libming/util/read.c:129 in readUInt8
==12691==ABORTING
```

`CVE-2019-7581` && `CVE-2018-7876`
```
header indicates a filesize of 808464488 but filesize is 430
 Stream out of sync after parse of blocktype 24 (SWF_PROTECT). 33 but expecting 51.
==40038==WARNING: AddressSanitizer failed to allocate 0xfffffffffffcd800 bytes
==40038==AddressSanitizer's allocator is terminating the process instead of returning 0
==40038==If you don't like this behavior set allocator_may_return_null=1
==40038==AddressSanitizer CHECK failed: ../../../../src/libsanitizer/sanitizer_common/sanitizer_allocator.cc:147 "((0)) != (0)" (0x0, 0x0)
    #0 0x7f9ab5b8b631  (/usr/lib/x86_64-linux-gnu/libasan.so.2+0xa0631)
    #1 0x7f9ab5b905e3 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) (/usr/lib/x86_64-linux-gnu/libasan.so.2+0xa55e3)
    #2 0x7f9ab5b08425  (/usr/lib/x86_64-linux-gnu/libasan.so.2+0x1d425)
    #3 0x7f9ab5b8e865  (/usr/lib/x86_64-linux-gnu/libasan.so.2+0xa3865)
    #4 0x7f9ab5b0db4d  (/usr/lib/x86_64-linux-gnu/libasan.so.2+0x22b4d)
    #5 0x7f9ab5b835d2 in malloc (/usr/lib/x86_64-linux-gnu/libasan.so.2+0x985d2)
    #6 0x433465 in parseSWF_ACTIONRECORD /home/wdw/experiment/aflgo/libming/util/parser.c:1142
    #7 0x42d6de in parseSWF_CLIPACTIONRECORD /home/wdw/experiment/aflgo/libming/util/parser.c:386
    #8 0x42da81 in parseSWF_CLIPACTIONS /home/wdw/experiment/aflgo/libming/util/parser.c:408
    #9 0x4443a3 in parseSWF_PLACEOBJECT2 /home/wdw/experiment/aflgo/libming/util/parser.c:2665
    #10 0x419c15 in blockParse /home/wdw/experiment/aflgo/libming/util/blocktypes.c:145
    #11 0x415a68 in readMovie /home/wdw/experiment/aflgo/libming/util/main.c:269
    #12 0x41624e in main /home/wdw/experiment/aflgo/libming/util/main.c:354
    #13 0x7f9ab522282f in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x2082f)
    #14 0x401aa8 in _start (/home/wdw/experiment/aflgo/libming/install-asan/bin/listswf+0x401aa8)

```

`CVE-2019-7582` && `CVE-2018-13251`
```
header indicates a filesize of 1995 but filesize is 1916
==19625==WARNING: AddressSanitizer failed to allocate 0xfffffffffffffffe bytes
==19625==AddressSanitizer's allocator is terminating the process instead of returning 0
==19625==If you don't like this behavior set allocator_may_return_null=1
==19625==AddressSanitizer CHECK failed: ../../../../src/libsanitizer/sanitizer_common/sanitizer_allocator.cc:147 "((0)) != (0)" (0x0, 0x0)
    #0 0x7f9290d80631  (/usr/lib/x86_64-linux-gnu/libasan.so.2+0xa0631)
    #1 0x7f9290d855e3 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) (/usr/lib/x86_64-linux-gnu/libasan.so.2+0xa55e3)
    #2 0x7f9290cfd425  (/usr/lib/x86_64-linux-gnu/libasan.so.2+0x1d425)
    #3 0x7f9290d83865  (/usr/lib/x86_64-linux-gnu/libasan.so.2+0xa3865)
    #4 0x7f9290d02b4d  (/usr/lib/x86_64-linux-gnu/libasan.so.2+0x22b4d)
    #5 0x7f9290d785d2 in malloc (/usr/lib/x86_64-linux-gnu/libasan.so.2+0x985d2)
    #6 0x44dec2 in readBytes /home/wdw/experiment/aflgo/libming/util/read.c:252
    #7 0x437290 in parseSWF_DEFINEBITSJPEG2 /home/wdw/experiment/aflgo/libming/util/parser.c:1493
    #8 0x419c15 in blockParse /home/wdw/experiment/aflgo/libming/util/blocktypes.c:145
    #9 0x415a68 in readMovie /home/wdw/experiment/aflgo/libming/util/main.c:269
    #10 0x41624e in main /home/wdw/experiment/aflgo/libming/util/main.c:354
    #11 0x7f929041782f in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x2082f)
    #12 0x401aa8 in _start (/home/wdw/experiment/aflgo/libming/install-asan/bin/listswf+0x401aa8)

```

`issue#155`
```
==29773==ERROR: AddressSanitizer failed to allocate 0x400002000 (17179877376) bytes of LargeMmapAllocator (errno: 12)
==29773==Process memory map follows:
	0x000000400000-0x000000456000	/home/marsman/Desktop/crashana/libming/libming/build_asan/bin/listswf
	0x000000655000-0x000000657000	/home/marsman/Desktop/crashana/libming/libming/build_asan/bin/listswf
	0x000000657000-0x000000666000	/home/marsman/Desktop/crashana/libming/libming/build_asan/bin/listswf
	0x000000666000-0x000000668000	
	0x00007fff7000-0x00008fff7000	
	0x00008fff7000-0x02008fff7000	
	0x02008fff7000-0x10007fff8000	
	0x600000000000-0x602000000000	
	0x602000000000-0x602000010000	
	0x602000010000-0x603000000000	
	0x603000000000-0x603000010000	
	0x603000010000-0x606000000000	
	0x606000000000-0x606000010000	
	0x606000010000-0x60d000000000	
	0x60d000000000-0x60d000010000	
	0x60d000010000-0x60e000000000	
	0x60e000000000-0x60e000010000	
	0x60e000010000-0x611000000000	
	0x611000000000-0x611000010000	
	0x611000010000-0x612000000000	
	0x612000000000-0x612000010000	
	0x612000010000-0x613000000000	
	0x613000000000-0x613000010000	
	0x613000010000-0x616000000000	
	0x616000000000-0x616000020000	
	0x616000020000-0x618000000000	
	0x618000000000-0x618000020000	
	0x618000020000-0x619000000000	
	0x619000000000-0x619000020000	
	0x619000020000-0x621000000000	
	0x621000000000-0x621000020000	
	0x621000020000-0x623000000000	
	0x623000000000-0x623000020000	
	0x623000020000-0x624000000000	
	0x624000000000-0x624000020000	
	0x624000020000-0x640000000000	
	0x640000000000-0x640000003000	
	0x7f30b28fe000-0x7f30b4a00000	
	0x7f30b4b00000-0x7f30b4c00000	
	0x7f30b4ce6000-0x7f30b7038000	
	0x7f30b7038000-0x7f30b70dc000	/usr/lib/x86_64-linux-gnu/libfreetype.so.6.12.1
	0x7f30b70dc000-0x7f30b72db000	/usr/lib/x86_64-linux-gnu/libfreetype.so.6.12.1
	0x7f30b72db000-0x7f30b72e1000	/usr/lib/x86_64-linux-gnu/libfreetype.so.6.12.1
	0x7f30b72e1000-0x7f30b72e2000	/usr/lib/x86_64-linux-gnu/libfreetype.so.6.12.1
	0x7f30b72e2000-0x7f30b7306000	/lib/x86_64-linux-gnu/libpng12.so.0.54.0
	0x7f30b7306000-0x7f30b7505000	/lib/x86_64-linux-gnu/libpng12.so.0.54.0
	0x7f30b7505000-0x7f30b7506000	/lib/x86_64-linux-gnu/libpng12.so.0.54.0
	0x7f30b7506000-0x7f30b7507000	/lib/x86_64-linux-gnu/libpng12.so.0.54.0
	0x7f30b7507000-0x7f30b751d000	/lib/x86_64-linux-gnu/libgcc_s.so.1
	0x7f30b751d000-0x7f30b771c000	/lib/x86_64-linux-gnu/libgcc_s.so.1
	0x7f30b771c000-0x7f30b771d000	/lib/x86_64-linux-gnu/libgcc_s.so.1
	0x7f30b771d000-0x7f30b7825000	/lib/x86_64-linux-gnu/libm-2.23.so
	0x7f30b7825000-0x7f30b7a24000	/lib/x86_64-linux-gnu/libm-2.23.so
	0x7f30b7a24000-0x7f30b7a25000	/lib/x86_64-linux-gnu/libm-2.23.so
	0x7f30b7a25000-0x7f30b7a26000	/lib/x86_64-linux-gnu/libm-2.23.so
	0x7f30b7a26000-0x7f30b7a29000	/lib/x86_64-linux-gnu/libdl-2.23.so
	0x7f30b7a29000-0x7f30b7c28000	/lib/x86_64-linux-gnu/libdl-2.23.so
	0x7f30b7c28000-0x7f30b7c29000	/lib/x86_64-linux-gnu/libdl-2.23.so
	0x7f30b7c29000-0x7f30b7c2a000	/lib/x86_64-linux-gnu/libdl-2.23.so
	0x7f30b7c2a000-0x7f30b7c42000	/lib/x86_64-linux-gnu/libpthread-2.23.so
	0x7f30b7c42000-0x7f30b7e41000	/lib/x86_64-linux-gnu/libpthread-2.23.so
	0x7f30b7e41000-0x7f30b7e42000	/lib/x86_64-linux-gnu/libpthread-2.23.so
	0x7f30b7e42000-0x7f30b7e43000	/lib/x86_64-linux-gnu/libpthread-2.23.so
	0x7f30b7e43000-0x7f30b7e47000	
	0x7f30b7e47000-0x7f30b8007000	/lib/x86_64-linux-gnu/libc-2.23.so
	0x7f30b8007000-0x7f30b8207000	/lib/x86_64-linux-gnu/libc-2.23.so
	0x7f30b8207000-0x7f30b820b000	/lib/x86_64-linux-gnu/libc-2.23.so
	0x7f30b820b000-0x7f30b820d000	/lib/x86_64-linux-gnu/libc-2.23.so
	0x7f30b820d000-0x7f30b8211000	
	0x7f30b8211000-0x7f30b82d3000	/home/marsman/Desktop/crashana/libming/libming/build_asan/lib/libming.so.1.4.8
	0x7f30b82d3000-0x7f30b84d3000	/home/marsman/Desktop/crashana/libming/libming/build_asan/lib/libming.so.1.4.8
	0x7f30b84d3000-0x7f30b84d5000	/home/marsman/Desktop/crashana/libming/libming/build_asan/lib/libming.so.1.4.8
	0x7f30b84d5000-0x7f30b84e7000	/home/marsman/Desktop/crashana/libming/libming/build_asan/lib/libming.so.1.4.8
	0x7f30b84e7000-0x7f30b84ea000	
	0x7f30b84ea000-0x7f30b8503000	/lib/x86_64-linux-gnu/libz.so.1.2.8
	0x7f30b8503000-0x7f30b8702000	/lib/x86_64-linux-gnu/libz.so.1.2.8
	0x7f30b8702000-0x7f30b8703000	/lib/x86_64-linux-gnu/libz.so.1.2.8
	0x7f30b8703000-0x7f30b8704000	/lib/x86_64-linux-gnu/libz.so.1.2.8
	0x7f30b8704000-0x7f30b87f8000	/usr/lib/x86_64-linux-gnu/libasan.so.2.0.0
	0x7f30b87f8000-0x7f30b89f8000	/usr/lib/x86_64-linux-gnu/libasan.so.2.0.0
	0x7f30b89f8000-0x7f30b89fb000	/usr/lib/x86_64-linux-gnu/libasan.so.2.0.0
	0x7f30b89fb000-0x7f30b89fc000	/usr/lib/x86_64-linux-gnu/libasan.so.2.0.0
	0x7f30b89fc000-0x7f30b9671000	
	0x7f30b9671000-0x7f30b9697000	/lib/x86_64-linux-gnu/ld-2.23.so
	0x7f30b9840000-0x7f30b987a000	
	0x7f30b987a000-0x7f30b9896000	
	0x7f30b9896000-0x7f30b9897000	/lib/x86_64-linux-gnu/ld-2.23.so
	0x7f30b9897000-0x7f30b9898000	/lib/x86_64-linux-gnu/ld-2.23.so
	0x7f30b9898000-0x7f30b9899000	
	0x7fff4fa5d000-0x7fff4fa7e000	[stack]
	0x7fff4fa91000-0x7fff4fa94000	[vvar]
	0x7fff4fa94000-0x7fff4fa96000	[vdso]
	0xffffffffff600000-0xffffffffff601000	[vsyscall]
==29773==End of process memory map.
==29773==AddressSanitizer CHECK failed: ../../../../src/libsanitizer/sanitizer_common/sanitizer_posix.cc:121 "(("unable to mmap" && 0)) != (0)" (0x0, 0x0)
    #0 0x7f30b87a4631  (/usr/lib/x86_64-linux-gnu/libasan.so.2+0xa0631)
    #1 0x7f30b87a95e3 in __sanitizer::CheckFailed(char const*, int, char const*, unsigned long long, unsigned long long) (/usr/lib/x86_64-linux-gnu/libasan.so.2+0xa55e3)
    #2 0x7f30b87b1611  (/usr/lib/x86_64-linux-gnu/libasan.so.2+0xad611)
    #3 0x7f30b8726c0c  (/usr/lib/x86_64-linux-gnu/libasan.so.2+0x22c0c)
    #4 0x7f30b879c5d2 in malloc (/usr/lib/x86_64-linux-gnu/libasan.so.2+0x985d2)
    #5 0x436967 in parseABC_NS_SET_INFO ../../util/parser.c:3081
    #6 0x437314 in parseABC_CONSTANT_POOL ../../util/parser.c:3195
    #7 0x4391b4 in parseABC_FILE ../../util/parser.c:3430
    #8 0x439c05 in parseSWF_DOABC ../../util/parser.c:3485
    #9 0x40211d in readMovie ../../util/main.c:269
    #10 0x40211d in main ../../util/main.c:354
    #11 0x7f30b7e6782f in __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x2082f)
    #12 0x402978 in _start (/home/marsman/Desktop/crashana/libming/libming/build_asan/bin/listswf+0x402978)
```