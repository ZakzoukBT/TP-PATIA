package sokoban;

import java.io.*;
import java.util.*;

import org.json.simple.JSONObject;
import org.json.simple.parser.*;

import fr.uga.pddl4j.heuristics.state.StateHeuristic;
import fr.uga.pddl4j.parser.DefaultParsedProblem;
import fr.uga.pddl4j.parser.ErrorManager;
import fr.uga.pddl4j.parser.Message;
import fr.uga.pddl4j.planners.InvalidConfigurationException;
import fr.uga.pddl4j.planners.LogLevel;
import fr.uga.pddl4j.planners.Planner;
import fr.uga.pddl4j.planners.PlannerConfiguration;
import fr.uga.pddl4j.planners.statespace.FF;
import fr.uga.pddl4j.planners.statespace.HSP;
import fr.uga.pddl4j.problem.DefaultProblem;
import fr.uga.pddl4j.problem.Problem;
import fr.uga.pddl4j.problem.operator.Action;
import fr.uga.pddl4j.plan.*;

public class Parser {
    //Mettre le chemin relatif vers le fichier JSON
    private String file;
    private String PDDLdomain = "./sokoban/src/pddlSokoban/domain.pddl";
    private String PDDLfile = "./sokoban/src/pddlSokoban/problemPDDL.pddl";

    public void setJsonFile(String fileName){
        file = fileName;
    }

    public void createFile(){
        try {
            //Il faut stocker le fichier au bon endroit !
            // 
            FileWriter fw = new FileWriter(PDDLfile);
            fw.write("(define (problem parsedProblem)\n(:domain sokoban)\n");
            fw.close();
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }

    //Lecture du fichier JSON pour obtenir le plateau de jeu initial
    public String[] getGameBoard() throws Exception {
        Object o = new JSONParser().parse(new FileReader(file));
        JSONObject jsonObj = (JSONObject) o;
        String problem = (String) jsonObj.get("testIn");
        String[] result = problem.split("\n");
        showJsonFile(result);
        return result;
    }
    
    public HashMap<Integer[], Character> getObjectCoordinates(String[] gameboard) throws Exception {
        // s = sol, a = agent, b = boite, c = cible, d = boite sur cible, e = agent sur cible
        //Faire plutot une hashmap avec comme clé le nom de l'objet comme ça on garde la trace de sur quoi est une boite ou un agent (sol, storage place, ...)
        HashMap<Integer[], Character> result = new HashMap<>();
        String[] gameBoard = gameboard;
        for (int i = 0; i < gameBoard.length; i++) {
            for (int j = 0; j < gameBoard[i].length(); j++) {
                if (gameBoard[i].charAt(j) == ' ')
                    result.put(new Integer[] { i, j }, 's');
                else if (gameBoard[i].charAt(j) == '@')
                    result.put(new Integer[] { i, j }, 'a');
                else if (gameBoard[i].charAt(j) == '.')
                    result.put(new Integer[] { i, j }, 'c');
                else if (gameBoard[i].charAt(j) == '$')
                    result.put(new Integer[] { i, j }, 'b');
                else if (gameBoard[i].charAt(j) == '*')
                    result.put(new Integer[] { i, j }, 'd');
                else if (gameBoard[i].charAt(j) == '+')
                    result.put(new Integer[] { i, j }, 'e');
            }
        }
        showCoordinates(result);
        return result;
    }

    public String writeObjects(HashMap<Integer[], Character> objects) {
        String res = "(:objects ";
        HashMap<String, Integer> cmp = new HashMap<String,Integer>();
        cmp.put("Sol", 0);
        cmp.put("Agent", 0);
        cmp.put("Cible", 0);
        cmp.put("Boite", 0);
        for(Integer[] tabI : objects.keySet()){
            if(objects.get(tabI) == 's')
                cmp.put("Sol", cmp.get("Sol") + 1);
            else if(objects.get(tabI) == 'a') {
                cmp.put("Agent", cmp.get("Agent") + 1);
                cmp.put("Sol", cmp.get("Sol") + 1);
            }
            else if(objects.get(tabI) == 'c')
                cmp.put("Cible", cmp.get("Cible") + 1);
            else if(objects.get(tabI) == 'b'){
                cmp.put("Boite", cmp.get("Boite") + 1);
                cmp.put("Sol", cmp.get("Sol") + 1);
            }
            else if(objects.get(tabI) == 'd'){
                cmp.put("Boite", cmp.get("Boite") + 1);
                cmp.put("Cible", cmp.get("Cible") + 1);
            }
            else if(objects.get(tabI) == 'e'){
                cmp.put("Agent", cmp.get("Agent") + 1);
                cmp.put("Cible", cmp.get("Cible") + 1);
            }
        }
        for(int i=1; i<=cmp.get("Sol"); i++)
            res += "s"+i+" ";
        for(int i=1; i<=cmp.get("Cible"); i++)
            res += "c"+i+" ";
        res += "- sol\n";
        for(int i=1; i<=cmp.get("Agent"); i++)
            res += "a"+i+" ";
        res += "- agent\n";
        for(int i=1; i<=cmp.get("Boite"); i++)
            res += "b"+i+" ";
        res += "- boite)\n";
        return res;
    }

    public String[][] localizeObjects(HashMap<Integer[], Character> objects, int nbLignes, int nbColonnes) throws IOException, ParseException {
        // a = agent, b = boite, c = cible, s = sol
        String [][] result = new String[nbLignes][nbColonnes];
        Iterator<Map.Entry<Integer[], Character>> iterator = objects.entrySet().iterator();
        int[] nbObjects = new int[] {0, 0, 0, 0};
        while (iterator.hasNext()) {
            Map.Entry<Integer[], Character> entry = iterator.next();
            if(entry.getValue() == 's'){
                nbObjects[3]++;
                result[entry.getKey()[0]][entry.getKey()[1]] = "s"+nbObjects[3];
            }
            else if(entry.getValue() == 'a'){
                nbObjects[0]++;
                nbObjects[3]++;
                result[entry.getKey()[0]][entry.getKey()[1]] = "a"+nbObjects[0]+";"+"s"+nbObjects[3];
            }
            else if(entry.getValue() == 'b'){
                nbObjects[1]++;
                nbObjects[3]++;
                result[entry.getKey()[0]][entry.getKey()[1]] = "b"+nbObjects[1]+";"+"s"+nbObjects[3];
            }
            else if(entry.getValue() == 'c'){
                nbObjects[2]++;
                result[entry.getKey()[0]][entry.getKey()[1]] = "c"+nbObjects[2];
            }
            else if(entry.getValue() == 'd'){
                nbObjects[1]++;
                nbObjects[2]++;
                result[entry.getKey()[0]][entry.getKey()[1]] = "b"+nbObjects[1]+";"+"c"+nbObjects[2];
            }
            else if(entry.getValue() == 'e'){
                nbObjects[0]++;
                nbObjects[2]++;
                result[entry.getKey()[0]][entry.getKey()[1]] = "a"+nbObjects[0]+";"+"c"+nbObjects[2];
            }
        }
        return result;
    }

    public String writeInitConditions(String[][] objects){
        String res ="\n(:init ";
        for(int i=0; i<objects.length; i++){
            for (int j = 0; j < objects[i].length; j++) {
                // Emplacement sur la map des différentes entités
                if (objects[i][j] == null) {
                } else if (objects[i][j].contains(";")) {
                    String[] o = objects[i][j].split(";");
                    res += "(estSur " + o[0] + " " + o[1] + ")\n";
                    if (o[1].contains("c"))
                        res += "(estDestination " + o[1] + ")\n";
                    if (o[0].contains("b") && o[1].contains("c"))
                        res += "(cibleAtteinte " + o[1] + ")\n";
                } else {
                    if (objects[i][j].contains("c"))
                        res += "(estDestination " + objects[i][j] + ")\n";
                    res += "(estLibre " + objects[i][j] + ")\n";
                }
                // Recherche des emplacements voisins
                // if(objects[i][j] != null){
                //     String objCourant = objects[i][j].contains(";")?objects[i][j].split(";")[1]:objects[i][j];
                //     if ((i-1) >= 0 && objects[i-1][j] != null) {
                //         if (objects[i - 1][j].contains(";"))
                //             res += "(aVoisinDroit " + objCourant + " " + objects[i - 1][j].split(";")[1] + ")\n";
                //         else
                //             res += "(aVoisinDroit " + objCourant + " " + objects[i - 1][j] + ")\n";
                //     }
                //     if ((j-1) >= 0 && objects[i][j-1] != null) {
                //         String[] o = objects[i][j-1].split(";");
                //         if(o.length > 1){
                //             res += "(aVoisinHaut " + objCourant + " " + o[1] + ")\n";
                //         } else {
                //             res += "(aVoisinHaut " + objCourant + " " + o[0] + ")\n";}
                //     }
                // } 
                if (objects[i][j] != null) {
                    String currentObject = objects[i][j];
                    if (objects[i][j].contains(";")) {
                        currentObject = objects[i][j].split(";")[1];
                    }
                    if(j-1 >= 0 && objects[i][j-1] != null){
                        String objectBefore = objects[i][j - 1];
                        if (objectBefore.contains(";")) {
                           objectBefore = objectBefore.split(";")[1];
                        }
                        res += "(aVoisinDroit " + objectBefore + " " + currentObject + ")\n";
                    }
                    
                    if(i-1 >= 0 && objects[i-1][j] != null){
                        String objectOnTop = objects[i-1][j];
                        if (objectOnTop.contains(";")) {
                            objectOnTop = objectOnTop.split(";")[1];
                        }
                        res += "(aVoisinHaut " + currentObject + " " + objectOnTop + ")\n";
                    }                    
                }
            }
        }
        res += ")";
        return res;
    }

    public String writeGoalConditions(String[][] objects){
        String res = "\n(:goal (and ";
        for(int i=0; i<objects.length; i++){
            for(int j=0; j < objects[i].length; j++){
                if(objects[i][j] != null) {
                    if (objects[i][j].contains("c")) {
                        String[] o = objects[i][j].split(";");
                        if (o.length > 1) {
                            res += "(cibleAtteinte " + o[1] + ")\n";
                        } else {
                            res += "(cibleAtteinte " + o[0] + ")\n";
                        }
                    }
                }
            }
        }
        res += ")\n)\n)";
        return res;
    }

    public void parseProblemJSONToPDDL() throws Exception {
        createFile();
        FileWriter fw = new FileWriter(PDDLfile, true);
        HashMap<Integer[], Character> result = getObjectCoordinates(getGameBoard());
        String res = "";
        String[][] objects = localizeObjects(result, getGameBoard().length, getGameBoard()[1].length());
        res += writeObjects(result);
        res += writeInitConditions(objects);
        res += writeGoalConditions(objects);
        fw.write(res);
        fw.close();
    }

    public Plan getPDDLResult(){
        // Gets the default configuration from the planner
        PlannerConfiguration config = FF.getDefaultConfiguration();
        // Sets the domain of the problem to solve
        config.setProperty(FF.DOMAIN_SETTING, PDDLdomain);
        // Sets the problem to solve
        //TODO Modifier le nom du problem PDDL
        config.setProperty(FF.PROBLEM_SETTING, "./sokoban/src/pddlSokoban/problem.pddl");
        // Sets the timeout allocated to the search.
        config.setProperty(FF.TIME_OUT_SETTING, 1000);
        // Sets the log level
        config.setProperty(FF.LOG_LEVEL_SETTING, LogLevel.INFO);
        // Sets the heuristic used to search
        config.setProperty(FF.HEURISTIC_SETTING, StateHeuristic.Name.MAX);
        // Sets the weight of the heuristic
        config.setProperty(FF.WEIGHT_HEURISTIC_SETTING, 1.2);

        // Creates an instance of the HSP planner with the specified configuration
        Planner planner = Planner.getInstance(Planner.Name.FF, config);

        // Runs the planner and print the solution
        Plan result = new SequentialPlan();
        try {
            result = planner.solve();
        } catch (InvalidConfigurationException e) {
            e.printStackTrace();
        }
        return result;
    }

    public String getStringSolution(Plan p){
        String res= "";
        for (Action a : p.actions()) {
            if(a.getName().contains("haut"))
                res += "U";
            else if(a.getName().contains("bas"))
                res += "D";
            else if(a.getName().contains("gauche"))
                res += "L";
            else if(a.getName().contains("droit"))
                res += "R";
        }
        return res;
    }

    public void showJsonFile(String[] gameboard) throws Exception {
        ArrayList<String> result = new ArrayList<String>(Arrays.asList(gameboard));
        for (String s : result) {
            System.out.println("|" + s + "|");
        }
    }

    public void showCoordinates(HashMap<Integer[], Character> objectCoordinates) throws Exception {
        StringBuilder stringBuilder = new StringBuilder("{");

        for (Map.Entry<Integer[], Character> entry : objectCoordinates.entrySet()) {
            stringBuilder.append(Arrays.toString(entry.getKey()))
                         .append(":")
                         .append("\"").append(entry.getValue()).append("\", ");
        }

        // Remove the trailing comma and space
        if (stringBuilder.length() > 1) {
            stringBuilder.setLength(stringBuilder.length() - 2);
        }

        stringBuilder.append("}");
        System.out.println(stringBuilder);
    }
    
    

    public static void main(String[] args) throws Exception {
        Parser p = new Parser();
        p.setJsonFile("./sokoban/config/test2.json");
    
        p.createFile();
        FileWriter fw = new FileWriter(p.PDDLfile, true);
        HashMap<Integer[], Character> result = p.getObjectCoordinates(p.getGameBoard());
        String res = "";
        String[][] objects = p.localizeObjects(result, p.getGameBoard().length, p.getGameBoard()[1].length());
        //Affichage de objects !!
        for(int i=0; i< objects.length; i++){
            for(int j=0; j<objects[i].length; j++){
                System.out.print(objects[i][j] + "  ");
            } 
            System.out.print("\n");
        }
        //Fin affichage
        res += p.writeObjects(result);
        res += p.writeInitConditions(objects);
        res += p.writeGoalConditions(objects);
        fw.write(res);
        fw.close();
        //p.parseProblemJSONToPDDL();

        // Plan res = p.getPDDLResult();
        // System.out.println(p.getStringSolution(res));
        // String solution = "DUU";
        // for (char c : solution.toCharArray()) System.out.println(c);
    }
    
}
