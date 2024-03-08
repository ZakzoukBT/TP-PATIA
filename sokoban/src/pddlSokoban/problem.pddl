(define (problem problemSokoban)
(:domain sokoban)
(:objects a1 - agent
    e1 e2 e3 e4 e5 e6 e7 - sol
    c1 - cible
    b1 - boite
)
(:init  (aVoisinDroit e1 e2)
        (aVoisinDroit e3 e4)
        (aVoisinDroit c1 e5)
        (aVoisinHaut e7 e6)
        (aVoisinHaut e6 e5)
        (aVoisinHaut e5 e4)
        (aVoisinHaut c1 e3)
        (aVoisinHaut e4 e2)
        (aVoisinHaut e3 e1)
        (estSur a1 e7)
        (estSur b1 e3)
        (estLibre e1)
        (estLibre e2)
        (estLibre e4)
        (estLibre e5)
        (estLibre e6)
        (estLibre c1)
)

(:goal (and (cibleAtteinte c1))
)

)