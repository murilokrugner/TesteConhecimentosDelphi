object FrmProducts: TFrmProducts
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Produtos'
  ClientHeight = 502
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel
    Left = 524
    Top = 423
    Width = 45
    Height = 16
    Caption = 'TOTAL:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = -12
    Top = 56
    Width = 701
    Height = 73
    TabOrder = 0
    object lblClient: TLabel
      Left = 94
      Top = 8
      Width = 33
      Height = 26
      Caption = 'Cliente'#13#10
    end
    object Label1: TLabel
      Left = 22
      Top = 8
      Width = 56
      Height = 13
      Caption = 'C'#243'digo (F2)'
    end
    object Label2: TLabel
      Left = 432
      Top = 8
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label3: TLabel
      Left = 568
      Top = 8
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object EditDescClient: TEdit
      Left = 94
      Top = 24
      Width = 313
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object EditCodClient: TEdit
      Left = 22
      Top = 24
      Width = 56
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      OnKeyDown = EditCodClientKeyDown
    end
    object EditCityClient: TEdit
      Left = 432
      Top = 24
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object EditUfClient: TEdit
      Left = 568
      Top = 24
      Width = 41
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 127
    Width = 689
    Height = 114
    TabOrder = 1
    object Label4: TLabel
      Left = 10
      Top = 19
      Width = 56
      Height = 13
      Caption = 'C'#243'digo (F2)'
    end
    object Label5: TLabel
      Left = 96
      Top = 19
      Width = 102
      Height = 13
      Caption = 'Descri'#231#227'o do Produto'
    end
    object Label6: TLabel
      Left = 378
      Top = 19
      Width = 27
      Height = 13
      Caption = 'Pre'#231'o'
    end
    object Label7: TLabel
      Left = 10
      Top = 0
      Width = 126
      Height = 16
      Caption = 'ADICIONAR PRODUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 487
      Top = 19
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object EditCodProduct: TEdit
      Left = 10
      Top = 38
      Width = 63
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
      OnKeyDown = EditCodProductKeyDown
    end
    object EdiDescProduct: TEdit
      Left = 96
      Top = 38
      Width = 257
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object btnAdd: TButton
      Left = 575
      Top = 80
      Width = 93
      Height = 25
      Caption = 'Adicionar'
      Enabled = False
      TabOrder = 2
      OnClick = btnAddClick
    end
    object btnClear: TButton
      Left = 475
      Top = 80
      Width = 94
      Height = 25
      Caption = 'Limpar'
      Enabled = False
      TabOrder = 3
      OnClick = btnClearClick
    end
    object EditQuant: TEdit
      Left = 487
      Top = 38
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 4
    end
  end
  object DBGridProducts: TDBGrid
    Left = -7
    Top = 238
    Width = 696
    Height = 179
    DataSource = dsAllProducts
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyDown = DBGridProductsKeyDown
  end
  object btnSave: TButton
    Left = 583
    Top = 454
    Width = 106
    Height = 35
    Caption = 'Gravar Pedido'
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 689
    Height = 57
    TabOrder = 4
    object Label8: TLabel
      Left = 10
      Top = 4
      Width = 104
      Height = 13
      Caption = 'C'#243'digo da venda (F2)'
    end
    object Label9: TLabel
      Left = 152
      Top = 4
      Width = 79
      Height = 13
      Caption = 'Data de emiss'#227'o'
    end
    object EditCodOrder: TEdit
      Left = 10
      Top = 19
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
      OnKeyDown = EditCodOrderKeyDown
    end
    object EditDate: TMaskEdit
      Left = 152
      Top = 19
      Width = 79
      Height = 21
      Enabled = False
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object btnNew: TButton
    Left = 471
    Top = 454
    Width = 106
    Height = 35
    Caption = 'Novo'
    TabOrder = 5
    OnClick = btnNewClick
  end
  object btnCancel: TButton
    Left = 359
    Top = 454
    Width = 106
    Height = 35
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = btnCancelClick
  end
  object EditPriceProduct: TMaskEdit
    Left = 378
    Top = 165
    Width = 92
    Height = 21
    Enabled = False
    TabOrder = 7
    Text = ''
  end
  object EditTotal: TMaskEdit
    Left = 575
    Top = 423
    Width = 107
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 8
    Text = ''
  end
  object QryClients: TFDQuery
    Transaction = DataModule1.tr
    Left = 640
    Top = 72
  end
  object QryOrder: TFDQuery
    Connection = DataModule1.Connection
    Transaction = DataModule1.tr
    Left = 616
  end
  object QryProdutos: TFDQuery
    Connection = DataModule1.Connection
    Transaction = DataModule1.tr
    Left = 416
    Top = 8
  end
  object QryAuxOrder: TFDQuery
    Connection = DataModule1.Connection
    Transaction = DataModule1.tr
    Left = 520
  end
  object QueryAllProducts: TFDQuery
    Connection = DataModule1.Connection
    Transaction = DataModule1.tr
    SQL.Strings = (
      
        'SELECT VP.COD_PRODUTO, P.DESCRICAO, VP.QUANTIDADE, VP.VALOR_UNIT' +
        'ARIO, VP.VALOR_TOTAL FROM VENDAS_PRODUTOS AS VP'#10'INNER JOIN PRODU' +
        'TOS AS P ON P.CODIGO = VP.COD_PRODUTO')
    Left = 280
    Top = 24
    object QueryAllProductsCOD_PRODUTO: TIntegerField
      DisplayLabel = 'C'#211'DIGO'
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      ReadOnly = True
      Required = True
    end
    object QueryAllProductsDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'DESCRI'#199#195'O'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object QueryAllProductsQUANTIDADE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object QueryAllProductsVALOR_UNITARIO: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'VALOR UNITARIO'
      FieldName = 'VALOR_UNITARIO'
      Origin = 'VALOR_UNITARIO'
      currency = True
      Precision = 15
      Size = 6
    end
    object QueryAllProductsVALOR_TOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'VALOR TOTAL'
      FieldName = 'VALOR_TOTAL'
      Origin = 'VALOR_TOTAL'
      ReadOnly = True
      currency = True
      Precision = 15
      Size = 6
    end
  end
  object dsAllProducts: TDataSource
    DataSet = QueryAllProducts
    Left = 216
    Top = 40
  end
  object QryTotal: TFDQuery
    Connection = DataModule1.Connection
    Transaction = DataModule1.tr
    Left = 304
    Top = 120
  end
  object QryTotalPedido: TFDQuery
    Connection = DataModule1.Connection
    Transaction = DataModule1.tr
    Left = 192
    Top = 136
  end
end
