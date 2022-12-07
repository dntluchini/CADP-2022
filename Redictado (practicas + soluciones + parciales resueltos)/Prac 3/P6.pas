program p6;
type
	proce = record
	 marca : string;
	 linea : string;
	 cores : integer;
	 velocidad : real;
	 tamanioTransistores : integer;
	end;

procedure leerProce (var p : proce);
begin
	writeln ('Ingrese la marca del procesador');
	readln (p.marca);
	writeln ('Ingrese la linea del procesador');
	readln (p.linea);
	writeln ('Ingrese la cantidad de cores del procesador');
	readln (p.cores);
	writeln ('Ingrese la velocidad del procesador');
	readln (p.velocidad);
	writeln ('Ingrese el tamanio de los transistores');
	readln (p.tamanioTransistores);
end;


procedure MasCores22 (p : proce; var marcamax,lineamax1 : string);
begin
	if (p.cores > 2) and (p.tamanioTransistores > 22) then 
	 writeln ('El procesador ',lineamax1, ' de la marca ',marcamax, ' tiene mas de 2 cores y transistores mayores a 22 nm');
end;


procedure CantTransistores (VAR max1,max2 : integer; marcaux : string; transis : integer; var marcamax1,marcamax2 : string; var cantproce : integer);
begin
	if (transis > 14) then 
	 cantproce := cantproce + 1; {Inicializar cantproce en el pp}
	  if (cantproce > max1) then begin
	   max2 := max1;
	   max1 := cantproce; 
	   marcamax2 := marcamax1;
	   marcamax1 := marcaux;
	  end 
	 else
	  if (cantproce > max2) then begin
	   max2 := cantproce;
	   marcamax2 := marcaux;
	 end;
end;


{function Multicores (marca : string; relojes : real; cantCores : integer; cantMulticore : integer) : integer;
var
 Mas2cores : integer;
begin
	 if ((marca = 'INTEL') or (marca = 'AMD')) and (relojes >= 2) then 
	  cantMulticore := + 1;
   Multicores := Mas2cores;
end;}
	

var
 p : proce;
 maxmarca1,maxmarca2,marcaAux : string;
 max1,max2,cantproce,cantidadMulticore : integer;
begin
 max1 := -999; max2 := -999; cantidadMulticore := 0;
	leerProce (p);
	 while (p.cores <> 0) do begin
	 marcaAux := p.marca;
	 cantproce := 0;
	  while (p.marca = marcaAux) do begin
	  if ((p.marca = 'INTEL') or (p.marca = 'AMD')) and (p.velocidad >= 2) then 
	   cantidadMulticore += 1;
	  MasCores22 (p,p.marca,p.linea);
	  leerProce (p);
	 end;
	  CantTransistores (max1,max2,marcaAux,p.tamanioTransistores,maxmarca1,maxmarca2,cantproce);
	 end;
	  writeln ('La cantidad de procesadores intel o amd con velocidad de 2 Ghz son ',cantidadMulticore);
	  writeln ('Las 2 marcas con mas procesadores con transitores mayores a 14 nm son ',maxmarca1, ' y ' ,maxmarca2);
 end.