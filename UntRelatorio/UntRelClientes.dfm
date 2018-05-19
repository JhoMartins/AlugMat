inherited FrmRelClientes: TFrmRelClientes
  Caption = 'Impress'#227'o do Relat'#243'rio de Clientes'
  ClientHeight = 420
  ClientWidth = 433
  ExplicitWidth = 439
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 335
    Top = 189
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  inherited Panel1: TPanel
    Width = 433
    ExplicitWidth = 435
    inherited Label1: TLabel
      Width = 247
      Caption = 'Relat'#243'rio de Clientes'
      ExplicitWidth = 247
    end
    inherited Label2: TLabel
      Width = 247
      Caption = 'Relat'#243'rio de Clientes'
      ExplicitWidth = 247
    end
  end
  inherited btn_cancelar: TBitBtn
    Left = 239
    Top = 362
    ExplicitLeft = 239
    ExplicitTop = 362
  end
  inherited btn_imprimir: TBitBtn
    Left = 335
    Top = 362
    OnClick = btn_imprimirClick
    ExplicitLeft = 335
    ExplicitTop = 362
  end
  object edtCidade: TLabeledEdit [4]
    Left = 8
    Top = 208
    Width = 321
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Cidade'
    TabOrder = 8
  end
  object cbEstado: TComboBox [5]
    Left = 335
    Top = 208
    Width = 90
    Height = 21
    TabOrder = 9
  end
  object RadioGroup1: TRadioGroup [6]
    Left = 8
    Top = 235
    Width = 201
    Height = 54
    Caption = 'Tipo de Pessoa'
    Columns = 2
    Items.Strings = (
      'F'#237'sica'
      'Jur'#237'dica')
    TabOrder = 10
  end
  object RadioGroup2: TRadioGroup [7]
    Left = 224
    Top = 235
    Width = 201
    Height = 54
    Caption = 'Status'
    Columns = 2
    Items.Strings = (
      'Habilitado'
      'Desabilitado')
    TabOrder = 11
  end
  object RadioGroup3: TRadioGroup [8]
    Left = 8
    Top = 295
    Width = 417
    Height = 58
    Caption = 'Ordena'#231#227'o'
    Columns = 4
    Items.Strings = (
      'ID'
      'Nome'
      'Cidade'
      'Estado')
    TabOrder = 12
  end
  object edtNomeAte: TLabeledEdit [9]
    Left = 8
    Top = 160
    Width = 417
    Height = 21
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome at'#233':'
    TabOrder = 7
  end
  object edtNomeDe: TLabeledEdit [10]
    Left = 8
    Top = 112
    Width = 417
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome de:'
    TabOrder = 6
  end
  object edtIDAte: TLabeledEdit [11]
    Left = 96
    Top = 64
    Width = 65
    Height = 21
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = 'ID at'#233':'
    TabOrder = 5
  end
  object edtIDDe: TLabeledEdit [12]
    Left = 8
    Top = 64
    Width = 65
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'ID de:'
    TabOrder = 4
  end
  inherited StatusBar1: TStatusBar
    Top = 401
    Width = 433
    ExplicitTop = 401
    ExplicitWidth = 435
  end
  inherited FDQuery1: TFDQuery
    SQL.Strings = (
      'SELECT id, nome, cidade, estado, celular, status,'
      '(CASE'
      '  WHEN TIPO_PESSOA = '#39'J'#39' THEN '#39'PJ'#39
      '  ELSE '#39'PF'#39
      '  END) AS TIPO_PESSOA,'
      '(CASE'
      '  WHEN CPF IS NULL THEN CNPJ'
      '  ELSE CPF'
      '  END) AS CPF_CNPJ'
      'FROM cliente')
    Left = 48
    Top = 360
  end
  inherited frxDBDataset1: TfrxDBDataset
    Left = 104
    Top = 360
  end
  inherited frxReport1: TfrxReport
    Left = 168
    Top = 360
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      inherited PageFooter1: TfrxPageFooter
        Top = 347.716760000000000000
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
          Top = 109.606370000000000000
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 264.567100000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1id: TfrxMemoView
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'id'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."id"]')
        end
        object frxDBDataset1nome: TfrxMemoView
          Left = 49.133890000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          DataField = 'nome'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."nome"]')
        end
        object frxDBDataset1TIPO_PESSOA: TfrxMemoView
          Left = 260.787570000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'TIPO_PESSOA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."TIPO_PESSOA"]')
        end
        object frxDBDataset1cidade: TfrxMemoView
          Left = 404.409710000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'cidade'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."cidade"]')
        end
        object frxDBDataset1estado: TfrxMemoView
          Left = 608.504330000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'estado'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."estado"]')
        end
        object frxDBDataset1status: TfrxMemoView
          Left = 665.197280000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'status'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."status"]')
        end
        object frxDBDataset1CPF_CNPJ: TfrxMemoView
          Left = 302.362400000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'CPF_CNPJ'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."CPF_CNPJ"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Width = 45.354360000000000000
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
          Left = 49.133890000000000000
          Width = 207.874150000000000000
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
          Left = 260.787570000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 302.362400000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'CPF/CNPJ')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 404.409710000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 608.504330000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Estado')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 665.197280000000000000
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
