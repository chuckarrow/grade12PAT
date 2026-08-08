// Link all tables
unit DMUnit;

interface

uses
  System.SysUtils, System.Classes, ADODB, DB, StdCtrls, Dialogs;

type
  TDataModule1 = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ADOConnection1: TAdoConnection;

    tblUsers: TADOTable; // ADD THIS LINE PER TABLE YOU HAVE
    dsTblUsers: TDataSource; // ADD THIS LINE PER TABLE YOU HAVE

    tblStores: TADOTable;
    dsTblStores: TDataSource;

    tblItems: TADOTable;
    dsTblItems: TDataSource;

    tblStock: TADOTable;
    dsTblStock: TDataSource;

    tblTrip: TADOTable;
    dsTblTrip: TDataSource;

    tblCuratedList: TADOTable;
    dsTblCuratedList: TDataSource;

    // tblTableName2: TADOTable;
    // dsTableName2: TDataSource;

    qrySQL: TADOQuery;
    dsQrySQL: TDataSource;

    procedure OpenTables;
    procedure ExecuteSQL(Statement: string);
    procedure RunSQL(Statement: string);
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}


procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin // rename all table names below to your table names

  // Instantiate or create the componenets on the datamodule
  ADOConnection1 := TAdoConnection.Create(DataModule1);

  // tblUsers
  tblUsers := TADOTable.Create(DataModule1);
  dsTblUsers := TDataSource.Create(DataModule1);

  tblStores := TADOTable.Create(DataModule1);
  dsTblStores := TDataSource.Create(DataModule1);

  tblItems := TADOTable.Create(DataModule1);
  dsTblItems := TDataSource.Create(DataModule1);

  tblStock := TADOTable.Create(DataModule1);
  dsTblStock := TDataSource.Create(DataModule1);

  tblTrip := TADOTable.Create(DataModule1);
  dsTblTrip := TDataSource.Create(DataModule1);

  tblCuratedList := TADOTable.Create(DataModule1);
  dsTblCuratedList := TDataSource.Create(DataModule1);

  // tblTableName2 := TADOTable.Create(DataModule1);
  // dsTableName2 := TDataSource.Create(DataModule1);

  qrySQL := TADOQuery.Create(DataModule1);
  dsQrySQL := TDataSource.Create(DataModule1);

  ADOConnection1.Close;

  // scroll to the right and add in your database name
  ADOConnection1.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' +
    ExtractFilePath(ParamStr(0)) + 'RyokoFukuDB.mdb' +
    ';Persist Security Info=False';

  ADOConnection1.LoginPrompt := FALSE;

  ADOConnection1.Open;

  // Connection for every table you have
  tblUsers.Connection := ADOConnection1;
  tblUsers.TableName := 'tblUsers';
  dsTblUsers.DataSet := tblUsers;

  // tblStores
  tblStores.Connection := ADOConnection1;
  tblStores.TableName := 'tblStores';
  dsTblStores.DataSet := tblStores;

  // tblItems
  tblItems.Connection := ADOConnection1;
  tblItems.TableName := 'tblItems';
  dsTblItems.DataSet := tblItems;

  // tblStock
  tblStock.Connection := ADOConnection1;
  tblStock.TableName := 'tblStock';
  dsTblStock.DataSet := tblStock;

  // tblTrip
  tblTrip.Connection := ADOConnection1;
  tblTrip.TableName := 'tblTrip';
  dsTblTrip.DataSet := tblTrip;

  // tblCuratedList
  tblCuratedList.Connection := ADOConnection1;
  tblCuratedList.TableName := 'tblCuratedList';
  dsTblCuratedList.DataSet := tblCuratedList;

  // used for SQL interactions
  qrySQL.Connection := ADOConnection1;
  dsQrySQL.DataSet := qrySQL;

end;

procedure TDataModule1.OpenTables;
begin
  // open all tables - rename to your table names
  tblUsers.Open;
  tblStores.Open;
  tblItems.Open;
  tblStock.Open;
  tblTrip.Open;
  tblCuratedList.Open;
  // tblTableName2.Open;
end;

procedure TDataModule1.RunSQL(Statement: string); // (SELECT ONLY)
begin
  if length(Statement) <> 0 then
  begin
    qrySQL.Close;
    qrySQL.SQL.Text := Statement;
    qrySQL.Open;
    dsQrySQL.DataSet := qrySQL;
  end
  else
  begin
    MessageDlg('ERROR: No SQL statement.', mtError, [mbOk], 0);
  end;

end; // procedure RUN SQL (SELECT ONLY)

procedure TDataModule1.ExecuteSQL(Statement: string); // (insert, update, delete)
begin
  // sqls
  var
    iBefore, iAfter: integer;
  begin
    if length(Statement) <> 0 then
    begin

      iBefore := tblUsers.RecordCount;

      qrySQL.Close;
      qrySQL.SQL.Text := Statement;
      qrySQL.ExecSQL;

      dsQrySQL.DataSet := qrySQL;
      tblUsers.Close;
      tblUsers.Open;

    end
    else
    begin
      MessageDlg('ERROR: No SQL statement!', mtError, [mbOk], 0);
    end;

  end;
end; // procedure execute SQL (insert, update, delete)

end.
