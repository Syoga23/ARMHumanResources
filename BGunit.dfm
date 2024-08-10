object BackData: TBackData
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object Connection: TADOConnection
    Provider = 'SQLOLEDB.1'
    OnConnectComplete = ConnectionConnectComplete
    Left = 104
    Top = 16
  end
  object MainMenu: TMainMenu
    Left = 24
    Top = 16
    object N2: TMenuItem
      Caption = #1058#1099#1082'-'#1090#1099#1082
    end
    object N1: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    end
    object j1: TMenuItem
      Caption = #1054' '#1085#1072#1089
    end
  end
end
