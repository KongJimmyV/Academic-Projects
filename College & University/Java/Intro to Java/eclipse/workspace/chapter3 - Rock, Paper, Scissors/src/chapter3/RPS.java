package chapter3;

import java.util.Random;

import javax.swing.JOptionPane;

/*************************************************************************
 * File Name: 		RPS.java 
 * Created by: 		Jimmy Vang 
 * Date Started: 	9/23/2016 
 * Date Finished: 	9/29/2016
 * *********************************************************************** 
 * This game program lets you play Rock, Paper, Scissors.
 * ***********************************************************************
 */

////////////////////////////////////////
//  RPS.java program starts here  //
////////////////////////////////////////
public class RPS {
	////////////////////////
	//  Global Variables  //
	////////////////////////
		// Initialize Variables for quitting the game
		static String confirmQuitTitle = "Quit";
		static String confirmQuitMessage = "Are you sure you want to quit?";
		static String confirmQuitChoices[] = { "Yes", "No" };
		
		// Initialize Game Components
		static Boolean isGameRunning = false;		//  This checks if the game is still running.  \\
		static Random rand = new Random();			//  This creates a random number generator.	   \\
		
	////////////////////
	//  Main program  //
	////////////////////
	public static void main(String[] args) {
		
		// This while loop below needs to be true to allow the game to return to the main menu.
		while (true) {
			/////////////////
			//  Main Menu  //
			/////////////////
			
			// Show Main Menu Dialog Box while game is not running
			while (isGameRunning == false) {
				final String MAIN_MENU_TITLE = "Rock, Paper, Scissors";
				final String MAIN_MENU_MESSAGE = "Welcome to Rock, Paper, Scissors.\n" 
						+ "Click \"New Game\" to start.";
				final String MAIN_MENU_CHOICES[] = { "New Game", "Quit" };
				int mainMenuDialog = JOptionPane.showOptionDialog(null, MAIN_MENU_MESSAGE, MAIN_MENU_TITLE,
						JOptionPane.DEFAULT_OPTION, JOptionPane.INFORMATION_MESSAGE, null, MAIN_MENU_CHOICES,
						MAIN_MENU_CHOICES[0]);
				// Check what button is clicked
				switch (mainMenuDialog) {
				case 0:	
					// - Clicked "New Game"
					isGameRunning = true;
					break;
				case 1:	
					// - Clicked "Quit"
					// Set Dialog Box
					confirmQuitTitle = "Quit";
					confirmQuitMessage = "Are you sure you want to quit?";
					confirmQuitChoices[0] = "Yes";
					confirmQuitChoices[1] = "No";
					// Show Dialog Box
					confirmQuit();
					break;
				case JOptionPane.CLOSED_OPTION:
					// - Clicked "X"
					confirmQuit();
					break;
				default:
					// - Clicked none of the above
					System.out.println("?");
					break;
				}
			}
			
			//////////////////////////
			//  The Game's Manager  //
			//////////////////////////
			while (isGameRunning == true) {
				
				//////////////////////////////////
				//  Set Game Manager Variables  //
				//////////////////////////////////
				
				// Initialize Random Number Generators
				int n = rand.nextInt(3) + 0;	// For Highlighting a random button
				
				// Initialize Players
				String playerOne = "Player 1";	// Name for Player 1
				String playerTwo = "Player 2";	// Name for Player 2
				String playerChoice[] = { "no player", "player 1", "player 2" };
				
				// Initialize Turns
				int player = 0;					// Integer for deciding player turn. ["1" = Player 1] ["2" = Player 2]
				int gameWinner = 0;				// Decides winner
				
				// Initialize Dialog Box Settings
				String rpsTitle = "Rock, Paper, Scissors";
				String rpsMessage = "Select your choice.";
				String rpsChoice[] = { "Rock", "Paper", "Scissors" };
				
				///////////////////////
				//  Player 1's Turn  //
				///////////////////////
				player = 1;
				while (player == 1 && isGameRunning == true) {
					n = rand.nextInt(3) + 0;	// Highlight random button
					// Show Dialog Box
					rpsTitle = "Rock, Paper, Scissors";
					rpsMessage = playerOne + ". " + "Select your choice.";
					int rpsDialog = JOptionPane.showOptionDialog(null, rpsMessage, rpsTitle,
							JOptionPane.DEFAULT_OPTION, JOptionPane.PLAIN_MESSAGE, null, rpsChoice,
							rpsChoice[n]);
					// Check what button is clicked
					switch (rpsDialog) {
					//- Clicked "Rock"
					case 0:	
						playerChoice[player] = "rock";
						player = 0;
						break;
					//- Clicked "Paper"
					case 1:	
						playerChoice[player] = "paper";
						player = 0;
						break;
					//- Clicked "Scissors"
					case 2:	
						playerChoice[player] = "scissors";
						player = 0;
						break;
					//- Clicked "X"
					case JOptionPane.CLOSED_OPTION:	
						confirmQuit();
						break;
					// - Clicked none of the above
					default:
						System.out.println("?");
						System.exit(0);
						break;
					}
				}
				
				///////////////////////
				//  Player 2's Turn  //
				///////////////////////
				player = 2;
				while (player == 2 && isGameRunning == true) {
					n = rand.nextInt(3) + 0;	// Highlight random button
					// Show Dialog Box
					rpsTitle = "Rock, Paper, Scissors";
					rpsMessage = playerTwo + ". " + "Select your choice.";
					int rpsDialog = JOptionPane.showOptionDialog(null, rpsMessage, rpsTitle,
							JOptionPane.DEFAULT_OPTION, JOptionPane.PLAIN_MESSAGE, null, rpsChoice,
							rpsChoice[n]);
					// Check what button is clicked
					switch (rpsDialog) {
					//- Clicked "Rock"
					case 0:	
						playerChoice[player] = "rock";
						player = 0;
						break;
					//- Clicked "Paper"
					case 1:	
						playerChoice[player] = "paper";
						player = 0;
						break;
					//- Clicked "Scissors"
					case 2:	
						playerChoice[player] = "scissors";
						player = 0;
						break;
					//- Clicked "X"
					case JOptionPane.CLOSED_OPTION:	
						confirmQuit();
						break;
					// - Clicked none of the above
					default:
						System.out.println("?");
						System.exit(0);
						break;
					}
				}
				
				////////////////////////////
				//  Calculate The Winner  //
				////////////////////////////
				while (gameWinner == 0 && isGameRunning == true) {
					
					String c1;	//Player 1's choice
					String c2;	//Player 2's choice
					
					// Player 1 wins
					player = 1;
					c1 = "rock";		c2 = "scissors";
					if (playerChoice[player].equals(c1) && playerChoice[player + 1].equals(c2)) 
					{	gameWinner = player; 	}
					c1 = "paper"; 		c2 = "rock";
					if (playerChoice[player].equals(c1) && playerChoice[player + 1].equals(c2)) 
					{	gameWinner = player; 	}
					c1 = "scissors"; 	c2 = "paper";
					if (playerChoice[player].equals(c1) && playerChoice[player + 1].equals(c2)) 
					{	gameWinner = player; 	}
					
					// Player 2 wins
					player = 2;
					c1 = "rock";		c2 = "scissors";
					if (playerChoice[player].equals(c1) && playerChoice[player - 1].equals(c2)) 
					{	gameWinner = player; 	}
					c1 = "paper"; 		c2 = "rock";
					if (playerChoice[player].equals(c1) && playerChoice[player - 1].equals(c2)) 
					{	gameWinner = player; 	}
					c1 = "scissors"; 	c2 = "paper";
					if (playerChoice[player].equals(c1) && playerChoice[player - 1].equals(c2)) 
					{	gameWinner = player; 	}
					
					// Draw
					player = 1;
					if (playerChoice[player].equals(playerChoice[player + 1])) 
					{	gameWinner = -1;		}
					///////////////////////
					//  Announce Winner  //
					///////////////////////
					switch (gameWinner) {
					case 0:		// This should happen only when an error occurs.
						System.out.println("Still Deciding???  Probably an error just occured.");
						break;
					case -1:	// Draw
						JOptionPane.showMessageDialog(null, "Results:\n"
								+ playerOne + " and " + playerTwo + " have tied!\n\n"
								+ "Choices:\n"
								+ playerOne + " ==> \"" + playerChoice[player] + "\"\n"
								+ playerTwo + " ==> \"" + playerChoice[player + 1] + "\"", 
								rpsTitle, JOptionPane.PLAIN_MESSAGE);
						isGameRunning = false;
						break;
					case 1:		// Player 1 wins
						JOptionPane.showMessageDialog(null, "Results:\n"
								+ playerOne + " has won the game!\n\n"
								+ "Choices:\n"
								+ playerOne + " ==> \"" + playerChoice[player] + "\"\n"
								+ playerTwo + " ==> \"" + playerChoice[player + 1] + "\"",
								rpsTitle, JOptionPane.PLAIN_MESSAGE);
						break;
					case 2:		// Player 2 wins
						JOptionPane.showMessageDialog(null, "Results:\n"
								+ playerTwo + " has won the game!\n\n"
								+ "Choices:\n"
								+ playerOne + " ==> \"" + playerChoice[player] + "\"\n"
								+ playerTwo + " ==> \"" + playerChoice[player + 1] + "\"",
								rpsTitle, JOptionPane.PLAIN_MESSAGE);
						break;
					default:
						break;
					}
					
					// Stop Game
					isGameRunning = false;
				}
				
			}
			///////////////////////////
			//  End of Game Manager  //
			///////////////////////////
		}
		//////////////////////////////////////////
		//  End of Main program WHILE LOOP  //
		//////////////////////////////////////////
	}
	///////////////////////////////
	//  End of Main program  //
	///////////////////////////////

	
	///////////////////
	//  Quit Dialog  //
	///////////////////
	public static void confirmQuit() {
		// Show Quit dialog box
		int dialogConfirmQuit = JOptionPane.showOptionDialog(null, confirmQuitMessage, confirmQuitTitle,
				JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE, null, confirmQuitChoices,
				confirmQuitChoices[1]);
		// Check what button is clicked
		switch (dialogConfirmQuit) {
		case JOptionPane.YES_OPTION:	
			// - Clicked "Yes"
			isGameRunning = false;
			System.exit(0); 	// Quit Game
			break;
		case JOptionPane.NO_OPTION:		
			// - Clicked "No"
			return; 			// Return back to Game
		case JOptionPane.CLOSED_OPTION:	
			// - Clicked "X"
			isGameRunning = false;
			System.exit(0);
			break;
		default:
			// - Clicked none of the above
			System.out.println("?");
			System.exit(0);
			break;
		}
	}
	//////////////////////////
	//  End of Quit Dialog  //
	//////////////////////////
}
///////////////////////////////////
//  End of RPS.java program  //
///////////////////////////////////

