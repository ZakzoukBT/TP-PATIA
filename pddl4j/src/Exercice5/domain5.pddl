(define (domain pursuit)

(:requirements :strips :typing)
(:types noeud 
        arc
        agent)

(:predicates 
    (estSur ?agent - agent ?noeud - noeud)
    (liaison ?arc - arc ?x - noeud ?y - noeud)
    (estDecontamine ?arc - arc)
    (estContamine ?arc - arc)
    (sontDifferents ?agent1 - agent ?agent2 - agent)
)

(:action seDeplace
    :parameters (?agent - agent ?depart - noeud ?arc - arc ?arrivee - noeud)
    :precondition (and (liaison ?arc ?depart ?arrivee)
                        (estSur ?agent ?depart)
    )
    :effect (and (not (estSur ?agent ?depart))
                 (estSur ?agent ?arrivee)
    )
)
(:action decontaminerAxe
    :parameters (?agent1 - agent ?agent2 - agent ?arc - arc ?depart - noeud ?arrivee - noeud)
    :precondition (and (liaison ?arc ?depart ?arrivee)
                       (liaison ?arc ?arrivee ?depart)
                       (estSur ?agent1 ?depart)
                       (estSur ?agent2 ?depart)
                       (sontDifferents ?agent1 ?agent2)
                       (estContamine ?arc)
                       )
    :effect (and (not (estContamine ?arc)) (estDecontamine ?arc) (not (estSur ?agent1 ?depart)) (estSur ?agent1 ?arrivee))
)
)