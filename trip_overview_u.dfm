object frmTripOverview: TfrmTripOverview
  Left = 0
  Top = 0
  Caption = 'View Trip'
  ClientHeight = 441
  ClientWidth = 1087
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object lbl01: TLabel
    Left = 432
    Top = 72
    Width = 145
    Height = 15
    Alignment = taCenter
    Caption = 'Start -> End'
  end
  object lbl02: TLabel
    Left = 991
    Top = 195
    Width = 75
    Height = 15
    Alignment = taCenter
    Caption = 'Quantity'
  end
  object dbgItems: TDBGrid
    Left = 32
    Top = 200
    Width = 953
    Height = 169
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btnRemove: TButton
    Left = 991
    Top = 328
    Width = 75
    Height = 41
    Caption = 'Remove'
    TabOrder = 1
  end
  object btnBack: TButton
    Left = 991
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Back'
    TabOrder = 2
    OnClick = btnBackClick
  end
  object btnFinalise: TButton
    Left = 288
    Top = 391
    Width = 457
    Height = 42
    Caption = 'Finalise Trip'
    TabOrder = 3
    OnClick = btnFinaliseClick
  end
  object btnNewTrip: TButton
    Left = 8
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Create Trip'
    TabOrder = 4
  end
  object dbcTripSelect: TDBLookupComboBox
    Left = 432
    Top = 32
    Width = 145
    Height = 23
    TabOrder = 5
    OnClick = dbcTripSelectClick
  end
  object btnEditTrip: TButton
    Left = 991
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Edit Trip'
    TabOrder = 6
  end
  object btnInc: TButton
    Left = 991
    Top = 216
    Width = 75
    Height = 41
    Caption = '+'
    TabOrder = 7
    OnClick = btnIncClick
  end
  object btnDec: TButton
    Left = 991
    Top = 272
    Width = 75
    Height = 41
    Caption = '-'
    TabOrder = 8
    OnClick = btnDecClick
  end
end
