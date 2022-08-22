object FCdTipPag: TFCdTipPag
  Left = 0
  Top = 0
  Hint = 'Forma de pagamento'
  Caption = ' Cadastro Tipo de Pagamento'
  ClientHeight = 326
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object Splitter: TSplitter
    Left = 391
    Top = 64
    Width = 6
    Height = 239
    Align = alRight
    Color = clWhite
    ParentColor = False
    ExplicitLeft = 429
    ExplicitTop = 123
    ExplicitHeight = 289
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 41
    Align = alTop
    Color = 9002550
    ParentBackground = False
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 1
      Top = 1
      Width = 63
      Height = 39
      Hint = 'Adicionar|Adicionar um novo registro'
      Align = alLeft
      Caption = 'A&dicionar'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 64
      Top = 1
      Width = 63
      Height = 39
      Align = alLeft
      Caption = 'A&lterar'
      ExplicitLeft = 58
    end
    object SpeedButton3: TSpeedButton
      Left = 127
      Top = 1
      Width = 63
      Height = 39
      Align = alLeft
      Caption = 'E&xcluir'
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 190
      Top = 1
      Width = 63
      Height = 39
      Align = alLeft
      Caption = '&Salvar'
      OnClick = SpeedButton4Click
    end
  end
  object panTitulo: TPanel
    Left = 0
    Top = 41
    Width = 737
    Height = 23
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = 13270046
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object panCampo: TPanel
      Left = 565
      Top = 0
      Width = 172
      Height = 23
      Align = alRight
      BevelOuter = bvNone
      Color = clHighlight
      TabOrder = 0
    end
  end
  object panCadastro: TPanel
    Left = 397
    Top = 64
    Width = 340
    Height = 239
    Align = alRight
    BevelOuter = bvNone
    Color = clWhite
    Constraints.MinWidth = 340
    ParentBackground = False
    TabOrder = 2
    object Label2: TLabel
      Left = 14
      Top = 19
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel
      Left = 4
      Top = 49
      Width = 61
      Height = 15
      Caption = 'Pagamento'
    end
    object Label4: TLabel
      Left = 22
      Top = 78
      Width = 43
      Height = 15
      Caption = 'Parcelas'
    end
    object Label5: TLabel
      Left = 10
      Top = 107
      Width = 55
      Height = 15
      Caption = 'Taxa/Juros'
    end
    object DBCheckBox1: TDBCheckBox
      Left = 245
      Top = 16
      Width = 84
      Height = 17
      Caption = 'Ativo'
      DataField = 'CH_ATIVO'
      DataSource = srcPag
      TabOrder = 0
      ValueChecked = 'S'
      ValueUnchecked = 'F'
    end
    object DBPag: TDBComboBox
      Left = 73
      Top = 46
      Width = 121
      Height = 23
      DataField = 'DS_FORMPAG'
      DataSource = srcPag
      Items.Strings = (
        'A Vista (Dinheiro)'
        'A Vista (Cart'#227'o D'#233'bito)'
        'A Vista (Cart'#227'o Cr'#233'dito)'
        'X Parcelas (Cart'#227'o)'
        'X Parcelas (Dinheiro)')
      TabOrder = 1
      OnChange = DBPagChange
    end
    object DBDescPag: TDBEdit
      Left = 73
      Top = 16
      Width = 121
      Height = 23
      DataField = 'DS_PAG'
      DataSource = srcPag
      TabOrder = 2
    end
    object CBParcelas: TDBComboBox
      Left = 73
      Top = 75
      Width = 121
      Height = 23
      DataField = 'NR_PARC'
      DataSource = srcPag
      Enabled = False
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10')
      TabOrder = 3
    end
    object DBJuros: TDBEdit
      Left = 73
      Top = 104
      Width = 121
      Height = 23
      DataField = 'VL_TAXA'
      DataSource = srcPag
      Enabled = False
      TabOrder = 4
    end
  end
  object GridProdutos: TDBGrid
    Left = 0
    Top = 64
    Width = 391
    Height = 239
    Align = alClient
    Color = clWhite
    DataSource = srcPag
    DrawingStyle = gdsGradient
    FixedColor = clWhite
    GradientEndColor = 13270046
    GradientStartColor = clCream
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_PAG'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_PAG'
        Width = 200
        Visible = True
      end>
  end
  object panMsg: TPanel
    Left = 0
    Top = 303
    Width = 737
    Height = 23
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = 13270046
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
  end
  object ADOQueryPag: TADOQuery
    Active = True
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * From SiPag')
    Left = 176
    Top = 224
    object ADOQueryPagCD_PAG: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_PAG'
    end
    object ADOQueryPagDS_PAG: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DS_PAG'
      Size = 255
    end
    object ADOQueryPagNR_PARC: TIntegerField
      DisplayLabel = 'Parcelas'
      FieldName = 'NR_PARC'
    end
    object ADOQueryPagCH_ATIVO: TWideStringField
      DisplayLabel = 'Ativo'
      FieldName = 'CH_ATIVO'
      Size = 1
    end
    object ADOQueryPagVL_TAXA: TFloatField
      FieldName = 'VL_TAXA'
    end
    object ADOQueryPagDS_FORMPAG: TWideStringField
      DisplayLabel = 'Forma Pagamento'
      FieldName = 'DS_FORMPAG'
      Size = 255
    end
  end
  object srcPag: TDataSource
    DataSet = ADOQueryPag
    Left = 248
    Top = 224
  end
end
