const
 finAnio = 12;
type
 rangoAnio = 1..finAnio;
 venta = record 
  nomLocalidad : string;
  montoVenta : real;
 end;
  
 lista = ^nodo;
 nodo = record
  dato : venta;
  sig : lista;
 end;
 
 vecVentas = array [rangoAnio] of lista;
 
procedure leerV (var v : venta);
begin 
  write ('Ingrese el monto de la venta : ');
  readln (v.montoVenta);
   if (v.montoVenta <> 0) then begin 
    write ('Ingrese la localidad de la venta : ');
    readln (v.nomLocalidad);
  end;
end;
 
 
procedure agregarA (var l : lista; v : venta);
var
 aux : lista;
begin 
 new (aux);
 aux^.dato := v;
 aux^.sig := l;
 l := aux;
end;


procedure cargarL (var l : lista);
var
 v : venta;
begin 
 leerV (v);
  while (v.montoVenta <> 0) do begin 
   agregarA (l,v);
   leerV (v);
  end;
end;



function montoTot (l:lista; loc:string) : real;
var 
 monto : real;
begin 
 monto := 0;
    while (l <> nil) do begin 
     if (l^.dato.nomLocalidad = loc) then 
     monto := monto + l^.dato.montoVenta;
    l := l^.sig;
 end;
  montoTot := monto;
end;




procedure cargarVxMes (var vL : vecVentas);
var
 i : integer;
begin 
 for i := 1 to finAnio do begin 
  vL [i] := nil;
  cargarL (vL[i]);
 end;
end;



procedure recorrerV (v : vecVentas);
var
 min1,min2,totLocalidad : real;
 minMes1,minMes2,i : integer;
 loc : string;
begin
 min1 := 99999;
 min2 := 99999;
 write ('Ingrese una localidad ');
 readln (loc);
  for i := 1 to finAnio do begin 
  totLocalidad := montoTot (v[i],loc);
  if (totLocalidad < min1) then begin 
   min2 := min1;
   min1 := totLocalidad;
   minMes2 := minMes1;
   minMes1 := i;
  end
  else 
   if (totLocalidad < min2) then begin
    totLocalidad := min2;
    minMes2 := i;
  end;
 end;
   writeln ('El 1er mes con menor facturacion es : ',minMes1, '(',min1:0:2,')');
   writeln ('El 2do mes con menor facturacion es : ',minMes2, '(',min2:0:2,')');
end;

var
 v : vecVentas;
begin 
 cargarVxMes (v);
 recorrerV (v);
end.
