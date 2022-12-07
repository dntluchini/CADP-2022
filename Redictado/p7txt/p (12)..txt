program p6;
type
rangoObj = 1..7;
vecCat = array [rangoObj] of integer;
 objeto = record 
  cod : integer;
  catObjeto : rangoObj;
  nomObjeto : string;
  distanciaATierra : real;
  nomDes : string;
  anioDes : integer;
 end;
  
  lista =^nodo;
  nodo = record
   dato : objeto;
   sig : lista;
  end;
   


function galileo (descubridor : string; anioDescu : integer) :boolean;
begin 
 galileo  := ((descubridor = 'Galileo Galilei') and (anioDescu < 1600)); 
end;

function masPares (cod : integer) : boolean;
var
 pares,impares,dig : integer;
begin 
 pares := 0; impares := 0;
  while (cod <> 0) do begin
   dig := cod mod 10;
    if (dig mod 2 = 0) then 
     pares := pares + 1
    else
     impares := impares + 1;
    cod := cod div 10;
 end;
  masPares := (pares > impares);
end;


procedure inicializarV (var vC : vecCat);
var
 i : integer;
begin
 for i := 1 to 7 do 
  vC [i] := 0;
end;

procedure leerO (var o : objeto);
begin
 write ('Ingrese el codigo del objeto : ');
 readln (o.cod);
 if (o.cod <> -1) then begin
  write ('Ingrese la categoria del objeto : ');
  readln (o.catObjeto);
  write ('Ingrese el nombre del objeto : ');
  readln (o.nomObjeto);
  write ('Ingrese la distancia a la tierra del objeto : ');
  readln (o.distanciaATierra);
  write ('Ingrese el nombre del descubrido : ');
  readln (o.nomDes);
  write ('Ingrese el anio de descubrimiento : ');
  readln (o.anioDes);
 end;
end;

procedure agregarAtras(var L,ult:lista;o:objeto);
var nue:lista;
begin
  new(nue);
  nue^.dato:=o;
  nue^.sig:=nil;
  if(L=nil)then  L:=nue
    else  ult^.sig:=nue;
  ult:=nue;
end;
procedure cargarL (var pI: lista);
var
 o : objeto;
 pU : lista;
begin
 leerO (o);
  while (o.cod <> -1) do begin 
   agregarAtras (pU,pI,o);
   leerO (o);
  end;
end;

procedure masLejos (distAtierra : real; codObj : integer; var lejos1,lejos2 : real; var cod1,cod2 : integer);
begin
 if (distAtierra > lejos1) then begin
  lejos2 := lejos1;
  lejos1 := distAtierra;
  cod2 := cod1;
  cod1 := codObj;
 end
 else
  if (distAtierra > lejos2) then begin 
   lejos2 := distAtierra;
   cod2 := codObj;
  end;
end;

procedure imprimirVec (vC : vecCat);
var
 i : integer;
begin
 for i := 1 to 7 do 
  writeln ('La categoria ',i, ' tiene ',vC [i], ' objetos ');
end;

procedure recorrerL (l : lista);
var
cantGalileo,codmin1,codmin2 : integer;
l1,l2 : real;
vC : vecCat;
begin
  l1 := -1; codmin1 := 0;  cantGalileo := 0;
  inicializarV (vC);
 while (l <> Nil) do begin 
  vC [l^.dato.catObjeto] := vC [l^.dato.catObjeto] + 1;
   masLejos (l^.dato.distanciaATierra,l^.dato.cod,l1,l2,codmin1,codmin2);
   if ((galileo(l^.dato.nomDes,l^.dato.anioDes) and (l^.dato.catObjeto = 2))) then 
    cantGalileo := cantGalileo + 1;
  if (masPares(l^.dato.cod) and (l^.dato.catObjeto = 1)) then 
    writeln ('La estrella ' ,l^.dato.nomObjeto, ' cumple con la condicion ');
   l:= l^.sig;
   end;
   writeln ('Los 2 objetos mas lejos tienen el codigo ',codmin1, ' y ',codmin2);
   writeln ('La cantidad de objetos descubiertos por galileo antes del 1600 fueron ',cantGalileo);
   imprimirVec (vC);
 end;
var
 l : lista;
begin
   l := Nil; 
   cargarL (l);
   recorrerL (l);
 end.
  