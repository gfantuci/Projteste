unit udmdCliente;

interface

uses
  SysUtils, Classes, IB_Components;

type
  TdmdCliente = class(TDataModule)
    dsCliente: TIB_DataSource;
    qryCliente: TIB_Query;
    IB_TransactionCliente: TIB_Transaction;
    procedure qryClienteBeforePost(IB_Dataset: TIB_Dataset);
    procedure DataModuleCreate(Sender: TObject);
    procedure OpenLookup;
    procedure AtualizaLookup;
    procedure qryClienteAfterPost(IB_Dataset: TIB_Dataset);
  private
    { Private declarations }
    FTipoFilter: Integer;

    procedure SetFilter(const Value: Integer);
  public
    { Public declarations }
    property TipoFilter: Integer read FTipoFilter write SetFilter;
  end;

var
  dmdCliente: TdmdCliente;

implementation

uses dmdPrincipal;

{$R *.dfm}

procedure TdmdCliente.qryClienteBeforePost(IB_Dataset: TIB_Dataset);
begin
  if ((qryCliente.FieldByName('CODIGO').IsNull) or(qryCliente.FieldByName('CODIGO').AsInteger < 0)) then
    qryCliente.FieldByName('CODIGO').AsInteger := qryCliente.Gen_ID('GENCLIENTE', 1);
end;

procedure TdmdCliente.SetFilter(const Value: Integer);
begin
  FTipoFilter := Value;

  if (Value > 0) then
  begin
    if (not qryCliente.Active) then
      qryCliente.Open;

    qryCliente.ClearSearch;
    qryCliente.InvalidateSQL;
    qryCliente.RefreshAll;
    qryCliente.First;
  end
  else if (Value = 0) then
  begin
    if (qryCliente.Active) then
      qryCliente.Close;
    qryCliente.InvalidateSQL;
  end;
end;

procedure TdmdCliente.DataModuleCreate(Sender: TObject);
begin
  IB_TransactionCliente.StartTransaction;
end;

procedure TdmdCliente.AtualizaLookup;
begin
  qryCliente.Refresh;
end;

procedure TdmdCliente.OpenLookup;
begin
  qryCliente.Open;
end;

procedure TdmdCliente.qryClienteAfterPost(IB_Dataset: TIB_Dataset);
begin
  IB_TransactionCliente.CommitRetaining;
end;

end.
