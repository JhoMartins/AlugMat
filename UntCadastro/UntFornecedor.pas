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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFornecedor: TFrmFornecedor;

implementation

{$R *.dfm}

end.
