unit UniLocOrder;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
    Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
    FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
    FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
    TFrmLocOrder = class(TForm)
        Panel1: TPanel;
        Label1: TLabel;
        EditCod: TEdit;
        btnSearch: TButton;
        DBGridClients: TDBGrid;
        QryOrder: TFDQuery;
        dsOrder: TDataSource;
        QryOrderCOD_VENDA: TIntegerField;
        QryOrderDATA_EMISSAO: TDateField;
        QryOrderNOME: TStringField;
        QryOrderTOTAL: TFMTBCDField;
        procedure btnSearchClick(Sender: TObject);
        procedure DBGridClientsDblClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    FrmLocOrder: TFrmLocOrder;

implementation

{$R *.dfm}

uses
    DataModule, UniProducts;

procedure TFrmLocOrder.btnSearchClick(Sender: TObject);
begin
    if EditCod.Text = '' then
    begin
        ShowMessage('Digite o c�digo da venda para pesquisar');
        exit;
    end;

    with QryOrder, SQL do
    begin
        Close;
        Clear;

        Add('SELECT VENDAS.COD_VENDA, VENDAS.DATA_EMISSAO, CLIENTES.NOME, ');
        Add('VENDAS.TOTAL FROM VENDAS ');
        Add('INNER JOIN CLIENTES ON CLIENTES.CODIGO = VENDAS.COD_CLIENTE ');
        Add('WHERE VENDAS.COD_VENDA = :CODIGO');

        ParamByName('CODIGO').AsInteger := StrToInt(EditCod.Text);

        Open;

        if IsEmpty then
        begin
            ShowMessage('N�o existe nenhuma venda com esse codigo');
            exit;
        end;
    end;
end;

procedure TFrmLocOrder.DBGridClientsDblClick(Sender: TObject);
begin
    with FrmProducts do
    begin
        with QueryAllProducts, SQL do
        begin
            Close;
            Clear;

            Add('SELECT VP.COD_PRODUTO, P.DESCRICAO, VP.QUANTIDADE, VP.VALOR_UNITARIO,');
            Add('VP.VALOR_TOTAL FROM VENDAS_PRODUTOS AS VP');
            Add('INNER JOIN PRODUTOS AS P ON P.CODIGO = VP.COD_PRODUTO');
            Add('WHERE COD_VENDA = :VENDA');

            ParamByName('VENDA').AsInteger := StrToInt(DBGridClients.columns.items[0].field.text);

            Open;
        end;

        with QryOrder, SQL do
        begin
            Close;
            Clear;

            Add('SELECT VENDAS.COD_VENDA, VENDAS.DATA_EMISSAO, VENDAS.COD_CLIENTE,');
            Add('CLIENTES.NOME, CLIENTES.CIDADE, CLIENTES.UF FROM VENDAS ');
            Add('INNER JOIN CLIENTES ON CLIENTES.CODIGO = VENDAS.COD_CLIENTE ');
            Add('WHERE VENDAS.COD_VENDA = :VENDA ');

            ParamByName('VENDA').AsInteger := StrToInt(DBGridClients.columns.items[0].field.text);

            Open;

            with FrmProducts do
            begin
                EditCodOrder.Text := IntToStr(Fields[0].AsInteger);
                EditDate.Text := Fields[1].AsString;
                EditCodClient.Text := IntToStr(Fields[2].AsInteger);
                EditDescClient.Text := Fields[3].AsString;
                EditCityClient.Text := Fields[4].AsString;
                EditUfClient.Text := Fields[5].AsString;

                btnAdd.Enabled := True;
                btnClear.Enabled := True;

                btnSave.Enabled := True;
                btnNew.Enabled := False;
                btnCancel.Enabled := True;

                EditDescClient.Enabled := True;
                EditCodClient.Enabled := True;
                EditCityClient.Enabled := True;
                EditUfClient.Enabled := True;
                EditCodProduct.Enabled := True;
                EditDate.Enabled := True;
                EditQuant.Enabled := True;
                EditPriceProduct.Enabled := True;
                EditTotal.Enabled := True;
                EdiDescProduct.Enabled := True;

                with QryTotal, SQL do
                begin

                    Close;
                    Clear;

                    Add('SELECT SUM(VALOR_TOTAL) AS TOTAL FROM VENDAS_PRODUTOS');
                    Add('INNER JOIN VENDAS AS V ON VENDAS_PRODUTOS.COD_VENDA = V.COD_VENDA');
                    Add('WHERE V.CODIGO = :VENDA');

                    ParamByName('VENDA').AsInteger := StrToInt(DBGridClients.columns.items[0].field.text);

                    Open;

                    EditTotal.Text := FormatFloat('0.00', Fields[0].AsFloat);
                end;
            end;

            FrmLocOrder.Close;

        end;

    end;
end;

end.

