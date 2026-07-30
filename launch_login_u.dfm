object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 265
  ClientWidth = 624
  Color = 11915762
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  ShowInTaskBar = True
  OnShow = FormShow
  TextHeight = 15
  object edtUsername: TEdit
    Left = 224
    Top = 64
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'Username'
  end
  object edtPassword: TEdit
    Left = 224
    Top = 104
    Width = 121
    Height = 23
    PasswordChar = #8226
    TabOrder = 1
    Text = 'Password'
  end
  object btnLogin: TButton
    Left = 224
    Top = 133
    Width = 121
    Height = 36
    Caption = 'Login'
    TabOrder = 2
    OnClick = btnLoginClick
  end
  object btnBack: TButton
    Left = 520
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Back'
    TabOrder = 3
    OnClick = btnBackClick
  end
end
