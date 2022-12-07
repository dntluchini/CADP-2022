program p10;
procedure leer (var nro : integer; var nombre,apellido : string);
begin
 writeln ('Ingrese el nro de alumno');
 readln (nro);
 writeln ('Ingrese el nombre y apellido del alumno');
 readln (nombre); readln (apellido);
end;

procedure apeMenor (nro : integer; apellido : string; var apeMin1,apeMin2 : string; var min1,min2 : integer);
begin
  if (nro < min1) then begin
   min2 := min1;
   min1 := nro;
   apeMin2 := apeMin1;
   apeMin1 := apellido;
  end
  else
   if (nro < min2) then begin
    min2 := nro;
    apeMin2 := apellido;
  end;
end;

procedure NombreMayor (nro : integer; nombre : string; var max1,max2 : integer; var nombre1,nombre2 : string);
begin
  if (nro > max1) then begin
   max2 := max1;
   max1 := nro;
   nombre2 := nombre1;
   nombre1 := nombre;
  end
 else
  if (nro > max2) then begin
   max2 := nro;
   nombre2 := nombre;
  end;
end;

procedure Descomponer (nro : integer; var cantPares : integer);
var
 dig : integer;
begin
 cantPares := 0;
 while (nro <> 0) do begin
   dig := nro mod 10;
   if ((dig mod 2) = 0) then 
    cantPares += 1;
    nro := nro div 10;
  end;
end;

var
 nro , minimo1 , minimo2 , maximo1 , maximo2 , cantAluTotal , Pares : integer;
 n,n1,n2,a,a1,a2 : string;
 porcentaje : real;
begin
 maximo1 := -9999; maximo2 := -9999; minimo1 := 9999; minimo2 := 9999; cantAluTotal := 0;
 repeat 
  leer (nro,n,a);
  cantAluTotal += 1;
  apeMenor (nro,a,a1,a2,minimo1,minimo2);
  NombreMayor (nro,n,maximo1,maximo2,n1,n2);
  Descomponer (nro,Pares);
 until (nro = 1200);
  writeln ('Los dos apellidos con menor numero de inscripcion fueron : ',a1, ' (',minimo1,')  y ' ,a2, ' (',minimo2,')');
  writeln ('Los dos nombres con mayor numero de inscripcion fueron : ',n1, ' (',maximo1,')  y ' ,n2, ' (',maximo2,')');
  writeln ('El porcentaje de los alumnos con numero par es ',((Pares/cantAluTotal)*100):0:2);
end.
