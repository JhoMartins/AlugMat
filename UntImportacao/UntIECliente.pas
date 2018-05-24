unit UntIECliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadraoImportacao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrmIECliente = class(TFrmPadraoImportacao)
    FDTDesktopID: TFDAutoIncField;
    FDTDesktopTIPO_PESSOA: TStringField;
    FDTDesktopNOME: TStringField;
    FDTDesktopCPF: TStringField;
    FDTDesktopRG: TStringField;
    FDTDesktopCNPJ: TStringField;
    FDTDesktopIE: TStringField;
    FDTDesktopLOGRADOURO: TStringField;
    FDTDesktopNOME_LOGRADOURO: TStringField;
    FDTDesktopNUM: TIntegerField;
    FDTDesktopCOMPLEMENTO: TStringField;
    FDTDesktopBAIRRO: TStringField;
    FDTDesktopCIDADE: TStringField;
    FDTDesktopESTADO: TStringField;
    FDTDesktopTELEFONE: TStringField;
    FDTDesktopCELULAR: TStringField;
    FDTDesktopEMAIL: TStringField;
    FDTDesktopDATA_INC: TSQLTimeStampField;
    FDTDesktopDATA_ALT: TSQLTimeStampField;
    FDTDesktopSTATUS: TStringField;
    FDTWebID: TFDAutoIncField;
    FDTWebTIPO_PESSOA: TStringField;
    FDTWebNOME: TStringField;
    FDTWebCPF: TStringField;
    FDTWebRG: TStringField;
    FDTWebCNPJ: TStringField;
    FDTWebIE: TStringField;
    FDTWebLOGRADOURO: TStringField;
    FDTWebNOME_LOGRADOURO: TStringField;
    FDTWebNUM: TIntegerField;
    FDTWebCOMPLEMENTO: TStringField;
    FDTWebBAIRRO: TStringField;
    FDTWebCIDADE: TStringField;
    FDTWebESTADO: TStringField;
    FDTWebTELEFONE: TStringField;
    FDTWebCELULAR: TStringField;
    FDTWebEMAIL: TStringField;
    FDTWebSENHA: TStringField;
    FDTWebDATA_INC: TDateTimeField;
    FDTWebDATA_ALT: TDateTimeField;
    FDTWebSTATUS: TStringField;
    FDTWebTIPO_USUARIO: TStringField;
    procedure btnImportarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIECliente: TFrmIECliente;

implementation

{$R *.dfm}

uses UntDM;

procedure TFrmIECliente.btnExportarClick(Sender: TObject);
var achou: boolean;
begin
  inherited;
  //Apontar o primeiro registro da Tabela Local
  FDTDesktop.First;

  //Percorrer todos os registros da Tabela Local
  while not FDTDesktop.Eof do
  begin
    //Abrir Tabelas
    FDTDesktop.Open();
    FDTWeb.Open();

    //Adicionar Texto no StatusBar
    StatusBar1.Panels[0].Text := 'Aguarde. Importando registros...';
    StatusBar1.Repaint;

    //Verifica se produto já existe no banco
    achou := false;
    FDTWeb.First;

    while not FDTWeb.Eof do
    begin
      if (((FDTDesktopCPF.AsString <> '') and (FDTDesktopCPF.AsString = FDTWebCPF.AsString)) or ((FDTDesktopCNPJ.AsString <> '') and (FDTDesktopCNPJ.AsString = FDTWebCNPJ.AsString))) then
      begin
        achou := true;
        break;
      end;
      FDTWeb.Next;
    end;

    //Se não existir, importa
    if (achou = false) then
    begin
      //Insere registros na tabela Web
      FDTWeb.Append;

      //Envia valores dos campos do Local para Web
      FDTWebTIPO_PESSOA.AsString := FDTDesktopTIPO_PESSOA.AsString;
      FDTWebNOME.AsString := FDTDesktopNOME.AsString;
      FDTWebCPF.AsString := FDTDesktopCPF.AsString;
      FDTWebRG.AsString := FDTDesktopRG.AsString;
      FDTWebCNPJ.AsString := FDTDesktopCNPJ.AsString;
      FDTWebIE.AsString := FDTDesktopIE.AsString;
      FDTWebLOGRADOURO.AsString := FDTDesktopLOGRADOURO.AsString;
      FDTWebNOME_LOGRADOURO.AsString := FDTDesktopNOME_LOGRADOURO.AsString;
      FDTWebNUM.AsString := FDTDesktopNUM.AsString;
      FDTWebCOMPLEMENTO.AsString := FDTDesktopCOMPLEMENTO.AsString;
      FDTWebBAIRRO.AsString := FDTDesktopBAIRRO.AsString;
      FDTWebCIDADE.AsString := FDTDesktopCIDADE.AsString;
      FDTWebESTADO.AsString := FDTDesktopESTADO.AsString;
      FDTWebTELEFONE.AsString := FDTDesktopTELEFONE.AsString;
      FDTWebCELULAR.AsString := FDTDesktopCELULAR.AsString;
      FDTWebEMAIL.AsString := FDTDesktopEMAIL.AsString;
      FDTWebSTATUS.AsString := FDTDesktopSTATUS.AsString;
      FDTWebSENHA.AsString := '';
      FDTWebTIPO_USUARIO.AsString := 'USU';

      //Salva Dados
      FDTWeb.Post;
    end;

    //Indicar o próximo Registro da tabela Local
    FDTDesktop.Next;
  end;

  //Adicionar Texto no StatusBar
  StatusBar1.Panels[0].Text := 'Registros importados com sucesso.';
  StatusBar1.Repaint;
end;

procedure TFrmIECliente.btnImportarClick(Sender: TObject);
var achou: boolean;
begin
  inherited;
  //Apontar o primeiro registro da Tabela Local
  FDTWeb.First;

  //Percorrer todos os registros da Tabela Local
  while not FDTWeb.Eof do
  begin
    //Abrir Tabelas
    FDTDesktop.Open();
    FDTWeb.Open();

    //Adicionar Texto no StatusBar
    StatusBar1.Panels[0].Text := 'Aguarde. Importando registros...';
    StatusBar1.Repaint;

    //Verifica se produto já existe no banco
    achou := false;
    FDTDesktop.First;

    while not FDTDesktop.Eof do
    begin
      if (((FDTDesktopCPF.AsString <> '') and (FDTDesktopCPF.AsString = FDTWebCPF.AsString)) or ((FDTDesktopCNPJ.AsString <> '') and (FDTDesktopCNPJ.AsString = FDTWebCNPJ.AsString))) then
      begin
        achou := true;
        break;
      end;
      FDTDesktop.Next;
    end;

    //Se não existir, importa
    if (achou = false) then
    begin
      //Insere registros na tabela Web
      FDTDesktop.Append;

      //Envia valores dos campos do Local para Web
      FDTDesktopTIPO_PESSOA.AsString := FDTWebTIPO_PESSOA.AsString;
      FDTDesktopNOME.AsString := FDTWebNOME.AsString;
      FDTDesktopCPF.AsString := FDTWebCPF.AsString;
      FDTDesktopRG.AsString := FDTWebRG.AsString;
      FDTDesktopCNPJ.AsString := FDTWebCNPJ.AsString;
      FDTDesktopIE.AsString := FDTWebIE.AsString;
      FDTDesktopLOGRADOURO.AsString := FDTWebLOGRADOURO.AsString;
      FDTDesktopNOME_LOGRADOURO.AsString := FDTWebNOME_LOGRADOURO.AsString;
      FDTDesktopNUM.AsString := FDTWebNUM.AsString;
      FDTDesktopCOMPLEMENTO.AsString := FDTWebCOMPLEMENTO.AsString;
      FDTDesktopBAIRRO.AsString := FDTWebBAIRRO.AsString;
      FDTDesktopCIDADE.AsString := FDTWebCIDADE.AsString;
      FDTDesktopESTADO.AsString := FDTWebESTADO.AsString;
      FDTDesktopTELEFONE.AsString := FDTWebTELEFONE.AsString;
      FDTDesktopCELULAR.AsString := FDTWebCELULAR.AsString;
      FDTDesktopEMAIL.AsString := FDTWebEMAIL.AsString;
      FDTDesktopDATA_INC.AsDateTime := Date;
      FDTDesktopSTATUS.AsString := FDTWebSTATUS.AsString;

      //Salva Dados
      FDTDesktop.Post;
    end;

    //Indicar o próximo Registro da tabela Local
    FDTWeb.Next;
  end;

  //Adicionar Texto no StatusBar
  StatusBar1.Panels[0].Text := 'Registros importados com sucesso.';
  StatusBar1.Repaint;
end;

end.
