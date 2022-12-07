program p3;
type
	rangoNota = 1..10;
	str20 = string [20];
var
 nombre : str20;
 nota : rangoNota;
 CantAprobados,Cant7 : integer;
begin
	CantAprobados := 0; Cant7 := 0;
	repeat 
	 writeln ('Ingrese el nombre y apellido del alumno');
	 readln (nombre);
	 writeln ('Ingrese la nota del alumno');
	 readln (nota);
	 if (nota >= 8) then 
	  CantAprobados += 1;
	 if (nota = 7) then 
	  Cant7 += 1;
	 until (nombre ='Zidane Zinedine');
	writeln ('La cantidad de alumnos aprobados fueron ',CantAprobados);
	writeln ('La cantiad de alumnos que sacaron 7 fueron ',Cant7);
end.
