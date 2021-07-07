program membalik_deretan_karakter;
uses crt;
var i,jumlah  : integer;
    file_data : text;
    karakter  : char;
    data_asal : array[1..1000] of char;
begin
   clrscr;
   jumlah := 0;
   assign(file_data,'data.txt');
   reset(file_data);
   writeln('data reverse');
   writeln('--------------------------------------------------');
   while not eof (file_data) do
      begin
        jumlah := jumlah + 1;
        read(file_data,karakter);
        write(karakter);
        data_asal[jumlah] := karakter;
      end;
   close(file_data);
   writeln;
   writeln('--------------------------------------------------');
   writeln('hasil reverse');
   writeln('--------------------------------------------------');
   for i:= jumlah downto 1 do write(data_asal[i]);
   readln;
end.
