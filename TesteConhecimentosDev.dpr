program TesteConhecimentosDev;

uses
  Vcl.Forms,
  UniProducts in 'UniProducts.pas' {FrmProducts},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  UniSearchClient in 'UniSearchClient.pas' {FrmSearchClient},
  UniSearchProduct in 'UniSearchProduct.pas' {FrmSearchProduct};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmProducts, FrmProducts);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrmSearchClient, FrmSearchClient);
  Application.CreateForm(TFrmSearchProduct, FrmSearchProduct);
  Application.Run;
end.
