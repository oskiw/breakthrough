unit Inteligencja;

interface
  Uses Glowny, Dialogs;
  function najlepszyRuch (t: Tablica; kolor: longint): Ruch;


implementation

type
  // uzywany do oceny planszy; i, j, k -- sluza do
  // zapamietania najlepszego ruchu
  Wynik = record
    ocena, i, j, k: longint;
  end;  

// mowi czy dane wspolrzedne mieszcza sie w tablicy  
function ok (a, b: longint): boolean;
begin ok := (a >= 0) and (a < 8) and (b >= 0) and (b < 8); end;


function min (a, b: longint): longint;
begin if a < b then min := a else min := b; end;


// zwraca ocene (liczbowa) danego ukladu pionkow na planszy,
// z punktu widzenia gracza 'kolor' 
function ocenPlansze (t: Tablica; kolor: longint): longint;
var k, i, j, temp, pts: longint;
begin

  temp := 0;

  for i := 0 to 7 do
    for j := 0 to 7 do
      if t [i, j] = kolor then begin
        if kolor = Bialy then k := 8 - i else k := i + 1;
        pts := (1 shl (2 * k - 2)) * min (j + 1, 8 - j);

       if ((ok (i, j - 1)) and (t [i - kierunek (kolor), j - 1] <> kolor))
         and ((ok (i, j + 1)) and (t [i - kierunek (kolor), j + 1] <> kolor)) then

       if (ok (i + kierunek (kolor), j + 1) and (t [i + kierunek (kolor), j + 1] = 1 - kolor)) or
         (ok (i + kierunek (kolor), j - 1) and (t [i + kierunek (kolor), j - 1] = 1 - kolor)) then
            pts := - pts else
              if k > 4 then pts := pts div 4;
        temp := temp + pts;
      end;

  if kolor = Czarny then j := 7 else j := 0;

  for i := 0 to 7 do
    if t [j, i] = kolor then temp := INF;

  ocenPlansze := temp;
end;


// ocenia dana sytuacje na planszy przez rekurencyjne przejrzenie
// drzewa gry, zaglebia sie do glebokosci 'ruchy'
// 'gracz' -- kolor gracza, dla ktorego wykonywana jest ocena
// 'ktoTeraz' -- kolor gracza, na ktorego poziomie jestesmy w tej chwili
function ocena (t: Tablica; gracz, ktoTeraz, ruchy: longint): Wynik;
var t2: Tablica; temp: Wynik; i, j, k: longint;
begin

  if ruchy = 0 then begin   // policz ocene dla tego ukladu pionkow
    temp.ocena := ocenPlansze (t, gracz) - ocenPlansze (t, 1 - gracz);
    ocena := temp; exit;
  end;

  // minimax

  t2 := t;
  if ktoTeraz = gracz then temp.ocena := -INF else
    temp.ocena := INF;

  for i := 0 to 7 do
    for j := 0 to 7 do
      if t [i, j] = ktoTeraz then begin

        for k := -1 to 1 do
          if (ok (i + kierunek (ktoTeraz), j + k)) and ((t [i + kierunek (ktoTeraz), j + k] = Invalid)
            or ((t [i + kierunek (ktoTeraz), j + k] <> ktoTeraz) and (k <> 0))) then begin
              t2 [i, j] := Invalid;
              t2 [i + kierunek (ktoTeraz), j + k] := ktoTeraz;

              if i + kierunek (ktoTeraz) in [0, 7] then begin
                if (ktoTeraz = gracz) then temp.ocena := INF else
                  temp.ocena := -INF;
                temp.i := i; temp.j := j; temp.k := k;
                ocena := temp; exit;
              end;

              if ((ocena (t2, gracz, 1 - ktoTeraz, ruchy - 1).ocena <= temp.ocena) and (ktoTeraz <> gracz)) or
                ((ocena (t2, gracz, 1 - ktoTeraz, ruchy - 1).ocena >= temp.ocena) and (ktoTeraz = gracz)) then begin
                temp.ocena := ocena (t2, gracz, 1 - ktoTeraz, ruchy - 1).ocena;
                temp.i := i; temp.j := j; temp.k := k;
              end;

              t2 [i, j] := t [i, j];
              t2 [i + kierunek (ktoTeraz), j + k] := t [i + kierunek (ktoTeraz), j + k];

            end;

      end;

  ocena := temp;
end;


// glowna funkcja, zwraca najlepszy ruch do wykonania w sytuacji
// opisanej w tablicy T, dla gracza oznaczonego 'kolor'
function najlepszyRuch (t: Tablica; kolor: longint): Ruch;
var best: Ruch; wyn: Wynik;
begin

  wyn := ocena (t, kolor, kolor, 3);
  with best do begin
    wx := wyn.i; wy := wyn.j;
    x := wyn.i + kierunek (kolor);
    y := wyn.j + wyn.k;
  end;
  
  najlepszyRuch := best;
end;


end.
