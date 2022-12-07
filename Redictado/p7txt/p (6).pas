
program Hello;
type
 persona = record
  dni : longint;
  ape : string;
  nom : string;
  edad : integer;
  codAct : integer;
 end;
 lista =^nodo;
 nodo = record 
  dato : persona;
  sig : lista;
 end;

vectorGenero = array [1..5] of integer;
 
procedure leerP (var p : persona);
begin
 write ('Ingrese el dni : ');
 readln (p.dni);
  if (p.dni <> 33555444) then begin 
   write ('Ingrese el nombre : ');
   readln (p.nom); 
   write ('Ingrese el apellido : ');
   readln (p.ape);
   write ('Ingrese la edad : ');
   readln (p.edad);
   write ('Ingrese el codigo de actuacion : ');
   readln (p.codAct);
  end;
end;

procedure agregarAdelante (var l : lista; p : persona);
var
 nue : lista;
begin
 new (nue); 
 nue^.dato := p; 
 nue^.sig := l;
 l := nue;
end;

procedure paresImpares (dni : integer; var cantP : integer); // A
var
 dig , pares , impares : integer;
begin
pares := 0; impares := 0; 
while (dni <> 0) do begin
 dig := dni mod 10; 
   if ((dig mod 2) = 0) then 
     pares := pares + 1
   else
    impares := impares + 1;
  dni := dni div 10;
 end;
  if (pares > impares) then 
   cantP := cantP + 1;
end;

procedure inicializarVec (var vG : vectorGenero);
var
 i : integer;
begin
 for i := 1 to 5 do 
  vG[i] := 0;
end;


procedure codMax (vc: vectorGenero; codigo: Integer; var max1,max2: Integer; var codMax1,codMax2: Integer);
var
  i: Integer;
begin
  for i:= 1 to 5 do begin
    if (vc[i] > max1) then begin
      max2:= max1;
      codMax2:= codMax1;
      max1:= vc[i];
      codMax1:= codigo;
    end
    else
      if (vc[i] > max2) then begin
        max2:= vc[i];
        codMax2:= codigo;
      end;
  end;
end;

procedure eliminarDni (var l: lista; dni: LongInt; var ok: Boolean);
var
  ant,act: lista;
begin
  act:= l; ant:= l; ok := false;
  while (act <> Nil) and (act^.dato.dni <> dni) do begin
    ant:= act;
    act:= act^.sig;
  end;
  if (act <> Nil) then begin
    ok:= True;
    if (act = l) then  
      l:= l^.sig
    else
      ant^.sig:= act^.sig;
    Dispose(act);
  end;
end;
 
procedure cargarLista (var l : lista);
var
 p : persona;
 begin
  repeat
   leerP (p);
   agregarAdelante (l,p);
  until (p.dni = 33555444);
   writeln ('');
   writeln ('La lista fue cargada');
   writeln ('');
 end;
 
 
var
  pri : lista;
  pude : boolean;
  dniEli,cantPersonas,codMax1 ,codMax2,m1,m2 : integer;
  v : vectorGenero;
begin
 m1 := -1; m2 := -2; codMax1 := 0; codMax2 := 0; cantPersonas := 0; 
 pri := nil;
 inicializarVec (v);
 cargarLista (pri);
  while (pri <> nil) do begin 
   v[pri^.dato.codAct] := v[pri^.dato.codAct] + 1;
   paresImpares (pri^.dato.dni,cantPersonas);
   codMax (v,pri^.dato.codAct,m1,m2,codMax1,codMax2);
   pri := pri^.sig;
  end;
    write ('Ingrese el dni a eliminar : ');readln (dniEli);
    eliminarDni (pri,dniEli,pude);
     if (pude) then 
     writeln ('El dni ',dniEli, ' fue eliminado ')
    else
     writeln ('El dni ',dniEli, ' no existe');
end.
   