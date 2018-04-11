object dmdCliente: TdmdCliente
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 823
  Top = 269
  Height = 169
  Width = 254
  object dsCliente: TIB_DataSource
    Dataset = qryCliente
    Left = 28
    Top = 12
  end
  object qryCliente: TIB_Query
    DatabaseName = 'localhost:C:\DEV\Dados\DADOS.FDB'
    FieldsReadOnly.Strings = (
      'CODIGO=NOEDIT;NOINSERT')
    IB_Connection = frmdmdPrimcipal.IB_Connection
    IB_Transaction = IB_TransactionCliente
    SQL.Strings = (
      'SELECT CODIGO'
      '     , NOME'
      '     , ENDERECO'
      '     , NUMERO'
      '     , BAIRRO'
      '     , CIDADE'
      '     , UF'
      '     , PESSOA'
      '     , RG_IE'
      '     , CPF_CNPJ'
      'FROM TABCLIENTE'
      'FOR UPDATE')
    ColorScheme = True
    RefreshAction = raKeepDataPos
    RequestLive = True
    AfterPost = qryClienteAfterPost
    BeforePost = qryClienteBeforePost
    Left = 24
    Top = 76
  end
  object IB_TransactionCliente: TIB_Transaction
    IB_Connection = frmdmdPrimcipal.IB_Connection
    Isolation = tiCommitted
    Left = 116
    Top = 20
  end
end
