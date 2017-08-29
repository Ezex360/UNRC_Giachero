import java.util.*;

public class Fib{

	private static Map<Integer,Integer> cache = new HashMap<Integer,Integer>();

	private static int fibo(int n){
		if (n<0) 
			throw new IllegalArgumentException("Fibbonachi no esta definido para negativos"); 
		else{
			if (n<2)
				return n;
			else
				return memoFibo(n-1) + memoFibo(n-2);
		}
	}

	public static int memoFibo (int n){
		if(!cache.containsKey(n))
			cache.put(n,fibo(n));
		return cache.get(n);
	}

}