unit UntRelReservasWeb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntDM, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, frxClass, frxDBSet, Vcl.Mask;

type
  TFrmRelReservaWeb = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    btn_imprimir: TBitBtn;
    btn_cancelar: TBitBtn;
    FDQuery1: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    frxDBDataset2: TfrxDBDataset;
    frxReport1: TfrxReport;
    btn_limpar: TBitBtn;
    FDTabela: TFDTable;
    FDTabelaID: TFDAutoIncField;
    FDTabelaCD_CLIENTE: TIntegerField;
    FDTabelaSTATUS: TStringField;
    FDTabelaDATA_RESERVA: TDateTimeField;
    FDCommand1: TFDCommand;
    edNumReserva: TLabeledEdit;
    Label3: TLabel;
    edDataI: TMaskEdit;
    edDataF: TMaskEdit;
    Label5: TLabel;
    Label4: TLabel;
    edCidade: TLabeledEdit;
    Label6: TLabel;
    edCdCliente: TEdit;
    rbOrdenar: TRadioGroup;
    edCliente: TEdit;
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btn_limparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelReservaWeb: TFrmRelReservaWeb;

implementation

{$R *.dfm}

procedure TFrmRelReservaWeb.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelReservaWeb.btn_imprimirClick(Sender: TObject);
var StrLiga: String;
    Data: TDateTime;
begin
  FDQuery1.Close;
  FDQuery2.Close;

  StrLiga := ' WHERE ';

  with FDQuery1.SQL do
  begin
    Clear;

    Add('SELECT r.*, c.nome, c.cpf, c.cnpj, c.celular, c.cidade ');
	  Add('FROM reservas r ');
    Add('INNER JOIN cliente c ON r.cd_cliente = c.id');

    if edNumReserva.Text <> '' then
    try
      StrtoInt(edNumReserva.Text);
      Add(StrLiga + 'r.id = ' + edNumReserva.Text);
      StrLiga:= ' AND ';
    except
      on EConvertError do;
    end;

    //DATA INICIAL DE ALUGUEL
    if edDataI.Text <> '  /  /    ' then
    try
      Data := StrToDate(edDataI.Text);
      Add(StrLiga + 'r.data_reserva >= ' + #39 + DateToStr(Data) + #39);
      StrLiga := ' AND ';
    except
      on EConvertError do;
    end;

    //DATA FINAL DE ALUGUEL
    if edDataF.Text <> '  /  /    ' then
    try
      StrToDate(edDataF.Text);
      Add(StrLiga + 'r.data_reserva <= ' + #39 + edDataF.Text + #39);
      StrLiga := ' AND ';
    except
      on EConvertError do;
    end;

    if edCidade.Text <> '' then
    begin
      try
        Add(StrLiga + 'c.cidade LIKE ' + #39 + '%' + edCidade.Text + '%' + #39);
        StrLiga:= ' AND ';
      except
        on EConvertError do;
      end;
    end;

    if edCdCliente.Text <> '' then
    try
      StrtoInt(edCdCliente.Text);
      Add(StrLiga + 'r.cd_cliente = ' + edCdCliente.Text);
      StrLiga:= ' AND ';
    except
      on EConvertError do;
    end;

    if edCliente.Text <> '' then
    try
      Add(StrLiga + 'c.nome LIKE ' + #39 + '%' + edCliente.Text + '%' + #39);
      StrLiga:= ' AND ';
    except
      on EConvertError do;
    end;

    case rbOrdenar.ItemIndex of
      0: Add(' ORDER BY r.id');
      1: Add(' ORDER BY c.nome');
      2: Add(' ORDER BY r.data_reserva');
    end;

  end;

  FDQuery1.Open();
  FDQuery2.Open();

  frxReport1.ShowReport();
end;

procedure TFrmRelReservaWeb.btn_limparClick(Sender: TObject);
begin
  edNumReserva.Clear;
  edDataI.Clear;
  edDataF.Clear;
  edCdCliente.Clear;
  edCliente.Clear;
  edCidade.Clear;
  rbOrdenar.ItemIndex := 0;

  edNumReserva.SetFocus;
end;

procedure TFrmRelReservaWeb.DataSource1DataChange(Sender: TObject;
  Field: TField);
var msg: string;
    finaliza: boolean;
begin
  msg := 'As reservas abaixo foram finalizadas automaticamente:' + #13#13;
  finaliza := false;
  FDTabela.Open();
  FDTabela.First;

  while not FDTabela.Eof do
  begin
    if ((Date > (FDTabelaDATA_RESERVA.AsDateTime + 5)) and (FDTabelaSTATUS.AsString = '')) then
    begin
      finaliza := true;

      FDCommand1.CommandText.Clear;
      FDCommand1.CommandText.Add('UPDATE PRODUTO P SET P.DISPONIVEL = ' + #39 + 'S' + #39 + ' WHERE ID IN (SELECT IR.CD_PRODUTO FROM ITENS_RESERVA IR WHERE IR.CD_PRODUTO = P.ID AND IR.CD_RESERVA = ' + FDTabelaID.AsString + ')');
      FDCommand1.Execute();

      FDCommand1.CommandText.Clear;
      FDCommand1.CommandText.Add('UPDATE RESERVAS SET STATUS = ' + #39 + 'A' + #39 + ' WHERE ID = ' + FDTabelaID.AsString);
      FDCommand1.Execute();

      msg := msg + 'Cód: ' + FDTabelaID.AsString + ' | Data Reserva: ' + FDTabelaDATA_RESERVA.AsString + ' | Cód Cliente: ' + FDTabelaCD_CLIENTE.AsString + #13;
    end;
    FDTabela.Next
  end;

  if finaliza = true then
  ShowMessage(msg);
end;

end.
