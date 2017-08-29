public class Knapsack{
	public static void main(String[] args){
		Pair item1 = new Pair(7,3);
		Pair item2 = new Pair(1,5);
		Pair item3 = new Pair(5,7);
		Pair item4 = new Pair(3,3);
		Pair item5 = new Pair(7,3);
		add(item1);
		add(item2);
		add(item3);
		add(item4);
		add(item5);
		int pm = 9;
		Pair[] greedy = solve(pm);
		System.out.println("Peso de la mochila = " + pm);
		System.out.println("Resultado");
		try{
		for(int i=0;i<greedy.length;i++)
			System.out.println("Peso : "+greedy[i].fst()+" Valor : "+greedy[i].snd());
		}catch(NullPointerException e){};
	}
	
	private final static int max = 20;
	private static int count = 0;
	private static Pair[] sack = new Pair[max];
	
	private static void bbsort(){
		for(int i=0;i<count-1;i++){
			for(int j=0;j<count-1;j++){
				if (sack[j].compareTo(sack[j+1]) > 0) 
				       	swap(j,(j+1));
			}
		}
	}
	
	private static void swap(int i, int j){
		Pair aux = sack[i];
		sack[i] = sack[j];
		sack[j] = aux;
	}
	
	public static void add(Pair x){
		sack[count++] = x;
	}

	public static Pair[] solve(int PM){
		Pair[] res = new Pair[count];
		bbsort();
		int pos = 0;
		for(int i=0; i<count; i++)
			if(sack[i].fst() <= PM){
				res[pos++] = sack[i];
				PM -= sack[i].fst();
			}		
		return res;

	}


}
