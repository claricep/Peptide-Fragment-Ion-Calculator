package cp.frag;
import org.biojava.nbio.aaproperties.PeptideProperties;

public class PICalculator {

    public static void main(String[] args) {
        System.out.println("test");

        double pIValue = PeptideProperties.getIsoelectricPoint("PEPTIDE");

        System.out.println("pi\t" + pIValue);

    }
}
