import java.util.Scanner;
import java.util.Random;

public class Lab4 {
	public static void main(String[] args) {
		/*
	 	Scanner scan = new Scanner(System.in);
	 	System.out.print("Input1: ");
	 	//System.out.println(pendulum(scan.nextLine()));
	 	String line1 = scan.nextLine();
	 	System.out.print("Input2: ");
	 	String line2 = scan.nextLine();
	 	System.out.println("\n" + line1 + ", " + line2);
		//System.out.println(anagram(line1, line2));
		System.out.println(anagram_noarray(line1, line2));
		//*/
		card();
	}

	public static boolean pendulum(String s) {
		for(int i = 0; i < s.length()/2; i++)
			if(s.charAt(i)!=s.charAt(s.length()-1-i))
				return false;
		return true;
	}

	public static boolean anagram(String line1, String line2) {
	 	line1 = line1.toLowerCase();
		line2 = line2.toLowerCase();
		int[] c = new int[26];
		for(int i = 0; i < line1.length(); i++) {
			if(line1.charAt(i) >= 'a' && line1.charAt(i) <= 'z')
				c[(int)line1.charAt(i)-'a']++;
		}
		for(int i = 0; i < line2.length(); i++) {
			if(line2.charAt(i) >= 'a' && line2.charAt(i) <= 'z')
				c[(int)line2.charAt(i)-'a']--;
		}
		for(int i = 0; i < 26; i++)
			if(c[i] != 0)
				return false;
		return true;
	}

	public static boolean anagram_noarray(String line1, String line2) {
		line1 = line1.toLowerCase().replaceAll("\\W", "");
		line2 = line2.toLowerCase().replaceAll("\\W", "");
		for(int i = 0; i < line1.length(); i++) {
			int index = line2.indexOf(line1.charAt(i));
			if(index == -1)
				return false;
			else if (index == 0)
				line2 = line2.substring(1, line2.length());
			else if (index == line2.length()-1)
				line2 = line2.substring(0, line2.length()-1);
			else
				line2 = line2.substring(0, index) + line2.substring(index+1, line2.length());
		}
		return true;
	}

	public static void card() {
		String p1 = draw();
		System.out.print(p1 + '\t');
		String p2;
		while(true) {
			p2 = draw();
			System.out.println(p2);
			if(p1.charAt(0) == p2.charAt(0)) {
				System.out.println("p2 win");
				return;
			}
			p1 = draw();
			System.out.print(p1 + '\t');
			if(p1.charAt(0) == p2.charAt(0)) {
				System.out.println("\np1 win");
				return;
			}
		}
	}

	public static String draw() {
		Random ran = new Random();
		int num = ran.nextInt(13)+1;
		int shape = ran.nextInt(4);
		String s;
		if(shape == 0)
			s = "D";
		else if(shape == 1)
			s = "C";
		else if(shape == 2)
			s = "H";
		else
			s = "S";

		if (num == 1)
			s += "A";
		else if(num == 11)
			s += "J";
		else if(num == 12)
			s += "Q";
		else if(num == 13)
			s += "K";
		else
			s += num;
		return s;
	}
}