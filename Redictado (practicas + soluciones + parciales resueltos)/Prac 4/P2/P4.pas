program p4;
const
 dimf = 1000;
type
	alumno = record
	 nro : integer;
	 ape : string;
	 nomb : string;
	 cantAsis : integer;
	end
 vecAlu = array [1..dimf] of alumno;

procedure leerAlu (var a :alumno);
begin
	 writeln ('Ingrese el nombre y apellido del alumno');
	 readln (a.ape);
	 readln (a.nomb);
	 writeln ('Ingrese el numero de alumno');
	 readln (a.nro);
	 writeln ('Ingrese la cantidad de asistencias');
	 readln (a.cantAsis);
end;



procedure cargarVector (var vA :vecAlu; var diml : integer);
var
 a : alumno;
begin
	leerAlu (a);
	 while (diml < dimf) do begin 
	  diml := diml + 1;
	  vecAlu [diml] := a;
	  leerAlu (a);
	 end;
	writeln ('Finalizo la carga de alumnos');
end;


procedure retornar (va : vecAlu ; nroRecibido , diml: integer; var pos : integer);
begin
	 writeln ('Ingres el numero del alumno que desea la posicion');
	 readln (nroRecibido);
	while (vecAlu[diml].nro <> 0) do begin
	 if (va[diml].nro = nroRecibido) then 
	  pos := diml;
	end;
end;



procedure insertar (var va : vecAlu; var diml : integer; alu : alumno ; var pude : boolean);
var
 pos,i : integer;
begin
 pude := false;
 writeln ('Ingrese la posicion a insertar del alumno');
 readln (pos);
 if ((diml + 1) <= dimf) and (pos <= diml) then begin
  leerAlu (alu);
  for i := diml downto pos do
   va [i+1] := va[i];
   pude := true;
   va[pos] := alu;
   diml := diml + 1;
  end;
end;

procedure eliminar (var va : vecAlu ; var diml : integer; posEliminar : integer ; var pude : boolean);
var
i : integer;
begin
 pude := false;
  writeln ('Ingrese la posicion del alumno que desea borrar');
  readln (posEliminar);
   while (posEliminar > 1) and (not pude) and (pos <= diml) do begin
    for i := posEliminar to (diml - 1) do begin
     va[i] := va[i+1];
     pude := true;
     diml := diml - 1;
    end;
   end;
end;

procedure eliminarNroAlu (var va : vecAlu ; var diml : integer; nroEliminar : integer ; var pude : boolean);
var
 i,pos: integer;
begin
	pude := false;
	pos := 1;
	writeln ('Ingrese el numero de alumno que desea eliminar');
	readln (nroEliminar);
	 while (not pude) and (pos <= diml) do begin
	  if (va [i] = nroEliminar) then 
	  for i := pos to (diml - 1) do begin
	   va [i] := va[i+1];
	   pude := true;
	   diml := diml - 1;
	  end
	 else
	  writeln ('No se encontro un alumno con ese nro');
    end;
end;

procedure eliminarAsis0 (var va : vecAlu ; var diml : integer);
var
 cant0 , i : integer;
begin
 for i := 1 to diml do begin
  if (va[i].cantAsis = 0) then 
   cant0 := cant0 + 1;
   va[i] := va[i+1]
  else
   i := i + 1;
 end;
  diml := diml - cant0;
end;
