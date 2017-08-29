    import java.util.*; // necessary due to the use of lists.

public class BreadthFirstEngine<S extends State> extends AbstractSearchEngine<S> {
	
    private List<S> visited; // used to store the visited states
    private List<S> path; // used to store the path to the success.
    
	
    public BreadthFirstEngine() {
		super();
		visited = new LinkedList<S>();
		path = new LinkedList<S>();
    }
	
    public BreadthFirstEngine(AbstractSearchProblem<S> p) {		
		super(p);
		visited = new LinkedList<S>();
		path = new LinkedList<S>();
    }
	
    public boolean performSearchDepth(int depth) {
	return performSearch();
    }
	
    public boolean performSearch() {
        
		// first, we initialise the data structures for the search
		visited = new LinkedList<S>();
		// we get the initial state
		S initialState = problem.initialState();
		
		// now we call a recursive method implementing Breadth-first
		boolean resultSearch = breadthFirst(initialState);
		return resultSearch;
		
    } // end of method performSearch


    private boolean breadthFirst(S st){
	List<S> queqe = new LinkedList<S>();
	queqe.add(st);
	while(!queqe.isEmpty()){
		S aux = queqe.remove(0);
		visited.add(aux);
		if (problem.success(aux))
			return true;
		List<S> succ_s = problem.getSuccessors(aux);
		while( !succ_s.isEmpty() ){
			S child = succ_s.remove(0);
			if (!visited.contains(child)) 
				queqe.add(child);
		}

	}
	return false;

    }	    
	
    
	
    public List<S> getPath() {
	int pos = visited.size()-1;
    	while(pos>0){
		path.add(visited.get(pos));
		pos = pos/2;
	}
	path.add(visited.get(0));	
        return path;
    } // end of getPath()
    
	
	public void report() {
        System.out.println("Length of path to state when search finished: "+path.size());
		System.out.println("Number of visited when search finished: "+visited.size());
		
    } // end of report()
	

	
} // end of class BreadthFirst
