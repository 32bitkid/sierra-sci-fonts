#!/usr/bin/env node
const altName = process.argv[2] ?? '';


const nameMap = new Map([
  [32, "SPACE"],
  [33, "EXCLAMATION MARK"],
  [34, "QUOTATION MARK"],
  [35, "NUMBER SIGN"],
  [36, "DOLLAR SIGN"],
  [37, "PERCENT SIGN"],
  [38, "AMPERSAND"],
  [39, "APOSTROPHE"],
  [40, "LEFT PARENTHESIS"],
  [41, "RIGHT PARENTHESIS"],
  [42, "ASTERISK"],
  [43, "PLUS SIGN"],
  [44, "COMMA"],
  [45, "HYPHEN-MINUS"],
  [46, "FULL STOP"],
  [47, "SOLIDUS"],
  [48, "DIGIT ZERO"],
  [49, "DIGIT ONE"],
  [50, "DIGIT TWO"],
  [51, "DIGIT THREE"],
  [52, "DIGIT FOUR"],
  [53, "DIGIT FIVE"],
  [54, "DIGIT SIX"],
  [55, "DIGIT SEVEN"],
  [56, "DIGIT EIGHT"],
  [57, "DIGIT NINE"],
  [58, "COLON"],
  [59, "SEMICOLON"],
  [60, "LESS-THAN SIGN"],
  [61, "EQUALS SIGN"],
  [62, "GREATER-THAN SIGN"],
  [63, "QUESTION MARK"],
  [64, "COMMERCIAL AT"],
  [65, "LATIN CAPITAL LETTER A"],
  [66, "LATIN CAPITAL LETTER B"],
  [67, "LATIN CAPITAL LETTER C"],
  [68, "LATIN CAPITAL LETTER D"],
  [69, "LATIN CAPITAL LETTER E"],
  [70, "LATIN CAPITAL LETTER F"],
  [71, "LATIN CAPITAL LETTER G"],
  [72, "LATIN CAPITAL LETTER H"],
  [73, "LATIN CAPITAL LETTER I"],
  [74, "LATIN CAPITAL LETTER J"],
  [75, "LATIN CAPITAL LETTER K"],
  [76, "LATIN CAPITAL LETTER L"],
  [77, "LATIN CAPITAL LETTER M"],
  [78, "LATIN CAPITAL LETTER N"],
  [79, "LATIN CAPITAL LETTER O"],
  [80, "LATIN CAPITAL LETTER P"],
  [81, "LATIN CAPITAL LETTER Q"],
  [82, "LATIN CAPITAL LETTER R"],
  [83, "LATIN CAPITAL LETTER S"],
  [84, "LATIN CAPITAL LETTER T"],
  [85, "LATIN CAPITAL LETTER U"],
  [86, "LATIN CAPITAL LETTER V"],
  [87, "LATIN CAPITAL LETTER W"],
  [88, "LATIN CAPITAL LETTER X"],
  [89, "LATIN CAPITAL LETTER Y"],
  [90, "LATIN CAPITAL LETTER Z"],
  [91, "LEFT SQUARE BRACKET"],
  [92, "REVERSE SOLIDUS"],
  [93, "RIGHT SQUARE BRACKET"],
  [94, "CIRCUMFLEX ACCENT"],
  [95, "LOW LINE"],
  [96, "GRAVE ACCENT"],
  [97, "LATIN SMALL LETTER A"],
  [98, "LATIN SMALL LETTER B"],
  [99, "LATIN SMALL LETTER C"],
  [100, "LATIN SMALL LETTER D"],
  [101, "LATIN SMALL LETTER E"],
  [102, "LATIN SMALL LETTER F"],
  [103, "LATIN SMALL LETTER G"],
  [104, "LATIN SMALL LETTER H"],
  [105, "LATIN SMALL LETTER I"],
  [106, "LATIN SMALL LETTER J"],
  [107, "LATIN SMALL LETTER K"],
  [108, "LATIN SMALL LETTER L"],
  [109, "LATIN SMALL LETTER M"],
  [110, "LATIN SMALL LETTER N"],
  [111, "LATIN SMALL LETTER O"],
  [112, "LATIN SMALL LETTER P"],
  [113, "LATIN SMALL LETTER Q"],
  [114, "LATIN SMALL LETTER R"],
  [115, "LATIN SMALL LETTER S"],
  [116, "LATIN SMALL LETTER T"],
  [117, "LATIN SMALL LETTER U"],
  [118, "LATIN SMALL LETTER V"],
  [119, "LATIN SMALL LETTER W"],
  [120, "LATIN SMALL LETTER X"],
  [121, "LATIN SMALL LETTER Y"],
  [122, "LATIN SMALL LETTER Z"],
  [123, "LEFT CURLY BRACKET"],
  [124, "VERTICAL LINE"],
  [125, "RIGHT CURLY BRACKET"],
  [126, "TILDE"],
  [160, "NO-BREAK SPACE"],
  [161, "INVERTED EXCLAMATION MARK"],
  [162, "CENT SIGN"],
  [163, "POUND SIGN"],
  [164, "CURRENCY SIGN"],
  [165, "YEN SIGN"],
  [166, "BROKEN BAR"],
  [167, "SECTION SIGN"],
  [168, "DIAERESIS"],
  [169, "COPYRIGHT SIGN"],
  [170, "FEMININE ORDINAL INDICATOR"],
  [171, "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK"],
  [172, "NOT SIGN"],
  [173, "SOFT HYPHEN"],
  [174, "REGISTERED SIGN"],
  [175, "MACRON"],
  [176, "DEGREE SIGN"],
  [177, "PLUS-MINUS SIGN"],
  [178, "SUPERSCRIPT TWO"],
  [179, "SUPERSCRIPT THREE"],
  [180, "ACUTE ACCENT"],
  [181, "MICRO SIGN"],
  [182, "PILCROW SIGN"],
  [183, "MIDDLE DOT"],
  [184, "CEDILLA"],
  [185, "SUPERSCRIPT ONE"],
  [186, "MASCULINE ORDINAL INDICATOR"],
  [187, "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK"],
  [188, "VULGAR FRACTION ONE QUARTER"],
  [189, "VULGAR FRACTION ONE HALF"],
  [190, "VULGAR FRACTION THREE QUARTERS"],
  [191, "INVERTED QUESTION MARK"],
  [192, "LATIN CAPITAL LETTER A WITH GRAVE"],
  [193, "LATIN CAPITAL LETTER A WITH ACUTE"],
  [194, "LATIN CAPITAL LETTER A WITH CIRCUMFLEX"],
  [195, "LATIN CAPITAL LETTER A WITH TILDE"],
  [196, "LATIN CAPITAL LETTER A WITH DIAERESIS"],
  [197, "LATIN CAPITAL LETTER A WITH RING ABOVE"],
  [198, "LATIN CAPITAL LETTER AE"],
  [199, "LATIN CAPITAL LETTER C WITH CEDILLA"],
  [200, "LATIN CAPITAL LETTER E WITH GRAVE"],
  [201, "LATIN CAPITAL LETTER E WITH ACUTE"],
  [202, "LATIN CAPITAL LETTER E WITH CIRCUMFLEX"],
  [203, "LATIN CAPITAL LETTER E WITH DIAERESIS"],
  [204, "LATIN CAPITAL LETTER I WITH GRAVE"],
  [205, "LATIN CAPITAL LETTER I WITH ACUTE"],
  [206, "LATIN CAPITAL LETTER I WITH CIRCUMFLEX"],
  [207, "LATIN CAPITAL LETTER I WITH DIAERESIS"],
  [208, "LATIN CAPITAL LETTER ETH"],
  [209, "LATIN CAPITAL LETTER N WITH TILDE"],
  [210, "LATIN CAPITAL LETTER O WITH GRAVE"],
  [211, "LATIN CAPITAL LETTER O WITH ACUTE"],
  [212, "LATIN CAPITAL LETTER O WITH CIRCUMFLEX"],
  [213, "LATIN CAPITAL LETTER O WITH TILDE"],
  [214, "LATIN CAPITAL LETTER O WITH DIAERESIS"],
  [215, "MULTIPLICATION SIGN"],
  [216, "LATIN CAPITAL LETTER O WITH STROKE"],
  [217, "LATIN CAPITAL LETTER U WITH GRAVE"],
  [218, "LATIN CAPITAL LETTER U WITH ACUTE"],
  [219, "LATIN CAPITAL LETTER U WITH CIRCUMFLEX"],
  [220, "LATIN CAPITAL LETTER U WITH DIAERESIS"],
  [221, "LATIN CAPITAL LETTER Y WITH ACUTE"],
  [222, "LATIN CAPITAL LETTER THORN"],
  [223, "LATIN SMALL LETTER SHARP S"],
  [224, "LATIN SMALL LETTER A WITH GRAVE"],
  [225, "LATIN SMALL LETTER A WITH ACUTE"],
  [226, "LATIN SMALL LETTER A WITH CIRCUMFLEX"],
  [227, "LATIN SMALL LETTER A WITH TILDE"],
  [228, "LATIN SMALL LETTER A WITH DIAERESIS"],
  [229, "LATIN SMALL LETTER A WITH RING ABOVE"],
  [230, "LATIN SMALL LETTER AE"],
  [231, "LATIN SMALL LETTER C WITH CEDILLA"],
  [232, "LATIN SMALL LETTER E WITH GRAVE"],
  [233, "LATIN SMALL LETTER E WITH ACUTE"],
  [234, "LATIN SMALL LETTER E WITH CIRCUMFLEX"],
  [235, "LATIN SMALL LETTER E WITH DIAERESIS"],
  [236, "LATIN SMALL LETTER I WITH GRAVE"],
  [237, "LATIN SMALL LETTER I WITH ACUTE"],
  [238, "LATIN SMALL LETTER I WITH CIRCUMFLEX"],
  [239, "LATIN SMALL LETTER I WITH DIAERESIS"],
  [240, "LATIN SMALL LETTER ETH"],
  [241, "LATIN SMALL LETTER N WITH TILDE"],
  [242, "LATIN SMALL LETTER O WITH GRAVE"],
  [243, "LATIN SMALL LETTER O WITH ACUTE"],
  [244, "LATIN SMALL LETTER O WITH CIRCUMFLEX"],
  [245, "LATIN SMALL LETTER O WITH TILDE"],
  [246, "LATIN SMALL LETTER O WITH DIAERESIS"],
  [247, "DIVISION SIGN"],
  [248, "LATIN SMALL LETTER O WITH STROKE"],
  [249, "LATIN SMALL LETTER U WITH GRAVE"],
  [250, "LATIN SMALL LETTER U WITH ACUTE"],
  [251, "LATIN SMALL LETTER U WITH CIRCUMFLEX"],
  [252, "LATIN SMALL LETTER U WITH DIAERESIS"],
  [253, "LATIN SMALL LETTER Y WITH ACUTE"],
  [254, "LATIN SMALL LETTER THORN"],
  [255, "LATIN SMALL LETTER Y WITH DIAERESIS"],

  [0x0192, "LATIN SMALL LETTER F WITH HOOK"]
])

const codePage850 = [
  [
    128,
    "Ç",
    199
  ],
  [
    129,
    "ü",
    252
  ],
  [
    130,
    "é",
    233
  ],
  [
    131,
    "â",
    226
  ],
  [
    132,
    "ä",
    228
  ],
  [
    133,
    "à",
    224
  ],
  [
    134,
    "å",
    229
  ],
  [
    135,
    "ç",
    231
  ],
  [
    136,
    "ê",
    234
  ],
  [
    137,
    "ë",
    235
  ],
  [
    138,
    "è",
    232
  ],
  [
    139,
    "ï",
    239
  ],
  [
    140,
    "î",
    238
  ],
  [
    141,
    "ì",
    236
  ],
  [
    142,
    "Ä",
    196
  ],
  [
    143,
    "Å",
    197
  ],
  [
    144,
    "É",
    201
  ],
  [
    145,
    "æ",
    230
  ],
  [
    146,
    "Æ",
    198
  ],
  [
    147,
    "ô",
    244
  ],
  [
    148,
    "ö",
    246
  ],
  [
    149,
    "ò",
    242
  ],
  [
    150,
    "û",
    251
  ],
  [
    151,
    "ù",
    249
  ],
  [
    152,
    "ÿ",
    255
  ],
  [
    153,
    "Ö",
    214
  ],
  [
    154,
    "Ü",
    220
  ],
  [
    155,
    "ø",
    248
  ],
  [
    156,
    "£",
    163
  ],
  [
    157,
    "Ø",
    216
  ],
  [
    158,
    "×",
    215
  ],
  [
    159,
    "ƒ",
    402
  ],
  [
    160,
    "á",
    225
  ],
  [
    161,
    "í",
    237
  ],
  [
    162,
    "ó",
    243
  ],
  [
    163,
    "ú",
    250
  ],
  [
    164,
    "ñ",
    241
  ],
  [
    165,
    "Ñ",
    209
  ],
  [
    166,
    "ª",
    170
  ],
  [
    167,
    "º",
    186
  ],
  [
    168,
    "¿",
    191
  ],
  [
    169,
    "®",
    174
  ],
  [
    170,
    "¬",
    172
  ],
  [
    171,
    "½",
    189
  ],
  [
    172,
    "¼",
    188
  ],
  [
    173,
    "¡",
    161
  ],
  [
    174,
    "«",
    171
  ],
  [
    175,
    "»",
    187
  ],
  [
    176,
    "░",
    9617
  ],
  [
    177,
    "▒",
    9618
  ],
  [
    178,
    "▓",
    9619
  ],
  [
    179,
    "│",
    9474
  ],
  [
    180,
    "┤",
    9508
  ],
  [
    181,
    "Á",
    193
  ],
  [
    182,
    "Â",
    194
  ],
  [
    183,
    "À",
    192
  ],
  [
    184,
    "©",
    169
  ],
  [
    185,
    "╣",
    9571
  ],
  [
    186,
    "║",
    9553
  ],
  [
    187,
    "╗",
    9559
  ],
  [
    188,
    "╝",
    9565
  ],
  [
    189,
    "¢",
    162
  ],
  [
    190,
    "¥",
    165
  ],
  [
    191,
    "┐",
    9488
  ],
  [
    192,
    "└",
    9492
  ],
  [
    193,
    "┴",
    9524
  ],
  [
    194,
    "┬",
    9516
  ],
  [
    195,
    "├",
    9500
  ],
  [
    196,
    "─",
    9472
  ],
  [
    197,
    "┼",
    9532
  ],
  [
    198,
    "ã",
    227
  ],
  [
    199,
    "Ã",
    195
  ],
  [
    200,
    "╚",
    9562
  ],
  [
    201,
    "╔",
    9556
  ],
  [
    202,
    "╩",
    9577
  ],
  [
    203,
    "╦",
    9574
  ],
  [
    204,
    "╠",
    9568
  ],
  [
    205,
    "═",
    9552
  ],
  [
    206,
    "╬",
    9580
  ],
  [
    207,
    "¤",
    164
  ],
  [
    208,
    "ð",
    240
  ],
  [
    209,
    "Ð",
    208
  ],
  [
    210,
    "Ê",
    202
  ],
  [
    211,
    "Ë",
    203
  ],
  [
    212,
    "È",
    200
  ],
  [
    213,
    "ı",
    305
  ],
  [
    214,
    "Í",
    205
  ],
  [
    215,
    "Î",
    206
  ],
  [
    216,
    "Ï",
    207
  ],
  [
    217,
    "┘",
    9496
  ],
  [
    218,
    "┌",
    9484
  ],
  [
    219,
    "█",
    9608
  ],
  [
    220,
    "▄",
    9604
  ],
  [
    221,
    "¦",
    166
  ],
  [
    222,
    "Ì",
    204
  ],
  [
    223,
    "▀",
    9600
  ],
  [
    224,
    "Ó",
    211
  ],
  [
    225,
    "ß",
    223
  ],
  [
    226,
    "Ô",
    212
  ],
  [
    227,
    "Ò",
    210
  ],
  [
    228,
    "õ",
    245
  ],
  [
    229,
    "Õ",
    213
  ],
  [
    230,
    "µ",
    181
  ],
  [
    231,
    "þ",
    254
  ],
  [
    232,
    "Þ",
    222
  ],
  [
    233,
    "Ú",
    218
  ],
  [
    234,
    "Û",
    219
  ],
  [
    235,
    "Ù",
    217
  ],
  [
    236,
    "ý",
    253
  ],
  [
    237,
    "Ý",
    221
  ],
  [
    238,
    "¯",
    175
  ],
  [
    239,
    "´",
    180
  ],
  [
    240,
    "SHY",
    173
  ],
  [
    241,
    "±",
    177
  ],
  [
    242,
    "‗",
    8215
  ],
  [
    243,
    "¾",
    190
  ],
  [
    244,
    "¶",
    182
  ],
  [
    245,
    "§",
    167
  ],
  [
    246,
    "÷",
    247
  ],
  [
    247,
    "¸",
    184
  ],
  [
    248,
    "°",
    176
  ],
  [
    249,
    "¨",
    168
  ],
  [
    250,
    "·",
    183
  ],
  [
    251,
    "¹",
    185
  ],
  [
    252,
    "³",
    179
  ],
  [
    253,
    "²",
    178
  ],
  [
    254,
    "■",
    9632
  ]
]

console.log(JSON.stringify(codePage850.map(([a, _, u]) =>
  altName === '' ? [
      a.toString(16).padStart(2, '0'),
      u.toString(16).padStart(4, '0'),
    ] :
    [
      a.toString(16).padStart(2, '0'),
      "Fxxxx",
      {
        ...(nameMap.has(u) ? {name: `ALTERNATE ${nameMap.get(u)}`} : {}),
        actions: [
          {alt: [altName, u.toString(16).padStart(4, '0')]}
        ]
      }
    ]
), null, 2));