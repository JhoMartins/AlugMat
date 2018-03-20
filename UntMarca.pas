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
    FDTabelaCD_MARCA: TFDAutoIncField;
    FDTabelaDESCRICAO: TStringField;
    FDTabelaSTATUS: TStringField;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    FDQryMArca: TFDQuery;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMarca: TFrmMarca;

implementation

{$R *.dfm}

uses UntMenuPrincipal, UntPerfil, UntDM, UntLogin, UntUsuario;

procedure TFrmMarca.btn_inserirClick(Sender: TObject);
begin
  inherited;
begin
  //Informar o nome da tabela que est� sendo utilizada.
  //Como o comando est� antes de "Inherit", o formul�rio Pai recebe essa informa��o antes de
  //executar os comandos.
  FDTabela.TableName := 'MARCA';
  TipoID := 0;

  //Verificar permiss�es do usu�rio
  //Vai atribuir � vari�vel modoEdicao os valores de cada campo, que podem ser "S" ou "N"
  modoEdicao := FrmMenuPrincipal.QueryLogin.FieldByName('PER_USUARIO_I').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_USUARIO_A').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_USUARIO_E').AsString;

  Executar := exibeBotoes;

  //Heran�a
  inherited;

  FDTabela.Open();
  FDQryMArca.Close();
  FDQryMarca.Open();

  Executar := habilitaBotoes;
  Executar := ExibePanels;

  //Comando de Heran�a
  inherited;

  FDTabela.Open();
  Executar := ExibeBotoes;
end;
end;

procedure TFrmMarca.btn_salvarClick(Sender: TObject);
begin
  inherited;
 if DBEdit1.Text = '' then
  begin
    mensagem := 'O campo ID � de preenchimento obrigat�rio.';
    Application.MessageBox(Pchar(mensagem), 'Aviso', MB_OK + MB_ICONWARNING);

    DBEdit1.SetFocus;
    Abort;
  end;

   if DBEdit2.Text = '' then
  begin
    mensagem := 'O campo Status � de preenchimento obrigat�rio.';
    Application.MessageBox(Pchar(mensagem), 'Aviso', MB_OK + MB_ICONWARNING);

    DBEdit1.SetFocus;
    Abort;
  end;

   if DBEdit3.Text = '' then
  begin
    mensagem := 'O campo Descri��o � de preenchimento obrigat�rio.';
    Application.MessageBox(Pchar(mensagem), 'Aviso', MB_OK + MB_ICONWARNING);

    DBEdit1.SetFocus;
    Abort;
  end;
end;

end.
