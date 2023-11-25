program fun;
var s1, s2, t: string;
  i, a, b, k: integer;
begin
  write('Введите строку: ');
  readln(s1);
  write('Введите подстроку: ');
  readln(s2);
  // нахождение первого и последнего вхождения //
  i:= 1;
  while (i<=length(s1)) and (length(s2)>0) do
  begin
    k:= 0;
    while ((i + k)<=length(s1)) and (k<length(s2)) and (s1[i+k] = s2[k+1]) do inc(k);
    if k=Length(s2) then
    begin
      if a=0 then a:= i
      else b:= i;
      inc(i, k);
    end
    else inc(i);
  end;
  // удаление подстрок из строки //
  t:= '';
  if a>0 then
  begin
    i:= 1;
    while i<=Length(s1) do
    begin
      if (i=a) or (i=b) then inc(i, Length(s2))
      else
      begin
        t:= t+s1[i];
        inc(i);
      end;
    end;  
    s1:= t;
  end;
  writeln('Результат:',s1);
end.