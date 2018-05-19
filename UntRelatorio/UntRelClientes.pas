unit UntRelClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadraoRel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmRelClientes = class(TFrmPadraoRel)
    edtIDDe: TLabeledEdit;
    edtIDAte: TLabeledEdit;
    edtNomeDe: TLabeledEdit;
    edtNomeAte: TLabeledEdit;
    edtCidade: TLabeledEdit;
    cbEstado: TComboBox;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Label3: TLabel;
    RadioGroup3: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelClientes: TFrmRelClientes;

implementation

{$R *.dfm}

end.
