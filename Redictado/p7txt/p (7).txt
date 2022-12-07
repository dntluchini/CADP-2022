program p2;
type
rangoPoliza = 1..6;
 cliente = record 
  cod : integer;
  dni : longint;
  ape : string;
  nom : string;
  codPoliza : rangoPoliza;
  monto : real;
 end;
  
  lista = ^nodo;
  nodo = record 
   dato : cliente;
   sig : lista;
  end;
  vecAdicional = array [rangoPoliza] of real; // Se dispone
 
procedure leerC (var c : cliente);
begin
 write ('Ingrese el codigo de cliente : ');
 readln (c.cod);
 write ('Ingrese el dni de cliente : ');
 readln (c.dni);
 write ('Ingrese el nombre de cliente : ');
 readln (c.nom);
 write ('Ingrese el apellido de cliente : ');
 readln (c.ape);
 write ('Ingrese el codigo de poliza : ');
 readln (c.codPoliza);
 write ('Ingrese el monto que abona el cliente : ');
 readln (c.monto);
end;

procedure agregarAdelante (var l : lista; c : cliente);
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
 c : cliente;
begin
 repeat
  leerC (c);
  agregarAdelante (l,c);
 until (c.cod = 1122);
end;

procedure cargarV (var vA : vecAdicional);
var
 i : integer;
begin
 for i := 1 to 6 do 
  vA [i] := 2.666;
end;

procedure informarCliente (l : lista ; var montoTotal : real; vA : vecAdicional);
begin
montoTotal := l^.dato.monto + vA[l^.dato.codPoliza]; // Se dispone  
 writeln ('El dni del cliente es ',l^.dato.dni);
 write ('');
 writeln ('El nombre del cliente es ',l^.dato.nom);
 write ('');
 writeln ('El apellido del cliente es ',l^.dato.ape);
 write ('');
 writeln ('El monto total que paga el cliente es ',montoTotal:0:2);
 write ('');
end;
 
 
function descomponer (dni : longint):boolean;
var
 cant9,dig : integer;
begin
 cant9 := 0;
  while (dni <> 0) do begin
   dig := dni mod 10;
    if (dig = 9) then 
     cant9 := cant9 + 1;
    dni := dni div 10;
   end;
 descomponer := (cant9 >= 2);
end;



procedure eliminar (var l : lista ; codEliminar : integer ; var ok : boolean);
var
 anterior , actual : lista;
begin
 anterior := l;
 actual := l;
  while (l <> nil) and (not ok) do begin 
   if (actual^.dato.cod = codEliminar) then 
    ok := true
  else begin
   anterior := actual;
   actual := actual^.sig;
  end;
  if (ok = true) then 
   if (actual = l) then
    l := actual^.sig
  else begin
   anterior^.sig := actual^.sig;
   dispose (actual);
  end;
 end;
end;


procedure procesarInfo (l : lista);
var
 montoT : real;
 vA : vecAdicional;
begin
 montoT := 0;
  while (l <> nil) do begin
  informarCliente (l,montoT,vA);
   if (descomponer(l^.dato.dni)) then 
    writeln ('El cliente ',l^.dato.nom, ' ',l^.dato.ape, ' tiene mas de dos digitos 9 en su dni');
  l := l^.sig;
 end;
end;
 
 
var
 pri : lista;
 codEli : integer;
 ok : boolean;
 vA : vecAdicional;
begin
 pri := nil;
 cargarV (vA);
 cargarL (pri);
 procesarInfo (pri);
  write ('Ingrese el codigo a eliminar : ');
  readln (codEli);
   eliminar (pri,codEli,ok);
    if (ok) then writeln ('El codigo de elimino correctamente');
end.
   
 