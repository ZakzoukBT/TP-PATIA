package sokoban;

import java.io.*;
import java.util.*;

import org.json.simple.JSONObject;
import org.json.simple.parser.*;

public class Parser {
    //Mettre le chemin relatif vers le fichier JSON
    private String file;
    private String PDDLfile = "./src/pddlSokoban/problemPDLL.pddl";

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
    public String[] getGameBoard() throws IOException, ParseException {
        Object o = new JSONParser().parse(new FileReader(file));
        JSONObject jsonObj = (JSONObject) o;
        String problem = (String) jsonObj.get("testIn");
        return problem.split("\n");
    }
    
    public HashMap<Integer[], Character> getObjectCoordinates() throws IOException, ParseException {
        // s = sol, a = agent, b = boite, c = cible
        //Faire plutot une hashmap avec comme clé le nom de l'objet comme ça on garde la trace de sur quoi est une boite ou un agent (sol, storage place, ...)
        HashMap<Integer[], Character> result = new HashMap<>();
        String[] gameBoard = getGameBoard();
        for(int i=0; i<gameBoard.length; i++){
            for(int j=0; j<gameBoard[i].length(); j++){
                if(gameBoard[i].charAt(j) == ' ')
                    result.put(new Integer[]{i,j}, 's');
                else if(gameBoard[i].charAt(j) == '@')
                    result.put(new Integer[]{i,j}, 'a');
                else if(gameBoard[i].charAt(j) == '.')
                    result.put(new Integer[]{i,j}, 'c');
                else if(gameBoard[i].charAt(j) == '$')
                    result.put(new Integer[]{i,j}, 'b');
                else if(gameBoard[i].charAt(j) == '*')
                    result.put(new Integer[]{i,j}, 'b');
                else if(gameBoard[i].charAt(j) == '+')
                    result.put(new Integer[]{i,j}, 'a');
            }
        }
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
        }
        for(int i=1; i<=cmp.get("Sol"); i++)
            res += "s"+i+" ";
        res += "- sol\n";
        for(int i=1; i<=cmp.get("Agent"); i++)
            res += "a"+i+" ";
        res += "- agent\n";
        for(int i=1; i<=cmp.get("Cible"); i++)
            res += "c"+i+" ";
        res += "- cible\n";
        for(int i=1; i<=cmp.get("Boite"); i++)
            res += "b"+i+" ";
        res += "- boite)\n)\n";
        return res;
    }

    public String[][] localizeObjects(HashMap<Integer[], Character> objects, int nbLignes, int nbColonnes) throws IOException, ParseException {
        // s = sol, a = agent, b = boite, c = cible
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
        }
        return result;
    }

    public String writeInitConditions(String[][] objects){
        String res ="\n(:init ";
        for(int i=0; i<objects.length; i++){
            for (int j = 0; j < objects[i].length; j++) {
                // Emplacement sur la map des différentes entités
                if (objects[i][j] == null) {} 
                else if(objects[i][j].contains(";")){
                    String[] o = objects[i][j].split(";");
                    res += "(estSur " + o[0] + " " + o[1] + ")\n"; 
                } else {
                    res += "(estLibre " + objects[i][j] + ")\n";
                }
                // Recherche des emplacements voisins
                if(objects[i][j] != null){
                    String objCourant = objects[i][j].contains(";")?objects[i][j].split(";")[1]:objects[i][j];
                    if((i-1) >= 0 && objects[i-1][j] != null){
                        if(objects[i-1][j].contains(";"))
                            res += "(aVoisinHaut " + objCourant + " " + objects[i-1][j].split(";")[1] + ")\n";
                        else
                            res += "(aVoisinHaut " + objCourant + " " + objects[i-1][j] + ")\n";
                    } else if ((j-1) >= 0 && objects[i][j-1] != null) {
                        String[] o = objects[i][j-1].split(";");
                        if(o.length > 1){
                            res += "(aVoisinDroit " + objCourant + " " + o[1] + ")\n";
                        } else {
                            res += "(aVoisinDroit " + objCourant + " " + o[0] + ")\n";}
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
                    if(objects[i][j].contains("c")){
                        res += "(cibleAtteinte " + objects[i][j] + ")\n";
                    }
                }
            }
        }
        res += ")\n)\n)";
        return res;
    }

    public void parseProblemJSONToPDDL() throws IOException, ParseException {
        createFile();
        FileWriter fw = new FileWriter(PDDLfile, true);
        HashMap<Integer[], Character> result = getObjectCoordinates();
        String res = "";
        String[][] objects = localizeObjects(result, getGameBoard().length, getGameBoard()[1].length());
        res += writeInitConditions(objects);
        res += writeGoalConditions(objects);
        fw.write(res);
        fw.close();
    }

    public static void main(String[] args) {
        Parser p = new Parser();
        p.setJsonFile("./config/test1.json");
        try{
            p.parseProblemJSONToPDDL();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        
        //String solution = "DUU";
        //for (char c : solution.toCharArray()) System.out.println(c);
    }
    
}
