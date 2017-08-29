public class Pair{
    private Integer x;
    private Integer y;

    /* Pair(): Constructor of the class */	
    public Pair() {
	x = 0;
	y = 0;
    }

    /* Pair(Object, Object): Constructor of the class */	
    public Pair(Integer v1, Integer v2) {
	x = v1;
	y = v2;
    }

    /* ChangeFst: Updates the value of var. x */	
    public void changeFst(Integer v1) {
	x = v1;
    }

    /* ChangeSnd: Updates the value of var. y */		
    public void changeSnd(Integer v2) {
	y = v2;
    }

    /* fst: Returns the value of var. x */	
    public Integer fst() {
	return x;
    }

    /* snd: Returns the value of var. y */		
    public Integer snd() {
	return y;
    }

    public int compareTo(Pair aux){
	if(this.x < aux.x)
		return -1;
	else if(this.x == aux.x)
		return 0;
	else
		return 1;
    }
    
} // end of class Pair
