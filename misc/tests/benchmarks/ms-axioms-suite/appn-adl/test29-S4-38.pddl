;; from 2011-07-02 13:00:00 to 2011-07-02 14:00:00: 60 observations (56 alarms), 101 components
(define (problem network)
  (:domain APPN)

  (:objects
   Breaker_X1_X2 - Breaker
   Breaker_X3_X4 - Breaker
   Breaker_X5_X6 - Breaker
   Breaker_X7_X8 - Breaker
   Breaker_X9_X10 - Breaker
   Breaker_X11_X12 - Breaker
   Line_X13_X14 - Line
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
   Breaker_X45_X46 - Breaker
   Breaker_X47_X48 - Breaker
   Breaker_X49_X50 - Breaker
   Breaker_X51_X52 - Breaker
   Breaker_X53_X54 - Breaker
   Breaker_X55_X56 - Breaker
   Breaker_X57_X58 - Breaker
   Breaker_X59_X60 - Breaker
   Breaker_X61_X62 - Breaker
   Breaker_X63_X64 - Breaker
   Breaker_X65_X66 - Breaker
   Breaker_X67_X68 - Breaker
   Breaker_X69_X70 - Breaker
   Breaker_X71_X72 - Breaker
   Breaker_X73_X74 - Breaker
   Bus_X75 - bus
   Bus_X76 - bus
   Bus_X77 - bus
   Bus_X78 - bus
   Bus_X79 - bus
   Bus_X80 - bus
   Bus_X81 - bus
   Bus_X82 - bus
   Bus_X83 - bus
   Bus_X84 - bus
   Generator_X85_1 - generator
   Generator_X86_1 - generator
   Generator_X87_1 - generator
   Generator_X26_1 - generator
   Generator_X76_1 - generator
   Generator_X88_1 - generator
   Line_X89_X90 - Line
   Line_X91_X92 - Line
   Line_X93_X94 - Line
   Line_X95_X96 - Line
   Line_X97_X98 - Line
   Line_X99_X100 - Line
   Line_X101_X102 - Line
   Line_X103_X104 - Line
   Breaker_X105_X106 - Breaker
   Breaker_X107_X108 - Breaker
   Breaker_X109_X110 - Breaker
   Breaker_X111_X112 - Breaker
   Breaker_X113_X114 - Breaker
   Breaker_X115_X116 - Breaker
   Breaker_X117_X118 - Breaker
   Breaker_X119_X120 - Breaker
   Breaker_X121_X122 - Breaker
   Breaker_X123_X124 - Breaker
   Breaker_X125_X126 - Breaker
   Breaker_X127_X128 - Breaker
   Bus_X13 - bus
   Bus_X89 - bus
   Bus_X91 - bus
   Bus_X93 - bus
   Bus_X95 - bus
   Bus_X97 - bus
   Bus_X99 - bus
   Bus_X101 - bus
   Bus_X103 - bus
   Bus_X14 - bus
   Bus_X90 - bus
   Bus_X92 - bus
   Bus_X94 - bus
   Bus_X96 - bus
   Bus_X98 - bus
   Bus_X100 - bus
   Bus_X102 - bus
   Bus_X104 - bus
   Breaker_X129_X85 - Breaker
   Breaker_X130_X86 - Breaker
   Breaker_X131_X87 - Breaker
   Breaker_X132_X76 - Breaker
   Breaker_X133_X88 - Breaker
   Bus_X85 - bus
   Bus_X86 - bus
   Bus_X87 - bus
   Bus_X26 - bus
   Bus_X88 - bus
   obs1932 - observation
   obs1933 - observation
   obs1934 - observation
   obs1935 - observation
   obs1936 - observation
   obs1937 - observation
   obs1938 - observation
   obs1939 - observation
   obs1940 - observation
   obs1941 - observation
   obs1942 - observation
   obs1943 - observation
   obs1944 - observation
   obs1945 - observation
   obs1946 - observation
   obs1947 - observation
   obs1948 - observation
   obs1949 - observation
   obs1950 - observation
   obs1951 - observation
   obs1952 - observation
   obs1953 - observation
   obs1954 - observation
   obs1955 - observation
   obs1956 - observation
   obs1957 - observation
   obs1958 - observation
   obs1959 - observation
   obs1960 - observation
   obs1961 - observation
   obs1962 - observation
   obs1963 - observation
   obs1964 - observation
   obs1965 - observation
   obs1966 - observation
   obs1967 - observation
   obs1968 - observation
   obs1969 - observation
   obs1970 - observation
   obs1971 - observation
   obs1972 - observation
   obs1973 - observation
   obs1974 - observation
   obs1975 - observation
   obs1976 - observation
   obs1977 - observation
   obs1978 - observation
   obs1979 - observation
   obs1980 - observation
   obs1981 - observation
   obs1982 - observation
   obs1983 - observation
   obs1984 - observation
   obs1985 - observation
   obs1986 - observation
   obs1987 - observation
   obs1988 - observation
   obs1989 - observation
   obs1990 - observation
   obs1991 - observation
   )

  (:init
   (static-true)
   (line-isolators-2 Line_X89_X90 Breaker_X67_X68 Breaker_X47_X48)
   (line-isolator Breaker_X67_X68 Line_X89_X90)
   (line-isolator Breaker_X47_X48 Line_X89_X90)
   (line-isolators-4 Line_X13_X14 Breaker_X105_X106 Breaker_X113_X114 Breaker_X119_X120 Breaker_X69_X70)
   (line-isolator Breaker_X105_X106 Line_X13_X14)
   (line-isolator Breaker_X113_X114 Line_X13_X14)
   (line-isolator Breaker_X119_X120 Line_X13_X14)
   (line-isolator Breaker_X69_X70 Line_X13_X14)
   (line-isolators-4 Line_X91_X92 Breaker_X107_X108 Breaker_X115_X116 Breaker_X121_X122 Breaker_X15_X16)
   (line-isolator Breaker_X107_X108 Line_X91_X92)
   (line-isolator Breaker_X115_X116 Line_X91_X92)
   (line-isolator Breaker_X121_X122 Line_X91_X92)
   (line-isolator Breaker_X15_X16 Line_X91_X92)
   (line-isolators-4 Line_X93_X94 Breaker_X17_X18 Breaker_X21_X22 Breaker_X123_X124 Breaker_X125_X126)
   (line-isolator Breaker_X17_X18 Line_X93_X94)
   (line-isolator Breaker_X21_X22 Line_X93_X94)
   (line-isolator Breaker_X123_X124 Line_X93_X94)
   (line-isolator Breaker_X125_X126 Line_X93_X94)
   (line-isolators-4 Line_X95_X96 Breaker_X109_X110 Breaker_X117_X118 Breaker_X19_X20 Breaker_X127_X128)
   (line-isolator Breaker_X109_X110 Line_X95_X96)
   (line-isolator Breaker_X117_X118 Line_X95_X96)
   (line-isolator Breaker_X19_X20 Line_X95_X96)
   (line-isolator Breaker_X127_X128 Line_X95_X96)
   (line-isolators-4 Line_X97_X98 Breaker_X35_X36 Breaker_X39_X40 Breaker_X7_X8 Breaker_X5_X6)
   (line-isolator Breaker_X35_X36 Line_X97_X98)
   (line-isolator Breaker_X39_X40 Line_X97_X98)
   (line-isolator Breaker_X7_X8 Line_X97_X98)
   (line-isolator Breaker_X5_X6 Line_X97_X98)
   (line-isolators-4 Line_X99_X100 Breaker_X37_X38 Breaker_X41_X42 Breaker_X9_X10 Breaker_X11_X12)
   (line-isolator Breaker_X37_X38 Line_X99_X100)
   (line-isolator Breaker_X41_X42 Line_X99_X100)
   (line-isolator Breaker_X9_X10 Line_X99_X100)
   (line-isolator Breaker_X11_X12 Line_X99_X100)
   (line-isolators-4 Line_X101_X102 Breaker_X111_X112 Breaker_X63_X64 Breaker_X45_X46 Breaker_X27_X28)
   (line-isolator Breaker_X111_X112 Line_X101_X102)
   (line-isolator Breaker_X63_X64 Line_X101_X102)
   (line-isolator Breaker_X45_X46 Line_X101_X102)
   (line-isolator Breaker_X27_X28 Line_X101_X102)
   (line-isolators-4 Line_X103_X104 Breaker_X43_X44 Breaker_X31_X32 Breaker_X73_X74 Breaker_X71_X72)
   (line-isolator Breaker_X43_X44 Line_X103_X104)
   (line-isolator Breaker_X31_X32 Line_X103_X104)
   (line-isolator Breaker_X73_X74 Line_X103_X104)
   (line-isolator Breaker_X71_X72 Line_X103_X104)
   (adjacent Line_X13_X14 Bus_X13)
   (adjacent Line_X13_X14 Bus_X14)
   (adjacent Line_X89_X90 Bus_X89)
   (adjacent Line_X89_X90 Bus_X90)
   (adjacent Line_X91_X92 Bus_X91)
   (adjacent Line_X91_X92 Bus_X92)
   (adjacent Line_X93_X94 Bus_X93)
   (adjacent Line_X93_X94 Bus_X94)
   (adjacent Line_X95_X96 Bus_X95)
   (adjacent Line_X95_X96 Bus_X96)
   (adjacent Line_X97_X98 Bus_X97)
   (adjacent Line_X97_X98 Bus_X98)
   (adjacent Line_X99_X100 Bus_X99)
   (adjacent Line_X99_X100 Bus_X100)
   (adjacent Line_X101_X102 Bus_X101)
   (adjacent Line_X101_X102 Bus_X102)
   (adjacent Line_X103_X104 Bus_X103)
   (adjacent Line_X103_X104 Bus_X104)
   (generator-attached-to Generator_X85_1 Bus_X85)
   (generator-attached-to Generator_X86_1 Bus_X86)
   (generator-attached-to Generator_X87_1 Bus_X87)
   (generator-attached-to Generator_X26_1 Bus_X26)
   (generator-attached-to Generator_X76_1 Bus_X76)
   (generator-attached-to Generator_X88_1 Bus_X88)
   (generator-isolator Breaker_X129_X85 Bus_X85)
   (generator-isolator Breaker_X130_X86 Bus_X86)
   (generator-isolator Breaker_X131_X87 Bus_X87)
   (generator-isolator Breaker_X25_X26 Bus_X26)
   (generator-isolator Breaker_X132_X76 Bus_X76)
   (generator-isolator Breaker_X133_X88 Bus_X88)
   (breaker-state-is-unknown Breaker_X1_X2)
   (breaker-ar-status-is-unknown Breaker_X1_X2)
   (breaker-state-is-unknown Breaker_X3_X4)
   (breaker-ar-status-is-unknown Breaker_X3_X4)
   (breaker-state-is-unknown Breaker_X5_X6)
   (breaker-ar-status-is-unknown Breaker_X5_X6)
   (breaker-state-is-unknown Breaker_X7_X8)
   (breaker-ar-status-is-unknown Breaker_X7_X8)
   (breaker-state-is-unknown Breaker_X9_X10)
   (breaker-ar-status-is-unknown Breaker_X9_X10)
   (breaker-state-is-unknown Breaker_X11_X12)
   (breaker-ar-status-is-unknown Breaker_X11_X12)
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
   (breaker-state-is-unknown Breaker_X45_X46)
   (breaker-ar-status-is-unknown Breaker_X45_X46)
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
   (breaker-state-is-unknown Breaker_X63_X64)
   (breaker-ar-status-is-unknown Breaker_X63_X64)
   (breaker-state-is-unknown Breaker_X65_X66)
   (breaker-ar-status-is-unknown Breaker_X65_X66)
   (breaker-state-is-unknown Breaker_X67_X68)
   (breaker-ar-status-is-unknown Breaker_X67_X68)
   (breaker-state-is-unknown Breaker_X69_X70)
   (breaker-ar-status-is-unknown Breaker_X69_X70)
   (breaker-state-is-unknown Breaker_X71_X72)
   (breaker-ar-status-is-unknown Breaker_X71_X72)
   (breaker-state-is-unknown Breaker_X73_X74)
   (breaker-ar-status-is-unknown Breaker_X73_X74)
   (breaker-state-is-unknown Breaker_X105_X106)
   (breaker-ar-status-is-unknown Breaker_X105_X106)
   (breaker-state-is-unknown Breaker_X107_X108)
   (breaker-ar-status-is-unknown Breaker_X107_X108)
   (breaker-state-is-unknown Breaker_X109_X110)
   (breaker-ar-status-is-unknown Breaker_X109_X110)
   (breaker-state-is-unknown Breaker_X111_X112)
   (breaker-ar-status-is-unknown Breaker_X111_X112)
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
   (breaker-state-is-unknown Breaker_X129_X85)
   (breaker-ar-status-is-unknown Breaker_X129_X85)
   (breaker-state-is-unknown Breaker_X130_X86)
   (breaker-ar-status-is-unknown Breaker_X130_X86)
   (breaker-state-is-unknown Breaker_X131_X87)
   (breaker-ar-status-is-unknown Breaker_X131_X87)
   (breaker-state-is-unknown Breaker_X132_X76)
   (breaker-ar-status-is-unknown Breaker_X132_X76)
   (breaker-state-is-unknown Breaker_X133_X88)
   (breaker-ar-status-is-unknown Breaker_X133_X88)
   (line-voltage-unknown Line_X13_X14)
   (line-voltage-unknown Line_X89_X90)
   (line-voltage-unknown Line_X91_X92)
   (line-voltage-unknown Line_X93_X94)
   (line-voltage-unknown Line_X95_X96)
   (line-voltage-unknown Line_X97_X98)
   (line-voltage-unknown Line_X99_X100)
   (line-voltage-unknown Line_X101_X102)
   (line-voltage-unknown Line_X103_X104)
   (bus-voltage-unknown Bus_X91)
   (bus-voltage-unknown Bus_X75)
   (bus-voltage-unknown Bus_X98)
   (bus-voltage-unknown Bus_X100)
   (bus-voltage-unknown Bus_X85)
   (bus-voltage-unknown Bus_X86)
   (bus-voltage-unknown Bus_X13)
   (bus-voltage-unknown Bus_X92)
   (bus-voltage-unknown Bus_X93)
   (bus-voltage-unknown Bus_X96)
   (bus-voltage-unknown Bus_X87)
   (bus-voltage-unknown Bus_X26)
   (bus-voltage-unknown Bus_X76)
   (bus-voltage-unknown Bus_X77)
   (bus-voltage-unknown Bus_X95)
   (bus-voltage-unknown Bus_X97)
   (bus-voltage-unknown Bus_X99)
   (bus-voltage-unknown Bus_X78)
   (bus-voltage-unknown Bus_X103)
   (bus-voltage-unknown Bus_X102)
   (bus-voltage-unknown Bus_X94)
   (bus-voltage-unknown Bus_X90)
   (bus-voltage-unknown Bus_X79)
   (bus-voltage-unknown Bus_X80)
   (bus-voltage-unknown Bus_X81)
   (bus-voltage-unknown Bus_X82)
   (bus-voltage-unknown Bus_X83)
   (bus-voltage-unknown Bus_X101)
   (bus-voltage-unknown Bus_X89)
   (bus-voltage-unknown Bus_X104)
   (bus-voltage-unknown Bus_X14)
   (bus-voltage-unknown Bus_X88)
   (bus-voltage-unknown Bus_X84)
   (generator-status-is-unknown Generator_X85_1)
   (generator-status-is-unknown Generator_X86_1)
   (generator-status-is-unknown Generator_X87_1)
   (generator-status-is-unknown Generator_X26_1)
   (generator-status-is-unknown Generator_X76_1)
   (generator-status-is-unknown Generator_X88_1)

   ;; 1309611600 (2011-07-02 13:00:00):
   (matches-4 obs1932 command Breaker_X41_X42 cb_state closed)
   (pending obs1932)

   ;; 1309611605 (2011-07-02 13:00:05):
   (matches-3 obs1933 Breaker_X41_X42 cb_state closed)
   (future obs1933)
   (precedes obs1933 obs1932)
   (delay-trip-wait obs1933 obs1932)

   ;; 1309611609 (2011-07-02 13:00:09):
   (matches-4 obs1934 command Breaker_X37_X38 cb_state closed)
   (future obs1934)
   (precedes obs1934 obs1933)
   (delay-trip-wait obs1934 obs1933)

   ;; 1309611618 (2011-07-02 13:00:18):
   (matches-3 obs1935 Breaker_X9_X10 cb_state closed)
   (future obs1935)
   (precedes obs1935 obs1934)
   (delay-trip-wait obs1935 obs1934)
   (delay-short-time obs1935 obs1932)

   ;; 1309611628 (2011-07-02 13:00:28):
   (matches-4 obs1936 command Breaker_X11_X12 cb_state closed)
   (future obs1936)
   (precedes obs1936 obs1935)
   (delay-short-time obs1936 obs1934)
   (delay-trip-wait obs1936 obs1935)
   (delay-short-time obs1936 obs1933)

   ;; 1309611628 (2011-07-02 13:00:28):
   (matches-3 obs1937 Breaker_X11_X12 cb_state closed)
   (future obs1937)
   (precedes obs1937 obs1935)
   (delay-short-time obs1937 obs1934)
   (delay-trip-wait obs1937 obs1935)
   (delay-short-time obs1937 obs1933)

   ;; 1309611636 (2011-07-02 13:00:36):
   (matches-3 obs1938 Generator_X86_1 runback reset)
   (future obs1938)
   (precedes obs1938 obs1936)
   (precedes obs1938 obs1937)
   (delay-trip-wait obs1938 obs1937)
   (delay-short-time obs1938 obs1935)
   (delay-trip-wait obs1938 obs1936)

   ;; 1309611640 (2011-07-02 13:00:40):
   (matches-3 obs1939 Breaker_X39_X40 cb_state closed)
   (future obs1939)
   (precedes obs1939 obs1938)
   (delay-trip-wait obs1939 obs1938)

   ;; 1309611649 (2011-07-02 13:00:49):
   (matches-3 obs1940 Generator_X76_1 runback reset)
   (future obs1940)
   (precedes obs1940 obs1939)
   (delay-rc-wait obs1940 obs1932)
   (delay-trip-wait obs1940 obs1939)
   (delay-short-time obs1940 obs1937)
   (delay-short-time obs1940 obs1936)

   ;; 1309611649 (2011-07-02 13:00:49):
   (matches-3 obs1941 Generator_X26_1 runback reset)
   (future obs1941)
   (precedes obs1941 obs1939)
   (delay-trip-wait obs1941 obs1939)
   (delay-short-time obs1941 obs1937)
   (delay-short-time obs1941 obs1936)

   ;; 1309611650 (2011-07-02 13:00:50):
   (matches-3 obs1942 Generator_X85_1 runback reset)
   (future obs1942)
   (precedes obs1942 obs1940)
   (precedes obs1942 obs1941)

   ;; 1309611651 (2011-07-02 13:00:51):
   (matches-3 obs1943 Generator_X76_1 unit_status OFF)
   (future obs1943)
   (precedes obs1943 obs1942)
   (delay-trip-wait obs1943 obs1941)
   (delay-trip-wait obs1943 obs1940)

   ;; 1309611652 (2011-07-02 13:00:52):
   (matches-3 obs1944 Generator_X76_1 runback reset)
   (future obs1944)
   (precedes obs1944 obs1943)
   (delay-short-time obs1944 obs1938)
   (delay-trip-wait obs1944 obs1942)

   ;; 1309611652 (2011-07-02 13:00:52):
   (matches-3 obs1945 Breaker_X33_X34 cb_state open)
   (future obs1945)
   (precedes obs1945 obs1943)
   (delay-short-time obs1945 obs1938)
   (delay-trip-wait obs1945 obs1942)

   ;; 1309611652 (2011-07-02 13:00:52):
   (matches-3 obs1946 Breaker_X31_X32 cb_state open)
   (future obs1946)
   (precedes obs1946 obs1943)
   (delay-short-time obs1946 obs1938)
   (delay-trip-wait obs1946 obs1942)

   ;; 1309611652 (2011-07-02 13:00:52):
   (matches-3 obs1947 Breaker_X71_X72 cb_state open)
   (future obs1947)
   (precedes obs1947 obs1943)
   (delay-short-time obs1947 obs1938)
   (delay-trip-wait obs1947 obs1942)

   ;; 1309611652 (2011-07-02 13:00:52):
   (matches-3 obs1948 Breaker_X35_X36 cb_state open)
   (future obs1948)
   (precedes obs1948 obs1943)
   (delay-short-time obs1948 obs1938)
   (delay-trip-wait obs1948 obs1942)

   ;; 1309611652 (2011-07-02 13:00:52):
   (matches-3 obs1949 Breaker_X7_X8 cb_state open)
   (future obs1949)
   (precedes obs1949 obs1943)
   (delay-short-time obs1949 obs1938)
   (delay-trip-wait obs1949 obs1942)

   ;; 1309611652 (2011-07-02 13:00:52):
   (matches-3 obs1950 Breaker_X73_X74 cb_state open)
   (future obs1950)
   (precedes obs1950 obs1943)
   (delay-short-time obs1950 obs1938)
   (delay-trip-wait obs1950 obs1942)

   ;; 1309611652 (2011-07-02 13:00:52):
   (matches-3 obs1951 Breaker_X43_X44 cb_state open)
   (future obs1951)
   (precedes obs1951 obs1943)
   (delay-short-time obs1951 obs1938)
   (delay-trip-wait obs1951 obs1942)

   ;; 1309611652 (2011-07-02 13:00:52):
   (matches-4 obs1952 Bus_X82 limit KV Low)
   (future obs1952)
   (precedes obs1952 obs1943)
   (delay-short-time obs1952 obs1938)
   (delay-trip-wait obs1952 obs1942)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1953 Breaker_X69_X70 cb_state open)
   (future obs1953)
   (precedes obs1953 obs1944)
   (precedes obs1953 obs1945)
   (precedes obs1953 obs1946)
   (precedes obs1953 obs1947)
   (precedes obs1953 obs1948)
   (precedes obs1953 obs1949)
   (precedes obs1953 obs1950)
   (precedes obs1953 obs1951)
   (precedes obs1953 obs1952)
   (delay-trip-wait obs1953 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1954 Bus_X76 entered_zero_zone MW)
   (future obs1954)
   (precedes obs1954 obs1944)
   (precedes obs1954 obs1945)
   (precedes obs1954 obs1946)
   (precedes obs1954 obs1947)
   (precedes obs1954 obs1948)
   (precedes obs1954 obs1949)
   (precedes obs1954 obs1950)
   (precedes obs1954 obs1951)
   (precedes obs1954 obs1952)
   (delay-trip-wait obs1954 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1955 Breaker_X3_X4 cb_state open)
   (future obs1955)
   (precedes obs1955 obs1944)
   (precedes obs1955 obs1945)
   (precedes obs1955 obs1946)
   (precedes obs1955 obs1947)
   (precedes obs1955 obs1948)
   (precedes obs1955 obs1949)
   (precedes obs1955 obs1950)
   (precedes obs1955 obs1951)
   (precedes obs1955 obs1952)
   (delay-trip-wait obs1955 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1956 Generator_X88_1 unit_status OFF)
   (future obs1956)
   (precedes obs1956 obs1944)
   (precedes obs1956 obs1945)
   (precedes obs1956 obs1946)
   (precedes obs1956 obs1947)
   (precedes obs1956 obs1948)
   (precedes obs1956 obs1949)
   (precedes obs1956 obs1950)
   (precedes obs1956 obs1951)
   (precedes obs1956 obs1952)
   (delay-trip-wait obs1956 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1957 Breaker_X51_X52 cb_state open)
   (future obs1957)
   (precedes obs1957 obs1944)
   (precedes obs1957 obs1945)
   (precedes obs1957 obs1946)
   (precedes obs1957 obs1947)
   (precedes obs1957 obs1948)
   (precedes obs1957 obs1949)
   (precedes obs1957 obs1950)
   (precedes obs1957 obs1951)
   (precedes obs1957 obs1952)
   (delay-trip-wait obs1957 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1958 Breaker_X29_X30 cb_state open)
   (future obs1958)
   (precedes obs1958 obs1944)
   (precedes obs1958 obs1945)
   (precedes obs1958 obs1946)
   (precedes obs1958 obs1947)
   (precedes obs1958 obs1948)
   (precedes obs1958 obs1949)
   (precedes obs1958 obs1950)
   (precedes obs1958 obs1951)
   (precedes obs1958 obs1952)
   (delay-trip-wait obs1958 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1959 Breaker_X25_X26 cb_state open)
   (future obs1959)
   (precedes obs1959 obs1944)
   (precedes obs1959 obs1945)
   (precedes obs1959 obs1946)
   (precedes obs1959 obs1947)
   (precedes obs1959 obs1948)
   (precedes obs1959 obs1949)
   (precedes obs1959 obs1950)
   (precedes obs1959 obs1951)
   (precedes obs1959 obs1952)
   (delay-trip-wait obs1959 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-4 obs1960 Bus_X78 limit KV Low)
   (future obs1960)
   (precedes obs1960 obs1944)
   (precedes obs1960 obs1945)
   (precedes obs1960 obs1946)
   (precedes obs1960 obs1947)
   (precedes obs1960 obs1948)
   (precedes obs1960 obs1949)
   (precedes obs1960 obs1950)
   (precedes obs1960 obs1951)
   (precedes obs1960 obs1952)
   (delay-trip-wait obs1960 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1961 Generator_X76_1 unit_status OFF)
   (future obs1961)
   (precedes obs1961 obs1944)
   (precedes obs1961 obs1945)
   (precedes obs1961 obs1946)
   (precedes obs1961 obs1947)
   (precedes obs1961 obs1948)
   (precedes obs1961 obs1949)
   (precedes obs1961 obs1950)
   (precedes obs1961 obs1951)
   (precedes obs1961 obs1952)
   (delay-trip-wait obs1961 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1962 Breaker_X63_X64 cb_state open)
   (future obs1962)
   (precedes obs1962 obs1944)
   (precedes obs1962 obs1945)
   (precedes obs1962 obs1946)
   (precedes obs1962 obs1947)
   (precedes obs1962 obs1948)
   (precedes obs1962 obs1949)
   (precedes obs1962 obs1950)
   (precedes obs1962 obs1951)
   (precedes obs1962 obs1952)
   (delay-trip-wait obs1962 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1963 Breaker_X27_X28 ar_supy_control_status NON_AUTO)
   (future obs1963)
   (precedes obs1963 obs1944)
   (precedes obs1963 obs1945)
   (precedes obs1963 obs1946)
   (precedes obs1963 obs1947)
   (precedes obs1963 obs1948)
   (precedes obs1963 obs1949)
   (precedes obs1963 obs1950)
   (precedes obs1963 obs1951)
   (precedes obs1963 obs1952)
   (delay-trip-wait obs1963 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1964 Breaker_X39_X40 cb_state open)
   (future obs1964)
   (precedes obs1964 obs1944)
   (precedes obs1964 obs1945)
   (precedes obs1964 obs1946)
   (precedes obs1964 obs1947)
   (precedes obs1964 obs1948)
   (precedes obs1964 obs1949)
   (precedes obs1964 obs1950)
   (precedes obs1964 obs1951)
   (precedes obs1964 obs1952)
   (delay-trip-wait obs1964 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1965 Breaker_X65_X66 cb_state open)
   (future obs1965)
   (precedes obs1965 obs1944)
   (precedes obs1965 obs1945)
   (precedes obs1965 obs1946)
   (precedes obs1965 obs1947)
   (precedes obs1965 obs1948)
   (precedes obs1965 obs1949)
   (precedes obs1965 obs1950)
   (precedes obs1965 obs1951)
   (precedes obs1965 obs1952)
   (delay-trip-wait obs1965 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1966 Breaker_X49_X50 cb_state open)
   (future obs1966)
   (precedes obs1966 obs1944)
   (precedes obs1966 obs1945)
   (precedes obs1966 obs1946)
   (precedes obs1966 obs1947)
   (precedes obs1966 obs1948)
   (precedes obs1966 obs1949)
   (precedes obs1966 obs1950)
   (precedes obs1966 obs1951)
   (precedes obs1966 obs1952)
   (delay-trip-wait obs1966 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1967 Breaker_X5_X6 cb_state open)
   (future obs1967)
   (precedes obs1967 obs1944)
   (precedes obs1967 obs1945)
   (precedes obs1967 obs1946)
   (precedes obs1967 obs1947)
   (precedes obs1967 obs1948)
   (precedes obs1967 obs1949)
   (precedes obs1967 obs1950)
   (precedes obs1967 obs1951)
   (precedes obs1967 obs1952)
   (delay-trip-wait obs1967 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-4 obs1968 Bus_X83 limit KV Low)
   (future obs1968)
   (precedes obs1968 obs1944)
   (precedes obs1968 obs1945)
   (precedes obs1968 obs1946)
   (precedes obs1968 obs1947)
   (precedes obs1968 obs1948)
   (precedes obs1968 obs1949)
   (precedes obs1968 obs1950)
   (precedes obs1968 obs1951)
   (precedes obs1968 obs1952)
   (delay-trip-wait obs1968 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1969 Breaker_X15_X16 cb_state open)
   (future obs1969)
   (precedes obs1969 obs1944)
   (precedes obs1969 obs1945)
   (precedes obs1969 obs1946)
   (precedes obs1969 obs1947)
   (precedes obs1969 obs1948)
   (precedes obs1969 obs1949)
   (precedes obs1969 obs1950)
   (precedes obs1969 obs1951)
   (precedes obs1969 obs1952)
   (delay-trip-wait obs1969 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1970 Breaker_X23_X24 cb_state open)
   (future obs1970)
   (precedes obs1970 obs1944)
   (precedes obs1970 obs1945)
   (precedes obs1970 obs1946)
   (precedes obs1970 obs1947)
   (precedes obs1970 obs1948)
   (precedes obs1970 obs1949)
   (precedes obs1970 obs1950)
   (precedes obs1970 obs1951)
   (precedes obs1970 obs1952)
   (delay-trip-wait obs1970 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1971 Breaker_X61_X62 cb_state open)
   (future obs1971)
   (precedes obs1971 obs1944)
   (precedes obs1971 obs1945)
   (precedes obs1971 obs1946)
   (precedes obs1971 obs1947)
   (precedes obs1971 obs1948)
   (precedes obs1971 obs1949)
   (precedes obs1971 obs1950)
   (precedes obs1971 obs1951)
   (precedes obs1971 obs1952)
   (delay-trip-wait obs1971 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1972 Breaker_X67_X68 ar_supy_control_status NON_AUTO)
   (future obs1972)
   (precedes obs1972 obs1944)
   (precedes obs1972 obs1945)
   (precedes obs1972 obs1946)
   (precedes obs1972 obs1947)
   (precedes obs1972 obs1948)
   (precedes obs1972 obs1949)
   (precedes obs1972 obs1950)
   (precedes obs1972 obs1951)
   (precedes obs1972 obs1952)
   (delay-trip-wait obs1972 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1973 Breaker_X21_X22 cb_state open)
   (future obs1973)
   (precedes obs1973 obs1944)
   (precedes obs1973 obs1945)
   (precedes obs1973 obs1946)
   (precedes obs1973 obs1947)
   (precedes obs1973 obs1948)
   (precedes obs1973 obs1949)
   (precedes obs1973 obs1950)
   (precedes obs1973 obs1951)
   (precedes obs1973 obs1952)
   (delay-trip-wait obs1973 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1974 Breaker_X17_X18 cb_state open)
   (future obs1974)
   (precedes obs1974 obs1944)
   (precedes obs1974 obs1945)
   (precedes obs1974 obs1946)
   (precedes obs1974 obs1947)
   (precedes obs1974 obs1948)
   (precedes obs1974 obs1949)
   (precedes obs1974 obs1950)
   (precedes obs1974 obs1951)
   (precedes obs1974 obs1952)
   (delay-trip-wait obs1974 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1975 Breaker_X19_X20 cb_state open)
   (future obs1975)
   (precedes obs1975 obs1944)
   (precedes obs1975 obs1945)
   (precedes obs1975 obs1946)
   (precedes obs1975 obs1947)
   (precedes obs1975 obs1948)
   (precedes obs1975 obs1949)
   (precedes obs1975 obs1950)
   (precedes obs1975 obs1951)
   (precedes obs1975 obs1952)
   (delay-trip-wait obs1975 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1976 Line_X13_X14 entered_zero_zone KV)
   (future obs1976)
   (precedes obs1976 obs1944)
   (precedes obs1976 obs1945)
   (precedes obs1976 obs1946)
   (precedes obs1976 obs1947)
   (precedes obs1976 obs1948)
   (precedes obs1976 obs1949)
   (precedes obs1976 obs1950)
   (precedes obs1976 obs1951)
   (precedes obs1976 obs1952)
   (delay-trip-wait obs1976 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-4 obs1977 Bus_X75 limit KV Low)
   (future obs1977)
   (precedes obs1977 obs1944)
   (precedes obs1977 obs1945)
   (precedes obs1977 obs1946)
   (precedes obs1977 obs1947)
   (precedes obs1977 obs1948)
   (precedes obs1977 obs1949)
   (precedes obs1977 obs1950)
   (precedes obs1977 obs1951)
   (precedes obs1977 obs1952)
   (delay-trip-wait obs1977 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-4 obs1978 Bus_X77 limit KV Low)
   (future obs1978)
   (precedes obs1978 obs1944)
   (precedes obs1978 obs1945)
   (precedes obs1978 obs1946)
   (precedes obs1978 obs1947)
   (precedes obs1978 obs1948)
   (precedes obs1978 obs1949)
   (precedes obs1978 obs1950)
   (precedes obs1978 obs1951)
   (precedes obs1978 obs1952)
   (delay-trip-wait obs1978 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1979 Generator_X87_1 runback alarm)
   (future obs1979)
   (precedes obs1979 obs1944)
   (precedes obs1979 obs1945)
   (precedes obs1979 obs1946)
   (precedes obs1979 obs1947)
   (precedes obs1979 obs1948)
   (precedes obs1979 obs1949)
   (precedes obs1979 obs1950)
   (precedes obs1979 obs1951)
   (precedes obs1979 obs1952)
   (delay-trip-wait obs1979 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1980 Breaker_X15_X16 cb_state closed)
   (future obs1980)
   (precedes obs1980 obs1944)
   (precedes obs1980 obs1945)
   (precedes obs1980 obs1946)
   (precedes obs1980 obs1947)
   (precedes obs1980 obs1948)
   (precedes obs1980 obs1949)
   (precedes obs1980 obs1950)
   (precedes obs1980 obs1951)
   (precedes obs1980 obs1952)
   (delay-trip-wait obs1980 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-4 obs1981 Bus_X80 limit KV Low)
   (future obs1981)
   (precedes obs1981 obs1944)
   (precedes obs1981 obs1945)
   (precedes obs1981 obs1946)
   (precedes obs1981 obs1947)
   (precedes obs1981 obs1948)
   (precedes obs1981 obs1949)
   (precedes obs1981 obs1950)
   (precedes obs1981 obs1951)
   (precedes obs1981 obs1952)
   (delay-trip-wait obs1981 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1982 Breaker_X1_X2 cb_state open)
   (future obs1982)
   (precedes obs1982 obs1944)
   (precedes obs1982 obs1945)
   (precedes obs1982 obs1946)
   (precedes obs1982 obs1947)
   (precedes obs1982 obs1948)
   (precedes obs1982 obs1949)
   (precedes obs1982 obs1950)
   (precedes obs1982 obs1951)
   (precedes obs1982 obs1952)
   (delay-trip-wait obs1982 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-4 obs1983 Bus_X81 limit KV High)
   (future obs1983)
   (precedes obs1983 obs1944)
   (precedes obs1983 obs1945)
   (precedes obs1983 obs1946)
   (precedes obs1983 obs1947)
   (precedes obs1983 obs1948)
   (precedes obs1983 obs1949)
   (precedes obs1983 obs1950)
   (precedes obs1983 obs1951)
   (precedes obs1983 obs1952)
   (delay-trip-wait obs1983 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-4 obs1984 Bus_X84 limit KV Low)
   (future obs1984)
   (precedes obs1984 obs1944)
   (precedes obs1984 obs1945)
   (precedes obs1984 obs1946)
   (precedes obs1984 obs1947)
   (precedes obs1984 obs1948)
   (precedes obs1984 obs1949)
   (precedes obs1984 obs1950)
   (precedes obs1984 obs1951)
   (precedes obs1984 obs1952)
   (delay-trip-wait obs1984 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-4 obs1985 Bus_X79 limit KV Low)
   (future obs1985)
   (precedes obs1985 obs1944)
   (precedes obs1985 obs1945)
   (precedes obs1985 obs1946)
   (precedes obs1985 obs1947)
   (precedes obs1985 obs1948)
   (precedes obs1985 obs1949)
   (precedes obs1985 obs1950)
   (precedes obs1985 obs1951)
   (precedes obs1985 obs1952)
   (delay-trip-wait obs1985 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1986 Breaker_X57_X58 cb_state open)
   (future obs1986)
   (precedes obs1986 obs1944)
   (precedes obs1986 obs1945)
   (precedes obs1986 obs1946)
   (precedes obs1986 obs1947)
   (precedes obs1986 obs1948)
   (precedes obs1986 obs1949)
   (precedes obs1986 obs1950)
   (precedes obs1986 obs1951)
   (precedes obs1986 obs1952)
   (delay-trip-wait obs1986 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1987 Breaker_X47_X48 cb_state open)
   (future obs1987)
   (precedes obs1987 obs1944)
   (precedes obs1987 obs1945)
   (precedes obs1987 obs1946)
   (precedes obs1987 obs1947)
   (precedes obs1987 obs1948)
   (precedes obs1987 obs1949)
   (precedes obs1987 obs1950)
   (precedes obs1987 obs1951)
   (precedes obs1987 obs1952)
   (delay-trip-wait obs1987 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1988 Breaker_X59_X60 cb_state open)
   (future obs1988)
   (precedes obs1988 obs1944)
   (precedes obs1988 obs1945)
   (precedes obs1988 obs1946)
   (precedes obs1988 obs1947)
   (precedes obs1988 obs1948)
   (precedes obs1988 obs1949)
   (precedes obs1988 obs1950)
   (precedes obs1988 obs1951)
   (precedes obs1988 obs1952)
   (delay-trip-wait obs1988 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1989 Breaker_X55_X56 cb_state open)
   (future obs1989)
   (precedes obs1989 obs1944)
   (precedes obs1989 obs1945)
   (precedes obs1989 obs1946)
   (precedes obs1989 obs1947)
   (precedes obs1989 obs1948)
   (precedes obs1989 obs1949)
   (precedes obs1989 obs1950)
   (precedes obs1989 obs1951)
   (precedes obs1989 obs1952)
   (delay-trip-wait obs1989 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1990 Breaker_X45_X46 ar_supy_control_status NON_AUTO)
   (future obs1990)
   (precedes obs1990 obs1944)
   (precedes obs1990 obs1945)
   (precedes obs1990 obs1946)
   (precedes obs1990 obs1947)
   (precedes obs1990 obs1948)
   (precedes obs1990 obs1949)
   (precedes obs1990 obs1950)
   (precedes obs1990 obs1951)
   (precedes obs1990 obs1952)
   (delay-trip-wait obs1990 obs1943)

   ;; 1309611653 (2011-07-02 13:00:53):
   (matches-3 obs1991 Breaker_X53_X54 cb_state open)
   (future obs1991)
   (precedes obs1991 obs1944)
   (precedes obs1991 obs1945)
   (precedes obs1991 obs1946)
   (precedes obs1991 obs1947)
   (precedes obs1991 obs1948)
   (precedes obs1991 obs1949)
   (precedes obs1991 obs1950)
   (precedes obs1991 obs1951)
   (precedes obs1991 obs1952)
   (delay-trip-wait obs1991 obs1943)
   (= (total-cost) 0)
   )

  (:goal (and (observed obs1932)
              (observed obs1933)
              (observed obs1934)
              (observed obs1935)
              (observed obs1936)
              (observed obs1937)
              (observed obs1938)
              (observed obs1939)
              (observed obs1940)
              (observed obs1941)
              (observed obs1942)
              (observed obs1943)
              (observed obs1944)
              (observed obs1945)
              (observed obs1946)
              (observed obs1947)
              (observed obs1948)
              (observed obs1949)
              (observed obs1950)
              (observed obs1951)
              (observed obs1952)
              (observed obs1953)
              (observed obs1954)
              (observed obs1955)
              (observed obs1956)
              (observed obs1957)
              (observed obs1958)
              (observed obs1959)
              (observed obs1960)
              (observed obs1961)
              (observed obs1962)
              (observed obs1963)
              (observed obs1964)
              (observed obs1965)
              (observed obs1966)
              (observed obs1967)
              (observed obs1968)
              (observed obs1969)
              (observed obs1970)
              (observed obs1971)
              (observed obs1972)
              (observed obs1973)
              (observed obs1974)
              (observed obs1975)
              (observed obs1976)
              (observed obs1977)
              (observed obs1978)
              (observed obs1979)
              (observed obs1980)
              (observed obs1981)
              (observed obs1982)
              (observed obs1983)
              (observed obs1984)
              (observed obs1985)
              (observed obs1986)
              (observed obs1987)
              (observed obs1988)
              (observed obs1989)
              (observed obs1990)
              (observed obs1991)))

  (:metric minimize (total-cost))
  )
;; generation time: 1.728 (cpu) 1.787 (real)
