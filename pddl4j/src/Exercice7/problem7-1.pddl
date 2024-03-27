(define (problem problem7-1) 
(:domain turingmachine)
(:objects etatCourant - etat
          c0 c1 c2 c3 c4 c5 - caractere
)

(:init
    (estEtatZero etatCourant)
    (estBlanc c0)
    (estUn c1)
    (estZero c2)
    (estZero c3)
    (estUn c4)
    (estBlanc c5)
    (aDroite c0 c1)
    (aDroite c1 c2)
    (aDroite c2 c3)
    (aDroite c3 c4)
    (aDroite c4 c5)
    (lit c1)
)

(:goal (and (estEtatF etatCourant)))
)
