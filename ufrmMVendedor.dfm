inherited frmMVendedor: TfrmMVendedor
  Left = 393
  Top = 276
  Height = 312
  Caption = 'Cadastro Vendedor'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnBar: TPanel
    inherited IB_SearchBar1: TIB_SearchBar
      DataSource = dsVendedor
    end
    inherited IB_DatasetBar1: TIB_DatasetBar
      DataSource = dsVendedor
    end
    inherited SVIB_UpdateBar1: TSVIB_UpdateBar
      DataSource = dsVendedor
    end
    inherited SVIB_NavigationBar1: TSVIB_NavigationBar
      DataSource = dsVendedor
    end
  end
  inherited PagControlDados: TPageControl
    inherited TabForm: TTabSheet
      object Label1: TLabel
        Left = 6
        Top = 12
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 6
        Top = 48
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label3: TLabel
        Left = 6
        Top = 84
        Width = 56
        Height = 13
        Caption = '% Comiss'#227'o'
      end
      object IB_Edit1: TIB_Edit
        Left = 64
        Top = 11
        Width = 121
        Height = 21
        DataField = 'CODIGO'
        DataSource = dsVendedor
        TabOrder = 0
      end
      object IB_Edit2: TIB_Edit
        Left = 64
        Top = 47
        Width = 281
        Height = 21
        DataField = 'NOME'
        DataSource = dsVendedor
        TabOrder = 1
      end
      object IB_Edit3: TIB_Edit
        Left = 64
        Top = 83
        Width = 121
        Height = 21
        DataField = 'PERCCOMISSAO'
        DataSource = dsVendedor
        TabOrder = 2
      end
    end
    inherited TabGrid: TTabSheet
      inherited IBOGridDefault: TIB_Grid
        DataSource = dsVendedor
      end
    end
  end
  inherited btnClose: TButton
    Top = 237
  end
  inherited StatusBar1: TStatusBar
    Top = 252
  end
  object dsVendedor: TIB_DataSource
    Dataset = qryVendedor
    Left = 52
    Top = 228
  end
  object qryVendedor: TIB_Query
    DatabaseName = 'localhost:C:\DEV\Dados\DADOS.FDB'
    FieldsCharCase.Strings = (
      'NOME=UPPER')
    FieldsGridLabel.Strings = (
      'CODIGO=C'#243'digo'
      'NOME=Nome'
      'PERCCOMISSAO=% Comiss'#227'o')
    FieldsReadOnly.Strings = (
      'CODIGO=TRUE;NOEDIT')
    IB_Connection = frmdmdPrimcipal.IB_Connection
    SQL.Strings = (
      'SELECT CODIGO'
      '     , NOME'
      '     , PERCCOMISSAO'
      'FROM TABVENDEDOR'
      'for update')
    KeyLinks.Strings = (
      'TABVENDEDOR.CODIGO')
    RequestLive = True
    BeforePost = qryVendedorBeforePost
    Left = 112
    Top = 224
  end
end
