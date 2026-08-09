program ryokofuku_p;

uses
  Vcl.Forms,
  home_u in 'home_u.pas' {frmHome} ,
  launch_welcome_u in 'launch_welcome_u.pas' {frmWelcome} ,
  launch_login_u in 'launch_login_u.pas' {frmLogin} ,
  DMUnit in 'DMUnit.pas' {DataModule1: TDataModule} ,
  launch_signup_u in 'launch_signup_u.pas' {frmSignup} ,
  trip_overview_u in 'trip_overview_u.pas' {frmTripOverview} ,
  shop_landing_u in 'shop_landing_u.pas' {frmShop} ,
  admin_home_u in 'admin_home_u.pas' {frmAdminHome} ,
  manager_home_u in 'manager_home_u.pas' {frmManagerHome} ,
  popup_addToTrip_u in 'popup_addToTrip_u.pas' {frmAddToTrip} ,
  popup_editItem_u in 'popup_editItem_u.pas' {frmEditItem} ,
  checkout_u in 'checkout_u.pas' {frmCheckout} ,
  utils_u in 'utils_u.pas',
  popup_createTrip_u in 'popup_createTrip_u.pas' {frmCreateTrip} ,
  user_u in 'user_u.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  // Data Modules
  Application.CreateForm(TDataModule1, DataModule1); // Provided by School

  // Login Forms
  // Application.CreateForm(TfrmSignup, frmSignup);
  // Application.CreateForm(TfrmLogin, frmLogin);
  // Application.CreateForm(TfrmWelcome, frmWelcome);

  // Primary Form
  Application.CreateForm(TfrmHome, frmHome); // Home

  // Other forms
  Application.CreateForm(TfrmTripOverview, frmTripOverview);
  Application.CreateForm(TfrmShop, frmShop);
  Application.CreateForm(TfrmAdminHome, frmAdminHome);
  Application.CreateForm(TfrmManagerHome, frmManagerHome);
  Application.CreateForm(TfrmAddToTrip, frmAddToTrip);
  Application.CreateForm(TfrmEditItem, frmEditItem);
  Application.CreateForm(TfrmCheckout, frmCheckout);
  Application.CreateForm(TfrmCreateTrip, frmCreateTrip);

  // Run App
  Application.Run;

end.
