object BackData: TBackData
  OnCreate = DataModuleCreate
  Height = 397
  Width = 1098
  object Connection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Head200360;Persist Security Info=Tr' +
      'ue;User ID=Admin238;Initial Catalog=HumanResources;Data Source=S' +
      'ERGEIPC\SQLSERVER2008'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
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
  object EmployeesSQL: TADOQuery
    Active = True
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM EMPLOYEES')
    Left = 208
    Top = 16
    object EmployeesSQLemployee_id: TAutoIncField
      FieldName = 'employee_id'
      ReadOnly = True
    end
    object EmployeesSQLfirst_name: TStringField
      FieldName = 'first_name'
      Size = 100
    end
    object EmployeesSQLlast_name: TStringField
      FieldName = 'last_name'
      Size = 100
    end
    object EmployeesSQLOtchestvo: TStringField
      FieldName = 'Otchestvo'
      Size = 100
    end
    object EmployeesSQLbirthdate: TWideStringField
      FieldName = 'birthdate'
      Size = 10
    end
    object EmployeesSQLemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object EmployeesSQLphoto: TBlobField
      FieldName = 'photo'
    end
    object EmployeesSQLphone_number: TStringField
      FieldName = 'phone_number'
    end
    object EmployeesSQLHired_date: TWideStringField
      FieldName = 'Hired_date'
      Size = 10
    end
    object EmployeesSQLTerminated_date: TWideStringField
      FieldName = 'Terminated_date'
      Size = 10
    end
    object EmployeesSQLTermination_reason: TWideStringField
      FieldName = 'Termination_reason'
      Size = 250
    end
    object EmployeesSQLjob_id: TIntegerField
      FieldName = 'job_id'
    end
    object EmployeesSQLdepartment_id: TIntegerField
      FieldName = 'department_id'
    end
    object EmployeesSQLabout: TWideStringField
      FieldName = 'about'
      Size = 250
    end
    object EmployeesSQLPol_id: TIntegerField
      FieldName = 'Pol_id'
    end
    object EmployeesSQLPol_Nazv: TStringField
      FieldKind = fkLookup
      FieldName = 'Pol_Nazv'
      LookupDataSet = PolSQL
      LookupKeyFields = 'Pol_ID'
      LookupResultField = 'Pol_Name'
      KeyFields = 'Pol_id'
      Lookup = True
    end
  end
  object DepartmentSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 208
    Top = 72
  end
  object LocationsSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 208
    Top = 128
  end
  object CountrySQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 208
    Top = 184
  end
  object RegionsSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 208
    Top = 240
  end
  object PassportSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 208
    Top = 296
  end
  object JobHistorySQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 392
    Top = 16
  end
  object JobsSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 392
    Top = 72
  end
  object SalariesSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 392
    Top = 128
  end
  object MilitaryServiceSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 392
    Top = 240
  end
  object MilitaryRanksSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 392
    Top = 296
  end
  object CategoryReserveSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 608
    Top = 16
  end
  object EmployeesSrc: TDataSource
    DataSet = EmployeesSQL
    OnDataChange = EmployeesSrcDataChange
    Left = 296
    Top = 16
  end
  object DepartmentSRC: TDataSource
    DataSet = DepartmentSQL
    Left = 296
    Top = 72
  end
  object LocationsSRC: TDataSource
    DataSet = LocationsSQL
    Left = 296
    Top = 128
  end
  object CountrySRC: TDataSource
    DataSet = CountrySQL
    Left = 296
    Top = 184
  end
  object RegionsSRC: TDataSource
    DataSet = RegionsSQL
    Left = 296
    Top = 240
  end
  object PassportSRC: TDataSource
    DataSet = PassportSQL
    Left = 296
    Top = 296
  end
  object JobHistorySRC: TDataSource
    DataSet = JobHistorySQL
    Left = 504
    Top = 16
  end
  object JobsSRC: TDataSource
    DataSet = JobsSQL
    Left = 504
    Top = 72
  end
  object SalariesSRC: TDataSource
    DataSet = SalariesSQL
    Left = 504
    Top = 128
  end
  object MilitaryServiceSRC: TDataSource
    DataSet = MilitaryServiceSQL
    Left = 504
    Top = 240
  end
  object MilitaryRanksSRC: TDataSource
    DataSet = MilitaryRanksSQL
    Left = 504
    Top = 296
  end
  object CategoryReserveSRC: TDataSource
    DataSet = CategoryReserveSQL
    Left = 720
    Top = 16
  end
  object FamilySQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 608
    Top = 72
  end
  object FamilySRC: TDataSource
    DataSet = FamilySQL
    Left = 720
    Top = 72
  end
  object RefReviewer: TADOQuery
    Connection = Connection
    Parameters = <>
    Left = 24
    Top = 72
  end
  object RefReviewerSRC: TDataSource
    DataSet = RefReviewer
    Left = 112
    Top = 72
  end
  object CompanySQL: TADOQuery
    Connection = Connection
    DataSource = EmployeesSrc
    Parameters = <>
    Left = 24
    Top = 128
  end
  object CompanySRC: TDataSource
    DataSet = CompanySQL
    Left = 112
    Top = 128
  end
  object RelationsSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 608
    Top = 128
  end
  object RelationsSRC: TDataSource
    DataSet = RelationsSQL
    Left = 720
    Top = 128
  end
  object MarrStatusSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 608
    Top = 184
  end
  object MarrStatusSRC: TDataSource
    DataSet = MarrStatusSQL
    Left = 720
    Top = 184
  end
  object VacationsSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 608
    Top = 240
  end
  object VacationsSRC: TDataSource
    DataSet = VacationsSQL
    Left = 720
    Top = 240
  end
  object WorkCalendarSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 608
    Top = 296
  end
  object WorkCalendarSRC: TDataSource
    DataSet = WorkCalendarSQL
    Left = 720
    Top = 296
  end
  object DayTypeSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 816
    Top = 72
  end
  object DayTypeSRC: TDataSource
    DataSet = DayTypeSQL
    Left = 928
    Top = 72
  end
  object EventsSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 816
    Top = 16
  end
  object EventsSRC: TDataSource
    DataSet = EventsSQL
    Left = 928
    Top = 16
  end
  object SickDaysSQL: TADOQuery
    Connection = Connection
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM')
    Left = 392
    Top = 184
  end
  object SickDaysSRC: TDataSource
    DataSet = SickDaysSQL
    Left = 504
    Top = 184
  end
  object PolSQL: TADOQuery
    Active = True
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Pol ')
    Left = 816
    Top = 128
    object PolSQLPol_ID: TAutoIncField
      FieldName = 'Pol_ID'
      ReadOnly = True
    end
    object PolSQLPol_Name: TWideStringField
      FieldName = 'Pol_Name'
      Size = 100
    end
  end
  object PolSRC: TDataSource
    DataSet = PolSQL
    Left = 928
    Top = 128
  end
end
