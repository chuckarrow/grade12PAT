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


    tblUsers: TADOTable;// ADD THIS LINE PER TABLE YOU HAVE
    dsTblUsers: TDataSource;// ADD THIS LINE PER TABLE YOU HAVE

//    tblTableName2: TADOTable;
//    dsTableName2: TDataSource;

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
begin //rename all table names below to your table names

  // Instantiate or create the componenets on the datamodule
  ADOConnection1 := TAdoConnection.Create(DataModule1);

  tblUsers := TADOTable.Create(DataModule1);
  dstblUsers := TDataSource.Create(DataModule1);

//  tblTableName2 := TADOTable.Create(DataModule1);
//  dsTableName2 := TDataSource.Create(DataModule1);

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
  // ADOTable1 must be named ADOtablename(your associated table)
//  tblTableName2.Connection := ADOConnection1;

  // Each ADOTable is associated with each table name in access
  tblUsers.TableName := 'tblUsers'; // table name spelled as in in MS access
//  tblTableName2.TableName := 'tblTowns';
  // table name spelled as in in MS access

  // a data source is named dsTableName
  // each data source must be associated with the correct ADOtable
  dstblUsers.DataSet := tblUsers;
 // dsTableName2.DataSet := tblTableName2;

  // used for SQL interactions
  qrySQL.Connection := ADOConnection1;
  dsQrySQL.DataSet := qrySQL;

end;

procedure TDataModule1.OpenTables;
begin
  // open all tables - rename to your table names
  tblUsers.Open;
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

end;// procedure RUN SQL (SELECT ONLY)

procedure TDataModule1.ExecuteSQL(Statement: string); //(insert, update, delete)
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
