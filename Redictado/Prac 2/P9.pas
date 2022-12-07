program p9;
procedure dig (num : integer; var cantDig ,suma : integer);
var
 dig : integer;
begin
 suma := 0;
 cantDig := 0;
  while (num <> 0) do begin
    dig := num mod 10;
    cantDig += 1; 
    suma := suma + dig;
    num := num div 10;
 end;
end;

var
 n,cantDigitos,suma,DigTotales : integer;
begin
DigTotales := 0;
 repeat 
  writeln ('Ingrese un numero');
  readln (n);
  dig (n,cantDigitos,suma);
  DigTotales := DigTotales + cantDigitos;
 until (suma = 10);
  writeln ('La cantidad de digitos es ',cantDigitos);
  writeln ('La suma de los digitos es ',suma);
end.