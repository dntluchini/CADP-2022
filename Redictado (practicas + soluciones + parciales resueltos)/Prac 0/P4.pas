
program Hello;
const
 pi = 3.1416;
var
 d : integer;
 radio,area,perimetro : real;
begin
 writeln ('Ingrese el perimetro');
 read (d);
 radio := d/2;
 area := pi * (radio*radio);
 perimetro := d*pi;
 writeln ('El area es : ',area:0:2);
 writeln ('El perimetro es : ',perimetro:0:2);
 writeln ('El radio es : ',radio:0:2);
end.