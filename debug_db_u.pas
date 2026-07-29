unit debug_db_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, DMUnit;

type
  TfrmDebug1 = class(TForm)
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDebug1: TfrmDebug1;

implementation

{$R *.dfm}

procedure TfrmDebug1.FormShow(Sender: TObject);
begin
DMUnit.DataModule1.OpenTables;
DBGrid1.DataSource := DMUnit.DataModule1.dsTblUsers;
end;

end.
