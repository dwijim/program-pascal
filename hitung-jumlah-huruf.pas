{ -----------------------------------------------------
  program untuk menghitung jumlah huruf dan jenisnya
  dibuat dengan bahasa pascal
  diproses dengan sistem operasiGNU Linux Ubuntu
  compiler free pascal 
  dwi sakethi http://dwijim.staff.unila.ac.id

  nama file : hitung-jumlah-huruf.pas

  ----------------------------------------------------- }

uses crt;
{ karena ada perintah cetak ke layar }

var kalimat : string;
    huruf_ke, huruf_ke_isi : byte;
    jumlah_huruf_ke : array[1..100] of byte;
    isi_huruf_ke    : array [1..100] of string;

{ prosedur mencetak identitas pembuat program }
procedure identitas_pembuat;
begin
  textcolor(yellow+blink);
  gotoxy(1,24);write('dwi sakethi http://dwijim.staff.unila.ac.id');
  textcolor(white);
end;

{ menentukan ke mana ular akan bergerak }
procedure masukan_kalimat;
begin
  gotoxy(1,1);write('masukan kalimatnya :');
  readln(kalimat);
end;

{ menentukan ke mana ular akan bergerak }
procedure hitung_huruf;
var panjang_kalimat : byte;
    huruf_sekarang : string;
    jumlah_huruf_yang_ada : byte;
    ada_huruf : boolean;
begin
  jumlah_huruf_yang_ada := 1;
  panjang_kalimat := length(kalimat);
  writeln('panjang kalimat : ',panjang_kalimat);
  for huruf_ke:=1 to panjang_kalimat do
    begin
      huruf_sekarang :=copy(kalimat,huruf_ke,1); 
      { dari kata atau kalimat diambil per huruf selain spasi}

      if huruf_sekarang <> ' ' then
       begin
         ada_huruf := false;
         for huruf_ke_isi:=1 to jumlah_huruf_yang_ada do
          begin
             if huruf_ke = 1 then 
                begin
                 { buat array yang berisi huruf-huruf yang ditemukan
                   sampai dengan proses ini,
                   untuk huruf pertama, pasti jadi elemen pertama }
                 isi_huruf_ke[1] := huruf_sekarang;
                 jumlah_huruf_ke[1] := 1;
                 ada_huruf := true; 
                end
             else
                begin
                 if isi_huruf_ke[huruf_ke_isi] = huruf_sekarang then
                    begin
                       inc(jumlah_huruf_ke[huruf_ke_isi]);
                       ada_huruf := true;
                    end;
                end
          end; { akhir looping for huruf_ke_isi }
            
          { jika huruf yang sedang diproses tidak ada di antara salah
            satu dari array huruf yang sudah ada maka
            ini berarti huruf baru dan jumlahnya pasti 1 }
          if (ada_huruf = false)  then
             begin
                inc(jumlah_huruf_yang_ada);
                isi_huruf_ke[jumlah_huruf_yang_ada]    := huruf_sekarang;
                jumlah_huruf_ke[jumlah_huruf_yang_ada] := 1;
             end; { akhir if ada_huruf = false }
       end; { akhir if huruf_sekarang }
    end; { akhir looping kalimat }

  for huruf_ke:=1 to jumlah_huruf_yang_ada do
    begin
      writeln(isi_huruf_ke[huruf_ke],' : ',jumlah_huruf_ke[huruf_ke]);
    end;
end;

{ ---------- program utama ----------- }
begin
  clrscr;
  identitas_pembuat;
  masukan_kalimat;
  hitung_huruf;
end.

