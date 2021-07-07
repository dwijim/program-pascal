{ -----------------------------------------------------
  program untuk mencetak bilangan prima sebanyak n buah
  dan merupakan bilangan prima ke-i dari deretan 
  bilangan prima
  dibuat dengan bahasa pascal
  diproses dengan sistem operasiGNU Linux Ubuntu
  compiler free pascal 
  dwi sakethi http://dwijim.staff.unila.ac.id
  
  nama file : prima-k.pas
  ----------------------------------------------------- }

uses crt;
{ karena ada perintah cetak ke layar }

var banyaknya_bilangan : byte;
    bilangan_prima_ke  : array[1..100] of byte;
    bilangan_prima     : longint;
    ketemu_prima       : longint;

{ prosedur mencetak identitas pembuat program }
procedure identitas_pembuat;
begin
  textcolor(yellow+blink);
  gotoxy(1,24);write('dwi sakethi http://dwijim.staff.unila.ac.id');
  textcolor(white);
end;

{ memasukkan data banyaknya bilangan prima yang dicari
  dan urutan masing-masing bilangan prima }
procedure masukan_data;
var bilangan_ke : byte;
begin
 gotoxy(1,1);write('Berapa banyak bilangan prima :');
 readln(banyaknya_bilangan);
 for bilangan_ke:=1 to banyaknya_bilangan do
 begin
   write('Bilangan prima ke : ');
   readln(bilangan_prima_ke[bilangan_ke]);
 end;
end;

{ mencek apakah suatu bilangan termasuk bilangan prima atau bukan}
function cek_prima_apa_bukan(bilangan_ini:longint):boolean;
var bilangan_sekarang : longint;
begin
  cek_prima_apa_bukan:=TRUE;
  for bilangan_sekarang:=2 to bilangan_ini-1 do
    begin
      if (bilangan_ini mod bilangan_sekarang)=0 then 
         begin
           cek_prima_apa_bukan:=FALSE;
           exit;
         end;
    end;
end;

{ ---------- program utama ----------- }
{ mencetak bilangan prima }
procedure mencetak_hasil;
var bilangan_ke : byte;
    urutan      : byte;
begin
 for bilangan_ke:=1 to banyaknya_bilangan do
 begin
   write('Bilangan prima ke : ',bilangan_prima_ke[bilangan_ke],' adalah : ');
   urutan := 0;
   bilangan_prima := 2;
   repeat
     if cek_prima_apa_bukan(bilangan_prima)=TRUE then
        begin
           inc(urutan); 
           ketemu_prima := bilangan_prima;
           { jika suatu bilangan termasuk bilangan prima maka
             urutan bertambah yang tadinya 0 menjadi 1 dst
             kemudian ditandai juga bahwa bilangan itu adalah 
             bilangan prima }
        end;
     inc(bilangan_prima);
   until urutan=bilangan_prima_ke[bilangan_ke];
   writeln(ketemu_prima);
 end;
end;

begin
  clrscr;
  identitas_pembuat;
  masukan_data;
  mencetak_hasil;
  writeln;
end.

