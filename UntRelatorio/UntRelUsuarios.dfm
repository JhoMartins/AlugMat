inherited FrmRelUsuarios: TFrmRelUsuarios
  Caption = 'Impress'#227'o do Relat'#243'rio de Usu'#225'rios'
  ClientHeight = 319
  ClientWidth = 433
  ExplicitWidth = 439
  ExplicitHeight = 348
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 433
    inherited Label1: TLabel
      Width = 255
      Caption = 'Relat'#243'rio de Usu'#225'rios'
      ExplicitWidth = 255
    end
    inherited Label2: TLabel
      Width = 255
      Caption = 'Relat'#243'rio de Usu'#225'rios'
      ExplicitWidth = 255
    end
  end
  inherited btn_cancelar: TBitBtn
    Left = 239
    Top = 255
    ExplicitLeft = 239
    ExplicitTop = 255
  end
  inherited btn_imprimir: TBitBtn
    Left = 335
    Top = 255
    OnClick = btn_imprimirClick
    ExplicitLeft = 335
    ExplicitTop = 255
  end
  inherited StatusBar1: TStatusBar
    Top = 300
    Width = 433
  end
  inherited btn_limpar: TBitBtn
    Left = 143
    Top = 255
    OnClick = btn_limparClick
    ExplicitLeft = 143
    ExplicitTop = 255
  end
  object edtIDDe: TLabeledEdit [5]
    Left = 8
    Top = 64
    Width = 65
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'ID de:'
    TabOrder = 5
  end
  object edtIDAte: TLabeledEdit [6]
    Left = 104
    Top = 64
    Width = 65
    Height = 21
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = 'ID at'#233':'
    TabOrder = 6
  end
  object edtNomeDe: TLabeledEdit [7]
    Left = 8
    Top = 112
    Width = 417
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome de:'
    TabOrder = 7
  end
  object edtNomeAte: TLabeledEdit [8]
    Left = 8
    Top = 160
    Width = 417
    Height = 21
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome at'#233':'
    TabOrder = 8
  end
  object RadioGroup3: TRadioGroup [9]
    Left = 224
    Top = 187
    Width = 201
    Height = 54
    Caption = 'Ordena'#231#227'o'
    Columns = 2
    Items.Strings = (
      'ID'
      'Nome')
    TabOrder = 9
  end
  object RadioGroup2: TRadioGroup [10]
    Left = 8
    Top = 187
    Width = 201
    Height = 54
    Caption = 'Status'
    Columns = 2
    Items.Strings = (
      'Habilitado'
      'Desabilitado')
    TabOrder = 10
  end
  inherited FDQuery1: TFDQuery
    SQL.Strings = (
      'SELECT u.*, p.per_descricao as PER_DESCRICAO FROM usuario u '
      'INNER JOIN perfil p '
      'ON u.usu_id_perfil = p.id')
    Left = 32
    Top = 256
  end
  inherited frxDBDataset1: TfrxDBDataset
    Left = 72
    Top = 256
  end
  inherited frxReport1: TfrxReport
    Left = 112
    Top = 256
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited PageFooter1: TfrxPageFooter
        Top = 355.275820000000000000
        inherited Memo6: TfrxMemoView
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end
            item
            end>
        end
      end
      inherited PageHeader1: TfrxPageHeader
        inherited Memo4: TfrxMemoView
          Top = 30.236240000000000000
        end
        inherited Memo5: TfrxMemoView
          Top = 105.826840000000000000
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1ID: TfrxMemoView
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'ID'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."ID"]')
        end
        object frxDBDataset1USU_NOME: TfrxMemoView
          Left = 41.574830000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DataField = 'USU_NOME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."USU_NOME"]')
        end
        object frxDBDataset1USU_DEPARTAMENTO: TfrxMemoView
          Left = 306.141930000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'USU_DEPARTAMENTO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."USU_DEPARTAMENTO"]')
        end
        object frxDBDataset1STATUS: TfrxMemoView
          Left = 672.756340000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'STATUS'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."STATUS"]')
        end
        object frxDBDataset1USU_LOGIN: TfrxMemoView
          Left = 574.488560000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'USU_LOGIN'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."USU_LOGIN"]')
        end
        object frxDBDataset1PER_DESCRICAO: TfrxMemoView
          Left = 468.661720000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'PER_DESCRICAO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PER_DESCRICAO"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'ID')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 41.574830000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 306.141930000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Departamento')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 468.661720000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Perfil')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 574.488560000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Login')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 672.756340000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
      end
    end
  end
end
