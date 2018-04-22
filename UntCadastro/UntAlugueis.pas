unit UntAlugueis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, DateUtils;

type
  TFrmAluguel = class(TFrmPadrao1)
    Label2: TLabel;
    Label3: TLabel;
    edAtendente: TDBEdit;
    edCliente: TDBEdit;
    cbAtendente: TDBLookupComboBox;
    cbCliente: TDBLookupComboBox;
    sbtn_CadUsuario: TSpeedButton;
    sbtn_CadCliente: TSpeedButton;
    FDQryAtendente: TFDQuery;
    DSAtendente: TDataSource;
    DSCliente: TDataSource;
    FDQryCliente: TFDQuery;
    FDItensAluguel: TFDTable;
    DSItensAluguel: TDataSource;
    GroupBox1: TGroupBox;
    PnlItens: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edProduto: TDBEdit;
    edValorDiaria: TDBEdit;
    edQtdeDias: TDBEdit;
    edValorTotal: TDBEdit;
    cbProduto: TDBLookupComboBox;
    sbtn_CadProduto: TSpeedButton;
    FDQryProduto: TFDQuery;
    DSProduto: TDataSource;
    btnAdicionar: TBitBtn;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    grProdutos: TDBGrid;
    FDItensAluguelDescProduto: TStringField;
    Label8: TLabel;
    Label9: TLabel;
    FDTabelaID: TFDAutoIncField;
    FDTabelaSUBTOTAL: TFloatField;
    FDTabelaTOTAL_MULTA: TFloatField;
    FDTabelaDESCONTO: TFloatField;
    FDTabelaTOTAL: TFloatField;
    FDTabelaCD_CLIENTE: TIntegerField;
    FDTabelaCD_USUARIO: TIntegerField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    FDTabelaDATA_ALT: TSQLTimeStampField;
    FDTabelaSTATUS: TStringField;
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
    Label10: TLabel;
    Label11: TLabel;
    edDataInc: TDBEdit;
    edDataAlt: TDBEdit;
    Label15: TLabel;
    FDItensAluguelCodInterno: TStringField;
    cbCodInterno: TDBLookupComboBox;
    FDCmdAtualizaProduto: TFDCommand;
    Label16: TLabel;
    lbCodAluguel: TDBText;
    FDItensAluguelDEVOLVIDO: TStringField;
    edTotal: TEdit;
    N3: TMenuItem;
    AluguisporCliente1: TMenuItem;
    AluguisporAtendente1: TMenuItem;
    N4: TMenuItem;
    Cliente1: TMenuItem;
    Atendente1: TMenuItem;
    procedure FDTabelaCD_USUARIOValidate(Sender: TField);
    procedure FDTabelaCD_CLIENTEValidate(Sender: TField);
    procedure FormActivate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FDItensAluguelCD_PRODUTOValidate(Sender: TField);
    procedure FDItensAluguelAfterPost(DataSet: TDataSet);
    procedure FDItensAluguelAfterDelete(DataSet: TDataSet);
    procedure FDItensAluguelNewRecord(DataSet: TDataSet);
    procedure edQtdeDiasExit(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FDItensAluguelCodInternoValidate(Sender: TField);
    procedure btn_salvarClick(Sender: TObject);
    procedure btnDevolverClick(Sender: TObject);
    procedure edDescontoExit(Sender: TObject);
    procedure grProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btn_excluirClick(Sender: TObject);
    function CalcularTotal: real;
    procedure btn_primeiroClick(Sender: TObject);
    procedure btn_anteriorClick(Sender: TObject);
    procedure btn_proximoClick(Sender: TObject);
    procedure btn_ultimoClick(Sender: TObject);
    procedure sbtn_CadUsuarioClick(Sender: TObject);
    procedure sbtn_CadClienteClick(Sender: TObject);
    procedure sbtn_CadProdutoClick(Sender: TObject);
    procedure AluguisporCliente1Click(Sender: TObject);
    procedure AluguisporAtendente1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Atendente1Click(Sender: TObject);
    procedure DatadeDevoluo1Click(Sender: TObject);
  private


    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAluguel: TFrmAluguel;

implementation

{$R *.dfm}

uses UntDM, UntMenuPrincipal, UntUsuario, UntCliente, UntProduto, UntPesqString;

function TFrmAluguel.CalcularTotal(): real;
var total: real;
begin
  with FDItensAluguel do
  begin
    DisableControls;

    try
      total := 0;
      First;

      while not eof do
      begin
        total := total + FDItensAluguelVALOR_TOTAL.AsFloat;
        Next;
      end;

    finally
      EnableControls;
    end;
  end;

  result := total;
end;

procedure TFrmAluguel.Cliente1Click(Sender: TObject);
begin
  inherited;

  FDTabela.IndexFieldNames := 'CD_CLIENTE';
  StatusBar1.Panels[2].Text := 'Ordenado: Código do Cliente';
end;

procedure TFrmAluguel.DatadeDevoluo1Click(Sender: TObject);
begin
  inherited;

  FDTabela.IndexFieldNames := 'CD_CLIENTE';
  StatusBar1.Panels[2].Text := 'Ordenado: Código do Cliente';
end;

procedure TFrmAluguel.AluguisporAtendente1Click(Sender: TObject);
begin
  pesqString.Edit1.NumbersOnly := true;
  pesqString.RadioGroup1.Visible := false;

  inherited;

  tarefa := 'Pesquisa de aluguéis por Atendente';
  pesqString.ShowModal;


  StatusBar1.Panels[2].Text := 'Aluguéis do atendente ' + PesqString.Edit1.Text;

  FDTabela.Filter := 'CD_USUARIO = ' + PesqString.Edit1.Text;
  FDTabela.Filtered := True;

  Executar := sentencaSQL;
  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;
end;

procedure TFrmAluguel.AluguisporCliente1Click(Sender: TObject);
begin
  pesqString.Edit1.NumbersOnly := true;
  pesqString.RadioGroup1.Visible := false;

  inherited;

  tarefa := 'Pesquisa de aluguéis por Cliente';
  pesqString.ShowModal;


  StatusBar1.Panels[2].Text := 'Aluguéis do cliente ' + PesqString.Edit1.Text;

  FDTabela.Filter := 'CD_CLIENTE = ' + PesqString.Edit1.Text;
  FDTabela.Filtered := True;

  Executar := sentencaSQL;
  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;
end;

procedure TFrmAluguel.Atendente1Click(Sender: TObject);
begin
  inherited;

  FDTabela.IndexFieldNames := 'CD_USUARIO';
  StatusBar1.Panels[2].Text := 'Ordenado: Código do Atendente';
end;

procedure TFrmAluguel.btnAdicionarClick(Sender: TObject);
begin
  inherited;
  if edCliente.Text = '' then
  begin
    Application.MessageBox('Selecione um cliente.', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edCliente.SetFocus;
  end
  else
  begin
    FDQryProduto.Close;
    FDQryProduto.Open();

    btnAdicionar.Enabled := False;
    btnExcluir.Enabled := False;
    btnConfirmar.Enabled := True;
    btnCancelar.Enabled := True;

    PnlItens.Enabled := True;

    FDItensAluguel.Insert;

    edProduto.SetFocus;
  end;
end;

procedure TFrmAluguel.btnCancelarClick(Sender: TObject);
begin
  inherited;

  edProduto.Color := clWindow;
  edQtdeDias.Color := clWindow;

  btnAdicionar.Enabled := True;
  if FDItensAluguel.RecordCount > 0 then btnExcluir.Enabled := True
  else btnExcluir.Enabled := False;
  btnConfirmar.Enabled := False;
  btnCancelar.Enabled := False;

  PnlItens.Enabled := False;

  FDItensAluguel.Cancel;
end;

procedure TFrmAluguel.btnConfirmarClick(Sender: TObject);
var update: TStrings;
begin
  inherited;
  if edProduto.Text = '' then
  begin
    ShowMessage('Por favor, selecione um produto.');
    edProduto.Color := clGradientInactiveCaption;
    edProduto.SetFocus;
    Abort;
  end;

  if edQtdeDias.Text = '' then
  begin
    ShowMessage('Por favor, informe a quantidade de dias do aluguel do produto.');
    edQtdeDias.Color := clGradientInactiveCaption;
    edQtdeDias.SetFocus;
    Abort;
  end;

  edProduto.Color := clWindow;
  edQtdeDias.Color := clWindow;

  btnAdicionar.Enabled := True;
  btnExcluir.Enabled := True;
  btnConfirmar.Enabled := False;
  btnCancelar.Enabled := False;

  PnlItens.Enabled := False;

  FDItensAluguelDT_LOCACAO.AsDateTime := Date;
  FDItensAluguelDT_DEVOLUCAO.AsDateTime := Date + FDItensAluguelQTDE_DIAS.AsInteger;
  FDItensAluguelDEVOLVIDO.AsString := 'N';

  FDCmdAtualizaProduto.CommandText.Clear;
  FDCmdAtualizaProduto.CommandText.Add('UPDATE PRODUTO SET DISPONIVEL = ' + #39 + 'N' + #39 + ', CD_CLIENTE = ' + edCliente.Text + ' WHERE ID = ' + FDQryProduto.FieldByName('ID').AsString);
  FDCmdAtualizaProduto.Execute;

  FDItensAluguel.Post;

  edProduto.Text := '';
  edValorDiaria.Text := '';
  edValorTotal.Text := '';
  edQtdeDias.Text := '';
  cbProduto.KeyValue := null;
  cbCodInterno.KeyValue := null;

  edTotal.Text := formatfloat('#0.00',CalcularTotal());
end;

procedure TFrmAluguel.btnDevolverClick(Sender: TObject);
var todos: integer;
    ItensAtraso: String;
    data: TDateTime;
begin
  inherited;

  ItensAtraso := 'O prazo de devolução dos itens abaixo foi excedido:' + #13#13;
  todos := Application.MessageBox('Deseja devolver todos os itens?', 'Atenção', MB_YESNOCANCEL + MB_DEFBUTTON2 + MB_ICONQUESTION);

  if todos = IDCANCEL then
  begin
    Application.MessageBox('A devolução dos itens foi cancelada!', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  FDItensAluguel.Filter := 'CD_ALUGUEL = ' + FDTabelaID.AsString;
  FDItensAluguel.Filtered := True;
  FDItensAluguel.Edit;

  if todos = IDYES then
  begin
    if FDItensAluguel.FieldByName('DT_DEVOLUCAO').AsDateTime < DATE then
    begin
      FDItensAluguelQTDE_DIAS_ATRASO.AsInteger := DaysBetween(FDItensAluguel.FieldByName('DT_DEVOLUCAO').AsDateTime, DATE);
      FDItensAluguelVALOR_MULTA.AsFloat := FDItensAluguelQTDE_DIAS_ATRASO.AsInteger * (FDItensAluguelVALOR_DIARIA.AsFloat * 0.1);

      ItensAtraso := ItensAtraso +
                     '----------------------------------------------------' + #13 +
                     'Produto: ' + FDItensAluguelDescProduto.AsString + #13 +
                     'Qtde. de dias em atraso: ' + FDItensAluguel.FieldByName('QTDE_DIAS_ATRASO').AsString + #13 +
                     'Valor da multa: ' + FDItensAluguelVALOR_MULTA.AsString + #13 +
                     '----------------------------------------------------' + #13;
    end;
  end

  else if todos = IDNO then
  begin
    if grProdutos.SelectedRows.Count < 1 then
    begin
      Application.MessageBox('Por favor, selecione na tabela um ou mais itens para serem devolvidos.', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      Abort;
    end
    else
    begin

    end;
  end;

  
  if FDItensAluguelVALOR_MULTA.AsInteger > 0 then Application.MessageBox(PChar(ItensAtraso), 'Atenção', MB_OK + MB_ICONEXCLAMATION);

  FDCmdAtualizaProduto.CommandText.Clear;
  FDCmdAtualizaProduto.CommandText.Add('UPDATE PRODUTO SET DISPONIVEL = ' + #39 + 'S' + #39 + ' WHERE ID = ' + FDQryProduto.FieldByName('ID').AsString);
  FDCmdAtualizaProduto.Execute;

  FDItensAluguel.Post;
end;

procedure TFrmAluguel.btnExcluirClick(Sender: TObject);
begin
  inherited;
  FDCmdAtualizaProduto.CommandText.Clear;
  FDCmdAtualizaProduto.CommandText.Add('UPDATE PRODUTO SET DISPONIVEL = ' + #39 + 'S' + #39 + ', CD_CLIENTE = NULL WHERE ID = ' + FDItensAluguelCD_PRODUTO.AsString);
  FDCmdAtualizaProduto.Execute;

  FDItensAluguel.Delete;

  if FDItensAluguel.RecordCount > 0 then btnExcluir.Enabled := True
  else btnExcluir.Enabled := False;

  btnAdicionar.Enabled := True;
  btnConfirmar.Enabled := False;
  btnCancelar.Enabled := False;

  PnlItens.Enabled := False;

  edTotal.Text := formatfloat('#0.00',CalcularTotal());
end;

procedure TFrmAluguel.btn_anteriorClick(Sender: TObject);
begin
  inherited;
  edTotal.Text := formatfloat('#0.00',CalcularTotal());
end;

procedure TFrmAluguel.btn_cancelarClick(Sender: TObject);
var confCancel: integer;
begin
  if FDItensAluguel.RecordCount = 0 then
  begin
    confCancel := Application.MessageBox('Se a inclusão/alteração do Aluguel for cancelada sem nenhum' + #13 + 'Produto adicionado, o Aluguel será excluído.' + #13#13 + 'Tem certeza que deseja excluir o Aluguel?', 'Atenção', MB_YESNO + MB_DEFBUTTON2 + MB_ICONEXCLAMATION);
    if confCancel = IDYES then
    begin
      FDItensAluguel.First;
      while not FDItensAluguel.eof do
      begin
        FDItensAluguel.Delete;
      end;
      FDTabela.Delete;
    end
    else
    begin
      Abort;
    end;
  end;

  inherited;
end;

procedure TFrmAluguel.btn_editarClick(Sender: TObject);
begin
  inherited;

  btnConfirmar.Enabled := False;
  btnCancelar.Enabled := False;
  btnExcluir.Enabled := True;
  PnlItens.Enabled := False;
end;

procedure TFrmAluguel.btn_excluirClick(Sender: TObject);
var confExcl: Integer;
begin
  confExcl := Application.MessageBox('Confirma a exclusão desse registro?', 'Atenção', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION);

  if confExcl = IDYES then
  begin
    //Pegar todos os produtos relacionados ao aluguel
    FDItensAluguel.Filter := 'CD_ALUGUEL = ' + FDTabelaID.AsString;
    FDItensAluguel.Filtered := True;
    FDItensAluguel.Edit;

    //Deixar todos os produtos do Aluguel disponíveis
    FDItensAluguel.First;
    while not FDItensAluguel.eof do
    begin
      FDCmdAtualizaProduto.CommandText.Clear;
      FDCmdAtualizaProduto.CommandText.Add('UPDATE PRODUTO SET DISPONIVEL = ' + #39 + 'S' + #39 + ', CD_CLIENTE = NULL WHERE ID = ' + FDItensAluguelCD_PRODUTO.AsString);
      FDCmdAtualizaProduto.Execute;

      FDItensAluguel.Delete;
    end;
    FDTabela.Delete;

    Application.MessageBox('O registro foi excluído com sucesso.', 'Informação', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    Application.MessageBox('A exclusão desse registro foi abortada.', 'Informação', MB_OK + MB_ICONERROR);
  end;

  Executar := habilitaBotoes;
  Executar := exibePanels;
end;

procedure TFrmAluguel.btn_inserirClick(Sender: TObject);
begin
  inherited;

  FDTabela.Post;
  FDTabela.Edit;
  Executar := ExibePanels;

  btnAdicionar.Enabled := True;
  btnConfirmar.Enabled := False;
  btnCancelar.Enabled := False;
  btnExcluir.Enabled := False;
  PnlItens.Enabled := False;
end;

procedure TFrmAluguel.btn_primeiroClick(Sender: TObject);
begin
  inherited;
  edTotal.Text := formatfloat('#0.00',CalcularTotal());
end;

procedure TFrmAluguel.btn_proximoClick(Sender: TObject);
begin
  inherited;
  edTotal.Text := formatfloat('#0.00',CalcularTotal());
end;

procedure TFrmAluguel.btn_salvarClick(Sender: TObject);
begin
  if FDItensAluguel.RecordCount = 0 then
  begin
    Application.MessageBox('Não é possível salvar o Aluguel, pois nenhum produto foi adicionado.' + #13 + 'Por favor, adicione ao menos um produto ou cancele o Aluguel.', 'Erro', MB_OK + MB_ICONERROR);
    Abort;
  end;

  inherited;
end;

procedure TFrmAluguel.btn_ultimoClick(Sender: TObject);
begin
  inherited;
  edTotal.Text := formatfloat('#0.00',CalcularTotal());
end;

procedure TFrmAluguel.edDescontoExit(Sender: TObject);
begin
  inherited;
  //FDTabelaTOTAL.AsFloat := FDTabelaSUBTOTAL.AsFloat - FDTabelaDESCONTO.AsFloat;
  FDTabelaTOTAL.AsFloat := 0;
end;

procedure TFrmAluguel.edQtdeDiasExit(Sender: TObject);
begin
  inherited;

  FDItensAluguelVALOR_TOTAL.AsFloat := FDItensAluguelVALOR_DIARIA.AsFloat * FDItensAluguelQTDE_DIAS.AsInteger;
end;

procedure TFrmAluguel.FDItensAluguelAfterDelete(DataSet: TDataSet);
var Bmk: TBookmark;
    subtotal, total: Real;
begin
  inherited;
  edTotal.Text := formatfloat('#0.00',CalcularTotal());
end;

procedure TFrmAluguel.FDItensAluguelAfterPost(DataSet: TDataSet);
var Bmk: TBookmark;
    subtotal, multa, total: Real;
begin
  inherited;
  edTotal.Text := formatfloat('#0.00',CalcularTotal());
end;

procedure TFrmAluguel.FDItensAluguelCD_PRODUTOValidate(Sender: TField);
begin
  inherited;

  if not FDQryProduto.Locate('ID', FDItensAluguelCD_PRODUTO.AsString, []) then
  begin
    MessageDlg('Produto não encontrado.', mtError, [mbOK],0);
    cbProduto.SetFocus;
    Abort;
  end
  else
  begin
    FDItensAluguelVALOR_DIARIA.AsFloat := FDQryProduto.FieldByName('VALOR_DIARIA').AsFloat;
    edQtdeDias.SetFocus;
  end;
end;

procedure TFrmAluguel.FDItensAluguelCodInternoValidate(Sender: TField);
begin
  inherited;
  if not FDQryProduto.Locate('CD_INTERNO', FDItensAluguelCodInterno.AsString, []) then
  begin
    MessageDlg('Produto não encontrado.', mtError, [mbOK],0);
    cbProduto.SetFocus;
    Abort;
  end
  else
  begin
    FDItensAluguelVALOR_DIARIA.AsFloat := FDQryProduto.FieldByName('VALOR_DIARIA').AsFloat;
    FDItensAluguelVALOR_MULTA.AsFloat := 0;
    FDItensAluguelQTDE_DIAS_ATRASO.AsInteger := 0;
    edQtdeDias.SetFocus;
  end;
end;

procedure TFrmAluguel.FDItensAluguelNewRecord(DataSet: TDataSet);
begin
  inherited;

  FDItensAluguelCD_ALUGUEL.AsInteger := FDTabelaID.AsInteger;
end;

procedure TFrmAluguel.FDTabelaCD_CLIENTEValidate(Sender: TField);
begin
  inherited;

  if not FDQryCliente.Locate('ID', FDTabelaCD_CLIENTE.AsString, []) then
  begin
    MessageDlg('O Cliente não foi encontrado.', mtError, [mbOK], 0);
    cbCliente.SetFocus;
    Abort;
  end;
end;

procedure TFrmAluguel.FDTabelaCD_USUARIOValidate(Sender: TField);
begin
  inherited;

  if not FDQryAtendente.Locate('ID', FDTabelaCD_USUARIO.AsString, []) then
  begin
    MessageDlg('O Atendente não foi encontrado.', mtError, [mbOK], 0);
    cbAtendente.SetFocus;
    Abort;
  end;
end;

procedure TFrmAluguel.FormActivate(Sender: TObject);
begin
  FDTabela.TableName := 'ALUGUEL';
  nomeJanela := 'Aluguel';
  tipoID := 0;

  modoEdicao := FrmMenuPrincipal.QueryLogin.FieldByName('PER_ALUGUEL_I').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_ALUGUEL_A').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_ALUGUEL_E').AsString;

  Executar := exibePanels;

  inherited;

  FDTabela.Open();
  FDItensAluguel.Open();
  Executar := habilitaBotoes;

  FDQryAtendente.Close;
  FDQryAtendente.Open();

  FDQryCliente.Close;
  FDQryCliente.Open();

  FDQryProduto.Close;
  FDQryProduto.Open();

  edTotal.Text := formatfloat('#0.00',CalcularTotal());
end;

procedure TFrmAluguel.grProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  //COLORIR LINHA
  if FDItensAluguelQTDE_DIAS_ATRASO.AsInteger > 0 then
  begin
    grProdutos.Canvas.Font.Color := clRed;
    grProdutos.Canvas.FillRect(Rect);
    grProdutos.DefaultDrawDataCell(Rect, Column.Field, State);
  end;

end;

procedure TFrmAluguel.sbtn_CadUsuarioClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmUsuario, FrmUsuario);
  FrmUsuario.ShowModal;
  FrmUsuario.Free;
end;

procedure TFrmAluguel.sbtn_CadClienteClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmCliente, FrmCliente);
  FrmCliente.ShowModal;
  FrmCliente.Free;
end;

procedure TFrmAluguel.sbtn_CadProdutoClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmProduto, FrmProduto);
  FrmProduto.ShowModal;
  FrmProduto.Free;
end;

end.
