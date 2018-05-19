inherited FrmRelProdutos: TFrmRelProdutos
  Caption = 'Impress'#227'o do Relat'#243'rio de Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited FDQuery1: TFDQuery
    SQL.Strings = (
      
        'SELECT m.descricao, c.descricao, f.nome_fantasia, p.id, p.cd_int' +
        'erno, p.status, p.disponivel, p.valor_diaria '
      'FROM produto p'
      'INNER JOIN marca m on p.cd_marca = m.id'
      'INNER JOIN categoria c on p.cd_categoria = c.id'
      'INNER JOIN fornecedor f on p.cd_fornecedor = f.id')
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
