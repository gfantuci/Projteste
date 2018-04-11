inherited frmMProdutoDet: TfrmMProdutoDet
  Left = 305
  Top = 200
  Height = 296
  Caption = 'Cadastro de Produtos'
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel [0]
    Left = 12
    Top = 60
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object lbl2: TLabel [1]
    Left = 12
    Top = 97
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object lbl3: TLabel [2]
    Left = 12
    Top = 134
    Width = 40
    Height = 13
    Caption = 'Unidade'
  end
  object lbl4: TLabel [3]
    Left = 12
    Top = 171
    Width = 62
    Height = 13
    Caption = 'Pre'#231'o Venda'
  end
  object lbl5: TLabel [4]
    Left = 12
    Top = 208
    Width = 58
    Height = 13
    Caption = 'Pre'#231'o Custo'
  end
  inherited Panel1: TPanel
    inherited btnCancel: TBitBtn
      Action = actBtnCancel
      Caption = 'Cancelar'
    end
  end
  object edtCodigo: TIB_Edit [6]
    Left = 83
    Top = 56
    Width = 121
    Height = 21
    DataField = 'CODIGO'
    DataSource = frmdmdProduto.dsProduto
    TabOrder = 1
  end
  object edtNome: TIB_Edit [7]
    Left = 83
    Top = 93
    Width = 417
    Height = 21
    DataField = 'NOME'
    DataSource = frmdmdProduto.dsProduto
    TabOrder = 2
  end
  object edtUnidade: TIB_Edit [8]
    Left = 83
    Top = 130
    Width = 121
    Height = 21
    DataField = 'UNIDADE'
    DataSource = frmdmdProduto.dsProduto
    TabOrder = 3
  end
  object edtPrecoVenda: TIB_Edit [9]
    Left = 83
    Top = 167
    Width = 121
    Height = 21
    DataField = 'PRECOVENDA'
    DataSource = frmdmdProduto.dsProduto
    TabOrder = 4
  end
  object edtPrecoCusto: TIB_Edit [10]
    Left = 83
    Top = 204
    Width = 121
    Height = 21
    DataField = 'PRECOCUSTO'
    DataSource = frmdmdProduto.dsProduto
    TabOrder = 5
  end
  inherited ActionList2: TActionList
    Left = 472
    Top = 8
  end
end
