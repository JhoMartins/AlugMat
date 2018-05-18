inherited FrmRelFornecedores: TFrmRelFornecedores
  Caption = 'Impress'#227'o do Relat'#243'rio de Fornecedores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
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
