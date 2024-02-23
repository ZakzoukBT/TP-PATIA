(define (problem problem5)
(:domain pursuit)
(:objects n1 n2 n3 n4 n5 - noeud 
          a1 a2 - agent
          arc1 arc2 arc3 arc4 arc5 - arc)

(:init  (liaison arc1 n1 n2) (liaison arc1 n2 n1)
        (liaison arc2 n2 n3) (liaison arc2 n3 n2)
        (liaison arc3 n2 n4) (liaison arc3 n4 n2)
        (liaison arc4 n2 n5) (liaison arc4 n5 n2)
        (liaison arc5 n4 n5) (liaison arc5 n5 n4)
        (estSur a1 n1) (estSur a2 n1)
        (sontDifferents a1 a2)
        (estContamine arc1)
        (estContamine arc2)
        (estContamine arc3)
        (estContamine arc4)
        (estContamine arc5)
)

(:goal  
        (and (estDecontamine arc1)
             (estDecontamine arc2)
             (estDecontamine arc3)
             (estDecontamine arc4)
             (estDecontamine arc5)
        )
)
)