/*
 * MazeGUI.java 
 * Simple program that constructs a maze panel to display a maze
 * and its solution. 
 * Base code to construct a mazeGUI, taken from supplemented
 * homework files, with some modifications
 */
import javax.swing.*;
import java.awt.*;
import java.io.*;

public class MazeGUI
{
	public static Maze maze;
	public static JFrame frame;
	public static MazePanel panel;
	
	public static void main(String[] args) throws IOException, InterruptedException
	{
		try
		{
			int size = 10;
			
			maze = new Maze(size); // Constructs the maze object
			
			frame = new JFrame("Maze");
			panel = new MazePanel(maze); // Constructs the panel to hold the
			// maze
			JScrollPane scrollPane = new JScrollPane(panel);
			
			int x = maze.windowSize().width + Maze.MARGIN - Maze.CELL_WIDTH;
			int y = maze.windowSize().height + Maze.MARGIN;
			
			frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			frame.setSize(x, y);
			frame.add(scrollPane, BorderLayout.CENTER);
			frame.setVisible(true);
			
			SwingUtilities.invokeLater(new Runnable() {
				@Override
				public void run() {
					try {
						Thread.yield();
						updateUI();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			});
			
			stackSearch();
		}
		catch(NumberFormatException exception)
		{
			System.out.println("The input number for the maze size must be an integer") ;
		}
	}
	
	public static void updateUI() {
		while(true) {
			try {
				Thread.yield();
				Thread.sleep(50);
				
				System.out.println("UPDATING UI");
				panel.updateUI();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void stackSearch() {
		final int NORTH = maze.NORTH;
		final int EAST = maze.EAST;
		final int SOUTH = maze.SOUTH;
		final int WEST = maze.WEST;
		
		Maze.Cell[] cell = maze.getCells();
		boolean[] path = maze.getPath();
		
		boolean search = true;
		while(search == true) {
			maze.getPath()[1] = true;
		}
	}
	
	public static void antSearch() {
		
	}
	
}

// This is the JPanel replacement for mazes that stores as a data
// element the maze and calls the mazes's drawing function
class MazePanel extends JPanel 
{
	private Maze maze; // the maze object

	public MazePanel(Maze theMaze)
	{
		maze = theMaze;
	}

	// The paintComponent method is called every time
	// that the panel needs to be displayed or refreshed.
	// Anything you want drawn on the panel should be drawn
	// in this method.
	public void paintComponent(Graphics page) 
	{
		super.paintComponent(page);
		
		setBackground(Color.white); // set preferredSize for JScrollPane
		
		this.setPreferredSize(maze.windowSize()); // draw the maze and the solution 
		// path in red points
		
		maze.draw(page);
	}
	
}
