program funfrog;
var
arr: array [1..10] of integer; // массив
n, s, k, sum: integer; // длина массива, заданное число, минимальное k, сумма первых k элементов
begin
writeln('Введите длину массива: ');
readln(n);
writeln('Введите элементы массива: ');
for k := 1 to n do
read(arr[k]);
writeln('Введите заданное число: ');
readln(s);
k := 1; // начальное значение для k
sum := arr[k]; // начальное значение для суммы
while (sum <= s) and (k < n) do
begin
k := k + 1;
sum := sum + arr[k];
end;
writeln('Порядковый номер минимального k: ', k);
end.