program p10;
const 
 dimf = 20;
type
rangoCultivos = 1..dimf;
cultivoR = record
   tipo : string;
   cantHectareas : integer;
   cantMeses : integer;
  end; 

vecCultivos = array [rangoCultivos] of cultivoR;

empresa = record 
  cod : integer;
  nom : string;
  tipoe : string; // Estatal o provincial
  ciudadRadica : string;
  cultivos : vecCultivos;
  diml : integer;
 end; 
  
 lista = ^nodo;
  nodo = record
   dato : empresa;
   sig : lista;
  end;
 


 
procedure cultivo (var c : cultivoR);
begin
 write ('Ingrese la cantidad de hectareas dedicadas : '); readln (c.cantHectareas);
 if (c.cantHectareas <> 0) then begin
  write ('Ingrese el tipo de cultivo : '); readln (c.tipo);
  write ('Ingrese el tiempo de cosecha : '); readln (c.cantMeses);
 end;
end;


procedure leerC (var vC : vecCultivos; var diml : integer);
var
 c : cultivoR;
begin
  diml := 0;
  cultivo (c);
   while (diml < dimf) and (c.cantHectareas <> 0) do begin 
    diml := diml + 1;
    vC [diml] := c;
    cultivo (c)
  end;
end;

procedure leerE (var e : empresa);
begin
 write ('Ingrese el codigo de la empresa : '); readln (e.cod);
 if (e.cod <> -1) then begin 
  write ('Ingrese el nombre de la empresa : '); readln (e.nom);
  write ('Ingres el tipo de empresa (estatal o provincial) : '); readln (e.tipoe);
  write ('Ingrese la ciudad donde radica la empresa : '); readln (e.ciudadRadica);
  leerC (e.cultivos,e.diml);
 end;
end;

procedure agregarAdelante (var l : lista; e : empresa);
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
 e : empresa;
begin
 leerE (e);
  while (e.cod <> -1) do begin 
   agregarAdelante (l,e);
   leerE (e);
  end;
end;

function descomponer (cod : integer) : boolean;
var
 dig , cant0 : integer;
begin
 cant0 := 0;
  while (cod <> 0) do begin 
   dig := cod mod 10;
    if (dig = 0) then 
     cant0 := cant0 + 1;
    cod := cod div 10;
  end;
   descomponer := (cant0 >= 2);
end;

procedure masTmaiz (tiempo : integer ; empresa : string; var maxEmpresa : string; var maxTiempo : integer);
begin
  maxTiempo := -1;
  if (tiempo > maxTiempo) then begin 
   maxEmpresa  := empresa;
   maxTiempo := tiempo;
  end;
end;

procedure recorrerL (l : lista);
var
 cantTotalHectareas,cantHectareasSoja,i,contadorTiempoMaiz,mT: integer;
 esTrigo , esMaiz: boolean;
 mE : string;
 porcentaje : real;
 
begin
 cantTotalHectareas := 0; cantHectareasSoja := 0; 
  while (l <> nil) do begin 
    contadorTiempoMaiz := 0; esTrigo := false; esMaiz := false;
      for i := 1 to (l^.dato.diml) do begin
        cantTotalHectareas := cantTotalHectareas + l^.dato.cultivos[i].cantHectareas; // C *REQUIEREN RECORRIDO DEL VECTOR
        if (l^.dato.cultivos[i].tipo = 'soja') then 
          cantHectareasSoja := cantHectareasSoja + l^.dato.cultivos[i].cantHectareas;
      if (l^.dato.cultivos[i].tipo = 'maiz') then begin
       contadorTiempoMaiz := contadorTiempoMaiz + l^.dato.cultivos[i].cantMeses;
       esMaiz := true;
      end;
      if (l^.dato.cultivos[i].tipo = 'trigo') then 
       esTrigo := true;
     end;
      if ((l^.dato.ciudadRadica = 'San Miguel del Monte') and (esTrigo) and (descomponer (l^.dato.cod))) then // B
          writeln ('La empresa ',l^.dato.nom, ' cumple con las condiciones');
      if (esMaiz) then 
       masTmaiz (contadorTiempoMaiz,l^.dato.nom,mE,mT); 
       l := l^.sig;
      end;
       porcentaje := (cantHectareasSoja/cantTotalHectareas)*100;
       writeln ('');
       writeln ('La cantidad total de hectareas que cultivan soja es : ',cantHectareasSoja, ' y representa el : ' ,porcentaje:2:2, ' % ');
       writeln ('');
       writeln ('La empresa que mas le dedica al cultivo de maiz es : ',mE);
end;


procedure incrementarG (l : lista);
var
 i : integer;
begin
 while (l <> nil) do begin 
 for i := 1 to (l^.dato.diml) do begin
  if (l^.dato.cultivos[i].tipo = 'girasol') and ( l^.dato.tipoe = 'provincial') and (l^.dato.cultivos[i].cantHectareas < 5) then begin 
   l^.dato.cultivos[i].cantMeses := l^.dato.cultivos[i].cantMeses + 1;
   l := l^.sig;
   end;
  end;
 end;
end;

var
 l : lista;
begin
 l := nil;
 cargarL (l);
 recorrerL (l);
 //incrementarG (l);
end.
        