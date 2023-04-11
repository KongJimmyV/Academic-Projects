//////////////////////////////////////////////////////
// File Name:   DecisionTree.java
// Author:      Kong Jimmy Vang
// Date:        9/27/2018
// 

package decisionTreeLearningAlgorithmPack;

import java.util.LinkedList;

/**
 * Represents the DecisionTree that may be used to test if a particular mushroom is editable.
 * 
 * @author Kong Jimmy Vang
 */
public class DecisionTree {
    
    //*** Field/Instance Varaibles ***
    /** Root node of this decision tree. */
    private DecisionTreeNode root;
    
    /** Pointer node of this decision tree. Allows traversal of the decision tree. */
    private DecisionTreeNode pointer;
    
    
    //*** Constructors ***
    /** Build Decision Tree with a {@code null} root. */
    public DecisionTree() {
        this.root = null;
        this.pointer = this.root;
    }
    
    /** Build Decision Tree with root {@code rt}.*/
    public DecisionTree(DecisionTreeNode rt) {
        this.root = rt;
        this.pointer = this.root;
    }
    
    /** Build Decision Tree with a node containing Attribute {@code A} */
    public DecisionTree(Attribute A) {
        this.root = new DecisionTreeNode(null, A);
        this.pointer = this.root;
    }
    
    
    //*** Methods/Functions ***
    /** Return the pointer node's children size */
    public int getAmountOfChildren() {
        return this.pointer.children.size();
    }
    
    /** Return the size of the entire tree. */
    public int size() {
        System.out.println(root);
        return size(this.root);
    }
    
    /** Recursive Helper method for {@code size()}. */
    private int size(DecisionTreeNode node) {
        System.out.println(node);
        int size = 1;
        
        if (node == null) 
            return 0;
        else if (node != null && !node.children.isEmpty()) {
            for (int i = 0; i < node.children.size(); i++) {
                size += size(node.children.get(i));
            }
        }
        
        return size;
    }
    
    /** IF the root exists, then add a new attribute A to this tree's node. <br><br>
     * 
     * The branches of node get...<br>
     * node.children gets a new node containing A at {@code index}.<br>
     * node.attributeValue get a {@code null} value at {@code index}.<br><br>
     * 
     * Otherwise if the root is {@code null}, then  create a new root node containing A.
     */
    public void addChildNode(int index, Attribute A) {
        addChildNode(index, A, null);
    }
    
    /** IF the root exists, then add a new attribute A to this tree's node. <br><br>
     * 
     * The branches of node get...<br>
     * node.children gets a new node containing A at {@code index}.<br>
     * node.attributeValue get the {@code attributeValue} at {@code index}.<br><br>
     * 
     * Otherwise if the root is {@code null}, then create a new root node containing A.
     */
    public void addChildNode(int index, Attribute A, String attributeValue) {
        if (this.root == null) {
            this.root = new DecisionTreeNode(null, A);
            startAtRoot();
            
        } else {
            this.pointer.children.add(index, new DecisionTreeNode(this.pointer, A));
            this.pointer.attributeValues.add(index, attributeValue);
        }
    }
    
    /** IF the root exists, then add a new attribute A to this tree's node. <br><br>
     * 
     * Take the {@code subTree} and add it to the list node.children at {@code index}.
     * 
     * The branches of node get...<br>
     * node.children gets the {@code subTree} added at {@code index}.<br>
     * node.attributeValue get the {@code attributeValue} added at {@code index}.<br><br>
     * 
     * Otherwise if the root is {@code null}, then create a new root node containing A.
     */
    protected void addChildNode(int index, Attribute A, String attributeValue, DecisionTree subTree) {
        if (this.root == null) {
            this.root = new DecisionTreeNode(null, A);
            startAtRoot();
            
        } else {
            subTree.root.parent = this.pointer;
            //dTree.pointer.A = A;
            this.pointer.children.add(index, subTree.root);
            this.pointer.attributeValues.add(index, attributeValue);
        }
    }
    
    /** Move the pointer to the root node */
    public void startAtRoot() {
        this.pointer = this.root;
    }
    
    /** Move the pointer to point at a child node in this node's list, children, at {@code index} */
    public void goToChildNode(int index) {
        this.pointer = this.pointer.children.get(index);
    }
    
    /** Move the pointer to the parent node of this node. */
    public void goToParentNode(int index) {
        this.pointer = this.pointer.parent;
        if (this.pointer == null) {
            startAtRoot();
        }
    }
    
    /**
     * Starting at the root of this decision tree, classify the example {@code e} 
     *      as a positive example or a negative example by traversing the tree, {@code root}'s.
     * 
     * @param e - An example to classify.
     * @return Returns "POS" if the example, {@code e}, is a positive example. <br>
     * Returns "NEG" if the example, {@code e}, is a negative example.
     */
    public String classify(Example e) {
        //startAtRoot();
        return classify(e, this.root);
    }
    
    /**
     * Recursive Helper Method for {@link #classify(Example e)}.
     * 
     * Starting at a particular decision tree node, classify the example {@code e} 
     *      as a positive example or a negative example by traversing the tree, {@code node}.
     * 
     * @param e - An example to classify.
     * @param node - The node of the decision tree to start at.
     * @return Returns "POS" if the example, {@code e}, is a positive example. <br>
     * Returns "NEG" if the example, {@code e}, is a negative example.
     */
    private String classify(Example e, DecisionTreeNode node) {
        String s = "";
        
        if (node == null) return s;
        
        if (node.A.getAttributeName().equals("POS")) {
            //System.out.println("EDIBLE");
            return "POS";
        }
        if (node.A.getAttributeName().equals("NEG")) {
            //System.out.println("POISON");
            return "NEG";
        }
        
        String exampleAttribute = e.getExampleAttributeAt(node.A.getAttributeIndex());
        for (int i = 0; i < node.attributeValues.size(); i++) {
            
            if (node.children.isEmpty()) return s;
            if (node.attributeValues.get(i).equalsIgnoreCase(exampleAttribute)) {
                //System.out.println("GOTO: " + i + ", NODE: " + node.toString());
                s = classify(e, node.children.get(i));
            }
        }
        
        return s;
    }
    
    //*** Inner Classes ***
    private class DecisionTreeNode {
        // Points to the parent of this particular node.
        private DecisionTreeNode parent;
        
        // Stores which Attribute this node is associated with.
        protected Attribute A;
        
        // Branches of the Decision Tree (Represented in LinkedLists).
        private LinkedList<DecisionTreeNode> children;  // Children of this particular node.
        private LinkedList<String> attributeValues;   // Values; indexed with the children of this particular node.
        
        public DecisionTreeNode(final DecisionTreeNode parent,
                                final Attribute A) {
            this.parent = parent;
            this.A = A;
            this.children = new LinkedList<>();
            this.attributeValues = new LinkedList<>();
        }
        
    }
}