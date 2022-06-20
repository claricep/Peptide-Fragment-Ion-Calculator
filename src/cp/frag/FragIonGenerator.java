package cp.frag;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.*;

public class FragIonGenerator {

    private List<Double> fragList;
    private List<Double> aFragList;
    private List<Double> bFragList;
    private List<Double> cFragList;
    private List<Double> xFragList;
    private List<Double> yFragList;
    private List<Double> zFragList;
    private double[] aaMassAvg;

    public static void main(String[] args) {

        float addMass = 0;
        String type = " p e d";
        type=type.replaceAll("\\s+","");
        type = type.toUpperCase();
        type.trim();

        ArrayList<Character> ch = new ArrayList<Character>();
        String value = "100 200 50";
        ArrayList<Float> pos = new ArrayList<Float>();
        if(type.length() == 0 || value.length() == 0){
            System.out.println("");
        }else {

            String array[] = value.split(" ");
            for (int i = 0; i < type.length(); i++) {
                ch.add(type.charAt(i));
            }

            String array1[] = value.split(" ");
            for (String temp : array1) {
                float num = Float.parseFloat(temp);
                pos.add(num);
            }

            System.out.println(ch);
            System.out.println(pos);
            for (int i = 0; i < ch.size(); i++) {
                AssignMass.addAAValue(ch.get(i), pos.get(i));
            }
        }


        AssignMass amassPar = new AssignMass(true);
        //AssignMass.addAAValue('P', 9f);
        AssignMass.setAionfragment(AssignMass.getnTerm() + 27.99492f);
        AssignMass.setBionfragment(AssignMass.getnTerm() + amassPar.getH());
        AssignMass.setCionfragment(AssignMass.getnTerm() + 17.02654f);
        AssignMass.setXionfragment(AssignMass.getcTerm() + 51.95803814f);
        AssignMass.setYionfragment(AssignMass.getcTerm() + amassPar.getOh() + amassPar.getH() + amassPar.getH());
        AssignMass.setZionfragment(AssignMass.getcTerm() + 17.02545f);
        AssignMass.setAaMasses(AssignMass.getAaMasses());


        FragIonGenerator fragIonGenerator = new FragIonGenerator();
        fragIonGenerator.getFragIons("PEPTIDE");

        List<Double> aFragList =  fragIonGenerator.getaFragList();
        System.out.println(aFragList);
        List<Double> bFragList =  fragIonGenerator.getbFragList();
        System.out.println(bFragList);
        List<Double> cFragList =  fragIonGenerator.getcFragList();
        System.out.println(cFragList);
        List<Double> xFragList =  fragIonGenerator.getxFragList();
        System.out.println(xFragList);
        List<Double> yFragList =  fragIonGenerator.getyFragList();
        System.out.println(yFragList);
        List<Double> zFragList =  fragIonGenerator.getzFragList();
        System.out.println(zFragList);
    }


    public List<Double> getFragIons(String pepSeq) {

        fragList = new ArrayList<>();
        aFragList = new ArrayList<>();
        bFragList = new ArrayList<>();
        cFragList = new ArrayList<>();
        xFragList = new ArrayList<>();
        yFragList = new ArrayList<>();
        zFragList = new ArrayList<>();

        final int CS_FRAG=3;

        int[] ionArr = {0, 1, 2, 6, 7, 8, };

        for (int each : ionArr) {

            switch (each) {
                /*a*/ case 0:
                    aFragList = AssignMass.getFragIonList(pepSeq, each);
                    break;
                /*b*/ case 1:
                    bFragList = AssignMass.getFragIonList(pepSeq, each);
                    break;
                /*c*/ case 2:
                    cFragList = AssignMass.getFragIonList(pepSeq, each);
                    break;
                /*x*/ case 6:
                    xFragList = AssignMass.getFragIonListRev(pepSeq, each);
                    break;
                /*y*/ case 7:
                    yFragList = AssignMass.getFragIonListRev(pepSeq, each);
                    break;
                /*z*/ case 8:
                    zFragList = AssignMass.getFragIonListRev(pepSeq, each);
                    break;
            }

        }
        for(double each:bFragList) {
            System.out.println(each + "\t" + fragList.contains(each));
        }


        return fragList;

    }

    public List<Double> getFragList() {
        return fragList;
    }

    public void setFragList(List<Double> fragList) {
        this.fragList = fragList;
    }

    public List<Double> getbFragList() {
        return bFragList;
    }

    public void setbFragList(List<Double> bFragList) {
        this.bFragList = bFragList;
    }

    public List<Double> getyFragList() {
        return yFragList;
    }

    public void setyFragList(List<Double> yFragList) {
        this.yFragList = yFragList;
    }

    public List<Double> getaFragList() {
        return aFragList;
    }

    public void setaFragList(List<Double> aFragList) {
        this.aFragList = aFragList;
    }

    public List<Double> getcFragList() {
        return cFragList;
    }

    public void setcFragList(List<Double> cFragList) {
        this.cFragList = cFragList;
    }

    public List<Double> getxFragList() {
        return xFragList;
    }

    public void setxFragList(List<Double> xFragList) {
        this.xFragList = xFragList;
    }

    public List<Double> getzFragList() {
        return zFragList;
    }

    public void setzFragList(List<Double> zFragList) {
        this.zFragList = zFragList;
    }

    public double[] getAaMassAvg() {
        return aaMassAvg;
    }

    public void setAaMassAvg(double[] aaMassAvg) {
        this.aaMassAvg = aaMassAvg;
    }
}


