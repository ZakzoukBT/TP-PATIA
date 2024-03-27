(define (domain turingmachine)

(:requirements :strips :typing)
(:types etat 
        caractere)

(:predicates 
    (lit ?c - caractere)
    (aDroite ?c1 - caractere ?c2 - caractere)
    (estBlanc ?c1 - caractere)
    (estZero ?c - caractere)
    (estUn ?c - caractere)
    (estEtatZero ?q - etat)
    (estEtatUn ?q - etat)
    (estEtatF ?q - etat)
    )

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
(:action decalageDroiteLitBlancDansEtat0
    :parameters (?q - etat ?c1 - caractere ?c2 - caractere)
    :precondition (and (estEtatZero ?q)
                       (lit ?c1)
                       (estZero ?c1)
                       (aDroite ?c1 ?c2))
    :effect (and (not (lit ?c1))
                 (lit ?c2))
)
(:action decalageDroiteLitUnDansEtat0
    :parameters (?q - etat ?c1 - caractere ?c2 - caractere)
    :precondition (and (estEtatZero ?q)
                       (lit ?c1)
                       (estUn ?c1)
                       (aDroite ?c1 ?c2))
    :effect (and (not (lit ?c1))
                 (lit ?c2))
)
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