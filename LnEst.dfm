object FLnEst: TFLnEst
  Left = 0
  Top = 0
  Caption = ' Lan'#231'amento Estoque'
  ClientHeight = 541
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnClose = FormClose
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
    Width = 484
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
      Hint = 'Adicionar|Adicionar um novo registro'
      Align = alLeft
      Caption = '&Filtrar'
      OnClick = BtnFiltrarClick
      ExplicitLeft = 0
      ExplicitTop = -4
    end
  end
  object panTitulo: TPanel
    Left = 0
    Top = 41
    Width = 484
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
      Left = 312
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
    Width = 484
    Height = 160
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object Label2: TLabel
      Left = 3
      Top = 27
      Width = 71
      Height = 15
      Caption = 'Fornecedores'
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
      Left = 27
      Top = 76
      Width = 47
      Height = 15
      Caption = 'Estoques'
    end
    object CbFornec: TCheckBox
      Left = 80
      Top = 4
      Width = 128
      Height = 17
      Caption = 'Todos Fornecedores'
      TabOrder = 0
      OnClick = CbFornecClick
    end
    object EditFornec: TEdit
      Left = 80
      Top = 24
      Width = 100
      Height = 23
      TabOrder = 1
      OnExit = EditFornecExit
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
    object EditEst: TEdit
      Left = 80
      Top = 73
      Width = 100
      Height = 23
      TabOrder = 4
    end
    object ChkEst: TCheckBox
      Left = 80
      Top = 55
      Width = 128
      Height = 17
      Caption = 'Todos os estoques'
      TabOrder = 5
      OnClick = ChkEstClick
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
  object panMsg: TPanel
    Left = 0
    Top = 517
    Width = 484
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
  object Panel2: TPanel
    Left = 0
    Top = 224
    Width = 484
    Height = 252
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    object GridProdutos: TDBGrid
      Left = 0
      Top = 0
      Width = 484
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
          FieldName = 'CD_EST'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_ENTRADA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VL_VALOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CH_STATUS'
          Width = 65
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 476
    Width = 484
    Height = 41
    Align = alBottom
    TabOrder = 5
    object SpeedButton2: TSpeedButton
      Left = 376
      Top = 6
      Width = 95
      Height = 29
      Caption = 'Inserir'
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 171
      Top = 6
      Width = 95
      Height = 29
      Caption = 'Deletar'
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 274
      Top = 6
      Width = 95
      Height = 29
      Caption = 'Alterar'
      Images = ImagemBotoes
      OnClick = SpeedButton4Click
    end
  end
  object srcLancam: TDataSource
    DataSet = ADOQueryEst
    Left = 224
    Top = 304
  end
  object ADOQueryDelete: TADOQuery
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
      'Delete From CEESTOQ'
      'Where CEESTOQ.cd_est = :PR_EST')
    Left = 208
    Top = 400
  end
  object ADOQueryEst: TADOQuery
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
        Name = 'PR_EST2'
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
        Name = 'PR_FORNEC2'
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
      'SELECT CEESTOQPRIN.CD_EST,'
      '       CEESTOQPRIN.DT_ENTRADA,'
      '       CEESTOQPRIN.VL_VALOR,'
      '       CEESTOQPRIN.CH_STATUS  '
      'FROM CEESTOQPRIN'
      'WHERE (:PR_EST = '#39'T'#39' OR CEESTOQPRIN.CD_EST = :PR_EST2)'
      
        '    AND (:PR_FORNEC = '#39'T'#39' OR CEESTOQPRIN.CD_FORNEC = :PR_FORNEC2' +
        ')'
      '    AND (:PR_TODASDATA = '#39'S'#39' OR '
      
        '          (DT_ENTRADA BETWEEN :PR_DATAINI AND :PR_DATAFIN))     ' +
        '         ')
    Left = 299
    Top = 304
    object ADOQueryEstCD_EST: TIntegerField
      DisplayLabel = 'Estoque'
      FieldName = 'CD_EST'
    end
    object ADOQueryEstDT_ENTRADA: TDateTimeField
      DisplayLabel = 'Entrada'
      FieldName = 'DT_ENTRADA'
    end
    object ADOQueryEstVL_VALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_VALOR'
    end
    object ADOQueryEstCH_STATUS: TWideStringField
      DisplayLabel = 'Estatus'
      FieldName = 'CH_STATUS'
      Size = 255
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
    Left = 368
    Top = 32
    object ADOQueryFornecCD_FORNEC: TIntegerField
      FieldName = 'CD_FORNEC'
    end
    object ADOQueryFornecDS_FORNEC: TWideStringField
      FieldName = 'DS_FORNEC'
      Size = 255
    end
  end
  object ImagemBotoes: TImageList
    Left = 440
    Top = 8
  end
  object ADOQueryDeleteTPESTOQ: TADOQuery
    Connection = FRDmComBas.ADCon
    Parameters = <>
    SQL.Strings = (
      'Delete from TPESTOQ')
    Left = 400
    Top = 400
  end
  object ADOQueryDelete2: TADOQuery
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
      'Delete From CEESTOQPRIN'
      'Where CEESTOQPRIN.cd_est = :PR_EST')
    Left = 144
    Top = 376
  end
end
