unit UntPesqString;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TpesqString = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StatusBar1: TStatusBar;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    Edit1: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pesqString: TpesqString;

implementation

{$R *.dfm}

uses UntPadrao1;

procedure TpesqString.BitBtn1Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('O campo Valor não pode ficar em branco.');
    Edit1.SetFocus;
  end
  else
  begin
    Close;
  end;
end;

procedure TpesqString.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TpesqString.FormActivate(Sender: TObject);
begin
  Label1.Caption := nomeJanela;
  Edit1.Clear;
  Edit1.SetFocus;
  pesqString.Caption := tarefa;
end;

end.
