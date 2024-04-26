;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; General Turing Machine
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain turingmachinegeneral)

(:requirements :strips :typing)
(:types etat 
        caractere
        symbole
        transition)

(:predicates 
    (lit ?c - caractere)                 ;lit : Marque la lecture d'un caractère ?c
    (aDroite ?c1 - caractere ?c2 - caractere)   ;aDroite : Spécifie que le caractère ?c2 se situe à la droite de ?c1
    (estCarac ?c - caractere ?s - symbole);estCarac : Spécifie que le caractère ?c sur la bande contient le symbole ?s
    (etatCourant ?q - etat)               ;etatCourant : Spécifie que l'état ?q est l'état courant de la MT

    ;Prédicats qui expriment les différentes fonctions de transitions existantes pour la MT donnée (écrits sous la forme de quintuplets)

    (changeEtatEcritCaracDeplaceGauche ?t - transition ?qi - etat ?qf - etat ?s1 - symbole ?s2 - symbole)   
    ;changeEtatEcritCaracDeplaceGauche : traduit la transition suivante (qi, s1, L, s2, qf)
    (changeEtatEcritCaracDeplaceDroite ?t - transition ?qi - etat ?qf - etat ?s1 - symbole ?s2 - symbole)
    ;changeEtatEcritCaracDeplaceDroite : traduit la transition suivante (qi, s1, R, s2, qf)
    (changeEtatEcritCarac ?t - transition ?qi - etat ?qf - etat ?s1 - symbole ?s2 - symbole)
    ;changeEtatEcritCarac : traduit la transition suivante (qi, s1, N, s2, qf) (N: signifie que la tête de lecture ne se déplace pas après l'action de lecture/écriture

    (changeEtatDeplaceGauche ?t - transition ?qi - etat ?qf - etat ?s1 - symbole)
    ;changeEtatDeplaceGauche : traduit la transition suivante (qi, s1, L, s1, qf)
    (changeEtatDeplaceDroite ?t - transition ?qi - etat ?qf - etat ?s1 - symbole) 
    ;changeEtatDeplaceDroite : traduit la transition suivante (qi, s1, R, s1, qf)
    (changeEtat ?t - transition ?qi - etat ?qf - etat ?s1 - symbole)
    ;changeEtat : traduit la transition suivante (qi, s1, N, s1, qf)

    (ecritCaracDeplaceGauche ?t - transition ?qi - etat ?s1 - symbole ?s2 - symbole)
    ;ecritCaracDeplaceGauche : traduit la transition suivante (qi, s1, L, s2, qi)
    (ecritCaracDeplaceDroite ?t - transition ?qi - etat ?s1 - symbole ?s2 - symbole)
    ;ecritCaracDeplaceDroite : traduit la transition suivante (qi, s1, R, s2, qi)
    (ecritCarac ?t - transition ?qi - etat ?s1 - symbole ?s2 - symbole)
    ;ecritCarac : traduit la transition suivante (qi, s1, N, s2, qi)

    (litCaracDeplaceGauche ?t - transition ?qi - etat ?s1 - symbole)
    ;litCaracDeplaceGauche : traduit la transition suivante (qi, s1, L, s1, qi)
    (litCaracDeplaceDroite ?t - transition ?qi - etat ?s1 - symbole)
    ;litCaracDeplaceDroite : traduit la transition suivante (qi, s1, R, s1, qi)
)

;changerEtatEcrireCaracDeplacerGauche : Applique la fonction de transition ?t (qi, s1, L, s2, qf) en ayant la tête de lecture sur le caractère ?c1 et en se déplaçant sur caractère ?c2 à sa gauche
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

;changerEtatEcrireCaracDeplacerDroite : Applique la fonction de transition ?t (qi, s1, R, s2, qf) en ayant la tête de lecture sur le caractère ?c1 et en se déplaçant sur caractère ?c2 à sa droite
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

;changerEtatEcrireCarac : Applique la fonction de transition ?t (qi, s1, N, s2, qf) en ayant la tête de lecture sur le caractère ?c1
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

;changerEtatDeplacerGauche : Applique la fonction de transition ?t (qi, s1, L, s1, qf) en ayant la tête de lecture sur le caractère ?c1 et en se déplaçant sur caractère ?c2 à sa gauche
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

;changerEtatDeplacerDroite : Applique la fonction de transition ?t (qi, s1, R, s1, qf) en ayant la tête de lecture sur le caractère ?c1 et en se déplaçant sur caractère ?c2 à sa droite
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

;changerEtatEcrireCaracDeplacerGauche : Applique la fonction de transition ?t (qi, s1, N, s1, qf) en ayant la tête de lecture sur le caractère ?c1
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

;ecrireCaracDeplacerGauche : Applique la fonction de transition ?t (qi, s1, L, s2, qi) en ayant la tête de lecture sur le caractère ?c1 et en se déplaçant sur caractère ?c2 à sa gauche
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

;ecrireCaracDeplacerDroite : Applique la fonction de transition ?t (qi, s1, R, s2, qi) en ayant la tête de lecture sur le caractère ?c1 et en se déplaçant sur caractère ?c2 à sa droite
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

;ecrireCarac : Applique la fonction de transition ?t (qi, s1, N, s2, qi) en ayant la tête de lecture sur le caractère ?c1
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

;lireCaracDeplacerGauche : Applique la fonction de transition ?t (qi, s1, L, s1, qi) en ayant la tête de lecture sur le caractère ?c1 et en se déplaçant sur caractère ?c2 à sa gauche
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

;lireCaracDeplacerDroite : Applique la fonction de transition ?t (qi, s1, R, s1, qi) en ayant la tête de lecture sur le caractère ?c1 et en se déplaçant sur caractère ?c2 à sa droite
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