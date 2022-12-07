program p8;
type 
	 proyecto = record
	  cod : integer;
	  titulo : string;
	  docente : docen;
	  cantAlu : integer;
	  nombreEscu : string;
	  localidad : string;
	  end;
	 docen = record
	  dni : integer;
	  nombre : string;
	  apellido : string;
	  mail : string;
	 end;


procedure leerDocente (var d : docen);
begin
	 writeln ('Ingrese el dni del docente');
	 readln (d.dni);
	 writeln ('Ingrese nombre y apellido');
	 readln (d.nombre); readln (d.apellido);
	 writeln ('Ingrese el mail');
	 readln (d.mail);
end;


procedure leerProyecto (var p : proyecto);
begin
	writeln ('Ingrese el codigo del proyecto');
	readln (p.cod);
	if (p.cod <> -1) then begin
	 writeln ('Ingrese el titulo del proyecto');
	 readln (p.titulo);
	 writeln ('Ingrese la cantidad de alumnos del proyecto');
	 readln (p.cantAlu);
	 writeln ('Ingrese el nombre de la escuela');
	 readln (p.nombreEscu);
	 writeln ('Ingrese la localidad de la escuela');
	 readln (p.localidad);
	  leerDocente (docente);
	end;
end;

procedure Maximos (NombreEscuela : string;cantAluP : integer; var max1,max2 : integer; var maxEscuela1,maxEscuela2 : string);
begin
	 if (cantAluP > max1) then begin
	  max2 := max1;
	  max1 := cantAluP;
	  maxEscuela2 := maxEscuela1;
	  maxEscuela1 := NombreEscuela;
	 end 
	else
	 if (cantAluP > max2) then begin 
	  max2 := cantAluP;
	  maxEscuela2 := NombreEscuela;
	 end;
end;


function  Descomponer (p : proyecto) : boolean;
var
 cantPares , cantImpares , dig : integer;
begin
 cantPares := 0; cantImpares := 0; 
 while (p.cod <> 0) do begin
  dig := p.cod mod 10;
   if ((dig mod 2) = 0) then 
       cantPares += 1
     else
      cantImpares += 1;
    dig := dig div 10;
 end;
   Descomponer = (cantPares = cantImpares);
end;


var 
 p : proyecto;
 max1,max2,CantEscuelas2020,CantEscuelasLocalidad : integer;
 maxEscu1,maxEscu2 ,AuxLocalidad: string;
begin
	leerProyecto (p); CantEscuelas2020 := 0; max1 := -999; max2 := -999;
	 while (p.cod <> -1) do begin
	  CantEscuelas2020 := CantEscuelas2020 + 1;
	   if (p.localidad = 'Daireaux') and (Descomponer(p)) then 
	        writeln ('El proyecto' ,p.titulo, 'es de  Daireaux con la misma cantidad de pares que impares es ');
	    AuxLocalidad := p.localidad; CantEscuelasLocalidad := 0;
	    while (p.localidad = AuxLocalidad) and (p.cod <> -1) do begin 
	     CantEscuelasLocalidad += 1;
	      writeln ('La cantidad de escuelas de ',AuxLocalidad, ' es ',CantEscuelasLocalidad);
	      leerProyecto (p);
        end;
         Maximos (p.nombreEscu,cantAlu,max1,max2,maxEscu1,maxEscuela2);
    end;
      writeln ('La cantidad de escuelas del proyecto 2020 son ',CantEscuelas2020);
      writeln ('Las 2 escuelas con mas alumnos son ',maxEscuela1, '(',max1,') y ' ,maxEscuela2, '(',max2,')');
end.
	       

