Program ej6;
Type vector = Array [1..2] of Integer;
Var arreglo : vector;
    i:integer;
Begin
	For i:= 1 to 10 do begin
		arreglo[i]:=6;
		Writeln(arreglo[i]);
	end;
End.
