program Vendas;

uses
  Vcl.Forms,
  UntMenuPrincipal in 'UntMenuPrincipal.pas' {FrmMenuPrincipal},
  UntDM in 'UntDM.pas' {DM: TDataModule},
  UntPadrao1 in 'UntPadrao1.pas' {FrmPadrao1},
  UntUsuario in 'UntUsuario.pas' {FrmUsuario},
  UntPerfil in 'UntPerfil.pas' {FrmPerfil},
  UntLogin in 'UntLogin.pas' {FrmLogin},
  UntPesqData in 'UntPesqData.pas' {pesqData},
  UntPesqString in 'UntPesqString.pas' {pesqString},
  UntCliente in 'UntCliente.pas' {FrmCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMenuPrincipal, FrmMenuPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmPadrao1, FrmPadrao1);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TpesqData, pesqData);
  Application.CreateForm(TpesqString, pesqString);
  Application.CreateForm(TFrmCliente, FrmCliente);
  Application.Run;
end.
