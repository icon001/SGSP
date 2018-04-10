object fmMessage: TfmMessage
  Left = 704
  Top = 337
  BorderStyle = bsNone
  ClientHeight = 77
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 432
    Height = 77
    Align = alClient
    Caption = 'Panel1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 320
    Top = 32
  end
end
