object FrmMenuPrincipal: TFrmMenuPrincipal
  Left = 0
  Top = 0
  Caption = 'FrmMenuPrincipal'
  ClientHeight = 413
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 394
    Width = 619
    Height = 19
    Panels = <
      item
        Width = 75
      end
      item
        Width = 300
      end
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object Button1: TButton
    Left = 280
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 361
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 442
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 3
    OnClick = Button3Click
  end
  object QueryLogin: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'SELECT U.*, P.*'
      'FROM USUARIO U'
      'INNER JOIN PERFIL P ON U.USU_ID_PERFIL = P.ID')
    Left = 144
    Top = 184
  end
end
