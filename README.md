# Projet TP PATIA
## Introduction
Ce projet est destiné à l'UE Planification Automatique et ... du Semestre 2 du M1 Informatique de l'Université Grenoble Alpes.
Il est écrit par BEN TANFOUS Zakaria et PELLEGRIN Noémie.
Ce projet est séparé en trois dossiers :
* pddl4j pour les exercices 1 à 7. Il contient la librairie pddl4j ainsi que les fichiers PDDL domaine et problème associés à chaque exercice; 
* SATPlanner pour l'exercice 8 sur le planner SAT. Il contient les librairies pddl4j et sat4j en fichier jar pour faire fonctionner les programmes java CreationProblem.java et OurPlanner.java qui traduisent un problème PDDL en problème SAT et qui récupèrent la solution donnée par le solveur SAT;
* sokoban pour l'exercice du sokoban. Il contient l'ensemble des fichiers Java servant à faire fonctionner le jeu, ainsi que le domaine PDDL qui décrit les prédicats et actions permettant de résoudre le sokoban avec un solveur PDDL et des problèmes PDDL construits pour réaliser des tests/plateaux de jeu plus simple que ceux fournis dans le dossier config.

## Commandes de compilation et d'exécution
Depuis le dossier parent TP_PATIA/, vous pouvez compiler et exécuter les fichiers de n'importe quel exercice avec les commandes suivantes :

### Pour les exercices PDDL 1 à 7
Vous devez choisir le planner que vous souhaitez utiliser pour résoudre le problème (FF, HSP, GSP) et choisir le domaine et problème PDDL à utiliser et résoudre, X étant leur numéro.
`java -cp pddl4j/build/libs/pddl4j-4.0.0.jar fr.uga.pddl4j.planners.statespace.<NAME_OF_THE_PLANNER> pddl4j/src/Exercice<X>/domain<X>.pddl pddl4j/src/Exercice<X>/problem<X>.pddl`

### Pour le sokoban
Vous devez choisir le problème sokoban à résoudre parmi tous ceux présents dans le dossier sokoban/config/ et lancer les commandes suivantes :
* `cd sokoban/`
* `./script-lancement.sh` et suivre les instructions du script.

### Pour le SAT solveur
Déplacez-vous dans le dossier associé à l'exercice :
`cd SATPlanner/`

Pour compiler, écrivez la commande : 
`javac -d classes -cp lib/org.sat4j.core.jar:lib/pddl4j-4.0.0.jar src/java/OurPlanner.java src/java/CreationProblem.java`

Pour exécuter le solveur SAT, choisissez un exemple de domaine et problem PDDL à tester parmi ceux contenu dans le dossier pddl4j/src/test/resources/pddl/ et lancez : 
`java -cp classes:lib/pddl4j-4.0.0.jar:lib/org.sat4j.core.jar OurPlanner "../<CHEMIN_VERS_LE_DOMAIN_PDDL>" "../<CHEMIN_VERS_LE_PROBLEME_PDDL>"`