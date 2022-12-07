type 
 vecNom = arraf [1..2500] of punto;
 nom = string [50];
 punto : ^nom;
var
 puntero : punto;
 
7b1) Puntero ocupa (4*2500)
7b2) procedure reservar (var vN : vecNom);
var 
 i : integer;
begin
 for i := 1 to 2500 do 
  new (vN[i]);
end;
 Son 10000kb y pertenecen a memoria dinamica

7b3) procedure cargarV (var vN : vecNom);
var
 i : integer;
begin
 for i := 1 to 2500 do begin
  writeln ('Ingrese un nombre');
  readln (n);
   vN[i] := n;
end;

var
 vN : vecNom;
begin
 reservar (vn);
 cargarV (vn);
end.