package sokoban;

import java.io.*;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.*;

public class Parser {
    //Mettre le chemin relatif vers le fichier JSON
    private String file;
    private String PDDLfile = "./src/pddlSokoban/parseProblem.pddl";

    public void setJsonFile(String fileName){
        file = fileName;
    }

    public void createFile(){
        try {
            //Il faut stocker le fichier au bon endroit !
            File myObj = new File(PDDLfile);
            FileWriter fw = new FileWriter(myObj);
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

    public void parseProblemJSONToPDDL() throws IOException, ParseException {
        String[] lines = getGameBoard();
        createFile();

        FileWriter fw = new FileWriter(PDDLfile, true);
        fw.write("(:objects ");
        HashMap<String, Integer> objets = new HashMap<String,Integer>();
        objets.put("Sol", 0);
        objets.put("Agent", 0);
        objets.put("Cible", 0);
        objets.put("Boite", 0);
        
        //Manque peut être les storage place (qu'est ce que c'est ?)
        
        
        for(int i=0; i<objets.get("Sol"); i++)
            fw.write("s"+i+" ");
        fw.write("- sol\n");
        for(int i=0; i<objets.get("Agent"); i++)
            fw.write("a"+i+" ");
        fw.write("- agent\n");
        for(int i=0; i<objets.get("Cible"); i++)
            fw.write("c"+i+" ");
        fw.write("- cible\n");
        for(int i=0; i<objets.get("Boite"); i++)
            fw.write("b"+i+" ");
        fw.write("- boite)\n");
        for(int i=0; i<lines.length; i++){
            for(int j=0; j<lines[i].length(); j++){
                //if(lines[i].charAt(j) == ' ')
                  //A continuer  
            }
        }
    }

    public static void main(String[] args) {
        Parser p = new Parser();
        p.setJsonFile("./sokoban/config/test1.json");
        try{
            //System.out.println(p.getGameBoard());
            HashMap<Integer[], Character> result = p.getObjectCoordinates();
            int cmp = 0;
            for(Integer[] tabI : result.keySet()){
                System.out.println(tabI[0] + " " + tabI[1] + " - " + result.get(result.keySet().toArray()[cmp]));
                cmp++;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        
        //String solution = "DUU";
        //for (char c : solution.toCharArray()) System.out.println(c);
    }
    
}
