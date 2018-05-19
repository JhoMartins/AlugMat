unit UntRelFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadraoRel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmRelFornecedores = class(TFrmPadraoRel)
    edtIdDe: TLabeledEdit;
    edtIdAte: TLabeledEdit;
    edtNDantasiaDe: TLabeledEdit;
    edtNFantasiaAte: TLabeledEdit;
    edtCidade: TLabeledEdit;
    cbEstado: TComboBox;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelFornecedores: TFrmRelFornecedores;

implementation

{$R *.dfm}

procedure TFrmRelFornecedores.btn_imprimirClick(Sender: TObject);
var StrLiga: String;
begin
  StrLiga:= 'where ';
  FDQuery1.Close;
  with FDQuery1.SQL do
  begin
    Clear;
    Add('SELECT * FROM fornecedor ');
    if edtIdDe.Text <> '' then
    try
      StrToInt(edtIDDe.Text);
      Add(StrLiga + 'ID >= ''' + edtIdDe.Text + '''');
      StrLiga:= 'and ';
    except
      on EConvertError do;
    end;

    if edtIdAte.Text <> '' then
    try
      StrToInt(edtIdAte.Text);
      Add(StrLiga + 'id <= ''' + edtIDAte.Text + '''');
      StrLiga:= 'and ';
    except
      on EConvertError do;
    end;

    if edtNDantasiaDe.Text <> '' then
    begin
      Add(StrLiga + 'nome_fantasia >= ''' + edtNDantasiaDe.Text + '''');
      StrLiga:= 'and ';
    end;

    if edtNFantasiaAte.Text <> '' then
    begin
      Add(StrLiga + 'nome_fantasia <= ''' + edtNFantasiaAte.Text + 'zzzz''');
      StrLiga:= 'and ';
    end;

    if edtCidade.Text <> '' then
    begin
      Add(StrLiga + 'cidade = ''' + edtCidade.Text + '''');
      StrLiga:= 'and ';
    end;


    case RadioGroup1.ItemIndex of
      0: Add(' ORDER BY id');
      1: Add(' ORDER BY nome_fantasia');
      2: Add(' ORDER BY cidade');
      3: Add(' ORDER BY estado');
    end;

    FDQuery1.Open();
    frxReport1.ShowReport();
  end;
end;

end.
