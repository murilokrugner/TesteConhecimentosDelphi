unit UniSearchProduct;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
    Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
    FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
    FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
    TFrmSearchProduct = class(TForm)
        Panel1: TPanel;
        Label1: TLabel;
        EditCod: TEdit;
    DBGridProducts: TDBGrid;
        btnSearch: TButton;
        QryProdutos: TFDQuery;
        dsProducts: TDataSource;
        procedure btnSearchClick(Sender: TObject);
    procedure DBGridProductsDblClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    FrmSearchProduct: TFrmSearchProduct;

implementation

uses
    DataModule, UniProducts;

{$R *.dfm}

procedure TFrmSearchProduct.btnSearchClick(Sender: TObject);
begin
    if EditCod.Text = '' then
    begin
        ShowMessage('Por favor, informe o c�digo do Produto');
        Exit;
    end;

    with QryProdutos, SQL do
    begin
        Close;
        Clear;

        Add('SELECT * FROM PRODUTOS WHERE CODIGO = :CODIGO');

        ParamByName('CODIGO').AsInteger := StrToInt(EditCod.Text);

        Open;

        if IsEmpty then
        begin
            ShowMessage('Nenhum cliente cadastrado com esse c�digo');
            Exit;
        end;

    end;
end;

procedure TFrmSearchProduct.DBGridProductsDblClick(Sender: TObject);
begin
  with FrmProducts do
    begin
        EditCodProduct.Text := DBGridProducts.columns.items[0].field.text;
        EdiDescProduct.Text := DBGridProducts.columns.items[1].field.text;
        EditPriceProduct.Text := DBGridProducts.columns.items[2].field.text;

        FrmSearchProduct.Close;

    end;
end;

end.

