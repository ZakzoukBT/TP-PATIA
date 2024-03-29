Pour compiler : 
`javac -d classes -cp lib/pddl4j-4.0.0.jar src/CreationProblem.java `
Pour exécuter avec le problème 1 et le domaine du benchmark ipc1998/grid/strips-untyped/p01.pddl: 
`java -cp classes:lib/pddl4j-4.0.0.jar CreationProblem "../pddl4j/src/test/resources/benchmarks/pddl/ipc1998/grid/strips-untyped/domain.pddl" "../pddl4j/src/test/resources/benchmarks/pddl/ipc1998/grid/strips-untyped/p01.pddl"`