
/**
 * Methods to be implemented by the {@link StringChecker} class for
 * CS220 Assignments Series 1, Fall 2017.
 */
public interface StringCheckerMethods {

  /**
   * Return the basis {@link java.lang.String String}s passed to the
   * constructor.  This array should be a copy of the array stored
   * internally in this object, so that changes to the result of this
   * function do not change the behavior of this object, or of future
   * calls to this method.  This method should return arrays which
   * hold the strings in the same order each time the method is
   * called.
   */
  public String[] getBasis();

  /** Returns {@code true} if {@code word} has one of the strings in
   * its basis as a prefix.
   */
  public boolean prefixedByBasis(String word);

  /** Returns {@code true} if {@code word} has one of the strings in
   * its basis as a suffix.
   */
  public boolean suffixedByBasis(String word);

  /** Returns the number of basis strings contained as a substring of
   * {@code word}.
   */
  public int countContainingBasis(String word);

  /** Returns an array of the basis strings contained as a substring
   * of {@code word}.
   */
  public String[] getContainingBasis(String word);

  /** Returns an array of the indices of the basis strings (as would
   * be returned by {@link #getBasis getBasis}) contained as a
   * substring of {@code word}.  This array should be exactly as long
   * as there are basis strings contained as a substring of {@code
   * word}; there should not be extra slots.
   */
  public int[] getIndicesContainingBasis(String word);

  /** Returns the number of basis strings which contain {@code word}
   * as a substring.
   */
  public int countContainedByBasis(String word);

  /** Returns an array of the basis strings which contain {@code word}
   *  as a substring.
   */
  public String[] getContainedByBasis(String word);

  /** Returns an array of the indices (as would be returned by {@link
   * #getBasis getBasis}) of the basis strings which contain {@code
   * word} as a substring.
   */
  public int[] getIndicesContainedByBasis(String word);

  /** Returns the number of basis strings which are anagrams of {@code word}.
   */
  public int countAnagrams(String word);

  /** Returns an array of the basis strings which are anagrams of {@code word}.
   */
  public String[] getAnagrams(String word);

  /** Returns an array of the indices (as would be returned by {@link
   * #getBasis getBasis}) of the basis strings which are anagrams of
   * {@code word}.
   */
  public int[] getAnagramIndices(String word);
}