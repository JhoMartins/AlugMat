unit UntPadraoRel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, UntDM, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxDBSet,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmPadraoRel = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    btn_cancelar: TBitBtn;
    btn_imprimir: TBitBtn;
    StatusBar1: TStatusBar;
    FDQuery1: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPadraoRel: TFrmPadraoRel;

implementation

{$R *.dfm}

end.
