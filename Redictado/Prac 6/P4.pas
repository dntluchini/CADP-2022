program JugamosConListas;
type
lista = ^nodo;
  nodo = record
  num : integer;
  sig : lista;
end;
procedure armarNodo(var L: lista; v: integer);
var
  aux : lista;
begin
  new(aux);
  aux^.num := v;  
  aux^.sig := L;
  L := aux;
end;
procedure maxi (l : lista ; var maximo : integer);
begin
 maximo := -999;
  while (l <> nil) do begin
	 if (l^.num > maximo) then 
	  maximo := l^.num;
	l := l^.sig;
  end;
end;
procedure minimo (l : lista ; var min: integer);
begin
 min := 9999;
 while (l <> nil) do begin
	 if (l^.num < min) then 
	  min := l^.num;
	 l := l^.sig;
 end;
end;
procedure multiplo (l : lista ; a : integer ; var cantMultiplos : integer);
begin
 cantMultiplos := 0;
  writeln ('Ingrese un numero a ');
  readln (a);
 while (l <> nil) do begin
 if (l^.num mod a = 0) then 
  cantMultiplos += 1;
  l := l^.sig;
 end;
end; 
var
  min , max , cantMul : integer;
  pri : lista;
  valor ,a: integer;
begin
    
  pri := nil;
  writeln('Ingrese un numero');
  read(valor);
while (valor <> 0) do begin
  armarNodo(pri, valor);
  writeln('Ingrese un numero');
  read(valor);
  end;
    maxi (pri,max);
    minimo (pri,min);
    multiplo (pri,a,cantMul);
    writeln ('El maximo es ',max);
    writeln ('El minimo es ',min);
    writeln ('La cantidad de multiplos es ',cantMul);
end.
