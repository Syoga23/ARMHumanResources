unit BGunit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Dialogs, Data.DB, Data.Win.ADODB, IniFiles,
  VCL.Forms, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan;

type
  TBackData = class(TDataModule)
    Connection: TADOConnection;
    MainMenu: TMainMenu;
    j1: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N2: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N6: TMenuItem;
    N14: TMenuItem;
    N18: TMenuItem;
    N7: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    procedure ConnectionConnectComplete(Connection: TADOConnection;
      const Error: Error; var EventStatus: TEventStatus);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Ini:TIniFile;
    { Public declarations }
  end;

var
  BackData: TBackData;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ConnectUnit, MainUnit;

{$R *.dfm}

procedure SetIniDefaults;
 Var IniLocal: TiniFile;
     ConfigPath: String;
begin
try
ConfigPath:= ExtractFileDir(Application.ExeName) + '\config.ini';
IniLocal := TIniFile.Create(ConfigPath);
IniLocal.writeString('Connection','Connection_string','');
IniLocal.writeString('Connection','Username','');
IniLocal.writeString('User_Interface','Style','Windows');
IniLocal.Free
  // other defaults
except on E:Exception do
    MessageDlg('Ошибка создания файла конфигураций: '+ E.Message, mtError, [mbOk], 0)
end;

end;

procedure TBackData.DataModuleCreate(Sender: TObject);
  var ConfigPath:String;
begin
  try
    ConfigPath:= ExtractFileDir(Application.ExeName) + '\config.ini';
    Ini := TIniFile.Create(ConfigPath);
  except on E:Exception do
    MessageDlg('Ошибка создания конфигурации: '+ E.Message, mtError, [mbOk], 0)
  end;
if (Not FileExists(ConfigPath)) then
    begin
        SetIniDefaults;
        // after above line the file is created.
    end;

end;

procedure TBackData.ConnectionConnectComplete(Connection: TADOConnection;
  const Error: Error; var EventStatus: TEventStatus);
begin
//lol
end;



end.
