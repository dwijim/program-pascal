program mencari_multipaliandrom_pada_suatu_tulisan;
{ dikembangkan oleh dwi sakethi
                    dwijim@unila.ac.id
                    dwijim@gmail.com
		    0816 403 432
  pada tanggal 18 agustus 2006 }

uses crt;

var file_data,file_hasil : text;
    tulisan_selesai,tulisan_asli,potongan_tulisan,tulisan : string;
    selesai : boolean;
    jumlah_paliandrom,panjang_tulisan_tetap,paliandrom : byte;
    mulai_tulisan_baru,jumlah_looping,batas_kanan : byte;

{
  fungsi ini memberikan nilai 1 jika kata yang dicek berupa
  paliandrom, jika kata yg dicek bukan merupakan paliandrom
  maka fungsi ini memberikan nilai 0
}
function cek_paliandrom(tulisan_yg_dicek : string):byte;
var hasil                : byte;
    ii,panjang_tulisan_x : byte;
    hasil_reverse        : string;
begin
  hasil             := 0;
  hasil_reverse     := '';
  panjang_tulisan_x := length(tulisan_yg_dicek);
  for ii:=panjang_tulisan_x downto 1 do
      begin
        hasil_reverse := hasil_reverse + 
                         copy (tulisan_yg_dicek,ii,1);
      end;
  if tulisan_yg_dicek=hasil_reverse then
     hasil:=1;
  cek_paliandrom := hasil;
end;

{ --- program utama --- }
begin
   
   clrscr;
   { membuka file data }
   assign(file_data,'multipal.in');
   reset(file_data);

   { membaca data tulisan }
   read(file_data,tulisan);
   writeln('tulisan asal : ',tulisan);

   { membuat file hasil }
   assign(file_hasil,'multipal.out');
   rewrite(file_hasil);

   { proses pencarian paliandrom dilakukan sampai batas
     akhir tulisan }
   selesai               := false;
   batas_kanan           := length(tulisan);
   panjang_tulisan_tetap := length(tulisan);
   potongan_tulisan      := tulisan;
   tulisan_asli          := tulisan;
   tulisan_selesai       := '';
   jumlah_paliandrom     := 0;
   repeat
     paliandrom :=cek_paliandrom(potongan_tulisan);
     writeln('asal : ',potongan_tulisan, ' cek : ',paliandrom);
     if paliandrom=0 then
        begin
           batas_kanan := batas_kanan - 1;
           potongan_tulisan := copy(potongan_tulisan,1,batas_kanan);
        end
     else
        begin
           writeln('paliandrom : ',potongan_tulisan);
           tulisan_selesai := tulisan_selesai + potongan_tulisan;
           mulai_tulisan_baru := length(potongan_tulisan)+1;
           potongan_tulisan := copy(tulisan,mulai_tulisan_baru,panjang_tulisan_tetap-mulai_tulisan_baru+1);
           panjang_tulisan_tetap := length(potongan_tulisan);
           batas_kanan := length(potongan_tulisan);
           tulisan := potongan_tulisan;
           if tulisan<>'' then
              jumlah_paliandrom := jumlah_paliandrom + 1;
           readln;
        end;
     writeln('tulisan kontrol : ',tulisan_selesai);
     if tulisan_selesai=tulisan_asli then
        selesai := true;
   until selesai;

   writeln('jumlah paliandrom : ',jumlah_paliandrom);
   readln;

   { tulisan hasil ke file output }
   writeln(file_hasil,jumlah_paliandrom);
   { menutup kembali file yg telah diakses }
   close(file_hasil);
   close(file_data);
end.
