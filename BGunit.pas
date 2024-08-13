unit BGunit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Dialogs, Data.DB, Data.Win.ADODB, IniFiles,
  VCL.Forms, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.ObjectScope,
  Data.Bind.GenData;

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
    EmployeesSQL: TADOQuery;
    DepartmentSQL: TADOQuery;
    LocationsSQL: TADOQuery;
    CountrySQL: TADOQuery;
    RegionsSQL: TADOQuery;
    PassportSQL: TADOQuery;
    JobHistorySQL: TADOQuery;
    JobsSQL: TADOQuery;
    SalariesSQL: TADOQuery;
    MilitaryServiceSQL: TADOQuery;
    MilitaryRanksSQL: TADOQuery;
    CategoryReserveSQL: TADOQuery;
    EmployeesSrc: TDataSource;
    DepartmentSRC: TDataSource;
    LocationsSRC: TDataSource;
    CountrySRC: TDataSource;
    RegionsSRC: TDataSource;
    PassportSRC: TDataSource;
    JobHistorySRC: TDataSource;
    JobsSRC: TDataSource;
    SalariesSRC: TDataSource;
    MilitaryServiceSRC: TDataSource;
    MilitaryRanksSRC: TDataSource;
    CategoryReserveSRC: TDataSource;
    FamilySQL: TADOQuery;
    FamilySRC: TDataSource;
    RefReviewer: TADOQuery;
    RefReviewerSRC: TDataSource;
    CompanySQL: TADOQuery;
    CompanySRC: TDataSource;
    RelationsSQL: TADOQuery;
    RelationsSRC: TDataSource;
    MarrStatusSQL: TADOQuery;
    MarrStatusSRC: TDataSource;
    VacationsSQL: TADOQuery;
    VacationsSRC: TDataSource;
    WorkCalendarSQL: TADOQuery;
    WorkCalendarSRC: TDataSource;
    DayTypeSQL: TADOQuery;
    DayTypeSRC: TDataSource;
    EventsSQL: TADOQuery;
    EventsSRC: TDataSource;
    SickDaysSQL: TADOQuery;
    SickDaysSRC: TDataSource;
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
  var i:integer;
begin

  Connection.Connected := False;
  Connection.ConnectionString := '';
  EmployeesSql.Active:= False;

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

end.
