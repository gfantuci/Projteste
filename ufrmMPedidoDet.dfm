inherited frmMPedidoDet: TfrmMPedidoDet
  Left = 362
  Top = 234
  Width = 853
  Caption = 'frmMPedidoDet'
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 837
  end
  object pnl1: TPanel [1]
    Left = 0
    Top = 41
    Width = 837
    Height = 128
    Align = alTop
    TabOrder = 1
    object lbl1: TLabel
      Left = 17
      Top = 7
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object lbl2: TLabel
      Left = 632
      Top = 7
      Width = 49
      Height = 13
      Caption = 'Conclu'#237'do'
    end
    object lbl3: TLabel
      Left = 17
      Top = 32
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object lbl4: TLabel
      Left = 17
      Top = 58
      Width = 46
      Height = 13
      Caption = 'Vendedor'
    end
    object lbl5: TLabel
      Left = 17
      Top = 84
      Width = 46
      Height = 13
      Caption = 'Desconto'
    end
    object lbl6: TLabel
      Left = 17
      Top = 109
      Width = 39
      Height = 13
      Caption = 'Vlr Total'
    end
    object lbl7: TLabel
      Left = 340
      Top = 109
      Width = 37
      Height = 13
      Caption = 'Vlr Final'
    end
    object edtCodigo: TIB_Edit
      Left = 68
      Top = 3
      Width = 73
      Height = 21
      DataField = 'CODIGO'
      DataSource = fdmdPedido.dsPedido
      TabOrder = 0
    end
    object EdtCliente: TIB_Edit
      Left = 68
      Top = 28
      Width = 74
      Height = 21
      DataField = 'CLIENTE'
      DataSource = fdmdPedido.dsPedido
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ButtonStyle = ebsEllipsis
      AlwaysShowButton = True
    end
    object edtNomeCliente: TIB_Edit
      Left = 146
      Top = 28
      Width = 445
      Height = 21
      DataField = 'NOME_CLIENTE'
      DataSource = fdmdPedido.dsPedido
      TabOrder = 2
    end
    object EdtVendedor: TIB_Edit
      Left = 68
      Top = 54
      Width = 74
      Height = 21
      DataField = 'VENDEDOR'
      DataSource = fdmdPedido.dsPedido
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      ButtonStyle = ebsEllipsis
      AlwaysShowButton = True
    end
    object EdtNomeVendedor: TIB_Edit
      Left = 146
      Top = 54
      Width = 445
      Height = 21
      DataField = 'NOME_VENDEDOR'
      DataSource = fdmdPedido.dsPedido
      TabOrder = 4
    end
    object EdtConcluido: TIB_Edit
      Left = 684
      Top = 3
      Width = 121
      Height = 21
      DataField = 'CONCLUIDO'
      DataSource = fdmdPedido.dsPedido
      TabOrder = 5
    end
    object edtCodigoTPDESCONTO: TIB_Edit
      Left = 68
      Top = 80
      Width = 121
      Height = 21
      DataField = 'DESCONTO'
      DataSource = fdmdPedido.dsPedido
      TabOrder = 6
    end
    object EdtValorTotal: TIB_Edit
      Left = 68
      Top = 105
      Width = 121
      Height = 21
      DataField = 'VALORTOTAL'
      DataSource = fdmdPedido.dsPedido
      TabOrder = 7
    end
    object EdtValorFinal: TIB_Edit
      Left = 388
      Top = 105
      Width = 121
      Height = 21
      DataField = 'VALORFINAL'
      DataSource = fdmdPedido.dsPedido
      TabOrder = 8
    end
  end
  object pnl2: TPanel [2]
    Left = 0
    Top = 169
    Width = 837
    Height = 127
    Align = alClient
    TabOrder = 2
    object IB_Grid1: TIB_Grid
      Left = 1
      Top = 1
      Width = 835
      Height = 125
      CustomGlyphsSupplied = []
      DataSource = fdmdPedido.dsItens
      Align = alClient
      OnDblClick = IB_Grid1DblClick
      TabOrder = 0
    end
  end
  object pnl3: TPanel [3]
    Left = 0
    Top = 296
    Width = 837
    Height = 41
    Align = alBottom
    TabOrder = 3
    object Button1: TButton
      Left = 12
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 112
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  inherited ActionList2: TActionList
    Left = 220
    Top = 4
  end
end
