
program Hello;
const
 valorC = 1.60;
var
 x , y , CaraXcliente, sobrantes : integer;
 Pcaramelo: real;
begin
 sobrantes := 0;
 Pcaramelo := 0;
 writeln ('Ingrese la cantidad de clientes');
 read (x);
 writeln ('Ingrese la cantidad de caramelos');
 read (y);
 Pcaramelo := y*valorC;
 CaraXcliente := y div x;
 sobrantes := y mod x;
  writeln ('A cada cliente le corresponde ',CaraXcliente);
  writeln ('Le sobraron ',sobrantes);
  writeln ('Cobrara ',Pcaramelo:0:2);
end.