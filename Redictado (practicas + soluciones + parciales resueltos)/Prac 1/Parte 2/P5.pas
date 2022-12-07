program p5; //Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se ingrese el número 100, el cual debe procesarse. Informar en pantalla:
const //◦ El número máximo leído.
 corte = 100; // ◦ El número mínimo leído.
var // ◦ La suma total de los números leídos.
 num,suma,max,min : integer;
begin 
  suma := 0; max := -99; min := 9999;
  repeat
   writeln ('Ingrese un numero');
   readln (num);
   suma := suma + num;
   if (num > max) then 
    max := num;
   if (num < min) then 
    min := num;
 until (num = corte);
  writeln ('El numero mas alto fue ',max);
  writeln ('El numero mas chico fue ',min);
  writeln ('La suma total fue ',suma);
 end.