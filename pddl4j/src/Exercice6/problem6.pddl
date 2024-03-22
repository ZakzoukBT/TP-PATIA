(define (problem problem6) 
(:domain Hamilton_cycle)
(:objects A B C D - noeud
          a1 a2 a3 a4 a5 a6 a7 - arc
)

(:init
    (liaison A B a1)
    (liaison A B a7)
    (liaison A D a6)
    (liaison B A a1)
    (liaison B A a7)
    (liaison B D a5)
    (liaison B C a2)
    (liaison B C a3)
    (liaison D A a6)
    (liaison D B a5)
    (liaison D C a4)
    (liaison C B a2)
    (liaison C B a3)
    (liaison C D a4)
    (noeudNonVisite A)
    (noeudNonVisite B)
    (noeudNonVisite C)
    (noeudNonVisite D)
    (notInit)
)

(:goal (and
    (goal)
)
)
)
