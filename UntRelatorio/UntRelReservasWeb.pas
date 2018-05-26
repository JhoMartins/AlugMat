unit UntRelReservasWeb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntDM, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, frxClass, frxDBSet;

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
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
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
begin
  frxReport1.ShowReport();
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

      msg := msg + 'C�d: ' + FDTabelaID.AsString + ' | Data Reserva: ' + FDTabelaDATA_RESERVA.AsString + ' | C�d Cliente: ' + FDTabelaCD_CLIENTE.AsString + #13;
    end;
    FDTabela.Next
  end;

  if finaliza = true then
  ShowMessage(msg);
end;

end.
