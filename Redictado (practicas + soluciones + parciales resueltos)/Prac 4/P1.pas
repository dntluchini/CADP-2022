1A) Toma los valores de 1 a 10.
1B) Toma los valores de 2 + el anterior a 10  (1+0,2+1,2+3,3+4,4+5,5+6,6+7,7+8,8+9,9+10)
1C) program sumador;
    type
    vnums = array [1..10] of integer;
     var
    numeros : vnums;
    i : integer;
    begin
       for i:=1 to 10 do {primer bloque for}
          numeros[i] := i;
       for i:= 1 to 9 do {segundo bloque for}
          numeros[i] := numeros[i] + numeros [i+1]
    end.
1D)Se va a imprimir 1.
