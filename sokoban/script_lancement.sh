#!/bin/bash
mvn clean
mvn compile
javac -cp "../pddl4j/build/libs/pddl4j-4.0.0.jar" -d classes src/main/java/sokoban/Parser.java src/main/java/sokoban/Agent.java
java -cp "../pddl4j/build/libs/pddl4j-4.0.0.jar:./classes" sokoban.Parser
java --add-opens java.base/java.lang=ALL-UNNAMED -server -Xms2048m -Xmx2048m -cp "$(mvn dependency:build-classpath -Dmdep.outputFile=/dev/stdout -q):target/test-classes/:target/classes" sokoban.SokobanMain
