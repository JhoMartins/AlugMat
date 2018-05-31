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
  FDQuery2.Close;
  with FDQuery1.SQL do
  begin
    Clear;
    FDQuery2.SQL.Clear;
    Add('SELECT * FROM cliente ');
    FDQuery2.SQL.Add('SELECT * FROM cliente ');
    if edtIdDe.Text <> '' then
    try
      StrToInt(edtIDDe.Text);
      Add(StrLiga + 'ID >= ''' + edtIdDe.Text + '''');
      FDQuery2.SQL.Add(StrLiga + 'ID >= ''' + edtIdDe.Text + '''');
      StrLiga:= ' and ';
    except
      on EConvertError do;
    end;

    if edtIdAte.Text <> '' then
    try
      StrToInt(edtIdAte.Text);
      Add(StrLiga + 'id <= ''' + edtIDAte.Text + '''');
      FDQuery2.SQL.Add(StrLiga + 'id <= ''' + edtIDAte.Text + '''');
      StrLiga:= ' and ';
    except
      on EConvertError do;
    end;

    if edtNomeDe.Text <> '' then
    begin
      Add(StrLiga + 'nome_fantasia >= ''' + edtNomeDe.Text + '''');
      FDQuery2.SQL.Add(StrLiga + 'nome_fantasia >= ''' + edtNomeDe.Text + '''');
      StrLiga:= ' and ';
    end;

    if edtNomeAte.Text <> '' then
    begin
      Add(StrLiga + 'nome_fantasia <= ''' + edtNomeAte.Text + 'zzzz''');
      FDQuery2.SQL.Add(StrLiga + 'nome_fantasia <= ''' + edtNomeAte.Text + 'zzzz''');
      StrLiga:= ' and ';
    end;

    if edtCidade.Text <> '' then
    begin
      Add(StrLiga + 'cidade like ''%' + edtCidade.Text + '%''');
      FDQuery2.SQL.Add(StrLiga + 'cidade like ''%' + edtCidade.Text + '%''');
      StrLiga:= ' and ';
    end;

    if cbEstado.ItemIndex <> -1 then
    begin
      Add(StrLiga + 'estado = ''' + cbEstado.Text + '''');
      FDQuery2.SQL.Add(StrLiga + 'estado = ''' + cbEstado.Text + '''');
      StrLiga := ' and ';
    end;

    case RadioGroup1.ItemIndex of
      0:
        begin
          Add(StrLiga + 'tipo_pessoa = ''F''');
          FDQuery2.SQL.Add(StrLiga + 'tipo_pessoa = ''F''');
          StrLiga := ' and ';
        end;
      1:
         begin
          Add(StrLiga + 'tipo_pessoa = ''J''');
          FDQuery2.SQL.Add(StrLiga + 'tipo_pessoa = ''J''');
          StrLiga := ' and ';
        end;
    end;

    case RadioGroup2.ItemIndex of
      0:
        begin
          Add(StrLiga + ' status = ''S''');
          FDQuery2.SQL.Add(StrLiga + ' status = ''S''');
        end;
      1:
        begin
          Add(StrLiga + ' status = ''N''');
          FDQuery2.SQL.Add(StrLiga + ' status = ''N''');
        end;
    end;


    case RadioGroup3.ItemIndex of
      0:
        begin
          Add(' ORDER BY id');
          FDQuery2.SQL.Add(' ORDER BY id');
        end;
      1:
        begin
          Add(' ORDER BY nome');
          FDQuery2.SQL.Add(' ORDER BY nome');
        end;
      2:
        begin
          Add(' ORDER BY cidade');
          FDQuery2.SQL.Add(' ORDER BY cidade');
        end;
      3:
      begin
        Add(' ORDER BY estado');
        FDQuery2.SQL.Add(' ORDER BY estado');
      end;
    end;

    FDQuery1.Open();
    FDQuery2.Open();
    frxReport1.ShowReport();
  end;
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
