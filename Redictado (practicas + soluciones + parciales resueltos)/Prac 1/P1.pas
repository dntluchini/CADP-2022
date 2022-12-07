
program Hello;
var
 n1,n2 : integer;
begin
 writeln ('Ingrese 2 numeros');
 read (n1); readln (n2);
 if (n1 > n2) then 
  write ('El numero ',n1, ' es mas grande')
 else
  if (n2 > n1) then 
   write ('El numero ',n2, ' es mas grande')
  else
   write ('Los 2 numeros son iguales');
end.
 