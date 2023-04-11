//
// SortedList.java
// Created by: Kong Jimmy Vang
//

import java.io.*;
import java.util.*;

/**
 * A generic singly linked sorted list that can hold Comparable objects of
 *      type T. The list is sorted in ascending order.
 *      
 * @author Kong Jimmy Vang
 *
 * @param <T> - The object type to store in the list. 
 *                  Objects must implement the interface Comparable.
 */
public class SortedList<T extends Comparable<? super T>> {
    
    /** A private node class that supports singly-linked lists. */
    private class Node {
        private T data;
        private Node next;

        private Node(T data, Node next) {
            this.data = data;
            this.next = next;
        }
    }
    
    private Node head;  // Head reference to the first node in the list.
    private int size;   // The number of elements in the list.

    /**
     * Creates an empty list.
     */
    public SortedList() {
        this.head = null;
        this.size = 0;
    }

    /**
     * Precondition: s1.size() > 0 && s2.size() > 0
     * <br><br>
     * Creates a sorted list that inserts all objects/datum from lists s1 and s2.
     * 
     * @param s1 - The first SorterList<T>
     * @param s2 - The second SorterList<T>
     */
    public SortedList(SortedList<T> s1, SortedList<T> s2) {
        
        // Preconditions
        if (!(s1.size() > 0 && s2.size() > 0)) {
            //System.out.println("The lists s1 and s2 were empty? This could be a problem.");
            this.head = null;
            this.size = 0;
            return;
        }
        
        // Add data from s1 and s2, such that the new list is sorted.
        Node s1Node = s1.head;
        Node s2Node = s2.head;
        
        this.head = new Node(null, null);
        Node newListNode = this.head;
        
        int i = 0;
        while (s1Node != null || s2Node != null) {
            // Case 1: s1Node is null
            if (s1Node == null) {
                newListNode.next = new Node(s2Node.data, null);
                newListNode = newListNode.next;
                s2Node = s2Node.next;
                
            } 
            // Case 2: s2Node is null
            else if (s2Node == null) {
                newListNode.next = new Node(s1Node.data, null);
                newListNode = newListNode.next;
                s1Node = s1Node.next;
                
            } 
            // Case 3: s1Node.data <= s2Node.data
            else if (s1Node.data.compareTo(s2Node.data) <= 0) {
                if (i == 0) {
                    newListNode.data = s1Node.data;
                } else {
                    newListNode.next = new Node(s1Node.data, null);
                    newListNode = newListNode.next;
                }
                
                s1Node = s1Node.next;
                
            } 
            // Case 1: s1Node.data > s2Node.data
            else if (s1Node.data.compareTo(s2Node.data) > 0) {
                if (i == 0) {
                    newListNode.data = s2Node.data;
                } else {
                    newListNode.next = new Node(s2Node.data, null);
                    newListNode = newListNode.next;
                }
                
                s2Node = s2Node.next;
                
            }
            
            i++;
        }
    }

    /**
     * Insert {@code item} into the list so the list remains sorted. <br><br>
     *      The list can contain duplicate items.
     *      
     * @param item - Object to be stored.
     */
    public void insert(T item) {
        // Create Temporary Node References.
        Node position = this.head;
        Node prevPosition = null;
        
        // Case 1: Size <= 0
        if (size() <= 0) {
            //System.out.println("Item Inserted + Head Added.");
            
            this.head = new Node(item, position);
            this.size++;
        }
        
        // Case 2: Size > 0
        else {
            // Find the position that keeps this list properly sorted.
            while (position != null) {
                
                // Compare items/datum.
                //System.out.println("CompareTo: "+item.compareTo(position.data));
                if (item.compareTo(position.data) <= 0) {
                    // Insert Item into the list.
                    Node newNode = new Node(item, position);
                    
                    if (prevPosition != null) {
                        prevPosition.next = newNode;
                    }
                    if (position == this.head) {
                        this.head = newNode;
                    }
                    
                    //System.out.println("Item Inserted.");
                    
                    this.size++;
                    break;
                }
                
                if (position.next == null) {
                    // Insert Item into the list.
                    position.next = new Node(item, null);
                    this.size++;
                    break;
                }
                
                // Goto the next node in the list.
                prevPosition = position;
                position = position.next;
            }
        }
    }

    /**
     * Remove all occurrences of {@code item} from the list.
     * 
     * @param item - Objects that will be removed.
     */
    public void remove(T item) {
        
        // Create Temporary Node References.
        Node position = this.head;
        Node prevPosition = null;
        
        // Find all occurrences of "item" and remove them.
        while (position != null) {
            if (item.equals(position.data)) {
                if (prevPosition != null) {
                    prevPosition.next = position.next;
                    position.next = null;
                    position = prevPosition;
                    this.size--;
                    //System.out.println("removed");
                }
                else { // prevPosition == null
                    this.head = position.next;
                    position.next = null;
                    position = this.head;
                    this.size--;
                    //System.out.println("removed");
                    continue;
                }
            }
            
            // Goto the next node in the list.
            prevPosition = position;
            position = position.next;
        }
    }

    /**
     * Return the number of times {@code item} is found on the list.
     * 
     * @param item - Objects of type {@code T} to find.
     * @return Return the number of times {@code item} is found on the list.
     */
    public int find(T item) {
        
        // Create Temporary Node References.
        Node position = this.head;
        
        // Find all occurrences of "item" and count them.
        int amount = 0;     // Amount Counter
        while (position != null) {
            if (item.equals(position.data) || item.compareTo(position.data) == 0) {
                amount++;
            }
            
            // Goto the next node in the list.
            position = position.next;
        }
        
        return amount;
    }

    /**
     * Get the object stored at a particular {@code index}.
     * 
     * @param index - location of stored object.
     * @return Object of type {@code T} stored at a particular index.
     */
    private T get(int index) {
        
        if (index < 0 || index >= this.size()) {
            throw new IndexOutOfBoundsException("Exception: Index out of bounds.");
        }
        
        // Create Temporary Node References.
        Node position = this.head;
        
        // Find the position that keeps this list properly sorted.
        int i = 0;
        while (i < index && position != null && position.next != null) {
            i++;
            position = position.next;
        }
        
        //System.out.println("get(): Returned " + position.data);
        
        // Return the data at the given index.
        return position.data;
    }
    
    /**
     * Returns the number of {@code items}/elements in this list.
     * 
     * @return Number of {@code items}/elements.
     */
    public int size() {
        return this.size;
    }

    /**
     * Return a string representation of the list. <br>
     *      <b>Example string</b>: [2,3,7,10,50,107]
     */
    public String toString() {
        
        // Create the initial string representation of the list.
        String str = "";
        
        // Create Temporary Node References.
        Node position = this.head;
        
        // Take each element from the list and concatenate it to the string.
        str = str + "[";
        while (position != null) {
            
            if (position.next != null) {
                str = str + position.data + ",";
            } else {
                str = str + position.data;
            }
            
            //System.out.println("Data: " + position.data);
            position = position.next;
        }
        str = str + "]";
        
        // Return the string.
        return str;
    }
}