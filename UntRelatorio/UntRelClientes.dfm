inherited FrmRelClientes: TFrmRelClientes
  Caption = 'Impress'#227'o do Relat'#243'rio de Clientes'
  ClientHeight = 420
  ClientWidth = 435
  ExplicitWidth = 441
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
    Width = 435
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
    ExplicitLeft = 335
    ExplicitTop = 362
  end
  inherited StatusBar1: TStatusBar
    Top = 401
    Width = 435
  end
  object edtIDDe: TLabeledEdit [5]
    Left = 8
    Top = 64
    Width = 65
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'ID de:'
    TabOrder = 4
  end
  object edtIDAte: TLabeledEdit [6]
    Left = 96
    Top = 64
    Width = 65
    Height = 21
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = 'ID at'#233':'
    TabOrder = 5
  end
  object edtNomeDe: TLabeledEdit [7]
    Left = 8
    Top = 112
    Width = 417
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome de:'
    TabOrder = 6
  end
  object edtNomeAte: TLabeledEdit [8]
    Left = 8
    Top = 160
    Width = 417
    Height = 21
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = 'Nome at'#233':'
    TabOrder = 7
  end
  object edtCidade: TLabeledEdit [9]
    Left = 8
    Top = 208
    Width = 321
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Cidade'
    TabOrder = 8
  end
  object cbEstado: TComboBox [10]
    Left = 335
    Top = 208
    Width = 90
    Height = 21
    TabOrder = 9
  end
  object RadioGroup1: TRadioGroup [11]
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
  object RadioGroup2: TRadioGroup [12]
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
  object RadioGroup3: TRadioGroup [13]
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
  inherited FDQuery1: TFDQuery
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
