const
 finLibros = 35;
type

rangoArea = 1..finLibros;

 libro = record
  titu : string;
  nomEdi : string;
  cantPag : integer;
  anioEdi : integer;
  cantVentas : integer;
  codArea : rangoArea;
 end;

lista2 = ^nodo2;
nodo2 = record
 dato : reg2;
 sig : lista2;
end;

reg2 = record
 nomEditorial : string;
 anioEdiLibroAntiguo : integer;
 cantLibrosEditados : integer;
 cantVentasLibros : integer;
 titMas250Pag : string;
 nombAreaMas250Pag : rangoArea;
 cantPagMas250Pag : integer;
end;

vecAreas = array [rangoArea] of integer; // Se dispone

procedure leerL (var l : libro);
begin
 write ('Ingrese el nombre del libro : '); readln (l.titu);
 if (l.titu <> 'relato de un naufrago') then begin 
   write ('Ingrese el nombre de la edicion : '); readln (l.nomEdi);
   write ('Ingrese la cantidad de paginas : '); readln (l.cantPag);
   write ('Ingrese el anio de la edicion : '); readln (l.anioEdi);
   write ('Ingrese cantidad de ventas del libro : '); readln (l.cantVentas);
   write ('Ingrese el area del libro : '); readln (l.codArea);
  end;
end;
   
procedure agregarAtras (var l : lista2; re : reg2);
var
 nue,ult : lista;
begin
 new (nue);
 nue^.dato := re;
 nue^.sig := nil;
  if (l = nil) then 
   l := nue
  else 
   ult := l;
  while (ult^.sig <> nil) do begin
   ult := ult^.sig;
   ult^.sig := nue;
  end;
end;

procedure cargarL (var l : lista2);
var
 li : libro;
 re2 : reg2;
begin
  repeat 
   leerL (li);
   if (li.nomEdi = 'Planeta Libros') then begin
   inicializoRe2 (re2);
   agregarAtras (l,re2);
  end;
  until (li.titu = 'relato de un naufrago');
  end;
end;


procedure inicializoRe2 (var re : reg2);
begin
 re.cantLibrosEditados := 0;
 re.cantPagMas250Pag := 0;
 re.anioEdiLibroAntiguo := 0;
 re.cantVentasLibros := 0;  
 re.titMas250Pag := '';
 re.nombAreaMas250Pag := '';
end;



procedure reAsignar (var l2 : lista2; r2 : reg2);
var 
 max : integer;
 li : libro;
begin
 max := 99999;
 inicializoRe2 (r2);
  while (l2 <> nil) do begin 
   l2^.dato.cantVentasLibros := l2^.dato.cantVentasLibros + li.cantVentas;
   if (l2^.dato.nomEditorial = 'Planeta libros') then begin
    l2^.dato.nomEditorial := 'Planeta libros';
    l2^.dato.cantLibrosEditados := l2^.dato.cantLibrosEditados + 1;
     if (li.anioEdi < max) then begin
      max := li.anioEdi;
      l2^.dato.anioEdiLibroAntiguo := max;
     end;
    if (li.cantPag > 250) then begin 
      l2^.dato.cantPagMas250Pag := l2^.dato.cantPagMas250Pag + li.cantPag;
      l2^.dato.nombAreaMas250Pag := li.codArea;
      l2^.dato.titMas250Pag := li.titu;
     end;
    l2 := l2^.sig;
 end;
 imprimirL (l2);
end;
    
      
  


 
procedure imprimirL (l : lista2);
begin
 while (l <> nil) do begin
  if (l^.dato.cantLibrosEditados > 250) then begin 
   writeln ('El libro ',l^.dato.titMas250Pag, ' de la editorial ',l^.dato.nomEditorial,' tiene mas de 250 ventas');
   l := l^.sig;
  end;
end;

var
 l2 : lista2;
 re : reg2;
begin
 l2 := nil;
  cargarL (l2);
  reAsignar (l2,r2);
end.
  