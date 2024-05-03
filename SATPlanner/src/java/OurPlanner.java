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

    private final long MAX_TIMER = 10 * 60 * 1000; // 10 minutes en millisecondes


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
     * Ajoute les clauses de la clauseList au solveur SAT
     * @param solver Le solveur SAT
     * @param clauses La liste des clauses à ajouter
     */
    private boolean addClauses(ISolver solver, List<int[]> clauseList) {
        for (int[] clause : clauseList) {
            try {
                // Si la clause n'est pas vide on l'ajoute au solveur
                if (clause.length > 0) {
                    solver.addClause(new VecInt(clause));
                } 
                else {
                    LOGGER.info("Clause with invalid format!");
                }
            } 
            catch (ContradictionException e) {
                System.out.println(e.getMessage());
                return false;
            }
        }
        return true;
    }

    /**
     * Ajoute les clauses de l'état initial et de toutes les actions jusqu'à l'étape maximum du problème au solveur.
     * @param solver Le solveur SAT.
     * @param cp Le problème traduit en clause SAT.
     * @return vrai si les clauses ont pu être ajoutées au solveur, faux sinon.
     */
    private boolean addInitClauses(ISolver solver, CreationProblem cp) {
        boolean addInitialState = addClauses(solver, cp.getInitialList());
        boolean addActions = true;
        boolean addTransitionList = true;
        boolean addDisjunctionList = true;

        for(int step = 0; step < cp.getNbSteps(); step++){
            List<int[]> clausesList = cp.getStepHashMap().get(step);
            addActions = addActions && addClauses(solver, clausesList);
        }

        addTransitionList = addClauses(solver, cp.getTransitionsList());
        addDisjunctionList = addClauses(solver, cp.getDisjunctionList());
    
        return addInitialState && addActions && addTransitionList && addDisjunctionList;
    }

    /**
     * Trouve une solution au problème problem à l'aide d'un solveur SAT
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

        // Démarrage du timer
        long searchTimeStart = System.currentTimeMillis();

        // Recherche effectuée tant que le timer ne dépasse pas 10min
        while (System.currentTimeMillis() - searchTimeStart <= MAX_TIMER) {

            System.out.println("Starting step " + nbStep);

            // Création du soveur
            ISolver solver = SolverFactory.newDefault();
            solver.newVar(VAR_COUNT);
            solver.setExpectedNumberOfClauses(CLAUSE_COUNT);

            //Initialisation du problème PDDL en clauses SAT
            CreationProblem cp = new CreationProblem(problem, nbStep);

            //Ajout des clauses SAT du problème traduit au solveur
            boolean addClauses = addInitClauses(solver, cp);
            cp.instantiateGoalStep(nbStep);
            boolean addGoalState = addClauses(solver, cp.getGoalList());

            if (!addClauses || !addGoalState) {
                System.out.println("Probleme ?");
            }

            try {
                // Vérifie si une solution est trouvée par le solveur SAT
                if (solver.isSatisfiable()) {
                    Plan plan = new SequentialPlan();
                    int[] solution = solver.findModel(); 
                    // Traduction de la solution trouvée en actions initiales du problème PDDL
                    for(int i : solution){
                        int index = cp.decodeIndex(i)[0];
                        int numStep = cp.decodeIndex(i)[1];
                        if(index > cp.getNbFluents()){
                            index -= (1 + cp.getNbFluents());
                            plan.add(numStep, problem.getActions().get(index));
                        }
                    }
                    LOGGER.info("\nPlan found in {} seconds\n", ((float) (System.currentTimeMillis() - searchTimeStart) / 600));
                    return plan;
                }

                nbStep++; // On incrémente le nombre d'étapes de recherche de 1
            } catch (TimeoutException e) {
                throw new RuntimeException(e);
            }
        }
        
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