program hello;
const 
 dimf = 100;
type 
 camion = record  // Se dispone
  patente : integer;
  anio : integer;
  capacidad : integer;
 end;

 viaje = record 
  codViaje : integer;
  codCamion : integer;
  dist : real;
  ciuDestino : string;
  anioViaje : integer;
  dniChofer : integer;
 end;
 
vecTropa = array [1..dimf] of camion; // Vector de la tropa de camiones
lista =^nodo;
  nodo = record
   dato : viaje;
   sig : lista;
 end;
 
procedure leerV (var v : viaje);
begin
 write ('Ingrese el codigo del viaje : ');
 readln (v.codViaje);
  if (v.codViaje <> -1) then begin  
  write ('Ingrese el codigo del camion : ');
   readln (v.codCamion);
  write ('Ingrese la distancia del viaje : ');
   readln (v.dist);
  write ('Ingrese el destino del viaje : ');
   readln (v.ciuDestino);
  write ('Ingrese el anio del viaje : ');
   readln (v.anioViaje);
  write ('Ingrese el dni del chofer : ');
   readln (v.dniChofer);
  end;
end;
   
procedure agregarAdelante (var l : lista; v : viaje);
var
 nue : lista;
begin
 new (nue);
 nue^.dato := v;
 nue^.sig := l;
 l := nue;
end;

procedure cargarLista (var l : lista; var masKms , menosKms : real); // Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que menos kilómetros recorridos posee.
var
 v : viaje;
begin
 masKms := -9999;
 menosKms :=9999;
  leerV (v);
   while (l <> nil) and (v.codViaje <> -1) do begin
    agregarAdelante (l,v);
    leerV (v);
   end;
end;

procedure cargarVector (var vT : vecTropa; codCamion : integer); 
var
 i : integer;
begin
 for i := 1 to dimf do begin
  if (codCamion = i) then 
   vT [i] := vT [i] + 1;
  end;
end;



procedure cantViajes (var cantviajes : integer ; camionFabricacion, anioViaje , peso : integer) // Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en que se realizó el viaje).
begin
 if ((peso > 30.5) and (camionFabricacion - anioViaje = 5)) then 
  cantViajes := cantViajes + 1;
end;

procedure dnis (viaje,dni : integer; var codV : integer; var ok : boolean);
var
 dig , cantImpar,cantPar : integer;
begin
 cantImpar := 0;  ok := false; cantPar := 0;
  while (dni <> 0) and (cantPar = 0) do begin 
   dig := dni mod 10;
    if (dig div 2) = 0) then 
      cantPar := cantPar + 1
    else
     cantImpar := cantImpar + 1;
     dni := dni div 10;
    end;
     if (cantPar = 0) then begin
      ok := true;
      codV := viaje;
     end;
end;

procedure inciso1 (kms : real; patente : integer ; var masKms,menosKms,patenteMax,patenteMin : integer);
begin
if (l.dist > masKms) then begin
      masKms := l.dist;
      patenteMax := patente;
    end;
if (l.dist < menosKms) then begin
      menosKms := l.dist;
      patenteMin := patente;
     end;
end;
var 
 pri : lista;
 vt : vecTropa;
 masKilometros,menosKilometros : real;
 codVia,cVia : integer;
 ok : boolean;
begin
 pri := nil;
 masKilometros := -9999; menosKilometros := 9999;
 cargarLista (l);
  while (l <> nil) do begin 
   cargarVector (vt,l^.dato.codCamion);
   inciso1 (pri.dato.dist,vt.patente,masKilometros,menosKilometros);
   dnis (pri^.dato.codViaje,pri^.dato.dniChofer,codVia,ok);
    if (ok) then 
     writeln ('El codigo de viaje cuyo chofer tiene solo numeros impares en el dni es : ',codVia);
    cantViajes (cVia,vt.anio,pri^.dato.anio,vt.capacidad);
    pri := pri^.sig;
  end;
   writeln ('La cantidad de viajes que cumplen las 2 condiciones son ',cVia);
end.
  

      



