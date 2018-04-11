inherited frmMProdutoPedidoDet: TfrmMProdutoPedidoDet
  Left = 304
  Top = 211
  Width = 795
  Height = 220
  Caption = 'frmMProdutoPedidoDet'
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel [0]
    Left = 10
    Top = 60
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label1: TLabel [1]
    Left = 10
    Top = 89
    Width = 37
    Height = 13
    Caption = 'Produto'
  end
  object lbl2: TLabel [2]
    Left = 10
    Top = 119
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object lbl3: TLabel [3]
    Left = 193
    Top = 119
    Width = 55
    Height = 13
    Caption = 'Quantidade'
  end
  object lbl4: TLabel [4]
    Left = 382
    Top = 119
    Width = 46
    Height = 13
    Caption = 'Desconto'
  end
  object lbl5: TLabel [5]
    Left = 562
    Top = 119
    Width = 24
    Height = 13
    Caption = 'Total'
  end
  object lbl6: TLabel [6]
    Left = 10
    Top = 148
    Width = 49
    Height = 13
    Caption = 'Valor Final'
  end
  inherited Panel1: TPanel
    Width = 779
    TabOrder = 1
    inherited btnCancel: TBitBtn
      Action = actBtnCancel
      Caption = 'Cancelar'
    end
  end
  object edtCodigo1: TIB_Edit [8]
    Left = 66
    Top = 56
    Width = 81
    Height = 21
    DataField = 'CODIGO'
    DataSource = fdmdPedido.dsProdPedidoDet
    TabOrder = 2
  end
  object edtCodigo2: TIB_Edit [9]
    Left = 140
    Top = 85
    Width = 573
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = fdmdPedido.dsProdPedidoDet
    TabOrder = 3
  end
  object edtUnitario: TIB_Edit [10]
    Left = 66
    Top = 115
    Width = 121
    Height = 21
    DataField = 'UNITARIO'
    DataSource = fdmdPedido.dsProdPedidoDet
    TabOrder = 4
    OnExit = edtUnitarioExit
  end
  object edtQuantidade: TIB_Edit [11]
    Left = 255
    Top = 115
    Width = 121
    Height = 21
    DataField = 'QUANTIDADE'
    DataSource = fdmdPedido.dsProdPedidoDet
    TabOrder = 5
    OnExit = edtQuantidadeExit
  end
  object edtDesconto: TIB_Edit [12]
    Left = 434
    Top = 115
    Width = 121
    Height = 21
    DataField = 'DESCONTO'
    DataSource = fdmdPedido.dsProdPedidoDet
    TabOrder = 6
    OnExit = edtDescontoExit
  end
  object edtTotal: TIB_Edit [13]
    Left = 592
    Top = 115
    Width = 121
    Height = 21
    DataField = 'TOTAL'
    DataSource = fdmdPedido.dsProdPedidoDet
    TabOrder = 7
    OnExit = edtTotalExit
  end
  object edtFinal: TIB_Edit [14]
    Left = 66
    Top = 144
    Width = 121
    Height = 21
    DataField = 'FINAL'
    DataSource = fdmdPedido.dsProdPedidoDet
    TabOrder = 8
  end
  object edtPedido: TIB_Edit [15]
    Left = 592
    Top = 56
    Width = 121
    Height = 21
    DataField = 'PEDIDO'
    DataSource = fdmdPedido.dsProdPedidoDet
    Visible = False
    TabOrder = 9
  end
  object EdtCliente: TIB_Edit [16]
    Left = 66
    Top = 85
    Width = 74
    Height = 21
    DataField = 'PRODUTO'
    DataSource = fdmdPedido.dsProdPedidoDet
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ButtonStyle = ebsEllipsis
    AlwaysShowButton = True
  end
  inherited ActionList2: TActionList
    Left = 236
    Top = 4
  end
end
