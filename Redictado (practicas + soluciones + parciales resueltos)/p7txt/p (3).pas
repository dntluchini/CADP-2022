program Hello;
type 
 rangoGenero = 1..8;
 peli = record // Se dispone
  codPeli : integer;
  titulo : string;
  codGenero : rangoGenero;
  puntajePromedio : real;
 end;
  regCritico = record
   dni : longint;
   ape : string;
   nom : string;
   codPelicula : integer;
   puntaje : real;
  end;
   
vecGenero = array [rangoGenero] of real ; // Vector contador
lista = ^nodo;
nodo = record // Se dispone
 dato : peli; 
 sig : lista;
end;

procedure leerP (var p : peli); // Se dispone
begin
end;
procedure cargarP (var lpeli : lista; p : peli); // Se dispone
begin
end;

procedure leerC (var c : regCritico);
begin
 readln (c.codPelicula);
 if (c.codPelicula <> -1) then begin
  readln (c.dni);
  readln (c.ape);
  readln (c.nom);
  readln (c.puntaje);
 end;
end,

procedure insertarOrdenado (var lpeli : lista; c : regCritico;);
var
 ant,act,nue : lista;
begin
 new (nue);
 nue^.dato := c;
 nue^.sig := nil;
  if (lpeli = nil) then 
   lpeli := nue
  else begin
   act := lpeli;
   ant := lpeli;
  end;
 while (act <> nil) and (lpeli^.dato.codPelicula < c.codPelicula) do begin
  ant := act;
  act := act^.sig;
 end;
  if (act = nil) then begin
  nue^.sig := lpeli;
  l := nue;
 end
 else begin 
  ant^.sig := nue;
  nue^.sig := nue;
 end;
end;

procedure cargarNuevaL (var lpeli : lista);
var
 c : regCritico;
begin 
 leerC (c);
  while (c.codPelicula <> -1) do begin 
   insertarOrdenado (l,c);
   leerC (c);
  end;
end;

function descomponer (dni : longint) : boolean;
var
 dig , pares , impares : integer;
begin
 pares := 0; impares := 0;
  while (dni <> 0) do begin
   dig := dni mod 10;
    if (dig mod 2 = 0) then 
     pares := pares + 1
    else
     impares := impares + 1;
    dni := dni div 10;
   end;
    descomponer := (pares = impares);
end;

procedure inicializarV (var vG : vecGenero);
var
 i : integer;
begin 
 for i := 1 to 7 do 
  vG [i] := 0;
end;

procedure eliminar (var lpeli : lista; codEliminar : integer ; var pude : boolean);
var
 ant,act : lista;
begin 
 pude := false; act := l;
   while (act <> nil) and (lpeli^.dato.codPelicula <> codEliminar) do begin 
    ant := act;
    act := act^.sig;
 end;
  if (act <> lpeli) then 
   pude := true;
   if (act = lpeli) then
    lpeli := act^.sig
  else 
   ant^.sig := act^.sig;
   dispone (act);
 end;
end;

procedure max (vG : vecGenero; var maxcod : integer);
var
  maxpuntaje:real; 
  i : rangoGenero;
begin 
 maxpuntaje := -999;
 for i := 1 to 8 do begin
  if (vG[i] > maxpuntaje) then begin
   maxpuntaje := vG[i];
   maxcod := i;
  end;
 end;
end;
 
procedure actualizar (var lpeli : lista; var vG : vecGenero);
var
 suma,prom : real;
 codAux,cantP : integer;
 c : regCritico;
begin 
 cantP := 0;
 leerC (c); 
 while (c.cod <> -1) do begin
  codAux := c.codPelicula; suma := 0;
   while (c.cod <> -1) and (c.codPelicula = codAux) do begin
    cantP := cantP + 1;
    suma := suma + c.puntaje;
   if (descomponer (c.dni)) then 
    writeln ('El critico : ',c.ape,' ',c.nom, ' tiene la misma cantidad de digitos pares que impares');
    leerC (c);
  end;
 end;
 prom := suma / cantP; // suma de puntajes de la critica dividido la cantidad de criticas
  while (lpeli <> nil) do begin
   if (lpeli^.dato.codPeli = codAux) then 
    lpeli^.dato.puntajePromedio := prom;
    vG [lpeli^.dato.codPelicula] := vG [lpeli^.dato.codPelicula] + lpeli^.dato.puntajePromedio;
    lpeli := lpeli^.sig;
  end;
   
end;
var
 l : lista;
 codBorrar,codMax : integer;
 ok : boolean;
 vg : vecGenero;
begin
 l := nil;
 cargarP (l);
 //cargarNuevaL (l); Ya viene ordenada
 actualizar (l,vg);
  max (vg,codMax);
  writeln ('El codigo con max puntaje es ',codMax);
   write ('Ingrese un codigo de pelicular para eliminar : '); readln (codBorrar);
   eliminar (l,codBorrar,ok);
  if (ok) then 
    writeln ('La pelicula se borro correctamente')
  else
    writeln ('No se encontro una pelicula con ese codigo');
end.

  
    