program analisa_ekpresi_aljabar;
{ versi sabtu }
uses crt;
var ekspresi : string;
    batas_kiri,batas_kanan,proses,sekarang,i,j,jumlah_tanda,panjang : byte;
    tanda,karakter : array[1..255] of string[1];
    str_temp,suku_kiri,suku_kanan: string[2];
    prioritas : array[1..255] of byte;
    cari_prioritas, selesai : boolean;
    substitusi : string[6];
    jumlah_tanda_asli,nilai: byte;
    kode_error : integer;

begin
   clrscr;
   ekspresi := 'c/d*e/f^g';
   ekspresi := 'a-b+c/d*e/f^g-h*j';
   panjang  := length(ekspresi);
   jumlah_tanda := 0;
   proses := 0;

{
  proses mencari jumlah operator dan operator apa saja
  yang ada beserta tingkatnya                           }

   for i:=1 to panjang do
       begin
          karakter[i] := copy(ekspresi,i,1);
          if (karakter[i]='-') or (karakter[i]='+') then
             begin
                inc(jumlah_tanda);
                prioritas[jumlah_tanda] := 1;
                tanda[jumlah_tanda] := karakter[i];
             end
          else
             if (karakter[i]='/') or (karakter[i]='*') then
                begin
                   inc(jumlah_tanda);
                   prioritas[jumlah_tanda] := 2;
                   tanda[jumlah_tanda] := karakter[i];
                end
             else
               if (karakter[i]='^') then
                begin
                   inc(jumlah_tanda);
                   prioritas[jumlah_tanda] := 3;
                   tanda[jumlah_tanda] := karakter[i];
                end;
       end;
       jumlah_tanda_asli := jumlah_tanda;

       { mencari operator mana yang akan dikerjakan terlebih dahulu }
       cari_prioritas := false;
       repeat
          sekarang := 1;
          for i:=1 to jumlah_tanda do
             begin
                if prioritas[sekarang+1]>prioritas[sekarang] then
                   sekarang := sekarang+1
                else
                   cari_prioritas:=true;
             end;
       until cari_prioritas;
       selesai := false;
repeat
       inc(proses);
       writeln('ekspresi : ',ekspresi);
       write('tanda ke : ',sekarang,' yang mau dikerjakan ');
       textcolor(yellow+blink);writeln(tanda[sekarang]);
       textcolor(white);
       batas_kiri  := 2*sekarang-1;
       batas_kanan := 2*sekarang+1;
       writeln('batas kiri : ',batas_kiri,' batas kanan : ',batas_kanan);
       writeln('karakter batas kiri : ',karakter[batas_kiri],' ',
               'karakter batas kanan : ',karakter[batas_kanan]);
       suku_kiri  := karakter[batas_kiri];
       { kalau suku kiri=1 ini artinya x1,
         kalau suku kiri=2 ini artinya x2, dan seterusnya }
       val(suku_kiri,nilai,kode_error);
       if (nilai>0) then suku_kiri:='x'+suku_kiri;

       suku_kanan := karakter[batas_kanan];
       val(suku_kanan,nilai,kode_error);
       if (nilai>0) then suku_kanan:='x'+suku_kanan;

       substitusi := suku_kiri+tanda[sekarang]+suku_kanan;

       str(proses,str_temp);
           writeln('--------- substitusi x',str_temp,'=',
                   substitusi,' -----------');
       ekspresi := '';
       for i:=1 to batas_kiri-1 do ekspresi:=ekspresi+karakter[i];
       ekspresi := ekspresi + str_temp;
       for i:=batas_kanan+1 to panjang do ekspresi:=ekspresi+karakter[i];
       writeln('ekspresi baru setelah direduksi : ',ekspresi);

{ proses seperti di awal kembali }
{
  proses mencari jumlah operator dan operator apa saja
  yang ada beserta tingkatnya                           }
   panjang  := length(ekspresi);
   jumlah_tanda := 0;

   for i:=1 to panjang do
       begin
          karakter[i] := copy(ekspresi,i,1);
          if (karakter[i]='-') or (karakter[i]='+') then
             begin
                inc(jumlah_tanda);
                prioritas[jumlah_tanda] := 1;
                tanda[jumlah_tanda] := karakter[i];
             end
          else
             if (karakter[i]='/') or (karakter[i]='*') then
                begin
                   inc(jumlah_tanda);
                   prioritas[jumlah_tanda] := 2;
                   tanda[jumlah_tanda] := karakter[i];
                end
             else
               if (karakter[i]='^') then
                begin
                   inc(jumlah_tanda);
                   prioritas[jumlah_tanda] := 3;
                   tanda[jumlah_tanda] := karakter[i];
                end;
       end;

       { mencari operator mana yang akan dikerjakan terlebih dahulu }
       cari_prioritas := false;
       writeln('jumlah tanda ',jumlah_tanda);
       repeat
          sekarang := 1;
          for i:=1 to jumlah_tanda do
             begin
                if prioritas[sekarang+1]>prioritas[sekarang] then
                   sekarang := sekarang+1
                else
                   cari_prioritas:=true;
             end;
             if jumlah_tanda=1 then cari_prioritas:=true;
       until cari_prioritas;
       selesai := false;
       if jumlah_tanda=1 then
          begin
              str(jumlah_tanda_asli,str_temp);
              writeln('--------- x',str_temp,'=x',karakter[1],karakter[2],'x',karakter[3]);
              if jumlah_tanda=1 then selesai:=true;
          end;
       readln;
until selesai;
end.
