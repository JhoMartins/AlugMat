unit UntDevolucao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, System.ImageList, Vcl.ImgList, Vcl.Mask, DateUtils;

type
  TFrmDevolucao = class(TForm)
    Panel1: TPanel;
    gbCliente: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edCodCliente: TEdit;
    gbProduto: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edCodProduto: TEdit;
    btn_pesquisar: TBitBtn;
    rgPesquisa: TRadioGroup;
    btn_devolver: TBitBtn;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    FDItensAluguel: TFDTable;
    DSItensAluguel: TDataSource;
    FDItensAluguelID: TFDAutoIncField;
    FDItensAluguelCD_PRODUTO: TIntegerField;
    FDItensAluguelDT_LOCACAO: TDateField;
    FDItensAluguelDT_DEVOLUCAO: TDateField;
    FDItensAluguelQTDE_DIAS: TIntegerField;
    FDItensAluguelQTDE_DIAS_ATRASO: TIntegerField;
    FDItensAluguelVALOR_DIARIA: TFloatField;
    FDItensAluguelVALOR_MULTA: TFloatField;
    FDItensAluguelVALOR_TOTAL: TFloatField;
    FDItensAluguelCD_ALUGUEL: TIntegerField;
    btn_sair: TBitBtn;
    DSProduto: TDataSource;
    FDProduto: TFDTable;
    FDProdutoID: TFDAutoIncField;
    FDProdutoDESCRICAO: TStringField;
    FDProdutoDISPONIVEL: TStringField;
    FDProdutoCD_CLIENTE: TIntegerField;
    FDCliente: TFDTable;
    DSCliente: TDataSource;
    FDClienteID: TFDAutoIncField;
    FDClienteNOME: TStringField;
    FDProdutoNomeCliente: TStringField;
    grAlugueis: TDBGrid;
    FDItensAluguelProduto: TStringField;
    FDQryItensAluguel: TFDQuery;
    FDProdutoDataLocacao: TDateField;
    FDProdutoDataDevolucao: TDateField;
    FDProdutoQtdeDias: TIntegerField;
    FDProdutoValorDiaria: TFloatField;
    FDProdutoSubtotal: TFloatField;
    FDProdutoCodAluguel: TIntegerField;
    cbCliente: TDBLookupComboBox;
    cbProduto: TDBLookupComboBox;
    FDQryProduto: TFDQuery;
    DSQryProduto: TDataSource;
    FDProdutoDEVOLVER: TStringField;
    ImageList1: TImageList;
    Panel3: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edSubtotal: TDBEdit;
    edMulta: TDBEdit;
    edDesconto: TDBEdit;
    edTotal: TDBEdit;
    FDAluguel: TFDTable;
    DSAluguel: TDataSource;
    FDAluguelID: TFDAutoIncField;
    FDAluguelSUBTOTAL: TFloatField;
    FDAluguelTOTAL_MULTA: TFloatField;
    FDAluguelDESCONTO: TFloatField;
    FDAluguelTOTAL: TFloatField;
    FDAluguelCD_CLIENTE: TIntegerField;
    FDAluguelCD_USUARIO: TIntegerField;
    FDAluguelDATA_INC: TSQLTimeStampField;
    FDAluguelDATA_ALT: TSQLTimeStampField;
    FDAluguelSTATUS: TStringField;
    FDItensAluguelDEVOLVIDO: TStringField;
    procedure rgPesquisaClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edNomeClienteChange(Sender: TObject);
    procedure edDescProdutoChange(Sender: TObject);
    procedure cbClienteClick(Sender: TObject);
    procedure edCodClienteExit(Sender: TObject);
    procedure cbProdutoClick(Sender: TObject);
    procedure edCodProdutoExit(Sender: TObject);
    procedure grAlugueisCellClick(Column: TColumn);
    procedure grAlugueisColEnter(Sender: TObject);
    procedure grAlugueisDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edDescontoExit(Sender: TObject);
    procedure btn_devolverClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDevolucao: TFrmDevolucao;

implementation

{$R *.dfm}

uses UntDM, UntAlugueis;

procedure TFrmDevolucao.btn_devolverClick(Sender: TObject);
begin

  FDProduto.First;

  while not FDProduto.Eof do
  begin
    if (FDProduto.FieldByName('DEVOLVER').AsString = 'S') then
    begin
      FDItensAluguel.Filter := 'cd_produto = ' + FDProdutoID.AsString;
      FDItensAluguel.Filtered := true;
      FDItensAluguel.Edit;

      //Se devolver com atraso
      if FDItensAluguel.FieldByName('DT_DEVOLUCAO').AsDateTime < DATE then
      begin
        FDItensAluguel.FieldByName('QTDE_DIAS_ATRASO').Value := DaysBetween(FDItensAluguel.FieldByName('DT_DEVOLUCAO').AsDateTime, DATE);
        FDItensAluguel.FieldByName('VALOR_MULTA').Value := FDItensAluguel.FieldByName('QTDE_DIAS_ATRASO').AsInteger * (FDItensAluguel.FieldByName('VALOR_DIARIA').AsFloat * 0.1);
        FDItensAluguel.FieldByName('DEVOLVIDO').Value := 'S';
        FDItensAluguel.Post;
      end
      //Se devolver sem atraso
      else
      begin
        FDItensAluguel.FieldByName('QTDE_DIAS_ATRASO').Value := 0;
        FDItensAluguel.FieldByName('VALOR_MULTA').Value := 0;
        FDItensAluguel.FieldByName('DEVOLVIDO').Value := 'S';
        FDItensAluguel.Post;
      end;

      //Deixar produto disponível
      FDProduto.Edit;
      FDProduto.FieldByName('DISPONIVEL').Value := 'S';
      FDProduto.FieldByName('CD_CLIENTE').Value := NULL;
      FDProduto.FieldByName('DEVOLVER').Value := 'N';
      FDProduto.Post;
    end;
  end;
  FDAluguel.Edit;
  FDAluguel.FieldByName('SUBTOTAL').Value := 0;
  FDAluguel.FieldByName('TOTAL_MULTA').Value := 0;
  FDAluguel.FieldByName('TOTAL').Value := 0;
  FDAluguel.Post;

  ShowMessage('Produtos devolvidos com sucesso!');
end;

procedure TFrmDevolucao.btn_pesquisarClick(Sender: TObject);
begin
  FDAluguel.Close;
  FDAluguel.Open();
  FDItensAluguel.Close;
  FDItensAluguel.Open();
  FDQryItensAluguel.Close;
  FDQryItensAluguel.Open();
  FDProduto.Close;

  if (gbCliente.Enabled = True) and (edCodCliente.Text = '') then
  begin
    Application.MessageBox('Por favor, selecione um Cliente.', 'Atenção', MB_OK + MB_ICONERROR);
    edCodCliente.SetFocus;
    abort;
  end;

  if (gbProduto.Enabled = True) and (edCodProduto.Text = '') then
  begin
    Application.MessageBox('Por favor, selecione um Produto.', 'Atenção', MB_OK + MB_ICONERROR);
    edCodProduto.SetFocus;
    abort;
  end;

  if edCodCliente.Text <> '' then
  begin
    FDProduto.Filter := 'CD_CLIENTE = ' + edCodCliente.Text;
    FDProduto.Filtered := True;
    FDItensAluguel.Filter := 'QTDE_DIAS_ATRASO IS NULL AND DEVOLVIDO = ' + #39 + 'N' + #39;
    FDItensAluguel.Filtered := True;
    StatusBar1.Panels[2].Text := 'Cliente: ' + FDCliente.FieldByName('NOME').AsString;
  end;

  if edCodProduto.Text <> '' then
  begin
    FDProduto.Filter := 'ID = ' + edCodProduto.Text;
    FDProduto.Filtered := True;
    StatusBar1.Panels[2].Text := 'Produto: ' + FDQryProduto.FieldByName('DESCRICAO').AsString;
  end;

  FDProduto.Open();
  btn_devolver.Enabled := False;
end;

procedure TFrmDevolucao.btn_sairClick(Sender: TObject);
begin
  if FDProduto.RecordCount > 0 then
  begin
    FDProduto.First;
    while not FDProduto.eof do
    begin
      if FDProdutoDEVOLVER.AsString = 'S' then
      begin
        FDProduto.Edit;
        FDProdutoDEVOLVER.AsString := 'N';
      end;
      FDProduto.Next;
    end;
    Close;
  end
  else Close;
end;

procedure TFrmDevolucao.cbClienteClick(Sender: TObject);
begin
  edCodCliente.Text := cbCliente.KeyValue;
end;

procedure TFrmDevolucao.cbProdutoClick(Sender: TObject);
begin
  edCodProduto.Text := cbProduto.KeyValue;
end;

procedure TFrmDevolucao.edCodClienteExit(Sender: TObject);
begin
  if edCodCliente.Text <> '' then
  begin
    if not FDCliente.Locate('ID', edCodCliente.Text, []) then
    begin
      MessageDlg('O Cliente não foi encontrado.', mtError, [mbOK], 0);
      cbCliente.SetFocus;
      Abort;
    end
    else
    begin
      cbCliente.KeyValue := FDCliente.FieldByName('ID').AsString;
    end;
  end;
end;

procedure TFrmDevolucao.edCodProdutoExit(Sender: TObject);
begin
  if edCodProduto.Text <> '' then
  begin
    if not FDQryProduto.Locate('ID', edCodProduto.Text, []) then
    begin
      MessageDlg('O Produto não foi encontrado.', mtError, [mbOK], 0);
      cbProduto.SetFocus;
      Abort;
    end
    else
    begin
      cbProduto.KeyValue := FDQryProduto.FieldByName('ID').AsString;
    end;
  end;
end;

procedure TFrmDevolucao.edDescontoExit(Sender: TObject);
var Bmk: TBookmark;
    subtotal, total: Real;
begin
  FDProduto.First;
  subtotal:= 0;

  while not FDProduto.Eof do
  begin
    if FDProdutoDEVOLVER.AsString = 'S' then
    begin
      FDItensAluguel.Filter := 'CD_PRODUTO = ' + FDProdutoID.AsString;
      FDItensAluguel.Filtered := True;

      subtotal:= subtotal + FDItensAluguelVALOR_TOTAL.AsFloat + FDItensAluguelVALOR_MULTA.AsFloat;
    end;
     FDProduto.Next;
  end;
  FDAluguelTOTAL.AsFloat := subtotal - (subtotal * FDAluguelDESCONTO.AsFloat / 100);
end;

procedure TFrmDevolucao.edDescProdutoChange(Sender: TObject);
begin
  edCodProduto.Text := '';
end;

procedure TFrmDevolucao.edNomeClienteChange(Sender: TObject);
begin
  edCodCliente.Text := '';
end;

procedure TFrmDevolucao.grAlugueisCellClick(Column: TColumn);
begin
  btn_devolver.Enabled := false;

  if grAlugueis.SelectedField = FDProduto.FieldByName('DEVOLVER') then
  begin
    FDItensAluguel.Filter := 'CD_PRODUTO = ' + FDProdutoID.AsString + ' AND DEVOLVIDO = ' + #39 + 'N' + #39;
    FDItensAluguel.Filtered := True;

    FDProduto.Edit;
    FDItensAluguel.Edit;
    FDAluguel.Edit;

    if FDProduto.FieldByName('DEVOLVER').AsString = 'S' then
    begin

      FDProduto.FieldByName('DEVOLVER').AsString := 'N';

      FDAluguel.FieldByName('TOTAL_MULTA').AsFloat := FDAluguel.FieldByName('TOTAL_MULTA').AsFloat - FDItensAluguel.FieldByName('VALOR_MULTA').AsFloat;
      FDAluguel.FieldByName('SUBTOTAL').AsFloat := FDAluguel.FieldByName('SUBTOTAL').AsFloat - FDItensAluguel.FieldByName('VALOR_TOTAL').AsFloat;

      FDItensAluguelVALOR_MULTA.AsFloat := 0;
      FDItensAluguelQTDE_DIAS_ATRASO.AsInteger := 0;
    end
    else
    begin
      FDProduto.FieldByName('DEVOLVER').AsString := 'S';

      //CALCULAR MULTA E DIAS EM ATRASO
      if FDItensAluguel.FieldByName('DT_DEVOLUCAO').AsDateTime < DATE then
      begin
        FDItensAluguelQTDE_DIAS_ATRASO.AsInteger := DaysBetween(FDItensAluguel.FieldByName('DT_DEVOLUCAO').AsDateTime, DATE);
        FDItensAluguelVALOR_MULTA.AsFloat := FDItensAluguelQTDE_DIAS_ATRASO.AsInteger * (FDItensAluguelVALOR_DIARIA.AsFloat * 0.1);
      end
      else
      begin
        FDItensAluguelQTDE_DIAS_ATRASO.AsInteger := 0;
        FDItensAluguelVALOR_MULTA.AsFloat := 0;
      end;

      FDAluguel.FieldByName('TOTAL_MULTA').AsFloat := FDAluguel.FieldByName('TOTAL_MULTA').AsFloat + FDItensAluguel.FieldByName('VALOR_MULTA').AsFloat;
      FDAluguel.FieldByName('SUBTOTAL').AsFloat := FDAluguel.FieldByName('SUBTOTAL').AsFloat + FDItensAluguel.FieldByName('VALOR_TOTAL').AsFloat;
    end;
    FDAluguelTOTAL.AsFloat := FDAluguelSUBTOTAL.AsFloat + FDAluguelTOTAL_MULTA.AsFloat;
  end;

  FDProduto.First;

  while not FDProduto.Eof do
  begin
    if (FDProduto.FieldByName('DEVOLVER').AsString = 'S') then
    begin
      btn_devolver.Enabled := true;
      break;
    end;
    FDProduto.Next;
  end;
end;

procedure TFrmDevolucao.grAlugueisColEnter(Sender: TObject);
begin
  if grAlugueis.SelectedField = FDProduto.FieldByName('DEVOLVER') then grAlugueis.Options := grAlugueis.Options - [dgEditing]
  else grAlugueis.Options := grAlugueis.Options + [dgEditing];
end;

procedure TFrmDevolucao.grAlugueisDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  //Pinta Célula ímpares
  if odd(FDProduto.RecNo) then grAlugueis.Canvas.Brush.Color := clGradientInactiveCaption
  else grAlugueis.Canvas.Brush.Color := clWindow;

  grAlugueis.Canvas.FillRect(Rect);
  grAlugueis.DefaultDrawDataCell(Rect, Column.Field, State);

  //Simulando um checkBox para o campo utilizado
  if Column.Field = FDProduto.FieldByName('DEVOLVER') then
  begin
    grAlugueis.Canvas.FillRect(Rect);
    if FDProduto.FieldByName('DEVOLVER').AsString = 'S' then ImageList1.Draw(grAlugueis.Canvas, Rect.Left + 20, Rect.Top + 1, 1)
    else ImageList1.Draw(grAlugueis.Canvas, Rect.Left + 20, Rect.Top + 1, 0);
  end;
end;

procedure TFrmDevolucao.rgPesquisaClick(Sender: TObject);
begin
  if rgPesquisa.ItemIndex = 0 then
  begin
    gbCliente.Enabled := True;

    FDCliente.Close;
    FDCliente.Open();

    if edCodProduto.Text <> '' then edCodProduto.Clear;
    cbProduto.KeyValue := null;

    gbProduto.Enabled := False;

    btn_devolver.Enabled := False;
    btn_pesquisar.Enabled := True;

    edCodCliente.SetFocus;
  end
  else if rgPesquisa.ItemIndex = 1 then
  begin
    gbProduto.Enabled := True;

    FDQryProduto.Close;
    FDQryProduto.Open();

    if edCodCliente.Text <> '' then edCodCliente.Clear;
    cbCliente.KeyValue := null;

    gbCliente.Enabled := False;

    btn_devolver.Enabled := False;
    btn_pesquisar.Enabled := True;

    edCodProduto.SetFocus;
  end;
end;

end.
