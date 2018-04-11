inherited frmMClienteGrid: TfrmMClienteGrid
  Left = 314
  Top = 128
  Caption = 'frmMClienteGrid'
  Font.Name = 'frmMClienteGrid'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  inherited dbGridRecord: TIB_Grid
    DataSource = dmdCliente.dsCliente
    OnDblClick = dbGridRecordDblClick
  end
  inherited Panel1: TPanel
    inherited cbFilter: TComboBox
      Height = 22
      ItemHeight = 14
    end
    inherited btnSearch: TBitBtn
      Top = 7
    end
  end
  inherited actListGrid: TActionList
    Left = 110
    Top = 275
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
