unit UntRelClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntDM, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFrmRelClientes = class(TForm)
    FDQuery1: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    FDQuery2: TFDQuery;
    frxDBDataset2: TfrxDBDataset;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    edtIDDe: TLabeledEdit;
    edtIDAte: TLabeledEdit;
    edtNomeDe: TLabeledEdit;
    edtNomeAte: TLabeledEdit;
    edtCidade: TLabeledEdit;
    cbEstado: TComboBox;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    StatusBar1: TStatusBar;
    btn_imprimir: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_limpar: TBitBtn;
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
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
  StrLiga:= ' where ';
  FDQuery1.Close;
  FDQuery1.SQL.Clear;
  FDQuery1.SQL.Add('SELECT * FROM cliente');
  FDQuery1.Open();
  FDQuery2.Close;
  FDQuery2.SQL.Clear;
  FDQuery2.SQL.Add('SELECT * FROM cliente');
  FDQuery2.Open();

  frxReport1.ShowReport();
end;

procedure TFrmRelClientes.btn_limparClick(Sender: TObject);
begin
  edtIDDe.Clear;
  edtIDAte.Clear;
  edtNomeDe.Clear;
  edtNomeAte.Clear;
  edtCidade.Clear;
  cbEstado.ItemIndex := -1;
  RadioGroup1.ItemIndex := -1;
  RadioGroup2.ItemIndex := -1;
  RadioGroup3.ItemIndex := -1;

  edtIDDe.SetFocus;
end;

end.
