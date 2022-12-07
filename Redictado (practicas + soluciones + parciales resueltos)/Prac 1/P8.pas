
program Hello;
var
 l1,l2,l3 : char;
 ContVocales : integer;
begin
 ContVocales := 0;
   writeln ('Ingrese una letra'); readln (l1);
   writeln ('Ingrese una letra'); readln (l2);
   writeln ('Ingrese una letra'); readln (l3);
 if (l1 = 'a') or (l1 = 'e') or (l1 = 'i') or (l1 = 'o') or (l1 = 'u') then 
  ContVocales += 1;
 if (l2 = 'a') or (l2 = 'e') or (l2 = 'i') or (l2 = 'o') or (l2 = 'u') then 
  ContVocales += 1;
 if (l3 = 'a') or (l3 = 'e') or (l3 = 'i') or (l3 = 'o') or (l3 = 'u') then 
  ContVocales += 1;
if (ContVocales >= 3) then 
 writeln ('Las 3 letras son vocales')
else
 if (ContVocales >= 1) then 
  writeln ('Por lo menos 1 letra es vocal')
 else
  writeln ('Ninguna letra es vocal');
end.