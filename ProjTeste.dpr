program ProjTeste;



uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  dmdPrincipal in 'dmdPrincipal.pas' {frmdmdPrimcipal: TDataModule},
  ufrmGenericIBODataForm in 'F:\Dsv\Delphi\Lib\Softgran\Forms\ufrmGenericIBODataForm.pas' {frmGenericIBODataForm},
  ufrmMVendedor in 'ufrmMVendedor.pas' {frmMVendedor},
  ufrmGenericDataFormDet in 'F:\Dsv\Delphi\Lib\Softgran\Forms\ufrmGenericDataFormDet.pas' {frmGenericDataFormDet},
  ufrmGenericDataFormGrid in 'F:\Dsv\Delphi\Lib\Softgran\Forms\ufrmGenericDataFormGrid.pas' {frmGenericDataFormGrid},
  udmdCliente in 'udmdCliente.pas' {dmdCliente: TDataModule},
  ufrmMClienteDet in 'ufrmMClienteDet.pas' {frmMClienteDet},
  ufrmMClienteGrid in 'ufrmMClienteGrid.pas' {frmMClienteGrid},
  ufrmGenericMsg in 'F:\Dsv\Delphi\Lib\Softgran\Forms\ufrmGenericMsg.pas' {frmGenericMsg},
  ufrmMCliente in 'ufrmMCliente.pas' {frmmEmpresa},
  udmdProduto in 'udmdProduto.pas' {frmdmdProduto: TDataModule},
  ufrmMProdutoGrid in 'ufrmMProdutoGrid.pas' {frmMProdutoGrid},
  ufrmMProdutoDet in 'ufrmMProdutoDet.pas' {frmMProdutoDet},
  ufrmMPedidoDet in 'ufrmMPedidoDet.pas' {frmMPedidoDet},
  ufrmPedidoGrid in 'ufrmPedidoGrid.pas' {frmPedidoGrid},
  UdmdPedido in 'UdmdPedido.pas' {fdmdPedido: TDataModule},
  ufrmMProdutoPedidoDet in 'ufrmMProdutoPedidoDet.pas' {frmMProdutoPedidoDet};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmdmdPrimcipal, frmdmdPrimcipal);
  Application.Run;
end.
