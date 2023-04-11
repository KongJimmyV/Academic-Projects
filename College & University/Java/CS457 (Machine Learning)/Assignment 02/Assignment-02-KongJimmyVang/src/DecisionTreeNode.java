import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.NoSuchElementException;

/**
 * Project Name:    Assignment 2            <br>
 * File Name:       DecisionTreeNode.java   <br>
 * Description:     This is a Decision Tree Node. <br><br>
 * 
 * Date Created:    10/10/22                <br>
 * Date Modified:   10/27/22                <br>
 * Class:           CS457 (Fall 2022)       <br><br>
 * 
 * @author Kong Jimmy Vang
 */
public class DecisionTreeNode implements Comparable<DecisionTreeNode>
{
    /** The name of this node */
    private String name;
    
    /** The label of this node */
    private String label;
    
    /** The parent of this node. */
    private DecisionTreeNode parent;
    
    /** The depth of this particular node. */
    private int depth;
    
    /** The child nodes that are mapped to this node. */
    private LinkedHashMap<String, DecisionTreeNode> children;
    
    /** The data set stored in this node. */
    private LinkedHashMapSet<String> dataSet;
    
    /** The set of attributes stored in this node. */
    private LinkedHashMapSet<String> attributes;
    
    /** The plurality value of this node. */
    private String pluralityValue;
    
    /** The attribute j with the best importance rank. */
    private int j;
    
    /** The importance rank calculated for this node. */
    private double importanceRank;
    
    /**
     * Creates a Decision Tree Node.
     * @param name - the name of this node.
     * @param label - the label of this node.
     * @param dataSet - the data set to store in this node.
     * @param attributes - the set of attributes to store in this node.
     */
    public DecisionTreeNode(final String name, 
                            final String label, 
                            final LinkedHashMapSet<String> dataSet, 
                            final LinkedHashMapSet<String> attributes) 
    {
        this(null, name, label, dataSet, attributes, new LinkedHashMap<>());
    }
    
    /**
     * Creates a Decision Tree Node.
     * @param parent - the parent node.
     * @param name - the name of this node.
     * @param label - the label of this node.
     * @param dataSet - the data set to store in this node.
     * @param attributes - the set of attributes to store in this node.
     * @param children - the children to map to this node.
     */
    public DecisionTreeNode(final DecisionTreeNode parent, 
                            final String name, 
                            final String label, 
                            final LinkedHashMapSet<String> dataSet, 
                            final LinkedHashMapSet<String> attributes, 
                            final LinkedHashMap<String, DecisionTreeNode> children) 
    {
        this.setParent(parent);
        this.depth = -1;
        this.setName(name);
        this.setLabel(label);
        this.dataSet = dataSet;
        this.attributes = attributes;
        this.children = children;
        this.setImportanceRank(0, -1);
    }
    
    /**
     * Gets the name of this node.
     * @return Returns the name of this node.
     */
    public String getLabel() {
        return this.label;
    }
    
    /**
     * Sets the name of this node.
     * @param name - the name to set. 
     */
    public void setLabel(final String label) {
        this.label = label;
    }
    
    /**
     * Gets the name of this node.
     * @return Returns the name of this node.
     */
    public String getName() {
        return this.name;
    }
    
    /**
     * Sets the name of this node.
     * @param name - the name to set. 
     */
    public void setName(final String name) {
        this.name = name;
    }
    
    /**
     * Gets the parent of this node.
     * @return Returns the parent node.
     */
    public DecisionTreeNode getParent() {
        return this.parent;
    }
    
    /**
     * Sets the parent of this node.
     * @param parent - the parent node
     */
    private void setParent(final DecisionTreeNode parent) {
        this.parent = parent;
        this.depth = -1; // Reset depth since parent changed.
    }
    
    /**
     * Maps the child node into this node with the key "label" and value "childNode".
     *      Will replace a child node at key "label".
     * @param key - the key (label) to put into the map.
     * @param childNode - the value (child node) to put into the map.
     */
    public void put(final String key, final DecisionTreeNode childNode) {
        childNode.setParent(this);
        this.children.put(key, childNode);
    }
    
    /**
     * Removes the child and unmaps it from this node with the key.
     * @param key - the key (label) to remove.
     * @return Returns the removed child node. 
     *         Return <code>null</code> if no child node was found with the key.
     */
    public DecisionTreeNode removeChild(final String key) 
    {
        if (null == this.children.get(key)) {
            return null;
        }
        
        DecisionTreeNode removedNode = this.children.remove(key);
        removedNode.setParent(null);
        return removedNode;
    }
    
    /**
     * Gets the child nodes mapped to this node.
     * @return Returns the children, stored in a key-value map using (String, DecisionTreeNode) pairs.
     */
    protected LinkedHashMap<String, DecisionTreeNode> getChildrenNodes() {
        return this.children;
    }
    
    /**
     * Gets the amount of child nodes mapped to this node.
     * @return Returns the amount of child nodes mapped to this node.
     */
    public int getChildrenSize() {
        return this.children.size();
    }
    
    /**
     * Gets the depth level of this node.
     * @return Returns the depth level of this node.
     */
    public int getDepth() {
        if (this.depth != -1) {
            return this.depth;
        }
        
        int depth = 0;
        DecisionTreeNode next = this.parent;
        while (null != next)
        {
            next = next.parent;
            depth++;
        }
        this.depth = depth;
        return depth;
    }
    
    /**
     * Gets the data set for this node.
     * @return Returns the data set for this node.
     */
    public LinkedHashMapSet<String> getDataSet() {
        return this.dataSet;
    }
    
    /**
     * Gets the size of the data set.
     * @return Returns the size of the data set.
     */
    public int getDataSetSize() {
        return this.dataSet.size();
    }
    
    /**
     * Gets the set of attributes for this node.
     * @return Returns the set of attributes for this node.
     */
    public LinkedHashMapSet<String> getAttributes() {
        return this.attributes;
    }
    
    /**
     * Calculates the predicted value based on the plurality of the data set's outputs.
     *      This calculation will also unlink this node's data set to save space as it assumes
     *      that this node is completed and not being used to construct a <code>DecisionTree</code> 
     *      anymore.
     * @return Returns the predicted value based on the plurality of the data set's outputs.
     *         Returns "__NoPluralityValueExists__" if the stored data set could not calculate a plurality value.
     */
    protected String calculatePluralityValue()
    {
        if (null != this.pluralityValue) {
            return this.pluralityValue;
        }
        
        // String is the Output label, Integer is the amount of outputs found in the data set.
        LinkedHashMap<String, Integer> outputMap = new LinkedHashMap<>();
        
        for (int i = 0; i < this.dataSet.size(); i++) 
        {
            String output = this.dataSet.getOutputAt(i);
            Integer amount = outputMap.get(output);
            if (null == amount) 
            {
                amount = 0;
            }
            outputMap.put(output, amount + 1);
        }
        
        try 
        {
            this.pluralityValue = Collections.max(outputMap.entrySet(), Comparator.comparingInt(Map.Entry::getValue)).getKey();
            
            // To save space, don't store the data set as it is no longer needed (credits to Dr. Jason Sauppe for the hint)
            this.dataSet = null;
        } 
        catch (NoSuchElementException e) 
        {
            this.pluralityValue = "__NoPluralityValueExists__";
        }
        
        return this.pluralityValue;
    }
    
    /**
     * Gets the size for this node's set of attributes.
     * @return Returns the size for this node's set of attributes.
     */
    public int getAttributesSize() {
        return this.attributes.size();
    }
    
    /**
     * Gets the attribute j that represents the attribute that 
     *      results in the best information gain for this node.
     * @return Returns the attribute j.
     */
    public int getJ() {
        return this.j;
    }
    
    /**
     * Gets the information gain for this node.
     * @return Returns the information gain.
     */
    public double getImportanceRank() {
        return this.importanceRank;
    }
    
    /**
     * Sets the importance rank and the attribute j that results in the best importance rank.
     * @param informationGain
     */
    public void setImportanceRank(final double importanceRank, final int j) {
        this.importanceRank = importanceRank;
        this.j = j;
    }
    
    public String toString() {
        return String.format("%s | %s | %s", this.name, this.label, super.toString());
    }

    @Override
    public int compareTo(final DecisionTreeNode o) {
        return Double.compare(this.getImportanceRank(), o.getImportanceRank());
    }
}
