program p4;
type
  linea = record
  nro : integer;
  cantMinutosConsumidos : integer;
  cantMbConsumidos : integer;
 end;
 cliente = record
  cod : integer;
  cantLinea : integer;
  lineas : linea;
 end;


procedure leerLinea (var l : linea);
begin
 writeln ('Ingrese la cantidad de minutos consumidos');
 readln (l.cantMinutosConsumidos);
 writeln ('Ingrese la cantidad de MB consumidos');
 readln (l.cantMbConsumidos);
 writeln ('Ingrese el numero de linea');
 readln (l.nro);
end;

procedure procesarCliente (var c : cliente ; var totalMb , totalMinutos : real);
var
 i : integer;
 l : linea;
begin
 writeln ('Ingrese la cantidad de lineas a su nombre');
 readln (c.cantLinea);
 writeln ('Ingrese el numero del cliente');
 readln (c.cod);
  for i := 1 to c.cantLinea do begin 
   leerLinea (l);
  totalMb := l.cantMbConsumidos * 1.35;
  totalMinutos := l.cantMinutosConsumidos * 3.40;
 end;
end;

var 
 total,mb,min : real;
 c : cliente;
 i : integer;
begin
mb := 0; min := 0; total := 0;
 for i := 1 to 3 do begin
  procesarCliente (c,mb,min);
   total := mb+min;
    writeln ('El total a pagar es ',total:0:2);
 end;
end.