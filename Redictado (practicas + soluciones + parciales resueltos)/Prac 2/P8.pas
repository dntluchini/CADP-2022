program p8;
procedure leer (var precio : real; var cod : integer; var tipo : string);
begin
 writeln ('Ingrese el codigo del producto');
 readln (cod);
 writeln ('Ingrese el precio del producto');
 readln (precio);
 writeln ('Ingrese el tipo de producto');
 readln (tipo);
end;

procedure masBaratos (cod : integer; precio : real;  var codmin1,codmin2 : integer; var min1,min2 : real);
begin

 if (precio < min1) then begin
  min2 := min1;
  min1 := precio;
  codmin2 := codmin1;
  codmin1 := cod;
 end
 else 
  if (precio < min2) then begin 
   codmin2 := cod;
   min2 := precio;
 end;
end;

var
 prom,total,precio,minimo1,minimo2, max : real;
 codigo,codminimo1,codminimo2,codPantalon,i : integer; 
 tipo : string;
begin
 total := 0; max := -9999;  minimo1 := 9999; minimo2 := 9999;
 for i := 1 to 4 do begin 
  leer (precio,codigo,tipo);
  total := total + precio;
  masBaratos (codigo,precio,codminimo1,codminimo2,minimo1,minimo2);
   if (tipo = 'pantalon') then 
    if (precio > max) then begin 
     max := precio;
     codPantalon := codigo;
    end;
 end;
  prom := total / 100;
  writeln ('El promedio total es ',prom:0:2);
  writeln ('El codigo del pantalon mas caro es ',codPantalon);
  writeln ('Los 2 productos mas baratos fueron ',codminimo1,' con el valor ',minimo1:0:2, ' y ',codminimo2, ' con el valor de ',minimo2:0:2);
end.