package sample;

import org.jpl7.Query;
import org.jpl7.Term;

import java.util.ArrayList;
import java.util.List;

public class Solver {

    private List<String> words = new ArrayList<>();

    public Solver() { Query.hasSolution("consult('Ass2.pl')"); }



    public Term[] solve(String s) {

        String s1 = "go([zombifies, akecabele, brickwork, backcheck, acmrremad, nhgwpfabz, jellybean, earreoded],R).";
//stuvwxyza ghiqrzaij abcdefghi bcdefghij abckltucd cdemnvwef efgopxygh jklmnopqr
//        String s = "zombifies akecabele brickwork backcheck acmrremad nhgwpfabz jellybean earreoded";
        if (s.length() <= 0)
            s = "zombifies akecabele brickwork backcheck acmrremad nhgwpfabz jellybean earreoded";
        String Wrds[] =s.split(" ");
        Term sol = Query.oneSolution("go([ " + Wrds[0] + " , " + Wrds[1] + " , " +Wrds[2]+" , "+Wrds[3]+" , "+
                Wrds[4]+" , "+Wrds[5]+" , "+Wrds[6]+" , " +Wrds[7]+" ] , R )").get("R");
        // If the solution is a list
        Term[] sols = new Term[9];
        if (sol.isListPair()) {

            // Unpack list
            sols = sol.toTermArray();

            System.out.println(sols[0].toString());
            System.out.println(sols[1].toString());
            System.out.println(sols[2].toString());
            System.out.println(sols[3].toString());
            System.out.println(sols[4].toString());
            System.out.println(sols[5].toString());
            System.out.println(sols[6].toString());
            System.out.println(sols[7].toString());

        }
        return sols;

    }

}
