object DM: TDM
  OldCreateOrder = False
  Height = 432
  Width = 560
  object FDConnection1: TFDConnection
    Params.Strings = (
      'SERVER=NCC04-06'
      'OSAuthent=Yes'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=NCC04-06'
      'DATABASE=VENDAS2018'
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
end
