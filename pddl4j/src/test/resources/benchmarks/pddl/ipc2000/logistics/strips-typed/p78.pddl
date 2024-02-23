(define (problem logistics-38-1)
(:domain logistics)
(:objects
    APN4
    APN3
    APN2
    APN1
 - AIRPLANE
    APT13
    APT12
    APT11
    APT10
    APT9
    APT8
    APT7
    APT6
    APT5
    APT4
    APT3
    APT2
    APT1
 - AIRPORT
    POS13
    POS12
    POS11
    POS10
    POS9
    POS8
    POS7
    POS6
    POS5
    POS4
    POS3
    POS2
    POS1
 - LOCATION
    CIT13
    CIT12
    CIT11
    CIT10
    CIT9
    CIT8
    CIT7
    CIT6
    CIT5
    CIT4
    CIT3
    CIT2
    CIT1
 - CITY
    TRU13
    TRU12
    TRU11
    TRU10
    TRU9
    TRU8
    TRU7
    TRU6
    TRU5
    TRU4
    TRU3
    TRU2
    TRU1
 - TRUCK
    OBJ133
    OBJ132
    OBJ131
    OBJ123
    OBJ122
    OBJ121
    OBJ113
    OBJ112
    OBJ111
    OBJ103
    OBJ102
    OBJ101
    OBJ93
    OBJ92
    OBJ91
    OBJ83
    OBJ82
    OBJ81
    OBJ73
    OBJ72
    OBJ71
    OBJ63
    OBJ62
    OBJ61
    OBJ53
    OBJ52
    OBJ51
    OBJ43
    OBJ42
    OBJ41
    OBJ33
    OBJ32
    OBJ31
    OBJ23
    OBJ22
    OBJ21
    OBJ13
    OBJ12
    OBJ11
 - PACKAGE
)
(:init
    (AT APN1 APT2)
    (AT APN2 APT13)
    (AT APN3 APT10)
    (AT APN4 APT1)
    (AT TRU1 POS1)
    (AT OBJ11 POS1)
    (AT OBJ12 POS1)
    (AT OBJ13 POS1)
    (AT TRU2 POS2)
    (AT OBJ21 POS2)
    (AT OBJ22 POS2)
    (AT OBJ23 POS2)
    (AT TRU3 POS3)
    (AT OBJ31 POS3)
    (AT OBJ32 POS3)
    (AT OBJ33 POS3)
    (AT TRU4 POS4)
    (AT OBJ41 POS4)
    (AT OBJ42 POS4)
    (AT OBJ43 POS4)
    (AT TRU5 POS5)
    (AT OBJ51 POS5)
    (AT OBJ52 POS5)
    (AT OBJ53 POS5)
    (AT TRU6 POS6)
    (AT OBJ61 POS6)
    (AT OBJ62 POS6)
    (AT OBJ63 POS6)
    (AT TRU7 POS7)
    (AT OBJ71 POS7)
    (AT OBJ72 POS7)
    (AT OBJ73 POS7)
    (AT TRU8 POS8)
    (AT OBJ81 POS8)
    (AT OBJ82 POS8)
    (AT OBJ83 POS8)
    (AT TRU9 POS9)
    (AT OBJ91 POS9)
    (AT OBJ92 POS9)
    (AT OBJ93 POS9)
    (AT TRU10 POS10)
    (AT OBJ101 POS10)
    (AT OBJ102 POS10)
    (AT OBJ103 POS10)
    (AT TRU11 POS11)
    (AT OBJ111 POS11)
    (AT OBJ112 POS11)
    (AT OBJ113 POS11)
    (AT TRU12 POS12)
    (AT OBJ121 POS12)
    (AT OBJ122 POS12)
    (AT OBJ123 POS12)
    (AT TRU13 POS13)
    (AT OBJ131 POS13)
    (AT OBJ132 POS13)
    (AT OBJ133 POS13)
    (IN-CITY POS1 CIT1)
    (IN-CITY APT1 CIT1)
    (IN-CITY POS2 CIT2)
    (IN-CITY APT2 CIT2)
    (IN-CITY POS3 CIT3)
    (IN-CITY APT3 CIT3)
    (IN-CITY POS4 CIT4)
    (IN-CITY APT4 CIT4)
    (IN-CITY POS5 CIT5)
    (IN-CITY APT5 CIT5)
    (IN-CITY POS6 CIT6)
    (IN-CITY APT6 CIT6)
    (IN-CITY POS7 CIT7)
    (IN-CITY APT7 CIT7)
    (IN-CITY POS8 CIT8)
    (IN-CITY APT8 CIT8)
    (IN-CITY POS9 CIT9)
    (IN-CITY APT9 CIT9)
    (IN-CITY POS10 CIT10)
    (IN-CITY APT10 CIT10)
    (IN-CITY POS11 CIT11)
    (IN-CITY APT11 CIT11)
    (IN-CITY POS12 CIT12)
    (IN-CITY APT12 CIT12)
    (IN-CITY POS13 CIT13)
    (IN-CITY APT13 CIT13)
)
(:goal (and
    (AT OBJ41 APT1)
    (AT OBJ43 APT3)
    (AT OBJ11 APT13)
    (AT OBJ21 APT7)
    (AT OBJ113 POS2)
    (AT OBJ32 APT12)
    (AT OBJ31 APT13)
    (AT OBJ123 POS3)
    (AT OBJ13 POS6)
    (AT OBJ122 POS4)
    (AT OBJ83 POS9)
    (AT OBJ82 POS13)
    (AT OBJ103 APT9)
    (AT OBJ81 POS8)
    (AT OBJ92 APT8)
    (AT OBJ12 APT9)
    (AT OBJ101 POS12)
    (AT OBJ132 APT4)
    (AT OBJ73 APT8)
    (AT OBJ63 APT3)
    (AT OBJ91 APT13)
    (AT OBJ133 APT3)
    (AT OBJ23 POS1)
    (AT OBJ42 APT1)
    (AT OBJ52 POS12)
    (AT OBJ131 APT6)
    (AT OBJ22 APT8)
    (AT OBJ112 POS12)
    (AT OBJ93 APT4)
    (AT OBJ62 APT5)
    (AT OBJ53 POS5)
    (AT OBJ61 POS11)
    (AT OBJ72 APT5)
    (AT OBJ33 APT3)
    (AT OBJ71 POS1)
    (AT OBJ111 POS2)
    (AT OBJ121 POS3)
    (AT OBJ102 POS10)
)
)
)
