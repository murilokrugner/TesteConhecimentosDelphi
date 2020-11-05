unit UniSearchClient;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
    FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
    FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
    FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
    Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
    TFrmSearchClient = class(TForm)
        Panel1: TPanel;
        EditCod: TEdit;
        Label1: TLabel;
        btnSearch: TButton;
        QryClients: TFDQuery;
        dsClients: TDataSource;
    DBGridClients: TDBGrid;
        procedure btnSearchClick(Sender: TObject);
    procedure DBGridClientsDblClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    FrmSearchClient: TFrmSearchClient;

implementation

uses
    DataModule, UniProducts;

{$R *.dfm}

procedure TFrmSearchClient.btnSearchClick(Sender: TObject);
begin
    if EditCod.Text = '' then
    begin
        ShowMessage('Por favor, informe o c�digo do Cliente');
        Exit;
    end;

    with QryClients, SQL do
    begin
        Close;
        Clear;

        Add('SELECT * FROM CLIENTES WHERE CODIGO = :CODIGO');

        ParamByName('CODIGO').AsInteger := StrToInt(EditCod.Text);

        Open;

        if IsEmpty then
        begin
            ShowMessage('Nenhum cliente cadastrado com esse c�digo');
            Exit;
        end;

    end;
end;

procedure TFrmSearchClient.DBGridClientsDblClick(Sender: TObject);
begin
  with FrmProducts do
    begin
        EditCodClient.Text := DBGridClients.columns.items[0].field.text;
        EditDescClient.Text := DBGridClients.columns.items[1].field.text;
        EditCityClient.Text := DBGridClients.columns.items[2].field.text;
        EditUfClient.Text := DBGridClients.columns.items[3].field.text;

        FrmSearchClient.Close;

    end;
end;

end.

