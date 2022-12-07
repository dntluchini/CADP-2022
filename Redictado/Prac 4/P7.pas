
type 
 VectorEnt = array [0..9] of integer;

procedure inicializarVector (var ve : VectorEnt);
var
 i : integer;
begin
 for i:= 0 to 9 do  
  ve[i] := 0;
end;

procedure descomponer (n : integer; var ve : VectorEnt);
var
 dig : integer;
begin
 if (n = 0) then 
  ve [0] := ve[0] + 1;
 while (n <> 0) do begin
  dig := n mod 10;
  ve [dig] := ve[dig] + 1;
  n := n div 10;
 end;
end;


procedure noOcurrencias (ve : VectorEnt);
var
 i : integer;
begin
 for i := 0 to 9 do
 if (ve[i] = 0) then 
  writeln ('El digito ',i, ' no tuvo ocurrencias');
end;


procedure MaxDig (ve : VectorEnt ; var Max , dig : integer);
var
 i : integer;
begin
 for i := 0 to 9 do 
  if (ve [i] > Max) then begin
   Max := ve [i];
   dig := i;
 end;
end;

procedure InformarDigs (ve : VectorEnt);
var
 i : integer;
begin
 for i := 0 to 9 do 
  if (ve [i] >= 1) then 
  writeln ('El numero ',i,' aparecio ',ve[i], ' veces ');
end;

var
 vec : VectorEnt;
 max,dig,n : integer;
begin
 max := -999; 
 inicializarVector (vec);
 writeln ('Ingrese un numero');
 readln (n);
  while (n <> -1) do begin
   descomponer (n,vec);
   writeln ('Ingrese un numero');
   readln (n);
  end;
 MaxDig (vec,max,dig);
 noOcurrencias (vec);
 InformarDigs (vec);
    writeln ('El digito mas leido fue ',dig);
end.