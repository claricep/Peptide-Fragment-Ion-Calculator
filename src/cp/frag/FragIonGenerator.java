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

        public static void main(String[] args) {

            AssignMass amassPar = new AssignMass(true);
            AssignMass.setBionfragment(AssignMass.getnTerm() + amassPar.getH());
            AssignMass.setYionfragment(AssignMass.getcTerm() + amassPar.getOh() + amassPar.getH() + amassPar.getH());

            FragIonGenerator fragIonGenerator = new FragIonGenerator();
            fragIonGenerator.getFragIons("PEPTIDE");

            List<Double> bFragList =  fragIonGenerator.getbFragList();
                System.out.println("==>" + bFragList);
            List<Double> yFragList =  fragIonGenerator.getyFragList();
                System.out.println(yFragList);

        }

        public List<Double> getFragIons(String pepSeq) {

          //  fragList = new ArrayList<>();
            aFragList = new ArrayList<>();
            bFragList = new ArrayList<>();
            cFragList = new ArrayList<>();
            xFragList = new ArrayList<>();
            yFragList = new ArrayList<>();
            zFragList = new ArrayList<>();


            final int CS_FRAG=3;

            int[] ionArr = {0, 1, 2, 6, 7, 8, };

            for (int each : ionArr) {

                //long start = System.currentTimeMillis();

                float[] fragArr = null;
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

                int cs = 1;
                for(float mass:fragArr) {
                    float newMass = (mass+AssignMass.getH()*(cs-1))/cs;
                    int averagineIndex = (int)(newMass/500);

                }

                //System.out.println("==================================");
                if(true)
                    continue;

                switch (each) {
                    /*a*/ case 0:

                        break;
                    /*b*/ case 1:

                        break;

                    /*c*/ case 2:
                        break;

                    /*x*/ case 6:
                        break;

                    /*y*/ case 7:


                        break;

                    /*z*/ case 8:
                        break;

                }

                //    System.out.println("2\t" + (System.currentTimeMillis()-start));

            }

//            System.out.println(fragList);
//            Collections.sort(fragList);
//            System.out.println(fragList);
//
//            for(double each:bFragList) {
//                System.out.println(each + "\t" + fragList.contains(each));
//            }

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
    }


