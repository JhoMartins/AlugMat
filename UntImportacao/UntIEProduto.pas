unit UntIEProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadraoImportacao, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFrmIEProduto = class(TFrmPadraoImportacao)
    FDTDesktopID: TFDAutoIncField;
    FDTDesktopDESCRICAO: TStringField;
    FDTDesktopCD_INTERNO: TStringField;
    FDTDesktopVALOR_DIARIA: TFloatField;
    FDTDesktopSTATUS: TStringField;
    FDTDesktopDISPONIVEL: TStringField;
    FDTDesktopDEVOLVER: TStringField;
    FDTDesktopCARACTERISTICAS: TMemoField;
    FDTDesktopCD_MARCA: TIntegerField;
    FDTDesktopCD_CATEGORIA: TIntegerField;
    FDTDesktopCD_FORNECEDOR: TIntegerField;
    FDTDesktopDATA_INC: TSQLTimeStampField;
    FDTDesktopDATA_ALT: TSQLTimeStampField;
    FDTDesktopCD_CLIENTE: TIntegerField;
    FDTWebID: TFDAutoIncField;
    FDTWebDESCRICAO: TStringField;
    FDTWebCD_INTERNO: TStringField;
    FDTWebVALOR_DIARIA: TSingleField;
    FDTWebSTATUS: TStringField;
    FDTWebDISPONIVEL: TStringField;
    FDTWebCARACTERISTICAS: TMemoField;
    FDTWebMARCA: TStringField;
    FDTWebCATEGORIA: TStringField;
    FDTWebFORNECEDOR: TStringField;
    FDTWebDATA_INC: TDateTimeField;
    FDTWebDATA_ALT: TDateTimeField;
    FDTWebCD_CLIENTE: TIntegerField;
    FDTWebNOTA: TSingleField;
    FDTWebDESTAQUE: TStringField;
    FDTMarca: TFDTable;
    FDTMarcaID: TFDAutoIncField;
    FDTMarcaDESCRICAO: TStringField;
    FDTMarcaDATA_INC: TSQLTimeStampField;
    FDTMarcaDATA_ALT: TSQLTimeStampField;
    FDTMarcaSTATUS: TStringField;
    FDTCategoria: TFDTable;
    FDTCategoriaID: TFDAutoIncField;
    FDTCategoriaDESCRICAO: TStringField;
    FDTCategoriaDATA_INC: TSQLTimeStampField;
    FDTCategoriaDATA_ALT: TSQLTimeStampField;
    FDTCategoriaSTATUS: TStringField;
    FDTFornecedor: TFDTable;
    FDTFornecedorID: TFDAutoIncField;
    FDTFornecedorRAZAO_SOCIAL: TStringField;
    FDTFornecedorNOME_FANTASIA: TStringField;
    FDTFornecedorCNPJ: TStringField;
    FDTFornecedorIE: TStringField;
    FDTFornecedorLOGRADOURO: TStringField;
    FDTFornecedorNOME_LOGRADOURO: TStringField;
    FDTFornecedorNUM: TIntegerField;
    FDTFornecedorCOMPLEMENTO: TStringField;
    FDTFornecedorBAIRRO: TStringField;
    FDTFornecedorCIDADE: TStringField;
    FDTFornecedorESTADO: TStringField;
    FDTFornecedorTELEFONE: TStringField;
    FDTFornecedorCELULAR: TStringField;
    FDTFornecedorEMAIL: TStringField;
    FDTFornecedorCONTATO: TStringField;
    FDTFornecedorDATA_INC: TSQLTimeStampField;
    FDTFornecedorDATA_ALT: TSQLTimeStampField;
    FDTFornecedorSTATUS: TStringField;
    FDCommand2: TFDCommand;
    procedure btnImportarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIEProduto: TFrmIEProduto;

implementation

{$R *.dfm}

uses UntDM;

procedure TFrmIEProduto.btnExportarClick(Sender: TObject);
var marca, categoria, fornecedor: integer;
    achou_prod, achou_marca, achou_cat, achou_forn: boolean;
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
    StatusBar1.Panels[0].Text := 'Aguarde. Exportando registros...';
    StatusBar1.Repaint;

    //Verifica se produto já existe no banco
    achou_prod := false;
    FDTWeb.First;

    while not FDTWeb.Eof do
    begin
      if (FDTDesktopDESCRICAO.AsString = FDTWebDESCRICAO.AsString) then
      begin
        achou_prod := true;

        if FDTDesktopDISPONIVEL.AsString = 'N' then
        begin
          FDCommand1.CommandText.Clear;
          FDCommand1.CommandText.Add('UPDATE PRODUTO SET DISPONIVEL = ' + #39 + 'N' + #39 + ' WHERE DESCRICAO = ' + #39 + FDTDesktopDESCRICAO.AsString + #39);
          FDCommand1.Execute();
        end;
      end;
      if achou_prod = false then FDTWeb.Next
      else break;
    end;

    //Se não existir, importa
    if (achou_prod = false) then
    begin
      //Insere registros na tabela Web
      FDTWeb.Append;

      //Envia valores dos campos do Local para Web
      FDTWebDESCRICAO.AsString := FDTDesktopDESCRICAO.AsString;
      FDTWebCD_INTERNO.AsString := FDTDesktopCD_INTERNO.AsString;
      FDTWebVALOR_DIARIA.AsString := FDTDesktopVALOR_DIARIA.AsString;
      FDTWebSTATUS.AsString := FDTDesktopSTATUS.AsString;
      FDTWebDISPONIVEL.AsString := FDTDesktopDISPONIVEL.AsString;
      FDTWebCARACTERISTICAS.AsString := FDTDesktopCARACTERISTICAS.AsString;

      //Encontra Marca
      achou_marca := false;
      FDTMarca.Open();
      FDTMarca.First;

      while not FDTMarca.Eof do
      begin
        if (FDTMarcaID.AsString = FDTDesktopCD_MARCA.AsString) then
        begin
          achou_marca := true;
        end;
        if achou_marca = false then FDTMarca.Next
        else break;
      end;

      FDTWebMARCA.AsString := FDTMarcaDESCRICAO.AsString;

      //Encontra Categoria
      achou_cat := false;
      FDTCategoria.Open();
      FDTCategoria.First;

      while not FDTCategoria.Eof do
      begin
        if (FDTCategoriaID.AsString = FDTDesktopCD_CATEGORIA.AsString) then
        begin
          achou_cat := true;
        end;
        if achou_cat = false then FDTCategoria.Next
        else break;
      end;

      FDTWebCATEGORIA.AsString := FDTCategoriaDESCRICAO.AsString;

      //Encontra Fornecedor
      achou_forn := false;
      FDTFornecedor.Open();
      FDTFornecedor.First;

      while not FDTFornecedor.Eof do
      begin
        if (FDTFornecedorID.AsString = FDTDesktopCD_FORNECEDOR.AsString) then
        begin
          achou_forn := true;
        end;
        if achou_forn = false then FDTFornecedor.Next
        else break;
      end;

      FDTWebFORNECEDOR.AsString := FDTFornecedorRAZAO_SOCIAL.AsString;

      FDTWebCD_CLIENTE.AsString := FDTDesktopCD_CLIENTE.AsString;

      //Salva Dados
      FDTWeb.Post;
    end;

    //Indicar o próximo Registro da tabela Local
    FDTDesktop.Next;
  end;

  //Adicionar Texto no StatusBar
  StatusBar1.Panels[0].Text := 'Registros exportados com sucesso.';
  StatusBar1.Repaint;
end;

procedure TFrmIEProduto.btnImportarClick(Sender: TObject);
var marca, categoria, fornecedor: integer;
    achou_prod, achou_marca, achou_cat, achou_forn: boolean;
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
    achou_prod := false;
    FDTDesktop.First;

    while not FDTDesktop.Eof do
    begin
      if (FDTDesktopDESCRICAO.AsString = FDTWebDESCRICAO.AsString) then
      begin
        achou_prod := true;

        if FDTWebDISPONIVEL.AsString = 'N' then
        begin
          FDCommand2.CommandText.Clear;
          FDCommand2.CommandText.Add('UPDATE PRODUTO SET DISPONIVEL = ' + #39 + 'N' + #39 + ' WHERE DESCRICAO = ' + #39 + FDTWebDESCRICAO.AsString + #39);
          FDCommand2.Execute();
        end;
      end;
      if achou_prod = false then FDTDesktop.Next
      else break;
    end;

    //Se não existir, importa
    if (achou_prod = false) then
    begin
      //Insere registros na tabela Web
      FDTDesktop.Append;

      //Envia valores dos campos do Local para Web
      FDTDesktopDESCRICAO.AsString := FDTWebDESCRICAO.AsString;
      FDTDesktopCD_INTERNO.AsString := FDTWebCD_INTERNO.AsString;
      FDTDesktopVALOR_DIARIA.AsString := FDTWebVALOR_DIARIA.AsString;
      FDTDesktopSTATUS.AsString := FDTWebSTATUS.AsString;
      FDTDesktopDISPONIVEL.AsString := FDTWebDISPONIVEL.AsString;
      FDTDesktopDEVOLVER.AsString := 'N';
      FDTDesktopCARACTERISTICAS.AsString := FDTWebCARACTERISTICAS.AsString;

      //Verifica se a marca já existe no banco
      achou_marca := false;
      FDTMarca.Open();
      FDTMarca.First;

      while not FDTMarca.Eof do
      begin
        if (UpperCase(FDTMarcaDESCRICAO.AsString) = UpperCase(FDTWebMARCA.AsString)) then
        begin
          achou_marca := true;
        end;
        if achou_marca = false then FDTMarca.Next
        else break;
      end;

      //Se não existe, importar
      if achou_marca = false then
      begin
        FDTMarca.Append;
        FDTMarcaDESCRICAO.AsString := FDTWebMARCA.AsString;
        FDTMarcaDATA_INC.AsDateTime := Date;
        FDTMarcaSTATUS.AsString := 'S';
        FDTMarca.Post;
        FDTMarca.Last;
      end;

      FDTDesktopCD_MARCA.AsString := FDTMarcaID.AsString;

      //Verifica se a categoria já existe no banco
      achou_cat := false;
      FDTCategoria.Open();
      FDTCategoria.First;

      while not FDTCategoria.Eof do
      begin
        if (UpperCase(FDTCategoriaDESCRICAO.AsString) = UpperCase(FDTWebCATEGORIA.AsString)) then
        begin
          achou_cat := true;
        end;
        if achou_cat = false then FDTCategoria.Next
        else break;
      end;

      if achou_cat = false then
      begin
        FDTCategoria.Append;
        FDTCategoriaDESCRICAO.AsString := FDTWebCATEGORIA.AsString;
        FDTCategoriaDATA_INC.AsDateTime := Date;
        FDTCategoriaSTATUS.AsString := 'S';
        FDTCategoria.Post;
        FDTCategoria.Last;
      end;

      FDTDesktopCD_CATEGORIA.AsString := FDTCategoriaID.AsString;

      //Verifica se o fornecedor já existe no banco
      achou_forn := false;
      FDTFornecedor.Open();
      FDTFornecedor.First;

      while not FDTFornecedor.Eof do
      begin
        if (UpperCase(FDTFornecedorRAZAO_SOCIAL.AsString) = UpperCase(FDTWebFORNECEDOR.AsString)) then
        begin
          achou_forn := true;
        end;
        if achou_forn = false then FDTFornecedor.Next
        else break;
      end;

      if achou_forn = false then
      begin
        FDTFornecedor.Append;
        FDTFornecedorRAZAO_SOCIAL.AsString := FDTWebFORNECEDOR.AsString;
        FDTFornecedorDATA_INC.AsDateTime := Date;
        FDTFornecedorSTATUS.AsString := 'S';
        FDTFornecedorCNPJ.AsString := '00.000.000/0000-00';
        FDTFornecedorIE.AsString := '000.000.000.000';
        FDTFornecedorLOGRADOURO.AsString := 'Não Definido';
        FDTFornecedorNOME_LOGRADOURO.AsString := 'Não Definido';
        FDTFornecedorNUM.AsString := '0';
        FDTFornecedorBAIRRO.AsString := 'Não Definido';
        FDTFornecedorCIDADE.AsString := 'Não Definido';
        FDTFornecedorESTADO.AsString := '00';
        FDTFornecedor.Post;
        FDTFornecedor.Last;
      end;

      FDTDesktopCD_FORNECEDOR.AsString := FDTFornecedorID.AsString;

      FDTDesktopDATA_INC.AsDateTime := Date;
      FDTDesktopCD_CLIENTE.AsString := FDTWebCD_CLIENTE.AsString;

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
