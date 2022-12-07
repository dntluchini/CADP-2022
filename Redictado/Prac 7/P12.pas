const 
 finTipo = 4;
type
rangoTipo = 1..finTipo;
 vecTipoValores = array [rangoTipo] of integer; // Se dispone
 vecTipoCont = array [rangoTipo] of integer;
 
 cliente = record 
  nombre : string;
  dni : longint;
  edad : integer;
  tipoSub : rangoTipo;
 end;
 
lista = ^nodo;
nodo = record 
 dato : cliente;
 sig : lista;
end;
 
lista2 = nodo2;
nodo2 = record
 dato : clienteNomDni;
 sig : lista2;
end;
clienteNomDni = record
 dni : integer;
 nom : string;
end;
 
procedure LeerC (var c : cliente);
 begin
  write ('Ingrese el dni del cliente : ');
  readln (c.dni);
  if (c.dni <> 0) then begin 
   write ('Ingrese el nombre : '); readln (c.nombre);
   write ('Ingrese la edad : '); readln (c.edad);
   write ('Ingrese el tipo de suscripcion : '); readln (c.tipoSub);
  end;
end;

procedure AgregarAdelante (var l : lista; c : cliente);
var
 nue : lista;
begin 
 new (nue);
 nue^.dato := c;
 nue^.sig := l;
 l := nue;
end;



procedure insertarOrdenado (var l2 : lista ; cND : clienteNomDni);
var
 ant,act,nue : lista;
begin
 new (nue);
 nue^.dato := cND;
 nue^.sig := nil;
  if (l2 = nil) then 
   l := nue
  else begin
   act := l2;
   ant := l2;
  end;
   while (act <> nil) and (act^.dato.dni < nue^.dato.dni) do begin 
    ant := act;
    act := act^.sig;
  end;
   if (ant = act) then begin
    nue^.sig := l2;
    l2 := n;
  end
  else begin
   ant^.sig := nue;
   nue^.sig := act;
  end;
end;

procedure cargarL1 (var l : lista);
var
 c : cliente;
 
begin
 LeerC (c);
  while (c.dni <> 0) do begin 
   AgregarAdelante (l,c);
   LeerC (c);
  end;
   write (' <--------- Lista cargada ---------> ');
end;

procedure maxSub (sub : integer ; vT : vecTipoCont; var max1,max2,maxT1,maxT2 : integer);
begin 
 if (vt [sub] > max1) then begin 
  max2 := max1;
  maxT2 := maxT1;
  max1 := vt [sub];
  maxT1 := sub;
 end
 else if (vt [sub] > max2) then begin 
  max2 := vt [sub];
  maxT2 := sub;
 end;
end;

Procedure Asignado (var cj : clienteNomDni; dni : integer; nombre : string);
Begin
  cj.unNom := nombre;
  cj.Undni := dni;
End;

procedure inicializarV (var vTC : vecTipoCont);
var
 i : integer;
begin 
 for i := 1 to 4 do 
  vTC [i] := 0;
end;


function cumple (sub , edad: integer) : boolean;
begin
 cumple := (edad = 40) and ((sub = 3) or (sub = 4));
end;

procedure recorrerL (l : lista ; var l2 : lista2);
var 
 m1,m2,mT1,mT2 ,i: integer;
 vTC : vecTipoCont;
 vecT : vecTipoValores;
 ganTot : real;
 cliNombDni : clienteNomDni;
begin
 m1 := -9999; m2 := -9999; inicializarV (vTC);  ganTot := 0;
  while (l <> nil) do begin 
   ganTot := ganTot + vecT[l^.dato.tipoSub]; //  La ganancia total de Fortaco’s
   vTC [l^.dato.tipoSub] := vTC [l^.dato.tipoSub] + 1; // 
    if (cumple (l^.dato.tipoSub,l^.dato.edad)) then begin // Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a CrossFit o a Todas las clases. Esta lista debe estar ordenada por DNI.
     insertarOrdenado (l2,cliNombDni); 
     Asignado (cliNombDni,l^.dato.dni,l^.dato.dni) 
  l := l^.sig;
 end;
   for i := 1 to 4 do begin
    maxSub (l^.dato.tipoSub,vTC,m1,m2,mT1,mT2); // Las 2 suscripciones con más clientes.
   end;
  write ('Las dos suscripciones con mas clientes son : ',mT1, ' y ',mT2);
  write ('La ganacia total de Fortaco es : ' ,ganTot);
end;

var 
 l : lista;
 l2 : lista2;
begin
 l := nil;
 l2 := nil;
 cargarL1 (l);
 recorrerL (l,l2);
end.
