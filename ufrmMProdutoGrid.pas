unit ufrmMProdutoGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmGenericDataFormGrid, ActnList, Menus, StdCtrls, Buttons,
  ExtCtrls, Grids, IB_Grid;

type
  TfrmMProdutoGrid = class(TfrmGenericDataFormGrid)
    procedure actNewRecordExecute(Sender: TObject);
    procedure actEditRecordExecute(Sender: TObject);
    procedure actSearchRecordExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbGridRecordDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMProdutoGrid: TfrmMProdutoGrid;

implementation

uses
  ufrmMProdutoDet, udmdProduto;

{$R *.dfm}

procedure TfrmMProdutoGrid.actNewRecordExecute(Sender: TObject);
begin
  inherited;

  with TfrmMProdutoDet.Create(Self) do
  begin
    TipoForm := 1;
    ShowModal;
  end;
end;

procedure TfrmMProdutoGrid.actEditRecordExecute(Sender: TObject);
begin
  inherited;

  with TfrmMProdutoDet.Create(Self) do
  begin
    TipoForm := 2;
    ShowModal;
  end;
end;

procedure TfrmMProdutoGrid.actSearchRecordExecute(Sender: TObject);
begin
  inherited;

  with TfrmMProdutoDet.Create(Self) do
  begin
    TipoForm := 3;
    ShowModal;
  end;
end;

procedure TfrmMProdutoGrid.FormCreate(Sender: TObject);
begin
  inherited;

  frmdmdProduto := TfrmdmdProduto.Create(Self);
  frmdmdProduto.qryProduto.Open;

  dbGridRecord.DataSource := frmdmdProduto.dsProduto;
end;

procedure TfrmMProdutoGrid.dbGridRecordDblClick(Sender: TObject);
begin
  inherited;

  with TfrmMProdutoDet.Create(Self) do
  begin
    TipoForm := 2;
    ShowModal;
  end;
end;

procedure TfrmMProdutoGrid.FormShow(Sender: TObject);
begin
  inherited;

  frmdmdProduto.TipoFilter := 1;
end;

end.
