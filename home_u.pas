// Charles Fletcher
// Code status: Completed
unit home_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, debug_db_u, Data.DB,
  Vcl.Grids, Vcl.DBGrids, user_u, DMUnit, Vcl.TitleBarCtrls, utils_u;

type
  TfrmHome = class(TForm)
    lbl01: TLabel;
    btnTrip: TButton;
    btnSignout: TButton;
    btnShop: TButton;
    tlbTitleBar: TTitleBarPanel;
    btnQuit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSignoutClick(Sender: TObject);
    procedure btnTripClick(Sender: TObject);
    procedure btnShopClick(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
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

{$REGION 'Forms'}


// Form Create / Application initialization
procedure TfrmHome.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TfrmWelcome, frmWelcome); // Create (& Show) 'frmWelcome'

  // Open Tables
  if not DMUnit.DataModule1.tblTrip.Active then
    DMUnit.DataModule1.OpenTables;
end;

// Show Form
procedure TfrmHome.FormShow(Sender: TObject);
begin
  utils_u.screenCentre(self);

  // Add Welcome back user
  lbl01.Caption := 'Welcome back, ' + user_u.currUser.getName;
end;

// Close Form
procedure TfrmHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
  utils_u.confirmQuit();
end;
{$ENDREGION}

{$REGION 'Buttons' }


// Shop Button
procedure TfrmHome.btnShopClick(Sender: TObject);
begin
  self.hide;
  shop_landing_u.frmShop.Show;
end;

// Trip Button
procedure TfrmHome.btnTripClick(Sender: TObject);
begin
  self.hide;
  trip_overview_u.frmTripOverview.Show;
end;

// Singout Button
procedure TfrmHome.btnSignoutClick(Sender: TObject);
begin
  self.hide;
  launch_welcome_u.frmWelcome.Show;
end;

// Quit button
procedure TfrmHome.btnQuitClick(Sender: TObject);
begin
  utils_u.confirmQuit();
end;
{$ENDREGION}


end.
