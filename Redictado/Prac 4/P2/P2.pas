program p2;
const 
 dimf = 500;
type
 VectorAlu = array [1..dimf] of string;

procedure cargarVector (var va : VectorAlu ; var diml : integer);
var
  n : string;
begin
 diml := 0;
 writeln ('Ingrese el nombre de un alumno');
 readln (n);
  while (n <> 'ZZZ') and (diml < dimf) do begin 
   diml := diml + 1;
   va [diml] := n;
   writeln ('Ingrese el nombre de un alumno');
   readln (n);
  end;
end;


procedure eliminar (var va : VectorAlu ; var diml : integer ; var pude : boolean);
var
 n : string;
 pos , i : integer;
begin
 pude := false; pos := 1;
  writeln ('Ingrese un nombre');
  readln (n);
  while (not pude) and (pos <= diml) do begin
    if (va [i] = n) then 
     for pos := i to (diml - 1) do begin
      va [pos] := va[pos + 1]
     end;
     pude := true;
     diml := diml - 1;
    end;
end;

procedure insertar (var va : VectorAlu ; var diml : integer ; n : string; pos : integer);
var
 i : integer;
begin
 if ((diml + 1) <= dimf) then begin
  writeln ('Ingrese un nombre para insertar');
  readln (n);
   for i := diml downto pos do begin
    va [i+1] := va [i];
    va [4] := n;
    diml := diml + 1;
  end;
 end;
end;


procedure agregar (var va : VectorAlu; var diml : integer);
var
 n : string;
begin
 writeln ('Ingrese un nombre');
 readln (n);
 if (diml + 1 <= dimf) then begin 
  diml := diml + 1;
  va [diml] := n;
 end;
end;


var
v : VectorAlu;
dL,pos:integer;
ok : boolean;
n : string;
BEGIN
	cargarVector(v,dL);
	//Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
	eliminar(v,dL,ok);
	//Lea un nombre y lo inserte en la posición 4 del vector.
	insertar(v,dL,n,pos);
	//Lea un nombre y lo agregue al vector.
	agregar(v,dL);
END.
   