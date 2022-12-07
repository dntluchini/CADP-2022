const
 finMes = 31;
type
 rangoDia = 1..finMes;
 vecContador = array [rangoDia] of integer; // Contador de prestamos
 prestamo = record
  nroPres : integer;
  isbnPres : integer;
  diaPres : rangoDia;
  nroSocio : integer;
 end;
 
nuevo = record
 cantPrestado : integer;
 ISBNact : integer;
end; 
 
 lista = ^nodo;
 nodo = record
  dato : nuevo;
  sig : lista;
 end;
 

 
procedure leerP (var p : prestamo);
 begin
  write ('Ingrese el isbn de prestamo : '); readln (p.isbnPres);
  if (p.isbnPres <> -1) then begin
   write ('Ingrese el nro del prestamo : '); readln (p.nroPres);
   write ('Ingrese el dia del prestamo : '); readln (p.diaPres);
   write ('Ingrese el nro de socio : '); readln (p.nroSocio);
  end;
end;

procedure insertarOrdenado (var l : lista; n : nuevo);
var
 nue,act,ant : lista;
begin
 new (nue);
 nue^.dato := n;
      //*if (l = nil) then begin 
     //*nue := l
    //*else begin;
   act := l;
   ant := l;
  while (act <> nil) and (act^.dato.ISBNact < n.ISBNact //* nue^.dato.ISBNact) do begin
   ant := act;
   act := act^.sig;
  end;
   if (ant = act) then begin 
        //*nue^.sig := l;
        l := nue;
        end
  else begin
   ant^.sig := nue;
   nue^.sig := act;
  end;
end;



function descomponer (numPres,numSocio : integer):boolean;
var
 dig,dig2: integer;
begin
 dig := numSocio mod 10;
 dig2 := numPres mod 10;
  descomponer := ((dig mod 2 = 0) and (dig2 mod 2 = 1));
end;


procedure minDia (vC : vecContador; var min,mindia : integer);
var
 i : integer;
begin
 for i := 1 to 31 do begin
  if (vC [i] < min) then begin
   min := vC [i];
   mindia := i;
  end;
 end;
end;


procedure inicializarV (var vC : vecContador);
var
 i : integer;
begin
 for i := 1 to finMes do 
  vC [i] := 0;
end;



procedure asignar (var n : nuevo; isbnAct,cantPres : integer);
begin
 n.ISBNact := isbnAct;
 n.cantPrestado := cantPres;
end;

procedure recorrerL (var l : lista);
var
 min,minD,cantPrestadoTotal,cantPrestadoIsbnAct,cantCumple,isbnAux  : integer;
 vC : vecContador;
 p : prestamo;
 n : nuevo;
begin
 min := 9999; 
 cantCumple := 0;  
 cantPrestadoTotal := 0;
 inicializarV (vC); 
 leerP (p);
 while (p.isbnPres <> -1) do begin 
   isbnAux := p.isbnPres; 
   cantPrestadoIsbnAct := 0;
    while (p.isbnPres <> -1) and (p.isbnPres =  isbnAux) do begin
     cantPrestadoIsbnAct := cantPrestadoIsbnAct  + 1;
     vC [p.diaPres] := vC [p.diaPres] + 1;
     cantPrestadoTotal := cantPrestadoTotal + 1;
     if (descomponer (p.nroPres,p.nroSocio)) then
      cantCumple := cantCumple + 1;
     leerP (p);
    end; 
     asignar (n,isbnAux,cantPrestadoIsbnAct);
     insertarOrdenado (l,n);
     writeln ('El libro del isbn = ',isbnAux,' fue prestado ',cantPrestadoIsbnAct);
    end;
    writeln ('El porcentaje de prestamos que cumple la condicion es : ',(cantCumple * 100) / cantPrestadoTotal:0:2);
    writeln ('');
    minDia (vC,min,minD);
    writeln ('El dia con menos prestamos fue ',minD, ' con ',min, ' prestamos ');
    writeln ('');
end;



var
 l : lista;
begin
 l := nil;
 recorrerL (l);
end.