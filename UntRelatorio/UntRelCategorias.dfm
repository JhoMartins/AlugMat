inherited FrmRelCategorias: TFrmRelCategorias
  Caption = 'Impress'#227'o do Relat'#243'rio de Categorias'
  ClientHeight = 327
  ClientWidth = 342
  ExplicitWidth = 348
  ExplicitHeight = 356
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 342
    inherited Label1: TLabel
      Width = 279
      Caption = 'Relat'#243'rio de Categorias'
      ExplicitWidth = 279
    end
    inherited Label2: TLabel
      Width = 279
      Caption = 'Relat'#243'rio de Categorias'
      ExplicitWidth = 279
    end
  end
  inherited btn_cancelar: TBitBtn
    Left = 140
    Top = 264
    ExplicitLeft = 140
    ExplicitTop = 264
  end
  inherited btn_imprimir: TBitBtn
    Left = 236
    Top = 264
    OnClick = btn_imprimirClick
    ExplicitLeft = 236
    ExplicitTop = 264
  end
  inherited StatusBar1: TStatusBar
    Top = 308
    Width = 342
  end
  object edtCodigoDe: TLabeledEdit [4]
    Left = 15
    Top = 64
    Width = 66
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'ID de:'
    TabOrder = 4
  end
  object edtCodigoAte: TLabeledEdit [5]
    Left = 103
    Top = 64
    Width = 66
    Height = 21
    EditLabel.Width = 57
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo At'#233':'
    TabOrder = 5
  end
  object edtDescDe: TLabeledEdit [6]
    Left = 15
    Top = 112
    Width = 311
    Height = 21
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o de:'
    TabOrder = 6
  end
  object edtDescAte: TLabeledEdit [7]
    Left = 15
    Top = 160
    Width = 311
    Height = 21
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'Descri'#231#227'o at'#233':'
    TabOrder = 7
  end
  object RadioGroup1: TRadioGroup [8]
    Left = 15
    Top = 187
    Width = 311
    Height = 54
    Caption = 'Ordena'#231#227'o'
    Columns = 2
    Items.Strings = (
      'ID'
      'Nome')
    TabOrder = 8
  end
  inherited FDQuery1: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT * from categoria')
    Left = 8
    Top = 264
  end
  inherited frxDBDataset1: TfrxDBDataset
    Left = 96
    Top = 264
  end
  inherited frxReport1: TfrxReport
    Left = 56
    Top = 264
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited PageFooter1: TfrxPageFooter
        Top = 332.598640000000000000
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
            end>
        end
      end
      inherited PageHeader1: TfrxPageHeader
        Height = 124.724490000000000000
        inherited Memo3: TfrxMemoView
          Width = 340.157700000000000000
        end
        inherited Memo4: TfrxMemoView
          Top = 30.236240000000000000
        end
        inherited Memo5: TfrxMemoView
          Top = 102.047310000000000000
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1ID: TfrxMemoView
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ID'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."ID"]')
        end
        object frxDBDataset1DESCRICAO: TfrxMemoView
          Left = 83.149660000000000000
          Width = 385.512060000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."DESCRICAO"]')
        end
        object frxDBDataset1DATA_INC: TfrxMemoView
          Left = 472.441250000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'DATA_INC'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."DATA_INC"]')
        end
        object frxDBDataset1DATA_ALT: TfrxMemoView
          Left = 555.590910000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'DATA_ALT'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."DATA_ALT"]')
        end
        object frxDBDataset1STATUS: TfrxMemoView
          Left = 638.740570000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'STATUS'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."STATUS"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Width = 79.370130000000000000
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
          Left = 83.149660000000000000
          Width = 389.291590000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 476.220780000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Inc.')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 555.590910000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Data Alt.')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 638.740570000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Habilitada')
          ParentFont = False
        end
      end
    end
  end
end
