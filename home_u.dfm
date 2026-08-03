object frmHome: TfrmHome
  Left = 0
  Top = 0
  Caption = 'Home'
  ClientHeight = 394
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object lbl01: TLabel
    Left = 208
    Top = 18
    Width = 79
    Height = 15
    Caption = '[Home Screen]'
  end
  object lbl02: TLabel
    Left = 387
    Top = 18
    Width = 98
    Height = 15
    Caption = 'Welcome Back [...]'
  end
  object Button1: TButton
    Left = 351
    Top = 361
    Width = 75
    Height = 25
    Caption = 'open debug'
    TabOrder = 0
    OnClick = Button1Click
  end
  object btnTrip: TButton
    Left = 208
    Top = 80
    Width = 75
    Height = 25
    Caption = 'View Trip'
    TabOrder = 1
    OnClick = btnTripClick
  end
  object btnSignout: TButton
    Left = 432
    Top = 361
    Width = 75
    Height = 25
    Caption = 'Sign Out'
    TabOrder = 2
    OnClick = btnSignoutClick
  end
  object btnShop: TButton
    Left = 176
    Top = 128
    Width = 137
    Height = 25
    Caption = 'Go Shopping'
    TabOrder = 3
    OnClick = btnShopClick
  end
end
