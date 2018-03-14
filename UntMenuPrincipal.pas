unit UntMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.RibbonLunaStyleActnCtrls, Vcl.Ribbon;

type
  TFrmMenuPrincipal = class(TForm)
    QueryLogin: TFDQuery;
    Ribbon1: TRibbon;
    StatusBar1: TStatusBar;
    Button1: TButton;
    Button2: TButton;
    procedure btn_usuarioClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenuPrincipal: TFrmMenuPrincipal;

implementation

{$R *.dfm}

uses UntUsuario, UntDM, UntLogin, UntPerfil;

procedure TFrmMenuPrincipal.btn_usuarioClick(Sender: TObject);
begin
  FrmUsuario.ShowModal;
end;

procedure TFrmMenuPrincipal.Button1Click(Sender: TObject);
begin
  FrmPerfil.ShowModal;
end;

procedure TFrmMenuPrincipal.Button2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmUsuario, FrmUsuario);
  FrmUsuario.ShowModal;
  FrmUsuario.Free;
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

  FrmLogin.ShowModal;
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
