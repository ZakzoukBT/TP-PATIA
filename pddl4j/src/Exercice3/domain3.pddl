;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; N-puzzle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain n-puzzle)

(:requirements :strips :typing)
(:types case caseVide emplacement)
(:predicates 
    (aVoisinDroit ?x - emplacement ?y - emplacement)   ;aVoisinDroit : Spécifie le voisin droit ?y d'un emplacement ?x (indiréctement le voisin gauche ?x de l'emplacement ?y)
    (aVoisinHaut ?x - emplacement ?y - emplacement)    ;aVoisinHaut : Spécifie le voisin haut ?y d'un emplacement ?x (indiréctement le voisin bas ?x de l'emplacement ?y)
    (estSur ?x - case ?y - emplacement)                ;estSur : Lie une case ?x à un emplacement ?y
    (estVideSur ?x - caseVide ?y - emplacement)        ;estVideSur : Spécifie qu'un emplacement ?y est libre de toutes cases ?x
)

;deplacerHaut : Déplace la case vide ?c1 à l'emplacement voisin haut ?e2 
;               modifiant ainsi l'emplacement de la case du haut ?c2 par l'emplacement de la case vide ?e1
(:action deplacerHaut
    :parameters (?c1 - caseVide ?c2 - case ?e1 - emplacement ?e2 - emplacement)
    :precondition (and (estVideSur ?c1 ?e1) (estSur ?c2 ?e2) (aVoisinHaut ?e1 ?e2))
    :effect(and (estVideSur ?c1 ?e2) (not (estVideSur ?c1 ?e1)) (estSur ?c2 ?e1) (not (estSur ?c2 ?e2)))
)

;deplacerBas : Déplace la case vide ?c1 à l'emplacement voisin bas ?e2 
;              modifiant ainsi l'emplacement de la case du bas ?c2 par l'emplacement de la case vide ?e1
(:action deplacerBas
    :parameters (?c1 - caseVide ?c2 - case ?e1 - emplacement ?e2 - emplacement)
    :precondition (and (estVideSur ?c1 ?e1) (estSur ?c2 ?e2) (aVoisinHaut ?e2 ?e1))
    :effect(and (estVideSur ?c1 ?e2) (not (estVideSur ?c1 ?e1)) (estSur ?c2 ?e1) (not (estSur ?c2 ?e2)))
)

;deplacerDroite : Déplace la case vide ?c1 à l'emplacement voisin droite ?e2 
;                 modifiant ainsi l'emplacement de la case du droite ?c2 par l'emplacement de la case vide ?e1
(:action deplacerDroite
    :parameters (?c1 - caseVide ?c2 - case ?e1 - emplacement ?e2 - emplacement)
    :precondition (and (estVideSur ?c1 ?e1) (estSur ?c2 ?e2) (aVoisinDroit ?e1 ?e2))
    :effect(and (estVideSur ?c1 ?e2) (not (estVideSur ?c1 ?e1)) (estSur ?c2 ?e1) (not (estSur ?c2 ?e2)))
)

;deplacerGauche : Déplace la case vide ?c1 à l'emplacement voisin gauche ?e2 
;               modifiant ainsi l'emplacement de la case du gauche ?c2 par l'emplacement de la case vide ?e1
(:action deplacerGauche
    :parameters (?c1 - caseVide ?c2 - case ?e1 - emplacement ?e2 - emplacement)
    :precondition (and (estVideSur ?c1 ?e1) (estSur ?c2 ?e2) (aVoisinDroit ?e2 ?e1))
    :effect(and (estVideSur ?c1 ?e2) (not (estVideSur ?c1 ?e1)) (estSur ?c2 ?e1) (not (estSur ?c2 ?e2)))
)
)