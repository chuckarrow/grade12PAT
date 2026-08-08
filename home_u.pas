// Charles Fletcher
// Code status: Cleaned
unit home_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, debug_db_u, Data.DB,
  Vcl.Grids, Vcl.DBGrids, DMLoginSystem_u, DMUnit;

type
  TfrmHome = class(TForm)
    lbl01: TLabel;
    Button1: TButton;
    btnTrip: TButton;
    btnSignout: TButton;
    btnShop: TButton;
    lbl02: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSignoutClick(Sender: TObject);
    procedure btnTripClick(Sender: TObject);
    procedure btnShopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;

implementation

uses
  launch_welcome_u, trip_overview_u, shop_landing_u;

{$R *.dfm}

{ Form }

// Form Create
procedure TfrmHome.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TfrmWelcome, frmWelcome); // Create (& Show) 'frmWelcome'
  // launch_welcome_u.frmWelcome.Show;

  // Open Tables
  if not DMUnit.DataModule1.tblTrip.Active then
  DMUnit.DataModule1.OpenTables;
end;

// Form Show
procedure TfrmHome.FormShow(Sender: TObject);
begin
  // Add Welcome back user
lbl01.Caption := 'Welcome back, ' + DMLoginSystem_u.currUser.getName;
end;

// Form Terminate
procedure TfrmHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

{ End of Forms }

{ Buttons }

// Shop Button
procedure TfrmHome.btnShopClick(Sender: TObject);
begin
  shop_landing_u.frmShop.Show;
  self.hide;
end;

// Singout Button
procedure TfrmHome.btnSignoutClick(Sender: TObject);
begin
  self.hide;
  launch_welcome_u.frmWelcome.Show;
end;

// Trip Button
procedure TfrmHome.btnTripClick(Sender: TObject);
begin
  trip_overview_u.frmTripOverview.Show;
end;

// Debug button
procedure TfrmHome.Button1Click(Sender: TObject);
begin
  frmDebug1.Show;
end;

{ End of Buttons }


end.
