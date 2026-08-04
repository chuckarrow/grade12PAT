unit manager_home_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmManagerHome = class(TForm)
    DBGrid1: TDBGrid;
    edtStore: TButton;
    edtItem: TButton;
    lbl01: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManagerHome: TfrmManagerHome;

implementation

{$R *.dfm}

end.
