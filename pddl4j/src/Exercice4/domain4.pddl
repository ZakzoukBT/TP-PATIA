;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Graph Coloring
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain graph-color)

(:requirements :strips :typing)
(:types noeud 
        no_color 
        color)
(:predicates 
    (sontVoisins ?x - noeud ?y - noeud)    ;sontVoisins : Spécifie que le noeud ?x a pour voisin le noeud ?y
    (estNonColore ?x - noeud)              ;estNonColore : Spécifie que le noeud ?x est non colore
    (aCouleur ?x - noeud ?y - color)       ;aCouleur : Spécifie que le noeud ?x a pour couleur ?y
    (sontMarques ?x - noeud ?y - noeud)    ;sontMarques : Spécifie que le passage du noeud ?x au noeud ?y est marqué
    (pasMarques ?x - noeud ?y - noeud)     ;pasMarques : Spécifie que le passage du noeud ?x au noeud ?y n'est pas marqué
    (couleursDiff ?x - color ?y - color)   ;couleursDiff : Spécifie que la couleur ?x est différente de la couleur ?y
)

;colorer2Noeuds : Colorie les noeuds non coloriés ?n1 et ?n2 avec des couleurs différentes ?c1 et ?c2
(:action colorer2Noeuds
    :parameters (?n1 - noeud ?n2 - noeud ?c1 - color ?c2 - color)
    :precondition (and (sontVoisins ?n1 ?n2) (sontVoisins ?n2 ?n1) (estNonColore ?n1) (estNonColore ?n2) (couleursDiff ?c1 ?c2))
    :effect (and (aCouleur ?n1 ?c1) (aCouleur ?n2 ?c2) (not (estNonColore ?n1)) (not (estNonColore ?n2)))
    )

;marquerArete : Marque le passage entre 2 noeuds ?n1 et ?n2 ayant des couleurs différentes ?c1 et ?c2
(:action marquerArete
    :parameters (?n1 - noeud ?n2 - noeud ?c1 - color ?c2 - color)
    :precondition (and (aCouleur ?n1 ?c1) (aCouleur ?n2 ?c2) (sontVoisins ?n1 ?n2) (sontVoisins ?n2 ?n1) (pasMarques ?n1 ?n2) (couleursDiff ?c1 ?c2))
    :effect (and (not (pasMarques ?n1 ?n2)) (not (pasMarques ?n2 ?n1)) (sontMarques ?n1 ?n2) (sontMarques ?n2 ?n1))
    )

;colorer1Noeud : Colorie un noeud ?n2 avec une couleur ?c2 différente de la couleur ?c1 du noeud ?n1 
(:action colorer1Noeud
    :parameters (?n1 - noeud ?n2 - noeud ?c1 - color ?c2 - color)
    :precondition (and (sontVoisins ?n1 ?n2) (sontVoisins ?n2 ?n1) (estNonColore ?n2) (aCouleur ?n1 ?c1) (couleursDiff ?c1 ?c2))
    :effect (and (not (estNonColore ?n2)) (aCouleur ?n2 ?c2))
    )
)