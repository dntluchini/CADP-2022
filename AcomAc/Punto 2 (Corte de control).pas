
program Hello;
type
 juego = record
  nombre : string;
  categoria : string;
  idioma : string;
  cantVotos : integer;
 end; 

procedure leerj (var J : juego);
begin
 writeln ('Ingrese el nombre del juego');
 readln (J.nombre);
 if (J.nombre <> 'ZZZ') then begin
  writeln ('Ingrese la categoria del juego');
  readln (J.categoria);
  writeln ('Ingrese el idioma del juego');
  readln (J.idioma);
  writeln ('Ingrese la cantidad de votos recividos');
  readln (J.cantVotos);
 end;
end;

procedure IncisoA (j : juego; var CatMasJuegos : string ; var CatMasVotos : string);
var
 catActual : string;
 Max,Max2,ContJuegos,ContVotos : integer;
begin
 Max := -999;
 Max2 := -999;
 ContVotos := 0;
 ContJuegos := 0;
  leerj (j);
  while (j.nombre <> 'ZZZ') do 
   catActual := j.categoria;
   while (j.categoria = catActual) and (j.nombre 'ZZZ') do begin
    ContJuegos += 1;
    ContVotos := ContVotos + j.cantVotos;
    leerj (j);
  end;
   if (ContJuegos > Max) then 
    CatMasJuegos := catActual;
   if (ContVotos > Max2) then 
    CatMasVotos := catActual;
     writeln ('La categoria con mas juegos es ',CatMasJuegos);
     writeln ('La categoria con mas votos es ',CatMasVotos)
end;


procedure IncisoB (j : juego, var promVotos : real);
var 
 catActual , idiomaActual : string;
 VotosIdiomaAct : integer;
begin
 promVotos := 0;
 