const
 finTipo = 5;
type
 rangoTipo = 1..finTipo;
 vecKw = array [1..6] of integer; // Cont KW por mes
 vecCont = array [rangoTipo] of integer; // Cont clientes
 cliente = record
  cod : integer;
  localidad : string;
  tipo : rangoTipo;
  cantKw : vecKw;
 end;

lista = ^nodo;
nodo = record
 dato : cliente;
 sig : lista;
end;


lista2 = ^nodo2;
nodo2 = record
 dato : cliente;
 sig : lista;
end;


procedure leerc (var c : cliente) // Se dispone
begin
leerKw (c.cantKw);
end;

procedure agregarA (var l : lista; c : cliente)
var
 aux : lista;
begin 
 new (aux);
 aux^.dato := c;
 aux^.sig := l;
 l := aux;
end;

procedure cargarL (var l : lista); // Se dispone

function descomponer (num : integer) : boolean;
var
 par,impar,dig : integer;
begin 
 par := 0;
 impar := 0;
  while (num <> 0) do begin
   dig := num mod 10;
    if (dig mod 2 = 0) then 
     par := par + 1
    else
     impar := impar + 1;
    num := num div 10;
 end;
  descomponer := (par = impar);
end;


procedure mayor (num : integer ; loc : string ; var max : integer; var maxL : string);
begin
 if (num > max) then begin 
  max := num;
  maxL := loc;
 end;
end;


procedure inicializarV (var vC : vecCont);
var
 i : integer;
begin 
 for i := 1 to 5 do 
  vC [i] := 0;
end;

procedure recorrerL (l : lista; var vC : vecCont; var l2 : lista2; var maxLocalidad : string);
var
 auxL ,mL: string;
 max , cantClientesLocalidad,sumaKw,i: integer;
 kWV : vecKw;
begin
 max := -9999;    
 incializarV (vC);
  while (l <> nil) do begin 
   auxL := l^.dato.localidad;
   cantClientesLocalidad := 0;
   for i := 1 to 6 do begin
    sumaKw := sumaKw + kWV [i];
   end;
  while (l <> nil) and (auxL := l^.dato.localidad) do begin 
   vC [i] := vC [i] + 1;
   cantClientesLocalidad := cantClientesLocalidad + 1;
   if (sumaKw > 1000) then 
     agregarA (l2,c);
   end;
   l := l^.sig; 
 end;
  writeln ('La localidad con mas clientes es : ',mL);
  imprimirV (vC);
end.

var
 l : lista;
 l2 : lista2;
 maxL : string;
 vC : vecCont;
begin
 l := nil;
 l2 := nil;
 cargarL (l);
 recorrerL (l,vC,l2,maxL);
end.
  