;; from 2011-07-09 03:00:00 to 2011-07-09 04:00:00: 60 observations (57 alarms), 114 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Breaker_X3_X4 - Breaker
   Breaker_X5_X6 - Breaker
   Breaker_X7_X8 - Breaker
   Line_X9_X10 - Line
   Breaker_X11_X12 - Breaker
   Breaker_X13_X14 - Breaker
   Breaker_X15_X16 - Breaker
   Breaker_X17_X18 - Breaker
   Breaker_X19_X20 - Breaker
   Breaker_X21_X22 - Breaker
   Breaker_X23_X24 - Breaker
   Breaker_X25_X26 - Breaker
   Breaker_X27_X28 - Breaker
   Breaker_X29_X30 - Breaker
   Breaker_X31_X32 - Breaker
   Breaker_X33_X34 - Breaker
   Breaker_X35_X36 - Breaker
   Breaker_X37_X38 - Breaker
   Breaker_X39_X40 - Breaker
   Breaker_X41_X42 - Breaker
   Breaker_X43_X44 - Breaker
   Line_X45_X46 - Line
   Breaker_X47_X48 - Breaker
   Breaker_X49_X50 - Breaker
   Breaker_X51_X52 - Breaker
   Breaker_X53_X54 - Breaker
   Breaker_X55_X56 - Breaker
   Breaker_X57_X58 - Breaker
   Breaker_X59_X60 - Breaker
   Breaker_X61_X62 - Breaker
   Line_X63_X64 - Line
   Breaker_X65_X66 - Breaker
   Breaker_X67_X68 - Breaker
   Breaker_X69_X70 - Breaker
   Breaker_X71_X72 - Breaker
   Bus_X73 - bus
   Bus_X74 - bus
   Bus_X18 - bus
   Bus_X75 - bus
   Bus_X76 - bus
   Bus_X77 - bus
   Bus_X78 - bus
   Bus_X79 - bus
   Bus_X60 - bus
   Bus_X80 - bus
   Bus_X81 - bus
   Generator_X82_1 - generator
   Generator_X18_1 - generator
   Generator_X20_1 - generator
   Line_X83_X84 - Line
   Line_X85_X86 - Line
   Line_X87_X88 - Line
   Breaker_X89_X90 - Breaker
   Breaker_X91_X92 - Breaker
   Breaker_X93_X94 - Breaker
   Breaker_X95_X96 - Breaker
   Line_X97_X98 - Line
   Line_X99_X100 - Line
   Line_X101_X102 - Line
   Line_X103_X104 - Line
   Line_X105_X106 - Line
   Line_X107_X108 - Line
   Line_X109_X110 - Line
   Line_X111_X112 - Line
   Breaker_X113_X114 - Breaker
   Breaker_X115_X116 - Breaker
   Breaker_X117_X118 - Breaker
   Breaker_X119_X120 - Breaker
   Breaker_X121_X122 - Breaker
   Breaker_X123_X124 - Breaker
   Breaker_X125_X126 - Breaker
   Breaker_X127_X128 - Breaker
   Breaker_X129_X130 - Breaker
   Breaker_X131_X132 - Breaker
   Breaker_X133_X134 - Breaker
   Breaker_X135_X136 - Breaker
   Breaker_X137_X138 - Breaker
   Breaker_X139_X140 - Breaker
   Breaker_X141_X142 - Breaker
   Breaker_X143_X144 - Breaker
   Breaker_X145_X146 - Breaker
   Breaker_X147_X148 - Breaker
   Bus_X9 - bus
   Bus_X45 - bus
   Bus_X63 - bus
   Bus_X83 - bus
   Bus_X85 - bus
   Bus_X87 - bus
   Bus_X97 - bus
   Bus_X99 - bus
   Bus_X101 - bus
   Bus_X103 - bus
   Bus_X105 - bus
   Bus_X107 - bus
   Bus_X109 - bus
   Bus_X111 - bus
   Bus_X10 - bus
   Bus_X46 - bus
   Bus_X64 - bus
   Bus_X84 - bus
   Bus_X86 - bus
   Bus_X88 - bus
   Bus_X98 - bus
   Bus_X100 - bus
   Bus_X102 - bus
   Bus_X104 - bus
   Bus_X106 - bus
   Bus_X108 - bus
   Bus_X110 - bus
   Bus_X112 - bus
   Breaker_X149_X82 - Breaker
   Bus_X82 - bus
   Bus_X20 - bus
   obs9999 - observation
   obs10000 - observation
   obs10001 - observation
   obs10002 - observation
   obs10003 - observation
   obs10004 - observation
   obs10005 - observation
   obs10006 - observation
   obs10007 - observation
   obs10008 - observation
   obs10009 - observation
   obs10010 - observation
   obs10011 - observation
   obs10012 - observation
   obs10013 - observation
   obs10014 - observation
   obs10015 - observation
   obs10016 - observation
   obs10017 - observation
   obs10018 - observation
   obs10019 - observation
   obs10020 - observation
   obs10021 - observation
   obs10022 - observation
   obs10023 - observation
   obs10024 - observation
   obs10025 - observation
   obs10026 - observation
   obs10027 - observation
   obs10028 - observation
   obs10029 - observation
   obs10030 - observation
   obs10031 - observation
   obs10032 - observation
   obs10033 - observation
   obs10034 - observation
   obs10035 - observation
   obs10036 - observation
   obs10037 - observation
   obs10038 - observation
   obs10039 - observation
   obs10040 - observation
   obs10041 - observation
   obs10042 - observation
   obs10043 - observation
   obs10044 - observation
   obs10045 - observation
   obs10046 - observation
   obs10047 - observation
   obs10048 - observation
   obs10049 - observation
   obs10050 - observation
   obs10051 - observation
   obs10052 - observation
   obs10053 - observation
   obs10054 - observation
   obs10055 - observation
   obs10056 - observation
   obs10057 - observation
   obs10058 - observation
   )

  (:init
   (static-true)
   (line-isolators-2 Line_X9_X10 Breaker_X11_X12 Breaker_X65_X66)
   (line-isolator Breaker_X11_X12 Line_X9_X10)
   (line-isolator Breaker_X65_X66 Line_X9_X10)
   (line-isolators-3 Line_X83_X84 Breaker_X89_X90 Breaker_X91_X92 Breaker_X57_X58)
   (line-isolator Breaker_X89_X90 Line_X83_X84)
   (line-isolator Breaker_X91_X92 Line_X83_X84)
   (line-isolator Breaker_X57_X58 Line_X83_X84)
   (line-isolators-3 Line_X85_X86 Breaker_X51_X52 Breaker_X71_X72 Breaker_X67_X68)
   (line-isolator Breaker_X51_X52 Line_X85_X86)
   (line-isolator Breaker_X71_X72 Line_X85_X86)
   (line-isolator Breaker_X67_X68 Line_X85_X86)
   (line-isolators-3 Line_X87_X88 Breaker_X53_X54 Breaker_X93_X94 Breaker_X95_X96)
   (line-isolator Breaker_X53_X54 Line_X87_X88)
   (line-isolator Breaker_X93_X94 Line_X87_X88)
   (line-isolator Breaker_X95_X96 Line_X87_X88)
   (line-isolators-4 Line_X97_X98 Breaker_X113_X114 Breaker_X21_X22 Breaker_X27_X28 Breaker_X29_X30)
   (line-isolator Breaker_X113_X114 Line_X97_X98)
   (line-isolator Breaker_X21_X22 Line_X97_X98)
   (line-isolator Breaker_X27_X28 Line_X97_X98)
   (line-isolator Breaker_X29_X30 Line_X97_X98)
   (line-isolators-4 Line_X99_X100 Breaker_X115_X116 Breaker_X23_X24 Breaker_X131_X132 Breaker_X137_X138)
   (line-isolator Breaker_X115_X116 Line_X99_X100)
   (line-isolator Breaker_X23_X24 Line_X99_X100)
   (line-isolator Breaker_X131_X132 Line_X99_X100)
   (line-isolator Breaker_X137_X138 Line_X99_X100)
   (line-isolators-4 Line_X101_X102 Breaker_X117_X118 Breaker_X127_X128 Breaker_X27_X28 Breaker_X29_X30)
   (line-isolator Breaker_X117_X118 Line_X101_X102)
   (line-isolator Breaker_X127_X128 Line_X101_X102)
   (line-isolator Breaker_X27_X28 Line_X101_X102)
   (line-isolator Breaker_X29_X30 Line_X101_X102)
   (line-isolators-4 Line_X103_X104 Breaker_X119_X120 Breaker_X129_X130 Breaker_X1_X2 Breaker_X139_X140)
   (line-isolator Breaker_X119_X120 Line_X103_X104)
   (line-isolator Breaker_X129_X130 Line_X103_X104)
   (line-isolator Breaker_X1_X2 Line_X103_X104)
   (line-isolator Breaker_X139_X140 Line_X103_X104)
   (line-isolators-4 Line_X105_X106 Breaker_X121_X122 Breaker_X13_X14 Breaker_X49_X50 Breaker_X141_X142)
   (line-isolator Breaker_X121_X122 Line_X105_X106)
   (line-isolator Breaker_X13_X14 Line_X105_X106)
   (line-isolator Breaker_X49_X50 Line_X105_X106)
   (line-isolator Breaker_X141_X142 Line_X105_X106)
   (line-isolators-4 Line_X107_X108 Breaker_X35_X36 Breaker_X39_X40 Breaker_X5_X6 Breaker_X3_X4)
   (line-isolator Breaker_X35_X36 Line_X107_X108)
   (line-isolator Breaker_X39_X40 Line_X107_X108)
   (line-isolator Breaker_X5_X6 Line_X107_X108)
   (line-isolator Breaker_X3_X4 Line_X107_X108)
   (line-isolators-4 Line_X109_X110 Breaker_X37_X38 Breaker_X41_X42 Breaker_X7_X8 Breaker_X143_X144)
   (line-isolator Breaker_X37_X38 Line_X109_X110)
   (line-isolator Breaker_X41_X42 Line_X109_X110)
   (line-isolator Breaker_X7_X8 Line_X109_X110)
   (line-isolator Breaker_X143_X144 Line_X109_X110)
   (line-isolators-4 Line_X111_X112 Breaker_X123_X124 Breaker_X61_X62 Breaker_X133_X134 Breaker_X145_X146)
   (line-isolator Breaker_X123_X124 Line_X111_X112)
   (line-isolator Breaker_X61_X62 Line_X111_X112)
   (line-isolator Breaker_X133_X134 Line_X111_X112)
   (line-isolator Breaker_X145_X146 Line_X111_X112)
   (line-isolators-4 Line_X45_X46 Breaker_X125_X126 Breaker_X33_X34 Breaker_X135_X136 Breaker_X147_X148)
   (line-isolator Breaker_X125_X126 Line_X45_X46)
   (line-isolator Breaker_X33_X34 Line_X45_X46)
   (line-isolator Breaker_X135_X136 Line_X45_X46)
   (line-isolator Breaker_X147_X148 Line_X45_X46)
   (adjacent Line_X9_X10 Bus_X9)
   (adjacent Line_X9_X10 Bus_X10)
   (adjacent Line_X45_X46 Bus_X45)
   (adjacent Line_X45_X46 Bus_X46)
   (adjacent Line_X63_X64 Bus_X63)
   (adjacent Line_X63_X64 Bus_X64)
   (adjacent Line_X83_X84 Bus_X83)
   (adjacent Line_X83_X84 Bus_X84)
   (adjacent Line_X85_X86 Bus_X85)
   (adjacent Line_X85_X86 Bus_X86)
   (adjacent Line_X87_X88 Bus_X87)
   (adjacent Line_X87_X88 Bus_X88)
   (adjacent Line_X97_X98 Bus_X97)
   (adjacent Line_X97_X98 Bus_X98)
   (adjacent Line_X99_X100 Bus_X99)
   (adjacent Line_X99_X100 Bus_X100)
   (adjacent Line_X101_X102 Bus_X101)
   (adjacent Line_X101_X102 Bus_X102)
   (adjacent Line_X103_X104 Bus_X103)
   (adjacent Line_X103_X104 Bus_X104)
   (adjacent Line_X105_X106 Bus_X105)
   (adjacent Line_X105_X106 Bus_X106)
   (adjacent Line_X107_X108 Bus_X107)
   (adjacent Line_X107_X108 Bus_X108)
   (adjacent Line_X109_X110 Bus_X109)
   (adjacent Line_X109_X110 Bus_X110)
   (adjacent Line_X111_X112 Bus_X111)
   (adjacent Line_X111_X112 Bus_X112)
   (generator-attached-to Generator_X82_1 Bus_X82)
   (generator-attached-to Generator_X18_1 Bus_X18)
   (generator-attached-to Generator_X20_1 Bus_X20)
   (generator-isolator Breaker_X149_X82 Bus_X82)
   (generator-isolator Breaker_X17_X18 Bus_X18)
   (generator-isolator Breaker_X19_X20 Bus_X20)
   (breaker-state-is-unknown Breaker_X1_X2)
   (breaker-ar-status-is-unknown Breaker_X1_X2)
   (breaker-state-is-unknown Breaker_X3_X4)
   (breaker-ar-status-is-unknown Breaker_X3_X4)
   (breaker-state-is-unknown Breaker_X5_X6)
   (breaker-ar-status-is-unknown Breaker_X5_X6)
   (breaker-state-is-unknown Breaker_X7_X8)
   (breaker-ar-status-is-unknown Breaker_X7_X8)
   (breaker-state-is-unknown Breaker_X11_X12)
   (breaker-ar-status-is-unknown Breaker_X11_X12)
   (breaker-state-is-unknown Breaker_X13_X14)
   (breaker-ar-status-is-unknown Breaker_X13_X14)
   (breaker-state-is-unknown Breaker_X15_X16)
   (breaker-ar-status-is-unknown Breaker_X15_X16)
   (breaker-state-is-unknown Breaker_X17_X18)
   (breaker-ar-status-is-unknown Breaker_X17_X18)
   (breaker-state-is-unknown Breaker_X19_X20)
   (breaker-ar-status-is-unknown Breaker_X19_X20)
   (breaker-state-is-unknown Breaker_X21_X22)
   (breaker-ar-status-is-unknown Breaker_X21_X22)
   (breaker-state-is-unknown Breaker_X23_X24)
   (breaker-ar-status-is-unknown Breaker_X23_X24)
   (breaker-state-is-unknown Breaker_X25_X26)
   (breaker-ar-status-is-unknown Breaker_X25_X26)
   (breaker-state-is-unknown Breaker_X27_X28)
   (breaker-ar-status-is-unknown Breaker_X27_X28)
   (breaker-state-is-unknown Breaker_X29_X30)
   (breaker-ar-status-is-unknown Breaker_X29_X30)
   (breaker-state-is-unknown Breaker_X31_X32)
   (breaker-ar-status-is-unknown Breaker_X31_X32)
   (breaker-state-is-unknown Breaker_X33_X34)
   (breaker-ar-status-is-unknown Breaker_X33_X34)
   (breaker-state-is-unknown Breaker_X35_X36)
   (breaker-ar-status-is-unknown Breaker_X35_X36)
   (breaker-state-is-unknown Breaker_X37_X38)
   (breaker-ar-status-is-unknown Breaker_X37_X38)
   (breaker-state-is-unknown Breaker_X39_X40)
   (breaker-ar-status-is-unknown Breaker_X39_X40)
   (breaker-state-is-unknown Breaker_X41_X42)
   (breaker-ar-status-is-unknown Breaker_X41_X42)
   (breaker-state-is-unknown Breaker_X43_X44)
   (breaker-ar-status-is-unknown Breaker_X43_X44)
   (breaker-state-is-unknown Breaker_X47_X48)
   (breaker-ar-status-is-unknown Breaker_X47_X48)
   (breaker-state-is-unknown Breaker_X49_X50)
   (breaker-ar-status-is-unknown Breaker_X49_X50)
   (breaker-state-is-unknown Breaker_X51_X52)
   (breaker-ar-status-is-unknown Breaker_X51_X52)
   (breaker-state-is-unknown Breaker_X53_X54)
   (breaker-ar-status-is-unknown Breaker_X53_X54)
   (breaker-state-is-unknown Breaker_X55_X56)
   (breaker-ar-status-is-unknown Breaker_X55_X56)
   (breaker-state-is-unknown Breaker_X57_X58)
   (breaker-ar-status-is-unknown Breaker_X57_X58)
   (breaker-state-is-unknown Breaker_X59_X60)
   (breaker-ar-status-is-unknown Breaker_X59_X60)
   (breaker-state-is-unknown Breaker_X61_X62)
   (breaker-ar-status-is-unknown Breaker_X61_X62)
   (breaker-state-is-unknown Breaker_X65_X66)
   (breaker-ar-status-is-unknown Breaker_X65_X66)
   (breaker-state-is-unknown Breaker_X67_X68)
   (breaker-ar-status-is-unknown Breaker_X67_X68)
   (breaker-state-is-unknown Breaker_X69_X70)
   (breaker-ar-status-is-unknown Breaker_X69_X70)
   (breaker-state-is-unknown Breaker_X71_X72)
   (breaker-ar-status-is-unknown Breaker_X71_X72)
   (breaker-state-is-unknown Breaker_X89_X90)
   (breaker-ar-status-is-unknown Breaker_X89_X90)
   (breaker-state-is-unknown Breaker_X91_X92)
   (breaker-ar-status-is-unknown Breaker_X91_X92)
   (breaker-state-is-unknown Breaker_X93_X94)
   (breaker-ar-status-is-unknown Breaker_X93_X94)
   (breaker-state-is-unknown Breaker_X95_X96)
   (breaker-ar-status-is-unknown Breaker_X95_X96)
   (breaker-state-is-unknown Breaker_X113_X114)
   (breaker-ar-status-is-unknown Breaker_X113_X114)
   (breaker-state-is-unknown Breaker_X115_X116)
   (breaker-ar-status-is-unknown Breaker_X115_X116)
   (breaker-state-is-unknown Breaker_X117_X118)
   (breaker-ar-status-is-unknown Breaker_X117_X118)
   (breaker-state-is-unknown Breaker_X119_X120)
   (breaker-ar-status-is-unknown Breaker_X119_X120)
   (breaker-state-is-unknown Breaker_X121_X122)
   (breaker-ar-status-is-unknown Breaker_X121_X122)
   (breaker-state-is-unknown Breaker_X123_X124)
   (breaker-ar-status-is-unknown Breaker_X123_X124)
   (breaker-state-is-unknown Breaker_X125_X126)
   (breaker-ar-status-is-unknown Breaker_X125_X126)
   (breaker-state-is-unknown Breaker_X127_X128)
   (breaker-ar-status-is-unknown Breaker_X127_X128)
   (breaker-state-is-unknown Breaker_X129_X130)
   (breaker-ar-status-is-unknown Breaker_X129_X130)
   (breaker-state-is-unknown Breaker_X131_X132)
   (breaker-ar-status-is-unknown Breaker_X131_X132)
   (breaker-state-is-unknown Breaker_X133_X134)
   (breaker-ar-status-is-unknown Breaker_X133_X134)
   (breaker-state-is-unknown Breaker_X135_X136)
   (breaker-ar-status-is-unknown Breaker_X135_X136)
   (breaker-state-is-unknown Breaker_X137_X138)
   (breaker-ar-status-is-unknown Breaker_X137_X138)
   (breaker-state-is-unknown Breaker_X139_X140)
   (breaker-ar-status-is-unknown Breaker_X139_X140)
   (breaker-state-is-unknown Breaker_X141_X142)
   (breaker-ar-status-is-unknown Breaker_X141_X142)
   (breaker-state-is-unknown Breaker_X143_X144)
   (breaker-ar-status-is-unknown Breaker_X143_X144)
   (breaker-state-is-unknown Breaker_X145_X146)
   (breaker-ar-status-is-unknown Breaker_X145_X146)
   (breaker-state-is-unknown Breaker_X147_X148)
   (breaker-ar-status-is-unknown Breaker_X147_X148)
   (breaker-state-is-unknown Breaker_X149_X82)
   (breaker-ar-status-is-unknown Breaker_X149_X82)
   (line-voltage-unknown Line_X9_X10)
   (line-voltage-unknown Line_X45_X46)
   (line-voltage-unknown Line_X63_X64)
   (line-voltage-unknown Line_X83_X84)
   (line-voltage-unknown Line_X85_X86)
   (line-voltage-unknown Line_X87_X88)
   (line-voltage-unknown Line_X97_X98)
   (line-voltage-unknown Line_X99_X100)
   (line-voltage-unknown Line_X101_X102)
   (line-voltage-unknown Line_X103_X104)
   (line-voltage-unknown Line_X105_X106)
   (line-voltage-unknown Line_X107_X108)
   (line-voltage-unknown Line_X109_X110)
   (line-voltage-unknown Line_X111_X112)
   (bus-voltage-unknown Bus_X64)
   (bus-voltage-unknown Bus_X104)
   (bus-voltage-unknown Bus_X108)
   (bus-voltage-unknown Bus_X110)
   (bus-voltage-unknown Bus_X73)
   (bus-voltage-unknown Bus_X74)
   (bus-voltage-unknown Bus_X9)
   (bus-voltage-unknown Bus_X105)
   (bus-voltage-unknown Bus_X82)
   (bus-voltage-unknown Bus_X18)
   (bus-voltage-unknown Bus_X20)
   (bus-voltage-unknown Bus_X101)
   (bus-voltage-unknown Bus_X97)
   (bus-voltage-unknown Bus_X99)
   (bus-voltage-unknown Bus_X102)
   (bus-voltage-unknown Bus_X98)
   (bus-voltage-unknown Bus_X75)
   (bus-voltage-unknown Bus_X107)
   (bus-voltage-unknown Bus_X109)
   (bus-voltage-unknown Bus_X76)
   (bus-voltage-unknown Bus_X77)
   (bus-voltage-unknown Bus_X45)
   (bus-voltage-unknown Bus_X112)
   (bus-voltage-unknown Bus_X78)
   (bus-voltage-unknown Bus_X79)
   (bus-voltage-unknown Bus_X83)
   (bus-voltage-unknown Bus_X106)
   (bus-voltage-unknown Bus_X85)
   (bus-voltage-unknown Bus_X87)
   (bus-voltage-unknown Bus_X103)
   (bus-voltage-unknown Bus_X84)
   (bus-voltage-unknown Bus_X88)
   (bus-voltage-unknown Bus_X60)
   (bus-voltage-unknown Bus_X111)
   (bus-voltage-unknown Bus_X63)
   (bus-voltage-unknown Bus_X80)
   (bus-voltage-unknown Bus_X10)
   (bus-voltage-unknown Bus_X46)
   (bus-voltage-unknown Bus_X81)
   (bus-voltage-unknown Bus_X86)
   (bus-voltage-unknown Bus_X100)
   (generator-status-is-unknown Generator_X82_1)
   (generator-status-is-unknown Generator_X18_1)
   (generator-status-is-unknown Generator_X20_1)

   ;; 1310180400 (2011-07-09 03:00:00):
   (matches-4 obs9999 command Breaker_X65_X66 ar_supy_control_status NON_AUTO)
   (pending obs9999)

   ;; 1310180405 (2011-07-09 03:00:05):
   (matches-3 obs10000 Breaker_X65_X66 ar_supy_control_status NON_AUTO)
   (future obs10000)
   (precedes obs10000 obs9999)
   (delay-trip-wait obs10000 obs9999)

   ;; 1310180406 (2011-07-09 03:00:06):
   (matches-3 obs10001 Line_X9_X10 entered_zero_zone KV)
   (future obs10001)
   (precedes obs10001 obs10000)

   ;; 1310180414 (2011-07-09 03:00:14):
   (matches-4 obs10002 Bus_X80 limit KV Normal)
   (future obs10002)
   (precedes obs10002 obs10001)
   (delay-trip-wait obs10002 obs10001)
   (delay-trip-wait obs10002 obs10000)

   ;; 1310180421 (2011-07-09 03:00:21):
   (matches-4 obs10003 Bus_X79 limit KV High)
   (future obs10003)
   (precedes obs10003 obs10002)
   (delay-short-time obs10003 obs10000)
   (delay-short-time obs10003 obs9999)
   (delay-trip-wait obs10003 obs10002)

   ;; 1310180421 (2011-07-09 03:00:21):
   (matches-4 obs10004 Bus_X78 limit KV High)
   (future obs10004)
   (precedes obs10004 obs10002)
   (delay-short-time obs10004 obs10000)
   (delay-short-time obs10004 obs9999)
   (delay-trip-wait obs10004 obs10002)

   ;; 1310180424 (2011-07-09 03:00:24):
   (matches-4 obs10005 command Breaker_X65_X66 cb_state open)
   (future obs10005)
   (precedes obs10005 obs10003)
   (precedes obs10005 obs10004)
   (delay-short-time obs10005 obs10001)
   (delay-trip-wait obs10005 obs10003)
   (delay-trip-wait obs10005 obs10004)

   ;; 1310180424 (2011-07-09 03:00:24):
   (matches-3 obs10006 Breaker_X65_X66 cb_state open)
   (future obs10006)
   (precedes obs10006 obs10003)
   (precedes obs10006 obs10004)
   (delay-trip-wait obs10006 obs10003)
   (delay-trip-wait obs10006 obs10004)
   (delay-short-time obs10006 obs10001)

   ;; 1310180424 (2011-07-09 03:00:24):
   (matches-4 obs10007 Bus_X60 limit KV Low)
   (future obs10007)
   (precedes obs10007 obs10003)
   (precedes obs10007 obs10004)
   (delay-trip-wait obs10007 obs10003)
   (delay-trip-wait obs10007 obs10004)
   (delay-short-time obs10007 obs10001)

   ;; 1310180424 (2011-07-09 03:00:24):
   (matches-3 obs10008 Breaker_X11_X12 cb_state open)
   (future obs10008)
   (precedes obs10008 obs10003)
   (precedes obs10008 obs10004)
   (delay-trip-wait obs10008 obs10003)
   (delay-trip-wait obs10008 obs10004)
   (delay-short-time obs10008 obs10001)

   ;; 1310180424 (2011-07-09 03:00:24):
   (matches-3 obs10009 Breaker_X33_X34 cb_state open)
   (future obs10009)
   (precedes obs10009 obs10003)
   (precedes obs10009 obs10004)
   (delay-trip-wait obs10009 obs10003)
   (delay-trip-wait obs10009 obs10004)
   (delay-short-time obs10009 obs10001)

   ;; 1310180424 (2011-07-09 03:00:24):
   (matches-3 obs10010 Breaker_X29_X30 cb_state open)
   (future obs10010)
   (precedes obs10010 obs10003)
   (precedes obs10010 obs10004)
   (delay-trip-wait obs10010 obs10003)
   (delay-trip-wait obs10010 obs10004)
   (delay-short-time obs10010 obs10001)

   ;; 1310180424 (2011-07-09 03:00:24):
   (matches-3 obs10011 Line_X45_X46 entered_zero_zone KV)
   (future obs10011)
   (precedes obs10011 obs10003)
   (precedes obs10011 obs10004)
   (delay-trip-wait obs10011 obs10003)
   (delay-trip-wait obs10011 obs10004)
   (delay-short-time obs10011 obs10001)

   ;; 1310180425 (2011-07-09 03:00:25):
   (matches-3 obs10012 Generator_X18_1 runback alarm)
   (future obs10012)
   (precedes obs10012 obs10005)
   (precedes obs10012 obs10006)
   (precedes obs10012 obs10007)
   (precedes obs10012 obs10008)
   (precedes obs10012 obs10009)
   (precedes obs10012 obs10010)
   (precedes obs10012 obs10011)

   ;; 1310180425 (2011-07-09 03:00:25):
   (matches-3 obs10013 Breaker_X39_X40 cb_state open)
   (future obs10013)
   (precedes obs10013 obs10005)
   (precedes obs10013 obs10006)
   (precedes obs10013 obs10007)
   (precedes obs10013 obs10008)
   (precedes obs10013 obs10009)
   (precedes obs10013 obs10010)
   (precedes obs10013 obs10011)

   ;; 1310180425 (2011-07-09 03:00:25):
   (matches-3 obs10014 Generator_X20_1 unit_status OFF)
   (future obs10014)
   (precedes obs10014 obs10005)
   (precedes obs10014 obs10006)
   (precedes obs10014 obs10007)
   (precedes obs10014 obs10008)
   (precedes obs10014 obs10009)
   (precedes obs10014 obs10010)
   (precedes obs10014 obs10011)

   ;; 1310180425 (2011-07-09 03:00:25):
   (matches-3 obs10015 Breaker_X23_X24 cb_state open)
   (future obs10015)
   (precedes obs10015 obs10005)
   (precedes obs10015 obs10006)
   (precedes obs10015 obs10007)
   (precedes obs10015 obs10008)
   (precedes obs10015 obs10009)
   (precedes obs10015 obs10010)
   (precedes obs10015 obs10011)

   ;; 1310180425 (2011-07-09 03:00:25):
   (matches-3 obs10016 Breaker_X3_X4 cb_state open)
   (future obs10016)
   (precedes obs10016 obs10005)
   (precedes obs10016 obs10006)
   (precedes obs10016 obs10007)
   (precedes obs10016 obs10008)
   (precedes obs10016 obs10009)
   (precedes obs10016 obs10010)
   (precedes obs10016 obs10011)

   ;; 1310180425 (2011-07-09 03:00:25):
   (matches-3 obs10017 Breaker_X41_X42 cb_state open)
   (future obs10017)
   (precedes obs10017 obs10005)
   (precedes obs10017 obs10006)
   (precedes obs10017 obs10007)
   (precedes obs10017 obs10008)
   (precedes obs10017 obs10009)
   (precedes obs10017 obs10010)
   (precedes obs10017 obs10011)

   ;; 1310180425 (2011-07-09 03:00:25):
   (matches-3 obs10018 Breaker_X53_X54 cb_state open)
   (future obs10018)
   (precedes obs10018 obs10005)
   (precedes obs10018 obs10006)
   (precedes obs10018 obs10007)
   (precedes obs10018 obs10008)
   (precedes obs10018 obs10009)
   (precedes obs10018 obs10010)
   (precedes obs10018 obs10011)

   ;; 1310180425 (2011-07-09 03:00:25):
   (matches-3 obs10019 Breaker_X57_X58 cb_state open)
   (future obs10019)
   (precedes obs10019 obs10005)
   (precedes obs10019 obs10006)
   (precedes obs10019 obs10007)
   (precedes obs10019 obs10008)
   (precedes obs10019 obs10009)
   (precedes obs10019 obs10010)
   (precedes obs10019 obs10011)

   ;; 1310180425 (2011-07-09 03:00:25):
   (matches-3 obs10020 Breaker_X55_X56 cb_state open)
   (future obs10020)
   (precedes obs10020 obs10005)
   (precedes obs10020 obs10006)
   (precedes obs10020 obs10007)
   (precedes obs10020 obs10008)
   (precedes obs10020 obs10009)
   (precedes obs10020 obs10010)
   (precedes obs10020 obs10011)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10021 Breaker_X61_X62 cb_state open)
   (future obs10021)
   (precedes obs10021 obs10012)
   (precedes obs10021 obs10013)
   (precedes obs10021 obs10014)
   (precedes obs10021 obs10015)
   (precedes obs10021 obs10016)
   (precedes obs10021 obs10017)
   (precedes obs10021 obs10018)
   (precedes obs10021 obs10019)
   (precedes obs10021 obs10020)
   (delay-trip-wait obs10021 obs10007)
   (delay-trip-wait obs10021 obs10011)
   (delay-trip-wait obs10021 obs10008)
   (delay-trip-wait obs10021 obs10010)
   (delay-trip-wait obs10021 obs10006)
   (delay-trip-wait obs10021 obs10009)
   (delay-trip-wait obs10021 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-4 obs10022 Bus_X74 limit KV Normal)
   (future obs10022)
   (precedes obs10022 obs10012)
   (precedes obs10022 obs10013)
   (precedes obs10022 obs10014)
   (precedes obs10022 obs10015)
   (precedes obs10022 obs10016)
   (precedes obs10022 obs10017)
   (precedes obs10022 obs10018)
   (precedes obs10022 obs10019)
   (precedes obs10022 obs10020)
   (delay-trip-wait obs10022 obs10007)
   (delay-trip-wait obs10022 obs10011)
   (delay-trip-wait obs10022 obs10008)
   (delay-trip-wait obs10022 obs10010)
   (delay-trip-wait obs10022 obs10006)
   (delay-trip-wait obs10022 obs10009)
   (delay-trip-wait obs10022 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10023 Breaker_X13_X14 cb_state open)
   (future obs10023)
   (precedes obs10023 obs10012)
   (precedes obs10023 obs10013)
   (precedes obs10023 obs10014)
   (precedes obs10023 obs10015)
   (precedes obs10023 obs10016)
   (precedes obs10023 obs10017)
   (precedes obs10023 obs10018)
   (precedes obs10023 obs10019)
   (precedes obs10023 obs10020)
   (delay-trip-wait obs10023 obs10007)
   (delay-trip-wait obs10023 obs10011)
   (delay-trip-wait obs10023 obs10008)
   (delay-trip-wait obs10023 obs10010)
   (delay-trip-wait obs10023 obs10006)
   (delay-trip-wait obs10023 obs10009)
   (delay-trip-wait obs10023 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10024 Breaker_X47_X48 cb_state open)
   (future obs10024)
   (precedes obs10024 obs10012)
   (precedes obs10024 obs10013)
   (precedes obs10024 obs10014)
   (precedes obs10024 obs10015)
   (precedes obs10024 obs10016)
   (precedes obs10024 obs10017)
   (precedes obs10024 obs10018)
   (precedes obs10024 obs10019)
   (precedes obs10024 obs10020)
   (delay-trip-wait obs10024 obs10007)
   (delay-trip-wait obs10024 obs10011)
   (delay-trip-wait obs10024 obs10008)
   (delay-trip-wait obs10024 obs10010)
   (delay-trip-wait obs10024 obs10006)
   (delay-trip-wait obs10024 obs10009)
   (delay-trip-wait obs10024 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-4 obs10025 Bus_X73 limit KV Normal)
   (future obs10025)
   (precedes obs10025 obs10012)
   (precedes obs10025 obs10013)
   (precedes obs10025 obs10014)
   (precedes obs10025 obs10015)
   (precedes obs10025 obs10016)
   (precedes obs10025 obs10017)
   (precedes obs10025 obs10018)
   (precedes obs10025 obs10019)
   (precedes obs10025 obs10020)
   (delay-trip-wait obs10025 obs10007)
   (delay-trip-wait obs10025 obs10011)
   (delay-trip-wait obs10025 obs10008)
   (delay-trip-wait obs10025 obs10010)
   (delay-trip-wait obs10025 obs10006)
   (delay-trip-wait obs10025 obs10009)
   (delay-trip-wait obs10025 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10026 Breaker_X19_X20 cb_state open)
   (future obs10026)
   (precedes obs10026 obs10012)
   (precedes obs10026 obs10013)
   (precedes obs10026 obs10014)
   (precedes obs10026 obs10015)
   (precedes obs10026 obs10016)
   (precedes obs10026 obs10017)
   (precedes obs10026 obs10018)
   (precedes obs10026 obs10019)
   (precedes obs10026 obs10020)
   (delay-trip-wait obs10026 obs10007)
   (delay-trip-wait obs10026 obs10011)
   (delay-trip-wait obs10026 obs10008)
   (delay-trip-wait obs10026 obs10010)
   (delay-trip-wait obs10026 obs10006)
   (delay-trip-wait obs10026 obs10009)
   (delay-trip-wait obs10026 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10027 Breaker_X59_X60 cb_state open)
   (future obs10027)
   (precedes obs10027 obs10012)
   (precedes obs10027 obs10013)
   (precedes obs10027 obs10014)
   (precedes obs10027 obs10015)
   (precedes obs10027 obs10016)
   (precedes obs10027 obs10017)
   (precedes obs10027 obs10018)
   (precedes obs10027 obs10019)
   (precedes obs10027 obs10020)
   (delay-trip-wait obs10027 obs10007)
   (delay-trip-wait obs10027 obs10011)
   (delay-trip-wait obs10027 obs10008)
   (delay-trip-wait obs10027 obs10010)
   (delay-trip-wait obs10027 obs10006)
   (delay-trip-wait obs10027 obs10009)
   (delay-trip-wait obs10027 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10028 Breaker_X27_X28 cb_state open)
   (future obs10028)
   (precedes obs10028 obs10012)
   (precedes obs10028 obs10013)
   (precedes obs10028 obs10014)
   (precedes obs10028 obs10015)
   (precedes obs10028 obs10016)
   (precedes obs10028 obs10017)
   (precedes obs10028 obs10018)
   (precedes obs10028 obs10019)
   (precedes obs10028 obs10020)
   (delay-trip-wait obs10028 obs10007)
   (delay-trip-wait obs10028 obs10011)
   (delay-trip-wait obs10028 obs10008)
   (delay-trip-wait obs10028 obs10010)
   (delay-trip-wait obs10028 obs10006)
   (delay-trip-wait obs10028 obs10009)
   (delay-trip-wait obs10028 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10029 Breaker_X25_X26 cb_state open)
   (future obs10029)
   (precedes obs10029 obs10012)
   (precedes obs10029 obs10013)
   (precedes obs10029 obs10014)
   (precedes obs10029 obs10015)
   (precedes obs10029 obs10016)
   (precedes obs10029 obs10017)
   (precedes obs10029 obs10018)
   (precedes obs10029 obs10019)
   (precedes obs10029 obs10020)
   (delay-trip-wait obs10029 obs10007)
   (delay-trip-wait obs10029 obs10011)
   (delay-trip-wait obs10029 obs10008)
   (delay-trip-wait obs10029 obs10010)
   (delay-trip-wait obs10029 obs10006)
   (delay-trip-wait obs10029 obs10009)
   (delay-trip-wait obs10029 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-4 obs10030 Bus_X75 limit KV Low)
   (future obs10030)
   (precedes obs10030 obs10012)
   (precedes obs10030 obs10013)
   (precedes obs10030 obs10014)
   (precedes obs10030 obs10015)
   (precedes obs10030 obs10016)
   (precedes obs10030 obs10017)
   (precedes obs10030 obs10018)
   (precedes obs10030 obs10019)
   (precedes obs10030 obs10020)
   (delay-trip-wait obs10030 obs10007)
   (delay-trip-wait obs10030 obs10011)
   (delay-trip-wait obs10030 obs10008)
   (delay-trip-wait obs10030 obs10010)
   (delay-trip-wait obs10030 obs10006)
   (delay-trip-wait obs10030 obs10009)
   (delay-trip-wait obs10030 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10031 Breaker_X43_X44 cb_state open)
   (future obs10031)
   (precedes obs10031 obs10012)
   (precedes obs10031 obs10013)
   (precedes obs10031 obs10014)
   (precedes obs10031 obs10015)
   (precedes obs10031 obs10016)
   (precedes obs10031 obs10017)
   (precedes obs10031 obs10018)
   (precedes obs10031 obs10019)
   (precedes obs10031 obs10020)
   (delay-trip-wait obs10031 obs10007)
   (delay-trip-wait obs10031 obs10010)
   (delay-trip-wait obs10031 obs10006)
   (delay-trip-wait obs10031 obs10011)
   (delay-trip-wait obs10031 obs10008)
   (delay-trip-wait obs10031 obs10009)
   (delay-trip-wait obs10031 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10032 Generator_X18_1 unit_status OFF)
   (future obs10032)
   (precedes obs10032 obs10012)
   (precedes obs10032 obs10013)
   (precedes obs10032 obs10014)
   (precedes obs10032 obs10015)
   (precedes obs10032 obs10016)
   (precedes obs10032 obs10017)
   (precedes obs10032 obs10018)
   (precedes obs10032 obs10019)
   (precedes obs10032 obs10020)
   (delay-trip-wait obs10032 obs10007)
   (delay-trip-wait obs10032 obs10010)
   (delay-trip-wait obs10032 obs10006)
   (delay-trip-wait obs10032 obs10011)
   (delay-trip-wait obs10032 obs10008)
   (delay-trip-wait obs10032 obs10009)
   (delay-trip-wait obs10032 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10033 Generator_X18_1 runback alarm)
   (future obs10033)
   (precedes obs10033 obs10012)
   (precedes obs10033 obs10013)
   (precedes obs10033 obs10014)
   (precedes obs10033 obs10015)
   (precedes obs10033 obs10016)
   (precedes obs10033 obs10017)
   (precedes obs10033 obs10018)
   (precedes obs10033 obs10019)
   (precedes obs10033 obs10020)
   (delay-trip-wait obs10033 obs10007)
   (delay-trip-wait obs10033 obs10010)
   (delay-trip-wait obs10033 obs10006)
   (delay-trip-wait obs10033 obs10011)
   (delay-trip-wait obs10033 obs10008)
   (delay-trip-wait obs10033 obs10009)
   (delay-trip-wait obs10033 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10034 Breaker_X17_X18 cb_state open)
   (future obs10034)
   (precedes obs10034 obs10012)
   (precedes obs10034 obs10013)
   (precedes obs10034 obs10014)
   (precedes obs10034 obs10015)
   (precedes obs10034 obs10016)
   (precedes obs10034 obs10017)
   (precedes obs10034 obs10018)
   (precedes obs10034 obs10019)
   (precedes obs10034 obs10020)
   (delay-trip-wait obs10034 obs10007)
   (delay-trip-wait obs10034 obs10010)
   (delay-trip-wait obs10034 obs10006)
   (delay-trip-wait obs10034 obs10011)
   (delay-trip-wait obs10034 obs10008)
   (delay-trip-wait obs10034 obs10009)
   (delay-trip-wait obs10034 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-4 obs10035 Bus_X77 limit KV Low)
   (future obs10035)
   (precedes obs10035 obs10012)
   (precedes obs10035 obs10013)
   (precedes obs10035 obs10014)
   (precedes obs10035 obs10015)
   (precedes obs10035 obs10016)
   (precedes obs10035 obs10017)
   (precedes obs10035 obs10018)
   (precedes obs10035 obs10019)
   (precedes obs10035 obs10020)
   (delay-trip-wait obs10035 obs10007)
   (delay-trip-wait obs10035 obs10010)
   (delay-trip-wait obs10035 obs10006)
   (delay-trip-wait obs10035 obs10011)
   (delay-trip-wait obs10035 obs10008)
   (delay-trip-wait obs10035 obs10009)
   (delay-trip-wait obs10035 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-4 obs10036 Bus_X76 limit KV Low)
   (future obs10036)
   (precedes obs10036 obs10012)
   (precedes obs10036 obs10013)
   (precedes obs10036 obs10014)
   (precedes obs10036 obs10015)
   (precedes obs10036 obs10016)
   (precedes obs10036 obs10017)
   (precedes obs10036 obs10018)
   (precedes obs10036 obs10019)
   (precedes obs10036 obs10020)
   (delay-trip-wait obs10036 obs10007)
   (delay-trip-wait obs10036 obs10010)
   (delay-trip-wait obs10036 obs10006)
   (delay-trip-wait obs10036 obs10011)
   (delay-trip-wait obs10036 obs10008)
   (delay-trip-wait obs10036 obs10009)
   (delay-trip-wait obs10036 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10037 Breaker_X67_X68 cb_state open)
   (future obs10037)
   (precedes obs10037 obs10012)
   (precedes obs10037 obs10013)
   (precedes obs10037 obs10014)
   (precedes obs10037 obs10015)
   (precedes obs10037 obs10016)
   (precedes obs10037 obs10017)
   (precedes obs10037 obs10018)
   (precedes obs10037 obs10019)
   (precedes obs10037 obs10020)
   (delay-trip-wait obs10037 obs10007)
   (delay-trip-wait obs10037 obs10010)
   (delay-trip-wait obs10037 obs10006)
   (delay-trip-wait obs10037 obs10011)
   (delay-trip-wait obs10037 obs10008)
   (delay-trip-wait obs10037 obs10009)
   (delay-trip-wait obs10037 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10038 Breaker_X37_X38 cb_state open)
   (future obs10038)
   (precedes obs10038 obs10012)
   (precedes obs10038 obs10013)
   (precedes obs10038 obs10014)
   (precedes obs10038 obs10015)
   (precedes obs10038 obs10016)
   (precedes obs10038 obs10017)
   (precedes obs10038 obs10018)
   (precedes obs10038 obs10019)
   (precedes obs10038 obs10020)
   (delay-trip-wait obs10038 obs10007)
   (delay-trip-wait obs10038 obs10010)
   (delay-trip-wait obs10038 obs10006)
   (delay-trip-wait obs10038 obs10011)
   (delay-trip-wait obs10038 obs10008)
   (delay-trip-wait obs10038 obs10009)
   (delay-trip-wait obs10038 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10039 Breaker_X15_X16 cb_state open)
   (future obs10039)
   (precedes obs10039 obs10012)
   (precedes obs10039 obs10013)
   (precedes obs10039 obs10014)
   (precedes obs10039 obs10015)
   (precedes obs10039 obs10016)
   (precedes obs10039 obs10017)
   (precedes obs10039 obs10018)
   (precedes obs10039 obs10019)
   (precedes obs10039 obs10020)
   (delay-trip-wait obs10039 obs10007)
   (delay-trip-wait obs10039 obs10010)
   (delay-trip-wait obs10039 obs10006)
   (delay-trip-wait obs10039 obs10011)
   (delay-trip-wait obs10039 obs10008)
   (delay-trip-wait obs10039 obs10009)
   (delay-trip-wait obs10039 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-4 obs10040 Bus_X81 limit KV Low)
   (future obs10040)
   (precedes obs10040 obs10012)
   (precedes obs10040 obs10013)
   (precedes obs10040 obs10014)
   (precedes obs10040 obs10015)
   (precedes obs10040 obs10016)
   (precedes obs10040 obs10017)
   (precedes obs10040 obs10018)
   (precedes obs10040 obs10019)
   (precedes obs10040 obs10020)
   (delay-trip-wait obs10040 obs10007)
   (delay-trip-wait obs10040 obs10010)
   (delay-trip-wait obs10040 obs10006)
   (delay-trip-wait obs10040 obs10011)
   (delay-trip-wait obs10040 obs10008)
   (delay-trip-wait obs10040 obs10009)
   (delay-trip-wait obs10040 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10041 Breaker_X49_X50 cb_state open)
   (future obs10041)
   (precedes obs10041 obs10012)
   (precedes obs10041 obs10013)
   (precedes obs10041 obs10014)
   (precedes obs10041 obs10015)
   (precedes obs10041 obs10016)
   (precedes obs10041 obs10017)
   (precedes obs10041 obs10018)
   (precedes obs10041 obs10019)
   (precedes obs10041 obs10020)
   (delay-trip-wait obs10041 obs10007)
   (delay-trip-wait obs10041 obs10010)
   (delay-trip-wait obs10041 obs10006)
   (delay-trip-wait obs10041 obs10011)
   (delay-trip-wait obs10041 obs10008)
   (delay-trip-wait obs10041 obs10009)
   (delay-trip-wait obs10041 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10042 Breaker_X71_X72 cb_state open)
   (future obs10042)
   (precedes obs10042 obs10012)
   (precedes obs10042 obs10013)
   (precedes obs10042 obs10014)
   (precedes obs10042 obs10015)
   (precedes obs10042 obs10016)
   (precedes obs10042 obs10017)
   (precedes obs10042 obs10018)
   (precedes obs10042 obs10019)
   (precedes obs10042 obs10020)
   (delay-trip-wait obs10042 obs10007)
   (delay-trip-wait obs10042 obs10010)
   (delay-trip-wait obs10042 obs10006)
   (delay-trip-wait obs10042 obs10011)
   (delay-trip-wait obs10042 obs10008)
   (delay-trip-wait obs10042 obs10009)
   (delay-trip-wait obs10042 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10043 Breaker_X69_X70 cb_state open)
   (future obs10043)
   (precedes obs10043 obs10012)
   (precedes obs10043 obs10013)
   (precedes obs10043 obs10014)
   (precedes obs10043 obs10015)
   (precedes obs10043 obs10016)
   (precedes obs10043 obs10017)
   (precedes obs10043 obs10018)
   (precedes obs10043 obs10019)
   (precedes obs10043 obs10020)
   (delay-trip-wait obs10043 obs10007)
   (delay-trip-wait obs10043 obs10010)
   (delay-trip-wait obs10043 obs10006)
   (delay-trip-wait obs10043 obs10011)
   (delay-trip-wait obs10043 obs10008)
   (delay-trip-wait obs10043 obs10009)
   (delay-trip-wait obs10043 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10044 Breaker_X51_X52 cb_state open)
   (future obs10044)
   (precedes obs10044 obs10012)
   (precedes obs10044 obs10013)
   (precedes obs10044 obs10014)
   (precedes obs10044 obs10015)
   (precedes obs10044 obs10016)
   (precedes obs10044 obs10017)
   (precedes obs10044 obs10018)
   (precedes obs10044 obs10019)
   (precedes obs10044 obs10020)
   (delay-trip-wait obs10044 obs10007)
   (delay-trip-wait obs10044 obs10010)
   (delay-trip-wait obs10044 obs10006)
   (delay-trip-wait obs10044 obs10011)
   (delay-trip-wait obs10044 obs10008)
   (delay-trip-wait obs10044 obs10009)
   (delay-trip-wait obs10044 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10045 Breaker_X7_X8 cb_state open)
   (future obs10045)
   (precedes obs10045 obs10012)
   (precedes obs10045 obs10013)
   (precedes obs10045 obs10014)
   (precedes obs10045 obs10015)
   (precedes obs10045 obs10016)
   (precedes obs10045 obs10017)
   (precedes obs10045 obs10018)
   (precedes obs10045 obs10019)
   (precedes obs10045 obs10020)
   (delay-trip-wait obs10045 obs10007)
   (delay-trip-wait obs10045 obs10010)
   (delay-trip-wait obs10045 obs10006)
   (delay-trip-wait obs10045 obs10011)
   (delay-trip-wait obs10045 obs10008)
   (delay-trip-wait obs10045 obs10009)
   (delay-trip-wait obs10045 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10046 Breaker_X1_X2 cb_state open)
   (future obs10046)
   (precedes obs10046 obs10012)
   (precedes obs10046 obs10013)
   (precedes obs10046 obs10014)
   (precedes obs10046 obs10015)
   (precedes obs10046 obs10016)
   (precedes obs10046 obs10017)
   (precedes obs10046 obs10018)
   (precedes obs10046 obs10019)
   (precedes obs10046 obs10020)
   (delay-trip-wait obs10046 obs10007)
   (delay-trip-wait obs10046 obs10010)
   (delay-trip-wait obs10046 obs10006)
   (delay-trip-wait obs10046 obs10011)
   (delay-trip-wait obs10046 obs10008)
   (delay-trip-wait obs10046 obs10009)
   (delay-trip-wait obs10046 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10047 Breaker_X35_X36 cb_state open)
   (future obs10047)
   (precedes obs10047 obs10012)
   (precedes obs10047 obs10013)
   (precedes obs10047 obs10014)
   (precedes obs10047 obs10015)
   (precedes obs10047 obs10016)
   (precedes obs10047 obs10017)
   (precedes obs10047 obs10018)
   (precedes obs10047 obs10019)
   (precedes obs10047 obs10020)
   (delay-trip-wait obs10047 obs10007)
   (delay-trip-wait obs10047 obs10010)
   (delay-trip-wait obs10047 obs10006)
   (delay-trip-wait obs10047 obs10011)
   (delay-trip-wait obs10047 obs10008)
   (delay-trip-wait obs10047 obs10009)
   (delay-trip-wait obs10047 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10048 Generator_X18_1 unit_status OFF)
   (future obs10048)
   (precedes obs10048 obs10012)
   (precedes obs10048 obs10013)
   (precedes obs10048 obs10014)
   (precedes obs10048 obs10015)
   (precedes obs10048 obs10016)
   (precedes obs10048 obs10017)
   (precedes obs10048 obs10018)
   (precedes obs10048 obs10019)
   (precedes obs10048 obs10020)
   (delay-trip-wait obs10048 obs10007)
   (delay-trip-wait obs10048 obs10010)
   (delay-trip-wait obs10048 obs10006)
   (delay-trip-wait obs10048 obs10011)
   (delay-trip-wait obs10048 obs10008)
   (delay-trip-wait obs10048 obs10009)
   (delay-trip-wait obs10048 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10049 Line_X63_X64 entered_zero_zone KV)
   (future obs10049)
   (precedes obs10049 obs10012)
   (precedes obs10049 obs10013)
   (precedes obs10049 obs10014)
   (precedes obs10049 obs10015)
   (precedes obs10049 obs10016)
   (precedes obs10049 obs10017)
   (precedes obs10049 obs10018)
   (precedes obs10049 obs10019)
   (precedes obs10049 obs10020)
   (delay-trip-wait obs10049 obs10007)
   (delay-trip-wait obs10049 obs10010)
   (delay-trip-wait obs10049 obs10006)
   (delay-trip-wait obs10049 obs10011)
   (delay-trip-wait obs10049 obs10008)
   (delay-trip-wait obs10049 obs10009)
   (delay-trip-wait obs10049 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10050 Generator_X20_1 runback alarm)
   (future obs10050)
   (precedes obs10050 obs10012)
   (precedes obs10050 obs10013)
   (precedes obs10050 obs10014)
   (precedes obs10050 obs10015)
   (precedes obs10050 obs10016)
   (precedes obs10050 obs10017)
   (precedes obs10050 obs10018)
   (precedes obs10050 obs10019)
   (precedes obs10050 obs10020)
   (delay-trip-wait obs10050 obs10007)
   (delay-trip-wait obs10050 obs10010)
   (delay-trip-wait obs10050 obs10006)
   (delay-trip-wait obs10050 obs10011)
   (delay-trip-wait obs10050 obs10008)
   (delay-trip-wait obs10050 obs10009)
   (delay-trip-wait obs10050 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10051 Generator_X20_1 runback reset)
   (future obs10051)
   (precedes obs10051 obs10012)
   (precedes obs10051 obs10013)
   (precedes obs10051 obs10014)
   (precedes obs10051 obs10015)
   (precedes obs10051 obs10016)
   (precedes obs10051 obs10017)
   (precedes obs10051 obs10018)
   (precedes obs10051 obs10019)
   (precedes obs10051 obs10020)
   (delay-trip-wait obs10051 obs10007)
   (delay-trip-wait obs10051 obs10010)
   (delay-trip-wait obs10051 obs10006)
   (delay-trip-wait obs10051 obs10011)
   (delay-trip-wait obs10051 obs10008)
   (delay-trip-wait obs10051 obs10009)
   (delay-trip-wait obs10051 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10052 Breaker_X5_X6 cb_state open)
   (future obs10052)
   (precedes obs10052 obs10012)
   (precedes obs10052 obs10013)
   (precedes obs10052 obs10014)
   (precedes obs10052 obs10015)
   (precedes obs10052 obs10016)
   (precedes obs10052 obs10017)
   (precedes obs10052 obs10018)
   (precedes obs10052 obs10019)
   (precedes obs10052 obs10020)
   (delay-trip-wait obs10052 obs10007)
   (delay-trip-wait obs10052 obs10010)
   (delay-trip-wait obs10052 obs10006)
   (delay-trip-wait obs10052 obs10011)
   (delay-trip-wait obs10052 obs10008)
   (delay-trip-wait obs10052 obs10009)
   (delay-trip-wait obs10052 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10053 Generator_X18_1 runback alarm)
   (future obs10053)
   (precedes obs10053 obs10012)
   (precedes obs10053 obs10013)
   (precedes obs10053 obs10014)
   (precedes obs10053 obs10015)
   (precedes obs10053 obs10016)
   (precedes obs10053 obs10017)
   (precedes obs10053 obs10018)
   (precedes obs10053 obs10019)
   (precedes obs10053 obs10020)
   (delay-trip-wait obs10053 obs10007)
   (delay-trip-wait obs10053 obs10010)
   (delay-trip-wait obs10053 obs10006)
   (delay-trip-wait obs10053 obs10011)
   (delay-trip-wait obs10053 obs10008)
   (delay-trip-wait obs10053 obs10009)
   (delay-trip-wait obs10053 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10054 Breaker_X21_X22 cb_state open)
   (future obs10054)
   (precedes obs10054 obs10012)
   (precedes obs10054 obs10013)
   (precedes obs10054 obs10014)
   (precedes obs10054 obs10015)
   (precedes obs10054 obs10016)
   (precedes obs10054 obs10017)
   (precedes obs10054 obs10018)
   (precedes obs10054 obs10019)
   (precedes obs10054 obs10020)
   (delay-trip-wait obs10054 obs10007)
   (delay-trip-wait obs10054 obs10010)
   (delay-trip-wait obs10054 obs10006)
   (delay-trip-wait obs10054 obs10011)
   (delay-trip-wait obs10054 obs10008)
   (delay-trip-wait obs10054 obs10009)
   (delay-trip-wait obs10054 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10055 Generator_X82_1 runback alarm)
   (future obs10055)
   (precedes obs10055 obs10012)
   (precedes obs10055 obs10013)
   (precedes obs10055 obs10014)
   (precedes obs10055 obs10015)
   (precedes obs10055 obs10016)
   (precedes obs10055 obs10017)
   (precedes obs10055 obs10018)
   (precedes obs10055 obs10019)
   (precedes obs10055 obs10020)
   (delay-trip-wait obs10055 obs10007)
   (delay-trip-wait obs10055 obs10010)
   (delay-trip-wait obs10055 obs10006)
   (delay-trip-wait obs10055 obs10011)
   (delay-trip-wait obs10055 obs10008)
   (delay-trip-wait obs10055 obs10009)
   (delay-trip-wait obs10055 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10056 Generator_X20_1 unit_status OFF)
   (future obs10056)
   (precedes obs10056 obs10012)
   (precedes obs10056 obs10013)
   (precedes obs10056 obs10014)
   (precedes obs10056 obs10015)
   (precedes obs10056 obs10016)
   (precedes obs10056 obs10017)
   (precedes obs10056 obs10018)
   (precedes obs10056 obs10019)
   (precedes obs10056 obs10020)
   (delay-trip-wait obs10056 obs10007)
   (delay-trip-wait obs10056 obs10010)
   (delay-trip-wait obs10056 obs10006)
   (delay-trip-wait obs10056 obs10011)
   (delay-trip-wait obs10056 obs10008)
   (delay-trip-wait obs10056 obs10009)
   (delay-trip-wait obs10056 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10057 Breaker_X31_X32 cb_state open)
   (future obs10057)
   (precedes obs10057 obs10012)
   (precedes obs10057 obs10013)
   (precedes obs10057 obs10014)
   (precedes obs10057 obs10015)
   (precedes obs10057 obs10016)
   (precedes obs10057 obs10017)
   (precedes obs10057 obs10018)
   (precedes obs10057 obs10019)
   (precedes obs10057 obs10020)
   (delay-trip-wait obs10057 obs10007)
   (delay-trip-wait obs10057 obs10010)
   (delay-trip-wait obs10057 obs10006)
   (delay-trip-wait obs10057 obs10011)
   (delay-trip-wait obs10057 obs10008)
   (delay-trip-wait obs10057 obs10009)
   (delay-trip-wait obs10057 obs10005)

   ;; 1310180426 (2011-07-09 03:00:26):
   (matches-3 obs10058 Bus_X18 entered_zero_zone MW)
   (future obs10058)
   (precedes obs10058 obs10012)
   (precedes obs10058 obs10013)
   (precedes obs10058 obs10014)
   (precedes obs10058 obs10015)
   (precedes obs10058 obs10016)
   (precedes obs10058 obs10017)
   (precedes obs10058 obs10018)
   (precedes obs10058 obs10019)
   (precedes obs10058 obs10020)
   (delay-trip-wait obs10058 obs10007)
   (delay-trip-wait obs10058 obs10010)
   (delay-trip-wait obs10058 obs10006)
   (delay-trip-wait obs10058 obs10011)
   (delay-trip-wait obs10058 obs10008)
   (delay-trip-wait obs10058 obs10009)
   (delay-trip-wait obs10058 obs10005)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs9999)
              (observed obs10000)
              (observed obs10001)
              (observed obs10002)
              (observed obs10003)
              (observed obs10004)
              (observed obs10005)
              (observed obs10006)
              (observed obs10007)
              (observed obs10008)
              (observed obs10009)
              (observed obs10010)
              (observed obs10011)
              (observed obs10012)
              (observed obs10013)
              (observed obs10014)
              (observed obs10015)
              (observed obs10016)
              (observed obs10017)
              (observed obs10018)
              (observed obs10019)
              (observed obs10020)
              (observed obs10021)
              (observed obs10022)
              (observed obs10023)
              (observed obs10024)
              (observed obs10025)
              (observed obs10026)
              (observed obs10027)
              (observed obs10028)
              (observed obs10029)
              (observed obs10030)
              (observed obs10031)
              (observed obs10032)
              (observed obs10033)
              (observed obs10034)
              (observed obs10035)
              (observed obs10036)
              (observed obs10037)
              (observed obs10038)
              (observed obs10039)
              (observed obs10040)
              (observed obs10041)
              (observed obs10042)
              (observed obs10043)
              (observed obs10044)
              (observed obs10045)
              (observed obs10046)
              (observed obs10047)
              (observed obs10048)
              (observed obs10049)
              (observed obs10050)
              (observed obs10051)
              (observed obs10052)
              (observed obs10053)
              (observed obs10054)
              (observed obs10055)
              (observed obs10056)
              (observed obs10057)
              (observed obs10058)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.632 (cpu) 1.699 (real)
