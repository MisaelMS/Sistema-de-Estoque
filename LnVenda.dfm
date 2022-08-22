object FLnVenda: TFLnVenda
  Left = 0
  Top = 0
  Caption = ' Lan'#231'amento de Venda'
  ClientHeight = 476
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object GridVenda: TDBGrid
    Left = 0
    Top = 128
    Width = 800
    Height = 298
    Align = alBottom
    Color = clWhite
    DataSource = srcLancam
    DrawingStyle = gdsGradient
    FixedColor = clWhite
    GradientEndColor = 13270046
    GradientStartColor = clCream
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnColExit = GridVendaColExit
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
        FieldName = 'VL_VENDITEM'
        ReadOnly = True
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 41
    Align = alTop
    Color = 8404992
    ParentBackground = False
    TabOrder = 1
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
    Top = 452
    Width = 800
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
    TabOrder = 2
  end
  object panTitulo: TPanel
    Left = 0
    Top = 41
    Width = 800
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
    TabOrder = 3
    object panCampo: TPanel
      Left = 628
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
    Width = 800
    Height = 64
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 4
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
    object DBClient: TDBEdit
      Left = 107
      Top = 7
      Width = 59
      Height = 23
      DataField = 'CD_CLIENT'
      DataSource = srcLancam
      TabOrder = 0
      OnExit = DBClientExit
    end
    object EdtClient: TEdit
      Left = 174
      Top = 7
      Width = 453
      Height = 23
      Color = clScrollBar
      Enabled = False
      TabOrder = 1
    end
    object DBEditPag: TDBEdit
      Left = 107
      Top = 36
      Width = 59
      Height = 23
      DataField = 'CD_PAG'
      DataSource = srcLancam
      TabOrder = 2
      OnExit = DBEditPagExit
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
      TabOrder = 3
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
      TabOrder = 4
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
      TabOrder = 5
    end
    object EditParcelas: TEdit
      Left = 605
      Top = 36
      Width = 22
      Height = 23
      Hint = 'Parcelas'
      Color = clScrollBar
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 426
    Width = 800
    Height = 26
    Align = alBottom
    TabOrder = 5
    object Label2: TLabel
      Left = 672
      Top = 6
      Width = 54
      Height = 15
      Caption = 'Valor Total'
    end
    object Edit1: TEdit
      Left = 733
      Top = 2
      Width = 51
      Height = 23
      Enabled = False
      TabOrder = 0
      Text = '0,00'
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
    Left = 692
    Top = 144
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
  object ADOQueryProdut: TADOQuery
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
    Left = 740
    Top = 200
    object ADOQueryProdutDS_PRODUT: TWideStringField
      FieldName = 'DS_PRODUT'
      Size = 255
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
    Left = 688
    Top = 200
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
  object srcLancam: TDataSource
    DataSet = ADOQueryVend
    Left = 464
    Top = 320
  end
  object ADOQueryVend: TADOQuery
    Active = True
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    OnNewRecord = ADOQueryVendNewRecord
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM TPVEND')
    Left = 384
    Top = 320
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
      DisplayLabel = 'Desconto (%)'
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
    object ADOQueryVendVL_VENDITEM: TFloatField
      DisplayLabel = 'Valor Item'
      FieldName = 'VL_VENDITEM'
    end
    object ADOQueryVendCD_CLIENT: TIntegerField
      FieldName = 'CD_CLIENT'
    end
    object ADOQueryVendCD_PAG: TIntegerField
      FieldName = 'CD_PAG'
    end
    object ADOQueryVendVL_VENDATOTAL: TFloatField
      FieldName = 'VL_VENDATOTAL'
    end
    object ADOQueryVendVL_PARCELAS: TFloatField
      FieldName = 'VL_PARCELAS'
    end
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
    Left = 744
    Top = 64
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
  object ADOQueryInsertVendPrin: TADOQuery
    Connection = FRDmComBas.ADCon
    Parameters = <
      item
        Name = 'pr_client'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'pr_pag'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'pr_venda'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'pr_dtvend'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'pr_parc'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO CEVENDPRIN (CD_CLIENT, CD_PAG, VL_VENDA,'
      '                        DT_CADAST, VL_PARCELAS)'
      'Values (:pr_client, :pr_pag, :pr_venda,'
      '           :pr_dtvend, :pr_parc)')
    Left = 488
    Top = 152
  end
  object ADOQueryInsertVend: TADOQuery
    Connection = FRDmComBas.ADCon
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
      'INSERT INTO CEVEND (CD_VEND, CD_EST, CH_PRODUT,'
      '                    DS_PRODUT, NR_QTD, VL_VEND,'
      '                    VL_DESCONT, DT_VEND, VL_VENDTOTAL)'
      'SELECT :pr_vend, CD_EST, CH_PRODUT,'
      '       DS_PRODUT, NR_QTD, VL_VEND,'
      '       VL_DESCONT, DT_VEND, VL_VENDITEM'
      '  FROM TPVEND')
    Left = 424
    Top = 184
  end
  object QueryPesquisaVendPrin: TADOQuery
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select MAX(cd_vend)'
      'from cevendprin')
    Left = 568
    Top = 184
    object QueryPesquisaVendPrinExpr1000: TIntegerField
      FieldName = 'Expr1000'
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
    Top = 264
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
end
