inherited FrmIECliente: TFrmIECliente
  Caption = 'Importa'#231#227'o e Exporta'#231#227'o de Usu'#225'rios'
  PixelsPerInch = 120
  TextHeight = 16
  inherited Panel1: TPanel
    Caption = 'Importa'#231#227'o e Exporta'#231#227'o de Usu'#225'rios'
  end
  inherited btnImportar: TBitBtn
    OnClick = btnImportarClick
  end
  inherited btnExportar: TBitBtn
    OnClick = btnExportarClick
  end
  inherited FDTDesktop: TFDTable
    Active = True
    IndexFieldNames = 'ID'
    UpdateOptions.UpdateTableName = 'ALUGMAT.dbo.CLIENTE'
    TableName = 'ALUGMAT.dbo.CLIENTE'
    object FDTDesktopID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTDesktopTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      Origin = 'TIPO_PESSOA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FDTDesktopNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object FDTDesktopCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 14
    end
    object FDTDesktopRG: TStringField
      FieldName = 'RG'
      Origin = 'RG'
      Size = 12
    end
    object FDTDesktopCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 18
    end
    object FDTDesktopIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
      Size = 15
    end
    object FDTDesktopLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Required = True
    end
    object FDTDesktopNOME_LOGRADOURO: TStringField
      FieldName = 'NOME_LOGRADOURO'
      Origin = 'NOME_LOGRADOURO'
      Required = True
      Size = 50
    end
    object FDTDesktopNUM: TIntegerField
      FieldName = 'NUM'
      Origin = 'NUM'
      Required = True
    end
    object FDTDesktopCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object FDTDesktopBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 30
    end
    object FDTDesktopCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
      Size = 40
    end
    object FDTDesktopESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object FDTDesktopTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 13
    end
    object FDTDesktopCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 14
    end
    object FDTDesktopEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object FDTDesktopDATA_INC: TSQLTimeStampField
      FieldName = 'DATA_INC'
      Origin = 'DATA_INC'
    end
    object FDTDesktopDATA_ALT: TSQLTimeStampField
      FieldName = 'DATA_ALT'
      Origin = 'DATA_ALT'
    end
    object FDTDesktopSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  inherited FDTWeb: TFDTable
    Active = True
    IndexFieldNames = 'ID'
    UpdateOptions.UpdateTableName = 'bd_alugmat.cliente'
    TableName = 'bd_alugmat.cliente'
    object FDTWebID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDTWebTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
      Origin = 'TIPO_PESSOA'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FDTWebNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object FDTWebCPF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 14
    end
    object FDTWebRG: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RG'
      Origin = 'RG'
      Size = 12
    end
    object FDTWebCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 18
    end
    object FDTWebIE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'IE'
      Origin = 'IE'
      Size = 15
    end
    object FDTWebLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Required = True
    end
    object FDTWebNOME_LOGRADOURO: TStringField
      FieldName = 'NOME_LOGRADOURO'
      Origin = 'NOME_LOGRADOURO'
      Required = True
      Size = 50
    end
    object FDTWebNUM: TIntegerField
      FieldName = 'NUM'
      Origin = 'NUM'
      Required = True
    end
    object FDTWebCOMPLEMENTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object FDTWebBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 30
    end
    object FDTWebCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
      Size = 40
    end
    object FDTWebESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object FDTWebTELEFONE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 13
    end
    object FDTWebCELULAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 14
    end
    object FDTWebEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Required = True
      Size = 50
    end
    object FDTWebSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      FixedChar = True
      Size = 40
    end
    object FDTWebDATA_INC: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_INC'
      Origin = 'DATA_INC'
    end
    object FDTWebDATA_ALT: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_ALT'
      Origin = 'DATA_ALT'
    end
    object FDTWebSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FDTWebTIPO_USUARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO_USUARIO'
      Origin = 'TIPO_USUARIO'
      FixedChar = True
      Size = 3
    end
  end
end
