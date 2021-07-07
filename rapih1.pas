program merapikan_program;
uses crt;
var jumlah_begin : integer;
     pasangan     : array[1..5000] of integer;
                    { pasangan begin dan end, maksimal 5000 pasang }
     f1,f2        : text;
     baris        : string;

begin
   assign(f1,'rapih.in');
   reset(f1);
   assign(f2,'rapih.out');
   rewrite(f2);
   while not eof(f1) do
      begin
         readln(f1,baris);

         write(f2,baris);
      end;
   close(f1);
   close(f2);
end.
