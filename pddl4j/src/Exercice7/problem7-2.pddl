(define (problem problem7-2) 
(:domain turingmachinegeneral)
(:objects etat0 etat1 etatF - etat
          c0 c1 c2 c3 c4 c5 - caractere
          ;On prend comme mot en entrée 1011
          sB s0 s1 - symbole
          t1 t2 t3 t4 t5 t6 - transition
)

(:init
    (changeEtatDeplaceGauche t1 etat0 etat1 sB)
    (changeEtatEcritCarac t2 etat1 etatF sB s1)
    (litCaracDeplaceDroite t3 etat0 s0)
    (changeEtatEcritCarac t4 etat1 etatF s0 s1)
    (litCaracDeplaceDroite t5 etat0 s1)
    (ecritCaracDeplaceGauche t6 etat1 s1 s0)
    (etatCourant etat0)
    (estCarac c0 sB)
    (estCarac c1 s1)
    (estCarac c2 s0)
    (estCarac c3 s0)
    (estCarac c4 s1)
    (estCarac c5 sB)
    (aDroite c0 c1)
    (aDroite c1 c2)
    (aDroite c2 c3)
    (aDroite c3 c4)
    (aDroite c4 c5)
    (lit c1)
    (estEtatFinal etatF)
)

(:goal (and (etatCourant etatF))
)
)