object frmManagerHome: TfrmManagerHome
  Left = 0
  Top = 0
  Caption = 'Manager Home'
  ClientHeight = 253
  ClientWidth = 1048
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  ShowInTaskBar = True
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object lbl01: TLabel
    Left = 64
    Top = 35
    Width = 206
    Height = 15
    Caption = 'Viewing: <Stores>/<Items of <Store>>'
  end
  object DBGrid1: TDBGrid
    Left = 64
    Top = 56
    Width = 817
    Height = 127
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btnStore: TButton
    Left = 896
    Top = 56
    Width = 129
    Height = 25
    Caption = 'Edit Store'
    TabOrder = 1
    OnClick = btnStoreClick
  end
  object btnItem: TButton
    Left = 896
    Top = 87
    Width = 129
    Height = 25
    Caption = 'Edit Item'
    TabOrder = 2
    OnClick = btnItemClick
  end
  object btnAdd: TButton
    Left = 896
    Top = 127
    Width = 129
    Height = 25
    Caption = 'Add Item'
    TabOrder = 3
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 896
    Top = 158
    Width = 129
    Height = 25
    Caption = 'Delete Item'
    TabOrder = 4
    OnClick = btnDeleteClick
  end
end
