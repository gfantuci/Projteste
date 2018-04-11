unit UdmdPedido;

interface

uses
  SysUtils, Classes, IB_Components;

type
  TfdmdPedido = class(TDataModule)
    qryPedido: TIB_Query;
    dsPedido: TIB_DataSource;
    IBTransaction: TIB_Transaction;
    dsItens: TIB_DataSource;
    qryItens: TIB_Query;
    dsProdPedidoDet: TIB_DataSource;
    qryProdPedidoDet: TIB_Query;
    procedure qryPedidoBeforePost(IB_Dataset: TIB_Dataset);
    procedure qryPedidoAfterPost(IB_Dataset: TIB_Dataset);
    procedure DataModuleCreate(Sender: TObject);
    procedure OpenLookup;
    procedure AtualizaLookup;
    procedure qryItensAfterPost(IB_Dataset: TIB_Dataset);
    procedure qryItensBeforePost(IB_Dataset: TIB_Dataset);
    procedure qryProdPedidoDetAfterPost(IB_Dataset: TIB_Dataset);
    procedure qryProdPedidoDetBeforePost(IB_Dataset: TIB_Dataset);
  private
    { Private declarations }
    FTipoFilter: Integer;

    procedure SetFilter(const Value: Integer);
    procedure CalcularCampos;

  public
    { Public declarations }
    property TipoFilter: Integer read FTipoFilter write SetFilter;
  end;

var
  fdmdPedido: TfdmdPedido;

implementation

uses
  dmdPrincipal;

{$R *.dfm}

procedure TfdmdPedido.qryPedidoBeforePost(IB_Dataset: TIB_Dataset);
begin
  if (qryPedido.FieldByName('CODIGO').IsNull) then
    qryPedido.FieldByName('CODIGO').AsInteger := qryPedido.Gen_ID('GENPEDIDO', 1);
end;

procedure TfdmdPedido.qryPedidoAfterPost(IB_Dataset: TIB_Dataset);
begin
  IBTransaction.CommitRetaining;
end;

procedure TfdmdPedido.SetFilter(const Value: Integer);
begin
  FTipoFilter := Value;

  if (Value > 0) then
  begin
    if (not qryPedido.Active) then
      qryPedido.Open;

    qryPedido.ClearSearch;
    qryPedido.InvalidateSQL;
    qryPedido.RefreshAll;
    qryPedido.First;
  end
  else if (Value = 0) then
  begin
    if (qryPedido.Active) then
      qryPedido.Close;
    qryPedido.InvalidateSQL;
  end;
end;

procedure TfdmdPedido.AtualizaLookup;
begin
  qryPedido.Refresh;
  qryItens.Refresh;
  qryProdPedidoDet.Refresh;
end;

procedure TfdmdPedido.OpenLookup;
begin
  qryPedido.Open;
  qryItens.Open;
  qryProdPedidoDet.Open;
end;

procedure TfdmdPedido.DataModuleCreate(Sender: TObject);
begin
  IBTransaction.StartTransaction;
end;

procedure TfdmdPedido.qryItensAfterPost(IB_Dataset: TIB_Dataset);
begin
   IBTransaction.CommitRetaining;
end;

procedure TfdmdPedido.qryItensBeforePost(IB_Dataset: TIB_Dataset);
begin
  if (qryItens.FieldByName('CODIGO').IsNull) then
    qryItens.FieldByName('CODIGO').AsInteger := qryItens.Gen_ID('GENPEDIDO', 1);
end;

procedure TfdmdPedido.qryProdPedidoDetAfterPost(IB_Dataset: TIB_Dataset);
begin
  IBTransaction.CommitRetaining;
end;

procedure TfdmdPedido.qryProdPedidoDetBeforePost(IB_Dataset: TIB_Dataset);
begin
  if (qryProdPedidoDet.FieldByName('CODIGO').IsNull) then
    qryProdPedidoDet.FieldByName('CODIGO').AsInteger := qryProdPedidoDet.Gen_ID('GENPRODUTOPEDIDO', 1);
end;

procedure TfdmdPedido.CalcularCampos;
var
  vUnit, vQtde, vDesc, vTot, vFinal: Currency;
begin
  vUnit := 0;
  vQtde := 0;
  vDesc := 0;
  vTot  := 0;
  vFinal:= 0;

  with qryProdPedidoDet do
  begin
    (*vUnit := StrToCurrDef(edtUnitario.Text, 0);
    vQtde := StrToCurrDef(edtQuantidade.Text, 0);
    vDesc := StrToCurrDef(edtDesconto.Text, 0);
    vTot  := StrToCurrDef(edtTotal.Text, 0);
    vFinal:= StrToCurrDef(edtFinal.Text, 0);

    vTot := (vUnit * vQtde);
    vFinal := vTot - vDesc;

    edtTotal.Text := CurrToStr(vTot);
    edtFinal.Text := CurrToStr(vFinal);*)
  end;
end;

end.
