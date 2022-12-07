program p6;
type
  RangoCodigo = 1..200;
var
 codmin1,codmin2,codigo : RangoCodigo;
 precio , min1 , min2: real;
 CantProduc,dig,i : integer;
 EsPar : boolean;
begin
	min1 := 9999; min2 := 9999; CantProduc := 0; 
	for i := 1 to 3 do begin 
	 writeln ('Ingrese el codigo del producto');
	 readln (codigo);
	 writeln ('Ingrese el precio del producto');
	 readln (precio);
	 if (precio < min1) then begin
	  codmin2 := codmin1;
	  codmin1 := codigo;
	  min2 := min1;
	  min1 := precio;
	  end 
	 else
	  if (precio < min2) then begin
	   codmin2 := codigo;
	   min2 := precio;
	  end;
	 if ((precio > 16) and ((codigo mod 2) = 0)) then
       CantProduc += 1;
    end;
     writeln ('Los productos mas baratos fueron ',codmin1, ' con el precio de ',min1:1:2, ' y ',codmin2, ' con el precio de ',min2:0:2);
     writeln ('La cantiad de productos con el valor de mas de 16 pesos codigo par fueron ',CantProduc);
end.
	  
