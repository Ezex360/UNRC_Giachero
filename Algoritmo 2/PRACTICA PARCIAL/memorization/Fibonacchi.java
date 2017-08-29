import java.util.*; 

public class Fibonacchi{
	public static void main(String[] args){
		System.out.println(fibo(Integer.parseInt(args[0])));
	}
	
	private static HashMap<Integer,Integer> cache = new HashMap<Integer,Integer>();

	private static Integer fibo(Integer i){
		if (i<0) throw new IllegalArgumentException("Fibonacchi no definido para numeros negativos");
		else if(i==0)
			return 1;
		else if(i==1)
			return 1;
		else
			return memoFibo(i-1) + memoFibo(i-2);

	}
 
	private static Integer memoFibo(Integer i){
		if(!cache.containsKey(i))
			cache.put(i,fibo(i));
		return cache.get(i);
	}
}
