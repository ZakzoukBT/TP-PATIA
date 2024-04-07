(define (domain n-puzzle)

(:requirements :strips :typing)
(:types case caseVide emplacement)
(:predicates 
    (aVoisinDroit ?x - emplacement ?y - emplacement)
    (aVoisinHaut ?x - emplacement ?y - emplacement)
    (estLibre ?x - emplacement)
    (estSur ?x - case ?y - emplacement)
    (estVideSur ?x - caseVide ?y - emplacement)
    ;(plusPetit ?x - case ?y - case)
    ;(positionCorrecte ?x - case)
)

(:action deplacerHaut
    :parameters (?c1 - caseVide ?c2 - case ?e1 - emplacement ?e2 - emplacement)
    :precondition (and (estVideSur ?c1 ?e1) (estSur ?c2 ?e2) (aVoisinHaut ?e1 ?e2)) ;(estLibre ?e2)
    :effect(and (estVideSur ?c1 ?e2) (not (estVideSur ?c1 ?e1)) (estSur ?c2 ?e1) (not (estSur ?c2 ?e2)));(estLibre ?e1) (not (estLibre ?e2))
)

(:action deplacerBas
    :parameters (?c1 - caseVide ?c2 - case ?e1 - emplacement ?e2 - emplacement)
    :precondition (and (estVideSur ?c1 ?e1) (estSur ?c2 ?e2) (aVoisinHaut ?e2 ?e1)) ;(estLibre ?e2)
    :effect(and (estVideSur ?c1 ?e2) (not (estVideSur ?c1 ?e1)) (estSur ?c2 ?e1) (not (estSur ?c2 ?e2)));(estLibre ?e1) (not (estLibre ?e2))
)

(:action deplacerDroite
    :parameters (?c1 - caseVide ?c2 - case ?e1 - emplacement ?e2 - emplacement)
    :precondition (and (estVideSur ?c1 ?e1) (estSur ?c2 ?e2) (aVoisinDroit ?e1 ?e2)) ;(estLibre ?e2)
    :effect(and (estVideSur ?c1 ?e2) (not (estVideSur ?c1 ?e1)) (estSur ?c2 ?e1) (not (estSur ?c2 ?e2)));(estLibre ?e1) (not (estLibre ?e2))
)

(:action deplacerGauche
    :parameters (?c1 - caseVide ?c2 - case ?e1 - emplacement ?e2 - emplacement)
    :precondition (and (estVideSur ?c1 ?e1) (estSur ?c2 ?e2) (aVoisinDroit ?e2 ?e1)) ;(estLibre ?e2)
    :effect(and (estVideSur ?c1 ?e2) (not (estVideSur ?c1 ?e1)) (estSur ?c2 ?e1) (not (estSur ?c2 ?e2)));(estLibre ?e1) (not (estLibre ?e2))
)

; (:action bienPositionne
;     :parameters (?c1 - case ?c2 - case ?e1 - emplacement ?e2 - emplacement)
;     :precondition (and (estSur ?c1 ?e1) (estSur ?c2 ?e2) (aVoisinDroit ?e1 ?e2) (plusPetit ?c1 ?c2))
;     :effect (and (positionCorrecte ?c1))
; )
)