import java.io.File;
import java.util.LinkedList;
import java.util.Random;

import static org.junit.Assert.*;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.Test;

import org.junit.FixMethodOrder;
import org.junit.runners.MethodSorters;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

//Sorts by method name
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

/**
 * B+Tree tester.
 * @author Kong Jimmy Vang
 */
public class BTreeTesterJUnit {
    
    // The Max Order M to test for a particular B+Tree.
    private final int MIN_ORDER = 3;   // Smallest order M to test.
    private final int MAX_ORDER = 6;  // Largest order M to test.
    
    private final long TIMEOUT_CONS = 300000;  // Timeout for each single test. DEFAULT: 300 seconds or 5 minutes.
    
    @Test(timeout = TIMEOUT_CONS)
    public void constructorTests() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_BTree_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        BTree treeReused = null;
        boolean treeIsClosed = false;
        boolean reusedTreeIsClosed = false;
        
        int gOrder = MIN_ORDER;
        
        try {
            for (int order = MIN_ORDER; order <= MAX_ORDER; order++) {
                gOrder = order;
                
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: (Order " + order + ") The constructor "
                            + "\"BTree(String fileName, int bSize)\" did not produce a file...");
                
                tree.close();
                treeIsClosed = true;
                
                treeReused = new BTree(path.getCanonicalPath());
                reusedTreeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: (Order " + order + ") The constructor "
                            + "\"BTree(String fileName)\" should reuse the file, but it was not found...");
                
                treeReused.close();
                reusedTreeIsClosed = true;
            }
            
            path.delete();
            
        } catch (Exception e) {
            //e.printStackTrace();
            if (tree != null && !treeIsClosed) tree.close();
            if (treeReused != null && !reusedTreeIsClosed) treeReused.close();
            path.delete();
            fail("TEST FAILED: (Order " + gOrder + ") An exception has occured. ", e);
        }
        
        path.delete();
    }
    
    @Test(timeout = TIMEOUT_CONS)
    public void insert() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_BTree_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        //BTree treeReused = null;
        boolean treeIsClosed = false;
        //boolean reusedTreeIsClosed = false;
        
        int gOrder = MIN_ORDER;
        
        try {
            
            // Test B+Trees of order M starting from MIN_ORDER to MAX_ORDER.
            for (int order = MIN_ORDER; order <= MAX_ORDER; order++) {
                gOrder = order;
                
                //System.out.println("Testing Order " + order + ".");
                //** B+TREE **
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: The constructor \"BTree(String fileName, int bSize)\" did not produce a file...");
                
                // Insert 101 key in ascending order.
                for (int key = -50; key <= 50; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                            tree.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false. Key was already inserted.", 
                            tree.insert(key, addr));
                }
                tree.close();
                treeIsClosed = true;
                
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: The constructor \"BTree(String fileName, int bSize)\" did not produce a file...");
                
                // Insert 101 key in descending order.
                for (int key = 50; key >= -50; key--) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                            tree.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false. Key was already inserted.", 
                            tree.insert(key, addr));
                }
                
                tree.close();
                treeIsClosed = true;
            }
            path.delete();
            
        } catch (Exception e) {
            //e.printStackTrace();
            if (tree != null && !treeIsClosed) tree.close();
            //if (treeReused != null && !reusedTreeIsClosed) treeReused.close();
            path.delete();
            fail("TEST FAILED: (Order " + gOrder + ") An exception has occured. ", e);
        }
        
        path.delete();
    }

    @Test(timeout = TIMEOUT_CONS)
    public void insertOneKey() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_BTree_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        //BTree treeReused = null;
        boolean treeIsClosed = false;
        //boolean reusedTreeIsClosed = false;
        
        int gOrder = MIN_ORDER;
        
        try {
            
            // Test B+Trees of order M starting from MIN_ORDER to MAX_ORDER.
            for (int order = MIN_ORDER; order <= MAX_ORDER; order++) {
                gOrder = order;
                
                //System.out.println("Testing Order " + order + ".");
                //** B+TREE **
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: The constructor \"BTree(String fileName, int bSize)\" did not produce a file...");
                
                // Insert 1 value twice. Return true once and return false after another insert.
                int key = 15;
                long addr = key + 1000;
                assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                        tree.insert(key, addr));
                assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false. Key was already inserted.", 
                        tree.insert(key, addr));
                    
                tree.close();
                treeIsClosed = true;
                
            }
            path.delete();
            
        } catch (Exception e) {
            //e.printStackTrace();
            if (tree != null && !treeIsClosed) tree.close();
            //if (treeReused != null && !reusedTreeIsClosed) treeReused.close();
            path.delete();
            fail("TEST FAILED: (Order " + gOrder + ") An exception has occured. ", e);
        }
        
        path.delete();
    }
    
    @Test(timeout = TIMEOUT_CONS)
    public void search() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_BTree_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        //BTree treeReused = null;
        boolean treeIsClosed = false;
        //boolean reusedTreeIsClosed = false;
        
        int gOrder = MIN_ORDER;
        
        try {
            
            // Test B+Trees of order M starting from MIN_ORDER to MAX_ORDER.
            for (int order = MIN_ORDER; order <= MAX_ORDER; order++) {
                gOrder = order;
                
                //System.out.println("Testing Order " + order + ".");
                //** B+TREE **
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: The constructor \"BTree(String fileName, int bSize)\" did not produce a file...");
                
                // Search 101 keys (all should return 0 as there are no keys in the B+Tree).
                for (int key = -50; key <= 50; key++) {
                    //long addr = key + 1000;
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + 0 + ".", 
                            0, tree.search(key));
                }
                
                // Search 101 more keys (all should return 0 as there are no keys in the B+Tree).
                for (int key = 50; key >= -50; key--) {
                    //long addr = key + 1000;
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + 0 + ".", 
                            0, tree.search(key));
                }
                
                tree.close();
                treeIsClosed = true;
            }
            path.delete();
            
        } catch (Exception e) {
            //e.printStackTrace();
            if (tree != null && !treeIsClosed) tree.close();
            //if (treeReused != null && !reusedTreeIsClosed) treeReused.close();
            path.delete();
            fail("TEST FAILED: (Order " + gOrder + ") An exception has occured. ", e);
        }
        
        path.delete();
    }
    
    @Test(timeout = TIMEOUT_CONS)
    public void insertAndSearch() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_BTree_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        //BTree treeReused = null;
        boolean treeIsClosed = false;
        //boolean reusedTreeIsClosed = false;
        
        int gOrder = MIN_ORDER;
        
        try {
            
            // Test B+Trees of order M starting from MIN_ORDER to MAX_ORDER.
            for (int order = MIN_ORDER; order <= MAX_ORDER; order++) {
                gOrder = order;
                
                //System.out.println("Testing Order " + order + ".");
                //** B+TREE **
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: The constructor \"BTree(String fileName, int bSize)\" did not produce a file...");
                
                // Insert 101 key in ascending order and search for them.
                for (int key = -50; key <= 50; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                            tree.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false. Key was already inserted.", 
                            tree.insert(key, addr));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + addr + ".", 
                            addr, tree.search(key));
                }
                tree.close();
                treeIsClosed = true;
                
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: The constructor \"BTree(String fileName, int bSize)\" did not produce a file...");
                
                // Insert 101 key in descending order and search for them.
                for (int key = 50; key >= -50; key--) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                            tree.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false. Key was already inserted.", 
                            tree.insert(key, addr));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + addr + ".", 
                            addr, tree.search(key));
                }
                
                tree.close();
                treeIsClosed = true;
            }
            path.delete();
            
        } catch (Exception e) {
            //e.printStackTrace();
            if (tree != null && !treeIsClosed) tree.close();
            //if (treeReused != null && !reusedTreeIsClosed) treeReused.close();
            path.delete();
            fail("TEST FAILED: (Order " + gOrder + ") An exception has occured. ", e);
        }
        
        path.delete();
    }
    
    @Test(timeout = TIMEOUT_CONS)
    public void insertAndRemove() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_BTree_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        //BTree treeReused = null;
        boolean treeIsClosed = false;
        //boolean reusedTreeIsClosed = false;
        
        int gOrder = MIN_ORDER;
        
        try {
            
            // Test B+Trees of order M starting from MIN_ORDER to MAX_ORDER.
            for (int order = MIN_ORDER; order <= MAX_ORDER; order++) {
                gOrder = order;
                
                //System.out.println("Testing Order " + order + ".");
                //** B+TREE **
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: The constructor \"BTree(String fileName, int bSize)\" did not produce a file...");
                
                // Insert 101 key in ascending order and search for them.
                for (int key = -50; key <= 50; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                            tree.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false. Key was already inserted.", 
                            tree.insert(key, addr));
                }
                
                // Remove all 101 key in ascending order.
                for (int key = -50; key <= 50; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertEquals("TEST FAILED: (Order " + order + ") tree.remove(" + key + ") did not return " + addr + ".", 
                            addr, tree.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.remove(" + key + ") did not return 0. Key was already removed.", 
                            0, tree.remove(key));
                }
                
                // Insert 101 key in descending order and search for them.
                for (int key = 50; key >= -50; key--) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                            tree.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false. Key was already inserted.", 
                            tree.insert(key, addr));
                }
                
                // Remove all 101 key in descending order.
                for (int key = 50; key >= -50; key--) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertEquals("TEST FAILED: (Order " + order + ") tree.remove(" + key + ") did not return " + addr + ".", 
                            addr, tree.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.remove(" + key + ") did not return 0. Key was already removed.", 
                            0, tree.remove(key));
                }
                
                tree.close();
                treeIsClosed = true;
            }
            path.delete();
            
        } catch (Exception e) {
            //e.printStackTrace();
            if (tree != null && !treeIsClosed) tree.close();
            //if (treeReused != null && !reusedTreeIsClosed) treeReused.close();
            path.delete();
            fail("TEST FAILED: (Order " + gOrder + ") An exception has occured. ", e);
        }
        
        path.delete();
    }

    @Test(timeout = TIMEOUT_CONS)
    public void insertAndRangeSearch() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_BTree_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        //BTree treeReused = null;
        boolean treeIsClosed = false;
        //boolean reusedTreeIsClosed = false;
        
        int gOrder = MIN_ORDER;
        
        try {
            
            // Test B+Trees of order M starting from MIN_ORDER to MAX_ORDER.
            for (int order = MIN_ORDER; order <= MAX_ORDER; order++) {
                gOrder = order;
                
                //System.out.println("Testing Order " + order + ".");
                //** B+TREE **
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: The constructor \"BTree(String fileName, int bSize)\" did not produce a file...");
                
                // Insert 26 key in ascending order from -10 to 15.
                for (int key = -10; key <= 15; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                            tree.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false. Key was already inserted.", 
                            tree.insert(key, addr));
                }
                
                // Range Search on the keys
                LinkedList<Long> list = tree.rangeSearch(-10, 15);
                LinkedList<Long> list2 = tree.rangeSearch(-20, 35);
                LinkedList<Long> list3 = tree.rangeSearch(-100, -21);
                LinkedList<Long> list4 = tree.rangeSearch(16, 100);
                
                assertFalse("TEST FAILED: (Order " + order + ") list must NOT be empty.", list.isEmpty());
                assertFalse("TEST FAILED: (Order " + order + ") list2 must NOT be empty.", list2.isEmpty());
                assertTrue("TEST FAILED: (Order " + order + ") list3 must be empty.", list3.isEmpty());
                assertTrue("TEST FAILED: (Order " + order + ") list4 must be empty.", list4.isEmpty());
                
                for (int i = 0; i <= 25; i++) {
                    int key = i - 10;
                    long addr = key + 1000;
                    assertEquals("TEST FAILED: (Order " + order + ") "
                            + "tree.rangeSearch(-10, 15)'s list.get(" + i +  "), did not return the correct address:" + addr + ", for key: " + key + ".", 
                            addr, list.get(i).longValue());
                }
                for (int i = 0; i <= 25; i++) {
                    int key = i - 10;
                    long addr = key + 1000;
                    assertEquals("TEST FAILED: (Order " + order + ") "
                            + "tree.rangeSearch(-20, 35)'s list.get(" + i +  "), did not return the correct address: " + addr + ", for key: " + key + ".", 
                            addr, list2.get(i).longValue());
                }
                
                tree.close();
                treeIsClosed = true;
            }
            path.delete();
            
        } catch (Exception e) {
            //e.printStackTrace();
            if (tree != null && !treeIsClosed) tree.close();
            //if (treeReused != null && !reusedTreeIsClosed) treeReused.close();
            path.delete();
            fail("TEST FAILED: (Order " + gOrder + ") An exception has occured. ", e);
        }
        
        path.delete();
    }
    
    @Test(timeout = TIMEOUT_CONS)
    public void insertSearchAndRemove() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_BTree_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        //BTree treeReused = null;
        boolean treeIsClosed = false;
        //boolean reusedTreeIsClosed = false;
        
        int gOrder = MIN_ORDER;
        
        try {
            
            // Test B+Trees of order M starting from MIN_ORDER to MAX_ORDER.
            for (int order = MIN_ORDER; order <= MAX_ORDER; order++) {
                gOrder = order;
                
                //System.out.println("Testing Order " + order + ".");
                //** B+TREE **
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: The constructor \"BTree(String fileName, int bSize)\" did not produce a file...");
                
                // Insert 51 key in ascending order and search for them.
                for (int key = -25; key <= 25; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                            tree.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false. Key was already inserted.", 
                            tree.insert(key, addr));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + addr + ".", 
                            addr, tree.search(key));
                }
                
                // Remove all 51 key in ascending order.
                for (int key = -25; key <= 25; key++) {
                    //System.out.println(key);
                    long addr = key + 1000;
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + addr + ".", 
                            addr, tree.search(key));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.remove(" + key + ") did not return " + addr + ".", 
                            addr, tree.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.remove(" + key + ") did not return 0. Key was already removed.", 
                            0, tree.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + 0 + ". Key should not exist affter removing.", 
                            0, tree.search(key));
                }
                
                // Insert 51 key in descending order and search for them.
                for (int key = 25; key >= -25; key--) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                            tree.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false. Key was already inserted.", 
                            tree.insert(key, addr));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + addr + ".", 
                            addr, tree.search(key));
                }
                
                // Remove all 51 key in descending order.
                for (int key = 25; key >= -25; key--) {
                    //System.out.println(key);
                    //System.out.println(tree.getList());
                    long addr = key + 1000;
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + addr + ".", 
                            addr, tree.search(key));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.remove(" + key + ") did not return " + addr + ".", 
                            addr, tree.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.remove(" + key + ") did not return 0. Key was already removed.", 
                            0, tree.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + 0 + ". Key should not exist affter removing.", 
                            0, tree.search(key));
                }
                tree.close();
                treeIsClosed = true;
            }
            path.delete();
            
        } catch (Exception e) {
            //e.printStackTrace();
            if (tree != null && !treeIsClosed) tree.close();
            //if (treeReused != null && !reusedTreeIsClosed) treeReused.close();
            path.delete();
            fail("TEST FAILED: (Order " + gOrder + ") An exception has occured. ", e);
        }
        
        path.delete();
    }
    
    @Test(timeout = TIMEOUT_CONS)
    public void reusedTreeWithInsert() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_BTree_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        BTree treeReused = null;
        boolean treeIsClosed = false;
        boolean reusedTreeIsClosed = false;
        
        int gOrder = MIN_ORDER;
        
        try {
            
            // Test B+Trees of order M starting from MIN_ORDER to MAX_ORDER.
            for (int order = MIN_ORDER; order <= MAX_ORDER; order++) {
                gOrder = order;
                
                //System.out.println("Testing Order " + order + ".");
                //** B+TREE **
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: The constructor \"BTree(String fileName, int bSize)\" did not produce a file...");
                
                // Insert 26 key in ascending order from -10 to 15 and search for them.
                for (int key = -10; key <= 15; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                            tree.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false. Key was already inserted.", 
                            tree.insert(key, addr));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + addr + ".", 
                            addr, tree.search(key));
                }
                tree.close();
                treeIsClosed = true;
                
                treeReused = new BTree(path.getCanonicalPath());
                reusedTreeIsClosed = false;
                
                // Insertion Checking.
                for (int key = -10; key <= 15; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertFalse("TEST FAILED: (Order " + order + ") reusedTree.insert(" + key + ", " + addr + ") did not return false. "
                            + "The reused tree should contain these keys and addresses from the old tree.", 
                            treeReused.insert(key, addr));
                }
                treeReused.close();
                reusedTreeIsClosed = true;
            }
            path.delete();
            
        } catch (Exception e) {
            //e.printStackTrace();
            if (tree != null && !treeIsClosed) tree.close();
            if (treeReused != null && !reusedTreeIsClosed) treeReused.close();
            path.delete();
            fail("TEST FAILED: (Order " + gOrder + ") An exception has occured. ", e);
        }
        
        path.delete();
    }
    
    @Test(timeout = TIMEOUT_CONS)
    public void reusedTreeWithInsertAndSearch() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_BTree_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        BTree treeReused = null;
        boolean treeIsClosed = false;
        boolean reusedTreeIsClosed = false;
        
        int gOrder = MIN_ORDER;
        
        try {
            
            // Test B+Trees of order M starting from MIN_ORDER to MAX_ORDER.
            for (int order = MIN_ORDER; order <= MAX_ORDER; order++) {
                gOrder = order;
                
                //System.out.println("Testing Order " + order + ".");
                //** B+TREE **
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: The constructor \"BTree(String fileName, int bSize)\" did not produce a file...");
                
                // Insert 26 key in ascending order from -10 to 15 and search for them.
                for (int key = -10; key <= 15; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                            tree.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false. Key was already inserted.", 
                            tree.insert(key, addr));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + addr + ".", 
                            addr, tree.search(key));
                }
                tree.close();
                treeIsClosed = true;
                
                treeReused = new BTree(path.getCanonicalPath());
                reusedTreeIsClosed = false;
                
                // Search if the keys are still there.
                for (int key = -10; key <= 15; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + addr + ". "
                            + "The reused tree should contain these keys and addresses from the old tree.", 
                            addr, treeReused.search(key));
                }
                
                // Insertion Checking.
                for (int key = -10; key <= 15; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertFalse("TEST FAILED: (Order " + order + ") reusedTree.insert(" + key + ", " + addr + ") did not return false. "
                            + "The reused tree should contain these keys and addresses from the old tree.", 
                            treeReused.insert(key, addr));
                }
                
                treeReused.close();
                reusedTreeIsClosed = true;
                
            }
            path.delete();
            
        } catch (Exception e) {
            //e.printStackTrace();
            if (tree != null && !treeIsClosed) tree.close();
            if (treeReused != null && !reusedTreeIsClosed) treeReused.close();
            path.delete();
            fail("TEST FAILED: (Order " + gOrder + ") An exception has occured. ", e);
        }
        
        path.delete();
    }
    
    @Test(timeout = TIMEOUT_CONS)
    public void reusedTreeWithInsertSearchAndRemove() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_BTree_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        BTree treeReused = null;
        boolean treeIsClosed = false;
        boolean reusedTreeIsClosed = false;
        
        int gOrder = MIN_ORDER;
        
        try {
            
            // Test B+Trees of order M starting from MIN_ORDER to MAX_ORDER.
            for (int order = MIN_ORDER; order <= MAX_ORDER; order++) {
                gOrder = order;
                
                //System.out.println("Testing Order " + order + ".");
                //** B+TREE **
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: The constructor \"BTree(String fileName, int bSize)\" did not produce a file...");
                
                // Insert 26 key in ascending order from -10 to 15 and search for them.
                for (int key = -10; key <= 15; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                            tree.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false. Key was already inserted.", 
                            tree.insert(key, addr));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + addr + ".", 
                            addr, tree.search(key));
                }
                tree.close();
                treeIsClosed = true;
                
                treeReused = new BTree(path.getCanonicalPath());
                reusedTreeIsClosed = false;
                
                // Search if the keys are still there.
                for (int key = -10; key <= 15; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return address: " + addr + ". "
                            + "The reused tree should contain these keys and addresses from the old tree.", 
                            addr, treeReused.search(key));
                }
                
                // Insertion Checking.
                for (int key = -10; key <= 15; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertFalse("TEST FAILED: (Order " + order + ") reusedTree.insert(" + key + ", " + addr + ") did not return false. "
                            + "The reused tree should contain these keys and addresses from the old tree.", 
                            treeReused.insert(key, addr));
                }
                
                // Remove all 26 key in ascending order from -10 to 15.
                for (int key = -10; key <= 15; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return 0. Key was already removed.", 
                            0, treeReused.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") reusedTree.search(" + key + ") did not return address: " + 0 + ". Key should not exist affter removing.", 
                            0, treeReused.search(key));
                }
                
                treeReused.close();
                reusedTreeIsClosed = true;
            }
            path.delete();
            
        } catch (Exception e) {
            //e.printStackTrace();
            if (tree != null && !treeIsClosed) tree.close();
            if (treeReused != null && !reusedTreeIsClosed) treeReused.close();
            path.delete();
            fail("TEST FAILED: (Order " + gOrder + ") An exception has occured. ", e);
        }
        
        path.delete();
    }
    
    @Test(timeout = TIMEOUT_CONS)
    public void stressTest() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_BTree_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        BTree treeReused = null;
        boolean treeIsClosed = false;
        boolean reusedTreeIsClosed = false;
        
        int gOrder = MIN_ORDER;
        
        try {
            
            // Test B+Trees of order M starting from MIN_ORDER to MAX_ORDER.
            for (int order = MIN_ORDER; order <= MAX_ORDER; order++) {
                gOrder = order;
                
                //System.out.println("*** STRESS TEST OUTPUT ***");
                //System.out.println("Testing Order " + order + ".");
                //--- 1. Test Insert and Search. ---
                //** B+TREE **
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                
                if (!path.exists())
                    fail("TEST FAILED: (Order " + order + ") The constructor \"BTree(String fileName, int bSize)\" did not produce a file...");
                
                //System.out.println("\tTesting Insert and Search...");
                // Insert 26 key in ascending order from -10 to 15 and search for them.
                for (int key = -10; key <= 15; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                            tree.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false.", 
                            tree.insert(key, addr));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return " + addr + ".", 
                            addr, tree.search(key));
                }
                // Insert 26 keys in descending order from -11 to -36 and search for them.
                for (int key = -11; key >= -36; key--) {
                    long addr = key + 5000;
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return true.", 
                            tree.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + key + ", " + addr + ") did not return false.", 
                            tree.insert(key, addr));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + key + ") did not return " + addr + ".", 
                            addr, tree.search(key));
                }
                tree.close();
                treeIsClosed = true;
                
                //** REUSED B+TREE **
                //System.out.println("\t\tTesting Reused Tree...");
                treeReused = new BTree(path.getCanonicalPath());
                reusedTreeIsClosed = false;
                
                //System.out.println("\t\tSearching Reused Tree and check if it still has the keys/nodes.");
                // Search the reused tree.
                for (int key = -10; key <= 15; key++) {
                    long addr = key + 1000;
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.search(key));
                }
                for (int key = -11; key >= -36; key--) {
                    long addr = key + 5000;
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.search(key));
                }
                
                // Search Returns 0 Test.
                for (int key = 26; key >= 101; key++) {
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return 0.", 
                            0, treeReused.search(key));
                }
                
                //System.out.println("\t\tInsert and Search more values");
                // Insert and search.
                for (int key = 300; key >= 275 ; key--) {
                    long addr = key + 2000;
                    assertTrue("TEST FAILED: (Order " + order + ") treeReused.insert(" + key + ", addr) did not return true.", 
                            treeReused.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") treeReused.insert(" + key + ", addr) did not return false.", 
                            treeReused.insert(key, addr));
                    //treeReused.print();
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.search(key));
                }
                
                // Randomly Insert 101 values and search for them.
                Random r = new Random();
                for (int i = 0; i <= 100; i++) {
                    int key = 100000;
                    long addr = r.nextLong();
                    
                    boolean isKeyNotDuplicated = false;
                    while (!isKeyNotDuplicated) {
                        key = r.nextInt(100000) + 100000;
                        isKeyNotDuplicated = treeReused.insert(key, addr);
                    }
                    
                    assertTrue("TEST FAILED: (Order " + order + ") treeReused.insert(" + key + ", addr) did not return true.", 
                            isKeyNotDuplicated);
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.search(key));
                }
                
                // Randomly Insert 101 values and search for them.
                r = new Random();
                for (int i = 0; i <= 100; i++) {
                    int key = -100000;
                    long addr = r.nextLong();
                    
                    boolean isKeyNotDuplicated = false;
                    while (!isKeyNotDuplicated) {
                        key = -(r.nextInt(100000)) - 100000;
                        isKeyNotDuplicated = treeReused.insert(key, addr);
                    }
                    
                    assertTrue("TEST FAILED: (Order " + order + ") treeReused.insert(" + key + ", addr) did not return true.", 
                            isKeyNotDuplicated);
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.search(key));
                    
                }
                
                Random rT = new Random();
                int keyT = 1000000;
                long addrT = rT.nextLong();
                
                treeReused.insert(keyT, addrT);
                assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + keyT + ") did not return " + addrT + ".", 
                        addrT, treeReused.search(keyT));
                
                for (int i = 0; i <= 10 ; i++) {
                    assertFalse("TEST FAILED: (Order " + order + ") treeReused.insert(" + keyT + ", addr) did not return false.", 
                            treeReused.insert(keyT, addrT));
                }
                
                //System.out.println("\tTesting Range Search");
                // 2. Range Search Test.
                LinkedList<Long> list = treeReused.rangeSearch(-10, 15);
                LinkedList<Long> list2 = treeReused.rangeSearch(-36, -11);
                LinkedList<Long> list3 = treeReused.rangeSearch(26, 101);
                LinkedList<Long> list4 = treeReused.rangeSearch(275, 300);
    
                assertFalse("TEST FAILED: (Order " + order + ") list must NOT be empty.", list.isEmpty());
                assertFalse("TEST FAILED: (Order " + order + ") list2 must NOT be empty.", list2.isEmpty());
                assertTrue("TEST FAILED: (Order " + order + ") list3 must be empty.", list3.isEmpty());
                assertFalse("TEST FAILED: (Order " + order + ") list4 must NOT be empty.", list4.isEmpty());
                
                for (int i = 0; i <= 25; i++) {
                    int key = i - 10;
                    long addr = key + 1000;
                    assertEquals("TEST FAILED: (Order " + order + ") "
                            + "treeReused.rangeSearch(-10, 15)'s list.get(" + i +  "), did not return the correct address: " + addr + ", for key: " + key + ".", 
                            addr, list.get(i).longValue());
                }
                for (int i = 0; i >= 25; i++) {
                    int key = i - 36;
                    long addr = key + 5000;
                    assertEquals("TEST FAILED: (Order " + order + ") "
                            + "treeReused.rangeSearch(-36, -11)'s list.get(" + i +  "),  did not return the correct address: " + addr + ", for key: " + key + ".", 
                            addr, list2.get(i).longValue());
                }
                for (int i = 0; i >= 25 ; i++) {
                    int key = i + 275;
                    long addr = key + 2000;
                    assertEquals("TEST FAILED: (Order " + order + ") "
                            + "treeReused.rangeSearch(275, 300)'s list.get(" + i +  "),  did not return the correct address: " + addr + ", for key: " + key + ".", 
                            addr, list4.get(i).longValue());
                }
                
                // 3. Remove Test.
                //System.out.println("\tTesting Remove");
                for (int key = -10; key <= 15; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return 0. Key was already removed.", 
                            0, treeReused.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return " + 0 + ".", 
                            0, treeReused.search(key));
                }
                for (int key = -11; key >= -36; key--) {
                    long addr = key + 5000;
                    //System.out.println(key);
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return 0. Key was already removed.", 
                            0, treeReused.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return " + 0 + ".", 
                            0, treeReused.search(key));
                }
                for (int key = 300; key >= 275 ; key--) {
                    long addr = key + 2000;
                    //System.out.println(key);
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return 0. Key was already removed.", 
                            0, treeReused.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return " + 0 + ".", 
                            0, treeReused.search(key));
                }
                for (int key = -10; key <= 15; key++) {
                    //long addr = key + 1000;
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return 0. Key was already removed.", 
                            0, treeReused.remove(key));
                }
                for (int key = -11; key >= -36; key--) {
                    //long addr = key + 5000;
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return 0. Key was already removed.", 
                            0, treeReused.remove(key));
                }
                for (int key = 300; key >= 275 ; key--) {
                    //long addr = key + 2000;
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return 0. Key was already removed.", 
                            0, treeReused.remove(key));
                }
                
                // Insert 200 key in ascending order and search for them.
                for (int key = -100; key <= 100; key++) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") treeReused.insert(" + key + ", addr) did not return true.", 
                            treeReused.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") treeReused.insert(" + key + ", addr) did not return false.", 
                            treeReused.insert(key, addr));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.search(key));
                }
                // Remove them all.
                for (int key = -100; key <= 100; key++) {
                    long addr = key + 1000;
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.search(key));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return 0. Key was already removed.", 
                            0, treeReused.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return " + 0 + ".", 
                            0, treeReused.search(key));
                }
                // Insert 200 key in descending order and search for them.
                for (int key = 100; key >= -100; key--) {
                    long addr = key + 1000;
                    //System.out.println(key);
                    assertTrue("TEST FAILED: (Order " + order + ") treeReusedReused.insert(" + key + ", addr) did not return true.", 
                            treeReused.insert(key, addr));
                    assertFalse("TEST FAILED: (Order " + order + ") treeReused.insert(" + key + ", addr) did not return false.", 
                            treeReused.insert(key, addr));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.search(key));
                }
                // Remove them all.
                for (int key = 100; key >= -100; key--) {
                    long addr = key + 1000;
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.search(key));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return " + addr + ".", 
                            addr, treeReused.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + key + ") did not return 0. Key was already removed.", 
                            0, treeReused.remove(key));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + key + ") did not return " + 0 + ".", 
                            0, treeReused.search(key));
                }
                
                treeReused.close();
                reusedTreeIsClosed = true;
            }
            
            path.delete();
            
        } catch (Exception e) {
            //System.out.println("(Order " + gOrder + ") ****** AN EXCEPTION OCCURED during the stress test. Check the JUnit Tab for the exception. ******");
            if (tree != null && !treeIsClosed) tree.close();
            if (treeReused != null && !reusedTreeIsClosed) treeReused.close();
            path.delete();
            fail("TEST FAILED: (Order " + gOrder + ") An exception has occured. ", e);
        }
        
        path.delete();
    }
    
    @Test(timeout = TIMEOUT_CONS)
    public void stressTestWithSets() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_BTree_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        BTree treeReused = null;
        boolean treeIsClosed = false;
        boolean reusedTreeIsClosed = false;
        
        int gOrder = MIN_ORDER;
        
        try {
            
            // Test B+Trees of order M starting from MIN_ORDER to MAX_ORDER.
            for (int order = MIN_ORDER; order <= MAX_ORDER; order++) {
                gOrder = order;
                
                System.out.println("*** STRESS TEST OUTPUT ***");
                System.out.println("Testing Order " + order + ".");
                //--- 1. Test Insert and Search. ---
                //** B+TREE **
                tree = new BTree(path.getCanonicalPath(), order * 12);
                treeIsClosed = false;
                if (!path.exists())
                    fail("TEST FAILED: (Order " + order + ") The constructor \"BTree(String fileName, int bSize)\" did not produce a file...");

                int[] keySet1 = { -138, 478, -291, 252, -468, -426, 189, 73, -433, 191, -196, 40, -195, -181, -131,
                        -106, -135, 203, 217, -463, 43, 392, 16, -317, 316, -198, 233, 52, 172, 91, -240, -245, 279, 75,
                        -494, -252, -398, -418, -471, -417, 429, 422, 466, 63, -37, -322, -128, -161, 74, -449, 13,
                        -256, -420, -111, 327, -270, 115, -263, -68, 34, 163, 258, -350, -492, -190, 449, -194, -476,
                        -371, 278, -176, -485, 198, -63, -451, -95, -400, -408, -293, 205, 247, -378, -390, -329, 70,
                        232, 1, 221, 295, 284, -278, -153, 500, -206, -204, -444, -96, 224, -342, -139, -74, 199, 324,
                        -428, 125, 305, 234, 401, 342, -157, 64, -287, 60, 454, -455, 341, -227, -460, 292, -355, 417,
                        424, 18, -52, 146, -474, 463, 71, 384, -403, -136, -210, 97, -125, -75, -97, 82, -479, -267,
                        269, 68, 475, -154, 251, -365, 368, -257, 159, -124, -373, -219, 340, -385, -459, -199, -289,
                        141, -107, 193, 387, 225, 484, -78, 300, 62, 95, 285, -132, 181, 17, -215, -343, -173, 157,
                        -336, 190, -409, -491, 482, 311, -8, 119, 337, 195, 103, 459, -231, -473, 42, -358, -438, 436,
                        -229, -202, 323, -209, -500, 185, -423, 329, -54, -376, -217, 89, 58, 274, 244, -205, 462, -402,
                        14, -30, 136, -21, -405, -489, -356, -144, 405, -239, 398, -320, -299, 318, 447, 80, 414, -482,
                        -431, -152, 170, -469, -114, 100, -158, -134, 455, 486, -280, 19, -89, 286, 143, 272, -339, 264,
                        -248, -183, -234, -304 };
                
                int[] keySet2 = { -411, 327, -440, -27, -243, 20, 234, -475, 155, -191, -377, 308, -195, 211, -357, 288,
                        -247, 334, -201, 12, 266, -208, -499, -185, -459, -62, -267, 444, -354, 150, 175, -240, 159,
                        314, -133, -388, -90, 71, 289, 260, 225, 468, 257, 494, 470, -384, 323, 135, 426, 442, -361,
                        325, 318, -494, 207, 57, -190, -102, -11, 287, -474, 425, -315, 393, -325, -175, 240, -443, 51,
                        437, 131, 123, -303, 459, -142, 54, -31, -113, 200, -259, 416, 399, -431, 145, -429, -244, 45,
                        -322, -452, -355, -427, 173, -367, -83, 350, -436, 14, -351, -334, -428, 388, 101, 17, 346, 340,
                        60, -41, 132, 352, 490, 373, 301, 256, 16, -341, 348, -264, -183, -7, 367, 322, -366, -349,
                        -327, -453, 447, 97, -212, -406, 205, -333, 385, 152, -316, 382, 177, -37, 423, 278, -28, 164,
                        72, 170, -380, -25, 495, 66, 166, -368, 106, -307, -77, -320, -312, -88, 171, -229, -59, 116,
                        319, 381, -344, 238, -468, -287, 457, 472, -145, 409, 305, 103, 228, 248, 194, -284, 56, 351,
                        -338, 331, 233, -206, -140, -12, -314, -280, -223, -8, -46, -483, -94, 464, 390, 500, -87, -117,
                        299, 196, 187, -171, 0, 481, 213, 268, -447, 161, -219, 285, -363, -323, -434, -78, -433, -112,
                        -268, 38, -234, -414, -228, 424, 253, 438, -125, -165, -381, -397, 277, -478, 379, 276, -291,
                        174, -500, 102, 371, 156, 396, 39, 89, 105, -262, 275, -410, 441, 296, -488, -460, -446, -82,
                        -470, 84 };

                long[] addressSet1 = { 351, 430, -394, 75, 215, 83, -83, 468, 46, -318, 453, 57, -16, 295, 71, -421,
                        333, -473, -11, 268, 435, -116, -103, -276, -375, -74, -353, -374, 273, -134, -118, -217, 340,
                        355, 238, 199, -460, -238, 221, 85, -167, -73, -368, 38, -299, 162, 361, 237, 153, 300, -340,
                        325, 470, -267, 58, 37, 23, 378, -199, -255, 216, -196, 448, 424, -193, 386, 177, 247, 293, 410,
                        294, 66, 307, 94, -127, -70, -211, -427, 460, -489, 195, -344, 412, -300, -429, -408, -498,
                        -310, -425, 308, 330, 443, 360, -201, 314, -248, 269, 288, 166, -281, 31, 86, -97, 41, 381,
                        -495, 14, -242, -12, -474, 265, 107, 69, 82, -378, 481, 493, 411, -81, 112, -298, 28, -150,
                        -426, 312, 419, 245, -436, -285, 264, 374, 413, 111, -356, -496, -487, -179, 34, -54, -39, 161,
                        198, -345, -278, -250, 477, 60, -395, 337, -151, 87, -432, 285, 171, 373, -497, 438, -386, 21,
                        -186, -114, -273, -23, -468, -198, -53, -315, 27, 210, -431, 254, 134, 149, 427, 148, -351,
                        -461, 451, -388, -138, -439, -405, 106, -214, 76, -328, -212, 352, -79, 145, 121, 44, 336, -213,
                        -43, 180, -49, -220, -110, 227, 127, -398, -123, -316, 32, -286, -172, -231, -145, -175, 163,
                        -165, -137, -51, 130, 61, -259, 6, -61, 258, 204, 93, -274, -177, 174, 482, -403, 206, -55,
                        -412, -226, 408, -358, -18, 22, 91, -469, 190, -385, -444, -396, 132, 457, -4, 33, -28, 128,
                        399, -178, -292 };

                long[] addressSet2 = { 104, -158, -121, 78, 116, -357, 38, -22, 295, -452, 434, -455, -148, 189, -17,
                        -481, 244, -237, 356, 294, -432, 259, -168, 457, -484, 150, -284, 66, -115, 224, -431, -440,
                        139, 195, 397, -499, 15, -128, 247, -250, 361, -35, 29, 251, -449, 223, -365, 40, -474, -25,
                        489, 219, -367, 132, -33, 207, -269, 246, 187, -417, 450, 430, 98, -29, -147, 56, -361, -340,
                        -293, 429, -102, 304, 123, 474, 129, 467, 351, 4, 330, -203, 72, -335, 256, -84, 214, -272,
                        -246, -135, 99, 141, 33, -62, 5, 308, 490, 350, -264, -180, -47, 180, 137, -310, -258, 341, 496,
                        -428, 118, 237, 382, -132, -14, 153, -303, -253, 69, 0, -153, 146, 24, 321, -322, 483, -186,
                        459, -485, 404, -100, 87, 316, -59, -86, -497, -423, -184, 423, -45, 342, -304, 264, -49, -285,
                        318, 476, -206, 472, -119, -98, -404, 127, 225, -350, 217, 292, -146, -154, -313, -456, 338,
                        485, 85, 80, -275, -41, 27, 84, -80, -471, -252, -239, 386, 220, -163, 475, -77, -265, 289, 375,
                        7, -439, -257, -348, 349, -326, -179, 55, -374, 499, 267, -191, 211, 65, -136, -245, 249, 240,
                        -477, -450, 71, 444, 334, -195, 258, -457, -162, 46, -419, -127, -290, -72, 166, 51, -391, -486,
                        192, -282, 173, -382, 471, 184, -46, 57, -321, -377, -337, 263, 353, 273, -39, -214, -349, 272,
                        -280, 171, -173, -416, 50, -358, -458, -279, 458, -278, 284, 369, -255, 239, 74, 340, 424, -372,
                        281 };

                // Add 250 keys from keySet1 and search for the keys.
                for (int i = 0; i < keySet1.length; i++) {
                        assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + keySet1[i] + ", " + addressSet1[i] + ") did not return true.", 
                                tree.insert(keySet1[i], addressSet1[i]));
                        assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + keySet1[i] + ", " + addressSet1[i] + ") did not return false.", 
                                tree.insert(keySet1[i], addressSet1[i]));
                        assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + keySet1[i] + ") did not return " + addressSet1[i] + ".", 
                                addressSet1[i], tree.search(keySet1[i]));
                }
                
                // Remove all 250 keys from keySet1.
                for (int i = 0; i < keySet1.length; i++) {
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + keySet1[i] + ") did not return " + addressSet1[i] + ".", 
                            addressSet1[i], tree.search(keySet1[i]));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.remove(" + keySet1[i] + ") did not return " + addressSet1[i] + ".", 
                            addressSet1[i], tree.remove(keySet1[i]));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.remove(" + keySet1[i] + ") did not return 0. Key was already removed.", 
                            0, tree.remove(keySet1[i]));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + keySet1[i] + ") did not return " + 0 + ".", 
                            0, tree.search(keySet1[i]));
                }
                
                // Add 250 keys from keySet2 and search for the keys.
                for (int i = 0; i < keySet2.length; i++) {
                    assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + keySet2[i] + ", " + addressSet2[i] + ") did not return true.", 
                            tree.insert(keySet2[i], addressSet2[i]));
                    assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + keySet2[i] + ", " + addressSet2[i] + ") did not return false.", 
                            tree.insert(keySet2[i], addressSet2[i]));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + keySet2[i] + ") did not return " + addressSet2[i] + ".", 
                            addressSet2[i], tree.search(keySet2[i]));
                }
                
                // Remove all 250 keys from keySet2.
                for (int i = 0; i < keySet2.length; i++) {
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + keySet2[i] + ") did not return " + addressSet2[i] + ".", 
                            addressSet2[i], tree.search(keySet2[i]));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.remove(" + keySet2[i] + ") did not return " + addressSet2[i] + ".", 
                            addressSet2[i], tree.remove(keySet2[i]));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.remove(" + keySet2[i] + ") did not return 0. Key was already removed.", 
                            0, tree.remove(keySet2[i]));
                    assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + keySet2[i] + ") did not return " + 0 + ".", 
                            0, tree.search(keySet2[i]));
                }
                
                // Add 250 keys from keySet1 and search for the keys.
                for (int i = 0; i < keySet1.length; i++) {
                        assertTrue("TEST FAILED: (Order " + order + ") tree.insert(" + keySet1[i] + ", " + addressSet1[i] + ") did not return true.", 
                                tree.insert(keySet1[i], addressSet1[i]));
                        assertFalse("TEST FAILED: (Order " + order + ") tree.insert(" + keySet1[i] + ", " + addressSet1[i] + ") did not return false.", 
                                tree.insert(keySet1[i], addressSet1[i]));
                        assertEquals("TEST FAILED: (Order " + order + ") tree.search(" + keySet1[i] + ") did not return " + addressSet1[i] + ".", 
                                addressSet1[i], tree.search(keySet1[i]));
                }
                tree.close();
                treeIsClosed = true;
                
                //** REUSED B+TREE **
                //System.out.println("\t\tTesting Reused Tree...");
                treeReused = new BTree(path.getCanonicalPath());
                reusedTreeIsClosed = false;
                
                //System.out.println("\t\tSearching Reused Tree and check if it still has the keys/nodes.");
                // Search the reused tree.
                for (int i = 0; i < keySet1.length; i++) {
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + keySet1[i] + ") did not return " + addressSet1[i] + ".", 
                            addressSet1[i], treeReused.search(keySet1[i]));
                }
                // Remove all 250 keys from keySet1.
                for (int i = 0; i < keySet1.length; i++) {
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + keySet1[i] + ") did not return " + addressSet1[i] + ".", 
                            addressSet1[i], treeReused.search(keySet1[i]));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + keySet1[i] + ") did not return " + addressSet1[i] + ".", 
                            addressSet1[i], treeReused.remove(keySet1[i]));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.remove(" + keySet1[i] + ") did not return 0. Key was already removed.", 
                            0, treeReused.remove(keySet1[i]));
                    assertEquals("TEST FAILED: (Order " + order + ") treeReused.search(" + keySet1[i] + ") did not return " + 0 + ".", 
                            0, treeReused.search(keySet1[i]));
                }
                
                treeReused.close();
                reusedTreeIsClosed = true;
            }
            
            path.delete();
            
        } catch (Exception e) {
            //System.out.println("(Order " + gOrder + ") ****** AN EXCEPTION OCCURED during the stress test. Check the JUnit Tab for the exception. ******");
            if (tree != null && !treeIsClosed) tree.close();
            if (treeReused != null && !reusedTreeIsClosed) treeReused.close();
            path.delete();
            fail("TEST FAILED: (Order " + gOrder + ") An exception has occured. ", e);
        }
        
        path.delete();
    }

    private static void printArray(final int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            if (i < arr.length - 1)
                System.out.print(arr[i] + ", ");
            else
                System.out.print(arr[i]);
        }
        System.out.println();
    }
    
    private static void printArray(final long[] arr) {
        for (int i = 0; i < arr.length; i++) {
            if (i < arr.length - 1)
                System.out.print(arr[i] + ", ");
            else
                System.out.print(arr[i]);
        }
        System.out.println();
    }
}
