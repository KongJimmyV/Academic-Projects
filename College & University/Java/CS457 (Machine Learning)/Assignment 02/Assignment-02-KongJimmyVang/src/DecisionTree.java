import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Map.Entry;
import java.util.PriorityQueue;

/**
 * Project Name:    Assignment 2            <br>
 * File Name:       DecisionTree.java  <br>
 * Description:     This Model implements Decision Tree methods and functions. <br><br>
 * 
 * Date Created:    10/10/22                <br>
 * Date Modified:   10/27/22                <br>
 * Class:           CS457 (Fall 2022)       <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class DecisionTree 
{
    private DecisionTreeNode root;  // the root of this tree.
    private int size;               // size of this tree (amount of nodes in this tree).
    private int maxDepth;           // max depth limit for this tree.
    private int maxSplit;           // max split limit for this tree.
    private int numOfSplits;        // number of splits performed.
    private int counter;            // temporary counter
    
    private int verbosityLevel;     // verbosity level for the decision tree
    
    /** Mapped set of attributes */
    private LinkedHashMapSet<String> mapSetAttributes;
    
    /** 
     * Mapped Integer keys to attributes String values.
     *      (Used to get the value of a particular key at attribute j.)
     */
    private LinkedHashMap<Integer, String> mapAttributeNames;
    
    /** Mapped output classes */
    private LinkedHashMap<String, String> mapClasses;
    
    /**
     * Constructs a new <code>DecisionTree</code> with a map of output classes.
     * @param maxDepth - the max depth this tree is allowed to reach.
     * @param maxSplit - the max amount of splits that can be performed on this tree.
     * @param verbosityLevel - verbosity output level
     * @param mapClasses - mapped output classes.
     * @param mapAttributeNames - mapped attribute names
     */
    public DecisionTree(final int maxDepth,
                        final int maxSplit,
                        final int verbosityLevel,
                        final LinkedHashMap<Integer, String> mapAttributeNames,
                        final LinkedHashMap<String, String> mapClasses) 
    {
        this.root = null;
        this.size = 0;
        this.maxDepth = maxDepth;
        this.maxSplit = maxSplit;
        this.numOfSplits = 0;
        this.counter = 0;
        this.verbosityLevel = verbosityLevel;
        this.mapAttributeNames = mapAttributeNames;
        this.mapClasses = mapClasses;
    }
    
    /**
     * Gets the root of this <code>DecisionTree</code>.
     * @return Returns the root <code>DecisionTreeNode</code> of this <code>DecisionTree</code>.
     */
    public DecisionTreeNode getRoot() {
        return this.root;
    }
    
    /**
     * Performs the Decision Tree Learning algorithm on a set of data and attributes.
     *      Updates this <code>DecisionTree</code> for the set of data and attributes.
     * @param mapSetDataSet - a mapped data set {(x_i, y_i)}, where i = 1 to n.
     * @param mapSetAttributes - a mapped set of attributes.
     */
    public void decisionTreeLearn(final LinkedHashMapSet<String> mapSetDataSet, 
                                  final LinkedHashMapSet<String> mapSetAttributes) 
    {
        if (this.verbosityLevel >= 3) {
            System.out.println(String.format("    * Beginning decision tree learning"));
        }
        
        if (this.maxSplit >= 0) 
        {
            //====== Best-First Search ======
            decisionTreeLearnBFS(mapSetDataSet, mapSetAttributes);
        }
        else {
            //====== Depth-First Search ======
            // Setup tree for learning.
            this.mapSetAttributes = mapSetAttributes;
            
            // Create root.
            this.size = 0;
            this.root = new DecisionTreeNode(String.valueOf(this.size()), 
                                             "root", 
                                             mapSetDataSet, 
                                             mapSetAttributes);
            this.size++;
            
            // Examine and split.
            split(this.root);
            if (this.verbosityLevel >= 3) {
                System.out.println(String.format("    * Learned tree has %d nodes.", this.size()));
            }
        }
    }
    
    /**
     * Examine the given <code>node</code> using it's attributes and data set.
     * @param node - the node
     * @return Returns an integer representing the attribute index j with the best importance rank. <br>
     *         Returns -1, if no attribute index j with the best importance rank was found. <br>
     *         Also Returns -1, if the node is pure or has reached the max depth limit.
     */
    private int examine(final DecisionTreeNode node) 
    {
        if (this.verbosityLevel >= 3) {
            System.out.print(String.format("      Examining node %s (depth=%d):", this.counter++, node.getDepth()));
        }
        
        LinkedHashMapSet<String> J = node.getAttributes();
        LinkedHashMapSet<String> nodeData = node.getDataSet();
        
        if (getAmountOfClasses(nodeData) <= 1 || J.size() == 0) 
        {
            if (this.verbosityLevel >= 3) {
                System.out.print(String.format(" node is pure\r\n"));
            }
            return -1;
        } 
        else if (0 < this.maxDepth && this.maxDepth <= node.getDepth())
        {
            if (this.verbosityLevel >= 3) {
                System.out.print(String.format(" node is at max depth\r\n"));
            }
            return -1;
        }
        else 
        {
            if (this.verbosityLevel >= 3) {
                System.out.print(String.format(" node is splittable\r\n"));
            }
        }
        int j = calculateNodeImportance(node, true);
        return j;
    }
    
    /**
     * Examine the given <code>node</code> using it's attributes and data set.
     *      Split on each value v of attribute j, with j having a high importance metric.
     * @param node - the given node
     */
    private void split(final DecisionTreeNode node) 
    {
        LinkedHashMapSet<String> J = node.getAttributes();
        LinkedHashMapSet<String> nodeData = node.getDataSet();
        
        Integer j = examine(node);
        
        // j <= -1 indicates that the examined node is pure or has reached a max depth.
        if (j <= -1) {
            return;
        }
        
        LinkedHashMap<Integer, String> mapAttribute = J.get(j);
        for (int i = 0; i < mapAttribute.size(); i++) 
        {
            // Set up value V and it's optional name if found.
            String v = mapAttribute.get(i);
            String vOptional = v;
            String[] vSplit = v.split("=");
            if (vSplit.length >= 2) {
                v = vSplit[0];
                vOptional = vSplit[1];
            }
            
            // Create exs
            LinkedHashMapSet<String> exs = new LinkedHashMapSet<>();
            int count = 0;
            for (int ii = 0; ii < nodeData.size(); ii++) 
            {
                LinkedHashMap<Integer, String> data = nodeData.get(ii);
                if ( data.get(j).equals(v) ) 
                {
                    exs.put(count++, data);
                }
            }
            
            // Split if exs.size() != 0.
            if (exs.size() != 0) 
            {
                // Split on new child new.
                LinkedHashMapSet<String> childAttributes = new LinkedHashMapSet<>();
                for (Entry<Integer, LinkedHashMap<Integer, String>> set : J.entrySet()) 
                {
                    Integer ii = set.getKey();
                    if (ii != j) 
                    {
                        childAttributes.put(ii, J.get(ii));
                    }
                }
                
                String label = String.format("%s = %s", j, vOptional);
                DecisionTreeNode child = new DecisionTreeNode(String.valueOf(this.size()), 
                                                              label,
                                                              exs, 
                                                              childAttributes);
                node.put(child.getLabel(), child);
                this.size++;
                
                split(child);
            }
        }
        // To save space, calculate the plurality value, this method will unlink the data set.
        node.calculatePluralityValue();
    }
    
    /**
     * Performs the Decision Tree Learning algorithm (using Best-First Search) 
     *      on a set of data and attributes.
     *      Updates this <code>DecisionTree</code> for the set of data and attributes.
     * @param mapSetDataSet - a data set {(x_i, y_i)}, where i = 1 to n.
     * @param mapSetAttributes - a set of attributes.
     */
    public void decisionTreeLearnBFS(final LinkedHashMapSet<String> mapSetDataSet, 
                                     final LinkedHashMapSet<String> mapSetAttributes) 
    {
        // Setup Tree for learning.
        this.mapSetAttributes = mapSetAttributes;
        
        // Create root.
        this.size = 0;
        this.root = new DecisionTreeNode(String.valueOf(this.size()), 
                                         "root", 
                                         mapSetDataSet, 
                                         mapSetAttributes);
        this.size++;
        
        this.numOfSplits = 0;
        this.counter = 0;
        
        // Create Max-Priority Queue.
        PriorityQueue<DecisionTreeNode> frontier = new PriorityQueue<>(Collections.reverseOrder());
        frontier.add(this.root);
        
        while(!frontier.isEmpty()) 
        {
            DecisionTreeNode node = frontier.remove();
            int j = examine(node);
            if (j > -1 && (this.maxSplit <= -1 || this.numOfSplits < this.maxSplit)) 
            {
                splitBFS(frontier, node, j);
            }
        }
        
        if (this.verbosityLevel >= 3) {
            System.out.println(String.format("    * Learned tree has %d nodes.", this.size()));
        }
    }
    
    /**
     * Using Best-First Search, split on each value v of attribute j, 
     *      with j having a high importance metric.
     * @param node - the node
     * @param j - attribute at j
     */
    private void splitBFS(final PriorityQueue<DecisionTreeNode> frontier, 
                          final DecisionTreeNode node, 
                          final int j) 
    {
        LinkedHashMapSet<String> J = node.getAttributes();
        LinkedHashMapSet<String> nodeData = node.getDataSet();
        
        LinkedHashMap<Integer, String> mapAttribute = J.get(j);
        for (int i = 0; i < mapAttribute.size(); i++) 
        {
            // Set up value V and it's optional name if found.
            String v = mapAttribute.get(i);
            String vOptional = v;
            String[] vSplit = v.split("=");
            if (vSplit.length >= 2) {
                v = vSplit[0];
                vOptional = vSplit[1];
            }
            
            // Create exs
            LinkedHashMapSet<String> exs = new LinkedHashMapSet<>();
            int count = 0;
            for (int ii = 0; ii < nodeData.size(); ii++) 
            {
                LinkedHashMap<Integer, String> data = nodeData.get(ii);
                if ( data.get(j).equals(v) ) 
                {
                    exs.put(count++, data);
                }
            }
            
            // Split if exs.size() != 0.
            if (exs.size() != 0) 
            {
                // Split on new child new.
                LinkedHashMapSet<String> childAttributes = new LinkedHashMapSet<>();
                for (Entry<Integer, LinkedHashMap<Integer, String>> set : J.entrySet()) 
                {
                    Integer ii = set.getKey();
                    if (ii != j) 
                    {
                        childAttributes.put(ii, J.get(ii));
                    }
                }
                
                String label = String.format("%s = %s", j, vOptional);
                DecisionTreeNode child = new DecisionTreeNode(String.valueOf(this.size()), 
                                                              label, 
                                                              exs, 
                                                              childAttributes);
                calculateNodeImportance(child, false); // Calculates node importance rank for PriorityQueue
                frontier.add(child);
                node.put(child.getLabel(), child);
                this.size++;
            }
        }
        this.numOfSplits++;
        
        // To save space, calculate the plurality value, this method will unlink the data set.
        node.calculatePluralityValue();
    }
    
    /**
     * Predict the output prediction for a data point <code>x</code>, 
     *      starting at the root node of this decision tree.
     * @param x - the data point predict for.
     * @return Returns this decision tree's output prediction for the data point <code>x</code>.
     */
    public String decisionTreePredict(final LinkedHashMap<Integer, String> x) {
        return decisionTreePredict(this.getRoot(), x);
    }
    
    /**
     * Predict the output prediction for a data point <code>x</code>, 
     *      starting at the given <code>node</code>.
     * @param node - the node to start at.
     * @param x - the data point predict for.
     * @return Returns the <code>node</code>'s output prediction for the data point <code>x</code>.
     */
    public String decisionTreePredict(final DecisionTreeNode node, 
                                      final LinkedHashMap<Integer, String> x) 
    {
        for (Map.Entry<String, DecisionTreeNode> set : node.getChildrenNodes().entrySet()) 
        {
            String label = set.getKey();
            DecisionTreeNode child = set.getValue();
            
            String[] labelSplit = label.split("=");
            int j = Integer.parseInt(labelSplit[0].trim());
            String v = labelSplit[1].trim();
            if ( x.get(j).equals(v) ) 
            {
                return decisionTreePredict(child, x);
            }
        }
        return node.calculatePluralityValue();
    }
    
    /**
     * Find the amount of class outputs for the given data set.
     * @param dataSet - a data set.
     * @return Returns the amount of class outputs found for the given data set.
     */
    private int getAmountOfClasses(final LinkedHashMapSet<String> dataSet) 
    {
        HashSet<String> hashSet = new HashSet<>();
        for (int i = 0; i < dataSet.size(); i++) {
            hashSet.add(dataSet.getOutputAt(Integer.valueOf(i)));
        }
        return hashSet.size();
    }
    
    /**
     * Calculates the node's best attribute that gives the best importance rank and store it into the node.
     * @param node - a decision tree node
     * @param bPrintImportance - if true, print verbose output to command line, else do not print.
     * @return Returns the attribute that yields the best importance rank for the given node.
     */
    private int calculateNodeImportance(final DecisionTreeNode node, final boolean bPrintImportance) {
        LinkedHashMapSet<String> J = node.getAttributes();
        LinkedHashMapSet<String> nodeData = node.getDataSet();
        
        Integer j = -1;
        double currentImportance = 0;
        double maxImportance = Double.MIN_VALUE;
        
        for (Entry<Integer, LinkedHashMap<Integer, String>> set : J.entrySet()) 
        {
            Integer j2 = set.getKey();
            currentImportance = importance(j2, nodeData);
            
            if (this.verbosityLevel >= 4 && bPrintImportance) {
                System.out.println(String.format("        Gain=%.4f with split on [%s]", currentImportance, this.mapAttributeNames.get(j2)));
            }
            
            if (Double.compare(currentImportance, maxImportance) > 0 || maxImportance == Double.MIN_VALUE) 
            {
                maxImportance = currentImportance;
                j = j2;
            }
        }
        // set node's max importance rank.
        node.setImportanceRank(maxImportance, j);
        return j;
    }
    
    /**
     * Calculate the importance metric of attribute <code>j</code> for a given data set.
     * @param j - an integer <code>j</code>, denoting the attribute at <code>j</code>.
     * @param dataSet - a data set.
     * @return Returns the importance metric of attribute <code>j</code> for a given data set.
     */
    private double importance(final int j, 
                              final LinkedHashMapSet<String> dataSet) 
    {
        return informationGain(dataSet, j);
    }
    
    /**
     * Calculate the entropy for a given data set.
     * @param dataSet - a <code>LinkedHashMapSet</code> data set.
     * @param mapClasses - a map of Classes.
     * @return Returns the entropy for a given data set.
     */
    private double entropy(final LinkedHashMapSet<String> dataSet, 
                           final LinkedHashMap<String, String> mapClasses) 
    {
        double sum = 0;
        
        if (dataSet.size() == 0) {
            return 0;
        }
        
        for (Map.Entry<String, String> set : mapClasses.entrySet()) 
        {
            String k = set.getKey();
            
            double numerator = 0;
            double denominator = dataSet.size();
            for (int i = 0; i < dataSet.size(); i++) 
            {
                String yi = dataSet.getOutputAt(i);
                if (yi.equals(k)) 
                {
                    numerator++;
                }
            }
            double pk = numerator / denominator;
            double log = (Math.log(pk) / Math.log(2));
            if (Double.isInfinite(log) || Double.isNaN(log)) 
            {
                log = 0;
            }
            sum += pk * log;
        }
        
        // This is to prevent Java from returning a negative Double, denoted as -0.0, when the sum is 0.0.
        if (Double.compare(sum, 0.0) == 0) {
            return sum;
        } else {
            return -1 * sum;
        }
    }
    
    /**
     * Calculate the remainder for a given data set, at attribute <code>j</code>.
     * @param dataSet - a data set.
     * @param j - an integer <code>j</code>, denoting the attribute at <code>j</code>.
     * @return Returns the remainder for a given data set, at attribute <code>j</code>.
     */
    private double remainder(final LinkedHashMapSet<String> dataSet, 
                             final int j) 
    {
        double sum = 0;
        
        LinkedHashMap<Integer, String> attributes = this.mapSetAttributes.get(j);
        for (Map.Entry<Integer, String> set : attributes.entrySet()) 
        {
            //Integer key = set.getKey();
            String v = set.getValue();
            String[] vSplit = v.split("=");
            if (vSplit.length >= 2) {
                v = vSplit[0];
            }
            
            LinkedHashMapSet<String> dataSetSv = new LinkedHashMapSet<>();
            
            double numerator = 0;
            double denominator = dataSet.size();
            int count = 0;
            for (int i = 0; i < dataSet.size(); i++) 
            {
                LinkedHashMap<Integer, String> data = dataSet.get(i);
                if (v.equals(data.get(j))) 
                {
                    dataSetSv.put(count++, data);
                }
            }
            numerator = dataSetSv.size();
            double quotient = numerator / denominator;
            sum += quotient * entropy(dataSetSv, this.mapClasses);
        }
        return sum;
    }
    
    /**
     * Calculate the information gain for a given data set, at attribute <code>j</code>.
     * @param dataSet - a data set.
     * @param j - an integer <code>j</code>, denoting the attribute at <code>j</code>.
     * @return Returns the information gain for a given data set, at attribute <code>j</code>.
     */
    private double informationGain(final LinkedHashMapSet<String> dataSet, 
                                   final int j) 
    {
        double entropy = entropy(dataSet, this.mapClasses);
        double remainder = remainder(dataSet, j);
        return entropy - remainder;
    }
    
    /**
     * Returns the size of this.
     * @return Returns the size of this <code>DecisionTree</code>.
     */
    public int size() {
        return this.size;
    }
    
    public String toString() {
        return createTreeString();
    }
    
    /**
     * Returns a string representation of this <code> DecisionTree</code>.
     * @return Returns a string representation of this <code> DecisionTree</code>. 
     */
    private String createTreeString() {
        return createTreeString(this.root);
    }
    
    /**
     * Returns a string representation of a given <code> DecisionTreeNode</code>.
     * @param node - the node to start at
     * @return Returns a string representation of a given <code> DecisionTreeNode</code>. 
     */
    private String createTreeString(final DecisionTreeNode node) {
        String str = "\r\n";
        
        //=== If we are at a leaf node, add the leaf to the string and return the string immediately.
        if (node.getChildrenNodes().isEmpty()) 
        {
            for (int i = 0; i < node.getDepth()*2; i++) 
            {
                str += String.format("  ");
            }
            str += String.format("Leaf: Predict [%s]\r\n", this.mapClasses.get( node.calculatePluralityValue() ));
            return str;
        }
        
        //=== If we are at a node, add the node to the string.
        String key = node.getChildrenNodes().entrySet().iterator().next().getKey();
        String[] splitKey = key.split("=");
        if (splitKey.length >= 2) 
        {
            key = splitKey[0];
        }
        Integer j = Integer.parseInt(key.trim());
        
        for (int i = 0; i < node.getDepth()*2; i++) 
        {
            str += String.format("  ");
        }
        str += String.format("Node: Split on [%s]\r\n", this.mapAttributeNames.get(j));
        
        //=== If the node contains child nodes, 
        //===       add the child node's Branch to the string and recurse across each child node.
        for (Map.Entry<String, DecisionTreeNode> set : node.getChildrenNodes().entrySet()) 
        {
            String label = set.getKey();
            DecisionTreeNode childNode = set.getValue();
            String[] labelSplit = label.split("=");
            
            for (int i = 0; i <= node.getDepth()*2; i++) 
            {
                str += String.format("  ");
            }
            str += String.format("Branch [%s]=[%s]", 
                                 this.mapAttributeNames.get(Integer.parseInt(labelSplit[0].trim())), 
                                 labelSplit[1].trim());
            
            // Recurse here on a child node Branch.
            str += createTreeString(childNode);
        }
        return str;
    }
}
