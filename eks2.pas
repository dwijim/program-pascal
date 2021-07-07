program mengevaluasi_ekspresi_aljabar;
uses crt;
var  ekspresi : string;
     jumlah_tanda,jumlah_suku,panjang : byte;
     i,suku_baru,j,reduksi,asli       : byte;
     asli_panjang,proses_ke           : byte;
     suku,hasil                       : array[1..255] of string;
     prioritas                        : array[1..255] of byte;
     karakter,string_temp             : string;
begin
  ekspresi := 'a+b+c-d+e-f';
  jumlah_tanda := 0;
  jumlah_suku  := 0;
  panjang := length(ekspresi);
  for i:=1 to panjang do
     begin
         karakter := copy(ekspresi,i,1);
         suku[i]  := copy(ekspresi,i,1);
         if (karakter='+')  or (karakter='-') then 
            begin
               jumlah_tanda := jumlah_tanda + 1;
               prioritas[i] := 3;
            end ; 
     end; 
     jumlah_suku := jumlah_tanda + 1;
writeln('Ekspresi asal : ',ekspresi);
  writeln('jumlah suku : ',jumlah_suku); 
  suku_baru := 0;
  asli := jumlah_suku;
  asli_panjang := panjang;
proses_ke := 0;
repeat
inc(proses_ke);
             suku_baru           := suku_baru + 1;
             str(suku_baru,string_temp);
             hasil[suku_baru]    := 'x'+string_temp+'='+suku[1]+suku[2]+suku[3];
             suku[1]             := 'x' + string_temp;
             for j:=2 to panjang do
               begin
                  suku[j]:=suku[j+2];
               end;
{ 
            for j:=1 to panjang do
               begin
                  writeln(suku[j]);
               end;
}
             writeln(hasil[suku_baru]);
 
      panjang := panjang - 1;
      jumlah_tanda := 0;
  for i:=1 to asli_panjang-suku_baru do
      begin
         if (suku[i]='+')  or (suku[i]='-') then 
            begin
               jumlah_tanda := jumlah_tanda + 1;
               prioritas[i] := 3;
            end ; 
      end; 
  
until jumlah_tanda < 1;
end.

