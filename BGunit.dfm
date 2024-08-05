object BackData: TBackData
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object Connection: TADOConnection
    Provider = 'SQLOLEDB.1'
    OnConnectComplete = ConnectionConnectComplete
    Left = 32
    Top = 8
  end
end
