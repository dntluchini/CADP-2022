program p1;
var
i, num , suma : integer;
begin
 suma := 0;
 for i := 1 to 10 do begin
 writeln ('Ingrese un numero');
 readln (num);
 suma := suma + num;
 end;
  writeln ('La suma total fue ',suma);
end.

program p1A;
var
i, num , suma , numMa5: integer;
begin
 suma := 0;
 numMa5 := 0;
 for i := 1 to 10 do begin
 writeln ('Ingrese un numero');
 readln (num);
 if (num > 5) then begin
  writeln ('El numero ',i, ' es mayor 5 '); 
  numMa5 += 1;
  suma := suma + num;
  end
 else
  writeln ('El numero ' , i , ' NO es mayor a 5');
  
 end;
  writeln ('La cantidad de numeros mayores a 5 fueron ',numMa5);
  writeln ('La suma total fue ',suma);
end.

*INFORMA LA CANTIDAD DE NUMEROS MAYORES A 5 Y QUE NUMEROS FUERON MAYORES A 5*