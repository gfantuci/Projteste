object frmdmdProduto: TfrmdmdProduto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 655
  Top = 265
  Height = 174
  Width = 247
  object qryProduto: TIB_Query
    DatabaseName = 'localhost:C:\DEV\Dados\DADOS.FDB'
    IB_Connection = frmdmdPrimcipal.IB_Connection
    IB_Transaction = ibTransactionProduto
    SQL.Strings = (
      'SELECT CODIGO'
      '     , NOME'
      '     , UNIDADE'
      '     , EMB_UNID'
      '     , QTDEEMB'
      '     , PRECOVENDA'
      '     , PRECOCUSTO'
      'FROM TABPRODUTO'
      'FOR UPDATE')
    ColorScheme = True
    RefreshAction = raKeepDataPos
    RequestLive = True
    AfterPost = qryProdutoAfterPost
    BeforePost = qryProdutoBeforePost
    Left = 20
    Top = 72
  end
  object dsProduto: TIB_DataSource
    Dataset = qryProduto
    Left = 28
    Top = 12
  end
  object ibTransactionProduto: TIB_Transaction
    IB_Connection = frmdmdPrimcipal.IB_Connection
    Isolation = tiCommitted
    Left = 112
    Top = 8
  end
end
