uses crt;
var isi,potongan,potongan_next : string;
    i,j,tingkat,k    : integer;
    angka,kode        : integer;
    jum_c,kurung_ke        : integer;
    tingkat_kurung,jumlah_c,awal,akhir,nilai     : array [1..55] of integer;
begin
  clrscr;
  writeln('program mencari massa');
  isi     := '((CH)2(OH2H)(C(H))O)3';
  tingkat := 0;
  kurung_ke := 0;
  jum_c := 0;
  for i:=1 to 25 do
    begin
       nilai[i] := 0;
       awal[i]  := 0;
       akhir[i] := 0;
       tingkat_kurung[i] := 0;
    end;

  for i:=1 to length(isi)-1 do
    begin
       potongan := copy(isi,i,1);
       if (potongan='(') then 
          begin
             inc(tingkat);
             inc(kurung_ke);
             awal[kurung_ke] := i;
          end
       else
          if (potongan=')') then
             begin
                akhir[kurung_ke] := i;
                potongan_next := copy(isi,i+1,1);
                val(potongan_next,angka,kode);
                if (angka>1) then
                   begin
                     nilai[kurung_ke] := angka;
                   end;
                tingkat_kurung[kurung_ke] := tingkat;
 writeln('tingkat : ',tingkat_kurung[kurung_ke],' - ',awal[kurung_ke],'-',akhir[kurung_ke],' kali : ',nilai[kurung_ke]);
                dec(tingkat);
             end;
    end;
    for i:=1 to kurung_ke do
      begin
 writeln('tingkat : ',tingkat_kurung[i],' - ',awal[i],'-',akhir[i],' kali : ',nilai[i]);
      end;
    readln;
end.

