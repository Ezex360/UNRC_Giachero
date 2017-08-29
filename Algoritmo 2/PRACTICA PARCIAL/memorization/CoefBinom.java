import java.util.*;
public class CoefBinom{
	public static void main(String[] args){
		Pair<Integer,Integer>  test  = 
			new Pair<Integer,Integer>(Integer.parseInt(args[0]) ,Integer.parseInt(args[1]) );
		System.out.println(memoCoefBinom(test) );
	}
	
	private static HashMap<Pair<Integer,Integer>,Integer> cache = new HashMap<Pair<Integer,Integer>,Integer>();
	
	private static Integer coefBinom(Pair<Integer,Integer> par){
		Integer n = par.fst();
		Integer k = par.snd();
		if (n<0 || k<0) throw new IllegalArgumentException("Datos Erroneos");
		else if (n==0 && k!=0)
			return 0;
		else if (k==0)
			return 1;
		else{
			Pair<Integer,Integer>  uno = new Pair<Integer,Integer>(n-1,k-1);
			Pair<Integer,Integer>  dos = new Pair<Integer,Integer>(n-1,k);
			return (memoCoefBinom(uno)+ memoCoefBinom(dos));	
		}

	}

	private static Integer memoCoefBinom(Pair<Integer,Integer> par){
		if(!cache.containsKey(par))
			cache.put(par,coefBinom(par));
		return cache.get(par);
	 }
}
