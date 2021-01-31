object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Sistema Info Sistemas'
  ClientHeight = 643
  ClientWidth = 1069
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 296
    Top = 56
    object mnCadastros: TMenuItem
      Caption = 'Cadastro'
      object mnClientes: TMenuItem
        Caption = 'Clientes'
        OnClick = mnClientesClick
      end
    end
    object mnUtilitarios: TMenuItem
      Caption = 'Utilit'#225'rios'
      object mnConfiguracoes: TMenuItem
        Caption = 'Configura'#231#245'es'
        OnClick = mnConfiguracoesClick
      end
    end
  end
end
