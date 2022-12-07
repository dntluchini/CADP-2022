program p10;
procedure descomponer (num : longint ; var ParesSuma , CantImpares : integer);
var
 dig : integer;
begin
 ParesSuma := 0; CantImpares := 0;
  while (num <> 0) do begin
   dig := num mod 10;
   if ((dig mod 2) = 0) then 
    ParesSuma := ParesSuma + dig
   else 
    CantImpares += 1;
  num := num div 10;
 end;
end;

var
 pares,impares : integer;
 n : longint;
begin
 writeln ('Ingrese un numero');
 readln (n);
  while (n <> 123456) do begin
   descomponer (n,pares,impares);
    writeln ('La suma de numeros pares es ',pares);
    writeln ('La cantidad de los impares es ',impares);
    writeln ('Ingrese un numero');
    readln (n);
  end;
end.
 