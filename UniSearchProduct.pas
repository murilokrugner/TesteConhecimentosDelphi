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
        btnSearch: TButton;
        QryProdutos: TFDQuery;
        dsProducts: TDataSource;
    DBGrid1: TDBGrid;
    QryProdutosCODIGO: TFDAutoIncField;
    QryProdutosDESCRICAO: TStringField;
    QryProdutosPRECO: TFMTBCDField;
        procedure btnSearchClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
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
        ShowMessage('Por favor, informe o código do Produto');
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
            ShowMessage('Nenhum cliente cadastrado com esse código');
            Exit;
        end;

    end;
end;

procedure TFrmSearchProduct.DBGrid1DblClick(Sender: TObject);
begin
  with FrmProducts do
    begin
        EditCodProduct.Text := DBGrid1.columns.items[0].field.text;
        EdiDescProduct.Text := DBGrid1.columns.items[1].field.text;
        EditPriceProduct.Text := FormatFloat('0.00', StrToFloat(DBGrid1.columns.items[2].field.text));

        FrmSearchProduct.Close;

    end;
end;

end.

