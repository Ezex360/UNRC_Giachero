public class MainS { 
	public static void main(String[] args){
		Integer[] array = new Integer[10];
		array[0]=1;
		array[1]=3;
		array[2]=7;
		array[3]=4;
		array[4]=5;
		array[5]=2;
		array[6]=3;
		array[7]=4;
		array[8]=0;
		array[9]=0;

		for(int i = 0; i<10; i++){
			System.out.print(array[i]+", ");
		}
		System.out.println("");
		
		SortingX.partialSorting(array,0,9);

		for(int i = 0; i<10; i++){
			System.out.print(array[i]+", ");
		}
		System.out.println("");


	}
}