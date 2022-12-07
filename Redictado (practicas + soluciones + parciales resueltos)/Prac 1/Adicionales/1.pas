program p1;
const
 k50 = 50000;
var
 cod,cantInver,codMax,cantEmpresas50k ,i: integer;
 montoPorInver ,inverProm, montoTotal,montoMax: real;
begin
	cantEmpresas50k := 0; montoMax := -9999; montoTotal := 0;
    repeat
    inverProm := 0; 
	writeln ('Ingrese el codigo');
	readln (cod);
	writeln ('Ingrese la cantidad de inversiones');
	readln (cantInver);
	writeln ('Ingrese el monto de las inversiones');
	for i := 1 to cantInver do begin 
	 readln (montoPorInver);
	 montoTotal := montoTotal + montoPorInver;
     if (montoPorInver > k50) then //  Cantidad de empresas con inversiones de más de $50000
       cantEmpresas50k += 1;
     if (montoTotal > montoMax) then begin // Para cada empresa, el monto promedio de sus inversiones
      codMax := cod;
      montoMax := montoTotal;
     end;
     inverProm := montoTotal / cantInver; // Para cada empresa, el monto promedio de sus inversiones
   end;
  writeln ('El promedio de la empresa ',cod, ' es ',inverProm:0:2);
   until (cod = 100);
  writeln ('La empresa que mas dinero invirtio fue ',codMax, ' con la cantidad de ',montoMax:1:0);
  writeln ('La cantidad de empresas con mas de 50k de inversiones fueron ',cantEmpresas50k);
 end.
     