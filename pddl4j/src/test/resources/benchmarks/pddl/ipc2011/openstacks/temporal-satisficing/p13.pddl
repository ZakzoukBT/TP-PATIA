(define (problem os-time-p37_1)
(:domain openstacks-time-nonADL-nonNegated)
(:objects 
n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 n19 n20 n21 n22 n23 n24 n25 n26 n27 n28 n29 n30 n31 n32 n33  - count
)

(:init
(next-count n0 n1) (next-count n1 n2) (next-count n2 n3) (next-count n3 n4) (next-count n4 n5) (next-count n5 n6) (next-count n6 n7) (next-count n7 n8) (next-count n8 n9) (next-count n9 n10) (next-count n10 n11) (next-count n11 n12) (next-count n12 n13) (next-count n13 n14) (next-count n14 n15) (next-count n15 n16) (next-count n16 n17) (next-count n17 n18) (next-count n18 n19) (next-count n19 n20) (next-count n20 n21) (next-count n21 n22) (next-count n22 n23) (next-count n23 n24) (next-count n24 n25) (next-count n25 n26) (next-count n26 n27) (next-count n27 n28) (next-count n28 n29) (next-count n29 n30) (next-count n30 n31) (next-count n31 n32) (next-count n32 n33) 
(stacks-avail n33)

(waiting o1)
(includes o1 p6)(includes o1 p15)(includes o1 p22)(includes o1 p30)(includes o1 p35)

(waiting o2)
(includes o2 p11)(includes o2 p15)(includes o2 p22)

(waiting o3)
(includes o3 p4)(includes o3 p6)(includes o3 p17)(includes o3 p20)

(waiting o4)
(includes o4 p6)(includes o4 p9)(includes o4 p11)(includes o4 p14)(includes o4 p31)

(waiting o5)
(includes o5 p31)

(waiting o6)
(includes o6 p2)(includes o6 p4)(includes o6 p16)(includes o6 p19)

(waiting o7)
(includes o7 p19)(includes o7 p22)(includes o7 p23)(includes o7 p35)

(waiting o8)
(includes o8 p3)(includes o8 p15)(includes o8 p17)(includes o8 p30)

(waiting o9)
(includes o9 p7)(includes o9 p11)(includes o9 p13)(includes o9 p22)(includes o9 p25)(includes o9 p32)

(waiting o10)
(includes o10 p4)(includes o10 p18)(includes o10 p21)(includes o10 p23)(includes o10 p35)

(waiting o11)
(includes o11 p6)(includes o11 p10)(includes o11 p20)(includes o11 p22)(includes o11 p30)(includes o11 p32)(includes o11 p36)

(waiting o12)
(includes o12 p5)(includes o12 p17)(includes o12 p29)(includes o12 p31)(includes o12 p33)

(waiting o13)
(includes o13 p16)(includes o13 p35)

(waiting o14)
(includes o14 p7)(includes o14 p8)(includes o14 p18)(includes o14 p21)(includes o14 p23)(includes o14 p35)(includes o14 p37)

(waiting o15)
(includes o15 p3)(includes o15 p7)(includes o15 p8)(includes o15 p11)(includes o15 p18)(includes o15 p19)(includes o15 p20)(includes o15 p23)

(waiting o16)
(includes o16 p23)(includes o16 p24)(includes o16 p25)(includes o16 p26)(includes o16 p28)

(waiting o17)
(includes o17 p21)(includes o17 p23)(includes o17 p32)(includes o17 p35)

(waiting o18)
(includes o18 p16)(includes o18 p18)(includes o18 p24)(includes o18 p30)(includes o18 p36)

(waiting o19)
(includes o19 p6)(includes o19 p14)(includes o19 p22)(includes o19 p23)(includes o19 p30)(includes o19 p37)

(waiting o20)
(includes o20 p23)(includes o20 p27)(includes o20 p34)

(waiting o21)
(includes o21 p1)(includes o21 p7)(includes o21 p16)

(waiting o22)
(includes o22 p5)(includes o22 p11)(includes o22 p17)(includes o22 p29)(includes o22 p31)(includes o22 p33)

(waiting o23)
(includes o23 p2)(includes o23 p16)(includes o23 p18)

(waiting o24)
(includes o24 p10)(includes o24 p29)

(waiting o25)
(includes o25 p13)(includes o25 p14)(includes o25 p24)(includes o25 p35)(includes o25 p37)

(waiting o26)
(includes o26 p5)(includes o26 p33)

(waiting o27)
(includes o27 p11)(includes o27 p12)(includes o27 p17)(includes o27 p33)

(waiting o28)
(includes o28 p3)(includes o28 p23)(includes o28 p26)(includes o28 p37)

(waiting o29)
(includes o29 p1)(includes o29 p16)

(waiting o30)
(includes o30 p5)(includes o30 p11)

(waiting o31)
(includes o31 p7)(includes o31 p37)

(waiting o32)
(includes o32 p1)(includes o32 p7)(includes o32 p8)(includes o32 p10)(includes o32 p14)(includes o32 p19)

(waiting o33)
(includes o33 p11)

(waiting o34)
(includes o34 p17)

(waiting o35)
(includes o35 p10)(includes o35 p33)

(waiting o36)
(includes o36 p25)

(waiting o37)
(includes o37 p21)(includes o37 p37)

(not-made p1)
(not-made p2)
(not-made p3)
(not-made p4)
(not-made p5)
(not-made p6)
(not-made p7)
(not-made p8)
(not-made p9)
(not-made p10)
(not-made p11)
(not-made p12)
(not-made p13)
(not-made p14)
(not-made p15)
(not-made p16)
(not-made p17)
(not-made p18)
(not-made p19)
(not-made p20)
(not-made p21)
(not-made p22)
(not-made p23)
(not-made p24)
(not-made p25)
(not-made p26)
(not-made p27)
(not-made p28)
(not-made p29)
(not-made p30)
(not-made p31)
(not-made p32)
(not-made p33)
(not-made p34)
(not-made p35)
(not-made p36)
(not-made p37)
)

(:goal
(and
(shipped o1)
(shipped o2)
(shipped o3)
(shipped o4)
(shipped o5)
(shipped o6)
(shipped o7)
(shipped o8)
(shipped o9)
(shipped o10)
(shipped o11)
(shipped o12)
(shipped o13)
(shipped o14)
(shipped o15)
(shipped o16)
(shipped o17)
(shipped o18)
(shipped o19)
(shipped o20)
(shipped o21)
(shipped o22)
(shipped o23)
(shipped o24)
(shipped o25)
(shipped o26)
(shipped o27)
(shipped o28)
(shipped o29)
(shipped o30)
(shipped o31)
(shipped o32)
(shipped o33)
(shipped o34)
(shipped o35)
(shipped o36)
(shipped o37)
))

(:metric minimize (total-time))

)

