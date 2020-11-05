object FrmSearchProduct: TFrmSearchProduct
  Left = 0
  Top = 0
  Caption = 'Encontrar Produto'
  ClientHeight = 290
  ClientWidth = 599
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 601
    Height = 49
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 3
      Width = 89
      Height = 13
      Caption = 'C'#243'digo do produto'
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
  object DBGridProducts: TDBGrid
    Left = 0
    Top = 47
    Width = 601
    Height = 246
    DataSource = dsProducts
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGridProductsDblClick
  end
  object QryProdutos: TFDQuery
    Active = True
    Connection = DataModule1.Connection
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Left = 280
    Top = 8
  end
  object dsProducts: TDataSource
    DataSet = QryProdutos
    Left = 368
    Top = 24
  end
end
