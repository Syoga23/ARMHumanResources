unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,

  Vcl.Themes,
  Vcl.Styles, Vcl.MPlayer, Vcl.JumpList, Vcl.ToolWin;

type
  TMainForm = class(TForm)
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
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

procedure TMainForm.FormCreate(Sender: TObject);
begin
  TStyleManager.TrySetStyle(BackData.Ini.ReadString('User_Interface','Style','Windows'));
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
 ConnectForm:= TConnectForm.Create(Self);
 ConnectForm.ShowModal;
 closeVar:=ConnectForm.closeVar;
 if(closeVar = 0) then Application.Terminate;
end;

end.
