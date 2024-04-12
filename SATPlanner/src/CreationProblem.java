import fr.uga.pddl4j.parser.*;
import fr.uga.pddl4j.problem.operator.*;
import fr.uga.pddl4j.problem.numeric.*;
import fr.uga.pddl4j.problem.*;
import fr.uga.pddl4j.plan.*;
import fr.uga.pddl4j.util.*;
import java.util.*;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * The class is an example class. It shows how to use the library to create to ground planning problem.
 *
 * @author D. Pellier
 * @version 4.0 - 06.12.2021
 */
public class CreationProblem {

    
    private final List<List<Integer>> initList;
    private final Condition goal;
    private Problem problem;
    private final int nbSteps;

    public CreationProblem(Problem problem, int nbSteps) {
        this.nbSteps = nbSteps;
        this.problem = problem;
        this.initList = instantiateInitStep();
        this.goal = problem.getGoal();
    }

    private List<List<Integer>> instantiateInitStep() {
        List<List<Integer>> resultInitList = new ArrayList<>();
        int nbPredicats = problem.getFluents().size();
        BitVector initialState = problem.getInitialState().getPositiveFluents();

        for (int i = 0; i < nbPredicats; i++) {
            if (initialState.get(i)) {
                List<Integer> clause = new ArrayList<Integer>();
                clause.add(getIndex(i, 1));
                resultInitList.add(clause);
            } else {
                List<Integer> clause = new ArrayList<Integer>();
                clause.add(-getIndex(i, 1));
                resultInitList.add(clause);
            }
        }
        return resultInitList;
    }
    
    //Fonction Cantor permettant de générer un entier unique qui code une association numéro de proposition/numéro de l'étape
    private static int getIndex(int num, int step){
        String index = "" + step + "" + num;
        return Integer.parseInt(index);
    }

    private void actionInstanciation() {
        Action a = problem.getActions().get(0);
        BitVector precond = a.getPrecondition().getPositiveFluents();
        BitVector positive = a.getUnconditionalEffect().getPositiveFluents();
        BitVector negative = a.getUnconditionalEffect().getNegativeFluents();
        for(int j=0; j<nb_fluents; j++){
            if(precond.get(j)) {
                List<Integer> clause = new ArrayList<Integer>();
                clause.add(-action_label);
                clasue.add(j+1);
                //this.action....
            }
            
        }
                //Prendre les effets inconditionnels
    }

    public List<List<Integer>> getInitList() {
        return this.initList;
    }

    public Condition getGoal() {
        return this.goal;
    }

    /**
     * The main method the class. The first argument must be the path to the PDDL domain description and the second
     * argument the path to the PDDL problem description.
     *
     * @param args the command line arguments.
     */
    public static void main(final String[] args) {

        // Checks the number of arguments from the command line
        if (args.length != 2) {
            System.out.println("Invalid command line");
            return;
        }

        try {
            // Creates an instance of the PDDL parser
            final Parser parser = new Parser();
            // Parses the domain and the problem files.
            final DefaultParsedProblem parsedProblem = parser.parse(args[0], args[1]);
            // Gets the error manager of the parser
            final ErrorManager errorManager = parser.getErrorManager();
            // Checks if the error manager contains errors
            if (!errorManager.isEmpty()) {
                // Prints the errors
                for (Message m : errorManager.getMessages()) {
                    System.out.println(m.toString());
                }
            } else {
                // Prints that the domain and the problem were successfully parsed
                System.out.print("\nparsing domain file \"" + args[0] + "\" done successfully");
                System.out.print("\nparsing problem file \"" + args[1] + "\" done successfully\n\n");
                // Create a problem

                final Problem problem = new DefaultProblem(parsedProblem);
                // Instantiate the planning problem
                problem.instantiate();

                //Instantiate OurPlanner to find out how many steps are needed to find a solution
                OurPlanner p = new OurPlanner();
                Plan result = p.solve(problem);
                if (result != null) {
                    int nbSteps = result.actions().size();
                    CreationProblem cp = new CreationProblem(problem, nbSteps);
                    List<List<Integer>> initList = cp.getInitList();
                    for (List<Integer> bitvector : initList) {
                        System.out.print(bitvector.toString());
                    }
                    

                    // Put the actions of the instantiated problem and their index in a HashMap

                }
            }
            // This exception could happen if the domain or the problem does not exist
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
}

