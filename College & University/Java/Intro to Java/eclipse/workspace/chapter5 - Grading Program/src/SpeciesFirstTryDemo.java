/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author Greg
 */
public class SpeciesFirstTryDemo {
    public static void main(String[] args){
        SpeciesFirstTry speciesOfTheMonth = new SpeciesFirstTry();
        System.out.println("Enter data on the Species of the Month:");
        speciesOfTheMonth.readInput();
        speciesOfTheMonth.writeOutput();
        int futurePop = speciesOfTheMonth.getPopulationIn10();
        String msg = "In ten years the population will be " + futurePop;
        System.out.println(msg);
        
        System.out.println("");
        
        //we can overwrite the data in the last object
        speciesOfTheMonth.name = "Kingon ox";
        speciesOfTheMonth.population = 10;
        speciesOfTheMonth.growthRate = 15;
        System.out.println("The new species of the Month:");
        speciesOfTheMonth.writeOutput();
        msg = "In ten years the population will be "
                + speciesOfTheMonth.getPopulationIn10();
        System.out.println(msg);
        
    }
}
