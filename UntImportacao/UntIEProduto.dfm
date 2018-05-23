inherited FrmIEProduto: TFrmIEProduto
  Caption = 'FrmIEProduto'
  PixelsPerInch = 120
  TextHeight = 16
  inherited btnImportar: TBitBtn
    OnClick = btnImportarClick
  end
  inherited btnExportar: TBitBtn
    OnClick = btnExportarClick
  end
  inherited FDTDesktop: TFDTable
    Active = True
    IndexFieldNames = 'ID'
    UpdateOptions.UpdateTableName = 'ALUGMAT.dbo.PRODUTO'
    TableName = 'ALUGMAT.dbo.PRODUTO'
    object FDTDesktopID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
    object FDTDesktopDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object FDTDesktopCD_INTERNO: TStringField
      FieldName = 'CD_INTERNO'
      Origin = 'CD_INTERNO'
      Required = True
      Size = 10
    end
    object FDTDesktopVALOR_DIARIA: TFloatField
      FieldName = 'VALOR_DIARIA'
      Origin = 'VALOR_DIARIA'
      Required = True
    end
    object FDTDesktopSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FDTDesktopDISPONIVEL: TStringField
      FieldName = 'DISPONIVEL'
      Origin = 'DISPONIVEL'
      FixedChar = True
      Size = 1
    end
    object FDTDesktopDEVOLVER: TStringField
      FieldName = 'DEVOLVER'
      Origin = 'DEVOLVER'
      FixedChar = True
      Size = 1
    end
    object FDTDesktopCARACTERISTICAS: TMemoField
      FieldName = 'CARACTERISTICAS'
      Origin = 'CARACTERISTICAS'
      BlobType = ftMemo
      Size = 2147483647
    end
    object FDTDesktopCD_MARCA: TIntegerField
      FieldName = 'CD_MARCA'
      Origin = 'CD_MARCA'
      Required = True
    end
    object FDTDesktopCD_CATEGORIA: TIntegerField
      FieldName = 'CD_CATEGORIA'
      Origin = 'CD_CATEGORIA'
      Required = True
    end
    object FDTDesktopCD_FORNECEDOR: TIntegerField
      FieldName = 'CD_FORNECEDOR'
      Origin = 'CD_FORNECEDOR'
      Required = True
    end
    object FDTDesktopDATA_INC: TSQLTimeStampField
      FieldName = 'DATA_INC'
      Origin = 'DATA_INC'
    end
    object FDTDesktopDATA_ALT: TSQLTimeStampField
      FieldName = 'DATA_ALT'
      Origin = 'DATA_ALT'
    end
    object FDTDesktopCD_CLIENTE: TIntegerField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
    end
  end
  inherited FDTWeb: TFDTable
    Active = True
    IndexFieldNames = 'ID'
    UpdateOptions.UpdateTableName = 'bd_alugmat.produto'
    TableName = 'bd_alugmat.produto'
    object FDTWebID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object FDTWebDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object FDTWebCD_INTERNO: TStringField
      FieldName = 'CD_INTERNO'
      Origin = 'CD_INTERNO'
      Required = True
      Size = 10
    end
    object FDTWebVALOR_DIARIA: TSingleField
      FieldName = 'VALOR_DIARIA'
      Origin = 'VALOR_DIARIA'
      Required = True
    end
    object FDTWebSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
    object FDTWebDISPONIVEL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DISPONIVEL'
      Origin = 'DISPONIVEL'
      FixedChar = True
      Size = 1
    end
    object FDTWebCARACTERISTICAS: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'CARACTERISTICAS'
      Origin = 'CARACTERISTICAS'
      BlobType = ftMemo
    end
    object FDTWebMARCA: TStringField
      FieldName = 'MARCA'
      Origin = 'MARCA'
      Required = True
      Size = 30
    end
    object FDTWebCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
      Required = True
      Size = 30
    end
    object FDTWebFORNECEDOR: TStringField
      FieldName = 'FORNECEDOR'
      Origin = 'FORNECEDOR'
      Required = True
      Size = 50
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
    object FDTWebCD_CLIENTE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
    end
    object FDTWebNOTA: TSingleField
      AutoGenerateValue = arDefault
      FieldName = 'NOTA'
      Origin = 'NOTA'
    end
    object FDTWebDESTAQUE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESTAQUE'
      Origin = 'DESTAQUE'
      FixedChar = True
      Size = 1
    end
  end
  object FDTMarca: TFDTable
    IndexFieldNames = 'ID'
    Connection = DM.FDConnection1
    UpdateOptions.UpdateTableName = 'ALUGMAT.dbo.MARCA'
    TableName = 'ALUGMAT.dbo.MARCA'
    Left = 720
    Top = 328
    object FDTMarcaID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTMarcaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 30
    end
    object FDTMarcaDATA_INC: TSQLTimeStampField
      FieldName = 'DATA_INC'
      Origin = 'DATA_INC'
    end
    object FDTMarcaDATA_ALT: TSQLTimeStampField
      FieldName = 'DATA_ALT'
      Origin = 'DATA_ALT'
    end
    object FDTMarcaSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object FDTCategoria: TFDTable
    IndexFieldNames = 'ID'
    Connection = DM.FDConnection1
    UpdateOptions.UpdateTableName = 'ALUGMAT.dbo.CATEGORIA'
    TableName = 'ALUGMAT.dbo.CATEGORIA'
    Left = 792
    Top = 328
    object FDTCategoriaID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTCategoriaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 30
    end
    object FDTCategoriaDATA_INC: TSQLTimeStampField
      FieldName = 'DATA_INC'
      Origin = 'DATA_INC'
    end
    object FDTCategoriaDATA_ALT: TSQLTimeStampField
      FieldName = 'DATA_ALT'
      Origin = 'DATA_ALT'
    end
    object FDTCategoriaSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object FDTFornecedor: TFDTable
    IndexFieldNames = 'ID'
    Connection = DM.FDConnection1
    UpdateOptions.UpdateTableName = 'ALUGMAT.dbo.FORNECEDOR'
    TableName = 'ALUGMAT.dbo.FORNECEDOR'
    Left = 880
    Top = 328
    object FDTFornecedorID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTFornecedorRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Required = True
      Size = 50
    end
    object FDTFornecedorNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 50
    end
    object FDTFornecedorCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      Size = 18
    end
    object FDTFornecedorIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
      Required = True
      Size = 15
    end
    object FDTFornecedorLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'LOGRADOURO'
      Required = True
    end
    object FDTFornecedorNOME_LOGRADOURO: TStringField
      FieldName = 'NOME_LOGRADOURO'
      Origin = 'NOME_LOGRADOURO'
      Required = True
      Size = 50
    end
    object FDTFornecedorNUM: TIntegerField
      FieldName = 'NUM'
      Origin = 'NUM'
      Required = True
    end
    object FDTFornecedorCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
    end
    object FDTFornecedorBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 30
    end
    object FDTFornecedorCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
      Size = 40
    end
    object FDTFornecedorESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object FDTFornecedorTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 13
    end
    object FDTFornecedorCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 14
    end
    object FDTFornecedorEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 50
    end
    object FDTFornecedorCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Size = 50
    end
    object FDTFornecedorDATA_INC: TSQLTimeStampField
      FieldName = 'DATA_INC'
      Origin = 'DATA_INC'
    end
    object FDTFornecedorDATA_ALT: TSQLTimeStampField
      FieldName = 'DATA_ALT'
      Origin = 'DATA_ALT'
    end
    object FDTFornecedorSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
end
