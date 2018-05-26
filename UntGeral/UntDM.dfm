object DM: TDM
  OldCreateOrder = False
  Height = 183
  Width = 222
  object FDConnection1: TFDConnection
    Params.Strings = (
      'SERVER=DESKTOP-EFLRI4C\SQLEXPRESS'
      'OSAuthent=Yes'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=DEIVID-PC'
      'DATABASE=ALUGMAT'
      'MARS=yes'
      'DriverID=MSSQL')
    LoginPrompt = False
    Transaction = FDTransaction1
    Left = 40
    Top = 16
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 152
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 96
    Top = 64
  end
  object FDConWeb: TFDConnection
    Params.Strings = (
      'Database=bd_alugmat'
      'User_Name=root'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 24
    Top = 120
  end
  object FDPhysWeb: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Users\Jhonatan\Documents\GitHub\AlugMat\banco\libmysql.dll'
    Left = 96
    Top = 120
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 168
    Top = 120
  end
end
