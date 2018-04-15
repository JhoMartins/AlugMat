unit UntCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB, FireDAC.Comp.DataSet, Vcl.Menus,
  FireDAC.Comp.Client, System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TFrmCliente = class(TFrmPadrao1)
    Label2: TLabel;
    Label3: TLabel;
    lbCPFCNPJ: TLabel;
    lbRGIE: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edNome: TDBEdit;
    edCPFCNPJ: TDBEdit;
    edRGIE: TDBEdit;
    edTipoLog: TDBEdit;
    edNomeLog: TDBEdit;
    edN: TDBEdit;
    edComplemento: TDBEdit;
    edBairro: TDBEdit;
    edCidade: TDBEdit;
    edTelefone: TDBEdit;
    edCelular: TDBEdit;
    edEmail: TDBEdit;
    cbTipo: TDBComboBox;
    cbEstado: TDBComboBox;
    Label4: TLabel;
    Label5: TLabel;
    edDataInc: TDBEdit;
    edDataAlt: TDBEdit;
    FDTabelaID: TFDAutoIncField;
    FDTabelaTIPO_PESSOA: TStringField;
    FDTabelaNOME: TStringField;
    FDTabelaCPF: TStringField;
    FDTabelaRG: TStringField;
    FDTabelaCNPJ: TStringField;
    FDTabelaIE: TStringField;
    FDTabelaLOGRADOURO: TStringField;
    FDTabelaNOME_LOGRADOURO: TStringField;
    FDTabelaNUM: TIntegerField;
    FDTabelaCOMPLEMENTO: TStringField;
    FDTabelaBAIRRO: TStringField;
    FDTabelaCIDADE: TStringField;
    FDTabelaESTADO: TStringField;
    FDTabelaTELEFONE: TStringField;
    FDTabelaCELULAR: TStringField;
    FDTabelaEMAIL: TStringField;
    FDTabelaDATA_INC: TSQLTimeStampField;
    FDTabelaDATA_ALT: TSQLTimeStampField;
    FDTabelaSTATUS: TStringField;
    N3: TMenuItem;
    NomedoCliente1: TMenuItem;
    CPFdoCliente1: TMenuItem;
    ipodePessoa1: TMenuItem;
    N4: TMenuItem;
    NomedoCliente2: TMenuItem;
    ipodePessoa2: TMenuItem;
    procedure btn_inserirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbTipoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_primeiroClick(Sender: TObject);
    procedure btn_anteriorClick(Sender: TObject);
    procedure btn_proximoClick(Sender: TObject);
    procedure btn_ultimoClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure ipodePessoa1Click(Sender: TObject);
    procedure NomedoCliente1Click(Sender: TObject);
    procedure CPFdoCliente1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NomedoCliente2Click(Sender: TObject);
    procedure ipodePessoa2Click(Sender: TObject);
    procedure IDCdigo1Click(Sender: TObject);
    procedure Datadeincluso1Click(Sender: TObject);
    procedure Datadealterao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCliente: TFrmCliente;

implementation

{$R *.dfm}

uses UntDM, UntMenuPrincipal, UntPesqString, UntPesqRadio;

procedure TFrmCliente.btn_anteriorClick(Sender: TObject);
begin
  inherited;

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;
end;

procedure TFrmCliente.btn_cancelarClick(Sender: TObject);
begin
  inherited;

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;


  cbTipo.color := clWindow;
  edNome.color := clWindow;
  edCPFCNPJ.color := clWindow;
  edRGIE.color := clWindow;
  edTipoLog.color := clWindow;
  edNomeLog.color := clWindow;
  edN.color := clWindow;
  edBairro.color := clWindow;
  edCidade.color := clWindow;
  cbEstado.color := clWindow;
  edTelefone.Color := clWindow;
  edCelular.Color := clWindow;
end;

procedure TFrmCliente.btn_editarClick(Sender: TObject);
begin

  inherited;

  edNome.Enabled := true;
  edCPFCNPJ.Enabled := true;
  edRGIE.Enabled := true;
  edTipoLog.Enabled := true;
  edNomeLog.Enabled := true;
  edN.Enabled := true;
  edComplemento.Enabled := true;
  edBairro.Enabled := true;
  edCidade.Enabled := true;
  cbEstado.Enabled := true;
  edTelefone.Enabled := true;
  edCelular.Enabled := true;
  edEmail.Enabled := true;

  //Campos que serão desabilitados até que o usuário escolha o tipo da pessoa
  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    //Campos que serão desabilitados até que o usuário escolha o tipo da pessoa
    edNome.Enabled := false;
    edCPFCNPJ.Enabled := false;
    edRGIE.Enabled := false;
    edTipoLog.Enabled := false;
    edNomeLog.Enabled := false;
    edN.Enabled := false;
    edComplemento.Enabled := false;
    edBairro.Enabled := false;
    edCidade.Enabled := false;
    cbEstado.Enabled := false;
    edTelefone.Enabled := false;
    edCelular.Enabled := false;
    edEmail.Enabled := false;
  end;



end;

procedure TFrmCliente.btn_excluirClick(Sender: TObject);
begin
  inherited;

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;
end;

procedure TFrmCliente.btn_inserirClick(Sender: TObject);
begin
  //Campos que serão desabilitados até que o usuário escolha o tipo da pessoa
  edNome.Enabled := false;
  edCPFCNPJ.Enabled := false;
  edRGIE.Enabled := false;
  edTipoLog.Enabled := false;
  edNomeLog.Enabled := false;
  edN.Enabled := false;
  edComplemento.Enabled := false;
  edBairro.Enabled := false;
  edCidade.Enabled := false;
  cbEstado.Enabled := false;
  edTelefone.Enabled := false;
  edCelular.Enabled := false;
  edEmail.Enabled := false;
  inherited;

end;

procedure TFrmCliente.btn_primeiroClick(Sender: TObject);
begin
  inherited;

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;
end;

procedure TFrmCliente.btn_proximoClick(Sender: TObject);
begin
  inherited;

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;
end;

procedure TFrmCliente.btn_salvarClick(Sender: TObject);
begin
  if (cbTipo.ItemIndex = -1) or (edNome.Text = '') or (edCPFCNPJ.Text = '   .   .   -  ') or (edCPFCNPJ.Text = '  .   .   /    -  ') or (edRGIE.Text = '') or (edRGIE.Text = '   .   .   .   ') or (edTipoLog.Text = '') or (edNomeLog.Text = '') or (edN.Text = '') or (edBairro.Text = '') or (edCidade.Text = '') or (cbEstado.ItemIndex = -1) then
  begin

    //Colorir Campos Obrigatórios
    cbTipo.color := clInactiveCaption;
    edNome.color := clInactiveCaption;
    edCPFCNPJ.color := clInactiveCaption;
    edRGIE.color := clInactiveCaption;
    edTipoLog.color := clInactiveCaption;
    edNomeLog.color := clInactiveCaption;
    edN.color := clInactiveCaption;
    edBairro.color := clInactiveCaption;
    edCidade.color := clInactiveCaption;
    cbEstado.color := clInactiveCaption;


    Application.MessageBox('Preencha todos os campos obrigatórios.','Atenção', MB_OK + MB_ICONERROR);
    cbTipo.SetFocus;
    abort;
  end
  else
  begin
    if (edTelefone.Text = '(  )    -    ') and (edCelular.Text = '(  )     -    ') then
    begin

      //Colorir campos obrigatórios
      edTelefone.Color := clInactiveCaption;
      edCelular.Color := clInactiveCaption;


      Application.MessageBox('Preencha ao menos um número de telefone.','Atenção', MB_OK + MB_ICONERROR);
      edTelefone.SetFocus;

      abort;
    end
    else
    begin
      if cbTipo.ItemIndex = 0 then
      begin
        FDTabela.FieldByName('TIPO_PESSOA').Value := 'F';
        FDTabela.FieldByName('CNPJ').Value := NULL;
        FDTabela.FieldByName('IE').Value := NULL;
      end
      else if cbTipo.ItemIndex = 1 then
      begin
        FDTabela.FieldByName('TIPO_PESSOA').Value := 'J';
        FDTabela.FieldByName('CPF').Value := NULL;
        FDTabela.FieldByName('RG').Value := NULL;
      end;
    end;
  end;

  inherited;

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then cbTipo.ItemIndex := 0
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then cbTipo.ItemIndex := 1
  else cbTipo.ItemIndex := -1;

  cbTipo.color := clWindow;
  edNome.color := clWindow;
  edCPFCNPJ.color := clWindow;
  edRGIE.color := clWindow;
  edTipoLog.color := clWindow;
  edNomeLog.color := clWindow;
  edN.color := clWindow;
  edBairro.color := clWindow;
  edCidade.color := clWindow;
  cbEstado.color := clWindow;
  edTelefone.Color := clWindow;
  edCelular.Color := clWindow;

end;

procedure TFrmCliente.btn_ultimoClick(Sender: TObject);
begin
  inherited;

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;
end;

procedure TFrmCliente.cbTipoClick(Sender: TObject);
begin
  inherited;

  if cbTipo.ItemIndex = 0 then
  begin
    lbCPFCNPJ.Caption := '* CPF:';
    edCPFCNPJ.DataField := 'CPF';
    FDTabela.FieldByName('CPF').EditMask := '999.999.999-99;1;_';

    lbRGIE.Caption := '* RG:';
    edRGIE.DataField := 'RG';

    //Habilitar Campos
    edNome.Enabled := true;
    edCPFCNPJ.Enabled := true;
    edRGIE.Enabled := true;
    edTipoLog.Enabled := true;
    edNomeLog.Enabled := true;
    edN.Enabled := true;
    edComplemento.Enabled := true;
    edBairro.Enabled := true;
    edCidade.Enabled := true;
    cbEstado.Enabled := true;
    edTelefone.Enabled := true;
    edCelular.Enabled := true;
    edEmail.Enabled := true;

    cbTipo.ItemIndex := 0;
  end
  else if cbTipo.ItemIndex = 1 then
  begin
    lbCPFCNPJ.Caption := '* CNPJ:';
    edCPFCNPJ.DataField := 'CNPJ';
    FDTabela.FieldByName('CNPJ').EditMask := '99.999.999/9999-99;1;_';

    lbRGIE.Caption := '* IE:';
    edRGIE.DataField := 'IE';
    FDTabela.FieldByName('IE').EditMask := '999.999.999.999;1;_';

    //Habilitar Campos
    edNome.Enabled := true;
    edCPFCNPJ.Enabled := true;
    edRGIE.Enabled := true;
    edTipoLog.Enabled := true;
    edNomeLog.Enabled := true;
    edN.Enabled := true;
    edComplemento.Enabled := true;
    edBairro.Enabled := true;
    edCidade.Enabled := true;
    cbEstado.Enabled := true;
    edTelefone.Enabled := true;
    edCelular.Enabled := true;
    edEmail.Enabled := true;

    cbTipo.ItemIndex := 1;
  end;
end;



procedure TFrmCliente.CPFdoCliente1Click(Sender: TObject);
var cpfcnpj, cpf, cnpj: string;
begin
  pesqString.Edit1.NumbersOnly := true;
  pesqString.RadioGroup1.Visible := false;

  inherited;

  tarefa := 'Pesquisa por CPF/CNPJ';
  pesqString.ShowModal;

  cpf := '';
  cnpj := '';
  cpfcnpj := pesqString.Edit1.Text;

  if (length(pesqString.Edit1.Text) = 11) then cpf := Copy(pesqString.Edit1.text,0,3) + '.' + Copy(pesqString.Edit1.text,4,3) + '.' + Copy(pesqString.Edit1.text,7,3) + '-' + Copy(pesqString.Edit1.text,10,2)
  else if (length(pesqString.Edit1.Text) = 14) then cnpj := Copy(pesqString.Edit1.text,0,2) + '.' + Copy(pesqString.Edit1.text,3,3) + '.' + Copy(pesqString.Edit1.text,6,3) + '/' + Copy(pesqString.Edit1.text,9,4) + '-' + Copy(pesqString.Edit1.text,13,2);

  if cpf <> '' then
  begin
    FDTabela.Filter := 'CPF = ' + #39 + cpf + #39;
    StatusBar1.Panels[2].Text := 'CPF do Cliente: ' + cpf;
  end;

  if cnpj <> '' then
  begin
    FDTabela.Filter := 'CNPJ = ' + #39 + cnpj + #39;
    StatusBar1.Panels[2].Text := 'CNPJ do Cliente: ' + cnpj;
  end;

  FDTabela.Filtered := True;

  Executar := sentencaSQL;
  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;
end;

procedure TFrmCliente.Datadealterao1Click(Sender: TObject);
begin
  inherited;

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;
end;

procedure TFrmCliente.Datadeincluso1Click(Sender: TObject);
begin
  inherited;

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;
end;

procedure TFrmCliente.FormActivate(Sender: TObject);
begin
  nomeJanela := 'Cliente';
  FDTabela.TableName := 'CLIENTE';
  TipoID := 0;

  modoEdicao := FrmMenuPrincipal.QueryLogin.FieldByName('PER_CLIENTE_I').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_CLIENTE_A').AsString +
                FrmMenuPrincipal.QueryLogin.FieldByName('PER_CLIENTE_E').AsString;

  Executar := exibeBotoes;
  Executar := ExibePanels;

  //Máscaras
  FDTabela.FieldByName('DATA_INC').EditMask := '99/99/9999;1;_';
  FDTabela.FieldByName('DATA_ALT').EditMask := '99/99/9999;1;_';
  FDTabela.FieldByName('TELEFONE').EditMask := '(99)9999-9999;1;_';
  FDTabela.FieldByName('CELULAR').EditMask := '(99)99999-9999;1;_';

  inherited;

  FDTabela.Open();
  Executar := habilitaBotoes;

  edDataInc.Enabled := false;
  edDataAlt.Enabled := false;

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;
end;

procedure TFrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  nomeJanela := '';
end;

procedure TFrmCliente.IDCdigo1Click(Sender: TObject);
begin
  inherited;

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;
end;

procedure TFrmCliente.ipodePessoa1Click(Sender: TObject);
var i: integer;
begin
  inherited;

  tarefa := 'Pesquisa por Tipo de Pessoa';

  pesqRadio.RadioGroup1.Caption := 'Pesquisa por Tipo de Pessoa:';
  pesqRadio.RadioGroup1.Items.Add('Pessoa Física');
  pesqRadio.RadioGroup1.Items.Add('Pessoa Jurídica');

  pesqRadio.ShowModal;

  if pesqRadio.RadioGroup1.ItemIndex = 0 then
  begin
    FDTabela.Filter := 'TIPO_PESSOA = ' + #39 + 'F' + #39;
    StatusBar1.Panels[2].Text := 'Tipo de Pessoa: Física';
  end;

  if pesqRadio.RadioGroup1.ItemIndex = 1 then
  begin
    FDTabela.Filter := 'TIPO_PESSOA = ' + #39 + 'J' + #39;
    StatusBar1.Panels[2].Text := 'Tipo de Pessoa: Jurídica';
  end;

  FDTabela.Filtered := True;

  Executar := sentencaSQL;
  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;

  i := pesqRadio.RadioGroup1.Items.Count - 1;
  while i > -1 do
  begin
    pesqRadio.RadioGroup1.Items.Delete(i);
    i := i - 1;
  end;

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;
end;

procedure TFrmCliente.ipodePessoa2Click(Sender: TObject);
begin
  inherited;

  FDTabela.IndexFieldNames := 'TIPO_PESSOA';
  StatusBar1.Panels[2].Text := 'Ordenado: Tipo de Pessoa';

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;
end;

procedure TFrmCliente.NomedoCliente1Click(Sender: TObject);
begin
  inherited;

  tarefa := 'Pesquisa alfanumérica por Nome';
  pesqString.ShowModal;

  if pesqString.RadioGroup1.ItemIndex = 0 then
  begin
    FDTabela.Filter := 'UPPER(NOME) LIKE ' + #39 + '%' + pesqString.Edit1.text + '%' + #39;
    StatusBar1.Panels[2].Text := 'Nome contém: ' + pesqString.Edit1.Text;
  end;

  if pesqString.RadioGroup1.ItemIndex = 1 then
  begin
    FDTabela.Filter := 'UPPER(NOME) LIKE ' + #39 + pesqString.Edit1.text + '%' + #39;
    StatusBar1.Panels[2].Text := 'Nome inicia com: ' + pesqString.Edit1.Text;
  end;

  if pesqString.RadioGroup1.ItemIndex = 2 then
  begin
    FDTabela.Filter := 'UPPER(NOME) LIKE ' + #39 + '%' + pesqString.Edit1.text + #39;
    StatusBar1.Panels[2].Text := 'Nome termina com: ' + pesqString.Edit1.Text;
  end;

  FDTabela.Filtered := True;

  Executar := sentencaSQL;
  Executar := exibePanels;
  Executar := navegacao;
  Executar := habilitaBotoes;

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;
end;

procedure TFrmCliente.NomedoCliente2Click(Sender: TObject);
begin
  inherited;
  FDTabela.IndexFieldNames := 'NOME';
  StatusBar1.Panels[2].Text := 'Ordenado: Nome';

  if FDTabela.FieldByName('TIPO_PESSOA').Value = 'F' then
  begin
    cbTipo.ItemIndex := 0;
    edCPFCNPJ.DataField :=  'CPF';
    edRGIE.DataField := 'RG';
    lbCPFCNPJ.Caption := '* CPF:';
    lbRGIE.Caption := '* RG:';
  end
  else if FDTabela.FieldByName('TIPO_PESSOA').Value = 'J' then
  begin
    cbTipo.ItemIndex := 1;
    edCPFCNPJ.DataField :=  'CNPJ';
    edRGIE.DataField := 'IE';
    lbCPFCNPJ.Caption := '* CNPJ:';
    lbRGIE.Caption := '* IE:';
  end
  else
  begin
    cbTipo.ItemIndex := -1;
    lbCPFCNPJ.Caption := '* CPF/CNPJ';
    lbRGIE.Caption := '* RG/IE:';
  end;
end;

end.
