package sokoban;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Scanner;

import fr.uga.pddl4j.plan.Plan;

public class Agent {
    public static void main(String[] args) throws Exception{
        // String JSONfile = "./config/test1.json";
        // String PDDLdomain = "./src/pddlSokoban/domain.pddl";
        // String PDDLfile = "./src/pddlSokoban/problemPDDL.pddl";
        // Parser p = new Parser(PDDLdomain, PDDLfile, JSONfile);
        // p.parseProblemJSONToPDDL();
        // Plan res = p.getPDDLResult();
        // String solution = p.getStringSolution(res);
        // for (char c : solution.toCharArray()) System.out.println(c);
        File fichierSolution = new File("./src/pddlSokoban/Resultat.txt");
        BufferedReader lecteur = new BufferedReader(new FileReader(fichierSolution));
        String res;
        while ((res = lecteur.readLine()) != null){
            for(char c : res.toCharArray()) System.out.println(c);
        }
        lecteur.close();
    }
}
