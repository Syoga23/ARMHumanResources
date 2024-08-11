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
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    ADOQuery5: TADOQuery;
    ADOQuery6: TADOQuery;
    ADOQuery7: TADOQuery;
    ADOQuery8: TADOQuery;
    ADOQuery9: TADOQuery;
    ADOQuery10: TADOQuery;
    ADOQuery11: TADOQuery;
    ADOQuery12: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
    DataSource8: TDataSource;
    DataSource9: TDataSource;
    DataSource10: TDataSource;
    DataSource11: TDataSource;
    DataSource12: TDataSource;
    ADOQuery13: TADOQuery;
    DataSource13: TDataSource;
    RefReviewer: TADOQuery;
    RefReviewerSource: TDataSource;
    procedure ConnectionConnectComplete(Connection: TADOConnection;
      const Error: Error; var EventStatus: TEventStatus);
    procedure DataModuleCreate(Sender: TObject);
  private

    { Private declarations }
  public
    Ini:TIniFile;

    const TableNames : array[0..9] of string =
    (
      'JOBS', 'Salaries', 'SickDays', 'DEPARTMENTS', 'LOCATIONS',
      'COUNTRIES', 'REGIONS', 'Events', 'DayType', 'Vacations'
    );

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
    MessageDlg('������ �������� ����� ������������: '+ E.Message, mtError, [mbOk], 0)
end;

end;

procedure TBackData.DataModuleCreate(Sender: TObject);
  var ConfigPath:String;
begin
  try
    ConfigPath:= ExtractFileDir(Application.ExeName) + '\config.ini';
    Ini := TIniFile.Create(ConfigPath);
  except on E:Exception do
    MessageDlg('������ �������� ������������: '+ E.Message, mtError, [mbOk], 0)
  end;
if (Not FileExists(ConfigPath)) then
    begin
        SetIniDefaults;
        // after above line the file is created.
    end;

end;

procedure TBackData.ConnectionConnectComplete(Connection: TADOConnection;
  const Error: Error; var EventStatus: TEventStatus);
  var i:integer;
begin

  MainForm.DBTablesBox.Items.Clear;

  for i := 0 to 9 do
    begin
      MainForm.DBTablesBox.Items.Add(TableNames[i]);
    end;
  MainForm.DBTablesBox.ItemIndex:=0;




end;



end.
