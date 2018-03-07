package ga.kajebiii;

public class Main {


    public static void main(String[] args) {
	// write your code here
        diamond();
        System.out.println();
        square();
        System.out.println();
        star();
    }
    public static void star() {
        printstar1();
        printstar7();
        printstar3();
        System.out.println("  *   *");
    }
    public static void diamond() {
        printstar1();
        printstar3();
        printstar5();
        printstar7();
        printstar5();
        printstar3();
        printstar1();
    }
    public static void square() {
        printstar7();
        printstar7();
        printstar7();
        printstar7();
        printstar7();
        printstar7();
        printstar7();
    }
    public static void printstar1() { System.out.println("    *"); }
    public static void printstar3() {
        System.out.println("   ***");
    }
    public static void printstar5() {
        System.out.println("  *****");
    }
    public static void printstar7() {
        System.out.println(" *******");
    }
}
