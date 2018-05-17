unit UntRelCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadraoRel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmRelCategorias = class(TFrmPadraoRel)
    edtCodigoDe: TLabeledEdit;
    edtCodigoAte: TLabeledEdit;
    edtDescDe: TLabeledEdit;
    edtDescAte: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelCategorias: TFrmRelCategorias;

implementation

{$R *.dfm}

procedure TFrmRelCategorias.btn_imprimirClick(Sender: TObject);
var StrLiga: String;
begin
  StrLiga:= 'where ';
  FDQuery1.Close;
  with FDQuery1.SQL do
  begin
    Clear;
    Add('SELECT * FROM categoria ');
    if edtCodigoDe.Text <> '' then
    try
      StrToInt(edtCodigoDe.Text);
      Add(StrLiga + 'ID >= ''' + edtCodigoDe.Text + '''');
      StrLiga:= 'and ';
    except
      on EConvertError do;
    end;

    if edtCodigoAte.Text <> '' then
    try
      StrToInt(edtCodigoAte.Text);
      Add(StrLiga + 'id <= ''' + edtCodigoAte.Text + '''');
      StrLiga:= 'and ';
    except
      on EConvertError do;
    end;

    if edtDescDe.Text <> '' then
    begin
      Add(StrLiga + 'descricao >= ''' + edtDescDe.Text + '''');
      StrLiga:= 'and ';
    end;

    if edtDescAte.Text <> '' then
    begin
      Add(StrLiga + 'descricao <= ''' + edtDescAte.Text + 'zzzz''');
      StrLiga:= 'and ';
    end;

    case RadioGroup1.ItemIndex of
      0: Add(' ORDER BY id');
      1: Add(' ORDER BY descricao');
    end;

    FDQuery1.Open();
    frxReport1.ShowReport();
  end;
end;

end.
