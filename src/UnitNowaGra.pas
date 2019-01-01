unit UnitNowaGra;

interface

uses
  Forms, Controls, StdCtrls, ExtCtrls, Classes, Glowny;

type
  TNowaGra = class (TForm)
    StartGry: TButton;
    GroupBialy: TRadioGroup;
    GroupCzarny: TRadioGroup;
    GroupZaczynacz: TRadioGroup;
    procedure StartGryClick (Sender: TObject);  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NowaGra: TNowaGra;

implementation
{$R *.dfm}

procedure TNowaGra.StartGryClick (Sender: TObject);
var bialy, czarny, pierwszy: longint;
begin

  bialy := GroupBialy.ItemIndex;
  czarny := GroupCzarny.ItemIndex;
  pierwszy := GroupZaczynacz.ItemIndex;

  Form1.Inicjuj (bialy, czarny, pierwszy);
  NowaGra.Close;

end;

end.
