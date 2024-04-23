Pour compiler : 
`javac -d classes -cp lib/org.sat4j.core.jar:lib/pddl4j-4.0.0.jar src/java/OurPlanner.java src/java/CreationProblem.java`

Si OurPlanner n'est pas rajouté, la classe CreationProblem ne trouve pas la classe OurPlanner utilisé dans celle-ci...

Pour exécuter avec le problème 1 et le domaine du benchmark ipc1998/grid/strips-untyped/p01.pddl: 
`java -cp classes:lib/pddl4j-4.0.0.jar CreationProblem "../pddl4j/src/test/resources/benchmarks/pddl/ipc1998/grid/strips-untyped/domain.pddl" "../pddl4j/src/test/resources/benchmarks/pddl/ipc1998/grid/strips-untyped/p01.pddl"`

Pour tester sur un exemple simple : 
`java -cp classes:lib/pddl4j-4.0.0.jar:lib/org.sat4j.core.jar OurPlanner "../pddl4j/src/Exercice5/domain5.pddl" "../pddl4j/src/Exercice5/problem5.pddl"`