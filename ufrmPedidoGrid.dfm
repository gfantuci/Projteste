inherited frmPedidoGrid: TfrmPedidoGrid
  Left = 345
  Top = 169
  Caption = 'Vendas'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbGridRecord: TIB_Grid
    DataSource = fdmdPedido.dsPedido
    OnDblClick = dbGridRecordDblClick
  end
  inherited actListGrid: TActionList
    inherited actNewRecord: TAction
      OnExecute = actNewRecordExecute
    end
    inherited actEditRecord: TAction
      OnExecute = actEditRecordExecute
    end
    inherited actSearchRecord: TAction
      OnExecute = actSearchRecordExecute
    end
  end
end
