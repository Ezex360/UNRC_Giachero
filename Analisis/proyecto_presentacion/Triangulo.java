public abstract class Triangulo {
	private int ladoA;
	private int ladoB;
	private int ladoC;
	
	public Triangulo(int ladoA, int ladoB, int ladoC){
		setLadoA(ladoA);
		setLadoB(ladoB);
		setLadoC(ladoC);
	}
	
	//Escribe el tipo de triangulo que es.
	public abstract String getDescripcion();

	//Definiciones de Get y Set para cada Lado

	public int getLadoA(){
		return ladoA;
	}

	public void setLadoA(int aux){
		ladoA = aux;
	}

	public int getLadoB(){
		return ladoB;
	}

	public void setLadoB(int aux){
		ladoB = aux;
	}

	public int getLadoC(){
		return ladoC;
	}

	public void setLadoC(int aux){
		ladoC = aux;
	}
}
