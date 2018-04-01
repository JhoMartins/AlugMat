unit UntFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, UntDM, Vcl.Mask;

type
  TFrmFornecedor = class(TFrmPadrao1)
    FDTabelaID: TFDAutoIncField;
    FDTabelaRAZAO_SOCIAL: TStringField;
    FDTabelaNOME_FANTASIA: TStringField;
    FDTabelaCNPJ: TStringField;
    FDTabelaIE: TStringField;
    FDTabelaLOGRADOURO: TStringField;
    FDTabelaNOME_LOGRADOURO: TStringField;
    FDTabelaNUM: TIntegerField;
    FDTabelaCOMPLEMENTO: TStringField;
    FDTabelaBAIRRO: TStringField;
    FDTabelaCIDADE: TStringField;
    FDTabelaESTADO: TStringField;
    FDTabelaTELEFONE: TStringField;
    FDTabelaCELULAR: TStringField;
    FDTabelaEMAIL: TStringField;
    FDTabelaCONTATO: TStringField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    FDTabelaDATA_ALT: TSQLTimeStampField;
    FDTabelaSTATUS: TStringField;
    Label2: TLabel;
    edRazaoSocial: TDBEdit;
    Label3: TLabel;
    edDataInc: TDBEdit;
    Label4: TLabel;
    edDataAlt: TDBEdit;
    Label5: TLabel;
    edNomeFantasia: TDBEdit;
    Label6: TLabel;
    edCNPJ: TDBEdit;
    Label7: TLabel;
    edIE: TDBEdit;
    Label8: TLabel;
    edTipoLog: TDBEdit;
    Label29: TLabel;
    edN: TDBEdit;
    Label10: TLabel;
    edBairro: TDBEdit;
    Label11: TLabel;
    edCidade: TDBEdit;
    Label12: TLabel;
    cbEstado: TDBComboBox;
    Label14: TLabel;
    edNomeLog: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    edTelefone: TDBEdit;
    Label16: TLabel;
    edCelular: TDBEdit;
    Label17: TLabel;
    edContato: TDBEdit;
    Label18: TLabel;
    edEmail: TDBEdit;
    edComplemento: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFornecedor: TFrmFornecedor;

implementation

{$R *.dfm}

uses UntMenuPrincipal;

procedure TFrmFornecedor.btn_salvarClick(Sender: TObject);
begin
  if (edRazaoSocial.Text = '') or (edNomeFantasia.Text = '') or (edCNPJ.Text = '   .   .   -  ') or (edIE.Text = '   .   .   .   ') or (edTipoLog.Text = '') or (edNomeLog.Text = '') or (edN.Text = '') or (edBairro.Text = '') or (edCidade.Text = '') or (cbEstado.ItemIndex = -1) then
  begin

    //Colorir Campos Obrigatórios
    edRazaoSocial.color := clInactiveCaption;
    edNomeFantasia.color := clInactiveCaption;
    edCNPJ.color := clInactiveCaption;
    edIE.color := clInactiveCaption;
    edTipoLog.color := clInactiveCaption;
    edNomeLog.color := clInactiveCaption;
    edN.color := clInactiveCaption;
    edBairro.color := clInactiveCaption;
    edCidade.color := clInactiveCaption;
    cbEstado.color := clInactiveCaption;


    Application.MessageBox('Preencha todos os campos obrigatórios.','Atenção', MB_OK + MB_ICONERROR);
    edRazaoSocial.SetFocus;
    abort;
  end
  else
  begin
    if (edTelefone.Text = '(  )    -    ') and (edCelular.Text = '(  )     -    ') then
    begin

      //Colorir campos obrigatórios
      edTelefone.Color := clInactiveCaption;
      edCelular.Color := clInactiveCaption;


      Application.MessageBox('Preencha ao menos um número de telefone.','Atenção', MB_OK + MB_ICONERROR);
      edTelefone.SetFocus;

      abort;
    end;
  end;
  inherited;
end;

procedure TFrmFornecedor.FormActivate(Sender: TObject);
begin
  inherited;
  nomeJanela := 'Fornecedor';
  FDTabela.TableName := 'FORNECEDOR';
  TipoID := 0;

  modoEdicao := FrmMenuPrincipal.QueryLogin.FieldByName('PER_FORNECEDOR_I').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_FORNECEDOR_A').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_FORNECEDOR_E').AsString;

  Executar := ExibePanels;

  //Máscaras
  FDTabela.FieldByName('DATA_INC').EditMask := '99/99/9999;1;_';
  FDTabela.FieldByName('DATA_ALT').EditMask := '99/99/9999;1;_';
  FDTabela.FieldByName('TELEFONE').EditMask := '(99)9999-9999;1;_';
  FDTabela.FieldByName('CELULAR').EditMask := '(99)99999-9999;1;_';
  FDTabela.FieldByName('CNPJ').EditMask := '99.999.999/9999-99;1;_';
  FDTabela.FieldByName('IE').EditMask := '999.999.999.999;1;_';

  inherited;

  FDTabela.Open();
  Executar := habilitaBotoes;
end;

end.
