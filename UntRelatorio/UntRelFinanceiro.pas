unit UntRelFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxDBSet,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmRelFinanceiro = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    btn_cancelar: TBitBtn;
    btn_imprimir: TBitBtn;
    btn_limpar: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cbMesIni: TComboBox;
    cbMesFinal: TComboBox;
    cbAnoIni: TComboBox;
    cbAnoFinal: TComboBox;
    rgOrdenar: TRadioGroup;
    StatusBar1: TStatusBar;
    FDQuery1: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelFinanceiro: TFrmRelFinanceiro;

implementation

{$R *.dfm}

procedure TFrmRelFinanceiro.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelFinanceiro.btn_imprimirClick(Sender: TObject);
begin

  FDQuery1.Close;

  with FDQuery1.SQL do
  begin
    Clear;

    Add('SELECT ((CASE WHEN MONTH(IA.DT_LOCACAO) = 1 THEN ' + #39 + 'Janeiro / ' + #39 + ' WHEN MONTH(IA.DT_LOCACAO) = 2 THEN ' + #39 + 'Fevereiro / ' + #39 + ' WHEN MONTH(IA.DT_LOCACAO) = 3 THEN ' + #39 + 'Março / ' + #39 + ' WHEN MONTH(IA.DT_LOCACAO) = 4 THEN ' + #39 + 'Abril / ' + #39 + ' WHEN MONTH(IA.DT_LOCACAO) = 5 THEN ' + #39 + 'Maio / ' + #39 + ' WHEN MONTH(IA.DT_LOCACAO) = 6 THEN ' + #39 + 'Junho / ' + #39 + ' WHEN MONTH(IA.DT_LOCACAO) = 7 THEN ' + #39 + 'Julho / ' + #39 + ' WHEN MONTH(IA.DT_LOCACAO) = 8 THEN ' + #39 + 'Agosto / ' + #39 + ' WHEN MONTH(IA.DT_LOCACAO) = 9 THEN ' + #39 + 'Setembro / ' + #39 + ' WHEN MONTH(IA.DT_LOCACAO) = 10 THEN ' + #39 + 'Outubro / ' + #39 + ' WHEN MONTH(IA.DT_LOCACAO) = 11 THEN ' + #39 + 'Novembro / ' + #39 + ' ELSE ' + #39 + 'Dezembro/' + #39 + ' END) + CAST(YEAR(IA.DT_LOCACAO) AS CHAR(4))) AS DT_LOCACAO, COALESCE(COUNT(IA.ID),0) AS QTDE_PRODUTOS, SUM(COALESCE(IA.VALOR_MULTA,0.00)) AS TOTAL_MULTA, SUM(COALESCE(IA.VALOR_TOTAL,0.00)) AS VALOR_TOTAL');
    Add('FROM ITENSALUGUEL IA WHERE IA.DEVOLVIDO = ' + #39 + 'S' + #39);

    if cbMesIni.ItemIndex <> -1 then
    begin
      Add(' AND MONTH(IA.DT_LOCACAO) >= ' + inttostr(cbMesIni.ItemIndex + 1));
    end;

    if cbMesFinal.ItemIndex <> -1 then
    begin
      Add(' AND MONTH(IA.DT_LOCACAO) <= ' + inttostr(cbMesFinal.ItemIndex + 1));
    end;

    if cbAnoIni.ItemIndex <> -1 then
    begin
      Add(' AND YEAR(IA.DT_LOCACAO) >= ' + cbAnoIni.Text);
    end;

    if cbAnoFinal.ItemIndex <> -1 then
    begin
      Add(' AND YEAR(IA.DT_LOCACAO) <= ' + cbAnoFinal.Text);
    end;

    Add(' GROUP BY MONTH(DT_LOCACAO), YEAR(DT_LOCACAO) ');

    case rgOrdenar.ItemIndex of
      0: Add('ORDER BY MONTH(DT_LOCACAO), YEAR(DT_LOCACAO)');
      1: Add('ORDER BY VALOR_TOTAL ASC');
      2: Add('ORDER BY VALOR_TOTAL DESC');
    end;
  end;

  FDQuery1.Open();
  frxReport1.ShowReport();
end;

procedure TFrmRelFinanceiro.btn_limparClick(Sender: TObject);
begin
  cbMesIni.ItemIndex := -1;
  cbMesFinal.ItemIndex := -1;
  cbAnoIni.ItemIndex := -1;
  cbAnoFinal.ItemIndex := -1;

  rgOrdenar.ItemIndex := 0;

  cbMesIni.SetFocus;
end;

end.
