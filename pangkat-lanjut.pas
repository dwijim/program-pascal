program menghitung_pangkat_besar;

uses crt;
var i,a,b : double;
    hasil : double;
    juta  : double;
    satuan : double;
    asli : double;
begin
  clrscr;
  writeln('Program Pangkat Besar');
  i := 1.0;
  a :=234567892;
  b :=9999999;
  hasil := 1;
  asli := 1;
  repeat
    hasil := (hasil*a);
    asli := asli * a;
    while  (hasil>1000000) do 
       begin
          if (hasil>1000000) then
             juta := hasil / 1000000
          else if (hasil>10000000) then
             juta := hasil / 100000000
          else if (hasil>1000000000) then
             juta := hasil / 1000000000
          else if (hasil>10000000000) then
             juta := hasil / 10000000000
          else if (hasil>100000000000) then
             juta := hasil / 10000000000          { dst ditambahin sendiri }
          else if (hasil>100000000000) then
             juta := hasil / 100000000000;
          { ini karena dicetak nilai aslinya
            kalo cukup 6 digit terakhir, maka
            pengecekan cukup sampai 1 juta 
            dan tipe-tipe variabel juga bisa disesuaikan }


          satuan := int(juta);
          { writeln('     cek : ',juta:12:0,'- ',  satuan:2:0); }
          hasil := hasil - (satuan*1000000);
       end;
    writeln('iterasi : ',i:10:0,' asli : ',asli:102:0,' mod : ',hasil:12:0);
//      writeln('iterasi : ',i:10:0,' hasil : ',hasil:6:0);
    i := i + 1;
  until i>b;
  
end.

