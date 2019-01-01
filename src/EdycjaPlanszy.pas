unit EdycjaPlanszy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, Glowny;

type
  TEdytorPlanszy = class (TForm)
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
    Plansza: TDrawGrid;
    GroupEdytujesz: TRadioGroup;
    GroupRuch: TRadioGroup;
    Wracamy: TButton;
    LabelOpis: TLabel;
    procedure PlanszaDrawCell (Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure PlanszaMouseUp (Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WracamyClick (Sender: TObject);
    procedure FormCreate (Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    t: Tablica;
  end;

var
  EdytorPlanszy: TEdytorPlanszy;

implementation
{$R *.dfm}

procedure TEdytorPlanszy.PlanszaDrawCell (Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var kolor: TColor;
begin

  case t [ARow, ACol] of
    Bialy : kolor := clWhite;
    Czarny : kolor := clBlack;
    else kolor := clScrollBar;
  end;

  Plansza.Canvas.Brush.Color := kolor;
  Plansza.Canvas.FillRect (Rect);
end;


// po kliknieciu -- usuniecie lub wstawienie pionka
procedure TEdytorPlanszy.PlanszaMouseUp (Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var x1, y1: longint;  
begin

  x1 := Plansza.Row;
  y1 := Plansza.Col;

  if ((GroupEdytujesz.ItemIndex = Bialy) and (x1 = 0)) or
    ((GroupEdytujesz.ItemIndex = Czarny) and (x1 = 7)) then exit; 

  if t [x1, y1] = GroupEdytujesz.ItemIndex then
    t [x1, y1] := Invalid else
      t [x1, y1] := GroupEdytujesz.ItemIndex;

  Plansza.Repaint;
end;


// gdy skonczy sie edycja i chcemy wrocic do gry, trzeba
// sprawdzic czy wszystko jest dobrze i dodac nowa edycje 
procedure TEdytorPlanszy.WracamyClick (Sender: TObject);
var i, j, suma: longint;
begin

  suma := 0;

  for i := 0 to 7 do
    for j := 0 to 7 do
      suma := suma + t [i, j] + 1;

  if (suma = 0) then begin
    ShowMessage ('Przynajmniej jeden pionek musi zostac na planszy');
    EdytorPlanszy.Close;
    exit;
  end;

  inc (Form1.tura);
  Form1.Cofnij1.Enabled := true;
  Form1.RichEdit1.Text := Form1.RichEdit1.Text + char (10) +
    IntToStr (Form1.tura) + ' [Edycja]';

  inc (Form1.ilEdycji);  
  Form1.ruchy [Form1.tura].edycja := Form1.ilEdycji;

  for i := 0 to 7 do
    for j := 0 to 7 do
      Form1.edycje [Form1.ilEdycji].zmiana [i, j] := t [i, j] - Form1.t [i, j];

  Form1.edycje [Form1.ilEdycji].zmianaRuchu := Form1.ktoTeraz <> GroupRuch.ItemIndex;
  Form1.ktoTeraz := GroupRuch.ItemIndex;
  Form1.t := t;
  
  EdytorPlanszy.Close;
  Form1.Plansza.Repaint;

  Form1.aMozeKomp;
end;


// wyswietla 'instrukcje obslugi' edytora
procedure TEdytorPlanszy.FormCreate (Sender: TObject);
begin

  LabelOpis.Caption := 'Kliknij na pole, aby usunac'
  + char (10) + '/ postawic pionek w'  
  + char (10) + 'edytowanym kolorze.'
  + char (10) + 'Nie mozna dodawac pionkow'
  + char (10) + 'na pozycje wygrywajaca.'
  + char (10) + 'Po edycji, na planszy musi'
  + char (10) + 'zostac przynajmniej 1 pionek.'; 

end;

end.
