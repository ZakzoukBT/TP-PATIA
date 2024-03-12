(define (domain sokoban)

(:requirements :strips :typing)
(:types sol - environnement
        boite agent - objet)
(:predicates 
    (estSur ?objet - objet ?environnement - environnement)
    (aVoisinDroit ?x - environnement ?y - environnement)
    (aVoisinHaut ?x - environnement ?y - environnement)
    (estDestination ?environnement - environnement)
    (cibleAtteinte ?environnement - environnement)
    (estLibre ?environnement - environnement)
)

(:action deplacementDroit
    :parameters (?agent1 - agent ?env1 - environnement ?env2 - environnement)
    :precondition (and (estSur ?agent1 ?env1) (aVoisinDroit ?env1 ?env2) (estLibre ?env2))
    :effect (and (not (estLibre ?env2)) (estLibre ?env1) (not (estSur ?agent1 ?env1)) (estSur ?agent1 ?env2))
)

(:action deplacementHaut
    :parameters (?agent1 - agent ?env1 - environnement ?env2 - environnement)
    :precondition (and (estSur ?agent1 ?env1) (aVoisinHaut ?env1 ?env2) (estLibre ?env2))
    :effect (and (not (estLibre ?env2)) (estLibre ?env1) (not (estSur ?agent1 ?env1)) (estSur ?agent1 ?env2))
)

(:action deplacementGauche
    :parameters (?agent1 - agent ?env1 - environnement ?env2 - environnement)
    :precondition (and (estSur ?agent1 ?env1) (aVoisinDroit ?env2 ?env1) (estLibre ?env2))
    :effect (and (not (estLibre ?env2)) (estLibre ?env1) (not (estSur ?agent1 ?env1)) (estSur ?agent1 ?env2))
)

(:action deplacementBas
    :parameters (?agent1 - agent ?env1 - environnement ?env2 - environnement)
    :precondition (and (estSur ?agent1 ?env1) (aVoisinHaut ?env2 ?env1) (estLibre ?env2))
    :effect (and (not (estLibre ?env2)) (estLibre ?env1) (not (estSur ?agent1 ?env1)) (estSur ?agent1 ?env2))
)

(:action pousserDroit
    :parameters (?agent - agent ?boite - boite ?env1 - environnement ?env2 - environnement ?env3 - environnement)
    :precondition (and (estSur ?agent ?env1) (estSur ?boite ?env2) (aVoisinDroit ?env1 ?env2) (aVoisinDroit ?env2 ?env3) (estLibre ?env3))
    :effect (and (not (estLibre ?env2)) (not (cibleAtteinte ?env2)) (not (estLibre ?env3)) (estLibre ?env1) (not(estSur ?agent ?env1)) (not(estSur ?boite ?env2)) (estSur ?agent ?env2) (estSur ?boite ?env3))
)

(:action pousserHaut
    :parameters (?agent - agent ?boite - boite ?env1 - environnement ?env2 - environnement ?env3 - environnement)
    :precondition (and (estSur ?agent ?env1) (estSur ?boite ?env2) (aVoisinHaut ?env1 ?env2) (aVoisinHaut ?env2 ?env3) (estLibre ?env3))
    :effect (and (not (estLibre ?env2)) (not (cibleAtteinte ?env2)) (not (estLibre ?env3)) (estLibre ?env1) (not(estSur ?agent ?env1)) (not(estSur ?boite ?env2)) (estSur ?agent ?env2) (estSur ?boite ?env3))
)

(:action pousserGauche
    :parameters (?agent - agent ?boite - boite ?env1 - environnement ?env2 - environnement ?env3 - environnement)
    :precondition (and (estSur ?agent ?env1) (estSur ?boite ?env2) (aVoisinDroit ?env2 ?env1) (aVoisinDroit ?env3 ?env2) (estLibre ?env3))
    :effect (and (not (estLibre ?env2)) (not (cibleAtteinte ?env2)) (not (estLibre ?env3)) (estLibre ?env1) (not(estSur ?agent ?env1)) (not(estSur ?boite ?env2)) (estSur ?agent ?env2) (estSur ?boite ?env3))
)

(:action pousserBas
    :parameters (?agent - agent ?boite - boite ?env1 - environnement ?env2 - environnement ?env3 - environnement)
    :precondition (and (estSur ?agent ?env1) (estSur ?boite ?env2) (aVoisinHaut ?env2 ?env1) (aVoisinHaut ?env3 ?env2) (estLibre ?env3))
    :effect (and (not (estLibre ?env2)) (not (cibleAtteinte ?env2)) (not (estLibre ?env3)) (estLibre ?env1) (not(estSur ?agent ?env1)) (not(estSur ?boite ?env2)) (estSur ?agent ?env2) (estSur ?boite ?env3))
)

(:action marquer
    :parameters (?boite - boite ?environnement - environnement)
    :precondition (and (estSur ?boite ?environnement) (estDestination ?environnement))
    :effect (and (cibleAtteinte ?environnement))
)
)