public class Balanza{
	private static Integer[] array;
	private Integer falsa;

	public Balanza(int cant, int num) {
		array = new Integer[cant];
		falsa = num;
		for (int i=0;i<cant;i++){
			if (i!=(num-1))
				array[i] = 1;
			else 
				array[i] = 2;
		}
		System.out.println("Balanza Cargada");
	}

	private static Integer pesar(int begin, int end){
		int res=0;
		int i=begin;
		while (i<=end){
			res+=array[i];
			i++;
		}
		return res;
	}

	public static void detectarFalsa(){

		int cantidad = array.length;
		boolean detectada = false;
		int mitad,sobrante,peso1,peso2;
		int count=0;
		int begin = 0;
		int end = array.length-1;
		System.out.println("Cantidad de monedas "+ (end+1));
		while (!detectada){
			count++;
			mitad = (begin+end)/2; sobrante = (begin+end+1)%2;
			if (sobrante==0){
				peso1 = pesar(begin,mitad);
				peso2 = pesar(mitad+1,end);
			}else{
				peso1 = pesar(begin,mitad-1);
				peso2 = pesar(mitad+1,end);
			}
			System.out.println("Pesada nro: "+count+" Peso Primer Mitad: "+peso1+
			" Peso Segunda Mitad: "+peso2+" Sobrante en balanza: "+sobrante);
			if (peso1 == peso2 && sobrante==1){
				detectada = true;
				System.out.println("1 - Se detecto la moneda Falsa en la posicion: "+(mitad+1));
			}
			else if (peso1<=peso2){
				if (begin==end-1){
					detectada = true;
					System.out.println("2 - Se detecto la moneda Falsa en la posicion: "+(end+1));
				}
				else
					begin = mitad;
			}
			else if (peso1>=peso2){
				if (begin==end-1){
					detectada = true;
					System.out.println("3 - Se detecto la moneda Falsa en la posicion: "+(begin+1));
				}
				else
					end = mitad;
			}
		}

	}
}