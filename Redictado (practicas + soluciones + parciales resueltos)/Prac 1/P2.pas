
program Hello;
var
 n : real;
begin
 writeln ('Ingrese un numero');
 read (n);
 if (n >= 0) then 
  write ('El valor absoluto de ' ,n:0:2, ' es ',n:0:2)
 else
   write ('El valor absoluto de ' ,n:0:2, ' es ',n*-1:0:2);
end.
 