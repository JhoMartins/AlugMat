unit UntRelMarca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxDBSet,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TFrmRelMarca = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    FDQuery1: TFDQuery;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    edtCodigode: TLabeledEdit;
    edtCodigoate: TLabeledEdit;
    edtDescricaode: TLabeledEdit;
    edtDescricaoate: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    btn_limpar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_imprimir: TBitBtn;
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelMarca: TFrmRelMarca;

implementation

{$R *.dfm}

uses UntDM;

procedure TFrmRelMarca.btn_cancelarClick(Sender: TObject);
begin
close;
end;

procedure TFrmRelMarca.btn_imprimirClick(Sender: TObject);
var StrLiga: String;
begin
  FDQuery1.Close;
  StrLiga := 'where ';

  with FDQuery1.SQL do
  begin
    clear;
    add('SELECT * FROM MARCA');

    if edtcodigode.Text <> '' then
   try
      StrToInt(edtcodigoDe.Text);
      Add(StrLiga+'id >= '''+edtcodigoDe.Text + '''');
      StrLiga:= 'and ';
    except
      on EConvertError do;
    end;

    if edtcodigoAte.Text <> '' then
    try
      StrToInt(edtcodigoAte.Text);
      Add(StrLiga+'id <= '''+edtcodigoate.Text + '''');
      StrLiga:= 'and ';
    except
      on EConvertError do;
    end;

      if edtDescricaoDe.Text <> '' then
    begin
      Add(StrLiga+'descricao >= '''+edtDescricaoDe.Text + '''');
      StrLiga:= 'and ';
    end;

    if edtDescricaoAte.Text <> '' then
    begin
      Add(StrLiga+'descricao <= '''+edtDescricaoAte.Text + 'zzzz''');
      StrLiga:= 'and ';
    end;

       case RadioGroup1.ItemIndex of
      0: Add(' ORDER BY id');
      1: Add(' ORDER BY descricao');
      2: Add(' ORDER BY data_inc');
    end;
  FDQuery1.Open();
  frxReport1.ShowReport();
  end;
end;



procedure TFrmRelMarca.btn_limparClick(Sender: TObject);
begin
  edtcodigode.Clear;
  Edtcodigoate.Clear;
  edtDescricaoDe.Clear;
  edtDescricaoAte.Clear;
  RadioGroup1.ItemIndex := -1;

  edtcodigode.SetFocus;
end;

end.
