unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Vendedor1: TMenuItem;
    Cliente1: TMenuItem;
    Produtos1: TMenuItem;
    Vendas1: TMenuItem;
    Pedido1: TMenuItem;
    procedure Vendedor1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Pedido1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ufrmMVendedor, dmdPrincipal, ufrmMClienteGrid, ufrmMProdutoGrid, ufrmPedidoGrid;

{$R *.dfm}

procedure TForm1.Vendedor1Click(Sender: TObject);
begin
  with TfrmMVendedor.Create(Self) do
    ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  with TfrmdmdPrimcipal.Create(Self) do
   ShowModal;
  //Teste
end;

procedure TForm1.Cliente1Click(Sender: TObject);
begin
  with TfrmMClienteGrid.Create(Self) do
    ShowModal;
end;

procedure TForm1.Produtos1Click(Sender: TObject);
begin
  with TfrmMProdutoGrid.Create(Self) do
  ShowModal;
end;

procedure TForm1.Pedido1Click(Sender: TObject);
begin
  with TfrmPedidoGrid.Create(Self) do
    ShowModal;
end;

end.
