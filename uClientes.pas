unit uClientes;

interface

type
    TClientes = class
    private
        FCli_codigo: integer;
        FCli_nome: string;
        FCli_cidade: string;
        FCli_uf: string;

        procedure SetCli_codigo(const Value: integer);
        procedure SetCli_nome(const Value: string);
        procedure SetCli_cidade(const Value: string);
        procedure SetCli_uf(const Value: string);
    public
        property Cli_codigo: integer read FCli_codigo write SetCli_codigo;
        property Cli_nome: string read FCli_nome write SetCli_nome;
        property Cli_cidade: string read FCli_cidade write SetCli_cidade;
        property Cli_uf: string read FCli_uf write SetCli_uf;
    end;

implementation {TClientes}

uses
    UniSearchClient;

procedure TClientes.SetCli_codigo(const Value: integer);
begin
    FCli_codigo := Value;
end;

procedure TClientes.SetCli_nome(const Value: string);
begin
    FCli_nome := Value;
end;

procedure TClientes.SetCli_cidade(const Value: string);
begin
    FCli_cidade := Value;
end;

procedure TClientes.SetCli_uf(const Value: string);
begin
    FCli_uf := Value;
end;

end.

