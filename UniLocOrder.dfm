object FrmLocOrder: TFrmLocOrder
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Localizar venda'
  ClientHeight = 293
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = -3
    Top = 0
    Width = 601
    Height = 49
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 3
      Width = 82
      Height = 13
      Caption = 'C'#243'digo do cliente'
    end
    object EditCod: TEdit
      Left = 13
      Top = 20
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object btnSearch: TButton
      Left = 140
      Top = 18
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btnSearchClick
    end
  end
  object DBGridClients: TDBGrid
    Left = -3
    Top = 49
    Width = 601
    Height = 246
    DataSource = dsOrder
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridClientsDblClick
  end
  object QryOrder: TFDQuery
    Active = True
    Connection = DataModule1.Connection
    SQL.Strings = (
      
        'SELECT VENDAS.CODIGO, VENDAS.DATA_EMISSAO, CLIENTES.NOME, VENDAS' +
        '.TOTAL FROM VENDAS '
      #10'INNER JOIN CLIENTES ON CLIENTES.CODIGO = VENDAS.COD_CLIENTE')
    Left = 352
    Top = 8
  end
  object dsOrder: TDataSource
    DataSet = QryOrder
    Left = 424
    Top = 8
  end
end
