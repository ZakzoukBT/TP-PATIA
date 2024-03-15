(define (domain sokoban)

(:requirements :strips :typing)
(:types sol
        boite 
        agent)
(:predicates 
    (boiteEstSur ?boite - boite ?sol - sol)
    (agentEstSur ?agent - agent ?sol - sol)
    (aVoisinDroit ?x - sol ?y - sol)
    (aVoisinHaut ?x - sol ?y - sol)
    (estDestination ?sol - sol)
    (boiteSurCible ?boite - boite)
    (estLibre ?sol - sol)
)

(:action deplacementDroit
    :parameters (?agent1 - agent ?env1 - sol ?env2 - sol)
    :precondition (and (aVoisinDroit ?env1 ?env2) (agentEstSur ?agent1 ?env1) (estLibre ?env2))
    :effect (and (agentEstSur ?agent1 ?env2) (not (agentEstSur ?agent1 ?env1)))
)

(:action deplacementHaut
    :parameters (?agent1 - agent ?env1 - sol ?env2 - sol)
    :precondition (and (agentEstSur ?agent1 ?env1) (aVoisinHaut ?env1 ?env2) (estLibre ?env2))
    :effect (and (agentEstSur ?agent1 ?env2) (not (agentEstSur ?agent1 ?env1)))
)

(:action deplacementGauche
    :parameters (?agent1 - agent ?env1 - sol ?env2 - sol)
    :precondition (and (agentEstSur ?agent1 ?env1) (aVoisinDroit ?env2 ?env1) (estLibre ?env2))
    :effect (and (agentEstSur ?agent1 ?env2) (not (agentEstSur ?agent1 ?env1)))
)

(:action deplacementBas
    :parameters (?agent1 - agent ?env1 - sol ?env2 - sol)
    :precondition (and (agentEstSur ?agent1 ?env1) (aVoisinHaut ?env2 ?env1) (estLibre ?env2))
    :effect (and (agentEstSur ?agent1 ?env2) (not (agentEstSur ?agent1 ?env1)))
)

(:action pousserDroit
    :parameters (?agent - agent ?env1 - sol ?env2 - sol ?env3 - sol ?boite - boite)
    :precondition (and (agentEstSur ?agent ?env1) (boiteEstSur ?boite ?env2) (aVoisinDroit ?env1 ?env2) (aVoisinDroit ?env2 ?env3) (estLibre ?env3))
    :effect (and (boiteEstSur ?boite ?env3) (not(boiteEstSur ?boite ?env2)) (agentEstSur ?agent ?env2) (not(agentEstSur ?agent ?env1)) (not (boiteSurCible ?boite)) (estLibre ?env2) (not (estLibre ?env3)))
)

(:action pousserHaut
    :parameters (?agent - agent ?env1 - sol ?env2 - sol ?env3 - sol ?boite - boite)
    :precondition (and (agentEstSur ?agent ?env1) (boiteEstSur ?boite ?env2) (aVoisinHaut ?env1 ?env2) (aVoisinHaut ?env2 ?env3) (estLibre ?env3))
    :effect (and (boiteEstSur ?boite ?env3) (not(boiteEstSur ?boite ?env2)) (agentEstSur ?agent ?env2) (not(agentEstSur ?agent ?env1)) (not (boiteSurCible ?boite)) (estLibre ?env2) (not (estLibre ?env3)))
)

(:action pousserGauche
    :parameters (?agent - agent ?env1 - sol ?env2 - sol ?env3 - sol ?boite - boite)
    :precondition (and (agentEstSur ?agent ?env1) (boiteEstSur ?boite ?env2) (aVoisinDroit ?env2 ?env1) (aVoisinDroit ?env3 ?env2) (estLibre ?env3))
    :effect (and (boiteEstSur ?boite ?env3) (not(boiteEstSur ?boite ?env2)) (agentEstSur ?agent ?env2) (not(agentEstSur ?agent ?env1)) (not (boiteSurCible ?boite)) (estLibre ?env2) (not (estLibre ?env3)))
)
(:action pousserBas
    :parameters (?agent - agent ?env1 - sol ?env2 - sol ?env3 - sol ?boite - boite)
    :precondition (and (agentEstSur ?agent ?env1) (boiteEstSur ?boite ?env2) (aVoisinHaut ?env2 ?env1) (aVoisinHaut ?env3 ?env2) (estLibre ?env3))
    :effect (and (boiteEstSur ?boite ?env3) (not(boiteEstSur ?boite ?env2)) (agentEstSur ?agent ?env2) (not(agentEstSur ?agent ?env1)) (not (boiteSurCible ?boite)) (estLibre ?env2) (not (estLibre ?env3)))
)

(:action marquer
    :parameters (?boite - boite ?sol - sol)
    :precondition (and (boiteEstSur ?boite ?sol) (estDestination ?sol))
    :effect (and (boiteSurCible ?boite))
)
)