unit BGunit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Dialogs, Data.DB, Data.Win.ADODB, IniFiles,
  VCL.Forms, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.ObjectScope,
  Data.Bind.GenData, System.ImageList, Vcl.ImgList, Vcl.Controls, System.Types, Vcl.Graphics;

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
    PolSQL: TADOQuery;
    PolSRC: TDataSource;
    EmployeesSQLemployee_id: TAutoIncField;
    EmployeesSQLfirst_name: TStringField;
    EmployeesSQLlast_name: TStringField;
    EmployeesSQLOtchestvo: TStringField;
    EmployeesSQLbirthdate: TWideStringField;
    EmployeesSQLemail: TStringField;
    EmployeesSQLphoto: TBlobField;
    EmployeesSQLphone_number: TStringField;
    EmployeesSQLHired_date: TWideStringField;
    EmployeesSQLTerminated_date: TWideStringField;
    EmployeesSQLTermination_reason: TWideStringField;
    EmployeesSQLjob_id: TIntegerField;
    EmployeesSQLdepartment_id: TIntegerField;
    EmployeesSQLabout: TWideStringField;
    PolSQLPol_ID: TAutoIncField;
    PolSQLPol_Name: TWideStringField;
    EmployeesSQLPol_id: TIntegerField;
    EmployeesSQLPol_Nazv: TStringField;
    DepartmentSQLdepartment_id: TAutoIncField;
    DepartmentSQLdepartment_name: TWideStringField;
    DepartmentSQLlocation_id: TIntegerField;
    EmployeesSQLDepartment_Nazv: TStringField;
    DBGridDelete: TPopupMenu;
    D1: TMenuItem;
    ActionIcons: TImageList;
    procedure DataModuleCreate(Sender: TObject);
    procedure ConnectionConnectComplete(Connection: TADOConnection;
      const Error: Error; var EventStatus: TEventStatus);
    procedure EmployeesSrcDataChange(Sender: TObject; Field: TField);
    procedure D1Click(Sender: TObject);
    procedure RefReviewerSRCDataChange(Sender: TObject; Field: TField);
    procedure DepartmentSRCDataChange(Sender: TObject; Field: TField);
    procedure N1Click(Sender: TObject);
  private

    { Private declarations }
  public
    Ini:TIniFile;

    const TableNames : array[0..9] of string =
    (
      '���������', '��������', '����������', '������', '������',
      '������', '�������', '���������', '��� ���', '�������'
    );

    const SQLTables : array[0..9] of string =
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


procedure UpdateQueries;
begin
BackData.EmployeesSQL.Close;
BackData.DepartmentSQL.Close;
BackData.LocationsSQL.Close;
BackData.CountrySQL.Close;
BackData.RegionsSQL.Close;
BackData.PassportSQL.Close;
BackData.JobhistorySQL.Close;
BackData.JobsSQL.Close;
BackData.SalariesSQL.Close;
BackData.SickDaysSQL.Close;
BackData.MilitaryServiceSQL.Close;
BackData.MilitaryRanksSQL.Close;
BackData.CategoryReserveSQL.Close;
BackData.FamilySQL.Close;
BackData.RelationsSQL.Close;
BackData.MarrStatusSQL.Close;
BackData.VacationsSQL.Close;
BackData.WorkCalendarSQL.Close;
BackData.EventsSQL.Close;
BackData.DayTypeSQL.Close;
BackData.PolSQL.Close;
// IM HERE IM HERE IM HERE IM HERE IM HERE IM HERE IM HERE
BackData.EmployeesSQL.Open;
BackData.DepartmentSQL.Open;
BackData.LocationsSQL.Open;
BackData.CountrySQL.Open;
BackData.RegionsSQL.Open;
BackData.PassportSQL.Open;
BackData.JobhistorySQL.Open;
BackData.JobsSQL.Open;
BackData.SalariesSQL.Open;
BackData.SickDaysSQL.Open;
BackData.MilitaryServiceSQL.Open;
BackData.MilitaryRanksSQL.Open;
BackData.CategoryReserveSQL.Open;
BackData.FamilySQL.Open;
BackData.RelationsSQL.Open;
BackData.MarrStatusSQL.Open;
BackData.VacationsSQL.Open;
BackData.WorkCalendarSQL.Open;
BackData.EventsSQL.Open;
BackData.DayTypeSQL.Open;
BackData.PolSQL.Open;

MainForm.DB_DepartmentsList.Update;
end;

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

procedure TBackData.ConnectionConnectComplete(Connection: TADOConnection;
  const Error: Error; var EventStatus: TEventStatus);
begin
EmployeesSql.Active:= True;
end;

procedure TBackData.D1Click(Sender: TObject);
  var i:integer;
begin
  if messageDlg('�� �������, ��� ������ ������� ��������� ������?', mtWarning, [mbYes, mbNo], 0) = mrYes
      then RefReviewer.Delete;
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

procedure TBackData.DepartmentSRCDataChange(Sender: TObject; Field: TField);
begin
EmployeesSQL.Close;
EmployeesSQL.Parameters.ParamByName('Department').Value := DepartmentSQL.FieldByName('department_id').Value;
EmployeesSQL.Open;
end;



procedure TBackData.EmployeesSrcDataChange(Sender: TObject; Field: TField);
begin
  if (EmployeesSQL.FieldByName('photo').IsNull) then
  begin
    MainForm.DBImage1.Picture.LoadFromFile(ExtractFileDir(Application.ExeName)+ '\images\Default.jpg'); // DefaultImage - ��� ����������� �� ���������, ������� ��������������
  end;
end;


procedure TBackData.N1Click(Sender: TObject);
begin
MainForm.PagesControl.ActivePage:= MainForm.SettingsPage;
end;

procedure TBackData.RefReviewerSRCDataChange(Sender: TObject; Field: TField);
begin
UpdateQueries;
end;

end.
