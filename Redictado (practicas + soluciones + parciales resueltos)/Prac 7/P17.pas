const 
 finEspecie = 6;
 finPartos = 10;
type
 rangoEspecie = 1..finEspecie;
 rangoPartos = 1..finPartos;
 coneja = record
  cod : integer;
  anioNacimienot : integer;
  especie : rangoEspecie;
  cantPartos : vecPartos;
end;

vecCont = array [rangoEspecie] of integer;
vecPartos = array [rangoPartos] of integer;

lista = ^nodo;
nodo = record
 dato : coneja;
 sig : lista;
end;
lista2 = ^nodo2;
nodo2 = record
 dato : coneja;
 sig : lista2;
end;
procedure leerPartos (var vP : vecPartos);
var
 i : integer;
begin 
 for i := 1 to finPartos do begin 
  write ('Ingrese la cantidad de crias que tuvo en el parto : ',i);
  readln (vP[i]);
 end;
end;
procedure leerC (var c : coneja); // Se dispone
begin 
 leerPartos (a.cantPartos);
end;
procedure agregarA (var l : lista; c : coneja);
var
 aux : lista;
begin
 new (aux);
 aux^.dato := c;
 aux^.sig := l;
 l := aux;
end;

procedure cargarL (var l : lista); // Se dispone

function descomponer (num : integer);
begin
 descomponer := (num mod 2 = 1);
end;

function cumple (num,anio : integer);
begin 
 cumple := (descomponer (num) and (anio < 2020));
end;

function max (vC : vecCont) : integer;
var
 maximo,i,maxPos : integer;
begin 
 maximo := -9999;
  if (vC [i] > maximo) then begin 
   maximo := vC [i];
   maxPos := i;
  end;
   max := maxPos;
end;

procedure inicializarV (var vC : vecCont);
var
 i : initeger;
begin 
 for i := 1 to 6 do 
  vC [i] := 0;
end;

procedure recorrerL (l : lista; var l2 : lista2);
var
 vC : vecCont;
 totConejas,i : integer;
 c : coneja;
begin
 
 inicializarV (vC);
 totConejas := 0;
  while (l <> nil) do begin 
   vC [l^.dato.especie] := vC [l^.dato.especie] + 1;
   totConejas := totConejas + (l^.dato.cantPartos[i]);
    if (totConejas > 35) then 
     agregarA (l2,c);
    l := l^sig;
 end;
  if (cumple (l^.dato.cod,l^.dato.anio)) then 
   writeln ('La coneja : ',l^.dato.cod, ' cumple con la condicion ');
  writeln ('La especie que mas conejas tiene es la : ',max(vC));
end;

var
 l : lista;
 l2 : lista2;
begin 
 l := nil;
 l2 := nil;
  cargarL (l);
  recorrerL (l,l2);
end.