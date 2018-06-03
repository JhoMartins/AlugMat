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
  Vcl.ActnMenus, Vcl.Imaging.pngimage{, Vcl.RibbonActnMenus};

type
  TFrmMenuPrincipal = class(TForm)
    QueryLogin: TFDQuery;
    StatusBar1: TStatusBar;
    ActionManager1: TActionManager;
    Action2: TAction;
    Action3: TAction;
    Action7: TAction;
    Action9: TAction;
    Action10: TAction;
    ImageList1: TImageList;
    Timer1: TTimer;
    ApplicationEvents1: TApplicationEvents;
    Action15: TAction;
    Action16: TAction;
    Action18: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    Action1: TAction;
    Action14: TAction;
    Action19: TAction;
    Action20: TAction;
    Action21: TAction;
    Action22: TAction;
    Action23: TAction;
    Action24: TAction;
    Panel1: TPanel;
    Action25: TAction;
    Action26: TAction;
    Action13: TAction;
    Action5: TAction;
    Image1: TImage;
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
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action14Execute(Sender: TObject);
    procedure Action15Execute(Sender: TObject);
    procedure Action16Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action17Execute(Sender: TObject);
    procedure Action18Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action19Execute(Sender: TObject);
    procedure Action20Execute(Sender: TObject);
    procedure Action21Execute(Sender: TObject);
    procedure Action22Execute(Sender: TObject);
    procedure Action23Execute(Sender: TObject);
    procedure Action24Execute(Sender: TObject);
    procedure Action26Execute(Sender: TObject);
    procedure Action25Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
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
  UntProduto, UntAlugueis, UntDevolucao, UntFornecedor, UntIEProduto,
  UntIECliente, UntRelFinanceiro, UntRelReservasWeb, UntRelUsuarios,
  UnitRelProdutos, UntPadrao1, UntPadraoRel, UntPadraoImportacao, UntRelAluguel,
  UntRelCategorias, UntRelClientes, UntRelFornecedores, UntRelMarca;

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
Application.CreateForm(TFrmIECliente, FrmIECliente);
FrmIECliente.ShowModal;
FrmIECliente.Free;
end;

procedure TFrmMenuPrincipal.Action14Execute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmRelCategorias, FrmRelCategorias);
  //FrmRelCategorias.edtCodigoDe.Text := FDTabelaID.AsString;
  //FrmRelCategorias.edtCodigoAte.Text := FDTabelaID.AsString;
  FrmRelCategorias.ShowModal;
  FrmRelCategorias.Free;
end;

procedure TFrmMenuPrincipal.Action15Execute(Sender: TObject);
begin
Application.CreateForm(TFrmCliente, FrmCliente);
  FrmCliente.ShowModal;
  FrmCliente.Free;
end;

procedure TFrmMenuPrincipal.Action16Execute(Sender: TObject);
begin
Application.CreateForm(TFrmMarca, FrmMarca);
  FrmMarca.ShowModal;
  FrmMarca.Free;
end;

procedure TFrmMenuPrincipal.Action17Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmDevolucao, FrmDevolucao);
  FrmDevolucao.ShowModal;
  FrmDevolucao.Free;
end;

procedure TFrmMenuPrincipal.Action18Execute(Sender: TObject);
begin
 Application.CreateForm(TFrmFornecedor, FrmFornecedor);
  FrmFornecedor.ShowModal;
  FrmFornecedor.Free;
end;

procedure TFrmMenuPrincipal.Action19Execute(Sender: TObject);
begin
 inherited;
  Application.CreateForm(TFrmRelClientes, FrmRelClientes);
  //FrmRelClientes.edtIDDe.Text := FDTabelaID.AsString;
  //FrmRelClientes.edtIDAte.Text := FDTabelaID.AsString;
  //FrmRelClientes.edtNomeDe.Text := FDTabelaNOME.AsString;
  FrmRelClientes.ShowModal;
  FrmRelClientes.Free;
end;

procedure TFrmMenuPrincipal.Action1Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmRelAluguel, FrmRelAluguel);
  //FrmRelAluguel.edNumAluguel.Text := FDTabelaID.AsString;
  FrmRelAluguel.ShowModal;
  FrmRelAluguel.Free;
end;

procedure TFrmMenuPrincipal.Action20Execute(Sender: TObject);
begin
Application.CreateForm(TFrmRelFinanceiro, FrmRelFinanceiro);
FrmRelFinanceiro.ShowModal;
FrmRelFinanceiro.Free;
end;

procedure TFrmMenuPrincipal.Action21Execute(Sender: TObject);
begin
 inherited;
  Application.CreateForm(TFrmRelFornecedores, FrmRelFornecedores);
  //FrmRelFornecedores.edtIdDe.Text := FDTabelaID.AsString;
  //FrmRelFornecedores.edtIdAte.Text := FDTabelaID.AsString;
  FrmRelFornecedores.ShowModal;
  FrmRelFornecedores.Free;
end;

procedure TFrmMenuPrincipal.Action22Execute(Sender: TObject);
begin
 inherited;
  Application.CreateForm(TFrmRelmarca, FrmRelMarca);
  //FrmRelmarca.edtcodigode.Text := FDTabelaID.AsString;
  //FrmRelmarca.Edtcodigoate.Text := FDTabelaID.AsString;
  FrmRelmarca.ShowModal;
  FrmRelmarca.Free;
end;

procedure TFrmMenuPrincipal.Action23Execute(Sender: TObject);
begin
 Application.CreateForm(TFrmRelReservaWeb, FrmRelReservaWeb);
 FrmRelReservaWeb.ShowModal;
 FrmRelReservaWeb.Free;
end;

procedure TFrmMenuPrincipal.Action24Execute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmRelUsuarios, FrmRelUsuarios);
  //FrmRelUsuarios.edtIDDe.Text := FDTabelaID.AsString;
  //FrmRelUsuarios.edtIDAte.Text := FDTabelaID.AsString;
  FrmRelUsuarios.ShowModal;
  FrmRelUsuarios.Free;
end;

procedure TFrmMenuPrincipal.Action25Execute(Sender: TObject);
begin
FrmAluguel.ShowModal;
end;

procedure TFrmMenuPrincipal.Action26Execute(Sender: TObject);
begin
Application.CreateForm(TFrmIEProduto, FrmIEProduto);
FrmIEProduto.ShowModal;
FrmIEProduto.Free;
end;

procedure TFrmMenuPrincipal.Action2Execute(Sender: TObject);
begin
Application.CreateForm(TFrmProduto, FrmProduto);
  FrmProduto.ShowModal;
  FrmProduto.Free;
end;

procedure TFrmMenuPrincipal.Action3Execute(Sender: TObject);
begin
  Application.CreateForm(TFrmCategoria, FrmCategoria);
  FrmCategoria.ShowModal;
  FrmCategoria.Free;
end;

procedure TFrmMenuPrincipal.Action4Execute(Sender: TObject);
begin
FrmAluguel.ShowModal;
end;

procedure TFrmMenuPrincipal.Action5Execute(Sender: TObject);
begin
 Application.CreateForm(TFrmDevolucao, FrmDevolucao);
  FrmDevolucao.ShowModal;
  FrmDevolucao.Free;
end;

procedure TFrmMenuPrincipal.Action7Execute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFrmRelProdutos, FrmRelProdutos);
  FrmRelProdutos.ShowModal;
  FrmRelProdutos.Free;
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

procedure TFrmMenuPrincipal.Button10Click(Sender: TObject);
begin
  Application.CreateForm(TFrmIEProduto, FrmIEProduto);
  FrmIEProduto.ShowModal;
  FrmIEProduto.Free;
end;

procedure TFrmMenuPrincipal.Button11Click(Sender: TObject);
begin
  Application.CreateForm(TFrmIECliente, FrmIECliente);
  FrmIECliente.ShowModal;
  FrmIECliente.Free;
end;

procedure TFrmMenuPrincipal.Button12Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelFinanceiro, FrmRelFinanceiro);
  FrmRelFinanceiro.ShowModal;
  FrmRelFinanceiro.Free;
end;

procedure TFrmMenuPrincipal.Button13Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelReservaWeb, FrmRelReservaWeb);
  FrmRelReservaWeb.ShowModal;
  FrmRelReservaWeb.Free;
end;

procedure TFrmMenuPrincipal.Button14Click(Sender: TObject);
begin
  Application.CreateForm(TFrmRelUsuarios, FrmRelUsuarios);
  FrmRelUsuarios.ShowModal;
  FrmRelUsuarios.Free;
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
  FrmAluguel.ShowModal;
end;

procedure TFrmMenuPrincipal.Button8Click(Sender: TObject);
begin
  Application.CreateForm(TFrmDevolucao, FrmDevolucao);
  FrmDevolucao.ShowModal;
  FrmDevolucao.Free;
end;

procedure TFrmMenuPrincipal.Button9Click(Sender: TObject);
begin
  Application.CreateForm(TFrmFornecedor, FrmFornecedor);
  FrmFornecedor.ShowModal;
  FrmFornecedor.Free;
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
