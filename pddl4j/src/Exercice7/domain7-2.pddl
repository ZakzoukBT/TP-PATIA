(define (domain turingmachinegeneral)

(:requirements :strips :typing)
(:types etat 
        caractere
        symbole
        transition)

(:predicates 
    (lit ?c - caractere)
    (aDroite ?c1 - caractere ?c2 - caractere)
    (estCarac ?c - caractere ?s - symbole)
    (etatCourant ?q - etat)
    (estEtatFinal ?q - etat)

    (changeEtatEcritCaracDeplaceGauche ?t - transition ?qi - etat ?qf - etat ?s1 - symbole ?s2 - symbole)
    (changeEtatEcritCaracDeplaceDroite ?t - transition ?qi - etat ?qf - etat ?s1 - symbole ?s2 - symbole)
    (changeEtatEcritCarac ?t - transition ?qi - etat ?qf - etat ?s1 - symbole ?s2 - symbole)

    (changeEtatDeplaceGauche ?t - transition ?qi - etat ?qf - etat ?s1 - symbole)
    (changeEtatDeplaceDroite ?t - transition ?qi - etat ?qf - etat ?s1 - symbole) 
    (changeEtat ?t - transition ?qi - etat ?qf - etat ?s1 - symbole)

    (ecritCaracDeplaceGauche ?t - transition ?qi - etat ?s1 - symbole ?s2 - symbole)
    (ecritCaracDeplaceDroite ?t - transition ?qi - etat ?s1 - symbole ?s2 - symbole)
    (ecritCarac ?t - transition ?qi - etat ?s1 - symbole ?s2 - symbole)

    (litCaracDeplaceGauche ?t - transition ?qi - etat ?s1 - symbole)
    (litCaracDeplaceDroite ?t - transition ?qi - etat ?s1 - symbole)
)
(:action changerEtatEcrireCaracDeplacerGauche
    :parameters (?t - transition ?qi - etat ?qf - etat ?c1 - caractere ?c2 - caractere ?s1 - symbole ?s2 - symbole)
    :precondition (and (changeEtatEcritCaracDeplaceGauche ?t ?qi ?qf ?s1 ?s2)
                       (etatCourant ?qi)
                       (aDroite ?c2 ?c1)
                       (lit ?c1)
                       (estCarac ?c1 ?s1))
    :effect (and (not (etatCourant ?qi))
                 (etatCourant ?qf)
                 (not (lit ?c1))
                 (lit ?c2)
                 (not (estCarac ?c1 ?s1))
                 (estCarac ?c1 ?s2)
    )
)
(:action changerEtatEcrireCaracDeplacerDroite
    :parameters (?t - transition ?qi - etat ?qf - etat ?c1 - caractere ?c2 - caractere ?s1 - symbole ?s2 - symbole)
    :precondition (and (changeEtatEcritCaracDeplaceDroite ?t ?qi ?qf ?s1 ?s2)
                       (etatCourant ?qi)
                       (aDroite ?c1 ?c2)
                       (lit ?c1)
                       (estCarac ?c1 ?s1))
    :effect (and (not (etatCourant ?qi))
                 (etatCourant ?qf)
                 (not (lit ?c1))
                 (lit ?c2)
                 (not (estCarac ?c1 ?s1))
                 (estCarac ?c1 ?s2)
    )
)

(:action changerEtatEcrireCarac
    :parameters (?t - transition ?qi - etat ?qf - etat ?c1 - caractere ?s1 - symbole ?s2 - symbole)
    :precondition (and (changeEtatEcritCarac ?t ?qi ?qf ?s1 ?s2)
                       (etatCourant ?qi)
                       (lit ?c1)
                       (estCarac ?c1 ?s1))
    :effect (and (not (etatCourant ?qi))
                 (etatCourant ?qf)
                 (not (estCarac ?c1 ?s1))
                 (estCarac ?c1 ?s2)
    )
)

(:action changerEtatDeplacerGauche
    :parameters (?t - transition ?qi - etat ?qf - etat ?c1 - caractere ?c2 - caractere ?s1 - symbole)
    :precondition (and (changeEtatDeplaceGauche ?t ?qi ?qf ?s1)
                       (etatCourant ?qi)
                       (aDroite ?c2 ?c1)
                       (lit ?c1)
                       (estCarac ?c1 ?s1))
    :effect (and (not (etatCourant ?qi))
                 (etatCourant ?qf)
                 (not (lit ?c1))
                 (lit ?c2)
    )
)

(:action changerEtatDeplacerDroite
    :parameters (?t - transition ?qi - etat ?qf - etat ?c1 - caractere ?c2 - caractere ?s1 - symbole)
    :precondition (and (changeEtatDeplaceDroite ?t ?qi ?qf ?s1)
                       (etatCourant ?qi)
                       (aDroite ?c1 ?c2)
                       (lit ?c1)
                       (estCarac ?c1 ?s1))
    :effect (and (not (etatCourant ?qi))
                 (etatCourant ?qf)
                 (not (lit ?c1))
                 (lit ?c2)
    )
)

(:action changerEtat
    :parameters (?t - transition ?qi - etat ?qf - etat ?c1 - caractere ?s1 - symbole)
    :precondition (and (changeEtat ?t ?qi ?qf ?s1)
                       (etatCourant ?qi)
                       (lit ?c1)
                       (estCarac ?c1 ?s1))
    :effect (and (not (etatCourant ?qi))
                 (etatCourant ?qf) 
    )
)

(:action ecrireCaracDeplacerGauche
    :parameters (?t - transition ?qi - etat ?c1 - caractere ?c2 - caractere ?s1 - symbole ?s2 - symbole)
    :precondition (and (ecritCaracDeplaceGauche ?t ?qi ?s1 ?s2)
                       (etatCourant ?qi)
                       (aDroite ?c2 ?c1)
                       (lit ?c1)
                       (estCarac ?c1 ?s1))
    :effect (and (not (lit ?c1))
                 (lit ?c2)
                 (not (estCarac ?c1 ?s1))
                 (estCarac ?c1 ?s2)
    )
)

(:action ecrireCaracDeplacerDroite
    :parameters (?t - transition ?qi - etat ?c1 - caractere ?c2 - caractere ?s1 - symbole ?s2 - symbole)
    :precondition (and (ecritCaracDeplaceDroite ?t ?qi ?s1 ?s2)
                       (etatCourant ?qi)
                       (aDroite ?c1 ?c2)
                       (lit ?c1)
                       (estCarac ?c1 ?s1))
    :effect (and (not (lit ?c1))
                 (lit ?c2)
                 (not (estCarac ?c1 ?s1))
                 (estCarac ?c1 ?s2)
    )
)

(:action ecrireCarac
    :parameters (?t - transition ?qi - etat ?c1 - caractere ?s1 - symbole ?s2 - symbole)
    :precondition (and (ecritCarac ?t ?qi ?s1 ?s2)
                       (etatCourant ?qi)
                       (lit ?c1)
                       (estCarac ?c1 ?s1))
    :effect (and (not (estCarac ?c1 ?s1))
                 (estCarac ?c1 ?s2)
    )
)

(:action lireCaracDeplacerGauche
    :parameters (?t - transition ?qi - etat ?c1 - caractere ?c2 - caractere ?s1 - symbole)
    :precondition (and (litCaracDeplaceGauche ?t ?qi ?s1)
                       (etatCourant ?qi)
                       (aDroite ?c2 ?c1)
                       (lit ?c1)
                       (estCarac ?c1 ?s1))
    :effect (and (not (lit ?c1))
                 (lit ?c2)
    )
)

(:action lireCaracDeplacerDroite
    :parameters (?t - transition ?qi - etat ?c1 - caractere ?c2 - caractere ?s1 - symbole)
    :precondition (and (litCaracDeplaceDroite ?t ?qi ?s1)
                       (etatCourant ?qi)
                       (aDroite ?c1 ?c2)
                       (lit ?c1)
                       (estCarac ?c1 ?s1))
    :effect (and (not (lit ?c1))
                 (lit ?c2)
    )
)
)