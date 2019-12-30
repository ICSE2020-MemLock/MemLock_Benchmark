### Flex 2.6.4
- Bug type: stack-overflow
- CVE ID: 
  - [CVE-2019-6293](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6293)
- Download:
  ```
  git clone https://github.com/westes/flex
  git checkout 98018e3f58d79e082216d406866942841d4bdf8a
  ```
- Reproduce: `flex @@`
- ASAN dumps the backtrace:

`POC`
```
AddressSanitizer:DEADLYSIGNAL
=================================================================
==30349==ERROR: AddressSanitizer: stack-overflow on address 0x7fffacc27ff8 (pc 0x00000056c257 bp 0x7fffacc28000 sp 0x7fffacc27f80 T0)
    #0 0x56c256 in mark_beginning_as_normal /flex/src/nfa.c:337
    #1 0x56c5e7 in mark_beginning_as_normal /flex/src/nfa.c:348:5
    #2 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #3 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #4 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #5 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #6 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #7 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #8 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #9 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #10 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #11 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #12 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #13 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #14 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #15 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #16 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #17 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #18 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #19 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #20 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #21 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #22 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #23 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #24 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #25 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #26 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #27 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #28 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #29 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #30 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #31 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #32 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #33 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #34 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #35 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #36 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #37 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #38 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #39 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #40 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #41 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #42 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #43 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #44 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #45 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #46 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #47 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #48 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #49 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #50 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #51 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #52 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #53 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #54 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #55 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #56 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #57 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #58 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #59 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #60 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #61 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #62 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #63 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #64 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #65 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #66 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #67 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #68 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #69 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #70 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #71 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #72 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #73 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #74 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #75 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #76 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #77 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #78 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #79 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #80 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #81 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #82 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #83 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #84 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #85 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #86 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #87 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #88 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #89 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #90 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #91 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #92 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #93 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #94 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #95 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #96 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #97 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #98 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #99 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #100 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #101 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #102 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #103 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #104 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #105 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #106 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #107 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #108 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #109 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #110 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #111 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #112 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #113 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #114 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #115 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #116 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #117 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #118 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #119 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #120 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #121 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #122 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #123 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #124 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #125 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #126 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #127 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #128 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #129 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #130 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #131 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #132 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #133 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #134 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #135 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #136 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #137 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #138 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #139 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #140 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #141 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #142 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #143 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #144 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #145 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #146 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #147 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #148 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #149 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #150 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #151 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #152 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #153 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #154 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #155 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #156 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #157 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #158 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #159 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #160 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #161 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #162 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #163 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #164 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #165 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #166 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #167 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #168 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #169 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #170 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #171 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #172 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #173 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #174 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #175 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #176 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #177 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #178 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #179 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #180 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #181 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #182 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #183 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #184 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #185 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #186 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #187 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #188 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #189 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #190 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #191 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #192 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #193 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #194 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #195 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #196 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #197 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #198 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #199 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #200 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #201 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #202 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #203 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #204 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #205 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #206 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #207 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #208 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #209 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #210 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #211 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #212 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #213 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #214 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #215 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #216 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #217 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #218 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #219 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #220 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #221 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #222 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #223 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #224 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #225 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #226 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #227 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #228 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #229 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #230 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #231 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #232 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #233 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #234 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #235 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #236 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #237 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #238 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #239 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #240 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #241 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #242 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #243 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #244 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #245 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #246 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #247 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #248 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5
    #249 0x56c74f in mark_beginning_as_normal /flex/src/nfa.c:351:5

SUMMARY: AddressSanitizer: stack-overflow /flex/src/nfa.c:337 in mark_beginning_as_normal
==30349==ABORTING
```


We can directly look at the snippet code of nfa.c to see if it is possible to have infinite recursion. Intuitively, in some cases, function mark_beginning_as_normal shows the behavior of recursive calls.
```C
void    mark_beginning_as_normal (int mach) {
	switch (state_type[mach]) {
	case STATE_NORMAL:
		/* Oh, we've already visited here. */
		return;

	case STATE_TRAILING_CONTEXT:
		state_type[mach] = STATE_NORMAL;

		if (transchar[mach] == SYM_EPSILON) {
			if (trans1[mach] != NO_TRANSITION)
				mark_beginning_as_normal (trans1[mach]);

			if (trans2[mach] != NO_TRANSITION)
				mark_beginning_as_normal (trans2[mach]);
		}
		break;
	
	}
}
```
This is simply running out of stack space. You can make the number of recursions go up by 11,000 or so by dynamically allocating variables instead of using stack space, but at the end of the day, you can work around this (for this test case) by doing:

`ulimit -s 4096`

Of course, a much larger (deeper) YAML file will still make it crash. You can thus, make it happen far faster by doing:

`ulimit -s 256`

The crash does not seem to happen due to any buffer overflows or memory corruption; it's simply the kernel saying "you're out of stack space, please die". One simple way to avoid the crash itself is to do a depth-check of the tree and compare it to some value related to the stack size returned and produce an error if the values are way out of whack.

A more complicated solution would involve removing recursion, which looks like it would not be a trivial fix.