inherited FrmRelUsuarios: TFrmRelUsuarios
  Caption = 'Impress'#227'o do Relat'#243'rio de Usu'#225'rios'
  ClientWidth = 514
  ExplicitWidth = 520
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 514
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
  inherited btn_imprimir: TBitBtn
    Left = 408
    ExplicitLeft = 408
  end
  inherited StatusBar1: TStatusBar
    Width = 514
  end
  inherited FDQuery1: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT u.*, p.per_descricao FROM usuario u '
      'INNER JOIN perfil p '
      'ON u.usu_id_perfil = p.id')
  end
  inherited frxReport1: TfrxReport
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
        object frxDBDataset1per_descricao: TfrxMemoView
          Left = 468.661720000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'per_descricao'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."per_descricao"]')
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
