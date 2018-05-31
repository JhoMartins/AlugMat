unit UntMarca;

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
  TFrmMarca = class(TFrmPadrao1)
    Label3: TLabel;
    edDataInc: TDBEdit;
    Label4: TLabel;
    edDataAlt: TDBEdit;
    lbDESCRICAO: TLabel;
    edDescricao: TDBEdit;
    FDTabelaID: TFDAutoIncField;
    FDTabelaDESCRICAO: TStringField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    FDTabelaDATA_ALT: TSQLTimeStampField;
    FDTabelaSTATUS: TStringField;
    Descrio1: TMenuItem;
    Descrio2: TMenuItem;
    procedure btn_salvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Descrio2Click(Sender: TObject);
    procedure Descrio1Click(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMarca: TFrmMarca;

implementation

{$R *.dfm}

uses UntMenuPrincipal, UntDM, UntPesqString, UntPesqData, UntPesqRadio,
  UntRelMarca;

procedure TFrmMarca.btn_imprimirClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmRelmarca, FrmRelMarca);
  FrmRelmarca.edtcodigode.Text := FDTabelaID.AsString;
  FrmRelmarca.Edtcodigoate.Text := FDTabelaID.AsString;
  FrmRelmarca.ShowModal;
  FrmRelmarca.Free;
end;

procedure TFrmMarca.btn_salvarClick(Sender: TObject);
begin
  if  edDescricao.Text = '' then
  begin
    edDescricao.Color:= clInactiveCaption;

    Application.MessageBox('Preencha todos os campos obrigatórios.','Atenção', MB_OK + MB_ICONERROR);
    edDescricao.SetFocus;
    abort;
  end
  else
  begin
    inherited;
    edDescricao.Color:= clWindow;
  end;

end;
procedure TFrmMarca.Descrio1Click(Sender: TObject);
begin
  inherited;
    FDTabela.IndexFieldNames := 'DESCRICAO';
    StatusBar1.Panels[2].Text := 'Ordenado: Descrição';
end;

procedure TFrmMarca.Descrio2Click(Sender: TObject);
begin
  inherited;
  tarefa := 'Pesquisa alfanumérica por Nome';
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

procedure TFrmMarca.FormActivate(Sender: TObject);
begin
    FDTabela.TableName := 'MARCA';
  TipoID := 0;

  modoEdicao := FrmMenuPrincipal.QueryLogin.FieldByName('PER_MARCA_I').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_MARCA_A').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_MARCA_E').AsString;

  Executar := exibeBotoes;
  Executar := ExibePanels;

  inherited;

  FDTabela.Open();
  Executar := habilitaBotoes;

end;

end.
