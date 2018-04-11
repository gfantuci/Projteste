object fdmdPedido: TfdmdPedido
  OldCreateOrder = False
  Left = 537
  Top = 236
  Height = 212
  Width = 326
  object qryPedido: TIB_Query
    DatabaseName = 'localhost:C:\DEV\Dados\DADOS.FDB'
    FieldsReadOnly.Strings = (
      'CODIGO=NOEDIT;NOINSERT')
    IB_Connection = frmdmdPrimcipal.IB_Connection
    IB_Transaction = IBTransaction
    SQL.Strings = (
      'SELECT CODIGO'
      '     , DESCRICAO'
      '     , CLIENTE'
      
        '     , (SELECT NOME FROM TABCLIENTE WHERE TABCLIENTE.CODIGO = TA' +
        'BPEDIDO.CLIENTE) AS NOME_CLIENTE'
      '     , VENDEDOR'
      
        '     , (SELECT NOME FROM TABVENDEDOR WHERE TABVENDEDOR.CODIGO = ' +
        'TABPEDIDO.VENDEDOR) AS NOME_VENDEDOR'
      '     , VALORTOTAL'
      '     , DESCONTO'
      '     , ACRESCIMO'
      '     , VALORFINAL'
      '     , CONCLUIDO'
      'FROM TABPEDIDO'
      'FOR UPDATE')
    ColorScheme = True
    KeyLinks.Strings = (
      'TABPEDIDO.CODIGO')
    RefreshAction = raKeepDataPos
    RequestLive = True
    AfterPost = qryPedidoAfterPost
    BeforePost = qryPedidoBeforePost
    Left = 140
    Top = 6
  end
  object dsPedido: TIB_DataSource
    Dataset = qryPedido
    Left = 28
    Top = 9
  end
  object IBTransaction: TIB_Transaction
    IB_Connection = frmdmdPrimcipal.IB_Connection
    Isolation = tiCommitted
    Left = 84
    Top = 4
  end
  object dsItens: TIB_DataSource
    Dataset = qryItens
    Left = 24
    Top = 65
  end
  object qryItens: TIB_Query
    DatabaseName = 'localhost:C:\DEV\Dados\DADOS.FDB'
    FieldsReadOnly.Strings = (
      'CODIGO=NOEDIT;NOINSERT')
    IB_Connection = frmdmdPrimcipal.IB_Connection
    IB_Transaction = IBTransaction
    SQL.Strings = (
      'SELECT CODIGO'
      '     , PRODUTO'
      
        '     , (SELECT NOME FROM TABPRODUTO WHERE TABPRODUTO.CODIGO = TA' +
        'BPRODUTOPEDIDO.PRODUTO) AS DESCRICAO'
      '     , VALORUNITARIO AS UNITARIO'
      '     , QUANTIDADE'
      '     , DESCONTO'
      '     , VALORTOTAL AS TOTAL'
      '     , VALORFINAL AS FINAL'
      '     , PEDIDO'
      'FROM TABPRODUTOPEDIDO'
      'FOR UPDATE')
    ColorScheme = True
    KeyLinks.Strings = (
      'TABPRODUTOPEDIDO.CODIGO')
    MasterSource = dsPedido
    MasterLinks.Strings = (
      'TABPRODUTOPEDIDO.PEDIDO = TABPEDIDO.CODIGO')
    RefreshAction = raKeepDataPos
    RequestLive = True
    AfterPost = qryItensAfterPost
    BeforePost = qryItensBeforePost
    Left = 76
    Top = 62
    ParamValues = (
      '"MLNK_PEDIDO _0"=')
  end
  object dsProdPedidoDet: TIB_DataSource
    Dataset = qryProdPedidoDet
    Left = 36
    Top = 117
  end
  object qryProdPedidoDet: TIB_Query
    DatabaseName = 'localhost:C:\DEV\Dados\DADOS.FDB'
    FieldsReadOnly.Strings = (
      'CODIGO=NOEDIT;NOINSERT')
    IB_Connection = frmdmdPrimcipal.IB_Connection
    IB_Transaction = IBTransaction
    SQL.Strings = (
      'SELECT CODIGO'
      '     , PRODUTO'
      
        '     , (SELECT NOME FROM TABPRODUTO WHERE TABPRODUTO.CODIGO = TA' +
        'BPRODUTOPEDIDO.PRODUTO) AS DESCRICAO'
      '     , VALORUNITARIO AS UNITARIO'
      '     , QUANTIDADE'
      '     , DESCONTO'
      '     , VALORTOTAL AS TOTAL'
      '     , VALORFINAL AS FINAL'
      '     , PEDIDO'
      'FROM TABPRODUTOPEDIDO'
      'FOR UPDATE')
    ColorScheme = True
    KeyLinks.Strings = (
      'TABPRODUTOPEDIDO.CODIGO')
    MasterSource = dsItens
    MasterLinks.Strings = (
      'TABPRODUTOPEDIDO.CODIGO=TABPRODUTOPEDIDO.CODIGO')
    RefreshAction = raKeepDataPos
    RequestLive = True
    AfterPost = qryProdPedidoDetAfterPost
    BeforePost = qryProdPedidoDetBeforePost
    Left = 96
    Top = 114
    ParamValues = (
      'MLNK_CODIGO_0=00000000')
  end
end
