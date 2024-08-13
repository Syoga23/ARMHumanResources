program ARMHR;

uses
  Vcl.Forms,
  ConnectUnit in 'ConnectUnit.pas' {ConnectForm},
  Vcl.Themes,
  Vcl.Styles,
  BGunit in 'BGunit.pas' {BackData: TDataModule},
  MainUnit in 'MainUnit.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBackData, BackData);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
