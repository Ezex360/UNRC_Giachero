Program noRef;
Var equis:integer;

Function cuadrado(Var valor:integer):integer;
Begin
	cuadrado := valor * valor;
	valor := valor + 1;
End;

Begin
	equis:=2;
	Writeln(cuadrado(equis));
	Writeln(cuadrado(equis));
End.
