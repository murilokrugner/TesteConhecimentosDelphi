unit UniLocOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFrmLocOrder = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    EditCod: TEdit;
    btnSearch: TButton;
    DBGridClients: TDBGrid;
    QryOrder: TFDQuery;
    dsOrder: TDataSource;
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

uses DataModule, UniProducts;

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

        Add('SELECT VENDAS.CODIGO, VENDAS.DATA_EMISSAO, CLIENTES.NOME, ');
        Add('VENDAS.TOTAL FROM VENDAS ');
        Add('INNER JOIN CLIENTES ON CLIENTES.CODIGO = VENDAS.COD_CLIENTE ');
        Add('WHERE VENDAS.CODIGO = :CODIGO');

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

            Add('SELECT * FROM VENDAS_PRODUTOS WHERE COD_VENDA = :VENDA');

            ParamByName('VENDA').AsInteger := DBGridClients.columns.items[0].field.text;

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

              Open;

              //edits aqui

            end;

    end;
end;

end.
