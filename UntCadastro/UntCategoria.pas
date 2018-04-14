unit UntCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, UntPesqString,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, UntDM, Vcl.Mask, UntMenuPrincipal;

type
  TFrmCategoria = class(TFrmPadrao1)
    FDTabelaID: TFDAutoIncField;
    FDTabelaDESCRICAO: TStringField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    FDTabelaDATA_ALT: TSQLTimeStampField;
    FDTabelaSTATUS: TStringField;
    edDescricao: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    N3: TMenuItem;
    Descrio1: TMenuItem;
    procedure btn_salvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Descrio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCategoria: TFrmCategoria;

implementation

{$R *.dfm}

procedure TFrmCategoria.btn_salvarClick(Sender: TObject);
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

procedure TFrmCategoria.Descrio1Click(Sender: TObject);
begin
  inherited;
  tarefa := 'Pesquisa alfanumérica por Descrição';
  pesqString.ShowModal;

  if pesqString.RadioGroup1.ItemIndex = 0 then
  begin
    FDTabela.Filter := 'UPPER(DESCRICAO) LIKE ' + #39 + '%' + pesqString.Edit1.text + '%' + #39;
    StatusBar1.Panels[2].Text := 'Descrição contém: ' + pesqString.Edit1.Text;
  end;

  if pesqString.RadioGroup1.ItemIndex = 1 then
  begin
    FDTabela.Filter := 'UPPER(DESCRICAO) LIKE ' + #39 + pesqString.Edit1.text + '%' + #39;
    StatusBar1.Panels[2].Text := 'Descrição inicia com: ' + pesqString.Edit1.Text;
  end;

  if pesqString.RadioGroup1.ItemIndex = 2 then
  begin
    FDTabela.Filter := 'UPPER(DESCRICAO) LIKE ' + #39 + '%' + pesqString.Edit1.text + #39;
    StatusBar1.Panels[2].Text := 'Descrição termina com: ' + pesqString.Edit1.Text;
  end;

  FDTabela.Filtered := True;

  Executar := sentencaSQL;
  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;
end;

procedure TFrmCategoria.FormActivate(Sender: TObject);
begin
  FDTabela.TableName := 'CATEGORIA';
  TipoID := 0;

  modoEdicao := FrmMenuPrincipal.QueryLogin.FieldByName('PER_CATEGORIA_I').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_CATEGORIA_A').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_CATEGORIA_E').AsString;

  Executar := ExibePanels;
  inherited;
  FDTabela.Open();
  Executar := habilitaBotoes;
end;

end.
