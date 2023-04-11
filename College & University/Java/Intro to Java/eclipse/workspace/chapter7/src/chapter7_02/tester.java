/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chapter7_02;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

/**
 * A class to test your OrderedIntArrayList
 */
public class tester {
	
	// Repeatable tester variables
	private static int successes;
	private static int failures;
	private static long startTime = System.nanoTime();
	private static final int DEFAULT_MAX_ITERATIONS = 100;
	private static Scanner s;
	
    public static void main(String[] args) throws InterruptedException{

    	int maxIterations = DEFAULT_MAX_ITERATIONS;
    	
  		s = new Scanner(System.in);
    	
        System.out.println("*** Testing \"OrderedIntArrayList\" class file. ***");
        System.out.println("*** How many times will you run the test?. ***");
        System.out.println("");
        System.out.println("Type how many times you want to test:");
        
        while(!s.hasNextInt()) {
        	s.next();
        	System.out.println("ERROR: Invalid Input.");
        	System.out.println("Type a number here:");
        }
        maxIterations = s.nextInt();
        
        Thread.sleep(10);			// wait
    	// Run each of the 6 tests based on user input. (DEFAULT INPUT IS "1")
        // (this loop repeats the tests to make sure there's no missed errors from the random numbers.)
    	for (int iterations = 1; iterations <= maxIterations; iterations++) {;
    		System.out.println("---------------------------------------------------------------");
    		
    		// Tell user if the test succeeded or failed.
        	if (failures > 0) {
        		// END the program if a ERROR or TEST FAILURE occurs.
        		System.out.println("ERROR: A test failure was detected.");
        		
        		final long duration = System.nanoTime() - startTime;
            	final double seconds = ((double)duration / 1000000000);
            	System.out.println("Time Elapsed (ns): " + duration + " nanoseconds");
            	System.out.println("Time Elapsed (s): " + seconds + " seconds");
        		
        		System.exit(0);
        	} else {
        		// SUCCESS if no error or test failure occurs.
        		System.out.println("SUCCESS: No test failures were detected.");
        		System.out.println("");
        	}
        	
    		addTest();				
	        capacityTest();			
	        increaseSizeTest();		
	        removeTest();			
	        loadArrayTest();		
	        toArrayTest();			
	        
	        System.out.println("");
	        System.out.println("Test Iterations:     " + iterations);
	        System.out.println("Overall Successes:   " + successes);
	        System.out.println("Overall Failures:    " + failures);
	        System.out.println("");
	        System.out.println("---------------------------------------------------------------");
    	}
    	
    	// Tell user that ALL the tests finished with no failures.
    	System.out.println("SUCCESS: No test failures were detected.");
    	System.out.println("");
    	System.out.println("***ALL TESTS FINISHED***");
    	
    	final long duration = System.nanoTime() - startTime;
    	final double seconds = ((double)duration / 1000000000);
    	System.out.println("Time Elapsed (ns): " + duration + " nanoseconds");
    	System.out.println("Time Elapsed (s): " + seconds + " seconds");
    	
    	System.out.println("");
        System.out.println("***END OF TESTER***");
    }
    
    //test the add method of the list
    private static void addTest(){
        System.out.println("***BEGIN ADD TESTS***");
        
        OrderedIntArrayList list = new OrderedIntArrayList();
        
        //add 100 values to the list
        //these values are already in order
        for(int i = 0; i < 100; i++){
            list.add(i);
        }
        
        //output the list to check it out
        //System.out.println("Output list to see its contents:");
        //System.out.println(list.toString());
        
        //check size
        if(list.getSize() != 100){
            System.out.println("ERROR: list size is not correct");
            failures++;
            return;
        }
        
        //check the list contents
        for(int i = 0; i < 100; i++){
            if(list.get(i) != i){
                System.out.println("ERROR: The contents of the list are not as expected!");
                failures++;
                return;
            }
        }
        
        //create a new list
        //add 100 random values to the array
        //each random value is between 0 and 999
        OrderedIntArrayList list2 = new OrderedIntArrayList();
        List<Integer> compList = new ArrayList<Integer>();
        for(int i = 0; i < 100; i++){
            int randNum = (int)(Math.random() * 1000);
            list2.add(randNum);
            compList.add(randNum);
        }
        
        //output list2 to check it out
        //System.out.println("\bOutput list2 to see its contents:");
        //System.out.println(list2.toString());
        
        //check size
        if(list2.getSize() != 100){
            System.out.println("ERROR: list2 size is not correct");
            failures++;
            return;
        }
        
        //check the list contents
        Collections.sort(compList);
        int i = 0;
        while(i < compList.size()){
            if(list2.get(i) != compList.get(i).intValue()){
                System.out.println("ERROR: The contents list2 are not as expected!");
                failures++;
                return;
            }
            i++;
        }       
        
        
        System.out.println("Add tests successful!");
        System.out.println("***END ADD TESTS***");
        successes++;
    }
    
    //test if the list capacity and related methods work as expected
    private static void capacityTest(){
        System.out.println("\n***BEGIN CAPACITY TESTS***");
        
        //initilize the list and make sure it isEmpty
        OrderedIntArrayList list = new OrderedIntArrayList();
        
        if(list.getSize() != 0){
            System.out.println("ERROR: Size should be zero!");
            failures++;
            return;
        }
        
        //add one int and check
        list.add(10);
        if(list.getSize() != 1){
            System.out.println("ERROR: Size should be one!");
            failures++;
            return;
        }
        
        //create a new list with a capacity of 100
        //add 100 items and verify list is full once item 100 is added
        list = new OrderedIntArrayList(100);
        for(int i = 0; i < 100; i++){
            list.add(i);
            if(i < 98 && list.isFull()){
                System.out.println("ERROR: the list should not be full yet!");
                failures++;
                return;
            }
            
            if(i == 99 && !list.isFull()){
                System.out.println("ERROR: the list should now be full!");
                failures++;
                return;
            }
        }
        
        
        System.out.println("Capacity tests successful!");
        System.out.println("***END CAPACITY TESTS***");
        successes++;
    }
    
    //test if increase size works
    private static void increaseSizeTest(){
        System.out.println("\n***BEGIN INCREASE SIZE TESTS***");
        
        //initialize a list with a capacity of 10
        //add 10 ints
        OrderedIntArrayList list = new OrderedIntArrayList(10);
        for(int i = 0; i < 10; i++){
            list.add(i * 5);
        }
        
        //verify the list is full
        if(!list.isFull()){
            System.out.println("ERROR: list should be full at this point!");
            failures++;
            return;
        }
                       
        //increase capacity
        list.increaseCapacity(10);
        
        //verify the list is not full now
        if(list.isFull()){
            System.out.println("ERROR: list should be not be full at this point!");
            failures++;
            return;
        }
        
        for(int i = 0; i < list.getSize(); i++){
            if(list.get(i) != i * 5){
                System.out.println("ERROR: the data in the list in not correct!");
                failures++;
                return;
            }
        }
        
        
        System.out.println("Increase size tests successful!");
        System.out.println("***END INCREASE SIZE TESTS***");
        successes++;
    }
    
    //test if remove works
    private static void removeTest(){
        System.out.println("\n***BEGIN REMOVE TESTS***");
        
        //verify a normal remove works as anticipated
        //first create a list of 1000 random entrys
        OrderedIntArrayList list = new OrderedIntArrayList();
        //and copy the list to a know good list
        List<Integer> goodList = new ArrayList<Integer>();
        for(int i = 0; i < 100; i++){
            int rand = (int)(Math.random() * 100);
            list.add(rand);
            goodList.add(rand);
        }
        Collections.sort(goodList);
        
        //randomly remove every item from the list
        //making sure it matches our known good list each time
        while(!list.isEmpty()){
            //randomly pick the next index to nuke
            int index = (int)(Math.random() * list.getSize());
            //get the value at that index
            int num = list.get(index);
            //now delete that num from both lists and compare
            list.removeItem(num);
            
            //remove from the goodlist
            //we loop incase the value is repeated
            while(goodList.remove(new Integer(num))){
            }
            
            //validate the size is correct
            if(goodList.size() != list.getSize()){
                System.out.println("ERROR: The lists should be the same size!");
//                System.out.println("List Size: " + list.getSize() + " \nGood List Size: " + goodList.size());
//                System.out.println("NUM = " + num);
//                System.out.println("Output list to see its contents:");
//                System.out.println(list.toString());
//                System.out.println("Output good list to see its contents:");
//                System.out.println(goodList.toString());
                failures++;
                return;
            }
            
            //validate both the lists still match
            for(int i = 0; i < list.getSize(); i++){
                if(list.get(i) != goodList.get(i).intValue()){
                    System.out.println("ERROR: The lists should still match!");
//                    //output the list to check it out
//                    System.out.println("Output list to see its contents:");
//                    System.out.println(list.toString());
//                    System.out.println("NUM = " + num);
//                    //output the list to check it out
//                    System.out.println("Output good list to see its contents:");
//                    System.out.println(goodList.toString());
//                    System.out.println("NUM = " + num);
                    failures++;
                    return;
                }
            }
            
        }        
        
        //try to remove an item that does not exist in the list
        list = new OrderedIntArrayList();
        list.add(10);
        list.removeItem(100);
        //verify nothing happened
        if(list.isEmpty() || list.get(0) != 10){
            System.out.println("ERROR: Nothing should have been removed");
            failures++;
            return;
        }
        
        
        System.out.println("Remove tests successful!");
        System.out.println("***END REMOVE TESTS***");
        successes++;
    }
    
    //test if load array works
    private static void loadArrayTest(){
        System.out.println("\n***BEGIN LOAD ARRAY TESTS***");
        
        //create a new brand new list by loading an existing array
        //the existing array will be made up of random unordered values
        int[] testArr = new int[1000];
        //create a knownGood for comparison
        List<Integer> goodList = new ArrayList<Integer>();
        for(int i = 0; i < 1000; i++){
            int num = (int)(Math.random() * 1000);
            testArr[i] = num;
            goodList.add(num);
        }
        Collections.sort(goodList);
        
        OrderedIntArrayList list = new OrderedIntArrayList();
        list.loadArray(testArr);
        
        //validate both the lists still match
        for(int i = 0; i < list.getSize(); i++){
            if(list.get(i) != goodList.get(i).intValue()){
                System.out.println("ERROR: The lists should still match!");
//                System.out.println("Output list to see its contents:");
//                System.out.println(list.toString());
//                System.out.println("Output good list to see its contents:");
//                System.out.println(goodList.toString());
//                System.out.println(list.getSize());
//                System.out.println(goodList.size());
                failures++;
                return;
            }
        }
        
        //add on to the orginal list and make sure it still matches
        //just add the original array again
        list.loadArray(testArr);
        //maintain our goodList
        for(int i = 0; i < testArr.length; i++){
            goodList.add(testArr[i]);
        }
        Collections.sort(goodList);
        
         //validate both the lists still match
        for(int i = 0; i < goodList.size(); i++){
            if(list.get(i) != goodList.get(i).intValue()){
                System.out.println("ERROR: The lists should still match!");
//                System.out.println("Output list to see its contents:");
//                System.out.println(list.toString());
//                System.out.println("Output good list to see its contents:");
//                System.out.println(goodList.toString());
//                System.out.println(list.getSize());
//                System.out.println(goodList.size());
                failures++;
                return;
            }
        }
        
        System.out.println("Load array tests successful!");
        System.out.println("***END LOAD ARRAY TESTS***");
        successes++;
    }
    
    private static void toArrayTest(){
        System.out.println("\n***BEGIN TO ARRAY TESTS***");
        
        //create an array
        //build the list based on that array
        //validate the array returned from toArray() matches the original
        
        int[] fibArr = new int[25];
        //generate the first 25 numbers in the fibonacci sequence
        //they will be order already by definition
        //Fn = Fn-1 + Fn-2 
        fibArr[0] = 0;
        fibArr[1] = 1;
        for(int i = 2; i < fibArr.length; i++){
            fibArr[i] = fibArr[i - 1] + fibArr[i - 2];
        }
        
        //create a list based on them
        OrderedIntArrayList list = new OrderedIntArrayList();
        list.loadArray(fibArr);
        
        //validate the returned array matched
        int[] retArr = list.toArray();
        if(retArr.length != fibArr.length){
            System.out.println("ERROR: the two arrays should be the same size!");
//            System.out.println("Output list to see its contents:");
//            System.out.println(list.toString());
//            System.out.println("Output good list to see its contents:");
//            System.out.println(retArr.toString());
//            System.out.println(fibArr.length);
//            System.out.println(retArr.length);
            failures++;
            return;
        }
        
        for(int i = 0; i < retArr.length; i++){
            if(retArr[i] != fibArr[i]){
                System.out.println("ERROR: the contents of the arrays should match!");
//                System.out.println("Output list to see its contents:");
//                System.out.println(list.toString());
//                System.out.println("Output good list to see its contents:");
//                System.out.println(retArr.toString());
//                System.out.println(fibArr.length);
//                System.out.println(retArr.length);
                failures++;
                return;
            }
        }
        
        System.out.println("toArray() tests successful!");
        System.out.println("***END TO ARRAY TESTS***");
        successes++;
    }
}
