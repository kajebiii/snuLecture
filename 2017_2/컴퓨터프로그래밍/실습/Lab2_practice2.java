import java.util.Scanner;

public class Center {

    public static void main(String args[]){
        Scanner myScan = new Scanner(System.in);
        int inputNum = 0;
        inputNum = myScan.nextInt();
        myScan.nextLine();

        /**** Alllas!, When can we learn array or list? ****/
        System.out.println(numPerfect(inputNum) + ", " + numFiboPrime(inputNum) + ", " + numMerPrime(inputNum));
        /***************************************************/
        printPerfect(inputNum);
        printFiboPrime(inputNum);
        printMerPrime(inputNum);


    }

    public static int numPerfect(int input){
        if(input <= 0){
            System.out.println("Input should be positive number!");
            return -1;
        }

        int result = 0;

        for(int i = 1; i < input; i++){
            boolean isPerfect = false;
            int checkSum = 0;
            for(int j = 1; j <= i/2; j++){
                //if 'j' is positive divisor of 'i', add 'j' to checkSum
                if(i%j == 0){
                    checkSum = checkSum + j;  //checkSum += j;
                }
            }
            //if total sum of positive divisors is the same with 'i', 'i' is perfect number.
            if(checkSum == i) isPerfect = true;
            //The number of perfect number increases.
            if(isPerfect) result += 1;  //result++;

        }

        return result;
    }

    public static int numFiboPrime(int input){
        if(input <= 0){
            System.out.println("Input should be positive number!");
            return -1;
        }

        int result = 0;
        int fiboCheck = 1;
        int fiboCheck2 = 1;
        for(int i = 1; i < input; ){
            boolean isCount = false;
            if(isPrime(i)){
                isCount = true;
            }
            /** Move to check next fibonacci number **/
            int temp = fiboCheck;
            fiboCheck = fiboCheck2;
            fiboCheck2 = temp + fiboCheck;  //next fibonacci number in 'fiboCheck2'
            i = fiboCheck2;
            /****************************************/
            if(isCount) result += 1;
        }

        return result;
    }

    public static int numMerPrime(int input){
        if(input <= 0){
            System.out.println("Input should be positive number!");
            return -1;
        }

        int result = 0;
        int n = 2;
        for(int i = 3; i < input; ){
            boolean isCount = false;
            if(isPrime(i)) isCount = true;
            n += 1;
            i = (int)Math.pow(2.0, n ) - 1;
            if(isCount) result += 1;
        }

        return result;
    }

    public static void printPerfect(int input){
        if(input <= 0){
            System.out.println("Input should be positive number!");
        }

        boolean init = true;
        for(int i = 1; i <= input; i++){
            int checkSum = 0;
            for(int j = 1; j <= i/2; j++){
                //if 'j' is positive divisor of 'i', add 'j' to checkSum
                if(i%j == 0){
                    checkSum = checkSum + j;  //checkSum += j;
                }
            }
            //if total sum of positive divisors is the same with 'i', 'i' is perfect number.
            if(checkSum == i){
                if(!init) System.out.print(", ");
                System.out.print(i);
                init = false;
            }
        }
        System.out.println();
    }

    public static void printFiboPrime(int input){
        if(input <= 0){
            System.out.println("Input should be positive number!");
        }

        int fiboCheck = 1;
        int fiboCheck2 = 1;
        boolean init = true;
        for(int i = 1; i <= input; ){
            if(isPrime(i)){
                if(!init) System.out.print(", ");
                System.out.print(i);
                init = false;
            }
            int temp = fiboCheck;
            fiboCheck = fiboCheck2;
            fiboCheck2 = temp + fiboCheck;
            i = fiboCheck2;
        }
        System.out.println();

    }

    public static void printMerPrime(int input){
        if(input <= 0){
            System.out.println("Input should be positive number!");
        }

        int n = 2;
        for(int i = 3; i <= input; ){
            if(isPrime(i)){
                if( i!= 3 ) System.out.print(", ");
                System.out.print(i);
            }
            n += 1;
            i = (int)Math.pow(2.0, n ) - 1;
        }
        System.out.println();
    }

    public static boolean isPrime(int num){
        boolean isPrime = true;
        if(num < 2){
            isPrime = false;
        }
        for(int i = 2; i < (int)Math.sqrt((double)num) + 1; i++){
            if(num%i == 0){
                isPrime = false;
            }
        }

        return isPrime;
    }
}
