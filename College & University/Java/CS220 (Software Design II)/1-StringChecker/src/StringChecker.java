

/* StringChecker.java
 *
 * Description (Short): This StringChecker class has a built-in String array called 'basis' and 
 * 							mainly uses it to check on another String called 'word' using built-in methods.
 *
 * Author: Jimmy Vang
 * Derived from: 
 * 		http://cs.uwlax.edu/~jmaraist/220-fall-2017/2017/09/04/cs220-stringchecker-assignment-1/
 * 		http://cs.uwlax.edu/~jmaraist/220-fall-2017/2017/09/05/cs220-stringchecker-assignment-2/
 * 		http://cs.uwlax.edu/~jmaraist/220-fall-2017/2017/09/11/cs220-stringchecker-assignment-3/
 * 		http://cs.uwlax.edu/~jmaraist/220-fall-2017/2017/09/11/cs220-stringchecker-assignment-4/
 * 		http://cs.uwlax.edu/~jmaraist/220-fall-2017/2017/09/11/cs220-stringchecker-assignment-5/
 * 		http://cs.uwlax.edu/~jmaraist/220-fall-2017/cs220-stringchecker-assignment-6/
 * 		http://cs.uwlax.edu/~jmaraist/220-fall-2017/cs220-stringchecker-assignment-7/
 *
 * Description (Long): 	This StringChecker class has a String Array 'basis' and checks it with 'word' 
 * 							using built-in methods. The current methods are documented below via Javadoc.
 * 							
 * 						The methods can:
 * 							- Count the number of substrings or anagrams 
 * 								containing/contained by 'basis'. 
 * 							- Get the String array of substrings or anagrams 
 * 								containing/contained by 'basis'. 
 * 							- Get indices, using an Integer array, of substrings 
 * 								or anagrams containing/contained by 'basis'.
 *
 */


import org.junit.Test;


/**
 * This StringChecker class has a built-in String array called {@code basis} and 
 * 		uses it to check on another String called {@code word}. 
 * 
 * 		<br>
 * 		<br>
 * 		
 * 		StringChecker can currently do the following...
 * 		<ul>
 * 			<li>Check if the String array {@code basis} contains Strings that are prefixes or suffixes 
 * 					of {@code word}.</li>
 * 			<li>Count, get, and get indices of the {@code basis} array's strings containing a substring 
 * 					of {@code word}.</li>
 * 			<li>Count, get, and get indices of the substring of the {@code basis} array's strings 
 * 					contained by {@code word}.</li>
 * 			<li>Count, get, and get indices of the Anagrams contained in the String array {@code basis}
 * 					when {@code basis} is checked with {@code word} for anagrams.</li>
 * 		</ul>
 * @author Jimmy Vang
 */
public class StringChecker implements StringCheckerMethods { 
	
	
	/////////////////////////////
	// Object Fields/Variables //
	/////////////////////////////
	/**
	 * The field variable {@code basis} is a String array, used to check 'word' using StringChecker's methods.
	 */
	final private String[] basis;
	
	//////////////////
	// CONSTRUCTORS //
	//////////////////
	/**	
	 * Creates a new StringChecker instance and initializes it with the passed in String array {@code basis}.
	 * 
	 * @param basis - an array/collection of strings.
	 */
	public StringChecker(final String[] basis) {
		this.basis = basis;
	}
	
	
	/////////////
	// METHODS //
	/////////////
	/**
	 * Return the basis {@link java.lang.String String}s passed to the
	 * constructor.  This array should be a copy of the array stored
	 * internally in this object, so that changes to the result of this
	 * function do not change the behavior of this object, or of future
	 * calls to this method.  This method should return arrays which
	 * hold the strings in the same order each time the method is
	 * called.
	 * 
	 * @param N/A
	 * @return Returns a copy of the array, {@code basis}, stored in this object.
	 * @see {@link StringCheckerMethods#getBasis()}
	 */
	public String[] getBasis() {
		// Create a new string basis array copy.
		final String[] basisCopy = new String[this.basis.length];
		
		// Copy the old array's values and put them into the new array's values.
		for (int i=0; i < basisCopy.length; i++ ) {
			basisCopy[i] = this.basis[i];
		}
		
		// Return the new copied array.
		return basisCopy;
	}
	
	
	/** 
	 * Returns {@code true} if {@code word} has one of the strings in
	 * its basis as a prefix.
	 * 
	 * @param word - a string to check in prefix.
	 * @return Returns {@code true} if word has one of the strings in its basis as a prefix.
	 * @see {@link StringCheckerMethods#prefixedByBasis(String)}
	 */
	public boolean prefixedByBasis(final String word) {
		// Search the array basis for strings that are prefixes of word.
		for (int i = 0; i < this.basis.length; i++) {
			for (int endIndex = 0; endIndex < this.basis[i].length(); endIndex++) {
				if (this.basis[i].equals(word.substring(0, endIndex+1))) {
					// Return true if one or more prefixes are found.
					return true;
				}
			}
		}
		
		// Return false if no prefix is found.
		return false;
	}

	
	/** 
	 * Returns {@code true} if {@code word} has one of the strings in
	 * its basis as a suffix.
	 * 
	 * @param word - a string to check in suffix.
	 * @return Returns {@code true} if word has one of the strings in its basis as a suffix.
	 * @see {@link StringCheckerMethods#suffixedByBasis(String)}
	 */
	public boolean suffixedByBasis(final String word) {
		// Search the array basis for strings that are suffixes of word.
		for (int i = 0; i < this.basis.length; i++) {
			for (int beginIndex = 0; beginIndex < this.basis[i].length(); beginIndex++) {
				if (this.basis[i].equals(word.substring(beginIndex, word.length()))) {
					// Return true if one or more suffixes are found.
					return true;
				}
			}
		}
		
		// Return false if no suffix is found.
		return false;
	}

	
	/** 
	 * Returns the number of basis strings contained as a substring of
	 * {@code word}.
	 * 
	 * @param word - a string that will used to check the basis string array for substrings.
	 * @return Returns the number of basis strings contained as a substring of {@code word}.
	 * @see {@link StringCheckerMethods#countContainingBasis(String)}
	 */
	public int countContainingBasis(final String word) {
		return this.getIndicesContainingBasis(word).length;
	}

	
	/** 
	 * Returns an array of the basis strings contained as a substring
	 * of {@code word}.
	 * 
	 * @param word - a string that will used to check the basis string array for substrings.
	 * @return Returns an array of the basis strings contained as a substring of  {@code word}.
	 * @see {@link StringCheckerMethods#getContainingBasis(String)}
	 */
	public String[] getContainingBasis(final String word) {
		
		// Convert the Integer array containing the correct indices into a String array.
		final int[] indices = this.getIndicesContainingBasis(word);
		final String[] containingBasisStrings = new String[indices.length];
		
		// Compare Indices here.
		for(int i = 0; i < indices.length; i++) {
			containingBasisStrings[i] = this.basis[indices[i]];
		}
		
		// Return the array with the strings found at the indices.
		return containingBasisStrings;
	}

	
	/** 
	 * Returns an array of the indices of the basis strings (as would
	 * be returned by {@link #getBasis getBasis}) contained as a
	 * substring of {@code word}.  This array should be exactly as long
	 * as there are basis strings contained as a substring of {@code
	 * word}; there should not be extra slots.
	 * 
	 * @param word - a string that will used to check the basis string array for substrings.
	 * @return Returns an array of the indices of the basis strings (as would be returned by 
	 * 		{@link #getBasis getBasis}) contained as a substring of {@code word}.
	 * @see {@link StringCheckerMethods#getIndicesContainingBasis(String)}
	 */
	public int[] getIndicesContainingBasis(final String word) {

		////////////////////////////////////
		// Find Indices Containing Basis. //
		
		// Create a new array that contains indices containing basis.
		final int[] indicesContainingBasis = new int[this.basis.length];
		
		// Flags.
		final int FLAG_REMOVE_INDEX = -1;
		
		// Keeps track of the number of substrings found.
		int numOfSubstringsFound = 0;
		
		// Search 'basis' for substrings of word.
		for (int i = 0; i < this.basis.length; i++) {
			
			// Are the words EXACTLY equal to each other?
			if (word.contains(this.basis[i])) {
				// If the substring 'word' is found in the basis array, 
				//		put the current index into the int[] array.
				indicesContainingBasis[i] = i;	// Put current index into int[] array.
				numOfSubstringsFound++;			// Increment this variable.
			}
			else {
				// If the substring 'word' is NOT found in the basis array, 
				// 		Flag the current array index for removal by the shrinking process.
				indicesContainingBasis[i] = FLAG_REMOVE_INDEX;
				
			}
		}
		
		////////////////////////////
		// Start shrinking array. //
		
		// Create a shrinked array with the length of the number of substrings found.
		final int[] shrinkedIntArray = new int[numOfSubstringsFound];
		
		// Counters.
		int counterForSubstrings = 0;
		
		// Shrink int[] array by copying it to a smaller array.
		for (	int i = 0; 
				i < indicesContainingBasis.length && counterForSubstrings < numOfSubstringsFound; 
				i++) {
			
			// Check for the FLAG_REMOVE_INDEX flag and...
			if (indicesContainingBasis[i] == FLAG_REMOVE_INDEX) {
				// Do nothing but continue the loop.
				continue;
			}
			else {
				// Copy index to shrinked array and increment the counter for substrings.
				shrinkedIntArray[counterForSubstrings++] = indicesContainingBasis[i];
			}
		}
		
		// Return the shrinked int[] array that contains the ordered indices.
		// 		The array should contain the correct indices for each substring containing basis.
		return shrinkedIntArray;
	}

	
	/** 
	 * Returns the number of basis strings which contain {@code word}
	 * as a substring.
	 * 
	 * @param word - a string that will be counted for substrings.
	 * @return Returns the number of basis strings which contain {@code word} as a substring.
	 * @see {@link StringCheckerMethods#countContainedByBasis(String)}
	 */
	public int countContainedByBasis(final String word) {
		return this.getIndicesContainedByBasis(word).length;
	}

	
	/** 
	 * Returns an array of the basis strings which contain {@code word}
	 * as a substring.
	 * 
	 * @param word - a string that will be checked for substrings.
	 * @return Returns the number of basis strings which contain {@code word} as a substring.
	 * @see {@link StringCheckerMethods#getContainedByBasis(String)}
	 */
	public String[] getContainedByBasis(final String word) {
		
		// Convert the Integer array containing the correct indices into a String array.
		final int[] indices = this.getIndicesContainedByBasis(word);
		final String[] containedByBasisStrings = new String[indices.length];
		
		// Compare Indices here.
		for(int i = 0; i < indices.length; i++) {
			containedByBasisStrings[i] = this.basis[indices[i]];
		}
		
		// Return the array with the strings found at the indices.
		return containedByBasisStrings;
	}

	
	/** 
	 * Returns an array of the indices (as would be returned by {@link
	 * #getBasis getBasis}) of the basis strings which contain {@code
	 * word} as a substring.
	 * 
	 * @param word - a string that will be checked for substrings.
	 * @return Returns an array of the indices (as would be returned by {@link
	 * 		#getBasis getBasis}) of the basis strings which contain {@code word} as a substring.
	 * @see {@link StringCheckerMethods#getIndicesContainedByBasis(String)}
	 */
	public int[] getIndicesContainedByBasis(final String word) {

		/////////////////////////////////////
		// Find Indices Contained By Basis //
		
		// Create a new array that contains indices contained by basis.
		final int[] indicesContainedByBasis = new int[this.basis.length];
		
		// Flags.
		final int FLAG_REMOVE_INDEX = -1;
		
		// Keeps track of the number of substrings found.
		int numOfSubstringsFound = 0;
		
		// Search 'basis' for substrings of word.
		for (int i = 0; i < this.basis.length; i++) {
			
			// Are the words from 'word' contained in 'this.basis'?
			if (this.basis[i].contains(word)) {
				// If the substring 'word' is found in the basis array, 
				//		put the current index into the int[] array.
				indicesContainedByBasis[i] = i;	// Put current index into int[] array.
				numOfSubstringsFound++;			// Increment this variable.
			}
			else {
				// If the substring 'word' is NOT found in the basis array, 
				// 		Flag the current array index for removal by the shrinking process.
				indicesContainedByBasis[i] = FLAG_REMOVE_INDEX;
				
			}
		}
		
		////////////////////////////
		// Start shrinking array. //
		
		// Create a shrinked array with the length of the number of substrings found.
		final int[] shrinkedIntArray = new int[numOfSubstringsFound];
		
		// Counters.
		int counterForSubstrings = 0;
		
		// Shrink int[] array by copying it to a smaller array.
		for (	int i = 0; 
				i < indicesContainedByBasis.length && counterForSubstrings < numOfSubstringsFound; 
				i++) {
			
			// Check for the FLAG_REMOVE_INDEX flag and...
			if (indicesContainedByBasis[i] == FLAG_REMOVE_INDEX) {
				// Do nothing but continue the loop.
				continue;
			}
			else {
				// Copy index to shrinked array and increment the counter for substrings.
				shrinkedIntArray[counterForSubstrings++] = indicesContainedByBasis[i];
			}
		}
		
		// Return the shrinked int[] array that contains the ordered indices.
		// 		The array should contain the correct indices for each substring contained by basis.
		return shrinkedIntArray;
	}

	
	/** 
	 * Returns the number of basis strings which are anagrams of {@code word}.
	 * 
	 * @param word - a string that will be counted for anagrams.
	 * @return Returns the number of basis strings which are anagrams of {@code word}.
	 * @see {@link StringCheckerMethods#countAnagrams(String)}
	 */
	public int countAnagrams(final String word) {
		// Find and get the number of anagrams in 'this.basis' using word.
		final int[] intAnagrams = getAnagramIndices(word);
		
		// Return the number of anagrams found.
		return intAnagrams.length;
	}

	
	/** 
	 * Returns an array of the basis strings which are anagrams of {@code word}.
	 * 
	 * @param word - a string that will be checked for anagrams.
	 * @return Returns the number of basis strings which are anagrams of {@code word}.
	 * @see {@link StringCheckerMethods#getAnagrams(String)}
	 */
	public String[] getAnagrams(final String word) {
		// Get Anagram Indices locations for the Anagram Strings Array.
		final int[] intAnagrams = getAnagramIndices(word);
		final String[] stringAnagrams = new String[intAnagrams.length];
		
		// Set String Anagrams Array correctly using the Integer Anagrams Array.
		for(int i = 0; i < intAnagrams.length; i++) {
			stringAnagrams[i] = this.basis[intAnagrams[i]];
		}
		
		// Return the String Array with the strings found.
		return stringAnagrams;
	}

	
	/** 
	 * Returns an array of the indices (as would be returned by {@link
	 * #getBasis getBasis}) of the basis strings which are anagrams of
	 * {@code word}.
	 * 
	 * @param word - a string that will be checked for anagrams.
	 * @return
	 * @see {@link StringCheckerMethods#getAnagramIndices(String)}
	 */
	public int[] getAnagramIndices(final String word) {
		
		////////////////////
		// Find anagrams. //
		final int[] intAnagrams = new int[this.basis.length];
		int numOfAnagramsFound = 0;
		
		// Flags.
		final int FLAG_REMOVE_INDEX = -1;
		
		for (int i = 0; i < this.basis.length; i++) {
			if (this.areAnagrams(this.basis[i], word) == true) {
				intAnagrams[i] = i;
				numOfAnagramsFound++;
			} 
			else {
				intAnagrams[i] = FLAG_REMOVE_INDEX;
			}
		}
		
		///////////////////
		// Shrink array. //
		final int[] intShrinkedArray = new int[numOfAnagramsFound];
		int indexOfShrinkedArray = 0;
		
		for (int i = 0; i < intAnagrams.length; i++) {
			if (intAnagrams[i] == FLAG_REMOVE_INDEX) {
				continue;
			}
			else {
				intShrinkedArray[indexOfShrinkedArray++] = intAnagrams[i];
			}
		}
		
		return intShrinkedArray;
	}
	
	
	/**
	 * Returns {@code true} exactly when the two arguments are anagrams of each other.
	 * 
	 * @param string1 - First string/argument.
	 * @param string2 - Second string/argument.
	 * @return Returns {@code true} exactly when the two arguments are anagrams of each other.
	 */
	private boolean areAnagrams(final String string1, final String string2) {
		
		// Create character arrays of string1 and string2.
		char[] string1Chars = new char[string1.length()];
		char[] string2Chars = new char[string2.length()];
		
		// Set them to their lowercase part.
		string1Chars = string1.toLowerCase().toCharArray();
		string2Chars = string2.toLowerCase().toCharArray();
		
		// Sort the characters for string1Chars in order from a to z.
		for (int i = 0; i < string1Chars.length; i++) {
			for (int j = 0; j < string1Chars.length; j++) {
				if (string1Chars[i] < string1Chars[j]) {
					char tChar = string1Chars[i];
					string1Chars[i] = string1Chars[j];
					string1Chars[j] = tChar;
				}
			}
		}
		
		// Sort the characters for string1Chars in order from a to z.
		for (int i = 0; i < string2Chars.length; i++) {
			for (int j = 0; j < string2Chars.length; j++) {
				if (string2Chars[i] < string2Chars[j]) {
					char tChar = string2Chars[i];
					string2Chars[i] = string2Chars[j];
					string2Chars[j] = tChar;
				}
			}
		}
		
		// Check if the characters for both string1 and string2 arrays are equivalent.
		for (int i = 0; i < string1Chars.length && i < string2Chars.length; i++) {
			if (string1Chars.length != string2Chars.length) {
				return false;
			}
			if (string1Chars[i] != string2Chars[i]) {
				return false;
			}
		}
		
		return true;
	}


}

