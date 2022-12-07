program p13;
type 
 esc = record
  cue : integer;
  cantDocentes : integer;
  cantAlumnos : integer;
  localidad : string;
  nombre : string;
 end;

procedure leer (var e : esc);
begin
  writeln ('Ingrese el cue');
  readln (e.cue);
  writeln ('Ingrese el nombre del colegio');
  readln (e.nombre);
  writeln ('Ingrese la cantidad de docentes');
  readln (e.cantDocentes);
  writeln ('Ingrese la cantidad de alumnos');
  readln (e.cantAlumnos);
  writeln ('Ingrese la localidad');
  readln (e.localidad);
end;


function relacion (alumnos,docentes : integer) : real;
begin
 relacion := alumnos / docentes;
end;

procedure MayorRelacion (alumno,docente : integer; ciudad : string; var cantEscuelas : integer);
begin
   if (relacion (alumno,docente) > 23.435) and (ciudad = 'lp') then
     cantEscuelas += 1;
end;

procedure cueYNomMayor (max1,max2 : integer; e : esc; var maxcue1,maxcue2 : integer; var maxnom1,maxnom2 : string);
begin
  if (relacion (e.cantAlumnosalu,e.cantDocentesdocen) > max1) then begin
   maxcue2 := maxcue1;
   maxcue1 := e.cue;
   maxnom2 := maxnom1;
   maxnom1 := e.nombre;
  end
 else
   if (relacion (e.cantAlumnosal,e.cantDocentesdocen) > max2) then begin
    maxcue2 := e.cue;
    maxnom2 := e.nombre;
   end;
 end;


var
 e : esc;
 i, max1,max2,cuemax1,cuemax2,alumno,docente,escuelasCant : integer;
 nommax1,nommax2 : string;
begin
  max1 := -9999; max2 := -9999; escuelasCant := 0;
  for i := 1 to 3 do begin
   leer (e);
   MayorRelacion (alumno,docente,e.localidad,escuelasCant);
   cueYNomMayor (e,cuemax1,cuemax2,nommax1,nommax2);
  end;
  writeln ('La cantidad de escuelas con mayor relacion alumno-maestro fueron ',escuelasCant);
 writeln ('Las 2 escuelas con mayor relacion alumno-maestro fueron ',nommax1, ' y ',nommax2) ;
end.