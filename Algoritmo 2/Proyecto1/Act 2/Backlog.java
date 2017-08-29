// Trabajo practico N1 - AlgoritmosII - Ejercicio 2
// Integrantes
// Alvarez Nestor     38731561
// Gardiola Joaquin   38418091
// Giachero Ezequiel  39737931

// Implemetacion de un Backlog

import java.util.ArrayList;

public class Backlog {

	private ArrayList<Caracteristica> backlog;
	private ArrayList<Caracteristica> sprint;

	// Constructor
	public Backlog(){
		backlog = new ArrayList<Caracteristica>();
		sprint = new ArrayList<Caracteristica>();

	}

	// Constructor
	public Backlog(ArrayList<Caracteristica> values){
		backlog = new ArrayList<Caracteristica>();
		sprint = new ArrayList<Caracteristica>();
		backlog.addAll(values);
	}

	public void clean (){
		backlog = new ArrayList<Caracteristica>();
	}

	public void add (Caracteristica aux){
		backlog.add(aux);
	}

	public int size(){
		return backlog.size();
	}

	public Caracteristica get(int i){
		return backlog.get(i);
	}


	public void cargarSprint(int hours){
		int[] times = new int[backlog.size()];
		int[] val = new int[backlog.size()];
		Caracteristica aux;
		for (int i=0; i<backlog.size(); i++){
			aux = backlog.get(i);
			times[i] = aux.time();
			val[i] = aux.benefit();
  		}
  		int optimo = cargarSprint(hours,val,times,backlog.size());
	}

	// Carga un Sprint a partir de la cantidad de horas, cantidadd de elementos
	// y dos arreglos con los valores y tiempos de cada uno de los elementos
	// resolviendo el problema de la mochila mediante programacion dinamica
    private int cargarSprint(int hours,int[] val,int[] times, int n){
    	// Generacion de la matriz para la solucion del problema de la mochila
        int i, t;
        int [][]matrix = new int[n+1][hours+1];
        for (i = 0; i <= n; i++){
          for (t = 0; t <= hours; t++){
          	if (i==0 || t==0)
            	matrix[i][t] = 0;
            else if (times[i-1] <= t){
            	int sum = val[i-1] + matrix[i-1][t-times[i-1]];
            	int ant = matrix[i-1][t];
            	if (sum > ant){
            		matrix[i][t] = sum;
            	}else{
            		matrix[i][t] = ant;
            	}
            }
            else
            	matrix[i][t] = matrix[i-1][t];
          }
        }
        // Construccion del sprint a partir de la matriz
        int aux = hours;
		for(int x = n; x >= 1; x--){
			if(matrix[x][aux] != matrix[x-1][aux]){
				sprint.add(backlog.get(x-1));
				aux -= times[x-1];
			}
		}				
        return matrix[n][hours];
    }


	public void clearSprint(){
		sprint = new ArrayList<Caracteristica>();
	}

	// Muestra el sprint
	public String showSprint(){
		String ret = "El Backlog esta compuesto por: \n";
		for(Caracteristica e: sprint) ret+=e.toString();
		return ret;
	}

	// Muestra el Backlog
    public String toString(){
		String ret = "El Backlog esta compuesto por: \n";
		for(Caracteristica e: backlog) ret+=e.toString();
		return ret;
	}

}
