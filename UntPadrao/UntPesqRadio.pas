unit UntPesqRadio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TpesqRadio = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StatusBar1: TStatusBar;
    RadioGroup1: TRadioGroup;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pesqRadio: TpesqRadio;

implementation

{$R *.dfm}

uses UntPadrao1;

procedure TpesqRadio.BitBtn1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = -1 then ShowMessage('Selecione uma opção.')
  else Close;
end;

procedure TpesqRadio.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TpesqRadio.FormActivate(Sender: TObject);
begin
  Label1.Caption := nomeJanela;
  RadioGroup1.ItemIndex := -1;
end;

end.
