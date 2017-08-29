public class Main {
	public static void main(String[] args){
		TrianguloFactoryMethod factory = new TrianguloFactory();
		Triangulo triangulo = factory.createTriangulo(Integer.parseInt(args[0]),Integer.parseInt(args[1]),Integer.parseInt(args[2]));
		System.out.println(triangulo.getDescripcion());	
		
	}
}
