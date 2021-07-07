program menghitung_pangkat_besar;

uses crt;
var i,a,b : double;
    hasil : double;
begin
  clrscr;
  writeln('Program Pangkat Besar');
  i := 1.0;
  a := 9;
  b := 9;
  hasil := 1;
  repeat
    hasil := (hasil*a);
    writeln(i:12:0,hasil:12:0);
    i := i + 1;
  until i>b;
  
end.

