uses crt;
var hasil_kurung_total,hasil_kurung,hasil_akhir,kimia : string;
    p1,p : string;
    massa,tingkatx,k,i,j,jumlah_kurung   : integer;
    akhir_sebelum,awal_sebelum,panjang,tingkat : integer;
    jumlah_asal,sekarang,kode_error : integer;
    awal,akhir,tingkat_kurung_awal,sudah_dihitung : array[1..25] of integer;
    pengali,kurung_punya,tingkat_kurung_akhir,kepakai : array[1..25] of integer;
    ada_kurung,selesai : boolean;
begin
   clrscr;
{ ----------------------------------------------------------
  silahkan ganti-ganti bentuk kimia sesuai yang dikehendaki
  ---------------------------------------------------------- }
   kimia :='CH(CO2H)3';
   kimia :='((CH)2(OH2H)(C(H))O)3';
   kimia :='C(O)2H';
   writeln('bentuk asal : ',kimia);
   hasil_akhir := '';
   panjang := length(kimia);
   tingkat := 0;
   jumlah_kurung := 0;
   for i:=1 to panjang do 
     begin
       p := copy(kimia,i,1);
       kepakai[i] := 0;
       sudah_dihitung[i] := 0;
       tingkat_kurung_akhir[i]:=0;
       tingkat_kurung_awal[i]:=0;
       if p='(' then
          begin
             inc(tingkat);
             inc(jumlah_kurung);
             awal[jumlah_kurung] := i;
             tingkat_kurung_awal[jumlah_kurung] := tingkat;
             akhir[jumlah_kurung] := 0;
             kurung_punya[i] := jumlah_kurung;
          end
      else
        if p=')' then 
            begin
                kurung_punya[i] :=0;
                tingkat_kurung_akhir[i] := tingkat_kurung_awal[jumlah_kurung];
                akhir[jumlah_kurung] := i;
                dec(tingkat);
            end;
     end;
{ mencari posisi kurung tutup }
     tingkatx := 0;
     jumlah_kurung := 0;
     for i:=1 to panjang do
         begin
           p := copy(kimia,i,1);
       if p='(' then
          begin
             inc(tingkatx);
             inc(jumlah_kurung);
          end
       else
           if p=')' then
              begin
                 for j:=i downto 1 do
                     begin
                        p1 := copy(kimia,j,1);
                        if p1='(' then
                           begin
                              if kepakai[j]=0 then
                                 begin
                                    akhir[kurung_punya[j]] :=i;
                                    kepakai[j] := 1;
                                    j := 1;
                                 end;
                           end;
                     end;
                  dec(tingkatx);
              end;
         end;
for i:=1 to jumlah_kurung do
    begin
       write('tingkat : ',tingkat_kurung_awal[i],
               ' mulai ',awal[i],' sampai ',akhir[i]);
       p:=copy(kimia,akhir[i]+1,1);   { mencari faktor pengali untuk }
       val(p,k,kode_error);           { masing-masing kurung         }
       if (k=0) then k:=1;
       pengali[i] :=k;
       writeln(' : ',pengali[i]);
    end;
for i:=1 to jumlah_kurung do kepakai[i]:=0;
{ kepakai di sini digunakan untuk menandai bahwa
  suatu karakter sudah dihitung }

selesai := false;
   hasil_kurung_total := '';
repeat
   sekarang := 0;
   for i:=1 to jumlah_kurung do
     begin
        if (tingkat_kurung_awal[i]>sekarang) and (kepakai[i]=0)
           then sekarang:=i;
           { akan memproses tingkat kurung tertinggi dan
             pada posisi itu memang belum diproses }

     end;
   write('kurung ke-',kurung_punya[awal[sekarang]],' ');
   write('tingkat ',tingkat_kurung_awal[sekarang],' : ');
          kepakai[sekarang]:=1;   { menandai bahwa posisi ini sudah
                                    diproses }
   hasil_kurung := '';
   for i:=awal[sekarang] to akhir[sekarang] do
       begin
          p := copy(kimia,i,1);
          if ((p='C') or (p='H') or (p='O')) and (sudah_dihitung[i]=0) then
             begin
                sudah_dihitung[i]:=1;
                p1 := copy(kimia,i+1,1);
                val(p1,k,kode_error);
                if (k>=2) then
                    for j:=1 to k do hasil_kurung:=hasil_kurung + p
                else
                    hasil_kurung := hasil_kurung + p;

             end;
       end;

       { mencari apakah di dalam kurung yang sekarang
         ada kurung lagi di dalamnya }
         ada_kurung := false;
            for i:=awal[sekarang]-1 downto 1 do
              begin
                 p:=copy(kimia,i,1);
                 if (p='(') then
                    begin
                       awal_sebelum  := awal[kurung_punya[i]];
                       akhir_sebelum := akhir[kurung_punya[i]];
                       if (awal_sebelum<awal[sekarang]) then
                          if (akhir_sebelum>akhir[sekarang]) then
                             begin
                                write('awal : ',awal_sebelum,' - ',awal[sekarang],' ');
                                write('ada di dalam kurung',' ');
                                ada_kurung := true;
                                i := 1;
                             end;
                    end;
              end;
       { hasil yang didapat, dikalikan dengan pengali untuk
         masing-masing kurung }
         k := pengali[kurung_punya[awal[sekarang]]];
         hasil_kurung_total := '';
         if (awal[sekarang]<>1) and (akhir[sekarang]<>panjang-1) then
            for i:=1 to k do
                begin
                  hasil_kurung_total:= hasil_kurung_total+ hasil_kurung;
                end
         else
                hasil_kurung_total:= hasil_kurung_total+ hasil_kurung;
         writeln('pengali : ',k);
         writeln('hasil kurung : ',hasil_kurung_total);
         hasil_akhir := hasil_akhir + hasil_kurung_total;
         writeln('hasil akhir dalam proses : ',hasil_akhir);
   sekarang := 0;

   { kalau semua posisi sudah diproses artinya kepakai[i]=1
     berarti proses selesai }
   selesai := true;
   for i:=1 to jumlah_kurung do
       if kepakai[i]=0 then
          begin
             selesai := false;
             i := jumlah_kurung;
          end;
until selesai;

panjang := length(kimia);

hasil_kurung_total := hasil_akhir;


if not ada_kurung then
   hasil_akhir := ''
else
   hasil_akhir := hasil_akhir;

{ untuk antisipasi bentuk khusus dimana
  kurung terakhir di kolom terakhir-1, tapi
  kurung awalnya di kolom 1 }
k := pengali[tingkat_kurung_awal[1]];
if (awal[1]=1) and (akhir[1]=panjang-1) then
   for i:=1 to k do hasil_akhir := hasil_akhir + hasil_kurung_total;

{ untuk antisipasi bentuk khusus dimana
  kurung terakhir di kolom terakhir-1, tapi
  kurung awalnya bukan di kolom 1 }

if (awal[1]<>1) and (akhir[1]=panjang-1) then
   for i:=1 to k do hasil_akhir := hasil_akhir + hasil_kurung_total;

{
  kalau-kalau ada yang belum dihitung,
  artinya nilai sudah_dihitung=0       }
for i:=1 to awal[1] do
    if sudah_dihitung[i]=0 then
       begin
         p := copy(kimia,i,1);
         if (p='C') or (p='H') or (p='O') then
            hasil_akhir := hasil_akhir + p;
       end;


for i:=1 to panjang do
    if sudah_dihitung[i]=0 then
       begin
         p := copy(kimia,i,1);
         if (p='C') or (p='H') or (p='O') then
            hasil_akhir := hasil_akhir + p;
         write(p,'-');

       end;

writeln('hasil akhirnya : ',hasil_akhir);
panjang := length(hasil_akhir);
massa := 0;
for i:=1 to panjang do
    begin
       p := copy(hasil_akhir,i,1);
       if p='H' then
          massa:=massa+1
       else
          if p='C' then
             massa:=massa+12
          else
             massa:=massa+16;
    end;
writeln('Massa : ',massa);
readln;
end.
