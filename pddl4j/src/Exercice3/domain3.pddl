(define (domain n-puzzle)

(:requirements :strips :typing :negative-preconditions)
(:types object case caseVide emplacement)
(:predicates 
    (aVoisinGauche ?x - emplacement ?y - object)
    (aVoisinDroit ?x - emplacement ?y - object)
    (aVoisinHaut ?x - emplacement ?y - object)
    (aVoisinBas ?x - emplacement ?y - object)
    (estCaseVideSur ?x - caseVide ?y - emplacement)
    (limiteDroit ?x - emplacement)
    (limiteGauche ?x - emplacement)
    (limiteHaut ?x - emplacement)
    (limiteBas ?x - emplacement)
    (plusGrand ?x - case ?y - case)
    (estSur ?x - case ?y - emplacement)
    (dernierMouvement ?x - caseVide ?y - case ?e1 - emplacement ?e2 - emplacement)
)

(:action deplacerHaut
    :parameters (?case1 - caseVide ?case2 - case ?e1 - emplacement ?e2 - emplacement)
    :precondition (and (not (limiteHaut ?e1)) (aVoisinHaut ?e1 ?e2) (estSur ?case2 ?e2) (estCaseVideSur ?case1 ?e1) (not (dernierMouvement ?case1 ?case2 ?e2 ?e1)))
    :effect (and (estCaseVideSur ?case1 ?e2) (not (estCaseVideSur ?case1 ?e1)) (estSur ?case2 ?e1) (not (estSur ?case2 ?e2)) (dernierMouvement ?case1 ?case2 ?e1 ?e2))        
    )


(:action deplacerBas
    :parameters (?case1 - caseVide ?case2 - case ?e1 - emplacement ?e2 - emplacement)
    :precondition (and (not (limiteBas ?e1)) (aVoisinHaut ?e2 ?e1) (estSur ?case2 ?e2) (estCaseVideSur ?case1 ?e1) (not (dernierMouvement ?case1 ?case2 ?e2 ?e1)))
    :effect (and (estCaseVideSur ?case1 ?e2) (not (estCaseVideSur ?case1 ?e1)) (estSur ?case2 ?e1) (not (estSur ?case2 ?e2)) (dernierMouvement ?case1 ?case2 ?e1 ?e2))  
    )


(:action deplacerDroite
    :parameters (?case1 - caseVide ?case2 - case ?e1 - emplacement ?e2 - emplacement)
    :precondition (and (not (limiteDroit ?e1)) (aVoisinDroit ?e1 ?e2) (estSur ?case2 ?e2) (estCaseVideSur ?case1 ?e1) (not (dernierMouvement ?case1 ?case2 ?e2 ?e1)))
    :effect (and (estCaseVideSur ?case1 ?e2) (not (estCaseVideSur ?case1 ?e1)) (estSur ?case2 ?e1) (not (estSur ?case2 ?e2)) (dernierMouvement ?case1 ?case2 ?e1 ?e2))  
    )


(:action deplacerGauche
    :parameters (?case1 - caseVide ?case2 - case ?e1 - emplacement ?e2 - emplacement)
    :precondition (and (not (limiteGauche ?e1)) (aVoisinDroit ?e2 ?e1) (estSur ?case2 ?e2) (estCaseVideSur ?case1 ?e1) (not (dernierMouvement ?case1 ?case2 ?e2 ?e1)))
    :effect (and (estCaseVideSur ?case1 ?e2) (not (estCaseVideSur ?case1 ?e1)) (estSur ?case2 ?e1) (not (estSur ?case2 ?e2)) (dernierMouvement ?case1 ?case2 ?e1 ?e2))  
    )
)