unit UntPadrao1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin,
  System.ImageList, Vcl.ImgList, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.Menus;

type
  //Criar um tipo para receber os valores no formulário
  //Esse tipo precisa vir antes do tipo TFrmPadrao1
  TExecutar = (navegacao, sentencaSQL, exibePanels, desabilitaBotoes, habilitaBotoes, exibeBotoes);
  TFrmPadrao1 = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ToolBar1: TToolBar;
    btn_pesquisa: TToolButton;
    btn_ordenar: TToolButton;
    Separador1: TToolButton;
    btn_primeiro: TToolButton;
    btn_anterior: TToolButton;
    btn_proximo: TToolButton;
    btn_ultimo: TToolButton;
    Separador2: TToolButton;
    btn_inserir: TToolButton;
    btn_editar: TToolButton;
    btn_excluir: TToolButton;
    Separador3: TToolButton;
    btn_salvar: TToolButton;
    btn_cancelar: TToolButton;
    Separador4: TToolButton;
    btn_imprimir: TToolButton;
    Separador5: TToolButton;
    btn_sair: TToolButton;
    StatusBar1: TStatusBar;
    DataSource1: TDataSource;
    FDTabela: TFDTable;
    PanelEntrada: TPanel;
    Label1: TLabel;
    ValorCampo: TEdit;
    btnOK: TSpeedButton;
    CheckHabilita: TDBCheckBox;
    lblStatus: TLabel;
    PnlFicha: TPanel;
    ImageList4: TImageList;
    PopupMenu1: TPopupMenu;
    Cdigo1: TMenuItem;
    odososregistrosdessatabela1: TMenuItem;
    N1: TMenuItem;
    Registrosincludosnoperuodo1: TMenuItem;
    Registrosalteradosnoperodo1: TMenuItem;
    N2: TMenuItem;
    Registrosbloqueadosparaouso1: TMenuItem;
    PopupMenu2: TPopupMenu;
    IDCdigo1: TMenuItem;
    Datadeincluso1: TMenuItem;
    Datadealterao1: TMenuItem;
    procedure btn_primeiroClick(Sender: TObject);
    procedure btn_anteriorClick(Sender: TObject);
    procedure btn_proximoClick(Sender: TObject);
    procedure btn_ultimoClick(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure Cdigo1Click(Sender: TObject);
    procedure odososregistrosdessatabela1Click(Sender: TObject);
    procedure Registrosbloqueadosparaouso1Click(Sender: TObject);
    procedure Registrosincludosnoperuodo1Click(Sender: TObject);
    procedure Registrosalteradosnoperodo1Click(Sender: TObject);
    procedure IDCdigo1Click(Sender: TObject);
    procedure Datadeincluso1Click(Sender: TObject);
    procedure Datadealterao1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    //Criação da Função Executar
    FExecutar: TExecutar;
    //Criação da Procedure Executar
    procedure SetExecutar(const Value: TExecutar);
  public
    { Public declarations }
    //Criação da Propriedade Executar com permissão de Leitura para FExecutar e Escrita para SetExecutar
    property Executar: TExecutar read FExecutar write SetExecutar;
  end;

var
  FrmPadrao1: TFrmPadrao1;

  tipoID: integer; //Definir tipo do campo ID (0 = char / 1 = integer)
  nomeTabela: String; //Define o nome da tabela em uso
  operacaoIncluir: Integer; //Defube oiperação de inclusão (1 = Incluir)
  modoEdicao: String; //Define ação de Inclusão/Edição/Exclusão
  nomeJanela: String; //Define o título das Janelas Filhas
  tarefaClick: Integer; //Controle do votão pesquisar da Janela PesqData
  mensagem: String; //Montagem da mensagem de informação
  valData, valData2: String; //Armazena datas no formato String
  tarefa: String; //Armazena o nome da tabela em Andamento

implementation

{$R *.dfm}

uses UntDM, UntPesqData;

{ TFrmPadrao1 }

procedure TFrmPadrao1.btn_anteriorClick(Sender: TObject);
begin
  FDTabela.Prior;
  Executar := navegacao;
  Executar := exibePanels;
end;

procedure TFrmPadrao1.btn_cancelarClick(Sender: TObject);
begin
  FDTabela.Cancel;
  mensagem := 'A inclusão ou alteração desse registro foi abortada.';
  Application.MessageBox(PChar(mensagem), 'Informação', MB_OK + MB_ICONERROR);

  Executar := habilitaBotoes;

  //Habilitar a exibição dos objetos
  ValorCampo.Text := '';
  ValorCampo.Enabled := True;
  btnOK.Enabled := True;
  CheckHabilita.Enabled := false;
  PnlFicha.Enabled := false;

  if FDTabela.FieldByName('STATUS').AsString = 'N' then lblStatus.Visible := True
  else lblStatus.Visible := False;
end;

procedure TFrmPadrao1.btn_editarClick(Sender: TObject);
begin
  FDTabela.Edit;

  //Desabilita a pesquisa da janela, e habilita campos para alteração
  ValorCampo.Enabled := false;
  btnOK.Enabled := false;
  CheckHabilita.Enabled := true;
  PnlFicha.Enabled := true;

  //Inclusão de registro
  FDTabela.FieldByName('DATA_ALT').AsDateTime := Date;

  //Botões de Registro
  Executar := desabilitaBotoes;
  StatusBar1.Panels[2].Text := 'Alteração de novo Registro';
  Executar := exibePanels;
end;

procedure TFrmPadrao1.btn_excluirClick(Sender: TObject);
var confExcl: Integer;
begin
  confExcl := Application.MessageBox('Confirma a exclusão desse registro?', 'Atenção', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION);

  if confExcl = IDYES then
  begin
    FDTabela.Delete;
    mensagem := 'O registro foi excluído com sucesso.';
    Application.MessageBox(PChar(mensagem), 'Informação', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    mensagem := 'A exclusão desse registro foi abortada.';
    Application.MessageBox(PChar(mensagem), 'Informação', MB_OK + MB_ICONERROR);
  end;

  Executar := habilitaBotoes;
  Executar := exibePanels;
end;

procedure TFrmPadrao1.btn_inserirClick(Sender: TObject);
begin
  //Mudar operação para 1
  operacaoIncluir := 1;

  //Se a tabela não estiver aberta, abrir
  if FDTabela.Active = false then
  begin
    FDTabela.Open();
  end;

  //Se estiver aberta, inserir
  FDTabela.Insert;

  //Desabilita a pesquisa da janela, e habilita campos para alteração
  ValorCampo.Enabled := false;
  btnOK.Enabled := false;
  CheckHabilita.Enabled := false;
  lblStatus.Visible := false;
  PnlFicha.Enabled := true;

  //Inclusão de registro
  FDTabela.FieldByName('STATUS').AsString := 'S';
  FDTabela.FieldByName('DATA_INC').AsDateTime := Date;

  //Botões de Registro
  Executar := desabilitaBotoes;
  StatusBar1.Panels[2].Text := 'Inclusão de novo Registro';
  Executar := exibePanels;
end;

procedure TFrmPadrao1.btn_primeiroClick(Sender: TObject);
begin
  FDTabela.First;
  Executar := navegacao;
  Executar := exibePanels;
end;

procedure TFrmPadrao1.btn_proximoClick(Sender: TObject);
begin
  FDTabela.Next;
  Executar := navegacao;
  Executar := exibePanels;
end;

procedure TFrmPadrao1.btn_sairClick(Sender: TObject);
begin
  FDTabela.Close;
  Close;
end;

procedure TFrmPadrao1.btn_salvarClick(Sender: TObject);
begin
  FDTabela.Post;
  mensagem := 'O registro foi incluído ou alterado com sucesso.';
  Application.MessageBox(PChar(mensagem), 'Informação', MB_OK + MB_ICONINFORMATION);

  Executar := habilitaBotoes;

  //Habilitar a exibição dos objetos
  ValorCampo.Text := '';
  ValorCampo.Enabled := True;
  btnOK.Enabled := True;
  CheckHabilita.Enabled := false;
  PnlFicha.Enabled := false;

  if FDTabela.FieldByName('STATUS').AsString = 'N' then lblStatus.Visible := True
  else lblStatus.Visible := False;
end;

procedure TFrmPadrao1.btn_ultimoClick(Sender: TObject);
begin
  FDTabela.Last;
  Executar := navegacao;
  Executar := exibePanels;
end;

procedure TFrmPadrao1.Cdigo1Click(Sender: TObject);
begin
  //Limpa campo do formulário e deixa o foco do mouse nele para pesquisa
  ValorCampo.Clear;
  ValorCampo.SetFocus;
end;

procedure TFrmPadrao1.Datadealterao1Click(Sender: TObject);
begin
  //Ordena pelo campo DATA_ALT
  FDTabela.IndexFieldNames := 'DATA_ALT';
  StatusBar1.Panels[2].Text := 'Ordenado: Data de Alteração';
end;

procedure TFrmPadrao1.Datadeincluso1Click(Sender: TObject);
begin
  //Ordena pelo campo data de inclusão
  FDTabela.IndexFieldNames := 'DATA_INC';
  StatusBar1.Panels[2].Text := 'Ordenado: Data de Inclusão';
end;

procedure TFrmPadrao1.FormCreate(Sender: TObject);
begin
  PnlFicha.Enabled := false;
end;

procedure TFrmPadrao1.IDCdigo1Click(Sender: TObject);
begin
  //Ordena pelo campo ID
  FDTabela.IndexFieldNames := 'ID';
  StatusBar1.Panels[2].Text := 'Ordenado: ID-Código';
end;

procedure TFrmPadrao1.odososregistrosdessatabela1Click(Sender: TObject);
begin
  FDTabela.Filter := '';
  FDTabela.Filtered := True;
  StatusBar1.Panels[2].Text := 'Todos os registros.';

  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;
end;

procedure TFrmPadrao1.Registrosalteradosnoperodo1Click(Sender: TObject);
begin
  tarefa := 'Pesquisa de registros alterados no período';

  pesqData.ShowModal;

  if tarefaClick = 1 then
  begin
    StatusBar1.Panels[2].Text := 'Registros alterados entre ' + valData + ' e ' + valData2;

    FDTabela.Filter := 'DATA_ALT >= ' + #39 + FormatDateTime('DD/MM/YYYY', StrToDate(valData)) + #39 + ' AND DATA_ALT <= ' + #39 + FormatDateTime('DD/MM/YYYY', StrToDate(valData2)) + #39;
    FDTabela.Filtered := True;

    Executar := sentencaSQL;
    Executar := exibePanels;
    Executar := navegacao;
    Executar := habilitaBotoes;
  end;
end;

procedure TFrmPadrao1.Registrosbloqueadosparaouso1Click(Sender: TObject);
begin
  FDTabela.Filter := 'STATUS = ' + #39 + 'N' + #39;
  FDTabela.Filtered := True;
  StatusBar1.Panels[2].Text := 'Seleção de registros bloqueados.';

  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;
end;

procedure TFrmPadrao1.Registrosincludosnoperuodo1Click(Sender: TObject);
begin
  tarefa := 'Pesquisa de registros incluídos no período';

  pesqData.ShowModal;

  if tarefaClick = 1 then
  begin
    StatusBar1.Panels[2].Text := 'Registros incluídos entre ' + valData + ' e ' + valData2;

    FDTabela.Filter := 'DATA_INC >= ' + #39 + FormatDateTime('DD/MM/YYYY', StrToDate(valData)) + #39 + ' AND DATA_INC <= ' + #39 + FormatDateTime('DD/MM/YYYY', StrToDate(valData2)) + #39;
    FDTabela.Filtered := True;

    Executar := sentencaSQL;
    Executar := exibePanels;
    Executar := navegacao;
    Executar := habilitaBotoes;
  end;
end;

procedure TFrmPadrao1.SetExecutar(const Value: TExecutar);
begin
  FExecutar := Value;

  //Criação das funções da Procedure
  case Value of
    //Habilita botões de navegação
    navegacao:
    begin
      if FDTabela.Eof = True then
      begin
        btn_proximo.Enabled := false;
        btn_ultimo.Enabled := false;
      end
      else
      begin
        btn_proximo.Enabled := true;
        btn_ultimo.Enabled := true;
      end;

      if FDTabela.Bof = true then
      begin
        btn_primeiro.Enabled := false;
        btn_anterior.Enabled := false;
      end
      else
      begin
        btn_primeiro.Enabled := true;
        btn_anterior.Enabled := true;
      end;
    end;

    //Executar a sentença SQL
    sentencaSQL:
    begin
      //Fechar a tabela para poder enviar informações para ela
      FDTabela.Close;
      FDTabela.Open;

      if (FDTabela.RecordCount = 0) and (operacaoIncluir = 0) then
      begin
        //o "+#13+" quebra a linha
        mensagem := 'Não foi encontrado nenhum registro que' +#13+ 'satisfaça a sua pesquisa.';
        Application.MessageBox(PChar(mensagem),'Informação',MB_OK+MB_ICONINFORMATION);
      end;
    end;

    //Exibe texto nos painéis da barra de status
    exibePanels:
    begin
      StatusBar1.Panels[0].Text := 'Inc.: ' + FDTabela.FieldByName('DATA_INC').AsString;
      StatusBar1.Panels[1].Text := 'Alt.: ' + FDTabela.FieldByName('DATA_ALT').AsString;
      StatusBar1.Panels[3].Text := 'ID-Código: ' + FDTabela.FieldByName('ID').AsString;

      //Caso não tenha registros e não esteja inserindo, limpa a barra de Status
      if (FDTabela.RecordCount = 0) and (operacaoIncluir = 0) then
      begin
        StatusBar1.Panels[0].Text := '';
        StatusBar1.Panels[1].Text := '';
        StatusBar1.Panels[2].Text := '';
        StatusBar1.Panels[3].Text := '';
      end;

      if FDTabela.FieldByName('STATUS').AsString = 'N' then lblStatus.Visible := True
      else lblStatus.Visible := False;
    end;

    //Desabilita botões ao incluir ou alterar registros
    desabilitaBotoes:
    begin
      //Desabilita botões de navegação
      btn_Pesquisa.Enabled := false;
      btn_ordenar.Enabled := false;
      btn_primeiro.Enabled := false;
      btn_anterior.Enabled := false;
      btn_proximo.Enabled := false;
      btn_ultimo.Enabled := false;
      btn_inserir.Enabled := false;
      btn_editar.Enabled := false;
      btn_excluir.Enabled := false;
      //Habilita botões Salvar/Cancelar
      btn_salvar.Enabled := true;
      btn_cancelar.Enabled := true;
      //Desabilita Botões de navegação
      btn_imprimir.Enabled := false;
      btn_sair.Enabled := false;
    end;

    //Habilitar botões ao salvar ou cancelar registros
    habilitaBotoes:
    begin
      btn_pesquisa.Enabled := true;

      if FDTabela.RecordCount > 0 then
      begin
        btn_ordenar.Enabled := true;
      end
      else
      begin
        btn_ordenar.Enabled := false;
      end;

      //Habilitar botão Inserir
      btn_inserir.Enabled := true;

      //Se não tiver registros, desabilitar botões de navegação
      if FDTabela.RecordCount = 0 then
      begin
        btn_editar.Enabled := false;
        btn_excluir.Enabled := false;
        btn_imprimir.Enabled := false;
        btn_primeiro.Enabled := false;
        btn_anterior.Enabled := false;
        btn_proximo.Enabled := false;
        btn_ultimo.Enabled := false;
      end
      //Se tiver registros, habilitar botões de navegação
      else
      begin
        btn_editar.Enabled := true;
        btn_excluir.Enabled := true;
        btn_imprimir.Enabled := true;
        btn_primeiro.Enabled := true;
        btn_anterior.Enabled := true;
        btn_proximo.Enabled := true;
        btn_ultimo.Enabled := true;
      end;

      btn_salvar.Enabled := false;
      btn_cancelar.Enabled := false;
      btn_sair.Enabled := true;
    end;

    //Exibir botões de acordo com o nível de acesso do usuário
    exibeBotoes:
    begin
      //O primeiro N representa Inserção, o segundo é a Edição e o terceiro ´é a Exclusão
      //Não tem permissões
      if modoEdicao = 'NNN' then
      begin
        btn_inserir.Visible := false;
        btn_editar.Visible := false;
        btn_excluir.Visible := false;
        btn_salvar.Visible := false;
        btn_cancelar.Visible := false;
        Separador3.Visible := false;
        Separador4.Visible := false;
      end;

      //Exclui
      if modoEdicao = 'NNS' then
      begin
        btn_inserir.Visible := false;
        btn_editar.Visible := false;
        btn_excluir.Visible := true;
        btn_salvar.Visible := false;
        btn_cancelar.Visible := false;
        Separador3.Visible := true;
        Separador4.Visible := false;
      end;

      //Edita e Exclui
      if modoEdicao = 'NSS' then
      begin
        btn_inserir.Visible := false;
        btn_editar.Visible := true;
        btn_excluir.Visible := true;
        btn_salvar.Visible := true;
        btn_cancelar.Visible := true;
        Separador3.Visible := true;
        Separador4.Visible := true;
      end;

      //Insere, Edita e Exclui
      if modoEdicao = 'SSS' then
      begin
        btn_inserir.Visible := true;
        btn_editar.Visible := true;
        btn_excluir.Visible := true;
        btn_salvar.Visible := true;
        btn_cancelar.Visible := true;
        Separador3.Visible := true;
        Separador4.Visible := true;
      end;

      //Insere e Exclui
      if modoEdicao = 'SNS' then
      begin
        btn_inserir.Visible := true;
        btn_editar.Visible := false;
        btn_excluir.Visible := true;
        btn_salvar.Visible := true;
        btn_cancelar.Visible := true;
        Separador3.Visible := true;
        Separador4.Visible := true;
      end;

      //Insere e Edita
      if modoEdicao = 'SSN' then
      begin
        btn_inserir.Visible := true;
        btn_editar.Visible := true;
        btn_excluir.Visible := false;
        btn_salvar.Visible := true;
        btn_cancelar.Visible := true;
        Separador3.Visible := true;
        Separador4.Visible := true;
      end;

      //Edita
      if modoEdicao = 'NSN' then
      begin
        btn_inserir.Visible := false;
        btn_editar.Visible := true;
        btn_excluir.Visible := false;
        btn_salvar.Visible := true;
        btn_cancelar.Visible := true;
        Separador3.Visible := true;
        Separador4.Visible := true;
      end;

      //Insere
      if modoEdicao = 'SNN' then
      begin
        btn_inserir.Visible := true;
        btn_editar.Visible := false;
        btn_excluir.Visible := false;
        btn_salvar.Visible := true;
        btn_cancelar.Visible := true;
        Separador3.Visible := true;
        Separador4.Visible := true;
      end;
    end;
  end;
end;

end.
