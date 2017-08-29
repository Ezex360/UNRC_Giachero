import java.util.*; // necessary due to the use of lists.

public class IterativeDeepEngine<S extends State> extends AbstractSearchEngine<S> {
	
    private List<S> visited; // used to store the visited states
    private List<S> path; // used to store the path to the success.
    
	
    public IterativeDeepEngine() {
		super();
		visited = new LinkedList<S>();
		path = new LinkedList<S>();
    }
	
    public IterativeDeepEngine(AbstractSearchProblem<S> p) {		
		super(p);
		visited = new LinkedList<S>();
		path = new LinkedList<S>();
    }
	
    public boolean performSearch() {
	throw new IllegalArgumentException("Necesita indicar profundidad utilizando performSearchDepth(int depth)");
    }
	
	
    public boolean performSearchDepth(int depth) {
        
		// first, we initialise the data structures for the search
		visited = new LinkedList<S>();
		// we get the initial state
		S initialState = problem.initialState();
		
		// now we call a method implementing iterativeDeep 
		boolean resultSearch = iterativeDeep(initialState,depth);
		return resultSearch;
		
    } // end of method performSearch


    private boolean iterativeDeep(S st,int max_depth){
	boolean found;
	for(int depth = 0; depth<=max_depth; depth++){
		visited.clear();
		path.clear();
		found = deepFirst(st,depth);
		if(found)
			return true;
	}
	return false;
    }	    
	
    private boolean deepFirst(S s,int depth){
	if(depth > 0) {    
    	if (!visited.contains(s)) {
		visited.add(0, s); // we add s to the list of visited   
           if (problem.success(s)) {
			
			path.add(0,s); // we add the success state to the path
			return true;
			
			
		} // end then branch
		else {
			
			List<S> succ_s = problem.getSuccessors(s);
			boolean found = false;
			while ( (!succ_s.isEmpty()) && (!found) )  {
				
				S child = succ_s.get(0);
				succ_s.remove(0);
				found = deepFirst(child,depth-1);
				
			} // end while
			if (found) {
				// s leads to a success, so we add it to the path
				path.add(0, s);
			}
			return found;
			
		} // end else branch
        }else 
		return false;
	}else 
		return false;

    }	    

	
    public List<S> getPath() {
        return path;
    } // end of getPath()
    
	
	public void report() {
        System.out.println("Length of path to state when search finished: "+path.size());
		System.out.println("Number of visited when search finished: "+visited.size());
		
    } // end of report()
	

	
} // end of class iterativedeep
