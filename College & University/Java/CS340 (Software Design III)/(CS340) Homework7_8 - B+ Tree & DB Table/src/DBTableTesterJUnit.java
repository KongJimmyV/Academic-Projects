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


public class DBTableTesterJUnit {
    
    // The range of Order M tests.
    private final int MIN_ORDER = 3;   // Smallest order M to test.
    private final int MAX_ORDER = 15;  // Largest order M to test.
    
    private final long TIMEOUT_CONS = 300000;  // Timeout for each single test. DEFAULT: 300 seconds or 5 minutes.
    
    @Test(timeout = TIMEOUT_CONS)
    public void constructorTests() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_DBTable_JUnitTest_" + methodName + ".txt");
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
        
        File path = new File("temp_DBTable_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        //BTree treeReused = null;
        boolean treeIsClosed = false;
        //boolean reusedTreeIsClosed = false;
        
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
    public void insertRemove() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_DBTable_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        //BTree treeReused = null;
        boolean treeIsClosed = false;
        //boolean reusedTreeIsClosed = false;
        
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
    public void insertSearchRemove() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_DBTable_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        //BTree treeReused = null;
        boolean treeIsClosed = false;
        //boolean reusedTreeIsClosed = false;
        
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
    public void insertSearchRemoveAndSearchRange() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_DBTable_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        //BTree treeReused = null;
        boolean treeIsClosed = false;
        //boolean reusedTreeIsClosed = false;
        
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
    public void remove() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_DBTable_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        //BTree treeReused = null;
        boolean treeIsClosed = false;
        //boolean reusedTreeIsClosed = false;
        
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
        
        File path = new File("temp_DBTable_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        //BTree treeReused = null;
        boolean treeIsClosed = false;
        //boolean reusedTreeIsClosed = false;
        
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
    public void searchRange() throws Exception {
        String methodName = new Object() {}
        .getClass()
        .getEnclosingMethod()
        .getName();
        
        File path = new File("temp_DBTable_JUnitTest_" + methodName + ".txt");
        BTree tree = null;
        //BTree treeReused = null;
        boolean treeIsClosed = false;
        //boolean reusedTreeIsClosed = false;
        
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
}
