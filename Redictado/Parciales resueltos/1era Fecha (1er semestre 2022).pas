

program Hello;
const 
 dimf = 20;
type

rangoCat = 1..dimf;
 cat = record // Se dispone
  nombre : string;
  prePK : real;
 end;
  compra = record
   dni : longint;
   cat : rangoCat;
   cantKilos : real;
  end;
   lista = ^nodo;
   nodo = record 
    dato : compra;
    sig : lista;
  end;
   vecCat = array [rangoCat] of integer; // Contador de compras;
   veCategoria = array [rangoCat] of cat;


procedure leerC (var c  : compra);
begin
 write ('Ingrese el dni del cliente : ');
 readln (c.dni);
  if (c.dni <> -1) then begin 
   write ('Ingrese la cantidad de kilos comprados : ');
   readln (c.cantKilos);
   write ('Ingrese la categoria del producto comprado : ');
   readln (c.cat);
  end;
end;


procedure cargarCat (var arrayCat : veCategoria); // Se dispone
begin
end;

procedure agregarAdelante (var l : lista; c : compra);
var
 nue : lista;
begin
 new (nue);
 nue^.dato := c;
 nue^.sig := l;
 l := nue;
end;

procedure cargarL (var l : lista);
var
 c : compra;
begin
 leerC (c);
  while (c.dni <> -1) do begin 
   agregarAdelante (l,c);
   leerC (c);
  end;
end;

function descomponer (dni : longint) : boolean;
var
 dig , impares : integer;
begin
 impares := 0;
  while (dni <> 0) do begin 
   dig := dni mod 10;
    if (dig mod 2 = 1) then 
     impares := impares + 1;
    dni := dni div 10;
  end;
   descomponer := (impares <= 5);
end;


procedure inicializarV (var vC : vecCat);
var
 i : integer;
begin
 for i := 1 to dimf do 
  vC [i] := 0;
end;


procedure menosDin (total,min : real ; dni : longint; var minDni : longint);
begin
 if (total < min) then begin 
  min := total;
  dni := minDni;
 end;
end;

 
procedure imprimirV (vC : vecCat);
var
 i : integer;
begin
 for i := 1 to dimf do 
  writeln ('La categoria ',i, ' tiene ' , vC[i] , ' compras ');
end;


procedure recorrerL (l : lista; var vC : vecCat);
var
 min,total : real;
 dniMin,dniAct : longint;
 cantCompras : integer;
 arrayCat:veCategoria;
 
begin 
 min := 9999;
 inicializarV (vC);
 cantCompras := 0;
 while (l <> nil) do begin 
   dniAct := l^.dato.dni;
   total := 0;
   while (l <> nil) and (l^.dato.dni = dniAct) do begin // *Cuando el enunciado dice que la informacion se encuentra ingresada de teclado en x orden,aprovechar para hacer uso de corte de control.
    vC [l^.dato.cat] := vC [l^.dato.cat] + 1;
    total := total + (l^.dato.cantKilos * vC[l^.dato.cat].prePK);
    if (descomponer (l^.dato.dni)) then 
    cantCompras := cantCompras + 1;
   l := l^.sig;
  end;
   menosDin (total,min,l^.dato.dni,dniMin);
   writeln ('El dni del cliente que menos dinero gasto es : ',dniMin);
   writeln ('La cantidad de compras de clientes con a lo sumo 5 digitos impares en el dni es de ',cantCompras);
   imprimirV (vC);
 end;
end;

var
 l : lista;
 vC : vecCat;
 arrayCat : veCategoria;
 
begin
 l := nil;
 cargarCat (arrayCat);
 cargarL (l);
 recorrerL (l,vC);
end.
