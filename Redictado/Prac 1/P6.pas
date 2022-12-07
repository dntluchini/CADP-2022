
program Hello;
var
 Legajo,AluTotal,AluDes,Alu6 : integer;
 Por,Prom : real;
begin
 Alu6 := 0; AluTotal := 0; AluDes := 0;
 writeln ('Ingrese el numero de legajo');
 readln (Legajo);
 writeln ('Ingrese el promedio');
 readln (Prom);
  while (Legajo <> -1) do begin
  AluTotal +=1;
  if (Prom > 6.5) then 
    Alu6 += 1;
  if (Prom > 8.5) and (Legajo < 2500) then 
   AluDes += 1;
   writeln ('Ingrese el numero de legajo');
    readln (Legajo);
   writeln ('Ingrese el promedio');
    readln (Prom);
 end;
 Por := (AluDes* 100)/AluTotal ;
  writeln ('El total de alumnos es ',AluTotal);
  writeln ('El total de alumnos con promedio mayor a 6.5 es ',Alu6);
  writeln ('El porcentaje de alumnos destacados es ',Por:0:2);
end.
 