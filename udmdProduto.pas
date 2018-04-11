unit udmdProduto;

interface

uses
  SysUtils, Classes, IB_Components;

type
  TfrmdmdProduto = class(TDataModule)
    qryProduto: TIB_Query;
    dsProduto: TIB_DataSource;
    ibTransactionProduto: TIB_Transaction;
    procedure qryProdutoAfterPost(IB_Dataset: TIB_Dataset);
    procedure qryProdutoBeforePost(IB_Dataset: TIB_Dataset);
    procedure DataModuleCreate(Sender: TObject);
    procedure OpenLookup;
    procedure AtualizaLookup;
  private
    { Private declarations }
    FTipoFilter: Integer;
    procedure SetFilter(const Value: Integer);
  public
    { Public declarations }
    property TipoFilter: Integer read FTipoFilter write SetFilter;
  end;

var
  frmdmdProduto: TfrmdmdProduto;

implementation

uses
  dmdPrincipal;

{$R *.dfm}

procedure TfrmdmdProduto.qryProdutoAfterPost(IB_Dataset: TIB_Dataset);
begin
  ibTransactionProduto.CommitRetaining;
end;

procedure TfrmdmdProduto.qryProdutoBeforePost(IB_Dataset: TIB_Dataset);
begin
  if (qryProduto.FieldByName('CODIGO').IsNull) then
    qryProduto.FieldByName('CODIGO').AsInteger := qryProduto.Gen_ID('GENPRODUTO', 1);
end;

procedure TfrmdmdProduto.DataModuleCreate(Sender: TObject);
begin
  ibTransactionProduto.StartTransaction;
end;

procedure TfrmdmdProduto.AtualizaLookup;
begin
  qryProduto.Refresh;
end;

procedure TfrmdmdProduto.OpenLookup;
begin
  qryProduto.Open;
end;

procedure TfrmdmdProduto.SetFilter(const Value: Integer);
begin
  FTipoFilter := Value;

  if (Value > 0) then
  begin
    if (not qryProduto.Active) then
      qryProduto.Open;

    qryProduto.ClearSearch;
    qryProduto.InvalidateSQL;
    qryProduto.RefreshAll;
    qryProduto.First;
  end
  else if (Value = 0) then
  begin
    if (qryProduto.Active) then
      qryProduto.Close;
    qryProduto.InvalidateSQL;
  end;
end;

end.
