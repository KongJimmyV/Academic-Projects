
public class CustomTestSortedList {

    public static void main(String[] args) {
        testIntegers();
        testStrings();
    }
    
    public static void testIntegers() {
        System.out.println("=== Testing Integers ===");
        
        SortedList<Integer> list = new SortedList<>();
        list.insert(1);
        list.insert(4);
        list.insert(7);
        System.out.println(list.toString());
        
        SortedList<Integer> list2 = new SortedList<>();
        list2.insert(7);
        list2.insert(4);
        list2.insert(1);
        System.out.println(list2.toString());
        
        SortedList<Integer> list3 = new SortedList<>(list, list2);
        System.out.println(list3.toString());
        
        list3.remove(1);
        System.out.println(list3.toString());
        list3.remove(7);
        System.out.println(list3.toString());
        list3.remove(4);
        System.out.println(list3.toString());
    }

    public static void testStrings() {
        System.out.println("=== Testing Strings ===");
        
        SortedList<String> listStr = new SortedList<>();
        listStr.insert("X");
        listStr.insert("Y");
        listStr.insert("Z");
        System.out.println(listStr.toString());
        
        SortedList<String> listStr2 = new SortedList<>();
        listStr2.insert("Z");
        listStr2.insert("Y");
        listStr2.insert("X");
        System.out.println(listStr2.toString());
        System.out.println("Find: " + listStr2.find("X"));
        
        SortedList<String> listStr3 = new SortedList<>(listStr, listStr2);
        System.out.println(listStr3.toString());
        
        listStr3.remove("X");
        System.out.println(listStr3.toString());
        listStr3.remove("Z");
        System.out.println(listStr3.toString());
        listStr3.remove("Y");
        System.out.println(listStr3.toString());
        
        listStr3 = new SortedList<>(listStr3, listStr3);
        System.out.println(listStr3.toString());
        
        listStr = new SortedList<>();
        System.out.println(listStr.toString());
        
        listStr2 = new SortedList<>();
        System.out.println(listStr2.toString());
        
        listStr3 = new SortedList<>(listStr, listStr2);
        System.out.println(listStr3.toString());
        
        listStr3.remove("A");
        System.out.println(listStr3.toString());
        
    }
}
