unit ufrmMProdutoPedidoDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmGenericDataFormDet, ActnList, StdCtrls, Buttons, ExtCtrls,
  Mask, IB_Controls, IB_Components;

type
  TfrmMProdutoPedidoDet = class(TfrmGenericDataFormDet)
    edtCodigo1: TIB_Edit;
    edtCodigo2: TIB_Edit;
    edtUnitario: TIB_Edit;
    edtQuantidade: TIB_Edit;
    edtDesconto: TIB_Edit;
    edtTotal: TIB_Edit;
    edtFinal: TIB_Edit;
    edtPedido: TIB_Edit;
    EdtCliente: TIB_Edit;
    lbl1: TLabel;
    Label1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtUnitarioExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure edtTotalExit(Sender: TObject);
  private
    { Private declarations }
    procedure CalcularValores;

    protected
      procedure ConfirmeForm; override;
      procedure CancelForm; override;
      procedure SetTipoForm(Value: Integer); override;
  public
    { Public declarations }
    pCodigoPedido: String;
  end;

var
  frmMProdutoPedidoDet: TfrmMProdutoPedidoDet;

implementation

uses
  UdmdPedido;

{$R *.dfm}

procedure TfrmMProdutoPedidoDet.CalcularValores;
Var
  vUnit, vQtde, vDesc, vTot, vFinal: Currency;
begin
  vUnit := 0;
  vQtde := 0;
  vDesc := 0;
  vTot  := 0;
  vFinal:= 0;

  vUnit := StrToCurrDef(edtUnitario.Text, 0);
  vQtde := StrToCurrDef(edtQuantidade.Text, 0);
  vDesc := StrToCurrDef(edtDesconto.Text, 0);
  vTot  := StrToCurrDef(edtTotal.Text, 0);
  vFinal:= StrToCurrDef(edtFinal.Text, 0);

  vTot := (vUnit * vQtde);
  vFinal := vTot - vDesc;

  edtTotal.Text := CurrToStr(vTot);
  edtFinal.Text := CurrToStr(vFinal);
end;

procedure TfrmMProdutoPedidoDet.CancelForm;
begin
  inherited;

  edtPedido.Text := pCodigoPedido;

  with fdmdPedido do
    begin
      if (qryProdPedidoDet.State in [dssEdit, dssSearch, dssInsert]) then
        qryProdPedidoDet.Cancel;

      IBTransaction.Rollback;
      // caso seja por pesquisa
      if (TipoForm = 3) then
      begin
        TipoFilter := 0;
        TipoFilter := 1;
      end
      else
        begin
          qryProdPedidoDet.InvalidateSQL;
          qryProdPedidoDet.RefreshAll;
        end;
    end;
end;

procedure TfrmMProdutoPedidoDet.ConfirmeForm;
begin
  inherited;

  edtPedido.Text := pCodigoPedido;

  with fdmdPedido do
    begin
      if (TipoForm in [1,2]) then
        begin
          // tratar inserção e edição
          if (qryProdPedidoDet.State in [dssEdit, dssInsert]) then
            qryProdPedidoDet.Post;

          try
            if (IBTransaction.TransactionIsActive) then
              IBTransaction.CommitRetaining;
          except
            on E: Exception do
              begin
                IBTransaction.RollbackRetaining;
                ShowMessage(e.Message);
              end;
          end;

          qryProdPedidoDet.RefreshAll;
          qryProdPedidoDet.InvalidateRowNum(qryProdPedidoDet.RowNum);
        end
      else
        if ((TipoForm = 3) and (qryProdPedidoDet.State = dssSearch)) then
          begin
            // tratar pesquisa
            TipoForm := 0;
            qryProdPedidoDet.First;
          end
        else
          if (TipoForm = 4) then
          begin
            // tratar exclusão
            try
              qryProdPedidoDet.Delete;
              IBTransaction.CommitRetaining;
            EXCEPT
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
              qryProdPedidoDet.InvalidateSQL;
              qryProdPedidoDet.RefreshAll;
            end;

        ModalResult := mrOk;
    end;
end;

procedure TfrmMProdutoPedidoDet.FormCreate(Sender: TObject);
begin
  inherited;

  fdmdPedido.OpenLookup;
end;

procedure TfrmMProdutoPedidoDet.FormShow(Sender: TObject);
begin
  inherited;

  if (TipoForm = 1) then
    fdmdPedido.qryProdPedidoDet.Insert;
  if (TipoForm = 2) then
    fdmdPedido.qryProdPedidoDet.Edit;
  if (TipoForm = 3) then
    fdmdPedido.qryProdPedidoDet.Search;
  //if (TipoForm = 4) then
  //  fdmdPedido.qryProdPedidoDet.Delete;
end;

procedure TfrmMProdutoPedidoDet.SetTipoForm(Value: Integer);
begin
  inherited;

end;

procedure TfrmMProdutoPedidoDet.edtUnitarioExit(Sender: TObject);
begin
  inherited;

  CalcularValores;
end;

procedure TfrmMProdutoPedidoDet.edtQuantidadeExit(Sender: TObject);
begin
  inherited;

  CalcularValores;
end;

procedure TfrmMProdutoPedidoDet.edtDescontoExit(Sender: TObject);
begin
  inherited;

  CalcularValores;
end;

procedure TfrmMProdutoPedidoDet.edtTotalExit(Sender: TObject);
begin
  inherited;

  CalcularValores;
end;

end.
