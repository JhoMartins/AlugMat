unit UntProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask;

type
  TFrmProduto = class(TFrmPadrao1)
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edDescricao: TDBEdit;
    edDataInc: TDBEdit;
    edDataAlt: TDBEdit;
    edValorDiaria: TDBEdit;
    DSMarca: TDataSource;
    FDQryMarca: TFDQuery;
    DBLookupComboBox1: TDBLookupComboBox;
    edCodInt: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DSCategoria: TDataSource;
    FDQryCategoria: TFDQuery;
    DBLookupComboBox3: TDBLookupComboBox;
    DSFornecedor: TDataSource;
    FDQyFornecedor: TFDQuery;
    FDTabelaID: TFDAutoIncField;
    FDTabelaDESCRICAO: TStringField;
    FDTabelaCD_INTERNO: TStringField;
    FDTabelaVALOR_DIARIA: TFloatField;
    FDTabelaSTATUS: TStringField;
    FDTabelaDISPONIVEL: TStringField;
    FDTabelaCD_MARCA: TIntegerField;
    FDTabelaCD_CATEGORIA: TIntegerField;
    FDTabelaCD_FORNECEDOR: TIntegerField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    FDTabelaDATA_ALT: TSQLTimeStampField;
    Descrio1: TMenuItem;
    ValordaDiria1: TMenuItem;
    Disponivel1: TMenuItem;
    Descrio2: TMenuItem;
    CdigoInterno1: TMenuItem;
    ValordaDiria2: TMenuItem;
    FDTabelaCARACTERISTICAS: TMemoField;
    dbCaracteristicas: TDBMemo;
    DBText1: TDBText;
    procedure btn_salvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Disponivel1Click(Sender: TObject);
    procedure Descrio1Click(Sender: TObject);
    procedure ValordaDiria1Click(Sender: TObject);
    procedure Descrio2Click(Sender: TObject);
    procedure CdigoInterno1Click(Sender: TObject);
    procedure ValordaDiria2Click(Sender: TObject);
    procedure IDCdigo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProduto: TFrmProduto;

implementation

{$R *.dfm}

uses UntDM, UntMenuPrincipal, UntUsuario, UntFornecedor, UntPesqData,
  UntPesqString, UntPesqRadio;

procedure TFrmProduto.btn_salvarClick(Sender: TObject);
begin
   if (edDescricao.Text = '') or (edCodInt.Text = '') or (edValorDiaria.Text = '') or (dbCaracteristicas.Text = '') or (strtoint(DBLookupComboBox1.Text)= -1) or (strtoint(DBLookupComboBox2.Text)= -1) or (strtoint(DBLookupComboBox3.Text)= -1) then
    begin

    //Colorir Campos Obrigatórios
    edDescricao.color := clInactiveCaption;
    edCodInt.Color:= clInactiveCaption;
    edValorDiaria.color := clInactiveCaption;
    dbCaracteristicas.Color := clInactiveCaption;
    DBLookupComboBox1.color := clInactiveCaption;
    DBLookupComboBox2.color := clInactiveCaption;
    DBLookupComboBox3.color := clInactiveCaption;

    Application.MessageBox('Preencha todos os campos obrigatórios.','Atenção', MB_OK + MB_ICONERROR);
    edDescricao.SetFocus;
    abort;
  end
  else
  begin
    inherited;
    edDescricao.color := clWindow;
    edCodInt.Color := clWindow;
    edValorDiaria.color := clWindow;
    dbCaracteristicas.Color := clWindow;
    DBLookupComboBox1.color := clWindow;
    DBLookupComboBox2.color := clWindow;
    DBLookupComboBox3.Color := clWindow;
  end;
end;

procedure TFrmProduto.CdigoInterno1Click(Sender: TObject);
begin
  inherited;
   FDTabela.IndexFieldNames := 'CD_INTERNO';
   StatusBar1.Panels[2].Text := 'Ordenado: Código Interno';
end;

procedure TFrmProduto.Descrio1Click(Sender: TObject);
begin
  inherited;
  tarefa := 'Pesquisa por Nome';
  pesqString.ShowModal;

   if pesqString.RadioGroup1.ItemIndex = 0 then
  begin
    FDTabela.Filter := 'UPPER(DESCRICAO) LIKE ' + #39 + '%' + pesqString.Edit1.text + '%' + #39;
    StatusBar1.Panels[2].Text := 'Nome contém: ' + pesqString.Edit1.Text;
  end;

  if pesqString.RadioGroup1.ItemIndex = 1 then
  begin
    FDTabela.Filter := 'UPPER(DESCRICAO) LIKE ' + #39 + pesqString.Edit1.text + '%' + #39;
    StatusBar1.Panels[2].Text := 'Nome inicia com: ' + pesqString.Edit1.Text;
  end;

  if pesqString.RadioGroup1.ItemIndex = 2 then
  begin
    FDTabela.Filter := 'UPPER(DESCRICAO) LIKE ' + #39 + '%' + pesqString.Edit1.text + #39;
    StatusBar1.Panels[2].Text := 'Nome termina com: ' + pesqString.Edit1.Text;
  end;

  FDTabela.Filtered := True;

  Executar := sentencaSQL;
  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;

end;

procedure TFrmProduto.Descrio2Click(Sender: TObject);
begin
  inherited;
   FDTabela.IndexFieldNames := 'DESCRICAO';
   StatusBar1.Panels[2].Text := 'Ordenado: Descrição';
end;

procedure TFrmProduto.Disponivel1Click(Sender: TObject);
var i: integer;
begin
  inherited;
tarefa := 'Pesquisa por Disponibilidade';

  pesqRadio.RadioGroup1.Caption := 'Pesquisa de Produtos disponíveis:';
  pesqRadio.RadioGroup1.Items.Add('Sim');
  pesqRadio.RadioGroup1.Items.Add('Não');

  pesqRadio.ShowModal;

  if pesqRadio.RadioGroup1.ItemIndex = 0 then
  begin
    FDTabela.Filter := 'DISPONIVEL = ' + #39 + 'S' + #39;
    StatusBar1.Panels[2].Text := 'Diponivél.: Sim';
  end;

  if pesqRadio.RadioGroup1.ItemIndex = 1 then
  begin
    FDTabela.Filter := 'DISPONIVEL = ' + #39 + 'N' + #39;
    StatusBar1.Panels[2].Text := 'Disponivél.: Não';
  end;

  FDTabela.Filtered := True;

  Executar := sentencaSQL;
  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;
  i := pesqRadio.RadioGroup1.Items.Count - 1;
  while i > -1 do
  begin
    pesqRadio.RadioGroup1.Items.Delete(i);
    i := i - 1;
  end;

 
end;



procedure TFrmProduto.FormActivate(Sender: TObject);
begin
    FDTabela.TableName := 'PRODUTO';
  TipoID := 0;

  modoEdicao := FrmMenuPrincipal.QueryLogin.FieldByName('PER_PRODUTO_I').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_PRODUTO_A').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_PRODUTO_E').AsString;

  Executar := exibeBotoes;
  Executar := ExibePanels;

  FDTabela.FieldByName('DATA_INC').EditMask := '99/99/9999;1;_';
  FDTabela.FieldByName('DATA_ALT').EditMask := '99/99/9999;1;_';
  inherited;
  FDTabela.Open();
  FDQryMarca.Open();
  FDQryCategoria.Open();
  FDQyFornecedor.Open();
  Executar := habilitaBotoes;
  edDataInc.Enabled := false;
  edDataAlt.Enabled := false;
end;

procedure TFrmProduto.IDCdigo1Click(Sender: TObject);
begin
  inherited;
   FDTabela.IndexFieldNames := 'ID';
   StatusBar1.Panels[2].Text := 'Ordenado: Por ID';
end;

procedure TFrmProduto.ValordaDiria1Click(Sender: TObject);
begin
  inherited;
  tarefa := 'Pesquisa por Valor';
  pesqString.ShowModal;

   if pesqString.RadioGroup1.ItemIndex = 0 then
  begin
    FDTabela.Filter := 'UPPER(VALOR_DIARIA) LIKE ' + #39 + '%' + pesqString.Edit1.text + '%' + #39;
    StatusBar1.Panels[2].Text := 'Valor contém: ' + pesqString.Edit1.Text;
  end;

  if pesqString.RadioGroup1.ItemIndex = 1 then
  begin
    FDTabela.Filter := 'UPPER(VALOR_DIARIA) LIKE ' + #39 + pesqString.Edit1.text + '%' + #39;
    StatusBar1.Panels[2].Text := 'Valor inicia com: ' + pesqString.Edit1.Text;
  end;

  if pesqString.RadioGroup1.ItemIndex = 2 then
  begin
    FDTabela.Filter := 'UPPER(VALOR_DIARIA) LIKE ' + #39 + '%' + pesqString.Edit1.text + #39;
    StatusBar1.Panels[2].Text := 'Valor termina com: ' + pesqString.Edit1.Text;
  end;

  FDTabela.Filtered := True;

  Executar := sentencaSQL;
  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;

end;

procedure TFrmProduto.ValordaDiria2Click(Sender: TObject);
begin
  inherited;
  FDTabela.IndexFieldNames := 'VALOR_DIARIA';
  StatusBar1.Panels[2].Text := 'Ordenado: Valor da diária';

end;

end.
