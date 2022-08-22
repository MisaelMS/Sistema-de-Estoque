object FMdConsul: TFMdConsul
  Left = 2
  Top = 2
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSingle
  Caption = 'Consulta'
  ClientHeight = 375
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
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
  object srcConsul: TDataSource
    DataSet = OraDsConsul
    Left = 40
    Top = 8
  end
  object OraDsConsul: TOracleDataSet
    SQL.Strings = (
      'Select DS_NOME from SIEMPRES')
    Optimize = False
    Session = RDmConBas.OracleSession
    Left = 8
    Top = 8
  end
end
