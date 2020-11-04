unit UniProducts;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
    Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
    FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
    FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask;

type
    TFrmProducts = class(TForm)
        Panel1: TPanel;
        EditDescClient: TEdit;
        lblClient: TLabel;
        EditCodClient: TEdit;
        EditCityClient: TEdit;
        EditUfClient: TEdit;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Panel2: TPanel;
        Label4: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        EditCodProduct: TEdit;
        EdiDescProduct: TEdit;
        Label7: TLabel;
        btnAdd: TButton;
        btnClear: TButton;
        DBGrid1: TDBGrid;
        btnSave: TButton;
        QryClients: TFDQuery;
        Panel3: TPanel;
        EditCodOrder: TEdit;
        EditDate: TMaskEdit;
        Label8: TLabel;
        Label9: TLabel;
        btnNew: TButton;
        btnCancel: TButton;
        QryOrder: TFDQuery;
        QryProdutos: TFDQuery;
        QryAuxOrder: TFDQuery;
        EditQuant: TEdit;
        Label10: TLabel;
        QueryAllProducts: TFDQuery;
        dsAllProducts: TDataSource;
    EditPriceProduct: TMaskEdit;
        procedure EditCodClientKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure EditCodProductKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure FormCreate(Sender: TObject);
        procedure btnNewClick(Sender: TObject);
        procedure btnCancelClick(Sender: TObject);
        procedure btnAddClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    FrmProducts: TFrmProducts;

implementation

uses
    DataModule, UniSearchClient, UniSearchProduct;

{$R *.dfm}

procedure TFrmProducts.btnAddClick(Sender: TObject);
var
    number_order: Integer;
begin
    with QryAuxOrder, SQL do
    begin
        Close;
        Clear;

        Add('SELECT CODIGO FROM VENDAS WHERE COD_VENDA = :VENDA');

        ParamByName('VENDA').AsInteger := StrToInt(EditCodOrder.Text);

        Open;

        number_order := Fields[0].AsInteger;
    end;

    try
        with QryProdutos, SQL do
        begin
            Close;
            Clear;

            DataModule1.tr.StartTransaction;

            Add('INSERT INTO VENDAS_PRODUTOS(COD_VENDA, COD_PRODUTO, QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL)');
            Add('VALUES(:VENDA, :PRODUTO, :QUANTIDADE, :UNITARIO, :TOTAL)');

            ParamByName('VENDA').AsInteger := number_order;
            ParamByName('PRODUTO').AsInteger := StrToInt(EditCodProduct.Text);
            ParamByName('QUANTIDADE').AsInteger := StrToInt(EditQuant.Text);
            ParamByName('UNITARIO').AsFloat := StrToFloat(EditPriceProduct.Text);
            ParamByName('TOTAL').AsFloat := StrToFloat(EditPriceProduct.Text) * StrToInt(EditQuant.Text);

            ExecSQL;

            DataModule1.tr.Commit;

            with QueryAllProducts, SQL do
              begin
                Close;
                Clear;

                Add('SELECT * FROM VENDAS_PRODUTOS WHERE COD_VENDA = :VENDA');

                ParamByName('VENDA').AsInteger := number_order;
                
                Open;
              end;
        end;
    except
        on e: exception do
        begin
            showmessage('Erro:' + E.message + #13 + 'Operação Cancelada');
            DataModule1.tr.Rollback;
            abort;
        end;

    end;
end;

procedure TFrmProducts.btnCancelClick(Sender: TObject);
begin
    btnSave.Enabled := False;
    btnCancel.Enabled := False;

    btnNew.Enabled := True;

    try
        with QryOrder, SQL do
        begin
            Close;
            Clear;

            DataModule1.tr.StartTransaction;

            Add('DELETE FROM VENDAS WHERE CODIGO = :CODIGO');

            ParamByName('CODIGO').AsInteger := StrToInt(EditCodOrder.Text);

            ExecSQL;

            DataModule1.tr.Commit;

            EditCodOrder.Clear;
            EditDate.Clear;
        end;
    except
        on e: exception do
        begin
            showmessage('Erro:' + E.message + #13 + 'Operação Cancelada');
            DataModule1.tr.Rollback;
            abort;
        end;

    end;
end;

procedure TFrmProducts.btnNewClick(Sender: TObject);
begin
    btnSave.Enabled := True;
    btnCancel.Enabled := True;

    btnNew.Enabled := False;

    try
        with QryOrder, SQL do
        begin
            Close;
            Clear;

            Add('SELECT COD_VENDA FROM VENDAS ORDER BY COD_VENDA DESC LIMIT 1');

            Open;

            if IsEmpty then
            begin
                EditCodOrder.Text := '1';
            end
            else
            begin
                EditCodOrder.Text := IntToStr(Fields[0].AsInteger + 1);
            end;

            EditDate.Text := DateToStr(Date());

            Close;
            Clear;

            DataModule1.tr.StartTransaction;

            Add('INSERT INTO VENDAS(COD_VENDA, DATA_EMISSAO) VALUES(:COD, :DATE)');

            ParamByName('COD').AsInteger := StrToInt(EditCodOrder.Text);
            ParamByName('DATE').AsDate := Date();

            ExecSQL;

            DataModule1.tr.Commit;

        end;
    except
        on e: exception do
        begin
            showmessage('Erro:' + E.message + #13 + 'Operação Cancelada');
            DataModule1.tr.Rollback;
            abort;
        end;

    end;
end;

procedure TFrmProducts.EditCodClientKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_F2) then
    begin
        Application.CreateForm(TFrmSearchClient, FrmSearchClient);
        try
            FrmSearchClient.ShowModal;
        finally
            FreeAndNil(FrmSearchClient);
        end;
    end;
end;

procedure TFrmProducts.EditCodProductKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_F2) then
    begin
        Application.CreateForm(TFrmSearchProduct, FrmSearchProduct);
        try
            FrmSearchProduct.ShowModal;
        finally
            FreeAndNil(FrmSearchProduct);
        end;
    end;
end;

procedure TFrmProducts.FormCreate(Sender: TObject);
begin
    btnSave.Enabled := False;
    btnCancel.Enabled := False;
end;

end.

