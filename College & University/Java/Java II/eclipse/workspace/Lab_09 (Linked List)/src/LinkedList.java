import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public class LinkedList<E> implements List<E>{
	
	private ListNode<E> head;
	private int size;
	
	public LinkedList() {
		this.head = null;
	}

	@Override
	public boolean add(E e) {
		
		// Check and throw exceptions.
		if (e.equals(null)) {
			throw new NullPointerException("The element is null: " + e);
		}
		
		// Do size checks. (These checks, helps set up the nextNode and previousNodes correctly.)
		if(size() == 0) {
			// Append a new node if list is empty.
			head = new ListNode<E>(e, head, head);
			
			// Increment size counter.
			size++;
			return true;
		}
		else if(size() > 0) { 
			
			// Track which current node we are at, locally in this method.
			ListNode<E> currentNode = head;
			
			// Iterate through each node to find the tail node.
			while(currentNode.nextNode != null && currentNode.nextNode != head) {
				currentNode = currentNode.nextNode;
			}
			
			/////////////////////////////////////////////////////////////
			// Append a new ListNode<E> object at the tail of the list. 
			// Also connect the previous, current and next nodes properly in the new ListNode<E>.
			currentNode.nextNode = new ListNode<E>(e, currentNode, head);
			
			// Update head's previous node to attach to tail.
			head.previousNode = currentNode.nextNode;
			
			// Increment size counter.
			size++;
			return true;
		}
		
		return false;
	}
	
	@Override
	public void add(int index, E element) {

		// Check if head is empty/null.
		if (head == null) {
			return;
		}
		
		// Check for out of bounds.
		if (index < 0 || index >= size()) {
			throw new IndexOutOfBoundsException("The index is out of range. (index < 0 || index >= size()) " + index);
		}
		
		// Check for null element
		if (element.equals(null)) {
			throw new NullPointerException("The element is null. " + element);
		}
		
		// Do size checks. (These checks, helps set up the nextNode and previousNodes correctly.)
		if(size() == 0) {
			// Append a new node if list is empty.
			add(element);
		}
		else if(size() > 0) { 
			
			// Track Current node.
			ListNode<E> currentNode = head;
			
			// Iterate through each node and find the node at index.
			int i = 0;
			while(i < index && currentNode.nextNode != null && currentNode.nextNode != head) {
				//System.out.println("STUCK");
				
				// Iterate to the nextNode of current node.
				currentNode = currentNode.nextNode;
				i++;
			}
			
			/////////////////////////////////////////////////////////////
			// Case 1: Index == 0. (Change "head" reference)
			if (index == 0) {

				// Append a new ListNode<E> object at index.
				// Also connect the previous, current and next nodes properly in the new ListNode<E>.
				ListNode<E> newNode = new ListNode<E>(element, null, null);
				
				// Update the other nodes.
				newNode.nextNode = currentNode;
				newNode.previousNode = null;
				currentNode.previousNode = newNode;
				
				// Change head reference.
				head = newNode;
				
				// Increment size counter.
				size++;
			}
			
			// Case 2: Index > 0. (Perform normally.)
			else if (index > 0) {
				//System.out.println("Case 2: " + element);
				
				// Append a new ListNode<E> object at index.
				// Also connect the previous, current and next nodes properly in the new ListNode<E>.
				ListNode<E> newNode = new ListNode<E>(element, null, null);
				
				// Update the other nodes.
				newNode.nextNode = currentNode;
				newNode.previousNode = currentNode.previousNode;
				newNode.previousNode.nextNode = newNode;
				currentNode.previousNode = newNode;
				
				// Increment size counter.
				size++;
			}
		}
		
		return;
	}

	@Override
	public boolean addAll(Collection<? extends E> c) {
		throw new UnsupportedOperationException();
	}

	@Override
	public boolean addAll(int index, Collection<? extends E> c) {
		throw new UnsupportedOperationException();
	}

	@Override
	public void clear() {
		this.head = null;
		this.size = 0;
	}

	@Override
	public boolean contains(Object o) {

		// Check head if it is empty/null already.
		if (head == null) {
			return false;
		}
		
		// Check Object o for null.
		if (o == null) {
			throw new NullPointerException("Null object found in parameter: " + o);
		}
		
		// Track which current node we are at, locally in this method.
		ListNode<E> currentNode = head;
		currentNode.nextNode = head.nextNode;
		currentNode.previousNode = head.previousNode;
		
		// Iterate through each node to find the data value Object o.
		do {
			try {
				// Create temporary Data objects.
				E previousData = null;
				E currentData = null;
				E nextData = null;
				
				// Check if NODES for null values.
				// Set the data values if the nodes are not nulls.
				if(currentNode.previousNode != null)
					previousData = currentNode.previousNode.data;
				if(currentNode != null)
					currentData = currentNode.data;
				if(currentNode.nextNode != null)
					nextData = currentNode.nextNode.data;
				
				// Compare the data values with the "Object o" data value.
				if(((E)o).equals(previousData) || ((E)o).equals(currentData) || ((E)o).equals(nextData)) 
				{
					// Return true, when the "Object o" data is found in the list.
					return true;
				}
				
			// Catch casting exceptions.
			} catch (ClassCastException e) {
				throw new ClassCastException("The type of the specified element being checked, " + o + ", is incompatible with this list.");
			}
			
			// Iterate to the next node if Object o is not found yet.
			currentNode = currentNode.nextNode;
			
		} while(currentNode != null && currentNode.nextNode != null && currentNode.nextNode != head);
		
		return false;
	}

	@Override
	public boolean containsAll(Collection<?> c) {
		throw new UnsupportedOperationException();
	}

	@Override
	public E get(int index) {

		// Check if head is empty/null.
		if (head == null) {
			return null;
		}
		
		// Check for out of bounds.
		if (index < 0 || index >= size()) {
			throw new IndexOutOfBoundsException("The index is out of range. (index < 0 || index >= size()) " + index);
		}
		
		// Track which current node we are at, locally in this method.
		ListNode<E> currentNode = head;
		
		// Iterate through each node and find the node at index.
		int i = 0;
		while(i < index && currentNode.nextNode != null && currentNode.nextNode != head) {
			currentNode = currentNode.nextNode;
			i++;
		}
		
		return currentNode.data;
	}

	@Override
	public int indexOf(Object o) {

		// Check if head is empty/null.
		if (head == null) {
			return 0;
		}
		
		// Check if o is empty/null.
		if (o == null) {
			throw new NullPointerException("The object o is null. " + o);
		}
		
		// Track which current node we are at, locally in this method.
		ListNode<E> currentNode = head;
		
		// Iterate through each node to find the Object o.
		int i = 0;
		while(currentNode.nextNode != null && currentNode.nextNode != head) {
			// Break loop, if we found the data from Object o.
			if (currentNode.data.equals((E)o)) {
				return i;
			}
			
			// Iterate
			currentNode = currentNode.nextNode;
			i++;
			
			// Break loop, if we found the data from Object o.
			if (currentNode.data.equals((E)o)) {
				return i;
			}
		}
		
		return -1;
	}

	@Override
	public boolean isEmpty() {
		if(this.size() == 0) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public Iterator<E> iterator() {
		throw new UnsupportedOperationException();
		//return null;
	}

	@Override
	public int lastIndexOf(Object o) {

		// Check if head is empty/null.
		if (head == null) {
			return 0;
		}
		
		// Check if o is empty/null.
		if (o == null) {
			throw new NullPointerException("The object o is null. " + o);
		}
		
		// Track which current node we are at, locally in this method.
		ListNode<E> currentNode = head.previousNode;
		
		// Iterate through each node to find the Object o.
		int i = size() - 1;
		while(currentNode.previousNode != null && currentNode.previousNode != head) {
			// Break loop, if we found the data from Object o.
			if (currentNode.data.equals((E)o)) {
				return i;
			}
			
			// Iterate
			currentNode = currentNode.previousNode;
			i--;
			
			// Break loop, if we found the data from Object o.
			if (currentNode.data.equals((E)o)) {
				return i;
			}
		}
		
		return -1;
	}

	@Override
	public ListIterator<E> listIterator() {
		throw new UnsupportedOperationException();
	}

	@Override
	public ListIterator<E> listIterator(int index) {
		throw new UnsupportedOperationException();
	}
	
	@Override
	public boolean remove(Object o) {
		
		// Check if head is empty/null.
		if (head == null) {
			return false;
		}
		
		ListNode<E> currentNode = head;
		ListNode<E> previousNode = head.previousNode;
		ListNode<E> nextNode = head.nextNode;
		
		try {
			
			// Do size checks. (These checks, helps set up the nextNode and previousNodes correctly.)
			if(size() > 1) {
				
				// Iterate through each node to find the Object o.
				while(currentNode.nextNode != null && currentNode.nextNode != head) {
					currentNode = currentNode.nextNode;
					previousNode = currentNode.previousNode;
					nextNode = currentNode.nextNode;
					
					// Break loop, if we found the data from Object o.
					if (currentNode.data.equals((E)o)) {
						break;
					}
				}
				
				// Remove the current node, and reattach previous and next nodes.
				nextNode.previousNode = previousNode;
				previousNode.nextNode = nextNode;
				currentNode = null;
			}
			else if(size() == 1) {
				this.head = null;
			}
			else {
				return false;
			}
			
		} catch (NullPointerException e) {
			System.out.println("Null node found while removing Object o from the list.");
			return true;
		} catch (ClassCastException e) {
			throw new ClassCastException("The type of the specified element being removed is incompatible with this list");
		}
		
		// Decrease size counter.
		size--;
		
		return true;
	}

	@Override
	public E remove(int index) {
		
		// Check if head is already empty/null.
		if (head == null) {
			return null;
		}
		
		// Check for out of bounds
		if (index < 0 || index >= size()) {
			throw new IndexOutOfBoundsException("The index is out of range. (index < 0 || index >= size())");
		}
		
		ListNode<E> currentNode = head;
		ListNode<E> previousNode = head.previousNode;
		ListNode<E> nextNode = head.nextNode;
		
		// Create data to return
		E data = currentNode.data;
		
		// Do size checks. (These checks, helps set up the nextNode and previousNodes correctly.)
		// If size is larger than 1.
		if(size() > 1) {
			// Iterate through each node to find the Object o.
			int i = 0;
			while (i < index && (currentNode.nextNode != null && currentNode.nextNode != head)) {
				currentNode = currentNode.nextNode;
				previousNode = currentNode.previousNode;
				nextNode = currentNode.nextNode;
				
				i++;
			}
			
			// Set data to return.
			data = currentNode.data;
			
			if (currentNode.equals(head)) {
				head = head.nextNode;
			}
			
			// Remove the current node, and reattach previous and next nodes.
			nextNode.previousNode = previousNode;
			previousNode.nextNode = nextNode;
			currentNode = null;
			
		}
		// If size is 1 or less.
		else if(size() == 1) {
			// Remove all nodes by nulling the head.
			data = currentNode.data;	// Set data to return.
			head = null;
		}
		
		// Decrease size counter.
		size--;
		
		// Return data removed.
		return data;
	}

	@Override
	public boolean removeAll(Collection<?> c) {
		throw new UnsupportedOperationException();
	}

	@Override
	public boolean retainAll(Collection<?> c) {
		throw new UnsupportedOperationException();
	}

	@Override
	public E set(int index, E element) {

		// Check if head is empty/null.
		if (head == null) {
			return null;
		}
		
		// Check for out of bounds.
		if (index < 0 || index >= size()) {
			throw new IndexOutOfBoundsException("The index is out of range. (index < 0 || index >= size()) " + index);
		}
		
		// Check for null element
		if (element.equals(null)) {
			throw new NullPointerException("The element is null. " + element);
		}
		
		// Track which current node we are at, locally in this method.
		ListNode<E> currentNode = head;
		
		// Store current data to return.
		E returnData = currentNode.data;
		
		// Iterate through each node and find the node at index.
		int i = 0;
		while(i < index && currentNode.nextNode != null && currentNode.nextNode != head) {
			// Iterate node
			currentNode = currentNode.nextNode;
			
			// Change returnData
			returnData = currentNode.data;
			i++;
		}
		
		// Replace the currentNode's data with the "element".
		currentNode.data = element;
		
		return returnData;
	}

	@Override
	public int size() {
		return this.size;
	}

	@Override
	public List<E> subList(int fromIndex, int toIndex) {
		throw new UnsupportedOperationException();
	}

	@Override
	public Object[] toArray() {
		
		// Create the array.
		Object[] oArr = (new Object[size()]);
		
		// Track which current node we are at, locally in this method.
		ListNode<E> currentNode = head;
		
		// Iterate through each node's data and append them to the array.
		int i = 0;
		while(currentNode.nextNode != null && currentNode.nextNode != head) {
			
			// Append data to array.
			oArr[i] = currentNode.data;
			
			// Goto next node.
			currentNode = currentNode.nextNode;
			i++;
		}
		
		// Append the last node.
		oArr[i] = currentNode.data;
		
		// Return the array.
		return oArr;
	}

	@Override
	public <T> T[] toArray(T[] a) {

		try {
			// Create the array.
			Object[] oArr = (new Object[size()]);
			
			// Track which current node we are at, locally in this method.
			ListNode<E> currentNode = head;
			
			// Iterate through each node's data and append them to the array.
			int i = 0;
			while(currentNode.nextNode != null && currentNode.nextNode != head) {
				
				// Append data to array.
				oArr[i] = currentNode.data;
				
				// Goto next node.
				currentNode = currentNode.nextNode;
				i++;
			}
			
			// Append the last node.
			oArr[i] = currentNode.data;
			
			// Return the array.
			return (T[]) oArr;
			
		} catch (Exception e) {
			throw new ArrayStoreException("An attempt has been made to store the wrong type of object into an array of objects.");
		}
	}
	
	/**
	 * A data structure that has two references, one for the next node and another for the previous node.
	 * <br> Used by the outer class, "LinkedList.java".
	 * 
	 * @param <Type> - Generic Type for data storage. (String, Int, Long, Double, Bool, etc...)
	 */
	private class ListNode<Type> {
		
		private Type data;
		private ListNode<Type> previousNode;
		private ListNode<Type> nextNode;
		
		public ListNode() {
			this(null,null,null);
		}
		
		public ListNode(Type data, ListNode<Type> previousNode, ListNode<Type> nextNode) {
			this.data = data;
			this.nextNode = nextNode;
			this.previousNode = previousNode;
		}
		
	}
	
}
