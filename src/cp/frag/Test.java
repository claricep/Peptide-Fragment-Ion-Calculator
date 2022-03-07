package cp.frag;
import java.util.*;


public class Test {
    public static void main(String[] args) {

        //input string.  e.g. ACDE
        //print out total mass by summing all amino acid masses
        //use aaMassMono
        AssignMass amassPar = new AssignMass(true);

        Scanner myObj = new Scanner(System.in);
        String input = myObj.nextLine();// Read user input
        float[] aa = AssignMass.getAaMasses();
        char[] copyInput = new char[input.length()];

        //string -> array
        for(int i = 0; i < input.length(); i++){
            copyInput[i] += input.charAt(i);
        }

        //sum array mass
        float sum = 0;
        for(int i = 0; i < copyInput.length; i++){
           // sum += FragIonGenerator.bFragList();
        }

        System.out.println("====\t" + sum);  // Output user input
    }
}
