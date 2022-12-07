const 
 finEventos = 100;
 finTipo = 5;
type
rangoTipo = 1..finTipo;
rangoEvento = 1..finEventos;
 entrada = record
  codVenta : integer;
  numEvento : rangoEvento;
  dni : longint;
  cantEntradas : integer;
 end;
 evento = record 
  nom : string;
  tipo : rangoTipo;
  lugar : string;
  cantMaxp : integer;
  costoEntrada : real;
  entradaInfo : entrada;
 end;
 
 lista = ^nodo;
 nodo = record 
  dato : entrada;
  sig : lista;
 end;
 
 vecEventos = array [rangoEvento] of evento; // Se dispone
 vecContador = array [rangoTipo] of integer;


procedure leerE (var e : evento) // Se dispone

procedure leerEntrada (var e : entrada);
begin 
 write ('Ingrse el codigo de venta : ');
 readln (e.codVenta);
  if (e.codVenta <> -1) then begin 
   write ('Ingrese el numero de evento : ');
   readln (e.numEvento);
   write ('Ingrese el dni : ');
   readln (e.dni);
   write ('Ingrese la cantidad de entradas : ');
   readln (e.cantEntradas);
  end;
end;

procedure agregarAdelante (var l : lista; e : entrada);
var 
 nue : lista;
begin 
 new (nue);
 nue^.dato := e;
 nue^.sig := l;
 l := nue;
end;

procedure cargarL (var l : lista);
var 
 e : entrada;
begin 
 l := nil;
 leerEntrada (e);
  while (e.codVenta <> -1) do begin 
   agregarAdelante (l,e);
   leerEntrada (e);
  end;
end;


function descomponer (dni : integer) : boolean;
var 
 dig,pares,impares : integer;
begin
 pares := 0; impares := 0;
  while (dni <> 0) do begin 
   dig := dni mod 10;
    if (dig mod 2 = 0) then 
     pares := pares + 1
    else
     impares := impares + 1;
    dni := dni div 10;
  end;
   descomponer := (pares > impares);
end;

procedure menosRecaudacion (var menosR,menosR2 : real; var menosN ,menosN2,menosL2,menosL: string ; lugar,nombre : string;recaudacion : real);
begin 
 if (recaudacion > menosR) then begin 
  menosR2 := menosR;
  menosR := recaudacion;
  menosN2 := menosN;
  menosN := nombre;
  menosL2 := menosL;
  menosL := lugar;
 end
 else
  if (recaudacion > menosR2) then begin 
   menosR2 := recaudacion;
   menosL2 := lugar;
   menosN2 := nombre;
  end;
end;

procedure inicializarVContador (var vE : vecContador);
var 
 i : integer;
begin
 for i := 1 to finTipo do 
  vE [i] := 0;
end;


procedure recorrerL (l : lista);
var
 mL,mL2,mN,mN2 : string;
 mR,mR2,totRecaudado : real;
 cantEV,cantEntradasE50,i : integer;
 vC : vecContador;
 vE : vecEventos;
begin
 cantEntradasE50 := 0; cantEV := 0; totRecaudado := 0;
  while (l <> nil) do begin 
   vC [l^.dato.numEvento] := vC [l^.dato.numEvento] + 1;
   if (descomponer (l^.dato.dni) and (l^.dato.numEvento = 5)) then 
    cantEV := cantEV + 1;
   l := l^.sig;
  end;
   for i := 1 to finEventos do begin 
    totRecaudado := totRecaudado + (vE[i].costoEntrada * vE[i].l^.dato.cantEntradas);
    menosRecaudacion (mR,mR2,mN,mN2,mL2,mL,vE[i].lugar,vE[i].nombre,totRecaudado);
   end;
     if (vE[i].l^.dato.numEvento = 50) then 
     if (vE[i].l^.dato.cantEntradas = vE[i].cantMaxp) then 
      write ('El evento ocupo su maxima capacidad')
     else 
      write ('El evento NO ocupo su maxima capacidad');
      write ('Los lugares que menos recaudaron fueron : ',mN,' y ' ,mN2, ' que se hicieron en : ',mL, ' y ',mL2);
      write ('La cantidad de entradas vendidas para el evento de tipo obra de teatro fueron : ' ,cantEV);
 end;


var
 l : lista;
begin
 cargarL (l);
 recorrerL (l);
end.
    