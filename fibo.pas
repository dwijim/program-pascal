{ --------------------------------------------------
  program untuk menyelesaikan soal olimpiade tentang
  fibonacci.
  mulai ditulis 19 juli 2010 - dwi sakethi
  http://dwijim.staff.unila.ac.id
  dwijim@unila.ac.id - 0816 403 432
  nama file  : fibo.pas
  file data  : fibo.in (file data ini harus dibuat)
  file hasil : fibo.out
  -------------------------------------------------- }

program barisan_fibonacci;
{ awal program sebaiknya dimulai dengan program bla bla bla }

uses crt,dos;
{ unit yang digunakan sesuai perintah yang ada di program }

var file_data,file_hasil : text;
    { file_data untuk mengakses data pada file format text
      dan file_hasil untuk menyimpan hasil pengolahan
    }

    isi_data  : string;
    { isi file data dianggap bertipe string meski isinya integer
    ini disebabkan satu baris ada yang satu data ada yang
    data, jadi dianggap string kemudian dipotong-potong }

    data_ke : byte;
    { untuk menyimpan data 1, 2, 3 dst }

    jumlah_data : byte;
    { untuk menyimpan banyaknya data fibonacci yang akan dicek }

    kode_error : integer;
    { untuk menyimpan kode error konversi string ke numerik }

    bilangan_M : byte;
    { nilai data M yang jadi penentu data fibonacci }

    str_M : string;
    { nilai data sementara M, masih berupa string }

    bilangan_N : byte;
    { nilai data N yang jadi penentu data fibonacci }

    str_n : string;
    { nilai data sementara N, masih berupa string }

    panjang : byte;
    { panjang isi data karena dianggap string}

    posisi_spasi : byte;
    { pembatas antara nilai N dan M }

    suku_ke : integer;
    { suku ke untuk f(n) }

    jumlah_bilangan : integer;
    { jumlah f(1)+f(2)+ ... }

    hasil : integer;
    { hasil pembagian }
    hr1, min1, se1, se2 : word;
    { untuk menyimpan nilai-nilai waktu }


{ fungsi untuk membuat bilangan fibonacci }
function fibonacci(bilangan:integer):integer;
var suku_n : integer;
begin
   case bilangan of
    0 : fibonacci:=0;
    1 : fibonacci:=1;
   else
        fibonacci := fibonacci(bilangan-1)+fibonacci(bilangan-2);
{       bingung juga dengan rekursif,
        searching di internet, mendapatkan contoh fibonacci
}
   end;
end;

{ waktu mulai }
procedure StartClock;
begin
  GetTime (hr1,min1,se1,se2);
end;

{ waktu selesai }
procedure StopClock;
var
  siz : longint;
  hr2, min2, s1,s2  : word;
begin
  GetTime (hr2, min2, s1, s2);
  siz := (s2-se2)+(s1-se1)+(min2-min1)*60+(hr2-hr1)*60*60;
  writeln('waktu : ', siz ,' detik');
end;

begin
    clrscr;
    StartClock;

    assign(file_hasil,'fibo.out');
    { membuka file data bernama fibo.out }

    rewrite(file_hasil);
    { karena untuk ditulisi jadi rewrite }

    assign(file_data,'fibo.in');
    { membuka file data bernama fibo.in }

    reset(file_data);
    { karena akan membaca jadi reset }

    data_ke := 1;
    { awal data diisi dengan 1 }

    while not eof(file_data) do
    { membaca data dari awal sampai akhir }

      begin
          readln(file_data,isi_data);
{
          writeln(isi_data);
          }
          if (data_ke=1) then
             begin
                { isi data pertama dari file teks adalah
                  banyaknya data yang akan dicek,
                  setelah difikir-fikir, ini mungkin tidak
                  diproses juga tidak mengapa,
                  karena banyaknya data tidak dibutuhkan,
                  untuk menghemat memori}
                val(isi_data,jumlah_data,kode_error);
                { writeln(jumlah_data); }
             end
          else
             begin

                panjang := length(isi_data);
                { menghitung panjang string isi data }

                posisi_spasi := pos(' ',isi_data);
                { mencari pembatasnya ada di kolom berapa }

                str_n := copy(isi_data,1,posisi_spasi-1);
                val(str_n,bilangan_N,kode_error);
                { menentukan nilai N }

                str_m := copy(isi_data,posisi_spasi+1,panjang-posisi_spasi);
                val(str_n,bilangan_M,kode_error);
                { menentukan nilai M }
                { writeln(bilangan_n,' - ',bilangan_m); }

                jumlah_bilangan := 0;
                for suku_ke := 1 to bilangan_N do
                    jumlah_bilangan := jumlah_bilangan + fibonacci(suku_ke);
                    { menghitung jumlah dari f(x) }

                    jumlah_bilangan := jumlah_bilangan + 1;
                    { sesuai soal, jumlah terakhir ditambah 1 }

                hasil := jumlah_bilangan mod fibonacci(bilangan_M);
                { membagi antara jumlah bilangan fibonacci+1
                  dengan bilangan fibonacci ke M }
                if hasil=0 then
                   writeln(file_hasil,'Kasus #',data_ke-1,': habis dibagi')
                else
                   writeln(file_hasil,'Kasus #',data_ke-1,': tidak habis dibagi')
             end;
          inc(data_ke);
          { data_ke bertambah terus sesuai looping }
      end;

    close(file_data);
    { setelah selesai, file data ditutup lagi }

    close(file_hasil);
    { setelah selesai, file data ditutup lagi }

    StopClock;
{
writeln(fibonacci(bilangan_M),' - ',fibonacci(3));
}
{ untuk mencek apakah fibonaccinya sudah benar }
{
    for data_ke := 1 to 10 do
        write(fibonacci(data_ke),' ');
        }
        { jika hasil sudah benar, maka ini bisa di-remark saja }
    readln;
end.
