public class MainB{
	public static void main(String []args){
		Balanza test = new Balanza(Integer.parseInt(args[0]),Integer.parseInt(args[1]));
		test.detectarFalsa();
	}
}