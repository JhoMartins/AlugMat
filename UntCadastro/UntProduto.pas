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
    FDTabelaID: TFDAutoIncField;
    FDTabelaDESCRICAO: TStringField;
    FDTabelaCD_INTERNO: TStringField;
    FDTabelaVALOR_DIARIA: TFloatField;
    FDTabelaSTATUS: TStringField;
    FDTabelaDISPONIVEL: TStringField;
    FDTabelaCARACTERISTICAS: TMemoField;
    FDTabelaCD_MARCA: TIntegerField;
    FDTabelaCD_CATEGORIA: TIntegerField;
    FDTabelaCD_FORNECEDOR: TIntegerField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    FDTabelaDATA_ALT: TSQLTimeStampField;
    edDataInc: TDBEdit;
    edDataAlt: TDBEdit;
    edValorDiaria: TDBEdit;
    DSMarca: TDataSource;
    FDQryMarca: TFDQuery;
    DBLookupComboBox1: TDBLookupComboBox;
    edCodInt: TDBEdit;
    edCaracteristicas: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DSCategoria: TDataSource;
    FDQryCategoria: TFDQuery;
    DSFornecedor: TDataSource;
    FDQryFornecedor: TFDQuery;
    Descrio1: TMenuItem;
    CdigoInterno1: TMenuItem;
    procedure btn_salvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Cdigo1Click(Sender: TObject);
    procedure Descrio1Click(Sender: TObject);
    procedure CdigoInterno1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProduto: TFrmProduto;

implementation

{$R *.dfm}

uses UntDM, UntMenuPrincipal, UntUsuario, UntPesqString, UntPerfil, UntLogin,
  UntPesqData, UntPesqRadio, UntCategoria, UntMarca, UntCliente;

procedure TFrmProduto.btn_salvarClick(Sender: TObject);
begin
   if (edDescricao.Text = '') or (edCodInt.Text = '') or (edValorDiaria.Text = '') or (edCaracteristicas.Text = '') or (strtoint(DBLookupComboBox1.Text)= -1) or (strtoint(DBLookupComboBox2.Text)= -1) or (strtoint(DBLookupComboBox3.Text)= -1) then
    begin

    //Colorir Campos Obrigatórios
    edDescricao.color := clInactiveCaption;
    edCodInt.Color:= clInactiveCaption;
    edValorDiaria.color := clInactiveCaption;
    edCaracteristicas.Color := clInactiveCaption;
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
    edCaracteristicas.Color := clWindow;
    DBLookupComboBox1.color := clWindow;
    DBLookupComboBox2.color := clWindow;
    DBLookupComboBox3.Color := clWindow;
  end;
end;

procedure TFrmProduto.Cdigo1Click(Sender: TObject);
begin
  ValorCampo.Clear;
  ValorCampo.SetFocus;

end;

procedure TFrmProduto.CdigoInterno1Click(Sender: TObject);
begin
  pesqString.Edit1.NumbersOnly := true;
  pesqString.RadioGroup1.Visible := false;

  inherited;

  tarefa := 'Pesquisa por Código Interno';
  pesqString.ShowModal;


   begin
    FDTabela.Filter := 'CD_INTERNO = ';
    StatusBar1.Panels[2].Text := 'Pesquisa Por Código interno ';
  end;

end;

procedure TFrmProduto.Descrio1Click(Sender: TObject);
begin
  inherited;
 tarefa := 'Pesquisa por Descrição';
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

procedure TFrmProduto.FormActivate(Sender: TObject);
begin
    FDTabela.TableName := 'PRODUTO';
  TipoID := 0;

  modoEdicao := FrmMenuPrincipal.QueryLogin.FieldByName('PER_PRODUTO_I').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_PRODUTO_A').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_PRODUTO_E').AsString;

  Executar := ExibePanels;
  inherited;
  FDTabela.Open();
  Executar := habilitaBotoes;
end;

end.
