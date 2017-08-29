package examples.farmer;
import framework.State;
public class EstadoGranja implements State {
	
	private EstadoGranja parent;
    public int granjero; 
    public int zorro; 
    public int gallina; 
    public int maiz; 

    public EstadoGranja() {
        granjero = 1;
        zorro = 1;
        gallina = 1;
        maiz = 1;
    }

    public EstadoGranja(int granjero, int zorro, int gallina, int maiz) {
        this.granjero = granjero;
        this.zorro = zorro;
        this.gallina = gallina;
        this.maiz = maiz;
    }

    public static boolean igualSigno(int x, int y) {
        if (x==0 && y==0) return true;
        if (x>0 && y>0) return true;
        if (x<0 && y<0) return true;
        return false;
    }

    public boolean equals(State other) {
        EstadoGranja sg = (EstadoGranja) other;
        return (igualSigno(granjero,sg.granjero) && igualSigno(zorro,sg.zorro)
                && igualSigno(gallina,sg.gallina) && igualSigno(maiz,sg.maiz));
    }

   public String toString() {
       return ("("+granjero+","+zorro+","+gallina+","+maiz+")");
   }
   
   public void setParent( State other){
		parent= (EstadoGranja)other;
	}
	
	public State getParent(){
		return parent;
	}

}
