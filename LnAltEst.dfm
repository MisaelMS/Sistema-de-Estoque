object FLnAltEst: TFLnAltEst
  Left = 0
  Top = 0
  Caption = ' Alterar Estoque'
  ClientHeight = 441
  ClientWidth = 929
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 929
    Height = 41
    Align = alTop
    Color = 8404992
    ParentBackground = False
    TabOrder = 0
    object SpeedButton4: TSpeedButton
      Left = 1
      Top = 1
      Width = 63
      Height = 39
      Align = alLeft
      Caption = '&Salvar'
      OnClick = SpeedButton4Click
      ExplicitLeft = 190
    end
  end
  object panTitulo: TPanel
    Left = 0
    Top = 41
    Width = 929
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
      Left = 757
      Top = 0
      Width = 172
      Height = 23
      Align = alRight
      BevelOuter = bvNone
      Color = clHighlight
      TabOrder = 0
    end
  end
  object PlnBotao: TPanel
    Left = 0
    Top = 64
    Width = 929
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label3: TLabel
      Left = 12
      Top = 9
      Width = 60
      Height = 15
      Caption = 'Fornecedor'
    end
    object DBFornec: TDBEdit
      Left = 78
      Top = 6
      Width = 59
      Height = 23
      DataField = 'CD_FORNEC'
      DataSource = srcLancam
      Enabled = False
      TabOrder = 0
    end
    object EdtFornec: TEdit
      Left = 145
      Top = 6
      Width = 288
      Height = 23
      Color = clScrollBar
      Enabled = False
      TabOrder = 1
    end
  end
  object panMsg: TPanel
    Left = 0
    Top = 417
    Width = 929
    Height = 24
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
    TabOrder = 3
  end
  object GridProdutos: TDBGrid
    Left = 0
    Top = 153
    Width = 929
    Height = 264
    Align = alClient
    Color = clWhite
    DataSource = srcLancam
    DrawingStyle = gdsGradient
    FixedColor = clWhite
    GradientEndColor = 13270046
    GradientStartColor = clCream
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnColExit = GridProdutosColExit
    OnEnter = GridProdutosEnter
    Columns = <
      item
        Expanded = False
        FieldName = 'CH_PRODUT'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_PRODUT'
        Width = 208
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_QTD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_PRECOM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_PERCPREC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_PREVEND'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_TRANS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_ENTRADA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_TOTAL'
        Visible = True
      end>
  end
  object ADTabEst: TADOTable
    Active = True
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    TableName = 'CEESTOQ'
    Left = 368
    Top = 8
    object ADTabEstCH_PRODUT: TWideStringField
      FieldName = 'CH_PRODUT'
      Size = 255
    end
    object ADTabEstVL_QTD: TIntegerField
      FieldName = 'VL_QTD'
    end
    object ADTabEstVl_QTDVEND: TIntegerField
      FieldName = 'Vl_QTDVEND'
    end
    object ADTabEstDT_ENTRADA: TDateTimeField
      FieldName = 'DT_ENTRADA'
    end
    object ADTabEstDT_SAIDA: TDateTimeField
      FieldName = 'DT_SAIDA'
    end
    object ADTabEstCD_FORNEC: TIntegerField
      FieldName = 'CD_FORNEC'
    end
    object ADTabEstCD_CLIENT: TIntegerField
      FieldName = 'CD_CLIENT'
    end
    object ADTabEstCD_EST: TIntegerField
      FieldName = 'CD_EST'
    end
    object ADTabEstVL_PRECOM: TFloatField
      FieldName = 'VL_PRECOM'
    end
    object ADTabEstVL_PREVEND: TFloatField
      FieldName = 'VL_PREVEND'
    end
    object ADTabEstVL_TRANS: TFloatField
      FieldName = 'VL_TRANS'
    end
    object ADTabEstVL_PERCPREC: TFloatField
      FieldName = 'VL_PERCPREC'
    end
    object ADTabEstVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
  end
  object srcLancam: TDataSource
    DataSet = ADOQueryEst
    Left = 456
    Top = 8
  end
  object ADOQueryEst: TADOQuery
    Active = True
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    OnNewRecord = ADOQueryEstNewRecord
    Parameters = <
      item
        Name = 'PR_EST'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CEESTOQ.CH_PRODUT,'
      '       CEESTOQ.DS_PRODUT,'
      '       CEESTOQ.VL_QTD,'
      '       CEESTOQ.VL_QTDVEND,'
      '       CEESTOQ.DT_ENTRADA,'
      '       CEESTOQ.DT_SAIDA,'
      '       CEESTOQ.CD_FORNEC,'
      '       CEESTOQ.CD_EST,'
      '       CEESTOQ.VL_PRECOM,'
      '       CEESTOQ.VL_PREVEND,'
      '       CEESTOQ.VL_TRANS,'
      '       CEESTOQ.VL_PERCPREC,'
      '       CEESTOQ.VL_TOTAL'
      '  FROM CEESTOQ, CEPRODUTO'
      ' WHERE CEESTOQ.CH_PRODUT = CEPRODUTO.CH_PRODUT'
      '   AND CEPRODUTO.CH_ATIVO = '#39'S'#39
      '   AND CEESTOQ.CD_EST = :PR_EST')
    Left = 536
    Top = 8
    object ADOQueryEstCH_PRODUT: TWideStringField
      DisplayLabel = 'Produto'
      FieldName = 'CH_PRODUT'
      Size = 255
    end
    object ADOQueryEstVL_QTD: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'VL_QTD'
    end
    object ADOQueryEstVl_QTDVEND: TIntegerField
      DisplayLabel = 'Vendido'
      FieldName = 'Vl_QTDVEND'
    end
    object ADOQueryEstCD_EST: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_EST'
    end
    object ADOQueryEstVL_TRANS: TFloatField
      DisplayLabel = 'Transporte'
      FieldName = 'VL_TRANS'
    end
    object ADOQueryEstVL_PERCPREC: TFloatField
      DisplayLabel = '% Lucro'
      FieldName = 'VL_PERCPREC'
    end
    object ADOQueryEstVL_PRECOM: TFloatField
      DisplayLabel = 'Pre'#231'o Compra'
      FieldName = 'VL_PRECOM'
    end
    object ADOQueryEstVL_PREVEND: TFloatField
      DisplayLabel = 'Pre'#231'o Venda'
      FieldName = 'VL_PREVEND'
    end
    object ADOQueryEstVL_TOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'VL_TOTAL'
    end
    object ADOQueryEstDT_ENTRADA: TDateTimeField
      DisplayLabel = 'Data Entrada'
      FieldName = 'DT_ENTRADA'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object ADOQueryEstDT_SAIDA: TDateTimeField
      DisplayLabel = 'Data Saida'
      FieldName = 'DT_SAIDA'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object ADOQueryEstDS_PRODUT: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DS_PRODUT'
      Size = 255
    end
    object ADOQueryEstCD_FORNEC: TIntegerField
      FieldName = 'CD_FORNEC'
    end
  end
  object ADOQueryFornec: TADOQuery
    Active = True
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PR_FORNEC'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CD_FORNEC, DS_FORNEC'
      '  FROM SIFORNEC'
      ' WHERE CH_ATIVO = '#39'S'#39
      '   AND CD_FORNEC = :PR_FORNEC')
    Left = 644
    Top = 56
    object ADOQueryFornecCD_FORNEC: TIntegerField
      FieldName = 'CD_FORNEC'
    end
    object ADOQueryFornecDS_FORNEC: TWideStringField
      FieldName = 'DS_FORNEC'
      Size = 255
    end
  end
  object srcFornec: TDataSource
    DataSet = ADOQueryFornec
    Left = 716
    Top = 56
  end
  object ADOQueryProdut: TADOQuery
    Active = True
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PR_PRODUT'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT DS_PRODUT'
      'FROM CEPRODUTO'
      'WHERE CH_ATIVO = '#39'S'#39
      'AND CH_PRODUT = :PR_PRODUT')
    Left = 580
    Top = 104
    object ADOQueryProdutDS_PRODUT: TWideStringField
      FieldName = 'DS_PRODUT'
      Size = 255
    end
  end
  object ADOQueryUpdatePrin: TADOQuery
    Connection = FRDmComBas.ADCon
    Parameters = <
      item
        Name = 'PR_VALOR'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'PR_EST'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'Update CEESTOQPRIN'
      'Set VL_VALOR = :PR_VALOR'
      'Where CD_EST = :PR_EST')
    Left = 280
    Top = 16
  end
end
