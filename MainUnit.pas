unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,

  Vcl.Themes,
  Vcl.Styles, Vcl.ToolWin, Vcl.ButtonGroup, System.ImageList, Vcl.ImgList;

type
  TMainForm = class(TForm)
    Sidebar: TButtonGroup;
    SidebarTimer: TTimer;
    PagesControl: TPageControl;
    DBPage: TTabSheet;
    SettingsPage: TTabSheet;
    Label1: TLabel;
    sidebaricons: TImageList;
    StatusBar1: TStatusBar;
    RealTimeTimer: TTimer;
    DBPagescontrol: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DashboardPage: TTabSheet;
    WorkersPage: TTabSheet;
    BirthdayPage: TTabSheet;
    ReportsPage: TTabSheet;
    PrintPage: TTabSheet;
    CalendarPage: TTabSheet;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SidebarTimerTimer(Sender: TObject);
    procedure SidebarMouseLeave(Sender: TObject);
    procedure SidebarMouseEnter(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RealTimeTimerTimer(Sender: TObject);
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

procedure resizecomponents();
begin
Mainform.Sidebar.Height:= MainForm.ClientHeight;
MainForm.MaxWidth:=Round(MainForm.Width/100*Mainform.percent);
MainForm.PagesControl.Width := MainForm.ClientWidth - Mainform.MinWidth;
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

procedure TMainForm.FormCreate(Sender: TObject);
begin
  TStyleManager.TrySetStyle(BackData.Ini.ReadString('User_Interface','Style','Windows'));
  Sidebarstate:=false;
  DoubleBuffered := true;
  resizecomponents();
  statusbar1.Panels.Items[0].Text:= PagesControl.ActivePage.Name;
end;

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
