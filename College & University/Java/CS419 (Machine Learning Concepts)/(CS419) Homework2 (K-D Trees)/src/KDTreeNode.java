//////////////////////////////////////////////////////
// File Name:   KDTreeNode.java
// Author:      Kong Jimmy Vang
// Date:        10/8/2018
// 

import java.util.ArrayList;
import java.util.Vector;

/**
 * A K-D Tree node.
 * @author Kong Jimmy Vang
 *
 * @param <E> The data type to store in the K-D Tree's nodes.
 */
public class KDTreeNode<E> {
    
    // *** Fields/Instance Variables ***
    /** Reference to this tree node's parent node. */
    private KDTreeNode<E> parent;
    
    /** Reference to this tree node's left child. */
    private KDTreeNode<E> left;
    
    /** Reference to this tree node's right child. */
    private KDTreeNode<E> right;
    
    /** Data storage for a type <E> object. */
    private E data;
    
    /** Bounding box storage for this particular tree node. */
    private ArrayList<Vector<Double>> boundingBox;
    
    // *** Constructors ***
    /**
     * Creates a new KDTreeNode that stores a data type <E>.
     * @param parent - Sets the parent of this node.
     * @param data - Stores data type of <E> into this node.
     */
    public KDTreeNode(final KDTreeNode<E> parent, final E data) {
        this.parent = parent;
        this.data = data;
    }
    
    /**
     * Creates a new KDTreeNode that stores a data type <E>.
     * @param parent - Sets the parent of this node.
     * @param data - Stores data type of <E> into this node.
     * @param boundingBox - Stores a bounding box into this node.
     */
    public KDTreeNode(final KDTreeNode<E> parent,
                          final E data,
                          final ArrayList<Vector<Double>> boundingBox) {
        this.parent = parent;
        this.data = data;
        this.boundingBox = boundingBox;
    }
    
    /**
     * Creates a new KDTreeNode that stores a data type <E>.
     * @param parent - Sets the parent of this node.
     * @param data - Stores data type of <E> into this node.
     * @param left - Sets the left child of this node.
     * @param right - Sets the left child of this node. 
     */
    public KDTreeNode(final KDTreeNode<E> parent,
                        final E data,
                        final KDTreeNode<E> left, 
                        final KDTreeNode<E> right) {
        this.parent = parent;
        this.data = data;
        this.left = left;
        this.right = right;
    }
    
    // *** Methods/Functions ***
    /** Get the parent of this node. */
    protected KDTreeNode<E> getParent() {
        return parent;
    }
    
    /** Set the parent of this node. */
    protected void setParent(KDTreeNode<E> parent) {
        this.parent = parent;
    }
    
    /** Get the left child of this node. */
    protected KDTreeNode<E> getLeft() {
        return left;
    }
    
    /** Set the left child of this node. */
    protected void setLeft(KDTreeNode<E> left) {
        this.left = left;
    }
    
    /** Get the right child of this node.  */
    protected KDTreeNode<E> getRight() {
        return right;
    }
    
    /** Set the right child of this node. */
    protected void setRight(KDTreeNode<E> right) {
        this.right = right;
    }
    
    /** Returns the data type of <E> stored in this node. */
    protected E getData() {
        return data;
    }
    
    /** Stores a data type of <E>. */
    protected void setData(E data) {
        this.data = data;
    }
    
    /** Returns the bounding box in this node.*/
    protected ArrayList<Vector<Double>> getBoundingBox() {
        return boundingBox;
    }
    
    /** Stores a bounding box into this node. */
    protected void setBoundingBox(ArrayList<Vector<Double>> boundingBox) {
        this.boundingBox = boundingBox;
    }
    
    /*public String toString() {
        String s = "";
        s = ": Bounding Box: " + this.boundingBox + "\n" 
                + "Data in leaf: " + this.data;
        return s;
    }*/
}