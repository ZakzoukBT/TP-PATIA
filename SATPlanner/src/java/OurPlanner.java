import fr.uga.pddl4j.heuristics.state.*;
import fr.uga.pddl4j.parser.*;
import fr.uga.pddl4j.plan.*;
import fr.uga.pddl4j.planners.*;
import fr.uga.pddl4j.planners.statespace.search.StateSpaceSearch;
import fr.uga.pddl4j.problem.*;
import fr.uga.pddl4j.problem.operator.*;
import org.apache.logging.log4j.*;
import picocli.CommandLine;

import java.util.*;

import org.sat4j.core.VecInt;
import org.sat4j.minisat.SolverFactory;
import org.sat4j.specs.ContradictionException;
import org.sat4j.specs.ISolver;
import org.sat4j.specs.TimeoutException;

/**
 * La classe est un exemple pris depuis la librarie PDDL4J. Elle décrit un planificateur qui traduit un problème PDDL en clauses SAT et résout le problème grâce à un solveur SAT. 
 * 
 * @author D. Pellier
 * @version 4.0 - 30.11.2021
 */
@CommandLine.Command(name = "OurPlanner",
    version = "OurPlanner 1.0",
    description = "Solves a specified planning problem using A* search strategy.",
    sortOptions = false,
    mixinStandardHelpOptions = true,
    headerHeading = "Usage:%n",
    synopsisHeading = "%n",
    descriptionHeading = "%nDescription:%n%n",
    parameterListHeading = "%nParameters:%n",
    optionListHeading = "%nOptions:%n")
public class OurPlanner extends AbstractPlanner {

    /**
     * The class logger.
     */
    private static final Logger LOGGER = LogManager.getLogger(OurPlanner.class.getName());
    
    private final int VAR_COUNT = 100000;

    private final int CLAUSE_COUNT = 100000;

    private final long MAX_TIMER = 10 * 60 * 1000; // 10 minutes in milliseconds


    /**
     * Instancie le planning du problème depuis un problème parsé.
     *
     * @param problem le problème à instancier
     * @return le planning du problème ou null si le problème ne peut pas être instancié.
     */
    @Override
    public Problem instantiate(DefaultParsedProblem problem) {
        final Problem pb = new DefaultProblem(problem);
        pb.instantiate();
        return pb;
    }

    /**
     * Adds clauses to the SAT solver.
     *
     * @param solver      The SAT solver instance.
     * @param clauses     List of clauses to add.
     */
    private boolean addClauses(ISolver solver, List<List<Integer>> clauseList) {
        for (List<Integer> clause : clauseList) {
            try {
                // Check if the clause is non-empty
                if (clause.size() > 0) {
                    // Add the clause to the solver
                    solver.addClause(new VecInt(clause.stream().mapToInt(Integer::intValue).toArray()));
                } else {
                    // Log a message if the clause has an invalid format
                    LOGGER.info("Clause with invalid format!");
                }
            } catch (ContradictionException e) {
                System.out.println(e.getMessage());
                return false;
            }
        }
        return true;
    }

    /**
     * Adds clauses to the SAT solver.
     *
     * @param solver      The SAT solver instance.
     * @param clauses     List of clauses to add.
     */
    private boolean newAddClauses(ISolver solver, List<int[]> clauseList) {
        for (int[] clause : clauseList) {
            try {
                // Check if the clause is non-empty
                if (clause.length > 0) {
                    // Add the clause to the solver
                    solver.addClause(new VecInt(clause));
                } else {
                    // Log a message if the clause has an invalid format
                    LOGGER.info("Clause with invalid format!");
                }
            } catch (ContradictionException e) {
                System.out.println(e.getMessage() + "for clause : " + showClause(clause, clauseList.size()));
                return false;
            }
        }
        return true;
    }

    private String showClause(int[] liste, int nb){
        CreationProblem cp = new CreationProblem();
        String res = "[";
        for(int i=0; i< liste.length; i++){
            res += "(" + cp.decodeIndex(liste[i])[0] + "," + cp.decodeIndex(liste[i])[1] + ")";
        }
        res += "] in in clauseList of " + nb + " clauses.";
        return res;
    }

    /**
     * Ajoute les clauses de l'état initial et de toutes les actions jusqu'à l'étape maximum du problème au solveur.
     * @param solver Le solveur SAT.
     * @param cp Le problème traduit en clause SAT.
     * @return vrai si les clauses ont pu être ajoutées au solveur, faux sinon.
     */
    private boolean addInitClauses(ISolver solver, CreationProblem cp) {
        boolean addInitialState = newAddClauses(solver, cp.getInitialList());
        boolean addActions = true;
        boolean addTransitionList = true;
        boolean addDisjunctionList = true;

        for(int step = 0; step < cp.getNbSteps(); step++){
            List<int[]> clausesList = cp.getStepHashMap().get(step);
            addActions = addActions && newAddClauses(solver, clausesList);
        }

        addTransitionList = newAddClauses(solver, cp.getTransitionsList());
        addDisjunctionList = newAddClauses(solver, cp.getDisjunctionList());
    
        return addInitialState && addActions && addTransitionList && addDisjunctionList;
    }

    /**
     * Trouve une solution au problème problem à l'aide d'un solveur SAT
     *
     * @param problem le problème à résoudre
     * @return le plan trouvé ou null si aucun plan n'est trouvé
     */
    @Override
    public Plan solve(final Problem problem) {
        LOGGER.info("* Starting search \n");

        problem.instantiate();
        FastForward ff = new FastForward(problem);
        State initial = new State(problem.getInitialState());
        int nbStep = ff.estimate(initial, problem.getGoal());

        // Start the search timer
        long searchTimeStart = System.currentTimeMillis();

        // Continue the search until the time limit is reached
        while (System.currentTimeMillis() - searchTimeStart <= MAX_TIMER) {

            System.out.println("Starting step " + nbStep);

            // Create a new solver instance
            ISolver solver = SolverFactory.newDefault();
            solver.newVar(VAR_COUNT);
            solver.setExpectedNumberOfClauses(CLAUSE_COUNT);

            CreationProblem cp = new CreationProblem(problem, nbStep);
            boolean addClauses = addInitClauses(solver, cp);

            cp.instantiateGoalStep(nbStep);
            boolean addGoalState = newAddClauses(solver, cp.getGoalList());

            if (!addClauses || !addGoalState) {
                System.out.println("Probleme ?");
            }

            try {
                // Check if the solver found a satisfying assignment
                if (solver.isSatisfiable()) {
                    Plan plan = new SequentialPlan();
                    int[] solution = solver.findModel(); 
                    for(int i : solution){
                        int index = cp.decodeIndex(i)[0];
                        int numStep = cp.decodeIndex(i)[1];
                        if(index > cp.getNbFluents()){
                            index -= (1 + cp.getNbFluents());
                            plan.add(numStep, problem.getActions().get(index));
                        }
                    }
                    // Reconstruct the plan from the solution
                    // Action action;
                    // for (int s : solution) {
                    //     for (SatVariable v : variables) {
                    //         if (!v.isFluent() && v.getName() == s) {
                    //             int index = (v.getName() % variableSize == 0) ?
                    //                     actions.size() - 1 :
                    //                     (v.getName() % variableSize) - fluents.size() - 1;

                    //             action = actions.get(index);
                    //             plan.add(v.getStep(), action);
                    //             break;
                    //         }
                    //     }
                    // }

                    LOGGER.info("\nPlan found in {} seconds\n", ((float) (System.currentTimeMillis() - searchTimeStart) / 600));
                    return plan;
                }

                nbStep++; // Increment step count for next iteration
            } catch (TimeoutException e) {
                throw new RuntimeException(e);
            }
        }
        
        // Log a message if the search timeout is exceeded
        LOGGER.info("Search timeout: " + (MAX_TIMER / 60000) + " minutes exceeded");
        return null;
    }

     /**
     * Returns if a specified problem is supported by the planner. Just ADL problem can be solved by this planner.
     *
     * @param problem the problem to test.
     * @return <code>true</code> if the problem is supported <code>false</code> otherwise.
     */
    @Override
    public boolean isSupported(Problem problem) {
        return (problem.getRequirements().contains(RequireKey.ACTION_COSTS)
            || problem.getRequirements().contains(RequireKey.CONSTRAINTS)
            || problem.getRequirements().contains(RequireKey.CONTINOUS_EFFECTS)
            || problem.getRequirements().contains(RequireKey.DERIVED_PREDICATES)
            || problem.getRequirements().contains(RequireKey.DURATIVE_ACTIONS)
            || problem.getRequirements().contains(RequireKey.DURATION_INEQUALITIES)
            || problem.getRequirements().contains(RequireKey.FLUENTS)
            || problem.getRequirements().contains(RequireKey.GOAL_UTILITIES)
            || problem.getRequirements().contains(RequireKey.METHOD_CONSTRAINTS)
            || problem.getRequirements().contains(RequireKey.NUMERIC_FLUENTS)
            || problem.getRequirements().contains(RequireKey.OBJECT_FLUENTS)
            || problem.getRequirements().contains(RequireKey.PREFERENCES)
            || problem.getRequirements().contains(RequireKey.TIMED_INITIAL_LITERALS)
            || problem.getRequirements().contains(RequireKey.HIERARCHY))
            ? false : true;
    }

    /**
     * The main method of the <code>OurPlanner</code> planner.
     *
     * @param args the arguments of the command line.
     */
    public static void main(String[] args) {
        try {
            final OurPlanner planner = new OurPlanner();
            CommandLine cmd = new CommandLine(planner);
            cmd.execute(args);
        } catch (IllegalArgumentException e) {
            LOGGER.fatal(e.getMessage());
        }
    }
}