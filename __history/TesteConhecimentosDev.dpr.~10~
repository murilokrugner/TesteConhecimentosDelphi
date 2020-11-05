program TesteConhecimentosDev;

uses
  Vcl.Forms,
  UniProducts in 'UniProducts.pas' {FrmProducts},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  UniSearchClient in 'UniSearchClient.pas' {FrmSearchClient},
  UniSearchProduct in 'UniSearchProduct.pas' {FrmSearchProduct},
  UniLocOrder in 'UniLocOrder.pas' {FrmLocOrder},
  uClientes in 'uClientes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmProducts, FrmProducts);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrmSearchClient, FrmSearchClient);
  Application.CreateForm(TFrmSearchProduct, FrmSearchProduct);
  Application.CreateForm(TFrmLocOrder, FrmLocOrder);
  Application.Run;
end.
