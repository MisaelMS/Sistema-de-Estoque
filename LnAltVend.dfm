object FLnAltVend: TFLnAltVend
  Left = 0
  Top = 0
  Caption = 'Altera'#231#227'o de Venda'
  ClientHeight = 441
  ClientWidth = 756
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
    Width = 756
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
  object panMsg: TPanel
    Left = 0
    Top = 417
    Width = 756
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
    TabOrder = 1
  end
  object panTitulo: TPanel
    Left = 0
    Top = 41
    Width = 756
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
    TabOrder = 2
    object panCampo: TPanel
      Left = 584
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
    Width = 756
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object Label3: TLabel
      Left = 67
      Top = 10
      Width = 37
      Height = 15
      Caption = 'Cliente'
    end
    object Label1: TLabel
      Left = 3
      Top = 39
      Width = 98
      Height = 15
      Caption = 'Forma Pagamento'
    end
    object EdtClient: TEdit
      Left = 171
      Top = 7
      Width = 453
      Height = 23
      Color = clScrollBar
      Enabled = False
      TabOrder = 0
    end
    object EditDescPag: TEdit
      Left = 174
      Top = 36
      Width = 288
      Height = 23
      Hint = 'Descri'#231#227'o Pagamento'
      Color = clScrollBar
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object EditPagamento: TEdit
      Left = 466
      Top = 36
      Width = 109
      Height = 23
      Hint = 'Forma de pagamento'
      Color = clScrollBar
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object EditTaxa: TEdit
      Left = 579
      Top = 36
      Width = 22
      Height = 23
      Hint = 'Taxas/Juros'
      Color = clScrollBar
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object EditParcelas: TEdit
      Left = 602
      Top = 36
      Width = 22
      Height = 23
      Hint = 'Parcelas'
      Color = clScrollBar
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object EditClient: TEdit
      Left = 107
      Top = 7
      Width = 59
      Height = 23
      Enabled = False
      TabOrder = 5
    end
    object EditPag: TEdit
      Left = 106
      Top = 36
      Width = 59
      Height = 23
      Enabled = False
      TabOrder = 6
    end
  end
  object GridVenda: TDBGrid
    Left = 0
    Top = 129
    Width = 756
    Height = 288
    Align = alBottom
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
    OnColExit = GridVendaColExit
    OnEnter = GridVendaEnter
    Columns = <
      item
        Expanded = False
        FieldName = 'CD_EST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CH_PRODUT'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DS_PRODUT'
        ReadOnly = True
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_VEND'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_QTD'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_DESCONT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_VEND'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_VENDTOTAL'
        Visible = True
      end>
  end
  object srcLancam: TDataSource
    DataSet = ADOQueryVend
    Left = 576
    Top = 280
  end
  object ADOQueryVend: TADOQuery
    Active = True
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    OnNewRecord = ADOQueryVendNewRecord
    Parameters = <
      item
        Name = 'PR_VEND'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM CEVEND'
      'WHERE CEVEND.CD_VEND = :PR_VEND')
    Left = 496
    Top = 280
    object ADOQueryVendCD_EST: TIntegerField
      DisplayLabel = 'Estoque'
      DisplayWidth = 7
      FieldName = 'CD_EST'
    end
    object ADOQueryVendCH_PRODUT: TWideStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 255
      FieldName = 'CH_PRODUT'
      Size = 255
    end
    object ADOQueryVendNR_QTD: TIntegerField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'NR_QTD'
    end
    object ADOQueryVendVL_DESCONT: TFloatField
      DisplayLabel = 'Desconto'
      FieldName = 'VL_DESCONT'
    end
    object ADOQueryVendDT_VEND: TDateTimeField
      DisplayLabel = 'Data Venda'
      DisplayWidth = 18
      FieldName = 'DT_VEND'
    end
    object ADOQueryVendVL_VEND: TFloatField
      DisplayLabel = 'Valor Venda'
      FieldName = 'VL_VEND'
    end
    object ADOQueryVendDS_PRODUT: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DS_PRODUT'
      Size = 255
    end
    object ADOQueryVendVL_VENDTOTAL: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_VENDTOTAL'
    end
    object ADOQueryVendCD_VEND: TIntegerField
      FieldName = 'CD_VEND'
    end
    object ADOQueryVendNR_ITEM: TAutoIncField
      FieldName = 'NR_ITEM'
      ReadOnly = True
    end
  end
  object ADOQueryEst: TADOQuery
    Active = True
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PR_EST'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'PR_PROD'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'PR_PROD2'
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
      '  FROM CEESTOQ'
      ' WHERE CEESTOQ.CD_EST = :PR_EST'
      '   AND (:PR_PROD = '#39'T'#39' OR CEESTOQ.CH_PRODUT = :PR_PROD2)')
    Left = 484
    Top = 208
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
    Top = 216
    object ADOQueryProdutDS_PRODUT: TWideStringField
      FieldName = 'DS_PRODUT'
      Size = 255
    end
  end
  object ADOQueryClient: TADOQuery
    Active = True
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PR_CLIENT'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CD_CLIENT, DS_CLIENT, CH_ATIVO'
      'FROM SICLIENT'
      'WHERE CH_ATIVO = '#39'S'#39
      'AND CD_CLIENT = :PR_CLIENT')
    Left = 516
    Top = 80
    object ADOQueryClientCD_CLIENT: TAutoIncField
      FieldName = 'CD_CLIENT'
      ReadOnly = True
    end
    object ADOQueryClientDS_CLIENT: TWideStringField
      FieldName = 'DS_CLIENT'
      Size = 50
    end
    object ADOQueryClientCH_ATIVO: TWideStringField
      FieldName = 'CH_ATIVO'
      Size = 255
    end
  end
  object srcClient: TDataSource
    DataSet = ADOQueryClient
    Left = 588
    Top = 80
  end
  object ADOQueryPag: TADOQuery
    Active = True
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PR_PAG'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'Select * From SiPag'
      'Where ch_ativo = '#39'S'#39
      'and Sipag.cd_pag = :PR_PAG')
    Left = 468
    Top = 16
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
      FieldName = 'DS_FORMPAG'
      Size = 255
    end
  end
  object QueryPesquisaVendPrin: TADOQuery
    Active = True
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pr_vend'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'Select *'
      'from cevendprin'
      'where cd_vend = :pr_vend')
    Left = 680
    Top = 216
    object QueryPesquisaVendPrinCD_VEND: TAutoIncField
      FieldName = 'CD_VEND'
      ReadOnly = True
    end
    object QueryPesquisaVendPrinCD_CLIENT: TIntegerField
      FieldName = 'CD_CLIENT'
    end
    object QueryPesquisaVendPrinCD_PAG: TIntegerField
      FieldName = 'CD_PAG'
    end
    object QueryPesquisaVendPrinVL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object QueryPesquisaVendPrinDT_CADAST: TDateTimeField
      FieldName = 'DT_CADAST'
    end
    object QueryPesquisaVendPrinVL_PARCELAS: TFloatField
      FieldName = 'VL_PARCELAS'
    end
  end
  object ADOQueryUpdateEst: TADOQuery
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PR_QTD'
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
      end
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
      'UPDATE CEESTOQ'
      '       SET CEESTOQ.VL_QTDVEND = :PR_QTD'
      ' WHERE CEESTOQ.CD_EST = :PR_EST'
      '   AND CEESTOQ.CH_PRODUT = :PR_PRODUT')
    Left = 688
    Top = 288
    object WideStringField1: TWideStringField
      DisplayLabel = 'Produto'
      FieldName = 'CH_PRODUT'
      Size = 255
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'VL_QTD'
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Vendido'
      FieldName = 'Vl_QTDVEND'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_EST'
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Transporte'
      FieldName = 'VL_TRANS'
    end
    object FloatField2: TFloatField
      DisplayLabel = '% Lucro'
      FieldName = 'VL_PERCPREC'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Pre'#231'o Compra'
      FieldName = 'VL_PRECOM'
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Pre'#231'o Venda'
      FieldName = 'VL_PREVEND'
    end
    object FloatField5: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'VL_TOTAL'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data Entrada'
      FieldName = 'DT_ENTRADA'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data Saida'
      FieldName = 'DT_SAIDA'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object WideStringField2: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DS_PRODUT'
      Size = 255
    end
    object IntegerField4: TIntegerField
      FieldName = 'CD_FORNEC'
    end
  end
  object ADOQueryVendCalc: TADOQuery
    Active = True
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PR_VEND'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM CEVEND'
      'WHERE CEVEND.CD_VEND = :PR_VEND')
    Left = 360
    Top = 264
    object ADOQueryVendCalcCD_VEND: TIntegerField
      FieldName = 'CD_VEND'
    end
    object ADOQueryVendCalcNR_ITEM: TAutoIncField
      FieldName = 'NR_ITEM'
      ReadOnly = True
    end
    object ADOQueryVendCalcCD_EST: TIntegerField
      FieldName = 'CD_EST'
    end
    object ADOQueryVendCalcCH_PRODUT: TWideStringField
      FieldName = 'CH_PRODUT'
      Size = 255
    end
    object ADOQueryVendCalcNR_QTD: TIntegerField
      FieldName = 'NR_QTD'
    end
    object ADOQueryVendCalcVL_VEND: TFloatField
      FieldName = 'VL_VEND'
    end
    object ADOQueryVendCalcVL_VENDTOTAL: TFloatField
      FieldName = 'VL_VENDTOTAL'
    end
    object ADOQueryVendCalcDT_VEND: TDateTimeField
      FieldName = 'DT_VEND'
    end
    object ADOQueryVendCalcVL_DESCONT: TFloatField
      FieldName = 'VL_DESCONT'
    end
    object ADOQueryVendCalcDS_PRODUT: TWideStringField
      FieldName = 'DS_PRODUT'
      Size = 255
    end
  end
  object ADOQueryUpdatePrin: TADOQuery
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PR_VALOR'
        Size = -1
        Value = Null
      end
      item
        Name = 'PR_PARC'
        Size = -1
        Value = Null
      end
      item
        Name = 'PR_VEND'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE CEVENDPRIN'
      'SET VL_VALOR = :PR_VALOR,'
      '       VL_PARCELAS = :PR_PARC'
      'WHERE CEVEND.CD_VEND = :PR_VEND')
    Left = 352
    Top = 344
  end
end
