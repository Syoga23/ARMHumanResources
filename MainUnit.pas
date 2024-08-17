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
  Vcl.Samples.Calendar, Vcl.ActnMan, Vcl.ActnColorMaps,
  Vcl.ExtDlgs;

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
    DBPanel_Bottom: TPanel;
    DBPanel_Top: TPanel;
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
    DB_IDEdit: TDBLabeledEdit;
    DB_OtchEdit: TDBLabeledEdit;
    DB_NameEdit: TDBLabeledEdit;
    DB_LastNameEdit: TDBLabeledEdit;
    Panel3: TPanel;
    DB_EditPhone: TDBLabeledEdit;
    DB_EditEmail: TDBLabeledEdit;
    DB_EditHired: TDBLabeledEdit;
    Chart1: TChart;
    DBLabeledEdit8: TDBLabeledEdit;
    ColorDialog1: TColorDialog;
    PhotoPanel: TPanel;
    DeleteImage: TButton;
    AddImage: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    DBMemoAbout: TDBMemo;
    DB_EditDepartment: TDBLabeledEdit;
    DB_PolLookup: TDBLookupComboBox;
    PolDBLabel: TLabel;
    CheckBox1: TCheckBox;
    DBNavigator2: TDBNavigator;
    DB_EditJob: TDBLabeledEdit;
    DB_EditBirthdate: TDBLabeledEdit;
    GroupBoxMemo: TGroupBox;
    DB_DepartmentsList: TDBLookupListBox;
    bottomWorkerPanel: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBcombobox: TComboBoxEx;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SidebarTimerTimer(Sender: TObject);
    procedure SidebarMouseLeave(Sender: TObject);
    procedure SidebarMouseEnter(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RealTimeTimerTimer(Sender: TObject);
    procedure SidebarButtonClicked(Sender: TObject; Index: Integer);
    procedure DeleteImageClick(Sender: TObject);
    procedure AddImageClick(Sender: TObject);
    procedure DBcomboboxChange(Sender: TObject);
    procedure DB_EditBirthdateExit(Sender: TObject);
    procedure DB_EditHiredExit(Sender: TObject);
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
  DateValue: TDateTime;

implementation

{$R *.dfm}

uses BGunit, ConnectUnit, Math;

procedure EditDateConvertOnExit(Edit: TDBLabeledEdit);
  var FormatSettings: TFormatSettings;
begin
  FormatSettings.DateSeparator := '-';
  FormatSettings.ShortDateFormat := 'yyyy-mm-dd';
  Trim(Edit.Text);
    if (Edit.Text = '')
      then exit;
    if TryStrToDate(Edit.Text, DateValue, FormatSettings)
      then exit;
    if TryStrToDate(Edit.Text ,DateValue, TFormatSettings.Create('ru-RU'))
      then begin
      Edit.Text := FormatDateTime('yyyy-mm-dd', DateValue)
      end
    else ShowMessage('�������� ������ ����. ������� ���� � ������� dd.mm.yyyy ��� yyyy.mm.dd.');
end;

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

procedure TMainForm.DeleteImageClick(Sender: TObject);
begin
  BackData.EmployeesSQL.Edit;
  BackData.EmployeesSQL.FieldByName('photo').Clear;  // �������� ���������� BLOB-����
  BackData.EmployeesSQL.Post;

end;

procedure TMainForm.AddImageClick(Sender: TObject);
  var
    BlobStream: TMemoryStream;
    Field: TBlobField;
    pict: TPicture;
  const
    MAX_WIDTH = 1200;  // ������������ ������ �����������
    MAX_HEIGHT = 1200; // ������������ ������ �����������
begin
  try
    // �������� ���������� ���� � ���������, ��� �� ������ ����
    if OpenPictureDialog1.Execute then
    begin
      pict := TPicture.Create;
      // �������� ����� ������ ��� �������� �����������
      pict.LoadFromFile(OpenPictureDialog1.FileName);
      if (pict.Width<=MAX_WIDTH)and(pict.Height<=MAX_HEIGHT)
       then
     begin
      Pict.Free;
      BlobStream := TMemoryStream.Create;
      try
        // ��������� ��������� ����������� � �����

        BlobStream.LoadFromFile(OpenPictureDialog1.FileName);
        BlobStream.Position := 0; // ���������, ��� ������� ������ ����������� �� ������
        // ��������� ����������� � TDBImage
        DBImage1.Picture.LoadFromStream(BlobStream);
        // ���������, ��� ������ ������� � �������� �� ��������������
        if BackData.EmployeesSQL.Active then
        begin
          BackData.EmployeesSQL.Edit;
          Field := TBLobField(BackData.EmployeesSQL.FieldByName('photo'));
          // �������� ����� � ���� BLOB
          Field.LoadFromStream(BlobStream);
          // ��������� ��������������
          BackData.EmployeesSQL.Post;
        end;
      finally
        BlobStream.Free; // ������������ ������� ������
      end;
     end
     else begin
       ShowMessage('Selected image is too large. Please choose an image with dimensions up to ' +
                      IntToStr(MAX_WIDTH) + 'x' + IntToStr(MAX_HEIGHT) + '.');
       Pict.Free;
     end;

    end;
  finally

  end;
end;



procedure TMainForm.DBcomboboxChange(Sender: TObject);
begin
BackData.RefReviewer.Close;
BackData.RefReviewer.SQL.Text	:= 'SELECT * FROM ' + BackData.SQLTables[DBCombobox.ItemIndex];
BackData.RefReviewer.Open;
DBGridAdapt();
end;

procedure TMainForm.DB_EditBirthdateExit(Sender: TObject);
begin
  EditDateConvertOnExit(MainForm.DB_EditBirthdate);
end;

procedure TMainForm.DB_EditHiredExit(Sender: TObject);
begin
  EditDateConvertOnExit(MainForm.DB_EditHired);
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
  var i:integer;
begin

 ConnectForm:= TConnectForm.Create(Self);
 ConnectForm.ShowModal;
 closeVar:=ConnectForm.closeVar;
 if(closeVar = 0) then Application.Terminate;

 BackData.RefReviewer.SQL.Text	:= 'SELECT * FROM ' + BackData.SQLTables[0];
 BackData.RefReviewer.Active:= True;

 for i := 0 to 9 do
  begin
    DBcombobox.Items.Add(BackData.TableNames[i]);
  end;
  DBcombobox.ItemIndex:= 0;

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
