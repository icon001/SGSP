object fmConfig: TfmConfig
  Left = 523
  Top = 330
  Width = 235
  Height = 171
  Caption = #48708#48128#48264#54840#48320#44221
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 72
    Height = 12
    Caption = #44592#51316#48708#48128#48264#54840
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 72
    Height = 12
    Caption = #49888#44508#48708#48128#48264#54840
  end
  object sbLogin: TSpeedButton
    Left = 32
    Top = 100
    Width = 73
    Height = 25
    Caption = #54869#51064
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    OnClick = sbLoginClick
  end
  object sbCancel: TSpeedButton
    Left = 128
    Top = 100
    Width = 73
    Height = 25
    Caption = #52712#49548
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      3333333777333777FF3333993333339993333377FF3333377FF3399993333339
      993337777FF3333377F3393999333333993337F777FF333337FF993399933333
      399377F3777FF333377F993339993333399377F33777FF33377F993333999333
      399377F333777FF3377F993333399933399377F3333777FF377F993333339993
      399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
      99333773FF3333777733339993333339933333773FFFFFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    NumGlyphs = 2
    OnClick = sbCancelClick
  end
  object Bevel1: TBevel
    Left = 4
    Top = 88
    Width = 223
    Height = 2
  end
  object Label3: TLabel
    Left = 8
    Top = 64
    Width = 84
    Height = 12
    Caption = #48708#48128#48264#54840#51116#51077#47141
  end
  object ed_OrgPw: TEdit
    Left = 96
    Top = 16
    Width = 121
    Height = 20
    ImeName = 'Microsoft IME 2003'
    PasswordChar = '*'
    TabOrder = 0
    OnKeyPress = ed_OrgPwKeyPress
  end
  object ed_Newpw1: TEdit
    Left = 96
    Top = 40
    Width = 121
    Height = 20
    ImeName = 'Microsoft IME 2003'
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = ed_Newpw1KeyPress
  end
  object ed_Newpw2: TEdit
    Left = 96
    Top = 64
    Width = 121
    Height = 20
    ImeName = 'Microsoft IME 2003'
    PasswordChar = '*'
    TabOrder = 2
    OnKeyPress = ed_Newpw2KeyPress
  end
end
