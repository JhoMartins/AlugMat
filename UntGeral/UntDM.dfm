object DM: TDM
  OldCreateOrder = False
  Height = 432
  Width = 560
  object FDConnection1: TFDConnection
    Params.Strings = (
      'SERVER=Cris-PC\SQLServer'
      'OSAuthent=Yes'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=DEIVID-PC'
      'DATABASE=ALUGMAT'
      'MARS=yes'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Transaction = FDTransaction1
    Left = 136
    Top = 80
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 248
    Top = 80
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 192
    Top = 168
  end
  object FDConWeb: TFDConnection
    Params.Strings = (
      'Database=bd_alugmat'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 96
    Top = 280
  end
  object FDPhysWeb: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Projetos_Delphi\PROJETO FINAL\AlugMat\banco\libmysql.dll'
    Left = 168
    Top = 280
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 240
    Top = 280
  end
end
