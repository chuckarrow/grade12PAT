// Charles Fletcher
// File Status: Complete
unit popup_addToTrip_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, DMUnit,
  DMLoginSystem_u, Vcl.Samples.Spin, Data.DB,
  Vcl.Grids, Vcl.DBGrids, DMCommon_u, Vcl.TitleBarCtrls;

type
  TfrmAddToTrip = class(TForm)
    memComment: TMemo;
    lbl01: TLabel;
    lbl02: TLabel;
    dbcmbTrip: TDBLookupComboBox;
    btnSubmit: TButton;
    sedQuantity: TSpinEdit;
    lbl03: TLabel;
    tlbTitleBar: TTitleBarPanel;
    btnBack: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sTripID: string;
  end;

var
  frmAddToTrip: TfrmAddToTrip;

implementation

uses
  shop_landing_u;

{$R *.dfm}


// Form Show
procedure TfrmAddToTrip.FormShow(Sender: TObject);
begin
  // GUI
  memComment.Clear;
  sedQuantity.Value := 1;

  // DB Lookup ComboBox
  DMUnit.DataModule1.tblTrip.Filtered := False;
  DMUnit.DataModule1.tblTrip.Filter :=
    'username = ' + QuotedStr(DMLoginSystem_u.currUser.getUsername);
  DMUnit.DataModule1.tblTrip.Filtered := True;

  dbcmbTrip.ListSource := DMUnit.DataModule1.dsTblTrip; // Source

  dbcmbTrip.KeyField := 'trip_id'; // Key Field Name
  dbcmbTrip.ListField := 'trip_name'; // Wanted/Shown Field Name

end;

// DBCombo Click
procedure TfrmAddToTrip.btnBackClick(Sender: TObject);
begin
self.Hide
end;

procedure TfrmAddToTrip.btnSubmitClick(Sender: TObject);
begin

  if VarIsNull(dbcmbTrip.KeyValue) or VarIsEmpty(dbcmbTrip.KeyValue) then
  begin
    ShowMessage('Please select a trip first.');
    Exit;
  end;

  sTripID := dbcmbTrip.KeyValue;

  shop_landing_u.frmShop.addToTrip();
  ShowMessage('TEst');
  frmShop.refreshShop; // Causing Error
  self.Hide;
end;

end.
