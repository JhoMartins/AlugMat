unit UntRelAluguel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadraoRel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmRelAluguel = class(TFrmPadraoRel)
    Label3: TLabel;
    edNumAluguel: TEdit;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    frxDBDataset2: TfrxDBDataset;
    frxReport2: TfrxReport;
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelAluguel: TFrmRelAluguel;

implementation

{$R *.dfm}

uses UntDM;

procedure TFrmRelAluguel.btn_imprimirClick(Sender: TObject);
begin
  inherited;

  FDQuery1.Close;
  FDQuery2.Close;

  with FDQuery1.SQL do
  begin
    Clear;

    Add('SELECT A.ID, A.DATA_INC, A.DATA_ALT, A.STATUS, A.CD_CLIENTE, C.NOME, SUM(IA.VALOR_TOTAL) AS VALOR_TOTAL, (CASE WHEN TIPO_PESSOA = '+ #39 + 'J' + #39 + ' THEN ' + #39 + 'Pessoa Jurídica' + #39 + 'ELSE ' + #39 + 'Pessoa Física' + #39 + ' END) AS TIPO_PESSOA, ');
	  Add('(CASE WHEN C.CPF IS NULL THEN C.CNPJ ELSE C.CPF END) AS CPF_CNPJ, (CASE WHEN C.RG IS NULL THEN C.IE ELSE C.RG END) AS RG_IE, C.TELEFONE, C.CELULAR, C.CIDADE FROM ALUGUEL A INNER JOIN CLIENTE C ON C.ID = A.CD_CLIENTE ');
    Add('INNER JOIN ITENSALUGUEL IA ON A.ID = IA.CD_ALUGUEL ');

    if edNumAluguel.Text <> '' then
    try
      StrtoInt(edNumAluguel.Text);
      Add('WHERE A.ID = ' + edNumAluguel.Text);
      Add(' GROUP BY A.ID, A.DATA_INC, A.DATA_ALT, A.STATUS, A.CD_CLIENTE, C.NOME, TIPO_PESSOA, CPF, CNPJ, RG, IE, C.TELEFONE, C.CELULAR, C.CIDADE');
    except
      on EConvertError do;
    end;
  end;

  FDQuery1.Open();
  FDQuery2.Open();

  frxReport1.ShowReport();
end;

end.
