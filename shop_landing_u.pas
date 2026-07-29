unit shop_landing_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmShop = class(TForm)
    grbFilter: TGroupBox;
    DBGrid1: TDBGrid;
    btnAdd: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShop: TfrmShop;

implementation

{$R *.dfm}

end.
