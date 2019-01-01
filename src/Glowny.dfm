object Form1: TForm1
  Left = 329
  Top = 171
  Width = 951
  Height = 599
  Caption = 'Breakthrough'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 224
    Top = 453
    Width = 13
    Height = 29
    Alignment = taCenter
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 224
    Top = 392
    Width = 13
    Height = 29
    Alignment = taCenter
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 224
    Top = 328
    Width = 13
    Height = 29
    Alignment = taCenter
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 224
    Top = 266
    Width = 13
    Height = 29
    Alignment = taCenter
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 224
    Top = 204
    Width = 13
    Height = 29
    Alignment = taCenter
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 224
    Top = 147
    Width = 13
    Height = 29
    Alignment = taCenter
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 224
    Top = 88
    Width = 13
    Height = 29
    Alignment = taCenter
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 224
    Top = 24
    Width = 13
    Height = 29
    Alignment = taCenter
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelA: TLabel
    Left = 280
    Top = 504
    Width = 15
    Height = 29
    Alignment = taCenter
    Caption = 'A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelB: TLabel
    Left = 342
    Top = 504
    Width = 16
    Height = 29
    Alignment = taCenter
    Caption = 'B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelC: TLabel
    Left = 403
    Top = 504
    Width = 17
    Height = 29
    Alignment = taCenter
    Caption = 'C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelD: TLabel
    Left = 465
    Top = 504
    Width = 17
    Height = 29
    Alignment = taCenter
    Caption = 'D'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelE: TLabel
    Left = 526
    Top = 504
    Width = 16
    Height = 29
    Alignment = taCenter
    Caption = 'E'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelF: TLabel
    Left = 587
    Top = 504
    Width = 15
    Height = 29
    Alignment = taCenter
    Caption = 'F'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelG: TLabel
    Left = 645
    Top = 504
    Width = 18
    Height = 29
    Alignment = taCenter
    Caption = 'G'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelH: TLabel
    Left = 709
    Top = 504
    Width = 17
    Height = 29
    Alignment = taCenter
    Caption = 'H'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Plansza: TDrawGrid
    Left = 256
    Top = 8
    Width = 492
    Height = 492
    Color = clScrollBar
    ColCount = 8
    DefaultColWidth = 60
    DefaultRowHeight = 60
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 8
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    TabOrder = 0
    OnDrawCell = PlanszaDrawCell
    OnMouseUp = PlanszaMouseUp
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 8
    Width = 201
    Height = 481
    Lines.Strings = (
      'RichEdit1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 768
    Top = 8
    object Gra1: TMenuItem
      Caption = 'Gra'
      ShortCut = 49223
      object Nowa1: TMenuItem
        Caption = 'Nowa'
        ShortCut = 16462
        OnClick = Nowa1Click
      end
      object Wczytaj1: TMenuItem
        Caption = 'Wczytaj'
        ShortCut = 16463
        OnClick = Wczytaj1Click
      end
      object Zapisz1: TMenuItem
        Caption = 'Zapisz'
        ShortCut = 16467
        OnClick = Zapisz1Click
      end
      object Wyjd1: TMenuItem
        Caption = 'Wyjd'#378
        ShortCut = 16465
        OnClick = Wyjd1Click
      end
    end
    object Edycja1: TMenuItem
      Caption = 'Edycja'
      ShortCut = 49221
      object Cofnij1: TMenuItem
        Caption = 'Cofnij'
        ShortCut = 16474
        OnClick = Cofnij1Click
      end
      object EdytujPlansz1: TMenuItem
        Caption = 'Edytuj Plansz'#281
        ShortCut = 16453
        OnClick = EdytujPlansz1Click
      end
      object Hint1: TMenuItem
        Caption = 'Hint'
        ShortCut = 16456
        OnClick = Hint1Click
      end
    end
    object Pomoc1: TMenuItem
      Caption = 'Pomoc'
      object ZasadyGry1: TMenuItem
        Caption = 'Zasady gry'
        OnClick = ZasadyGry1Click
      end
      object Jakgrac1: TMenuItem
        Caption = 'Jak grac'
        OnClick = Jakgrac1Click
      end
    end
  end
  object OtwieraczPliku: TOpenDialog
    DefaultExt = '*.gra'
    Filter = 'Zapisana gra Breakthrough|*.gra'
    Left = 808
    Top = 8
  end
  object ZapisywaczPliku: TSaveDialog
    DefaultExt = '*.gra'
    Filter = 'Zapisana gra Breakthrough|*.gra'
    Left = 848
    Top = 8
  end
end
