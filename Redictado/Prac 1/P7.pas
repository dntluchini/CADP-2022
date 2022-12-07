
program Hello;
var
 Cod : integer;
 PrecioAct , PrecioNue , porcentaje : real;
begin
repeat
  writeln ('Ingrese el codigo'); readln (Cod);
  writeln  ('Ingrese el precio actual'); readln (PrecioAct);
  writeln  ('Ingrese el precio nuevo'); readln (PrecioNue);
  porcentaje := PrecioAct + (PrecioAct/100)*10;
  if (PrecioNue > porcentaje) then 
   writeln ('El precio del producto' ,Cod, ' supera en 10% al precio antiguo')
  else
   writeln ('El precio del producto' ,Cod, ' NO supera en 10% al precio antiguo');
until (COD = 32767);
end.