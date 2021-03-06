pragma Warnings(Off);
pragma Style_Checks(Off);

package Parse_Shift_Reduce is

    type Small_Integer is range -32_000 .. 32_000;

    type Shift_Reduce_Entry is record
        T   : Small_Integer;
        Act : Small_Integer;
    end record;
    pragma Pack(Shift_Reduce_Entry);

    subtype Row is Integer range -1 .. Integer'Last;

  --pragma suppress(index_check);

    type Shift_Reduce_Array is array (Row  range <>) of Shift_Reduce_Entry;

    Shift_Reduce_Matrix : constant Shift_Reduce_Array :=
        ( (-1,-1) -- Dummy Entry

-- state  0
,(-1,-2)
-- state  1
,( 1, 4),(-1,-4)
-- state  2
,( 0,-1001)
,(-1,-1000)
-- state  3
,( 4, 6),( 5, 7),( 6, 8)
,(-1,-1000)
-- state  4
,( 11, 11),(-1,-1000)
-- state  5
,(-1,-1000)

-- state  6
,(-1,-6)
-- state  7
,(-1,-7)
-- state  8
,(-1,-8)
-- state  9
,(-1,-13)

-- state  10
,( 7, 13),(-1,-1000)
-- state  11
,(-1,-5)
-- state  12
,(-1,-14)

-- state  13
,( 1, 17),( 8, 16),(-1,-1000)
-- state  14
,( 1, 22)
,( 2, 32),( 9, 29),( 10, 21),( 12, 19)
,( 13, 23),( 24, 27),( 25, 30),( 26, 31)
,( 28, 33),(-1,-1)
-- state  15
,( 7, 36),( 11, 35)
,(-1,-1000)
-- state  16
,(-1,-10)
-- state  17
,(-1,-11)
-- state  18
,( 2, 32)
,( 9, 29),( 10, 39),( 12, 38),( 24, 27)
,( 25, 30),( 26, 31),( 28, 33),(-1,-1000)

-- state  19
,( 2, 32),( 9, 29),( 24, 27),( 25, 30)
,( 26, 31),( 28, 33),(-1,-1000)
-- state  20
,( 16, 41)
,( 17, 43),( 18, 44),(-1,-27)
-- state  21
,(-1,-20)

-- state  22
,(-1,-21)
-- state  23
,( 1, 47),( 8, 46),(-1,-1000)

-- state  24
,( 2, 32),( 9, 29),( 24, 27),( 25, 30)
,( 26, 31),( 28, 33),(-1,-1000)
-- state  25
,( 2, 32)
,( 9, 29),( 24, 27),( 25, 30),( 26, 31)
,( 28, 33),(-1,-30)
-- state  26
,( 19, 50),( 20, 51)
,( 21, 52),( 22, 53),(-1,-33)
-- state  27
,(-1,-40)

-- state  28
,(-1,-41)
-- state  29
,(-1,-42)
-- state  30
,(-1,-52)
-- state  31
,( 2, 32)
,( 9, 29),( 24, 27),( 25, 30),( 26, 31)
,( 28, 33),(-1,-1000)
-- state  32
,(-1,-45)
-- state  33
,( 12, 57)
,(-1,-50)
-- state  34
,( 11, 58),(-1,-1000)
-- state  35
,(-1,-3)

-- state  36
,( 8, 59),(-1,-1000)
-- state  37
,( 16, 41),( 17, 43)
,( 18, 44),(-1,-27)
-- state  38
,( 2, 32),( 9, 29)
,( 24, 27),( 25, 30),( 26, 31),( 28, 33)
,(-1,-1000)
-- state  39
,(-1,-19)
-- state  40
,( 16, 41),( 17, 43)
,( 18, 44),(-1,-27)
-- state  41
,(-1,-26)
-- state  42
,(-1,-18)

-- state  43
,( 2, 32),( 9, 29),( 24, 27),( 25, 30)
,( 26, 31),( 28, 33),(-1,-1000)
-- state  44
,(-1,-31)

-- state  45
,( 14, 64),( 15, 65),(-1,-1000)
-- state  46
,(-1,-24)

-- state  47
,(-1,-25)
-- state  48
,( 2, 32),( 9, 29),( 24, 27)
,( 25, 30),( 26, 31),( 28, 33),(-1,-29)

-- state  49
,( 19, 50),( 20, 51),( 21, 52),( 22, 53)
,(-1,-32)
-- state  50
,(-1,-34)
-- state  51
,(-1,-35)
-- state  52
,(-1,-36)

-- state  53
,( 3, 66),(-1,-1000)
-- state  54
,( 2, 68),( 25, 67)
,(-1,-1000)
-- state  55
,( 17, 43),( 18, 44),( 27, 69)
,(-1,-1000)
-- state  56
,( 2, 71),( 29, 70),(-1,-1000)

-- state  57
,(-1,-50)
-- state  58
,(-1,-12)
-- state  59
,(-1,-9)
-- state  60
,(-1,-16)

-- state  61
,( 16, 41),( 17, 43),( 18, 44),(-1,-27)

-- state  62
,(-1,-17)
-- state  63
,( 2, 32),( 9, 29),( 24, 27)
,( 25, 30),( 26, 31),( 28, 33),(-1,-28)

-- state  64
,(-1,-22)
-- state  65
,( 8, 74),(-1,-1000)
-- state  66
,( 15, 75)
,( 23, 76),(-1,-1000)
-- state  67
,(-1,-43)
-- state  68
,(-1,-51)

-- state  69
,(-1,-44)
-- state  70
,(-1,-46)
-- state  71
,( 30, 77),(-1,-49)

-- state  72
,( 2, 71),( 29, 78),(-1,-1000)
-- state  73
,(-1,-15)

-- state  74
,(-1,-23)
-- state  75
,( 3, 79),( 23, 80),(-1,-1000)

-- state  76
,(-1,-39)
-- state  77
,( 2, 81),(-1,-1000)
-- state  78
,(-1,-47)

-- state  79
,( 23, 82),(-1,-1000)
-- state  80
,(-1,-38)
-- state  81
,(-1,-48)

-- state  82
,(-1,-37)
);
--  The offset vector
SHIFT_REDUCE_OFFSET : array (0.. 82) of Integer :=
( 0,
 1, 3, 5, 9, 11, 12, 13, 14, 15, 16,
 18, 19, 20, 23, 34, 37, 38, 39, 48, 55,
 59, 60, 61, 64, 71, 78, 83, 84, 85, 86,
 87, 94, 95, 97, 99, 100, 102, 106, 113, 114,
 118, 119, 120, 127, 128, 131, 132, 133, 140, 145,
 146, 147, 148, 150, 153, 157, 160, 161, 162, 163,
 164, 168, 169, 176, 177, 179, 182, 183, 184, 185,
 186, 188, 191, 192, 193, 196, 197, 199, 200, 202,
 203, 204);
end Parse_Shift_Reduce;
