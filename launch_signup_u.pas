// TODO
// - Bullet out password edit boxes

unit launch_signup_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  DMCommon_u, DMLoginSystem_u;

type
  TfrmSignup = class(TForm)
    lbl01: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    edtPasswordRepeat: TEdit;
    btnViewPassword: TButton;
    edtName: TEdit;
    edtSurname: TEdit;
    sedAge: TSpinEdit;
    btnBack: TButton;
    rbnMale: TRadioButton;
    rbnFemale: TRadioButton;
    btnSubmit: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure rbnMaleClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignup: TfrmSignup;

implementation

uses
  launch_welcome_u;

{$R *.dfm}


procedure TfrmSignup.btnBackClick(Sender: TObject);
begin

  launch_welcome_u.frmWelcome.Show;
  self.Hide;
end;

// Form Show
procedure TfrmSignup.FormShow(Sender: TObject);
begin
  launch_welcome_u.frmWelcome.Hide;

  // DMLoginSystem_u.DM2.CreateNew();
end;

// Form Resize
procedure TfrmSignup.btnSubmitClick(Sender: TObject);
var
signupAttempt : TUserSignup;
  sName, sSurname, sUsername, sPassword, sPasswordRepeat, error: string;
  iAge: integer;
  isMale: boolean;
begin

  sName := edtName.Text;
  sSurname := edtSurname.Text;
  iAge := sedAge.Value;
  isMale := rbnMale.Checked;
  sUsername := edtUsername.Text;
  sPassword := edtPassword.Text;
  sPasswordRepeat := edtPasswordRepeat.Text;

  // Create User Object
  signupAttempt := DMLoginSystem_u.TUserSignup.CreateNew(sName, sSurname, sUsername, sPassword, sPasswordRepeat, iAge, isMale);

  if signupAttempt.CanRegister(error) then
  //register
  ShowMessage('Can Create Acc')
  else
  //error
  ShowMessage(error);
end;

procedure TfrmSignup.FormResize(Sender: TObject);
begin
  //
end;

procedure TfrmSignup.rbnMaleClick(Sender: TObject);
begin
  if NOT rbnMale.Checked then
    rbnFemale.Checked := false;

end;

end.
