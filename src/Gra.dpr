program Gra;

uses
  Forms,
  Glowny in 'Glowny.pas' {Form1},
  UnitNowaGra in 'UnitNowaGra.pas' {NowaGra},
  EdycjaPlanszy in 'EdycjaPlanszy.pas' {EdytorPlanszy},
  Inteligencja in 'Inteligencja.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TNowaGra, NowaGra);
  Application.CreateForm(TEdytorPlanszy, EdytorPlanszy);
  Application.Run;
end.
