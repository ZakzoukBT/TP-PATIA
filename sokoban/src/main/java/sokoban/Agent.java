package sokoban;

import java.util.Scanner;

import fr.uga.pddl4j.plan.Plan;

public class Agent {
    public static void main(String[] args) throws Exception{
        String JSONfile = "./config/test1.json";
        String PDDLdomain = "./src/pddlSokoban/domain.pddl";
        String PDDLfile = "./src/pddlSokoban/problemPDDL.pddl";
        Parser p = new Parser(PDDLdomain, PDDLfile, JSONfile);
        p.parseProblemJSONToPDDL();
        Plan res = p.getPDDLResult();
        String solution = p.getStringSolution(res);
        for (char c : solution.toCharArray()) System.out.println(c);
    }
}
