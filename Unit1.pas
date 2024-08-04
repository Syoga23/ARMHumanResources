unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,


  Vcl.Graphics,
  Vcl.Themes;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    procedure InitControls;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  TStyleManager.SetStyle(Combobox1.Text);
end;

procedure TForm1.FormCreate(Sender: TObject);
  var StyleName: String;
begin
//InitControls;

  for StyleName in TStyleManager.StyleNames do
  begin
  Combobox1.Items.Add(StyleName);
  end;
  Combobox1.ItemIndex := Combobox1.Items.IndexOf(TStyleManager.ActiveStyle.Name);
end;

procedure TForm1.InitControls();

begin

end;


end.
