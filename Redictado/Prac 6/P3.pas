A) procedure agregarAtras (var L: lista; v: integer);
var
aux , nuevo: lista;
begin
new(nuevo);
nuevo^.num := v;
nuevo^.sig := nil;
if (l = nil) then // Lista vacia 
	 l := nuevo
else begin
 aux := l;
  while (aux^.sig <> nil) do // Llego hasta el ultimo elemento
   aux := aux^.sig;
   aux^.sig := nuevo;
  end;
end;

B) procedure agregarAtras2 (var pri,ult : lista; v : integer);
 nuevo : lista;
begin
 new(nuevo); nuevo^.num := v; nuevo^.sig := nil;
  if (pri = nil) then 
   pri := nuevo
  else
   ult^.sig := nuevo;
  ult := nuevo;
 end;

