import java.io.*;
import java.util.*;

public class h6TestModified {
	public static void main(String args[]) throws IOException {
        
        BufferedReader b = new BufferedReader(new FileReader(args[0]));
        int numtrees = Integer.parseInt(b.readLine());
        AVLTree trees[] = new AVLTree[numtrees];
        String filenames[] = new String[numtrees];
        
        for (int i = 0; i < numtrees; i++) {
            filenames[i] = b.readLine();
            trees[i] = new AVLTree(filenames[i],0);
        }

System.out.println("Test 1 - Insert");
        for (int j = 0; j < numtrees; j++) {
            System.out.println("\ttree "+j);
            String nums[] = b.readLine().split(" ");
            
            System.out.print("\t");
            for (int i = 0; i < nums.length; i++) {
                System.out.print(nums[i] + " ");
                trees[j].insert(Integer.parseInt(nums[i]));
            }
            System.out.println();
        }

System.out.println("Test 2 - Find");
        for (int j = 0; j < numtrees; j++) {
            System.out.println("\ttree "+j);
            String nums[] = b.readLine().split(" ");
            for (int i = 0; i < nums.length; i++) {
                System.out.println("\tfind(" + Integer.parseInt(nums[i]) + ") = " 
                            + trees[j].find(Integer.parseInt(nums[i])));
            }
        }

System.out.println("\nTest 3 - Remove All");
        for (int j = 0; j < numtrees; j++) {
            System.out.println("\ttree "+j);
            String nums[] = b.readLine().split(" ");
            
            System.out.print("\t");
            for (int i = 0; i < nums.length; i++) {
                    System.out.print(nums[i] + " ");
                    trees[j].removeAll(Integer.parseInt(nums[i]));
            }
            System.out.println();
        }

        
System.out.println("Test 4 - Find");
        for (int j = 0; j < numtrees; j++) {
            System.out.println("\ttree "+j);
            String nums[] = b.readLine().split(" ");
            for (int i = 0; i < nums.length; i++) {
                System.out.println("\tfind(" + Integer.parseInt(nums[i]) + ") = " 
                        + trees[j].find(Integer.parseInt(nums[i])));
            }
        }
        
System.out.println("\nTest 5 - Close");
        for (int j = 0; j < numtrees; j++) {
            trees[j].close();
        }
		
        
System.out.println("\nTest 6 - Create Tree (Reuse)");
        for (int i = 0; i < numtrees; i++) {
            trees[i] = new AVLTree(filenames[i],1);
        }

System.out.println("Test 7 - Insert");
        for (int j = 0; j < numtrees; j++) {
            System.out.println("\ttree "+j);
            String nums[] = b.readLine().split(" ");
            
            System.out.print("\t");
            for (int i = 0; i < nums.length; i++) {
                System.out.print(nums[i] + " ");
                trees[j].insert(Integer.parseInt(nums[i]));
            }
            System.out.println();
        }
        
System.out.println("Test 8 - Find");
        for (int j = 0; j < numtrees; j++) {
            System.out.println("\ttree "+j);
            String nums[] = b.readLine().split(" ");
            for (int i = 0; i < nums.length; i++) {
                System.out.println("\tfind(" + Integer.parseInt(nums[i]) + ") = " 
                        + trees[j].find(Integer.parseInt(nums[i])));
            }
        }
        
System.out.println("\nTest 9 - Remove One");
        for (int j = 0; j < numtrees; j++) {
            System.out.println("\ttree "+j);
            String nums[] = b.readLine().split(" ");
            
            System.out.print("\t");
            for (int i = 0; i < nums.length; i++) {
                System.out.print(nums[i] + " ");
                trees[j].removeOne(Integer.parseInt(nums[i]));
            }
            System.out.println();
        }
        
        
System.out.println("Test 10 - Find");
        for (int j = 0; j < numtrees; j++) {
            System.out.println("\ttree "+j);
            String nums[] = b.readLine().split(" ");
            for (int i = 0; i < nums.length; i++) {
                System.out.println("\tfind(" + Integer.parseInt(nums[i]) + ") = " 
                        + trees[j].find(Integer.parseInt(nums[i])));
            }
        }
        
        b.close();
                
System.out.println("\nDone");


	}
}
