unit UntMarca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UntPadrao1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask;

type
  TFrmMarca = class(TFrmPadrao1)
    Label3: TLabel;
    edDataInc: TDBEdit;
    Label4: TLabel;
    edDataAlt: TDBEdit;
    lbDESCRICAO: TLabel;
    edDescricao: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMarca: TFrmMarca;

implementation

{$R *.dfm}

end.
