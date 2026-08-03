unit home_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, debug_db_u, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;

implementation

uses
  launch_welcome_u;

{$R *.dfm}


procedure TfrmHome.btnSignoutClick(Sender: TObject);
begin
  self.hide;
  launch_welcome_u.frmWelcome.Show;
end;

procedure TfrmHome.Button1Click(Sender: TObject);
begin
  frmDebug1.Show;
end;

// Form Create
procedure TfrmHome.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TfrmWelcome, frmWelcome); // Create (& Show) 'frmWelcome'
  // launch_welcome_u.frmWelcome.Show;
end;

// Form Show
procedure TfrmHome.FormShow(Sender: TObject);
begin
  // Add Welcome back user
end;

// Form Terminate
procedure TfrmHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.
