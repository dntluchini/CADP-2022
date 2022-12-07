type
 lista = ^nodo;
  cliente = record 
  dni : integer;
  num : integer;
 end;
 nodo = record 
  dato : cliente;
  sig : lista;
 end;
 

 


procedure agregarAtras (var pri,ult : lista; dni , cantClientes : integer);
var
 nuevo : lista;
begin
 new (nuevo); nuevo^.dato.dni := dni; nuevo^.dato.num := cantClientes; nuevo^.sig := nil;
 if (pri = nil) then begin // Lista vacia
  pri := nuevo;
  ult := nuevo;
 end
 else begin 
  ult^.sig := nuevo;
  ult := nuevo;
 end;
end;


procedure cargarLista (var pri : lista; var cantClientes : integer);
var
 ult : lista;
 c : cliente;
begin
 cantClientes := 0;
 write ('Ingrese el dni del cliente : ');
 readln (c.dni);
  while (c.dni <> 0) do begin 
   cantClientes += 1;
   agregarAtras (pri,ult,c.dni,cantClientes);
   write ('Ingres el dni del cliente : ');
   readln (c.dni);
  end;
end;



procedure ClienteAtendido (var l : lista; dniAtendido : integer ; var atendido : boolean);
var
 actual,ant : lista;
begin
 actual := l; atendido := false;
  while (actual <> nil) and (actual^.dato.dni <> dniAtendido) do begin 
   ant := actual;
   actual := actual^.sig;
  end;
 if (actual <> nil) then 
  if (actual = l) then 
   l := l^.sig
 else begin 
   ant^.sig := actual^.sig;
   dispose (actual);
   atendido := true;
  end;
end;
 
procedure AtenderCliente (var l: lista); 
var
 dniAtendido : integer;
 atendido : boolean;
begin 
 while (l <> nil) do begin 
  write ('Ingrese el dni del cliente : ');
  readln (dniAtendido);
   ClienteAtendido (l,dniAtendido,atendido);
    if (atendido) then writeln ('El cliente con el dni ',dniAtendido, ' fue atendido ')
  else 
   writeln ('No existe un cliente con el dni ',dniAtendido);
 end;
end;

var
 listaE : lista;
 totalC , i: integer;
begin 
 listaE := nil;
 cargarLista (listaE,totalC);
 for i := 1 to totalC do begin
  AtenderCliente (listaE);
 end;
end.
     
    
  
