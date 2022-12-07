
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
   write ('Ingrese el nombre y apellido : ');
   readln (p.nom); 
   write ('');
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

procedure cargarVec (var vG : vectorGenero; cod : integer);
var
 i : integer;
begin 
 if (cod = i) then 
  vG [i] := vG [i] + 1;
end;

procedure codMax (vG : vectorGenero; var max1,max2, codMax1,codMax2 : integer); // B
var
 i : integer;
begin
 
 if (vG[i] > max1) then begin 
  codMax2 := codMax1;
  codMax1 := i;
  max2 := max1;
  max1 := vG [i];
 end
 else
  if (vG [i] > codMax2) then begin
   codMax2 := i;
   max2 := vG [i];
 end;
end;

procedure eliminar (var l : lista; dni : longint; var pude : boolean); // C
var
 actual,anterior : lista;
begin 
 actual := l;
 anterior := l;
 pude := false;
  
  while (l <> nil) and (not pude) do begin 
   if (actual^.dato.dni = dni) then
    pude := true 
  else begin
   anterior := actual;
   actual := actual^.sig;
  end;
   if (pude = true) then 
    if (actual = l) then 
     l := l^.sig 
    else begin
     anterior := actual^.sig;
     dispose (actual);
    end;
    if (pude) then 
     writeln ('El dni ',dni, ' fue eliminado ')
    else
     writeln ('El dni ',dni, ' no existe');
 end;
end;
 
procedure cargarLista (var l : lista; p : persona);
 begin
  repeat
   leerP (p);
   agregarAdelante (l,p);
  until (l^.dato.dni = 33555444);
   writeln ('');
   writeln ('La lista fue cargada');
   writeln ('');
 end;
 
 
var
  pri : lista;
  pe : persona;
  pude : boolean;
  dniEli,cantPersonas,codMax1 ,codMax2,m1,m2 : integer;
  v : vectorGenero;
begin
 codMax1 := -9999; codMax2 := -9999;
 pri := nil;
 cargarLista (pri,pe);
 inicializarVec (v);
  while (pri <> nil) do begin 
   cargarVec (v,pri^.dato.codAct);
   paresImpares (pri^.dato.dni,cantPersonas);
   codMax (v,m1,m2,codMax1,codMax2);
   write ('Ingrese el dni a eliminar : ');
   readln (dniEli);
   eliminar (pri,dniEli,pude);
   pri := pri^.sig;
  end;
    writeln ('La cantidad de personas con mas digitos pares que impares es ',cantPersonas);
    writeln ('Los 2 generos mas elegidos fueron : ',codMax1, ' y ',codMax2);
end.
   
   

    
   