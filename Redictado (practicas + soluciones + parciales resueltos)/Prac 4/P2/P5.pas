program p5;
const 
 dimf = 2;
type
catMonotributo = 'A'..'F';
codOfi = 1..2400;
 fechas = record
  dia : integer;
  mes : integer;
  anio : integer;
 end;
 
 cliente = record
    fecha : fechas;
    monotributo : catMonotributo;
    ofi : codOfi;
    monto : real;
  end;
     
    vecClientes = array [1..dimf] of cliente; // Se dispone
   
    vecMonotributo = array [catMonotributo] of integer; // Cantidad de clientes para cada categoría de monotributo
    vecCiudades = array [codOfi] of integer; // Código de las 10 ciudades con mayor cantidad de clientes

 
 
procedure leerF (var f : fechas);
begin
 write ('Ingrese el dia ');
 readln (f.dia);
 write ('Ingrese el mes ');
 readln (f.mes);
 write ('Ingrese el anio ');
 readln (f.anio);
end;


procedure leerC (var c : cliente);
var
 f : fechas;
begin
 leerF (f);
 c.fecha := f;
 write ('Ingrese la categoria del monotributo ');
 readln (c.monotributo);
 write ('Ingrese el codigo de ciudad ');
 readln (c.ofi);
 write ('Ingrese el monto ');
 readln (c.monto);
end;


procedure cargarVecClientes (var vCli : vecClientes; var salarioTotal : real; var diml : integer);
var
 i : integer;
begin
 for i := 1 to dimf do begin
  leerC (vCli[i]);
  salarioTotal := salarioTotal + vCli[i].monto;
  diml := diml + 1;
 end;
end;



procedure clientesSuperan (vC : vecClientes ; diml : integer ; var cantSuperan : integer ; salarioTotal : real);
var
 promedio : real;
 i: integer;
begin 
 promedio := salarioTotal / dimf;
 for i := 1 to diml do begin
  if (vc[i].monto > promedio) then 
   cantSuperan += 1;
  end;
end;  

procedure contrato2 (vC : vecClientes ; diml : integer ; var anioMax : integer);
var
 mesAux,anioAux,i,contMes,contAnio : integer;
begin
contMes := 0; contAnio := 0;
i := 1;
 while (i <= diml) do begin
  anioAux := vC[i].fecha.anio;
  mesAux := vC[i].fecha.mes;
  contMes := 0; contAnio := 0;
  while (anioAux =vC[i].fecha.anio ) do begin // Comparar SIEMPRE 1ERO LA VARIABLE AUXILIAR CON EL CAMPO DEL VECTOR. 
   contMes := 0; mesAux := vC[i].fecha.mes; 
       while  (mesAux =vC[i].fecha.mes) do begin
        contMes := contMes + 1;
        contAnio := contAnio + 1;
        i := i+1;
       end;
       writeln ('La cantidad de contratos en el mes de ',mesAux, ' es ',contMes);
     end;
       if (contAnio > anioMax) then 
        anioMax := anioAux;
     writeln ('La cantidad de contratos del anio ',anioAux, ' es ',contAnio);
 end;
end;


procedure inicializarCat (var vM : vecMonotributo);
var
 i : char;
begin
 for i := 'A' to 'F' do 
  vM [i] := 0;
end;

procedure CantCategorias (vC : vecClientes; diml : integer; var vCat : vecMonotributo); //  Cantidad de clientes para cada categoría de monotributo
var
 i : integer;
 j : char;
begin
 for i := 1 to dimf do 
  for j := 'A' to 'F' do begin 
   if (vC[i].monotributo = j) then 
    vCat[j] := vCat[j] + 1;
  end;
end;

procedure inicializarCiudad (var vC : vecCiudades);
var
 i : integer;
begin
 for i := 1 to 2400 do begin
  vC [i] := 0;
 end;
end;


 

procedure cargarVecCiudades (vC : vecClientes; diml : integer ;var vCiu : vecCiudades); // Código de las 10 ciudades con mayor cantidad de clientes
var 
 i , j : integer;
begin
 for i := 1 to diml do begin
  for j := 1 to 2400 do begin 
   if (vC[i].ofi = j) then 
   vCiu [i] := vCiu [i] + 1;
  end;
 end;
end;



procedure ordenar(var a: vecCiudades);
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

procedure imprimirOrdenado (vCiu : vecCiudades);
var
 i : integer;
begin
 for i := 1 to 10 do  
 writeln ('La ciudad ',i, ' tiene ',vCiu[i], ' clientes ');
end;




procedure imprimirCat (vCategoria : vecMonotributo);
var
 i : char;
begin
 for i := 'A' to 'F' do 
  writeln ('La cantidad de clientes de la categoria ',i, ' es ',vCategoria[i]);
end;

var
 vC : vecClientes;
 dl,maxAnio,ClienteSupera : integer;
 vCiudad : vecCiudades;
 vCat : vecMonotributo;
 salarioTotal : real;
begin
 maxAnio := -1;

 cargarVecClientes (vC,salarioTotal,dl);
 contrato2 (vc,dl,maxAnio);
 inicializarCat (vCat);
 CantCategorias (vC,dl,vCat);
 imprimirCat (vCat);
 inicializarCiudad (vCiudad);
 cargarVecCiudades (vC,dl,vCiudad);
 ordenar (vCiudad);
 imprimirOrdenado (vCiudad);
 clientesSuperan (vC,dl,ClienteSupera,salarioTotal);
  writeln ('La cantidad de clientes que superan es ',ClienteSupera);
end.
   
   

    

