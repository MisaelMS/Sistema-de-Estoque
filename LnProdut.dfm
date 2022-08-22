object FLnProdut: TFLnProdut
  Left = 0
  Top = 0
  Caption = ' Lan'#231'amento de Produto'
  ClientHeight = 441
  ClientWidth = 926
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object panMsg: TPanel
    Left = 0
    Top = 417
    Width = 926
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
    TabOrder = 0
  end
  object panTitulo: TPanel
    Left = 0
    Top = 41
    Width = 926
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
      Left = 754
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
    Width = 926
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
      TabOrder = 0
      OnEnter = DBFornecEnter
      OnExit = DBFornecExit
      OnKeyPress = DBFornecKeyPress
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 926
    Height = 41
    Align = alTop
    Color = 8404992
    ParentBackground = False
    TabOrder = 3
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
  object GridProdutos: TDBGrid
    Left = 0
    Top = 153
    Width = 926
    Height = 238
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
        ReadOnly = True
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_QTD'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_PRECOM'
        Width = 85
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
        ReadOnly = True
        Width = 75
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
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_TOTAL'
        ReadOnly = True
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 391
    Width = 926
    Height = 26
    Align = alBottom
    TabOrder = 5
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
    BeforePost = ADOQueryEstBeforePost
    OnNewRecord = ADOQueryEstNewRecord
    Parameters = <>
    SQL.Strings = (
      'SELECT TPESTOQ.*'
      '  FROM TPESTOQ, CEPRODUTO'
      ' WHERE TPESTOQ.CH_PRODUT = CEPRODUTO.CH_PRODUT'
      '   AND CEPRODUTO.CH_ATIVO = '#39'S'#39)
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
    object ADOQueryEstNR_SEQUEN: TAutoIncField
      FieldName = 'NR_SEQUEN'
      ReadOnly = True
    end
    object ADOQueryEstCD_CLIENT: TIntegerField
      FieldName = 'CD_CLIENT'
    end
    object ADOQueryEstVL_TOTALEST: TFloatField
      FieldName = 'VL_TOTALEST'
    end
  end
  object srcFornec: TDataSource
    DataSet = ADOQueryFornec
    Left = 888
    Top = 24
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
    Left = 832
    Top = 24
    object ADOQueryFornecCD_FORNEC: TIntegerField
      FieldName = 'CD_FORNEC'
    end
    object ADOQueryFornecDS_FORNEC: TWideStringField
      FieldName = 'DS_FORNEC'
      Size = 255
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
    Left = 736
    Top = 24
    object ADOQueryProdutDS_PRODUT: TWideStringField
      FieldName = 'DS_PRODUT'
      Size = 255
    end
  end
  object QueryPesquisaEsPrin: TADOQuery
    Active = True
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select MAX(cd_est)'
      'from ceestoqprin')
    Left = 656
    Top = 16
    object QueryPesquisaEsPrinExpr1000: TIntegerField
      FieldName = 'Expr1000'
    end
  end
  object ADOQueryPrin: TADOQuery
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pr_totalest'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'pr_fornec'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'pr_entrada'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO CEESTOQPRIN (vl_valor, cd_fornec,'
      '                                 dt_entrada, ch_status)'
      'Values (:pr_totalest, :pr_fornec,'
      '           :pr_entrada, '#39'A'#39')')
    Left = 296
    Top = 8
  end
  object ADOQueryEstInsert: TADOQuery
    Connection = FRDmComBas.ADCon
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
      'insert into ceestoq (cd_est, ch_produt, vl_qtd,'
      '                               dt_entrada, cd_fornec, vl_precom,'
      
        '                               vl_prevend, vl_trans, vl_percprec' +
        ','
      '                               vl_total, ds_produt)'
      'select :PR_EST, ch_produt, vl_qtd,'
      '          dt_entrada, cd_fornec, vl_precom,'
      '          vl_prevend, vl_trans, vl_percprec,'
      '          vl_total, ds_produt'
      'FROM TPESTOQ')
    Left = 368
    Top = 16
  end
end
