import java.util.Scanner;

/**
 * Created by tcs정원일 on 2017-09-21.
 */
public class Test {
    public static void main(String args[]){
        int[][] intArr = new int[5][3];

        Scanner scan = new Scanner(System.in);
        for(int i = 0; i < 5; i++){
            String str = scan.nextLine();
            int ite = 0;
            int pos = 0;
            for(int j = 0; j < str.length(); j++){
                if(str.charAt(j) == ','){
                    String str2 = str.substring(ite, j);
                    intArr[i][pos] = Integer.parseInt(str2);
                    pos += 1;
                    ite = j+1;
                }
                if(j == str.length() -1){
                    String str2 = str.substring(ite, j+1);
                    intArr[i][pos] = Integer.parseInt(str2);
                }
            }
        }

        int[][]  normalArr = new int[10][7];

        int ite = 0;
        for(int i = 0; i < 5; i++){
            for(int j = i + 1; j < 5; j++){
                for(int k = j+1; k < 5; k++){
                    normalArr[ite++] = crossProduct( arrDiff(intArr[i], intArr[j]), arrDiff(intArr[j], intArr[k]) );
                }
            }
        }


        int count = 0;
        int[] checkArr = new int[10];
        for(int i = 0; i < 10; i++){
            checkArr[i] = -1;
        }
        for(int i = 0; i < 10; i++){
            boolean check = true;
            if(normalArr[i][6] == -1){
                continue;
            }

            for(int j = i+1; j < 10; j++){
                if(normalCompare(normalArr[i], normalArr[j])){
                    check = false;
                    if(checkArr[i] == -1 && checkArr[j] == -1){
                        check = true;
                    }
                    checkArr[i] = checkArr[j] = 1;
                }

            }
            if(check) count++;


        }
        System.out.println("Result: " + count);
    }

    public static int[] crossProduct(int[] dot1, int[] dot2){
        int[] dot = new int[7];
        dot[0] = dot1[1]*dot2[2] - dot1[2]*dot2[1];
        dot[1] = dot1[2]*dot2[0] - dot1[0]*dot2[2];
        dot[2] = dot1[0]*dot2[1] - dot1[1]*dot2[0];
        dot[3] = dot1[0];
        dot[4] = dot1[1];
        dot[5] = dot1[2];
        if(checkDirection(dot1, dot2)) dot[6] = -1;
        else dot[6] = 1;

        return dot;
    }

    public static boolean checkDirection(int[] dot1, int[] dot2){
        int cou = 0;
        boolean isLeft = false;
        boolean foundZero = false;
        double ratio = 1.0;

        for(int i = 0;  i<3; i++){
            if(dot1[i] == 0 && dot2[i] == 0){
                foundZero = true;
                if(i == 2){
                    return true;
                }
                continue;
            }
            else{
                if(dot1[i] == 0 || dot2[i] == 0){
                    if(foundZero)
                        return true;
                }
                else{
                    if(Math.abs(dot1[i]) >= Math.abs(dot2[i]) ){
                        ratio = (double)Math.abs(dot1[i])/(double)Math.abs(dot2[i]);
                        isLeft = true;
                    }
                    else{
                        ratio = (double)Math.abs(dot2[i])/(double)Math.abs(dot1[i]);
                        isLeft = false;
                    }
                }
            }
        }

        for(int i = 0; i < 3; i++){
            if(isLeft && Math.abs(dot2[i])*ratio == Math.abs(dot1[i])){
                cou++;
            }
            else if(!isLeft && Math.abs(dot1[i])*ratio == Math.abs(dot2[i])){
                cou++;
            }
        }
        return cou == 3;

    }


    public static boolean normalCompare(int[] nom1, int[] nom2){
        boolean isSameDir = false;
        if(checkDirection(nom1, nom2) ){
                isSameDir = true;
        }

        if(isSameDir){
            if( (nom1[0]*(nom2[3] - nom1[3]) + nom1[1]*(nom2[4] - nom1[4]) + nom1[2]*(nom2[5] - nom1[5])) == 0 ){
                return true;
            }
            return false;
        }
        else
            return false;
    }

    public static int[] arrDiff(int[] arr1, int[] arr2){
        int[] result = new int[3];
        result[0] = arr2[0] - arr1[0];
        result[1] = arr2[1] - arr1[1];
        result[2] = arr2[2] - arr1[2];
        return result;
    }
}
