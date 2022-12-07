program p12;
procedure CumpleA (c : char; var EsVocal : boolean);
begin
 if (c = 'a') or (c = 'e') or (c = 'i') or (c = 'o') or (c = 'u') then 
  EsVocal := true
 else
  EsVocal := false;
end;


procedure CumpleB (c : char; var EsConsonante : boolean);
begin
 if (c <> 'a') or (c <> 'e') or (c <> 'i') or (c <> 'o') or (c <> 'u') then 
  EsConsonante := true
 else
  EsConsonante := false;
end;


var
 c : char;
 ok : boolean;
begin
   repeat
    writeln ('Ingrese una secuencia de vocales');
     readln (c);
     CumpleA (c,ok);
   until (ok = false);
  writeln ('Se cumplio el primer patron');
  if c <> '$' then 
   writeln ('El patron $ no se cumplio');
  repeat 
     writeln ('Ingrese un caracter');
     readln (c);
  until (c = '$');
   if c = '$' then begin
    writeln ('El patron $ se cumplio');
    writeln ('Ingrese un caracter');
    readln (c);
    CumpleB (c,ok);
  end;
   if ok = false then 
    writeln ('No se cumplio el patron b');
    repeat
     writeln ('Ingrese un caracter');
     readln (c);
     CumpleB (c,ok);
    until (ok = true);
     if ok = true then begin
      writeln ('Se cumplio el patron b');
      writeln ('Ingrese un caracter');
      readln (c);
     end;
       if (c <> '#') then 
        writeln ('El patron # no se cumplio');
     repeat
      writeln ('Ingrese un caracter');
      readln (c);
     until (c = '#');
      writeln ('Se cumplio el patron #');
  end.