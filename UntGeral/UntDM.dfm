object DM: TDM
  OldCreateOrder = False
  Height = 432
  Width = 560
  object FDConnection1: TFDConnection
    Params.Strings = (
      'SERVER=DEIVID-PC'
      'OSAuthent=Yes'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=DEIVID-PC'
      'DATABASE=ALUGMAT'
      'MARS=yes'
      'DriverID=MSSQL')
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
