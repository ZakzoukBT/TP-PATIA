;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Hamiltonian cycle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain Hamilton_cycle)

(:requirements :strips :typing :adl)
(:types noeud
        arc
)


(:predicates 
    (init)                                                 ;init : Marque que le programme a été initialisé (lancé)
    (notInit)                                              ;notInit : Marque que le programme n'a pas encore été initialisé
    (liaison ?noeud1 - noeud ?noeud2 - noeud ?arc - arc)   ;liaison : Spécifie la laison des noeuds ?noeud1 et ?noeud2 à travers l'arc ?arc
    (noeudNonVisite ?noeud - noeud)                        ;noeudNonVisite : spécifie que le noeud ?noeud n'a pas été visité
    (noeudVisite ?noeud - noeud)                           ;noeudVisite : spécifie que le noeud ?noeud a été visitié
    (position ?noeud - noeud)                              ;position : spécifie qu'on se positionne sur le noeud ?noeud
    (goal)                                                 ;goal : Marque que le programme a terminé
)

;initialisation : Commence le programme en nous positionnant sur le noeud ?n
(:action initialisation
    :parameters (?n - noeud)
    :precondition (and (notInit))
    :effect (and (noeudVisite ?n) (not(noeudNonVisite ?n)) (not(notInit)) (init) (position ?n))
)

;deplacement : Déplace notre position du noeud ?n1 au noeud ?n2 passant par l'arc ?arc
(:action deplacement 
    :parameters (?n1 - noeud ?n2 - noeud ?arc - arc)
    :precondition (and (init) (liaison ?n1 ?n2 ?arc) (noeudVisite ?n1) (noeudNonVisite ?n2) (position ?n1))
    :effect (and (not(noeudNonVisite ?n2)) (noeudVisite ?n2) (not(position ?n1)) (position ?n2))
)

;isHamiltonCycle : Vérifie l'existance d'un HamiltonCycle
(:action isHamiltonCycle
    :parameters (?n - noeud)
    :precondition (and (forall (?n) (not(noeudNonVisite ?n))))
    :effect (and (goal))
)

)