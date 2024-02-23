(define (domain graph-color)

(:requirements :strips :typing)
(:types noeud 
        no_color 
        color)
(:predicates 
    (sontVoisins ?x - noeud ?y - noeud)
    (estNonColore ?x - noeud)
    (aCouleur ?x - noeud ?y - color)
    (sontMarques ?x - noeud ?y - noeud)
    (pasMarques ?x - noeud ?y - noeud)
    (couleursDiff ?x - color ?y - color)
)

(:action colorer2Noeuds
    :parameters (?n1 - noeud ?n2 - noeud ?c1 - color ?c2 - color)
    :precondition (and (sontVoisins ?n1 ?n2) (sontVoisins ?n2 ?n1) (estNonColore ?n1) (estNonColore ?n2) (couleursDiff ?c1 ?c2))
    :effect (and (aCouleur ?n1 ?c1) (aCouleur ?n2 ?c2) (not (estNonColore ?n1)) (not (estNonColore ?n2)))
    )
    
(:action marquerArete
    :parameters (?n1 - noeud ?n2 - noeud ?c1 - color ?c2 - color)
    :precondition (and (aCouleur ?n1 ?c1) (aCouleur ?n2 ?c2) (sontVoisins ?n1 ?n2) (sontVoisins ?n2 ?n1) (pasMarques ?n1 ?n2) (couleursDiff ?c1 ?c2))
    :effect (and (not (pasMarques ?n1 ?n2)) (not (pasMarques ?n2 ?n1)) (sontMarques ?n1 ?n2) (sontMarques ?n2 ?n1))
    )

(:action colorer1Noeud
    :parameters (?n1 - noeud ?n2 - noeud ?c1 - color ?c2 - color)
    :precondition (and (sontVoisins ?n1 ?n2) (sontVoisins ?n2 ?n1) (estNonColore ?n2) (aCouleur ?n1 ?c1) (couleursDiff ?c1 ?c2))
    :effect (and (not (estNonColore ?n2)) (aCouleur ?n2 ?c2))
    )
)