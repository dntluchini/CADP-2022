
program Hello;
const
 dolar = 300;
var
 MontoTotal , MontoDolar , Comision: real;
begin
 writeln ('Ingrese la cantidad en dolares');
 read (MontoDolar);
 writeln ('Ingrese la comision');
 read (Comision);
 MontoTotal := (MontoDolar*dolar) + (MontoDolar*dolar*Comision)/100 ;
 writeln ('El monto total es ',MontoTotal:0:2, ' en pesos argentinos');
end.
 