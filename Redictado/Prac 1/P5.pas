
program Hello;
const
 maxNum = 10;
var
 n , nDoble  : real;
 numTotal : integer;
begin
 numTotal := 0;
 writeln ('Ingrese un numero');
 readln (n);
 nDoble := n*2;
  while (n <> nDoble) and (numTotal <= maxNum) do begin
   numTotal += 1;
   readln (n);
  end;
 writeln ('La cantidad de numeros es ' ,numTotal)
end.
 