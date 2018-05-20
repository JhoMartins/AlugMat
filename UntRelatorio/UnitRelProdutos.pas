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
    GroupBox1: TGroupBox;
    Chb_Marca: TCheckBox;
    Chb_Categoria: TCheckBox;
    Chb_Fornecedor: TCheckBox;
    edtIDde: TLabeledEdit;
    EdtIDate: TLabeledEdit;
    edtDescricaoDe: TLabeledEdit;
    edtDescricaoAte: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    procedure btn_imprimirClick(Sender: TObject);
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
var StrLiga: String;
begin
  inherited;
  StrLiga:= 'where ';
  FDQuery1.CLose;
  with FDQuery1.SQL do
  begin
    Clear;
    add('SELECT p.id, p.descricao, P.cd_interno, p.status, p.disponivel, p.valor_diaria, m.descricao, c.descricao, f.razao_social '+
   'FROM produto p INNER JOIN marca m on m.id = p.id'+
   'INNER JOIN categoria c on c.id = p.id'+
   'INNER JOIN fornecedor f on f.id = p.id ');
    if edtIDde.Text <> '' then
    try
      StrToInt (edtIDde.Text);
      Add(StrLiga+'ID >= '''+edtIDde.Text+'''');
      StrLiga:= 'and ';
    except
    on EconvertError do;
    end;
    if edtIDAte.Text <> '' then
    try
    StrToInt(EdtIDde.Text);
    Add(StrLiga+'ID <= '''+edtIDAte.Text+'''');
    StrLiga:='and ';
    except
    on EConvertError do;
    end;
    if edtDescricaoDe.Text <> '' then
    begin
    Add(StrLiga+'DESCRICAO >= '''+edtDescricaoDe.Text+'''');
    StrLiga:='and ';
    end;
    if edtDescricaoAte.Text <> '' then
    begin
      Add(StrLiga+'DESCRICAO <= '''+edtDescricaoAte.Text+'zzz''');
      Strliga:= 'and ';
    end;
    if Chb_Marca.Checked = true then
    begin
      add(StrLiga+'M.DESCRICAO = '+#39+'M.ID'+#39);
      strliga:='and ';
    end;
    if Chb_Categoria.Checked = true then
    begin
      add(strLiga+'C.DESCRICAO = '+#39+'C.ID'+#39);
      Strliga:='and ';
    end;
      if Chb_Fornecedor.Checked = true then
    begin
      add(strLiga+'F.NOME_FANTASIA = '+#39+'F.ID'+#39);
      Strliga:='and ';
    end;
    case RadioGroup1.ItemIndex of
    0: add(' order by ID');
    1: add(' order by DESCRICAO');
    2: add(' order by VALOR_DIARIA');
    end;
   case RadioGroup2.ItemIndex of
      0: Add(StrLiga + 'status = ''S''');
      1: Add(StrLiga + 'status = ''N''');
    end;
     case RadioGroup3.ItemIndex of
      0: Add(StrLiga + 'status = ''S''');
      1: Add(StrLiga + 'status = ''N''');
    end;

  end;
  FDQuery1.Open();
  frxReport1.ShowReport();
end;


end.
