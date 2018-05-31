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
var total_prod, i: integer;
begin
  total_prod := FDProduto.RecordCount;

  for i := 1 to total_prod do
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

  ShowMessage('Produtos devolvidos com sucesso!');
  btn_pesquisar.Click;
end;

procedure TFrmDevolucao.btn_pesquisarClick(Sender: TObject);
var achou: boolean;
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
    FDItensAluguel.Filter := 'DEVOLVIDO = ' + #39 + 'N' + #39;
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

  achou := false;
  FDProduto.First;
  while not FDProduto.eof do
  begin
    if (FDProdutoDEVOLVER.AsString = 'S') and (achou = false) then
    begin
      achou := true;
      btn_sair.Enabled := false;
    end;
    if achou = false then FDProduto.Next
    else break;
  end;

  if achou = false then   btn_sair.Enabled := true;

end;

procedure TFrmDevolucao.btn_sairClick(Sender: TObject);
var total_produtos, x: integer;
begin
{
  total_produtos := FDProduto.RecordCount;

  if total_produtos > 0 then
  begin
    for x := 1 to total_produtos do
    begin
      FDProduto.First;
      while not FDProduto.eof do
      begin
        if FDProdutoDEVOLVER.AsString = 'S' then
        begin
          FDProduto.Edit;
          FDProduto.FieldByName('DEVOLVER').Value := NULL;
          FDProduto.Post;

          FDAluguel.First;
          while not FDAluguel.Eof do
          begin

            FDItensAluguel.First;
            while not FDItensAluguel.eof do
            begin
              //ShowMessage('Produto: '+FDProdutoID.AsString);
              //ShowMessage('Item: '+FDItensAluguelCD_PRODUTO.AsString);
              //ShowMessage('Aluguel: '+FDItensAluguelCD_ALUGUEL.AsString);

              if (FDItensAluguel.FieldByName('CD_PRODUTO').Value = FDProduto.FieldByName('ID').Value) then
              begin
                FDItensAluguel.Edit;
                FDItensAluguel.FieldByName('DEVOLVIDO').Value := 'N';
                FDItensAluguel.FieldByName('QTDE_DIAS_ATRASO').Value := NULL;
                FDItensAluguel.FieldByName('VALOR_MULTA').Value := NULL;
                FDItensAluguel.Post;
              end;
              FDItensAluguel.Next;
            end;

            FDAluguel.Next;
          end;
        end;

        FDProduto.Next;
      end;

      Close;
    end;
  end
  else Close;
}
  Close;
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
var subtotal, total: Real;
    total_prod, i: integer;
begin
  subtotal:= 0;
  FDProduto.First;

  while not FDProduto.eof do
  begin
    FDItensAluguel.Filter := 'CD_PRODUTO = ' + FDProdutoID.AsString + ' AND DEVOLVIDO = ''' + 'N' + '''';
    FDItensAluguel.Filtered := True;
    FDItensAluguel.First;
    while not FDItensAluguel.eof do
    begin
      subtotal:= subtotal + FDItensAluguelVALOR_TOTAL.AsFloat + FDItensAluguelVALOR_MULTA.AsFloat;
      FDItensAluguel.Next;
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
var achou: boolean;
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

  achou := false;
  FDProduto.First;
  while not FDProduto.eof do
  begin
    if (FDProdutoDEVOLVER.AsString = 'S') and (achou = false) then
    begin
      achou := true;
      btn_sair.Enabled := false;
    end;
    if achou = false then FDProduto.Next
    else break;
  end;

  if achou = false then   btn_sair.Enabled := true;
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
  if odd(FDProduto.RecNo) then grAlugueis.Canvas.Brush.Color := clWindow
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
