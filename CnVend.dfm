object FCnVend: TFCnVend
  Left = 0
  Top = 0
  Caption = ' Consulta de Vendas'
  ClientHeight = 239
  ClientWidth = 624
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object PlnBotao: TPanel
    Left = 0
    Top = 64
    Width = 624
    Height = 151
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 37
      Top = 28
      Width = 37
      Height = 15
      Caption = 'Cliente'
    end
    object SpeedButton5: TSpeedButton
      Left = 540
      Top = 110
      Width = 79
      Height = 32
      Caption = 'Imprimir'
      OnClick = SpeedButton5Click
    end
    object SpeedButton6: TSpeedButton
      Left = 455
      Top = 110
      Width = 79
      Height = 32
      Caption = 'Cancelar'
    end
    object Label5: TLabel
      Left = 31
      Top = 76
      Width = 43
      Height = 15
      Caption = 'Produto'
    end
    object Label3: TLabel
      Left = 16
      Top = 123
      Width = 58
      Height = 15
      Caption = 'Data Inicial'
    end
    object Label4: TLabel
      Left = 195
      Top = 123
      Width = 52
      Height = 15
      Caption = 'Data Final'
    end
    object SpeedButton7: TSpeedButton
      Left = 373
      Top = 110
      Width = 78
      Height = 32
      Caption = 'Gr'#225'fico'
      OnClick = SpeedButton7Click
    end
    object cbclient: TCheckBox
      Left = 80
      Top = 5
      Width = 97
      Height = 17
      Caption = 'Todos Clientes'
      TabOrder = 0
      OnClick = cbclientClick
    end
    object EditCli: TEdit
      Left = 80
      Top = 25
      Width = 133
      Height = 23
      TabOrder = 1
    end
    object EditProd: TEdit
      Left = 80
      Top = 73
      Width = 133
      Height = 23
      TabOrder = 2
    end
    object cbprod: TCheckBox
      Left = 80
      Top = 53
      Width = 97
      Height = 17
      Caption = 'Todos Produtos'
      TabOrder = 3
      OnClick = cbprodClick
    end
    object DTINI: TDateTimePicker
      Left = 80
      Top = 119
      Width = 97
      Height = 23
      Date = 44716.000000000000000000
      Time = 0.799033518516807800
      TabOrder = 4
    end
    object DTFIN: TDateTimePicker
      Left = 253
      Top = 119
      Width = 97
      Height = 23
      Date = 44716.000000000000000000
      Time = 0.799033518516807800
      TabOrder = 5
    end
    object cbPer: TCheckBox
      Left = 80
      Top = 101
      Width = 128
      Height = 17
      Caption = 'Todos os per'#237'odos'
      TabOrder = 6
      OnClick = cbPerClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    Color = 8404992
    ParentBackground = False
    TabOrder = 1
  end
  object panMsg: TPanel
    Left = 0
    Top = 215
    Width = 624
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
    Width = 624
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
      Left = 452
      Top = 0
      Width = 172
      Height = 23
      Align = alRight
      BevelOuter = bvNone
      Color = clHighlight
      TabOrder = 0
    end
  end
  object frxDB: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cd_vend=cd_vend'
      'vl_venda=vl_venda'
      'cd_client=cd_client'
      'dt_cadast=dt_cadast'
      'nr_item=nr_item'
      'ch_produt=ch_produt'
      'ds_produt=ds_produt'
      'nr_qtd=nr_qtd'
      'dt_vend=dt_vend'
      'vl_vend=vl_vend'
      'vl_descont=vl_descont'
      'vl_vendtotal=vl_vendtotal'
      'ds_client=ds_client')
    DataSet = Consulta
    BCDToCurrency = False
    Left = 288
    Top = 72
  end
  object src: TDataSource
    DataSet = Consulta
    Left = 288
    Top = 121
  end
  object Consulta: TADOQuery
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
      end
      item
        Name = 'PR_CLIENT'
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
        Name = 'PR_PROD'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'PR_TODAS'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'PR_INI'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'PR_FIN'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'Select cevendprin.cd_vend,'
      '            cevendprin.vl_venda,'
      '            cevendprin.cd_client,'
      '            cevendprin.dt_cadast,'
      '            cevend.nr_item,'
      '            cevend.ch_produt,'
      '            cevend.ds_produt,'
      '            cevend.nr_qtd,'
      '            cevend.dt_vend,'
      '            cevend.vl_vend,'
      '            cevend.vl_descont,'
      '            cevend.vl_vendtotal,'
      '            siclient.ds_client'
      'from cevendprin, cevend, siclient'
      'where cevendprin.cd_vend = cevend.cd_vend'
      '  and cevendprin.cd_client = siclient.cd_client'
      '  and (:PR_CLIENT = 0 OR cevendprin.cd_client = :PR_CLIENT)'
      '  and (:PR_PROD = '#39'T'#39' OR cevend.ch_produt = :PR_PROD)'
      
        '  and (:PR_TODAS = '#39'S'#39' OR cevendprin.dt_cadast between :PR_INI a' +
        'nd :PR_FIN)')
    Left = 360
    Top = 120
    object Consultacd_vend: TAutoIncField
      FieldName = 'cd_vend'
      ReadOnly = True
    end
    object Consultavl_venda: TFloatField
      FieldName = 'vl_venda'
    end
    object Consultacd_client: TIntegerField
      FieldName = 'cd_client'
    end
    object Consultadt_cadast: TDateTimeField
      FieldName = 'dt_cadast'
    end
    object Consultanr_item: TAutoIncField
      FieldName = 'nr_item'
      ReadOnly = True
    end
    object Consultach_produt: TWideStringField
      FieldName = 'ch_produt'
      Size = 255
    end
    object Consultads_produt: TWideStringField
      FieldName = 'ds_produt'
      Size = 255
    end
    object Consultanr_qtd: TIntegerField
      FieldName = 'nr_qtd'
    end
    object Consultadt_vend: TDateTimeField
      FieldName = 'dt_vend'
    end
    object Consultavl_vend: TFloatField
      FieldName = 'vl_vend'
    end
    object Consultavl_descont: TFloatField
      FieldName = 'vl_descont'
    end
    object Consultavl_vendtotal: TFloatField
      FieldName = 'vl_vendtotal'
    end
    object Consultads_client: TWideStringField
      FieldName = 'ds_client'
      Size = 50
    end
  end
  object Relat: TfrxReport
    Version = '2021.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44739.829971562500000000
    ReportOptions.LastChange = 44739.842958414360000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 432
    Top = 120
    Datasets = <
      item
        DataSet = frxDB
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Report')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110236220000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = -0.298328140000000000
          Width = 53.073145200000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Item')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 318.564782580000000000
          Width = 84.157368910000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 413.270111530000000000
          Width = 54.990595570000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor:')
          ParentFont = False
          Style = 'Header'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 500.260707100000000000
          Width = 74.165099260000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Desconto')
          ParentFont = False
          Style = 'Header'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 632.268416370000000000
          Width = 82.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor Final')
          ParentFont = False
          Style = 'Header'
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Width = 56.852675200000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
          Style = 'Header'
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 169.606370000000000000
          Width = 68.191265200000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
          Style = 'Header'
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."cd_client"'
        object Memo13: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          DataField = 'cd_client'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 16053492
          Memo.UTF8W = (
            '[frxDBDataset1."cd_client"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 193.693276370000000000
          Top = 3.779530000000000000
          Width = 74.795192780000000000
          Height = 18.897650000000000000
          DataField = 'ds_client'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ds_client"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object GroupHeader3: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."cd_vend"'
        object Memo15: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          DataField = 'cd_vend'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 16053492
          Memo.UTF8W = (
            '[frxDBDataset1."cd_vend"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
          Top = 3.779530000000000000
          Width = 61.701671860000000000
          Height = 18.897650000000000000
          DataField = 'vl_venda'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."vl_venda"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 204.094620000000000000
          Top = 3.220470000000000000
          Width = 42.804021860000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor: ')
          ParentFont = False
          Style = 'Header'
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 354.060741490000000000
          Top = 4.000000000000000000
          Width = 43.225140050000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data: ')
          ParentFont = False
          Style = 'Header'
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 399.772019140000000000
          Top = 3.779530000000000000
          Width = 68.889237080000000000
          Height = 18.897650000000000000
          DataField = 'dt_cadast'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."dt_cadast"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        DataSet = frxDB
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = -0.298328140000000000
          Width = 53.073145200000000000
          Height = 18.897650000000000000
          DataField = 'nr_item'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."nr_item"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 319.344312580000000000
          Width = 80.377838910000000000
          Height = 18.897650000000000000
          DataField = 'nr_qtd'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."nr_qtd"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 500.260707100000000000
          Width = 74.165099260000000000
          Height = 18.897650000000000000
          DataField = 'vl_descont'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."vl_descont"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 632.268416370000000000
          Width = 82.000000000000000000
          Height = 18.897650000000000000
          DataField = 'vl_vendtotal'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."vl_vendtotal"]')
          ParentFont = False
          Style = 'Data'
        end
        object frxDBDataset1ch_produt: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'ch_produt'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ch_produt"]')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 168.467767060000000000
          Width = 147.569495520000000000
          Height = 18.897650000000000000
          DataField = 'ds_produt'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ds_produt"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 413.270111530000000000
          Width = 54.990595570000000000
          Height = 18.897650000000000000
          DataField = 'vl_vend'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."vl_vend"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Top = 313.700990000000000000
        Width = 718.110700000000000000
      end
      object GroupFooter3: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Top = 291.023810000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 374.173470000000000000
        Width = 718.110700000000000000
        object Memo26: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo28: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520100000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
end
