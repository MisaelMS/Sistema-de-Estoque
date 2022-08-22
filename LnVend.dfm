object FLnVend: TFLnVend
  Left = 0
  Top = 0
  Caption = 'Lan'#231'amento de Venda'
  ClientHeight = 533
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object Image1: TImage
    Left = 464
    Top = 24
    Width = 105
    Height = 105
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 511
    Height = 41
    Align = alTop
    Color = 8404992
    ParentBackground = False
    TabOrder = 0
    object BtnFiltrar: TSpeedButton
      Left = 1
      Top = 1
      Width = 63
      Height = 39
      Hint = 'Filtrar'
      Align = alLeft
      Caption = '&Filtrar'
      OnClick = BtnFiltrarClick
      ExplicitLeft = 3
      ExplicitTop = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 216
    Width = 511
    Height = 252
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object GridProdutos: TDBGrid
      Left = 0
      Top = 0
      Width = 511
      Height = 252
      Align = alClient
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
      Columns = <
        item
          Expanded = False
          FieldName = 'CD_VEND'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_CADAST'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_VENDA'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_PARCELAS'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NR_PARC'
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 468
    Width = 511
    Height = 41
    Align = alBottom
    TabOrder = 2
    object SpeedButton2: TSpeedButton
      Left = 407
      Top = 6
      Width = 95
      Height = 29
      Caption = 'Inserir'
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 202
      Top = 6
      Width = 95
      Height = 29
      Caption = 'Deletar'
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 306
      Top = 6
      Width = 95
      Height = 29
      Caption = 'Alterar'
      Images = ImagemBotoes
      OnClick = SpeedButton4Click
    end
  end
  object panMsg: TPanel
    Left = 0
    Top = 509
    Width = 511
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
  object panTitulo: TPanel
    Left = 0
    Top = 41
    Width = 511
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
    TabOrder = 4
    object panCampo: TPanel
      Left = 339
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
    Width = 511
    Height = 152
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 5
    object Label2: TLabel
      Left = 37
      Top = 27
      Width = 37
      Height = 15
      Caption = 'Cliente'
    end
    object Label3: TLabel
      Left = 16
      Top = 124
      Width = 58
      Height = 15
      Caption = 'Data Inicial'
    end
    object Label4: TLabel
      Left = 183
      Top = 124
      Width = 16
      Height = 15
      Caption = 'at'#233
    end
    object Label1: TLabel
      Left = 42
      Top = 76
      Width = 32
      Height = 15
      Caption = 'Venda'
    end
    object CbClient: TCheckBox
      Left = 80
      Top = 4
      Width = 128
      Height = 17
      Caption = 'Todos os clientes'
      TabOrder = 0
      OnClick = CbClientClick
    end
    object EditClient: TEdit
      Left = 80
      Top = 24
      Width = 100
      Height = 23
      TabOrder = 1
      OnExit = EditClientExit
    end
    object EdtFornec: TEdit
      Left = 183
      Top = 24
      Width = 288
      Height = 23
      Color = clScrollBar
      Enabled = False
      TabOrder = 2
    end
    object ComboBox1: TComboBox
      Left = 326
      Top = 121
      Width = 145
      Height = 23
      ItemIndex = 0
      TabOrder = 3
      Text = 'Todas'
      Items.Strings = (
        'Todas'
        'Aberto'
        'Encerrado'
        'Cancelado')
    end
    object EditVend: TEdit
      Left = 80
      Top = 73
      Width = 100
      Height = 23
      TabOrder = 4
    end
    object CBVend: TCheckBox
      Left = 80
      Top = 55
      Width = 128
      Height = 17
      Caption = 'Todos as vendas'
      TabOrder = 5
      OnClick = CBVendClick
    end
    object ChkData: TCheckBox
      Left = 80
      Top = 101
      Width = 128
      Height = 17
      Caption = 'Todos os per'#237'odos'
      TabOrder = 6
      OnClick = ChkDataClick
    end
    object EditDataIni: TDateTimePicker
      Left = 80
      Top = 121
      Width = 100
      Height = 23
      Date = 44562.000000000000000000
      Time = 0.761944826386752500
      TabOrder = 7
    end
    object EditDataFin: TDateTimePicker
      Left = 205
      Top = 121
      Width = 99
      Height = 23
      Date = 44926.000000000000000000
      Time = 0.761944826386752500
      TabOrder = 8
    end
  end
  object ImagemBotoes: TImageList
    Left = 440
    Top = 8
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
      'SELECT CD_CLIENT, DS_CLIENT'
      '  FROM SICLIENT'
      ' WHERE CH_ATIVO = '#39'S'#39
      '   AND CD_CLIENT = :PR_CLIENT')
    Left = 368
    Top = 32
    object ADOQueryClientCD_CLIENT: TIntegerField
      FieldName = 'CD_CLIENT'
    end
    object ADOQueryClientDS_CLIENT: TWideStringField
      FieldName = 'DS_CLIENT'
      Size = 50
    end
  end
  object srcLancam: TDataSource
    DataSet = ADOQueryVend
    Left = 224
    Top = 304
  end
  object ADOQueryVend: TADOQuery
    Active = True
    Connection = FRDmComBas.ADCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'PR_VEND1'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'PR_VEND2'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'PR_CLIENT1'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'PR_CLIENT2'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'PR_TODASDATA'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'PR_DATAINI'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'PR_DATAFIN'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CEVENDPRIN.CD_VEND,'
      '       CEVENDPRIN.DT_CADAST,'
      '       CEVENDPRIN.VL_VENDA,'
      '       CEVENDPRIN.VL_PARCELAS,'
      '       SIPAG.NR_PARC'
      'FROM CEVENDPRIN, SIPAG'
      ' WHERE (:PR_VEND1 = '#39'T'#39' OR CEVENDPRIN.CD_VEND = :PR_VEND2)'
      '   AND (:PR_CLIENT1 = '#39'T'#39' OR CEVENDPRIN.CD_CLIENT = :PR_CLIENT2)'
      
        '   AND (:PR_TODASDATA = '#39'S'#39' OR CEVENDPRIN.DT_CADAST BETWEEN :PR_' +
        'DATAINI AND :PR_DATAFIN)'
      '   AND CEVENDPRIN.CD_PAG = SIPAG.CD_PAG')
    Left = 299
    Top = 304
    object ADOQueryVendCD_VEND: TAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_VEND'
      ReadOnly = True
    end
    object ADOQueryVendDT_CADAST: TDateTimeField
      DisplayLabel = 'Cadastro'
      FieldName = 'DT_CADAST'
    end
    object ADOQueryVendVL_VENDA: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_VENDA'
    end
    object ADOQueryVendVL_PARCELAS: TFloatField
      DisplayLabel = 'Valor Parcelas'
      FieldName = 'VL_PARCELAS'
    end
    object ADOQueryVendNR_PARC: TIntegerField
      DisplayLabel = 'N'#250'mero Parcelas'
      FieldName = 'NR_PARC'
    end
  end
  object ADOQueryDelete: TADOQuery
    Connection = FRDmComBas.ADCon
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
      'Delete From CEVEND'
      'Where CEVEND.cd_vend = :PR_VEND')
    Left = 208
    Top = 400
  end
  object ADOQueryDelete2: TADOQuery
    Connection = FRDmComBas.ADCon
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
      'Delete From CEVENDPRIN'
      'Where CEVENDPRIN.cd_vend = :PR_VEND')
    Left = 304
    Top = 400
  end
  object ADOQueryTemp: TADOQuery
    Connection = FRDmComBas.ADCon
    Parameters = <>
    SQL.Strings = (
      'Delete From TPVEND')
    Left = 432
    Top = 352
  end
end
