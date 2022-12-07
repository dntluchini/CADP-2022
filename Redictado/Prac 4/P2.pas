program Vectores;
const
cant_datos = 150;
type
vdatos = array[1..cant_datos] of real;
procedure cargarVector(var v:vdatos; var dimL : integer);
var
num : real;
begin
  readln (num);
   while (num <> 0) or (dimL < cant_datos) do begin
    diml := diml + 1;
    v [diml] := num;
    readln (num);
   end;
end;
procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
 i : integer;
begin
 suma := 0;
 readln (n);
 for i := 1 to cant_datos do begin
  v [i] :=  v [i] + n;
  suma := suma + v[i];
 end;
end; 
var
 datos : vdatos;
 i, dim : integer;
 num, suma : real;
begin
  dim := 0;
  sumaTotal := 0;
  cargarVector(datos,dim); { completar }
  writeln(‘Ingrese un valor a sumar’);
  readln(num);
  modificarVectorySumar(datos,dim,num,suma);{completar}
 writeln(‘La suma de los valores es: ’, suma);
writeln(‘Se procesaron: ’,dim, ‘ números’)
end.