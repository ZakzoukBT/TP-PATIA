;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Pursuit-Evasion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain pursuit)

(:requirements :strips :typing)
(:types noeud 
        arc
        agent)

(:predicates 
    (estSur ?agent - agent ?noeud - noeud)             ;estSur : Spécifie qu'un agent ?agent se trouve sur le noeud ?noeud
    (liaison ?arc - arc ?x - noeud ?y - noeud)         ;liaison : Spécifie la liaison du noeud ?x et du noeud ?y avec un arc ?arc
    (estDecontamine ?arc - arc)                        ;estDecontamine : Spécifie que l'arc ?arc est décontaminé
    (estContamine ?arc - arc)                          ;estContamine : Spécifie que l'arc ?arc est contaminé
    (sontDifferents ?agent1 - agent ?agent2 - agent)   ;sontDifferents : Spécifie que l'agent ?agent1 et différent de l'agent ?agent2
)

;seDeplace : Déplace un agent ?agent du noeud ?depart au noeud ?arrivee passant par l'arc ?arc
(:action seDeplace
    :parameters (?agent - agent ?depart - noeud ?arc - arc ?arrivee - noeud)
    :precondition (and (liaison ?arc ?depart ?arrivee)
                        (estSur ?agent ?depart)
    )
    :effect (and (not (estSur ?agent ?depart))
                 (estSur ?agent ?arrivee)
    )
)

;decontaminerAxe : Décontamine l'arc ?arc lorsque 2 agents ?agent1 et ?agent2 sont situé sur les 2 extrémités de l'arc ?depart et ?arrive, et que l'agent ?agent1 passe du noeud ?depart au noeud ?arrivee
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