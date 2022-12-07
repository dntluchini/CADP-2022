A) function Esta (ve : VectorEnteros ;diml,n : integer) : boolean;
var
 pos : integer;
 ok : boolean;
begin
 pos := 1; ok := false;
  while (dimf > diml) and (pos < diml) and (not ok) do begin 
   if (ve[POS]) = n then 
    ok := true
  else
   ok := false;
  end;
 esta := ok;
end;


B) function Esta2 (ve : VectorEnteros ;diml,n : integer) : boolean;
var
 pri,ult,mid : integer;
 ok : boolean;
begin
ok := false; pri := 1; ult := diml; mid := (pri+ult) div 2;
  while (pri <= ult) and (n <> ve[mid]) do begin 
   if (n < ve[mid]) then 
    ult := mid - 1 // Si es mas chico q la mitad,corremos 1 pos para atras el vector
  else 
   pri := mid + 1; // Sino para adelante
   mid := (pri + ult) div 2;
  end;
 if (pri <= ult) and (n = ve[mid]) then 
  ok := true;
 Esta := ok;
end;

