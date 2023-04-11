

////////////////////////////////////////////////////////////////////
/**
 * This class file is a Custom String Object.
 * <br>
 * <br>File Name:		CustomStringTester.java
 * <br>Created by: 		Jimmy Vang
 * <br>Date Created:		Jan 10, 2016 (10/20/2016)
 * <br>
 * 
 * @version 0.1
 * @author 003011320 (Jimmy Vang)
 */
public class CustomString {
	
	//*** INSTANCE VARIABLES ***
	private char[] values = new char[DEFAULT_CAPACITY];
	private int size = 0;
	private int capacity = DEFAULT_CAPACITY;
	
	//*** DEFAULT CLASS VARIABLES ***
	static final int DEFAULT_CAPACITY = 10;
	
	//*** CONSTRUCTORS ***
	/**
	 * Initializes a newly created CustomString object so it represents an empty character sequence.
	 * 
	 * <br>Precondition: 
	 * 	<li> None
	 * <br>
	 * <br> Postcondition: 
	 * 	<li> size is initialized to zero
	 * 	<li> capacity is initialized to DEFAULT_CAP
	 * 	<li> values array is initialized to capacity
	 */
	public CustomString() {
		// Setup CustomString.
		values		= new char[DEFAULT_CAPACITY];
		size		= 0;
		capacity	= DEFAULT_CAPACITY;
	}
	
	/**
	 * Initializes a newly created CustomString object so it represents the passed in values.
	 * 
	 * <br> 
	 * <br> Preconditions: 
	 * 	<li> values array must be initialized with values
	 * 	<li> values array is full of characters. That is, all indexes contain a char value
	 * 	<li> if the passed in array is null, uninitialized, or empty, alert the user and exit
	 * <br>
	 * <br> Postcondition: 
	 * 	<li> size is initialized to the number of chars passed in
	 * 	<li> capacity is initialized to size + DEFAULT_CAP
	 * 	<li> values array is initialized to contain all the values found in the passed in array
	 * 	<li> don't forget to size your values array to include the capacity discussed above
	 * 
	 * @param values - an initialized array of character values
	 */
	public CustomString(char[] values) {
		// Check pre-conditions.
		if(values == null) {
			String msg = "\"CustomString\" - Error: Values must not be null or empty.";
			System.out.println(msg);
			System.exit(0);
		}
		
		// Setup CustomString.
		size		= values.length;
		capacity	= size + DEFAULT_CAPACITY;
		this.values = new char [capacity];
		
		for(int i = 0; i < this.getSize(); i++) {
			values[i] = this.values[i];
		}
	}
	
	//*** METHODS ***
	/**
	 * Returns the number of chars in this CustomString.
	 * @return {@code size} - the number of chars in this CustomString object
	 */
	public int getSize() {
		return this.size;
	}
	
	/**
	 * Returns the capacity of this CustomString.
	 * @return {@code capacity} - the capacity of this CustomString
	 */
	public int getCapacity() {
		return this.capacity;
	}
	
	/**
	 * Appends the values in char[] values to the end of this CustomString.
	 * 
	 * <br> 
	 * <br> Preconditions: 
	 * 	<li> If passed in array is null or empty, 
	 * 			an error message is displayed to the user, and this CustomString is unchanged
	 * <br>
	 * <br> Postcondition: 
	 * 	<li> The values in the passed in array are added to the end of this CustomString
	 * 	<li> This CustomString's values array is resized if needed to accommodate the new values.
	 * 	<li> If this CustomString's values array requires resizing, the new capacity should be the 
	 * 			new size + DEFAULT_CAP.
	
	 * @param values - a char arrays with values to be appended
	 */
	public void append(char[] values) {
		// Check pre-conditions.
		if(values == null) {
			String msg = "\"append\" - Error: Values must not be null.";
			System.out.println(msg);
			System.exit(0);
		}
		
		// Resize the array if needed.
		if (values.length + this.getSize() > this.getCapacity()) {
			this.resize(this.getCapacity() + DEFAULT_CAPACITY);
		}
		
		// Append "values" to the new location.
		int currentSize = this.getSize();
		for(int i = this.getSize(); i < currentSize + values.length; i++) {
			this.values[i] = values[i - this.getSize()];
			this.size++;
			//System.out.println((i+1) + ": append");
		}
		
	}

	/**
	 * Returns the number of characters in the Custom String.
	 * 
	 * <br>
	 * <br>Precondition: 
	 * 	<li> none
	 * <br>
	 * <br> Postcondition: 
	 * 	<li> number of characters returned
	 * 
	 * @return the length of the CustomString
	 */
	public int length() {
		return this.getSize();
	}
	
	/**
	 * Returns true if the CustomString does not contain characters; otherwise, false. 
	 * @return {@code true} if the CustomString does not contain any characters; otherwise, {@code false}.
	 */
	public boolean isEmpty() {
		return this.getSize() <= 0;
	}
	
	/**
	 * Returns the char value at the specified index. An index ranges from 0 to length() - 1. 
	 * The first char value of the sequence is at index 0, the next at index 1, and so on, as for array indexing. 
	 * 
	 * <br> 
	 * <br> Precondition: 
	 * 	<li> Values are populated in the CustomString
	 * 	<li> Alert the user and return a null character (the integer 0) if CustomString is empty
	 * 	<li> Alert the user and return a null character (the integer 0) if index is out of bounds (range)
	 * <br> 
	 * <br> Postcondition: 
	 * 	<li> The character at the specified index is returned
	 * 
	 * @param index the location of the char to return
	 * @return the char value at the specified index of this string. 
	 * The first char value is at index 0.
	 */
	public char charAt(int index) {
		// Check if the 'CustomString' values are populated. (is 'CustomString' empty?).
		if (this.isEmpty()) {
			String msg = "\"charAt\" - Error: Values are not populated.";
			System.out.println(msg);
			return 0;
		}
		// Check if the inputed index is out of range.
		if (index < 0 || index >= this.getSize()) {
			String msg = "\"charAt\" - Error: Index is out of range.";
			System.out.println(msg);
			return 0;
		}
		
		// If the above are not true, Return the character at the specified INDEX.
		return values[index];
	}
	
	/**
	 * Copies characters from this string into the destination character array.
	 * 
	 * <br>
	 * <br> Pre-conditions: 
	 * 	<ul> A useful error message is displayed, char[] dst is reinitialized to an empty char array, 
	 * and processing within the method should be aborted, 
	 * if any of the following error conditions occur: 
	 * 	<p>
	 * 	<li> srcBegin is negative
	 * 	<li> srcBegin is greater than srcEnd
	 * 	<li> srcEnd is greater than the length of this string
	 * 	<li> dstBegin is negative
	 * 	<li> dstBegin+(srcEnd-srcBegin) is greater than dst.length
	 *  </p>
	 * 	</ul>
	 * 
	 * <br> Postcondition: 
	 * 	<li> char[] dst is returned populated with the appropriate values
	 * 
	 * @param srcBegin
	 * @param srcEnd
	 * @param dst
	 * @param dstBegin
	 */
	public void getChars(int srcBegin, int srcEnd, char[] dst, int dstBegin) {
		// Is the beginning source negative?
		// This prevents INDEX OUT OF BOUNDS errors.
		if(srcBegin <= -1) {
			String msg = "\"getChars\" - Error: srcBegin is negative";
			System.out.println(msg);
			return;
		} 
		// Is the beginning source greater than the ending source?
		// This prevents INDEX OUT OF BOUNDS errors.
		if(srcBegin > srcEnd) {
			String msg = "\"getChars\" - Error: srcBegin is greater than srcEnd";
			System.out.println(msg);
			return;
		}
		// Is the ending source greater than the length of 'CustomString'?
		// This prevents INDEX OUT OF BOUNDS errors.
		if(srcEnd > this.getSize()) {
			String msg = "\"getChars\" - Error: srcEnd is greater than the length of this string";
			System.out.println(msg);
			return;
		}
		// Is the beginning destination negative?
		// This prevents INDEX OUT OF BOUNDS errors.
		if(dstBegin <= -1) {
			String msg = "\"getChars\" - Error: dstBegin is negative";
			System.out.println(msg);
			return;
		} 
		// Is "dstBegin+(srcEnd-srcBegin)" greater than the destination length?
		// This prevents the dst array from throwing INDEX OUT OF BOUNDS errors.
		if(dstBegin + (srcEnd-srcBegin) > dst.length) {
			String msg = "\"getChars\" - Error: dstBegin+(srcEnd-srcBegin) is greater than dst.length";
			System.out.println(msg);
			return;
		}
		
		// Copy the source string (this string) to the destination string.
		for(int i = 0; i <= srcEnd; i++)
			dst[dstBegin + i] = this.values[srcBegin + i];
	}
	
	/**
	 * Compares this string to the specified object. The result is true if and only if the argument 
	 * 	is not null and is a CustomString object that represents the same sequence of characters as 
	 * 	this object. 
	 * 
	 * <br> 
	 * <br> Precondition: 
	 * 	<li> false is returned if anObject is null
	 * 	<li> false should be returned if anObject cannot be cast to a CustomString object
	 * 	<li> comparison is a character-by-character case-sensitive check
	 * <br> 
	 * <br> Postcondition: 
	 * 	<li> The result is true if and only if the argument is not null and is a CustomString object 
	 * 			that represents the same sequence of characters as this object.
	 * 
	 * @param anObject - anObject should be a CustomString object
	 * @return {@code true} if the given object represents a CustomString equivalent to this CustomString, 
	 * {@code false} otherwise.
	 */
	public boolean equals(Object anObject) {
		// Check if anObject is null.
		if (anObject.equals(null)) {
			String msg = "\"equals\" - Error: 'anObject' cannot be null.";
			System.out.println(msg);
			return false;
		}
		// Check if anObject can NOT be casted to CustomString.
		else if (!(anObject instanceof CustomString)) {
			String msg = "\"equals\" - Error: 'anObject' cannot be casted to CustomString.";
			System.out.println(msg);
			return false;
		}
		else {
			// Check if 'CustomString' is equal to 'anObject'.
			return this.toCharArray() == ((CustomString)anObject).toCharArray();
		}
	}
	
	/**
	 * Compares this CustomString to another String, ignoring case considerations The strings are considered equal ignoring case 
	 * if they are of the same length and corresponding characters in the two strings are equal ignoring case. 
	 * 
	 * <br>
	 * <br> Precondition: 
	 * 	<li> false is returned if string is null
	 * 	<li> comparison is a character-by-character case-insensitive check
	 * <br> 
	 * <br> Postcondition: 
	 * 	<li> The result is true if and only if the argument is not null and is a string object that represents the same sequence of case-insensitive characters as this object.
	 * 
	 * @param anotherString
	 * @return {@code true} if the argument is not null and it represents an equivalent string ignoring case; {@code false} otherwise
	 */
	public boolean equalsIgnoreCase(java.lang.String anotherString) {
		// Check if anotherString is null.
		if (anotherString.equals(null)) {
			String msg = "\"equals\" - Error: 'anotherString' cannot be null.";
			System.out.println(msg);
			return false;
		}
		else {
			// Get string values and set them all to upper-case.
			String customString = String.valueOf(this.values).toUpperCase();
			anotherString = anotherString.toUpperCase();
			
			// Return true if both strings are equal.
			return customString == anotherString;
		}
	}
	
	/**
	 * Compares this CustomString to another CustomString, ignoring case considerations Two CustomStrings are considered equal ignoring case 
	 * if they are of the same length and corresponding characters in the two CustomStrings are equal ignoring case. 
	 * 
	 * <br>
	 * <br> Precondition: 
	 * 	<li> false is returned if anotherCString is null
	 * 	<li> comparison is a character-by-character case-insensitive check
	 * <br>
	 * <br> Postcondition: 
	 * 	<li> The result is true if and only if the argument is not null and is a CustomString object that represents the same sequence of 
	 * case-insensitive characters as this object.
	 * 
	 * @param anotherCString - anotherCString should be a CustomString object to compare against.
	 * @return {@code true} if the argument is not null and it represents an equivalent CustomString ignoring case; {@code false} otherwise
	 */
	public boolean equalsIgnoreCase(CustomString anotherCString) {
		// Check if anotherString is null.
		if (anotherCString.equals(null)) {
			String msg = "\"equals\" - Error: 'anotherString' cannot be null.";
			System.out.println(msg);
			return false;
		}
		else {
			// Get string values and set them all to upper-case.
			String customString = String.valueOf(this.values).toUpperCase();
			String tempCustomString = anotherCString.toString().toUpperCase();
			
			// Return true if both strings are equal.
			return customString == tempCustomString;
		}
	}
	
	/**
	 * Compares this CustomString to another CustomString lexicographically. 
	 * <br> 
	 * <br> Precondition: 
	 * 	<li> 1 is returned if anotherCString is null
	 * 
	 * <br> 
	 * <br> Postcondition: 
	 * 	<li> 0 is returned if the two CustomStrings are equivalent. For example, 'ABC' == 'ABC'
	 * 	<li> -1 is returned if this CustomString is less than anotherCString. For example, 'ABC' < 'XYZ'
	 * 	<li> -1 is returned if this CustomString is less than anotherCString. For example, 'ABC' < 'abc'
	 * 	<li> -1 is returned if this CustomString is less than anotherCString. For example, 'ABC' < 'ABCD'
	 * 	<li> 1 is returned if this CustomString is greater than anotherCString. For example, the converse of the above examples.
	 * 
	 * @param anotherCString - anotherCString should be a CustomString object to compare against.
	 * 
	 * @return the value 0 if the argument string is equal to this string; 
	 * -1 if this string is lexicographically less than the string argument; 
	 * 1 if this string is lexicographically greater than the string argument.
	 * 
	 */
	public int compareTo(CustomString anotherCString) {
		// Return 1, if anotherCString is null.
		if (anotherCString.equals(null))
			return 1;
		
		// Return 0, if the two CustomStrings are equivalent.
		if (this.equals(anotherCString))
			return 0;
		
		// Return -1, if this CustomString is less than anotherCString lexicographically.
		// Return 1, if this CustomString is greater than anotherCString lexicographically.
		return this.toString().compareTo(anotherCString.toString());
	}
	
	/**
	 * Tests if this string starts with the specified prefix. 
	 * 
	 * <br>
	 * <br> Precondition: 
	 * 	<li> Return an error message and return false if prefix is null or longer than this CustomString
	 * 
	 * @param prefix - the prefix
	 * 
	 * @return {@code true} if the character sequence represented by the argument is a prefix of the character sequence represented by 
	 * this CustomString; {@code false} otherwise.
	 */
	public boolean startsWith(CustomString prefix) {
		// Check if prefix is null.
		if (prefix.equals(null)) {
			String msg = "\"startsWith\" - Error: 'prefix' cannot be null.";
			System.out.println(msg);
			return false;
		}
		// Check is prefix is longer than CustomString.
		if (prefix.length() > this.getSize()) {
			String msg = "\"startsWith\" - Error: 'prefix' cannot be longer than the 'CustomString'.";
			System.out.println(msg);
			return false;
		}
		
		// Check prefix of this "CustomString".
		if (this.substring(0, prefix.length() - 1).equals(prefix)) {
			return true;
		}
		
		return false;
	}
	
	/**
	 * Tests if this string ends with the specified suffix. 
	 * 
	 * <br>
	 * <br> Precondition: 
	 * 	<li> Return an error message and return false if suffix is null or longer than this CustomString
	 * 
	 * @param suffix - the suffix
	 * 
	 * @return {@code true} if the character sequence represented by the argument is a suffix of the character sequence represented by 
	 * this object; {@code false} otherwise.
	 */
	public boolean endsWith(CustomString suffix) {
		// Check if suffix is null.
		if (suffix.equals(null)) {
			String msg = "\"startsWith\" - Error: 'prefix' cannot be null.";
			System.out.println(msg);
			return false;
		}
		// Check is suffix is longer than CustomString.
		if (suffix.length() > this.getSize()) {
			String msg = "\"startsWith\" - Error: 'prefix' cannot be longer than the 'CustomString'.";
			System.out.println(msg);
			return false;
		}
		
		// Check suffix of this "CustomString".
		if (this.substring(suffix.length() - 1, this.length() - 1).equals(suffix)) {
			return true;
		}
		
		return false;
	}
	
	/**
	 * Returns the index within this CustomString of the first occurrence of the specified character. 
	 * 
	 * @param c - a character
	 * 
	 * @return the index of the first occurrence of the character in the character sequence represented by this object, 
	 * or -1 if the character does not occur.
	 */
	public int indexOf(char c) {
		// Return correct Index, if the character 'c' occurs.
		for (int i = 0; i < this.getSize(); i++) {
			if (this.charAt(i) == c) {
				return i;
			}
		}
		
		// Return -1, if the character 'c' does not occur.
		return -1;
	}
	
	/**
	 * Returns the index within this CustomString of the first occurrence of the specified character. 
	 * Recall, characters can be represented with integers also. For example, 'A' == 65 and 'a' == 97 
	 * 
	 * @param c - a character
	 * 
	 * @return the index of the first occurrence of the character in the character sequence represented by this object, 
	 * or -1 if the character does not occur.
	 */
	public int indexOf(int c) {
		// Return correct Index, if the character 'c' occurs.
		for (int i = 0; i < this.getSize(); i++) {
			if ((int)this.charAt(i) == c) {
				return i;
			}
		}
		
		// Return -1, if the character 'c' does not occur.
		return -1;
	}
	
	/**
	 * Returns the index within this CustomString of the first occurrence of the specified CustomString. 
	 * <br> 
	 * <br> For example... 
	 * <br> this = "hamburger", anotherCString = "burg", returns 3 
	 * <br> this = "Mississippi", anotherCString = "iss", returns 1 
	 * <br> this = "Mississippi", anotherCString = "ipp", returns 7 
	 * 
	 * <br> 
	 * <br> Precondition: 
	 * 	<li> Alert the user and return -1 if this CustomString is smaller then anotherCString.
	 * 
	 * @param anotherCString - the CustomString to search for in this CustomString
	 * 
	 * @return the index of the first occurrence of anotherCString in the character sequence represented by this object, 
	 * or -1 if the character does not occur.
	 */
	public int indexOf(CustomString anotherCString) {
		// Alert user and return -1, if this CustomString is smaller then anotherCString.
		if (this.length() < anotherCString.length()) {
			String msg = "\"indexOf\" - Error: 'CustomString' is smaller then 'anotherCString'.";
			System.out.println(msg);
			return -1;
		}
		
		// Return correct Index, if the character 'c' occurs.
		for (int i = 0; i < this.getSize(); i++) {
			// Check with (substring.equals >>> anotherCString).
			if (this.substring(i, anotherCString.length()).equals(anotherCString)) {
				// Return correct index.
				return i;
			}
		}
		
		// Return -1, if the character 'c' does not occur.
		return -1;
	}
	
	/**
	 * Returns a new CustomString that is a substring of this CustomString. 
	 * The substring begins with the character at the specified index and extends to the end of this string. 
	 * 
	 * <br> 
	 * <br> For example... 
	 * <br> "hamburger" -- substring(4, 8) returns "urge" 
	 * <br> "smiles" -- substring(1, 5) returns "mile" 
	 * 
	 * <br> 
	 * <br> Precondition: 
	 * 	<li> If beginIndex or endIndex are out of range, alter the user and return null./
	 * 
	 * @param beginIndex - the beginning index, inclusive.
	 * @param endIndex - the ending index, exclusive.
	 * 
	 * @return the specified substring
	 */
	public CustomString substring(int beginIndex, int endIndex) {
		
		CustomString substring = new CustomString();
		
		// Copy whitespaces to tempCharArr.
		char[] tempCharArr = new char[1 + (endIndex - beginIndex)];
		for (int i : tempCharArr) {
			tempCharArr[i] = ' ';
		}
		
		// Copy exact indexes.
		for (int i = beginIndex; i < endIndex; i++) {
			tempCharArr[i] = this.values[i];
		}
		
		// Trim whitespaces.
		String temp = String.valueOf(tempCharArr);
		temp = temp.trim();
		
		// Append temp as a char array into the substring.
		substring.append(temp.toCharArray());
		
		// Return the substring.
		return substring;
	}
	
	/**
	 * Returns a new CustomString resulting from replacing all occurrences of oldChar in this string with newChar. 
	 * Note, this CustomString remains unaltered. 
	 * 
	 * <br>
	 * <br> Precondition: 
	 * 	<li> If oldChar does not exist in this CustomString, return this CustomString as is./
	 * 
	 * <br>
	 * <br> Postcondition: 
	 * 	<li> Returns a new string resulting from replacing all occurrences of oldChar in this string with newChar.
	 * 
	 * @param oldChar - the old character
	 * @param newChar - the new character
	 * @return returns a new CustomString resulting from replacing all occurrences of oldChar in this string with newChar.
	 */
	public CustomString replace(char oldChar, char newChar) {
		// Create temporary custom string.
		CustomString customStr = new CustomString(this.values);
		
		// Replace all occurrences of oldChar with newChar.
		for (int i = 0; i < customStr.getSize(); i++) {
			if (customStr.charAt(i) == oldChar) {
				customStr.values[i] = newChar;
			}
		}
		
		// Return the new 'CustomString'.
		return customStr;
	}
	
	/**
	 * Returns a new CustomString resulting from replacing all occurrences of target in this string with replacement. 
	 * Note, this CustomString remains unaltered. 
	 * <br> 
	 * <br> For example... 
	 * <br> this = "bug", target = "u", replacement = "i", result = "big" 
	 * <br> this = "The dog chased the dog", target = "dog", replacement = "cat", result = "The cat chased the cat" 
	 * <br> this = "The dog chased the dog", target = "dog", replacement = "ox", result = "The ox chased the ox" 
	 * <br> this = "The dog chased the dog", target = "dog", replacement = "elephant", result = "The elephant chased the elephant" 
	 * <br> 
	 * <br> Hint: Work on this one last and utilize many of the methods you have already created. 
	 * 
	 * <br> 
	 * <br> Postcondition: 
	 * 	<li> Returns a new CustomString resulting from replacing all occurrences of target in this string with replacement.
	 * 
	 * @param target - the old string sequence
	 * @param replacement - the new string sequence
	 * 
	 * @return returns a new CustomString resulting from replacing all occurrences of target in this string with replacement.
	 */
	public CustomString replace(CustomString target, CustomString replacement) {
		// Create temporary custom string.
		CustomString customStr = new CustomString(this.values);
		
		// Replace all occurrences of oldChar with newChar.
		for (int i = 0; i < customStr.getSize() - target.length(); i++) {
			if (customStr.substring(i, i + target.length() - 1).equals(target)) {
				for (int n = i; n < replacement.length(); n++) {
					customStr.values[n] = replacement.values[n];
				}
			}
		}
		
		// Return the new 'CustomString'.
		return customStr;
	}
	
	/**
	 * Resizes CustomString's built in values array to accommodate holding additional chars. 
	 * 
	 * <br>
	 * <br> Precondition: 
	 * 	<li> If the new capacity if not larger than the old, alert the user and exit.
	 * 
	 * <br> Postcondition: 
	 * 	<li> CustomString's values array is increased in capacity the new capacity.
	 * 	<li> CustomString's size, capacity, and current values are preserved and updated as needed during the resize.
	 * <br> 
	 * @param newCap - the new larger capacity
	 */
	public void resize(int newCap) {
		// Check if the new capacity is NOT larger than the old capacity. 
		//
		// 		NOT(new > old)
		//			OR
		// 		(new <= old)
		///////////////////////////////////////////////////////////////////
		if (newCap <= this.capacity) {
			String msg = "\"resize\" - Error: Cannot Resize the current 'CustomString'. (The new capacity must be greater than the old capacity.)";
			System.out.println(msg);
			System.exit(0);
		}
		
		// Resize the CustomString's char array.
		char[] resizedCharArray = new char[newCap];
		//System.out.println("resized() - new size: " + resizedCharArray.length);
		
		// Copy "CustomString" values into "resizedCharArray".
		for (int i = 0; i < this.getSize(); i++) {
			resizedCharArray[i] = this.values[i];
		}
		
		// Set new memory address location for values to "resizedCharArray".
		this.values = resizedCharArray;
		
	}
	
	/**
	 * Returns true if and only if this CustomString contains the sequence of characters found in another CustomString. 
	 * 
	 * <br> 
	 * <br> Precondition: 
	 * 	<li> Alert the user and return false if this CustomString is smaller then anotherCString.
	 * 
	 * @param anotherCString - the other CustomString to search for
	 * 
	 * @return returns {@code true} if and only if this CustomString contains the sequence of characters found in another CustomString.
	 */
	public boolean contains(CustomString anotherCString) {
		// Alert the user and return false, if this CustomString is smaller then anotherCString.
		if (this.length() < anotherCString.length()) {
			String msg = "\"contains\" - Error: 'CustomString' is smaller than 'anotherCString'.";
			System.out.println(msg);
			return false;
		}
		
		// Search for sequence of characters. Return true if substring is found.
		boolean check = false;
		for (int i = 0; i < this.getSize() - anotherCString.length(); i++) {
			if (this.substring(i, i + anotherCString.length()).equals(anotherCString)) {
				check = true;
			}
		}
		return check;
	}
	
	/**
	 * Converts all of the characters in this String to upper case. A new CustomString is returned and this CustomString remains unaltered.
	 * 
	 * @return returns a new CustomString with all character converted to upper case.
	 */
	public CustomString toUpperCase() {
		// Get all characters.
		for (int i = 0; i < this.getSize(); i++) {
			// Convert characters to upper-case.
			this.values[i] = Character.toUpperCase(this.values[i]);
		}
		
		// Create new "CustomString" and return it.
		CustomString customStr = new CustomString(this.values);
		return customStr;
	}
	
	/**
	 * Returns a String representation of this CustomString.
	 * 
	 * @return returns a String representation of this CustomString.
	 */
	public java.lang.String toString() {
		// Return String representation of this CustomString.
		return String.valueOf(this.values);
	}
	
	/**
	 * Converts this CustomString to a new character array. Note, the returned array's length() should equal this CustomString's size. 
	 * That is, all indices in the returned array should hold characters.
	 * 
	 * <br>
	 * <br> Postcondition: 
	 * 	<li> An empty array is returned if this CustomString is empty
	 * 	<li> Returns an array of characters. Values should not be returned directly, as it may contain empty indices.
	 * 
	 * @return returns an array of characters.
	 */
	public char[] toCharArray() {
		// Create new char array.
		char[] newCharArr = this.values;
		
		// Return the array of characters.
		return newCharArr;
	}
	
}
