program hello;
type 
 viajes = record
  nro : integer;
  codAuto : integer;
  direcOri : integer;
  direcDest : integer;
  kmsReco : real;
 end;
  lista =^nodo;
  nodo = record
   dato : viajes;
   sig : lista;
  end;
  
procedure leerV (var v : viajes); // Se dispone
procedure cargarL (var l : lista) // Se dispone
procedure insertarOrdenado (var l : lista; v : viajes); // Se dispone
var
 act,ant,nue : lista;
begin
   new (nue);
   nue^.dato := v;
   nue^.sig := nil;
   if (l = nil) then 
    l := nue
 else begin 
  ant := l;
  act := l;
   while (l <> nil) and (act^.dato.codAuto < nue^.dato.codAuto) do begin
    ant := act;
    act := act^.sig;
  end;
   if (ant = act) then begin 
    nue^.sig := l;
    l := nue;
  end
  else begin 
   ant^.sig := nue;
   nue^.sig := act;
   end;
 end;

procedure masKms (cod : integer;kms : real; var kmsM , kmsM2 : real; var codM,codM2 : integer);
 begin
  if (kms > kmsM ) then begin 
    codM2 := codM;
    kmsM2 := kmsM;
    codM := cod;
    kmsM := kms;
  end
  else 
   if (kms > kmsM2) then begin 
    codM2 := cod;
    kmsM2 := kms;
  end;
end;

procedure nuevaL (var l2 : lista ; l : lista);
begin
 if (l^.dato.kmsReco > 5) then 
  insertarOrdenado (l2,v);
end;  



procedure recorrerL (var l2 : lista;l : lista; var cod1,cod2 : integer);
var
 kmM,kmM2,kmsTot : real;
 auxAuto : integer;
begin
 kmM := -1;
 cod1 := 0;
 while ((l <> nil) do begin
  auxAuto := l^.dato.codAuto;
  kmsTot := 0;
   while ((l <> nil) and (l^.dato.codAuto = auxAuto)) do begin 
    kmsTot := kmsTot + l^.dato.kmsReco;
    nuevaL (l2,l);
    l := l^.sig;
  end;
   masKms (auxAuto,kmsTot,kmM,kmM2,cod1,cod2);
 end;
end;


var
 l2 , l : lista;
 cod1,cod2 : integer;
begin 
 l := nil;
 l2 := nil;
  cargarL (l); // Se dispone
  recorrerL (l2,l,cod1,cod2);
  writeln ('Los 2 codigos con mas kms recorridos son',cod1, ' y ',cod2);
end.
 
 