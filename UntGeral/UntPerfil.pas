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
    Label6: TLabel;
    FDTabelaPER_MARCA: TStringField;
    FDTabelaPER_MARCA_I: TStringField;
    FDTabelaPER_MARCA_A: TStringField;
    FDTabelaPER_MARCA_E: TStringField;
    FDTabelaPER_CATEGORIA: TStringField;
    FDTabelaPER_CATEGORIA_I: TStringField;
    FDTabelaPER_CATEGORIA_A: TStringField;
    FDTabelaPER_CATEGORIA_E: TStringField;
    FDTabelaPER_FORNECEDOR: TStringField;
    FDTabelaPER_FORNECEDOR_I: TStringField;
    FDTabelaPER_FORNECEDOR_A: TStringField;
    FDTabelaPER_FORNECEDOR_E: TStringField;
    FDTabelaPER_PRODUTO: TStringField;
    FDTabelaPER_PRODUTO_I: TStringField;
    FDTabelaPER_PRODUTO_A: TStringField;
    FDTabelaPER_PRODUTO_E: TStringField;
    FDTabelaPER_CLIENTE: TStringField;
    FDTabelaPER_CLIENTE_I: TStringField;
    FDTabelaPER_CLIENTE_A: TStringField;
    FDTabelaPER_CLIENTE_E: TStringField;
    FDTabelaPER_ALUGUEL: TStringField;
    FDTabelaPER_ALUGUEL_I: TStringField;
    FDTabelaPER_ALUGUEL_A: TStringField;
    FDTabelaPER_ALUGUEL_E: TStringField;
    Label7: TLabel;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox20: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox24: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    DBCheckBox26: TDBCheckBox;
    DBCheckBox27: TDBCheckBox;
    DBCheckBox28: TDBCheckBox;
    DBCheckBox29: TDBCheckBox;
    DBCheckBox30: TDBCheckBox;
    DBCheckBox31: TDBCheckBox;
    DBCheckBox32: TDBCheckBox;
    DBCheckBox33: TDBCheckBox;
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
