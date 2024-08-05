unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TMainForm = class(TForm)
    procedure FormShow(Sender: TObject);
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

procedure TMainForm.FormShow(Sender: TObject);
begin
 ConnectForm:= TConnectForm.Create(Self);
 ConnectForm.ShowModal;
 closeVar:=ConnectForm.closeVar;
 if(closeVar = 0) then Application.Terminate;
end;

end.
