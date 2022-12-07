program p5;
type
	auto = record 
	 marca : string;
	 modelo : string;
	 precio : real;
	end;

procedure leerA (var a : auto);
begin
	 writeln ('Ingrese la marca del auto');
	 readln (a.marca);
	   writeln ('Ingrese el modelo');
	   readln (a.modelo);
	   writeln ('Ingrese el precio');
	   readln (a.precio);
end;


{function promedio (a : auto ; cantAutosMarca : integer ; totalMarca : real) : real;
var
 prom : real;
begin
  totalMarca := totalMarca + a.precio;
  promedio := totalMarca / cantAutosMarca;
  prom := promedio;
end;}


procedure MasCaro (a : auto ; var MarcaCara,ModeloCaro : string ; var max : real);
begin
	 if (a.precio > max) then begin
	  max := a.precio;
	  MarcaCara := a.marca;
	  ModeloCaro := a.modelo;
	 end;
end;

var
 a : auto;
 marcaCara,modeloCaro ,marcaAux: string;
 totalDeMarca,max : real;
 cantAutosMarca : integer;
begin
   max := -999;
	leerA (a);
	 while (a.marca <> 'ZZZ') do begin
	    totalDeMarca := 0;
	    marcaAux := a.marca;
	 	cantAutosMarca := 0; 
	  while (marcaAux = a.marca) do begin
	   cantAutosMarca += 1;
	   totalDeMarca := totalDeMarca + a.precio;
	   MasCaro (a,marcaCara,modeloCaro,max);
	   leerA (a);
	 end;
	 writeln ('El promedio de la marca ', marcaAux , ' fue ',totalDeMarca/cantAutosMarca:0:2);
	end;
	writeln ('El auto mas caro fue ',modeloCaro, ' de la marca ',marcaCara);
end.





