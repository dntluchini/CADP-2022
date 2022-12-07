program p5;
procedure numeros (numa , numb: integer;var ok : boolean);
begin
 if (numb = numa*2) then 
  ok := true
 else 
  ok := false;
end;


var
 n1,n2,cantParesL,cantParesD : integer;
 ok : boolean;
begin
 cantParesL := 0; cantParesD := 0;
 writeln ('Ingrese un numero'); readln (n1);
 writeln ('Ingrese un numero'); readln (n2);
  while (n1 <> 0) and (n2 <> 0) do begin
   cantParesL += 1;
   numeros (n1,n2,ok);
   if ok = true then 
    cantParesD += 1;
   writeln ('Ingrese un numero'); readln (n1);
   writeln ('Ingrese un numero'); readln (n2);
 end;
  writeln ('Cantidad de pares leidos ',cantParesL);
  writeln ('Cantidad de pares dobles ',cantParesD);
end.