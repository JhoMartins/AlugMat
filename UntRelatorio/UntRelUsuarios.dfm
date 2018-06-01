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
  inherited frxReport1: TfrxReport
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
