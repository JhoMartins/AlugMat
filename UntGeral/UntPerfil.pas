unit UntPerfil;

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
  TFrmPerfil = class(TFrmPadrao1)
    PanelSup: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Relatório: TTabSheet;
    Ferramentas: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    DBCheckBox9: TDBCheckBox;
    FDTabelaID: TFDAutoIncField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    FDTabelaDATA_ALT: TSQLTimeStampField;
    FDTabelaSTATUS: TStringField;
    FDTabelaMARCA: TStringField;
    FDTabelaOCULTAR: TStringField;
    FDTabelaPER_DESCRICAO: TStringField;
    FDTabelaPER_USUARIO: TStringField;
    FDTabelaPER_USUARIO_I: TStringField;
    FDTabelaPER_USUARIO_A: TStringField;
    FDTabelaPER_USUARIO_E: TStringField;
    FDTabelaPER_PERFIL: TStringField;
    FDTabelaPER_PERFIL_I: TStringField;
    FDTabelaPER_PERFIL_A: TStringField;
    FDTabelaPER_PERFIL_E: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPerfil: TFrmPerfil;

implementation

{$R *.dfm}

uses UntMenuPrincipal;

procedure TFrmPerfil.FormActivate(Sender: TObject);
begin
  FDTabela.TableName := 'PERFIL';

  //Verificar permissões do usuário
  //Vai atribuir à variável modoEdicao os valores de cada campo, que podem ser "S" ou "N"
  modoEdicao := FrmMenuPrincipal.QueryLogin.FieldByName('PER_PERFIL_I').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_PERFIL_A').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_PERFIL_E').AsString;

  Executar := exibeBotoes;

  //Herança
  inherited;

  FDTabela.Open();
  Executar := habilitaBotoes;
end;

procedure TFrmPerfil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
