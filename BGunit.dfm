object BackData: TBackData
  OnCreate = DataModuleCreate
  Height = 535
  Width = 1098
  object Connection: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB'
    OnConnectComplete = ConnectionConnectComplete
    Left = 112
    Top = 16
  end
  object MainMenu: TMainMenu
    Left = 24
    Top = 16
    object N5: TMenuItem
      Caption = '&'#1054#1090#1095#1077#1090
      object N2: TMenuItem
        Caption = '&'#1053#1086#1074#1099#1081' '
      end
      object N8: TMenuItem
        Caption = '&'#1054#1090#1082#1088#1099#1090#1100
      end
      object N9: TMenuItem
        Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      end
      object N10: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1050#1072#1082
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Caption = '&'#1055#1077#1095#1072#1090#1100
      end
      object N13: TMenuItem
        Caption = #1057'&'#1074#1086#1081#1089#1090#1074#1072' '#1087#1077#1095#1072#1090#1080'...'
      end
    end
    object N3: TMenuItem
      Caption = '&'#1056#1072#1073#1086#1090#1085#1080#1082#1080
      object N20: TMenuItem
        Caption = #1044#1077#1081#1089#1090#1074#1080#1103
        object N22: TMenuItem
          Caption = #1053#1072#1085#1103#1090#1100
        end
        object N23: TMenuItem
          Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080
        end
        object N24: TMenuItem
          Caption = #1059#1074#1086#1083#1080#1090#1100
        end
        object N25: TMenuItem
          Caption = #1055#1086#1074#1099#1089#1080#1090#1100
        end
      end
      object N19: TMenuItem
        Caption = '-'
      end
      object N21: TMenuItem
        Caption = '&'#1054#1089#1086#1073#1099#1077' '#1076#1085#1080
        object N6: TMenuItem
          Caption = '&'#1047#1072#1088#1087#1083#1072#1090#1099
        end
        object N14: TMenuItem
          Caption = '&'#1042#1099#1093#1086#1076#1085#1099#1077
        end
        object N18: TMenuItem
          Caption = '&'#1041#1086#1083#1100#1085#1080#1095#1085#1099#1077
        end
      end
      object N7: TMenuItem
        Caption = '&'#1055#1088#1072#1079#1076#1085#1080#1082#1080
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object N17: TMenuItem
        Caption = '&'#1054#1090#1076#1077#1083#1099
      end
      object N15: TMenuItem
        Caption = '&'#1048#1089#1090#1086#1088#1080#1103' '#1088#1072#1073#1086#1090#1085#1080#1082#1072'...'
      end
    end
    object N4: TMenuItem
      Caption = #1050#1072#1083#1077#1085#1076#1072#1088#1100
    end
    object N1: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
    end
    object j1: TMenuItem
      Caption = #1054' '#1085#1072#1089
    end
  end
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 200
    Top = 16
  end
  object ADOQuery2: TADOQuery
    Parameters = <>
    Left = 200
    Top = 72
  end
  object ADOQuery3: TADOQuery
    Parameters = <>
    Left = 200
    Top = 128
  end
  object ADOQuery4: TADOQuery
    Parameters = <>
    Left = 200
    Top = 184
  end
  object ADOQuery5: TADOQuery
    Parameters = <>
    Left = 200
    Top = 240
  end
  object ADOQuery6: TADOQuery
    Parameters = <>
    Left = 200
    Top = 296
  end
  object ADOQuery7: TADOQuery
    Parameters = <>
    Left = 360
    Top = 16
  end
  object ADOQuery8: TADOQuery
    Parameters = <>
    Left = 360
    Top = 72
  end
  object ADOQuery9: TADOQuery
    Parameters = <>
    Left = 360
    Top = 128
  end
  object ADOQuery10: TADOQuery
    Parameters = <>
    Left = 360
    Top = 184
  end
  object ADOQuery11: TADOQuery
    Parameters = <>
    Left = 360
    Top = 240
  end
  object ADOQuery12: TADOQuery
    Parameters = <>
    Left = 360
    Top = 296
  end
  object DataSource1: TDataSource
    Left = 280
    Top = 16
  end
  object DataSource2: TDataSource
    Left = 280
    Top = 72
  end
  object DataSource3: TDataSource
    Left = 280
    Top = 128
  end
  object DataSource4: TDataSource
    Left = 280
    Top = 184
  end
  object DataSource5: TDataSource
    Left = 280
    Top = 240
  end
  object DataSource6: TDataSource
    Left = 280
    Top = 296
  end
  object DataSource7: TDataSource
    Left = 440
    Top = 16
  end
  object DataSource8: TDataSource
    Left = 440
    Top = 72
  end
  object DataSource9: TDataSource
    Left = 440
    Top = 128
  end
  object DataSource10: TDataSource
    Left = 440
    Top = 184
  end
  object DataSource11: TDataSource
    Left = 440
    Top = 240
  end
  object DataSource12: TDataSource
    Left = 440
    Top = 296
  end
  object ADOQuery13: TADOQuery
    Parameters = <>
    Left = 520
    Top = 16
  end
  object DataSource13: TDataSource
    Left = 600
    Top = 16
  end
  object RefReviewer: TADOQuery
    Connection = Connection
    DataSource = DataSource1
    Parameters = <>
    Left = 24
    Top = 72
  end
  object RefReviewerSource: TDataSource
    DataSet = RefReviewer
    Left = 112
    Top = 72
  end
end
