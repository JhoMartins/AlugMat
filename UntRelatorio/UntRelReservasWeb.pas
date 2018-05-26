unit UntRelReservasWeb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntDM, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, frxClass, frxDBSet;

type
  TFrmRelReservaWeb = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    btn_imprimir: TBitBtn;
    btn_cancelar: TBitBtn;
    FDQuery1: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    frxDBDataset2: TfrxDBDataset;
    frxReport1: TfrxReport;
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelReservaWeb: TFrmRelReservaWeb;

implementation

{$R *.dfm}

procedure TFrmRelReservaWeb.btn_cancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmRelReservaWeb.btn_imprimirClick(Sender: TObject);
begin
  frxReport1.ShowReport();
end;

end.
