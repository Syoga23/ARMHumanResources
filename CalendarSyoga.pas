unit CalendarSyoga;

interface


uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Grids, Vcl.Samples.Calendar, System.Types, Vcl.Graphics, DateUtils;

//type
 //TCalendarSyoga = class(TCalendar)
//end;

type
  TCalendarSyoga = class(Vcl.Samples.Calendar.TCalendar)
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;

  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    HighlightDates: TArray<TDate>;
  published
    { Published declarations }
  end;

procedure Register;


implementation

procedure TCalendarSyoga.DrawCell(ACol, ARow: Longint; ARect: TRect;
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
          Brush.Color := clSkyBlue;
          FillRect(ARect);
          Break;
        end;
    TextRect(ARect, Left + (Right - Left - TextWidth(TheText)) div 2,
      Top + (Bottom - Top - TextHeight(TheText)) div 2, TheText);
    Brush.Color := OldColor;
  end;
end;

procedure Register;
begin
  RegisterComponents('SyogaToysPack', [TCalendarSyoga]);
end;

end.
