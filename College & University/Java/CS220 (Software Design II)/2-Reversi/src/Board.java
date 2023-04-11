
/* Board.java
 *
 * Description (Short): 
 *      - The 'Board' class is a simulation of Reversi, a strategy 
 *          board game for two players.
 *
 * Author: Kong Jimmy Vang
 * Derived from: 
 *      http://www.thefreedictionary.com/reversi
 *      http://www.dictionary.com/browse/reversi
 *      https://www.collinsdictionary.com/us/dictionary/english/reversi
 *      http://cs.uwlax.edu/~jmaraist/220-fall-2017/cs220-reversi-assignment-2-1/
 *      http://cs.uwlax.edu/~jmaraist/220-fall-2017/cs220-reversi-assignment-2-2/
 *      http://cs.uwlax.edu/~jmaraist/220-fall-2017/cs220-reversi-assignment-2-3/
 *      http://cs.uwlax.edu/~jmaraist/220-fall-2017/cs220-reversi-assignment-2-4/
 *      http://cs.uwlax.edu/~jmaraist/220-fall-2017/cs220-reversi-assignment-2-5/
 *      http://cs.uwlax.edu/~jmaraist/220-fall-2017/cs220-reversi-assignment-2-6/
 *      http://cs.uwlax.edu/~jmaraist/220-fall-2017/cs220-reversi-assignment-2-7/
 *      http://cs.uwlax.edu/~jmaraist/220-fall-2017/cs220-reversi-assignment-2-final/
 *
 * Description (Long):  
 *      - The 'Board' class is a simulation of Reversi, a strategy board 
 *          game for two players, and it is mainly played on an 8-by-8 
 *          uncheckered board.
 * 
 *      - Methods are documented below via Javadoc.
 *
 */

// Imports
// - N/a

/**
 * {@code Board} is a simulation of Reversi, a strategy board game for two
 * players, and it is mainly played on an 8-by-8 uncheckered board.
 * 
 * <br><br>
 * There are 64 identical game pieces called disks (or discs), which are light
 * on one side and dark on the other side. Players 1 and 2 take turns placing
 * disks on the board with their assigned color facing up. To make a move, the
 * current player must place a token with their color side up on the board, 
 * in such a position that there exists at least one straight (horizontal, 
 * vertical, or diagonal) line occupied by at least one of the opponent's pieces
 * in-between their newly placed token and another token of their color.
 * 
 * <br><br>
 * The goal of the game is to have the most amount of disks left that are your
 * color when the last playable empty square is filled.
 * 
 * 
 * @author Kong Jimmy Vang
 * @version 2.8
 */
public class Board implements BoardMethods {
    
    
    ///////////////////////////////////
    // *** Field Variables *** ////
    /////////////////////////////
    /**
     * {@code reversiBoard} is an 8 by 8 array and is used to keep track of the
     * board's current state in each space/position.
     * 
     * It currently can track the following strings.
     * 
     * <br>
     * <br>
     * "." represents an empty space. <br>
     * "x" represents that player 1's token is in that space. <br>
     * "o" represents that player 2's token is in that space. <br>
     */
    final private String[][] reversiBoard;
    
    /**
     * A boolean primitive that keeps that keeps track of whose turn it is. 
     * (<b>DEFAULT:</b> "<code>true</code>")
     */
    private boolean toPlayBoolean = true;
    
    /**
     * A String constant that represents Player 1's tokens on the board. 
     * (<b>DEFAULT:</b> "<code>x</code>")
     */
    final private String PLAYER_1_TOKEN = "x";
    
    /**
     * A String constant that represents Player 2's tokens on the board. 
     * (<b>DEFAULT:</b> "<code>o</code>")
     */
    final private String PLAYER_2_TOKEN = "o";
    
    /**
     * A String constant that represents an empty space on the board. 
     * (<b>DEFAULT:</b> "<code>.</code>")
     */
    final private String EMPTY = ".";
    
    
    ////////////////////////////////////////
    // *** Constructors/Methods *** ////
    //////////////////////////////////
    /**
     * Creates a new {@code Board} instance that represents the game Reversi. Also
     * initializes the {@code reversiBoard} for the board and the tokens for each
     * player.
     */
    public Board() {
        // Setup the initial state of the board.
        this.reversiBoard = new String[8][8];
        for (int row = 1; row <= 8; ++row) {
            for (int column = 1; column <= 8; ++column) {

                // Setup player 1's tokens.
                if ((row == 4 && column == 5) || (row == 5 && column == 4)) {
                    this.reversiBoard[row - 1][column - 1] = PLAYER_1_TOKEN;
                }
                // Setup player 2's tokens.
                else if ((row == 4 && column == 4) || (row == 5 && column == 5)) {
                    this.reversiBoard[row - 1][column - 1] = PLAYER_2_TOKEN;
                }
                // Setup empty positions.
                else {
                    this.reversiBoard[row - 1][column - 1] = EMPTY;
                }

            }
        }
    }
    
    /**
     * Creates a new {@code Board} instance that represents the game Reversi. 
     * The new {@code Board} instance accepts an existing board and attempts
     * to make a move for the current player at the board position of row/column.
     * 
     * @param oldBoard - an old existing board with an attempt to make a move for 
     *      the current player at row/column.
     * @param row - represents the board's row.
     * @param column - represents the board's column.
     */
    Board(final Board oldBoard, final int row, final int column) {
        // Setup the initial state of the board.
        this.reversiBoard = new String[8][8];
        
        // Fill the Board() with a copy of "oldBoard.reversiBoard".
        for (int r = 1; r <= this.reversiBoard.length; r++) {
            for (int c = 1; c <= this.reversiBoard[r-1].length; c++) {
                this.reversiBoard[r-1][c-1] = oldBoard.reversiBoard[r-1][c-1];
            }
        }
        
        /////////////////////////////////////////////////////////
        //*** Find current the opponent's swappable tokens. ***//
        /////////////////////////////////////////////////////////
        boolean swap = false;                   // Swap boolean for swapping tokens.
        String tempCurrentPlayerToken = "";     // Keep track of the current player.
        String tempCurrentOpponentToken = "";    // Keep track of the current opponent.
        
        // If it's Player 1's turn, find P2 tokens and swap them with P1 tokens if they are legal swaps.
        if (oldBoard.toPlay() == true) {
            tempCurrentPlayerToken = PLAYER_1_TOKEN;
            tempCurrentOpponentToken = PLAYER_2_TOKEN;
        }
        // If it's Player 2's turn, find P1 tokens and swap them with P2 tokens if they are legal swaps.
        else {
            tempCurrentPlayerToken = PLAYER_2_TOKEN;
            tempCurrentOpponentToken = PLAYER_1_TOKEN;
        }
        
        // Insert the token of the current player at the position of row/column.
        this.reversiBoard[row-1][column-1] = tempCurrentPlayerToken;
        
        // Search in all directions starting from the position of (row, column).
        for (int rowChange = -1; rowChange <= 1; rowChange++) {
            for (int columnChange = -1; columnChange <= 1; columnChange++) {
                swap = false;
                
                if (rowChange == 0 && columnChange == 0) {
                    continue;
                }
                
                // Setup loop.
                int c = column;         // c is a temporary pointer starting at column.
                int r = row;            // r is a temporary pointer starting at row.
                int numOfSearches = 0;  // Number of searches that have occurred in the loop.
                
                // Start searching for current player tokens. If a token is found, set the "swap" boolean to true.
                // Search through the board in a line going in the given direction and find 
                // swappable tokens from the opponent while limiting the "numOfSearches".
                while ( r >= 1 && r <= this.reversiBoard.length
                        && c >= 1 && c <= this.reversiBoard[r-1].length
                        && numOfSearches <= this.reversiBoard.length) {
                    
                    // Stop searching if an empty space was found after one search.
                    if (numOfSearches >= 1 && this.empty(r, c) == true) {
                        break;
                    }
                    
                    // After 1 search, if the current player's token is found, stop searching 
                    // and attempt to swap after the loop.
                    if (numOfSearches >= 1 && this.reversiBoard[r-1][c-1] == tempCurrentPlayerToken) {
                        swap = true;
                    }
                    
                    // Increment the r and c counters in the correct directions.
                    r += rowChange;
                    c += columnChange;
                    
                    // Increment the number of searches that were done in the loop by 1.
                    numOfSearches++;
                    
                    if (swap == true) {
                        break;
                    }
                }
                
                // Start swapping tokens here if a current player token was found.
                r -= rowChange;
                c -= columnChange;
                if (swap == true) {
                    numOfSearches = 0;
                    while ( r >= 1 && r <= this.reversiBoard.length
                            && c >= 1 && c <= this.reversiBoard[r-1].length
                            && numOfSearches <= this.reversiBoard.length) {
                        
                        // Stop swapping tokens once we reach the original row/column position P1 moved.
                        if (r == row && c == column) {
                            break;
                        }
                        
                        // Replace the opponent's token with the current player's token.
                        if (this.reversiBoard[r-1][c-1] == tempCurrentOpponentToken) {
                            this.reversiBoard[r-1][c-1] = tempCurrentPlayerToken;
                        }
                        
                        // Increment the r and c counters in the correct directions.
                        r -= rowChange;
                        c -= columnChange;
                        
                        // Increment the number of searches that were done in the loop by 1.
                        numOfSearches++;
                    }
                }
            }
        }
    }
    
    /**
     * The result of the <code>toString</code> method on <code>Board</code> should
     * return an eight-line string representing the board. As in the examples in
     * this assignment, use a period (<code>.</code>) to represent a blank space, a
     * lower-case letter <code>x</code> to represent the tokens of the first player,
     * and a lower-case letter <code>o</code> to represent the tokens of the second
     * player. In between the eight characters for each row there should be the
     * single carriage return denoted in Java strings as <code>\n</code>. There
     * should be <i>no</i> carriage return at the end of the string.
     * 
     * @return Returns an 8 by 8 string array representing the board.
     */
    public String toString() {
        
        // Convert the String[] to a String.
        String strReversiBoard = "";

        // Add the tokens to the String.
        for (int row = 1; row <= 8; row++) {
            for (int column = 1; column <= 8; column++) {
                strReversiBoard += this.reversiBoard[row - 1][column - 1];
            }
            
            // Print a new line only for the rows from 1 to 7.
            if (row >= 1 && row <= 7)
                strReversiBoard += "\n";
        }

        // DEBUG: Verify if the string was correctly created.
        //System.out.println(strReversiBoard);

        // Return the String form of the board state.
        return strReversiBoard;
    }

    /**
     * Indicates whether the given board position contains some player token.
     *
     * The <code>empty</code> method returns <code>true</code> when there is no
     * player token at the given <code>row</code> and <code>column</code>, and
     * <code>false</code> where there is a token there.
     * 
     * @return Returns <code>true</code> when there is no
     * player token at the given <code>row</code> and <code>column</code>, and
     * <code>false</code> where there is a token there.
     */
    @Override
    public boolean empty(final int row, final int column) {
        // Return true if the board position (row, column) is empty.
        // Return false if the board position (row, column) is not yet empty.
        return this.reversiBoard[row - 1][column - 1].equals(EMPTY);
    }

    /**
     * Identifies the player who has a token at the given position.
     *
     * Whenever <code>empty</code> returns <code>false</code> for some
     * <code>row</code> and <code>column</code>, the <code>token</code> method
     * returns <code>true</code> when the given <code>row</code> and
     * <code>column</code> holds a token of the first (<code>x</code>) player, and
     * <code>false</code> if of the second (<code>o</code>) player. Whenever the
     * <code>empty</code> method returns <code>true</code>, the return value of
     * <code>token</code> is not specified.
     *
     * If the <code>row</code> and <code>column</code> do not address a valid board
     * space, then this method should throw an
     * {@link java.lang.IndexOutOfBoundsException IndexOutOfBoundsException}.
     * 
     * @returns Returns <code>true</code> if player 1's token is in the position at 
     *              <code>row</code> and <code>column</code>.
     *              <br>
     *          Returns <code>false</code>  if player 2's token is in the position at 
     *              <code>row</code> and <code>column</code>.
     */
    @Override
    public boolean token(final int row, final int column) {
        // If the row and column do not address a valid board space,
        // then this method should throw an IndexOutOfBoundsException.
        if (row < 0 || column < 0 || row > 8 || column > 8) {
            throw new IndexOutOfBoundsException(
                    "This is an invalid board space/position.");
        }

        // If the row/column is empty, return an unspecified boolean value.
        // If the row/column is not empty, return true if player 1's token
        // occupies the position. Return false if player 2's token occupies
        // the position.
        if (this.empty(row, column) == true) {
            return false;
        }
        else {
            // Return true if player 1's token, "x", is found.
            if (this.reversiBoard[row - 1][column - 1] == PLAYER_1_TOKEN) {
                return true;
            }

            // Return false if player 2's token, "o", is found.
            if (this.reversiBoard[row - 1][column - 1] == PLAYER_2_TOKEN) {
                return false;
            }
        }
        
        // If the row/column is any other value, return an unspecified boolean value.
        return false;
    }

    /**
     * Returns whether the game is over.
     *
     * The <code>gameOver</code> method should return <code>true</code> exactly when
     * it is no longer possible for either player to move, and therefore the game is
     * over.
     * 
     * @return Returns <code>true</code> when players can no longer make legal moves, 
     *              resulting in a game over.
     */
    @Override
    public boolean gameOver() {
        
        // Create 2 references. One that points to "this" board 
        // and one that points to a new Board instance.
        final Board boardPlayerToPlay = this;
        final Board boardOpponentToPlay = new Board();
        
        // Give both boards the same board states.
        for (int r = 1; r <= boardOpponentToPlay.reversiBoard.length; r++) {
            for (int c = 1; c <= boardOpponentToPlay.reversiBoard[r-1].length; c++) {
                boardOpponentToPlay.reversiBoard[r-1][c-1] 
                        = boardPlayerToPlay.reversiBoard[r-1][c-1];
            }
        }
        
        // Negate the "toPlay" boolean field variable for the new board (BoardOpponentToPlay).
        if (boardOpponentToPlay.toPlayBoolean == true) {
            boardOpponentToPlay.toPlayBoolean = false;
        }
        else {
            boardOpponentToPlay.toPlayBoolean = true;
        }
        
        // Using .moves(), test if both players can move in either Boards (Boards are the same).
        // If neither player can move, then the game is over (return true).
        // If one or both players can move, then the game is not over (return false).
        return (boardOpponentToPlay.moves().length == 0 
                && boardPlayerToPlay.moves().length == 0);
    }
    
    /**
     * Identifies the player who is next to play
     * on this board.
     *
     * Whenever the <code>gameOver</code> method returns <code>false</code>, the
     * <code>toPlay</code> method should return <code>true</code> if it is the first
     * player's turn (<code>x</code>), or <code>false</code> if it is the second
     * player's turn. The result of the <code>toPlay</code> method is not specified
     * when the <code>gameOver</code> method returns <code>true</code>.
     * 
     * @return Return true if it is the first player's turn (x), or false if it is 
     *              the second player's turn.
     */
    @Override
    public boolean toPlay() {
        
        // Check for a game over.
        if (this.gameOver() == false) {
            // Return whose turn it is.
            return this.toPlayBoolean;
        }
        else {
            // Return unspecified boolean value.
            return true;
        }
    }

    /**
     * Determine whether a particular space is a valid move for the current player.
     *
     * If the game is over, the return value of this method is not specified..
     * 
     * @return Returns <code>true</code> if the move is legal/valid.
     */
    @Override
    public boolean isMove(final int row, final int column) {
        
        // Check if a move is valid at the board position at row and column. 
        // Based on Reversi's rules, if a token swap is valid, then a move is valid.
        return this.swaps(row, column) >= 1;
    }

    /**
     * Enumerates the valid moves on this board.
     *
     * The <code>moves</code> method returns an array of arrays of integers. Each
     * contained array is a row-column coordinate as described above. This method
     * should never return <code>null</code>; if there are no valid moves, it must
     * return a zero-element array.
     *
     * Modifications to the array returned by this method must have no effect on
     * this <code>Board</code>.
     */
    @Override
    public int[][] moves() {
        
        // Track the amount of valid moves.
        int numOfValidMovesAvailable = 0;
        
        // Count the valid moves at each board positions.
        for (int row = 1; row <= this.reversiBoard.length; row++) {
            for (int column = 1; column <= this.reversiBoard[row-1].length; column++) {
                if (this.isMove(row, column) == true) {
                    numOfValidMovesAvailable++;
                } 
            }
        }
        //System.out.println(numOfValidMovesAvailable);
        
        // This array (detailed in the Javadoc) will keep track of valid moves at each position.
        // Size will be equal to the amount of valid Moves found/counted.
        int[][] validMoves = new int[numOfValidMovesAvailable][2];
        
        // Store the valid moves.
        int nextIndex = 0;
        for (int row = 1; row <= this.reversiBoard.length; row++) {
            for (int column = 1; column <= this.reversiBoard[row-1].length; column++) {
                if (this.isMove(row, column) == true) {
                    // Store the valid move into the validMoves array.
                    validMoves[nextIndex][0] = row;
                    validMoves[nextIndex][1] = column;
                    nextIndex++;
                } 
                else {
                    
                }
            }
        }
        
        // If there are no valid moves available, 
        // replace the validMoves array with a zero-element array.
        if (numOfValidMovesAvailable == 0) {
            validMoves = new int[0][0];
        }
        
        // Return the validMoves int[][] array.
        return validMoves;
    }

    /**
     * Returns the number of opponent tokens which would be swapped as a result of a
     * move at the given <code>row</code> and <code>column</code>.
     *
     * If there is no legal move at the given coordinate, or if the coordinate is
     * not a valid coordinate, this method should return 0.
     * 
     * @return Returns the number of opponent tokens which would be swapped as a 
     * result of a move at the given <code>row</code> and <code>column</code>.
     */
    @Override
    public int swaps(final int row, final int column) {
        
        // Attempt to find swaps possible resulting from the board position 
        // of row and column.
        int swaps = 0;
        
        for (int rowChange = -1; rowChange <= 1; rowChange++) {
            for (int columnChange = -1; columnChange <= 1; columnChange++) {
                // Add up swaps from the current position at row/column.
                // Skip the condition where rowChange = 0 and columnChange = 0.
                if (rowChange == 0 && columnChange == 0) {
                    continue;
                }
                swaps += this.countSwappableFrom(row, column, rowChange, columnChange);
            }
        }
        
        return swaps;
    }

    /**
     * Returns the <code>Board</code> which results from the player indicated by
     * <code>toPlay</code> playing a token at the given board position and swapping
     * all allowed opponent tokens.
     *
     * If the <code>row</code> and <code>column</code> do not address a valid board
     * space, then this method should throw an
     * {@link java.lang.IndexOutOfBoundsException IndexOutOfBoundsException}.
     *
     * If the <code>row</code> and <code>column</code> do not address a space which
     * is a valid move for the current player, then this method should throw an
     * {@link java.lang.IllegalArgumentException IllegalArgumentException}.
     *
     * Calling this method should not alter this object in any way.
     */
    @Override
    public Board move(final int row, final int column) {
        
        // Throw IndexOutOfBoundsException if a invalid board position is given.
        if (    row < 1 || row > this.reversiBoard.length 
                || column < 1 || column > this.reversiBoard[row-1].length) {
            throw new IndexOutOfBoundsException(
                    "Index out of bounds at: (" + row + ", " + column + ")");
        }
            
        // Throw IllegalArgumentException if the board position does not address 
        // a space which is a valid move for the current player.
        if (this.isMove(row, column) == false) {
            throw new IllegalArgumentException(
                    "Illegal move at: (" + row + ", " + column + ")");
        }
        
        // Make a move at the board position at (row, column) and swap 
        // opponent tokens.
        final Board newBoard = new Board(this, row, column);
        
        // On the newBoard, it is the opponent's turn.
        if (this.toPlay() == true) {
            newBoard.toPlayBoolean = false;  // Change turn to player 2.
        }
        else {
            newBoard.toPlayBoolean = true;  // Change turn to player 1.
        }
        
        // Skip function:
        // Skip player 1 if player 1 cannot move and player 2 can move. 
        // Skip player 2 if player 2 cannot move and player 1 can move. 
        if (newBoard.moves().length == 0) {
            if (newBoard.toPlay() == true) {
                newBoard.toPlayBoolean = false;
            }
            else {
                newBoard.toPlayBoolean = true;
            }
        }
        
        // DEBUG: Print out helpful information and stats about the new board state "newBoard".
//        System.out.println("r: " + row + " c: " + column);
//        System.out.println("Player (true = P1, false = P2): " + newBoard.toPlayBoolean);
//        System.out.println("Swaps that occured: " + this.swaps(row, column));
//        System.out.println(newBoard.toString());
//        System.out.println();
        
        // Return the board with the move and swapped tokens.
        return newBoard;
    }

    /**
     * Returns the number of board positions occupied by a token of the first player
     * (<code>x</code>).
     *
     * @return A value between zero and 64 (inclusive)
     */
    @Override
    public int score1() {
        // Get Player 1's score.
        int score = 0;
        for (int row = 1; row <= this.reversiBoard.length; row++) {
            for (int col = 1; col <= this.reversiBoard[row-1].length; col++) {
                if (this.reversiBoard[row-1][col-1].equals(PLAYER_1_TOKEN)) {
                    score += 1;
                }
            }
        }
        
        // Return Player 1's score.
        return score;
    }

    /**
     * Returns the number of board positions occupied by a token of the second
     * player (<code>o</code>).
     *
     * @return A value between zero and 64 (inclusive)
     */
    @Override
    public int score2() {
        // Get Player 2's score.
        int score = 0;
        for (int row = 1; row <= this.reversiBoard.length; row++) {
            for (int col = 1; col <= this.reversiBoard[row-1].length; col++) {
                if (this.reversiBoard[row-1][col-1].equals(PLAYER_2_TOKEN)) {
                    score += 1;
                }
            }
        }
        
        // Return Player 2's score.
        return score;
    }
    
    /**
     * Return {@code true} if the space/position contains the current player's token 
     * and vice versa.
     * 
     * @param row - represents the board's row.
     * @param column - represents the board's column.
     * @return Return {@code true} if the space/position contains the current player's token.
     */
    boolean hasCurrentPlayerToken(final int row, final int column) {
        
        // Prevent index out of bounds exception for the reversiBoard array.
        if (    row < 1 || column < 1 ||
                row > this.reversiBoard.length || column > this.reversiBoard.length ) {
            return false;
        }
        
        // Is Player 1 the current player (x)?
        // Return true if the position contains player 1's token (x).
        if (this.toPlayBoolean == true) {
            return this.reversiBoard[row-1][column-1].equals(PLAYER_1_TOKEN);
        }
        
        // Is Player 2 the current player (o)?
        // Return true if the position contains player 2's token (o).
        else {
            return this.reversiBoard[row-1][column-1].equals(PLAYER_2_TOKEN);
        }
        
    }
    
    /**
     * Return {@code true} if the space/position contains the current opponent's token 
     * and vice versa.
     * 
     * @param row - represents the board's row.
     * @param column - represents the board's column.
     * @return Return {@code true} if the space/position contains the current opponent's token.
     */
    boolean hasCurrentOpponentToken(final int row, final int column) {
        
        // Prevent index out of bounds exception for the reversiBoard array.
        if (    row < 1 || column < 1 ||
                row > this.reversiBoard.length || column > this.reversiBoard.length ) {
            return false;
        }
        
        // Is Player 1 is the current opponent (o)?
        // Return true if the position contains player 1's token (o).
        if (this.toPlayBoolean == false) {
            return this.reversiBoard[row-1][column-1].equals(PLAYER_1_TOKEN);
        }
        
        // Is Player 2 is the current opponent (x)?
        // Return true if the position contains player 2's token (x).
        else {
            return this.reversiBoard[row-1][column-1].equals(PLAYER_2_TOKEN);
        }
    }
    
    /**
     * Count and return the number of opponent tokens that can be swapped using a given 
     * direction starting at <code>row</code> and <code>column</code>. 
     * 
     * <br><br>
     * The to count at least one or more swaps, the opponent's tokens must be in between two of the current 
     * player's tokens. 
     * 
     * @param row - represents the board's row.
     * @param column - represents the board's column.
     * @param rowChange - the direction of to search going up and down in the rows 
     *          of {@code reversiBoard}. 
     *          <br>({@code rowChange} = -1 [search up], 
     *          {@code rowChange} = 0 [do not search],
     *          {@code rowChange} = 1 [search down] )
     * @param columnChange - the direction to search from left to right in the columns 
     *          of {@code reversiBoard}. 
     *          <br>({@code columnChange} = -1 [search left], 
     *          {@code columnChange} = 0 [do not search],
     *          {@code columnChange} = 1 [search right] )
     * @return Return the number of opponent tokens that can be swapped.
     */
    int countSwappableFrom(final int row, final int column, 
            final int rowChange, final int columnChange) {
        
        // Prevent index out of bounds exception for the reversiBoard array.
        if (       row < 1 
                || column < 1 
                || row > this.reversiBoard.length 
                || column > this.reversiBoard.length) {
            return 0;
        }
        
        // Prevent index out of bounds exception for the reversiBoard array
        // when rowChange and columnChange are added.
        if (       row + rowChange < 1 
                || column + columnChange < 1 
                || row + rowChange > this.reversiBoard.length 
                || column + columnChange > this.reversiBoard.length) {
            return 0;
        }
        
        // Prevent the "rowChange = 0" and "columnChange = 0" condition.
        if (rowChange == 0 && columnChange == 0) {
            return 0;
        }
        
        // Make sure the "rowChange" and "columnChange" values are equal to 
        // -1, 0, and 1. If not, return 0 swaps and warn the user.
        if (rowChange != -1 && rowChange != 0 && rowChange != 1) {
            System.out.println("Invalid direction in rowChange detected = "
                    + rowChange + "   (value must be -1, 0, or 1.)");
            return 0;
        }
        if (columnChange != -1 && columnChange != 0 && columnChange != 1) {
            System.out.println("Invalid direction in columnChange detected = "
                    + columnChange + "   (value must be -1, 0, or 1.)");
            return 0;
        }
        
        //***************************************************************************
        
        // Keep track of the possible number of swappable tokens.
        int numOfSwappableTokens = 0;
        
        // Track if the currentPlayer's tokens are at the ends of one line, 
        // surrounding the opponent's pieces.
        boolean doesCurrentPlayerTokenExist = false;
        
        //***************************************************************************
        // Search through the board in a line going in the given direction and find 
        // swappable tokens from the opponent.
        int c = column;
        int r = row;
        
        int numOfSearches = 0;
        
        // While-loop condition: Keep searching while the r and c are within the valid
        // lengths of the array "reversiBoard" and limit the "numOfSearches" that occur.
        while ( r >= 1 && r <= this.reversiBoard.length
                && c >= 1 && c <= this.reversiBoard[r-1].length
                && numOfSearches <= this.reversiBoard.length) {
            
            // Find the opponent's token and increment the number of swappable tokens.
            if (this.hasCurrentOpponentToken(r, c) == true) {
                numOfSwappableTokens++;
            }
            
            // Past the 1st search, find the current player's token at the end of the 
            // token lines and the searches.
            if (numOfSearches >= 1 && this.hasCurrentPlayerToken(r, c) == true) {
                doesCurrentPlayerTokenExist = true;
                break;
            }
            
            // Make sure there are no empty spaces around the position at (row, column).
            // If there are and empty spaces around, that means there couldn't possibly 
            // be any swappable tokens nearby. Also break the search/loop.
            if (numOfSearches == 1 && this.empty(r, c) == true) {
                numOfSwappableTokens = 0;
                break;
            }
            
            // Make sure the current player's token is not in the position at 
            // (row + rowChange, column + columnChange).
            // Otherwise, break the search/loop and end with no swappable tokens.
            if (numOfSearches == 1 && this.hasCurrentPlayerToken(r, c) == true) {
                numOfSwappableTokens = 0;
                break;
            }
            
            // Make sure the current player's token is not in the position at (row, column).
            // Otherwise, break the search/loop and end with no swappable tokens.
            if (numOfSearches == 0 && this.hasCurrentPlayerToken(r, c) == true) {
                numOfSwappableTokens = 0;
                break;
            }
            
            // Make sure the current opponent's token is not in the position at (row, column).
            // Otherwise, break the search/loop and end with no swappable tokens.
            if (numOfSearches == 0 && this.hasCurrentOpponentToken(r, c) == true) {
                numOfSwappableTokens = 0;
                break;
            }
            
            // Increment the r and c counters in the correct directions.
            r += rowChange;
            c += columnChange;
            
            // Increment the number of searches that were done in the loop by 1.
            numOfSearches++;
        }
        
        // If we did not find current player's token at the end of the searches, 
        // then there are no swaps that are possible.
        if (doesCurrentPlayerTokenExist == false) {
            numOfSwappableTokens = 0;
        }
        
        return numOfSwappableTokens;
    }

}
