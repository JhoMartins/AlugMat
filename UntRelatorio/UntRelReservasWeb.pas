unit UntRelReservasWeb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntDM, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, frxClass, frxDBSet, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls;

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
    StatusBar1: TStatusBar;
    rgStatus: TRadioGroup;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    btn_finalizar: TBitBtn;
    edReserva: TEdit;
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_finalizarClick(Sender: TObject);
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

procedure TFrmRelReservaWeb.btn_finalizarClick(Sender: TObject);
var finaliza: integer;
begin
  if edReserva.Text <> '' then
  begin
    finaliza := Application.MessageBox('Realmente deseja Finalizar esta Reserva?' + #13 + 'O processo não poderá ser revertido!', 'Atenção', MB_YESNO+MB_ICONEXCLAMATION);

    if finaliza = ID_YES then
    begin
      //Encontra o Registro na Tabela
      FDTabela.Open();
      FDTabela.First;

      while not FDTabela.Eof do
      begin
        if FDTabelaID.AsString = edReserva.Text then
        begin
          break;
        end;
        FDTabela.Next;
      end;

      if FDTabelaSTATUS.AsString = '' then
      begin
        FDCommand1.CommandText.Clear;
        FDCommand1.CommandText.Add('UPDATE PRODUTO P SET P.DISPONIVEL = ' + #39 + 'S' + #39 + ' WHERE ID IN (SELECT IR.CD_PRODUTO FROM ITENS_RESERVA IR WHERE IR.CD_PRODUTO = P.ID AND IR.CD_RESERVA = ' + edReserva.Text + ')');
        FDCommand1.Execute();

        FDCommand1.CommandText.Clear;
        FDCommand1.CommandText.Add('UPDATE RESERVAS SET STATUS = ' + #39 + 'F' + #39 + ' WHERE ID = ' + edReserva.Text);
        FDCommand1.Execute();

        ShowMessage('A reserva nº ' + edReserva.Text + ' foi finalizada com sucesso!' + #13 + 'Por favor, cadastre o aluguel do cliente no sistema.');
        edReserva.Clear;
        edReserva.SetFocus;
      end
      else
      begin
        ShowMessage('A reserva nº ' + edReserva.Text + ' já estava finalizada.' + #13 + 'Nenhuma alteração foi feita.');
      end;
    end
    else
    begin
      ShowMessage('A finalização da reserva nº ' + edReserva.Text + ' foi abortada!');
      edReserva.SetFocus;
    end;
  end
  else
  begin
    Application.MessageBox('Por favor, informe o código da Reserva!', 'Erro', MB_OK+MB_ICONERROR);
    edReserva.SetFocus;
  end;
end;

procedure TFrmRelReservaWeb.btn_imprimirClick(Sender: TObject);
var StrLiga, dia, mes, ano: String;
begin
  FDQuery1.Close;
  FDQuery2.Close;

  StrLiga := ' WHERE ';

  with FDQuery1.SQL do
  begin
    Clear;

    Add('SELECT R.ID, R.CD_CLIENTE, R.DATA_RESERVA, (CASE WHEN R.STATUS IS NULL THEN ' + #39 + 'Em Aberto' + #39 + ' WHEN R.STATUS = ' + #39 + 'F' + #39 + ' THEN ' + #39 + 'Finalizado' + #39 + ' ELSE ' + #39 + 'Finalizado Automaticamente' + #39 + ' END) AS STATUS, C.NOME, C.CPF, C.CNPJ, C.CELULAR, C.TELEFONE, C.CIDADE ');
	  Add('FROM RESERVAS R ');
    Add('INNER JOIN CLIENTE C ON R.CD_CLIENTE = C.ID ');

    if edNumReserva.Text <> '' then
    try
      StrtoInt(edNumReserva.Text);
      Add(StrLiga + 'R.ID = ' + edNumReserva.Text);
      StrLiga:= ' AND ';
    except
      on EConvertError do;
    end;

    //DATA INICIAL DE ALUGUEL
    if edDataI.Text <> '  /  /    ' then
    try
      dia := formatdatetime('dd', StrToDate(edDataI.Text));
      mes := formatdatetime('mm', StrToDate(edDataI.Text));
      ano := formatdatetime('yyyy', StrToDate(edDataI.Text));
      Add(StrLiga + 'R.DATA_RESERVA >= ' + #39 + ano+'-'+mes+'-'+dia + #39);
      StrLiga := ' AND ';
    except
      on EConvertError do;
    end;

    //DATA FINAL DE ALUGUEL
    if edDataF.Text <> '  /  /    ' then
    try
      dia := formatdatetime('dd', StrToDate(edDataF.Text));
      mes := formatdatetime('mm', StrToDate(edDataF.Text));
      ano := formatdatetime('yyyy', StrToDate(edDataF.Text));
      Add(StrLiga + 'R.DATA_RESERVA <= ' + #39 + ano+'-'+mes+'-'+dia + #39);
      StrLiga := ' AND ';
    except
      on EConvertError do;
    end;

    if edCidade.Text <> '' then
    begin
      try
        Add(StrLiga + 'C.CIDADE LIKE ' + #39 + '%' + edCidade.Text + '%' + #39);
        StrLiga:= ' AND ';
      except
        on EConvertError do;
      end;
    end;

    if edCdCliente.Text <> '' then
    try
      StrtoInt(edCdCliente.Text);
      Add(StrLiga + 'R.CD_CLIENTE = ' + edCdCliente.Text);
      StrLiga:= ' AND ';
    except
      on EConvertError do;
    end;

    if edCliente.Text <> '' then
    try
      Add(StrLiga + 'C.NOME LIKE ' + #39 + '%' + edCliente.Text + '%' + #39);
      StrLiga:= ' AND ';
    except
      on EConvertError do;
    end;

    if rgStatus.ItemIndex = 1 then
    begin
      Add(StrLiga + ' R.STATUS IS NULL');
      StrLiga := ' AND ';
    end;

    if rgStatus.ItemIndex = 2 then
    begin
      Add(StrLiga + ' R.STATUS = ' + #39 + 'F' + #39);
      StrLiga := ' AND ';
    end;

    if rgStatus.ItemIndex = 3 then
    begin
      Add(StrLiga + ' R.STATUS = ' + #39 + 'A' + #39);
      StrLiga := ' AND ';
    end;

    case rbOrdenar.ItemIndex of
      0: Add(' ORDER BY R.ID');
      1: Add(' ORDER BY C.NOME');
      2: Add(' ORDER BY R.DATA_RESERVA');
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

procedure TFrmRelReservaWeb.FormActivate(Sender: TObject);
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
