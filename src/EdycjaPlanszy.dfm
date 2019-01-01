object EdytorPlanszy: TEdytorPlanszy
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = 'Edytor Planszy'
  ClientHeight = 542
  ClientWidth = 1009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
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
    Top = 501
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
    Top = 501
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
    Top = 501
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
    Top = 501
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
    Top = 501
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
    Top = 501
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
    Top = 501
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
    Top = 501
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
  object LabelOpis: TLabel
    Left = 768
    Top = 16
    Width = 4
    Height = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
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
  object GroupEdytujesz: TRadioGroup
    Left = 16
    Top = 24
    Width = 185
    Height = 105
    Caption = 'Edytujesz'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Bia'#322'e'
      'Czarne')
    ParentFont = False
    TabOrder = 1
  end
  object GroupRuch: TRadioGroup
    Left = 16
    Top = 184
    Width = 185
    Height = 113
    Caption = 'Nast'#281'pny ruch'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Items.Strings = (
      'Bia'#322'e'
      'Czarne')
    ParentFont = False
    TabOrder = 2
  end
  object Wracamy: TButton
    Left = 72
    Top = 352
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = WracamyClick
  end
end
