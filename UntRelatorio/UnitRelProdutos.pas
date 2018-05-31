unit UnitRelProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadraoRel, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmRelProdutos = class(TFrmPadraoRel)
    edtIDde: TLabeledEdit;
    EdtIDate: TLabeledEdit;
    edtDescricaoDe: TLabeledEdit;
    edtDescricaoAte: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelProdutos: TFrmRelProdutos;

implementation

{$R *.dfm}

procedure TFrmRelProdutos.btn_imprimirClick(Sender: TObject);
var StrLiga: string;
begin
  inherited;
  FDQuery1.CLose;
  StrLiga:=' where ';

  with FDQuery1.SQL do
  begin
    Clear;
    add('SELECT m.descricao as marca, c.descricao as categoria, f.nome_fantasia as fornecedor, p.id, p.descricao, p.cd_interno, p.status, p.disponivel, p.valor_diaria ');
   add('FROM produto P ');
   add('INNER JOIN marca m on p.cd_marca = m.id');
   add('INNER JOIN categoria c on p.cd_categoria = c.id ');
   add('INNER JOIN fornecedor f on p.cd_fornecedor = f.id ');

    if edtIDde.Text <> '' then
   try
      StrToInt(edtidDe.Text);
      Add(StrLiga+'p.id >= '+edtidDe.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do;
    end;

    if edtidAte.Text <> '' then
    try
      StrToInt(edtidAte.Text);
      Add(StrLiga+'p.id <= '+edtidAte.Text);
      StrLiga:= ' and ';
    except
      on EConvertError do;
    end;

      if edtDescricaoDe.Text <> '' then
    begin
      Add(StrLiga+'p.descricao >= '''+edtDescricaoDe.Text + '''');
      StrLiga:= ' and ';
    end;

    if edtDescricaoAte.Text <> '' then
    begin
      Add(StrLiga+'p.descricao <= '''+edtDescricaoAte.Text + 'zzzz''');
      StrLiga:= ' and ';
    end;

       case RadioGroup1.ItemIndex of
      0: Add(' ORDER BY p.id');
      1: Add(' ORDER BY p.descricao');
      2: Add(' ORDER BY p.valor_diaria');
    end;


    case RadioGroup2.ItemIndex of
      0: Add(StrLiga + 'p.status = ''' + 'S' + '''');
      1: Add(StrLiga + 'p.status = ''' +'N' +'''');
    end;

    case RadioGroup3.ItemIndex of
      0: Add(StrLiga + 'p.disponivel = ''' +'S'+'''');
      1: Add(StrLiga + 'p.disponivel = '''+'N'+'''');
    end;

  FDQuery1.Open();
  frxReport1.ShowReport();
end;
end;


procedure TFrmRelProdutos.btn_limparClick(Sender: TObject);
begin
  inherited;

  edtIDde.Clear;
  EdtIDate.Clear;
  edtDescricaoDe.Clear;
  edtDescricaoAte.Clear;
  RadioGroup2.ItemIndex := -1;
  RadioGroup3.ItemIndex := -1;
  RadioGroup1.ItemIndex := -1;

  edtIDde.SetFocus;
end;

end.
