
program ejercicio5;
const dimF = 500;
type
	rangoDia = 1..31;           
	rangoMes = 1..12;
    
	rangoMonotributo = 'A'..'F';
	rangoCiudad = 1..2400;
	
	fecha = record
		dia: rangoDia;
		mes: rangoMes;
		anio: integer;
		end;
	cliente = record
		fechaContrato: fecha;
		categoria: rangoMonotributo;
		codigo: rangoCiudad;
		salario: real;
		end;
        
	vectorClientes = array[1..dimF] of cliente;

    {contadores}
    vectorCat = array[rangoMonotributo] of integer;
    vectorCiudad = array[rangoCiudad] of integer;  
{modulos}

procedure leerFecha(var f: fecha);
begin
	write('Ingrese el dia: ');
	readln(f.dia);
	write('Ingrese el mes: ');
	readln(f.mes);
	write('Ingrese el anio: ');
	readln(f.anio);
end;
///////////////////////////////////
procedure leerCliente(var c: cliente);
var f:fecha;
begin
	leerFecha(f);
	c.fechaContrato:= f;
	write('Ingrese la categoria del cliente: ');
	readln(c.categoria);
	write('Ingrese el codigo de la ciudad: ');
	readln(c.codigo);
  write('Ingrese el salario mensual: ');
	readln(c.salario);
end;
///////////////////////////////////
procedure imprimirCliente(c: cliente);
begin
	writeln('La fecha del cliente es: ', c.fechaContrato.dia, '/',c.fechaContrato.mes,'/',c.fechaContrato.anio);
	writeln('Su categoria es: ',c.categoria);
	writeln('El codigo de su ciudad es: ', c.codigo);
	writeln('Su salario mensual es: ', c.salario:2:2);
	writeln();
end;
///////////////////////////////////
procedure cargarVector(var v: vectorClientes; var dimL: integer; var salarioTotal: real);
var i: integer;
begin
	for i:=1 to dimF do begin
		leerCliente(v[i]);
        salarioTotal += v[i].salario;
		dimL := dimL + 1;
	end;
end;
///////////////////////////////////
procedure cantClientesSuperanPromedio(v:vectorClientes; dimL:integer; var cantClientes: integer; salarioTotal: real);
var promedio: real;
    i: integer;
begin
    promedio := salarioTotal/dimL;
    for i:= 1 to dimL do begin
        if (v[i].salario > promedio) then
            cantClientes += 1;
    end;
end;
var
///////////////////////////////////
procedure imprimirVector(v: vectorClientes; dimL: integer);
var i: integer;
begin
	for i:=1 to dimF do begin
		writeln(i, ':');
		imprimirCliente(v[i]);
		writeln();
	end;
end;
///////////////////////////////////
procedure cantContrato2(v: vectorClientes; dimL: integer; var maximoAnio: integer);
var mesAUX: rangoMes;
    anioAUX, i, contadorMeses, contadorAnios: integer;
begin
    anioAUX:= v[1].fechaContrato.anio; //Cargamos el año y el mes por primera vez antes de entrar al for
    mesAUX:= v[1].fechaContrato.mes;
    contadorMeses:=0;
    contadorAnios:=0;
    i:=1;
    maximoAnio:=-1;
    while i<=dimL do
    begin
        writeln('entre al mientras de afuera');
        readln;
        anioAUX:= v[i].fechaContrato.anio;
        mesAUX:= v[i].fechaContrato.mes;
        contadorMeses:=0;
        contadorAnios:=0;
            while (anioAUX = v[i].fechaContrato.anio) do 
            begin
                mesAUX:= v[i].fechaContrato.mes;
                contadorMeses:=0;
                while (mesAUX = v[i].fechaContrato.mes) do
                begin
                    contadorMeses:=contadorMeses+1;
                    contadorAnios := contadorAnios + 1;
                    i:=i+1;
                end;
                writeln('La cantidad de contratos firmados en el mes ', mesAUX, ' de ',contadorAnios,' es ', contadorMeses);
            end;
            if (anioAUX > maximoAnio) then
                maximoAnio := anioAUX; 
            writeln('La cantidad de contratos del anio ', anioAUX, ' es ', contadorAnios);
    end;
end;
///////////////////////////////////
procedure inicializarVectorCat(var c: vectorCat);
var j: char;
begin
    for j:='A' to 'F' do
        c[j]:=0;
end;
///////////////////////////////////
procedure cantClientesPorCategoria(v: vectorClientes; dimL: integer; var c: vectorCat);
var
 i: integer;
 j: char;
begin
    inicializarVectorCat(c);
    for i:=1 to dimL do begin
        for j:='A' to 'F' do begin
            if (v[i].categoria = j) then
                c[j] := c[j] + 1;
                //c[j] += 1;
        end;
    end;
end;
///////////////////////////////////
procedure informarClientesPorCategoria(c: vectorCat);
var j: char;
begin
    for j:='A' to 'F' do
        writeln('Categoria ', j,': ', c[j]);
end;
////////////////////////////////////
procedure inicializarVectorCiudad(var a: vectorCiudad);
var j: integer;
begin
    for j:=1 to 2400 do
        a[j]:=0;
end;
///////////////////////////////////
procedure cargarVectorCiudad(v: vectorClientes; dimL: integer; var a: vectorCiudad);
var
    i: integer;
    j: integer;
begin
    inicializarVectorCiudad(a);
    for i:=1 to dimL do begin
        for j:=1 to 2400 do begin
            if (v[i].codigo = j) then
                a[j] := a[j] + 1;
                //a[j] += 1;
        end;
    end;
end;
///////////////////////////////////
procedure ordenar(var a: vectorCiudad);
var
    temp, i, k: integer;
begin
    for i:=1 to 2400 - 1 do begin
        for k:=i+1 to 2400 do begin
            if a[i] < a[k] then begin
               temp:=a[i];
               a[i]:=a[k];
               a[k]:=temp;
            end;
        end;
    end;
end;
///////////////////////////////////
procedure informarClientesPorCiudad(a: vectorCiudad);
var j: integer;
begin
    for j:=1 to 10 do
        writeln('Ciudad ', j,': ', a[j]);
end;
///////////////////////////////////
{modulos}


{programa principal}
var
	v: vectorClientes;
    c: vectorCat;
    a: vectorCiudad;
	dimL, maximoAnio, cantClientes: integer;
    salarioTotal: real;
begin
    salarioTotal := 0;
    cantClientes := 0;
		cargarVector(v, dimL);
    cantContrato2(v, dimL, maximoAnio);
		{imprimirVector(v, dimL);}
		cantClientesPorCategoria(v, dimL, c);
    informarClientesPorCategoria(c);
    cargarVectorCiudad(v, dimL, a);
    ordenar(a);
    informarClientesPorCiudad(a);
    cantClientesSuperanPromedio (v, dimL, cantClientes, salarioTotal);
    writeln('El anio en que se firmo la mayor cantidad de contratos es :', maximoAnio);
    writeln('La cantidad de clientes que superan el salario promedio son :', cantClientes);
end.