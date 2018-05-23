unit UntPadraoImportacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TFrmPadraoImportacao = class(TForm)
    Panel1: TPanel;
    grDesktop: TDBGrid;
    grWeb: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    StatusBar1: TStatusBar;
    btnImportar: TBitBtn;
    btnExportar: TBitBtn;
    btnSair: TBitBtn;
    DSDesktop: TDataSource;
    DSWeb: TDataSource;
    FDTDesktop: TFDTable;
    FDTWeb: TFDTable;
    FDCommand1: TFDCommand;
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPadraoImportacao: TFrmPadraoImportacao;

implementation

{$R *.dfm}

uses UntDM;

procedure TFrmPadraoImportacao.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
