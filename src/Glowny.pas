unit Glowny;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Grids, DBCtrls, ComCtrls;

const
  Invalid = -1;
  Bialy = 0;
  Czarny = 1;
  Czlowiek = 0;
  Komp = 1;
  INF = maxlongint - 2;

type
  Tablica = array [0..7, 0..7] of longint;

  // ruch z pola (wx, wy) na pole (x, y)
  // jesli pole edycja jest <> 0 to wskazuje na numer edycji
  Ruch = record
    wx, wy, x, y, edycja: longint;
    bije: boolean;
  end;

  // zmiana [i, j] to wartosc o jaka w danej
  // edycji zmienilo sie pole i, j planszy
  Edycja = record
    zmiana: Tablica;
    zmianaRuchu: boolean;
  end;

  TForm1 = class (TForm)
    MainMenu1: TMainMenu;
    Gra1: TMenuItem;
    Wczytaj1: TMenuItem;
    Zapisz1: TMenuItem;
    Nowa1: TMenuItem;
    Wyjd1: TMenuItem;
    Edycja1: TMenuItem;
    EdytujPlansz1: TMenuItem;
    Pomoc1: TMenuItem;
    Plansza: TDrawGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LabelA: TLabel;
    LabelB: TLabel;
    LabelC: TLabel;
    LabelD: TLabel;
    LabelE: TLabel;
    LabelF: TLabel;
    LabelG: TLabel;
    LabelH: TLabel;
    RichEdit1: TRichEdit;
    OtwieraczPliku: TOpenDialog;
    ZapisywaczPliku: TSaveDialog;
    Cofnij1: TMenuItem;
    ZasadyGry1: TMenuItem;
    Jakgrac1: TMenuItem;
    Hint1: TMenuItem;
    procedure FormCreate (Sender: TObject);
    procedure PlanszaDrawCell (Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure PlanszaMouseUp (Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure Inicjuj (grBialy, grCzarny, pierwszy: longint);
    procedure Gramy;
    procedure wykonajRuch (wx1, wy1, x1, y1: longint);
    procedure CofnijRuch;
    procedure aMozeKomp;

    procedure Nowa1Click (Sender: TObject);
    procedure Zapisz1Click (Sender: TObject);
    procedure Wczytaj1Click (Sender: TObject);
    procedure Wyjd1Click (Sender: TObject);
    procedure EdytujPlansz1Click (Sender: TObject);
    procedure Cofnij1Click (Sender: TObject);
    procedure Hint1Click (Sender: TObject);
    procedure ZasadyGry1Click (Sender: TObject);
    procedure Jakgrac1Click (Sender: TObject);

  private
    { Private declarations }
    gracz: array [Bialy..Czarny] of Czlowiek..Komp;
    pierwszy: Bialy..Czarny;            // kto zaczyna
    wybrane, koniec: boolean;
    wx, wy: longint;                    // wspolrzedne wybranego pola
  public
    t: Tablica;                         // tu zapisuje pionki
    ktoTeraz, tura, ilEdycji: longint;
    edycje: array [1..100] of Edycja;   // tu kolejne edycje
    ruchy: array [1..3000] of Ruch;     // a tu kolejne ruchy
    { Public declarations }
  end;

  function kierunek (kolor: longint): longint;

var
  Form1: TForm1;
  
  
implementation
uses UnitNowaGra, EdycjaPlanszy, Inteligencja;
{$R *.dfm}

// ustawia plansze na pusta i blokuje niektore el-ty menu
procedure TForm1.FormCreate (Sender: TObject);
var i, j: longint;
begin

  Zapisz1.Enabled := false;
  Cofnij1.Enabled := false;
  EdytujPlansz1.Enabled := false;
  Hint1.Enabled := false;

  Form1.Show;
  RichEdit1.Text := '';
  for i := 0 to 7 do
   for j := 0 to 7 do
    t [i, j] := Invalid;

end;


procedure TForm1.Nowa1Click (Sender: TObject);
begin

  wybrane := false;
  NowaGra.Show;

end;


// argumenty procedury sa z zakresu Czlowiek..Komp
// ustawia pionki na planszy i odpala gre
procedure TForm1.Inicjuj (grBialy, grCzarny, pierwszy: longint);
var i, j: longint;
begin

  gracz [Bialy] := grBialy;
  gracz [Czarny] := grCzarny;
  Self.pierwszy := pierwszy;

  for i := 0 to 7 do begin
    for j := 0 to 1 do t [j, i] := Czarny;
    for j := 2 to 5 do t [j, i] := Invalid;
    for j := 6 to 7 do t [j, i] := Bialy;
  end;

  NowaGra.Close;
  ktoTeraz := pierwszy;
  RichEdit1.Text := 'Gramy';
  Gramy;

end;


// zwraca ilosc pionkow danego koloru w tablicy t
function ilosc (t: Tablica; kolor: longint): longint;
var i, j, k: longint;

begin
  k := 0;

  for i := 0 to 7 do
    for j := 0 to 7 do
      if t [i, j] = kolor then inc (k);

  ilosc := k;    
end;


// jezeli komp powinien sie ruszyc to sie rusza
procedure TForm1.aMozeKomp;
var best: Ruch; 
begin

  if gracz [ktoTeraz] = Komp then begin
    if (ilosc (t, ktoTeraz) = 0) then begin
      ktoTeraz := 1 - ktoTeraz;
      exit;
    end;

    best := najlepszyRuch (t, ktoTeraz);
    with best do wykonajRuch (wx, wy, x, y);
    exit;
  end;
end;


procedure TForm1.Gramy;
begin

  tura := 0; koniec := false;
  Hint1.Enabled := true;
  Zapisz1.Enabled := true;
  EdytujPlansz1.Enabled := true;
  Plansza.Repaint;

  aMozeKomp;
end;


// zwraca kierunek w ktorym powinny sie ruszac pionki
// danego koloru, przy oznaczeniach (0, 0) = lewy gorny rog
function kierunek (kolor: longint):longint;
begin

  if kolor = Bialy then kierunek := -1 else
    kierunek := 1;

end;


// wykonuje ruch (wx1, wy1) -> (x1, y1), zaklada
// ze dany ruch jest legalny i ze na (wx1, wy1)
// stoi pionek odpowiedniego gracza
procedure TForm1.wykonajRuch (wx1, wy1, x1, y1:longint);
var zn: char; s, kto: string; best: Ruch;
begin

  inc (tura);
  wybrane := false;
  Cofnij1.Enabled := true;
  if t [x1, y1] <> Invalid then zn := 'x'
    else zn := '-';

  with ruchy [tura] do begin
    wx := wx1; wy := wy1;
    x := x1;   y := y1;
    bije := zn = 'x';
    edycja := 0;
  end;

  if ktoTeraz = Bialy then kto := 'Bialy' else kto := 'Czarny';
  s:= IntToStr (tura) + ' ' + kto + ': ' + char (ord ('A') + wy1) +
    char (56 - wx1) + zn + char (ord ('A') + y1) + char (56 - x1);

  RichEdit1.Text := RichEdit1.Text + char (10) + s;
  RichEdit1.Repaint;       // update listy ruchow

  t [x1, y1] := t [wx1, wy1];
  t [wx1, wy1] := Invalid;

  if (((ktoTeraz = Bialy) and (x1 = 0)) or        // konczymy partie
    ((ktoTeraz = Czarny) and (x1 = 7))) then begin
      koniec := true;
      Plansza.Repaint;
      EdytujPlansz1.Enabled := false;
      Zapisz1.Enabled := false;
      Hint1.Enabled := false;

      if ktoTeraz = Bialy then ShowMessage ('Bialy wygrywa') else
        ShowMessage ('Czarny wygrywa');
  end;

  ktoTeraz := 1 - ktoTeraz;
  Plansza.Repaint;

  if not koniec then aMozeKomp;
end;


procedure TForm1.PlanszaDrawCell (Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);

var kolor : TColor;
begin

  case t [ARow, ACol] of
    Bialy : kolor := clWhite;
    Czarny : kolor := clBlack;
    else kolor := clScrollBar;
  end;

  if (wybrane) and (wx = ARow) and (wy = ACol) then
    kolor := clRed;

  Plansza.Canvas.Brush.Color := kolor;
  Plansza.Canvas.FillRect (Rect);
end;


// gdy kliknie na pole -- albo zaznaczam, albo juz robie ruch
procedure TForm1.PlanszaMouseUp  (Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var x1, y1: longint;
begin

  if koniec then exit;

  x1 := Plansza.Row;
  y1 := Plansza.Col;

  if t [x1, y1] = ktoTeraz then begin
    wybrane := true;
    wx := x1; wy := y1;
  end else

  if (wybrane) and (x1 - wx = kierunek (ktoTeraz)) and (abs (y1 - wy) < 2)
    and ((t [x1, y1] = Invalid) or (y1 <> wy)) then
      wykonajRuch (wx, wy, x1, y1);

  Plansza.Repaint;
end;


procedure TForm1.Zapisz1Click (Sender: TObject);
var zb: TextFile; i, j: longint;
begin 

  if ZapisywaczPliku.Execute then begin
    {$I-}
    AssignFile (zb, ZapisywaczPliku.Filename);
    rewrite (zb);
    {$I+}

    if IOResult <> 0 then begin
      ShowMessage ('Zapisanie do pliku ' + ZapisywaczPliku.FileName
        + ' nie powiodlo sie.'); exit;
    end;

    write (zb, char (50 + gracz [Bialy]));
    write (zb, char (50 + gracz [Czarny]));
    writeln (zb, char (50 + ktoTeraz));

    for i := 0 to 7 do
      for j := 0 to 7 do begin
        write (zb, char (50 + t [i, j]));
        if (j = 7) and (i <> 7) then writeln (zb);
      end;

    CloseFile (zb);
    RichEdit1.Text := RichEdit1.Text + char (10) + 'Pomyslnie zapisano do pliku '
      + ZapisywaczPliku.FileName;

  end;

end;


procedure TForm1.Wczytaj1Click (Sender: TObject);
var zb: TextFile; i, j: longint; ok: boolean;
    t2: Tablica; zn: char;
begin

  ok := true;

  if OtwieraczPliku.Execute then begin
    {$I-}
    AssignFile (zb, OtwieraczPliku.FileName);
    reset (zb);

    read (zb, zn); gracz [Bialy] := ord (zn) - 50;
    read (zb, zn); gracz [Czarny] := ord (zn) - 50;
    readln (zb, zn); ktoTeraz := ord (zn) - 50;

    for i := 0 to 7 do
      for j := 0 to 7 do begin
        if eof (zb) then begin ok := false; break; end;
        read (zb, zn);
        t2 [i, j] := ord (zn) - 50;
        if abs (t2 [i, j]) > 1 then ok := false;
        if j = 7 then readln (zb);
      end;

    {$I+}

    if IOResult <> 0 then begin
      ShowMessage ('Odczyt z pliku ' + OtwieraczPliku.FileName
        + ' nie powiodl sie.'); exit;
    end;

    if ((gracz [Bialy] <> Komp) and (gracz [Bialy] <> Czlowiek)) or
      ((gracz [Czarny] <> Komp) and (gracz [Czarny] <> Czlowiek)) or
      ((ktoTeraz <> Bialy) and (ktoTeraz <> Czarny)) then ok := false;

    if not ok then
      ShowMessage ('Plik ' + OtwieraczPliku.FileName
      + ' nie jest poprawnym plikiem zapisanej gry.') else begin
        RichEdit1.Text := 'Wczytano z ' + OtwieraczPliku.FileName;
        t := t2; Gramy;
      end;

    CloseFile (zb);
  end;

end;


// cofa ruch i ustawia odpowiednie pola menu na enabled,
// to jest POTRZEBNE jezeli cofamy z pozycji koncowej,
// wpp nie przeszkadza 
procedure TForm1.CofnijRuch;
var i, j: longint; s: string; v: boolean;
begin 

  if tura = 0 then exit;
  koniec := false;
  wybrane := false;
  Hint1.Enabled := true;
  EdytujPlansz1.Enabled := true;
  Zapisz1.Enabled := true;

  if ruchy [tura].edycja <> 0 then begin
    for i := 0 to 7 do
      for j := 0 to 7 do
        t [i, j] := t [i, j] - edycje [ruchy [tura].edycja].zmiana [i, j];
    if edycje [ruchy [tura].edycja].zmianaRuchu then ktoTeraz := 1 - ktoTeraz;

  end else begin
  // troche cyrk jezeli zostal tylko jeden gracz, albo gdy
  // cofamy z sytuacji 1-graczowej do 2-graczowej

    v := (ilosc (t, 1 - ktoTeraz) <> 0);
    if ruchy [tura].bije then
      if not v then t [ruchy [tura].x, ruchy [tura].y] := 1 - ktoTeraz else
        t [ruchy [tura].x, ruchy [tura].y] := ktoTeraz else
      t [ruchy [tura].x, ruchy [tura].y] := Invalid;

    if (v) then ktoTeraz := 1 - ktoTeraz;
    t [ruchy [tura].wx, ruchy [tura].wy] := ktoTeraz;

  end;

  // usuniecie napisu
  dec (tura); s := '';

  for i := length (RichEdit1.Text) - 1 downto 1 do
    if (RichEdit1.Text [i] = char (10)) and (RichEdit1.Text [i + 1] in ['0'..'9']) then break;

  for j := 1 to i - 1 do s := s + RichEdit1.Text [j];
  if tura = 0 then Cofnij1.Enabled := false;
  RichEdit1.Text := s;
  Plansza.Repaint;

end;


procedure TForm1.EdytujPlansz1Click (Sender: TObject);
begin

  EdytorPlanszy.t := t;
  EdytorPlanszy.Show;
  EdytorPlanszy.GroupRuch.ItemIndex := ktoTeraz;

end;


procedure TForm1.Wyjd1Click(Sender: TObject);
begin Form1.Close; end;

procedure TForm1.Cofnij1Click(Sender: TObject);
begin CofnijRuch; end;

procedure TForm1.ZasadyGry1Click(Sender: TObject);
begin

  ShowMessage ('Wygrywa gracz, ktory jako pierwszy dojdzie'
  + char (10) + 'pionkiem do przeciwleglego konca planszy.'
  + char (10) + 'Pionki moga sie poruszac do przodu i do'
  + char (10) + 'przodu na skos, oraz zbijac do przodu na skos.');

end;

procedure TForm1.Jakgrac1Click(Sender: TObject);
begin

  ShowMessage ('Podczas Twojego ruchu kliknij pionka, a nastêpnie pole,'
  + char (10) + 'na ktore chcesz tego pionka przesunac. Ruchy mozna cofac,'
  + char (10) + 'jednak jezeli cofniesz ruch komputera, to musisz wykonac'
  + char (10) + 'ruch za niego. Kazda edycja planszy liczy sie jako jeden'
  + char (10) + 'ruch, i mozna cofnac tylko cala edycje naraz. Lista'
  + char (10) + 'ruchow znajduje sie w polu tekstowym po lewej.');

end;


procedure TForm1.Hint1Click (Sender: TObject);
var best: Ruch; s, kto: string; zn: char;
begin

  best := najlepszyRuch (t, ktoTeraz);
  if ktoTeraz = Bialy then kto := 'Bialy' else
    kto := 'Czarny';

  if t [best.x, best.y] <> Invalid then zn := 'x' else zn := '-';

  s := '[Podpowiedz komputera] ' + kto + ': ' + char (ord ('A') + best.wy) +
  char (56 - best.wx) + zn + char (ord ('A') + best.y) + char (56 - best.x);

  RichEdit1.Text := RichEdit1.Text + char (10) + s;
end;

end.
