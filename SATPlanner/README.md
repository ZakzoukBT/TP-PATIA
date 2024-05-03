# Rappel des commandes 
Pour compiler : 
`javac -d classes -cp lib/org.sat4j.core.jar:lib/pddl4j-4.0.0.jar src/java/OurPlanner.java src/java/CreationProblem.java`

Pour exécuter le solveur SAT sur un exemple parmi ceux contenu dans le dossier pddl4j/src/test/resources/pddl/ : 
`java -cp classes:lib/pddl4j-4.0.0.jar:lib/org.sat4j.core.jar OurPlanner "../pddl4j/src/test/resources/pddl/<CHEMIN_VERS_LE_DOMAINE_PDDL>" "../pddl4j/src/test/resources/pddl/<CHEMIN_VERS_LE_PROBLEME_PDDL>"`

Par exemple, pour lancer le solveur SAT sur l'exemple du robot ménager donné dans la consigne, exécutez la commande : 
`java -cp classes:lib/pddl4j-4.0.0.jar:lib/org.sat4j.core.jar OurPlanner "../pddl4j/src/Exercice8/domain.pddl" "../pddl4j/src/Exercice8/problem.pddl"`

Pour augmenter la taille de la mémoire de la JVM, rajouter l'option : 
`java -Xms2048m -Xmx2048m`