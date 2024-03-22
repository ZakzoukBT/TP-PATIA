(define (domain Hamilton_cycle)

(:requirements :strips :typing :adl)
(:types noeud
        arc
)


(:predicates 
    (init)
    (notInit)
    (liaison ?noeud1 - noeud ?noeud2 - noeud ?arc - arc)
    (noeudNonVisite ?noeud - noeud)
    (noeudVisite ?noeud - noeud)
    (position ?noeud - noeud)
    (goal)
)


(:action initialisation
    :parameters (?n - noeud)
    :precondition (and (notInit))
    :effect (and (noeudVisite ?n) (not(noeudNonVisite ?n)) (not(notInit)) (init) (position ?n))
)

(:action deplacement 
    :parameters (?n1 - noeud ?n2 - noeud ?arc - arc)
    :precondition (and (init) (liaison ?n1 ?n2 ?arc) (noeudVisite ?n1) (noeudNonVisite ?n2) (position ?n1))
    :effect (and (not(noeudNonVisite ?n2)) (noeudVisite ?n2) (not(position ?n1)) (position ?n2))
)

(:action isHamiltonCycle
    :parameters (?n - noeud)
    :precondition (and (forall (?n) (not(noeudNonVisite ?n))))
    :effect (and (goal))
)

)