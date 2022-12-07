program p7;
type 
	str20 = string [20];
var
 nombre,NomUlt1,NomUlt2,NomPri1,NomPri2: str20;
 tiempo,Ult1,Ult2,Pri1,Pri2 : real;
 i : integer;
begin
  Ult1:= 9999; Ult2 := 9999; Pri1:= -9999; Pri2 := -9999;
  for i := 1 to 100 do begin
   writeln ('Ingrese el nombre de piloto');
   readln (nombre);
   writeln ('Ingrese el tiempo');
   readln (tiempo);
    if (tiempo < Ult1) then begin
     Ult2 := Ult1;
     Ult1 := tiempo;
     NomUlt2 := NomUlt1;
     NomUlt1 := nombre;
     end 
    else
     if (tiempo < Ult2) then begin
         Ult2 := tiempo;
         NomUlt2 := nombre;
        end;
     if (tiempo > Pri1) then begin 
        Pri2 := Pri1;
        Pri1 := tiempo;
        NomPri2 := NomPri1;
        NomPri1 := nombre;
       end
        else
         if (tiempo > Pri2) then begin
          Pri2 := tiempo;
          NomPri2 := nombre;
         end;
end;
  writeln ('Los 2 primeros puestos fueron ',NomPri1, ' y ',NomPri2, ' con los tiempos de ',Pri1:0:2, ' y ',Pri2:0:2, ' respectivamente');
  writeln ('Los 2 ultimos puestos fueron ',NomUlt1, ' y ',NomUlt2, ' con los tiempos de ',Ult1:0:2, ' y ',Ult2:0:2, ' respectivamente');  
end.

