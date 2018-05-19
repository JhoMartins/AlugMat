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
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelClientes: TFrmRelClientes;

implementation

{$R *.dfm}

procedure TFrmRelClientes.btn_imprimirClick(Sender: TObject);
var StrLiga: String;
begin
  StrLiga:= 'where ';
  FDQuery1.Close;
  with FDQuery1.SQL do
  begin
    Clear;
    Add('SELECT * FROM cliente ');
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

    if edtNomeDe.Text <> '' then
    begin
      Add(StrLiga + 'nome_fantasia >= ''' + edtNomeDe.Text + '''');
      StrLiga:= 'and ';
    end;

    if edtNomeAte.Text <> '' then
    begin
      Add(StrLiga + 'nome_fantasia <= ''' + edtNomeAte.Text + 'zzzz''');
      StrLiga:= 'and ';
    end;

    if edtCidade.Text <> '' then
    begin
      Add(StrLiga + 'cidade = ''' + edtCidade.Text + '''');
      StrLiga:= 'and ';
    end;

    if cbEstado.ItemIndex <> -1 then
    begin
      Add(StrLiga + 'estado = ''' + cbEstado.Text + '''');
      StrLiga := 'and ';
    end;

    case RadioGroup1.ItemIndex of
      0:
        begin
          Add(StrLiga + 'tipo_pessoa = ''F''');
          StrLiga := 'and ';
        end;
      1:
         begin
          Add(StrLiga + 'tipo_pessoa = ''J''');
          StrLiga := 'and ';
        end;
    end;

    case RadioGroup2.ItemIndex of
      0: Add(StrLiga + 'status = ''S''');
      1: Add(StrLiga + 'status = ''N''');
    end;


    case RadioGroup3.ItemIndex of
      0: Add(' ORDER BY id');
      1: Add(' ORDER BY nome');
      2: Add(' ORDER BY cidade');
      3: Add(' ORDER BY estado');
    end;

    FDQuery1.Open();
    frxReport1.ShowReport();
  end;
end;

end.
