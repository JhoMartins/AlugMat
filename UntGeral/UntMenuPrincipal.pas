unit UntMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, {Vcl.RibbonLunaStyleActnCtrls, Vcl.Ribbon,} System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin,
  Vcl.ActnCtrls, Vcl.AppEvnts, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  Vcl.ActnMenus{, Vcl.RibbonActnMenus};

type
  TFrmMenuPrincipal = class(TForm)
    QueryLogin: TFDQuery;
    StatusBar1: TStatusBar;
    ActionManager1: TActionManager;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    Action10: TAction;
    Action11: TAction;
    ImageList1: TImageList;
    Timer1: TTimer;
    ApplicationEvents1: TApplicationEvents;
    Action12: TAction;
    Action13: TAction;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    procedure btn_usuarioClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure Action10Execute(Sender: TObject);
    procedure Action13Execute(Sender: TObject);
    procedure Action12Execute(Sender: TObject);
    procedure Action9Update(Sender: TObject);
    procedure Action10Update(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenuPrincipal: TFrmMenuPrincipal;

implementation

{$R *.dfm}

uses UntUsuario, UntDM, UntLogin, UntPerfil, UntCliente, UntMarca, UntCategoria,
  UntProduto, UntAlugueis, UntDevolucao;

procedure TFrmMenuPrincipal.Action10Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmUsuario, FrmUsuario);
  FrmUsuario.ShowModal;
  FrmUsuario.Free;
end;

procedure TFrmMenuPrincipal.Action10Update(Sender: TObject);
begin
  if (QueryLogin.FieldByName('PER_USUARIO').AsString = 'S') then Action9.Enabled := True
  else Action9.Enabled := false;
end;

procedure TFrmMenuPrincipal.Action12Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmLogin, FrmLogin);
  FrmLogin.ValorNome.Clear;
  FrmLogin.ValorSenha.Clear;
  FrmLogin.ShowModal;
  FrmLogin.Free;
end;

procedure TFrmMenuPrincipal.Action13Execute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMenuPrincipal.Action9Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmPerfil, FrmPerfil);
  FrmPerfil.ShowModal;
  FrmPerfil.Free;
end;

procedure TFrmMenuPrincipal.Action9Update(Sender: TObject);
begin
  if (QueryLogin.FieldByName('PER_PERFIL').AsString = 'S') then Action9.Enabled := True
  else Action9.Enabled := false;
end;

procedure TFrmMenuPrincipal.btn_usuarioClick(Sender: TObject);
begin
  FrmUsuario.ShowModal;
end;

procedure TFrmMenuPrincipal.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmPerfil, FrmPerfil);
  FrmPerfil.ShowModal;
  FrmPerfil.Free;
end;

procedure TFrmMenuPrincipal.Button2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmUsuario, FrmUsuario);
  FrmUsuario.ShowModal;
  FrmUsuario.Free;
end;

procedure TFrmMenuPrincipal.Button3Click(Sender: TObject);
begin
  Application.CreateForm(TFrmCliente, FrmCliente);
  FrmCliente.ShowModal;
  FrmCliente.Free;
end;

procedure TFrmMenuPrincipal.Button4Click(Sender: TObject);
begin
  Application.CreateForm(TFrmMarca, FrmMarca);
  FrmMarca.ShowModal;
  FrmMarca.Free;
end;

procedure TFrmMenuPrincipal.Button5Click(Sender: TObject);
begin
  Application.CreateForm(TFrmCategoria, FrmCategoria);
  FrmCategoria.ShowModal;
  FrmCategoria.Free;
end;

procedure TFrmMenuPrincipal.Button6Click(Sender: TObject);
begin
  Application.CreateForm(TFrmProduto, FrmProduto);
  FrmProduto.ShowModal;
  FrmProduto.Free;
end;

procedure TFrmMenuPrincipal.Button7Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAluguel, FrmAluguel);
  FrmAluguel.ShowModal;
  FrmAluguel.Free;
end;

procedure TFrmMenuPrincipal.Button8Click(Sender: TObject);
begin
  Application.CreateForm(TFrmDevolucao, FrmDevolucao);
  FrmDevolucao.ShowModal;
  FrmDevolucao.Free;
end;

procedure TFrmMenuPrincipal.FormActivate(Sender: TObject);
begin
  WindowState := wsMaximized;

  //dddd = Dia da Semana
  //dd = Dia Numérico
  //mmmm = Mês por Extenso
  //yyyy = Ano numérico
  //Tudo que está entre aspas duplas é constante. (Ex.: ", " | " de ")
  StatusBar1.Panels[1].Text := FormatDateTime(' dddd ", " dd " de " mmmm " de " yyyy', Now);

  Application.CreateForm(TFrmLogin, FrmLogin);
  FrmLogin.ShowModal;
  FrmLogin.Free;
end;

procedure TFrmMenuPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var confSaida: Integer;
begin
  //Mensagem de confirmação para sair do sistema
  confSaida := Application.MessageBox('Tem certeza que deseja sair do sistema?', 'Atenção', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION);

  if confSaida = IDYES then Application.Terminate
  else CanClose := False;
end;
end.
