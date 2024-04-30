import fr.uga.pddl4j.parser.DefaultParsedProblem;
import fr.uga.pddl4j.parser.ErrorManager;
import fr.uga.pddl4j.parser.Message;
import fr.uga.pddl4j.parser.Parser;
import fr.uga.pddl4j.problem.operator.*;
import fr.uga.pddl4j.problem.numeric.*;
import fr.uga.pddl4j.problem.*;
import fr.uga.pddl4j.plan.*;
import fr.uga.pddl4j.util.*;
import fr.uga.pddl4j.heuristics.state.*;
import java.util.*;
import java.io.FileNotFoundException;

/**
 * The class is an example class. It shows how to use the library to create to ground planning problem.
 *
 * @author D. Pellier
 * @version 4.0 - 06.12.2021
 */
public class CreationProblem {
    //Liste des prédicats dans l'état initial
    private List<int[]> initialList = new ArrayList<>();
    //Liste des prédicats dans l'état final
    private List<int[]> goalList;
    //HashMap associant le numéro de l'étape et la hashmap contenant le numéro d'une action, les listes de ses préconditions/effets +/effets -
    //Le premier numéro d'étape est 0, le premier numéro d'action est 1
    private HashMap<Integer, List<int[]>> stepHashMap = new HashMap<>();
    private HashMap<Integer, HashMap<Integer, List<List<List<Integer>>>>> stepActionsHashMap = new HashMap<>();
    //Liste des prédicats pour définir les transitions d'états
    private List<int[]> transitionsList = new ArrayList<>();
    //Liste des prédicats pour définir les disjonctions d'actions
    private List<int[]> disjunctionList = new ArrayList<>();
    private Problem problem;
    private int nbSteps;
    private int nbFluents; //Fluent = Prédicat
    private int nbActions;

    public CreationProblem() {}

    /**
     * Instancie les listes de variables SAT pour l'état initial et toutes les actions jusqu'à l'étape nbSteps-1
     * @param problem le problème à résoudre par SAT
     * @param nbSteps le nombre d'étapes minimum à traduire en variables
     */
    public CreationProblem(Problem problem, int nbSteps) {
        this.nbSteps = nbSteps;
        this.problem = problem;
        this.nbActions = problem.getActions().size();
        this.nbFluents = problem.getFluents().size();
        instantiateInitStep();
        enumerateActionsForMinSteps();
    }

    /**
     * Construit la liste des clauses pour l'état state, dans la liste list, correspondant au numéro d'étape step
     * @param state l'état à traduire en clause SAT
     * @param list la liste des clauses SAT à remplir
     * @param step le numéro de l'étape correspondant à l'état state
     */
    private void constructClauseList(BitVector state, List<int[]> list, int step) {
        for (int i = 0; i < nbFluents; i++) {
            //Ajout des prédicats positifs/vrais
            if (state.get(i)) {
                int[] clause = new int[]{ getIndex(i + 1, step) };
                list.add(clause);
            } 
            //Ajout des prédicats négatifs/faux
            else {
                int[] clause = new int[]{ -getIndex(i + 1, step) };
                list.add(clause);
            }
        }
    }

    /**
     * Instancie la liste des clauses correspondant à l'état initial
     */
    private void instantiateInitStep() {
        BitVector initState = problem.getInitialState().getPositiveFluents();
        this.constructClauseList(initState, initialList, 0);
    }

    /**
     * Instancie la liste des clauses correspondant à l'état final.
     * @param numStep Le numéro de l'étape correspondant à l'état final
     */
    public void instantiateGoalStep(int numStep) {
        goalList = new ArrayList<>();
        BitVector goalState = problem.getGoal().getPositiveFluents();
        //this.constructClauseList(goalState, goalList, numStep);
        for (int i = 0; i < nbFluents; i++) {
            //Ajout des prédicats positifs/vrais
            if (goalState.get(i)) {
                int[] clause = new int[]{ getIndex(i + 1, numStep) };
                goalList.add(clause);
            } 
        }
    }

    /**
     * Instancie la hashmap correspondant aux clauses produites à chaque étape pour chaque action.
     */
    private void enumerateActionsForMinSteps() {
        //Itération de l'étape 0 à l'étape nbSteps-1
        for (int step = 0; step < nbSteps; step++) {
            List<int[]> actionsPrecondEffectsList = new ArrayList<>();

            //Itération sur toutes les actions existantes
            for (int i = 0; i < nbActions; i++) {
                Action a = problem.getActions().get(i);
                int numAction = nbFluents + i + 1;
                BitVector precond = a.getPrecondition().getPositiveFluents();
                 //Prendre les effets inconditionnels
                BitVector positiveEff = a.getUnconditionalEffect().getPositiveFluents();
                BitVector negativeEff = a.getUnconditionalEffect().getNegativeFluents();

                //Itération sur tous les prédicats existants
                for (int j = 0; j < nbFluents; j++) {
                    //Ajout des clauses pour les préconditions de l'action i
                    if (precond.get(j)) {
                        int[] clause = new int[] { -getIndex(numAction, step), getIndex(j + 1, step) };
                        actionsPrecondEffectsList.add(clause);
                    }//Ajout des clauses pour les effets positifs de l'action i
                    int[] clausePos = null;
                    if (positiveEff.get(j)) {
                        clausePos = new int[]{ -getIndex(numAction, step), getIndex(j + 1, step + 1) };
                        actionsPrecondEffectsList.add(clausePos);
                    } //Ajout des clauses pour les effets négatifs de l'action i
                    int[] clauseNeg = null;
                    if (negativeEff.get(j)) {
                        clauseNeg = new int[] { -getIndex(numAction, step), -getIndex(j + 1, step + 1) };
                        actionsPrecondEffectsList.add(clauseNeg);
                    }
                    //Ajout des transitions d'états pour les effets positifs de l'action i
                    if(clausePos != null){
                        int[] clause = new int[]{ getIndex(j + 1, step), -getIndex(j + 1, step + 1), getIndex(numAction, step)};
                        transitionsList.add(clause);
                    }
                    //Ajout des transitions d'états pour les effets négatifs de l'action i
                    if(clauseNeg != null){
                        int[] clause = new int[]{ -getIndex(j + 1, step), getIndex(j + 1, step + 1), getIndex(numAction, step) };
                        transitionsList.add(clause);
                    }
                }

                // Ajout des clauses pour les disjonctions d'actions
                for(int j=0; j<nbActions; j++){
                    //Action b = problem.getActions().get(j);
                    if(i != j){
                        int[] clause = new int[]{ -getIndex(numAction, step), -getIndex(nbFluents+j+1, step) };
                        disjunctionList.add(clause);
                    }
                }
            }
            stepHashMap.put(step, actionsPrecondEffectsList);
        }
    }
    
    /**
     * Fonction Cantor permettant de générer un entier unique qui code une association numéro de clause/numéro de l'étape
     * @param num Le numéro identifiant l'action ou le prédicats dans la clause
     * @param step Le numéro de l'étape appartenant à cette clause
     * @return L'entier unique qui code l'action/le prédicat et son numéro d'étape associé
     */
    private int getIndex(int num, int step) {
        return (int) (0.5 * (num + step) * (num + step + 1) + step);
    }

    //
    
    /**
     * Fonction inverse de Cantor qui permet obtenir le numéro de l'action (x) et l'étape (y)
     * @param codage L'entier codant le prédicat/l'action et son numéro d'étape
     * @return Un tableau contenant l'identifiant du prédicat/de l'action et son numéro d'étape
     */
    public int[] decodeIndex(int codage){
        int positive = Math.abs(codage);
        double calcul = (Math.sqrt(8 * positive + 1) - 1) / 2.0;
        int w = (int)Math.floor(calcul);
        int t = (w * (w + 1)) / 2;
        int y = positive - t;
        int x = w - y;
        if(codage < 0)
            x = -x;
        return new int[] {x, y};
    }          

    // FONCTIONS D'AFFICHAGE
    public void showInitialList() {
        System.out.print("Initial List : [");
        for (int i = 0; i < initialList.size(); i++) {
            System.out.print("[(" + decodeIndex(initialList.get(i)[0])[0] + ","
                    + decodeIndex(initialList.get(i)[0])[1] + ")] et ");
        }
        System.out.println("]");
    }

    public void showGoalList() {
        System.out.print("Goal List : [");
        for (int i = 0; i < goalList.size(); i++) {
            System.out.print("[(" + decodeIndex(goalList.get(i)[0])[0] + ","
                    + decodeIndex(goalList.get(i)[0])[1] + ")] et ");
        }
        System.out.println("]");
    }

    /**
     * Fonction d'affichage de la grande HashMap pour 2 étapes
     */ 
    public void showStepHashMap() {
        for(int step=0; step < 2; step++){
            List<int[]> clauses = stepHashMap.get(step);
            System.out.println("Pour l'étape " + step);
            System.out.println("Liste des préconditions, effets pos et effets neg : ");
            for(int[] clause: clauses){
                System.out.print("[");
                for(int i = 0; i < clause.length - 1; i++){
                    System.out.print("(" + decodeIndex(clause[i])[0] + "," + decodeIndex(clause[i])[1] + ") V ");
                }
                System.out.print("(" + decodeIndex(clause[clause.length - 1])[0] + "," + decodeIndex(clause[clause.length - 1])[1] + ")] et ");
            }            
        }
    }

    public void showDisjunctionList() {
        System.out.println("Liste des disjonctions d'actions : ");
        int j = 0;
        for(int[] clause : disjunctionList){
            if(j > (nbActions + nbFluents) * 2){
                return;
            }
            System.out.print("[");
            for(int i = 0; i < clause.length - 1; i++){
                System.out.print("(" + decodeIndex(clause[i])[0] + "," + decodeIndex(clause[i])[1] + ") V ");
            }
            System.out.print("(" + decodeIndex(clause[clause.length - 1])[0] + "," + decodeIndex(clause[clause.length - 1])[1] + ")] et ");
            j++;
        }
    }

    public void showTransitionsList() {
        System.out.println("Liste des transitions d'états : ");
        int j = 0;

        for(int[] clause : transitionsList){
            if(j > (nbActions + nbFluents) * 2){
                return;
            }
            System.out.print("[");
            for(int i = 0; i < clause.length - 1; i++){
                System.out.print("(" + decodeIndex(clause[i])[0] + "," + decodeIndex(clause[i])[1] + ") V ");
            }
            System.out.print("(" + decodeIndex(clause[clause.length - 1])[0] + "," + decodeIndex(clause[clause.length - 1])[1] + ")] et ");
            j++;
        }

        System.out.println();
    }

    public int getNbActions() {
        return nbActions;
    }

    public int getNbSteps() {
        return nbSteps;
    }
    
    public int getNbFluents() {
        return nbFluents;
    }

    public List<int[]> getInitialList(){
        return initialList;
    }

    public List<int[]> getGoalList(){
        return goalList;
    }

    public HashMap<Integer, List<int[]>> getStepHashMap () {
        return stepHashMap;
    }

    public List<int[]> getTransitionsList() {
        return transitionsList;
    }

    public List<int[]> getDisjunctionList() {
        return disjunctionList;
    }

    public HashMap<Integer, HashMap<Integer, List<List<List<Integer>>>>> getStepActionsHashMap() {
        return stepActionsHashMap;
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
                FastForward ff = new FastForward(problem);
                State init = new State(problem.getInitialState());
                int nbSteps = ff.estimate(init, problem.getGoal());
                CreationProblem cp = new CreationProblem(problem, nbSteps);
                cp.instantiateGoalStep(nbSteps);
                System.out.println("Nb steps : " + nbSteps + "\nNb Actions possibles :" + cp.getNbActions() + "\nNb fluents existants : " + cp.getNbFluents());
                cp.showInitialList();
                cp.showGoalList();
                cp.enumerateActionsForMinSteps();
                cp.showStepHashMap();
                //cp.showDisjunctionList();
                //cp.showTransitionsList();
                //cp.showActionsList();
            }
        // This exception could happen if the domain or the problem does not exist
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
}
