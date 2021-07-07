uses crt;
var kimia : string;
    p : string;
    k,i,j,jumlah_kurung   : integer;
    panjang,tingkat : integer;
    jumlah_asal : integer;
    awal,akhir,tingkat_kurung : array[1..25] of integer;
    tingkat_kurung_akhir,kepakai : array[1..25] of integer;
begin
   kimia :='((CH)2(OH2H)(C(H))O)3';
   panjang := length(kimia);
   tingkat := 0;
   jumlah_kurung := 0;
   for i:=1 to panjang do 
     begin
       p := copy(kimia,i,1);
       if p='(' then
          begin
             inc(tingkat);
             inc(jumlah_kurung);
             awal[jumlah_kurung] := i;
             tingkat_kurung[jumlah_kurung] := tingkat;

akhir[jumlah_kurung] := 0;
          end
      else
        if p=')' then 
            begin
                tingkat_kurung_akhir[jumlah_kurung] := tingkat;
                akhir[jumlah_kurung] := i;
                dec(tingkat);
            end;
     end;

for i:=1 to jumlah_kurung do
writeln(awal[i],' - ',akhir[i]);
readln;
for i:=1 to panjang do kepakai[i]:=0;
for i:=1 to jumlah_kurung do
begin
    writeln(awal[i],'    -    ',panjang);
  for j:=awal[i] to panjang do
    begin
      p := copy(kimia,j,1);
      if (p=')') and (tingkat_kurung[i]=tingkat_kurung_akhir[i]) then
          begin
            if kepakai[j]=0 then
                begin
                   akhir[i] := j;
                   kepakai[i] := 1;
j := panjang;
                end;
          end;
    end;
end;
for i:=1 to jumlah_kurung do
  begin
    writeln(awal[i],'- ',akhir[i]);
  end;

readln;


    for i:=1 to jumlah_kurung-1 do
      for j:=i+1 to jumlah_kurung do
          begin
             if tingkat_kurung[j]>tingkat_kurung[i] then
                begin
                    k := tingkat_kurung[j];
                    tingkat_kurung[j] := tingkat_kurung[i];
                    tingkat_kurung[i] := k;
                    
                    k := awal[j];
                    awal[j] := awal[i];
                    awal[i] := k;
                    k := tingkat_kurung_akhir[j];
                    tingkat_kurung_akhir[j] := tingkat_kurung_akhir[i];
                    tingkat_kurung[i] := k;
                    
                end;
          end;  
{ mencari kurung tutup pasangannya }
     for i:=1 to jumlah_kurung do
         begin
             for j:=awal[i] to panjang do
                 begin
                    p := copy(kimia,j,1);
                    if (p=')') and (tingkat_kurung[i]=tingkat_kurung_akhir[i]) then
                          akhir[i] := j;
                 end;
   writeln(awal[i],' - ',tingkat_kurung[i],'-',tingkat_kurung_akhir[i]);
         end; 
     jumlah_asal := jumlah_kurung;
     jumlah_kurung := jumlah_asal;
     writeln('jumlah pasangan kurung : ',jumlah_kurung);
     for i:=1 to jumlah_kurung do
         begin
            writeln(' awal : ',awal[i],' akhir : ',akhir[i],' tingkat : ',tingkat_kurung[i]);
         end;
end.
