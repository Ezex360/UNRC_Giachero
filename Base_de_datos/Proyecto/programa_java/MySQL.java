import java.sql.*;
import java.util.Scanner;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MySQL{

    //Conector 
    private static Connection connection;

    //Conectar a la base de datos
    public void MySQLConnection(String user, String pass, String db_name) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db_name, user, pass);
            System.out.println("Se ha iniciado la conexión con el servidor de forma exitosa");
	    } catch(ClassNotFoundException cnfe) {
	      System.err.println("Error loading driver: " + cnfe);
	    } catch(SQLException sqle) {
	    	sqle.printStackTrace();
	      System.err.println("Error connecting: " + sqle);
	    }
    }
 

    //Cerrar conexion a la base de datos
    public void closeConnection() {
        try {
            connection.close();
            System.out.println("Se ha finalizado la conexión con el servidor");
	    } catch(SQLException sqle) {
	    	sqle.printStackTrace();
	      System.err.println("Error connecting: " + sqle);
	    }
    }

    public void insertarMenor(){
        try {
	      connection.setAutoCommit(false);

		  SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		  java.util.Date fecha_nacimiento = new java.util.Date();
		  Float peso = new Float(2);
		  Integer nro_casa=0;

	      System.out.println("Carga de datos ");
	      System.out.println("Tipo Documento (dni,pasaporte): ");
	      String tipo_doc = leerTeclado();
	      System.out.println("Documento: ");
	      String doc = leerTeclado();
	      System.out.println("Nombre: ");
	      String nombre = leerTeclado();
	      System.out.println("Apellido: ");
	      String apellido = leerTeclado();
	      System.out.println("Peso: ");
	      try{
	      	peso = Float.parseFloat(leerTeclado());
	      }catch(Exception p){System.err.println("Peso incorrecto");}
	      System.out.println("Talla: ");
	      String talla = leerTeclado();
	      System.out.println("Fecha de Nacimiento ('dd-MM-yyyy')");
	      try{
	      	fecha_nacimiento = formatter.parse(leerTeclado());
	      }catch(ParseException p){System.err.println("Fecha mal colocada");}
	      System.out.println("Nro de casa: ");
	      try{
	      	nro_casa = Integer.parseInt(leerTeclado());
	      }catch(Exception p){System.err.println("Nro de casa incorrecto");}
	      System.out.println("Condicion (dia,permanente): ");
	      String condicion = leerTeclado();
	      System.out.println("Estado (ingresado,egresado): ");
	      String estado = leerTeclado();
	      String query1 = "insert into persona (tipo_doc,doc,nombre,apellido) values(?,?,?,?)";
	      
	      PreparedStatement persona = connection.prepareStatement(query1);
	      persona.setString(1,tipo_doc);
	      persona.setString(2,doc);
	      persona.setString(3,nombre);
	      persona.setString(4,apellido);
	      persona.executeUpdate();
	      connection.commit();

	      java.sql.Date sqlFechaNacimiento = new java.sql.Date(fecha_nacimiento.getTime());  
	      String query2 = "insert into menores (tipo_doc,doc,peso,talla,"
	      + "fecha_nacimiento,nro_casa,condicion,estado) values(?,?,?,?,?,?,?,?)";
	      PreparedStatement menor = connection.prepareStatement(query2);
	      menor.setString(1,tipo_doc);
	      menor.setString(2,doc);
	      menor.setFloat(3,peso);
	      menor.setString(4,talla);
	      menor.setDate(5,sqlFechaNacimiento);
	      menor.setInt(6,nro_casa);
	      menor.setString(7,condicion);
	      menor.setString(8,estado);
	      menor.executeUpdate();
    	  connection.commit();

	      connection.setAutoCommit(true); 
	      System.out.println("Menor cargado correctamente");

	    } catch(SQLException sqle) {
	        try	
	        {
	        // como se produjo una excepcion en el acceso a la base de datos se debe hacer el rollback	
	         System.err.println("antes rollback: " + sqle);
	         connection.rollback();
	         System.err.println("Error Se produjo una Excepcion accediendo a la base de datoas: " + sqle);
	         sqle.printStackTrace();
	        } 
	        catch(Exception e)
	        {
	            System.err.println("Error Ejecutando el rollback de la transaccion: " + e.getMessage());
	            e.printStackTrace();
	        }
	    }
    }

    public void eliminarPersonal() {
        try {
		    System.out.println("Ingrese datos de la persona a eliminar");
		    System.out.println("Tipo Documento (dni,pasaporte): ");
		    String tipo_doc = leerTeclado();
		    System.out.println("Documento: ");
		    String doc = leerTeclado();

            String Query = "DELETE FROM personal WHERE (tipo_doc = '"+tipo_doc+"' and doc = '"+doc+"')";
            Statement st = connection.createStatement();
            st.executeUpdate(Query);
 			
 			System.out.println("Personal eliminado correctamente");
        } catch(SQLException sqle) {
	    	sqle.printStackTrace();
	      System.err.println("Error connecting: " + sqle);
	    }
    }
 
    public void mostrarVisitas() {
        try {
		    System.out.println("Ingrese datos del menor");
		    System.out.println("Tipo Documento (dni,pasaporte): ");
		    String tipo_doc = leerTeclado();
		    System.out.println("Documento: ");
		    String doc = leerTeclado();

            String query = "SELECT * FROM visita WHERE" +
            "(tipo_doc_menor = '"+tipo_doc+"' AND doc_menor = '"+doc+"')";
            Statement st = connection.createStatement();
            ResultSet resultSet = st.executeQuery(query);
 
            while (resultSet.next()) {
                System.out.println("\nNro Visita: " + resultSet.getString("nro_visita") + " "
                        + "\nTipo Documento Menor: " + resultSet.getString("tipo_doc_menor") + " " 
                        + "\nDocumento Menor: " + resultSet.getString("doc_menor") + " "
                        + "\nTipo Documento Adulto: " + resultSet.getString("tipo_doc_adulto") + " "
                        + "\nDocumento Adulto: " + resultSet.getString("doc_adulto") + " "
                        + "\nFecha y hora Visita:" + resultSet.getString("fecha_visita"));
                System.out.println();
            }
 
	    } catch(SQLException sqle) {
	    	sqle.printStackTrace();
	      System.err.println("Error connecting: " + sqle);
	    }
    }
 
    public void listadoMenoresCasa() {
        try {
            String query = "SELECT tipo_doc,doc,nro_casa FROM menores NATURAL JOIN casa";
            Statement st = connection.createStatement();
            ResultSet resultSet = st.executeQuery(query);
 
            while (resultSet.next()) {
                System.out.println("- Tipo Documento Menor: " + resultSet.getString(1) + " "
                        + "Documento Menor: " + resultSet.getString(2) + " "
                        + "Nro casa: " + resultSet.getString(3));
            }
 
	    } catch(SQLException sqle) {
	    	sqle.printStackTrace();
	      System.err.println("Error connecting: " + sqle);
	    }
    }

    public void menoresIngresadosFecha() {
        try {

        	System.out.println("Ingrese el año (yyyy)");
		    String fecha = leerTeclado();


            String query = "SELECT * FROM menores NATURAL JOIN persona " +
            "WHERE (created_at >= '"+fecha+"-01-01' and created_at <= '"+fecha+"-12-31')";
            Statement st = connection.createStatement();
            ResultSet resultSet = st.executeQuery(query);
 	
 			System.out.println("Resultados: ");
            while (resultSet.next()) {
                System.out.println("\n+ Tipo Documento Menor: " + resultSet.getString("tipo_doc") + " "
                        + "\n+ Documento Menor: " + resultSet.getString("doc") + " "
                        + "\n- Nombre: " + resultSet.getString("nombre") + " "
                        + "\n- Apellido: " + resultSet.getString("apellido") + " "
                        + "\n- Fecha de Nacimiento: " + resultSet.getString("fecha_nacimiento") + " "
                        + "\n- Nro casa: " + resultSet.getString("nro_casa") + " "
                        + "\n- Condicion: " + resultSet.getString("condicion") + " "
                        + "\n- Estado: " + resultSet.getString("estado"));
            }
 
	    } catch(SQLException sqle) {
	    	sqle.printStackTrace();
	      System.err.println("Error connecting: " + sqle);
	    }
    }

    public void listadoCantVisita() {
        try {

        	System.out.println("Ingrese el año (yyyy)");
		    String fechaA = leerTeclado();
		    System.out.println("Ingrese el mes (MM)");
		    String fechaB = leerTeclado();

            String query = "SELECT tipo_doc,doc,count(nro_visita) As cantVisita FROM menores JOIN visita "+
            "ON (tipo_doc = tipo_doc_menor and doc = doc_menor)"+ 
    		"WHERE (fecha_visita >= '"+fechaA+"-"+fechaB+"-01' and fecha_visita <= '"+fechaA+"-"+fechaB+"-31 24:00:00')"+
    		"GROUP BY(nro_menor)";
			Statement st = connection.createStatement();
            ResultSet resultSet = st.executeQuery(query);
 	
 			System.out.println("Resultados: ");
            while (resultSet.next()) {
                System.out.println("\n+ Tipo Documento Menor: " + resultSet.getString("tipo_doc") + " "
                        + "\n+ Documento Menor: " + resultSet.getString("doc") + " "
                        + "\n- Cantidad de visitas: " + resultSet.getString("cantVisita"));
            }
 
	    } catch(SQLException sqle) {
	    	sqle.printStackTrace();
	      System.err.println("Error connecting: " + sqle);
	    }
    }

    //Permite leer por teclado y devuelve una cadena
	public static String leerTeclado(){
		String entradaTeclado = "";
	    Scanner entradaEscaner = new Scanner (System.in); 
	    entradaTeclado = entradaEscaner.nextLine();
	    return entradaTeclado;
	}

}
