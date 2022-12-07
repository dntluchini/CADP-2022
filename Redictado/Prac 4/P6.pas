const
 dimf = 100;
type 
 VectorEnt = array [1..dimf] of integer;

procedure inicializarVector (var ve : VectorEnt);
var
 i : integer;
begin
 for i:= 1 to dimf do  
  ve[i] := 0;
end;


procedure cargarvector (var ve : VectorEnt ; var diml : integer);
var
n : integer;
begin
 writeln ('Ingrese un numero');
 readln (n);
  while (n <> 0) and (diml < dimf) do begin
   diml := diml + 1;
   ve [diml] := n;
   writeln ('Ingrese otro numero');
   readln (n);
  end;
 writeln ('La carga fue finalizada');
end;



procedure Maximo (ve : VectorEnt; dimL : integer; var maxNum , maxPos , minNum , minPos : integer );
var
 i : integer;
begin
 for i := 1 to dimL do begin
 if (ve[i] > maxNum) then begin
  maxNum := ve[i];
  maxPos := i;
 end;
 if (ve[i] < minNum) then begin
   minNum := ve[i];
   minPos := i;
  end;
 end;
end;




procedure Swap (var ve : VectorEnt ;  x,y : integer);
var
 aux : integer;
begin
 aux := ve [y];
 ve [y] := ve[x];
 ve [x] := aux;
end;

var
 vector : VectorEnt;
 dimL,min,max,posMax,posMin : integer;
begin
 min := 9999; max := -9999; 
 dimL := 0;
 inicializarVector (vector);
 cargarvector (vector,dimL);
 Maximo (vector,dimL,max,posMax,min,posMin);
 Swap (vector,posMax,posMin);
  writeln ('El elemento máximo ' ,max, ' que se encontraba en la posición ' ,posMax, ' fue intercambiado con el elemento mínimo ' ,min, ' que se encontraba en la posicion ' ,posMin);
end.
 