/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.util.Scanner;

/*
        It is on page 295

        This is exactly the same as SpeciesFirstTry, but
        now we change the method getPopulationIn10Years
        to predictPopulation method to accept a parameter.       
*/
public class SpeciesSecondTry {
    public String name;
    public int population;
    public double growthRate;
    
    //reads the input from the user about the species
    public void readInput(){
        Scanner kb = new Scanner(System.in);
        
        System.out.println("What is the species' name?");
        name = kb.nextLine();
        System.out.println("What is the population of the species?");
        population = kb.nextInt();
        System.out.println("Enter the growth rate (% increase per year):");
        growthRate = kb.nextDouble();
    }
    
    //output the basic information about the species
    public void writeOutput(){
        System.out.println("Name = " + name);
        System.out.println("Population = " + population);
        System.out.println("Growth rate = " + growthRate + "%");
    }
    
    /**
     Returns the projected population after the specified number of years     
     */
    public int predictPopulation(int years){
        int result = 0;
        double populationAmount = population;
        int count = years;
        //each year we add the new population to the old
        //no one dies...
        while((count > 0) && (populationAmount > 0)){
            populationAmount = populationAmount + 
                    ((growthRate / 100) * populationAmount); 
            count--;
        }
        
        if(populationAmount > 0){
            result = (int)populationAmount;
        }
        
        return result;
    }    
}
