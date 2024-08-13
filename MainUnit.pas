unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, DateUtils,

  Vcl.Themes,
  Vcl.Styles, Vcl.ToolWin, Vcl.ButtonGroup, System.ImageList, Vcl.ImgList,
  Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Vcl.Mask, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, Vcl.Imaging.jpeg, VCLTee.TeeProcs, VCLTee.Chart, Vcl.Buttons,
  sSpeedButton, Vcl.CategoryButtons, Vcl.ColorGrd, Vcl.WinXCalendars,
  Vcl.Samples.Calendar, Vcl.ActnMan, Vcl.ActnColorMaps, CalendarSyoga;

  type
  TCalendar = class(Vcl.Samples.Calendar.TCalendar)
  private
    HighlightDates: TArray<TDate>;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
  end;



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
    Button4: TButton;
    Button6: TButton;
    Button7: TButton;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    Panel2: TPanel;
    DBImage1: TDBImage;
    PageControl1: TPageControl;
    CompanySettings: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    WorkersPanel: TPanel;
    Panel4: TPanel;
    Splitter1: TSplitter;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    DBLabeledEdit1: TDBLabeledEdit;
    DBLabeledEdit2: TDBLabeledEdit;
    DBLabeledEdit3: TDBLabeledEdit;
    DBLabeledEdit4: TDBLabeledEdit;
    Panel3: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    DBLabeledEdit5: TDBLabeledEdit;
    DBLabeledEdit6: TDBLabeledEdit;
    DBLabeledEdit7: TDBLabeledEdit;
    ListView1: TListView;
    Splitter2: TSplitter;
    Chart1: TChart;
    DBLabeledEdit8: TDBLabeledEdit;
    ColorDialog1: TColorDialog;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SidebarTimerTimer(Sender: TObject);
    procedure SidebarMouseLeave(Sender: TObject);
    procedure SidebarMouseEnter(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RealTimeTimerTimer(Sender: TObject);
    procedure SidebarButtonClicked(Sender: TObject; Index: Integer);
    procedure DBTablesBoxChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    Sidebarstate: boolean;
    MaxWidth:integer;
    maxwidthpercent, Sidebarpercent: real;
    HighlightDates: TArray<TDate>;
    const MinWidth = 43;

    { Private declarations }
  protected

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  closeVar: integer;

implementation

{$R *.dfm}

uses BGunit, ConnectUnit, Math;

procedure TCalendar.DrawCell(ACol, ARow: Longint; ARect: TRect;
  AState: TGridDrawState);
var
  TheText: string;
  i: Integer;
  Day: Integer;
  OldColor: TColor;
begin

  TheText := CellText[ACol, ARow];
  with ARect, Canvas do
  begin
    OldColor := Brush.Color;
    for i := Low(HighlightDates) to High(HighlightDates) do
      if TryStrToInt(TheText, Day) then
        if SameDate(HighlightDates[i], EncodeDate(Year, Month, Day)) then
        begin
          Brush.Color := clRed;
          FillRect(ARect);
          Break;
        end;
    TextRect(ARect, Left + (Right - Left - TextWidth(TheText)) div 2,
      Top + (Bottom - Top - TextHeight(TheText)) div 2, TheText);
    Brush.Color := OldColor;
  end;
end;

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
MainForm.Sidebar.ButtonHeight := round((MainForm.ClientHeight/100)*Mainform.Sidebarpercent);
Mainform.Sidebar.Height:= MainForm.ClientHeight;
MainForm.MaxWidth:=Round(MainForm.Width/100*Mainform.maxwidthpercent);
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

procedure TMainForm.Button1Click(Sender: TObject);
begin
ColorDialog1.Execute;
end;

procedure TMainForm.DBTablesBoxChange(Sender: TObject);
begin

BackData.RefReviewer.Close;
BackData.RefReviewer.SQL.Text	:= 'SELECT * FROM ' + BackData.TableNames[0];
BackData.RefReviewer.Open;
DBGridAdapt();

end;

//============================================================================

procedure TMainForm.FormCreate(Sender: TObject);
begin
  TStyleManager.TrySetStyle(BackData.Ini.ReadString('User_Interface','Style','Windows'));
  Sidebarstate:=false;
  DoubleBuffered := true;
  maxwidthpercent:= 23;
  Sidebarpercent:= Sidebar.ButtonHeight/(MainForm.ClientHeight/100);
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
