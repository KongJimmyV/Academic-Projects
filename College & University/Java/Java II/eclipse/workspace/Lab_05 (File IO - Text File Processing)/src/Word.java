
/**
 * 
 * Name: 			Word.java
 * Description: 	Word class/object file.
 * Date: 			2/20/2017
 * 
 * @author Jimmy Vang
 *
 */
public class Word implements Comparable<Object> {
	
	private String word;
	private int usageCnt;
	
	/**
	 * 
	 * @param word
	 */
	public Word(String word) {
		this.setWord(word);
		this.setUsageCnt(0);
	}
	
	/**
	 * 
	 */
	public void incrementUsage() {
		this.setUsageCnt(this.getUsageCnt() + 1);
	}
	
	@Override
	public int compareTo(Object o) {
		if(o != null && o instanceof Word) {
			
			Word w = (Word)o;
			
			return w.usageCnt - this.usageCnt;
		
		} else {
			System.err.println("The object being compared is either \"null\" or not and instance of \"Word\".");
			System.exit(0);
		}
		return 0;
	}

	/**
	 * Overrides the hashCode() method of List.
	 * 
	 * This allows ArrayList.contain() to work properly and count words.
	 * ArrayList implements List.
	 */
	@Override
	public int hashCode() {
		return 0;
	}

	/**
	 * Checks whether 2 objects are "equal".
	 * 
	 * Overrides the equals(Object o) method of ArrayList.contains().
	 * ArrayList.contains() implements List, which is an object.
	 */
	@Override
	public boolean equals(Object o)
	{
		boolean isEqual = false;
		
	    if (o != null && o instanceof Word)
	    {
	    	isEqual = this.word.equals(((Word)o).word);
	    } 
	    
		return isEqual;
	}
	
	/*** ACCESSORS/SETTERS ***/
	public String getWord() {
		return word;
	}

	private void setWord(String word) {
		this.word = word;
	}

	public int getUsageCnt() {
		return usageCnt;
	}

	private void setUsageCnt(int usageCnt) {
		this.usageCnt = usageCnt;
	}

}
