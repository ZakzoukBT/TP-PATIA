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
 * The class is an example. It shows how to create a simple A* search planner able to
 * solve an ADL problem by choosing the heuristic to used and its weight.
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
     * Instantiates the planning problem from a parsed problem.
     *
     * @param problem the problem to instantiate.
     * @return the instantiated planning problem or null if the problem cannot be instantiated.
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
                return false;
            }
        }
        return true;
    }

    //Il faut faire une méthode qui ajoute toutes les clauses au démarrage et une pour chaque nouvelle itération !
    private boolean addInitClauses(ISolver solver, CreationProblem cp) {
        boolean addInitialState = addClauses(solver, cp.getInitialList());
        boolean addActions = true;

        for(int step=0; step < cp.getNbSteps(); step++) {
            addActions = addActions && addClausesAtStep(solver, cp, step);
        }
        
        return addInitialState && addActions;
    }

    private boolean addClausesAtStep(ISolver solver, CreationProblem cp, int step) {
        boolean addActions = true;
        boolean addTransitionList = true;
        boolean addDisjunctionList = true;
        
        HashMap<Integer, List<List<List<Integer>>>> actionsHashMap = cp.getStepActionsHashMap().get(step);
        for (int i = 0; i < cp.getNbActions(); i++) {
            List<List<Integer>> precondList = actionsHashMap.get(cp.getNbFluents()+i+1).get(0);
            addActions = addClauses(solver, precondList);

            List<List<Integer>> posEffectList = actionsHashMap.get(cp.getNbFluents()+i+1).get(1); //actionsList.get(getIndex(i + 1, 1)).get(1);
            addActions = addActions && addClauses(solver, posEffectList);

            List<List<Integer>> negEffectList = actionsHashMap.get(cp.getNbFluents()+i+1).get(2); //actionsList.get(getIndex(i + 1, 1)).get(2);
            addActions = addActions && addClauses(solver, negEffectList);
        }
        
        List<List<Integer>> transitionListAtStep = cp.getTransitionsList().get(step);
        addTransitionList = addTransitionList && addClauses(solver, transitionListAtStep);

        List<List<Integer>> disjunctionListAtStep = cp.getDisjunctionList().get(step);
        addDisjunctionList = addDisjunctionList && addClauses(solver, disjunctionListAtStep);
        
        return addActions && addTransitionList && addDisjunctionList;
    }

    /**
     * Search a solution plan to a specified domain and problem using A*.
     *
     * @param problem the problem to solve.
     * @return the plan found or null if no plan was found.
     */
    @Override
    public Plan solve(final Problem problem) {
        // Creates the A* search strategy
        //C'est ici que l'on peut changer la stratégie de recherche d'une solution !
        LOGGER.info("* Starting search \n");

        problem.instantiate();
        FastForward ff = new FastForward(problem);
        State init = new State(problem.getInitialState());
        int nbStep = ff.estimate(init, problem.getGoal());

        List<Fluent> fluents = new ArrayList<>(problem.getFluents());
        List<Action> actions = new ArrayList<>(problem.getActions());

        CreationProblem cp = new CreationProblem();

        // Start the search timer
        long searchTimeStart = System.currentTimeMillis();

        boolean initIteration = true;
        // Continue the search until the time limit is reached
        while (System.currentTimeMillis() - searchTimeStart <= MAX_TIMER) {

            System.out.println("Starting step " + nbStep);

            // Create a new solver instance
            ISolver solver = SolverFactory.newDefault();
            solver.newVar(VAR_COUNT);
            solver.setExpectedNumberOfClauses(CLAUSE_COUNT);

            if(initIteration){
                cp = new CreationProblem(problem, nbStep);
                addInitClauses(solver, cp);
                initIteration = false;
            }

            cp.createActionsForStep(nbStep);
            cp.instantiateGoalStep(nbStep);
            boolean addGoalState = addClauses(solver, cp.getGoalList());

            if (!addClausesAtStep(solver, cp, nbStep) || !addGoalState) {
                nbStep++;
                continue;
            }

            try {
                // Check if the solver found a satisfying assignment
                if (solver.isSatisfiable()) {
                    Plan plan = new SequentialPlan();
                    int[] solution = solver.findModel(); 
                    HashMap<Integer, List<Integer>> variables = new HashMap<>();
                    int step = 0;
                    String sol = "";
                    String res = "";
                    for(int i : solution){
                        sol+= i + ", ";
                        int index = cp.decodeIndex(i)[0];
                        int numStep = cp.decodeIndex(i)[1];
                        if(variables.get(numStep) != null){
                            variables.get(numStep).add(index);
                            //Il faut faire -1 sur ce numéro normalement !
                        }
                        else {
                            ArrayList<Integer> variablesAtStep = new ArrayList<>();
                            variablesAtStep.add(index);
                            variables.put(numStep, variablesAtStep);
                        }
                    }
                    for(int i : variables.keySet()){
                        res +="Etape " + i + " : ";
                        for(int j = 0; j<variables.get(i).size(); j++){
                            int k = variables.get(i).get(j);
                            boolean positive = variables.get(i).get(j) > 0;
                            if(!positive){
                                k = -1 * k;
                            }
                            if(k > problem.getFluents().size()){
                                Action a = problem.getActions().get(k-1-problem.getFluents().size());
                                if(!positive)
                                    res += "-" + a.getName() + " : ";
                                else
                                    res += a.getName() + " : ";
                                for(int var : a.getInstantiations()){
                                    res += var + ", ";
                                }
                                if(j != variables.get(i).size()-1)
                                    res += "\n";
                            }
                        }
                        res +="\n\n";
                    }
                    System.out.println(res);
                    System.out.println(sol);
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