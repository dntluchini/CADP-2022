
program Hello;
var
 carac : char;
 num , resul : integer;
begin
 resul := 0;
 writeln ('Ingrese un caracter'); readln (carac);
  if (carac = '+') or (carac = '-') then begin
   writeln ('Ingrese un numero');
    readln (num);
      if (carac = '+') then 
        while (num <> 0) do begin
        resul := resul + num;
        writeln ('Ingrese un numero');
        readln (num);
       end
      else
       resul := num + num;
       while (num <> 0) do begin 
       resul := resul - num;
       writeln ('Ingrese un numero');
       readln (num);
      end;
     writeln ('El resultado fue ',resul);
    end
 else
  writeln ('El caracter ingresado no fue ni + ni -');
end.