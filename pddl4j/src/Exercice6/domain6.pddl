(define (domain Hamilton_cycle)

(:requirements :strips :typing)
(:types noeud)


(:predicates 
    (init)
    (notInit)
    (liaison ?noeud1 - noeud ?noeud2 - noeud)
    (noeudNonVisite ?noeud - noeud)
    (noeudVisite ?noeud - noeud)
)


(:action initialisation
    :parameters (?n - noeud)
    :precondition (and (notInit))
    :effect (and (noeudVisite ?n) (not(notInit)) (init))
)

(:action deplacement 
    :parameters (?n1 - noeud ?n2 - noeud)
    :precondition (and (init) (liaison ?n1 ?n2) (noeudVisite ?n1) (noeudNonVisite ?n2))
    :effect (and (not(noeudNonVisite ?n2)) (noeudVisite ?n2))
)
)