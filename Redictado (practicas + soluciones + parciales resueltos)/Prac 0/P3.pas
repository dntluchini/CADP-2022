
program Hello;
var
 n1,n2, resul : real;
begin
 writeln ('Ingrese 2 numeros');
 read (n1); read (n2);
 resul := n1 / n2;
 writeln ('El resultado es : ',resul:0:2);
end.