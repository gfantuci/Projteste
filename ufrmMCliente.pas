unit ufrmMCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmGenericIBODataForm, ComCtrls, StdCtrls, Grids, IB_Grid,
  IB_NavigationBar, uSVIB_NavigationBar, IB_UpdateBar, uSVIB_UpdateBar,
  IB_DatasetBar, IB_SearchBar, ExtCtrls, Mask, IB_Controls, IB_Components;

type
  TfrmmEmpresa = class(TfrmGenericIBODataForm)
    dsEmpresa: TIB_DataSource;
    qryEmpresa: TIB_Query;
    IB_Edit1: TIB_Edit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmEmpresa: TfrmmEmpresa;

implementation

uses dmdPrincipal;

{$R *.dfm}

end.
