import java.util.HashMap;

public class HashMapDemo {

	public static void main(String[] args) {
		HashMap mMap = new HashMap();
		Mountain everest = new Mountain("Everest", 2902);
		mMap.put(everest.getName(), everest);
		
		//Mountain m = (Mountain)mMap.get("Everest");
		//System.out.println(m.getName());
		
		Mountain k2 = new Mountain("K2", 28251);
		mMap.put(k2.getName(), k2);
		
		mMap.put("Denali", new Mountain("Denali", 20320));
		
		for(Object o : mMap.keySet()) {
			String mtnName = (String)o;
			System.out.println(mtnName);
			Mountain nextMtn = (Mountain)mMap.get(mtnName);
		}
	}

}
