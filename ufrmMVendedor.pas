unit ufrmMVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmGenericIBODataForm, ComCtrls, StdCtrls, Grids, IB_Grid,
  IB_NavigationBar, uSVIB_NavigationBar, IB_UpdateBar, uSVIB_UpdateBar,
  IB_DatasetBar, IB_SearchBar, ExtCtrls, Mask, IB_Controls, IB_Components;

type
  TfrmMVendedor = class(TfrmGenericIBODataForm)
    dsVendedor: TIB_DataSource;
    qryVendedor: TIB_Query;
    IB_Edit1: TIB_Edit;
    IB_Edit2: TIB_Edit;
    IB_Edit3: TIB_Edit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryVendedorBeforePost(IB_Dataset: TIB_Dataset);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMVendedor: TfrmMVendedor;

implementation

uses dmdPrincipal;

{$R *.dfm}

procedure TfrmMVendedor.FormShow(Sender: TObject);
begin
  inherited;
  qryVendedor.Close;
  qryVendedor.Open;
end;

procedure TfrmMVendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryVendedor.Close;
end;

procedure TfrmMVendedor.qryVendedorBeforePost(IB_Dataset: TIB_Dataset);
begin
  inherited;
  if (qryVendedor.FieldByName('CODIGO').AsString = '') then
      qryVendedor.fieldbyname('CODIGO').AsInteger := qryVendedor.Gen_ID('GENVENDEDOR', 1);
end;

end.
