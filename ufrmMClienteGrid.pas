unit ufrmMClienteGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmGenericDataFormGrid, ActnList, Menus, StdCtrls, Buttons,
  ExtCtrls, Grids, IB_Grid;

type
  TfrmMClienteGrid = class(TfrmGenericDataFormGrid)
    procedure FormCreate(Sender: TObject);
    procedure actNewRecordExecute(Sender: TObject);
    procedure dbGridRecordDblClick(Sender: TObject);
    procedure actEditRecordExecute(Sender: TObject);
    procedure actSearchRecordExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMClienteGrid: TfrmMClienteGrid;

implementation

uses udmdCliente, ufrmMClienteDet;

{$R *.dfm}

procedure TfrmMClienteGrid.FormCreate(Sender: TObject);
begin
  inherited;

  dmdCliente := TdmdCliente.Create(Self);
  dmdCliente.qryCliente.Open;

  dbGridRecord.DataSource := dmdCliente.dsCliente;
end;

procedure TfrmMClienteGrid.actNewRecordExecute(Sender: TObject);
begin
  inherited;
  with TfrmMClienteDet.Create(Self) do
  begin
    TipoForm := 1;
    ShowModal;
	//Teste 3
  end;
end;

procedure TfrmMClienteGrid.dbGridRecordDblClick(Sender: TObject);
begin
  inherited;

  with TfrmMClienteDet.Create(Self) do
  begin
    TipoForm := 2;
    ShowModal;
  end;
end;

procedure TfrmMClienteGrid.actEditRecordExecute(Sender: TObject);
begin
  inherited;

  with TfrmMClienteDet.Create(Self) do
  begin
    TipoForm := 2;
    ShowModal;
  end;

end;

procedure TfrmMClienteGrid.actSearchRecordExecute(Sender: TObject);
begin
  inherited;
  with TfrmMClienteDet.Create(Self) do
  begin
    TipoForm := 3;
    ShowModal;
  end;
end;

end.
