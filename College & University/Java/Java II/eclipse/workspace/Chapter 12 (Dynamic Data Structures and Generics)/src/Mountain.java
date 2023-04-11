import java.util.HashMap;

public class Mountain {
	private String name;
	private int height;
	private double longitude;
	private double latitude;
	
	public static void main(String[] args) {
		HashMap<String, Mountain> mMap = new HashMap<String, Mountain>();
		
		mMap.put("Everest", new Mountain("Everest", 29029));
		mMap.put("K2", new Mountain("K2", 28251));
		mMap.put("Kangchenjunga", new Mountain("Kangchenjunga", 28169));
		mMap.put("Denali", new Mountain("Denali", 20335));
		
		for(Object i : mMap.values()) {
			System.out.println(i.toString());
		}
	}
	
	public Mountain(String name, int height) {
		this.name = name;
		this.height = height;
	}
	
	public String toString() {
		String msg = "Name = " + name
				+"\nHeight = " + height
				+"\nLongitude = " + longitude
				+"\nLatitude = " + latitude
				+"\n";
		return msg;
	}
}
