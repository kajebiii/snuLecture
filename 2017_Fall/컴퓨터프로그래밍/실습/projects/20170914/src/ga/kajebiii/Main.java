package ga.kajebiii;

import java.util.Scanner;
import java.util.regex.Pattern;

public class Main {

    public static void main(String[] args) {
//        primitive_data();
//        loop();
//        int n = scan_example();
//        System.out.println(n);

//        printPattern(5);
//        System.out.println("loop count: " + to_do(scan_example()));
        to_do(5);
        Scanner scan = new Scanner(System.in);
        System.out.print("Type int: ");
        int n = Integer.parseInt(scan.nextLine());
        find(n);
    }
    public static void to_do(int n) {
        System.out.println("Pattern for " + n);
        String StEn = "#";
        for(int i=0; i<4*n; i++) StEn += "=";
        StEn += "#";
        System.out.println(StEn);
        for(int i=0; i<2*n; i++) {
            String now = "|";
            int val = n-1-i;
            if(i >= n) val = i-n;

            for(int j=0; j<2*val; j++) now += " ";
            now += "<>";
            for(int j=0; j<4*n-4*val-4; j++) now += ".";
            now += "<>";
            for(int j=0; j<2*val; j++) now += " ";
            now += "|";
            System.out.println(now);
        }
        System.out.println(StEn);
    }

    public static void find(int n) {
        int a = 0, b = 0, c = 0;
        String sAll = "", sa = "[", sb = "[", sc = "[";
        for(int i=1; i<=n; i++) {
            int sum = 0;
            for(int j=1; j<i; j++) if(i % j == 0) sum += j;
            if(sum == i) {
                if(a != 0) sa += ", ";
                sa += i;
                a++;
            }
        }
        int x = 0, y = 1;
        for(; x+y <= n; ) {
            if(b != 0) sb += ", ";
            int z = x+y;
            sb += z;
            x = y;
            y = z;
            b++;
        }
        int k=2;
        for(; k-1 <= n; ) {
            int sum = 0;
            for(int j=1; j<(k-1); j++) if((k-1) % j == 0) sum += j;
            if(sum == 1) {
                if(c != 0) sc += ", ";
                sc += (k-1);
                c++;
            }
            k *= 2;
        }
        sa += "]";
        sb += "]";
        sc += "]";
        sAll += "[" + a + ", " + b + ", " + c + "]";
        System.out.println(sAll);
        System.out.println(sa);
        System.out.println(sb);
        System.out.println(sc);
    }



    public static int scan_example() {
        Scanner scan = new Scanner(System.in);
        System.out.print("Type int: ");
//        int read = scan.nextInt();
        int read = Integer.parseInt(scan.nextLine());
        System.out.println(read);

        System.out.print("Type some word: ");
        String line = scan.nextLine();
        System.out.println(line);

        return read;
    }
    public static void primitive_data() {
        int a = 10;
        int b;
        b = a;
        System.out.println(a + " " + b);
        char ca = 'a';
        System.out.println((int) ca);
        ca++;
        System.out.println(ca);
        System.out.println((char) 98);
        System.out.println((char) 0x62);
        String sa = "String 1";
        String sb = "String 1";
        System.out.println(sb == sa);
        String sc = new String("String 1");
        System.out.println(sc == sa);
    }
    public static void loop() {
        for(int i=0; i<10; i++) System.out.print('*');
        System.out.println();

        int i=0;
        for(; i<10;) {
            System.out.print('*');
            i++;
        }
        System.out.println();
    }
}
