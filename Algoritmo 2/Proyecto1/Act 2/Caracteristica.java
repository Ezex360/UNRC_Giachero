// Trabajo practico N1 - AlgoritmosII - Ejercicio 2
// Integrantes
// Alvarez Nestor     38731561
// Gardiola Joaquin   38418091
// Giachero Ezequiel  39737931

public class Caracteristica {

	private String name;
	private Integer benefit;
	private Integer time_cost;

	// Constructor
	public Caracteristica (String nameAux, Integer ben, Integer time){
		name = nameAux;
		benefit = ben;
		time_cost = time;
	}

	public Integer benefit(){
		return benefit;
	}

	public Integer time(){
		return time_cost;
	}

	//Muestra la Caracteristica
	public String toString(){
		return ("\n El nombre de la Caracteristica es: " + name +
				",\n Beneficio: "+ benefit +
				",\n Costo de tiempo en horas: "+ time_cost + ". \n");
			
	}
	
}