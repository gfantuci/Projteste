unit ufrmPedidoGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmGenericDataFormGrid, ActnList, Menus, StdCtrls, Buttons,
  ExtCtrls, Grids, IB_Grid;

type
  TfrmPedidoGrid = class(TfrmGenericDataFormGrid)
    procedure actNewRecordExecute(Sender: TObject);
    procedure dbGridRecordDblClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actEditRecordExecute(Sender: TObject);
    procedure actSearchRecordExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidoGrid: TfrmPedidoGrid;

implementation

uses
  UdmdPedido, ufrmMPedidoDet;

{$R *.dfm}

procedure TfrmPedidoGrid.actNewRecordExecute(Sender: TObject);
begin
  inherited;

  with TfrmMPedidoDet.Create(Self) do
  begin
    TipoForm := 1;
    ShowModal;
  end;
end;

procedure TfrmPedidoGrid.dbGridRecordDblClick(Sender: TObject);
begin
  inherited;

  with TfrmMPedidoDet.Create(Self) do
  begin
    TipoForm := 2;
    ShowModal;
  end;
end;

procedure TfrmPedidoGrid.btnEditClick(Sender: TObject);
begin
  inherited;

  with TfrmMPedidoDet.Create(Self) do
  begin
    TipoForm := 2;
    ShowModal;
  end;
end;

procedure TfrmPedidoGrid.btnSearchClick(Sender: TObject);
begin
  inherited;

  with TfrmMPedidoDet.Create(Self) do
  begin
    TipoForm := 3;
    ShowModal;
  end;
end;

procedure TfrmPedidoGrid.FormCreate(Sender: TObject);
begin
  inherited;

  fdmdPedido := TfdmdPedido.Create(Self);
  fdmdPedido.qryPedido.Open;

  dbGridRecord.DataSource := fdmdPedido.dsPedido;
end;

procedure TfrmPedidoGrid.actEditRecordExecute(Sender: TObject);
begin
  inherited;

  with TfrmMPedidoDet.Create(Self) do
  begin
    TipoForm := 2;
    ShowModal;
  end;
end;

procedure TfrmPedidoGrid.actSearchRecordExecute(Sender: TObject);
begin
  inherited;

  with TfrmMPedidoDet.Create(Self) do
  begin
    TipoForm := 3;
    ShowModal;
  end;
end;

end.
