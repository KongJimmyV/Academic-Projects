
import java.util.Comparator;
import java.util.Iterator;

/**
 * Operations supported by the <code>SorterList</code> project class.
 * Classes implementing =SorterListInterface= represent ordered lists
 * whose order can be changed.
 * @param <T> the type of elements contained in the list
 */
public interface SorterListInterface<T> extends Iterable<T> {

  /**
   * Adds <code>item</code> to this list.  The <code>item</code>
   * should be positioned according to the order given by {@link
   * SorterListInterface#getComparator getComparator}.
   */
  public void add(T item);

  /**
   * Removes the first occurrence of the specified <code>item</code>
   * from this list, if it is present.  If this list does not contain
   * <code>item</code>, then the list should not be changed.
   * @return <code>true</code> if this list did contain
   * <code>item</code>
   */
  public boolean remove(T item);

  /**
   * Removes all elements from this list, so that it is empty.
   */
  public void clear();

  /**
   * Returns the number of elements currently contained in this list.
   */
  public int size();

  /**
   * Returns <code>true</code> exactly when this list contains no
   * elements.
   */
  public boolean isEmpty();

  /**
   * Tests whether <code>value</code> is currently contained in this
   * list.
   * @param value The value to find in this list
   * @return <code>true</code> exactly when <code>value</code> is
   * contained in this list.
   */
  public boolean contains(T value);

  /**
   * Returns the current {@link java.util.Comparator Comparator} by
   * which this list is sorted.
   */
  public Comparator<T> getComparator();

  /**
   * Set the {@link java.util.Comparator Comparator} by which this
   * list is sorted.  Calling this method should re-sort the stored
   * list according to the new <code>comparator</code>, and to store
   * subsequently-added elements according to its order.
   * @param comparator a new ordering for the elements of this list
   */
  public void setComparator(Comparator<T> comparator);

  /**
   * {@inheritDoc} It must be possible for multiple {@list
   * java.util.Iterator Iterator}s, possibly using different {@link
   * java.util.Comparator Comparator}s, produced by this method or by
   * the <code>iterator(Comparator<T>)</code> method, to be active in
   * a program at the same time.
   */
  @Override public Iterator<T> iterator();

  /**
   * Provides an {@link java.util.Iterator Iterator} for the elements
   * of this list in the order given by <code>comparator</code>.
   * Calling this list must <em>not</em> change the order of the list
   * itself, not even temporarily.  It must be possible for multiple
   * {@list java.util.Iterator Iterator}s, possibly using different
   * {@link java.util.Comparator Comparator}s, produced by this method
   * or by the <code>iterator()</code> method, to be active in a
   * program at the same time.
   *
   * @param ordering for the elements of this list as will be
   * generated by the resulting {@link java.util.Iterator Iterator}
   * @return A new {@link java.util.Iterator Iterator} for the
   * elements of this list, to be produced in the order given by
   * <code>comparator</code> instead of in the list's current order
   */
  public Iterator<T> iterator(Comparator<T> comparator);
}
