// Charles Fletcher
// File Status: Complete
unit checkout_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  System.UITypes,
  DMLoginSystem_u,
  DMUnit, utils_u, Vcl.TitleBarCtrls;

type
  TfrmCheckout = class(TForm)

    dbgItems: TDBGrid;
    btnFunds: TButton;
    lbl01: TLabel;
    btnSubmit: TButton;
    redReceipt: TRichEdit;
    btnSave: TButton;
    lbl02: TLabel;
    lbl03: TLabel;
    lbl04: TLabel;
    btnBack: TButton;
    tlbTitleBar: TTitleBarPanel;
    procedure FormShow(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure refreshItems();
    procedure btnFundsClick(Sender: TObject);
    procedure populateReceipt();
    procedure btnSaveClick(Sender: TObject);
    procedure refreshLabels();
    procedure btnBackClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

function CurrToSQLStr(AValue: Currency): string;

// Array

var
  frmCheckout: TfrmCheckout;
  total: Currency;
  totalItems: integer;

implementation

uses
  trip_overview_u, home_u;

{$R *.dfm}

{$REGION 'Forms'}


// Show Form
procedure TfrmCheckout.FormShow(Sender: TObject);
var
  q: string;
begin
  utils_u.fixWindow(self);

  // Populate Form
  lbl01.Caption := 'R' + CurrToStr(currUser.getBalance);

  // Get Item Count
  q := 'SELECT SUM(cl.quantity) AS total_items'
    + ' FROM tblCuratedList cl'
    + ' WHERE cl.trip_id = ' + QuotedStr(trip_overview_u.tripID);

  DMUnit.DataModule1.RunSQL(q);
  totalItems := DMUnit.DataModule1.dsQrySQL.DataSet.FieldByName('total_items').AsInteger;

  // Get Total
  q := 'SELECT SUM(i.price * cl.quantity) AS total_price'
    + ' FROM (tblCuratedList cl'
    + ' INNER JOIN tblStock s ON s.stock_id = cl.stock_id)'
    + ' INNER JOIN tblItems i ON i.item_id = s.item_id'
    + ' WHERE cl.trip_id = ' + QuotedStr(trip_overview_u.tripID);
  DMUnit.DataModule1.RunSQL(q);
  total := DMUnit.DataModule1.dsQrySQL.DataSet.FieldByName('total_price').AsCurrency;

  // GUI
  refreshLabels;
  refreshItems;
  redReceipt.Lines.Clear;
end;

// Close Form
procedure TfrmCheckout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
  utils_u.confirmQuit;
end;

{$ENDREGION}

{$REGION 'Buttons' }


// Add Funds Button
procedure TfrmCheckout.btnFundsClick(Sender: TObject);
var
  q, sTopUp: string;
begin
  sTopUp := InputBox('Add Funds', 'Top up Amount: ', '');

  q := 'UPDATE tblUsers SET balance = balance + ' + sTopUp
    + ' WHERE username = ' + QuotedStr(currUser.getUsername);
  DMUnit.DataModule1.ExecuteSQL(q);

  // GUI
  refreshLabels;
  refreshItems;
end;

// Checkout Button
procedure TfrmCheckout.btnSubmitClick(Sender: TObject);
var
  q: string;
begin

  // Funds Check
  if currUser.getBalance() < total then
  begin
    ShowMessage('Insufficient funds. Total: R' + CurrToStr(total));
    refreshItems;
    Exit;
  end
  else
  begin
    refreshItems;
    populateReceipt;
    q := 'UPDATE tblUsers SET balance = balance - ' + CurrToSQLStr(total)
      + ' WHERE username = ' + QuotedStr(currUser.getUsername);
    DMUnit.DataModule1.ExecuteSQL(q);
    refreshItems;
  end;

{$REGION 'Prompt Delete Trip; DO LAST'}
  if MessageDlg('Would you like to Delete Trip?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrNo then // Yes
    if MessageDlg('Are you sure? THIS ACTION CANNOT BE UNDONE',
      mtConfirmation, [mbYes, mbNo], 0) <> mrNo then // Yes
    begin
      with DMUnit.DataModule1 do
      begin
        // Delete all curated list items belonging to the trip
        q := 'DELETE FROM tblCuratedList WHERE trip_id = ' + QuotedStr(trip_overview_u.tripID);
        ExecuteSQL(q);

        // Delete the trip itself
        q := 'DELETE FROM tblTrip WHERE trip_id = ' + QuotedStr(trip_overview_u.tripID);
        ExecuteSQL(q);
      end;

      ShowMessage('Trip Deleted');
    end;
{$ENDREGION}
  btnBack.Caption := 'Complete';
  refreshLabels;
end;

// Save Receipt
procedure TfrmCheckout.btnSaveClick(Sender: TObject);
begin
  redReceipt.Lines.SaveToFile('Receipt.txt');
end;

// Back/Complete Button
procedure TfrmCheckout.btnBackClick(Sender: TObject);
begin
  self.hide;

  if btnBack.Caption = 'Complete' then
  begin
    trip_overview_u.frmTripOverview.hide;
    frmHome.Show;
    Exit;
  end;

  frmTripOverview.Show;
end;

{$ENDREGION}

{$REGION 'Custom Methods'}


// Refresh Items
procedure TfrmCheckout.refreshItems;
var
  q: string;
begin

  q := 'SELECT cl.stock_id, cl.quantity, cl.comment, i.item_name, i.price, ' +
    '(i.price * cl.quantity) AS line_total' +
    ' FROM (tblCuratedList cl'
    + ' INNER JOIN tblStock s ON s.stock_id = cl.stock_id)'
    + ' INNER JOIN tblItems i ON i.item_id = s.item_id'
    + ' WHERE cl.trip_id = ' + QuotedStr(trip_overview_u.tripID);

  DMUnit.DataModule1.RunSQL(q);
  dbgItems.DataSource := DMUnit.DataModule1.dsQrySQL;

  // Format Table
  dbgItems.Columns[0].Visible := False; // stock_id — hidden

  dbgItems.Columns[1].Title.Caption := 'Quantity';
  dbgItems.Columns[1].Width := 70;

  dbgItems.Columns[2].Title.Caption := 'Comment';
  dbgItems.Columns[2].Width := 160;

  dbgItems.Columns[3].Title.Caption := 'Item Name';
  dbgItems.Columns[3].Width := 140;

  dbgItems.Columns[4].Title.Caption := 'Price per Unit';
  dbgItems.Columns[4].Width := 90;

  dbgItems.Columns[5].Title.Caption := 'Total';
  dbgItems.Columns[5].Width := 90;

end;

procedure TfrmCheckout.refreshLabels;
begin
  lbl01.Caption := 'R' + CurrToStr(currUser.getBalance);
  lbl03.Caption := 'Total: ' + CurrToStrF(total, ffCurrency, 2);
  lbl04.Caption := 'Items: ' + IntToStr(totalItems);
  refreshItems;
end;

// Make Receipt
procedure TfrmCheckout.populateReceipt;
var
  ds: TDataSet;
  itemLine: string;
  totalPrice: Currency;
  totalItems: integer;
begin
  ds := DMUnit.DataModule1.dsQrySQL.DataSet;

  redReceipt.Clear;
  redReceipt.Font.Name := 'Courier New'; // fixed-width so columns align
  redReceipt.Font.Size := 10;

  // --- Header ---
  redReceipt.SelAttributes.Style := [fsBold];
  redReceipt.Paragraph.Alignment := taCenter;
  redReceipt.Lines.Add('===== TRIP RECEIPT =====');
  redReceipt.Paragraph.Alignment := taLeftJustify;
  redReceipt.SelAttributes.Style := [];

  redReceipt.Lines.Add('');
  redReceipt.Lines.Add('Trip:   ' + trip_overview_u.tripName);
  redReceipt.Lines.Add('Departure:   ' + (trip_overview_u.tripDepart));
  redReceipt.Lines.Add('Return:   ' + (trip_overview_u.tripReturn));
  redReceipt.Lines.Add('Trip ID: ' + trip_overview_u.tripID);
  redReceipt.Lines.Add(StringOfChar('-', 40));

  // --- Column headers ---
  redReceipt.SelAttributes.Style := [fsBold];
  redReceipt.Lines.Add(Format('%-20s%5s%10s', ['Item', 'Qty', 'Price']));
  redReceipt.SelAttributes.Style := [];
  redReceipt.Lines.Add(StringOfChar('-', 40));

  // --- Items ---
  totalPrice := 0;
  totalItems := 0;
  ds.First;
  while not ds.Eof do
  begin
    itemLine := Format('%-20s%5d%10s',
      [ds.FieldByName('item_name').AsString,
      ds.FieldByName('quantity').AsInteger,
      CurrToStr(ds.FieldByName('price').AsCurrency)]);
    redReceipt.Lines.Add(itemLine);

    totalPrice := totalPrice + (ds.FieldByName('price').AsCurrency * ds.FieldByName('quantity').AsInteger);
    totalItems := totalItems + ds.FieldByName('quantity').AsInteger;

    ds.Next;
  end;

  redReceipt.Lines.Add(StringOfChar('-', 40));

  // --- Totals ---
  redReceipt.SelAttributes.Style := [fsBold];
  redReceipt.Lines.Add(Format('%-20s%5d', ['Total Items:', totalItems]));
  redReceipt.Lines.Add(Format('%-20s%10s', ['Total Cost:', CurrToStr(totalPrice)]));
  redReceipt.SelAttributes.Style := [];

  redReceipt.Lines.Add(StringOfChar('-', 40));

  // --- Balance ---
  redReceipt.Lines.Add('Balance before: R' + CurrToStr(currUser.getBalance));
  redReceipt.Lines.Add('Balance after:  R' + CurrToStr(currUser.getBalance - totalPrice));

  redReceipt.Lines.Add('');
  redReceipt.Paragraph.Alignment := taCenter;
  redReceipt.Lines.Add('Thank you!');
  redReceipt.Paragraph.Alignment := taLeftJustify;

  refreshItems;
end;

function CurrToSQLStr(AValue: Currency): string;
var
  fs: TFormatSettings;
begin
  fs := TFormatSettings.Invariant; // always uses '.' regardless of locale
  Result := CurrToStr(AValue, fs);
end;

{$ENDREGION}

end.
