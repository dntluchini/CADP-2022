program p7;
const 
 dimf = 4;
type 
 rangoMateria = 1..24;
 notas = 1..10;
 vecMateria = array [rangoMateria] of notas;
 alumno = record 
  nroAlu : integer;
  apellido : string;
  nombre : string;
  email : string;
  anioIngreso : integer;
  anioEgreso : integer;
  notasMaterias : vecMateria;
 end;
  lista =^nodo;
  nodo = record
   dato : alumno;
   sig : lista;
  end;

procedure ingresarNotas (var vM : vecMateria);
var
 i : integer;
begin
 for i := 1 to dimf do begin 
  write ('Materia ' , i , ' ingrese nota : ');
  readln (vM [i]);
 end;
end;



Procedure OrdenarVectorNotasxAlumno (var vec : vecMateria);
var
  i,j,p,item : integer;
Begin
  for i := 1 to dimf-1 do begin
    p := i;
    for j := i + 1 to dimf do
      if (vec[j] < vec[p]) then
        p := j;
    item := vec[p];
    vec[p] := vec[i];
    vec[i] := item;
  end;
end;
  
procedure leerA (var a : alumno);
begin
 write ('Ingrese el numero del alumno : '); readln (a.nroAlu);
 if (a.nroAlu <> -1) then begin 
  write ('Ingrese el nombre del alumno : '); readln (a.nombre);
  write ('Ingrese el apellido del alumno : '); readln (a.apellido);
  write ('Ingrese el mail del alumno : '); readln (a.email);
  write ('Ingrese el anio de ingreso del alumno : '); readln (a.anioIngreso);
  write ('Ingrese el anio de egreso del alumno : '); readln (a.anioEgreso);
  ingresarNotas (a.notasMaterias);
  OrdenarVectorNotasxAlumno (a.notasMaterias);
 end;
end;
  


Procedure agregarAdelante (var l : lista ; a : alumno);
var
 nue : lista;
begin
 new (nue);
 nue^.dato := a;
 nue^.sig := l;
 l := nue;
end;

Procedure cargarL (var l : lista);
var
 a : alumno;
begin 
 leerA (a);
  while (a.nroAlu <> -1) do begin 
   agregarAdelante (l,a);
   leerA (a);
  end;
end;

Procedure prom (vM : vecMateria ;var totalNotas : real);
var
 i  : integer;
begin
totalNotas := 0;
 for i := 1 to dimf do begin 
  totalNotas :=  totalNotas + vM[i];
 end;
end;


function descomponer (nro : integer) : boolean;
var
 dig , pares , impares : integer;
begin
 pares := 0; impares := 0;
  while (nro <> 0) do begin 
   dig := nro mod 10;
    if (dig mod 2 = 0) then 
     pares := pares + 1
    else
     impares := impares + 1;
    nro := nro div 10;
  end;
     descomponer := (pares = 0) and (impares >= 0);
end;

Procedure masRapido (ape,nom,mail : string; var ape1,ape2,nom1,nom2,mail1,mail2 : string; anioIngreso,anioEgreso : integer);
var 
 tiempoTotal,t1,t2 : integer;
begin
 tiempoTotal := anioEgreso - anioEgreso; // (2020-2015 = 5 años para recibirse)
 t1 := 9999; t2 := 9999;
 if (tiempoTotal < t1) then begin
  t2 := t1;
  t1 := tiempoTotal;
  ape2 := ape1;
  ape1 := ape;
  nom2 := nom1;
  nom1 := nom;
  mail2 := mail1;
  mail1 := mail;
 end
 else if (tiempoTotal < t2) then begin 
  ape2 := ape;
  nom2 := nom;
  mail2 := mail;
  t2 := tiempoTotal;
 end;
end;



Procedure recorrerL (l : lista);
var

 a1,a2,n1,n2,m1,m2 : string;
 cantA : integer;
 TotNotas : real;
begin
 a1 := '' ; a2 := '' ; n1 := '' ; n2 := '' ; m1 := '' ; m2 := '';
 cantA := 0;
  while (l <> nil) do begin 
   prom (l^.dato.notasMaterias,TotNotas);
    writeln ('El alumno ',l^.dato.nroAlu, ' tiene de promedio ',(TotNotas/dimf):0:2);
    if (l^.dato.anioIngreso = 2012) and (descomponer (l^.dato.nroAlu)) then 
     cantA := cantA + 1;
    masRapido (l^.dato.apellido,l^.dato.nombre,l^.dato.email,a1,a2,n1,n2,m1,m2,l^.dato.anioIngreso,l^.dato.anioEgreso);
    l := l^.sig;
  end;
   writeln ('Datos del alumno que se recibio mas rapido');
   writeln ('Apellido = ',a1, ', Nombre = ',n1, ', Mail = ',m1);
   writeln ('Datos del 2do alumno que se recibio mas rapido');
   writeln ('Apellido = ',a2, ', Nombre = ',n2, ', Mail = ',m2);
   writeln ('La cantidad de alumnos con nro impar e ingresados en el 2012 fueron : ',cantA);
end;

procedure eliminar (var l : lista; nro : integer ; var pude : boolean);
var 
 act,ant : lista;
begin 
 act := l;
 pude := false;
  while (act <> nil) and (act^.dato.nroAlu <> nro) do begin 
    ant := act;
    act := act^.sig;
  end;
    if (act <> l) then
     if (act = l) then 
     l := act^.sig
    else begin 
      ant^.sig := act^.sig;
      dispose (act);
      pude := true;
    end;
end;
  
var
 l : lista;
 numAborrar : integer;
 ok : boolean;
begin 
 l := nil;
 cargarL (l);
 recorrerL (l);
  write ('Ingrese un numero de alumno para eliminar '); readln (numAborrar);
   eliminar (l,numAborrar,ok);
    if (ok) then 
     writeln ('El alumno se elimino correctamente')
    else
     writeln ('No existe un alumno con ese numero');
end.
 
  
 
  
 
