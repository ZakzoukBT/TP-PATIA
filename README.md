For pddl4j:
java -cp pddl4j/build/libs/pddl4j-4.0.0.jar fr.uga.pddl4j.planners.statespace.FF \
   pddl4j/src/test/resources/benchmarks/pddl/ipc2000/logistics/strips-typed/domain.pddl \
   pddl4j/src/test/resources/benchmarks/pddl/ipc2000/logistics/strips-typed/p01.pddl

For sokoban:
java -cp pddl4j/build/libs/pddl4j-4.0.0.jar fr.uga.pddl4j.planners.statespace.FF \
   sokoban/src/pddlSokoban/domain.pddl \
   sokoban/src/pddlSokoban/problemPDDL.pddl \