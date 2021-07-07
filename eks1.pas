program mengevaluasi_ekspresi_aljabar;
uses crt;
var  ekspresi : string;
     jumlah_tanda,jumlah_suku,panjang : byte;
     sekarang,i,suku_baru,j,reduksi,asli       : byte;
     asli_panjang,proses_ke,posisi    : byte;
     proses,ada                              : byte;
     suku,hasil                       : array[1..100] of string;
     prioritas                        : array[1..100] of byte;
     karakter,string_temp             : string;
     selesai_prioritas,selesai : boolean;
begin
  ekspresi := 'a-b+c-d-e-f-g-h-j';
  ekspresi := 'a-b+c/d';
  ekspresi := 'a-b+c/d*e/f^g-h*j';
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
               prioritas[jumlah_tanda] := 3;
            end  
         else 
            if (karakter='*')  or (karakter='/') then 
               begin
                  jumlah_tanda := jumlah_tanda + 1;
                  prioritas[jumlah_tanda] := 2;
               end  
         else 
            if (karakter='^') then 
               begin
                  jumlah_tanda := jumlah_tanda + 1;
                  prioritas[jumlah_tanda] := 1;
               end ; 
     end; 
     jumlah_suku := jumlah_tanda + 1;
     clrscr;
writeln('Ekspresi asal : ',ekspresi);
  writeln('jumlah suku : ',jumlah_suku);
  for i:=1 to jumlah_tanda do write(prioritas[i]);writeln;

  proses := 0;
  repeat
     inc(proses);
     { cari prioritas yang mau dikerjakan }
     sekarang := 1;
     selesai_prioritas := false;
     repeat
        if prioritas[sekarang+1]<prioritas[sekarang] then
           begin
             inc(sekarang);
           end
        else
           selesai_prioritas:=true;
     until selesai_prioritas;
     write('proses : ',proses,' tanda : ',sekarang);
     readln;
     str(proses,string_temp);
     hasil[proses] := 'x'+string_temp;
     writeln(hasil[proses]);
  until proses=jumlah_tanda;
  readln;


  suku_baru := 0;
  asli := jumlah_suku;
  asli_panjang := panjang;
proses_ke := 0;
repeat
             suku_baru           := suku_baru + 1;
             str(suku_baru,string_temp);
{
             ada := 0;
             for i:=1 to jumlah_tanda do
                 begin
                    if prioritas[i] = prioritas[i+1] then
                       begin
                         ada := 1;
                       end;
                 end;
}
             if (prioritas[1]<prioritas[2]) then posisi:=1 else posisi:=2;
  
             if (prioritas[suku_baru]>prioritas[suku_baru+1]) then
                 begin
                    hasil[suku_baru] := 'x'+string_temp+'='+suku[2*posisi-1]+suku[2*posisi]+suku[2*posisi+1];
                    suku[posisi]     := 'x' + string_temp;
                    prioritas[posisi]:= prioritas[suku_baru+1];
                 end 
             else 
                 begin
                    hasil[suku_baru] := 'x'+string_temp+'='+suku[1]+suku[2]+suku[3];
                    suku[1]          := 'x' + string_temp;
                 end;
             for j:=posisi to jumlah_tanda do
               begin
                  prioritas[j]:=prioritas[j+1];
               end;
             for j:=posisi to panjang do
               begin
                  suku[j]:=suku[j+2];
               end;
              for i:=1 to jumlah_tanda do write(prioritas[i],' ');writeln;
              for i:=1 to jumlah_suku do write(suku[i],' ');writeln;
             writeln(hasil[suku_baru]);
             readln;
      panjang := panjang - 1;
      jumlah_tanda := 0;
      for i:=1 to asli_panjang-suku_baru do
         begin
            if (suku[i]='+')  or (suku[i]='-') then 
               begin
                  jumlah_tanda := jumlah_tanda + 1;
                  prioritas[i] := 3;
               end
            else
            if (suku[i]='*')  or (suku[i]='/') then
               begin
                  jumlah_tanda := jumlah_tanda + 1;
                  prioritas[i] := 2;
               end
            else
            if (suku[i]='^')  then
               begin
                  jumlah_tanda := jumlah_tanda + 1;
                  prioritas[i] := 1;
               end;
         end;
  
until jumlah_tanda < 1;
end.

