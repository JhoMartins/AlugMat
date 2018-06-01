unit UntRelUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadraoRel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmRelUsuarios = class(TFrmPadraoRel)
    edtIDDe: TLabeledEdit;
    edtIDAte: TLabeledEdit;
    edtNomeDe: TLabeledEdit;
    edtNomeAte: TLabeledEdit;
    RadioGroup3: TRadioGroup;
    RadioGroup2: TRadioGroup;
    procedure btn_limparClick(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelUsuarios: TFrmRelUsuarios;

implementation

{$R *.dfm}

procedure TFrmRelUsuarios.btn_imprimirClick(Sender: TObject);
var StrLiga: String;
begin
  StrLiga:= ' where ';
  FDQuery1.Close;
  with FDQuery1.SQL do
  begin
    Clear;
    Add('SELECT u.*, p.per_descricao as PER_DESCRICAO FROM usuario u INNER JOIN perfil p ON u.usu_id_perfil = p.id ');
    if edtIdDe.Text <> '' then
    try
      StrToInt(edtIDDe.Text);
      Add(StrLiga + 'u.id >= ' + edtIdDe.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do;
    end;

    if edtIdAte.Text <> '' then
    try
      StrToInt(edtIdAte.Text);
      Add(StrLiga + 'u.id <= ' + edtIDAte.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do;
    end;

    if edtNomeDe.Text <> '' then
    begin
      Add(StrLiga + 'u.usu_nome >= ''' + edtNomeDe.Text + '''');
      StrLiga:= ' and ';
    end;

    if edtNomeAte.Text <> '' then
    begin
      Add(StrLiga + 'u.usu_nome <= ''' + edtNomeAte.Text + 'zzzz''');
      StrLiga:= ' and ';
    end;


    case RadioGroup2.ItemIndex of
      0: Add(StrLiga + ' u.status = ''S''');
      1: Add(StrLiga + ' u.status = ''N''');
    end;


    case RadioGroup3.ItemIndex of
      0: Add(' ORDER BY u.id');
      1: Add(' ORDER BY u.usu_nome');
    end;

  end;
  FDQuery1.Open();
  frxReport1.ShowReport();
end;

procedure TFrmRelUsuarios.btn_limparClick(Sender: TObject);
begin
  inherited;
  edtIDDe.Clear;
  edtIDAte.Clear;
  edtNomeDe.Clear;
  edtNomeAte.Clear;
  RadioGroup2.ItemIndex := -1;
  RadioGroup3.ItemIndex := -1;

  edtIDDe.SetFocus;
end;

end.
