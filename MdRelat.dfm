object FMdRelat: TFMdRelat
  Left = 1
  Top = 1
  BorderIcons = [biSystemMenu, biMinimize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio'
  ClientHeight = 224
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object panTitulo: TPanel
    Left = 0
    Top = 0
    Width = 484
    Height = 23
    Hint = 'Barra de Menssagens'
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '  Modo  de Sele'#231#227'o'
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object panCampo: TPanel
      Left = 299
      Top = 0
      Width = 185
      Height = 23
      Align = alRight
      BevelOuter = bvNone
      Color = clHighlight
      TabOrder = 0
    end
  end
  object panMsg: TPanel
    Left = 0
    Top = 201
    Width = 484
    Height = 23
    Hint = 'Barra de Menssagens'
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object PlnDados: TPanel
    Left = 0
    Top = 23
    Width = 484
    Height = 178
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    OnEnter = PlnDadosEnter
    OnMouseActivate = PlnDadosMouseActivate
    OnMouseDown = PlnDadosMouseDown
    OnMouseMove = PlnDadosMouseMove
    object btnImprimir: TcxButton
      Left = 304
      Top = 144
      Width = 81
      Height = 25
      Hint = 'Clique para Imprimir'
      Caption = '&Imprimir'
      LookAndFeel.Kind = lfOffice11
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00848484FFFF00FF00FF00FF00FF00FF006A6A
        6AFF6A6A6AFF737373FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00848484FF848484FFCAC0C0FF7B7B7BFF232323FF383838FF847B
        7BFFB6B6B6FFCACACAFF6A6A6AFFFF00FF00FF00FF00FF00FF00FF00FF008484
        84FF848484FFF4F4F4FFFFFFFFFFCACACAFF848484FF2A2A2AFF110B11FF110B
        11FF1C1C1CFF484848FF6A6A6AFF737373FFFF00FF007B7373FF848484FFEAEA
        EAFFFFFFFFFFEAE0E0FFB6B6B6FF848484FF737373FF7B7B7BFF6A6A6AFF4848
        48FF232323FF0B1111FF110B11FF585858FFFF00FF00848484FFE0E0E0FFE0E0
        E0FFABABABFF8F8F8FFFA19898FFB6ABABFF8F8F8FFF7B7B7BFF7B7373FF7B7B
        7BFF847B7BFF737373FF505050FF6A6A6AFFFF00FF007B7B7BFF989898FF8F8F
        8FFF989898FFB6B6B6FFCACACAFFEAEAEAFFEAEAEAFFD4D4D4FFB6B6B6FF9898
        98FF848484FF7B7373FF7B7B7BFF737373FFFF00FF007B7373FF989898FFB6B6
        B6FFC0C0C0FFB6B6B6FFD4D4D4FFC0C0C0FF8F988FFFABABABFFC0C0C0FFCACA
        CAFFCACACAFFB6B6B6FFA1A1A1FF7B7B7BFFFF00FF00FF00FF00848484FFC0C0
        C0FFC0C0C0FFD4D4D4FFB6B6B6FFA1A1A1FF8FCA8FFFABB6ABFFB68F8FFF988F
        8FFF8F8F8FFFA1A1A1FFB6ABABFF8F8F8FFFFF00FF00FF00FF00FF00FF008484
        84FFABABABFF989898FF989898FFE0E0E0FFF4EAEAFFEAEAEAFFEAE0D4FFCACA
        CAFFC0C0C0FFA1A1A1FF7B7B7BFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00848484FFCACACAFFC0C0C0FF848484FFABABABFFCACACAFFCACACAFFCACA
        CAFFB6B6B6FF989898FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FFE0E0FFFFD4C0FFE0B6ABFFE0B6ABFFE0C0B6FFD4CAC0FFC0C0
        C0FF7B7B7BFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C08484FFFFD4C0FFFFC0ABFFFFB698FFFFAB8FFFFF9884FFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C08484FFFFD4C0FFFFC0ABFFFFB698FFFFAB8FFFF4987BFFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C08484FFFFD4C0FFFFC0ABFFFFB698FFFFAB8FFFF49884FFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00C08484FFFFE0CAFFFFD4C0FFFFC0ABFFFFB698FFFFAB8FFFF49884FFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00C08484FFC08484FFC08484FFC08484FFF49884FFF49884FFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      TabOrder = 0
      OnClick = btnImprimirClick
    end
    object btnCancelar: TcxButton
      Left = 392
      Top = 144
      Width = 81
      Height = 25
      Hint = 'Clique para cancelar a impress'#227'o'
      Caption = '&Cancelar'
      LookAndFeel.Kind = lfOffice11
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000080FF000080FFFF00FF00000080FF0000
        80FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000080FF000080FFFF00FF00FF00FF00000080FF0000
        80FF000080FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000080FF000080FFFF00FF00FF00FF00FF00FF00000080FF0000
        80FF000080FF000080FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000080FF000080FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        FFFF000080FF000080FF000080FFFF00FF00FF00FF00FF00FF00FF00FF000000
        80FF000080FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000080FF000080FF000080FFFF00FF00000080FF000080FF0000
        80FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000080FF0000FFFF0000FFFF0000FFFF000080FFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000FFFF0000FFFF0000FFFFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000080FF0000FFFF0000FFFF0000FFFF0000FFFFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000FFFF0000FFFF0000FFFFFF00FF00FF00FF000000FFFF0000
        FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000FFFF0000FFFF0000FFFFFF00FF00FF00FF00FF00FF00FF00FF000000
        FFFF0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
        FFFF0000FFFF0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000000FFFF0000FFFFFF00FF00FF00FF00FF00FF00FF00FF000000FFFF0000
        FFFF0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000FFFFFF00FF00FF00FF000000FFFF0000FFFF0000
        FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FFFF0000FFFFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object Progres: TPanel
      Left = 240
      Top = 129
      Width = 49
      Height = 49
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object Animate: TAnimate
        Left = 0
        Top = 0
        Width = 48
        Height = 48
        StopFrame = 41
        Visible = False
      end
    end
  end
end
