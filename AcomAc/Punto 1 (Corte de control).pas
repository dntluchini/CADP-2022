
program Hello;
type
 propiedad = record
  zona : string;
  tipo : string;
  precio : real;
 end; 

procedure leerp (var p : propiedad);
begin
 writeln ('Ingrese el precio');
 readln (p.precio);
  if (p.precio <> -1) then begin 
   writeln ('Ingrese el tipo de vivienda');
   readln (p.tipo);
   writeln ('Ingrese la zona');
   readln (p.zona);
  end;
end;
 
procedure mayor (p : propiedad ; var ZonaMayor , TipoMayor : string);
var
 max , MayorPrecio: real;
begin
 max := -1;
 if (p.precio > max) then begin
  MayorPrecio := p.precio;
  ZonaMayor := p.zona;
  TipoMayor := p.tipo;
 end;
end;

var
 p : propiedad;
 Prom , PrecioTotal : real;
 PropPorZona : integer;
 TipoM,ZonaM,zonaActual : string;
 
begin
Prom := 0;
PrecioTotal := 0;
 leerp (p);
 while (p.precio <> -1) do begin
  zonaActual := p.zona;
   while (p.precio <> -1) and (p.zona = zonaActual) do begin 
    PropPorZona += 1;
    PrecioTotal := PrecioTotal + p.precio;
    leerp (p);
  end;
   Prom := PrecioTotal / PropPorZona;
   writeln ('El promedio de la zona ',zonaActual, ' es ',Prom:1:2);
 end;
  mayor (p,ZonaM,TipoM); 
  writeln ('La zona y el tipo de vivienda mas caro son : ',ZonaM, ' y ',TipoM);
end.
