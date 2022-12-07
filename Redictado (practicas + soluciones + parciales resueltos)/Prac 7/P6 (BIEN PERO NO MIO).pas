program astronomicos;
const
  obj=7;
type
  cadena=string[30];
  rango=1..obj;
  objeto=record
    codigo:integer;
    categoria:rango;
    nombre:cadena;
    distancia:real;
    descubridor:cadena;
    anio:integer;
  end;
  lista=^nodo;
  nodo=record
    dato:objeto;
    sig:lista;
  end;
  vcont=array[rango]of integer;
  
procedure leer(var o:objeto);
begin
  writeln('Ingrese el codigo');
  readln(o.codigo);
  if(o.codigo<>-1)then begin
    writeln('Ingrese la categoria[1-7]');
    readln(o.categoria);
    writeln('Ingrese el nombre');
    readln(o.nombre);
    writeln('Ingrese la distancia');
    readln(o.distancia);
    writeln('Nombre del descubridor');
    readln(o.descubridor);
    writeln('Anio de descubrimiento');
    readln(o.anio);
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
procedure cargarObjeto(var L:lista);
var o:objeto;ult:lista;
begin
  leer(o);
  while(o.codigo<>-1)do begin
    agregarAtras(L,ult,o);
    leer(o);
  end;
end;
procedure inicializar(var v:vcont);
var i:rango;
begin
  for i:=1 to obj do
    v[i]:=0;
end; 
procedure masLejano(var max1,max2:real;var cod1,cod2:integer;distancia:real;codigo:integer);
begin
  if(distancia>max1)then begin
    max2:=max1;
    max1:=distancia;
    cod2:=cod1;
    cod1:=codigo;
  end
  else if(distancia>max2)then begin
         max2:=distancia;
         cod2:=codigo;
  end;
end;
function galileo(descubridor:cadena;anio:integer):boolean;
begin
  galileo:=(descubridor='Galileo Galilei')and(anio<1600);
end;
procedure mostrarVector(v:vcont);
var i:rango;
begin
  for i:=1 to obj do
    writeln('Categoria: ',i,' objetos observados: ',v[i]);
end;
function masPares(codigo:integer):boolean;
var dig,pares,impares:integer;
begin
  pares:=0;impares:=0;
  while(codigo<>0)do begin
    dig:=codigo mod 10;
    if(dig mod 2 = 0 )then  pares:=pares+1
                      else impares:=impares+1;
    codigo:=codigo div 10;
  end;
  if(pares>impares)then
    masPares:=true
  else
    masPares:=false;
end;
procedure recorrerObjeto(L:lista);
var v:vcont;
    max1,max2:real;
    cod1,cod2,cant:integer;
begin
  cant:=0;
  max1:=-1;cod1:=0;
  inicializar(v);
  while(L<>nil)do begin
    masLejano(max1,max2,cod1,cod2,L^.dato.distancia,L^.dato.codigo);
    if(L^.dato.categoria=2)and(galileo(L^.dato.descubridor,L^.dato.anio))then
      cant:=cant+1;
    v[L^.dato.categoria]:=v[L^.dato.categoria]+1;
    if(L^.dato.categoria=1)and(masPares(L^.dato.codigo))then
      writeln('Nombre de las estrellas con codigo mas par: ',L^.dato.nombre);
    L:=L^.sig;
  end;
  writeln('Los códigos de los dos objetos más lejanos de la tierra ',cod1,' y ',cod2);
  writeln('La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600 ',cant);
  mostrarVector(v);
end;