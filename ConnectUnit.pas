unit ConnectUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  Vcl.Graphics, Vcl.Menus, Vcl.Tabs, Vcl.DockTabSet, Vcl.ComCtrls, Vcl.ExtCtrls,
  acPNG, Vcl.AppEvnts,

  BGunit, MainUnit;

type
  TConnectForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ServerName: TEdit;
    Username: TEdit;
    Password: TEdit;
    LoginButton: TButton;
    Image1: TImage;
    Image2: TImage;
    NextButton: TButton;
    BackButton: TButton;
    Timer1: TTimer;
    ApplicationEvents1: TApplicationEvents;
    procedure FormShow(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure LoginButtonClick(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
    procedure PasswordKeyPress(Sender: TObject; var Key: Char);
    procedure ServerNameKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure ApplicationEvents1Deactivate(Sender: TObject);
    procedure ApplicationEvents1Activate(Sender: TObject);
  private
    FormActive: boolean;
    procedure CreateParams(var Params: TCreateParams); override;
  public
    closeVar:integer;
  end;

var
  ConnectForm: TConnectForm;

implementation

{$R *.dfm}

procedure TConnectForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
end;

//-----------------------------------------------------------------------
// DELETE THIS BEFORE RELEASE
//vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

procedure FastLaunch;
begin
  BackData.Connection.ConnectionString := 'Provider=SQLOLEDB.1;Password=' + 'Head200360' + ';Persist Security Info=True;User ID=' + 'Admin238' +
  ';Initial Catalog=HumanResources;Data Source=' + 'SERGEIPC\SQLSERVER2008';
  try
  BackData.Connection.Open;
  MessageDlg('Соединение успешно!', mtInformation, [mbOk], 0);
  ConnectForm.closeVar := 1;
  ConnectForm.close;
  BackData.Ini.WriteString('Connection','Connection_string', ''+ConnectForm.ServerName.Text);
  BackData.Ini.WriteString('Connection','Username', ''+ConnectForm.Username.Text);
  BackData.Ini.Free
  Except on E:Exception do
    MessageDlg('Ошибка подключения к БД: '+ E.Message, mtError, [mbOk], 0);

  end;
end;


//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// DELETE THIS BEFORE RELEASE
//-----------------------------------------------------------------------

procedure Launch;
begin
  BackData.Connection.ConnectionString := 'Provider=SQLOLEDB.1;Password=' + ConnectForm.Password.Text + ';Persist Security Info=True;User ID=' + ConnectForm.Username.Text +
  ';Initial Catalog=HumanResources;Data Source=' + ConnectForm.ServerName.Text;
  try
  BackData.Connection.Open;
  MessageDlg('Соединение успешно!', mtInformation, [mbOk], 0);
  ConnectForm.closeVar := 1;
  ConnectForm.close;
  BackData.Ini.WriteString('Connection','Connection_string', ''+ConnectForm.ServerName.Text);
  BackData.Ini.WriteString('Connection','Username', ''+ConnectForm.Username.Text);
  BackData.Ini.Free
  Except on E:Exception do
    MessageDlg('Ошибка подключения к БД: '+ E.Message, mtError, [mbOk], 0);

  end;
end;

procedure TConnectForm.LoginButtonClick(Sender: TObject);
begin
Launch();
end;

procedure TConnectForm.ApplicationEvents1Activate(Sender: TObject);
begin
FormActive := true;
end;

procedure TConnectForm.ApplicationEvents1Deactivate(Sender: TObject);
begin
FormActive := false;
//Messagedlg('FALSE', mtInformation, [mbok], 0);
end;

procedure TConnectForm.BackButtonClick(Sender: TObject);
begin
PageControl1.ActivePageIndex := 0;
end;

procedure TConnectForm.FormShow(Sender: TObject);
begin
try
ServerName.Text:= BackData.Ini.ReadString('Connection','Connection_string', '');
Username.Text := BackData.Ini.ReadString('Connection','Username', '');
PageControl1.TabIndex:=0;
except on E:exception do
  MessageDlg('Error:'+ E.Message, mtError, [mbOk], 0)
  end;

end;

procedure TConnectForm.NextButtonClick(Sender: TObject);
begin
PageControl1.ActivePageIndex := 1;
end;

procedure TConnectForm.PasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if (VK_RETURN = ord(key))
    then LoginButton.Click;
end;

procedure TConnectForm.ServerNameKeyPress(Sender: TObject; var Key: Char);
begin
  if (VK_RETURN = ord(key))
    then NextButton.Click;
end;

procedure TConnectForm.Timer1Timer(Sender: TObject);
begin

  if FormActive then begin

    if GetAsyncKeyState(VK_RETURN) <> 0
      then begin
      timer1.Enabled := false;
      FastLaunch();
      end;
  end;

end;

end.
