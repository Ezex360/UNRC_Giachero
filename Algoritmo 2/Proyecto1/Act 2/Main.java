// Trabajo practico N1 - AlgoritmosII - Ejercicio 2
// Integrantes
// Alvarez Nestor     38731561
// Gardiola Joaquin   38418091
// Giachero Ezequiel  39737931

import java.util.Scanner;

public class Main{
	
	// Menu Principal	
	public static void main(String[] args){
		Backlog bag = new Backlog();
		Boolean finish=false;
		while (!finish) {
			clearScreen();
			System.out.println("Menu");
			System.out.println("1- Cargar caracteristicas al Backlog");
			System.out.println("2- Mostrar datos del Backlog");
			System.out.println("3- Calcular Sprint eficiente");
			System.out.println("4- Mostrar Sprint calculado");	
			System.out.println("5- Salir");
			String opt = leerTeclado();
			if (opt.equals("1"))
				cargarBacklog(bag);
			else if (opt.equals("2"))
				System.out.println(bag.toString());
			else if (opt.equals("3"))
				calcularSprint(bag);
			else if (opt.equals("4"))
				System.out.println(bag.showSprint());
			else if (opt.equals("5"))
				finish = true;

			System.out.println("Pulse enter para continuar");
			leerTeclado();
			clearScreen();
		}

	}

	//Recibe los dias del sprint y lo calcula
	private static void calcularSprint(Backlog bag){
		System.out.println("Ingrese la cantidad de dias del Sprint a calcular.");
		System.out.println("Recuerde que los Sprint poseen entre 10 y 25 dias, ");
		System.out.println("donde cada dia se trabajan 8 horas.");
		bag.clearSprint();
		Integer days = 0;
		int hours = 0;
		try{
			do {
				days = Integer.parseInt(leerTeclado()); 
			}while (days<10 || days>25);
			hours = days * 8;
		}catch (Exception e) {System.err.println("Se cargaron datos incorrectos. \n");}
		bag.cargarSprint(hours);
	}

	// Recibe caracteristicas por pantalla y las inserta en el Backlog
	public static void cargarBacklog(Backlog bag){
		System.out.println();
		Boolean finish = false;
		try {
			while (!finish) {
				System.out.println("Ingrese Nombre de caracteristica: ");
				String str1 = leerTeclado(); 
				System.out.println("Valor estimado de la caracteristica: ");
				Integer int1 = Integer.parseInt(leerTeclado());
				System.out.println("Costo de tiempo (en horas) aproximado: ");
				Integer int2 = Integer.parseInt(leerTeclado());
				Caracteristica aux = new Caracteristica(str1,int1,int2);
				bag.add(aux);
				System.out.println("Desea cargar otra caracteristica (y/N): ");
				String out = leerTeclado();
				finish = !(out.equals("y") || out.equals("Y"));
				System.out.println();
			}
		}catch (Exception e) {System.err.println("Se cargaron datos incorrectos. \n");}

	}

	//Funcion para leer cadenas por teclado
	public static String leerTeclado(){
		String entradaTeclado = "";
	    Scanner entradaEscaner = new Scanner (System.in); 
	    entradaTeclado = entradaEscaner.nextLine();
	    return entradaTeclado;
	}

	//Funcion para limpiar la pantalla
		public static void clearScreen() {  
	    System.out.print("\033[H\033[2J");  
	    System.out.flush();  
  	}  

}
