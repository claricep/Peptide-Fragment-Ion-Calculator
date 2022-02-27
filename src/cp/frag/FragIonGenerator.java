package cp.frag;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.*;

    public class FragIonGenerator {
        public static void main(String[] args) {

            AssignMass amassPar = new AssignMass(true);
            AssignMass.setBionfragment(AssignMass.getnTerm() + amassPar.getH());
            AssignMass.setYionfragment(AssignMass.getcTerm() + amassPar.getOh() + amassPar.getH() + amassPar.getH());

            FragIonGenerator fragIonGenerator = new FragIonGenerator();
            fragIonGenerator.getFragIons("PEPTIDE");

        }

        public void getFragIons(String pepSeq) {

            List<Double> fragList = new ArrayList();
            List<Double> bFragList = new ArrayList();
            List<Double> yFragList = new ArrayList();

            final int CS_FRAG=3;

            int[] ionArr = {1, 7, };

            for (int each : ionArr) {

                //long start = System.currentTimeMillis();

                float[] fragArr = null;
                switch (each) {
                    /*a*/ case 0:
                        /*b*/ case 1:
                        /*c*/ case 2:
                        fragArr = AssignMass.getFragIonArr(pepSeq, each);

                        for(float f:fragArr) {
                            fragList.add((double) f);
                            bFragList.add((double) f);
                        }

                        break;

                    /*x*/ case 6:
                        /*y*/ case 7:
                        /*z*/ case 8:
                        fragArr = AssignMass.getFragIonArrRev(pepSeq, each);

                        for(float f:fragArr) {
                            fragList.add((double) f);
                            yFragList.add((double) f);
                        }

                        break;

                }

                int cs = 1;
                for(float mass:fragArr) {
                    float newMass = (mass+AssignMass.getH()*(cs-1))/cs;
                    int averagineIndex = (int)(newMass/500);

                }

                System.out.println("==================================");
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

            System.out.println(fragList);
            Collections.sort(fragList);
            System.out.println(fragList);

            for(double each:bFragList) {
                System.out.println(each + "\t" + fragList.contains(each));
            }

        }
    }


