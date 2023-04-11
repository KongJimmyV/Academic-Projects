
import java.awt.Point;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import java.util.Random;
import java.util.Scanner;

/**
 * Scrabble
 * 
 * Description:
 *      - The Scrabble Application.
 * 
 * Project:     Assignment 3 - Scrabble
 * Class:       CS451
 * Team:        Hunter Sutter, Kong Jimmy Vang
 * 
 * Revised and Edited by: Kong Jimmy Vang
 * 
 * @author Hunter Sutter
 */
public class Scrabble {
    
    //=== CLASS VARIABLES
    public static File words = new File("./src/OWL-new.txt");
    
	private HashMap<Character, Integer> tileVals; // Stores information about the values of each letter.
	private HashMap<Character, Integer> tileNums; // Game Bag that stores all letters.
	
	private Tile[][] board; // Game board that stores all board tiles.
	private HashSet<Point> boardPlacedLetters; // Stores temporary points where letters are placed.
	
	private HashSet<Tile> leftmostTiles;   // Stores a temporary list of all the leftmost tiles.
	private HashSet<Tile> topmostTiles;    // Stores a temporary list of all the topmost tiles.
	protected HashSet< ArrayList<Tile> > validWordLists;   // Stores a temporary list of all valid word lists.
	protected HashSet< ArrayList<Tile> > invalidWordLists; // Stores a temporary list of all invalid word lists.
	
	protected ArrayList<String> lastWordScores;
	protected ArrayList<String> lastLetterScores;
	
	   
    protected boolean isFirstTurn;
    
    final static protected int MAX_PLAYERS = 4;
    protected String difficulty;
    protected int numPlayers;
    
    protected int boardSize;
	
	protected int winnerScore;
	protected int[] playerScores;
	protected String winnerName;
	protected String[] playerNames;
	
	protected int currentTurn;     // current player's turn (1 = player 1, 2 = player 2 ...)
	//private boolean gameOver;
	
	
	//=== MAIN
	public static void main(String[] args) throws FileNotFoundException, Exception {
	    
	    // Scan input
		Scanner s = new Scanner(System.in);
		
		// Choose difficulty
		System.out.print("Choose Difficulty (beginner, challenger): ");
		String difficulty = s.next();
		System.out.println();
		
		// Choose number of players
		System.out.print("Choose Number Of Players (2, 3, 4): ");
		int numPlayers = s.nextInt();
		System.out.println();
		
		// Build app
		Scrabble app = new Scrabble(difficulty, numPlayers);
		
		// TEST INPUT - Change testString to test different words
		ArrayList<Tile> test = new ArrayList<>();
		String testString = "ZOOGEOGRAPHICAL";
		for (int i = 0; i < testString.length(); i++) {
			Tile x = new Tile();
			x.letter = testString.charAt(i);
			test.add(x);
		}
		System.out.println(  app.checkWord(test)  );
		System.out.println(  app.getScore(test)  );
		
		// VIEW tileNums
		for(Entry<Character, Integer> entry : app.tileNums.entrySet()) {
            //System.out.println( entry.getKey() + ": " +  entry.getValue().toString() + " (" + (int)entry.getKey() + ")" );
        }
		
		// TEST DrawTile function.
		// Draw 101 tiles. Should throw an exception since there are only 100 tiles to draw from.
		try {
            
		    for (int i = 0; i < 100; i++) {
		        
		        String drawTileString = app.drawTile();
    		    //System.out.println(  String.format("\nDrawTile: %s", drawTileString)  );
                
                for(Entry<Character, Integer> entry : app.tileNums.entrySet()) {
                    //System.out.println( entry.getKey() + ": " +  entry.getValue().toString() + " (" + (int)entry.getKey() + ")" );
                }
		    }
		    System.out.println(  String.format("\nDrawn 100 tiles, attempting to draw 1 more tile. This must throw an exception, otherwise something is wrong.")  );
		    
		    // Draw 1 more tile. this should throw an exception.
		    String drawTileString = app.drawTile();
		    System.out.println(  String.format("\nWARNING: If this prints, then there are too many tiles.")  );
		    
        } catch (Exception e) {
            e.printStackTrace();
        }
		
		
	}
	
	
	//=== CONSTRUCTORS
	/**
     * Constructs a Scrabble Application.
     * Defaults to "beginner" and 2 players.
	 * @throws Exception   Throws an error if the parameters are invalid.
     */
    public Scrabble() throws Exception {
        
    }
	
	/**
	 * Constructs a Scrabble Application.
	 * Must be 2 players for "beginner".
	 * Must be 2 to 4 players for "challenger".
	 * 
	 * @param difficulty - Must be a string of "beginner" or "challenger".
	 * @param numPlayers - The number of players. Must be 2 players for "beginner". Must be 2 to 4 players for "challenger".
	 * @throws Exception   Throws an error if the parameters are invalid.
	 */
	public Scrabble(String difficulty, int numPlayers) throws Exception {
	    this.difficulty = difficulty;
	    this.numPlayers = numPlayers;
	    
	    if (this.difficulty.equals("beginner")) {
	        if (this.numPlayers != 2) {
	            throw new Exception(String.format(" Scrabble::Constructor2: Beginner difficulty can only have 2 players. (%s, %d) ", this.difficulty, this.numPlayers) );
	        }
	    } else {
	        if (2 > this.numPlayers && this.numPlayers > 4) {
	            throw new Exception(String.format(" Scrabble::Constructor2: Challenger difficulty should only have 2, 3, or 4 players. (%s, %d) ", this.difficulty, this.numPlayers) );
            }
	    }
	    
	    initialize();
	}
	
	//=== METHODS
	/**
	 * Initialize the tile stack.
	 */
	private void initializeTileStack() {
	    
		// A map that holds how many of each tile remains in the pile
	    tileNums = new HashMap<>();
		
		// A map that holds the score value of each tile
		tileVals = new HashMap<>();
		
		tileVals.put(' ', 0);
		// Adds the score of each letter to the tileVals map
		for (int i = 65; i < 91; i++) {
			// A E I L N O R S T U (1-point)
			if (i == 65 || i == 69 || i == 73 || i == 76 || i == 78 || i == 79 || i == 82 || i == 83 || i == 84
					|| i == 85) {
				tileVals.put((char) i, 1);
			}
			// F H V W Y (4-point)
			else if (i == 70 || i == 72 || i == 86 || i == 87 || i == 89) {
				tileVals.put((char) i, 4);
			}
			// B C M P (3-point)
			else if (i == 66 || i == 67 || i == 77 || i == 80) {
				tileVals.put((char) i, 3);
			}
			// D G (2-point)
			else if (i == 68 || i == 71) {
				tileVals.put((char) i, 2);
			}
			// J X (8-point)
			else if (i == 74 || i == 88) {
				tileVals.put((char) i, 8);
			}
			// Q Z (10-point)
			else if (i == 81 || i == 90) {
				tileVals.put((char) i, 10);
			}
			// K (5-point)
			else {
				tileVals.put((char) i, 5);
			}
		}
		// Adds the quantity of each letter in the pile
		for (int i = 65; i < 91; i++) {
			if (i == 66 || i == 67 || i == 70 || i == 72 || i == 77 || i == 80 || i == 86 || i == 87 || i == 89) {
				tileNums.put((char) i, 2);
			} else if (i == 74 || i == 75 || i == 81 || i == 88 || i == 90) {
				tileNums.put((char) i, 1);
			} else if (i == 68 || i == 76 || i == 83 || i == 85) {
				tileNums.put((char) i, 4);
			} else if (i == 65 || i == 73) {
				tileNums.put((char) i, 9);
			} else if (i == 69) {
				tileNums.put((char) i, 12);
			} else if (i == 71) {
				tileNums.put((char) i, 3);
			} else if (i == 78 || i == 82 || i == 84) {
			    tileNums.put((char) i, 6);
			} else {
				tileNums.put((char) i, 8);
			}
		}
		tileNums.put(' ', 2);
	}

	/**
	 * Initialize the board.
	 * @param difficulty
	 * @param numPlayers
	 */
	protected void initialize() {
		// Creates the maps for the number of tiles and their values
		initializeTileStack();
		
		// Initialize board size.
		if (difficulty.equals("beginner")) {
		    this.boardSize = 11;
		} else {
		    this.boardSize = 15;
		}
		
		// Initialize class variables
		this.isFirstTurn = true;
		
		this.winnerScore = 0;
		this.playerScores = new int[MAX_PLAYERS];
		
        this.winnerName = "N/A";
        this.playerNames = new String[MAX_PLAYERS];
		
		this.currentTurn = 1;
		
        boardPlacedLetters = new HashSet<>();   // Stores temporary points where letters are placed.
        leftmostTiles = new HashSet<>();        // Stores a temporary list of all the leftmost tiles.
        topmostTiles = new HashSet<>();         // Stores a temporary list of all the topmost tiles.
        validWordLists = new HashSet<>();       // Stores a temporary list of all valid word lists.
        invalidWordLists = new HashSet<>();     // Stores a temporary list of all invalid word lists.
        
        lastWordScores = new ArrayList<>();       // Stores scores of the last words that were created
        lastLetterScores = new ArrayList<>();     // Stores scores of the last letters that were used
		
		// A 2D array of Tile objects that comprises the board
		board = new Tile[boardSize][boardSize];
		
		// Adding special score bonuses to the board
		for (int i = 0; i < boardSize; i++) {
			for (int j = 0; j < boardSize; j++) {
			    
				board[i][j] = new Tile(i, j);
				
				// Starting tile
				if ((i == boardSize / 2) && (j == boardSize / 2)) {
					board[i][j].special = "ST";
				}
				// All triple word tiles
				else if ((i == 0 || i == boardSize / 2 || i == (boardSize - 1))
						&& (j == 0 || j == boardSize / 2 || j == (boardSize - 1))) {
					board[i][j].special = "TW";
				}
				// Outer triple letter tiles
				else if ((i == 1 || i == boardSize - 2) && ((j == (boardSize / 2) - 2) || (j == (boardSize / 2) + 2))) {
					board[i][j].special = "TL";
				} else if ((j == 1 || j == boardSize - 2)
						&& ((i == (boardSize / 2) - 2) || (i == (boardSize / 2) + 2))) {
					board[i][j].special = "TL";
				}
				// All double word tiles
				else if ((i > 0 && i < boardSize - 1) && (i == j || j == (boardSize - 1) - i)) {
					// Inner triple letter tiles
					if (boardSize == 15 && (i == 5 || i == 9)) {
						board[i][j].special = "TL";
						// Inner double letter tiles
					} else if (boardSize == 15 && (i == 6 || i == 8)) {
						board[i][j].special = "DL";
					} else {
						board[i][j].special = "DW";
					}
				}
				// Double letters for beginner board
				else if (boardSize == 11) {
					if ((((i == boardSize / 2 - 3) || (i == boardSize / 2 + 3)) && j == boardSize / 2)
							|| (((j == boardSize / 2 - 3) || (j == boardSize / 2 + 3)) && i == boardSize / 2)) {
						board[i][j].special = "DL";
					}
				}
				//Double letters for challenger board
				else if (boardSize == 15) {
					if(((i == 0 || i == 14) && (j == 3 || j == 11)) ||
							((i == 2 || i == 12) && (j == 6 || j == 8)) ||
							((i == 3 || i == 11) && j == 7)){
						board[i][j].special = "DL";
					} else if(((j == 0 || j == 14) && (i == 3 || i == 11)) ||
							((j == 2 || j == 12) && (i == 6 || i == 8)) ||
							((j == 3 || j == 11) && i == 7)) {
						board[i][j].special = "DL";
					}
				}
				// Prints out the board for debugging purposes
				System.out.print(" [" + board[i][j].special + "] ");
			}
			// Formatting to make the board more readable
			System.out.println();
			System.out.println();
		}
	}

	/**
	 * Draws/Takes a letter tile from the bag, "tileVals".
	 * Decrement 1 tile from "tileVals" for the chosen tile.
	 * 
	 * @return Returns a string representing a tile.
	 * @throws Exception Throws an exception if there are no more tiles to draw from.
	 */
	protected String drawTile() throws Exception {
        Random rand = new Random();
        
        int size = tileNums.size();
        //System.out.println("Size: " + size);
        
        if (size <= 0) {
            throw new Exception(" Scrabble::drawTile: No more tiles to draw from. ");
        }
        
        int randNum = rand.nextInt(size);
        int i = 0;
        
        for(Entry<Character, Integer> entry : tileNums.entrySet()) {
            //System.out.println(entry.getKey() + ": " +  entry.getValue().toString());
            Character character = entry.getKey();
            Integer integer = entry.getValue();
            integer--;
            
            if (randNum == i) {
                tileNums.put(character, integer);
                if (integer == 0) {
                    tileNums.remove(character);
                }
                
                return entry.getKey().toString();
            }
            
            i++;
        }
        
        throw new Exception(" Scrabble::drawTile: No more tiles to draw from. ");
    }
	
	/**
     * Puts a letter tile back into the bag, "tileVals".
     * Increment 1 tile into "tileVals" for the chosen tile letter.
     */
    protected void putTile(Character letter) {
        
        Integer integer = tileNums.get(letter);
        
        if (null != integer) {
            integer++;
            tileNums.put(letter, integer);
        } else {
            integer = 1;
            tileNums.put(letter, integer);
            
            //throw new Exception( String.format(" Scrabble::putTile: That tile letter does not exist in this game. Letter = \"%c\" ", letter) );
        }
    }
	
    /**
     * Places a letter tile down on the board at a given row and column.
     * 
     * @param row           - row
     * @param col           - column
     * @param letter        - letter to place down on tile
     * @param isBlank       - set the tile as a BLANK ' ' tile or not.
     * @throws Exception    Throws exception if a tile already exists at row and column.
     */
	protected void placeTile(int row, int col, char letter, boolean isBlank) throws Exception {
	    if (board[row][col].open == true) {
    	    boardPlacedLetters.add(new Point(col, row));
    	    

            //System.out.println(String.format("placing tile at: %d %d", row, col));
    	    
    	    board[row][col].open = false;
    	    board[row][col].letter = letter;
    	    board[row][col].isBlank = isBlank;
	    } else {
	        throw new Exception(String.format(" Scrabble::placeTile: A tile already exists at row:%d col:%d for letter %c ", row, col, letter) );
	    }
	}
	

	/**
	 * Clears the letter from the tile on the board's row and column.
	 * @param row
	 * @param col
	 * @throws Exception
	 * 
	 * @deprecated use {@link #redoPlacedLetters()} instead.  
	 */
	protected void clearTile(int row, int col) throws Exception {
    	if (board[row][col].open == false) {
    	    boardPlacedLetters.remove( new Point(col, row) );
            
            board[row][col].open = true;
            board[row][col].prevLetter = board[row][col].letter;
            board[row][col].letter = ' ';
            board[row][col].isBlank = false;
        } else {
            throw new Exception(String.format(" Scrabble::clearTile: Tile is already cleared at row:%d col:%d ", row, col) );
        }
    }
	
	/**
	 * Reverts the board back to it's last state by redoing the last placed tiles.
	 * Requires "boardPlacedLetters".
	 */
    protected void redoPlacedLetters() {
        Iterator<Point> it = boardPlacedLetters.iterator();
        while (it.hasNext()) {
            Point point = it.next();
            
            Integer row = point.y;
            Integer col = point.x;
            
            //System.out.println(String.format("removing placed tile at: %d %d", row, col));
            
            board[row][col].open = true;
            board[row][col].prevLetter = board[row][col].letter;
            board[row][col].letter = ' ';
            board[row][col].isBlank = false;
        }
        
        boardPlacedLetters.clear();
    }
	
    /**
     * Attempt to end the current player's turn.
     * Any throws from here must call <code>redoPlacedLetters()</code>.
     * 
     * @throws FileNotFoundException
     * @throws Exception
     * @return Returns the score that the player received.
     */
	protected int endTurn() throws FileNotFoundException, Exception {
	    
	    // Clear last scores.
	    lastWordScores.clear();
	    lastLetterScores.clear();
	    
	    int score = 0;
	    
	    try {
    	    // Check if there are any placed tiles.
    	    if (boardPlacedLetters.isEmpty()) {
    	        return 0;
    	    }
    	    
    	    // Validate Turn.
    	    validateTurn();
    	    
    	    // Score the words for the current player and add the scores to their total
            Iterator< ArrayList<Tile> > it = validWordLists.iterator();
            while (it.hasNext()) {
                ArrayList<Tile> wordList = it.next();
                score = getScore(wordList);
                
                playerScores[currentTurn - 1] += score;
            }
            
            // Lock all placed letters on the board and remove bonuses on placed board tiles.
            Iterator<Point> itPoints = boardPlacedLetters.iterator();
            while (itPoints.hasNext()) {
                Point p = itPoints.next();
                board[p.y][p.x].locked = true;
                //board[p.y][p.x].special = "NA";
                board[p.y][p.x].allowSpecial = false;
            }
            
            boardPlacedLetters.clear();
            isFirstTurn = false;
            
	    } catch (Exception e) {
	        
	        // Exception found. Redo the board state.
	        redoPlacedLetters();
	        throw e;
	    }
	    
	    return score;
	}
	
	/**
	 * Validate the entire turn. Apply the game rules and logic here.
	 * Any throws from here will call <code>redoPlacedLetters()</code> in {@link #endTurn()}.
	 * 
	 * @throws FileNotFoundException
	 * @throws Exception
	 */
	private void validateTurn() throws FileNotFoundException, Exception {
	    
	    // Clear topmostTiles and leftmostTiles lists
	    topmostTiles.clear();
	    leftmostTiles.clear();
	    
	    // Clear word sets.
        validWordLists.clear();
        invalidWordLists.clear();
	    
        //=== Validate whether the starting point has been first played on.
        int start = boardSize/2;
        boolean isOpen = board[start][start].open;
        if (isOpen) {
            throw new Exception( String.format(" Scrabble:StartingPoint:validateTurn: You must play your first letter on the starting point.") );
        }
        
	    //=== Validate placements of the letters. Placements must be either horizontal or vertical.
        //=== Also validate whether or not a play was made next to the board's letter tiles.
        //=== Also validate adjacency.
        boolean isAdjacent = true;
        boolean isHorizontal = true;
        boolean isVertical = true;
        boolean isPlacementValid = false;
        
        int maxRow = Integer.MIN_VALUE;
        int maxCol = Integer.MIN_VALUE;
        
        int minRow = Integer.MAX_VALUE;
        int minCol = Integer.MAX_VALUE;
        
        Point prevPoint = boardPlacedLetters.iterator().next();
        Point curPoint = null;
        
        Iterator<Point> itPoints = boardPlacedLetters.iterator();
        while (itPoints.hasNext()) {
            curPoint = itPoints.next();
            int row = curPoint.y;
            int col = curPoint.x;
            
            // All letter and their x values must equal each other. If not, set isVertical to false.
            if (row != prevPoint.y) {
                isHorizontal = false;
            }
            
            // All letters and their y values must equal each other.  If not, set isHorizontal to false.
            if (col != prevPoint.x) {
                isVertical = false;
            }
            
            // Check whether this played letter tile is next to an already existing tile on the board.
            if ( row - 1 >= 0         && board[row - 1][col].locked) {
                isPlacementValid = true;
            }
            if ( row + 1 < boardSize  && board[row + 1][col].locked) {
                isPlacementValid = true;
            }
            if ( col - 1 >= 0         && board[row][col - 1].locked) {
                isPlacementValid = true;
            }
            if ( col + 1 < boardSize  && board[row][col + 1].locked) {
                isPlacementValid = true;
            }
            
            // Get max and mins
            if ( row > maxRow ) {
                maxRow = row;
            }
            if ( col > maxCol ) {
                maxCol = col;
            }
            if ( row < minRow ) {
                minRow = row;
            }
            if ( col < minCol ) {
                minCol = col;
            }
            
            prevPoint = curPoint;
        }
        //System.out.println("isHorizontal: " + isHorizontal);
        //System.out.println("isVertical: " + isVertical);
        //System.out.println("maxX: " + maxRow);
        //System.out.println("maxY: " + maxCol);
        //System.out.println("minX: " + minRow);
        //System.out.println("minY: " + minCol);
        
        // All letter must be adjacent. If not, set isAdjacent to false.
        if (isHorizontal) {
            int row = curPoint.y;
            for(int col = minCol; col < maxCol; col++) {
                if (board[row][col].open) {
                    isAdjacent = false;
                }
            }
        }
        if (isVertical) {
            int col = curPoint.x;
            for(int row = minRow; row < maxRow; row++) {
                if (board[row][col].open) {
                    isAdjacent = false;
                }
            }
        }
        
        if (!isAdjacent) {
            throw new Exception( String.format(" Scrabble:Placement:validateTurn: Your letter placements must have no gaps between each other.") );
        }
        if (!isVertical && !isHorizontal) {
            throw new Exception( String.format(" Scrabble:Placement:validateTurn: Your letter placements must be either horizontal or vertical.") );
        }
        if (!isPlacementValid && !isFirstTurn) {
            throw new Exception( String.format(" Scrabble:Placement:validateTurn: You must place one of your letters next to an already existing letter on the board.") );
        }
        
	    //=== Get topmost and leftmost tiles on the board for every row and column.
        itPoints = boardPlacedLetters.iterator();
        while (itPoints.hasNext()) {
            Point point = itPoints.next();
            
            Integer row = point.y;
            Integer col = point.x;
            
            // get topmost closed letter tile
            Tile topmost = getTopmostTile(row, col);
            topmostTiles.add(topmost);
            
            // get leftmost closed letter tile
            Tile leftmost = getLeftmostTile(row, col);
            leftmostTiles.add(leftmost);
        }
	    
	    //=== Beginner: Find words that are inclusively between 2 to 4 letters in length.
	    if ( "beginner".equals(this.difficulty) ) {
	        Iterator<Tile> it;
	        
	        //System.out.println();
	        
	        // Find words from topmost tiles.
	        it = topmostTiles.iterator();
	        while (it.hasNext()) {
	            Tile tile = it.next();
	            //System.out.println("topmost: " + tile.letter);
	            
	            ArrayList<Tile> wordList = getWordTopToBottom( tile );
	            
	            int length = wordList.size();
	            if ( 2 <= length && length <= 4 ) {
	                
	                boolean isValid = checkWord(wordList);
	                if (isValid) {
	                    validWordLists.add( wordList );
	                } else {
	                    invalidWordLists.add( wordList );
	                }
	                
	            } else if (length > 4) {
	                throw new Exception( String.format(" Scrabble::validateTurn: The word \"%s\" must be 2 to 4 letters long.", getWordListString(wordList)) );
                }
	        }
	        
	        // Find words from leftmost tiles.
	        it = leftmostTiles.iterator();
            while (it.hasNext()) {
                Tile tile = it.next();
                //System.out.println("leftmost: " + tile.letter);
                
                ArrayList<Tile> wordList = getWordLeftToRight( tile );
                
                int length = wordList.size();
                if ( 2 <= length && length <= 4 ) {
                    
                    boolean isValid = checkWord(wordList);
                    if (isValid) {
                        validWordLists.add( wordList );
                    } else {
                        invalidWordLists.add( wordList );
                    }
                } else if (length > 4) {
                    throw new Exception( String.format(" Scrabble::validateTurn: The word \"%s\" must be 2 to 4 letters long.", getWordListString(wordList)) );
                }
            }
            
        //=== Challenger: Find words that are larger than or equal to 2 letters in length.
	    } else {
	    
            Iterator<Tile> it;

            //System.out.println();
            
            // Find words from topmost tiles.
            it = topmostTiles.iterator();
            while (it.hasNext()) {
                Tile tile = it.next();
                //System.out.println("topmost: " + tile.letter);
                
                ArrayList<Tile> wordList = getWordTopToBottom( tile );
                
                int length = wordList.size();
                if ( 2 <= length ) {
                    
                    boolean isValid = checkWord(wordList);
                    if (isValid) {
                        validWordLists.add( wordList );
                    } else {
                        invalidWordLists.add( wordList );
                    }
                }
                
            }
            
            // Find words from leftmost tiles.
            it = leftmostTiles.iterator();
            while (it.hasNext()) {
                Tile tile = it.next();
                ArrayList<Tile> wordList = getWordLeftToRight( tile );
                //System.out.println("leftmost: " + tile.letter);
                
                int length = wordList.size();
                if ( 2 <= length ) {
                    
                    boolean isValid = checkWord(wordList);
                    if (isValid) {
                        validWordLists.add( wordList );
                    } else {
                        invalidWordLists.add( wordList );
                    }
                    
                } 
            }
	    }
	    
        // Check if any valid words exist.
        if ( validWordLists.isEmpty() ) {
            throw new Exception(" Scrabble:WordList:validateTurn: There are no valid words. ");
        }
        if ( invalidWordLists.size() > 0 ) {
            throw new Exception(" Scrabble:WordList:validateTurn: There are invalid words found. ");
        }
	    
	}
	
	/**
     * Get the topmost closed letter tile starting at board[row][col].
     * 
     * @param row
     * @param col
     * @return Returns the topmost closed tile.
     */
	protected Tile getTopmostTile(int row, int col) {
	    Tile tile = board[row][col];
	    
	    //check row
	    if (row > 0 && board[row - 1][col].open == false) {
	        tile = getTopmostTile(row - 1, col);
        }
	    
	    return tile;
	}
	
	/**
	 * Get the leftmost closed letter tile starting at board[row][col].
	 * 
	 * @param row
	 * @param col
	 * @return Returns the leftmost closed tile.
	 */
	protected Tile getLeftmostTile(int row, int col) {
        Tile tile = board[row][col];
        
        //check col
        if (col > 0 && board[row][col - 1].open == false) {
            tile = getLeftmostTile(row, col - 1);
        }
        
        return tile;
    }
	
    /**
     * Get a word list of tiles starting from the given starting tile.
     * 
     * The starting tile must be from the board.
     * Goes from top to bottom on the board.
     * 
     * @param startingTile - The given starting tile.
     * @return Returns a word list of tiles starting from the given starting tile.
     */
    protected ArrayList<Tile> getWordTopToBottom(Tile startingTile) {
        
        ArrayList<Tile> wordList = new ArrayList<Tile>();
        //System.out.println("TopBot StartingTile: " + startingTile.row + " " + startingTile.col);
        
        for(int r = startingTile.row; r < this.boardSize; r++) {
            Tile tempTile = board[r][startingTile.col];
            
            if (tempTile.open == false) {
                wordList.add( tempTile );
            } else {
                break;
            }
        }
        
        return wordList;
    }
    
    /**
     * Get a word list of tiles starting from the given starting tile.
     * 
     * The starting tile must be from the board.
     * Goes from left to right on the board.
     * 
     * @param startingTile - The given starting tile.
     * @return Returns a word list of tiles starting from the given starting tile.
     */
    protected ArrayList<Tile> getWordLeftToRight(Tile startingTile) {
        
        ArrayList<Tile> wordList = new ArrayList<Tile>();
        //System.out.println("LeftRight StartingTile: " + startingTile.row + " " + startingTile.col);
        
        for(int c = startingTile.col; c < this.boardSize; c++) {
            Tile tempTile = board[startingTile.row][c];
            
            if (tempTile.open == false) {
                wordList.add( tempTile );
            } else {
                break;
            }
        }
        
        return wordList;
    }
    
    /**
     * Get the String value from a word list of tiles.
     * 
     * @param wordList
     * @return Returns the String value from a word list of tiles.
     */
    protected String getWordListString(ArrayList<Tile> wordList) {
        String word = "";
        
        Iterator<Tile> it = wordList.iterator();
        while (it.hasNext()) {
            Tile tile = it.next();
            
            if (tile.open) {
                word = word.concat( String.valueOf(tile.prevLetter) );
            } else {
                word = word.concat( String.valueOf(tile.letter) );
            }
        }
        
        return word;
    }
    
    /**
     * Checks the validity of a word.
     * @param wordList
     * @return Returns true if the word is in the dictionary file, otherwise return false.
     * @throws FileNotFoundException
     */
	protected boolean checkWord(ArrayList<Tile> wordList) throws FileNotFoundException {
		boolean valid = false;
		Scanner f = new Scanner( words );
		String test = f.next();
		String word = "";
		for (int i = 0; i < wordList.size(); i++) {
			word = word + wordList.get(i).letter;
		}
		System.out.println("checkWord - " + word);
		
		while (f.hasNext()) {
			if (test.equals(word)) {
				valid = true;
			}
			test = f.next();
		}
		if (test.equals(word)) {
			valid = true;
		}
		f.close();
		return valid;
	}

	/**
	 * Takes in an array list of tile objects and tallies up the score of each tile
     *      in the list.
     *      
	 * @param word
	 * @return Returns a score for the given word.
	 */
	protected int getScore(ArrayList<Tile> word) {
	    
		int score = 0;
		int tripleWord = 0;
		int doubleWord = 0;
		
		for (int i = 0; i < word.size(); i++) {
			Tile curTile = word.get(i);
			
			// Score BLANK letter.
			if (curTile.isBlank) {
			    score = score + 0;
			    
			// Score letters A-Z.
			} else {
			    
			    if (curTile.allowSpecial) {
        			if (curTile.special == "DL") {
        				score = score + (2 * (tileVals.get(curTile.letter)));
        				lastLetterScores.add( String.format("%s = %d    [ %d × 2 ]  (Double Letter Score)", 
        				                                    curTile.letter, tileVals.get(curTile.letter) * 2, tileVals.get(curTile.letter)) );
        				continue;
        			} else if (word.get(i).special == "TL") {
        				score = score + (3 * (tileVals.get(curTile.letter)));
        				lastLetterScores.add( String.format("%s = %d    [ %d × 3 ]  (Triple Letter Score)", 
        				                                    curTile.letter, tileVals.get(curTile.letter) * 3, tileVals.get(curTile.letter)) );
        				continue;
        			} else if (curTile.special == "DW") {
        				doubleWord++;
        			} else if (curTile.special == "TW") {
        				tripleWord++;
        			}
			    }
			    
    			score = score + (tileVals.get(curTile.letter));
    			lastLetterScores.add( String.format("%s = %d", curTile.letter, tileVals.get(curTile.letter)) );
			}
		}
		
		String str = String.format("%s = ", getWordListString(word));
		String str2 = String.format("[ ");
		
		if (tripleWord > 0) {
		    str2 = str2 + String.format("%d ", score);
		    
			score = 3 * tripleWord * score;
			
			str2 = str2 + String.format("× %d ", 3 * tripleWord);
		}
		
		if (doubleWord > 0) {
		    if (tripleWord <= 0) {
		        str2 = str2 + String.format("%d ", score);
		    }
		    
			score = 2 * doubleWord * score;
			
			str2 = str2 + String.format("× %d ", 2 * doubleWord);
		} else {
		    str2 = "";
		}
		
		if (tripleWord > 0 && doubleWord > 0) {
		    str2 = str2 + String.format("]  ( %d × Triple Word Tiles; %d × Double Word Tiles ) ", tripleWord, doubleWord);
		} else if (tripleWord > 0) {
		    str2 = str2 + String.format("]  ( %d × Triple Word Tiles ) ", tripleWord);
        } else if (doubleWord > 0) {
            str2 = str2 + String.format("]  ( %d × Double Word Tiles ) ", doubleWord);
        }

		str = str + String.format("%d   ", score);
		str = str + str2;
		
		lastWordScores.add( str );
		
		return score;
	}
	
	/**
	 * Returns a HashMap of winners.
	 * @return Returns a HashMap of winners. Key = player name. Value = player score.
	 */
	protected HashMap<String, Integer> gameOver() {
	    int highestScore = Integer.MIN_VALUE;
	    for (int i = 0; i < numPlayers; i++) {
	        if (playerScores[i] > highestScore) {
	            winnerName = playerNames[i];
	            highestScore = playerScores[i];
	        }
	    }
	    
	    winnerScore = highestScore;
	    
	    HashMap<String, Integer> listOfWinners = new HashMap<>();
	    for (int i = 0; i < numPlayers; i++) {
	        if (winnerScore == playerScores[i]) {
	            listOfWinners.put(playerNames[i], playerScores[i]);
	        }
        }
	    
	    return listOfWinners;
	}
	
	//=== SETTERS AND GETTERS
	
	
}
