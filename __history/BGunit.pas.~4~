unit BGunit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Dialogs, Data.DB, Data.Win.ADODB, IniFiles,
  VCL.Forms;

type
  TBackData = class(TDataModule)
    Connection: TADOConnection;
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
ConfigPath:= ExtractFileDir(Application.ExeName) + '\config.ini';
IniLocal := TIniFile.Create(ConfigPath);
IniLocal.writeString('connection','connectionstring','');
  // other defaults
IniLocal.Free
end;

procedure TBackData.DataModuleCreate(Sender: TObject);
  var ConfigPath:String;
begin
    ConfigPath:= ExtractFileDir(Application.ExeName) + '\config.ini';
    Ini := TIniFile.Create(ConfigPath);
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
