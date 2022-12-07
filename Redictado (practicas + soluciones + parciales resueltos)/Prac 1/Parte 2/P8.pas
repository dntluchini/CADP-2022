program p8;
type
	rangoDias = 1..31;
var
 i : rangoDias; // Dias
 monto : real;
 ventasDia,ventasMes : integer;
begin
	ventasMes := 0;
	for i := 1 to 31 do begin
	repeat // Ventas Dia
     writeln ('Ingrese el monto de las ventas realizadas');
     readLn (monto);
     ventasDia += 1
	until (monto = 0);
