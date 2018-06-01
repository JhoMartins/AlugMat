unit UntUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask, Vcl.Menus;

type
  TFrmUsuario = class(TFrmPadrao1)
    FDTabelaID: TFDAutoIncField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    FDTabelaDATA_ALT: TSQLTimeStampField;
    FDTabelaSTATUS: TStringField;
    FDTabelaMARCA: TStringField;
    FDTabelaUSU_NOME: TStringField;
    FDTabelaUSU_DEPARTAMENTO: TStringField;
    FDTabelaUSU_LOGIN: TStringField;
    FDTabelaUSU_SENHA: TStringField;
    FDTabelaUSU_ID_PERFIL: TIntegerField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    DSPefil: TDataSource;
    FDQryPerfil: TFDQuery;
    N3: TMenuItem;
    NomedoUsurio1: TMenuItem;
    Departamento1: TMenuItem;
    Login1: TMenuItem;
    SpeedButton1: TSpeedButton;
    N4: TMenuItem;
    Nome1: TMenuItem;
    Departamento2: TMenuItem;
    Login2: TMenuItem;
    Label7: TLabel;
    Label8: TLabel;
    edDataInc: TDBEdit;
    edDataAlt: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure NomedoUsurio1Click(Sender: TObject);
    procedure Departamento1Click(Sender: TObject);
    procedure Login1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Nome1Click(Sender: TObject);
    procedure Departamento2Click(Sender: TObject);
    procedure Login2Click(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsuario: TFrmUsuario;

implementation

{$R *.dfm}

uses UntMenuPrincipal, UntDM, UntPesqString, UntPerfil, UntAlugueis, UntRelUsuarios;

procedure TFrmUsuario.btn_imprimirClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmRelUsuarios, FrmRelUsuarios);
  FrmRelUsuarios.edtIDDe.Text := FDTabelaID.AsString;
  FrmRelUsuarios.edtIDAte.Text := FDTabelaID.AsString;
  FrmRelUsuarios.ShowModal;
  FrmRelUsuarios.Free;
end;

procedure TFrmUsuario.btn_sairClick(Sender: TObject);
begin
  inherited;
  FrmAluguel.FDQryAtendente.Close;
  FrmAluguel.FDQryAtendente.Open();
end;

procedure TFrmUsuario.btn_salvarClick(Sender: TObject);
begin
  if DBEdit1.Text = '' then
  begin
    mensagem := 'O campo Nome é de preenchimento obrigatório.';
    Application.MessageBox(Pchar(mensagem), 'Aviso', MB_OK + MB_ICONWARNING);

    DBEdit1.SetFocus;
    Abort;
  end;

  if DBEdit2.Text = '' then
  begin
    mensagem := 'O campo Departamento é de preenchimento obrigatório.';
    Application.MessageBox(Pchar(mensagem), 'Aviso', MB_OK + MB_ICONWARNING);

    DBEdit2.SetFocus;
    Abort;
  end;

  if DBEdit3.Text = '' then
  begin
    mensagem := 'O campo Login é de preenchimento obrigatório.';
    Application.MessageBox(Pchar(mensagem), 'Aviso', MB_OK + MB_ICONWARNING);

    DBEdit3.SetFocus;
    Abort;
  end;

  if DBEdit4.Text = '' then
  begin
    mensagem := 'O campo Senha é de preenchimento obrigatório.';
    Application.MessageBox(Pchar(mensagem), 'Aviso', MB_OK + MB_ICONWARNING);

    DBEdit4.SetFocus;
    Abort;
  end;

  if DBLookupComboBox1.Text = '' then
  begin
    mensagem := 'O campo Perfil é de preenchimento obrigatório.';
    Application.MessageBox(Pchar(mensagem), 'Aviso', MB_OK + MB_ICONWARNING);

    DBLookupComboBox1.SetFocus;
    Abort;
  end;

  inherited;

end;

procedure TFrmUsuario.Departamento1Click(Sender: TObject);
begin
  inherited;
  tarefa := 'Pesquisa alfanumérica por Departamento';
  pesqString.ShowModal;

  if pesqString.RadioGroup1.ItemIndex = 0 then
  begin
    FDTabela.Filter := 'UPPER(USU_DEPARTAMENTO) LIKE ' + #39 + '%' + pesqString.Edit1.text + '%' + #39;
    StatusBar1.Panels[2].Text := 'Departamento contém: ' + pesqString.Edit1.Text;
  end;

  if pesqString.RadioGroup1.ItemIndex = 1 then
  begin
    FDTabela.Filter := 'UPPER(USU_DEPARTAMENTO) LIKE ' + #39 + pesqString.Edit1.text + '%' + #39;
    StatusBar1.Panels[2].Text := 'Departamento inicia com: ' + pesqString.Edit1.Text;
  end;

  if pesqString.RadioGroup1.ItemIndex = 2 then
  begin
    FDTabela.Filter := 'UPPER(USU_DEPARTAMENTO) LIKE ' + #39 + '%' + pesqString.Edit1.text + #39;
    StatusBar1.Panels[2].Text := 'Departamento termina com: ' + pesqString.Edit1.Text;
  end;

  FDTabela.Filtered := True;

  Executar := sentencaSQL;
  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;
end;

procedure TFrmUsuario.Departamento2Click(Sender: TObject);
begin
  inherited;
  //Ordena pelo campo Departamento
  FDTabela.IndexFieldNames := 'USU_DEPARTAMENTO';
  StatusBar1.Panels[2].Text := 'Ordenado: Departamento';
end;

procedure TFrmUsuario.FormActivate(Sender: TObject);
begin
  //Informar o nome da tabela que está sendo utilizada.
  //Como o comando está antes de "Inherit", o formulário Pai recebe essa informação antes de
  //executar os comandos.
  FDTabela.TableName := 'USUARIO';
  TipoID := 0;

  //Verificar permissões do usuário
  //Vai atribuir à variável modoEdicao os valores de cada campo, que podem ser "S" ou "N"
  modoEdicao := FrmMenuPrincipal.QueryLogin.FieldByName('PER_USUARIO_I').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_USUARIO_A').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_USUARIO_E').AsString;

  Executar := exibeBotoes;

  //Herança
  inherited;

  FDTabela.Open();
  FDQryPerfil.Close();
  FDQryPerfil.Open();

  Executar := habilitaBotoes;
  Executar := ExibePanels;

  //Comando de Herança
  inherited;

  FDTabela.Open();
  Executar := ExibeBotoes;
end;

procedure TFrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFrmUsuario.Login1Click(Sender: TObject);
begin
  inherited;
  tarefa := 'Pesquisa alfanumérica por Login';
  pesqString.ShowModal;

  if pesqString.RadioGroup1.ItemIndex = 0 then
  begin
    FDTabela.Filter := 'UPPER(USU_LOGIN) LIKE ' + #39 + '%' + pesqString.Edit1.text + '%' + #39;
    StatusBar1.Panels[2].Text := 'Login contém: ' + pesqString.Edit1.Text;
  end;

  if pesqString.RadioGroup1.ItemIndex = 1 then
  begin
    FDTabela.Filter := 'UPPER(USU_LOGIN) LIKE ' + #39 + pesqString.Edit1.text + '%' + #39;
    StatusBar1.Panels[2].Text := 'Login inicia com: ' + pesqString.Edit1.Text;
  end;

  if pesqString.RadioGroup1.ItemIndex = 2 then
  begin
    FDTabela.Filter := 'UPPER(USU_LOGIN) LIKE ' + #39 + '%' + pesqString.Edit1.text + #39;
    StatusBar1.Panels[2].Text := 'Login termina com: ' + pesqString.Edit1.Text;
  end;

  FDTabela.Filtered := True;

  Executar := sentencaSQL;
  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;
end;

procedure TFrmUsuario.Login2Click(Sender: TObject);
begin
  inherited;
  //Ordena pelo campo Login
  FDTabela.IndexFieldNames := 'USU_LOGIN';
  StatusBar1.Panels[2].Text := 'Ordenado: Login';
end;

procedure TFrmUsuario.Nome1Click(Sender: TObject);
begin
  inherited;
  //Ordena pelo campo Nome
  FDTabela.IndexFieldNames := 'USU_NOME';
  StatusBar1.Panels[2].Text := 'Ordenado: Nome';
end;

procedure TFrmUsuario.NomedoUsurio1Click(Sender: TObject);
begin
  inherited;

  tarefa := 'Pesquisa alfanumérica por Nome';
  pesqString.ShowModal;

  if pesqString.RadioGroup1.ItemIndex = 0 then
  begin
    FDTabela.Filter := 'UPPER(USU_NOME) LIKE ' + #39 + '%' + pesqString.Edit1.text + '%' + #39;
    StatusBar1.Panels[2].Text := 'Nome contém: ' + pesqString.Edit1.Text;
  end;

  if pesqString.RadioGroup1.ItemIndex = 1 then
  begin
    FDTabela.Filter := 'UPPER(USU_NOME) LIKE ' + #39 + pesqString.Edit1.text + '%' + #39;
    StatusBar1.Panels[2].Text := 'Nome inicia com: ' + pesqString.Edit1.Text;
  end;

  if pesqString.RadioGroup1.ItemIndex = 2 then
  begin
    FDTabela.Filter := 'UPPER(USU_NOME) LIKE ' + #39 + '%' + pesqString.Edit1.text + #39;
    StatusBar1.Panels[2].Text := 'Nome termina com: ' + pesqString.Edit1.Text;
  end;

  FDTabela.Filtered := True;

  Executar := sentencaSQL;
  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;
end;

procedure TFrmUsuario.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  //Cria o formulário
  Application.CreateForm(TFrmPerfil, FrmPerfil);
  //Abre o formulário
  FrmPerfil.ShowModal;
  //Libera a memória
  FrmPerfil.Free;
end;

end.
