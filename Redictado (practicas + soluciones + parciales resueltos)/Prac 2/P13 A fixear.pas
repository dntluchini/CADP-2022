program p12;
procedure CumpleA (c : char; var ok : boolean); 
begin
 if (c = '$') then 
  ok := false
 else
  ok := true;
end;

function cumpleB (cantCA : integer; CantArro : integer ; cantCB : integer) : boolean;
var
 ok : boolean;
begin
ok := false;
 if (cantCB = cantCA) and (cantArro <= 3) then 
  ok := true
 else
  ok := false;
 cumpleB := ok;
end;

var
 cantCA , cantArroba ,cantCB : integer;
 c : char;
 ok : boolean;
begin
cantArroba := 0; cantCA := 0; cantCB := 0;
repeat
writeln ('Ingrese un caracter');
readln (c);
cantCA += 1;
CumpleA (c,ok);
until (ok = false); 
  if (ok = false) then 
  writeln ('Se termino de ingresar el patron A')
 else
   writeln ('El patron A se cumplio');
repeat
  writeln ('Ingrese un caracter');
  readln (c);
  cantCB += 1;
  if (c = '@') then 
   cantArroba +=1;
until (cumpleB (cantCA,cantArroba,cantCB) = true);
 if cumpleB(cantCA,cantArroba,cantCB) = true then 
 writeln ('El patron B se cumplio')
else
 writeln ('El patron B no se cumplio');
end.
 