
program Hello;
type
rangoSemana = 1..42;
 paciente = record // Se dispone
  nom : string;
  ape : string;
  peso : real;
 end;
 vecSemana = array [rangoSemana] of real;
 lista =^nodo;

  nodo = record
   dato : paciente;
   sig : lista;
  end;

procedure leerP (var p : paciente); // Se dispone

procedure agregarAdelante (var l : lista; p : paciente); // Se dispone

procedure cargarL (var l : lista); // Se dispone

procedure inicializarV (var vS : vecSemana);
var
 i : integer;
begin
 for i := 1 to 42 do 
  vS [i] := 0;
end;

procedure cargarV (peso : real; var vS : vecSemana; var diml : integer);
var
 i : integer;
begin
 diml := 1;
  while (diml <= 42) do
  for i := 1 to diml do begin
   vecSemana [diml] := vecSemana [diml] + peso;
   diml := diml + 1;
  end;
end;

procedure maxSemana (vS : vecSemana ; var semanaMax: integer;var pesoMax : real; diml : integer);
var
 i : integer;
begin
 for i := 1 to diml do 
  if (vS [i] > pesoMax) then begin 
   semanaMax := i;
   pesoMax := vS[i];
  end;
end;
    
procedure recorrerL (l : lista; var pesoTotal : real ; diml : integer);
var
 vS : vecSemana;
 semaMax : integer;
 pesoMaximo : real;
 auxNom : string;
begin
 pesoTotal := 0; 
  while (l <> nil) do begin 
   auxNom := l^.dato.nom;
    while (l <> nil) and (l^.dato.nom = auxNom) do begin
     pesoTotal := (pesoTotal + l^.dato.peso) - vS [1];
     maxSemana (vS,semaMax,pesoMaximo,diml);
     writeln ('La semana con mas aumento de peso para ',auxNom, ' es la semana ',semaMax);
     writeln ('El aumento total de peso para ',auxNom, ' es ',pesoTot);
     l := l^.sig;
  end;
end;

var
 pri : lista;
 pesoTot : real;
 diml : integer;
 vS : vecSemana;
begin 
 pri := nil;
 cargarL (pri);
 inicializarV (vS);
 recorrerL (pri,pesoTot,diml);
end.


   