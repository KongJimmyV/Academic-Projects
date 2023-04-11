
/* SparseArray.java
 *
 * Description (Short): 
 *      - A generic 2D sparse matrix.
 *
 * Author: Kong Jimmy Vang
 * 
 * Derived from: 
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/cs220-assignment-5-sparseness/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/a-test-case-for-cs220-assignment-5/
 *      - http://cs.uwlax.edu/~jmaraist/220-fall-2017/question-on-cs220-assignment-5/
 *      - https://docs.oracle.com/middleware/1221/adf/api-reference-model/oracle/jbo/server/SparseArray.html
 *      
 * Description (Long):  
 *      - This matrix can store the object types of <Entry> 
 *          defined by the user when creating a new SparseArray.
 *          
 *      - This class provides a set of functions defined in the 
 *          Javadocs below.
 *          
 */

import java.util.function.Function;
import java.util.function.BiFunction;

/**
 * A generic sparse two-dimensional matrix with configurable default entry.
 * 
 * @param <Entry>
 *            the type of element contained in this matrix
 */
public class SparseMatrix<Entry> {
    
    private final SparseArray<SparseArray<Entry>> matrix;
    
    private long size;
    private final long DECLARED_ROWS;
    private final long DECLARED_COLUMNS;
    
    /**
     * Construct a sparse matrix with the given capacity. The default value of the
     * entries of the array should be <code>null</code>. Indices should run from
     * zero up to (but not including) the given number of <code>rows</code> and
     * <code>columns</code>.
     *
     * @param rows
     *            the number of rows present in the matrix.
     * @param columns
     *            the number of columns present in the matrix.
     */
    public SparseMatrix(
            final long rows, 
            final long columns) {
        this(rows, columns, null);
    }

    /**
     * Construct a sparse matrix with the given capacity and default values. Indices
     * should run from zero up to (but not including) the given number of
     * <code>rows</code> and <code>columns</code>.
     *
     * @param rows
     *            the number of rows present in the matrix.
     * @param columns
     *            the number of columns present in the matrix.
     * @param dft
     *            the initial contents at every pairs of indices into the matrix.
     */
    public SparseMatrix(
            final long rows, 
            final long columns, 
            final Entry dft) {
        
        matrix = new SparseArray<SparseArray<Entry>>(
                rows, new SparseArray<Entry>(columns, dft));
        this.DECLARED_ROWS = rows;
        this.DECLARED_COLUMNS = columns;
    }

    /**
     * Return the value which is assumed by default to be stored at each entry of
     * the matrix <i>except</i> where explicitly set to some other value.
     */
    public Entry getDefaultEntry() {
        return this.matrix.get(0).getDefaultContent();
    }

    /**
     * Return the number of declared columns in the matrix.
     */
    public long getDeclaredRows() {
        return this.DECLARED_ROWS;
    }

    /**
     * Return the number of declared rows in the matrix.
     */
    public long getDeclaredColumns() {
        return this.DECLARED_COLUMNS;
    }

    /**
     * Returns the total number of non-default values stored in the matrix.
     */
    public int getStoredEntries() {
        int total = 0;
        
        SparseArray<?>.Node rowNode = this.matrix.getHeadSentinel().nextNode;
        while(rowNode != this.matrix.getTailSentinel()) {
            total += this.matrix.get(rowNode.getIndex()).getStoredEntries();
            rowNode = rowNode.nextNode;
        }
        
        return total;
    }

    /**
     * Returns the value stored at a particular pair of indices in this matrix.
     * 
     * @param row
     *            the index of the row to be searched. If the row index is negative,
     *            or is equal to or greater than the declared number of rows, then
     *            this method will throw a
     *            {@link java.lang.ArrayIndexOutOfBoundsException
     *            ArrayIndexOutOfBoundsException}
     * @param column
     *            the index of the column to be searched. If the column index is
     *            negative, or is equal to or greater than the declared number of
     *            columns, then this method will throw a
     *            {@link java.lang.ArrayIndexOutOfBoundsException
     *            ArrayIndexOutOfBoundsException}
     * @return The value associated with the particular row and column, which will
     *         be the default value for the array if no value has been explicitly
     *         stored here
     */
    public Entry get(final long row, final long column) {
        return this.matrix.get(row).get(column);
    }

    /**
     * Sets the value stored at a particular pair of indices in this matrix.
     * 
     * @param row
     *            the index of the row where the value is to be stored. If the row
     *            index is negative, or is equal to or greater than the declared
     *            number of rows, then this method will throw a
     *            {@link java.lang.ArrayIndexOutOfBoundsException
     *            ArrayIndexOutOfBoundsException}
     * @param column
     *            the index of the column where the value is to be stored. If the
     *            column index is negative, or is equal to or greater than the
     *            declared number of columns, then this method will throw a
     *            {@link java.lang.ArrayIndexOutOfBoundsException
     *            ArrayIndexOutOfBoundsException}
     * @param value
     *            the value to be stored
     */
    public void set(final long row, final long column, final Entry value) {
        this.matrix.set(row, new SparseArray<Entry>(this.getDeclaredColumns(), this.getDefaultEntry()));
        this.matrix.get(row).set(column, value);
        this.size++;
    }

    /**
     * Returns <code>true</code> when a value which differs from the matrix's
     * default has been stored at a particular row and column of the array.
     * 
     * @param row
     *            the index of the row whose setting, if any, is to be checked.
     * @param column
     *            the index of the column whose setting, if any, is to be checked.
     * @return Always returns a boolean, even if the <col>row</col> or
     *         <col>column</col> is out of bounds. In the latter case, the result
     *         should be <code>false</code>.
     */
    public boolean isSet(final long row, final long column) {
        return this.matrix.get(row).isSet(column);
    }

    /**
     * Remove any setting to a non-default value at the given <code>row</code> and
     * <code>column</code>. Otherwise has no effect if there is no such setting.
     * 
     * @param row
     *            the index of the row whose setting, if any, is to be removed. If
     *            the row index is negative, or is equal to or greater than the
     *            declared number of rows, then this method will throw a
     *            {@link java.lang.ArrayIndexOutOfBoundsException
     *            ArrayIndexOutOfBoundsException}
     * @param column
     *            the index of the column whose setting, if any, is to be removed.
     *            If the column index is negative, or is equal to or greater than
     *            the declared number of columns, then this method will throw a
     *            {@link java.lang.ArrayIndexOutOfBoundsException
     *            ArrayIndexOutOfBoundsException}
     */
    public void unset(final long row, final long column) {
        if(row < 0 || row >= this.getDeclaredRows()) {
            throw new ArrayIndexOutOfBoundsException(
                    "The row, " + row + ", is out of bounds.");
        }
        if(column < 0 || column >= this.getDeclaredColumns()) {
            throw new ArrayIndexOutOfBoundsException(
                    "The column, " + column + ", is out of bounds.");
        }
        
        this.matrix.get(row).unset(column);
        
        if(this.matrix.get(row).size() <= 0) {
            this.matrix.unset(row);
        }
        
        this.size--;
    }

    /**
     * Transforms one sparse matrix into another by applying the given
     * <code>function</code> to each element of this matrix. The default value of
     * the result matrix is formed by applying the function to this matrix's default
     * value; the function maps elements to the same rows/columns in the new matrix.
     */
    public <Result> SparseMatrix<Result> map(final Function<Entry, Result> function) {

        SparseMatrix<Result> newMatrix = 
                new SparseMatrix<>(
                        this.DECLARED_ROWS, 
                        this.DECLARED_COLUMNS,
                        function.apply(this.matrix.get(0).getDefaultContent()));
        
        SparseArray<?>.Node rowNode = this.matrix.getHeadSentinel().nextNode;
        while(rowNode != this.matrix.getTailSentinel()) {
            long r = rowNode.getIndex();
            
            SparseArray<?>.Node colNode = this.matrix.get(r).getHeadSentinel().nextNode;
            while(colNode != this.matrix.get(r).getTailSentinel()) {
                long c = colNode.getIndex();
                Result result = function.apply(this.get(r, c));
                newMatrix.set(r, c, result);
                
                colNode = colNode.nextNode;
            }
            rowNode = rowNode.nextNode;
        }
        
        return newMatrix;
    }

    /**
     * Transforms two sparse matrices into a third result matrix by applying the
     * given <code>function</code> to respective pairs of elements from this matrix
     * and the argument matrix. The default value of the result matrix is formed by
     * applying the function to the two matrices' default values; the function maps
     * elements to the same row/column indices in the new matrix.
     */
    public <Entry2, Result> SparseMatrix<Result> combine(
            final BiFunction<Entry, Entry2, Result> function,
            final SparseMatrix<Entry2> that) {

        SparseMatrix<Result> newMatrix = 
                new SparseMatrix<>(
                        this.DECLARED_ROWS, 
                        this.DECLARED_COLUMNS,
                        function.apply(
                                this.matrix.get(0).getDefaultContent(),
                                that.matrix.get(0).getDefaultContent()));
        
        SparseArray<?>.Node rowNode = this.matrix.getHeadSentinel().nextNode;
        while(rowNode != this.matrix.getTailSentinel()) {
            long r = rowNode.getIndex();
            
            SparseArray<?>.Node colNode = this.matrix.get(r).getHeadSentinel().nextNode;
            while(colNode != this.matrix.get(r).getTailSentinel()) {
                long c = colNode.getIndex();
                Result result = function.apply(this.get(r, c), that.get(r, c));
                newMatrix.set(r, c, result);
                
                colNode = colNode.nextNode;
            }
            rowNode = rowNode.nextNode;
        }
        
        SparseArray<?>.Node rowNodeThat = that.matrix.getHeadSentinel().nextNode;
        while(rowNodeThat != that.matrix.getTailSentinel()) {
            long r = rowNodeThat.getIndex();
            
            SparseArray<?>.Node colNodeThat = that.matrix.get(r).getHeadSentinel().nextNode;
            while(colNodeThat != that.matrix.get(r).getTailSentinel()) {
                long c = colNodeThat.getIndex();
                Result result = function.apply(this.get(r, c), that.get(r, c));
                newMatrix.set(r, c, result);
                
                colNodeThat = colNodeThat.nextNode;
            }
            rowNodeThat = rowNodeThat.nextNode;
        }
        
        return newMatrix;
    }

    /**
     * For two matrices of numbers, calculate the sum of the matrices, that is, by
     * adding the pairs of numbers at the same position at the two matrices.
     * 
     * @param matrix1
     *            the first matrix of numbers
     * @param matrix2
     *            the second matrix of numbers. 
     * @throws IllegalArgumentException 
     *            This method will throw an
     *            {@link java.lang.IllegalArgumentException
     *            IllegalArgumentException} if the two matrices differ in either the
     *            number of rows or the number of columns
     */
    public static SparseMatrix<Double> matrixAdd(
            final SparseMatrix<Double> matrix1, 
            final SparseMatrix<Double> matrix2) {

        if (matrix1.getDeclaredRows() != matrix2.getDeclaredRows() ||
                matrix1.getDeclaredColumns() != matrix2.getDeclaredColumns()) {
            throw new IllegalArgumentException(
                    "The two matrices have different numbers of rows and columns");
        }
        
        SparseMatrix<Double> resultMatrix;
        
        if (matrix1.getDefaultEntry() != null ||
                matrix2.getDefaultEntry() != null) {
            resultMatrix = 
                    new SparseMatrix<Double>(
                            matrix1.getDeclaredRows(), 
                            matrix1.getDeclaredColumns(), 
                            matrix1.getDefaultEntry() + matrix2.getDefaultEntry());
        } else {
            resultMatrix = 
                    new SparseMatrix<Double>(
                            matrix1.getDeclaredRows(), 
                            matrix1.getDeclaredColumns(), 
                            null);
        }
        
        // Add to new matrix.
        SparseArray<Long> queueRow = new SparseArray<>(Long.MAX_VALUE, (long) -1);
        SparseArray<Long> queueCol = new SparseArray<>(Long.MAX_VALUE, (long) -1);
        
        SparseArray<?>.Node rowNode = matrix1.matrix.getHeadSentinel().nextNode;
        while(rowNode != matrix1.matrix.getTailSentinel()) {
            long r = rowNode.getIndex();
            
            SparseArray<?>.Node colNode = matrix1.matrix.get(r).getHeadSentinel().nextNode;
            while(colNode != matrix1.matrix.get(r).getTailSentinel()) {
                long c = colNode.getIndex();
                queueRow.set(r, r);
                queueCol.set(c, c);
                if(matrix1.get(r, c) == null &&
                        matrix1.get(r, c) == null) {
                    resultMatrix.set(r, c, null);
                } else if(matrix1.get(r, c) == null) {
                    resultMatrix.set(r, c, matrix2.get(r, c));
                } else if(matrix2.get(r, c) == null) {
                    resultMatrix.set(r, c, matrix1.get(r, c));
                } else {
                    resultMatrix.set(r, c, matrix1.get(r, c) + matrix2.get(r, c));
                }
                colNode = colNode.nextNode;
            }
            rowNode = rowNode.nextNode;
        }
        
        SparseArray<?>.Node rowNode2 = matrix2.matrix.getHeadSentinel().nextNode;
        while(rowNode2 != matrix2.matrix.getTailSentinel()) {
            long r = rowNode2.getIndex();
            
            SparseArray<?>.Node colNode2 = matrix2.matrix.get(r).getHeadSentinel().nextNode;
            while(colNode2 != matrix2.matrix.get(r).getTailSentinel()) {
                long c = colNode2.getIndex();
                if(queueRow.get(r) != r || queueCol.get(c) != c) {
                    if(matrix1.get(r, c) == null &&
                            matrix1.get(r, c) == null) {
                        resultMatrix.set(r, c, null);
                    } else if(matrix1.get(r, c) == null) {
                        resultMatrix.set(r, c, matrix2.get(r, c));
                    } else if(matrix2.get(r, c) == null) {
                        resultMatrix.set(r, c, matrix1.get(r, c));
                    } else {
                        resultMatrix.set(r, c, matrix1.get(r, c) + matrix2.get(r, c));
                    }
                }
                colNode2 = colNode2.nextNode;
            }
            rowNode2 = rowNode2.nextNode;
        }
        
        return resultMatrix;
    }
    
    protected void print() {
        
        SparseArray<?>.Node current = this.matrix.getHeadSentinel().nextNode;
        while(current != this.matrix.getTailSentinel()) {
            SparseArray<Entry> tempArr = this.matrix.get(current.getIndex());
            tempArr.print();
            current = current.nextNode;
        }
    }

    protected long size() {
        return this.size;
    }
    
}