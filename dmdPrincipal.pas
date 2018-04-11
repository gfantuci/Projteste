unit dmdPrincipal;

interface

uses
  SysUtils, Classes, IB_Components;

type
  TfrmdmdPrimcipal = class(TDataModule)
    qryPrincipal: TIB_Query;
    dsPrincipal: TIB_DataSource;
    IB_Connection: TIB_Connection;
    IB_Transaction: TIB_Transaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdmdPrimcipal: TfrmdmdPrimcipal;

implementation

{$R *.dfm}

procedure TfrmdmdPrimcipal.DataModuleCreate(Sender: TObject);
begin
  IB_Connection.Open;
end;

end.
