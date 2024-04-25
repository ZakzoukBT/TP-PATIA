(define (problem p001) (:domain moving_robot)
(:objects 
    a - agent
    r1 r2 r3 - room
)

(:init
    (isConnected r1 r2)
    (isConnected r2 r3)
    (at a r1)
)

(:goal (and
    (at a r3)
))

)