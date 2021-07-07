{
  program untuk mengkonversi bilangan desimal ke bilangan biner
  dan kemudian mencetak dalam bentuk biner secara BIG
  mulai dikembangkan 23 juli 2010.
  dwi sakethi http://dwijim.staff.unila.ac.id
              dwijim@unila.ac.id

}
program bilangan_biner;

uses crt;

{ proses untuk mencetak bilangan biner sesuai
  format dalam soal, yang berbeda di sini
  hanyalah ukuran dari tulisan 1 dan 0}
procedure simbol_biner(bil_biner:string);
const nol_baris_1  = ' - ';
      nol_baris_2  = '| |';
      nol_baris_3  = '| |';
      nol_baris_4  = ' - ';
      { ini adalah simbol 0 }

      satu_baris_1 = ' ';
      satu_baris_2 = '|';
      satu_baris_3 = '|';
      satu_baris_4 = ' ';
      { ini adalah simbol 1 }
      { dibuat konstanta dan sifatnya lokal karena
        barangkali bisa menghemat memori }

var simbol_1,simbol_2,simbol_3,simbol_4 : string;
    { hasil konversi berupa string terdiri dari 4 baris }

    digit_ke : byte;

begin
  simbol_1 := '';
  simbol_2 := '';
  simbol_3 := '';
  simbol_4 := '';
  { memproses dari digit pertama sampai digit terakhir }
  for digit_ke:=1 to length(bil_biner) do
      begin
        if copy(bil_biner,digit_ke,1)='0' then
           { jika pas di digit tersebut karakter 0 }
           begin
             simbol_1 := simbol_1 + nol_baris_1;
             simbol_2 := simbol_2 + nol_baris_2;
             simbol_3 := simbol_3 + nol_baris_3;
             simbol_4 := simbol_4 + nol_baris_4;
           end
        else
           { jika pas di digit tersebut karakter 1 }
           begin
             simbol_1 := simbol_1 + satu_baris_1;
             simbol_2 := simbol_2 + satu_baris_2;
             simbol_3 := simbol_3 + satu_baris_3;
             simbol_4 := simbol_4 + satu_baris_4;
           end;
        if digit_ke<>length(bil_biner) then
           begin
             simbol_1 := simbol_1 + ' ';
             simbol_2 := simbol_2 + ' ';
             simbol_3 := simbol_3 + ' ';
             simbol_4 := simbol_4 + ' ';
           end;
      end;
      writeln(simbol_1);
      writeln(simbol_2);
      writeln(simbol_3);
      writeln(simbol_4);
end;

function dua_pangkat_nn(bil:word):longint;
var pangkat_ke : word;
    hasil : longint;
begin
    if bil=0 then
       hasil := 1
    else
       begin
    hasil := 1;
    for pangkat_ke:=1 to bil do
      begin
        hasil:=(2*hasil);
        { writeln('cek : ',pangkat_ke,' - ',hasil); }
      end;
      end;
    dua_pangkat_nn:=hasil;
end;

{ fungsi untuk melakukan konversi dari bilangan desimal
  ke bilangan biner }
function desimal_ke_biner(bilangan_desimal:longint):string;
var dua_pangkat_n : byte;
    { untuk pangkat tertinggi yang mendekati, misal :
      9 >= 2 pangkat 4
      4 >= 2 pangkat 2
      18 >= 2 pangkat 5 }

    nilai_2_pangkat_n : longint;
    { nilai dari bilangan 2^n }

    digit_ke : byte;
    { digit dari bilangan biner }

    hasil : string;
    { isi dari bilngan biner }

    bil_desimal : longint;
    { bilangan desimal yang makin berkurang }

begin
   nilai_2_pangkat_n := 0;
   dua_pangkat_n := 1;
   repeat
     inc(dua_pangkat_n);
     nilai_2_pangkat_n := nilai_2_pangkat_n+dua_pangkat_nn(dua_pangkat_n);
     {
       writeln('cek : 2^',dua_pangkat_n,' = ',dua_pangkat_nn(dua_pangkat_n));
       }
   until nilai_2_pangkat_n>bilangan_desimal;
   dec(dua_pangkat_n);
   { writeln(bilangan_desimal,' - ',dua_pangkat_n); }

   hasil :='';
   bil_desimal := bilangan_desimal;

   for digit_ke:=dua_pangkat_n downto 0 do
     begin
        if dua_pangkat_nn(digit_ke)<=bil_desimal then
           begin
              hasil := hasil + '1';
              bil_desimal := bil_desimal - dua_pangkat_nn(digit_ke);
              { bilangan desimal makin berkurang sampai angka 1 }
           end
        else
           begin
              hasil := hasil + '0';
              { kalau 2^n tidak sampai berarti di digit ini nilainya 0 }
           end
     end;
     desimal_ke_biner := hasil;
     writeln(bilangan_desimal,' = ',hasil);
end;

{ program utama }
begin
   clrscr;
{   desimal_ke_biner(5); }
{
   dua_pangkat_nn(1);
   dua_pangkat_nn(10);
}
   simbol_biner(desimal_ke_biner(5));
   readln;
end.