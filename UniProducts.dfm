object FrmProducts: TFrmProducts
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Produtos'
  ClientHeight = 492
  ClientWidth = 690
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
      ReadOnly = True
      TabOrder = 0
    end
    object EditCodClient: TEdit
      Left = 22
      Top = 24
      Width = 56
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnKeyDown = EditCodClientKeyDown
    end
    object EditCityClient: TEdit
      Left = 432
      Top = 24
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object EditUfClient: TEdit
      Left = 568
      Top = 24
      Width = 41
      Height = 21
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
      Left = 372
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
      ReadOnly = True
      TabOrder = 0
      OnKeyDown = EditCodProductKeyDown
    end
    object EdiDescProduct: TEdit
      Left = 96
      Top = 38
      Width = 265
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object btnAdd: TButton
      Left = 583
      Top = 80
      Width = 93
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 2
      OnClick = btnAddClick
    end
    object btnClear: TButton
      Left = 475
      Top = 80
      Width = 94
      Height = 25
      Caption = 'Limpar'
      TabOrder = 3
    end
    object EditQuant: TEdit
      Left = 487
      Top = 38
      Width = 121
      Height = 21
      TabOrder = 4
    end
  end
  object DBGrid1: TDBGrid
    Left = -7
    Top = 238
    Width = 696
    Height = 210
    DataSource = dsAllProducts
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnSave: TButton
    Left = 583
    Top = 454
    Width = 106
    Height = 35
    Caption = 'Salvar'
    TabOrder = 3
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
      Width = 81
      Height = 13
      Caption = 'C'#243'digo da venda'
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
    end
    object EditDate: TMaskEdit
      Left = 152
      Top = 19
      Width = 79
      Height = 21
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
    Left = 372
    Top = 165
    Width = 92
    Height = 21
    TabOrder = 7
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
      'SELECT * FROM VENDAS_PRODUTOS')
    Left = 280
    Top = 24
  end
  object dsAllProducts: TDataSource
    DataSet = QueryAllProducts
    Left = 216
    Top = 40
  end
end