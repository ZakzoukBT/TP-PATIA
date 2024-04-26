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
import java.util.ArrayList;
import java.util.HashMap;

/**
 * The class is an example class. It shows how to use the library to create to ground planning problem.
 *
 * @author D. Pellier
 * @version 4.0 - 06.12.2021
 */
public class CreationProblem {
    //Liste des prédicats dans l'état initial
    private List<List<Integer>> initialList = new ArrayList<>();
    //Liste des prédicats dans l'état final
    private List<List<Integer>> goalList;
    //HashMap associant le numéro de l'étape et la hashmap contenant le numéro d'une action, les listes de ses préconditions/effets +/effets -
    //Le premier numéro d'étape est 0, le premier numéro d'action est 1
    private HashMap<Integer, HashMap<Integer, List<List<List<Integer>>>>> stepActionsHashMap = new HashMap<>();
    //Liste des prédicats pour définir les transitions d'états
    private List<List<List<Integer>>> transitionsList = new ArrayList<>();
    //Liste des prédicats pour définir les disjonctions d'actions
    private List<List<List<Integer>>> disjunctionList = new ArrayList<>();
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
    private void constructClauseList(BitVector state, List<List<Integer>> list, int step) {
        for (int i = 0; i < nbFluents; i++) {
            //Ajout des prédicats positifs/vrais
            if (state.get(i)) {
                List<Integer> clause = new ArrayList<Integer>();
                clause.add(getIndex(i + 1, step));
                list.add(clause);
            } 
            //Ajout des prédicats négatifs/faux
            else {
                List<Integer> clause = new ArrayList<Integer>();
                clause.add(-getIndex(i + 1, step));
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
        this.constructClauseList(goalState, goalList, numStep);
    }

    /**
     * Instancie la hashmap correspondant aux clauses produites à chaque étape pour chaque action.
     */
    private void enumerateActionsForMinSteps() {
        //Itération de l'étape 0 à l'étape nbSteps-1
        for (int step = 0; step < nbSteps; step++) {
            HashMap<Integer, List<List<List<Integer>>>> actionsHashMap = new HashMap<>();
            List<List<Integer>> transitionListAtStepI = new ArrayList<>();
            List<List<Integer>> actionDisjunctionListAtStepI = new ArrayList<>();

            //Itération sur toutes les actions existantes
            for (int i = 0; i < nbActions; i++) {
                Action a = problem.getActions().get(i);
                int numAction = nbFluents + i + 1;
                BitVector precond = a.getPrecondition().getPositiveFluents();
                 //Prendre les effets inconditionnels
                BitVector positiveEff = a.getUnconditionalEffect().getPositiveFluents();
                BitVector negativeEff = a.getUnconditionalEffect().getNegativeFluents();
                List<List<List<Integer>>> actionAtStepI = new ArrayList<>();
                List<List<Integer>> preconditionList = new ArrayList<>();
                List<List<Integer>> positiveEffectList = new ArrayList<>();
                List<List<Integer>> negativeEffectList = new ArrayList<>();

                //Itération sur tous les prédicats existants
                for (int j = 0; j < nbFluents; j++) {
                    //Ajout des clauses pour les préconditions de l'action i
                    if (precond.get(j)) {
                        List<Integer> clause = new ArrayList<Integer>();
                        clause.add(-getIndex(numAction, step));
                        clause.add(getIndex(j + 1, step));
                        preconditionList.add(clause);
                    }//Ajout des clauses pour les effets positifs de l'action i
                    List<Integer> clausePos = null;
                    if (positiveEff.get(j)) {
                        clausePos = new ArrayList<Integer>();
                        clausePos.add(-getIndex(numAction, step));
                        clausePos.add(getIndex(j + 1, step + 1));
                        positiveEffectList.add(clausePos);
                    } //Ajout des clauses pour les effets négatifs de l'action i
                    List<Integer> clauseNeg = null;
                    if (negativeEff.get(j)) {
                        clauseNeg = new ArrayList<Integer>();
                        clauseNeg.add(-getIndex(numAction, step));
                        clauseNeg.add(-getIndex(j + 1, step + 1));
                        negativeEffectList.add(clauseNeg);
                    }
                    //Ajout des transitions d'états pour les effets positifs de l'action i
                    if(clausePos != null){
                        List<Integer> clause = new ArrayList<Integer>();
                        clause.add(getIndex(j + 1, step));
                        clause.add(-getIndex(j + 1, step + 1));
                        clause.add(getIndex(numAction, step));
                        transitionListAtStepI.add(clause);
                    }
                    //Ajout des transitions d'états pour les effets négatifs de l'action i
                    if(clauseNeg != null){
                        List<Integer> clause = new ArrayList<Integer>();
                        clause.add(-getIndex(j + 1, step));
                        clause.add(getIndex(j + 1, step + 1));
                        clause.add(getIndex(numAction, step));
                        transitionListAtStepI.add(clause);
                    }
                }

                // Ajout des clauses pour les disjonctions d'actions
                for(int j=0; j<nbActions; j++){
                    //Action b = problem.getActions().get(j);
                    if(i != j){
                        List<Integer> clause = new ArrayList<Integer>();
                        clause.add(-getIndex(numAction, step));
                        clause.add(-getIndex(nbFluents+j+1, step));
                        actionDisjunctionListAtStepI.add(clause);
                    }
                }
                //Ajout des listes de préconditions, effets positifs et effest négatifs à la hashmap de l'action
                actionAtStepI.add(preconditionList);
                actionAtStepI.add(positiveEffectList);
                actionAtStepI.add(negativeEffectList);
                actionsHashMap.put(numAction, actionAtStepI);
            }
            //Ajout des listes de clauses pour les transitions d'états et la disjonction d'actions dans leur liste et de la hashmap de l'action dans la grande hashmap 
            transitionsList.add(transitionListAtStepI);
            disjunctionList.add(actionDisjunctionListAtStepI);
            stepActionsHashMap.put(step, actionsHashMap);
        }
    }

    /**
     * Crée la liste des clauses associées aux actions pour l'étape step
     * @param step le numéro de l'étape pour lequel il faut écrire la liste des clauses
     */
    public void createActionsForStep(int step) {
        HashMap<Integer, List<List<List<Integer>>>> actionsHashMap = new HashMap<>();
        List<List<Integer>> transitionListAtStepI = new ArrayList<>();
        List<List<Integer>> actionDisjunctionListAtStepI = new ArrayList<>();

        for (int i = 0; i < nbActions; i++) {
            Action a = problem.getActions().get(i);
            BitVector precond = a.getPrecondition().getPositiveFluents();
                //Prendre les effets inconditionnels
            BitVector positiveEff = a.getUnconditionalEffect().getPositiveFluents();
            BitVector negativeEff = a.getUnconditionalEffect().getNegativeFluents();
            List<List<List<Integer>>> actionAtStepI = new ArrayList<>();
            List<List<Integer>> preconditionList = new ArrayList<>();
            List<List<Integer>> positiveEffectList = new ArrayList<>();
            List<List<Integer>> negativeEffectList = new ArrayList<>();

            for (int j = 0; j < nbFluents; j++) {
                //Adding action preconditions and effect
                if (precond.get(j)) {
                    List<Integer> clause = new ArrayList<Integer>();
                    clause.add(-getIndex(nbFluents+ i + 1, step));
                    clause.add(getIndex(j + 1, step));
                    preconditionList.add(clause);
                }
                List<Integer> clausePos = null;
                if (positiveEff.get(j)) {
                    clausePos = new ArrayList<Integer>();
                    clausePos.add(-getIndex(nbFluents+ i + 1, step));
                    clausePos.add(getIndex(j + 1, step + 1));
                    positiveEffectList.add(clausePos);
                }
                List<Integer> clauseNeg = null;
                if (negativeEff.get(j)) {
                    clauseNeg = new ArrayList<Integer>();
                    clauseNeg.add(-getIndex(nbFluents+ i + 1, step));
                    clauseNeg.add(-getIndex(j + 1, step + 1));
                    negativeEffectList.add(clauseNeg);
                }
                //Adding state transitions
                if(clausePos != null){
                    List<Integer> clause = new ArrayList<Integer>();
                    clause.add(getIndex(j+1, step));
                    clause.add(-getIndex(j+1, step+1));
                    clause.add(getIndex(nbFluents+i+1, step));
                    transitionListAtStepI.add(clause);
                }
                if(clauseNeg != null){
                    List<Integer> clause = new ArrayList<Integer>();
                    clause.add(-getIndex(j+1, step));
                    clause.add(getIndex(j+1, step+1));
                    clause.add(getIndex(nbFluents+i+1, step));
                    transitionListAtStepI.add(clause);
                }
            }
            // Adding action disjunction
            for(int j=0; j<nbActions; j++){
                Action b = problem.getActions().get(j);
                if(i != j && a.getName().equals(b.getName())){
                    List<Integer> clause = new ArrayList<Integer>();
                    clause.add(-getIndex(nbFluents+i+1, step));
                    clause.add(-getIndex(nbFluents+j+1, step));
                    actionDisjunctionListAtStepI.add(clause);
                }
            }
            //Inserting preconditionsList and effectsList in HashMap representing each action at each step
            actionAtStepI.add(preconditionList);
            actionAtStepI.add(positiveEffectList);
            actionAtStepI.add(negativeEffectList);
            //actionsList.put(getIndex(i + 1, step), actionAtStepI);
            actionsHashMap.put(nbFluents+i+1, actionAtStepI);
            
            //Inserting state transitions and action disjuctions in their respective list for each action at each step 
        }
        transitionsList.add(transitionListAtStepI);
        disjunctionList.add(actionDisjunctionListAtStepI);
        stepActionsHashMap.put(step, actionsHashMap);
    }

    //
    
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
            System.out.print("[(" + decodeIndex(initialList.get(i).get(0))[0] + ","
                    + decodeIndex(initialList.get(i).get(0))[1] + ")] et ");
        }
        System.out.println("]");
    }

    public void showGoalList() {
        System.out.print("Goal List : [");
        for (int i = 0; i < goalList.size(); i++) {
            System.out.print("[(" + decodeIndex(goalList.get(i).get(0))[0] + ","
                    + decodeIndex(goalList.get(i).get(0))[1] + ")] et ");
        }
        System.out.println("]");
    }

    /**
     * Fonction d'affichage de la grande HashMap pour 2 étapes
     */ 
    public void showActionsList() {
        for(int etp = 0; etp < 2 ; etp++){
            HashMap<Integer, List<List<List<Integer>>>> actionsHashMap = stepActionsHashMap.get(etp);
        System.out.println("Pour l'étape n°" + etp);
        for (int i = 0; i < nbActions; i++) {
            System.out.println("Action n°" + (i+1));
            List<List<Integer>> precondList = actionsHashMap.get(nbFluents+i+1).get(0); //actionsList.get(getIndex(i + 1, 1)).get(0);
            System.out.print("Liste des préconditions : [ ");
            for (int j = 0; j < precondList.size(); j++) {
                System.out.print("[");
                for (int k = 0; k < precondList.get(j).size(); k++)
                    System.out.print("(" + decodeIndex(precondList.get(j).get(k))[0] + "," + decodeIndex(precondList.get(j).get(k))[1] + ")V");
                    //System.out.print(precondList.get(j).get(k) + ", ");
                System.out.print("] et ");
            }
            System.out.println("]");

            List<List<Integer>> posEffectList = actionsHashMap.get(nbFluents+i+1).get(1); //actionsList.get(getIndex(i + 1, 1)).get(1);
            System.out.print("Liste des effets positifs : [ ");
            for (int j = 0; j < posEffectList.size(); j++) {
                System.out.print("[");
                for (int k = 0; k < posEffectList.get(j).size(); k++)
                    System.out.print("(" + decodeIndex(posEffectList.get(j).get(k))[0] + "," + decodeIndex(posEffectList.get(j).get(k))[1] + ")V");
                    //System.out.print(posEffectList.get(j).get(k) + ", ");
                System.out.print("] et ");
            }
            System.out.println("]");

            List<List<Integer>> negEffectList = actionsHashMap.get(nbFluents+i+1).get(2); //actionsList.get(getIndex(i + 1, 1)).get(2);
            System.out.print("Liste des effets négatifs : [ ");
            for (int j = 0; j < negEffectList.size(); j++) {
                System.out.print("[");
                for (int k = 0; k < negEffectList.get(j).size(); k++)
                    System.out.print("(" + decodeIndex(negEffectList.get(j).get(k))[0] + "," + decodeIndex(negEffectList.get(j).get(k))[1] + ")V");
                    //System.out.print(negEffectList.get(j).get(k) + ", ");
                System.out.print("] et ");
            }
            System.out.println("]");
        }
        System.out.println();
        System.out.print("Liste des transitions d'actions à l'étape " + etp + " : [ ");
        List<List<Integer>> transitionListAtStep0 = transitionsList.get(etp);
        System.out.print("[");
        for(int i=0; i<transitionListAtStep0.size(); i++){
            System.out.print("[");
            for(int j=0; j<transitionListAtStep0.get(i).size(); j++){
                System.out.print("(" + decodeIndex(transitionListAtStep0.get(i).get(j))[0]+ "," + decodeIndex(transitionListAtStep0.get(i).get(j))[1] + ")V");
            }
            System.out.print("] et ");
        }
        System.out.print("]");
        System.out.println();
        System.out.println();
        System.out.print("Liste de la disjonction d'actions à l'étape " + etp + ": [ ");
        List<List<Integer>> disjunctionListAtStep0 = disjunctionList.get(etp);
        System.out.print("[");
        for(int i=0; i<disjunctionListAtStep0.size(); i++){
            System.out.print("[");
            for(int j=0; j<disjunctionListAtStep0.get(i).size(); j++){
                System.out.print("(" + decodeIndex(disjunctionListAtStep0.get(i).get(j))[0]+ "," + decodeIndex(disjunctionListAtStep0.get(i).get(j))[1] + ")V");
            }
            System.out.print("] et ");
        }
        System.out.println("]");
        }
        
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

    public List<List<Integer>> getInitialList(){
        return initialList;
    }

    public List<List<Integer>> getGoalList(){
        return goalList;
    }

    public HashMap<Integer, HashMap<Integer, List<List<List<Integer>>>>> getStepActionsHashMap() {
        return stepActionsHashMap;
    }

    public List<List<List<Integer>>> getTransitionsList() {
        return transitionsList;
    }

    public List<List<List<Integer>>> getDisjunctionList() {
        return disjunctionList;
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
                /*OurPlanner p = new OurPlanner();
                Plan result = p.solve(problem);
                if (result != null) {*/
                    CreationProblem cp = new CreationProblem(problem, nbSteps);
                    cp.instantiateGoalStep(nbSteps);
                    System.out.println("Nb steps : " + nbSteps + "\n nb Actions possibles :" + cp.getNbActions());
                    cp.showInitialList();
                    cp.showGoalList();
                    cp.enumerateActionsForMinSteps();
                    cp.showActionsList();
                    // Put the actions of the instantiated problem and their index in a HashMap

                //}
            }
            //     // This exception could happen if the domain or the problem does not exist
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
}
