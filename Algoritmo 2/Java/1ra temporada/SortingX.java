public class SortingX {

	public static void merge (Integer[] array, int begin, int mid, int end){
		int i=begin; int j = mid+1;
		System.out.println("Merge con medio: "+mid+" y fin: "+end);
		for (int n=0;n<=end;n++){
			if (i>mid){
				array[n] = array[j];
				j++;
			}
			else if (j>end){
				array[n] = array[i];
				i++;
			}
			else{
				if (array[i] <= array[j]){
					array[n]=array[i];
					i++;
				}else{
					array[n]=array[j];
					j++;
				}				
			}
		}

	}

	public static void partialSorting(Integer[] array, int begin, int end){
		int end1=0,end2=0,count;
		boolean toMerge=false;
		count = 0;
		for (int i=0;i<end;i++){
			if (array[i]>array[i+1]){
				if (count==0){
					end1=i;
					count++;
				}
				else if (count==1){
					end2=i;
					toMerge = true;
				}
			}

			if (toMerge){
				merge(array,0,end1,end2);
				toMerge=false;
				end1=end2+1;
			}
		}
		if (end1!=0 && end2!=0)
			merge(array,0,end1,array.length-1);

	}



}