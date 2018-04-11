unit ufrmMPedidoDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmGenericDataFormDet, ActnList, StdCtrls, Buttons, ExtCtrls,
  Mask, IB_Controls, IB_Components, Grids, IB_Grid;

type
  TfrmMPedidoDet = class(TfrmGenericDataFormDet)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    edtCodigo: TIB_Edit;
    EdtCliente: TIB_Edit;
    edtNomeCliente: TIB_Edit;
    EdtVendedor: TIB_Edit;
    EdtNomeVendedor: TIB_Edit;
    EdtConcluido: TIB_Edit;
    edtCodigoTPDESCONTO: TIB_Edit;
    EdtValorTotal: TIB_Edit;
    EdtValorFinal: TIB_Edit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    IB_Grid1: TIB_Grid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure IB_Grid1DblClick(Sender: TObject);
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
  frmMPedidoDet: TfrmMPedidoDet;

implementation

uses
  UdmdPedido, ufrmMProdutoPedidoDet;

{$R *.dfm}

procedure TfrmMPedidoDet.FormShow(Sender: TObject);
begin
  inherited;

  if (TipoForm = 1) then
    fdmdPedido.qryPedido.Insert;
  if (TipoForm = 3) then
    fdmdPedido.qryPedido.Search;
end;

procedure TfrmMPedidoDet.FormCreate(Sender: TObject);
begin
  inherited;

  fdmdPedido.OpenLookup;
end;

procedure TfrmMPedidoDet.CancelForm;
begin
  inherited;

  with fdmdPedido do
  begin
    if (qryPedido.State in [dssEdit, dssSearch, dssInsert]) then
      qryPedido.Cancel;

    IBTransaction.Rollback;
      // caso seja por pesquisa
    if (TipoForm = 3) then
    begin
      TipoFilter := 0;
      TipoFilter := 1;
    end
    else
    begin
      qryPedido.InvalidateSQL;
      qryPedido.RefreshAll;
    end;
  end;
end;

procedure TfrmMPedidoDet.ConfirmeForm;
begin
  inherited;

  with fdmdPedido do
  begin
    if (TipoForm in [1, 2]) then
    begin
          // tratar inserção e edição
      if (qryPedido.State in [dssEdit, dssInsert]) then
        qryPedido.Post;

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

      qryPedido.RefreshAll;
      qryPedido.InvalidateRowNum(qryPedido.RowNum);
    end
    else if ((TipoForm = 3) and (qryPedido.State = dssSearch)) then
    begin
            // tratar pesquisa
      TipoForm := 0;
      qryPedido.First;
    end
    else if (TipoForm = 4) then
    begin
              // tratar exclusão
      try
        qryPedido.Delete;
        IBTransaction.CommitRetaining;
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
      qryPedido.InvalidateSQL;
      qryPedido.RefreshAll;
    end;

    ModalResult := mrOk;
  end;
end;

procedure TfrmMPedidoDet.SetTipoForm(Value: Integer);
begin
  inherited;
end;

procedure TfrmMPedidoDet.Button1Click(Sender: TObject);
begin
  inherited;
  if (fdmdPedido.dsPedido.Dataset.FieldByName('CONCLUIDO').AsString = 'S') then
  begin
    ShowMessage('Esta venda já está concluída!');
    Exit;
  end;

  frmMProdutoPedidoDet := TfrmMProdutoPedidoDet.Create(Self);
  try
    frmMProdutoPedidoDet.TipoForm := 1;
    frmMProdutoPedidoDet.pCodigoPedido := edtCodigo.Text;
    frmMProdutoPedidoDet.ShowModal;
  finally
    frmMProdutoPedidoDet.Free;
    fdmdPedido.qryItens.Refresh;
  end;
end;

procedure TfrmMPedidoDet.Button2Click(Sender: TObject);
begin
  inherited;

  if (fdmdPedido.dsPedido.Dataset.FieldByName('CONCLUIDO').AsString = 'S') then
  begin
    ShowMessage('Esta venda já está concluída!');
    Exit;
  end;
  
  frmMProdutoPedidoDet := TfrmMProdutoPedidoDet.Create(Self);
  try
    frmMProdutoPedidoDet.TipoForm := 2;
    frmMProdutoPedidoDet.pCodigoPedido := edtCodigo.Text;
    frmMProdutoPedidoDet.ShowModal;
  finally
    frmMProdutoPedidoDet.Free;
    fdmdPedido.qryItens.Refresh;
  end;
end;

procedure TfrmMPedidoDet.Button3Click(Sender: TObject);
begin
  inherited;

  if (fdmdPedido.dsPedido.Dataset.FieldByName('CONCLUIDO').AsString = 'S') then
  begin
    ShowMessage('Esta venda já está concluída!');
    Exit;
  end;

  frmMProdutoPedidoDet := TfrmMProdutoPedidoDet.Create(Self);
  try
    frmMProdutoPedidoDet.TipoForm := 4;
    frmMProdutoPedidoDet.pCodigoPedido := edtCodigo.Text;
    frmMProdutoPedidoDet.ShowModal;
  finally
    frmGenericDataFormDet.Free;
    fdmdPedido.qryItens.Refresh;
  end;
end;

procedure TfrmMPedidoDet.IB_Grid1DblClick(Sender: TObject);
begin
  inherited;

  if (fdmdPedido.dsPedido.Dataset.FieldByName('CONCLUIDO').AsString = 'S') then
    Exit;

  frmMProdutoPedidoDet := TfrmMProdutoPedidoDet.Create(Self);
  try
    frmMProdutoPedidoDet.TipoForm := 2;
    frmMProdutoPedidoDet.pCodigoPedido := edtCodigo.Text;
    frmMProdutoPedidoDet.ShowModal;
  finally
    frmMProdutoPedidoDet.Free;
    fdmdPedido.qryItens.Refresh;
  end;
end;

end.
