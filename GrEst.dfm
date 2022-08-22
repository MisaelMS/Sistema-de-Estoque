object FGrEst: TFGrEst
  Left = 0
  Top = 0
  Caption = ' Gr'#225'fico Estoque'
  ClientHeight = 441
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
  object panMsg: TPanel
    Left = 0
    Top = 417
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
    TabOrder = 1
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
    TabOrder = 2
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
  object PlnBotao: TPanel
    Left = 0
    Top = 64
    Width = 624
    Height = 353
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object DBChart1: TDBChart
      Left = 72
      Top = 59
      Width = 473
      Height = 235
      BackWall.Brush.Gradient.Direction = gdBottomTop
      BackWall.Brush.Gradient.EndColor = clWhite
      BackWall.Brush.Gradient.StartColor = 15395562
      BackWall.Brush.Gradient.Visible = True
      BackWall.Transparent = False
      Foot.Font.Color = clBlue
      Foot.Font.Name = 'Verdana'
      Gradient.Direction = gdBottomTop
      Gradient.EndColor = clWhite
      Gradient.MidColor = 15395562
      Gradient.StartColor = 15395562
      Gradient.Visible = True
      LeftWall.Color = 14745599
      RightWall.Color = 14745599
      Title.Font.Color = clBlack
      Title.Font.Name = 'Verdana'
      Title.Text.Strings = (
        'Estoque')
      BottomAxis.Axis.Color = 4210752
      BottomAxis.Grid.Color = 11119017
      BottomAxis.LabelsFormat.Font.Name = 'Verdana'
      BottomAxis.TicksInner.Color = 11119017
      BottomAxis.Title.Font.Name = 'Verdana'
      DepthAxis.Axis.Color = 4210752
      DepthAxis.Grid.Color = 11119017
      DepthAxis.LabelsFormat.Font.Name = 'Verdana'
      DepthAxis.TicksInner.Color = 11119017
      DepthAxis.Title.Font.Name = 'Verdana'
      DepthTopAxis.Axis.Color = 4210752
      DepthTopAxis.Grid.Color = 11119017
      DepthTopAxis.LabelsFormat.Font.Name = 'Verdana'
      DepthTopAxis.TicksInner.Color = 11119017
      DepthTopAxis.Title.Font.Name = 'Verdana'
      LeftAxis.Axis.Color = 4210752
      LeftAxis.Grid.Color = 11119017
      LeftAxis.LabelsFormat.Font.Name = 'Verdana'
      LeftAxis.TicksInner.Color = 11119017
      LeftAxis.Title.Font.Name = 'Verdana'
      Legend.Font.Name = 'Verdana'
      Legend.Shadow.Transparency = 0
      RightAxis.Axis.Color = 4210752
      RightAxis.Grid.Color = 11119017
      RightAxis.LabelsFormat.Font.Name = 'Verdana'
      RightAxis.TicksInner.Color = 11119017
      RightAxis.Title.Font.Name = 'Verdana'
      TopAxis.Axis.Color = 4210752
      TopAxis.Grid.Color = 11119017
      TopAxis.LabelsFormat.Font.Name = 'Verdana'
      TopAxis.TicksInner.Color = 11119017
      TopAxis.Title.Font.Name = 'Verdana'
      TabOrder = 0
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object Series1: TFastLineSeries
        HoverElement = []
        Selected.Hover.Visible = True
        DataSource = ADOQueryGrEst
        Title = 'Grafico Estoque'
        XLabelsSource = 'DT_ENTRADA'
        LinePen.Color = clDefault
        LinePen.Width = 3
        LinePen.EndStyle = esRound
        TreatNulls = tnDontPaint
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        XValues.ValueSource = 'DT_ENTRADA'
        YValues.Name = 'Y'
        YValues.Order = loNone
        YValues.ValueSource = 'Expr1000'
      end
    end
  end
  object ADOQueryGrEst: TADOQuery
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
      'SELECT SUM(CEESTOQ.VL_QTD),'
      '             CEESTOQ.DT_ENTRADA'
      'FROM CEESTOQ, CEESTOQPRIN'
      'WHERE  (:PR_FORNEC = '#39'T'#39' OR CEESTOQPRIN.CD_FORNEC = :PR_FORNEC2)'
      '    AND CEESTOQ.CD_EST = CEESTOQPRIN.CD_EST'
      
        '    AND (:PR_TODAS = '#39'T'#39' OR (CEESTOQPRIN.DT_ENTRADA BETWEEN :PR_' +
        'INI AND :PR_FIN))  '
      'GROUP BY CEESTOQ.DT_ENTRADA')
    Left = 528
    Top = 96
  end
  object DataSource1: TDataSource
    DataSet = ADOQueryGrEst
    Left = 576
    Top = 160
  end
end
