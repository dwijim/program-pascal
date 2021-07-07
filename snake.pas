{ -----------------------------------------------------
  animasi cacing/ular 
  dibuat dengan bahasa pascal
  diproses dengan sistem operasiGNU Linux Ubuntu
  compiler free pascal 
  dwi sakethi http://dwijim.staff.unila.ac.id
  ----------------------------------------------------- }

uses crt;
{ karena ada perintah cetak ke layar }

var ular : array [1 .. 10] of string[1];
    bentuk,arah : byte;

{ prosedur mencetak identitas pembuat program }
procedure identitas_pembuat;
begin
  textcolor(yellow+blink);
  gotoxy(1,24);write('dwi sakethi http://dwijim.staff.unila.ac.id');
  textcolor(white);
end;

{ menentukan ke mana ular akan bergerak }
function arah_gerak:byte;
var bilangan_acak : byte;
begin

end;

{ ---------- program utama ----------- }
begin
  clrscr;
  identitas_pembuat;
end.

