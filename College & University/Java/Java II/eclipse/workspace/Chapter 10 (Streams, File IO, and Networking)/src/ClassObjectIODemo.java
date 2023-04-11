import java.io.*;

public class ClassObjectIODemo {

	public static void main(String[] args) {
		File f = new File("./src/data/species.dat");
		try {
			//INPUT
			ObjectOutputStream oos =
					new ObjectOutputStream(new FileOutputStream(f));
			
			Species klingonOx = new Species();
			klingonOx.name = "Ox";
			klingonOx.population = 100;
			
			Species tribbles = new Species();
			tribbles.name = "Tribbles";
			tribbles.population = 100000;
			
			oos.writeObject(klingonOx);
			oos.writeObject(tribbles);
			
			//OUTPUT
			ObjectInputStream ois =
					new ObjectInputStream(new FileInputStream(f));
			
			Species firstSpecies = (Species)ois.readObject();
			System.out.println(firstSpecies);
			
			Species secondSpecies = (Species)ois.readObject();
			System.out.println(secondSpecies);
			
			oos.close();
			ois.close();
		}
		catch (Exception e) {
			System.err.println("ERROR: ");
			e.printStackTrace();
			System.exit(0);
		}
	}

}
