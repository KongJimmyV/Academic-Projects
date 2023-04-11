import java.io.EOFException;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class AVLTreeTester {
    
    private static RandomAccessFile f;
    static Scanner scan = new Scanner(System.in);
    static AVLTree t = null;
    static boolean showTree = false;
    
    /**
     * Short Manual Tester for {@code AVLTree}.
     * @param args
     */
    public static void main(String[] args) {
        
        if (args.length >= 1) {
            // Continue.
            
        } else {
            // Ask for a file location.
            System.out.println("No command line argument found.");
            System.out.println("Type a file location and name to store the tree in.");
            args = new String[1];
            args[0] = scan.next();
        }
        
        try {
            
            // Ask user to create or reuse the tree.
            while (true) {
                System.out.println("Type a character/letter and press enter to start.");
                System.out.println("\t1. Create a new tree.");
                System.out.println("\t2. Reuse the old tree.");
                System.out.println("\tQ. Quit/Exit program.");
                String str = scan.next();
                
                File path = new File(args[0]);
                if (str.equals("1")) {
                    
                    while (path.exists()) {
                        if (path.exists()) {
                            System.out.println("Warning. This file already exists."
                                    + " Are you sure you want to replace this file?");
                            System.out.println("\tY. Yes, Replace the file.");
                            System.out.println("\tN. No, Do not replace the file.");
                            System.out.println("\tQ. Quit/Exit program.");
                            str = scan.next();
                        } 
                        
                        if (str.equalsIgnoreCase("y") 
                                || str.equalsIgnoreCase("n") 
                                || str.equalsIgnoreCase("q")) {
                            break;
                        }
                    }
                    
                    if (str.equalsIgnoreCase("y") || str.equals("1")) {
                        t = new AVLTree(args[0], AVLTree.CREATE);
                        f = new RandomAccessFile(path, "r");
                    }
                } 
                else if (str.equals("2")) {
                    t = new AVLTree(args[0], AVLTree.REUSE);
                    f = new RandomAccessFile(path, "r");
                } else {
                    if (!str.equalsIgnoreCase("q"))
                        continue;
                }
                
                // Ask user what to do with the tree.
                while (!str.equalsIgnoreCase("q") && !str.equalsIgnoreCase("n")) {
                    if (showTree) {
                        System.out.println("*********************************************");
                        System.out.println("*** Here is a tree. ***");
                        System.out.println("*** TREE HEIGHT: " + t.height(false) + " ***");
                        printTree();
                    }
                    
                    System.out.println("Type a character/letter and press enter to start.");
                    System.out.println("\t1. Insert an integer into the tree.");
                    System.out.println("\t2. Remove one copy of an integer from the tree.");
                    System.out.println("\t3. Remove all copies of an integer from the tree.");
                    System.out.println("\t4. Find an integer and return the amount of copies in the tree.");
                    System.out.println("\t5. Print debug info.");
                    System.out.println("\t6. Toggle Tree Diagram. (" + showTree + ")");
                    System.out.println("\tQ. Save the tree and Quit/Exit program.");
                    str = scan.next();
                    
                    if (str.equals("1")) {
                        System.out.println("*** Type the integer to insert. ***");
                        int d = scan.nextInt();
                        t.insert(d);
                    }
                    
                    if (str.equals("2")) {
                        System.out.println("*** Type the integer to remove.");
                        int d = scan.nextInt();
                        t.removeOne(d);
                    }
                    
                    if (str.equals("3")) {
                        System.out.println("*** Type the integer to remove all.");
                        int d = scan.nextInt();
                        t.removeAll(d);
                    }
                    
                    if (str.equals("4")) {
                        System.out.println("*********************************************");
                        System.out.println("*********************************************");
                        System.out.println("*** Type the integer to find and count.");
                        int d = scan.nextInt();
                        int count = t.find(d);
                        
                        if (count > 0) {
                            System.out.println("*** The amount of integers found is/are...");
                            System.out.println("\tCount = " + count);
                        } else {
                            System.out.println("*** The integer was not found in the tree.");
                            System.out.println("\tCount = " + count);
                        }
                        System.out.println();
                    }
                    
                    if (str.equals("5")) {
                        System.out.println("*********************************************");
                        System.out.println("*********************************************");
                        System.out.println("*** Here is a list of stored nodes. ***");
                        t.print();
                        System.out.println("*** Here is what is stored in the file. ***");
                        printList();
                        System.out.println("*** Here is the free list. ***");
                        printFreeList();
                        System.out.println();
                    }
                    
                    if (str.equals("6")) {
                        System.out.println("*********************************************");
                        System.out.println("*********************************************");
                        System.out.println("The Tree Diagram was toggled.");
                        if (showTree)   showTree = false;
                        else            showTree = true;
                        
                        System.out.println();
                    }
                    
                    /*if (!str.equalsIgnoreCase("q")) {
                        System.out.println();
                        System.out.println("*** Press Enter to continue... ***");
                        scan.nextLine();
                    }*/
                    
                }
                
                // Quit.
                if (str.equalsIgnoreCase("q")) {
                    break;
                } 
                
                // Do not replace the tree.
                else if (str.equalsIgnoreCase("n")) {
                    continue;
                }
                
                // Invalid input.
                else {
                    System.out.println("*** Invalid Input. ***");
                }
            }
            
            if (t != null) t.close();
            scan.close();
            
        } catch (IOException e) {
            e.printStackTrace();
            
            if (t != null){
                try {
                    t.close();
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
            
            scan.close();
        }
        
        System.out.println("*** END ***");
    }
    
    //*** Debug Helper Methods ***
    private static void printList() throws IOException {
        System.out.println();
        
        f.seek(0);
        System.out.println(f.getFilePointer() + " " + f.readLong());
        System.out.println(f.getFilePointer() + " " + f.readLong());
        
        try {
            while (true) {
                System.out.println(f.getFilePointer() + " "
                                    + f.readInt() + " " 
                                    + f.readInt() + " " 
                                    + f.readInt() + " "
                                    + f.readLong() + " "
                                    + f.readLong());
            }
        } catch (EOFException e) {
            //System.out.println("*** End Of File ***");
        }
        
        System.out.println();
    }


    private static void printFreeList() throws IOException {
        if (t.free == 0)
            System.out.print("free --> " + t.free);
        else
            System.out.print("free --> " + t.free + " --> ");
        printFreeList(t.free);
        System.out.println();
    }


    private static long printFreeList(long fNode) throws IOException {
        if (fNode <= 0) return fNode;
        
        f.seek(fNode);
        long node = f.readLong();
        
        if (node <= 0) System.out.print(node);
        else System.out.print(node + " --> ");
        
        printFreeList(node);
        
        return fNode;
    }
    
    //*** Tree Visualizations ***
    /**
     * Prints a tree structure to the console.
     * @throws IOException
     */
    private static void printTree() throws IOException {
        printTree(t.root, 1);
    }
    
    /** Helper method for {@code printTree()} */
    private static void printTree(final long root, final int treeScaleOffset) throws IOException {
        int maxLevel = maxLevel(root);
        
        List<Long> list = new ArrayList<>();
        list.add(root);
        
        printNodeInternal(list, 1, maxLevel + treeScaleOffset);
    }
    
    /** Helper method for {@code printTree()} */
    private static void printNodeInternal(final List<Long> nodes, final int level, final int maxLevel) throws IOException {
        if (nodes.isEmpty() || isAllElementsNull(nodes))
            return;

        int floor = maxLevel - level;
        int endgeLines = (int) Math.pow(2, (Math.max(floor - 1, 0)));
        int firstSpaces = (int) Math.pow(2, (floor)) - 1;
        int betweenSpaces = (int) Math.pow(2, (floor + 1)) - 1;
        
        printWhitespaces(firstSpaces);
        
        List<Long> newNodes = new ArrayList<Long>();
        for (long node : nodes) {
            f.seek(node);
            int data = f.readInt();
            f.seek(node + 12);
            long left = f.readLong();
            long right = f.readLong();
            
            if (node != 0) {
                System.out.print(data);
                newNodes.add(left);
                newNodes.add(right);
            } else {
                newNodes.add((long) 0);
                newNodes.add((long) 0);
                System.out.print(" ");
            }
            
            int del = 0;
            if (Math.abs(data) > 0) 
                del = (int) Math.log10(Math.abs(data));
            if (data < 0) 
                del++;
            
            printWhitespaces(betweenSpaces - del);
            
            if (betweenSpaces - del <= 0) {
                System.out.print(":");
            }
        }
        System.out.println("");

        for (int i = 1; i <= endgeLines; i++) {
            for (int j = 0; j < nodes.size(); j++) {

                long node = nodes.get(j);
                f.seek(node + 12);
                long left = f.readLong();
                long right = f.readLong();
                
                printWhitespaces(firstSpaces - i);
                if (node == 0) {
                    printWhitespaces(endgeLines + endgeLines + i + 1);
                    continue;
                }
                
                if (left != 0)
                    System.out.print("/");
                else
                    printWhitespaces(1);
                
                printWhitespaces(i + i - 1);
                
                if (right != 0)
                    System.out.print("\\");
                else
                    printWhitespaces(1);
                
                printWhitespaces(endgeLines + endgeLines - i);
            }

            System.out.println("");
        }

        printNodeInternal(newNodes, level + 1, maxLevel);
    }
    
    /** Helper method for {@code printTree()} */
    private static void printWhitespaces(final int count) {
        for (int i = 0; i < count; i++)
            System.out.print(" ");
    }
    
    /** Helper method for {@code printTree()} */
    private static int maxLevel(final long node) throws IOException {
        if (node == 0)
            return 0;
        
        f.seek(node + 12);
        long left = f.readLong();
        long right = f.readLong();
        
        return Math.max(maxLevel(left), maxLevel(right)) + 1;
    }
    
    /** Helper method for {@code printTree()} */
    private static boolean isAllElementsNull(final List<Long> list) {
        for (Object object : list) {
            if (object != Long.valueOf(0))
                return false;
        }
        
        return true;
    }
}
