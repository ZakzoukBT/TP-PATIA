(define (domain moving_robot)

(:requirements :strips :typing)

(:types
    agent
    room
)

(:predicates
    (at ?x - agent ?y - room)
    (isConnected ?x - room ?y - room)
)

(:action move
    :parameters (?a - agent ?r1 - room ?r2 - room)
    :precondition (and 
        (isConnected ?r1 ?r2)
        (at ?a ?r1)
    )
    :effect (and 
        (not (at ?a ?r1))
        (at ?a ?r2)
    )
)

)