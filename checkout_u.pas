unit checkout_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCheckout = class(TForm)
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    btnFunds: TButton;
    lbl01: TLabel;
    btnSubmit: TButton;
    redReceipt: TRichEdit;
    btnSave: TButton;
    tswRemoveTrip: TToggleSwitch;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCheckout: TfrmCheckout;

implementation

{$R *.dfm}

end.
