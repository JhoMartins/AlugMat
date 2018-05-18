inherited FrmRelFornecedores: TFrmRelFornecedores
  Caption = 'Impress'#227'o do Relat'#243'rio de Fornecedores'
  ClientHeight = 377
  ClientWidth = 518
  ExplicitWidth = 524
  ExplicitHeight = 406
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 418
    Top = 189
    Width = 37
    Height = 13
    Caption = 'Estado:'
  end
  inherited Panel1: TPanel
    Width = 518
    inherited Label1: TLabel
      Width = 313
      Caption = 'Relat'#243'rio de Fornecedores'
      ExplicitWidth = 313
    end
    inherited Label2: TLabel
      Width = 313
      Caption = 'Relat'#243'rio de Fornecedores'
      ExplicitWidth = 313
    end
  end
  inherited btn_cancelar: TBitBtn
    Top = 304
    ExplicitTop = 304
  end
  inherited btn_imprimir: TBitBtn
    Left = 420
    Top = 304
    ExplicitLeft = 420
    ExplicitTop = 304
  end
  inherited StatusBar1: TStatusBar
    Top = 358
    Width = 518
  end
  object edtIdDe: TLabeledEdit [5]
    Left = 8
    Top = 64
    Width = 73
    Height = 21
    EditLabel.Width = 29
    EditLabel.Height = 13
    EditLabel.Caption = 'Id de:'
    TabOrder = 4
  end
  object edtIdAte: TLabeledEdit [6]
    Left = 95
    Top = 64
    Width = 73
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Id at'#233':'
    TabOrder = 5
  end
  object LabeledEdit3: TLabeledEdit [7]
    Left = 8
    Top = 112
    Width = 500
    Height = 21
    EditLabel.Width = 90
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome Fantasia de:'
    TabOrder = 6
  end
  object LabeledEdit4: TLabeledEdit [8]
    Left = 8
    Top = 160
    Width = 500
    Height = 21
    EditLabel.Width = 94
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome Fantasia at'#233':'
    TabOrder = 7
  end
  object LabeledEdit5: TLabeledEdit [9]
    Left = 8
    Top = 208
    Width = 394
    Height = 21
    EditLabel.Width = 37
    EditLabel.Height = 13
    EditLabel.Caption = 'Cidade:'
    TabOrder = 8
  end
  object ComboBox1: TComboBox [10]
    Left = 418
    Top = 208
    Width = 90
    Height = 21
    TabOrder = 9
    Text = 'ComboBox1'
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE'
      'TO')
  end
  object RadioGroup1: TRadioGroup [11]
    Left = 8
    Top = 235
    Width = 185
    Height = 54
    Caption = 'Status'
    Columns = 2
    Items.Strings = (
      'Habilitado'
      'Desabilitado')
    TabOrder = 10
  end
  object RadioGroup2: TRadioGroup [12]
    Left = 199
    Top = 235
    Width = 311
    Height = 54
    Caption = 'Ordena'#231#227'o'
    Columns = 4
    Items.Strings = (
      'ID'
      'Nome'
      'Cidade'
      'Estado')
    TabOrder = 11
  end
  inherited FDQuery1: TFDQuery
    Left = 16
    Top = 304
  end
  inherited frxDBDataset1: TfrxDBDataset
    Left = 72
    Top = 304
  end
  inherited frxReport1: TfrxReport
    Left = 144
    Top = 304
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
end
