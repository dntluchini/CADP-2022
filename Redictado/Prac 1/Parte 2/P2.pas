program p2;
var
 num , i , max: integer;
begin
	max := -999;
  for i := 1 to 10 do begin
   writeln ('Ingrese un numero');
   readln (num);
   if (num > max) then 
    max := num;
   end;
    writeln ('El mayor numero leido fue ',max,);
  end.

program p2;
var
 num , i ,maxi, max: integer;
begin
    max := -999;
  for i := 1 to 10 do begin
   writeln ('Ingrese un numero');
   readln (num);
   if (num > max) then begin
    max := num;
    maxi := i;
    end;
   end;
    writeln ('El mayor numero leido fue ',max, ' en la posicion ',maxi);
  end.

