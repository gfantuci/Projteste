object Form1: TForm1
  Left = 280
  Top = 127
  Width = 924
  Height = 480
  Caption = 'Projeto Teste'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'ufrmPrincipal'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object MainMenu1: TMainMenu
    Left = 40
    Top = 24
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Vendedor1: TMenuItem
        Caption = '&Vendedor'
        OnClick = Vendedor1Click
      end
      object Cliente1: TMenuItem
        Caption = '&Cliente'
        OnClick = Cliente1Click
      end
      object Produtos1: TMenuItem
        Caption = '&Produtos'
        OnClick = Produtos1Click
      end
    end
    object Vendas1: TMenuItem
      Caption = 'Vendas'
      object Pedido1: TMenuItem
        Caption = 'Pedido'
        OnClick = Pedido1Click
      end
    end
  end
end
