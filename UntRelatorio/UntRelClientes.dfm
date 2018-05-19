inherited FrmRelClientes: TFrmRelClientes
  Caption = 'Impress'#227'o do Relat'#243'rio de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
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
