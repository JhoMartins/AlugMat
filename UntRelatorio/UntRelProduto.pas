unit UntRelProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadraoRel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmPadraoRel1 = class(TFrmPadraoRel)
    GroupBox1: TGroupBox;
    Chb_Marca: TCheckBox;
    Chb_Categoria: TCheckBox;
    Chb_Fornecedor: TCheckBox;
    edtCodigoDe: TLabeledEdit;
    edtCodigoAte: TLabeledEdit;
    edtNomeDe: TLabeledEdit;
    edtNomeAte: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPadraoRel1: TFrmPadraoRel1;

implementation

{$R *.dfm}

end.
