/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.util.Scanner;

/*
        This program is meant to demonstrate
        the basic principles of a Class.
        It is a little more complex than the Dog class

        It is on page 284

        Note, this class has several design flaws.
        It is just an example to get us started with classes.
        We will improve on it as we learn.
        
        Objectives:
            1.  Discuss the concept of a class
                -A class is like a definition.
                -Notice, there is no main method, usually.
            2.  instance variables
            3.  methods within a class
*/
public class SpeciesFirstTry {
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
    
    //calculates the population of the species in 10 years
    public int getPopulationIn10(){
        int result = 0;
        double populationAmount = population;
        int count = 10;
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
