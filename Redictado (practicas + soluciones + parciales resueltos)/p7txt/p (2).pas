program p8;
type 
rangoMotivo = 1..7;
rangoDia = 1..31;
rangoMes = 1..12;
fechaReg = record
  dia : rangoDia;
  mes : rangoMes;
 end;
 transferencias = record // Se dispone
  nroCuentaOrigen : integer;
  dniTitularCuentaOrigen : longint;
  nroCuentaDestino : integer;
  dniTitularCuentaDestino : longint;
  monto : real;
  fechas : fechaReg;
  hora : integer;
  codMotivo : rangoMotivo;
 end;
  lista =^nodo;
  nodo = record 
   dato : transferencias;
   sig : lista;
  end;
  
vecMotivo = array [1..7] of integer;  
 
procedure inicializarV (var vM : vecMotivo);
var
 i : integer;
begin 
 for i := 1 to 7 do 
  vM [i] := 0;
end;

  
procedure leerT (var t : transferencias) // Se dispone
begin
end;
procedure agregarAdelante (var l : lista; t : transferencias); // Se dispone
begin;
end;
procedure cargarL1 (var t : transferencias); // Se dispone
begin
end;

Procedure leerF (var f : fechaReg);
begin 
 write ('Ingrese el dia : ');
 readln (f.dia);
 write ('Ingrese el mes : ');
 readln (f.mes)
end;


Procedure OrdenarLista(var L: lista; t: transferencia);
var
  ant,act,aux:ListaTerceros;
Begin
  new(aux);
  aux^.dato := t;
  ant := L;
  act := L;
  while (act<>nil) and (act^.dato.nroCuentaOrigen < t.numcuenOrg) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (ant = act)then 
    L := aux
  else
    ant^.sig := aux;
  aux^.sig := act;
End;

procedure cargarL2 (l : lista;var l2 : lista);
var
 t : transferencia;
begin 
 while (l <> nil) do 
  if (t.nroCuentaOrigen <> t.nroCuentaDestino) then begin
   OrdenarLista (l,t);
   end;
   l := l^.sig;
end;

function descomponer (cod : integer) : boolean;
var
 dig , pares , impares: integer;
begin
 pares := 0; impares := 0;
  while (cod <> 0) do begin
   dig := cod mod 10;
    if (cod mod 2 = 0) then 
     pares := pares + 1
    else
     impares := impares + 1;
     cod := cod div 10;
  end;
   descomponer := (impares > pares);
end;

procedure imprimirV (vM : vecMotivo ;  var maxCod,max : integer);
var
 i   : integer;
begin
 for i := 1 to 7 do 
   if (vM[i] > max) then begin
    maxCod := i;
    max := vM [i];
end;

procedure recorrerL (l2 : lista);
var
 montoTotal : real;
 transfJunio , mCod,m,auxOrigen: integer;
 vM : vecMotivo;
begin
  transfJunio := 0; m := -9999;
 inicializarV (vM);
  while (l2 <> nil) do begin 
   montoTotal := 0; auxOrigen := l2^.dato.nroCuentaOrigen;
    while (l2 <> nil) and (l2^.dato.nroCuentaOrigen = auxOrigen) do begin
   vM [l2^.dato.codMotivo] := vM [l2^.dato.codMotivo] + 1;
   montoTotal := montoTotal + l^.dato.monto;
   if (l2^.dato.fechaReg.mes = 6) and (descomponer) then
    transfJunio := transfJunio + 1;
    l2 := l2^.sig;
    end;
   writeln ('El total transferido a 3eros es de la cuenta ',auxOrigen ' es : ',montoTotal);
  end;
   maxCod (vM,m);
   writeln ('La cantidad de transferencias hechas en junio con condicion de dni son : ',transfJunio);
   writeln ('El codigo de mas motivos de transferencias es : ',mCod);
end;

var
 l2,l : lista;
begin
 l := nil; // Se dispone
 l2 := nil;
 cargarL1 (l);
 cargarL2 (l,l2);
 recorrerL (l2);
end.
    
