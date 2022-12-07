program p2;
var
 i,presentes,legajo,CantAlu10,CantAEaprobadas,TotalNota,nota,CantIngresantes,CantIngresantesParcial,CantRecursantes,CantRecursantesParcial,CantAluAprobo,CantAluProm65,CantAlu0,codmax1,codmax2,codmax3,codmax4,max1AE0,max2AE0,max3AE10,max4AE10 : integer;
 prom  : real;
 condicion : string;
begin
  CantIngresantes := 0; CantIngresantesParcial := 0; CantRecursantes := 0; CantRecursantesParcial := 0; CantAluAprobo := 0; CantAluProm65 := 0; CantAlu0 := 0; max1AE0 := -9999; max2AE0 := -9999; max3AE10 := -9999; max4AE10 := -9999;
  writeln ('Ingrese el legajo del alumno');
  readln (legajo);
   while (legajo <> -1) do begin 
   CantAlu0 := 0; cantAlu10 := 0; presentes := 0;
    writeln ('Ingrese la condicion del alumno');
    readln (condicion);
     if (condicion = 'i') then 
      CantIngresantes += 1;
     if (condicion = 'r') then 
      CantRecursantes += 1;
     for i := 1 to 5 do begin
      writeln ('Ingrese la nota de la autoevaluacion numero',i);
      readln (nota);
      TotalNota := TotalNota + nota;
      if (nota >= 4) then 
       CantAEaprobadas += 1;
       presentes =+ 1;
      if (nota = 10) then 
       cantaAlu10 += 1;
      if (nota = 0) then 
       CantAlu0 +=1;
     end;
     if (CantAEaprobadas = 5) then 
      CantAluAprobo += 1;
     prom := TotalNota / 5;
     if (prom > 6.5) then 
      CantAluProm65 += 1;
     if (condicion = 'i') and (nota >= 4) then 
      CantIngresantesParcial += 1;
     if (condicion = 'r') and (nota >= 4) then 
      CantRecursantesParcial += 1;
     if ()

 
