program mengevaluasi_ekspresi_aljabar;
uses crt;
var i,panjang,jumlah_tanda : integer;
    suku_baru,awal_geser,j : integer;
    jumlah_tanda_asli      : integer;
    string_temp            : string;
    ekspresi,karakter      : string;
    tanda,hasil,kar        : array[1..256] of string;
    prioritas              : array[1..256] of byte;
begin
   clrscr;
   ekspresi := 'a-b+c/d*e/f^g-h*j';
   ekspresi := 'a-b+c-d-e+f-g-h+j';
   writeln('ekspresi asal : ',ekspresi);
   panjang := length(ekspresi);
   jumlah_tanda := 0;
   for i:=1 to panjang do
     begin
       karakter := copy(ekspresi,i,1);
       kar[i]   := karakter;
       if (karakter='-') or (karakter='+') or (karakter='/') or 
          (karakter='*') or (karakter='^') then
          begin
             jumlah_tanda := jumlah_tanda + 1;
             tanda[jumlah_tanda] := karakter;
             if (tanda[jumlah_tanda]='-') or (tanda[jumlah_tanda]='+') then
                prioritas[jumlah_tanda]:=3
             else
                if (tanda[jumlah_tanda]='/') or (tanda[jumlah_tanda]='*') then
                   prioritas[jumlah_tanda]:=2
                else
                   if (tanda[jumlah_tanda]='^') then
                      prioritas[jumlah_tanda]:=1;
          end;
     end;
   suku_baru := 0;
   jumlah_tanda_asli := jumlah_tanda;
   repeat                       
     begin
       if prioritas[i+1] < prioritas[i] then
          begin
{
             suku_baru  := suku_baru + 1;
             hasil[i]   := kar[2*i]+tanda[i]+kar[2*(2*i)+1];
             str(suku_baru,string_temp);
             kar[2*2*i+1]   := 'x'+string_temp;
             hasil[i]   := 'x'+string_temp+' = '+hasil[i];
             
             awal_geser := 6*i+1;
             for j:=awal_geser to jumlah_tanda do
                 begin
                    kar[j] := kar[j+2]; 
                 end;
             jumlah_tanda := jumlah_tanda - 1;
}
          end 
       else
          begin
              str(i,string_temp);
              hasil[i]   := 'x'+string_temp+'='+kar[2*i-1]+tanda[i]+kar[2*i+1];
              kar[i]     := 'x'+string_temp;
              awal_geser := (i+1)*2;;  
              for j:=i+1 to jumlah_tanda do
                 begin
                    kar[j] := kar[j+2]; 
                 end;
              jumlah_tanda := jumlah_tanda - 1;
          end; 
   until jumlah_tanda = 1;

   for i:=1 to jumlah_tanda_asli  do
     begin
       writeln(hasil[i]);
     end
end.

