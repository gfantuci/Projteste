object frmdmdPrimcipal: TfrmdmdPrimcipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 534
  Top = 188
  Height = 338
  Width = 455
  object qryPrincipal: TIB_Query
    DatabaseName = 'localhost:C:\DEV\Dados\DADOS.FDB'
    IB_Connection = IB_Connection
    Left = 64
    Top = 152
  end
  object dsPrincipal: TIB_DataSource
    Dataset = qryPrincipal
    Left = 68
    Top = 216
  end
  object IB_Connection: TIB_Connection
    DefaultTransaction = IB_Transaction
    SQLDialect = 3
    Params.Strings = (
      'CHARACTER SET=WIN1252'
      'SQL DIALECT=3'
      'PAGE SIZE=4096'
      'PATH=C:\DEV\Dados\DADOS.FDB'
      'SERVER=localhost'
      'PASSWORD=masterkey'
      'USER NAME=SYSDBA'
      'PROTOCOL=TCP/IP'
      'FORCED WRITES=TRUE'
      'RESERVE PAGE SPACE=TRUE')
    Left = 56
    Top = 32
  end
  object IB_Transaction: TIB_Transaction
    IB_Connection = IB_Connection
    Isolation = tiCommitted
    Left = 60
    Top = 92
  end
end
