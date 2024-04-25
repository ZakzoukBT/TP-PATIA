;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Specified Turing Machine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain turingmachine)

(:requirements :strips :typing)
(:types etat 
        caractere)

(:predicates 
    (lit ?c - caractere)                         ;lit : Marque la lecture d'un caractère ?c
    (aDroite ?c1 - caractere ?c2 - caractere)    ;aDroite : Spécifie que le caractère ?c2 se situe à la droite de ?c1
    (estBlanc ?c - caractere)                   ;estBlanc : Marque que le caractère ?c est blanc 
    (estZero ?c - caractere)                     ;estZero : Marque que le caractère ?c est 0
    (estUn ?c - caractere)                       ;estUn : Marque que le caractère ?c est 1
    (estEtatZero ?q - etat)                      ;estEtatZero : Marque que l'état ?q est à 0
    (estEtatUn ?q - etat)                        ;estEtatUn : Marque que l'état ?q est à 1
    (estEtatF ?q - etat)                         ;estEtatF : Marque que l'état ?q est final
    )

;decalageGaucheLitBlancChangeEtat1 : Lit le caractère ?c1 (est blanc) à l'état ?q (à 0) puis décale la lecture sur le caractère gauche ?c2 tout en changeant l'état ?q à 1
(:action decalageGaucheLitBlancChangeEtat1
    :parameters (?q - etat ?c1 - caractere ?c2 - caractere)
    :precondition (and (estEtatZero ?q)
                       (lit ?c1)
                       (estBlanc ?c1)
                       (aDroite ?c2 ?c1))
    :effect (and (not (estEtatZero ?q))
                 (estEtatUn ?q)
                 (not (lit ?c1))
                 (lit ?c2))
)

;decalageDroiteLitBlancDansEtat0 : Lit le caractère ?c1 (à 0) à l'état ?q (à 0) puis décale la lecture sur le caractère droit ?c2
(:action decalageDroiteLitBlancDansEtat0
    :parameters (?q - etat ?c1 - caractere ?c2 - caractere)
    :precondition (and (estEtatZero ?q)
                       (lit ?c1)
                       (estZero ?c1)
                       (aDroite ?c1 ?c2))
    :effect (and (not (lit ?c1))
                 (lit ?c2))
)

;decalageDroiteLitUnDansEtat0 : Lit le caractère ?c1 (à 1) à l'état ?q (à 0) puis décale la lecture sur le caractère droit ?c2
(:action decalageDroiteLitUnDansEtat0
    :parameters (?q - etat ?c1 - caractere ?c2 - caractere)
    :precondition (and (estEtatZero ?q)
                       (lit ?c1)
                       (estUn ?c1)
                       (aDroite ?c1 ?c2))
    :effect (and (not (lit ?c1))
                 (lit ?c2))
)

;litBlancEcritUnChangeEtatFinal : Lit le caractère ?c (est blanc) à l'état ?q (à 1) puis modifie le caractère ?c en un caractère 1 et change l'état ?q à final
(:action litBlancEcritUnChangeEtatFinal
    :parameters (?q - etat ?c - caractere)
    :precondition (and (estEtatUn ?q)
                       (lit ?c)
                       (estBlanc ?c))
    :effect (and (not (estEtatUn ?q))
                 (estEtatF ?q)
                 (not (estBlanc ?c))
                 (estUn ?c))
)

;litZeroEcritUnChangeEtatFinal : Lit le caractère ?c1 (à 0) à l'état ?q (à 1) puis modifie le caractère ?c en un caractère 1 et change l'état ?q à final
(:action litZeroEcritUnChangeEtatFinal
    :parameters (?q - etat ?c - caractere)
    :precondition (and (estEtatUn ?q)
                       (lit ?c)
                       (estZero ?c))
    :effect (and (not (estEtatUn ?q))
                 (estEtatF ?q)
                 (not (estZero ?c))
                 (estUn ?c))
)
;decalageGaucheLitUnEcritZeroDansEtat1 : Lit le caractère ?c1 (à 1) à l'état ?q (à 1) puis modifie le caractère ?c en un caractère 1 tout en décalant la lecture sur le caractère gauche ?c2
(:action decalageGaucheLitUnEcritZeroDansEtat1
    :parameters (?q - etat ?c1 - caractere ?c2 - caractere)
    :precondition (and (estEtatUn ?q)
                       (lit ?c1)
                       (estUn ?c1)
                       (aDroite ?c2 ?c1))
    :effect (and (not (lit ?c1))
                 (lit ?c2)
                 (not (estUn ?c1))
                 (estZero ?c1))
)
)