program fgh;
uses Crt;
type
  TFunction = function(x: Real): Real;
// Функция, определяющая значение заданной кривой
function f(x: Real): Real;
begin
  Result := 2*x*x*x + x*x - 3*x + 8;
end;
// Процедура для вычисления значения определенного интеграла методом трапеций
procedure trap(a, b: Real; n: Integer; func: TFunction; var result, error: Real);
var
  h, x, sum: Real;
  i: Integer;
begin
  h := (b-a) / n; // шаг интегрирования
  sum := (func(a) + func(b)) / 2; // сумма значений функции в конечных точках
  x := a + h;
  for i := 1 to n-1 do
  begin
    sum := sum + func(x); // суммирование значений функции в промежуточных точках
    x := x + h;
  end;
  result := h * sum; // итоговое значение интеграла
  error := abs(result - (h / 2) * (func(a) + 2 * sum + func(b))); // оценка погрешности
end;
var
  a, b: Real;
  n: Integer;
  result, error: Real;
  ch: char;
  x, y: integer;
  color : Byte;
begin
  repeat
    ClrScr;
    writeln('1. Вычисление площади фигуры, ограниченной кривой');
    writeln('2. Выход');
    write('Выберите программу: '); 
    ch := ReadKey;
    case ch of
      '1':
      begin
        ClrScr;
        Textcolor(LightBlue);
        writeln('Введите нижнюю границу интегрирования: ');
        readln(a);
        Textcolor(LightBlue);
        writeln('Введите верхнюю границу интегрирования: ');
        readln(b);
        Textcolor(LightBlue);
        writeln('Введите количество разбиений: ');
        readln(n);
        trap(a, b, n, f, result, error);
        Textcolor(LightGreen);
        writeln('Площадь фигуры: ', result);
        Textcolor(LightGreen);
        writeln('Погрешность вычислений: ', error);
        readln;
      end;
      '2': halt;
    end;
  until ch = '2';
end.