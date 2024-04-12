(define (problem problem3)
(:domain n-puzzle)
(:objects a b c d e f g h i j k l m n o - case 
        e1 e2 e3 e4 e5 e6 e7 e8 e9 e10 e11 e12 e13 e14 e15 e16 - emplacement
        cVide - caseVide)

(:init  (estSur i e16)
        (estSur b e2)
        (estSur j e3)
        (estSur d e4)
        (estSur g e5)
        (estSur e e6)
        (estSur o e7)
        (estSur m e8)
        (estSur a e9)
        (estSur k e10)
        (estSur c e11)
        (estSur l e12)
        (estSur n e13)
        (estSur f e14)
        (estSur h e15)

        (estVideSur cVide e1)
        (aVoisinDroit e1 e2)
        (aVoisinDroit e2 e3)
        (aVoisinDroit e3 e4)
        (aVoisinDroit e5 e6)
        (aVoisinDroit e6 e7)
        (aVoisinDroit e7 e8)
        (aVoisinDroit e9 e10)
        (aVoisinDroit e10 e11)
        (aVoisinDroit e11 e12)
        (aVoisinDroit e13 e14)
        (aVoisinDroit e14 e15)
        (aVoisinDroit e15 e16)
        (aVoisinHaut e5 e1)
        (aVoisinHaut e6 e2)
        (aVoisinHaut e7 e3)
        (aVoisinHaut e8 e4)
        (aVoisinHaut e9 e5)
        (aVoisinHaut e10 e6)
        (aVoisinHaut e11 e7)
        (aVoisinHaut e12 e8)
        (aVoisinHaut e13 e9)
        (aVoisinHaut e14 e10)
        (aVoisinHaut e15 e11)
        (aVoisinHaut e16 e12)
)

(:goal  (and (estVideSur cVide e16)
             (estSur a e1)
             (estSur b e2)
             (estSur c e3)
             (estSur d e4)
             (estSur e e5)
             (estSur f e6)
             (estSur g e7)
             (estSur h e8)
             (estSur i e9)
             (estSur j e10)
             (estSur k e11)
             (estSur l e12)
             (estSur m e13)
             (estSur n e14)
             (estSur o e15))
)
)