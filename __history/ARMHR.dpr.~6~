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
  TStyleManager.TrySetStyle('Carbon');
  Application.Title := 'Default';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TBackData, BackData);
  Application.Run;
end.
