program Vendas;

uses
  Vcl.Forms,
<<<<<<< HEAD
  UntPadrao1 in 'UntPadrao\UntPadrao1.pas' {FrmPadrao1},
  UntPesqData in 'UntPadrao\UntPesqData.pas' {pesqData},
  UntPesqString in 'UntPadrao\UntPesqString.pas' {pesqString},
  UntDM in 'UntGeral\UntDM.pas' {DM: TDataModule},
  UntLogin in 'UntGeral\UntLogin.pas' {FrmLogin},
  UntMenuPrincipal in 'UntGeral\UntMenuPrincipal.pas' {FrmMenuPrincipal},
  UntPerfil in 'UntGeral\UntPerfil.pas' {FrmPerfil},
  UntCliente in 'UntCadastro\UntCliente.pas' {FrmCliente},
  UntUsuario in 'UntCadastro\UntUsuario.pas' {FrmUsuario};
=======
  UntMenuPrincipal in 'UntMenuPrincipal.pas' {FrmMenuPrincipal},
  UntDM in 'UntDM.pas' {DM: TDataModule},
  UntPadrao1 in 'UntPadrao1.pas' {FrmPadrao1},
  UntUsuario in 'UntUsuario.pas' {FrmUsuario},
  UntPerfil in 'UntPerfil.pas' {FrmPerfil},
  UntLogin in 'UntLogin.pas' {FrmLogin},
  UntPesqData in 'UntPesqData.pas' {pesqData},
  UntPesqString in 'UntPesqString.pas' {pesqString},
  UntCliente in 'UntCliente.pas' {FrmCliente};
  UntMarca in 'UntMarca.pas' {FrmPadrao2};
>>>>>>> f8d3ec052407afe6c80c77d31ad379f6af778474

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMenuPrincipal, FrmMenuPrincipal);
  Application.CreateForm(TFrmPadrao1, FrmPadrao1);
  Application.CreateForm(TpesqData, pesqData);
  Application.CreateForm(TpesqString, pesqString);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmPerfil, FrmPerfil);
  Application.CreateForm(TFrmCliente, FrmCliente);
<<<<<<< HEAD
  Application.CreateForm(TFrmUsuario, FrmUsuario);
=======
  Application.CreateForm(TFrmPadrao2, FrmPadrao2);
>>>>>>> f8d3ec052407afe6c80c77d31ad379f6af778474
  Application.Run;
end.
