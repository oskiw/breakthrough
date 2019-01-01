object NowaGra: TNowaGra
  Left = 548
  Top = 202
  BorderStyle = bsDialog
  Caption = 'Nowa Gra'
  ClientHeight = 320
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -23
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 29
  object StartGry: TButton
    Left = 208
    Top = 280
    Width = 75
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = StartGryClick
  end
  object GroupBialy: TRadioGroup
    Left = 32
    Top = 24
    Width = 185
    Height = 105
    Caption = 'Bia'#322'y'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Cz'#322'owiek'
      'Komputer')
    ParentFont = False
    TabOrder = 1
  end
  object GroupCzarny: TRadioGroup
    Left = 272
    Top = 24
    Width = 185
    Height = 105
    Caption = 'Czarny'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Cz'#322'owiek'
      'Komputer')
    ParentFont = False
    TabOrder = 2
  end
  object GroupZaczynacz: TRadioGroup
    Left = 160
    Top = 152
    Width = 185
    Height = 105
    Caption = 'Pierwszy ruch'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Bia'#322'y'
      'Czarny')
    ParentFont = False
    TabOrder = 3
  end
end
