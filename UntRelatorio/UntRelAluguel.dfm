inherited FrmRelAluguel: TFrmRelAluguel
  Caption = 'Impress'#227'o de Relat'#243'rio de Alugu'#233'is'
  ClientHeight = 278
  ClientWidth = 326
  ExplicitWidth = 332
  ExplicitHeight = 313
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 148
    Top = 56
    Width = 80
    Height = 13
    Caption = 'Data de Aluguel:'
  end
  object Label4: TLabel [1]
    Left = 148
    Top = 75
    Width = 12
    Height = 13
    Caption = 'de'
  end
  object Label5: TLabel [2]
    Left = 233
    Top = 75
    Width = 6
    Height = 13
    Caption = 'a'
  end
  object Label6: TLabel [3]
    Left = 16
    Top = 168
    Width = 37
    Height = 13
    Caption = 'Cliente:'
  end
  inherited Panel1: TPanel
    Width = 326
    inherited Label1: TLabel
      Width = 259
      Caption = 'Impress'#227'o de Aluguel'
      ExplicitWidth = 259
    end
    inherited Label2: TLabel
      Width = 259
      Caption = 'Impress'#227'o de Aluguel'
      ExplicitWidth = 259
    end
  end
  inherited btn_cancelar: TBitBtn
    Left = 124
    Top = 217
    ExplicitLeft = 124
    ExplicitTop = 217
  end
  inherited btn_imprimir: TBitBtn
    Left = 228
    Top = 217
    OnClick = btn_imprimirClick
    ExplicitLeft = 228
    ExplicitTop = 217
  end
  inherited StatusBar1: TStatusBar
    Top = 259
    Width = 326
  end
  object edNumAluguel: TLabeledEdit [8]
    Left = 16
    Top = 72
    Width = 65
    Height = 21
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = 'Aluguel n'#186':'
    TabOrder = 4
  end
  object edDataI: TMaskEdit [9]
    Left = 166
    Top = 72
    Width = 61
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 5
    Text = '  /  /    '
  end
  object edDataF: TMaskEdit [10]
    Left = 245
    Top = 72
    Width = 61
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 6
    Text = '  /  /    '
  end
  object rbDevolvido: TRadioGroup [11]
    Left = 16
    Top = 110
    Width = 161
    Height = 43
    Caption = 'Itens Devolvidos'
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Sim'
      'N'#227'o'
      'Todos')
    TabOrder = 7
  end
  object cbAtrasados: TCheckBox [12]
    Left = 183
    Top = 128
    Width = 126
    Height = 17
    Caption = 'Devolu'#231#245'es em Atraso'
    TabOrder = 8
  end
  object edCdCliente: TEdit [13]
    Left = 16
    Top = 184
    Width = 37
    Height = 21
    TabOrder = 9
  end
  object edCliente: TEdit [14]
    Left = 59
    Top = 184
    Width = 247
    Height = 21
    TabOrder = 10
  end
  inherited FDQuery1: TFDQuery
    SQL.Strings = (
      'SELECT A.ID, '
      #9'   A.DATA_INC, '
      #9'   A.DATA_ALT, '
      #9'   A.STATUS, '
      #9'   A.CD_CLIENTE,'
      '       C.NOME,'
      #9'   SUM(IA.VALOR_TOTAL) AS VALOR_TOTAL,'
      #9'   TIPO_PESSOA,'
      #9'   CPF,'
      #9'   CNPJ,'
      #9'   RG,'
      #9'   IE,'
      #9'   C.TELEFONE,'
      #9'   C.CELULAR,'
      #9'   C.CIDADE'
      'FROM ALUGUEL A'
      'INNER JOIN CLIENTE C ON C.ID = A.CD_CLIENTE'
      'INNER JOIN ITENSALUGUEL IA ON A.ID = IA.CD_ALUGUEL'
      'GROUP BY A.ID, '
      #9#9' A.DATA_INC, '
      ' '#9#9' A.DATA_ALT, '
      ' '#9#9' A.STATUS, '
      #9#9' A.CD_CLIENTE,'
      '         C.NOME,'
      #9#9' TIPO_PESSOA,'
      #9#9' CPF,'
      #9#9' CNPJ,'
      #9#9' RG,'
      #9#9' IE,'
      #9#9' C.TELEFONE,'
      #9#9' C.CELULAR,'
      #9#9' C.CIDADE')
    Left = 8
    Top = 368
  end
  inherited frxDBDataset1: TfrxDBDataset
    Left = 72
    Top = 368
  end
  inherited frxReport1: TfrxReport
    Left = 144
    Top = 368
    Datasets = <>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited PageFooter1: TfrxPageFooter
        inherited Memo6: TfrxMemoView
          Formats = <
            item
            end
            item
            end>
        end
      end
    end
  end
  object FDQuery2: TFDQuery
    MasterSource = DataSource1
    MasterFields = 'ID'
    Connection = DM.FDConnection1
    SQL.Strings = (
      'SELECT IA.*, P.DESCRICAO, P.CD_INTERNO'
      'FROM ITENSALUGUEL IA'
      'INNER JOIN PRODUTO P ON P.ID = IA.CD_PRODUTO'
      'WHERE IA.CD_ALUGUEL = :ID')
    Left = 8
    Top = 264
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 8
    Top = 320
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = FDQuery2
    BCDToCurrency = False
    Left = 80
    Top = 264
  end
end
