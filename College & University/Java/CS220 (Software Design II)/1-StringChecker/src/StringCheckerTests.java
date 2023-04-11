import static org.junit.Assert.*;
import org.junit.Test;

/** Tests for {@link StringChecker} Assignment 3 */
public class StringCheckerTests {


  /** String we use in a one-element basis. */
  private final String SINGLE = "single";
  /** Instantiate a {@link StringChecker} with a single string {@code
   * single} as basis. */
  private StringChecker buildSingle() {
    return new StringChecker(new String[] { SINGLE });
  }


  /** String we use as the first of a two-element basis. */
  private final String DOUBLE0 = "lefthand";
  /** String we use as the second of a two-element basis. */
  private final String DOUBLE1 = "righthand";
  /** Instantiate a {@link StringChecker} with two strings as its
   * basis. */
  private StringChecker buildDouble() {
    return new StringChecker(new String[] { DOUBLE0, DOUBLE1 });
  }


  /** String we use as the first of a three-element basis. */
  private final String TRIO0 = "restores";
  /** String we use as the second of a three-element basis. */
  private final String TRIO1 = "rosters";
  /** String we use as the third of a three-element basis. */
  private final String TRIO2 = "storers";
  /** Instantiate a {@link StringChecker} with three strings as its
   * basis. */
  private StringChecker buildTrio() {
    return new StringChecker(new String[] { TRIO0, TRIO1, TRIO2 });
  }


  /** String we use as the first of a four-element basis. */
  private final String QUAD0 = "cardamom";
  /** String we use as the second of a four-element basis. */
  private final String QUAD1 = "thermomagic";
  /** String we use as the third of a four-element basis. */
  private final String QUAD2 = "catheterize";
  /** String we use as the fourth of a four-element basis. */
  private final String QUAD3 = "caramelize";
  /** Instantiate a {@link StringChecker} with four strings as its
   * basis. */
  private StringChecker buildQuad() {
    return new StringChecker(new String[] { QUAD0, QUAD1, QUAD2, QUAD3 });
  }


  /** Verify that {@link StringChecker} implements
   * {@link StringCheckerMethods}.
   */
  @Test public void testSuperclass() {
    StringCheckerMethods.class.isAssignableFrom(StringChecker.class);
  }

  /** The constructor should return an instance (and not throw
   * an exception).
   */
  @Test public void testConstructor() {
    buildSingle();
  }

  /** The basis returns what was passed into the constructor ---
   * single basis. */
  @Test public void testGetBasisSingle() {
    final String[] basis = buildSingle().getBasis();
    assertEquals("Only one member of the basis", 1, basis.length);
    assertTrue("Member of basis is \"" + SINGLE + "\"",
               basis[0].equals(SINGLE));
  }

  /** The basis returns what was passed into the constructor ---
   * two-element basis. */
  @Test public void testGetBasisDouble() {
    final String[] basis = buildDouble().getBasis();
    assertEquals("Two members of the basis", 2, basis.length);
    assertTrue("One member of basis is \"" + DOUBLE0 + "\"",
               basis[0].equals(DOUBLE0) || basis[1].equals(DOUBLE0));
    assertTrue("One member of basis is \"" + DOUBLE1 + "\"",
               basis[0].equals(DOUBLE1) || basis[1].equals(DOUBLE1));
  }

  /** Changes to the result of getBasis do not effect subsequent
   * calls.
   */
  @Test public void testGetBasisNoSideEffects() {
    final StringChecker checker = buildSingle();
    final String[] basis1 = checker.getBasis();
    basis1[0] = "corruption";
    final String[] basis2 = checker.getBasis();
    assertEquals("Original basis", SINGLE, basis2[0]);
  }

  /** getBasis returns strings in the same order each time.
   */
  @Test public void testGetBasisOrderPreserving() {
    final StringChecker checker = buildDouble();
    final String[] basis1 = checker.getBasis();
    final String[] basis2 = checker.getBasis();
    assertEquals("Same first element", basis1[0], basis2[0]);
    assertEquals("Same second element", basis1[1], basis2[1]);
  }

  /** Not finding a prefix */
  @Test public void testPrefixedByBasisNone() {
    assertFalse("Not finding a prefix",
                buildSingle().prefixedByBasis("something"));
  }

  /** Finding the one prefix */
  @Test public void testPrefixedByBasisOnly() {
    assertTrue("Finding the one prefix",
               buildSingle().prefixedByBasis("singleton"));
  }

  /** Finding one of several prefixes */
  @Test public void testPrefixedByBasisOne() {
    assertTrue("Finding one of several prefixes",
               buildQuad().prefixedByBasis("cardamomcoffee"));
  }

  /** Not finding a suffix */
  @Test public void testSuffixedByBasisNone() {
    assertFalse("Not finding a suffix",
                buildSingle().suffixedByBasis("something"));
  }

  /** Finding the one suffix */
  @Test public void testSuffixedByBasisOnly() {
    final String word = "proxy" + SINGLE;
    assertTrue("Finding \"" + SINGLE + "\" as the one suffix of \""
               + word + "\"",
               buildSingle().suffixedByBasis(word));
  }

  /** Finding the suffix among non-suffixes */
  @Test public void testSuffixedByBasisOne() {
    final String word = "quasi" + QUAD1;
    assertTrue("Finding the suffix among non-suffixes for \"" + word + "\"",
               buildQuad().suffixedByBasis(word));
  }

  /** Length when no basis element is a substring */
  @Test public void testCountContainingBasisNone() {
    final StringChecker quad = buildQuad();
    assertEquals("Length when no basis element is a substring", 0,
                 quad.countContainingBasis("laserbeam"));
  }

  /** Length when two basis elements are a substring */
  @Test public void testCountContainingBasisTwo() {
    final StringChecker quad = buildQuad();
    assertEquals("Length when two basis elements are a substring", 2,
                 quad.countContainingBasis(QUAD0 + "x" + QUAD1));
  }

  /** Length when no basis element is a substring */
  @Test public void testGetContainingBasisNone() {
    final StringChecker quad = buildQuad();
    assertEquals("Length when no basis element is a substring", 0,
                 quad.getContainingBasis("laserbeam").length);
  }

  /** Length when two basis elements are a substring */
  @Test public void testGetContainingBasisTwo() {
    final StringChecker quad = buildQuad();
    final String[] basis = quad.getBasis();

    final String[] matching = quad.getContainingBasis(QUAD0 + "x" + QUAD1);
    assertEquals("Length when two basis elements are substrings", 2,
                 matching.length);
    assertTrue("One of the matching is "+QUAD0,
               matching[0].equals(QUAD0) || matching[1].equals(QUAD0));
    assertTrue("One of the matching is "+QUAD1,
               matching[0].equals(QUAD1) || matching[1].equals(QUAD1));
  }

  /** When the argument has no basis strings as a substring, we should
   * see an empty array. */
  @Test public void testGetIndicesContainingBasisNoneContained() {
    final StringChecker quad = buildQuad();
    assertEquals("Length when no basis element is a substring", 0,
                 quad.getIndicesContainingBasis("laserbeam").length);
  }

  /** When the argument has two basis strings as substrings, we should
   * see a two-element array with those strings indexed. */
  @Test public void testGetIndicesContainingBasisTwoContained() {
    final StringChecker quad = buildQuad();
    final String[] basis = quad.getBasis();

    final int[] indices = quad.getIndicesContainingBasis(QUAD0 + "x" + QUAD1);
    assertEquals("Length when two basis elements are substrings", 2,
                 indices.length);
    assertTrue("One of the indices is "+QUAD0,
               basis[indices[0]].equals(QUAD0)
               || basis[indices[1]].equals(QUAD0));
    assertTrue("One of the indices is "+QUAD1,
               basis[indices[0]].equals(QUAD1)
               || basis[indices[1]].equals(QUAD1));
  }

  /** When no basis strings have an argument as a substring, we should
   * see an empty array */
  @Test public void testCountContainedByBasisNone() {
    assertEquals("Length when no basis element is a substring", 0,
                 buildQuad().countContainedByBasis("laserbeam"));
  }

  /** When two basis strings have an argument as a substring, we
   * should count two strings. */
  @Test public void testCountContainedByBasisTwo() {
    assertEquals("Length when two basis elements are substrings", 2,
                 buildQuad().countContainedByBasis("mom"));
  }

  /** When no basis strings have an argument as a substring, we should
   * see an empty array */
  @Test public void testGetContainedByBasisNone() {
    assertEquals("Length when no basis element is a substring", 0,
                 buildQuad().getContainedByBasis("laserbeam").length);
  }

  /** When two basis strings have an argument as a substring, we
   * should see those two strings. */
  @Test public void testGetContainedByBasisTwo() {
    final StringChecker quad = buildQuad();
    final String[] basis = quad.getBasis();
    final String[] matches = quad.getContainedByBasis("mom");
    assertEquals("Length when two basis elements are substrings", 2,
                 matches.length);
    assertTrue("One of the matches is "+QUAD0,
               matches[0].equals(QUAD0) || matches[1].equals(QUAD0));
    assertTrue("One of the matches is "+QUAD1,
               matches[0].equals(QUAD1) || matches[1].equals(QUAD1));
  }

  /** When no basis strings have an argument as a substring, we should
   * see an empty array. */
  @Test public void testGetIndicesContainedByBasisNoneContained() {
    final StringChecker quad = buildQuad();
    assertEquals("Length when no basis element is a substring", 0,
                 quad.getIndicesContainedByBasis("laserbeam").length);
  }

  /** When two basis strings have an argument as a substring, we
   * should see the indices of those two strings. */
  @Test public void testGetIndicesContainedByBasisTwoContained() {
    final StringChecker quad = buildQuad();
    final String[] basis = quad.getBasis();

    final int[] indices = quad.getIndicesContainedByBasis("mom");
    assertEquals("Length when two basis elements are substrings", 2,
                 indices.length);
    assertTrue("One of the indices is "+QUAD0,
               basis[indices[0]].equals(QUAD0)
               || basis[indices[1]].equals(QUAD0));
    assertTrue("One of the indices is "+QUAD1,
               basis[indices[0]].equals(QUAD1)
               || basis[indices[1]].equals(QUAD1));
  }

  /** Finding zero anagrams in the basis. */
  @Test public void testCountAnagramsNone() {
    assertEquals("Finding zero anagrams in the basis",
                 0, buildQuad().countAnagrams("nothing"));
  }

  /** Finding one anagram in the basis. */
  @Test public void testCountAnagramsOne() {
    assertEquals("Finding one anagram in the basis",
                 1, buildDouble().countAnagrams("handleft"));
  }

  /** Finding two anagrams in the basis. */
  @Test public void testCountAnagramsTwo() {
    assertEquals("Finding two anagrams in the basis",
                 2, buildTrio().countAnagrams("eorrsst"));
  }

  /** Finding zero anagrams in the basis. */
  @Test public void testGetAnagramsNone() {
    assertEquals("Finding zero anagrams in the basis",
                 0, buildQuad().getAnagrams("nothing").length);
  }

  /** Finding one anagram in the basis. */
  @Test public void testGetAnagramsOne() {
    final String[] anagrams = buildDouble().getAnagrams("handleft");
    assertEquals("Result of getAnagrams was length one",
                 1, anagrams.length);
    assertEquals("Content of getAnagrams result holds \"" + DOUBLE0 + "\"",
                 DOUBLE0, anagrams[0]);
  }

  /** Finding two anagrams in the basis. */
  @Test public void testGetAnagramsTwo() {
    final String[] anagrams = buildTrio().getAnagrams("eorrsst");
    assertEquals("Result of getAnagrams was length one",
                 2, anagrams.length);
    assertTrue("Content of getAnagrams result holds \"" + TRIO2 + "\"",
               TRIO2.equals(anagrams[0]) || TRIO2.equals(anagrams[1]));
    assertTrue("Content of getAnagrams result holds \"" + TRIO1 + "\"",
               TRIO1.equals(anagrams[0]) || TRIO1.equals(anagrams[1]));
  }

  /** Finding zero anagrams in the basis. */
  @Test public void testGetanagramIndicesNone() {
    assertEquals("Finding zero anagrams in the basis",
                 0, buildQuad().getAnagramIndices("nothing").length);
  }

  /** Finding one anagram in the basis. */
  @Test public void testGetanagramIndicesOne() {
    final String[] anagrams = buildDouble().getAnagrams("handleft");
    assertEquals("Result of getAnagramIndices was length one",
                 1, anagrams.length);
    assertEquals("Content of getAnagramIndices result holds \""+DOUBLE0+"\"",
                 DOUBLE0, anagrams[0]);
  }

  /** Finding two anagrams in the basis. */
  @Test public void testGetAnagramIndicesTwo() {
    final StringChecker trio = buildTrio();
    final String[] basis = trio.getBasis();
    final int[] anagrams = trio.getAnagramIndices("eorrsst");
    assertEquals("Result of getAnagramIndices was length one",
                 2, anagrams.length);
    assertTrue("Content of getAnagramIndices result holds \"" + TRIO2 + "\"",
               TRIO2.equals(basis[anagrams[0]])
               || TRIO2.equals(basis[anagrams[1]]));
    assertTrue("Content of getAnagramIndices result holds \"" + TRIO1 + "\"",
               TRIO1.equals(basis[anagrams[0]])
               || TRIO1.equals(basis[anagrams[1]]));
  }
}
