object FCnEst: TFCnEst
  Left = 0
  Top = 0
  Caption = ' Consulta de Estoque'
  ClientHeight = 239
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    Color = 8404992
    ParentBackground = False
    TabOrder = 0
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
    TabOrder = 1
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
  object PlnBotao: TPanel
    Left = 0
    Top = 64
    Width = 624
    Height = 151
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object Label2: TLabel
      Left = 3
      Top = 27
      Width = 71
      Height = 15
      Caption = 'Fornecedores'
    end
    object Label3: TLabel
      Left = 16
      Top = 123
      Width = 58
      Height = 15
      Caption = 'Data Inicial'
    end
    object SpeedButton5: TSpeedButton
      Left = 539
      Top = 110
      Width = 77
      Height = 32
      Caption = 'Imprimir'
      OnClick = SpeedButton5Click
    end
    object Label4: TLabel
      Left = 195
      Top = 123
      Width = 52
      Height = 15
      Caption = 'Data Final'
    end
    object SpeedButton6: TSpeedButton
      Left = 456
      Top = 110
      Width = 77
      Height = 32
      Caption = 'Cancelar'
      OnClick = SpeedButton6Click
    end
    object Label5: TLabel
      Left = 31
      Top = 75
      Width = 43
      Height = 15
      Caption = 'Produto'
    end
    object SpeedButton7: TSpeedButton
      Left = 373
      Top = 110
      Width = 77
      Height = 32
      Caption = 'Gr'#225'fico'
      OnClick = SpeedButton7Click
    end
    object cbFornec: TCheckBox
      Left = 80
      Top = 4
      Width = 128
      Height = 17
      Caption = 'Todos Fornecedores'
      TabOrder = 0
      OnClick = cbFornecClick
    end
    object EditFornec: TEdit
      Left = 80
      Top = 24
      Width = 133
      Height = 23
      TabOrder = 1
    end
    object EditProd: TEdit
      Left = 80
      Top = 72
      Width = 133
      Height = 23
      TabOrder = 2
    end
    object cbProd: TCheckBox
      Left = 80
      Top = 52
      Width = 128
      Height = 17
      Caption = 'Todos Produtos'
      TabOrder = 3
      OnClick = cbProdClick
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
      Date = 44834.000000000000000000
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
  object Consulta: TADOQuery
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
      end
      item
        Name = 'PR_FORNEC'
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
      'Select ceestoqprin.cd_est,'
      '            ceestoqprin.vl_valor,'
      '            ceestoqprin.cd_fornec,'
      '            ceestoqprin.dt_entrada,'
      '            ceestoqprin.ch_status,'
      '            ceestoq.nr_item,'
      '            ceestoq.ch_produt,'
      '            ceestoq.ds_produt,'
      '            ceestoq.vl_qtd,'
      '            ceestoq.dt_entrada,'
      '            ceestoq.vl_precom,'
      '            ceestoq.vl_prevend,'
      '            ceestoq.vl_trans,'
      '            ceestoq.vl_percprec,'
      '            ceestoq.vl_total,'
      '            sifornec.ds_fornec'
      'from ceestoqprin, ceestoq, sifornec'
      'where ceestoqprin.cd_est = ceestoq.cd_est'
      '  and ceestoqprin.cd_fornec = sifornec.cd_fornec'
      '  and ceestoq.cd_fornec = sifornec.cd_fornec'
      '  and (:PR_FORNEC = 0 OR ceestoqprin.cd_fornec = :PR_FORNEC)'
      '  and (:PR_PROD = '#39'T'#39' OR ceestoq.ch_produt = :PR_PROD)'
      
        '  and (:PR_TODAS = '#39'S'#39' OR ceestoq.dt_entrada between :PR_INI and' +
        ' :PR_FIN)')
    Left = 360
    Top = 112
    object Consultacd_est: TIntegerField
      FieldName = 'cd_est'
    end
    object Consultavl_valor: TFloatField
      FieldName = 'vl_valor'
    end
    object Consultacd_fornec: TIntegerField
      FieldName = 'cd_fornec'
    end
    object Consultaceestoqprindt_entrada: TDateTimeField
      FieldName = 'ceestoqprin.dt_entrada'
    end
    object Consultach_status: TWideStringField
      FieldName = 'ch_status'
      Size = 255
    end
    object Consultanr_item: TIntegerField
      FieldName = 'nr_item'
    end
    object Consultach_produt: TWideStringField
      FieldName = 'ch_produt'
      Size = 255
    end
    object Consultads_produt: TWideStringField
      FieldName = 'ds_produt'
      Size = 255
    end
    object Consultavl_qtd: TIntegerField
      FieldName = 'vl_qtd'
    end
    object Consultaceestoqdt_entrada: TDateTimeField
      FieldName = 'ceestoq.dt_entrada'
    end
    object Consultavl_precom: TFloatField
      FieldName = 'vl_precom'
    end
    object Consultavl_prevend: TFloatField
      FieldName = 'vl_prevend'
    end
    object Consultavl_trans: TFloatField
      FieldName = 'vl_trans'
    end
    object Consultavl_percprec: TFloatField
      FieldName = 'vl_percprec'
    end
    object Consultavl_total: TFloatField
      FieldName = 'vl_total'
    end
    object Consultads_fornec: TWideStringField
      FieldName = 'ds_fornec'
      Size = 255
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
    ReportOptions.CreateDate = 44716.775585891200000000
    ReportOptions.LastChange = 44716.951788599540000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 432
    Top = 112
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
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 0.667336049999989000
          Width = 41.769275480000000000
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
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 65.285842630000000000
          Width = 34.539977800000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Qtd.')
          ParentFont = False
          Style = 'Header'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 125.825820430000000000
          Width = 74.753457520000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Entrada')
          ParentFont = False
          Style = 'Header'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 226.595047950000000000
          Width = 57.031126140000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Compra')
          ParentFont = False
          Style = 'Header'
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 315.405704090000000000
          Width = 59.440892040000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Venda')
          ParentFont = False
          Style = 'Header'
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 408.508006130000000000
          Width = 78.194811380000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Transporte')
          ParentFont = False
          Style = 'Header'
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 521.687047510000000000
          Width = 63.457168530000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Lucro')
          ParentFont = False
          Style = 'Header'
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 620.144216030000000000
          Width = 40.966020190000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total')
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
        Condition = 'frxDBDataset1."cd_est"'
        object Memo15: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = -2.000000000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
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
            'Estoque')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 190.777456080000000000
          Top = 1.779529999999990000
          Width = 121.291549970000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cadastro')
          ParentFont = False
          Style = 'Header'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 453.543600000000000000
          Top = 2.000000000000000000
          Width = 43.375786080000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
          Style = 'Header'
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 311.722416080000000000
          Top = 1.779529999999990000
          Width = 121.291549970000000000
          Height = 18.897650000000000000
          DataField = 'ceestoqprin.dt_entrada'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ceestoqprin.dt_entrada"]')
          ParentFont = False
          Style = 'Data'
        end
        object frxDBDataset1vl_valor: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 502.149970000000100000
          Top = 2.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."vl_valor"]')
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."cd_fornec"'
        object Memo16: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          DataField = 'cd_fornec'
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
            '[frxDBDataset1."cd_fornec"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
        object frxDBDataset1ds_fornec: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 188.992270000000000000
          Top = 3.779529999999990000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          DataField = 'ds_fornec'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ds_fornec"]')
          ParentFont = False
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
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset1."ch_status"'
        object Memo17: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          DataField = 'ch_produt'
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
            '[frxDBDataset1."ch_produt"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
        object frxDBDataset1ds_produt: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 188.976500000000000000
          Top = 3.779529999999990000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'ds_produt'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ds_produt"]')
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
        Top = 298.582870000000000000
        Width = 718.110700000000000000
        DataSet = frxDB
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = -1.631983950000000000
          Width = 41.769275480000000000
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
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 68.222762630000000000
          Width = 34.539977800000000000
          Height = 18.897650000000000000
          DataField = 'vl_qtd'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."vl_qtd"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 125.542270430000000000
          Width = 78.532987520000000000
          Height = 18.897650000000000000
          DataField = 'ceestoq.dt_entrada'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ceestoq.dt_entrada"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 226.634317950000000000
          Width = 57.031126140000000000
          Height = 18.897650000000000000
          DataField = 'vl_precom'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."vl_precom"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 315.444974090000000000
          Width = 59.440892040000000000
          Height = 18.897650000000000000
          DataField = 'vl_prevend'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."vl_prevend"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 411.444926130000000000
          Width = 44.179041380000000000
          Height = 18.897650000000000000
          DataField = 'vl_trans'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."vl_trans"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 520.096447509999900000
          Width = 63.457168530000000000
          Height = 18.897650000000000000
          DataField = 'vl_percprec'
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."vl_percprec"]')
          ParentFont = False
          Style = 'Data'
        end
        object frxDBDataset1vl_total: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 620.197280000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDB
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."vl_total"]')
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Top = 385.512060000000000000
        Width = 718.110700000000000000
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Top = 362.834880000000000000
        Width = 718.110700000000000000
      end
      object GroupFooter3: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Top = 340.157700000000000000
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
        Top = 445.984540000000000000
        Width = 718.110700000000000000
        object Memo30: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo32: TfrxMemoView
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
  object frxDB: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cd_est=cd_est'
      'vl_valor=vl_valor'
      'cd_fornec=cd_fornec'
      'ceestoqprin.dt_entrada=ceestoqprin.dt_entrada'
      'ch_status=ch_status'
      'nr_item=nr_item'
      'ch_produt=ch_produt'
      'ds_produt=ds_produt'
      'vl_qtd=vl_qtd'
      'ceestoq.dt_entrada=ceestoq.dt_entrada'
      'vl_precom=vl_precom'
      'vl_prevend=vl_prevend'
      'vl_trans=vl_trans'
      'vl_percprec=vl_percprec'
      'vl_total=vl_total'
      'ds_fornec=ds_fornec')
    DataSet = Consulta
    BCDToCurrency = False
    Left = 288
    Top = 64
  end
  object src: TDataSource
    DataSet = Consulta
    Left = 288
    Top = 113
  end
end
