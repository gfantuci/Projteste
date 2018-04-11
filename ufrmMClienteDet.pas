unit ufrmMClienteDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmGenericDataFormDet, ActnList, StdCtrls, Buttons, ExtCtrls,
  Mask, IB_Controls, ComCtrls, IB_Components,Grids, IB_Grid;

type
  TfrmMClienteDet = class(TfrmGenericDataFormDet)
    IB_Edit1: TIB_Edit;
    IB_Edit2: TIB_Edit;
    IB_Edit3: TIB_Edit;
    IB_Edit4: TIB_Edit;
    IB_Edit5: TIB_Edit;
    IB_Edit6: TIB_Edit;
    IB_Edit7: TIB_Edit;
    IB_Edit8: TIB_Edit;
    IB_Edit9: TIB_Edit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

  protected
    procedure ConfirmeForm; override;
    procedure CancelForm; override;
    procedure SetTipoForm(Value: Integer); override;


  public
    { Public declarations }
  end;

var
  frmMClienteDet: TfrmMClienteDet;

implementation

uses udmdCliente;

{$R *.dfm}

{ TfrmMClienteDet }

procedure TfrmMClienteDet.CancelForm;
begin
  inherited;

  with dmdCliente do
    begin
      if (qryCliente.State in [dssEdit, dssSearch, dssInsert]) then
        qryCliente.Cancel;

      IB_TransactionCliente.Rollback;
      // caso seja por pesquisa
      if (TipoForm = 3) then
      begin
        TipoFilter := 0;
        TipoFilter := 1;
      end
      else begin
        qryCliente.InvalidateSQL;
        qryCliente.RefreshAll;
      end;
    end;

end;

procedure TfrmMClienteDet.ConfirmeForm;
begin
  inherited;

  with dmdCliente do
  begin
    if (TipoForm in [1, 2]) then
    begin
          // tratar inserção e edição
      if (qryCliente.State in [dssEdit, dssInsert]) then
        qryCliente.Post;

      try
        if (IB_TransactionCliente.TransactionIsActive) then
          IB_TransactionCliente.CommitRetaining;
      except
        on E: Exception do
        begin
          IB_TransactionCliente.RollbackRetaining;
          ShowMessage(e.Message);
        end;
      end;

      qryCliente.RefreshAll;
      qryCliente.InvalidateRowNum(qryCliente.RowNum);
    end
    else if ((TipoForm = 3) and (qryCliente.State = dssSearch)) then
    begin
            // tratar pesquisa
      TipoForm := 0;
      qryCliente.First;
    end
    else if (TipoForm = 4) then
    begin
              // tratar exclusão
      try
        qryCliente.Delete;
        IB_TransactionCliente.CommitRetaining;
      except
        on E: Exception do
        begin
          ShowMessage('Erro ao tentar excluir registro!' + #13 + e.Message);
          exit;
        end;
      end;
    end
    else
    begin
              // atualizar lista inf.
      qryCliente.InvalidateSQL;
      qryCliente.RefreshAll;
    end;

    ModalResult := mrOk;
  end;
end;

procedure TfrmMClienteDet.SetTipoForm(Value: Integer);
begin
  inherited;

end;

procedure TfrmMClienteDet.FormCreate(Sender: TObject);
begin
  inherited;
  dmdCliente.OpenLookup;

end;

procedure TfrmMClienteDet.FormShow(Sender: TObject);
begin
  inherited;

  if (TipoForm = 1) then
    dmdCliente.qryCliente.Insert;
  if (TipoForm = 3) then
    dmdCliente.qryCliente.Search;
end;

end.
