
program Hello;
var
 n1,n2,n3 : integer;
begin
 writeln ('Ingrese un numero');
  read (n1);
 writeln ('Ingrese un numero');
  read (n2);
 writeln ('Ingrese un numero');
  read (n3);
 if (n1 > n2) and (n1 > n3) and (n2 > n3) then 
  writeln (n3, ' ',n2, ' ',n1)
 else
   if (n1 > n2) and (n1 > n3) and (n3 > n2) then
  writeln (n2,' ',n3,' ',n1)
 else
   if (n2 > n1) and (n2 > n3) and (n3 > n1) then 
  writeln (n1,' ',n3,' ',n2)
 else
   if (n2 > n1) and (n2 > n3) and (n1 > n3) then 
  writeln (n3,' ',n1,' ',n2)
 else
   if (n3 > n2) and (n3 > n1) and (n2 > n1) then 
  writeln (n1,' ',n2,' ',n3)
 else
   if (n3 > n2) and (n3 > n1) and (n1 > n2) then 
  writeln (n3,' ',n1,' ',n2)
end.
 