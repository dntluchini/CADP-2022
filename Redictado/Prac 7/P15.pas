program p15;
const
 finTipoPasta = 15;
type
 rangoPasta = 1..finTipoPasta;
 pasta = record // Se dispone 
   nombre : rangoPasta;
   uD : integer;
   precioUnidad : real;
  end;
 
 vecPasta = array [rangoPasta] of pasta; // Se dispone  
 
 pedido = record
  codP : integer;
  dni : integer;
  tipoPasta : rangoPasta;
  cantUnidades : integer;
 end;
 
lista2 = ^nodo2;
nodo2 = record
 dato : pedido;
 sig : lista;
end;

 vecContUD = array [rangoPasta] of integer; 
 lista = ^nodo;
 nodo = record 
  dato : pedido;
  sig : lista;
 end;
 
procedure leerPedido (var p : pedido);
begin
 write (' Ingrese el dni : '); readln (p.dni);
 if (p.dni <> -1) then begin 
  write ('Ingrese el codigo del pedido : '); readln (p.codP);
  write ('Ingrese el tipo de pasta : '); readln (p.tipoPasta);
  write ('Ingrese la cantidad de unidades : '); readln (p.cantUnidades);
 end;
end;

procedure agregarA (var l : lista; p : pedido);
var
 aux : lista;
begin
 new (aux);
 aux^.dato := p;
 aux^.sig := l;
 l := aux;
end;

procedure atenderPedido (var l : lista);
var
 p : pedido;
begin
leerPedido (p);
 while (p.dni <> -1) do begin 
  agregarA (l,p);
  leerPedido (p);
 end;
end;

function cumpleSatisfecho (canUpedidas , cantUdisponibles: integer) : boolean;
begin
 cumpleSatisfecho := (cantUdisponibles > canUpedidas);
end;

function descomponer (num : integer) : boolean;
var
 par,impar,dig : integer;
begin
 par := 0; 
 impar := 0;
  while (num <> 0) do begin 
   dig := num mod 10;
    if (dig mod 2 = 0) then 
     par := par + 1
    else
     impar := impar + 1;
     num := num div 10;
    end;
   descomponer := (par = impar);
end;

procedure inicializarV (var veC : vecContUD);
var
 i : integer;
begin 
 for i := 1 to finTipoPasta do 
  veC [i] := 0;
end;

procedure recorrerL (l : lista; var l2 : lista2; var veC : vecContUD);
var
 cantPMenos5U : integer;
 montoSatisfecho : real;
 vecP : vecPasta;
 p : pedido;
begin
 cantPMenos5U := 0;
 montoSatisfecho := 0;

  while (l <> nil) do begin 
   if (cumpleSatisfecho (l^.dato.canUpedidas,vecP [l^.dato.tipoPasta].cantUnidades)) then begin
    writeln ('El pedido : ',l^.dato.codP,' que debe ',(l^.dato.canUpedidas*vecP [l^.dato.tipoPasta].precioUnidad),' fue satisfecho.');
    montoSatisfecho := montoSatisfecho + (l^.dato.canUpedidas*vecP [l^.dato.tipoPasta].precioUnidad);
  end
  else
   if not (cumpleSatisfecho (l^.dato.canUpedidas,vecP [l^.dato.tipoPasta].cantUnidades) then 
    agregarA (l2,p);
  if (vecP [l^.dato.tipoPasta].cantUnidades - l^.dato.canUpedidas < 5 ) then 
    veC [l^.dato.tipoPasta] := veC [l^.dato.tipoPasta] + 1;
   l := l^.sig;
  end;
  writeln ('El monto total de los pedidos satisfechos es de ' ,montoSatisfecho:0:2);
  Ud5 (veC,cantPMenos5U);
  imprimirL2 (l2);
end;
 
procedure imprimirL2 (l2 : lista2);
begin 
 while (l2 <> nil) do begin
 if (descomponer (l2^.dato.dni)) then 
  writeln ('El codigo : ',l2^.dato.codP,' cumple con la condicion.');
 end;
 l2 := l2^.sig;
end;

procedure Ud5 (veC : vecContUD; var cantUD5 : integer);
var
 i : integer;
begin 
 for i := 1 to 15 do begin 
  if (veC [i] < 5) then 
   cantUD5 := cantUD5 + 1;
  end;
end;

var
 l : lista;
 l2 : lista2;
 veC : vecContUD;
 cantUD : integer;
begin 
l := nil;
l2 := nil;
 atenderPedido (l);
 inicializarV (veC);
 recorrerL (l,l2,veC);
end.
 
   