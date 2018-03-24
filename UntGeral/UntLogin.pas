unit UntLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ValorNome: TEdit;
    ValorSenha: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StatusBar1: TStatusBar;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure UsuarioChange(Sender: TObject);
    procedure ValorSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure ValorNomeEnter(Sender: TObject);
    procedure ValorNomeExit(Sender: TObject);
    procedure ValorSenhaEnter(Sender: TObject);
    procedure ValorSenhaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses UntMenuPrincipal;

procedure TFrmLogin.BitBtn1Click(Sender: TObject);
var mensagem, StrSql: String;
begin
  StatusBar1.Panels[0].Text := 'Autenticando usu�rio...';
  //O Refresh faz com que a StatusBar capture o texto que acabou de ser passado para ele
  StatusBar1.Refresh;

  //Desabilitar bot�es e campos de digita��o de login
  BitBtn1.Enabled := false;
  ValorNome.Enabled := false;
  ValorSenha.Enabled := false;

  //Reservar 3 segundos para que a consulta de login seja feita no banco de dados
  Sleep(3000);

  //Instru��o SQL para pesquisar login do usu�rio
  StrSql := 'SELECT U.*, P.* FROM USUARIO U INNER JOIN PERFIL P ON U.USU_ID_PERFIL = P.ID WHERE U.USU_LOGIN = ' + #39 + ValorNome.Text + #39 + ' AND U.USU_SENHA = ' + #39 + ValorSenha.Text + #39;

  //Fechar query, limpar SQL e adicionar consulta inserida na vari�vel StrSql
  FrmMenuPrincipal.QueryLogin.Close;
  FrmMenuPrincipal.QueryLogin.SQL.Clear;
  FrmMenuPrincipal.QueryLogin.SQL.Add(StrSql);
  FrmMenuPrincipal.QueryLogin.Open();



  //Caso encontre o usu�rio, por�m, ele esteja inativo.
  if FrmMenuPrincipal.QueryLogin.FieldByName('STATUS').AsString = 'N' then
  begin
    //O #13 quebra a linha da mensagem
    mensagem := 'Voc� est� cadastrado no sistema, mas n�o ' + #13 +
                'possui autoriza��o para us�-lo neste momento.' + #13 + #13 +
                'Consulte o administrador do sistema.';

    Application.MessageBox(PChar(mensagem), 'Login n�o autorizado', MB_OK + MB_ICONERROR);
  end;



  //Caso encontre o usu�rio e o login seja autenticado corretamente
  if FrmMenuPrincipal.QueryLogin.RecordCount = 1 then
  begin
    //Adicionar mensagem no StatusBar e fechar janela de login
    FrmMenuPrincipal.StatusBar1.Panels[2].Text := 'Usu�rio: ' + FrmLogin.ValorNome.Text + ' - ' + FrmMenuPrincipal.QueryLogin.FieldByName('USU_DEPARTAMENTO').AsString;
    FrmLogin.Close;
  end;



  //Caso o usu�rio ou senha sejam inv�lidos
  if FrmMenuPrincipal.QueryLogin.RecordCount = 0 then
  begin
    mensagem := 'Nome ou senha do usu�rio s�o inv�lidos. ' + #13 + #13 +
                'Se voc� esqueceu sua senha, consulte ' + #13 +
                'o administrador do sistema.';

    Application.MessageBox(PChar(mensagem), 'Login n�o autorizado', MB_OK + MB_ICONERROR);

    //Habilitar e limpar campos para nova tentativa de login
    BitBtn1.Enabled := true;
    ValorNome.Enabled := true;
    ValorSenha.Enabled := true;
    ValorNome.Clear;
    ValorSenha.Clear;
    ValorNome.SetFocus;
    StatusBar1.Panels[0].Text := 'Login n�o autorizado... Tente novamente.';
  end;
end;

procedure TFrmLogin.BitBtn2Click(Sender: TObject);
begin
  //Qualquer um dos dois comandos abaixo vai parar a execu��o de qualquer aplica��o
  //Halt();
  Application.Terminate;
end;

procedure TFrmLogin.UsuarioChange(Sender: TObject);
begin
  //Se as duas condi��es forem verdadeiras, retorna True. Sen�o, retorna False.
  //Como est� atribuindo o resultado da condi��o a um bot�o, n�o � necess�rio digitar o if
  BitBtn1.Enabled := (Length(ValorNome.Text) > 2) and (Length(ValorSenha.Text) > 2);
end;

procedure TFrmLogin.ValorNomeEnter(Sender: TObject);
begin
  TEdit(sender).Color := $00C1FFFF;
  StatusBar1.Panels[0].Text := 'Informe o Usu�rio...';
end;

procedure TFrmLogin.ValorNomeExit(Sender: TObject);
begin
  TEdit(sender).Color := clWindow;
end;

procedure TFrmLogin.ValorSenhaEnter(Sender: TObject);
begin
  TEdit(sender).Color := $00C1FFFF;
  StatusBar1.Panels[0].Text := 'Informe a Senha...';
end;

procedure TFrmLogin.ValorSenhaExit(Sender: TObject);
begin
  TEdit(sender).Color := clWindow;
end;

procedure TFrmLogin.ValorSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (BitBtn1.Enabled = True) then BitBtn1.Click;
end;

end.
