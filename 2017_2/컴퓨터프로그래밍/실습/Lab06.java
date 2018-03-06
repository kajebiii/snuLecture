import java.io.File;
import java.io.PrintStream;
import java.util.Scanner;


/**
 * Created by tcs정원일 on 2017-10-17.
 */
public class Lab06 {
    public static void main(String[] args){
        try {
            Scanner myread = new Scanner(new File(args[0]));
            PrintStream output = new PrintStream(new File(args[1]));

            int total = 0;
            int[] roomSize;
            String[][] pNames;
            boolean[][] pGenders;
            int[] reportRooms;
            String finalOutput;

            /**
             * Fild reading
             */
            total = myread.nextInt();
            if(total > 0) {
                myread.nextLine();
                roomSize = new int[total];
                pNames = new String[total][50];
                pGenders = new boolean[total][50];
                reportRooms = new int[total];
            }
            else{
                roomSize = new int[1];
                pNames = new String[1][1];
                pGenders = new boolean[1][1];
                reportRooms = new int[1];
            }

            for(int i = 0; i < total; i++){
                String line = myread.nextLine();
                int rsize = Integer.parseInt(line.split(": ", 2)[1]);
                roomSize[i] = rsize;
                for(int j = 0; j < rsize; j++){
                    String[] aLine = myread.nextLine().split(", ", 2);
                    pNames[i][j] = aLine[0];
                    pGenders[i][j] = aLine[1].compareToIgnoreCase("Male") == 0;
                }
            }
            myread.close();
            /*
            File reading end
             */

            boolean isMale = true;
            int ite = 0;
            for(int i = 0; i < total; i++){

                for(int j = 0; j < roomSize[i]; j++){

                    if(j== 0) isMale = pGenders[i][0];
                    else if(isMale != pGenders[i][j]){
                        reportRooms[ite] = i+1;
                        ite++;
                        break;
                    }//elif end
                }//inner for end
            }//for loop end

            output.println("Total number of rooms: " + total);
            for(int i = 0; i < total; i++){
                output.println("Room " + (i+1) );
                output.println("Total number of people: " + roomSize[i]);
                for(int j = 0; j < roomSize[i]; j++){
                    output.println(pNames[i][j]);
                }
            }
            if(ite == 0) {
                output.println("No problem found.");
            }
            else{
                output.print("Problem found in ");
                for(int i = 0; i < ite; i++){
                    if(i == ite - 1){
                        output.println(reportRooms[i]);
                    }
                    else{
                        output.print(reportRooms[i] + ", ");
                    }
                }
            }
        }//try block
        catch(Exception e){
            e.printStackTrace();
        }//catch block
    }

}
