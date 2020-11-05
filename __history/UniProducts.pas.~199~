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
        DBGridProducts: TDBGrid;
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
        QryTotal: TFDQuery;
        QryTotalPedido: TFDQuery;
        Label11: TLabel;
        EditTotal: TMaskEdit;
        QueryAllProductsCOD_PRODUTO: TIntegerField;
        QueryAllProductsDESCRICAO: TStringField;
        QueryAllProductsQUANTIDADE: TIntegerField;
        QueryAllProductsVALOR_UNITARIO: TFMTBCDField;
        QueryAllProductsVALOR_TOTAL: TFMTBCDField;
        procedure EditCodClientKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure EditCodProductKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure FormCreate(Sender: TObject);
        procedure btnNewClick(Sender: TObject);
        procedure btnCancelClick(Sender: TObject);
        procedure btnAddClick(Sender: TObject);
        procedure btnSaveClick(Sender: TObject);
        procedure EditCodOrderKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure btnClearClick(Sender: TObject);
        procedure DBGridProductsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
        procedure Button1Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    FrmProducts: TFrmProducts;

implementation

uses
    DataModule, UniSearchClient, UniSearchProduct, UniLocOrder;

{$R *.dfm}

procedure TFrmProducts.btnAddClick(Sender: TObject);
var
    number_order: Integer;
begin
    if EditQuant.Text = '' then
    begin
        ShowMessage('Por favor, informe a quantidade do produto');
        exit;
    end;

    if EditCodProduct.Text = '' then
    begin
        ShowMessage('Por favor, informe a quantidade do produto');
        exit;
    end;

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

                Add('SELECT VP.COD_PRODUTO, P.DESCRICAO, VP.QUANTIDADE, VP.VALOR_UNITARIO,');
                Add('VP.VALOR_TOTAL FROM VENDAS_PRODUTOS AS VP ');
                Add('INNER JOIN PRODUTOS AS P ON P.CODIGO = VP.COD_PRODUTO ');
                Add('WHERE VP.COD_VENDA = :VENDA ');

                ParamByName('VENDA').AsInteger := number_order;

                Open;
            end;

            with QryTotal, SQL do
            begin
                Close;
                Clear;

                Add('SELECT SUM(VALOR_TOTAL) AS TOTAL FROM VENDAS_PRODUTOS');
                Add('WHERE COD_VENDA = :VENDA');

                ParamByName('VENDA').AsInteger := number_order;

                Open;

                EditTotal.Text := FormatFloat('0.00', Fields[0].AsFloat);
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

    EditDescClient.Enabled := False;
    EditCodClient.Enabled := False;
    EditCityClient.Enabled := False;
    EditUfClient.Enabled := False;
    EditCodProduct.Enabled := False;
    EditDate.Enabled := False;
    EditQuant.Enabled := False;
    EditPriceProduct.Enabled := False;
    EditTotal.Enabled := False;
    EdiDescProduct.Enabled := False;

    btnAdd.Enabled := False;
    btnClear.Enabled := False;

    QueryAllProducts.Active := False;

    try
        with QryOrder, SQL do
        begin
            Close;
            Clear;

            DataModule1.tr.StartTransaction;

            Add('DELETE FROM VENDAS_PRODUTOS WHERE COD_VENDA = :CODIGO');

            ParamByName('CODIGO').AsInteger := StrToInt(EditCodOrder.Text);

            ExecSQL;

            DataModule1.tr.Commit;

            Close;
            Clear;

            DataModule1.tr.StartTransaction;

            Add('DELETE FROM VENDAS WHERE COD_VENDA = :CODIGO');

            ParamByName('CODIGO').AsInteger := StrToInt(EditCodOrder.Text);

            ExecSQL;

            DataModule1.tr.Commit;

            EditCodOrder.Clear;
            EditDate.Clear;

            EditDescClient.Clear;
            EditCodClient.Clear;
            EditCityClient.Clear;
            EditUfClient.Clear;
            EditCodProduct.Clear;
            EditDate.Clear;
            EditQuant.Clear;
            EditPriceProduct.Clear;
            EditTotal.Clear;
            EdiDescProduct.Clear;
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

procedure TFrmProducts.btnClearClick(Sender: TObject);
begin
    EditCodProduct.Clear;
    EdiDescProduct.Clear;
    EditPriceProduct.Clear;
    EditQuant.Clear;

    EditCodProduct.SetFocus;
end;

procedure TFrmProducts.btnNewClick(Sender: TObject);
begin
    btnSave.Enabled := True;
    btnCancel.Enabled := True;

    btnNew.Enabled := False;

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

    btnAdd.Enabled := True;
    btnClear.Enabled := True;

    EditDescClient.Clear;
    EditCodClient.Clear;
    EditCityClient.Clear;
    EditUfClient.Clear;
    EditCodProduct.Clear;
    EditDate.Clear;
    EditQuant.Clear;
    EditPriceProduct.Clear;
    EditTotal.Clear;
    EdiDescProduct.Clear;

    EditCodOrder.SetFocus;

    QueryAllProducts.Active := False;

    try
        with QryOrder, SQL do
        begin
            Close;
            Clear;

            Add('select (max(CODIGO) + 1) from VENDAS');

            Open;

            if IsEmpty then
            begin
                EditCodOrder.Text := '1';
            end
            else
            begin
                EditCodOrder.Text := IntToStr(Fields[0].AsInteger);
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

procedure TFrmProducts.btnSaveClick(Sender: TObject);
var
    number_order: integer;
    total: double;
begin
    if EditCodClient.Text = '' then
    begin
        ShowMessage('Por favor, adicione um cliente');
        exit;
    end;

    with QryAuxOrder, SQL do
    begin
        Close;
        Clear;

        Add('SELECT CODIGO FROM VENDAS WHERE COD_VENDA = :VENDA');

        ParamByName('VENDA').AsInteger := StrToInt(EditCodOrder.Text);

        Open;

        number_order := Fields[0].AsInteger;
    end;

    if DBGridProducts.DataSource.DataSet.RecordCount <> 0 then
    begin
        with QryProdutos, SQL do
        begin
            try
                Close;
                Clear;

                Add('UPDATE VENDAS_PRODUTOS SET QUANTIDADE = :QNT, VALOR_TOTAL = :VALOR, VALOR_UNITARIO = :UNITARIO');
                Add('WHERE COD_VENDA = :VENDA AND COD_PRODUTO = :PRODUTO');

                ParamByName('VALOR').AsFloat := StrToFloat(DBGridProducts.columns.items[2].field.text) * StrToFloat(DBGridProducts.columns.items[3].field.text);
                ParamByName('UNITARIO').AsFloat := StrToFloat(DBGridProducts.columns.items[3].field.text);
                ParamByName('QNT').AsInteger := StrToInt(DBGridProducts.columns.items[2].field.text);
                ParamByName('VENDA').AsInteger := number_order;
                ParamByName('PRODUTO').AsInteger := StrToInt(DBGridProducts.columns.items[0].field.text);

                DataModule1.tr.StartTransaction;

                ExecSQL;

                DataModule1.tr.Commit;

                with QueryAllProducts, SQL do
                begin
                    Close;
                    Clear;

                    Add('SELECT VP.COD_PRODUTO, P.DESCRICAO, VP.QUANTIDADE, VP.VALOR_UNITARIO,');
                    Add('VP.VALOR_TOTAL FROM VENDAS_PRODUTOS AS VP ');
                    Add('INNER JOIN PRODUTOS AS P ON P.CODIGO = VP.COD_PRODUTO ');
                    Add('WHERE VP.COD_VENDA = :VENDA ');

                    ParamByName('VENDA').AsInteger := number_order;

                    Open;

                    QueryAllProducts.Active := True;
                end;

                with QryTotal, SQL do
                begin

                    Close;
                    Clear;

                    Add('SELECT SUM(VALOR_TOTAL) AS TOTAL FROM VENDAS_PRODUTOS');
                    Add('WHERE COD_VENDA = :VENDA');

                    ParamByName('VENDA').AsInteger := number_order;

                    Open;

                    EditTotal.Text := FormatFloat('0.00', Fields[0].AsFloat);
                end;

            except
                on e: exception do
                begin
                    showmessage('Erro:' + E.message + #13 + 'Operação Cancelada');
                    DataModule1.tr.Rollback;
                    abort;
                end;
            end;
        //end;
        end;
    end;

    with QryAuxOrder, SQL do
    begin
        Close;
        Clear;

        Add('SELECT CODIGO FROM VENDAS WHERE COD_VENDA = :VENDA');

        ParamByName('VENDA').AsInteger := StrToInt(EditCodOrder.Text);

        Open;

        number_order := Fields[0].AsInteger;
    end;

    with QryTotal, SQL do
    begin
        Close;
        Clear;

        Add('SELECT SUM(VALOR_TOTAL) AS TOTAL FROM VENDAS_PRODUTOS ');
        Add('WHERE COD_VENDA = :COD_VENDA ');

        ParamByName('COD_VENDA').AsInteger := StrToInt(EditCodOrder.Text);

        Open;

        total := Fields[0].AsFloat;

    end;

    with QryOrder, SQL do
    begin
        try
            Close;
            Clear;

            Add('UPDATE VENDAS SET COD_CLIENTE = :CLIENTE, TOTAL = :TOTAL');
            Add('WHERE COD_VENDA = :CODIGO');

            ParamByName('CODIGO').AsInteger := StrToInt(EditCodOrder.Text);
            ParamByName('CLIENTE').AsInteger := StrToInt(EditCodClient.Text);
            ParamByName('TOTAL').AsFloat := total;

            DataModule1.tr.StartTransaction;

            ExecSQL;

            DataModule1.tr.Commit;

            ShowMessage('A venda foi salva');

            btnNew.Enabled := True;

        except
            on e: exception do
            begin
                showmessage('Erro:' + E.message + #13 + 'Operação Cancelada');
                DataModule1.tr.Rollback;
                abort;
            end;

        end;
    end;
end;

procedure TFrmProducts.Button1Click(Sender: TObject);
begin
    ShowMessage(DBGridProducts.columns.items[3].field.text);
end;

procedure TFrmProducts.DBGridProductsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
    number_order: integer;
begin
    if (Key = vk_delete) then
    begin
        if Application.MessageBox('Tem certeza que deseja excluir o produto?', 'Excluir produto?', mb_yesno + mb_iconquestion) = id_yes then
        begin
            with QryProdutos, SQL do
            begin
                try
                    Close;
                    Clear;

                    Add('DELETE FROM VENDAS_PRODUTOS WHERE COD_PRODUTO = :PRODUTO');

                    ParamByName('PRODUTO').AsInteger := StrToInt(DBGridProducts.columns.items[0].field.text);

                    DataModule1.tr.StartTransaction;

                    ExecSQL;

                    DataModule1.tr.Commit;

                    ShowMessage('O produto foi deletado');

                    with QryAuxOrder, SQL do
                    begin
                        Close;
                        Clear;

                        Add('SELECT CODIGO FROM VENDAS WHERE COD_VENDA = :VENDA');

                        ParamByName('VENDA').AsInteger := StrToInt(EditCodOrder.Text);

                        Open;

                        number_order := Fields[0].AsInteger;
                    end;

                    with QueryAllProducts, SQL do
                    begin
                        Close;
                        Clear;

                        Add('SELECT VP.COD_PRODUTO, P.DESCRICAO, VP.QUANTIDADE, VP.VALOR_UNITARIO,');
                        Add('VP.VALOR_TOTAL FROM VENDAS_PRODUTOS AS VP ');
                        Add('INNER JOIN PRODUTOS AS P ON P.CODIGO = VP.COD_PRODUTO ');
                        Add('WHERE VP.COD_VENDA = :VENDA ');

                        ParamByName('VENDA').AsInteger := number_order;

                        Open;

                        QueryAllProducts.Active := True;
                    end;

                    with QryTotal, SQL do
                    begin

                        Close;
                        Clear;

                        Add('SELECT SUM(VALOR_TOTAL) AS TOTAL FROM VENDAS_PRODUTOS');
                        Add('WHERE COD_VENDA = :VENDA');

                        ParamByName('VENDA').AsInteger := number_order;

                        Open;

                        EditTotal.Text := FormatFloat('0.00', Fields[0].AsFloat);
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

procedure TFrmProducts.EditCodOrderKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_F2) then
    begin
        Application.CreateForm(TFrmLocOrder, FrmLocOrder);
        try
            FrmLocOrder.ShowModal;
        finally
            FreeAndNil(FrmLocOrder);
        end;
    end
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

    EditTotal.Text := '0';

end;

end.

