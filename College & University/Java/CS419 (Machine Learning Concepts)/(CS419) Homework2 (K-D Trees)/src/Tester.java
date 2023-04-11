import java.util.ArrayList;
import java.util.Vector;

/** Tests the quicksort algorithm */
public class Tester {

    /** Tests the quicksort algorithm */
    public static void main(String[] args) {
        
        ArrayList<Vector<Double>> vectors = new ArrayList<>();
        
        Double[] arr = {
                20.0, 30.0, 70.0, 10.0, 20.0, 20.0,
                25.0, 35.0, 75.0, 15.0, 25.0, 25.0,
                2.0, 3.0, 7.0, 1.0, 2.0, 2.0
                };
        Double[] arr2 = {
                -210.0, -310.0, -710.0, -110.0, -210.0, -210.0,
                -215.0, -315.0, -715.0, -115.0, -215.0, -215.0,
                -21.0, -31.0, -71.0, -11.0, -21.0, -21.0
                };
        
        for (int i = 0; i < arr.length; i++) {
            Vector<Double> v = new Vector<>();
            v.add(arr[i]);
            v.add(arr2[i]);
            vectors.add(v);
        }
        
        KD_Builder.quickSort(vectors, 1);

        System.out.println("sorted array");
        System.out.println(vectors);
    }

}
