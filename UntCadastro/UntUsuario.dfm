inherited FrmUsuario: TFrmUsuario
  Caption = 'FrmUsuario'
  ClientHeight = 261
  OnActivate = FormActivate
  OnClose = FormClose
  ExplicitHeight = 296
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    inherited btn_pesquisa: TToolButton
      ExplicitWidth = 78
    end
    inherited btn_ordenar: TToolButton
      ExplicitWidth = 78
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 242
    ExplicitTop = 242
  end
  inherited PnlFicha: TPanel
    Height = 155
    ExplicitHeight = 155
    object Label2: TLabel
      Left = 62
      Top = 25
      Width = 31
      Height = 13
      Caption = 'Nome:'
      FocusControl = DBEdit1
    end
    object Label3: TLabel
      Left = 20
      Top = 65
      Width = 73
      Height = 13
      Caption = 'Departamento:'
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 64
      Top = 104
      Width = 29
      Height = 13
      Caption = 'Login:'
      FocusControl = DBEdit3
    end
    object Label5: TLabel
      Left = 246
      Top = 104
      Width = 34
      Height = 13
      Caption = 'Senha:'
      FocusControl = DBEdit4
    end
    object Label6: TLabel
      Left = 426
      Top = 104
      Width = 28
      Height = 13
      Caption = 'Perfil:'
    end
    object SpeedButton1: TSpeedButton
      Left = 647
      Top = 100
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC90D8FC90D8FC90D
        8FC90D8FC9108FC11F6D19FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0D8FC967CFF070CCEF58C2EB3FB8E72DAFE31F6D192D82181F6D19FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC98AE2FB90D9F674CEF051
        C2EB36B7E61F6D192F82161F6D19FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0D8FC99CEAFFAFE5FA92DAF669CFF243C1ED1F6D1933881D1F6D19FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC9A5EFFF72B58F1F6D191F
        6D191F6D191F6D192B92241F6D191F6D191F6D191F6D19FF00FFFF00FFFF00FF
        FF00FF0D8FC9A5EEFF1F6D193FC05F2AB84A2DB0452BAA3D209D2B299A2D2C96
        2A2C90243283261F6D19FF00FFFF00FFFF00FF0D8FC9A5EEFF7EBA981F6D191F
        6D191F6D191F6D1929B4491F6D191F6D191F6D191F6D19FF00FFFF00FFFF00FF
        FF00FF0D8FC9A5EEFFCEF2FFC5F0FFA0EBFF6FE3FE1F6D192BBF571F6D19FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC9A5EEFFCEF2FFC5F0FFA0
        EBFF6FE2FE1F6D192CC2591F6D19FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0D8FC9A5EEFFCEF2FFC5F0FFA0EBFF6FE2FE1F6D193AC2631F6D19FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC9A7EFFFD5F6FFCFF6FFA9
        F0FF75E6FF6EE5FF1F6D190D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0D8FC9A4EFFFBFEBFAA6E2F480DAF35BD4F460DAF872E7FF0D8FC9FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC95FC6E968C4E664C2E658
        C1E64ABDE540BCE641C1E90D8FC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0D8FC988D7F099E7F793EAFC88EAFE79E6FC6BE0F855D0F20D8FC9FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0D8FC90D8FC90D8FC90D
        8FC90D8FC90D8FC90D8FC9FF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = SpeedButton1Click
    end
    object DBEdit1: TDBEdit
      Left = 99
      Top = 22
      Width = 571
      Height = 21
      DataField = 'USU_NOME'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 99
      Top = 62
      Width = 571
      Height = 21
      DataField = 'USU_DEPARTAMENTO'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 99
      Top = 101
      Width = 134
      Height = 21
      DataField = 'USU_LOGIN'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 286
      Top = 101
      Width = 134
      Height = 21
      DataField = 'USU_SENHA'
      DataSource = DataSource1
      PasswordChar = '*'
      TabOrder = 3
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 460
      Top = 101
      Width = 175
      Height = 21
      DataField = 'USU_ID_PERFIL'
      DataSource = DataSource1
      KeyField = 'ID'
      ListField = 'PER_DESCRICAO'
      ListSource = DSPefil
      TabOrder = 4
    end
  end
  inherited ImageList1: TImageList
    Left = 122
    Top = 208
  end
  inherited ImageList2: TImageList
    Left = 178
    Top = 208
  end
  inherited ImageList3: TImageList
    Left = 234
    Top = 208
  end
  inherited DataSource1: TDataSource
    Left = 63
    Top = 208
  end
  inherited FDTabela: TFDTable
    IndexFieldNames = 'ID'
    UpdateOptions.UpdateTableName = 'VENDAS2018.dbo.USUARIO'
    TableName = 'VENDAS2018.dbo.USUARIO'
    Left = 7
    Top = 208
    object FDTabelaID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTabelaDATA_INC: TSQLTimeStampField
      FieldName = 'DATA_INC'
      Origin = 'DATA_INC'
    end
    object FDTabelaDATA_ALT: TSQLTimeStampField
      FieldName = 'DATA_ALT'
      Origin = 'DATA_ALT'
    end
    object FDTabelaSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object FDTabelaMARCA: TStringField
      FieldName = 'MARCA'
      Origin = 'MARCA'
      FixedChar = True
      Size = 1
    end
    object FDTabelaUSU_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'USU_NOME'
      Origin = 'USU_NOME'
      Size = 50
    end
    object FDTabelaUSU_DEPARTAMENTO: TStringField
      DisplayLabel = 'Departamento:'
      FieldName = 'USU_DEPARTAMENTO'
      Origin = 'USU_DEPARTAMENTO'
      Size = 100
    end
    object FDTabelaUSU_LOGIN: TStringField
      DisplayLabel = 'Login:'
      FieldName = 'USU_LOGIN'
      Origin = 'USU_LOGIN'
      Size = 10
    end
    object FDTabelaUSU_SENHA: TStringField
      DisplayLabel = 'Senha:'
      FieldName = 'USU_SENHA'
      Origin = 'USU_SENHA'
      Size = 10
    end
    object FDTabelaUSU_ID_PERFIL: TIntegerField
      FieldName = 'USU_ID_PERFIL'
      Origin = 'USU_ID_PERFIL'
    end
  end
  inherited ImageList4: TImageList
    Left = 288
    Top = 207
  end
  inherited PopupMenu1: TPopupMenu
    Left = 444
    Top = 207
    object N3: TMenuItem
      Caption = '-'
    end
    object NomedoUsurio1: TMenuItem
      Caption = 'Nome do Usu'#225'rio'
      OnClick = NomedoUsurio1Click
    end
    object Departamento1: TMenuItem
      Caption = 'Departamento'
      OnClick = Departamento1Click
    end
    object Login1: TMenuItem
      Caption = 'Login'
      OnClick = Login1Click
    end
  end
  inherited PopupMenu2: TPopupMenu
    Left = 510
    Top = 207
    object N4: TMenuItem
      Caption = '-'
    end
    object Nome1: TMenuItem
      Caption = 'Nome'
      OnClick = Nome1Click
    end
    object Departamento2: TMenuItem
      Caption = 'Departamento'
      OnClick = Departamento2Click
    end
    object Login2: TMenuItem
      Caption = 'Login'
      OnClick = Login2Click
    end
  end
  object DSPefil: TDataSource
    DataSet = FDQryPerfil
    Left = 335
    Top = 208
  end
  object FDQryPerfil: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'SELECT ID, PER_DESCRICAO'
      'FROM PERFIL'
      'ORDER BY PER_DESCRICAO')
    Left = 382
    Top = 207
  end
end
