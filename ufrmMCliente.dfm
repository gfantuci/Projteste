inherited frmmEmpresa: TfrmmEmpresa
  Left = 779
  Top = 277
  Caption = 'Cadastro da Empresa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PagControlDados: TPageControl
    inherited TabForm: TTabSheet
      object IB_Edit1: TIB_Edit
        Left = 60
        Top = 12
        Width = 121
        Height = 21
        TabOrder = 0
      end
    end
  end
  object dsEmpresa: TIB_DataSource
    Dataset = qryEmpresa
    Left = 96
    Top = 240
  end
  object qryEmpresa: TIB_Query
    DatabaseName = 'localhost:C:\DEV\Dados\DADOS.FDB'
    IB_Connection = frmdmdPrimcipal.IB_Connection
    Left = 152
    Top = 240
  end
end
