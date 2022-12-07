// La catedra de CADP esta organizando el parcial, y necesita un programa para obtener informacion sobre los alumnos recursantes que rendiran.
// A) Realizar un modulo que retorne la informacion de los alumnos en una estructura de datos adecuada. Dicha informacion se lee por teclado sin ningun orden. De cada alumno se lee su DNI,nombre,apellido,año de ingreso,y nota obtenida (entre 0 y 10) en cada una de las 10 autoevaluaciones. En caso de no realizar alguna autoevaluacion, se asigna la nota -1. La lectura finaliza cuando se ingresa el DNI 33016244 (Que debe procesarse)
// B) Realizar un modulo que reciba la estructura de datos generada en el inciso anterior, e IMPRIMA en pantalla : 
// 1. DNI de los alumnos que podran rendir el parcial de CADP. Para poder rendir , los alumnos deben haber realizado al menos 8 autoevaluaciones y deben haber aprobado (nota 6 o superior) al menos 4 autoevaluaciones.
// 2. El porcentaje de alumnos que hayan ingresado en el año 2020 y que se hayan presentado a todas las autoevaluaciones,sobre el total de alumnos.
// 3. Apellido y nombre de aquellos alumnos donde la suma de los digitos del DNI es par.
// Nota : implementar el programa principal.



program f2;
const 
 dimf = 10;
type
vecNota = array [0..dimf] of integer;
 alumno = record 
  dni : longint;
  nom : string;
  ape : string;
  anioIngreso : integer;
  nota : vecNota;
 end;
  
  
  lista =^nodo;
  nodo = record 
   dato : alumno;
   sig : lista;
  end;
  
  
procedure leerN (var vN : vecNota);
var
 i : integer;
begin
 for i :=  1 to dimf do begin
  write ('Ingrese la nota de la evaluacion ',i, ' : ' );
  readln (vN[i]);
 end;
end;

procedure leerA (var a : alumno);
begin 
 write ('Ingrese el dni del alumno : '); readln (a.dni);
 write ('Ingrese el nombre del alumno : '); readln (a.nom);
 write ('Ingrese el apellido del alumno : '); readln (a.ape);
 write ('Ingrese el anio de ingreso del alumno : '); readln (a.anioIngreso);
 leerN (a.nota);
end;

procedure cargarAdelante (var l : lista; a : alumno);
var
 nue : lista;
begin
 new (nue);
 nue^.dato := a;
 nue^.sig := l;
 l := nue;
end;

procedure cargarL (var l : lista);
var
 a : alumno;
begin 
 repeat 
 leerA (a);
 cargarAdelante (l,a);
 until (a.dni = 33016244);
end;

procedure inicializarV (var vN : vecNota);
var
 i : integer;
begin
 for i := 1 to 10 do 
  vN[i] := 0;
end;

function descomponer (dni : integer) : boolean;
var
 dig,suma : integer;
begin
 suma := 0;
  while (dni <> 0) do begin 
   dig := dni mod 10;
    suma := suma + dig;
    dni := dni div 10;
  end;
   descomponer := (suma mod 2 = 0);
end;

function puedeRendir (asistAE : integer; AEaprobadas : integer): boolean;
begin 
 puedeRendir := (AEaprobadas >= 4) and (asistAE >= 8) ;
end;


procedure recorrerNotas (v :vecNota ; var cantAsistAE,cantAEaprobadas : integer);
var
 i : integer;
begin
cantAsistAE := 0; cantAEaprobadas := 0;
  for i:= 1 to dimf do begin
      if (v[i] >= 0) then begin
        cantAsistAE := cantAsistAE + 1;
        if (v[i] >= 6) then
          cantAEaprobadas := cantAEaprobadas + 1;
      end;  
   end;
end;

function condicion2 (anio : integer; presentes : integer):boolean;
begin
 condicion2 := (anio = 2020) and (presentes = 10);
end;

function porcentaje(num1, num2 : integer) : real;
  begin
    porcentaje := ((num1 * 100) /num2 );
  end;

procedure recorrerL (l : lista);
var
 totalAlumnos,totalAlumnos2020,cantAsistAE,cantAEaprobadas : integer;
begin
 totalAlumnos := 0; totalAlumnos2020 := 0;
  while (l <> nil) do begin 
   totalAlumnos := totalAlumnos + 1;
   recorrerNotas (l^.dato.nota,cantAsistAE,cantAEaprobadas);
      if (cantAEaprobadas >= 4) and (cantAsistAE >=8) then  // INCISO B1
       writeln ('El alumno ',l^.dato.dni, ' puede rendir');
       
      if (condicion2(l^.dato.anioIngreso,cantAsistAE)) then  // INCISO B2
       totalAlumnos2020 := totalAlumnos2020 + 1;
       
      if (descomponer (l^.dato.dni)) then  // INCISO B3 (ANDA)
       writeln ('El alumno ',l^.dato.nom, ' ',l^.dato.ape,' cumple la condicion de la suma del dni');
       l := l^.sig;
     end;
       writeln ('El porcentaje de alumnos que ingresaron en 2020 es de ',porcentaje(totalAlumnos2020,totalAlumnos):0:2, ' % ');
    end;


var
 l : lista;
begin 
 l := nil;
 cargarL (l);
 recorrerL (l);
end.
 
     
   
 
