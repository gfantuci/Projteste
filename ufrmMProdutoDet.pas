unit ufrmMProdutoDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmGenericDataFormDet, ActnList, StdCtrls, Buttons, ExtCtrls,
  Mask, IB_Controls, IB_Components;

type
  TfrmMProdutoDet = class(TfrmGenericDataFormDet)
    edtCodigo: TIB_Edit;
    edtNome: TIB_Edit;
    edtUnidade: TIB_Edit;
    edtPrecoVenda: TIB_Edit;
    edtPrecoCusto: TIB_Edit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
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
  frmMProdutoDet: TfrmMProdutoDet;

implementation

uses
  udmdProduto, ufrmGenericMsg;

{$R *.dfm}

procedure TfrmMProdutoDet.CancelForm;
begin
  inherited;

  with frmdmdProduto do
    begin
      if (qryProduto.State in [dssEdit, dssSearch, dssInsert]) then
        qryProduto.Cancel;

      ibTransactionProduto.Rollback;
      // caso seja por pesquisa
      if (TipoForm = 3) then
      begin
        TipoFilter := 0;
        TipoFilter := 1;
      end
      else
        begin
          qryProduto.InvalidateSQL;
          qryProduto.RefreshAll;
        end;
    end;
end;

procedure TfrmMProdutoDet.ConfirmeForm;
begin
  inherited;

  with frmdmdProduto do
    begin
      if (TipoForm in [1,2]) then
        begin
          // tratar inserção e edição
          if (qryProduto.State in [dssEdit, dssInsert]) then
            qryProduto.Post;

          try
            if (ibTransactionProduto.TransactionIsActive) then
              ibTransactionProduto.CommitRetaining;
          except
            on E: Exception do
              begin
                ibTransactionProduto.RollbackRetaining;
                GenericMsg(e.Message, mtError);
              end;
          end;

          qryProduto.RefreshAll;
          qryProduto.InvalidateRowNum(qryProduto.RowNum);
        end
      else
        if ((TipoForm = 3) and (qryProduto.State = dssSearch)) then
          begin
            // tratar pesquisa
            TipoForm := 0;
            qryProduto.First;
          end
        else
          if (TipoForm = 4) then
          begin
            // tratar exclusão
            try
              qryProduto.Delete;
              ibTransactionProduto.CommitRetaining;
            EXCEPT
              on E: Exception do
                begin
                  GenericMsg('Erro ao tentar excluir registro!' + #13 + e.Message, mtError);
                  exit;
                end;
            end;
          end
          else
            begin
               // atualizar lista inf.
              qryProduto.InvalidateSQL;
              qryProduto.RefreshAll;
            end;

        ModalResult := mrOk;
    end;
end;

procedure TfrmMProdutoDet.FormCreate(Sender: TObject);
begin
  inherited;

  frmdmdProduto.OpenLookup;
end;

procedure TfrmMProdutoDet.FormShow(Sender: TObject);
begin
  inherited;

  if (TipoForm = 1) then
    frmdmdProduto.qryProduto.Insert;
  if (TipoForm = 3) then
    frmdmdProduto.qryProduto.Search;
end;

procedure TfrmMProdutoDet.SetTipoForm(Value: Integer);
begin
  inherited;

end;

end.
