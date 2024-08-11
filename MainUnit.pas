unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,

  Vcl.Themes,
  Vcl.Styles, Vcl.ToolWin, Vcl.ButtonGroup, System.ImageList, Vcl.ImgList,
  Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TMainForm = class(TForm)
    Sidebar: TButtonGroup;
    SidebarTimer: TTimer;
    PagesControl: TPageControl;
    DatabasesPage: TTabSheet;
    SettingsPage: TTabSheet;
    sidebaricons: TImageList;
    StatusBar1: TStatusBar;
    RealTimeTimer: TTimer;
    DashboardPage: TTabSheet;
    WorkersPage: TTabSheet;
    BirthdayPage: TTabSheet;
    ReportsPage: TTabSheet;
    PrintPage: TTabSheet;
    CalendarPage: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    DBGrid1: TDBGrid;
    DBTablesBox: TComboBox;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    DBImage1: TDBImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SidebarTimerTimer(Sender: TObject);
    procedure SidebarMouseLeave(Sender: TObject);
    procedure SidebarMouseEnter(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RealTimeTimerTimer(Sender: TObject);
    procedure SidebarButtonClicked(Sender: TObject; Index: Integer);
    procedure DBTablesBoxChange(Sender: TObject);
  private
    Sidebarstate: boolean;
    MaxWidth:integer;
    const MinWidth = 43;
    percent = 25;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  closeVar: integer;

implementation

{$R *.dfm}

uses BGunit, ConnectUnit;

procedure DBGridAdapt();
  var i: Integer;
begin
MainForm.DBGrid1.Columns.Clear;
for i := 0 to BackData.RefReviewer.FieldCount-1 do
  begin
  MainForm.DBGrid1.Columns.Add;
  MainForm.DBGrid1.Columns[i].Title.Caption:= BackData.RefReviewer.Fields[i].FieldName;
  MainForm.DBGrid1.Columns[i].Width:= 150;
  MainForm.DBGrid1.Columns[i].FieldName:= BackData.RefReviewer.Fields[i].FieldName;
  end;

end;

procedure resizecomponents();
begin
Mainform.Sidebar.Height:= MainForm.ClientHeight;
MainForm.MaxWidth:=Round(MainForm.Width/100*Mainform.percent);
MainForm.PagesControl.Width := MainForm.ClientWidth - Mainform.MinWidth;
end;

procedure TMainForm.SidebarButtonClicked(Sender: TObject; Index: Integer);
begin
  Case Index of
    0: Pagescontrol.ActivePage:= DashboardPage;
    1: Pagescontrol.ActivePage:= WorkersPage;
    2: Pagescontrol.ActivePage:= BirthdayPage;
    3: Pagescontrol.ActivePage:= ReportsPage;
    4: Pagescontrol.ActivePage:= DatabasesPage;
    5: Pagescontrol.ActivePage:= CalendarPage;
    6: Pagescontrol.ActivePage:= PrintPage;
    7: Pagescontrol.ActivePage:= SettingsPage;
  End;
  statusbar1.Panels.Items[0].Text:= PagesControl.ActivePage.Name;
end;


procedure TMainForm.SidebarMouseEnter(Sender: TObject);
begin
  sidebartimer.Enabled:= true;
  Sidebarstate := true;
end;

procedure TMainForm.SidebarMouseLeave(Sender: TObject);
begin
  Sidebarstate := false;
end;

procedure TMainForm.DBTablesBoxChange(Sender: TObject);
begin

BackData.RefReviewer.Close;
BackData.RefReviewer.SQL.Text	:= 'SELECT * FROM ' + BackData.TableNames[DBTablesBox.ItemIndex];
BackData.RefReviewer.Open;
DBGridAdapt();

end;

//============================================================================

procedure TMainForm.FormCreate(Sender: TObject);
begin
  TStyleManager.TrySetStyle(BackData.Ini.ReadString('User_Interface','Style','Windows'));
  Sidebarstate:=false;
  DoubleBuffered := true;
  resizecomponents();
  PagesControl.ActivePage:= DashboardPage;
  statusbar1.Panels.Items[0].Text:= PagesControl.ActivePage.Name;

end;

//============================================================================

procedure TMainForm.FormResize(Sender: TObject);
begin
  resizecomponents();
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
 ConnectForm:= TConnectForm.Create(Self);

 ConnectForm.ShowModal;
 closeVar:=ConnectForm.closeVar;
 if(closeVar = 0) then Application.Terminate;

 BackData.RefReviewer.SQL.Text	:= 'SELECT * FROM ' + BackData.TableNames[0];
 BackData.RefReviewer.Active:= True;
 DBGridAdapt();
end;

procedure TMainForm.RealTimeTimerTimer(Sender: TObject);
  var realtime: string;
begin
  DateTimeToString(realtime, 't', Now);
  statusbar1.Panels.Items[2].Text:= realtime;
end;


procedure TMainForm.SidebarTimerTimer(Sender: TObject);
begin

  if (Sidebarstate = true)and(Sidebar.Width < MaxWidth)
    then Sidebar.Width:=Sidebar.Width + 30;
  if (Sidebarstate = true)and(Sidebar.Width > MaxWidth)
    then Sidebar.Width := MaxWidth;


  if (Sidebarstate = false)and(Sidebar.Width > MinWidth)
    then Sidebar.Width:=Sidebar.Width - 30;
  if (Sidebarstate = false)and(Sidebar.Width < MinWidth)
    then begin
    Sidebar.Width := MinWidth;
    sidebartimer.Enabled:= false;
    end;
end;

end.
