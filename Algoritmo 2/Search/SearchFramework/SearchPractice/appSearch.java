

import java.util.*;


public class appSearch {

    public static void main(String[] args) {
    
        
        if ((args.length > 2)||(args.length == 0)) {
	    System.out.println("*** Usage: java appSearch <int> <int>");
	}
	else {
	    int width = Integer.parseInt(args[0]);
	    int height = Integer.parseInt(args[1]);
	    JugsSearchProblem p = new JugsSearchProblem(width,height); 
	    
	    IterativeDeepEngine<JugsState> engine2 = new IterativeDeepEngine<JugsState>(p);
		boolean success = engine2.performSearchDepth(100);
		System.out.println();	    	    
		System.out.println("*** Result using depth-first search ***");
		System.out.println("Solution found? " + success);
		if (success) {
			System.out.print("Path to goal: ");
			List<JugsState> path = engine2.getPath();
			for (int i=0; i<path.size(); i++) {
				JugsState current = path.get(i);
				System.out.print(current.toString());
			}
			System.out.println();
		}
		engine2.report();
	    

	}
    
    } // end of main
    
} // end of appSearch
