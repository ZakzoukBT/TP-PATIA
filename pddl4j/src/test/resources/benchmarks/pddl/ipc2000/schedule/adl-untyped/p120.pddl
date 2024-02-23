(define (problem schedule-41-2)
(:domain schedule)
(:objects
    R1
    P1
    Q1
    O1
    N1
    M1
    L1
    K1
    J1
    I1
    H1
    G1
    F1
    E1
    D1
    C1
    B1
    A1
    Z0
    W0
    V0
    U0
    S0
    R0
    P0
    Q0
    O0
    N0
    M0
    L0
    K0
    J0
    I0
    H0
    G0
    F0
    E0
    D0
    C0
    CIRCULAR
    TWO
    THREE
    BLUE
    YELLOW
    BACK
    RED
    B0
    FRONT
    ONE
    BLACK
    OBLONG
    A0
)
(:init
    (SHAPE A0 CYLINDRICAL)
    (SURFACE-CONDITION A0 POLISHED)
    (PAINTED A0 BLACK)
    (HAS-HOLE A0 ONE FRONT)
    (TEMPERATURE A0 COLD)
    (SHAPE B0 OBLONG)
    (SURFACE-CONDITION B0 POLISHED)
    (PAINTED B0 BLACK)
    (HAS-HOLE B0 THREE BACK)
    (TEMPERATURE B0 COLD)
    (SHAPE C0 CYLINDRICAL)
    (SURFACE-CONDITION C0 POLISHED)
    (PAINTED C0 RED)
    (HAS-HOLE C0 ONE FRONT)
    (TEMPERATURE C0 COLD)
    (SHAPE D0 CYLINDRICAL)
    (SURFACE-CONDITION D0 SMOOTH)
    (PAINTED D0 YELLOW)
    (HAS-HOLE D0 ONE FRONT)
    (TEMPERATURE D0 COLD)
    (SHAPE E0 CYLINDRICAL)
    (SURFACE-CONDITION E0 SMOOTH)
    (PAINTED E0 BLACK)
    (HAS-HOLE E0 ONE BACK)
    (TEMPERATURE E0 COLD)
    (SHAPE F0 CIRCULAR)
    (SURFACE-CONDITION F0 SMOOTH)
    (PAINTED F0 BLACK)
    (HAS-HOLE F0 ONE BACK)
    (TEMPERATURE F0 COLD)
    (SHAPE G0 OBLONG)
    (SURFACE-CONDITION G0 SMOOTH)
    (PAINTED G0 BLACK)
    (HAS-HOLE G0 ONE FRONT)
    (TEMPERATURE G0 COLD)
    (SHAPE H0 CIRCULAR)
    (SURFACE-CONDITION H0 ROUGH)
    (PAINTED H0 BLUE)
    (HAS-HOLE H0 TWO FRONT)
    (TEMPERATURE H0 COLD)
    (SHAPE I0 CIRCULAR)
    (SURFACE-CONDITION I0 POLISHED)
    (PAINTED I0 BLUE)
    (HAS-HOLE I0 ONE BACK)
    (TEMPERATURE I0 COLD)
    (SHAPE J0 OBLONG)
    (SURFACE-CONDITION J0 POLISHED)
    (PAINTED J0 RED)
    (HAS-HOLE J0 THREE FRONT)
    (TEMPERATURE J0 COLD)
    (SHAPE K0 OBLONG)
    (SURFACE-CONDITION K0 SMOOTH)
    (PAINTED K0 BLUE)
    (HAS-HOLE K0 THREE FRONT)
    (TEMPERATURE K0 COLD)
    (SHAPE L0 CYLINDRICAL)
    (SURFACE-CONDITION L0 SMOOTH)
    (PAINTED L0 YELLOW)
    (HAS-HOLE L0 TWO BACK)
    (TEMPERATURE L0 COLD)
    (SHAPE M0 CYLINDRICAL)
    (SURFACE-CONDITION M0 SMOOTH)
    (PAINTED M0 YELLOW)
    (HAS-HOLE M0 THREE FRONT)
    (TEMPERATURE M0 COLD)
    (SHAPE N0 CIRCULAR)
    (SURFACE-CONDITION N0 SMOOTH)
    (PAINTED N0 YELLOW)
    (HAS-HOLE N0 THREE FRONT)
    (TEMPERATURE N0 COLD)
    (SHAPE O0 OBLONG)
    (SURFACE-CONDITION O0 ROUGH)
    (PAINTED O0 RED)
    (HAS-HOLE O0 THREE FRONT)
    (TEMPERATURE O0 COLD)
    (SHAPE Q0 CYLINDRICAL)
    (SURFACE-CONDITION Q0 ROUGH)
    (PAINTED Q0 YELLOW)
    (HAS-HOLE Q0 TWO BACK)
    (TEMPERATURE Q0 COLD)
    (SHAPE P0 CIRCULAR)
    (SURFACE-CONDITION P0 SMOOTH)
    (PAINTED P0 BLUE)
    (HAS-HOLE P0 TWO BACK)
    (TEMPERATURE P0 COLD)
    (SHAPE R0 OBLONG)
    (SURFACE-CONDITION R0 POLISHED)
    (PAINTED R0 YELLOW)
    (HAS-HOLE R0 THREE BACK)
    (TEMPERATURE R0 COLD)
    (SHAPE S0 CYLINDRICAL)
    (SURFACE-CONDITION S0 ROUGH)
    (PAINTED S0 RED)
    (HAS-HOLE S0 TWO BACK)
    (TEMPERATURE S0 COLD)
    (SHAPE U0 CYLINDRICAL)
    (SURFACE-CONDITION U0 ROUGH)
    (PAINTED U0 BLACK)
    (HAS-HOLE U0 TWO FRONT)
    (TEMPERATURE U0 COLD)
    (SHAPE V0 OBLONG)
    (SURFACE-CONDITION V0 SMOOTH)
    (PAINTED V0 BLACK)
    (HAS-HOLE V0 THREE FRONT)
    (TEMPERATURE V0 COLD)
    (SHAPE W0 CIRCULAR)
    (SURFACE-CONDITION W0 POLISHED)
    (PAINTED W0 BLACK)
    (HAS-HOLE W0 TWO BACK)
    (TEMPERATURE W0 COLD)
    (SHAPE Z0 CIRCULAR)
    (SURFACE-CONDITION Z0 POLISHED)
    (PAINTED Z0 BLUE)
    (HAS-HOLE Z0 THREE BACK)
    (TEMPERATURE Z0 COLD)
    (SHAPE A1 CIRCULAR)
    (SURFACE-CONDITION A1 ROUGH)
    (PAINTED A1 BLUE)
    (HAS-HOLE A1 ONE BACK)
    (TEMPERATURE A1 COLD)
    (SHAPE B1 CYLINDRICAL)
    (SURFACE-CONDITION B1 POLISHED)
    (PAINTED B1 YELLOW)
    (HAS-HOLE B1 TWO FRONT)
    (TEMPERATURE B1 COLD)
    (SHAPE C1 CIRCULAR)
    (SURFACE-CONDITION C1 ROUGH)
    (PAINTED C1 BLUE)
    (HAS-HOLE C1 THREE BACK)
    (TEMPERATURE C1 COLD)
    (SHAPE D1 OBLONG)
    (SURFACE-CONDITION D1 POLISHED)
    (PAINTED D1 BLACK)
    (HAS-HOLE D1 TWO FRONT)
    (TEMPERATURE D1 COLD)
    (SHAPE E1 CYLINDRICAL)
    (SURFACE-CONDITION E1 ROUGH)
    (PAINTED E1 BLUE)
    (HAS-HOLE E1 TWO FRONT)
    (TEMPERATURE E1 COLD)
    (SHAPE F1 CYLINDRICAL)
    (SURFACE-CONDITION F1 SMOOTH)
    (PAINTED F1 RED)
    (HAS-HOLE F1 ONE BACK)
    (TEMPERATURE F1 COLD)
    (SHAPE G1 CYLINDRICAL)
    (SURFACE-CONDITION G1 POLISHED)
    (PAINTED G1 RED)
    (HAS-HOLE G1 THREE BACK)
    (TEMPERATURE G1 COLD)
    (SHAPE H1 CIRCULAR)
    (SURFACE-CONDITION H1 SMOOTH)
    (PAINTED H1 YELLOW)
    (HAS-HOLE H1 TWO BACK)
    (TEMPERATURE H1 COLD)
    (SHAPE I1 CYLINDRICAL)
    (SURFACE-CONDITION I1 ROUGH)
    (PAINTED I1 BLACK)
    (HAS-HOLE I1 THREE FRONT)
    (TEMPERATURE I1 COLD)
    (SHAPE J1 CIRCULAR)
    (SURFACE-CONDITION J1 SMOOTH)
    (PAINTED J1 YELLOW)
    (HAS-HOLE J1 ONE FRONT)
    (TEMPERATURE J1 COLD)
    (SHAPE K1 CYLINDRICAL)
    (SURFACE-CONDITION K1 ROUGH)
    (PAINTED K1 RED)
    (HAS-HOLE K1 TWO BACK)
    (TEMPERATURE K1 COLD)
    (SHAPE L1 CYLINDRICAL)
    (SURFACE-CONDITION L1 SMOOTH)
    (PAINTED L1 YELLOW)
    (HAS-HOLE L1 TWO BACK)
    (TEMPERATURE L1 COLD)
    (SHAPE M1 CIRCULAR)
    (SURFACE-CONDITION M1 POLISHED)
    (PAINTED M1 YELLOW)
    (HAS-HOLE M1 TWO FRONT)
    (TEMPERATURE M1 COLD)
    (SHAPE N1 CYLINDRICAL)
    (SURFACE-CONDITION N1 POLISHED)
    (PAINTED N1 BLUE)
    (HAS-HOLE N1 TWO FRONT)
    (TEMPERATURE N1 COLD)
    (SHAPE O1 CIRCULAR)
    (SURFACE-CONDITION O1 POLISHED)
    (PAINTED O1 BLUE)
    (HAS-HOLE O1 THREE BACK)
    (TEMPERATURE O1 COLD)
    (SHAPE Q1 CYLINDRICAL)
    (SURFACE-CONDITION Q1 POLISHED)
    (PAINTED Q1 RED)
    (HAS-HOLE Q1 ONE BACK)
    (TEMPERATURE Q1 COLD)
    (SHAPE P1 CYLINDRICAL)
    (SURFACE-CONDITION P1 SMOOTH)
    (PAINTED P1 RED)
    (HAS-HOLE P1 ONE BACK)
    (TEMPERATURE P1 COLD)
    (SHAPE R1 OBLONG)
    (SURFACE-CONDITION R1 POLISHED)
    (PAINTED R1 YELLOW)
    (HAS-HOLE R1 THREE FRONT)
    (TEMPERATURE R1 COLD)
    (CAN-ORIENT DRILL-PRESS BACK)
    (CAN-ORIENT PUNCH BACK)
    (CAN-ORIENT DRILL-PRESS FRONT)
    (CAN-ORIENT PUNCH FRONT)
    (HAS-PAINT IMMERSION-PAINTER YELLOW)
    (HAS-PAINT SPRAY-PAINTER YELLOW)
    (HAS-PAINT IMMERSION-PAINTER BLUE)
    (HAS-PAINT SPRAY-PAINTER BLUE)
    (HAS-PAINT IMMERSION-PAINTER BLACK)
    (HAS-PAINT SPRAY-PAINTER BLACK)
    (HAS-PAINT IMMERSION-PAINTER RED)
    (HAS-PAINT SPRAY-PAINTER RED)
    (HAS-BIT DRILL-PRESS THREE)
    (HAS-BIT PUNCH THREE)
    (HAS-BIT DRILL-PRESS TWO)
    (HAS-BIT PUNCH TWO)
    (HAS-BIT DRILL-PRESS ONE)
    (HAS-BIT PUNCH ONE)
    (PART R1)
    (PART P1)
    (PART Q1)
    (PART O1)
    (PART N1)
    (PART M1)
    (PART L1)
    (PART K1)
    (PART J1)
    (PART I1)
    (PART H1)
    (PART G1)
    (PART F1)
    (PART E1)
    (PART D1)
    (PART C1)
    (PART B1)
    (PART A1)
    (PART Z0)
    (PART W0)
    (PART V0)
    (PART U0)
    (PART S0)
    (PART R0)
    (PART P0)
    (PART Q0)
    (PART O0)
    (PART N0)
    (PART M0)
    (PART L0)
    (PART K0)
    (PART J0)
    (PART I0)
    (PART H0)
    (PART G0)
    (PART F0)
    (PART E0)
    (PART D0)
    (PART C0)
    (PART B0)
    (PART A0)
)
(:goal (and
    (SURFACE-CONDITION R1 SMOOTH)
    (PAINTED G0 YELLOW)
    (PAINTED J1 BLACK)
    (SURFACE-CONDITION M0 ROUGH)
    (PAINTED D1 RED)
    (SHAPE I0 CYLINDRICAL)
    (SURFACE-CONDITION D0 ROUGH)
    (PAINTED N1 RED)
    (PAINTED G1 BLACK)
    (PAINTED I1 BLUE)
    (SHAPE M1 CYLINDRICAL)
    (SHAPE W0 CYLINDRICAL)
    (SURFACE-CONDITION M1 SMOOTH)
    (SURFACE-CONDITION K1 POLISHED)
    (SURFACE-CONDITION B1 SMOOTH)
    (SURFACE-CONDITION L0 POLISHED)
    (SHAPE F0 CYLINDRICAL)
    (SURFACE-CONDITION O1 ROUGH)
    (PAINTED P0 RED)
    (SHAPE K0 CYLINDRICAL)
    (SURFACE-CONDITION Q0 POLISHED)
    (SURFACE-CONDITION E1 POLISHED)
    (SURFACE-CONDITION N1 SMOOTH)
    (SURFACE-CONDITION Q1 ROUGH)
    (PAINTED F1 YELLOW)
    (PAINTED L1 BLUE)
    (SHAPE H0 CYLINDRICAL)
    (SHAPE N0 CYLINDRICAL)
    (PAINTED F0 YELLOW)
    (PAINTED Z0 RED)
    (PAINTED Q1 BLUE)
    (PAINTED P1 YELLOW)
    (SURFACE-CONDITION S0 SMOOTH)
    (SURFACE-CONDITION C0 ROUGH)
    (SURFACE-CONDITION A0 SMOOTH)
    (SURFACE-CONDITION N0 POLISHED)
    (SURFACE-CONDITION J0 SMOOTH)
    (SURFACE-CONDITION L1 ROUGH)
    (SHAPE O0 CYLINDRICAL)
    (PAINTED C1 BLACK)
    (PAINTED N0 BLUE)
)))
