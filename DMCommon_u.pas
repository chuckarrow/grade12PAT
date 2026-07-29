unit DMCommon_u;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls;

type
  TDMCommon = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure horizCentre(control: TControl; Offset: Integer = 0);
class procedure screenCentre(Form: TForm);
  end;

var
  DMCommon: TDMCommon;

Const
  // Launch GUI
  launchWindowWidth = 750;
  launchWindowHeight = 500;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDataModule3 }

{ TDataModule3 }

class procedure TDMCommon.horizCentre(control: TControl;
  Offset: Integer = 0);
begin

  control.left := Round(control.Parent.Width / 2) -
    Round(control.Width / 2) + Offset;
  // lbl01.Left := Round(Self.Width / 2) - Round(lbl01.Width / 2);
end;

class procedure TDMCommon.screenCentre(Form: TForm);
begin
Form.left := Round((Screen.Width / 2) - Form.Width / 2);
  Form.Top := Round((Screen.Height / 2) - Form.Height / 2);
end;

end.
