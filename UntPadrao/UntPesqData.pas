unit UntPesqData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TpesqData = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Image1: TImage;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    PesqData1: TDateTimePicker;
    PesqData2: TDateTimePicker;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pesqData: TpesqData;

implementation

{$R *.dfm}

uses UntPadrao1;

procedure TpesqData.BitBtn1Click(Sender: TObject);
begin
  tarefaClick := 1;

  valData := DateToStr(pesqData1.Date);
  valData2 := DateToStr(pesqData2.Date);

  Close;
end;

procedure TpesqData.BitBtn2Click(Sender: TObject);
begin
  tarefaClick := 0;
  Close;
end;

procedure TpesqData.FormActivate(Sender: TObject);
begin
  Label1.Caption := tarefa;

  pesqData1.Date := Date;
  pesqData2.Date := Date;
  pesqData1.SetFocus;
end;

end.
