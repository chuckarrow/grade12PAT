unit utils_u;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Winapi.Windows, Vcl.Dialogs, System.UITypes,  DMUnit, DMCommon_u, DB;

procedure horizCentre(control: TControl; Offset: Integer = 0);
procedure screenCentre(Form: TForm);
procedure fixWindow(Form: TForm);
procedure confirmQuit();
function getNextID(const TableName, IDField, Prefix: string): string;

Const
  // Launch GUI
  launchWindowWidth = 750;
  launchWindowHeight = 500;

  // Start Currency
  startingCurrency = 1000.00;

implementation

procedure confirmQuit();
begin
  if MessageDlg('Are you sure you want to quit? ',
    mtConfirmation, [mbYes, mbNo], 0) <> mrNo then
    Application.Terminate;

end;

procedure fixWindow(Form: TForm);
begin

  // Incorrect Window Activation incorrect Fix
  // Source: https://stackoverflow.com/questions/802279/multiple-app-windows-activation-not-working-correctly
  ShowWindow(Form.Handle, SW_HIDE);
  SetWindowLong(Form.Handle, GWL_EXSTYLE, GetWindowLong(Form.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
  ShowWindow(Form.Handle, SW_SHOW);
end;

procedure horizCentre(control: TControl;
  Offset: Integer = 0);
begin

  control.left := Round(control.Parent.Width / 2) -
    Round(control.Width / 2) + Offset;
  // lbl01.Left := Round(Self.Width / 2) - Round(lbl01.Width / 2);
end;

procedure screenCentre(Form: TForm);
begin
  Form.left := Round((Screen.Width / 2) - Form.Width / 2);
  Form.Top := Round((Screen.Height / 2) - Form.Height / 2);
end;


function getNextID(const TableName, IDField, Prefix: string): string;
var
  ds: TDataSet;
  q: string;
  maxNum: integer;
begin
  q := 'SELECT MAX(' + IDField + ') AS MaxID FROM ' + TableName;
  DMUnit.DataModule1.RunSQL(q);
  ds := DMUnit.DataModule1.dsQrySQL.DataSet;

  if not ds.IsEmpty and (ds.FieldByName('MaxID').AsString <> '') then
    maxNum := StrToIntDef(Copy(ds.FieldByName('MaxID').AsString, Length(Prefix) + 1), 0)
    // Need '-Def- for default of 0 if no items or stocks are found.
  else
    maxNum := 0;

  Result := Prefix + Format('%.3d', [maxNum + 1]);

end;

end.
