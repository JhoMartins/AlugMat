unit UntRelAluguel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadraoRel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask;

type
  TFrmRelAluguel = class(TFrmPadraoRel)
    FDQuery2: TFDQuery;
    DataSource1: TDataSource;
    frxDBDataset2: TfrxDBDataset;
    edNumAluguel: TLabeledEdit;
    edDataI: TMaskEdit;
    edDataF: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    rbDevolvido: TRadioGroup;
    cbAtrasados: TCheckBox;
    Label6: TLabel;
    edCdCliente: TEdit;
    edCliente: TEdit;
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
var StrLiga: String;
    Data: TDateTime;
begin
  inherited;

  FDQuery1.Close;
  FDQuery2.Close;

  StrLiga := '';

  with FDQuery1.SQL do
  begin
    Clear;

    Add('SELECT A.ID, A.DATA_INC, A.DATA_ALT, A.STATUS, A.CD_CLIENTE, C.NOME, SUM(IA.VALOR_TOTAL) AS VALOR_TOTAL, C.TIPO_PESSOA, C.CPF, C.CNPJ, C.RG, C.IE, C.TELEFONE, C.CELULAR, C.CIDADE ');
	  Add('FROM ALUGUEL A ');
    Add('INNER JOIN CLIENTE C ON C.ID = A.CD_CLIENTE ');
    Add('INNER JOIN ITENSALUGUEL IA ON A.ID = IA.CD_ALUGUEL');

    //CÓDIGO
    if edNumAluguel.Text <> '' then
    try
      if StrLiga = '' then StrLiga := ' WHERE '
      else StrLiga := ' AND ';

      StrtoInt(edNumAluguel.Text);
      Add(StrLiga + 'A.ID = ' + edNumAluguel.Text);
    except
      on EConvertError do;
    end;

    //DATA INICIAL DE ALUGUEL
    if edDataI.Text <> '  /  /    ' then
    try
      if StrLiga = '' then StrLiga := ' WHERE '
      else StrLiga := ' AND ';

      StrToDate(edDataI.Text);
      Add(StrLiga + 'IA.DT_LOCACAO >= ' + #39 + edDataI.Text + #39);
    except
      on EConvertError do;
    end;

    //DATA FINAL DE ALUGUEL
    if edDataF.Text <> '  /  /    ' then
    try
      if StrLiga = '' then StrLiga := ' WHERE '
      else StrLiga := ' AND ';

      StrToDate(edDataF.Text);
      Add(StrLiga + 'IA.DT_LOCACAO <= ' + #39 + edDataF.Text + #39);
    except
      on EConvertError do;
    end;

    //ITENS DEVOLVIDOS
    if rbDevolvido.ItemIndex = 0 then
    try
      if StrLiga = '' then StrLiga := ' WHERE '
      else StrLiga := ' AND ';

      Add(StrLiga + 'IA.DEVOLVIDO = ' + #39 + 'S' + #39);
    except
      on EConvertError do;
    end
    else if rbDevolvido.ItemIndex = 1 then
    try
      if StrLiga = '' then StrLiga := ' WHERE '
      else StrLiga := ' AND ';

      Add(StrLiga + 'IA.DEVOLVIDO = ' + #39 + 'N' + #39);
    except
      on EConvertError do;
    end;

    //SOMENTE DEVOLUÇÕES EM ATRASO
    if cbAtrasados.Checked = True then
    try
      if StrLiga = '' then StrLiga := ' WHERE '
      else StrLiga := ' AND ';

      Data := Date;
      Add(StrLiga + 'IA.DT_DEVOLUCAO < ' + #39 + DateTimetoStr(Data) + #39);
    except
      on EConvertError do;
    end;

    //POR CLIENTE (CÓDIGO)
    if edCdCliente.Text <> '' then
    try
      if StrLiga = '' then StrLiga := ' WHERE '
      else StrLiga := ' AND ';

      StrtoInt(edCdCliente.Text);
      Add(StrLiga + 'A.CD_CLIENTE = ' + edCdCliente.Text);
    except
      on EConvertError do;
    end;

    //POR CLIENTE (NOME)
    if edCliente.Text <> '' then
    try
      if StrLiga = '' then StrLiga := ' WHERE '
      else StrLiga := ' AND ';

      Add(StrLiga + 'A.CD_CLIENTE LIKE ' + #39 + '%' + edCliente.Text + '%' + #39);
    except
      on EConvertError do;
    end;

    //GROUP BY
    Add(' GROUP BY A.ID, A.DATA_INC, A.DATA_ALT, A.STATUS, A.CD_CLIENTE, C.NOME, TIPO_PESSOA, CPF, CNPJ, RG, IE, C.TELEFONE, C.CELULAR, C.CIDADE');
  end;

  FDQuery1.Open();
  FDQuery2.Open();

  frxReport1.ShowReport();
end;

end.
