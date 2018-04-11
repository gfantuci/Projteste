inherited frmMProdutoGrid: TfrmMProdutoGrid
  Left = 302
  Top = 239
  Caption = 'frmMProdutoGrid'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbGridRecord: TIB_Grid
    OnDblClick = dbGridRecordDblClick
  end
  inherited actListGrid: TActionList
    Left = 70
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
