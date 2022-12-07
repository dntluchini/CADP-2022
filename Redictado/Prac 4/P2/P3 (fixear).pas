program p3;
const 
 dimf = 200;
type
 dias = 1..31;
 
 vecDias = array [dias] of integer;
 viaje = record
  dia : dias;
  dinero : real;
  distancia : real;
 end;
vecViajes = array [1..200] of viaje;
 
procedure leerV (var v : viaje);
begin
 writeln ('Ingrese el dia del viaje');
 readln (v.dia);
 writeln ('Ingrese el dinero transportado');
 readln (v.dinero);
 writeln ('Ingrese la distancia transcurrida');
 readln (v.distancia);
end;


procedure cargarVector (var vv : vecViajes; var diml : integer);
var
 via : viaje;
begin
 leerV (via);
  while (via.distancia <> 0) and (diml < dimf) do begin
   diml := diml + 1;
   vv [diml] := via;
   leerV (via);
  end;
   writeln ('Cargar finalizada');
end;


procedure inicializarDias (var vDias : vecDias);
var
 i : integer;
begin 
 for i := 1 to 31 do 
  vDias[i] := 0;
end;

procedure Min (v : viaje ; var vMin : viaje);
begin
 if (v.dinero < vMin.dinero) then 
  vMin := v;
end;

procedure imprimirDias (vD : vecDias);
var
 i : integer;
begin
 for i := 1 to 31 do 
  writeln ('El dia ',i, ' tuvo ',vD [i], ' viajes ');
end;


procedure RecorrerB (via : vecViajes ; diml : integer ; var vd : vecDias);
var
 i : integer;
 vMin : viaje;
 total : real;
begin
 total := 0;
 vMin.dinero := 9999;
 for i := 1 to diml do begin 
  total := total + via [i].dinero;
  Min (via[i],vMin);
  Vd [via[i].dia] += 1;
 end;
  writeln ('El monto promedio de viajes fue ',total/diml:0:2);
  writeln ('El menor monto fue ',vMin.dinero:0:2,' el dia ',vMin.dia, ' recorrido ',vMin.distancia:0:2);
  imprimirDias (Vd);
end;


procedure eliminar (var viaV : vecViajes; var diml : integer);
var
 i,pos : integer;
 pude : boolean;
begin
 pude := false; pos := 1;
  while (not pude) and (pos <= diml) do begin 
   if (viaV [i].distancia = 100) then 
    for pos := i to (diml - 1) do begin
     viaV [pos] := viaV [pos + 1];
   diml := diml - 1;
   pude := true;
  end 
 else
  i := i + 1;
 end;
end;


var
 vecVia : vecViajes;
 diml : integer;
 vDia : vecDias;
begin
 cargarVector (vecVia,diml);
 inicializarDias (vDia);
 RecorrerB (vecVia,diml,vDia);
 eliminar (vecVia,diml);
end.
 
  
 
    
    