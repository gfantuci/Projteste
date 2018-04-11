inherited frmMClienteDet: TfrmMClienteDet
  Left = 327
  Top = 204
  Width = 748
  Height = 300
  Caption = 'Cadastro de Clientes'
  Font.Name = 'Franklin Gothic Book'
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel [0]
    Left = 24
    Top = 62
    Width = 32
    Height = 15
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 24
    Top = 99
    Width = 28
    Height = 15
    Caption = 'Nome'
  end
  object Label3: TLabel [2]
    Left = 24
    Top = 134
    Width = 45
    Height = 15
    Caption = 'Endere'#231'o'
  end
  object Label4: TLabel [3]
    Left = 540
    Top = 134
    Width = 38
    Height = 15
    Caption = 'N'#250'mero'
  end
  object Label5: TLabel [4]
    Left = 24
    Top = 169
    Width = 30
    Height = 15
    Caption = 'Bairro'
  end
  object Label6: TLabel [5]
    Left = 24
    Top = 204
    Width = 33
    Height = 15
    Caption = 'Cidade'
  end
  object Label7: TLabel [6]
    Left = 552
    Top = 204
    Width = 13
    Height = 15
    Caption = 'UF'
  end
  object Label8: TLabel [7]
    Left = 24
    Top = 240
    Width = 34
    Height = 15
    Caption = 'RG / IE'
  end
  object Label9: TLabel [8]
    Left = 353
    Top = 240
    Width = 52
    Height = 15
    Caption = 'CPF / CNPJ'
  end
  inherited Panel1: TPanel
    Width = 732
    inherited btnCancel: TBitBtn
      Action = actBtnCancel
      Caption = 'Cancelar'
    end
  end
  object IB_Edit1: TIB_Edit [10]
    Left = 76
    Top = 54
    Width = 121
    Height = 23
    DataField = 'CODIGO'
    DataSource = dmdCliente.dsCliente
    TabOrder = 1
  end
  object IB_Edit2: TIB_Edit [11]
    Left = 76
    Top = 91
    Width = 577
    Height = 23
    DataField = 'NOME'
    DataSource = dmdCliente.dsCliente
    TabOrder = 2
  end
  object IB_Edit3: TIB_Edit [12]
    Left = 76
    Top = 126
    Width = 429
    Height = 23
    DataField = 'ENDERECO'
    DataSource = dmdCliente.dsCliente
    TabOrder = 3
  end
  object IB_Edit4: TIB_Edit [13]
    Left = 592
    Top = 126
    Width = 121
    Height = 23
    DataField = 'NUMERO'
    DataSource = dmdCliente.dsCliente
    TabOrder = 4
  end
  object IB_Edit5: TIB_Edit [14]
    Left = 76
    Top = 161
    Width = 461
    Height = 23
    DataField = 'BAIRRO'
    DataSource = dmdCliente.dsCliente
    TabOrder = 5
  end
  object IB_Edit6: TIB_Edit [15]
    Left = 76
    Top = 196
    Width = 445
    Height = 23
    DataField = 'CIDADE'
    DataSource = dmdCliente.dsCliente
    TabOrder = 6
  end
  object IB_Edit7: TIB_Edit [16]
    Left = 592
    Top = 196
    Width = 121
    Height = 23
    DataField = 'UF'
    DataSource = dmdCliente.dsCliente
    TabOrder = 7
  end
  object IB_Edit8: TIB_Edit [17]
    Left = 76
    Top = 232
    Width = 121
    Height = 23
    DataField = 'RG_IE'
    DataSource = dmdCliente.dsCliente
    TabOrder = 8
  end
  object IB_Edit9: TIB_Edit [18]
    Left = 412
    Top = 232
    Width = 121
    Height = 23
    DataField = 'CPF_CNPJ'
    DataSource = dmdCliente.dsCliente
    TabOrder = 9
  end
  inherited ActionList2: TActionList
    Left = 248
    Top = 8
  end
end
