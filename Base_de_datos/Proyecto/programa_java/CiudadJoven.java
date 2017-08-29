// SELECT tipo_doc,doc,nro_casa FROM menores NATURAL JOIN casa;
// SELECT tipo_doc,doc FROM menores NATURAL JOIN persona WHERE (created_at < '2018-01-01 00:00:00');
// SELECT tipo_doc,doc,count(nro_visita) FROM menores JOIN visita ON (tipo_doc = tipo_doc_menor and doc = doc_menor) WHERE (fecha_visita < '2017-09-01' and fecha_visita >= '2017-08-01') GROUP BY(nro_menor);
import java.util.Scanner;

class CiudadJoven {

	public static void main(String[] args) {
		clearScreen();
		MySQL db = new MySQL();
		//Modificar usuario y contraseña para acceder correctamente a la base de datos
		//en ese mismo orden.
		db.MySQLConnection("proyecto","felipe","CiudadJoven");
		Boolean finish=false;
		while (!finish) {
			System.out.println("Menu");
			System.out.println("1- Insertar un menor.");
			System.out.println("2- Eliminar un personal.");
			System.out.println("3- Listar, dado un menor, las visitas que ha tenido.");
			System.out.println("4- Menores que ingresaron en un determinado año.");	
			System.out.println("5- Listar por cada casa, que menores están alojando.");
			System.out.println("6- Listado de los menores con la cantidad de visitas"+
			" que han tenido un determinado mes.");
			System.out.println("7- Salir");
			String opt = leerTeclado();
			clearScreen();
			if (opt.equals("1"))
				db.insertarMenor();
			else if (opt.equals("2"))
				db.eliminarPersonal();
			else if (opt.equals("3"))
				db.mostrarVisitas();
			else if (opt.equals("4"))
				db.menoresIngresadosFecha();
			else if (opt.equals("5"))
				db.listadoMenoresCasa();
			else if (opt.equals("6"))
				db.listadoCantVisita();
			else if (opt.equals("7"))
				finish = true;
			if (!finish){
				System.out.println("Pulse enter para continuar");
				leerTeclado();
				clearScreen();
			}
		}
		db.closeConnection();
		System.out.println("Adios!");

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
