inherited fmCurrentDeviceSetting: TfmCurrentDeviceSetting
  Left = 328
  Top = 171
  Width = 1029
  Height = 715
  Caption = #44592#44592#49444#51221#46321#47197
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter [0]
    Left = 153
    Top = 0
    Width = 5
    Height = 681
  end
  object Panel4: TPanel [1]
    Left = 0
    Top = 0
    Width = 153
    Height = 681
    Align = alLeft
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 42
      Width = 151
      Height = 638
      ActivePage = tbDEVICE
      Align = alClient
      Images = toolslist
      TabOrder = 0
      OnChange = PageControl1Change
      object tbDEVICE: TTabSheet
        Caption = #44592#44592#51221#48372
        ImageIndex = -1
        object GroupBox3: TGroupBox
          Left = 0
          Top = 0
          Width = 143
          Height = 609
          Align = alClient
          TabOrder = 0
          object TreeView_Device: TTreeView
            Left = 2
            Top = 23
            Width = 139
            Height = 584
            Align = alClient
            BorderStyle = bsNone
            HideSelection = False
            HotTrack = True
            Images = toolslist
            Indent = 19
            PopupMenu = Popup_Device
            TabOrder = 0
            OnClick = TreeView_DeviceClick
            OnDblClick = TreeView_DeviceDblClick
            OnMouseDown = TreeView_DeviceMouseDown
            Items.Data = {
              010000001F0000000000000000000000FFFFFFFFFFFFFFFF0000000002000000
              065365727665722A0000000100000000000000FFFFFFFFFFFFFFFF0000000003
              000000113139322E3136382E302E33303A333030302200000003000000000000
              00FFFFFFFFFFFFFFFF0000000000000000093130303030303130312200000003
              00000000000000FFFFFFFFFFFFFFFF0000000000000000093130303030303130
              32220000000400000000000000FFFFFFFFFFFFFFFF0000000000000000093130
              303030303230332A0000000200000000000000FFFFFFFFFFFFFFFF0000000001
              000000113139322E3136382E302E33313A333030302200000003000000000000
              00FFFFFFFFFFFFFFFF000000000000000009313030303030323031}
          end
          object Shader3: TShader
            Left = 2
            Top = 14
            Width = 139
            Height = 9
            Align = alTop
            TabOrder = 1
            FromColor = 15591915
            ToColor = clSilver
            Direction = False
            Version = '1.4.0.0'
          end
        end
      end
      object tab_refresh: TTabSheet
        Caption = #49352#47196#44256#52840
        ImageIndex = 12
      end
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 151
      Height = 41
      Align = alTop
      TabOrder = 1
      Visible = False
      object cmb_SearchType: TComboBox
        Left = 8
        Top = 8
        Width = 161
        Height = 20
        ImeName = 'Microsoft Office IME 2007'
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 0
        Text = #44592#48376#51312#54924
        OnChange = cmb_SearchTypeChange
        Items.Strings = (
          #44592#48376#51312#54924
          #54869#51109#51312#54924)
      end
    end
  end
  object Panel1: TPanel [2]
    Left = 158
    Top = 0
    Width = 863
    Height = 681
    Align = alClient
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 861
      Height = 32
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 66
        Height = 12
        Caption = #49440#53469#46108' '#44592#44592
      end
      object Label2: TLabel
        Left = 168
        Top = 8
        Width = 48
        Height = 12
        Caption = #44592#44592#48260#51260
      end
      object Label3: TLabel
        Left = 536
        Top = 8
        Width = 48
        Height = 12
        Caption = #44592#44592#53076#46300
      end
      object st_EcuID: TStaticText
        Left = 80
        Top = 6
        Width = 70
        Height = 16
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSunken
        Caption = '00'
        Color = clYellow
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object st_DeviceVer: TStaticText
        Left = 224
        Top = 6
        Width = 145
        Height = 16
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clActiveCaption
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
      end
      object st_DeviceCode: TStaticText
        Left = 592
        Top = 6
        Width = 121
        Height = 16
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clActiveCaption
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 2
      end
      object st_CardType: TStaticText
        Left = 384
        Top = 6
        Width = 145
        Height = 16
        AutoSize = False
        BorderStyle = sbsSunken
        Color = clActiveCaption
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 3
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 581
      Width = 861
      Height = 99
      Align = alBottom
      TabOrder = 1
      OnResize = Panel3Resize
      object gb_ControlButton: TGroupBox
        Left = 56
        Top = 8
        Width = 673
        Height = 73
        TabOrder = 0
        object btn_UseControlerSearch: TRzBitBtn
          Left = 24
          Top = 18
          Width = 129
          Height = 41
          Caption = #51312#54924
          Color = 15791348
          HighlightColor = 16026986
          HotTrack = True
          HotTrackColor = 3983359
          TabOrder = 0
          OnClick = btn_UseControlerSearchClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000430C0000430C00000001000000000000000000003300
            00006600000099000000CC000000FF0000000033000033330000663300009933
            0000CC330000FF33000000660000336600006666000099660000CC660000FF66
            000000990000339900006699000099990000CC990000FF99000000CC000033CC
            000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
            0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
            330000333300333333006633330099333300CC333300FF333300006633003366
            33006666330099663300CC663300FF6633000099330033993300669933009999
            3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
            330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
            66006600660099006600CC006600FF0066000033660033336600663366009933
            6600CC336600FF33660000666600336666006666660099666600CC666600FF66
            660000996600339966006699660099996600CC996600FF99660000CC660033CC
            660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
            6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
            990000339900333399006633990099339900CC339900FF339900006699003366
            99006666990099669900CC669900FF6699000099990033999900669999009999
            9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
            990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
            CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
            CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
            CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
            CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
            CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
            FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
            FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
            FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
            FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
            000000808000800000008000800080800000C0C0C00080808000191919004C4C
            4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
            6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
            03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
            0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
            0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
            0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
            0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
            0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
            0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
            0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
            03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
          NumGlyphs = 2
        end
        object btn_Registration: TRzBitBtn
          Left = 188
          Top = 18
          Width = 129
          Height = 41
          Caption = #46321#47197
          Color = 8421631
          HighlightColor = 16026986
          HotTrack = True
          HotTrackColor = 3983359
          TabOrder = 1
          OnClick = btn_RegistrationClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000E30E0000E30E00000001000000000000000000003300
            00006600000099000000CC000000FF0000000033000033330000663300009933
            0000CC330000FF33000000660000336600006666000099660000CC660000FF66
            000000990000339900006699000099990000CC990000FF99000000CC000033CC
            000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
            0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
            330000333300333333006633330099333300CC333300FF333300006633003366
            33006666330099663300CC663300FF6633000099330033993300669933009999
            3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
            330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
            66006600660099006600CC006600FF0066000033660033336600663366009933
            6600CC336600FF33660000666600336666006666660099666600CC666600FF66
            660000996600339966006699660099996600CC996600FF99660000CC660033CC
            660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
            6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
            990000339900333399006633990099339900CC339900FF339900006699003366
            99006666990099669900CC669900FF6699000099990033999900669999009999
            9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
            990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
            CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
            CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
            CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
            CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
            CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
            FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
            FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
            FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
            FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
            000000808000800000008000800080800000C0C0C00080808000191919004C4C
            4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
            6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
            6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
            90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
            9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
            909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
            90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
            B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
            90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
            B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
            6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
          NumGlyphs = 2
        end
        object btn_Next: TRzBitBtn
          Left = 517
          Top = 18
          Width = 129
          Height = 41
          Caption = #45796#51020
          Color = 15791348
          HighlightColor = 16026986
          HotTrack = True
          HotTrackColor = 3983359
          TabOrder = 2
          OnClick = btn_NextClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333FF3333333333333447333333333333377FFF33333333333744473333333
            333337773FF3333333333444447333333333373F773FF3333333334444447333
            33333373F3773FF3333333744444447333333337F333773FF333333444444444
            733333373F3333773FF333334444444444733FFF7FFFFFFF77FF999999999999
            999977777777777733773333CCCCCCCCCC3333337333333F7733333CCCCCCCCC
            33333337F3333F773333333CCCCCCC3333333337333F7733333333CCCCCC3333
            333333733F77333333333CCCCC333333333337FF7733333333333CCC33333333
            33333777333333333333CC333333333333337733333333333333}
          NumGlyphs = 2
        end
        object btn_DeviceCopy: TRzBitBtn
          Left = 352
          Top = 18
          Width = 129
          Height = 41
          Caption = #54868#47732#48373#49324
          Color = 15791348
          HighlightColor = 16026986
          HotTrack = True
          HotTrackColor = 3983359
          TabOrder = 3
          OnClick = btn_DeviceCopyClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000E30E0000E30E00000001000000000000000000003300
            00006600000099000000CC000000FF0000000033000033330000663300009933
            0000CC330000FF33000000660000336600006666000099660000CC660000FF66
            000000990000339900006699000099990000CC990000FF99000000CC000033CC
            000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
            0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
            330000333300333333006633330099333300CC333300FF333300006633003366
            33006666330099663300CC663300FF6633000099330033993300669933009999
            3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
            330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
            66006600660099006600CC006600FF0066000033660033336600663366009933
            6600CC336600FF33660000666600336666006666660099666600CC666600FF66
            660000996600339966006699660099996600CC996600FF99660000CC660033CC
            660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
            6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
            990000339900333399006633990099339900CC339900FF339900006699003366
            99006666990099669900CC669900FF6699000099990033999900669999009999
            9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
            990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
            CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
            CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
            CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
            CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
            CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
            FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
            FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
            FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
            FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
            000000808000800000008000800080800000C0C0C00080808000191919004C4C
            4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
            6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8121212
            12121212121212E8E8E8E8E8E881818181818181818181E8E8E8E8E812181818
            1818121812121212E8E8E8E881E2E2E2E2E281E281818181E8E8E8E8121E1818
            1818181218121212E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E812181E18
            1818181812181212E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E8121E181E
            1818181818121812E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E8121E1E18
            1E18181818181212E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8128D1E1E
            181E181818181812E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8128D8D1E
            1E181E1818181812E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8121212
            12121212121212E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
          NumGlyphs = 2
        end
      end
    end
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 33
      Width = 861
      Height = 548
      Align = alClient
      TabOrder = 2
      object pg_DeviceSetting: TPageControl
        Left = 0
        Top = 0
        Width = 852
        Height = 473
        ActivePage = tab_DoorLock
        TabOrder = 0
        OnChange = pg_DeviceSettingChange
        object TabMCSetting: TTabSheet
          Caption = 'MCU'#44592#48376#49444#51221
          ImageIndex = 1
          object StaticText2: TStaticText
            Left = 16
            Top = 8
            Width = 209
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = 'Controller ID'
            TabOrder = 0
          end
          object ed_mcid: TEdit
            Left = 16
            Top = 28
            Width = 209
            Height = 25
            AutoSize = False
            BevelKind = bkFlat
            ImeName = 'Microsoft IME 2003'
            TabOrder = 1
            OnChange = ed_mcidChange
            OnKeyUp = ed_mcidKeyUp
          end
          object rg_LanSet: TRzGroupBox
            Left = 240
            Top = 8
            Width = 225
            Height = 257
            Caption = #9635' LAN '#49444#51221
            Enabled = False
            GroupStyle = gsTopLine
            ParentColor = True
            TabOrder = 2
            Transparent = True
            ThemeAware = False
            object RzLabel2: TRzLabel
              Left = 5
              Top = 20
              Width = 36
              Height = 12
              Hint = #44288#51228#54016#50640' '#46321#47197#46108' '#48264#54840#47484' '#51077#47141#54616#49464#50836
              Caption = 'MCU IP'
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              Transparent = True
              BlinkIntervalOff = 1500
            end
            object RzLabel3: TRzLabel
              Left = 5
              Top = 46
              Width = 72
              Height = 12
              Hint = #45936#53076#45908' '#51204#54868#48264#54840#47484' '#51077#47141' '#54616#49464#50836
              Caption = #49436#48652#45367#47560#49828#53356
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              Transparent = True
              BlinkIntervalOff = 1500
            end
            object Label8: TLabel
              Left = 5
              Top = 72
              Width = 60
              Height = 12
              Hint = #50896#44201#51228#50612' '#53588' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
              Caption = #44172#51060#53944#50920#51060
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label9: TLabel
              Left = 5
              Top = 98
              Width = 48
              Height = 12
              Hint = #50896#44201#51228#50612' '#53588' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
              Caption = #54252#53944#48264#54840
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label19: TLabel
              Left = 5
              Top = 124
              Width = 36
              Height = 12
              Hint = #50896#44201#51228#50612' '#53588' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
              Caption = #49436#48260'IP'
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label21: TLabel
              Left = 5
              Top = 151
              Width = 48
              Height = 12
              Hint = #50896#44201#51228#50612' '#53588' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
              Caption = #49436#48260'PORT'
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Rg_Mode: TRadioGroup
              Left = 8
              Top = 168
              Width = 201
              Height = 41
              Caption = 'NetworkMode'
              Columns = 2
              Enabled = False
              ItemIndex = 0
              Items.Strings = (
                'Server'
                'Client')
              TabOrder = 0
              OnClick = Rg_ModeClick
            end
            object chk_DHCP: TCheckBox
              Left = 8
              Top = 256
              Width = 201
              Height = 17
              Caption = 'DHCP Mode'
              Enabled = False
              TabOrder = 1
              Visible = False
              OnClick = chk_DHCPClick
            end
            object btn_WizNetSetting: TRzBitBtn
              Left = 119
              Top = 216
              Width = 90
              Caption = 'LAN '#49444#51221
              Color = 15791348
              Enabled = False
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 2
              OnClick = btn_WizNetSettingClick
            end
            object Edit_IP: TEdit
              Left = 88
              Top = 16
              Width = 121
              Height = 20
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 3
              OnKeyUp = Edit_IPKeyUp
            end
            object Edit_subnet: TEdit
              Left = 88
              Top = 42
              Width = 121
              Height = 20
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 4
              OnKeyUp = Edit_subnetKeyUp
            end
            object edit_Gateway: TEdit
              Left = 88
              Top = 68
              Width = 121
              Height = 20
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 5
              OnKeyUp = edit_GatewayKeyUp
            end
            object edit_port: TEdit
              Left = 88
              Top = 94
              Width = 121
              Height = 20
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 6
              OnKeyUp = edit_portKeyUp
            end
            object ed_server: TEdit
              Left = 88
              Top = 120
              Width = 121
              Height = 20
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 7
              OnKeyUp = ed_serverKeyUp
            end
            object ed_ServerPort: TEdit
              Left = 88
              Top = 147
              Width = 121
              Height = 20
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 8
              OnKeyUp = ed_ServerPortKeyUp
            end
            object btn_WizNetSearch: TRzBitBtn
              Left = 8
              Top = 216
              Width = 90
              Caption = 'LAN '#51312#54924
              Color = 15791348
              Enabled = False
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 9
              OnClick = btn_WizNetSearchClick
            end
          end
          object GroupBox10: TGroupBox
            Left = 248
            Top = 265
            Width = 225
            Height = 72
            Caption = #49884#44036' '#44288#47532
            TabOrder = 3
            object btn_TimeSync: TRzBitBtn
              Left = 112
              Top = 40
              Width = 97
              Caption = #49884#44036#46041#44592#54868
              Color = 15791348
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 0
              OnClick = btn_TimeSyncClick
            end
            object btn_TimeSearch: TRzBitBtn
              Left = 16
              Top = 40
              Width = 97
              Caption = #54788#51116#49884#44036#51312#54924
              Color = 15791348
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 1
              OnClick = btn_TimeSearchClick
            end
            object st_Time: TStaticText
              Left = 16
              Top = 20
              Width = 193
              Height = 16
              AutoSize = False
              BorderStyle = sbsSunken
              Color = clWhite
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 2
            end
          end
          object GroupMAc: TRzGroupBox
            Left = 240
            Top = 337
            Width = 225
            Height = 112
            Caption = #47589#50612#46300#47112#49828' '#46321#47197
            TabOrder = 4
            Transparent = True
            Visible = False
            object editMAC1: TRzEdit
              Left = 24
              Top = 18
              Width = 29
              Height = 24
              Text = '00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = #44404#47548
              Font.Style = [fsBold]
              FrameHotTrack = True
              FrameVisible = True
              ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
              MaxLength = 2
              ParentFont = False
              TabOnEnter = True
              TabOrder = 0
            end
            object editMAC2: TRzEdit
              Left = 54
              Top = 18
              Width = 29
              Height = 24
              Text = '00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = #44404#47548
              Font.Style = [fsBold]
              FrameHotTrack = True
              FrameVisible = True
              ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
              MaxLength = 2
              ParentFont = False
              TabOnEnter = True
              TabOrder = 1
            end
            object editMAC3: TRzEdit
              Left = 84
              Top = 18
              Width = 29
              Height = 24
              Text = '00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = #44404#47548
              Font.Style = [fsBold]
              FrameHotTrack = True
              FrameVisible = True
              ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
              MaxLength = 2
              ParentFont = False
              TabOnEnter = True
              TabOrder = 2
            end
            object editMAC4: TRzEdit
              Left = 114
              Top = 18
              Width = 29
              Height = 24
              Text = '00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = #44404#47548
              Font.Style = [fsBold]
              FrameHotTrack = True
              FrameVisible = True
              ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
              MaxLength = 2
              ParentFont = False
              TabOnEnter = True
              TabOrder = 3
            end
            object editMAC5: TRzEdit
              Left = 144
              Top = 18
              Width = 29
              Height = 24
              Text = '00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = #44404#47548
              Font.Style = [fsBold]
              FrameHotTrack = True
              FrameVisible = True
              ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
              MaxLength = 2
              ParentFont = False
              TabOnEnter = True
              TabOrder = 4
            end
            object editMAC6: TRzEdit
              Left = 175
              Top = 18
              Width = 29
              Height = 24
              Text = '00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = #44404#47548
              Font.Style = [fsBold]
              FrameHotTrack = True
              FrameVisible = True
              ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
              MaxLength = 2
              ParentFont = False
              TabOnEnter = True
              TabOrder = 5
            end
            object btnRegMAC: TRzBitBtn
              Left = 24
              Top = 79
              Width = 182
              Height = 26
              Caption = #47589#50612#46300#47112#49828' '#46321#47197
              Color = 15791348
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 6
              OnClick = btnRegMACClick
              Glyph.Data = {
                36060000424D3606000000000000360400002800000020000000100000000100
                08000000000000020000E30E0000E30E00000001000000000000000000003300
                00006600000099000000CC000000FF0000000033000033330000663300009933
                0000CC330000FF33000000660000336600006666000099660000CC660000FF66
                000000990000339900006699000099990000CC990000FF99000000CC000033CC
                000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
                0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
                330000333300333333006633330099333300CC333300FF333300006633003366
                33006666330099663300CC663300FF6633000099330033993300669933009999
                3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
                330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
                66006600660099006600CC006600FF0066000033660033336600663366009933
                6600CC336600FF33660000666600336666006666660099666600CC666600FF66
                660000996600339966006699660099996600CC996600FF99660000CC660033CC
                660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
                6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
                990000339900333399006633990099339900CC339900FF339900006699003366
                99006666990099669900CC669900FF6699000099990033999900669999009999
                9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
                990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
                CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
                CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
                CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
                CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
                CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
                FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
                FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
                FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
                FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
                000000808000800000008000800080800000C0C0C00080808000191919004C4C
                4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
                6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
              NumGlyphs = 2
            end
            object btn_MacSearch: TRzBitBtn
              Left = 24
              Top = 47
              Width = 182
              Height = 26
              Caption = #47589' '#50612#46300#47112#49828' '#54869#51064
              Color = 15791348
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 7
              OnClick = btn_MacSearchClick
              Glyph.Data = {
                36060000424D3606000000000000360400002800000020000000100000000100
                08000000000000020000430C0000430C00000001000000000000000000003300
                00006600000099000000CC000000FF0000000033000033330000663300009933
                0000CC330000FF33000000660000336600006666000099660000CC660000FF66
                000000990000339900006699000099990000CC990000FF99000000CC000033CC
                000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
                0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
                330000333300333333006633330099333300CC333300FF333300006633003366
                33006666330099663300CC663300FF6633000099330033993300669933009999
                3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
                330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
                66006600660099006600CC006600FF0066000033660033336600663366009933
                6600CC336600FF33660000666600336666006666660099666600CC666600FF66
                660000996600339966006699660099996600CC996600FF99660000CC660033CC
                660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
                6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
                990000339900333399006633990099339900CC339900FF339900006699003366
                99006666990099669900CC669900FF6699000099990033999900669999009999
                9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
                990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
                CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
                CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
                CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
                CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
                CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
                FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
                FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
                FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
                FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
                000000808000800000008000800080800000C0C0C00080808000191919004C4C
                4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
                6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
              NumGlyphs = 2
            end
          end
          object RzPageControl1: TRzPageControl
            Left = 14
            Top = 56
            Width = 211
            Height = 133
            ActivePage = TabSheet1
            Color = 16119543
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = #44404#47548
            Font.Style = [fsBold]
            FlatColor = 10263441
            HotTrackColor = 3983359
            HotTrackColorType = htctActual
            ParentColor = False
            ParentFont = False
            TabColors.HighlightBar = 3983359
            TabIndex = 0
            TabOrder = 5
            TabStyle = tsRoundCorners
            FixedDimension = 18
            object TabSheet1: TRzTabSheet
              Color = 16119543
              Caption = 'ECU/ICU'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = #44404#47548
              Font.Style = [fsBold]
              ParentFont = False
              object lvECU: TRzListView
                Left = 0
                Top = 0
                Width = 207
                Height = 108
                Hint = 'ECU/ICU '#46321#47197' '#48260#53948#51012' '#51060#50857#54616#50668' '#54869#51109#44592#47484' '#52628#44032' '#54633#45768#45796'.'
                Align = alClient
                BorderStyle = bsNone
                Columns = <
                  item
                    Caption = 'NO'
                  end
                  item
                    Caption = #53440#51077
                    Width = 123
                  end>
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #44404#47548
                Font.Style = []
                FrameHotTrack = True
                FrameHotStyle = fsFlat
                FrameStyle = fsNone
                FrameVisible = True
                GridLines = True
                ParentFont = False
                ParentShowHint = False
                RowSelect = True
                ShowHint = True
                ShowWorkAreas = True
                SmallImages = toolslist
                TabOrder = 0
                ViewStyle = vsReport
                OnKeyDown = lvECUKeyDown
                OnMouseDown = lvECUMouseDown
              end
              object cmb_EcuType: TRzComboBox
                Left = 48
                Top = 28
                Width = 145
                Height = 20
                Ctl3D = False
                FlatButtons = True
                FrameHotTrack = True
                FrameVisible = True
                ImeName = 'Microsoft IME 2003'
                ItemHeight = 12
                ParentCtl3D = False
                TabOrder = 1
                Visible = False
                OnChange = cmb_EcuTypeChange
                OnExit = cmb_EcuTypeExit
                Items.Strings = (
                  '1111'
                  '2222')
              end
            end
            object TabSheet2: TRzTabSheet
              Color = 16119543
              TabVisible = False
              Caption = #49345#54889' '#54364#49884#54032
              object CheckList_Alarm: TRzCheckList
                Left = 8
                Top = 7
                Width = 169
                Height = 233
                Items.Strings = (
                  '01 '#54364#49884#44592
                  '02 '#54364#49884#44592
                  '03 '#54364#49884#44592
                  '04 '#54364#49884#44592)
                Items.ItemEnabled = (
                  True
                  True
                  True
                  True)
                Items.ItemState = (
                  0
                  0
                  0
                  0)
                Color = 16119543
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #44404#47548
                Font.Style = []
                FrameStyle = fsNone
                FrameVisible = True
                ImeName = 'Microsoft IME 2003'
                ItemHeight = 17
                ParentFont = False
                TabOrder = 0
              end
            end
          end
          object btnECUAdd: TRzBitBtn
            Left = 14
            Top = 191
            Width = 94
            Height = 29
            Hint = 'ECU '#46608#45716' ICU'#47484' '#52628#44032' '#46321#47197' '#54633#45768#45796'.'
            Caption = 'ECU/ICU '#46321#47197
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #44404#47548
            Font.Style = []
            HotTrack = True
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnClick = btnECUAddClick
            NumGlyphs = 2
          end
          object btnECUErase: TRzBitBtn
            Left = 131
            Top = 191
            Width = 94
            Height = 29
            Caption = 'ECU/ICU '#49325#51228
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #44404#47548
            Font.Style = []
            HotTrack = True
            ParentFont = False
            TabOrder = 7
            OnClick = btnECUEraseClick
            NumGlyphs = 2
          end
          object RzGroupBox5: TRzGroupBox
            Left = 14
            Top = 298
            Width = 219
            Height = 127
            Caption = #9635' '#44288#51228' '#50672#44208#49444#51221
            GroupStyle = gsTopLine
            ParentColor = True
            TabOrder = 8
            ThemeAware = False
            object RzLabel9: TRzLabel
              Left = 5
              Top = 20
              Width = 54
              Height = 12
              Hint = #44288#51228#49884#49828#53596#51032' '#44256#44061#50500#51060#46356' 4'#51088#47532' '#49707#51088#47484' '#51077#47141#54633#45768#45796'.'
              Caption = #49884#49828#53596' ID'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              Transparent = True
              BlinkIntervalOff = 1500
            end
            object RzLabel17: TRzLabel
              Left = 5
              Top = 41
              Width = 90
              Height = 12
              Hint = #44288#51228#49884#49828#53596#51032' '#44277#51473#47581' '#51204#54868#48264#54840#47484' '#49707#51088#47564' '#44592#51077#54633#45768#45796'.'
              Caption = #45936#53076#45908#51204#54868#48264#54840'1'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              Transparent = True
              BlinkIntervalOff = 1500
            end
            object Label79: TLabel
              Left = 5
              Top = 83
              Width = 120
              Height = 12
              Hint = #50896#44201#51228#50612' '#53588' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
              Caption = #44221#44228#51473#50896#44201#51228#50612#47553#54943#49688
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object Label25: TLabel
              Left = 5
              Top = 105
              Width = 120
              Height = 12
              Hint = #50896#44201#51228#50612' '#53588' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
              Caption = #54644#51228#51473#50896#44201#51228#50612#47553#54943#49688
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object RzLabel4: TRzLabel
              Left = 5
              Top = 63
              Width = 90
              Height = 12
              Hint = #44288#51228#49884#49828#53596#51032' '#50696#48708#44277#51473#47581' '#51204#54868#48264#54840#47484' '#49707#51088#47564' '#44592#51077#54633#45768#45796'.'
              Caption = #45936#53076#45908#51204#54868#48264#54840'2'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              Transparent = True
              BlinkIntervalOff = 1500
            end
            object Spinner_Ring: TRzSpinner
              Left = 154
              Top = 80
              Width = 50
              Hint = #50896#44201#51228#50612' '#47553' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
              CheckRange = True
              Max = 20
              Value = 9
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = []
              ParentColor = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object Spinner_cancelRing: TRzSpinner
              Left = 154
              Top = 102
              Width = 50
              Hint = #50896#44201#51228#50612' '#47553' '#52852#50868#53944#47484' '#51077#47141#54616#49464#50836
              CheckRange = True
              Max = 20
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = []
              ParentColor = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
            object Edit_LinkusID: TEdit
              Left = 104
              Top = 16
              Width = 100
              Height = 20
              Hint = #44288#51228#49884#49828#53596#51032' '#44256#44061#50500#51060#46356' 4'#51088#47532' '#49707#51088#47484' '#51077#47141#54633#45768#45796'.'
              BevelKind = bkFlat
              ImeName = 'Microsoft IME 2003'
              MaxLength = 4
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnKeyUp = Edit_LinkusIDKeyUp
            end
            object Edit_LinkusTel: TEdit
              Left = 104
              Top = 37
              Width = 100
              Height = 20
              Hint = #44288#51228#49884#49828#53596#51032' '#44277#51473#47581' '#51204#54868#48264#54840#47484' '#49707#51088#47564' '#44592#51077#54633#45768#45796'.'
              BevelKind = bkFlat
              ImeName = 'Microsoft IME 2003'
              MaxLength = 12
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnChange = Edit_LinkusTelChange
            end
            object Edit_LinkusTel2: TEdit
              Left = 104
              Top = 59
              Width = 100
              Height = 20
              Hint = #44288#51228#49884#49828#53596#51032' '#50696#48708' '#44277#51473#47581' '#51204#54868#48264#54840#47484' '#49707#51088#47564' '#44592#51077#54633#45768#45796'.'
              BevelKind = bkFlat
              ImeName = 'Microsoft IME 2003'
              MaxLength = 12
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
            end
          end
          object gb_EcuAdd: TGroupBox
            Left = 192
            Top = 80
            Width = 177
            Height = 129
            Caption = 'ECU'#46321#47197
            TabOrder = 9
            Visible = False
            object lb_regEcucont: TLabel
              Left = 13
              Top = 22
              Width = 48
              Height = 12
              Caption = #46321#47197#44079#49688
            end
            object Label5: TLabel
              Left = 13
              Top = 46
              Width = 48
              Height = 12
              Caption = #44592#44592#51333#47448
            end
            object seDeviceNo: TRzSpinEdit
              Left = 73
              Top = 18
              Width = 88
              Height = 20
              AllowKeyEdit = True
              Max = 63.000000000000000000
              Min = 1.000000000000000000
              Value = 1.000000000000000000
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              TabOrder = 0
            end
            object cbDeviceType: TRzComboBox
              Left = 74
              Top = 42
              Width = 87
              Height = 20
              Hint = #44592#44592#53440#51077#51012' '#49444#51221#54633#45768#45796'.'
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              Text = 'ECU-300'
              Items.Strings = (
                'ECU-300'
                'ECU-4000')
              ItemIndex = 0
            end
            object chk_All: TCheckBox
              Left = 16
              Top = 72
              Width = 153
              Height = 17
              Hint = #46321#47197#44079#49688#44620#51648#51204#52404#52628#44032' '#52404#53356' '#54644#51228' '#49884#50640#45716' '#46321#47197#44079#49688#51032' '#54869#51109#44592' '#48264#54840#47564' '#52628#44032' '#46121#45768#45796'.'
              Caption = #46321#47197#44079#49688#44620#51648#51204#52404#52628#44032
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 2
              OnClick = chk_AllClick
            end
            object btnAdd: TRzBitBtn
              Left = 11
              Top = 96
              Hint = #54644#45817' ECU'#47484' '#52628#44032' '#54633#45768#45796'.'
              Caption = #46321#47197
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnClick = btnAddClick
              Glyph.Data = {
                36060000424D3606000000000000360400002800000020000000100000000100
                08000000000000020000830B0000830B00000001000000000000000000003300
                00006600000099000000CC000000FF0000000033000033330000663300009933
                0000CC330000FF33000000660000336600006666000099660000CC660000FF66
                000000990000339900006699000099990000CC990000FF99000000CC000033CC
                000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
                0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
                330000333300333333006633330099333300CC333300FF333300006633003366
                33006666330099663300CC663300FF6633000099330033993300669933009999
                3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
                330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
                66006600660099006600CC006600FF0066000033660033336600663366009933
                6600CC336600FF33660000666600336666006666660099666600CC666600FF66
                660000996600339966006699660099996600CC996600FF99660000CC660033CC
                660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
                6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
                990000339900333399006633990099339900CC339900FF339900006699003366
                99006666990099669900CC669900FF6699000099990033999900669999009999
                9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
                990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
                CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
                CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
                CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
                CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
                CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
                FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
                FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
                FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
                FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
                000000808000800000008000800080800000C0C0C00080808000191919004C4C
                4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
                6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                09090909E8E8E8E8E8E8E8E8E8E8E8E881818181E8E8E8E8E8E8E8E8E8E8E8E8
                09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
                09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
                09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E809090909
                0910100909090909E8E8E8E88181818181ACAC8181818181E8E8E8E809101010
                1010101010101009E8E8E8E881ACACACACACACACACACAC81E8E8E8E809101010
                1010101010101009E8E8E8E881ACACACACACACACACACAC81E8E8E8E809090909
                0910100909090909E8E8E8E88181818181ACAC8181818181E8E8E8E8E8E8E8E8
                09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
                09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
                09101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E8E8
                09090909E8E8E8E8E8E8E8E8E8E8E8E881818181E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
              NumGlyphs = 2
            end
            object btnClose: TRzBitBtn
              Left = 88
              Top = 96
              Hint = 'ECU'#46321#47197' '#51089#50629#51012' '#52712#49548#54633#45768#45796'.'
              Caption = #52712#49548
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              OnClick = btnCloseClick
              Glyph.Data = {
                36060000424D3606000000000000360400002800000020000000100000000100
                08000000000000020000630B0000630B00000001000000000000000000003300
                00006600000099000000CC000000FF0000000033000033330000663300009933
                0000CC330000FF33000000660000336600006666000099660000CC660000FF66
                000000990000339900006699000099990000CC990000FF99000000CC000033CC
                000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
                0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
                330000333300333333006633330099333300CC333300FF333300006633003366
                33006666330099663300CC663300FF6633000099330033993300669933009999
                3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
                330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
                66006600660099006600CC006600FF0066000033660033336600663366009933
                6600CC336600FF33660000666600336666006666660099666600CC666600FF66
                660000996600339966006699660099996600CC996600FF99660000CC660033CC
                660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
                6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
                990000339900333399006633990099339900CC339900FF339900006699003366
                99006666990099669900CC669900FF6699000099990033999900669999009999
                9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
                990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
                CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
                CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
                CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
                CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
                CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
                FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
                FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
                FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
                FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
                000000808000800000008000800080800000C0C0C00080808000191919004C4C
                4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
                6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8180C
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8E8E8E8E8E8181212
                0CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8E8E8E818121212
                120CE8E8E8E8E8E8E8E8E8E8E281818181DFE8E8E8E8E8E8E8E8E81812121212
                12120CE8E8E8E8E8E8E8E8E2818181818181DFE8E8E8E8E8E8E8E81812120C18
                1212120CE8E8E8E8E8E8E8E28181DFE2818181DFE8E8E8E8E8E8E818120CE8E8
                181212120CE8E8E8E8E8E8E281DFE8E8E2818181DFE8E8E8E8E8E8180CE8E8E8
                E8181212120CE8E8E8E8E8E2DFE8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8
                E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8
                E8E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8
                E8E8E8E81812120CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8
                E8E8E8E8E818120CE8E8E8E8E8E8E8E8E8E8E8E8E8E281DFE8E8E8E8E8E8E8E8
                E8E8E8E8E8E8180CE8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
              NumGlyphs = 2
            end
          end
          object GB_Special: TGroupBox
            Left = 472
            Top = 8
            Width = 305
            Height = 417
            TabOrder = 10
            object gb_CDMA: TGroupBox
              Left = 2
              Top = 14
              Width = 301
              Height = 235
              Align = alTop
              Caption = 'CDMA '#49444#51221
              TabOrder = 0
              Visible = False
              object Label373: TLabel
                Left = 24
                Top = 60
                Width = 18
                Height = 12
                Caption = 'MIN'
              end
              object Label374: TLabel
                Left = 24
                Top = 84
                Width = 18
                Height = 12
                Caption = 'MUX'
              end
              object Label375: TLabel
                Left = 24
                Top = 108
                Width = 12
                Height = 12
                Caption = 'IP'
              end
              object Label376: TLabel
                Left = 24
                Top = 132
                Width = 24
                Height = 12
                Caption = 'PORT'
              end
              object Label377: TLabel
                Left = 24
                Top = 156
                Width = 42
                Height = 12
                Caption = 'CHKTime'
              end
              object Label378: TLabel
                Left = 24
                Top = 180
                Width = 24
                Height = 12
                Caption = 'RSSI'
              end
              object rg_CdmaUse: TRadioGroup
                Left = 2
                Top = 14
                Width = 297
                Height = 33
                Align = alTop
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  #48120#49324#50857
                  #49324#50857)
                TabOrder = 0
              end
              object btn_cdmasetting: TRzBitBtn
                Left = 88
                Top = 200
                Caption = #46321#47197
                Color = 15791348
                HighlightColor = 16026986
                HotTrack = True
                HotTrackColor = 3983359
                TabOrder = 1
                OnClick = btn_cdmasettingClick
                Glyph.Data = {
                  36060000424D3606000000000000360400002800000020000000100000000100
                  08000000000000020000E30E0000E30E00000001000000000000000000003300
                  00006600000099000000CC000000FF0000000033000033330000663300009933
                  0000CC330000FF33000000660000336600006666000099660000CC660000FF66
                  000000990000339900006699000099990000CC990000FF99000000CC000033CC
                  000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
                  0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
                  330000333300333333006633330099333300CC333300FF333300006633003366
                  33006666330099663300CC663300FF6633000099330033993300669933009999
                  3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
                  330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
                  66006600660099006600CC006600FF0066000033660033336600663366009933
                  6600CC336600FF33660000666600336666006666660099666600CC666600FF66
                  660000996600339966006699660099996600CC996600FF99660000CC660033CC
                  660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
                  6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
                  990000339900333399006633990099339900CC339900FF339900006699003366
                  99006666990099669900CC669900FF6699000099990033999900669999009999
                  9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
                  990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
                  CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
                  CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
                  CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
                  CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
                  CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
                  FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
                  FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
                  FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
                  FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
                  000000808000800000008000800080800000C0C0C00080808000191919004C4C
                  4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
                  6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                  6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                  90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                  9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                  909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                  90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                  B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                  90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                  B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                  6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                NumGlyphs = 2
              end
              object btn_cdmaSearch: TRzBitBtn
                Left = 190
                Top = 200
                Caption = #51312#54924
                Color = 15791348
                HighlightColor = 16026986
                HotTrack = True
                HotTrackColor = 3983359
                TabOrder = 2
                OnClick = btn_cdmaSearchClick
                Glyph.Data = {
                  36060000424D3606000000000000360400002800000020000000100000000100
                  08000000000000020000430C0000430C00000001000000000000000000003300
                  00006600000099000000CC000000FF0000000033000033330000663300009933
                  0000CC330000FF33000000660000336600006666000099660000CC660000FF66
                  000000990000339900006699000099990000CC990000FF99000000CC000033CC
                  000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
                  0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
                  330000333300333333006633330099333300CC333300FF333300006633003366
                  33006666330099663300CC663300FF6633000099330033993300669933009999
                  3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
                  330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
                  66006600660099006600CC006600FF0066000033660033336600663366009933
                  6600CC336600FF33660000666600336666006666660099666600CC666600FF66
                  660000996600339966006699660099996600CC996600FF99660000CC660033CC
                  660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
                  6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
                  990000339900333399006633990099339900CC339900FF339900006699003366
                  99006666990099669900CC669900FF6699000099990033999900669999009999
                  9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
                  990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
                  CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
                  CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
                  CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
                  CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
                  CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
                  FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
                  FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
                  FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
                  FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
                  000000808000800000008000800080800000C0C0C00080808000191919004C4C
                  4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
                  6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                  03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                  0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                  0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                  0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                  0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                  0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                  0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                  0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                  03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                NumGlyphs = 2
              end
              object ed_cdmaMin: TEdit
                Left = 88
                Top = 56
                Width = 177
                Height = 20
                BevelKind = bkFlat
                ImeName = 'Microsoft Office IME 2007'
                MaxLength = 11
                TabOrder = 3
                OnChange = ed_cdmaMinChange
              end
              object ed_cdmaMux: TEdit
                Left = 88
                Top = 80
                Width = 57
                Height = 20
                BevelKind = bkFlat
                ImeName = 'Microsoft Office IME 2007'
                MaxLength = 2
                TabOrder = 4
                OnChange = ed_cdmaMuxChange
              end
              object ed_cdmaIP: TEdit
                Left = 88
                Top = 104
                Width = 177
                Height = 20
                BevelKind = bkFlat
                ImeName = 'Microsoft Office IME 2007'
                MaxLength = 30
                TabOrder = 5
                OnChange = ed_cdmaIPChange
              end
              object ed_cdmaPort: TEdit
                Left = 88
                Top = 128
                Width = 177
                Height = 20
                BevelKind = bkFlat
                ImeName = 'Microsoft Office IME 2007'
                MaxLength = 5
                TabOrder = 6
                OnChange = ed_cdmaPortChange
              end
              object ed_cdmachktime: TEdit
                Left = 88
                Top = 152
                Width = 57
                Height = 20
                BevelKind = bkFlat
                ImeName = 'Microsoft Office IME 2007'
                MaxLength = 2
                TabOrder = 7
                OnChange = ed_cdmachktimeChange
              end
              object st_cdmaRegAck: TStaticText
                Left = 152
                Top = 154
                Width = 41
                Height = 16
                AutoSize = False
                BevelOuter = bvNone
                BorderStyle = sbsSunken
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -12
                Font.Name = #44404#47548
                Font.Style = []
                ParentFont = False
                TabOrder = 8
              end
              object ed_cdmarssi: TEdit
                Left = 88
                Top = 176
                Width = 57
                Height = 20
                BevelKind = bkFlat
                ImeName = 'Microsoft Office IME 2007'
                MaxLength = 4
                TabOrder = 9
                OnChange = ed_cdmarssiChange
              end
            end
            object gb_Dvr: TGroupBox
              Left = 2
              Top = 249
              Width = 301
              Height = 144
              Align = alTop
              Caption = 'DVR '#49444#51221
              TabOrder = 1
              object Label6: TLabel
                Left = 24
                Top = 60
                Width = 12
                Height = 12
                Caption = 'IP'
              end
              object Label7: TLabel
                Left = 24
                Top = 92
                Width = 24
                Height = 12
                Caption = 'PORT'
              end
              object rg_dvruse: TRadioGroup
                Left = 2
                Top = 14
                Width = 297
                Height = 33
                Align = alTop
                Columns = 2
                ItemIndex = 0
                Items.Strings = (
                  #48120#49324#50857
                  #49324#50857)
                TabOrder = 0
              end
              object ed_dvrip: TEdit
                Left = 88
                Top = 56
                Width = 177
                Height = 20
                BevelKind = bkFlat
                ImeName = 'Microsoft Office IME 2007'
                MaxLength = 30
                TabOrder = 1
                OnChange = ed_dvripChange
              end
              object ed_dvrport: TEdit
                Left = 88
                Top = 84
                Width = 177
                Height = 20
                BevelKind = bkFlat
                ImeName = 'Microsoft Office IME 2007'
                MaxLength = 5
                TabOrder = 2
                Text = '3003'
                OnChange = ed_dvrportChange
              end
              object btn_DVRUseReg: TRzBitBtn
                Left = 88
                Top = 112
                Caption = #46321#47197
                Color = 15791348
                HighlightColor = 16026986
                HotTrack = True
                HotTrackColor = 3983359
                TabOrder = 3
                OnClick = btn_DVRUseRegClick
                Glyph.Data = {
                  36060000424D3606000000000000360400002800000020000000100000000100
                  08000000000000020000E30E0000E30E00000001000000000000000000003300
                  00006600000099000000CC000000FF0000000033000033330000663300009933
                  0000CC330000FF33000000660000336600006666000099660000CC660000FF66
                  000000990000339900006699000099990000CC990000FF99000000CC000033CC
                  000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
                  0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
                  330000333300333333006633330099333300CC333300FF333300006633003366
                  33006666330099663300CC663300FF6633000099330033993300669933009999
                  3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
                  330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
                  66006600660099006600CC006600FF0066000033660033336600663366009933
                  6600CC336600FF33660000666600336666006666660099666600CC666600FF66
                  660000996600339966006699660099996600CC996600FF99660000CC660033CC
                  660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
                  6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
                  990000339900333399006633990099339900CC339900FF339900006699003366
                  99006666990099669900CC669900FF6699000099990033999900669999009999
                  9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
                  990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
                  CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
                  CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
                  CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
                  CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
                  CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
                  FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
                  FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
                  FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
                  FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
                  000000808000800000008000800080800000C0C0C00080808000191919004C4C
                  4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
                  6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
                  6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
                  90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
                  9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
                  909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
                  90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
                  B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
                  90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
                  B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
                  6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                NumGlyphs = 2
              end
              object btn_DVRUseSearch: TRzBitBtn
                Left = 190
                Top = 112
                Caption = #51312#54924
                Color = 15791348
                HighlightColor = 16026986
                HotTrack = True
                HotTrackColor = 3983359
                TabOrder = 4
                OnClick = btn_DVRUseSearchClick
                Glyph.Data = {
                  36060000424D3606000000000000360400002800000020000000100000000100
                  08000000000000020000430C0000430C00000001000000000000000000003300
                  00006600000099000000CC000000FF0000000033000033330000663300009933
                  0000CC330000FF33000000660000336600006666000099660000CC660000FF66
                  000000990000339900006699000099990000CC990000FF99000000CC000033CC
                  000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
                  0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
                  330000333300333333006633330099333300CC333300FF333300006633003366
                  33006666330099663300CC663300FF6633000099330033993300669933009999
                  3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
                  330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
                  66006600660099006600CC006600FF0066000033660033336600663366009933
                  6600CC336600FF33660000666600336666006666660099666600CC666600FF66
                  660000996600339966006699660099996600CC996600FF99660000CC660033CC
                  660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
                  6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
                  990000339900333399006633990099339900CC339900FF339900006699003366
                  99006666990099669900CC669900FF6699000099990033999900669999009999
                  9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
                  990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
                  CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
                  CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
                  CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
                  CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
                  CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
                  FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
                  FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
                  FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
                  FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
                  000000808000800000008000800080800000C0C0C00080808000191919004C4C
                  4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
                  6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
                  03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
                  0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
                  0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
                  0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
                  0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
                  0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
                  0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
                  0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
                  03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
                  E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
                NumGlyphs = 2
              end
            end
          end
          object rg_Primary: TRzGroupBox
            Left = 13
            Top = 225
            Width = 212
            Height = 64
            Caption = #9635' '#51452#53685#49888
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #44404#47548
            Font.Style = []
            GroupStyle = gsTopLine
            ParentColor = True
            ParentFont = False
            TabOrder = 11
            Transparent = True
            ThemeAware = False
            object rb_Dedicated: TRadioButton
              Left = 0
              Top = 16
              Width = 57
              Height = 17
              Caption = #51204#50857#49440
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = rb_DedicatedClick
            end
            object rb_tcpip: TRadioButton
              Left = 64
              Top = 16
              Width = 65
              Height = 17
              Caption = 'TCP/IP'
              TabOrder = 1
              OnClick = rb_tcpipClick
            end
            object rb_wcdma: TRadioButton
              Left = 136
              Top = 16
              Width = 65
              Height = 17
              Caption = 'WCDMA'
              TabOrder = 2
              OnClick = rb_wcdmaClick
            end
            object pan_KTTDetail: TPanel
              Left = 1
              Top = 32
              Width = 210
              Height = 31
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 3
              Visible = False
              object RzLabel5: TRzLabel
                Left = 5
                Top = 11
                Width = 18
                Height = 12
                Hint = #44288#51228#54016#50640' '#46321#47197#46108' '#48264#54840#47484' '#51077#47141#54616#49464#50836
                Caption = 'MUX'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = #44404#47548#52404
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                Transparent = True
                BlinkIntervalOff = 1500
              end
              object ed_Mux: TEdit
                Left = 32
                Top = 7
                Width = 49
                Height = 20
                ImeName = 'Microsoft IME 2003'
                MaxLength = 4
                TabOrder = 0
              end
              object btn_DetailKTTInfo: TRzBitBtn
                Left = 99
                Top = 2
                Width = 94
                Height = 29
                Caption = #49345#49464#46321#47197#51221#48372
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clBlack
                Font.Height = -12
                Font.Name = #44404#47548
                Font.Style = []
                HotTrack = True
                ParentFont = False
                TabOrder = 1
                OnClick = btn_DetailKTTInfoClick
                NumGlyphs = 2
              end
            end
          end
        end
        object TabArmExtension: TTabSheet
          Caption = #44221#44228#48512#44032#44592#45733
          ImageIndex = 6
          object GroupBox32: TGroupBox
            Left = 0
            Top = 0
            Width = 844
            Height = 73
            Align = alTop
            Caption = #51089#50629#49440#53469
            TabOrder = 0
            object Label52: TLabel
              Left = 16
              Top = 32
              Width = 48
              Height = 12
              Caption = #49688#54665#51089#50629
            end
            object cmb_ArmExtensionSelect: TComboBox
              Left = 80
              Top = 28
              Width = 417
              Height = 20
              Hint = #47700#51064#50640#49436' '#44221#44228' '#46608#45716' '#47196#52972#51060' '#44221#44228' '#46104#50632#51012#46412' '#47700#51064#44221#44228' '#44592#45733#51012' '#49440#53469' '#54624' '#49688' '#51080#49845#45768#45796'.'
              Style = csDropDownList
              ImeName = 'Microsoft Office IME 2007'
              ItemHeight = 12
              ItemIndex = 0
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = #49324#50857#50504#54632
              OnChange = cmb_ArmExtensionSelectChange
              Items.Strings = (
                #49324#50857#50504#54632
                #51452#51109#52824#44032' '#44032#51077#51088#54869#51109#44592#47484' '#44221#44228#49884#53412#44256' '#51452#51109#52824#44032' '#44221#44228#46120
                #44032#51077#51088' '#54869#51109#44592#44032' '#44221#44228#46108' '#49345#53468#50640#49436#47564' '#51452#51109#52824#44032' '#44221#44228#46120)
            end
          end
          object pan_ArmExtension: TPanel
            Left = -8
            Top = 73
            Width = 831
            Height = 396
            TabOrder = 1
            Visible = False
            object pan_ArmExtensionMessage: TPanel
              Left = 1
              Top = 1
              Width = 829
              Height = 41
              Align = alTop
              Caption = #47700#51064#50640#49436' '#44221#44228' '#54616#47732' '#50500#47000' '#52404#53356#46104#50612' '#51080#45716' '#47196#52972#51012' '#44221#44228#54616#45716' '#44592#45733#51077#45768#45796'.'
              Color = clGradientActiveCaption
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object Group_MainToLocalDevice: TGroupBox
              Left = 16
              Top = 56
              Width = 385
              Height = 249
              Caption = #49324#50857#52968#53944#47204#47084' '#51648#51221
              Color = clBtnFace
              ParentColor = False
              TabOrder = 1
              object chk_ArmExtension00: TCheckBox
                Left = 16
                Top = 24
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 0
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox3: TCheckBox
                Tag = 1
                Left = 16
                Top = 45
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 1
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox4: TCheckBox
                Tag = 4
                Left = 16
                Top = 109
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 2
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox5: TCheckBox
                Tag = 2
                Left = 16
                Top = 66
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 3
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox6: TCheckBox
                Tag = 3
                Left = 16
                Top = 88
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 4
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox7: TCheckBox
                Tag = 5
                Left = 16
                Top = 130
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 5
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox8: TCheckBox
                Tag = 6
                Left = 16
                Top = 152
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 6
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox9: TCheckBox
                Tag = 7
                Left = 16
                Top = 173
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 7
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox10: TCheckBox
                Tag = 8
                Left = 16
                Top = 194
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 8
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox11: TCheckBox
                Tag = 9
                Left = 16
                Top = 216
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 9
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox12: TCheckBox
                Tag = 19
                Left = 57
                Top = 216
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 10
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox13: TCheckBox
                Tag = 18
                Left = 57
                Top = 194
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 11
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox14: TCheckBox
                Tag = 17
                Left = 57
                Top = 173
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 12
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox15: TCheckBox
                Tag = 16
                Left = 57
                Top = 152
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 13
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox16: TCheckBox
                Tag = 13
                Left = 57
                Top = 88
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 14
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox17: TCheckBox
                Tag = 15
                Left = 57
                Top = 130
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 15
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox18: TCheckBox
                Tag = 14
                Left = 57
                Top = 109
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 16
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox19: TCheckBox
                Tag = 12
                Left = 57
                Top = 66
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 17
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox20: TCheckBox
                Tag = 11
                Left = 57
                Top = 45
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 18
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox21: TCheckBox
                Tag = 10
                Left = 57
                Top = 24
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 19
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox22: TCheckBox
                Tag = 29
                Left = 99
                Top = 216
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 20
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox23: TCheckBox
                Tag = 28
                Left = 99
                Top = 194
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 21
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox24: TCheckBox
                Tag = 27
                Left = 99
                Top = 173
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 22
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox25: TCheckBox
                Tag = 26
                Left = 99
                Top = 152
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 23
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox26: TCheckBox
                Tag = 23
                Left = 99
                Top = 88
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 24
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox27: TCheckBox
                Tag = 25
                Left = 99
                Top = 130
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 25
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox28: TCheckBox
                Tag = 24
                Left = 99
                Top = 109
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 26
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox29: TCheckBox
                Tag = 22
                Left = 99
                Top = 66
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 27
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox30: TCheckBox
                Tag = 21
                Left = 99
                Top = 45
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 28
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox31: TCheckBox
                Tag = 20
                Left = 99
                Top = 24
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 29
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox32: TCheckBox
                Tag = 39
                Left = 141
                Top = 216
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 30
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox33: TCheckBox
                Tag = 38
                Left = 141
                Top = 194
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 31
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox34: TCheckBox
                Tag = 37
                Left = 141
                Top = 173
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 32
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox35: TCheckBox
                Tag = 36
                Left = 141
                Top = 152
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 33
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox36: TCheckBox
                Tag = 33
                Left = 141
                Top = 88
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 34
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox37: TCheckBox
                Tag = 35
                Left = 141
                Top = 130
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 35
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox38: TCheckBox
                Tag = 34
                Left = 141
                Top = 109
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 36
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox39: TCheckBox
                Tag = 32
                Left = 141
                Top = 66
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 37
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox40: TCheckBox
                Tag = 31
                Left = 141
                Top = 45
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 38
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox41: TCheckBox
                Tag = 30
                Left = 141
                Top = 24
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 39
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox42: TCheckBox
                Tag = 49
                Left = 183
                Top = 216
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 40
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox43: TCheckBox
                Tag = 48
                Left = 183
                Top = 194
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 41
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox44: TCheckBox
                Tag = 47
                Left = 183
                Top = 173
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 42
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox45: TCheckBox
                Tag = 46
                Left = 183
                Top = 152
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 43
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox46: TCheckBox
                Tag = 43
                Left = 183
                Top = 88
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 44
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox47: TCheckBox
                Tag = 45
                Left = 183
                Top = 130
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 45
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox48: TCheckBox
                Tag = 44
                Left = 183
                Top = 109
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 46
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox49: TCheckBox
                Tag = 42
                Left = 183
                Top = 66
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 47
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox50: TCheckBox
                Tag = 41
                Left = 183
                Top = 45
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 48
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox51: TCheckBox
                Tag = 40
                Left = 183
                Top = 24
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 49
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox52: TCheckBox
                Tag = 59
                Left = 224
                Top = 216
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 50
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox53: TCheckBox
                Tag = 58
                Left = 224
                Top = 194
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 51
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox54: TCheckBox
                Tag = 57
                Left = 224
                Top = 173
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 52
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox55: TCheckBox
                Tag = 56
                Left = 224
                Top = 152
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 53
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox56: TCheckBox
                Tag = 53
                Left = 224
                Top = 88
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 54
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox57: TCheckBox
                Tag = 55
                Left = 224
                Top = 130
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 55
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox58: TCheckBox
                Tag = 54
                Left = 224
                Top = 109
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 56
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox59: TCheckBox
                Tag = 52
                Left = 224
                Top = 66
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 57
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox60: TCheckBox
                Tag = 51
                Left = 224
                Top = 45
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 58
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox61: TCheckBox
                Tag = 50
                Left = 224
                Top = 24
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 59
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox66: TCheckBox
                Tag = 63
                Left = 266
                Top = 88
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 60
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox69: TCheckBox
                Tag = 62
                Left = 266
                Top = 66
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 61
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox70: TCheckBox
                Tag = 61
                Left = 266
                Top = 45
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 62
                OnClick = chk_ArmExtension00Click
              end
              object CheckBox71: TCheckBox
                Tag = 60
                Left = 266
                Top = 24
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 63
                OnClick = chk_ArmExtension00Click
              end
            end
            object Group_MainToLocalAll: TGroupBox
              Left = 16
              Top = 312
              Width = 385
              Height = 41
              TabOrder = 2
              object chkMainToLocal1: TCheckBox
                Left = 16
                Top = 16
                Width = 41
                Height = 17
                Caption = '00'
                TabOrder = 0
                OnClick = chkMainToLocal1Click
              end
              object CheckBox103: TCheckBox
                Tag = 1
                Left = 57
                Top = 16
                Width = 41
                Height = 17
                Caption = '10'
                TabOrder = 1
                OnClick = chkMainToLocal1Click
              end
              object CheckBox104: TCheckBox
                Tag = 2
                Left = 99
                Top = 16
                Width = 41
                Height = 17
                Caption = '20'
                TabOrder = 2
                OnClick = chkMainToLocal1Click
              end
              object CheckBox105: TCheckBox
                Tag = 3
                Left = 141
                Top = 16
                Width = 41
                Height = 17
                Caption = '30'
                TabOrder = 3
                OnClick = chkMainToLocal1Click
              end
              object CheckBox106: TCheckBox
                Tag = 4
                Left = 183
                Top = 16
                Width = 41
                Height = 17
                Caption = '40'
                TabOrder = 4
                OnClick = chkMainToLocal1Click
              end
              object CheckBox107: TCheckBox
                Tag = 5
                Left = 224
                Top = 16
                Width = 41
                Height = 17
                Caption = '50'
                TabOrder = 5
                OnClick = chkMainToLocal1Click
              end
              object CheckBox108: TCheckBox
                Tag = 6
                Left = 266
                Top = 16
                Width = 41
                Height = 17
                Caption = '60'
                TabOrder = 6
                OnClick = chkMainToLocal1Click
              end
              object chkAllMainToLocal: TCheckBox
                Tag = 99
                Left = 312
                Top = 16
                Width = 49
                Height = 17
                Caption = #51204#52404
                TabOrder = 7
                OnClick = chkMainToLocal1Click
              end
            end
          end
        end
        object TabSystemInfo: TTabSheet
          Caption = #49884#49828#53596#51221#48372#46321#47197
          ImageIndex = 1
          object gb_SystemInfo: TGroupBox
            Left = 16
            Top = 16
            Width = 465
            Height = 417
            Caption = #49884#49828#53596#51221#48372
            TabOrder = 0
            object Label15: TLabel
              Left = 267
              Top = 73
              Width = 12
              Height = 12
              Caption = #52488
              Transparent = True
            end
            object Label4: TLabel
              Left = 268
              Top = 98
              Width = 12
              Height = 12
              Caption = #52488
              Transparent = True
            end
            object StaticText3: TStaticText
              Left = 16
              Top = 47
              Width = 161
              Height = 17
              Hint = 'AC'#51204#50896' OFF'#49884' AC'#45800#49440' '#49888#54840#47484' '#44288#51228#49468#53552#50640' '#49888#54840#51204#49569' '#50976#47924#47484' '#49440#53469#54633#45768#45796'.'
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #51221#51204' '#44048#49884' '#50668#48512
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object ComboBox_WatchPowerOff: TRzComboBox
              Left = 196
              Top = 45
              Width = 260
              Height = 20
              Hint = 'AC'#51204#50896' OFF'#49884' AC'#45800#49440' '#49888#54840#47484' '#44288#51228#49468#53552#50640' '#49888#54840#51204#49569' '#50976#47924#47484' '#49440#53469#54633#45768#45796'.'
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnChange = ComboBox_WatchPowerOffChange
              OnClick = ComboBox_WatchPowerOffClick
            end
            object st_DoorType1: TStaticText
              Left = 16
              Top = 145
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = 'Door1 '#50857#46020
              TabOrder = 2
            end
            object ComboBox_DoorType1: TRzComboBox
              Left = 196
              Top = 143
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 3
              OnChange = ComboBox_WatchPowerOffChange
              OnClick = ComboBox_WatchPowerOffClick
            end
            object ComboBox_DoorType2: TRzComboBox
              Left = 196
              Top = 167
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 4
              OnChange = ComboBox_WatchPowerOffChange
              OnClick = ComboBox_WatchPowerOffClick
            end
            object st_DoorType2: TStaticText
              Left = 16
              Top = 169
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = 'Door2 '#50857#46020
              TabOrder = 5
            end
            object StaticText8: TStaticText
              Left = 16
              Top = 372
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #50948#52824#47749
              TabOrder = 6
            end
            object Edit_Locate: TEdit
              Left = 196
              Top = 368
              Width = 260
              Height = 25
              AutoSize = False
              BevelKind = bkFlat
              ImeName = 'Microsoft IME 2003'
              TabOrder = 7
              OnChange = Edit_LocateChange
              OnExit = Edit_LocateExit
              OnKeyPress = Edit_LocateKeyPress
              OnKeyUp = Edit_LocateKeyUp
            end
            object SpinEdit_OutDelay: TRzSpinEdit
              Left = 196
              Top = 69
              Width = 51
              Height = 20
              AllowKeyEdit = True
              Max = 600.000000000000000000
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              TabOrder = 8
              OnEnter = SpinEdit_OutDelayEnter
              OnKeyUp = SpinEdit_OutDelayKeyUp
              OnMouseEnter = SpinEdit_OutDelayMouseEnter
              OnMouseUp = SpinEdit_OutDelayMouseUp
            end
            object SpinEdit_InDelay: TRzSpinEdit
              Left = 196
              Top = 94
              Width = 51
              Height = 20
              AllowKeyEdit = True
              Max = 600.000000000000000000
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              TabOrder = 9
              OnEnter = SpinEdit_InDelayEnter
              OnKeyUp = SpinEdit_InDelayKeyUp
              OnMouseEnter = SpinEdit_InDelayMouseEnter
              OnMouseUp = SpinEdit_InDelayMouseUp
            end
            object StaticText5: TStaticText
              Left = 16
              Top = 71
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #53748#49892#51648#50672#49884#44036
              TabOrder = 10
            end
            object StaticText28: TStaticText
              Left = 16
              Top = 96
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #51077#49892#51648#50672#49884#44036
              TabOrder = 11
            end
            object cmb_ArmRelay: TRzComboBox
              Left = 196
              Top = 342
              Width = 260
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 12
              Text = #44221#44228#49884'ON('#49660#53944')'
              OnChange = cmb_ArmRelayChange
              Items.Strings = (
                #44221#44228#49884'ON('#49660#53944')'
                #54644#51228#49884'ON('#49660#53944')')
              ItemIndex = 0
            end
            object StaticText32: TStaticText
              Left = 16
              Top = 344
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #44221#54644'Relay'#46041#51089#48169#48277
              TabOrder = 13
            end
            object StaticText6: TStaticText
              Left = 16
              Top = 23
              Width = 161
              Height = 17
              Hint = 'DOOR2'#49324#50857#49884' '#51316'6(DS),'#51316'7(LS),'#51316'8(EX) '#47196' '#46041#51089#46121#45768#45796'.'
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = 'Door2'#49324#50857#44396#48516
              ParentShowHint = False
              ShowHint = True
              TabOrder = 14
            end
            object cmb_Relay2Type: TRzComboBox
              Left = 196
              Top = 21
              Width = 260
              Height = 20
              Hint = 'DOOR2'#49324#50857#49884' '#51316'6(DS),'#51316'7(LS),'#51316'8(EX) '#47196' '#46041#51089#46121#45768#45796'.'
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 15
              Text = #48120#49324#50857
              OnChange = cmb_Relay2TypeChange
              Items.Strings = (
                #48120#49324#50857
                #52840#51077#51217#51216#46020#50612#46973#49324#50857
                #44221#54644#51217#51216#46020#50612#46973#49324#50857)
              ItemIndex = 0
            end
            object st_Doortype4: TStaticText
              Left = 16
              Top = 217
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = 'Door4 '#50857#46020
              TabOrder = 16
            end
            object st_Doortype3: TStaticText
              Left = 16
              Top = 193
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = 'Door3 '#50857#46020
              TabOrder = 17
            end
            object ComboBox_DoorType3: TRzComboBox
              Left = 196
              Top = 191
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 18
              OnChange = ComboBox_WatchPowerOffChange
              OnClick = ComboBox_WatchPowerOffClick
            end
            object ComboBox_DoorType4: TRzComboBox
              Left = 196
              Top = 215
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 19
              OnChange = ComboBox_WatchPowerOffChange
              OnClick = ComboBox_WatchPowerOffClick
            end
            object st_Doortype6: TStaticText
              Left = 16
              Top = 265
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = 'Door6 '#50857#46020
              TabOrder = 20
            end
            object st_Doortype5: TStaticText
              Left = 16
              Top = 241
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = 'Door5 '#50857#46020
              TabOrder = 21
            end
            object ComboBox_DoorType5: TRzComboBox
              Left = 196
              Top = 239
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 22
              OnChange = ComboBox_WatchPowerOffChange
              OnClick = ComboBox_WatchPowerOffClick
            end
            object ComboBox_DoorType6: TRzComboBox
              Left = 196
              Top = 263
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 23
              OnChange = ComboBox_WatchPowerOffChange
              OnClick = ComboBox_WatchPowerOffClick
            end
            object st_Doortype8: TStaticText
              Left = 16
              Top = 313
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = 'Door8 '#50857#46020
              TabOrder = 24
            end
            object st_Doortype7: TStaticText
              Left = 16
              Top = 289
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = 'Door7 '#50857#46020
              TabOrder = 25
            end
            object ComboBox_DoorType7: TRzComboBox
              Left = 196
              Top = 287
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 26
              OnChange = ComboBox_WatchPowerOffChange
              OnClick = ComboBox_WatchPowerOffClick
            end
            object ComboBox_DoorType8: TRzComboBox
              Left = 196
              Top = 311
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 27
              OnChange = ComboBox_WatchPowerOffChange
              OnClick = ComboBox_WatchPowerOffClick
            end
            object gb_DoorAlarmArea: TGroupBox
              Left = 328
              Top = 94
              Width = 129
              Height = 243
              Caption = #48169#48276#44396#50669#49444#51221
              TabOrder = 28
              object Panel7: TPanel
                Left = 2
                Top = 14
                Width = 125
                Height = 27
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object chk_DoorArmAreaUse: TCheckBox
                  Left = 8
                  Top = 8
                  Width = 89
                  Height = 17
                  Caption = #44396#50669#44221#44228#49324#50857
                  Checked = True
                  State = cbChecked
                  TabOrder = 0
                  OnClick = chk_DoorArmAreaUseClick
                end
              end
              object cmbDoorAlarmArea1: TRzComboBox
                Tag = 1
                Left = 11
                Top = 48
                Width = 108
                Height = 20
                Style = csDropDownList
                Ctl3D = False
                FlatButtons = True
                FrameVisible = True
                ImeName = 'Microsoft IME 2003'
                ItemHeight = 12
                ParentCtl3D = False
                TabOrder = 1
                Text = #49324#50857#50504#54632
                OnChange = cmbDoorAlarmArea1Change
                Items.Strings = (
                  #49324#50857#50504#54632
                  #44396#50669'1'
                  #44396#50669'2'
                  #44396#50669'3'
                  #44396#50669'4'
                  #44396#50669'5'
                  #44396#50669'6'
                  #44396#50669'7'
                  #44396#50669'8')
                ItemIndex = 0
              end
              object cmbDoorAlarmArea2: TRzComboBox
                Tag = 2
                Left = 11
                Top = 72
                Width = 108
                Height = 20
                Style = csDropDownList
                Ctl3D = False
                FlatButtons = True
                FrameVisible = True
                ImeName = 'Microsoft IME 2003'
                ItemHeight = 12
                ParentCtl3D = False
                TabOrder = 2
                Text = #49324#50857#50504#54632
                OnChange = cmbDoorAlarmArea1Change
                Items.Strings = (
                  #49324#50857#50504#54632
                  #44396#50669'1'
                  #44396#50669'2'
                  #44396#50669'3'
                  #44396#50669'4'
                  #44396#50669'5'
                  #44396#50669'6'
                  #44396#50669'7'
                  #44396#50669'8')
                ItemIndex = 0
              end
              object cmbDoorAlarmArea3: TRzComboBox
                Tag = 3
                Left = 11
                Top = 96
                Width = 108
                Height = 20
                Style = csDropDownList
                Ctl3D = False
                FlatButtons = True
                FrameVisible = True
                ImeName = 'Microsoft IME 2003'
                ItemHeight = 12
                ParentCtl3D = False
                TabOrder = 3
                Text = #49324#50857#50504#54632
                OnChange = cmbDoorAlarmArea1Change
                Items.Strings = (
                  #49324#50857#50504#54632
                  #44396#50669'1'
                  #44396#50669'2'
                  #44396#50669'3'
                  #44396#50669'4'
                  #44396#50669'5'
                  #44396#50669'6'
                  #44396#50669'7'
                  #44396#50669'8')
                ItemIndex = 0
              end
              object cmbDoorAlarmArea4: TRzComboBox
                Tag = 4
                Left = 11
                Top = 120
                Width = 108
                Height = 20
                Style = csDropDownList
                Ctl3D = False
                FlatButtons = True
                FrameVisible = True
                ImeName = 'Microsoft IME 2003'
                ItemHeight = 12
                ParentCtl3D = False
                TabOrder = 4
                Text = #49324#50857#50504#54632
                OnChange = cmbDoorAlarmArea1Change
                Items.Strings = (
                  #49324#50857#50504#54632
                  #44396#50669'1'
                  #44396#50669'2'
                  #44396#50669'3'
                  #44396#50669'4'
                  #44396#50669'5'
                  #44396#50669'6'
                  #44396#50669'7'
                  #44396#50669'8')
                ItemIndex = 0
              end
              object cmbDoorAlarmArea5: TRzComboBox
                Tag = 5
                Left = 11
                Top = 144
                Width = 108
                Height = 20
                Style = csDropDownList
                Ctl3D = False
                FlatButtons = True
                FrameVisible = True
                ImeName = 'Microsoft IME 2003'
                ItemHeight = 12
                ParentCtl3D = False
                TabOrder = 5
                Text = #49324#50857#50504#54632
                OnChange = cmbDoorAlarmArea1Change
                Items.Strings = (
                  #49324#50857#50504#54632
                  #44396#50669'1'
                  #44396#50669'2'
                  #44396#50669'3'
                  #44396#50669'4'
                  #44396#50669'5'
                  #44396#50669'6'
                  #44396#50669'7'
                  #44396#50669'8')
                ItemIndex = 0
              end
              object cmbDoorAlarmArea6: TRzComboBox
                Tag = 6
                Left = 11
                Top = 168
                Width = 108
                Height = 20
                Style = csDropDownList
                Ctl3D = False
                FlatButtons = True
                FrameVisible = True
                ImeName = 'Microsoft IME 2003'
                ItemHeight = 12
                ParentCtl3D = False
                TabOrder = 6
                Text = #49324#50857#50504#54632
                OnChange = cmbDoorAlarmArea1Change
                Items.Strings = (
                  #49324#50857#50504#54632
                  #44396#50669'1'
                  #44396#50669'2'
                  #44396#50669'3'
                  #44396#50669'4'
                  #44396#50669'5'
                  #44396#50669'6'
                  #44396#50669'7'
                  #44396#50669'8')
                ItemIndex = 0
              end
              object cmbDoorAlarmArea7: TRzComboBox
                Tag = 7
                Left = 11
                Top = 192
                Width = 108
                Height = 20
                Style = csDropDownList
                Ctl3D = False
                FlatButtons = True
                FrameVisible = True
                ImeName = 'Microsoft IME 2003'
                ItemHeight = 12
                ParentCtl3D = False
                TabOrder = 7
                Text = #49324#50857#50504#54632
                OnChange = cmbDoorAlarmArea1Change
                Items.Strings = (
                  #49324#50857#50504#54632
                  #44396#50669'1'
                  #44396#50669'2'
                  #44396#50669'3'
                  #44396#50669'4'
                  #44396#50669'5'
                  #44396#50669'6'
                  #44396#50669'7'
                  #44396#50669'8')
                ItemIndex = 0
              end
              object cmbDoorAlarmArea8: TRzComboBox
                Tag = 8
                Left = 11
                Top = 217
                Width = 108
                Height = 20
                Style = csDropDownList
                Ctl3D = False
                FlatButtons = True
                FrameVisible = True
                ImeName = 'Microsoft IME 2003'
                ItemHeight = 12
                ParentCtl3D = False
                TabOrder = 8
                Text = #49324#50857#50504#54632
                OnChange = cmbDoorAlarmArea1Change
                Items.Strings = (
                  #49324#50857#50504#54632
                  #44396#50669'1'
                  #44396#50669'2'
                  #44396#50669'3'
                  #44396#50669'4'
                  #44396#50669'5'
                  #44396#50669'6'
                  #44396#50669'7'
                  #44396#50669'8')
                ItemIndex = 0
              end
            end
            object StaticText152: TStaticText
              Left = 16
              Top = 121
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #51116#51473#49884#51648#50672#51316#49324#50857#50976#47924
              TabOrder = 29
            end
            object cmb_JaejungDelayUse: TRzComboBox
              Left = 196
              Top = 119
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 30
              Text = #48120#49324#50857
              OnChange = ComboBox_WatchPowerOffChange
              OnClick = ComboBox_WatchPowerOffClick
              Items.Strings = (
                #48120#49324#50857
                #49324#50857)
              ItemIndex = 0
            end
          end
          object gb_SystemZoneExtension: TGroupBox
            Left = 488
            Top = 144
            Width = 337
            Height = 225
            Caption = #44048#51109#44592#49324#50857#50976#47924
            TabOrder = 1
            object StaticText138: TStaticText
              Left = 16
              Top = 23
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #44048#51109#44592'1'#48264'('#52636#51077#47928'3'#48264')'
              TabOrder = 0
            end
            object StaticText139: TStaticText
              Left = 16
              Top = 47
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #44048#51109#44592'2'#48264'('#52636#51077#47928'4'#48264')'
              TabOrder = 1
            end
            object StaticText140: TStaticText
              Left = 16
              Top = 71
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #44048#51109#44592'3'#48264'('#52636#51077#47928'5'#48264')'
              TabOrder = 2
            end
            object StaticText141: TStaticText
              Left = 16
              Top = 96
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #44048#51109#44592'4'#48264'('#52636#51077#47928'6'#48264')'
              TabOrder = 3
            end
            object StaticText142: TStaticText
              Left = 16
              Top = 121
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #44048#51109#44592'5'#48264'('#52636#51077#47928'7'#48264')'
              TabOrder = 4
            end
            object StaticText143: TStaticText
              Left = 16
              Top = 145
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #44048#51109#44592'6'#48264'('#52636#51077#47928'8'#48264')'
              TabOrder = 5
            end
            object StaticText144: TStaticText
              Left = 16
              Top = 169
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #44048#51109#44592'7'#48264'('#52636#51077#47928#50630#51020')'
              TabOrder = 6
            end
            object StaticText145: TStaticText
              Left = 16
              Top = 193
              Width = 161
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #44048#51109#44592'8'#48264'('#52636#51077#47928#50630#51020')'
              TabOrder = 7
            end
            object cmb_SystemZoneExtensionUse1: TRzComboBox
              Tag = 1
              Left = 187
              Top = 21
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 8
              Text = #48120#49324#50857
              OnChange = cmb_SystemZoneExtensionUse1Change
              Items.Strings = (
                #48120#49324#50857
                'LOCK+ZONE'#49324#50857
                'LOCK'#51204#50857)
              ItemIndex = 0
            end
            object cmb_SystemZoneExtensionUse2: TRzComboBox
              Tag = 2
              Left = 187
              Top = 45
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 9
              Text = #48120#49324#50857
              OnChange = cmb_SystemZoneExtensionUse1Change
              Items.Strings = (
                #48120#49324#50857
                'LOCK+ZONE'#49324#50857
                'LOCK'#51204#50857)
              ItemIndex = 0
            end
            object cmb_SystemZoneExtensionUse3: TRzComboBox
              Tag = 3
              Left = 187
              Top = 69
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 10
              Text = #48120#49324#50857
              OnChange = cmb_SystemZoneExtensionUse1Change
              Items.Strings = (
                #48120#49324#50857
                'LOCK+ZONE'#49324#50857
                'LOCK'#51204#50857)
              ItemIndex = 0
            end
            object cmb_SystemZoneExtensionUse4: TRzComboBox
              Tag = 4
              Left = 187
              Top = 93
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 11
              Text = #48120#49324#50857
              OnChange = cmb_SystemZoneExtensionUse1Change
              Items.Strings = (
                #48120#49324#50857
                'LOCK+ZONE'#49324#50857
                'LOCK'#51204#50857)
              ItemIndex = 0
            end
            object cmb_SystemZoneExtensionUse5: TRzComboBox
              Tag = 5
              Left = 187
              Top = 118
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 12
              Text = #48120#49324#50857
              OnChange = cmb_SystemZoneExtensionUse1Change
              Items.Strings = (
                #48120#49324#50857
                'LOCK+ZONE'#49324#50857
                'LOCK'#51204#50857)
              ItemIndex = 0
            end
            object cmb_SystemZoneExtensionUse6: TRzComboBox
              Tag = 6
              Left = 187
              Top = 142
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 13
              Text = #48120#49324#50857
              OnChange = cmb_SystemZoneExtensionUse1Change
              Items.Strings = (
                #48120#49324#50857
                'LOCK+ZONE'#49324#50857
                'LOCK'#51204#50857)
              ItemIndex = 0
            end
            object cmb_SystemZoneExtensionUse7: TRzComboBox
              Tag = 7
              Left = 187
              Top = 166
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 14
              Text = #48120#49324#50857
              OnChange = cmb_SystemZoneExtensionUse1Change
              Items.Strings = (
                #48120#49324#50857
                'ZONE'#51204#50857)
              ItemIndex = 0
            end
            object cmb_SystemZoneExtensionUse8: TRzComboBox
              Tag = 8
              Left = 187
              Top = 191
              Width = 120
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 15
              Text = #48120#49324#50857
              OnChange = cmb_SystemZoneExtensionUse1Change
              Items.Strings = (
                #48120#49324#50857
                'ZONE'#51204#50857)
              ItemIndex = 0
            end
          end
          object GroupBox19: TGroupBox
            Left = 488
            Top = 16
            Width = 337
            Height = 57
            Caption = #44397#49440#52404#53356
            TabOrder = 2
            object Label80: TLabel
              Left = 62
              Top = 26
              Width = 80
              Height = 12
              Hint = #49444#51221#46108' '#49884#44036' '#44221#44284#49884' '#44397#49440#52404#44536' '#49888#54840' '#48156#48372#13#10#45800') 0 '#51060#47732' 1'#48516' '#51060#45236#50640' '#48156#48372
              Caption = #49884#44036' '#54980' '#49884#51089#54632
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #44404#47548
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
            end
            object edPtDelayTime: TEdit
              Left = 15
              Top = 22
              Width = 42
              Height = 20
              Hint = #49444#51221#46108' '#49884#44036' '#44221#44284#49884' '#44397#49440#52404#44536' '#49888#54840' '#48156#48372#13#10#45800') 0 '#51060#47732' 1'#48516' '#51060#45236#50640' '#48156#48372
              ImeName = 'Microsoft IME 2003'
              MaxLength = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Text = '00'
            end
            object btn_RegCheckTime: TBitBtn
              Left = 160
              Top = 20
              Width = 57
              Height = 25
              Caption = #46321#47197
              TabOrder = 1
              OnClick = btn_RegCheckTimeClick
            end
          end
          object gb_ServerCard: TGroupBox
            Left = 488
            Top = 80
            Width = 337
            Height = 57
            Caption = #49436#48260#52852#46300
            TabOrder = 3
            Visible = False
            object cmb_ServerCardNF: TRzComboBox
              Tag = 8
              Left = 19
              Top = 21
              Width = 286
              Height = 20
              Style = csDropDownList
              Ctl3D = False
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              ParentCtl3D = False
              TabOrder = 0
              Items.Strings = (
                #53685#49888#51060#49345#49884' '#52636#51077#49849#51064
                #53685#49888#51060#49345#49884' '#52636#51077#48520#44032)
            end
          end
        end
        object Tab_Port: TTabSheet
          Caption = #54252#53944#49444#51221
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ImageIndex = 4
          ParentFont = False
          object pg_PortSetting: TPageControl
            Left = 8
            Top = 8
            Width = 793
            Height = 449
            ActivePage = tab_ExtensionPort
            TabOrder = 0
            OnChange = pg_DeviceSettingChange
            object tab_LocalPort: TTabSheet
              Caption = #52968#53944#47204#47084
              object gb_Port: TGroupBox
                Left = 16
                Top = 16
                Width = 601
                Height = 265
                Caption = #44048#49884#51316
                TabOrder = 0
                object StaticText37: TStaticText
                  Left = 16
                  Top = 53
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '1'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 0
                end
                object RzPanel9: TRzPanel
                  Left = 86
                  Top = 22
                  Width = 120
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #44048#49884#54805#53468
                  TabOrder = 1
                end
                object cmb_WatchType1: TRzComboBox
                  Left = 86
                  Top = 51
                  Width = 120
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 2
                  OnClick = cmb_WatchTypeClick
                  OnEnter = cmb_WatchType1Enter
                end
                object RzPanel10: TRzPanel
                  Left = 14
                  Top = 22
                  Width = 67
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #51316#48264#54840
                  TabOrder = 3
                end
                object StaticText38: TStaticText
                  Left = 16
                  Top = 77
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '2'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 4
                end
                object StaticText39: TStaticText
                  Left = 16
                  Top = 102
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '3'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 5
                end
                object StaticText40: TStaticText
                  Left = 16
                  Top = 126
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '4'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 6
                end
                object StaticText41: TStaticText
                  Left = 16
                  Top = 151
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '5'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 7
                end
                object StaticText42: TStaticText
                  Left = 16
                  Top = 175
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '6'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 8
                end
                object RzPanel12: TRzPanel
                  Left = 304
                  Top = 22
                  Width = 90
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #48373#44396#49888#54840
                  TabOrder = 9
                end
                object cmb_recorver1: TRzComboBox
                  Tag = 1
                  Left = 304
                  Top = 51
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 10
                  OnClick = cmb_WatchTypeClick
                end
                object cmb_WatchType2: TRzComboBox
                  Left = 86
                  Top = 75
                  Width = 120
                  Height = 20
                  Hint = '2'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 11
                  OnClick = cmb_WatchTypeClick
                  OnEnter = cmb_WatchType1Enter
                end
                object cmb_recorver2: TRzComboBox
                  Tag = 1
                  Left = 304
                  Top = 75
                  Width = 90
                  Height = 20
                  Hint = '2'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 12
                  OnClick = cmb_WatchTypeClick
                end
                object cmb_WatchType3: TRzComboBox
                  Left = 86
                  Top = 100
                  Width = 120
                  Height = 20
                  Hint = '3'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 13
                  OnClick = cmb_WatchTypeClick
                  OnEnter = cmb_WatchType1Enter
                end
                object cmb_recorver3: TRzComboBox
                  Tag = 1
                  Left = 304
                  Top = 100
                  Width = 90
                  Height = 20
                  Hint = '3'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 14
                  OnClick = cmb_WatchTypeClick
                end
                object cmb_WatchType4: TRzComboBox
                  Left = 86
                  Top = 124
                  Width = 120
                  Height = 20
                  Hint = '4'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 15
                  OnClick = cmb_WatchTypeClick
                  OnEnter = cmb_WatchType1Enter
                end
                object cmb_recorver4: TRzComboBox
                  Tag = 1
                  Left = 304
                  Top = 124
                  Width = 90
                  Height = 20
                  Hint = '4'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 16
                  OnClick = cmb_WatchTypeClick
                end
                object cmb_WatchType5: TRzComboBox
                  Left = 86
                  Top = 149
                  Width = 120
                  Height = 20
                  Hint = '5'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 17
                  OnClick = cmb_WatchTypeClick
                  OnEnter = cmb_WatchType1Enter
                end
                object cmb_recorver5: TRzComboBox
                  Tag = 1
                  Left = 304
                  Top = 149
                  Width = 90
                  Height = 20
                  Hint = '5'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 18
                  OnClick = cmb_WatchTypeClick
                end
                object cmb_WatchType6: TRzComboBox
                  Left = 86
                  Top = 173
                  Width = 120
                  Height = 20
                  Hint = '6'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 19
                  OnClick = cmb_WatchTypeClick
                  OnEnter = cmb_WatchType1Enter
                end
                object cmb_recorver6: TRzComboBox
                  Tag = 1
                  Left = 304
                  Top = 173
                  Width = 90
                  Height = 20
                  Hint = '6'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 20
                  OnClick = cmb_WatchTypeClick
                end
                object StaticText63: TStaticText
                  Left = 16
                  Top = 200
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '7'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 21
                end
                object cmb_WatchType7: TRzComboBox
                  Left = 86
                  Top = 198
                  Width = 120
                  Height = 20
                  Hint = '7'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 22
                  OnClick = cmb_WatchTypeClick
                  OnEnter = cmb_WatchType1Enter
                end
                object cmb_recorver7: TRzComboBox
                  Tag = 1
                  Left = 304
                  Top = 198
                  Width = 90
                  Height = 20
                  Hint = '7'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 23
                  OnClick = cmb_WatchTypeClick
                end
                object cmb_recorver8: TRzComboBox
                  Tag = 1
                  Left = 304
                  Top = 223
                  Width = 90
                  Height = 20
                  Hint = '8'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 24
                  OnClick = cmb_WatchTypeClick
                end
                object cmb_WatchType8: TRzComboBox
                  Left = 86
                  Top = 223
                  Width = 120
                  Height = 20
                  Hint = '8'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 25
                  OnClick = cmb_WatchTypeClick
                  OnEnter = cmb_WatchType1Enter
                end
                object StaticText64: TStaticText
                  Left = 16
                  Top = 225
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '8'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 26
                end
                object RzPanel11: TRzPanel
                  Left = 210
                  Top = 22
                  Width = 90
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #51648#50672#49884#44036
                  TabOrder = 27
                end
                object cmb_WatchDelay1: TRzComboBox
                  Left = 210
                  Top = 51
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 28
                  OnClick = cmb_WatchTypeClick
                end
                object cmb_WatchDelay2: TRzComboBox
                  Left = 210
                  Top = 75
                  Width = 90
                  Height = 20
                  Hint = '2'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 29
                  OnClick = cmb_WatchTypeClick
                end
                object cmb_WatchDelay3: TRzComboBox
                  Left = 210
                  Top = 100
                  Width = 90
                  Height = 20
                  Hint = '3'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 30
                  OnClick = cmb_WatchTypeClick
                end
                object cmb_WatchDelay4: TRzComboBox
                  Left = 210
                  Top = 124
                  Width = 90
                  Height = 20
                  Hint = '4'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 31
                  OnClick = cmb_WatchTypeClick
                end
                object cmb_WatchDelay5: TRzComboBox
                  Left = 210
                  Top = 149
                  Width = 90
                  Height = 20
                  Hint = '5'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 32
                  OnClick = cmb_WatchTypeClick
                end
                object cmb_WatchDelay6: TRzComboBox
                  Left = 210
                  Top = 173
                  Width = 90
                  Height = 20
                  Hint = '6'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 33
                  OnClick = cmb_WatchTypeClick
                end
                object cmb_WatchDelay7: TRzComboBox
                  Left = 210
                  Top = 198
                  Width = 90
                  Height = 20
                  Hint = '7'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 34
                  OnClick = cmb_WatchTypeClick
                end
                object cmb_WatchDelay8: TRzComboBox
                  Left = 210
                  Top = 223
                  Width = 90
                  Height = 20
                  Hint = '8'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 35
                  OnClick = cmb_WatchTypeClick
                end
                object panPortAlarmArea0: TRzPanel
                  Left = 398
                  Top = 22
                  Width = 90
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #48169#48276#44396#50669
                  TabOrder = 36
                end
                object cmb_PortAlarmArea1: TRzComboBox
                  Tag = 1
                  Left = 398
                  Top = 51
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 37
                  Text = #49324#50857#50504#54632
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                  ItemIndex = 0
                end
                object cmb_PortAlarmArea2: TRzComboBox
                  Tag = 1
                  Left = 398
                  Top = 75
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 38
                  Text = #49324#50857#50504#54632
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                  ItemIndex = 0
                end
                object cmb_PortAlarmArea3: TRzComboBox
                  Tag = 1
                  Left = 398
                  Top = 100
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 39
                  Text = #49324#50857#50504#54632
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                  ItemIndex = 0
                end
                object cmb_PortAlarmArea4: TRzComboBox
                  Tag = 1
                  Left = 398
                  Top = 124
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 40
                  Text = #49324#50857#50504#54632
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                  ItemIndex = 0
                end
                object cmb_PortAlarmArea5: TRzComboBox
                  Tag = 1
                  Left = 398
                  Top = 149
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 41
                  Text = #49324#50857#50504#54632
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                  ItemIndex = 0
                end
                object cmb_PortAlarmArea6: TRzComboBox
                  Tag = 1
                  Left = 398
                  Top = 173
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 42
                  Text = #49324#50857#50504#54632
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                  ItemIndex = 0
                end
                object cmb_PortAlarmArea7: TRzComboBox
                  Tag = 1
                  Left = 398
                  Top = 198
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 43
                  Text = #49324#50857#50504#54632
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                  ItemIndex = 0
                end
                object cmb_PortAlarmArea8: TRzComboBox
                  Tag = 1
                  Left = 398
                  Top = 223
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 44
                  Text = #49324#50857#50504#54632
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                  ItemIndex = 0
                end
                object panPortZoneUsed0: TRzPanel
                  Left = 494
                  Top = 22
                  Width = 90
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #51316#49324#50857#50976#47924
                  TabOrder = 45
                end
                object cmb_ZonUse1: TRzComboBox
                  Tag = 1
                  Left = 494
                  Top = 51
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 46
                  Text = #49324#50857
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857
                    #49324#50857#50504#54632)
                  ItemIndex = 0
                end
                object cmb_ZonUse2: TRzComboBox
                  Tag = 1
                  Left = 494
                  Top = 75
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 47
                  Text = #49324#50857
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857
                    #49324#50857#50504#54632)
                  ItemIndex = 0
                end
                object cmb_ZonUse3: TRzComboBox
                  Tag = 1
                  Left = 494
                  Top = 100
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 48
                  Text = #49324#50857
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857
                    #49324#50857#50504#54632)
                  ItemIndex = 0
                end
                object cmb_ZonUse4: TRzComboBox
                  Tag = 1
                  Left = 494
                  Top = 124
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 49
                  Text = #49324#50857
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857
                    #49324#50857#50504#54632)
                  ItemIndex = 0
                end
                object cmb_ZonUse5: TRzComboBox
                  Tag = 1
                  Left = 494
                  Top = 149
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 50
                  Text = #49324#50857
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857
                    #49324#50857#50504#54632)
                  ItemIndex = 0
                end
                object cmb_ZonUse6: TRzComboBox
                  Tag = 1
                  Left = 494
                  Top = 173
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 51
                  Text = #49324#50857
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857
                    #49324#50857#50504#54632)
                  ItemIndex = 0
                end
                object cmb_ZonUse7: TRzComboBox
                  Tag = 1
                  Left = 494
                  Top = 198
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 52
                  Text = #49324#50857
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857
                    #49324#50857#50504#54632)
                  ItemIndex = 0
                end
                object cmb_ZonUse8: TRzComboBox
                  Tag = 1
                  Left = 494
                  Top = 223
                  Width = 90
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 53
                  Text = #49324#50857
                  OnClick = cmb_WatchTypeClick
                  Items.Strings = (
                    #49324#50857
                    #49324#50857#50504#54632)
                  ItemIndex = 0
                end
              end
              object gb_emergency: TGroupBox
                Left = 16
                Top = 288
                Width = 300
                Height = 57
                Caption = #48708#49345#51316' '#51060#49345' '#48156#49373' '#49884
                TabOrder = 1
                object Label307: TLabel
                  Left = 13
                  Top = 22
                  Width = 24
                  Height = 12
                  Caption = #47016#54532
                end
                object Label308: TLabel
                  Left = 125
                  Top = 22
                  Width = 36
                  Height = 12
                  Caption = #49324#51060#47116
                end
                object Label310: TLabel
                  Left = 248
                  Top = 22
                  Width = 84
                  Height = 12
                  Caption = 'Siren '#46041#51089#49884#44036
                  Visible = False
                end
                object Label312: TLabel
                  Left = 352
                  Top = 22
                  Width = 12
                  Height = 12
                  Caption = #48516
                  Visible = False
                end
                object cmb_alartLamp: TRzComboBox
                  Left = 54
                  Top = 18
                  Width = 56
                  Height = 20
                  Hint = '8'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 0
                  Text = 'OFF'
                  OnChange = cmb_alartLampChange
                  Items.Strings = (
                    'OFF'
                    'ON')
                  ItemIndex = 0
                end
                object cmb_alartSiren: TRzComboBox
                  Left = 166
                  Top = 18
                  Width = 56
                  Height = 20
                  Hint = '8'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 1
                  Text = 'OFF'
                  OnChange = cmb_alartSirenChange
                  Items.Strings = (
                    'OFF'
                    'ON')
                  ItemIndex = 0
                end
              end
              object gb_action: TGroupBox
                Left = 317
                Top = 288
                Width = 300
                Height = 57
                Caption = #46041#51089#49884#44036
                TabOrder = 2
                object Label311: TLabel
                  Left = 88
                  Top = 22
                  Width = 12
                  Height = 12
                  Caption = #48516
                end
                object Label27: TLabel
                  Left = 208
                  Top = 22
                  Width = 12
                  Height = 12
                  Caption = #48516
                end
                object Label28: TLabel
                  Left = 8
                  Top = 22
                  Width = 24
                  Height = 12
                  Caption = #47016#54532
                end
                object Label29: TLabel
                  Left = 128
                  Top = 22
                  Width = 36
                  Height = 12
                  Caption = #49324#51060#47116
                end
                object ed_alertLampTime: TEdit
                  Left = 56
                  Top = 18
                  Width = 25
                  Height = 20
                  BevelKind = bkFlat
                  Ctl3D = True
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 2
                  ParentCtl3D = False
                  TabOrder = 0
                  Text = '1'
                  OnKeyUp = ed_alertLampTimeKeyUp
                end
                object ed_alertSirenTime: TEdit
                  Left = 176
                  Top = 18
                  Width = 25
                  Height = 20
                  BevelKind = bkFlat
                  Ctl3D = True
                  ImeName = 'Microsoft IME 2003'
                  MaxLength = 2
                  ParentCtl3D = False
                  TabOrder = 1
                  Text = '1'
                  OnKeyUp = ed_alertSirenTimeKeyUp
                end
              end
            end
            object tab_ExtensionPort: TTabSheet
              Caption = #44048#51109#44592#54869#51109
              ImageIndex = 1
              object pg_ExtensionPort: TPageControl
                Left = 0
                Top = 41
                Width = 785
                Height = 381
                ActivePage = tab_ZoneExtension1
                Align = alClient
                TabOrder = 0
                OnChange = pg_DeviceSettingChange
                object tab_ZoneExtension1: TTabSheet
                  Tag = 1
                  Caption = #44048#51109#44592'1'#48264
                  object Label17: TLabel
                    Left = 16
                    Top = 16
                    Width = 84
                    Height = 12
                    Caption = #44048#51109#44592#49324#50857#50976#47924
                  end
                  object gb_Port1: TGroupBox
                    Left = 16
                    Top = 40
                    Width = 601
                    Height = 265
                    Caption = #44048#49884#51316
                    TabOrder = 0
                    object StaticText61: TStaticText
                      Left = 16
                      Top = 53
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '1'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 0
                    end
                    object RzPanel20: TRzPanel
                      Left = 86
                      Top = 22
                      Width = 120
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #44048#49884#54805#53468
                      TabOrder = 1
                    end
                    object cmb_WatchType11: TRzComboBox
                      Tag = 1
                      Left = 86
                      Top = 51
                      Width = 120
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 2
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object RzPanel21: TRzPanel
                      Left = 14
                      Top = 22
                      Width = 67
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#48264#54840
                      TabOrder = 3
                    end
                    object StaticText62: TStaticText
                      Left = 16
                      Top = 77
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '2'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 4
                    end
                    object StaticText65: TStaticText
                      Left = 16
                      Top = 102
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '3'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 5
                    end
                    object StaticText66: TStaticText
                      Left = 16
                      Top = 126
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '4'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 6
                    end
                    object StaticText67: TStaticText
                      Left = 16
                      Top = 151
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '5'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 7
                    end
                    object StaticText68: TStaticText
                      Left = 16
                      Top = 175
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '6'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 8
                    end
                    object RzPanel22: TRzPanel
                      Left = 216
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48373#44396#49888#54840
                      TabOrder = 9
                    end
                    object cmb_recorver11: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 10
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType12: TRzComboBox
                      Tag = 1
                      Left = 86
                      Top = 75
                      Width = 120
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 11
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver12: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 12
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType13: TRzComboBox
                      Tag = 1
                      Left = 86
                      Top = 100
                      Width = 120
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 13
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver13: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 14
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType14: TRzComboBox
                      Tag = 1
                      Left = 86
                      Top = 124
                      Width = 120
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 15
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver14: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 16
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType15: TRzComboBox
                      Tag = 1
                      Left = 86
                      Top = 149
                      Width = 120
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 17
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver15: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 18
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType16: TRzComboBox
                      Tag = 1
                      Left = 86
                      Top = 173
                      Width = 120
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 19
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver16: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 20
                      OnClick = cmb_WatchType11Click
                    end
                    object StaticText75: TStaticText
                      Left = 16
                      Top = 200
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '7'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 21
                    end
                    object cmb_WatchType17: TRzComboBox
                      Tag = 1
                      Left = 86
                      Top = 198
                      Width = 120
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 22
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver17: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 23
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_recorver18: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 24
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType18: TRzComboBox
                      Tag = 1
                      Left = 86
                      Top = 223
                      Width = 120
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 25
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object StaticText78: TStaticText
                      Left = 16
                      Top = 225
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '8'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 26
                    end
                    object panPortAlarmArea1: TRzPanel
                      Left = 318
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48169#48276#44396#50669
                      TabOrder = 27
                    end
                    object cmb_PortAlarmArea11: TRzComboBox
                      Tag = 1
                      Left = 318
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 28
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea12: TRzComboBox
                      Tag = 1
                      Left = 318
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 29
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea13: TRzComboBox
                      Tag = 1
                      Left = 318
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 30
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea14: TRzComboBox
                      Tag = 1
                      Left = 318
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 31
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea15: TRzComboBox
                      Tag = 1
                      Left = 318
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 32
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea16: TRzComboBox
                      Tag = 1
                      Left = 318
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 33
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea17: TRzComboBox
                      Tag = 1
                      Left = 318
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 34
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea18: TRzComboBox
                      Tag = 1
                      Left = 318
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 35
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object panPortZoneUsed1: TRzPanel
                      Left = 414
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#49324#50857#50976#47924
                      TabOrder = 36
                    end
                    object cmb_ZonUse11: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 37
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse12: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 38
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse13: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 39
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse14: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 40
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse15: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 41
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse16: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 42
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse17: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 43
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse18: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 44
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                  end
                  object cmb_ZoneExtensionUse1: TRzComboBox
                    Tag = 1
                    Left = 126
                    Top = 11
                    Width = 90
                    Height = 20
                    Hint = '1'
                    Style = csDropDownList
                    Ctl3D = False
                    Enabled = False
                    FlatButtons = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    ParentCtl3D = False
                    TabOrder = 1
                    Text = #48120#49324#50857
                    OnChange = cmb_ZoneExtensionUse1Change
                    Items.Strings = (
                      #48120#49324#50857
                      #48169#48276'+'#52636#51077#47928#49324#50857
                      #52636#51077#51204#50857)
                    ItemIndex = 0
                  end
                end
                object tab_ZoneExtension2: TTabSheet
                  Tag = 2
                  Caption = #44048#51109#44592'2'#48264
                  ImageIndex = 1
                  object Label18: TLabel
                    Left = 16
                    Top = 16
                    Width = 84
                    Height = 12
                    Caption = #44048#51109#44592#49324#50857#50976#47924
                  end
                  object gb_Port2: TGroupBox
                    Left = 16
                    Top = 40
                    Width = 601
                    Height = 265
                    Caption = #44048#49884#51316
                    TabOrder = 0
                    object StaticText69: TStaticText
                      Left = 16
                      Top = 53
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '1'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 0
                    end
                    object RzPanel23: TRzPanel
                      Left = 86
                      Top = 22
                      Width = 120
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #44048#49884#54805#53468
                      TabOrder = 1
                    end
                    object cmb_WatchType21: TRzComboBox
                      Tag = 2
                      Left = 86
                      Top = 51
                      Width = 120
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 2
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object RzPanel24: TRzPanel
                      Left = 14
                      Top = 22
                      Width = 67
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#48264#54840
                      TabOrder = 3
                    end
                    object StaticText70: TStaticText
                      Left = 16
                      Top = 77
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '2'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 4
                    end
                    object StaticText71: TStaticText
                      Left = 16
                      Top = 102
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '3'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 5
                    end
                    object StaticText72: TStaticText
                      Left = 16
                      Top = 126
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '4'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 6
                    end
                    object StaticText73: TStaticText
                      Left = 16
                      Top = 151
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '5'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 7
                    end
                    object StaticText74: TStaticText
                      Left = 16
                      Top = 175
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '6'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 8
                    end
                    object RzPanel26: TRzPanel
                      Left = 216
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48373#44396#49888#54840
                      TabOrder = 9
                    end
                    object cmb_recorver21: TRzComboBox
                      Tag = 2
                      Left = 216
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 10
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType22: TRzComboBox
                      Tag = 2
                      Left = 86
                      Top = 75
                      Width = 120
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 11
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver22: TRzComboBox
                      Tag = 2
                      Left = 216
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 12
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType23: TRzComboBox
                      Tag = 2
                      Left = 86
                      Top = 100
                      Width = 120
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 13
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver23: TRzComboBox
                      Tag = 2
                      Left = 216
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 14
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType24: TRzComboBox
                      Tag = 2
                      Left = 86
                      Top = 124
                      Width = 120
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 15
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver24: TRzComboBox
                      Tag = 2
                      Left = 216
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 16
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType25: TRzComboBox
                      Tag = 2
                      Left = 86
                      Top = 149
                      Width = 120
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 17
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver25: TRzComboBox
                      Tag = 2
                      Left = 216
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 18
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType26: TRzComboBox
                      Tag = 2
                      Left = 86
                      Top = 173
                      Width = 120
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 19
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver26: TRzComboBox
                      Tag = 2
                      Left = 216
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 20
                      OnClick = cmb_WatchType11Click
                    end
                    object StaticText76: TStaticText
                      Left = 16
                      Top = 200
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '7'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 21
                    end
                    object cmb_WatchType27: TRzComboBox
                      Tag = 2
                      Left = 86
                      Top = 198
                      Width = 120
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 22
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver27: TRzComboBox
                      Tag = 2
                      Left = 216
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 23
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_recorver28: TRzComboBox
                      Tag = 2
                      Left = 216
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 24
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType28: TRzComboBox
                      Tag = 2
                      Left = 86
                      Top = 223
                      Width = 120
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 25
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object StaticText77: TStaticText
                      Left = 16
                      Top = 225
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '8'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 26
                    end
                    object panPortAlarmArea2: TRzPanel
                      Left = 318
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48169#48276#44396#50669
                      TabOrder = 27
                    end
                    object cmb_PortAlarmArea21: TRzComboBox
                      Tag = 2
                      Left = 318
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 28
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea22: TRzComboBox
                      Tag = 2
                      Left = 318
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 29
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea23: TRzComboBox
                      Tag = 2
                      Left = 318
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 30
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea24: TRzComboBox
                      Tag = 2
                      Left = 318
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 31
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea25: TRzComboBox
                      Tag = 2
                      Left = 318
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 32
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea26: TRzComboBox
                      Tag = 2
                      Left = 318
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 33
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea27: TRzComboBox
                      Tag = 2
                      Left = 318
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 34
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea28: TRzComboBox
                      Tag = 2
                      Left = 318
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 35
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object panPortZoneUsed2: TRzPanel
                      Left = 414
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#49324#50857#50976#47924
                      TabOrder = 36
                    end
                    object cmb_ZonUse21: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 37
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse22: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 38
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse23: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 39
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse24: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 40
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse25: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 41
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse26: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 42
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse27: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 43
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse28: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 44
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                  end
                  object cmb_ZoneExtensionUse2: TRzComboBox
                    Tag = 2
                    Left = 126
                    Top = 11
                    Width = 90
                    Height = 20
                    Hint = '1'
                    Style = csDropDownList
                    Ctl3D = False
                    Enabled = False
                    FlatButtons = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    ParentCtl3D = False
                    TabOrder = 1
                    Text = #48120#49324#50857
                    OnChange = cmb_ZoneExtensionUse1Change
                    Items.Strings = (
                      #48120#49324#50857
                      #48169#48276'+'#52636#51077#47928#49324#50857
                      #52636#51077#51204#50857)
                    ItemIndex = 0
                  end
                end
                object tab_ZoneExtension3: TTabSheet
                  Tag = 3
                  Caption = #44048#51109#44592'3'#48264
                  ImageIndex = 2
                  object Label20: TLabel
                    Left = 16
                    Top = 16
                    Width = 84
                    Height = 12
                    Caption = #44048#51109#44592#49324#50857#50976#47924
                  end
                  object gb_Port3: TGroupBox
                    Left = 16
                    Top = 40
                    Width = 601
                    Height = 265
                    Caption = #44048#49884#51316
                    TabOrder = 0
                    object StaticText79: TStaticText
                      Left = 16
                      Top = 53
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '1'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 0
                    end
                    object RzPanel28: TRzPanel
                      Left = 86
                      Top = 22
                      Width = 120
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #44048#49884#54805#53468
                      TabOrder = 1
                    end
                    object cmb_WatchType31: TRzComboBox
                      Tag = 3
                      Left = 86
                      Top = 51
                      Width = 120
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 2
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object RzPanel29: TRzPanel
                      Left = 14
                      Top = 22
                      Width = 67
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#48264#54840
                      TabOrder = 3
                    end
                    object StaticText80: TStaticText
                      Left = 16
                      Top = 77
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '2'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 4
                    end
                    object StaticText81: TStaticText
                      Left = 16
                      Top = 102
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '3'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 5
                    end
                    object StaticText82: TStaticText
                      Left = 16
                      Top = 126
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '4'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 6
                    end
                    object StaticText83: TStaticText
                      Left = 16
                      Top = 151
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '5'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 7
                    end
                    object StaticText84: TStaticText
                      Left = 16
                      Top = 175
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '6'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 8
                    end
                    object RzPanel30: TRzPanel
                      Left = 216
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48373#44396#49888#54840
                      TabOrder = 9
                    end
                    object cmb_recorver31: TRzComboBox
                      Tag = 3
                      Left = 216
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 10
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType32: TRzComboBox
                      Tag = 3
                      Left = 86
                      Top = 75
                      Width = 120
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 11
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver32: TRzComboBox
                      Tag = 3
                      Left = 216
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 12
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType33: TRzComboBox
                      Tag = 3
                      Left = 86
                      Top = 100
                      Width = 120
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 13
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver33: TRzComboBox
                      Tag = 3
                      Left = 216
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 14
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType34: TRzComboBox
                      Tag = 3
                      Left = 86
                      Top = 124
                      Width = 120
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 15
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver34: TRzComboBox
                      Tag = 3
                      Left = 216
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 16
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType35: TRzComboBox
                      Tag = 3
                      Left = 86
                      Top = 149
                      Width = 120
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 17
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver35: TRzComboBox
                      Tag = 3
                      Left = 216
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 18
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType36: TRzComboBox
                      Tag = 3
                      Left = 86
                      Top = 173
                      Width = 120
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 19
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver36: TRzComboBox
                      Tag = 3
                      Left = 216
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 20
                      OnClick = cmb_WatchType11Click
                    end
                    object StaticText85: TStaticText
                      Left = 16
                      Top = 200
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '7'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 21
                    end
                    object cmb_WatchType37: TRzComboBox
                      Tag = 3
                      Left = 86
                      Top = 198
                      Width = 120
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 22
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver37: TRzComboBox
                      Tag = 3
                      Left = 216
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 23
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_recorver38: TRzComboBox
                      Tag = 3
                      Left = 216
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 24
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType38: TRzComboBox
                      Tag = 3
                      Left = 86
                      Top = 223
                      Width = 120
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 25
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object StaticText86: TStaticText
                      Left = 16
                      Top = 225
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '8'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 26
                    end
                    object panPortAlarmArea3: TRzPanel
                      Left = 318
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48169#48276#44396#50669
                      TabOrder = 27
                    end
                    object cmb_PortAlarmArea31: TRzComboBox
                      Tag = 3
                      Left = 318
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 28
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea32: TRzComboBox
                      Tag = 3
                      Left = 318
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 29
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea33: TRzComboBox
                      Tag = 3
                      Left = 318
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 30
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea34: TRzComboBox
                      Tag = 3
                      Left = 318
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 31
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea35: TRzComboBox
                      Tag = 3
                      Left = 318
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 32
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea36: TRzComboBox
                      Tag = 3
                      Left = 318
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 33
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea37: TRzComboBox
                      Tag = 3
                      Left = 318
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 34
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea38: TRzComboBox
                      Tag = 3
                      Left = 318
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 35
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object panPortZoneUsed3: TRzPanel
                      Left = 414
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#49324#50857#50976#47924
                      TabOrder = 36
                    end
                    object cmb_ZonUse31: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 37
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse32: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 38
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse33: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 39
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse34: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 40
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse35: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 41
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse36: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 42
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse37: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 43
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse38: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 44
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                  end
                  object cmb_ZoneExtensionUse3: TRzComboBox
                    Tag = 3
                    Left = 126
                    Top = 11
                    Width = 90
                    Height = 20
                    Hint = '1'
                    Style = csDropDownList
                    Ctl3D = False
                    Enabled = False
                    FlatButtons = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    ParentCtl3D = False
                    TabOrder = 1
                    Text = #48120#49324#50857
                    OnChange = cmb_ZoneExtensionUse1Change
                    Items.Strings = (
                      #48120#49324#50857
                      #48169#48276'+'#52636#51077#47928#49324#50857
                      #52636#51077#51204#50857)
                    ItemIndex = 0
                  end
                end
                object tab_ZoneExtension4: TTabSheet
                  Tag = 4
                  Caption = #44048#51109#44592'4'#48264
                  ImageIndex = 3
                  object Label22: TLabel
                    Left = 16
                    Top = 16
                    Width = 84
                    Height = 12
                    Caption = #44048#51109#44592#49324#50857#50976#47924
                  end
                  object gb_Port4: TGroupBox
                    Left = 16
                    Top = 40
                    Width = 601
                    Height = 265
                    Caption = #44048#49884#51316
                    TabOrder = 0
                    object StaticText87: TStaticText
                      Left = 16
                      Top = 53
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '1'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 0
                    end
                    object RzPanel32: TRzPanel
                      Left = 86
                      Top = 22
                      Width = 120
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #44048#49884#54805#53468
                      TabOrder = 1
                    end
                    object cmb_WatchType41: TRzComboBox
                      Tag = 4
                      Left = 86
                      Top = 51
                      Width = 120
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 2
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object RzPanel33: TRzPanel
                      Left = 14
                      Top = 22
                      Width = 67
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#48264#54840
                      TabOrder = 3
                    end
                    object StaticText88: TStaticText
                      Left = 16
                      Top = 77
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '2'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 4
                    end
                    object StaticText89: TStaticText
                      Left = 16
                      Top = 102
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '3'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 5
                    end
                    object StaticText90: TStaticText
                      Left = 16
                      Top = 126
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '4'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 6
                    end
                    object StaticText91: TStaticText
                      Left = 16
                      Top = 151
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '5'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 7
                    end
                    object StaticText92: TStaticText
                      Left = 16
                      Top = 175
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '6'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 8
                    end
                    object RzPanel34: TRzPanel
                      Left = 216
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48373#44396#49888#54840
                      TabOrder = 9
                    end
                    object cmb_recorver41: TRzComboBox
                      Tag = 4
                      Left = 216
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 10
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType42: TRzComboBox
                      Tag = 4
                      Left = 86
                      Top = 75
                      Width = 120
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 11
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver42: TRzComboBox
                      Tag = 4
                      Left = 216
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 12
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType43: TRzComboBox
                      Tag = 4
                      Left = 86
                      Top = 100
                      Width = 120
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 13
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver43: TRzComboBox
                      Tag = 4
                      Left = 216
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 14
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType44: TRzComboBox
                      Tag = 4
                      Left = 86
                      Top = 124
                      Width = 120
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 15
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver44: TRzComboBox
                      Tag = 4
                      Left = 216
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 16
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType45: TRzComboBox
                      Tag = 4
                      Left = 86
                      Top = 149
                      Width = 120
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 17
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver45: TRzComboBox
                      Tag = 4
                      Left = 216
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 18
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType46: TRzComboBox
                      Tag = 4
                      Left = 86
                      Top = 173
                      Width = 120
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 19
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver46: TRzComboBox
                      Tag = 4
                      Left = 216
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 20
                      OnClick = cmb_WatchType11Click
                    end
                    object StaticText93: TStaticText
                      Left = 16
                      Top = 200
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '7'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 21
                    end
                    object cmb_WatchType47: TRzComboBox
                      Tag = 4
                      Left = 86
                      Top = 198
                      Width = 120
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 22
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver47: TRzComboBox
                      Tag = 4
                      Left = 216
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 23
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_recorver48: TRzComboBox
                      Tag = 4
                      Left = 216
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 24
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType48: TRzComboBox
                      Tag = 4
                      Left = 86
                      Top = 223
                      Width = 120
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 25
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object StaticText94: TStaticText
                      Left = 16
                      Top = 225
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '8'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 26
                    end
                    object panPortAlarmArea4: TRzPanel
                      Left = 318
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48169#48276#44396#50669
                      TabOrder = 27
                    end
                    object cmb_PortAlarmArea41: TRzComboBox
                      Tag = 4
                      Left = 318
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 28
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea42: TRzComboBox
                      Tag = 4
                      Left = 318
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 29
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea43: TRzComboBox
                      Tag = 4
                      Left = 318
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 30
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea44: TRzComboBox
                      Tag = 4
                      Left = 318
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 31
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea45: TRzComboBox
                      Tag = 4
                      Left = 318
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 32
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea46: TRzComboBox
                      Tag = 4
                      Left = 318
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 33
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea47: TRzComboBox
                      Tag = 4
                      Left = 318
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 34
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea48: TRzComboBox
                      Tag = 4
                      Left = 318
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 35
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object panPortZoneUsed4: TRzPanel
                      Left = 414
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#49324#50857#50976#47924
                      TabOrder = 36
                    end
                    object cmb_ZonUse41: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 37
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse42: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 38
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse43: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 39
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse44: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 40
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse45: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 41
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse46: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 42
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse47: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 43
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse48: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 44
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                  end
                  object cmb_ZoneExtensionUse4: TRzComboBox
                    Tag = 4
                    Left = 126
                    Top = 11
                    Width = 90
                    Height = 20
                    Hint = '1'
                    Style = csDropDownList
                    Ctl3D = False
                    Enabled = False
                    FlatButtons = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    ParentCtl3D = False
                    TabOrder = 1
                    Text = #48120#49324#50857
                    OnChange = cmb_ZoneExtensionUse1Change
                    Items.Strings = (
                      #48120#49324#50857
                      #48169#48276'+'#52636#51077#47928#49324#50857
                      #52636#51077#51204#50857)
                    ItemIndex = 0
                  end
                end
                object tab_ZoneExtension5: TTabSheet
                  Tag = 5
                  Caption = #44048#51109#44592'5'#48264
                  ImageIndex = 4
                  object Label23: TLabel
                    Left = 16
                    Top = 16
                    Width = 84
                    Height = 12
                    Caption = #44048#51109#44592#49324#50857#50976#47924
                  end
                  object gb_Port5: TGroupBox
                    Left = 16
                    Top = 40
                    Width = 601
                    Height = 265
                    Caption = #44048#49884#51316
                    TabOrder = 0
                    object StaticText95: TStaticText
                      Left = 16
                      Top = 53
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '1'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 0
                    end
                    object RzPanel36: TRzPanel
                      Left = 86
                      Top = 22
                      Width = 120
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #44048#49884#54805#53468
                      TabOrder = 1
                    end
                    object cmb_WatchType51: TRzComboBox
                      Tag = 5
                      Left = 86
                      Top = 51
                      Width = 120
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 2
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object RzPanel37: TRzPanel
                      Left = 14
                      Top = 22
                      Width = 67
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#48264#54840
                      TabOrder = 3
                    end
                    object StaticText96: TStaticText
                      Left = 16
                      Top = 77
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '2'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 4
                    end
                    object StaticText97: TStaticText
                      Left = 16
                      Top = 102
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '3'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 5
                    end
                    object StaticText98: TStaticText
                      Left = 16
                      Top = 126
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '4'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 6
                    end
                    object StaticText99: TStaticText
                      Left = 16
                      Top = 151
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '5'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 7
                    end
                    object StaticText100: TStaticText
                      Left = 16
                      Top = 175
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '6'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 8
                    end
                    object RzPanel38: TRzPanel
                      Left = 216
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48373#44396#49888#54840
                      TabOrder = 9
                    end
                    object cmb_recorver51: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 10
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType52: TRzComboBox
                      Tag = 5
                      Left = 86
                      Top = 75
                      Width = 120
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 11
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver52: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 12
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType53: TRzComboBox
                      Tag = 5
                      Left = 86
                      Top = 100
                      Width = 120
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 13
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver53: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 14
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType54: TRzComboBox
                      Tag = 5
                      Left = 86
                      Top = 124
                      Width = 120
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 15
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver54: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 16
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType55: TRzComboBox
                      Tag = 5
                      Left = 86
                      Top = 149
                      Width = 120
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 17
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver55: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 18
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType56: TRzComboBox
                      Tag = 5
                      Left = 86
                      Top = 173
                      Width = 120
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 19
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver56: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 20
                      OnClick = cmb_WatchType11Click
                    end
                    object StaticText101: TStaticText
                      Left = 16
                      Top = 200
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '7'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 21
                    end
                    object cmb_WatchType57: TRzComboBox
                      Tag = 5
                      Left = 86
                      Top = 198
                      Width = 120
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 22
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver57: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 23
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_recorver58: TRzComboBox
                      Tag = 1
                      Left = 216
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 24
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType58: TRzComboBox
                      Tag = 5
                      Left = 86
                      Top = 223
                      Width = 120
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 25
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object StaticText102: TStaticText
                      Left = 16
                      Top = 225
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '8'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 26
                    end
                    object panPortAlarmArea5: TRzPanel
                      Left = 318
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48169#48276#44396#50669
                      TabOrder = 27
                    end
                    object cmb_PortAlarmArea51: TRzComboBox
                      Tag = 5
                      Left = 318
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 28
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea52: TRzComboBox
                      Tag = 5
                      Left = 318
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 29
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea53: TRzComboBox
                      Tag = 5
                      Left = 318
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 30
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea54: TRzComboBox
                      Tag = 5
                      Left = 318
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 31
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea55: TRzComboBox
                      Tag = 5
                      Left = 318
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 32
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea56: TRzComboBox
                      Tag = 5
                      Left = 318
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 33
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea57: TRzComboBox
                      Tag = 5
                      Left = 318
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 34
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea58: TRzComboBox
                      Tag = 5
                      Left = 318
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 35
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object panPortZoneUsed5: TRzPanel
                      Left = 414
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#49324#50857#50976#47924
                      TabOrder = 36
                    end
                    object cmb_ZonUse51: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 37
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse52: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 38
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse53: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 39
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse54: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 40
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse55: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 41
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse56: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 42
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse57: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 43
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse58: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 44
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                  end
                  object cmb_ZoneExtensionUse5: TRzComboBox
                    Tag = 5
                    Left = 126
                    Top = 11
                    Width = 90
                    Height = 20
                    Hint = '1'
                    Style = csDropDownList
                    Ctl3D = False
                    Enabled = False
                    FlatButtons = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    ParentCtl3D = False
                    TabOrder = 1
                    Text = #48120#49324#50857
                    OnChange = cmb_ZoneExtensionUse1Change
                    Items.Strings = (
                      #48120#49324#50857
                      #48169#48276'+'#52636#51077#47928#49324#50857
                      #52636#51077#51204#50857)
                    ItemIndex = 0
                  end
                end
                object tab_ZoneExtension6: TTabSheet
                  Tag = 6
                  Caption = #44048#51109#44592'6'#48264
                  ImageIndex = 5
                  object Label24: TLabel
                    Left = 16
                    Top = 16
                    Width = 84
                    Height = 12
                    Caption = #44048#51109#44592#49324#50857#50976#47924
                  end
                  object gb_Port6: TGroupBox
                    Left = 16
                    Top = 40
                    Width = 601
                    Height = 265
                    Caption = #44048#49884#51316
                    TabOrder = 0
                    object StaticText103: TStaticText
                      Left = 16
                      Top = 53
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '1'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 0
                    end
                    object RzPanel40: TRzPanel
                      Left = 86
                      Top = 22
                      Width = 120
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #44048#49884#54805#53468
                      TabOrder = 1
                    end
                    object cmb_WatchType61: TRzComboBox
                      Tag = 6
                      Left = 86
                      Top = 51
                      Width = 120
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 2
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object RzPanel41: TRzPanel
                      Left = 14
                      Top = 22
                      Width = 67
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#48264#54840
                      TabOrder = 3
                    end
                    object StaticText104: TStaticText
                      Left = 16
                      Top = 77
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '2'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 4
                    end
                    object StaticText105: TStaticText
                      Left = 16
                      Top = 102
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '3'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 5
                    end
                    object StaticText106: TStaticText
                      Left = 16
                      Top = 126
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '4'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 6
                    end
                    object StaticText107: TStaticText
                      Left = 16
                      Top = 151
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '5'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 7
                    end
                    object StaticText108: TStaticText
                      Left = 16
                      Top = 175
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '6'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 8
                    end
                    object RzPanel42: TRzPanel
                      Left = 216
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48373#44396#49888#54840
                      TabOrder = 9
                    end
                    object cmb_recorver61: TRzComboBox
                      Tag = 6
                      Left = 216
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 10
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType62: TRzComboBox
                      Tag = 6
                      Left = 86
                      Top = 75
                      Width = 120
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 11
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver62: TRzComboBox
                      Tag = 6
                      Left = 216
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 12
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType63: TRzComboBox
                      Tag = 6
                      Left = 86
                      Top = 100
                      Width = 120
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 13
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver63: TRzComboBox
                      Tag = 6
                      Left = 216
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 14
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType64: TRzComboBox
                      Tag = 6
                      Left = 86
                      Top = 124
                      Width = 120
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 15
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver64: TRzComboBox
                      Tag = 6
                      Left = 216
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 16
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType65: TRzComboBox
                      Tag = 6
                      Left = 86
                      Top = 149
                      Width = 120
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 17
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver65: TRzComboBox
                      Tag = 6
                      Left = 216
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 18
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType66: TRzComboBox
                      Tag = 6
                      Left = 86
                      Top = 173
                      Width = 120
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 19
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver66: TRzComboBox
                      Tag = 6
                      Left = 216
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 20
                      OnClick = cmb_WatchType11Click
                    end
                    object StaticText109: TStaticText
                      Left = 16
                      Top = 200
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '7'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 21
                    end
                    object cmb_WatchType67: TRzComboBox
                      Tag = 6
                      Left = 86
                      Top = 198
                      Width = 120
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 22
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver67: TRzComboBox
                      Tag = 6
                      Left = 216
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 23
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_recorver68: TRzComboBox
                      Tag = 6
                      Left = 216
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 24
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType68: TRzComboBox
                      Tag = 6
                      Left = 86
                      Top = 223
                      Width = 120
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 25
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object StaticText110: TStaticText
                      Left = 16
                      Top = 225
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '8'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 26
                    end
                    object panPortAlarmArea6: TRzPanel
                      Left = 318
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48169#48276#44396#50669
                      TabOrder = 27
                    end
                    object cmb_PortAlarmArea61: TRzComboBox
                      Tag = 6
                      Left = 318
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 28
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea62: TRzComboBox
                      Tag = 6
                      Left = 318
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 29
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea63: TRzComboBox
                      Tag = 6
                      Left = 318
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 30
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea64: TRzComboBox
                      Tag = 6
                      Left = 318
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 31
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea65: TRzComboBox
                      Tag = 6
                      Left = 318
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 32
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea66: TRzComboBox
                      Tag = 6
                      Left = 318
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 33
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea67: TRzComboBox
                      Tag = 6
                      Left = 318
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 34
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea68: TRzComboBox
                      Tag = 6
                      Left = 318
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 35
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object panPortZoneUsed6: TRzPanel
                      Left = 414
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#49324#50857#50976#47924
                      TabOrder = 36
                    end
                    object cmb_ZonUse61: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 37
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse62: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 38
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse63: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 39
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse64: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 40
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse65: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 41
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse66: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 42
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse67: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 43
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse68: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 44
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                  end
                  object cmb_ZoneExtensionUse6: TRzComboBox
                    Tag = 6
                    Left = 126
                    Top = 11
                    Width = 90
                    Height = 20
                    Hint = '1'
                    Style = csDropDownList
                    Ctl3D = False
                    Enabled = False
                    FlatButtons = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    ParentCtl3D = False
                    TabOrder = 1
                    Text = #48120#49324#50857
                    OnChange = cmb_ZoneExtensionUse1Change
                    Items.Strings = (
                      #48120#49324#50857
                      #48169#48276'+'#52636#51077#47928#49324#50857
                      #52636#51077#51204#50857)
                    ItemIndex = 0
                  end
                end
                object tab_ZoneExtension7: TTabSheet
                  Tag = 7
                  Caption = #44048#51109#44592'7'#48264
                  ImageIndex = 6
                  object Label26: TLabel
                    Left = 16
                    Top = 16
                    Width = 84
                    Height = 12
                    Caption = #44048#51109#44592#49324#50857#50976#47924
                  end
                  object gb_Port7: TGroupBox
                    Left = 16
                    Top = 40
                    Width = 601
                    Height = 265
                    Caption = #44048#49884#51316
                    TabOrder = 0
                    object StaticText111: TStaticText
                      Left = 16
                      Top = 53
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '1'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 0
                    end
                    object RzPanel44: TRzPanel
                      Left = 86
                      Top = 22
                      Width = 120
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #44048#49884#54805#53468
                      TabOrder = 1
                    end
                    object cmb_WatchType71: TRzComboBox
                      Tag = 7
                      Left = 86
                      Top = 51
                      Width = 120
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 2
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object RzPanel45: TRzPanel
                      Left = 14
                      Top = 22
                      Width = 67
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#48264#54840
                      TabOrder = 3
                    end
                    object StaticText112: TStaticText
                      Left = 16
                      Top = 77
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '2'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 4
                    end
                    object StaticText113: TStaticText
                      Left = 16
                      Top = 102
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '3'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 5
                    end
                    object StaticText114: TStaticText
                      Left = 16
                      Top = 126
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '4'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 6
                    end
                    object StaticText115: TStaticText
                      Left = 16
                      Top = 151
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '5'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 7
                    end
                    object StaticText116: TStaticText
                      Left = 16
                      Top = 175
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '6'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 8
                    end
                    object RzPanel46: TRzPanel
                      Left = 216
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48373#44396#49888#54840
                      TabOrder = 9
                    end
                    object cmb_recorver71: TRzComboBox
                      Tag = 7
                      Left = 216
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 10
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType72: TRzComboBox
                      Tag = 7
                      Left = 86
                      Top = 75
                      Width = 120
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 11
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver72: TRzComboBox
                      Tag = 7
                      Left = 216
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 12
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType73: TRzComboBox
                      Tag = 7
                      Left = 86
                      Top = 100
                      Width = 120
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 13
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver73: TRzComboBox
                      Tag = 7
                      Left = 216
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 14
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType74: TRzComboBox
                      Tag = 7
                      Left = 86
                      Top = 124
                      Width = 120
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 15
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver74: TRzComboBox
                      Tag = 7
                      Left = 216
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 16
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType75: TRzComboBox
                      Tag = 7
                      Left = 86
                      Top = 149
                      Width = 120
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 17
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver75: TRzComboBox
                      Tag = 7
                      Left = 216
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 18
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType76: TRzComboBox
                      Tag = 7
                      Left = 86
                      Top = 173
                      Width = 120
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 19
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver76: TRzComboBox
                      Tag = 7
                      Left = 216
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 20
                      OnClick = cmb_WatchType11Click
                    end
                    object StaticText117: TStaticText
                      Left = 16
                      Top = 200
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '7'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 21
                    end
                    object cmb_WatchType77: TRzComboBox
                      Tag = 7
                      Left = 86
                      Top = 198
                      Width = 120
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 22
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver77: TRzComboBox
                      Tag = 7
                      Left = 216
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 23
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_recorver78: TRzComboBox
                      Tag = 7
                      Left = 216
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 24
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType78: TRzComboBox
                      Tag = 7
                      Left = 86
                      Top = 223
                      Width = 120
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 25
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object StaticText118: TStaticText
                      Left = 16
                      Top = 225
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '8'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 26
                    end
                    object panPortAlarmArea7: TRzPanel
                      Left = 318
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48169#48276#44396#50669
                      TabOrder = 27
                    end
                    object cmb_PortAlarmArea71: TRzComboBox
                      Tag = 7
                      Left = 318
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 28
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea72: TRzComboBox
                      Tag = 7
                      Left = 318
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 29
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea73: TRzComboBox
                      Tag = 7
                      Left = 318
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 30
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea74: TRzComboBox
                      Tag = 7
                      Left = 318
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 31
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea75: TRzComboBox
                      Tag = 7
                      Left = 318
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 32
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea76: TRzComboBox
                      Tag = 7
                      Left = 318
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 33
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea77: TRzComboBox
                      Tag = 7
                      Left = 318
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 34
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea78: TRzComboBox
                      Tag = 7
                      Left = 318
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 35
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object panPortZoneUsed7: TRzPanel
                      Left = 414
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#49324#50857#50976#47924
                      TabOrder = 36
                    end
                    object cmb_ZonUse71: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 37
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse72: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 38
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse73: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 39
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse74: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 40
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse75: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 41
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse76: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 42
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse77: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 43
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse78: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 44
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                  end
                  object cmb_ZoneExtensionUse7: TRzComboBox
                    Tag = 7
                    Left = 126
                    Top = 11
                    Width = 90
                    Height = 20
                    Hint = '1'
                    Style = csDropDownList
                    Ctl3D = False
                    Enabled = False
                    FlatButtons = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    ParentCtl3D = False
                    TabOrder = 1
                    Text = #48120#49324#50857
                    OnChange = cmb_ZoneExtensionUse1Change
                    Items.Strings = (
                      #48120#49324#50857
                      #48169#48276'+'#52636#51077#47928#49324#50857
                      #52636#51077#51204#50857)
                    ItemIndex = 0
                  end
                end
                object tab_ZoneExtension8: TTabSheet
                  Tag = 8
                  Caption = #44048#51109#44592'8'#48264
                  ImageIndex = 7
                  object Label30: TLabel
                    Left = 16
                    Top = 16
                    Width = 84
                    Height = 12
                    Caption = #44048#51109#44592#49324#50857#50976#47924
                  end
                  object gb_Port8: TGroupBox
                    Left = 16
                    Top = 40
                    Width = 601
                    Height = 265
                    Caption = #44048#49884#51316
                    TabOrder = 0
                    object StaticText119: TStaticText
                      Left = 16
                      Top = 53
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '1'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 0
                    end
                    object RzPanel48: TRzPanel
                      Left = 86
                      Top = 22
                      Width = 120
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #44048#49884#54805#53468
                      TabOrder = 1
                    end
                    object cmb_WatchType81: TRzComboBox
                      Tag = 8
                      Left = 86
                      Top = 51
                      Width = 120
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 2
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object RzPanel49: TRzPanel
                      Left = 14
                      Top = 22
                      Width = 67
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#48264#54840
                      TabOrder = 3
                    end
                    object StaticText120: TStaticText
                      Left = 16
                      Top = 77
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '2'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 4
                    end
                    object StaticText121: TStaticText
                      Left = 16
                      Top = 102
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '3'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 5
                    end
                    object StaticText122: TStaticText
                      Left = 16
                      Top = 126
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '4'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 6
                    end
                    object StaticText123: TStaticText
                      Left = 16
                      Top = 151
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '5'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 7
                    end
                    object StaticText124: TStaticText
                      Left = 16
                      Top = 175
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '6'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 8
                    end
                    object RzPanel50: TRzPanel
                      Left = 216
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48373#44396#49888#54840
                      TabOrder = 9
                    end
                    object cmb_recorver81: TRzComboBox
                      Tag = 8
                      Left = 216
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 10
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType82: TRzComboBox
                      Tag = 8
                      Left = 86
                      Top = 75
                      Width = 120
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 11
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver82: TRzComboBox
                      Tag = 8
                      Left = 216
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '2'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 12
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType83: TRzComboBox
                      Tag = 8
                      Left = 86
                      Top = 100
                      Width = 120
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 13
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver83: TRzComboBox
                      Tag = 8
                      Left = 216
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '3'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 14
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType84: TRzComboBox
                      Tag = 8
                      Left = 86
                      Top = 124
                      Width = 120
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 15
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver84: TRzComboBox
                      Tag = 8
                      Left = 216
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '4'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 16
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType85: TRzComboBox
                      Tag = 8
                      Left = 86
                      Top = 149
                      Width = 120
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 17
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver85: TRzComboBox
                      Tag = 8
                      Left = 216
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '5'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 18
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType86: TRzComboBox
                      Tag = 8
                      Left = 86
                      Top = 173
                      Width = 120
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 19
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver86: TRzComboBox
                      Tag = 8
                      Left = 216
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '6'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 20
                      OnClick = cmb_WatchType11Click
                    end
                    object StaticText125: TStaticText
                      Left = 16
                      Top = 200
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '7'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 21
                    end
                    object cmb_WatchType87: TRzComboBox
                      Tag = 8
                      Left = 86
                      Top = 198
                      Width = 120
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 22
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object cmb_recorver87: TRzComboBox
                      Tag = 8
                      Left = 216
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '7'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 23
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_recorver88: TRzComboBox
                      Tag = 8
                      Left = 216
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 24
                      OnClick = cmb_WatchType11Click
                    end
                    object cmb_WatchType88: TRzComboBox
                      Tag = 8
                      Left = 86
                      Top = 223
                      Width = 120
                      Height = 20
                      Hint = '8'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 25
                      OnClick = cmb_WatchType11Click
                      OnEnter = cmb_WatchType11Enter
                    end
                    object StaticText126: TStaticText
                      Left = 16
                      Top = 225
                      Width = 65
                      Height = 17
                      Alignment = taCenter
                      AutoSize = False
                      BevelKind = bkFlat
                      BorderStyle = sbsSunken
                      Caption = '8'
                      Color = 16776176
                      ParentColor = False
                      TabOrder = 26
                    end
                    object panPortAlarmArea8: TRzPanel
                      Left = 318
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #48169#48276#44396#50669
                      TabOrder = 27
                    end
                    object cmb_PortAlarmArea81: TRzComboBox
                      Tag = 8
                      Left = 318
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 28
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea82: TRzComboBox
                      Tag = 8
                      Left = 318
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 29
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea83: TRzComboBox
                      Tag = 8
                      Left = 318
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 30
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea84: TRzComboBox
                      Tag = 8
                      Left = 318
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 31
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea85: TRzComboBox
                      Tag = 8
                      Left = 318
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 32
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea86: TRzComboBox
                      Tag = 8
                      Left = 318
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 33
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea87: TRzComboBox
                      Tag = 8
                      Left = 318
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 34
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object cmb_PortAlarmArea88: TRzComboBox
                      Tag = 8
                      Left = 318
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 35
                      Text = #49324#50857#50504#54632
                      OnClick = cmb_WatchType11Click
                      Items.Strings = (
                        #49324#50857#50504#54632
                        #44396#50669'1'
                        #44396#50669'2'
                        #44396#50669'3'
                        #44396#50669'4'
                        #44396#50669'5'
                        #44396#50669'6'
                        #44396#50669'7'
                        #44396#50669'8')
                      ItemIndex = 0
                    end
                    object panPortZoneUsed8: TRzPanel
                      Left = 414
                      Top = 22
                      Width = 90
                      Height = 25
                      BorderOuter = fsButtonDown
                      Caption = #51316#49324#50857#50976#47924
                      TabOrder = 36
                    end
                    object cmb_ZonUse81: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 51
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 37
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse82: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 75
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 38
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse83: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 100
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 39
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse84: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 124
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 40
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse85: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 149
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 41
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse86: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 173
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 42
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse87: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 198
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 43
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                    object cmb_ZonUse88: TRzComboBox
                      Tag = 1
                      Left = 414
                      Top = 223
                      Width = 90
                      Height = 20
                      Hint = '1'
                      Style = csDropDownList
                      Ctl3D = False
                      FlatButtons = True
                      FrameVisible = True
                      ImeName = 'Microsoft IME 2003'
                      ItemHeight = 12
                      ParentCtl3D = False
                      TabOrder = 44
                      Text = #49324#50857
                      OnClick = cmb_WatchTypeClick
                      Items.Strings = (
                        #49324#50857
                        #49324#50857#50504#54632)
                      ItemIndex = 0
                    end
                  end
                  object cmb_ZoneExtensionUse8: TRzComboBox
                    Tag = 8
                    Left = 126
                    Top = 11
                    Width = 90
                    Height = 20
                    Hint = '1'
                    Style = csDropDownList
                    Ctl3D = False
                    Enabled = False
                    FlatButtons = True
                    FrameVisible = True
                    ImeName = 'Microsoft IME 2003'
                    ItemHeight = 12
                    ParentCtl3D = False
                    TabOrder = 1
                    Text = #48120#49324#50857
                    OnChange = cmb_ZoneExtensionUse1Change
                    Items.Strings = (
                      #48120#49324#50857
                      #48169#48276'+'#52636#51077#47928#49324#50857
                      #52636#51077#51204#50857)
                    ItemIndex = 0
                  end
                end
              end
              object Panel10: TPanel
                Left = 0
                Top = 0
                Width = 785
                Height = 41
                Align = alTop
                Caption = #44048#51109#44592#47484' '#49444#51221' '#54633#45768#45796'.'
                Color = clGradientActiveCaption
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = #44404#47548#52404
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
            end
          end
        end
        object tabArmAreaSearch: TTabSheet
          Caption = #44396#50669#44221#44228#54788#54889
          ImageIndex = 8
          object gb_ArmAreaSearch: TRzCheckGroup
            Left = 0
            Top = 41
            Width = 844
            Height = 48
            Align = alTop
            Columns = 9
            Items.Strings = (
              #44396#50669'1'
              #44396#50669'2'
              #44396#50669'3'
              #44396#50669'4'
              #44396#50669'5'
              #44396#50669'6'
              #44396#50669'7'
              #44396#50669'8')
            StartYPos = 15
            TabOrder = 0
            OnChange = gb_ArmAreaSearchChange
            CheckStates = (
              0
              0
              0
              0
              0
              0
              0
              0)
          end
          object Panel14: TPanel
            Left = 0
            Top = 89
            Width = 844
            Height = 357
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object sg_ArmAreastate: TAdvStringGrid
              Left = 0
              Top = 0
              Width = 844
              Height = 357
              Cursor = crDefault
              Align = alClient
              ColCount = 13
              DefaultColWidth = 62
              DefaultRowHeight = 36
              FixedRows = 2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing]
              ParentFont = False
              ScrollBars = ssNone
              TabOrder = 0
              ActiveCellFont.Charset = DEFAULT_CHARSET
              ActiveCellFont.Color = clWindowText
              ActiveCellFont.Height = -11
              ActiveCellFont.Name = 'Tahoma'
              ActiveCellFont.Style = [fsBold]
              ColumnHeaders.Strings = (
                #48264#54840
                #52636#51077#47928
                #52852#46300#47532#45908
                #50672#44208#52636#51077#47928
                #52968#53944#47204#47084#51316#51221#48372
                #44048#51109#44592'1'#51316#51221#48372
                #44048#51109#44592'2'#51316#51221#48372
                #44048#51109#44592'3'#51316#51221#48372
                #44048#51109#44592'4'#51316#51221#48372
                #44048#51109#44592'5'#51316#51221#48372
                #44048#51109#44592'6'#51316#51221#48372
                #44048#51109#44592'7'#51316#51221#48372
                #44048#51109#44592'8'#51316#51221#48372)
              ControlLook.FixedGradientHoverFrom = clGray
              ControlLook.FixedGradientHoverTo = clWhite
              ControlLook.FixedGradientDownFrom = clGray
              ControlLook.FixedGradientDownTo = clSilver
              ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
              ControlLook.DropDownHeader.Font.Color = clWindowText
              ControlLook.DropDownHeader.Font.Height = -11
              ControlLook.DropDownHeader.Font.Name = 'Tahoma'
              ControlLook.DropDownHeader.Font.Style = []
              ControlLook.DropDownHeader.Visible = True
              ControlLook.DropDownHeader.Buttons = <>
              ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
              ControlLook.DropDownFooter.Font.Color = clWindowText
              ControlLook.DropDownFooter.Font.Height = -11
              ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
              ControlLook.DropDownFooter.Font.Style = []
              ControlLook.DropDownFooter.Visible = True
              ControlLook.DropDownFooter.Buttons = <>
              Filter = <>
              FilterDropDown.Font.Charset = DEFAULT_CHARSET
              FilterDropDown.Font.Color = clWindowText
              FilterDropDown.Font.Height = -11
              FilterDropDown.Font.Name = 'MS Sans Serif'
              FilterDropDown.Font.Style = []
              FilterDropDownClear = '(All)'
              FixedColWidth = 62
              FixedRowHeight = 36
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clWindowText
              FixedFont.Height = -11
              FixedFont.Name = 'Tahoma'
              FixedFont.Style = [fsBold]
              FloatFormat = '%.2f'
              PrintSettings.DateFormat = 'dd/mm/yyyy'
              PrintSettings.Font.Charset = DEFAULT_CHARSET
              PrintSettings.Font.Color = clWindowText
              PrintSettings.Font.Height = -11
              PrintSettings.Font.Name = 'MS Sans Serif'
              PrintSettings.Font.Style = []
              PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
              PrintSettings.FixedFont.Color = clWindowText
              PrintSettings.FixedFont.Height = -11
              PrintSettings.FixedFont.Name = 'MS Sans Serif'
              PrintSettings.FixedFont.Style = []
              PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
              PrintSettings.HeaderFont.Color = clWindowText
              PrintSettings.HeaderFont.Height = -11
              PrintSettings.HeaderFont.Name = 'MS Sans Serif'
              PrintSettings.HeaderFont.Style = []
              PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
              PrintSettings.FooterFont.Color = clWindowText
              PrintSettings.FooterFont.Height = -11
              PrintSettings.FooterFont.Name = 'MS Sans Serif'
              PrintSettings.FooterFont.Style = []
              PrintSettings.PageNumSep = '/'
              ScrollSynch = True
              SearchFooter.FindNextCaption = 'Find next'
              SearchFooter.FindPrevCaption = 'Find previous'
              SearchFooter.Font.Charset = DEFAULT_CHARSET
              SearchFooter.Font.Color = clWindowText
              SearchFooter.Font.Height = -11
              SearchFooter.Font.Name = 'MS Sans Serif'
              SearchFooter.Font.Style = []
              SearchFooter.HighLightCaption = 'Highlight'
              SearchFooter.HintClose = 'Close'
              SearchFooter.HintFindNext = 'Find next occurence'
              SearchFooter.HintFindPrev = 'Find previous occurence'
              SearchFooter.HintHighlight = 'Highlight occurences'
              SearchFooter.MatchCaseCaption = 'Match case'
              ShowSelection = False
              SortSettings.AutoSortForGrouping = False
              SortSettings.AutoColumnMerge = True
              SortSettings.AutoFormat = False
              Version = '6.0.4.4'
            end
          end
          object Panel15: TPanel
            Left = 0
            Top = 0
            Width = 844
            Height = 41
            Align = alTop
            Caption = #48169#48276#44396#50669#51032' '#54788#51116' '#49444#51221' '#51221#48372#47484' '#51312#54924' '#54633#45768#45796'.'
            Color = clGradientActiveCaption
            Font.Charset = HANGEUL_CHARSET
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
        end
        object tab_CardReader: TTabSheet
          Caption = #52852#46300#47532#45908#49444#51221
          ImageIndex = 3
          object PageControl6: TPageControl
            Left = 0
            Top = 0
            Width = 844
            Height = 446
            ActivePage = TabSheet3
            Align = alClient
            TabOrder = 0
            object TabSheet3: TTabSheet
              Caption = #52968#53944#47204#47084
              object gb_CardReader: TGroupBox
                Left = 16
                Top = 80
                Width = 801
                Height = 273
                Caption = #52852#46300#47532#45908
                TabOrder = 0
                object StaticText20: TStaticText
                  Left = 16
                  Top = 53
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '1'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 0
                end
                object RzPanel1: TRzPanel
                  Left = 86
                  Top = 22
                  Width = 55
                  Height = 25
                  Hint = #47532#45908#51032' '#49324#50857#50976#47924#47484' '#49444#51221#54620#45796'.'
                  BorderOuter = fsButtonDown
                  Caption = #49324#50857#50976#47924
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                end
                object cmb_ReaderUse1: TRzComboBox
                  Left = 86
                  Top = 51
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 2
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                end
                object RzPanel5: TRzPanel
                  Left = 14
                  Top = 22
                  Width = 67
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #47532#45908#48264#54840
                  TabOrder = 3
                end
                object StaticText21: TStaticText
                  Left = 16
                  Top = 79
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '2'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 4
                end
                object StaticText22: TStaticText
                  Left = 16
                  Top = 106
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '3'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 5
                end
                object StaticText23: TStaticText
                  Left = 16
                  Top = 133
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '4'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 6
                end
                object StaticText24: TStaticText
                  Left = 16
                  Top = 160
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '5'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 7
                end
                object StaticText25: TStaticText
                  Left = 16
                  Top = 187
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '6'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 8
                end
                object StaticText26: TStaticText
                  Left = 16
                  Top = 214
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '7'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 9
                end
                object StaticText27: TStaticText
                  Left = 16
                  Top = 241
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '8'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 10
                end
                object RzPanel3: TRzPanel
                  Left = 144
                  Top = 22
                  Width = 55
                  Height = 25
                  Hint = #52852#46300#47532#45908#44032' '#51228#50612#54624' '#52636#51077#47928#51012' '#49440#53469#54632#13#10#48169#48276#51204#50857' '#49444#51221' '#49884' '#44221'/'#54644#48260#53948' '#45572#47492' '#50630#51060' '#48169#48276#47784#46300#47196' '#46041#51089#54632#13#10
                  BorderOuter = fsButtonDown
                  Caption = #47928#48264#54840
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 11
                end
                object RzPanel6: TRzPanel
                  Left = 202
                  Top = 22
                  Width = 55
                  Height = 25
                  Hint = 'PC'#54532#47196#44536#47016#50640#49436' '#45236#48512'/'#50808#48512' '#50948#52824' '#54028#50501#54616#44592' '#50948#54620' '#49444#51221
                  BorderOuter = fsButtonDown
                  Caption = #47928#49444#52824
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 12
                end
                object RzPanel7: TRzPanel
                  Left = 260
                  Top = 22
                  Width = 55
                  Height = 25
                  Hint = #45236#48512' : LED'#44032' '#51221#49345#51201#51004#47196' '#44636#48149#51076#13#10#50808#48512' : LED'#47484' '#54364#49884#54616#51648' '#50506#51020' '
                  BorderOuter = fsButtonDown
                  Caption = #44148#47932#49444#52824
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 13
                end
                object pan_ReaderVer0: TRzPanel
                  Left = 610
                  Top = 22
                  Width = 180
                  Height = 25
                  Hint = #51068#48152#47532#45908' '#51064' '#44221#50864#50640#47564' '#47532#45908#48260#51260' '#54869#51064' '#44032#45733
                  BorderOuter = fsButtonDown
                  Caption = #47532#45908#48260#51260
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 14
                end
                object cmb_ReaderDoor1: TRzComboBox
                  Left = 144
                  Top = 51
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 15
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48169#48276#51204#50857
                    '1'
                    '2')
                end
                object cmb_ReaderDoorLocate1: TRzComboBox
                  Left = 202
                  Top = 51
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 16
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object cmb_ReaderBuildingLocate1: TRzComboBox
                  Left = 260
                  Top = 51
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 17
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object st_ReaderComstate1: TStaticText
                  Left = 610
                  Top = 53
                  Width = 180
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 18
                end
                object cmb_ReaderUse2: TRzComboBox
                  Left = 86
                  Top = 77
                  Width = 55
                  Height = 20
                  Hint = '2'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 19
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                end
                object cmb_ReaderDoor2: TRzComboBox
                  Left = 144
                  Top = 77
                  Width = 55
                  Height = 20
                  Hint = '2'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 20
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48169#48276#51204#50857
                    '1'
                    '2')
                end
                object cmb_ReaderDoorLocate2: TRzComboBox
                  Left = 202
                  Top = 77
                  Width = 55
                  Height = 20
                  Hint = '2'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 21
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object cmb_ReaderBuildingLocate2: TRzComboBox
                  Left = 260
                  Top = 77
                  Width = 55
                  Height = 20
                  Hint = '2'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 22
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object st_ReaderComstate2: TStaticText
                  Left = 610
                  Top = 79
                  Width = 180
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 23
                end
                object cmb_ReaderUse3: TRzComboBox
                  Left = 86
                  Top = 104
                  Width = 55
                  Height = 20
                  Hint = '3'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 24
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                end
                object cmb_ReaderDoor3: TRzComboBox
                  Left = 144
                  Top = 104
                  Width = 55
                  Height = 20
                  Hint = '3'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 25
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48169#48276#51204#50857
                    '1'
                    '2')
                end
                object cmb_ReaderDoorLocate3: TRzComboBox
                  Left = 202
                  Top = 104
                  Width = 55
                  Height = 20
                  Hint = '3'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 26
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object cmb_ReaderBuildingLocate3: TRzComboBox
                  Left = 260
                  Top = 104
                  Width = 55
                  Height = 20
                  Hint = '3'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 27
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object st_ReaderComstate3: TStaticText
                  Left = 610
                  Top = 106
                  Width = 180
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 28
                end
                object cmb_ReaderUse4: TRzComboBox
                  Left = 86
                  Top = 131
                  Width = 55
                  Height = 20
                  Hint = '4'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 29
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                end
                object cmb_ReaderDoor4: TRzComboBox
                  Left = 144
                  Top = 131
                  Width = 55
                  Height = 20
                  Hint = '4'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 30
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48169#48276#51204#50857
                    '1'
                    '2')
                end
                object cmb_ReaderDoorLocate4: TRzComboBox
                  Left = 202
                  Top = 131
                  Width = 55
                  Height = 20
                  Hint = '4'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 31
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object cmb_ReaderBuildingLocate4: TRzComboBox
                  Left = 260
                  Top = 131
                  Width = 55
                  Height = 20
                  Hint = '4'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 32
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object st_ReaderComstate4: TStaticText
                  Left = 610
                  Top = 133
                  Width = 180
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 33
                end
                object cmb_ReaderUse5: TRzComboBox
                  Left = 86
                  Top = 158
                  Width = 55
                  Height = 20
                  Hint = '5'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 34
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                end
                object cmb_ReaderDoor5: TRzComboBox
                  Left = 144
                  Top = 158
                  Width = 55
                  Height = 20
                  Hint = '5'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 35
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48169#48276#51204#50857
                    '1'
                    '2')
                end
                object cmb_ReaderDoorLocate5: TRzComboBox
                  Left = 202
                  Top = 158
                  Width = 55
                  Height = 20
                  Hint = '5'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 36
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object cmb_ReaderBuildingLocate5: TRzComboBox
                  Left = 260
                  Top = 158
                  Width = 55
                  Height = 20
                  Hint = '5'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 37
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object st_ReaderComstate5: TStaticText
                  Left = 610
                  Top = 160
                  Width = 180
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 38
                end
                object cmb_ReaderUse6: TRzComboBox
                  Left = 86
                  Top = 185
                  Width = 55
                  Height = 20
                  Hint = '6'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 39
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                end
                object cmb_ReaderDoor6: TRzComboBox
                  Left = 144
                  Top = 185
                  Width = 55
                  Height = 20
                  Hint = '6'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 40
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48169#48276#51204#50857
                    '1'
                    '2')
                end
                object cmb_ReaderDoorLocate6: TRzComboBox
                  Left = 202
                  Top = 185
                  Width = 55
                  Height = 20
                  Hint = '6'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 41
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object cmb_ReaderBuildingLocate6: TRzComboBox
                  Left = 260
                  Top = 185
                  Width = 55
                  Height = 20
                  Hint = '6'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 42
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object st_ReaderComstate6: TStaticText
                  Left = 610
                  Top = 187
                  Width = 180
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 43
                end
                object cmb_ReaderUse7: TRzComboBox
                  Left = 86
                  Top = 212
                  Width = 55
                  Height = 20
                  Hint = '7'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 44
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                end
                object cmb_ReaderDoor7: TRzComboBox
                  Left = 144
                  Top = 212
                  Width = 55
                  Height = 20
                  Hint = '7'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 45
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48169#48276#51204#50857
                    '1'
                    '2')
                end
                object cmb_ReaderDoorLocate7: TRzComboBox
                  Left = 202
                  Top = 212
                  Width = 55
                  Height = 20
                  Hint = '7'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 46
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object cmb_ReaderBuildingLocate7: TRzComboBox
                  Left = 260
                  Top = 212
                  Width = 55
                  Height = 20
                  Hint = '7'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 47
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object st_ReaderComstate7: TStaticText
                  Left = 610
                  Top = 214
                  Width = 180
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 48
                end
                object cmb_ReaderUse8: TRzComboBox
                  Left = 86
                  Top = 239
                  Width = 55
                  Height = 20
                  Hint = '8'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 49
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                end
                object cmb_ReaderDoor8: TRzComboBox
                  Left = 144
                  Top = 239
                  Width = 55
                  Height = 20
                  Hint = '8'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 50
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #48169#48276#51204#50857
                    '1'
                    '2')
                end
                object cmb_ReaderDoorLocate8: TRzComboBox
                  Left = 202
                  Top = 239
                  Width = 55
                  Height = 20
                  Hint = '8'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 51
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object cmb_ReaderBuildingLocate8: TRzComboBox
                  Left = 260
                  Top = 239
                  Width = 55
                  Height = 20
                  Hint = '8'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 52
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #45236#48512
                    #50808#48512)
                end
                object st_ReaderComstate8: TStaticText
                  Left = 610
                  Top = 241
                  Width = 180
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 53
                end
                object RzPanel18: TRzPanel
                  Left = 320
                  Top = 22
                  Width = 100
                  Height = 25
                  Hint = #47532#45908' '#51333#47448
                  BorderOuter = fsButtonDown
                  Caption = #47532#45908#51333#47448
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 54
                end
                object cmb_ReaderType1: TRzComboBox
                  Left = 320
                  Top = 51
                  Width = 100
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 55
                  OnChange = ReaderInfoChange
                  OnEnter = cmb_ReaderType1Enter
                  OnExit = cmb_ReaderType1Exit
                  Items.Strings = (
                    ''
                    '0.'#51068#48152#47532#45908'/'#50976#45768#50728'(SG5000P)'
                    '1.'#49457#54788#51648#47928#47532#45908'/'#54168#51060#49828#52869
                    '2.Wiegand '#52852#46300#47532#45908'(26)'
                    '3.Wiegand '#52852#46300#47532#45908'(34)')
                end
                object cmb_ReaderType2: TRzComboBox
                  Left = 320
                  Top = 77
                  Width = 100
                  Height = 20
                  Hint = '2'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 56
                  OnChange = ReaderInfoChange
                  OnEnter = cmb_ReaderType1Enter
                  OnExit = cmb_ReaderType1Exit
                  Items.Strings = (
                    ''
                    '0.'#51068#48152#47532#45908'(CRO-811)'
                    '1.'#51648#47928#47532#45908'/'#54168#51060#49828#52869
                    '2.Wiegand '#52852#46300#47532#45908'(26)'
                    '3.Wiegand '#52852#46300#47532#45908'(34)')
                end
                object cmb_ReaderType3: TRzComboBox
                  Left = 320
                  Top = 104
                  Width = 100
                  Height = 20
                  Hint = '3'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 57
                  OnChange = ReaderInfoChange
                  OnEnter = cmb_ReaderType1Enter
                  OnExit = cmb_ReaderType1Exit
                  Items.Strings = (
                    ''
                    '0.'#51068#48152#47532#45908'(CRO-811)'
                    '1.'#51648#47928#47532#45908'/'#54168#51060#49828#52869
                    '2.Wiegand '#52852#46300#47532#45908'(26)'
                    '3.Wiegand '#52852#46300#47532#45908'(34)')
                end
                object cmb_ReaderType4: TRzComboBox
                  Left = 320
                  Top = 131
                  Width = 100
                  Height = 20
                  Hint = '4'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 58
                  OnChange = ReaderInfoChange
                  OnEnter = cmb_ReaderType1Enter
                  OnExit = cmb_ReaderType1Exit
                  Items.Strings = (
                    ''
                    '0.'#51068#48152#47532#45908'(CRO-811)'
                    '1.'#51648#47928#47532#45908'/'#54168#51060#49828#52869
                    '2.Wiegand '#52852#46300#47532#45908'(26)'
                    '3.Wiegand '#52852#46300#47532#45908'(34)')
                end
                object cmb_ReaderType5: TRzComboBox
                  Left = 320
                  Top = 158
                  Width = 100
                  Height = 20
                  Hint = '5'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 59
                  OnChange = ReaderInfoChange
                  OnEnter = cmb_ReaderType1Enter
                  OnExit = cmb_ReaderType1Exit
                  Items.Strings = (
                    ''
                    '0.'#51068#48152#47532#45908'(CRO-811)'
                    '1.'#51648#47928#47532#45908'/'#54168#51060#49828#52869
                    '2.Wiegand '#52852#46300#47532#45908'(26)'
                    '3.Wiegand '#52852#46300#47532#45908'(34)')
                end
                object cmb_ReaderType6: TRzComboBox
                  Left = 320
                  Top = 185
                  Width = 100
                  Height = 20
                  Hint = '6'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 60
                  OnChange = ReaderInfoChange
                  OnEnter = cmb_ReaderType1Enter
                  OnExit = cmb_ReaderType1Exit
                  Items.Strings = (
                    ''
                    '0.'#51068#48152#47532#45908'(CRO-811)'
                    '1.'#51648#47928#47532#45908'/'#54168#51060#49828#52869
                    '2.Wiegand '#52852#46300#47532#45908'(26)'
                    '3.Wiegand '#52852#46300#47532#45908'(34)')
                end
                object cmb_ReaderType7: TRzComboBox
                  Left = 320
                  Top = 212
                  Width = 100
                  Height = 20
                  Hint = '7'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 61
                  OnChange = ReaderInfoChange
                  OnEnter = cmb_ReaderType1Enter
                  OnExit = cmb_ReaderType1Exit
                  Items.Strings = (
                    ''
                    '0.'#51068#48152#47532#45908'(CRO-811)'
                    '1.'#51648#47928#47532#45908'/'#54168#51060#49828#52869
                    '2.Wiegand '#52852#46300#47532#45908'(26)'
                    '3.Wiegand '#52852#46300#47532#45908'(34)')
                end
                object cmb_ReaderType8: TRzComboBox
                  Left = 320
                  Top = 239
                  Width = 100
                  Height = 20
                  Hint = '8'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 62
                  OnChange = ReaderInfoChange
                  OnEnter = cmb_ReaderType1Enter
                  OnExit = cmb_ReaderType1Exit
                  Items.Strings = (
                    ''
                    '0.'#51068#48152#47532#45908'(CRO-811)'
                    '1.'#51648#47928#47532#45908'/'#54168#51060#49828#52869
                    '2.Wiegand '#52852#46300#47532#45908'(26)'
                    '3.Wiegand '#52852#46300#47532#45908'(34)')
                end
                object pan_ReaderArmArea0: TRzPanel
                  Left = 425
                  Top = 22
                  Width = 55
                  Height = 25
                  Hint = #48169#48276#51204#50857#49884' '#51228#50612#54624' '#48169#48276#44396#50669' '#49444#51221
                  BorderOuter = fsButtonDown
                  Caption = #48169#48276#44396#50669
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 63
                end
                object cmb_ReaderAlarmArea1: TRzComboBox
                  Left = 425
                  Top = 51
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 64
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                end
                object cmb_ReaderAlarmArea2: TRzComboBox
                  Left = 425
                  Top = 77
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 65
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                end
                object cmb_ReaderAlarmArea3: TRzComboBox
                  Left = 425
                  Top = 104
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 66
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                end
                object cmb_ReaderAlarmArea4: TRzComboBox
                  Left = 425
                  Top = 131
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 67
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                end
                object cmb_ReaderAlarmArea5: TRzComboBox
                  Left = 425
                  Top = 158
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 68
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                end
                object cmb_ReaderAlarmArea6: TRzComboBox
                  Left = 425
                  Top = 185
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 69
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                end
                object cmb_ReaderAlarmArea7: TRzComboBox
                  Left = 425
                  Top = 212
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 70
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                end
                object cmb_ReaderAlarmArea8: TRzComboBox
                  Left = 425
                  Top = 239
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 71
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #44396#50669'1'
                    #44396#50669'2'
                    #44396#50669'3'
                    #44396#50669'4'
                    #44396#50669'5'
                    #44396#50669'6'
                    #44396#50669'7'
                    #44396#50669'8')
                end
                object RzPanel64: TRzPanel
                  Left = 485
                  Top = 22
                  Width = 55
                  Height = 25
                  Hint = #48169#48276#51204#50857#49884' '#51228#50612#54624' '#48169#48276#44396#50669' '#49444#51221
                  BorderOuter = fsButtonDown
                  Caption = #51020#49457#49569#52636
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 72
                end
                object cmb_ReaderSound1: TRzComboBox
                  Left = 485
                  Top = 51
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 73
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object cmb_ReaderSound2: TRzComboBox
                  Left = 485
                  Top = 77
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 74
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object cmb_ReaderSound3: TRzComboBox
                  Left = 485
                  Top = 104
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 75
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object cmb_ReaderSound4: TRzComboBox
                  Left = 485
                  Top = 131
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 76
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object cmb_ReaderSound5: TRzComboBox
                  Left = 485
                  Top = 158
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 77
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object cmb_ReaderSound6: TRzComboBox
                  Left = 485
                  Top = 185
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 78
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object cmb_ReaderSound7: TRzComboBox
                  Left = 485
                  Top = 212
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 79
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object cmb_ReaderSound8: TRzComboBox
                  Left = 485
                  Top = 239
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 80
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object RzPanel65: TRzPanel
                  Left = 545
                  Top = 22
                  Width = 55
                  Height = 25
                  Hint = #48169#48276#51204#50857#49884' '#51228#50612#54624' '#48169#48276#44396#50669' '#49444#51221
                  BorderOuter = fsButtonDown
                  Caption = #53748#49892#51020#49457
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 81
                end
                object cmb_ExitSound1: TRzComboBox
                  Left = 545
                  Top = 51
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 82
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object cmb_ExitSound2: TRzComboBox
                  Left = 545
                  Top = 77
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 83
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object cmb_ExitSound3: TRzComboBox
                  Left = 545
                  Top = 104
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 84
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object cmb_ExitSound4: TRzComboBox
                  Left = 545
                  Top = 131
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 85
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object cmb_ExitSound5: TRzComboBox
                  Left = 545
                  Top = 158
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 86
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object cmb_ExitSound6: TRzComboBox
                  Left = 545
                  Top = 185
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 87
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object cmb_ExitSound7: TRzComboBox
                  Left = 545
                  Top = 212
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 88
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
                object cmb_ExitSound8: TRzComboBox
                  Left = 545
                  Top = 239
                  Width = 55
                  Height = 20
                  Hint = '1'
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameColor = clBtnText
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 89
                  Text = #49324#50857#50504#54632
                  OnChange = ReaderInfoChange
                  Items.Strings = (
                    #49324#50857#50504#54632
                    #51020#49457#49569#52636)
                  ItemIndex = 0
                end
              end
              object cb_CardType: TRzComboBox
                Left = 164
                Top = 50
                Width = 293
                Height = 20
                Style = csDropDownList
                Ctl3D = False
                FlatButtons = True
                FrameVisible = True
                ImeName = 'Microsoft IME 2003'
                ItemHeight = 12
                ParentCtl3D = False
                TabOrder = 1
                OnChange = cb_CardTypeChange
                Items.Strings = (
                  ''
                  '0.'#51068#48152#47532#45908'(CRO-811)'
                  '1.'#51648#47928#47532#45908'/'#54168#51060#49828#52869
                  '2.Wiegand '#52852#46300#47532#45908'(26)'
                  '3.Wiegand '#52852#46300#47532#45908'(34)')
              end
              object st_cardreaderType: TStaticText
                Left = 16
                Top = 52
                Width = 137
                Height = 17
                Alignment = taCenter
                AutoSize = False
                BevelKind = bkFlat
                BorderStyle = sbsSunken
                Caption = #52852#46300#47532#45908#51333#47448
                TabOrder = 2
              end
              object Panel17: TPanel
                Left = 0
                Top = 0
                Width = 836
                Height = 41
                Align = alTop
                Caption = #52968#53944#47204#47084#51032' '#52852#46300#47532#45908#47484' '#49444#51221#54616#45716' '#54868#47732#51077#45768#45796'.'
                Color = clGradientActiveCaption
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = #44404#47548#52404
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
              end
            end
          end
        end
        object tab_DoorLock: TTabSheet
          Caption = #46973'('#52636#51077#47928')'#49444#51221
          ImageIndex = 2
          object pgDoorLockSetting: TPageControl
            Left = 0
            Top = 0
            Width = 844
            Height = 446
            ActivePage = tabLockExtention
            Align = alClient
            TabOrder = 0
            OnChange = pg_DeviceSettingChange
            object tabLock_Controler: TTabSheet
              Caption = #52968#53944#47204#47084
              object gb_DoorInfo: TGroupBox
                Left = 0
                Top = 41
                Width = 836
                Height = 378
                Align = alClient
                Caption = #52636#51077#47928#51221#48372
                TabOrder = 0
                object Label12: TLabel
                  Left = 233
                  Top = 90
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object Label16: TLabel
                  Left = 337
                  Top = 90
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object Label46: TLabel
                  Left = 233
                  Top = 112
                  Width = 12
                  Height = 12
                  Caption = #48516
                  Transparent = True
                end
                object Label11: TLabel
                  Left = 337
                  Top = 112
                  Width = 12
                  Height = 12
                  Caption = #48516
                  Transparent = True
                end
                object Label43: TLabel
                  Left = 233
                  Top = 288
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object Label44: TLabel
                  Left = 337
                  Top = 288
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object RzPanel2: TRzPanel
                  Left = 158
                  Top = 14
                  Width = 100
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'1'
                  TabOrder = 0
                end
                object RzPanel4: TRzPanel
                  Left = 262
                  Top = 14
                  Width = 100
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'2'
                  TabOrder = 1
                end
                object ComboBox_CardModeType1: TRzComboBox
                  Tag = 1
                  Left = 158
                  Top = 43
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 2
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_CardModeType2: TRzComboBox
                  Tag = 2
                  Left = 262
                  Top = 43
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 3
                  OnChange = ComboBox_CardModeType1Change
                end
                object StaticText10: TStaticText
                  Left = 16
                  Top = 66
                  Width = 137
                  Height = 17
                  Hint = 
                    #50868#50689#47784#46300' : '#52636#51077#47928#51060' '#45803#55176#47732' '#52636#51077#47928#51060' '#51104#44592#47728' '#45796#51020#44284' '#44057#51060' '#46041#51089#54632' '#13#10'                       - '#48120 +
                    #51064#51613' '#52852#46300' '#53468#44536#49884' '#52636#51077' '#48520#44032#13#10'                       - '#51064#51613' '#52852#46300' '#53468#44536#49884' '#52636#51077' '#54728#50857#13#10#44060#48169#47784#46300' ' +
                    ': '#52636#51077#47928#51060' '#45803#54784#46020' '#52636#51077#47928#51012' '#51104#44536#51648' '#50506#51020#13#10#54224#49604#47784#46300' : '#52636#51077#47928#51060' '#45803#55176#47732' '#52636#51077#47928#51060' '#51104#44592#47728' '#45796#51020#44284' '#44057#51060' '#46041#51089#54632#13#10'   ' +
                    '                    - '#48120#51064#51613' '#52852#46300' '#53468#44536#49884' '#52636#51077' '#48520#44032#13#10'                       -' +
                    ' '#51064#51613' '#52852#46300' '#53468#44536#49884' '#52636#51077' '#48520#44032#13#10'                       - '#53748#49892#48260#53948' '#52636#51077#54728#50857
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #52636#51077#47928' '#50868#50689#47784#46300
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 4
                end
                object ComboBox_DoorModeType1: TRzComboBox
                  Tag = 1
                  Left = 158
                  Top = 64
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 5
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_DoorModeType2: TRzComboBox
                  Tag = 2
                  Left = 262
                  Top = 64
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 6
                  OnChange = ComboBox_CardModeType1Change
                end
                object cmb_DoorControlTime1: TRzComboBox
                  Tag = 1
                  Left = 158
                  Top = 86
                  Width = 67
                  Height = 20
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 7
                  Text = '5'
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10'
                    '20'
                    '30'
                    '40'
                    '50'
                    '60'
                    '100'
                    '120'
                    '150'
                    '200'
                    '====='
                    '100ms'
                    '200ms'
                    '300ms'
                    '400ms'
                    '500ms'
                    '600ms'
                    '700ms'
                    '800ms'
                    '900ms')
                end
                object cmb_DoorControlTime2: TRzComboBox
                  Tag = 2
                  Left = 262
                  Top = 86
                  Width = 67
                  Height = 20
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 8
                  Text = '5'
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10'
                    '20'
                    '30'
                    '40'
                    '50'
                    '60'
                    '100'
                    '120'
                    '150'
                    '200'
                    '====='
                    '100ms'
                    '200ms'
                    '300ms'
                    '400ms'
                    '500ms'
                    '600ms'
                    '700ms'
                    '800ms'
                    '900ms')
                end
                object StaticText11: TStaticText
                  Left = 16
                  Top = 88
                  Width = 137
                  Height = 17
                  Hint = #52636#51077#47928#51060' '#50676#47140#51080#45716' '#49884#44036
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #52636#51077#47928' '#51104#44608' '#51648#50672#49884#44036
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 9
                end
                object StaticText12: TStaticText
                  Left = 16
                  Top = 110
                  Width = 137
                  Height = 17
                  Hint = #54644#45817' '#49884#44036' '#46041#50504' '#52636#51077#47928#51060' '#50676#47140' '#51080#45716' '#44221#50864' '#51109#49884#44036' '#50676#47548' '#51060#48292#53944' '#48156#49373#13#10'('#45800' 0 '#51004#47196' '#49444#51221#49884' '#51109#49884#44036#50676#47548' '#52404#53356' '#50504#54632')'
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #51109#49884#44036' '#50676#47548' '#51060#48292#53944
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 10
                end
                object ComboBox_SendDoorStatus1: TRzComboBox
                  Tag = 1
                  Left = 158
                  Top = 152
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 11
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_SendDoorStatus2: TRzComboBox
                  Tag = 2
                  Left = 262
                  Top = 152
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 12
                  OnChange = ComboBox_CardModeType1Change
                end
                object StaticText13: TStaticText
                  Left = 16
                  Top = 154
                  Width = 137
                  Height = 17
                  Hint = #52636#51077#47928' '#49345#53468' '#48320#44221#49884' PC'#50640' '#49345#53468' '#51204#49569' '#50668#48512' '#49444#51221
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #52636#51077#47928' '#49345#53468#51204#49569
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 13
                end
                object ComboBox_AlarmLongOpen1: TRzComboBox
                  Tag = 1
                  Left = 158
                  Top = 130
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 14
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_AlarmLongOpen2: TRzComboBox
                  Tag = 2
                  Left = 262
                  Top = 130
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 15
                  OnChange = ComboBox_CardModeType1Change
                end
                object StaticText14: TStaticText
                  Left = 16
                  Top = 132
                  Width = 137
                  Height = 17
                  Hint = #51109#49884#44036' '#50676#47548' '#51060#48292#53944' '#48156#49373#49884' '#52852#46300#47532#45908#50640#49436' '#48708#54532#51020' '#48156#49373' '#50668#48512' '#49324#50857#50976#47924
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #51109#49884#44036' '#50676#47548' '#44221#44256#51020
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 16
                end
                object ComboBox_ControlFire1: TRzComboBox
                  Tag = 1
                  Left = 158
                  Top = 196
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 17
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_ControlFire2: TRzComboBox
                  Tag = 2
                  Left = 262
                  Top = 196
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 18
                  OnChange = ComboBox_CardModeType1Change
                end
                object StaticText16: TStaticText
                  Left = 16
                  Top = 198
                  Width = 137
                  Height = 17
                  Hint = #54868#51116#49884' '#52636#51077#47928' '#44060#48169' '#50668#48512' '#49444#51221
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #54868#51116#48156#49373#49884' '#47928#50676#47548
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 19
                end
                object ComboBox_LockType1: TRzComboBox
                  Tag = 1
                  Left = 158
                  Top = 218
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  DropDownWidth = 200
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 20
                  OnChange = ComboBox_CardModeType1Change
                  OnEnter = ComboBox_LockType1Enter
                  OnExit = ComboBox_LockType1Exit
                end
                object ComboBox_LockType2: TRzComboBox
                  Tag = 2
                  Left = 262
                  Top = 218
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  DropDownWidth = 200
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 21
                  OnChange = ComboBox_CardModeType1Change
                  OnEnter = ComboBox_LockType2Enter
                  OnExit = ComboBox_LockType2Exit
                end
                object cmb_DsOpenState2: TRzComboBox
                  Tag = 2
                  Left = 262
                  Top = 240
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 22
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    ''
                    'DS OPEN'
                    'DS CLOSE')
                end
                object cmb_DsOpenState1: TRzComboBox
                  Tag = 1
                  Left = 158
                  Top = 240
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 23
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    ''
                    'DS OPEN'
                    'DS CLOSE')
                end
                object cmb_RemoteDoorOpen1: TRzComboBox
                  Tag = 1
                  Left = 158
                  Top = 262
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 24
                  Text = #49324#50857
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object cmb_RemoteDoorOpen2: TRzComboBox
                  Tag = 2
                  Left = 262
                  Top = 262
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 25
                  Text = #49324#50857
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object StaticText17: TStaticText
                  Left = 16
                  Top = 220
                  Width = 137
                  Height = 17
                  Hint = 
                    'EM'#46973'('#51221#51204#49884#51104#44608') : 0V '#51064#44032#49884' '#52636#51077#47928' '#51104#44552'/12V '#51064#44032#49884' '#52636#51077#47928' '#50676#47548#13#10'EM'#46973'('#51221#51204#49884#50676#47548') : 0V '#51064#44032#49884' '#52636 +
                    #51077#47928' '#50676#47548'/12V '#51064#44032#49884' '#52636#51077#47928' '#51104#44552#13#10#45936#46300#48380#53944'('#51221#51204#49884#51104#44608') : DS/GND '#49660#53944' '#54980' 0V '#51064#44032#49884' '#52636#51077#47928' '#51104#44552#13#10#45936 +
                    #46300#48380#53944'('#51221#51204#49884#50676#47548') : DS/GND '#49660#53944' '#54980' 12V '#51064#44032#49884' '#52636#51077#47928' '#51104#44552#13#10#49828#53944#46972#51060#53356'('#51221#51204#49884#51104#44608') : 0V '#51064#44032#49884' '#52636 +
                    #51077#47928' '#51104#44552'/12V '#51064#44032#49884' '#52636#51077#47928' '#50676#47548#13#10#49828#53944#46972#51060#53356'('#51221#51204#49884#50676#47548') : 0V '#51064#44032#49884' '#52636#51077#47928' '#50676#47548'/12V '#51064#44032#49884' '#52636#51077#47928' '#51104 +
                    #44552#13#10#51088#46041#47928'/'#51452#52264' : COM/NO '#50724#54536#49884' '#52636#51077#47928' '#51104#44552' '#48143' '#49660#53944#49884' '#52636#51077#47928' '#50676#47548' '#13#10#49885#45817'('#48512#51256'/'#47016#54532#51228#50612') : COM1/' +
                    'NO1 '#52397#49353#47016#54532',COM2/NO2 '#51201#49353#47016#54532#13#10'SPEED GATE : COM/NO '#49660#53944#49884' '#52636#51077#47928' '#50676#47548'('#45800','#44060#48169#47784#46300' '#50630#51020 +
                    ')'#13#10' '
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #46020#50612#46973' '#53440#51077
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 26
                end
                object StaticText18: TStaticText
                  Left = 16
                  Top = 242
                  Width = 137
                  Height = 17
                  Hint = 
                    'DS OPEN : DS/GND '#50724#54536#49884' '#52636#51077#47928' '#50676#47548#51004#47196' '#51064#49885#13#10'DS CLOSE : DS/GND '#49660#53944#49884' '#52636#51077#47928' '#50676#47548#51004#47196 +
                    ' '#51064#49885#13#10' '
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #52636#51077#47928#50676#47548#49345#53468
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 27
                end
                object StaticText19: TStaticText
                  Left = 16
                  Top = 264
                  Width = 137
                  Height = 17
                  Hint = #50896#44201#54644#51228#49884' '#47928#50676#47548' '#49324#50857#50976#47924' '#49444#51221
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #50896#44201#54644#51228#49884' '#47928#50676#47548
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 28
                end
                object StaticText9: TStaticText
                  Left = 16
                  Top = 45
                  Width = 137
                  Height = 17
                  Hint = 
                    'Positive : '#51221#49345' '#50868#50689#47784#46300#49884' '#49324#50857' '#54616#45716' '#47784#46300#47196' '#45796#51020#44284' '#44057#51060' '#46041#51089#54632#13#10'                      ' +
                    ' - '#48120#51064#51613' '#52852#46300' '#53468#44536#49884' '#52636#51077' '#48520#44032#13#10'                       - '#51064#51613' '#52852#46300' '#53468#44536#49884' '#52636#51077' '#54728#50857#13#10'N' +
                    'egative : '#44592#44592#44368#52404' '#46608#45716' '#44277#49324#51473' '#49324#50857' '#54616#45716' '#47784#46300#47196' '#45796#51020#44284' '#44057#51060' '#46041#51089#54632#13#10'                    ' +
                    '   - '#48120#51064#51613' '#52852#46300' '#53468#44536#49884' '#52636#51077' '#54728#50857' '
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #52852#46300' '#50868#50689#47784#46300
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 29
                end
                object SpinEdit_OpenMoni1: TRzSpinEdit
                  Tag = 1
                  Left = 158
                  Top = 108
                  Width = 67
                  Height = 20
                  AllowKeyEdit = True
                  Max = 60.000000000000000000
                  Alignment = taLeftJustify
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 30
                  OnChange = ComboBox_CardModeType1Change
                end
                object SpinEdit_OpenMoni2: TRzSpinEdit
                  Tag = 2
                  Left = 262
                  Top = 108
                  Width = 67
                  Height = 20
                  AllowKeyEdit = True
                  Max = 60.000000000000000000
                  Alignment = taLeftJustify
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 31
                  OnChange = ComboBox_CardModeType1Change
                end
                object StaticText15: TStaticText
                  Left = 16
                  Top = 176
                  Width = 137
                  Height = 17
                  Hint = #52636#51077#47928' '#49828#52992#51460' '#49324#50857#50976#47924
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #49828#52992#51460#51201#50857#50976#47924
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 32
                end
                object ComboBox_UseSch1: TRzComboBox
                  Tag = 1
                  Left = 158
                  Top = 174
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 33
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_UseSch2: TRzComboBox
                  Tag = 2
                  Left = 262
                  Top = 174
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 34
                  OnChange = ComboBox_CardModeType1Change
                end
                object st_DoorDSCheck1: TStaticText
                  Left = 16
                  Top = 286
                  Width = 137
                  Height = 17
                  Hint = #45936#46300#48380#53944' '#46973' '#51104#44608' '#54980' DS '#44160#49324#47484' '#54616#45716#49884#44036'('#49884#44036#51060' '#44221#44284#54980' DS'#44160#49324#47484' '#54616#51648' '#50506#51020')'
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = 'DS'#44160#49324
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 35
                end
                object cmb_DoorDscheckTime1: TRzComboBox
                  Tag = 1
                  Left = 158
                  Top = 284
                  Width = 67
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 36
                  Text = '1'
                  Items.Strings = (
                    #54637#49345#44160#49324
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10')
                  ItemIndex = 1
                end
                object cmb_DoorDscheckTime2: TRzComboBox
                  Tag = 2
                  Left = 262
                  Top = 284
                  Width = 67
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 37
                  Text = '1'
                  Items.Strings = (
                    #54637#49345#44160#49324
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10')
                  ItemIndex = 1
                end
                object StaticText30: TStaticText
                  Left = 16
                  Top = 308
                  Width = 137
                  Height = 17
                  Hint = #45936#46300#48380#53944' '#49324#50857#49884' '#44221#44228#49884' DS/GND '#49345#53468#47484' '#44160#49324' '#50976#47924' '#49444#51221
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #44221#44228#49884#47928#50676#47548#44160#49324
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 38
                end
                object cmb_ArmDSCheck1: TRzComboBox
                  Tag = 1
                  Left = 158
                  Top = 306
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 39
                  Text = #49324#50857
                  OnChange = cmb_ArmDSCheck1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object cmb_ArmDSCheck2: TRzComboBox
                  Tag = 2
                  Left = 262
                  Top = 306
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 40
                  Text = #49324#50857
                  OnChange = cmb_ArmDSCheck1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object chk_ArmJavaraClose: TCheckBox
                  Left = 14
                  Top = 328
                  Width = 147
                  Height = 17
                  Hint = #44288#51228#49468#53552#50640#49436' '#51088#48148#46972' '#44221#44228#49884' '#51088#48148#46972' '#45803#55192' '#49324#50857#50976#47924' '#49444#51221
                  Caption = #44288#51228#44221#44228#49884#51088#48148#46972#45803#55192
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 41
                end
                object chk_JavaraAutoClose: TCheckBox
                  Left = 158
                  Top = 328
                  Width = 107
                  Height = 17
                  Hint = #51088#48148#46972' '#49828#52992#51460#50640' '#51032#54644' '#51088#48148#46972' '#51088#46041' '#45803#55192' '#50976#47924' '#49444#51221
                  Caption = #51088#48148#46972#51088#46041#45803#55192
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 42
                end
                object gb_JavaraStopTime: TGroupBox
                  Left = 376
                  Top = 43
                  Width = 153
                  Height = 102
                  Caption = #51088#48148#46972#51221#51648#51228#50612#49884#44036
                  TabOrder = 43
                  object Label504: TLabel
                    Left = 16
                    Top = 24
                    Width = 48
                    Height = 12
                    Caption = #50676#47548#51221#51648
                  end
                  object Label505: TLabel
                    Left = 16
                    Top = 48
                    Width = 48
                    Height = 12
                    Caption = #45803#55192#51221#51648
                  end
                  object Label506: TLabel
                    Left = 16
                    Top = 72
                    Width = 60
                    Height = 12
                    Caption = #51221#51648#54980#55092#51648
                  end
                  object Label507: TLabel
                    Left = 128
                    Top = 24
                    Width = 12
                    Height = 12
                    Caption = 'ms'
                  end
                  object Label508: TLabel
                    Left = 127
                    Top = 48
                    Width = 12
                    Height = 12
                    Caption = 'ms'
                  end
                  object Label509: TLabel
                    Left = 127
                    Top = 72
                    Width = 12
                    Height = 12
                    Caption = 'ms'
                  end
                  object ed_OpenStop: TEdit
                    Left = 80
                    Top = 20
                    Width = 41
                    Height = 20
                    ImeName = 'Microsoft IME 2010'
                    MaxLength = 5
                    TabOrder = 0
                    Text = '01000'
                  end
                  object ed_CloseStop: TEdit
                    Left = 80
                    Top = 44
                    Width = 41
                    Height = 20
                    ImeName = 'Microsoft IME 2010'
                    MaxLength = 5
                    TabOrder = 1
                    Text = '01000'
                  end
                  object ed_StopDelay: TEdit
                    Left = 80
                    Top = 68
                    Width = 41
                    Height = 20
                    ImeName = 'Microsoft IME 2010'
                    MaxLength = 5
                    TabOrder = 2
                    Text = '01000'
                  end
                end
              end
              object Panel12: TPanel
                Left = 0
                Top = 0
                Width = 836
                Height = 41
                Align = alTop
                Caption = #52968#53944#47204#47084#51032' '#52636#51077#47928' '#51221#48372' '#49444#51221' '#54868#47732#51077#45768#45796'.'
                Color = clGradientActiveCaption
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = #44404#47548#52404
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
            end
            object tabLockExtention: TTabSheet
              Caption = #46973#54869#51109
              ImageIndex = 1
              object gb_DoorExtensionInfo: TGroupBox
                Left = 0
                Top = 41
                Width = 836
                Height = 378
                Align = alClient
                Caption = #52636#51077#47928#51221#48372
                TabOrder = 0
                object Label31: TLabel
                  Left = 233
                  Top = 90
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object Label33: TLabel
                  Left = 233
                  Top = 112
                  Width = 12
                  Height = 12
                  Caption = #48516
                  Transparent = True
                end
                object Label32: TLabel
                  Left = 337
                  Top = 90
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object Label34: TLabel
                  Left = 337
                  Top = 112
                  Width = 12
                  Height = 12
                  Caption = #48516
                  Transparent = True
                end
                object Label35: TLabel
                  Left = 441
                  Top = 90
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object Label36: TLabel
                  Left = 441
                  Top = 112
                  Width = 12
                  Height = 12
                  Caption = #48516
                  Transparent = True
                end
                object Label37: TLabel
                  Left = 545
                  Top = 90
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object Label38: TLabel
                  Left = 545
                  Top = 112
                  Width = 12
                  Height = 12
                  Caption = #48516
                  Transparent = True
                end
                object Label39: TLabel
                  Left = 649
                  Top = 90
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object Label40: TLabel
                  Left = 649
                  Top = 112
                  Width = 12
                  Height = 12
                  Caption = #48516
                  Transparent = True
                end
                object Label41: TLabel
                  Left = 753
                  Top = 90
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object Label42: TLabel
                  Left = 753
                  Top = 112
                  Width = 12
                  Height = 12
                  Caption = #48516
                  Transparent = True
                end
                object Label45: TLabel
                  Left = 233
                  Top = 288
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object Label47: TLabel
                  Left = 337
                  Top = 288
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object Label48: TLabel
                  Left = 441
                  Top = 288
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object Label49: TLabel
                  Left = 545
                  Top = 288
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object Label50: TLabel
                  Left = 649
                  Top = 288
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object Label51: TLabel
                  Left = 753
                  Top = 288
                  Width = 12
                  Height = 12
                  Caption = #52488
                  Transparent = True
                end
                object RzPanel52: TRzPanel
                  Left = 158
                  Top = 14
                  Width = 100
                  Height = 25
                  Hint = #44048#51109#44592'1'#48264
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'3'
                  TabOrder = 0
                end
                object ComboBox_CardModeType3: TRzComboBox
                  Tag = 3
                  Left = 158
                  Top = 43
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 1
                  OnChange = ComboBox_CardModeType1Change
                end
                object StaticText127: TStaticText
                  Left = 16
                  Top = 66
                  Width = 137
                  Height = 17
                  Hint = 
                    #50868#50689#47784#46300' : '#52636#51077#47928#51060' '#45803#55176#47732' '#52636#51077#47928#51060' '#51104#44592#47728' '#45796#51020#44284' '#44057#51060' '#46041#51089#54632' '#13#10'                       - '#48120 +
                    #51064#51613' '#52852#46300' '#53468#44536#49884' '#52636#51077' '#48520#44032#13#10'                       - '#51064#51613' '#52852#46300' '#53468#44536#49884' '#52636#51077' '#54728#50857#13#10#44060#48169#47784#46300' ' +
                    ': '#52636#51077#47928#51060' '#45803#54784#46020' '#52636#51077#47928#51012' '#51104#44536#51648' '#50506#51020#13#10#54224#49604#47784#46300' : '#52636#51077#47928#51060' '#45803#55176#47732' '#52636#51077#47928#51060' '#51104#44592#47728' '#45796#51020#44284' '#44057#51060' '#46041#51089#54632#13#10'   ' +
                    '                    - '#48120#51064#51613' '#52852#46300' '#53468#44536#49884' '#52636#51077' '#48520#44032#13#10'                       -' +
                    ' '#51064#51613' '#52852#46300' '#53468#44536#49884' '#52636#51077' '#48520#44032#13#10'                       - '#53748#49892#48260#53948' '#52636#51077#54728#50857
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #52636#51077#47928' '#50868#50689#47784#46300
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                end
                object ComboBox_DoorModeType3: TRzComboBox
                  Tag = 3
                  Left = 158
                  Top = 64
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 3
                  OnChange = ComboBox_CardModeType1Change
                end
                object cmb_DoorControlTime3: TRzComboBox
                  Tag = 3
                  Left = 158
                  Top = 86
                  Width = 67
                  Height = 20
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 4
                  Text = '5'
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10'
                    '20'
                    '30'
                    '40'
                    '50'
                    '60'
                    '100'
                    '120'
                    '150'
                    '200'
                    '====='
                    '100ms'
                    '200ms'
                    '300ms'
                    '400ms'
                    '500ms'
                    '600ms'
                    '700ms'
                    '800ms'
                    '900ms')
                end
                object StaticText128: TStaticText
                  Left = 16
                  Top = 88
                  Width = 137
                  Height = 17
                  Hint = #52636#51077#47928#51060' '#50676#47140#51080#45716' '#49884#44036
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #52636#51077#47928' '#51104#44608' '#51648#50672#49884#44036
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 5
                end
                object StaticText129: TStaticText
                  Left = 16
                  Top = 110
                  Width = 137
                  Height = 17
                  Hint = #54644#45817' '#49884#44036' '#46041#50504' '#52636#51077#47928#51060' '#50676#47140' '#51080#45716' '#44221#50864' '#51109#49884#44036' '#50676#47548' '#51060#48292#53944' '#48156#49373
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #51109#49884#44036' '#50676#47548' '#51060#48292#53944
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 6
                end
                object ComboBox_SendDoorStatus3: TRzComboBox
                  Tag = 3
                  Left = 158
                  Top = 152
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 7
                  OnChange = ComboBox_CardModeType1Change
                end
                object StaticText130: TStaticText
                  Left = 16
                  Top = 154
                  Width = 137
                  Height = 17
                  Hint = #52636#51077#47928' '#49345#53468' '#48320#44221#49884' PC'#50640' '#49345#53468' '#51204#49569' '#50668#48512' '#49444#51221
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #52636#51077#47928' '#49345#53468#51204#49569
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 8
                end
                object ComboBox_AlarmLongOpen3: TRzComboBox
                  Tag = 3
                  Left = 158
                  Top = 130
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 9
                  OnChange = ComboBox_CardModeType1Change
                end
                object StaticText131: TStaticText
                  Left = 16
                  Top = 132
                  Width = 137
                  Height = 17
                  Hint = #51109#49884#44036' '#50676#47548' '#51060#48292#53944' '#48156#49373#49884' '#52852#46300#47532#45908#50640#49436' '#48708#54532#51020' '#48156#49373' '#50668#48512' '#49324#50857#50976#47924
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #51109#49884#44036' '#50676#47548' '#44221#44256#51020
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 10
                end
                object ComboBox_ControlFire3: TRzComboBox
                  Tag = 3
                  Left = 158
                  Top = 196
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 11
                  OnChange = ComboBox_CardModeType1Change
                end
                object StaticText132: TStaticText
                  Left = 16
                  Top = 198
                  Width = 137
                  Height = 17
                  Hint = #54868#51116#49884' '#52636#51077#47928' '#44060#48169' '#50668#48512' '#49444#51221
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #54868#51116#48156#49373#49884' '#47928#50676#47548
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 12
                end
                object ComboBox_LockType3: TRzComboBox
                  Tag = 3
                  Left = 158
                  Top = 218
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  DropDownWidth = 200
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 13
                  OnChange = ComboBox_CardModeType1Change
                  OnEnter = ComboBox_LockType1Enter
                  OnExit = ComboBox_LockType1Exit
                end
                object cmb_DsOpenState3: TRzComboBox
                  Tag = 3
                  Left = 158
                  Top = 240
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 14
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    ''
                    'DS OPEN'
                    'DS CLOSE')
                end
                object cmb_RemoteDoorOpen3: TRzComboBox
                  Tag = 3
                  Left = 158
                  Top = 262
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 15
                  Text = #49324#50857
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object StaticText133: TStaticText
                  Left = 16
                  Top = 220
                  Width = 137
                  Height = 17
                  Hint = 'EM'#46973'('#51221#51204#49884#51104#44608') : 0V '#51064#44032#49884' '#52636#51077#47928' '#51104#44552'/12V '#51064#44032#49884' '#52636#51077#47928' '#50676#47548
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #46020#50612#46973' '#53440#51077
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 16
                end
                object StaticText134: TStaticText
                  Left = 16
                  Top = 242
                  Width = 137
                  Height = 17
                  Hint = 'DS OPEN : DS/GND '#50724#54536#49884' '#52636#51077#47928' '#50676#47548#51004#47196' '#51064#49885
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #52636#51077#47928#50676#47548#49345#53468
                  TabOrder = 17
                end
                object StaticText135: TStaticText
                  Left = 16
                  Top = 264
                  Width = 137
                  Height = 17
                  Hint = #50896#44201#54644#51228#49884' '#47928#50676#47548' '#49324#50857#50976#47924' '#49444#51221
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #50896#44201#54644#51228#49884' '#47928#50676#47548
                  TabOrder = 18
                end
                object StaticText136: TStaticText
                  Left = 16
                  Top = 45
                  Width = 137
                  Height = 17
                  Hint = 
                    'Positive : '#51221#49345' '#50868#50689#47784#46300#49884' '#49324#50857' '#54616#45716' '#47784#46300#47196' '#45796#51020#44284' '#44057#51060' '#46041#51089#54632#13#10'                      ' +
                    ' - '#48120#51064#51613' '#52852#46300' '#53468#44536#49884' '#52636#51077' '#48520#44032#13#10'                       - '#51064#51613' '#52852#46300' '#53468#44536#49884' '#52636#51077' '#54728#50857#13#10'N' +
                    'egative : '#44592#44592#44368#52404' '#46608#45716' '#44277#49324#51473' '#49324#50857' '#54616#45716' '#47784#46300#47196' '#45796#51020#44284' '#44057#51060' '#46041#51089#54632#13#10'                    ' +
                    '   - '#48120#51064#51613' '#52852#46300' '#53468#44536#49884' '#52636#51077' '#54728#50857' '
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #52852#46300' '#50868#50689#47784#46300
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 19
                end
                object SpinEdit_OpenMoni3: TRzSpinEdit
                  Tag = 3
                  Left = 158
                  Top = 108
                  Width = 67
                  Height = 20
                  AllowKeyEdit = True
                  Max = 60.000000000000000000
                  Alignment = taLeftJustify
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 20
                  OnChange = ComboBox_CardModeType1Change
                end
                object StaticText137: TStaticText
                  Left = 16
                  Top = 176
                  Width = 137
                  Height = 17
                  Hint = #52636#51077#47928' '#49828#52992#51460' '#49324#50857#50976#47924
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #49828#52992#51460#51201#50857#50976#47924
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 21
                end
                object ComboBox_UseSch3: TRzComboBox
                  Tag = 3
                  Left = 158
                  Top = 174
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 22
                  OnChange = ComboBox_CardModeType1Change
                end
                object RzPanel53: TRzPanel
                  Left = 262
                  Top = 14
                  Width = 100
                  Height = 25
                  Hint = #44048#51109#44592'2'#48264
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'4'
                  TabOrder = 23
                end
                object ComboBox_CardModeType4: TRzComboBox
                  Tag = 4
                  Left = 262
                  Top = 43
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 24
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_DoorModeType4: TRzComboBox
                  Tag = 4
                  Left = 262
                  Top = 64
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 25
                  OnChange = ComboBox_CardModeType1Change
                end
                object cmb_DoorControlTime4: TRzComboBox
                  Tag = 4
                  Left = 262
                  Top = 86
                  Width = 67
                  Height = 20
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 26
                  Text = '5'
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10'
                    '20'
                    '30'
                    '40'
                    '50'
                    '60'
                    '100'
                    '120'
                    '150'
                    '200'
                    '====='
                    '100ms'
                    '200ms'
                    '300ms'
                    '400ms'
                    '500ms'
                    '600ms'
                    '700ms'
                    '800ms'
                    '900ms')
                end
                object SpinEdit_OpenMoni4: TRzSpinEdit
                  Tag = 4
                  Left = 262
                  Top = 108
                  Width = 67
                  Height = 20
                  AllowKeyEdit = True
                  Max = 60.000000000000000000
                  Alignment = taLeftJustify
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 27
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_AlarmLongOpen4: TRzComboBox
                  Tag = 4
                  Left = 262
                  Top = 130
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 28
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_SendDoorStatus4: TRzComboBox
                  Tag = 4
                  Left = 262
                  Top = 152
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 29
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_UseSch4: TRzComboBox
                  Tag = 4
                  Left = 262
                  Top = 174
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 30
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_ControlFire4: TRzComboBox
                  Tag = 4
                  Left = 262
                  Top = 196
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 31
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_LockType4: TRzComboBox
                  Tag = 4
                  Left = 262
                  Top = 218
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  DropDownWidth = 200
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 32
                  OnChange = ComboBox_CardModeType1Change
                  OnEnter = ComboBox_LockType1Enter
                  OnExit = ComboBox_LockType1Exit
                end
                object cmb_DsOpenState4: TRzComboBox
                  Tag = 4
                  Left = 262
                  Top = 240
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 33
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    ''
                    'DS OPEN'
                    'DS CLOSE')
                end
                object cmb_RemoteDoorOpen4: TRzComboBox
                  Tag = 4
                  Left = 262
                  Top = 262
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 34
                  Text = #49324#50857
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object RzPanel54: TRzPanel
                  Left = 366
                  Top = 14
                  Width = 100
                  Height = 25
                  Hint = #44048#51109#44592'3'#48264
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'5'
                  TabOrder = 35
                end
                object ComboBox_CardModeType5: TRzComboBox
                  Tag = 5
                  Left = 366
                  Top = 43
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 36
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_DoorModeType5: TRzComboBox
                  Tag = 5
                  Left = 366
                  Top = 64
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 37
                  OnChange = ComboBox_CardModeType1Change
                end
                object cmb_DoorControlTime5: TRzComboBox
                  Tag = 5
                  Left = 366
                  Top = 86
                  Width = 67
                  Height = 20
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 38
                  Text = '5'
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10'
                    '20'
                    '30'
                    '40'
                    '50'
                    '60'
                    '100'
                    '120'
                    '150'
                    '200'
                    '====='
                    '100ms'
                    '200ms'
                    '300ms'
                    '400ms'
                    '500ms'
                    '600ms'
                    '700ms'
                    '800ms'
                    '900ms')
                end
                object SpinEdit_OpenMoni5: TRzSpinEdit
                  Tag = 5
                  Left = 366
                  Top = 108
                  Width = 67
                  Height = 20
                  AllowKeyEdit = True
                  Max = 60.000000000000000000
                  Alignment = taLeftJustify
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 39
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_AlarmLongOpen5: TRzComboBox
                  Tag = 5
                  Left = 366
                  Top = 130
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 40
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_SendDoorStatus5: TRzComboBox
                  Tag = 5
                  Left = 366
                  Top = 152
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 41
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_UseSch5: TRzComboBox
                  Tag = 5
                  Left = 366
                  Top = 174
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 42
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_ControlFire5: TRzComboBox
                  Tag = 5
                  Left = 366
                  Top = 196
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 43
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_LockType5: TRzComboBox
                  Tag = 5
                  Left = 366
                  Top = 218
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  DropDownWidth = 200
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 44
                  OnChange = ComboBox_CardModeType1Change
                  OnEnter = ComboBox_LockType1Enter
                  OnExit = ComboBox_LockType1Exit
                end
                object cmb_DsOpenState5: TRzComboBox
                  Tag = 5
                  Left = 366
                  Top = 240
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 45
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    ''
                    'DS OPEN'
                    'DS CLOSE')
                end
                object cmb_RemoteDoorOpen5: TRzComboBox
                  Tag = 5
                  Left = 366
                  Top = 262
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 46
                  Text = #49324#50857
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object RzPanel55: TRzPanel
                  Left = 470
                  Top = 14
                  Width = 100
                  Height = 25
                  Hint = #44048#51109#44592'4'#48264
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'6'
                  TabOrder = 47
                end
                object ComboBox_CardModeType6: TRzComboBox
                  Tag = 6
                  Left = 470
                  Top = 43
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 48
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_DoorModeType6: TRzComboBox
                  Tag = 6
                  Left = 470
                  Top = 64
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 49
                  OnChange = ComboBox_CardModeType1Change
                end
                object cmb_DoorControlTime6: TRzComboBox
                  Tag = 6
                  Left = 470
                  Top = 86
                  Width = 67
                  Height = 20
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 50
                  Text = '5'
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10'
                    '20'
                    '30'
                    '40'
                    '50'
                    '60'
                    '100'
                    '120'
                    '150'
                    '200'
                    '====='
                    '100ms'
                    '200ms'
                    '300ms'
                    '400ms'
                    '500ms'
                    '600ms'
                    '700ms'
                    '800ms'
                    '900ms')
                end
                object SpinEdit_OpenMoni6: TRzSpinEdit
                  Tag = 6
                  Left = 470
                  Top = 108
                  Width = 67
                  Height = 20
                  AllowKeyEdit = True
                  Max = 60.000000000000000000
                  Alignment = taLeftJustify
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 51
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_AlarmLongOpen6: TRzComboBox
                  Tag = 6
                  Left = 470
                  Top = 130
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 52
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_SendDoorStatus6: TRzComboBox
                  Tag = 6
                  Left = 470
                  Top = 152
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 53
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_UseSch6: TRzComboBox
                  Tag = 6
                  Left = 470
                  Top = 174
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 54
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_ControlFire6: TRzComboBox
                  Tag = 6
                  Left = 470
                  Top = 196
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 55
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_LockType6: TRzComboBox
                  Tag = 6
                  Left = 470
                  Top = 218
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  DropDownWidth = 200
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 56
                  OnChange = ComboBox_CardModeType1Change
                  OnEnter = ComboBox_LockType1Enter
                  OnExit = ComboBox_LockType1Exit
                end
                object cmb_DsOpenState6: TRzComboBox
                  Tag = 6
                  Left = 470
                  Top = 240
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 57
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    ''
                    'DS OPEN'
                    'DS CLOSE')
                end
                object cmb_RemoteDoorOpen6: TRzComboBox
                  Tag = 6
                  Left = 470
                  Top = 262
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 58
                  Text = #49324#50857
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object RzPanel56: TRzPanel
                  Left = 574
                  Top = 14
                  Width = 100
                  Height = 25
                  Hint = #44048#51109#44592'5'#48264
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'7'
                  TabOrder = 59
                end
                object ComboBox_CardModeType7: TRzComboBox
                  Tag = 7
                  Left = 574
                  Top = 43
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 60
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_DoorModeType7: TRzComboBox
                  Tag = 7
                  Left = 574
                  Top = 64
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 61
                  OnChange = ComboBox_CardModeType1Change
                end
                object cmb_DoorControlTime7: TRzComboBox
                  Tag = 7
                  Left = 574
                  Top = 86
                  Width = 67
                  Height = 20
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 62
                  Text = '5'
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10'
                    '20'
                    '30'
                    '40'
                    '50'
                    '60'
                    '100'
                    '120'
                    '150'
                    '200'
                    '====='
                    '100ms'
                    '200ms'
                    '300ms'
                    '400ms'
                    '500ms'
                    '600ms'
                    '700ms'
                    '800ms'
                    '900ms')
                end
                object SpinEdit_OpenMoni7: TRzSpinEdit
                  Tag = 7
                  Left = 574
                  Top = 108
                  Width = 67
                  Height = 20
                  AllowKeyEdit = True
                  Max = 60.000000000000000000
                  Alignment = taLeftJustify
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 63
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_AlarmLongOpen7: TRzComboBox
                  Tag = 7
                  Left = 574
                  Top = 130
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 64
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_SendDoorStatus7: TRzComboBox
                  Tag = 7
                  Left = 574
                  Top = 152
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 65
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_UseSch7: TRzComboBox
                  Tag = 7
                  Left = 574
                  Top = 174
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 66
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_ControlFire7: TRzComboBox
                  Tag = 7
                  Left = 574
                  Top = 196
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 67
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_LockType7: TRzComboBox
                  Tag = 7
                  Left = 574
                  Top = 218
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  DropDownWidth = 200
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 68
                  OnChange = ComboBox_CardModeType1Change
                  OnEnter = ComboBox_LockType1Enter
                  OnExit = ComboBox_LockType1Exit
                end
                object cmb_DsOpenState7: TRzComboBox
                  Tag = 7
                  Left = 574
                  Top = 240
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 69
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    ''
                    'DS OPEN'
                    'DS CLOSE')
                end
                object cmb_RemoteDoorOpen7: TRzComboBox
                  Tag = 7
                  Left = 574
                  Top = 262
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 70
                  Text = #49324#50857
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object RzPanel57: TRzPanel
                  Left = 678
                  Top = 14
                  Width = 100
                  Height = 25
                  Hint = #44048#51109#44592'8'#48264
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'8'
                  TabOrder = 71
                end
                object ComboBox_CardModeType8: TRzComboBox
                  Tag = 8
                  Left = 678
                  Top = 43
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 72
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_DoorModeType8: TRzComboBox
                  Tag = 8
                  Left = 678
                  Top = 64
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 73
                  OnChange = ComboBox_CardModeType1Change
                end
                object cmb_DoorControlTime8: TRzComboBox
                  Tag = 8
                  Left = 678
                  Top = 86
                  Width = 67
                  Height = 20
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 74
                  Text = '5'
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10'
                    '20'
                    '30'
                    '40'
                    '50'
                    '60'
                    '100'
                    '120'
                    '150'
                    '200'
                    '====='
                    '100ms'
                    '200ms'
                    '300ms'
                    '400ms'
                    '500ms'
                    '600ms'
                    '700ms'
                    '800ms'
                    '900ms')
                end
                object SpinEdit_OpenMoni8: TRzSpinEdit
                  Tag = 8
                  Left = 678
                  Top = 108
                  Width = 67
                  Height = 20
                  AllowKeyEdit = True
                  Max = 60.000000000000000000
                  Alignment = taLeftJustify
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  TabOrder = 75
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_AlarmLongOpen8: TRzComboBox
                  Tag = 8
                  Left = 678
                  Top = 130
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 76
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_SendDoorStatus8: TRzComboBox
                  Tag = 8
                  Left = 678
                  Top = 152
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 77
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_UseSch8: TRzComboBox
                  Tag = 8
                  Left = 678
                  Top = 174
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 78
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_ControlFire8: TRzComboBox
                  Tag = 8
                  Left = 678
                  Top = 196
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 79
                  OnChange = ComboBox_CardModeType1Change
                end
                object ComboBox_LockType8: TRzComboBox
                  Tag = 8
                  Left = 678
                  Top = 218
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  DropDownWidth = 200
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 80
                  OnChange = ComboBox_CardModeType1Change
                  OnEnter = ComboBox_LockType1Enter
                  OnExit = ComboBox_LockType1Exit
                end
                object cmb_DsOpenState8: TRzComboBox
                  Tag = 8
                  Left = 678
                  Top = 240
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 81
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    ''
                    'DS OPEN'
                    'DS CLOSE')
                end
                object cmb_RemoteDoorOpen8: TRzComboBox
                  Tag = 8
                  Left = 678
                  Top = 262
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 82
                  Text = #49324#50857
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object cmb_DoorDscheckTime3: TRzComboBox
                  Tag = 3
                  Left = 158
                  Top = 284
                  Width = 67
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 83
                  Text = '1'
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    #54637#49345#44160#49324
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10')
                  ItemIndex = 1
                end
                object st_DoorDSCheck2: TStaticText
                  Left = 16
                  Top = 286
                  Width = 137
                  Height = 17
                  Hint = #45936#46300#48380#53944' '#46973' '#51104#44608' '#54980' DS '#44160#49324#47484' '#54616#45716#49884#44036'('#49884#44036#51060' '#44221#44284#54980' DS'#44160#49324#47484' '#54616#51648' '#50506#51020')'
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = 'DS'#44160#49324
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 84
                end
                object cmb_DoorDscheckTime4: TRzComboBox
                  Tag = 4
                  Left = 262
                  Top = 284
                  Width = 67
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 85
                  Text = '1'
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    #54637#49345#44160#49324
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10')
                  ItemIndex = 1
                end
                object cmb_DoorDscheckTime5: TRzComboBox
                  Tag = 5
                  Left = 366
                  Top = 284
                  Width = 67
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 86
                  Text = '1'
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    #54637#49345#44160#49324
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10')
                  ItemIndex = 1
                end
                object cmb_DoorDscheckTime6: TRzComboBox
                  Tag = 6
                  Left = 470
                  Top = 284
                  Width = 67
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 87
                  Text = '1'
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    #54637#49345#44160#49324
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10')
                  ItemIndex = 1
                end
                object cmb_DoorDscheckTime7: TRzComboBox
                  Tag = 7
                  Left = 574
                  Top = 284
                  Width = 67
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 88
                  Text = '1'
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    #54637#49345#44160#49324
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10')
                  ItemIndex = 1
                end
                object cmb_DoorDscheckTime8: TRzComboBox
                  Tag = 8
                  Left = 678
                  Top = 284
                  Width = 67
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 89
                  Text = '1'
                  OnChange = ComboBox_CardModeType1Change
                  Items.Strings = (
                    #54637#49345#44160#49324
                    '1'
                    '2'
                    '3'
                    '4'
                    '5'
                    '6'
                    '7'
                    '8'
                    '9'
                    '10')
                  ItemIndex = 1
                end
                object StaticText218: TStaticText
                  Left = 16
                  Top = 308
                  Width = 137
                  Height = 17
                  Hint = #45936#46300#48380#53944' '#49324#50857#49884' '#44221#44228#49884' DS/GND '#49345#53468#47484' '#44160#49324' '#50976#47924' '#49444#51221
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #44221#44228#49884#47928#50676#47548#44160#49324
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 90
                end
                object cmb_ArmDSCheck3: TRzComboBox
                  Tag = 3
                  Left = 158
                  Top = 306
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 91
                  Text = #49324#50857
                  OnChange = cmb_ArmDSCheck1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object cmb_ArmDSCheck4: TRzComboBox
                  Tag = 4
                  Left = 262
                  Top = 306
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 92
                  Text = #49324#50857
                  OnChange = cmb_ArmDSCheck1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object cmb_ArmDSCheck5: TRzComboBox
                  Tag = 5
                  Left = 366
                  Top = 306
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 93
                  Text = #49324#50857
                  OnChange = cmb_ArmDSCheck1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object cmb_ArmDSCheck6: TRzComboBox
                  Tag = 6
                  Left = 470
                  Top = 306
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 94
                  Text = #49324#50857
                  OnChange = cmb_ArmDSCheck1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object cmb_ArmDSCheck7: TRzComboBox
                  Tag = 7
                  Left = 574
                  Top = 306
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 95
                  Text = #49324#50857
                  OnChange = cmb_ArmDSCheck1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
                object cmb_ArmDSCheck8: TRzComboBox
                  Tag = 8
                  Left = 678
                  Top = 306
                  Width = 100
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  TabOrder = 96
                  Text = #49324#50857
                  OnChange = cmb_ArmDSCheck1Change
                  Items.Strings = (
                    #48120#49324#50857
                    #49324#50857)
                  ItemIndex = 1
                end
              end
              object Panel11: TPanel
                Left = 0
                Top = 0
                Width = 836
                Height = 41
                Align = alTop
                Caption = #44048#51109#44592#51032' '#46373#49828#50948#52824#44032' 1'#48264#51060' '#52636#51077#47928'3'#51077#45768#45796'.('#54869#51109#44592' 7'#48264',8'#48264#51008' '#49324#50857#48520#44032')'
                Color = clGradientActiveCaption
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = #44404#47548#52404
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
            end
          end
        end
        object tab_TimeCode: TTabSheet
          Caption = #53440#51076#53076#46300#49444#51221
          ImageIndex = 11
          object gb_TimeCodeGroup: TGroupBox
            Left = 6
            Top = 80
            Width = 299
            Height = 73
            Caption = #53440#51076#53076#46300#44536#47353' 1 / 2'
            TabOrder = 0
            object Label478: TLabel
              Left = 1
              Top = 20
              Width = 6
              Height = 12
              Caption = '1'
            end
            object Label479: TLabel
              Left = 72
              Top = 20
              Width = 6
              Height = 12
              Caption = '2'
            end
            object Label480: TLabel
              Left = 144
              Top = 20
              Width = 6
              Height = 12
              Caption = '3'
            end
            object Label481: TLabel
              Left = 216
              Top = 20
              Width = 6
              Height = 12
              Caption = '4'
            end
            object Label482: TLabel
              Left = 1
              Top = 44
              Width = 6
              Height = 12
              Caption = '1'
            end
            object Label483: TLabel
              Left = 72
              Top = 44
              Width = 6
              Height = 12
              Caption = '2'
            end
            object Label484: TLabel
              Left = 144
              Top = 44
              Width = 6
              Height = 12
              Caption = '3'
            end
            object Label485: TLabel
              Left = 216
              Top = 44
              Width = 6
              Height = 12
              Caption = '4'
            end
            object ed_TimeCode01Start: TEdit
              Left = 8
              Top = 16
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 0
              Text = '0000'
            end
            object ed_TimeCode01End: TEdit
              Left = 40
              Top = 16
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 1
              Text = '0000'
            end
            object ed_TimeCode02Start: TEdit
              Left = 80
              Top = 16
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 2
              Text = '0000'
            end
            object ed_TimeCode02End: TEdit
              Left = 112
              Top = 16
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 3
              Text = '0000'
            end
            object ed_TimeCode03Start: TEdit
              Left = 152
              Top = 16
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 4
              Text = '0000'
            end
            object ed_TimeCode03End: TEdit
              Left = 184
              Top = 16
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 5
              Text = '0000'
            end
            object ed_TimeCode04Start: TEdit
              Left = 224
              Top = 16
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 6
              Text = '0000'
            end
            object ed_TimeCode04End: TEdit
              Left = 256
              Top = 16
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 7
              Text = '0000'
            end
            object ed_TimeCode11Start: TEdit
              Left = 8
              Top = 40
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 8
              Text = '0000'
            end
            object ed_TimeCode11End: TEdit
              Left = 40
              Top = 40
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 9
              Text = '0000'
            end
            object ed_TimeCode12Start: TEdit
              Left = 80
              Top = 40
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 10
              Text = '0000'
            end
            object ed_TimeCode12End: TEdit
              Left = 112
              Top = 40
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 11
              Text = '0000'
            end
            object ed_TimeCode13Start: TEdit
              Left = 152
              Top = 40
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 12
              Text = '0000'
            end
            object ed_TimeCode13End: TEdit
              Left = 184
              Top = 40
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 13
              Text = '0000'
            end
            object ed_TimeCode14Start: TEdit
              Left = 224
              Top = 40
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 14
              Text = '0000'
            end
            object ed_TimeCode14End: TEdit
              Left = 256
              Top = 40
              Width = 33
              Height = 20
              ImeName = 'Microsoft IME 2010'
              MaxLength = 4
              TabOrder = 15
              Text = '0000'
            end
          end
          object gb_TimeCodeUse: TGroupBox
            Left = 6
            Top = 24
            Width = 299
            Height = 41
            Caption = #53440#51076#53076#46300#49324#50857#50976#47924'('#47928#48264#54840')'
            TabOrder = 1
            object chk_TimeDoor1: TCheckBox
              Left = 8
              Top = 16
              Width = 33
              Height = 17
              Caption = '1'
              TabOrder = 0
            end
            object chk_TimeDoor2: TCheckBox
              Left = 40
              Top = 16
              Width = 33
              Height = 17
              Caption = '2'
              TabOrder = 1
            end
            object chk_TimeDoor3: TCheckBox
              Left = 72
              Top = 16
              Width = 33
              Height = 17
              Caption = '3'
              TabOrder = 2
            end
            object chk_TimeDoor4: TCheckBox
              Left = 104
              Top = 16
              Width = 33
              Height = 17
              Caption = '4'
              TabOrder = 3
            end
            object chk_TimeDoor5: TCheckBox
              Left = 136
              Top = 16
              Width = 33
              Height = 17
              Caption = '5'
              TabOrder = 4
            end
            object chk_TimeDoor6: TCheckBox
              Left = 168
              Top = 16
              Width = 33
              Height = 17
              Caption = '6'
              TabOrder = 5
            end
            object chk_TimeDoor7: TCheckBox
              Left = 200
              Top = 16
              Width = 33
              Height = 17
              Caption = '7'
              TabOrder = 6
            end
            object chk_TimeDoor8: TCheckBox
              Left = 232
              Top = 16
              Width = 33
              Height = 17
              Caption = '8'
              TabOrder = 7
            end
          end
        end
        object Tab_CardReaderTel: TTabSheet
          Caption = #52852#46300#47532#45908#51204#54868#48264#54840
          ImageIndex = 5
          object gb_cardReaderTel: TGroupBox
            Left = 24
            Top = 56
            Width = 345
            Height = 305
            Caption = #52852#46300#47532#45908' '#51204#54868#48264#54840
            TabOrder = 0
            object ed_cardreaderTel1: TEdit
              Left = 86
              Top = 53
              Width = 241
              Height = 20
              Hint = '1'
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 0
              OnKeyUp = ed_cardreaderTel1KeyUp
            end
            object RzPanel16: TRzPanel
              Left = 14
              Top = 22
              Width = 67
              Height = 25
              BorderOuter = fsButtonDown
              Caption = #48260#53948#48264#54840
              TabOrder = 1
            end
            object RzPanel17: TRzPanel
              Left = 86
              Top = 22
              Width = 241
              Height = 25
              BorderOuter = fsButtonDown
              Caption = #46321#47197#51204#54868#48264#54840
              TabOrder = 2
            end
            object StaticText33: TStaticText
              Left = 15
              Top = 55
              Width = 65
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = '1'
              Color = 16776176
              ParentColor = False
              TabOrder = 3
            end
            object StaticText34: TStaticText
              Left = 15
              Top = 79
              Width = 65
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = '2'
              Color = 16776176
              ParentColor = False
              TabOrder = 4
            end
            object StaticText35: TStaticText
              Left = 15
              Top = 103
              Width = 65
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = '3'
              Color = 16776176
              ParentColor = False
              TabOrder = 5
            end
            object StaticText36: TStaticText
              Left = 15
              Top = 127
              Width = 65
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = '4'
              Color = 16776176
              ParentColor = False
              TabOrder = 6
            end
            object StaticText43: TStaticText
              Left = 15
              Top = 151
              Width = 65
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = '5'
              Color = 16776176
              ParentColor = False
              TabOrder = 7
            end
            object StaticText44: TStaticText
              Left = 15
              Top = 176
              Width = 65
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = '6'
              Color = 16776176
              ParentColor = False
              TabOrder = 8
            end
            object StaticText46: TStaticText
              Left = 15
              Top = 200
              Width = 65
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = '7'
              Color = 16776176
              ParentColor = False
              TabOrder = 9
            end
            object StaticText52: TStaticText
              Left = 15
              Top = 224
              Width = 65
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = '8'
              Color = 16776176
              ParentColor = False
              TabOrder = 10
            end
            object StaticText53: TStaticText
              Left = 15
              Top = 248
              Width = 65
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = '9'
              Color = 16776176
              ParentColor = False
              TabOrder = 11
            end
            object ed_cardreaderTel2: TEdit
              Left = 86
              Top = 77
              Width = 241
              Height = 20
              Hint = '2'
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 12
              OnKeyUp = ed_cardreaderTel1KeyUp
            end
            object ed_cardreaderTel3: TEdit
              Left = 86
              Top = 101
              Width = 241
              Height = 20
              Hint = '3'
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 13
              OnKeyUp = ed_cardreaderTel1KeyUp
            end
            object ed_cardreaderTel4: TEdit
              Left = 86
              Top = 125
              Width = 241
              Height = 20
              Hint = '4'
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 14
              OnKeyUp = ed_cardreaderTel1KeyUp
            end
            object ed_cardreaderTel5: TEdit
              Left = 86
              Top = 149
              Width = 241
              Height = 20
              Hint = '5'
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 15
              OnKeyUp = ed_cardreaderTel1KeyUp
            end
            object ed_cardreaderTel6: TEdit
              Left = 86
              Top = 174
              Width = 241
              Height = 20
              Hint = '6'
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 16
              OnKeyUp = ed_cardreaderTel1KeyUp
            end
            object ed_cardreaderTel7: TEdit
              Left = 86
              Top = 198
              Width = 241
              Height = 20
              Hint = '7'
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 17
              OnKeyUp = ed_cardreaderTel1KeyUp
            end
            object ed_cardreaderTel8: TEdit
              Left = 86
              Top = 222
              Width = 241
              Height = 20
              Hint = '8'
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 18
              OnKeyUp = ed_cardreaderTel1KeyUp
            end
            object ed_cardreaderTel9: TEdit
              Left = 86
              Top = 246
              Width = 241
              Height = 20
              Hint = '9'
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 19
              OnKeyUp = ed_cardreaderTel1KeyUp
            end
            object StaticText54: TStaticText
              Left = 15
              Top = 273
              Width = 65
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = '0'
              Color = 16776176
              ParentColor = False
              TabOrder = 20
            end
            object ed_cardreaderTel0: TEdit
              Left = 86
              Top = 271
              Width = 241
              Height = 20
              Hint = '0'
              AutoSize = False
              BevelKind = bkFlat
              Enabled = False
              ImeName = 'Microsoft IME 2003'
              TabOrder = 21
              OnKeyUp = ed_cardreaderTel1KeyUp
            end
          end
          object Panel6: TPanel
            Left = 24
            Top = 8
            Width = 345
            Height = 41
            BevelInner = bvLowered
            TabOrder = 1
            object Label10: TLabel
              Left = 16
              Top = 16
              Width = 96
              Height = 12
              Caption = #52852#46300#47532#45908#53685#54868#49884#44036
            end
            object Label14: TLabel
              Left = 208
              Top = 16
              Width = 12
              Height = 12
              Caption = #52488
            end
            object se_crCallTime: TRzSpinEdit
              Left = 134
              Top = 13
              Width = 67
              Height = 20
              AllowKeyEdit = True
              Max = 999.000000000000000000
              Value = 180.000000000000000000
              Alignment = taLeftJustify
              FlatButtons = True
              FrameVisible = True
              ImeName = 'Microsoft IME 2003'
              TabOrder = 0
              OnChange = ComboBox_CardModeType1Change
              OnKeyUp = se_crCallTimeKeyUp
            end
          end
        end
        object tab_Police: TTabSheet
          Caption = #44221#52272#52397#51204#54868#48264#54840#46321#47197
          ImageIndex = 10
          TabVisible = False
          object GroupBox20: TGroupBox
            Left = 24
            Top = 16
            Width = 657
            Height = 57
            Caption = #51020#49452#44288#51228#48264#54840'1'
            TabOrder = 0
            object StaticText168: TStaticText
              Left = 15
              Top = 23
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #51204#54868#48264#54840
              Color = 16776176
              ParentColor = False
              TabOrder = 0
            end
            object ed_TelMonitorNum1: TEdit
              Left = 127
              Top = 21
              Width = 138
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 1
            end
            object StaticText169: TStaticText
              Left = 287
              Top = 23
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #51020#49457#49569#52636#49884#44036
              Color = 16776176
              ParentColor = False
              TabOrder = 2
            end
            object ed_TelMonitorsendTime1: TEdit
              Left = 399
              Top = 21
              Width = 57
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 3
              Text = '060'
            end
            object StaticText170: TStaticText
              Left = 15
              Top = 47
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #51020#49457#49884#51089#45824#44592
              Color = 16776176
              ParentColor = False
              TabOrder = 4
              Visible = False
            end
            object ed_TelMonitorStartDelay1: TEdit
              Left = 127
              Top = 45
              Width = 58
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 5
              Text = '001'
              Visible = False
            end
            object StaticText171: TStaticText
              Left = 287
              Top = 47
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #51020#49457#49569#52636#54943#49688
              Color = 16776176
              ParentColor = False
              TabOrder = 6
              Visible = False
            end
            object ed_TelMonitorsendCount1: TEdit
              Left = 399
              Top = 45
              Width = 57
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 7
              Text = '010'
              Visible = False
            end
            object StaticText172: TStaticText
              Left = 15
              Top = 71
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #49828#54588#52964
              Color = 16776176
              ParentColor = False
              TabOrder = 8
              Visible = False
            end
            object cmb_TelMonitorsSpeaker1: TRzComboBox
              Left = 128
              Top = 69
              Width = 57
              Height = 20
              Style = csDropDownList
              DropDownCount = 33
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 9
              Text = 'OFF'
              Visible = False
              Items.Strings = (
                'OFF'
                'ON')
              ItemIndex = 0
            end
            object StaticText173: TStaticText
              Left = 287
              Top = 71
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #54943#49688'/'#49884#44036
              Color = 16776176
              ParentColor = False
              TabOrder = 10
              Visible = False
            end
            object cmb_TelMonitorCountTime1: TRzComboBox
              Left = 400
              Top = 69
              Width = 57
              Height = 20
              Style = csDropDownList
              DropDownCount = 33
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 11
              Text = #49884#44036
              Visible = False
              Items.Strings = (
                #54943#49688
                #49884#44036)
              ItemIndex = 1
            end
            object StaticText174: TStaticText
              Left = 15
              Top = 95
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = 'DTMF'#49884#51089
              Color = 16776176
              ParentColor = False
              TabOrder = 12
              Visible = False
            end
            object cmb_TelMonitorDTMFStart1: TRzComboBox
              Left = 128
              Top = 93
              Width = 57
              Height = 20
              Style = csDropDownList
              DropDownCount = 33
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 13
              Text = 'OFF'
              Visible = False
              Items.Strings = (
                'OFF'
                'ON')
              ItemIndex = 0
            end
            object StaticText175: TStaticText
              Left = 287
              Top = 95
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = 'DTMF'#51333#47308
              Color = 16776176
              ParentColor = False
              TabOrder = 14
              Visible = False
            end
            object cmb_TelMonitorDTMFEnd1: TRzComboBox
              Left = 400
              Top = 93
              Width = 57
              Height = 20
              Style = csDropDownList
              DropDownCount = 33
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 15
              Text = 'OFF'
              Visible = False
              Items.Strings = (
                'OFF'
                'ON')
              ItemIndex = 0
            end
            object StaticText184: TStaticText
              Left = 463
              Top = 23
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #51020#49457#48264#54840
              Color = 16776176
              ParentColor = False
              TabOrder = 16
              Visible = False
            end
            object ed_TelMonitorSoundNo1: TEdit
              Left = 567
              Top = 21
              Width = 57
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 17
              Text = '17'
              Visible = False
            end
          end
          object GroupBox21: TGroupBox
            Left = 24
            Top = 88
            Width = 657
            Height = 57
            Caption = #51020#49452#44288#51228#48264#54840'2'
            TabOrder = 1
            object StaticText176: TStaticText
              Left = 15
              Top = 23
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #51204#54868#48264#54840
              Color = 16776176
              ParentColor = False
              TabOrder = 0
            end
            object ed_TelMonitorNum2: TEdit
              Left = 127
              Top = 21
              Width = 138
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 1
            end
            object StaticText177: TStaticText
              Left = 287
              Top = 23
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #51020#49457#49569#52636#49884#44036
              Color = 16776176
              ParentColor = False
              TabOrder = 2
            end
            object ed_TelMonitorsendTime2: TEdit
              Left = 399
              Top = 21
              Width = 57
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 3
              Text = '060'
            end
            object StaticText178: TStaticText
              Left = 15
              Top = 47
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #51020#49457#49884#51089#45824#44592
              Color = 16776176
              ParentColor = False
              TabOrder = 4
              Visible = False
            end
            object ed_TelMonitorStartDelay2: TEdit
              Left = 127
              Top = 45
              Width = 58
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 5
              Text = '001'
              Visible = False
            end
            object StaticText179: TStaticText
              Left = 287
              Top = 47
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #51020#49457#49569#52636#54943#49688
              Color = 16776176
              ParentColor = False
              TabOrder = 6
              Visible = False
            end
            object ed_TelMonitorsendCount2: TEdit
              Left = 399
              Top = 45
              Width = 57
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 7
              Text = '010'
              Visible = False
            end
            object StaticText180: TStaticText
              Left = 15
              Top = 71
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #49828#54588#52964
              Color = 16776176
              ParentColor = False
              TabOrder = 8
              Visible = False
            end
            object cmb_TelMonitorsSpeaker2: TRzComboBox
              Left = 128
              Top = 69
              Width = 57
              Height = 20
              Style = csDropDownList
              DropDownCount = 33
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 9
              Text = 'OFF'
              Visible = False
              Items.Strings = (
                'OFF'
                'ON')
              ItemIndex = 0
            end
            object StaticText181: TStaticText
              Left = 287
              Top = 71
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #54943#49688'/'#49884#44036
              Color = 16776176
              ParentColor = False
              TabOrder = 10
              Visible = False
            end
            object cmb_TelMonitorCountTime2: TRzComboBox
              Left = 400
              Top = 69
              Width = 57
              Height = 20
              Style = csDropDownList
              DropDownCount = 33
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 11
              Text = #49884#44036
              Visible = False
              Items.Strings = (
                #54943#49688
                #49884#44036)
              ItemIndex = 1
            end
            object StaticText182: TStaticText
              Left = 15
              Top = 95
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = 'DTMF'#49884#51089
              Color = 16776176
              ParentColor = False
              TabOrder = 12
              Visible = False
            end
            object cmb_TelMonitorDTMFStart2: TRzComboBox
              Left = 128
              Top = 93
              Width = 57
              Height = 20
              Style = csDropDownList
              DropDownCount = 33
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 13
              Text = 'OFF'
              Visible = False
              Items.Strings = (
                'OFF'
                'ON')
              ItemIndex = 0
            end
            object StaticText183: TStaticText
              Left = 287
              Top = 95
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = 'DTMF'#51333#47308
              Color = 16776176
              ParentColor = False
              TabOrder = 14
              Visible = False
            end
            object cmb_TelMonitorDTMFEnd2: TRzComboBox
              Left = 400
              Top = 93
              Width = 57
              Height = 20
              Style = csDropDownList
              DropDownCount = 33
              ImeName = 'Microsoft IME 2003'
              ItemHeight = 12
              TabOrder = 15
              Text = 'OFF'
              Visible = False
              Items.Strings = (
                'OFF'
                'ON')
              ItemIndex = 0
            end
            object StaticText185: TStaticText
              Left = 463
              Top = 23
              Width = 98
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = sbsSunken
              Caption = #51020#49457#48264#54840
              Color = 16776176
              ParentColor = False
              TabOrder = 16
              Visible = False
            end
            object ed_TelMonitorSoundNo2: TEdit
              Left = 567
              Top = 21
              Width = 57
              Height = 20
              ImeName = 'Microsoft IME 2003'
              TabOrder = 17
              Text = '17'
              Visible = False
            end
          end
        end
        object tab_RemoteControl: TTabSheet
          Caption = #50896#44201#51228#50612
          ImageIndex = 8
          object page_RemoteControl: TPageControl
            Left = 0
            Top = 0
            Width = 844
            Height = 446
            ActivePage = tabZoneUseControl
            Align = alClient
            TabOrder = 0
            OnChange = page_RemoteControlChange
            object tabControlerAlarm: TTabSheet
              Caption = #48169#48276
              object GroupBox6: TGroupBox
                Left = 0
                Top = 41
                Width = 836
                Height = 128
                Align = alTop
                Caption = #50896#44201#44221#44228
                TabOrder = 0
                object GroupBox25: TGroupBox
                  Left = 226
                  Top = 14
                  Width = 224
                  Height = 112
                  Align = alLeft
                  Caption = #47196#52972#51228#50612
                  TabOrder = 0
                  object btn_Alarm: TRzBitBtn
                    Left = 31
                    Top = 24
                    Width = 161
                    Caption = #44221#44228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btn_AlarmClick
                  end
                  object btn_DisAlarm: TRzBitBtn
                    Left = 31
                    Top = 56
                    Width = 161
                    Caption = #54644#51228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btn_DisAlarmClick
                  end
                end
                object gb_ArmAll: TGroupBox
                  Left = 2
                  Top = 14
                  Width = 224
                  Height = 112
                  Align = alLeft
                  Caption = #51204#52404#51228#50612
                  TabOrder = 1
                  object btn_AllDisArmControl: TRzBitBtn
                    Left = 31
                    Top = 56
                    Width = 161
                    Hint = 'D'
                    Caption = #51204#52404#48169#48276#54644#51228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btn_AllDisArmControlClick
                  end
                  object btn_AllArmControl: TRzBitBtn
                    Left = 31
                    Top = 24
                    Width = 161
                    Hint = 'A'
                    Caption = #51204#52404#48169#48276#44221#44228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btn_AllDisArmControlClick
                  end
                end
                object GroupBox31: TGroupBox
                  Left = 450
                  Top = 14
                  Width = 224
                  Height = 112
                  Align = alLeft
                  Caption = #48169#48276#49345#53468
                  TabOrder = 2
                  object btn_AlarmState: TRzBitBtn
                    Left = 39
                    Top = 47
                    Width = 161
                    Caption = #54788#51116#49345#53468#51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btn_AlarmStateClick
                  end
                end
              end
              object Panel8: TPanel
                Left = 0
                Top = 0
                Width = 836
                Height = 41
                Align = alTop
                Caption = #48169#48276#44396#50669#51032' '#51228#50612#47484' '#49688#54665' '#54633#45768#45796'.'
                Color = clGradientActiveCaption
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = #44404#47548#52404
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
              object GroupBox17: TGroupBox
                Left = 0
                Top = 169
                Width = 836
                Height = 95
                Align = alTop
                Caption = #51228#50612#44208#44284
                TabOrder = 2
                object StaticText45: TStaticText
                  Left = 16
                  Top = 30
                  Width = 161
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #54788#51116' '#48169#48276' '#49345#53468
                  TabOrder = 0
                end
                object st_AlarmState: TStaticText
                  Left = 16
                  Top = 55
                  Width = 205
                  Height = 16
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                end
              end
            end
            object tabArmAreaControl: TTabSheet
              Caption = #44396#50669#44221#44228
              ImageIndex = 2
              object GroupBox1: TGroupBox
                Left = 0
                Top = 105
                Width = 836
                Height = 160
                Align = alTop
                Caption = #44396#50669#44221#44228
                TabOrder = 0
                object GroupBox2: TGroupBox
                  Left = 716
                  Top = 14
                  Width = 102
                  Height = 144
                  Align = alLeft
                  Caption = #44396#50669'8'
                  TabOrder = 0
                  object btn_Alarm8: TRzBitBtn
                    Tag = 8
                    Left = 5
                    Top = 32
                    Width = 90
                    Caption = #44221#44228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btn_AlarmClick
                  end
                  object RzBitBtn20: TRzBitBtn
                    Tag = 8
                    Left = 5
                    Top = 64
                    Width = 90
                    Caption = #54644#51228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btn_DisAlarmClick
                  end
                  object RzBitBtn51: TRzBitBtn
                    Tag = 8
                    Left = 4
                    Top = 96
                    Width = 90
                    Caption = #54788#49345#53468#51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = btn_AlarmStateClick
                  end
                end
                object GroupBox4: TGroupBox
                  Left = 614
                  Top = 14
                  Width = 102
                  Height = 144
                  Align = alLeft
                  Caption = #44396#50669'7'
                  TabOrder = 1
                  object btn_Alarm7: TRzBitBtn
                    Tag = 7
                    Left = 5
                    Top = 32
                    Width = 90
                    Caption = #44221#44228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btn_AlarmClick
                  end
                  object RzBitBtn22: TRzBitBtn
                    Tag = 7
                    Left = 5
                    Top = 64
                    Width = 90
                    Caption = #54644#51228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btn_DisAlarmClick
                  end
                  object RzBitBtn50: TRzBitBtn
                    Tag = 7
                    Left = 4
                    Top = 96
                    Width = 90
                    Caption = #54788#49345#53468#51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = btn_AlarmStateClick
                  end
                end
                object GroupBox8: TGroupBox
                  Left = 512
                  Top = 14
                  Width = 102
                  Height = 144
                  Align = alLeft
                  Caption = #44396#50669'6'
                  TabOrder = 2
                  object btn_Alarm6: TRzBitBtn
                    Tag = 6
                    Left = 5
                    Top = 32
                    Width = 90
                    Caption = #44221#44228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btn_AlarmClick
                  end
                  object RzBitBtn24: TRzBitBtn
                    Tag = 6
                    Left = 5
                    Top = 64
                    Width = 90
                    Caption = #54644#51228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btn_DisAlarmClick
                  end
                  object RzBitBtn49: TRzBitBtn
                    Tag = 6
                    Left = 4
                    Top = 96
                    Width = 90
                    Caption = #54788#49345#53468#51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = btn_AlarmStateClick
                  end
                end
                object GroupBox11: TGroupBox
                  Left = 410
                  Top = 14
                  Width = 102
                  Height = 144
                  Align = alLeft
                  Caption = #44396#50669'5'
                  TabOrder = 3
                  object btn_Alarm5: TRzBitBtn
                    Tag = 5
                    Left = 5
                    Top = 32
                    Width = 90
                    Caption = #44221#44228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btn_AlarmClick
                  end
                  object RzBitBtn26: TRzBitBtn
                    Tag = 5
                    Left = 5
                    Top = 64
                    Width = 90
                    Caption = #54644#51228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btn_DisAlarmClick
                  end
                  object RzBitBtn48: TRzBitBtn
                    Tag = 5
                    Left = 4
                    Top = 96
                    Width = 90
                    Caption = #54788#49345#53468#51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = btn_AlarmStateClick
                  end
                end
                object GroupBox12: TGroupBox
                  Left = 308
                  Top = 14
                  Width = 102
                  Height = 144
                  Align = alLeft
                  Caption = #44396#50669'4'
                  TabOrder = 4
                  object btn_Alarm4: TRzBitBtn
                    Tag = 4
                    Left = 5
                    Top = 32
                    Width = 90
                    Caption = #44221#44228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btn_AlarmClick
                  end
                  object RzBitBtn28: TRzBitBtn
                    Tag = 4
                    Left = 5
                    Top = 64
                    Width = 90
                    Caption = #54644#51228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btn_DisAlarmClick
                  end
                  object RzBitBtn47: TRzBitBtn
                    Tag = 4
                    Left = 4
                    Top = 96
                    Width = 90
                    Caption = #54788#49345#53468#51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = btn_AlarmStateClick
                  end
                end
                object GroupBox13: TGroupBox
                  Left = 206
                  Top = 14
                  Width = 102
                  Height = 144
                  Align = alLeft
                  Caption = #44396#50669'3'
                  TabOrder = 5
                  object btn_Alarm3: TRzBitBtn
                    Tag = 3
                    Left = 5
                    Top = 32
                    Width = 90
                    Caption = #44221#44228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btn_AlarmClick
                  end
                  object RzBitBtn30: TRzBitBtn
                    Tag = 3
                    Left = 5
                    Top = 64
                    Width = 90
                    Caption = #54644#51228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btn_DisAlarmClick
                  end
                  object RzBitBtn40: TRzBitBtn
                    Tag = 3
                    Left = 4
                    Top = 96
                    Width = 90
                    Caption = #54788#49345#53468#51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = btn_AlarmStateClick
                  end
                end
                object GroupBox14: TGroupBox
                  Left = 104
                  Top = 14
                  Width = 102
                  Height = 144
                  Align = alLeft
                  Caption = #44396#50669'2'
                  TabOrder = 6
                  object btn_Alarm2: TRzBitBtn
                    Tag = 2
                    Left = 5
                    Top = 32
                    Width = 90
                    Caption = #44221#44228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btn_AlarmClick
                  end
                  object RzBitBtn32: TRzBitBtn
                    Tag = 2
                    Left = 5
                    Top = 64
                    Width = 90
                    Caption = #54644#51228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btn_DisAlarmClick
                  end
                  object RzBitBtn39: TRzBitBtn
                    Tag = 2
                    Left = 4
                    Top = 96
                    Width = 90
                    Caption = #54788#49345#53468#51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = btn_AlarmStateClick
                  end
                end
                object GroupBox15: TGroupBox
                  Left = 2
                  Top = 14
                  Width = 102
                  Height = 144
                  Align = alLeft
                  Caption = #44396#50669'1'
                  TabOrder = 7
                  object btn_Alarm1: TRzBitBtn
                    Tag = 1
                    Left = 5
                    Top = 32
                    Width = 90
                    Caption = #44221#44228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btn_AlarmClick
                  end
                  object RzBitBtn34: TRzBitBtn
                    Tag = 1
                    Left = 5
                    Top = 64
                    Width = 90
                    Caption = #54644#51228
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btn_DisAlarmClick
                  end
                  object RzBitBtn36: TRzBitBtn
                    Tag = 1
                    Left = 4
                    Top = 96
                    Width = 90
                    Caption = #54788#49345#53468#51312#54924
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = btn_AlarmStateClick
                  end
                end
              end
              object GroupBox16: TGroupBox
                Left = 0
                Top = 265
                Width = 836
                Height = 104
                Align = alTop
                Caption = #51228#50612#44208#44284
                TabOrder = 1
                object StaticText55: TStaticText
                  Left = 8
                  Top = 47
                  Width = 204
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #54788#51116' '#48169#48276' '#49345#53468
                  TabOrder = 0
                end
                object st_AlarmState3: TStaticText
                  Left = 8
                  Top = 71
                  Width = 205
                  Height = 16
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                end
                object StaticText57: TStaticText
                  Left = 8
                  Top = 23
                  Width = 100
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #44396#50669#48264#54840
                  TabOrder = 2
                end
                object st_ArmArea3: TStaticText
                  Left = 112
                  Top = 23
                  Width = 100
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  ParentColor = False
                  TabOrder = 3
                end
              end
              object Panel22: TPanel
                Left = 0
                Top = 0
                Width = 836
                Height = 41
                Align = alTop
                Caption = #44396#50669#44221#44228#51032' '#51228#50612#47484' '#49688#54665' '#54633#45768#45796'.'
                Color = clGradientActiveCaption
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = #44404#47548#52404
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
              end
              object gb_AraeAll: TGroupBox
                Left = 0
                Top = 41
                Width = 836
                Height = 64
                Align = alTop
                Caption = #51204#52404#44221#44228
                TabOrder = 3
                object RzBitBtn4: TRzBitBtn
                  Left = 31
                  Top = 24
                  Width = 161
                  Hint = 'A'
                  Caption = #51204#52404#48169#48276#44221#44228
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 0
                  OnClick = btn_AllDisArmControlClick
                end
                object RzBitBtn3: TRzBitBtn
                  Left = 199
                  Top = 24
                  Width = 161
                  Hint = 'D'
                  Caption = #51204#52404#48169#48276#54644#51228
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 1
                  OnClick = btn_AllDisArmControlClick
                end
              end
            end
            object tabZoneUseControl: TTabSheet
              Caption = #51316#49324#50857#50976#47924
              ImageIndex = 4
              TabVisible = False
              object gb_ZoneUseRemoteControl: TGroupBox
                Left = 0
                Top = 0
                Width = 836
                Height = 441
                Align = alTop
                Caption = #51316#49324#50857#50976#47924#49444#51221
                TabOrder = 0
                object RzPanel47: TRzPanel
                  Left = 14
                  Top = 22
                  Width = 67
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #51316#48264#54840
                  TabOrder = 0
                end
                object StaticText154: TStaticText
                  Left = 16
                  Top = 60
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '1'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 1
                end
                object StaticText155: TStaticText
                  Left = 16
                  Top = 100
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '2'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 2
                end
                object StaticText156: TStaticText
                  Left = 16
                  Top = 140
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '3'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 3
                end
                object StaticText157: TStaticText
                  Left = 16
                  Top = 180
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '4'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 4
                end
                object StaticText159: TStaticText
                  Left = 16
                  Top = 220
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '5'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 5
                end
                object StaticText160: TStaticText
                  Left = 16
                  Top = 260
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '6'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 6
                end
                object StaticText162: TStaticText
                  Left = 16
                  Top = 300
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '7'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 7
                end
                object StaticText163: TStaticText
                  Left = 16
                  Top = 340
                  Width = 65
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = '8'
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 8
                end
                object btn_ZoneUseControl1: TRzBitBtn
                  Tag = 1
                  Left = 85
                  Top = 56
                  Width = 67
                  Hint = '011'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 9
                  OnClick = btn_ZoneUseControl1Click
                end
                object RzPanel51: TRzPanel
                  Left = 86
                  Top = 22
                  Width = 67
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #52968#53944#47204#47084
                  TabOrder = 10
                end
                object btn_ZoneUseControl2: TRzBitBtn
                  Tag = 1
                  Left = 85
                  Top = 96
                  Width = 67
                  Hint = '021'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 11
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl3: TRzBitBtn
                  Tag = 1
                  Left = 85
                  Top = 136
                  Width = 67
                  Hint = '031'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 12
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl4: TRzBitBtn
                  Tag = 1
                  Left = 85
                  Top = 176
                  Width = 67
                  Hint = '041'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 13
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl5: TRzBitBtn
                  Tag = 1
                  Left = 85
                  Top = 216
                  Width = 67
                  Hint = '051'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 14
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl6: TRzBitBtn
                  Tag = 1
                  Left = 85
                  Top = 256
                  Width = 67
                  Hint = '061'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 15
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl7: TRzBitBtn
                  Tag = 1
                  Left = 85
                  Top = 296
                  Width = 67
                  Hint = '071'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 16
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl8: TRzBitBtn
                  Tag = 1
                  Left = 85
                  Top = 336
                  Width = 67
                  Hint = '081'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 17
                  OnClick = btn_ZoneUseControl1Click
                end
                object pan_RemoteZoneExt1: TRzPanel
                  Left = 166
                  Top = 22
                  Width = 67
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #44048#51109#44592'1'
                  TabOrder = 18
                end
                object pan_RemoteZoneExt2: TRzPanel
                  Left = 238
                  Top = 22
                  Width = 67
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #44048#51109#44592'2'
                  TabOrder = 19
                end
                object pan_RemoteZoneExt3: TRzPanel
                  Left = 310
                  Top = 22
                  Width = 67
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #44048#51109#44592'3'
                  TabOrder = 20
                end
                object pan_RemoteZoneExt4: TRzPanel
                  Left = 382
                  Top = 22
                  Width = 67
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #44048#51109#44592'4'
                  TabOrder = 21
                end
                object pan_RemoteZoneExt5: TRzPanel
                  Left = 454
                  Top = 22
                  Width = 67
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #44048#51109#44592'5'
                  TabOrder = 22
                end
                object pan_RemoteZoneExt6: TRzPanel
                  Left = 526
                  Top = 22
                  Width = 67
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #44048#51109#44592'6'
                  TabOrder = 23
                end
                object pan_RemoteZoneExt7: TRzPanel
                  Left = 598
                  Top = 22
                  Width = 67
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #44048#51109#44592'7'
                  TabOrder = 24
                end
                object pan_RemoteZoneExt8: TRzPanel
                  Left = 670
                  Top = 22
                  Width = 67
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #44048#51109#44592'8'
                  TabOrder = 25
                end
                object btn_ZoneUseControl11: TRzBitBtn
                  Tag = 1
                  Left = 165
                  Top = 56
                  Width = 67
                  Hint = '111'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 26
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl12: TRzBitBtn
                  Tag = 1
                  Left = 165
                  Top = 96
                  Width = 67
                  Hint = '121'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 27
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl13: TRzBitBtn
                  Tag = 1
                  Left = 165
                  Top = 136
                  Width = 67
                  Hint = '131'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 28
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl14: TRzBitBtn
                  Tag = 1
                  Left = 165
                  Top = 176
                  Width = 67
                  Hint = '141'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 29
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl15: TRzBitBtn
                  Tag = 1
                  Left = 165
                  Top = 216
                  Width = 67
                  Hint = '151'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 30
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl16: TRzBitBtn
                  Tag = 1
                  Left = 165
                  Top = 256
                  Width = 67
                  Hint = '161'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 31
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl17: TRzBitBtn
                  Tag = 1
                  Left = 165
                  Top = 296
                  Width = 67
                  Hint = '171'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 32
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl18: TRzBitBtn
                  Tag = 1
                  Left = 165
                  Top = 336
                  Width = 67
                  Hint = '181'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 33
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl21: TRzBitBtn
                  Tag = 1
                  Left = 237
                  Top = 56
                  Width = 67
                  Hint = '211'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 34
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl22: TRzBitBtn
                  Tag = 1
                  Left = 237
                  Top = 96
                  Width = 67
                  Hint = '221'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 35
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl23: TRzBitBtn
                  Tag = 1
                  Left = 237
                  Top = 136
                  Width = 67
                  Hint = '231'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 36
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl24: TRzBitBtn
                  Tag = 1
                  Left = 237
                  Top = 176
                  Width = 67
                  Hint = '241'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 37
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl25: TRzBitBtn
                  Tag = 1
                  Left = 237
                  Top = 216
                  Width = 67
                  Hint = '251'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 38
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl26: TRzBitBtn
                  Tag = 1
                  Left = 237
                  Top = 256
                  Width = 67
                  Hint = '261'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 39
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl27: TRzBitBtn
                  Tag = 1
                  Left = 237
                  Top = 296
                  Width = 67
                  Hint = '271'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 40
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl28: TRzBitBtn
                  Tag = 1
                  Left = 237
                  Top = 336
                  Width = 67
                  Hint = '281'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 41
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl31: TRzBitBtn
                  Tag = 1
                  Left = 309
                  Top = 56
                  Width = 67
                  Hint = '311'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 42
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl32: TRzBitBtn
                  Tag = 1
                  Left = 309
                  Top = 96
                  Width = 67
                  Hint = '321'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 43
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl33: TRzBitBtn
                  Tag = 1
                  Left = 309
                  Top = 136
                  Width = 67
                  Hint = '331'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 44
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl34: TRzBitBtn
                  Tag = 1
                  Left = 309
                  Top = 176
                  Width = 67
                  Hint = '341'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 45
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl35: TRzBitBtn
                  Tag = 1
                  Left = 309
                  Top = 216
                  Width = 67
                  Hint = '351'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 46
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl36: TRzBitBtn
                  Tag = 1
                  Left = 309
                  Top = 256
                  Width = 67
                  Hint = '361'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 47
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl37: TRzBitBtn
                  Tag = 1
                  Left = 309
                  Top = 296
                  Width = 67
                  Hint = '371'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 48
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl38: TRzBitBtn
                  Tag = 1
                  Left = 309
                  Top = 336
                  Width = 67
                  Hint = '381'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 49
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl41: TRzBitBtn
                  Tag = 1
                  Left = 381
                  Top = 56
                  Width = 67
                  Hint = '411'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 50
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl42: TRzBitBtn
                  Tag = 1
                  Left = 381
                  Top = 96
                  Width = 67
                  Hint = '421'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 51
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl43: TRzBitBtn
                  Tag = 1
                  Left = 381
                  Top = 136
                  Width = 67
                  Hint = '431'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 52
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl44: TRzBitBtn
                  Tag = 1
                  Left = 381
                  Top = 176
                  Width = 67
                  Hint = '441'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 53
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl45: TRzBitBtn
                  Tag = 1
                  Left = 381
                  Top = 216
                  Width = 67
                  Hint = '451'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 54
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl46: TRzBitBtn
                  Tag = 1
                  Left = 381
                  Top = 256
                  Width = 67
                  Hint = '461'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 55
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl47: TRzBitBtn
                  Tag = 1
                  Left = 381
                  Top = 296
                  Width = 67
                  Hint = '471'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 56
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl48: TRzBitBtn
                  Tag = 1
                  Left = 381
                  Top = 336
                  Width = 67
                  Hint = '481'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 57
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl51: TRzBitBtn
                  Tag = 1
                  Left = 453
                  Top = 56
                  Width = 67
                  Hint = '511'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 58
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl52: TRzBitBtn
                  Tag = 1
                  Left = 453
                  Top = 96
                  Width = 67
                  Hint = '521'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 59
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl53: TRzBitBtn
                  Tag = 1
                  Left = 453
                  Top = 136
                  Width = 67
                  Hint = '531'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 60
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl54: TRzBitBtn
                  Tag = 1
                  Left = 453
                  Top = 176
                  Width = 67
                  Hint = '541'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 61
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl55: TRzBitBtn
                  Tag = 1
                  Left = 453
                  Top = 216
                  Width = 67
                  Hint = '551'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 62
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl56: TRzBitBtn
                  Tag = 1
                  Left = 453
                  Top = 256
                  Width = 67
                  Hint = '561'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 63
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl57: TRzBitBtn
                  Tag = 1
                  Left = 453
                  Top = 296
                  Width = 67
                  Hint = '571'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 64
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl58: TRzBitBtn
                  Tag = 1
                  Left = 453
                  Top = 336
                  Width = 67
                  Hint = '581'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 65
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl61: TRzBitBtn
                  Tag = 1
                  Left = 525
                  Top = 56
                  Width = 67
                  Hint = '611'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 66
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl62: TRzBitBtn
                  Tag = 1
                  Left = 525
                  Top = 96
                  Width = 67
                  Hint = '621'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 67
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl63: TRzBitBtn
                  Tag = 1
                  Left = 525
                  Top = 136
                  Width = 67
                  Hint = '631'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 68
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl64: TRzBitBtn
                  Tag = 1
                  Left = 525
                  Top = 176
                  Width = 67
                  Hint = '641'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 69
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl65: TRzBitBtn
                  Tag = 1
                  Left = 525
                  Top = 216
                  Width = 67
                  Hint = '651'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 70
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl66: TRzBitBtn
                  Tag = 1
                  Left = 525
                  Top = 256
                  Width = 67
                  Hint = '661'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 71
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl67: TRzBitBtn
                  Tag = 1
                  Left = 525
                  Top = 296
                  Width = 67
                  Hint = '671'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 72
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl68: TRzBitBtn
                  Tag = 1
                  Left = 525
                  Top = 336
                  Width = 67
                  Hint = '681'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 73
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl71: TRzBitBtn
                  Tag = 1
                  Left = 597
                  Top = 56
                  Width = 67
                  Hint = '711'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 74
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl72: TRzBitBtn
                  Tag = 1
                  Left = 597
                  Top = 96
                  Width = 67
                  Hint = '721'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 75
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl73: TRzBitBtn
                  Tag = 1
                  Left = 597
                  Top = 136
                  Width = 67
                  Hint = '731'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 76
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl74: TRzBitBtn
                  Tag = 1
                  Left = 597
                  Top = 176
                  Width = 67
                  Hint = '741'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 77
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl75: TRzBitBtn
                  Tag = 1
                  Left = 597
                  Top = 216
                  Width = 67
                  Hint = '751'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 78
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl76: TRzBitBtn
                  Tag = 1
                  Left = 597
                  Top = 256
                  Width = 67
                  Hint = '761'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 79
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl77: TRzBitBtn
                  Tag = 1
                  Left = 597
                  Top = 296
                  Width = 67
                  Hint = '771'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 80
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl78: TRzBitBtn
                  Tag = 1
                  Left = 597
                  Top = 336
                  Width = 67
                  Hint = '781'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 81
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl81: TRzBitBtn
                  Tag = 1
                  Left = 669
                  Top = 56
                  Width = 67
                  Hint = '811'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 82
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl82: TRzBitBtn
                  Tag = 1
                  Left = 669
                  Top = 96
                  Width = 67
                  Hint = '821'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 83
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl83: TRzBitBtn
                  Tag = 1
                  Left = 669
                  Top = 136
                  Width = 67
                  Hint = '831'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 84
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl84: TRzBitBtn
                  Tag = 1
                  Left = 669
                  Top = 176
                  Width = 67
                  Hint = '841'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 85
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl85: TRzBitBtn
                  Tag = 1
                  Left = 669
                  Top = 216
                  Width = 67
                  Hint = '851'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 86
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl86: TRzBitBtn
                  Tag = 1
                  Left = 669
                  Top = 256
                  Width = 67
                  Hint = '861'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 87
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl87: TRzBitBtn
                  Tag = 1
                  Left = 669
                  Top = 296
                  Width = 67
                  Hint = '871'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 88
                  OnClick = btn_ZoneUseControl1Click
                end
                object btn_ZoneUseControl88: TRzBitBtn
                  Tag = 1
                  Left = 669
                  Top = 336
                  Width = 67
                  Hint = '881'
                  Caption = #49324#50857
                  Color = clLime
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 89
                  OnClick = btn_ZoneUseControl1Click
                end
                object GroupBox7: TGroupBox
                  Left = 80
                  Top = 376
                  Width = 177
                  Height = 41
                  Caption = #49345#53468#54364#49884
                  TabOrder = 90
                  object StaticText164: TStaticText
                    Left = 13
                    Top = 16
                    Width = 68
                    Height = 17
                    Alignment = taCenter
                    AutoSize = False
                    BevelInner = bvLowered
                    BevelKind = bkSoft
                    Caption = #49324#50857#51473
                    Color = clGreen
                    ParentColor = False
                    TabOrder = 0
                  end
                  object StaticText165: TStaticText
                    Tag = 1
                    Left = 93
                    Top = 16
                    Width = 68
                    Height = 17
                    Alignment = taCenter
                    AutoSize = False
                    BevelInner = bvLowered
                    BevelKind = bkSoft
                    Caption = #48120#49324#50857
                    Color = clYellow
                    ParentColor = False
                    TabOrder = 1
                  end
                end
              end
            end
            object tab_RemoteControlDoor: TTabSheet
              Caption = #52636#51077
              ImageIndex = 1
              object gb_DoorControl: TGroupBox
                Left = 0
                Top = 41
                Width = 836
                Height = 128
                Align = alTop
                Caption = #52636#51077#47928#51228#50612
                TabOrder = 0
                object gb_RemoteControlDoor2: TGroupBox
                  Tag = 2
                  Left = 104
                  Top = 14
                  Width = 102
                  Height = 112
                  Align = alLeft
                  Caption = #52636#51077#47928'2'
                  TabOrder = 0
                  object btn_DoorOpenMode2: TRzBitBtn
                    Tag = 2
                    Left = 5
                    Top = 72
                    Width = 90
                    Hint = '221'
                    Caption = #44060#48169#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = DoorControl
                  end
                  object btn_DoorCloseMode2: TRzBitBtn
                    Tag = 2
                    Left = 5
                    Top = 48
                    Width = 90
                    Hint = '220'
                    Caption = #50868#50689#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = DoorControl
                  end
                  object btn_DoorOpen2: TRzBitBtn
                    Tag = 2
                    Left = 5
                    Top = 24
                    Width = 90
                    Hint = '231'
                    Caption = #52636#51077#47928#50676#44592
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = DoorControl
                  end
                end
                object gb_RemoteControlDoor1: TGroupBox
                  Tag = 1
                  Left = 2
                  Top = 14
                  Width = 102
                  Height = 112
                  Align = alLeft
                  Caption = #52636#51077#47928'1'
                  TabOrder = 1
                  object btn_DoorCloseMode1: TRzBitBtn
                    Tag = 1
                    Left = 5
                    Top = 48
                    Width = 90
                    Hint = '120'
                    Caption = #50868#50689#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = DoorControl
                  end
                  object btn_DoorOpenMode1: TRzBitBtn
                    Tag = 1
                    Left = 5
                    Top = 72
                    Width = 90
                    Hint = '121'
                    Caption = #44060#48169#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = DoorControl
                  end
                  object btn_DoorOpen1: TRzBitBtn
                    Tag = 1
                    Left = 5
                    Top = 24
                    Width = 90
                    Hint = '131'
                    Caption = #52636#51077#47928#50676#44592
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = DoorControl
                  end
                end
                object gb_RemoteControlDoor8: TGroupBox
                  Tag = 8
                  Left = 716
                  Top = 14
                  Width = 102
                  Height = 112
                  Align = alLeft
                  Caption = #52636#51077#47928'8('#54869#51109'6)'
                  TabOrder = 2
                  object btn_DoorCloseMode8: TRzBitBtn
                    Tag = 8
                    Left = 5
                    Top = 48
                    Width = 90
                    Hint = '820'
                    Caption = #50868#50689#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = DoorControl
                  end
                  object btn_DoorOpenMode8: TRzBitBtn
                    Tag = 8
                    Left = 5
                    Top = 72
                    Width = 90
                    Hint = '821'
                    Caption = #44060#48169#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = DoorControl
                  end
                  object btn_DoorOpen8: TRzBitBtn
                    Tag = 8
                    Left = 5
                    Top = 24
                    Width = 90
                    Hint = '831'
                    Caption = #52636#51077#47928#50676#44592
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = DoorControl
                  end
                end
                object gb_RemoteControlDoor5: TGroupBox
                  Tag = 5
                  Left = 410
                  Top = 14
                  Width = 102
                  Height = 112
                  Align = alLeft
                  Caption = #52636#51077#47928'5('#54869#51109'3)'
                  TabOrder = 3
                  object btn_DoorCloseMode5: TRzBitBtn
                    Tag = 5
                    Left = 5
                    Top = 48
                    Width = 90
                    Hint = '520'
                    Caption = #50868#50689#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = DoorControl
                  end
                  object btn_DoorOpenMode5: TRzBitBtn
                    Tag = 5
                    Left = 5
                    Top = 72
                    Width = 90
                    Hint = '521'
                    Caption = #44060#48169#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = DoorControl
                  end
                  object btn_DoorOpen5: TRzBitBtn
                    Tag = 5
                    Left = 5
                    Top = 24
                    Width = 90
                    Hint = '531'
                    Caption = #52636#51077#47928#50676#44592
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = DoorControl
                  end
                end
                object gb_RemoteControlDoor4: TGroupBox
                  Tag = 4
                  Left = 308
                  Top = 14
                  Width = 102
                  Height = 112
                  Align = alLeft
                  Caption = #52636#51077#47928'4('#54869#51109'2)'
                  TabOrder = 4
                  object btn_DoorCloseMode4: TRzBitBtn
                    Tag = 4
                    Left = 5
                    Top = 48
                    Width = 90
                    Hint = '420'
                    Caption = #50868#50689#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = DoorControl
                  end
                  object btn_DoorOpenMode4: TRzBitBtn
                    Tag = 4
                    Left = 5
                    Top = 72
                    Width = 90
                    Hint = '421'
                    Caption = #44060#48169#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = DoorControl
                  end
                  object btn_DoorOpen4: TRzBitBtn
                    Tag = 4
                    Left = 5
                    Top = 24
                    Width = 90
                    Hint = '431'
                    Caption = #52636#51077#47928#50676#44592
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = DoorControl
                  end
                end
                object gb_RemoteControlDoor3: TGroupBox
                  Tag = 3
                  Left = 206
                  Top = 14
                  Width = 102
                  Height = 112
                  Align = alLeft
                  Caption = #52636#51077#47928'3('#54869#51109'1)'
                  TabOrder = 5
                  object btn_DoorCloseMode3: TRzBitBtn
                    Tag = 3
                    Left = 5
                    Top = 48
                    Width = 90
                    Hint = '320'
                    Caption = #50868#50689#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = DoorControl
                  end
                  object btn_DoorOpenMode3: TRzBitBtn
                    Tag = 3
                    Left = 5
                    Top = 72
                    Width = 90
                    Hint = '321'
                    Caption = #44060#48169#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = DoorControl
                  end
                  object btn_DoorOpen3: TRzBitBtn
                    Tag = 3
                    Left = 5
                    Top = 24
                    Width = 90
                    Hint = '331'
                    Caption = #52636#51077#47928#50676#44592
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = DoorControl
                  end
                end
                object gb_RemoteControlDoor7: TGroupBox
                  Tag = 7
                  Left = 614
                  Top = 14
                  Width = 102
                  Height = 112
                  Align = alLeft
                  Caption = #52636#51077#47928'7('#54869#51109'5)'
                  TabOrder = 6
                  object btn_DoorCloseMode7: TRzBitBtn
                    Tag = 7
                    Left = 5
                    Top = 48
                    Width = 90
                    Hint = '720'
                    Caption = #50868#50689#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = DoorControl
                  end
                  object btn_DoorOpenMode7: TRzBitBtn
                    Tag = 7
                    Left = 5
                    Top = 72
                    Width = 90
                    Hint = '721'
                    Caption = #44060#48169#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = DoorControl
                  end
                  object btn_DoorOpen7: TRzBitBtn
                    Tag = 7
                    Left = 5
                    Top = 24
                    Width = 90
                    Hint = '731'
                    Caption = #52636#51077#47928#50676#44592
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = DoorControl
                  end
                end
                object gb_RemoteControlDoor6: TGroupBox
                  Tag = 6
                  Left = 512
                  Top = 14
                  Width = 102
                  Height = 112
                  Align = alLeft
                  Caption = #52636#51077#47928'6('#54869#51109'4)'
                  TabOrder = 7
                  object btn_DoorCloseMode6: TRzBitBtn
                    Tag = 6
                    Left = 5
                    Top = 48
                    Width = 90
                    Hint = '620'
                    Caption = #50868#50689#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = DoorControl
                  end
                  object btn_DoorOpenMode6: TRzBitBtn
                    Tag = 6
                    Left = 5
                    Top = 72
                    Width = 90
                    Hint = '621'
                    Caption = #44060#48169#47784#46300
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = DoorControl
                  end
                  object btn_DoorOpen6: TRzBitBtn
                    Tag = 6
                    Left = 5
                    Top = 24
                    Width = 90
                    Hint = '631'
                    Caption = #52636#51077#47928#50676#44592
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = DoorControl
                  end
                end
              end
              object Panel16: TPanel
                Left = 0
                Top = 0
                Width = 836
                Height = 41
                Align = alTop
                Caption = #46973#51032' '#51228#50612#47484' '#49688#54665' '#54633#45768#45796'.'
                Color = clGradientActiveCaption
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = #44404#47548#52404
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
              object GroupBox9: TGroupBox
                Left = 0
                Top = 169
                Width = 836
                Height = 97
                Align = alTop
                Caption = #51228#50612#44208#44284
                TabOrder = 2
                object StaticText1: TStaticText
                  Left = 8
                  Top = 23
                  Width = 100
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #52636#51077#47928#48264#54840
                  TabOrder = 0
                end
                object st_CtrDoorNum: TStaticText
                  Left = 112
                  Top = 23
                  Width = 100
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  ParentColor = False
                  TabOrder = 1
                end
                object StaticText7: TStaticText
                  Left = 8
                  Top = 45
                  Width = 100
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #52852#46300#50868#50689#47784#46300
                  TabOrder = 2
                end
                object st_CtrCardMode: TStaticText
                  Left = 112
                  Top = 45
                  Width = 100
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  ParentColor = False
                  TabOrder = 3
                end
                object StaticText29: TStaticText
                  Left = 224
                  Top = 23
                  Width = 100
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #52636#51077#47928#50868#50689#47784#46300
                  TabOrder = 4
                end
                object st_CtrDoorMode: TStaticText
                  Left = 328
                  Top = 23
                  Width = 100
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  ParentColor = False
                  TabOrder = 5
                end
                object StaticText31: TStaticText
                  Left = 224
                  Top = 45
                  Width = 100
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #52636#51077#47928#49345#53468
                  TabOrder = 6
                end
                object st_CtrDoorState: TStaticText
                  Left = 328
                  Top = 45
                  Width = 100
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  ParentColor = False
                  TabOrder = 7
                end
              end
            end
            object TabSheet9: TTabSheet
              Caption = #44592#53440
              ImageIndex = 3
              object Panel9: TPanel
                Left = 0
                Top = 0
                Width = 836
                Height = 41
                Align = alTop
                Caption = #44592#53440' '#49884#49828#53596#51032' '#51228#50612#47484' '#49688#54665' '#54633#45768#45796'.'
                Color = clGradientActiveCaption
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = #44404#47548#52404
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object GroupBox18: TGroupBox
                Left = 0
                Top = 41
                Width = 836
                Height = 136
                Align = alTop
                Caption = #51228#50612
                TabOrder = 1
                object GroupBox26: TGroupBox
                  Left = 2
                  Top = 14
                  Width = 111
                  Height = 120
                  Align = alLeft
                  Caption = #54868#51116
                  TabOrder = 0
                  object btn_AllFireRecovery: TRzBitBtn
                    Left = 10
                    Top = 55
                    Width = 90
                    Caption = #51204#52404#54868#51116#48373#44396
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btn_AllFireRecoveryClick
                  end
                end
                object GroupBox27: TGroupBox
                  Left = 113
                  Top = 14
                  Width = 111
                  Height = 120
                  Align = alLeft
                  Caption = #49884#49828#53596
                  TabOrder = 1
                  object btn_SyncTime1: TRzBitBtn
                    Left = 10
                    Top = 23
                    Width = 90
                    Caption = #49884#44036#46041#44592#54868
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btn_SyncTime1Click
                  end
                  object btn_MemoryClear: TRzBitBtn
                    Left = 10
                    Top = 55
                    Width = 90
                    Caption = #47700#47784#47532#51648#50880
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btn_MemoryClearClick
                  end
                  object btn_DeviceReset: TRzBitBtn
                    Left = 10
                    Top = 87
                    Width = 90
                    Caption = #51109#48708#47532#49483
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = btn_DeviceResetClick
                  end
                end
                object GroupBox28: TGroupBox
                  Left = 335
                  Top = 14
                  Width = 111
                  Height = 120
                  Align = alLeft
                  Caption = #44221#44305#46321
                  TabOrder = 2
                  Visible = False
                  object RzBitBtn41: TRzBitBtn
                    Left = 10
                    Top = 39
                    Width = 90
                    Caption = #44221#44305#46321'ON'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                    OnClick = btn_AlarmClick
                  end
                  object RzBitBtn42: TRzBitBtn
                    Left = 10
                    Top = 71
                    Width = 90
                    Caption = #44221#44305#46321'OFF'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btn_AlarmClick
                  end
                end
                object GroupBox29: TGroupBox
                  Left = 224
                  Top = 14
                  Width = 111
                  Height = 120
                  Align = alLeft
                  Caption = #49912#51060#47116
                  TabOrder = 3
                  Visible = False
                  object btn_SirenOn: TRzBitBtn
                    Left = 10
                    Top = 39
                    Width = 90
                    Caption = #49912#51060#47116'ON'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 0
                  end
                  object RzBitBtn46: TRzBitBtn
                    Left = 10
                    Top = 71
                    Width = 90
                    Caption = #49912#51060#47116'OFF'
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 1
                    OnClick = btn_AlarmClick
                  end
                end
                object gb_SendPacket: TGroupBox
                  Left = 446
                  Top = 14
                  Width = 395
                  Height = 120
                  Align = alLeft
                  Caption = #47749#47161
                  TabOrder = 4
                  object StaticText166: TStaticText
                    Left = 8
                    Top = 23
                    Width = 100
                    Height = 17
                    Alignment = taCenter
                    AutoSize = False
                    BevelKind = bkFlat
                    BorderStyle = sbsSunken
                    Caption = 'CMD'
                    TabOrder = 0
                  end
                  object StaticText167: TStaticText
                    Left = 8
                    Top = 47
                    Width = 100
                    Height = 17
                    Alignment = taCenter
                    AutoSize = False
                    BevelKind = bkFlat
                    BorderStyle = sbsSunken
                    Caption = 'DATA'
                    TabOrder = 1
                  end
                  object btn_RemoteSendPacket: TRzBitBtn
                    Left = 114
                    Top = 71
                    Width = 90
                    Caption = #51204#49569
                    Color = 15791348
                    HighlightColor = 16026986
                    HotTrack = True
                    HotTrackColor = 3983359
                    TabOrder = 2
                    OnClick = btn_RemoteSendPacketClick
                  end
                  object ed_RemoteCmd: TEdit
                    Left = 118
                    Top = 21
                    Width = 19
                    Height = 20
                    Hint = '1'
                    AutoSize = False
                    BevelKind = bkFlat
                    ImeName = 'Microsoft IME 2003'
                    MaxLength = 1
                    TabOrder = 3
                  end
                  object ed_RemoteData: TEdit
                    Left = 118
                    Top = 45
                    Width = 267
                    Height = 20
                    Hint = '1'
                    AutoSize = False
                    BevelKind = bkFlat
                    ImeName = 'Microsoft IME 2003'
                    TabOrder = 4
                  end
                end
              end
              object GroupBox33: TGroupBox
                Left = 0
                Top = 177
                Width = 836
                Height = 120
                Align = alTop
                Caption = #51228#50612#44208#44284
                TabOrder = 2
                object StaticText56: TStaticText
                  Left = 8
                  Top = 23
                  Width = 100
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #54868#51116#48373#44396#49345#53468
                  TabOrder = 0
                end
                object st_FireResult: TStaticText
                  Left = 112
                  Top = 23
                  Width = 337
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  ParentColor = False
                  TabOrder = 1
                end
                object StaticText59: TStaticText
                  Left = 8
                  Top = 45
                  Width = 100
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #49884#44036#46041#44592#54868#44208#44284
                  TabOrder = 2
                end
                object st_Time1: TStaticText
                  Left = 112
                  Top = 45
                  Width = 337
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  ParentColor = False
                  TabOrder = 3
                end
                object StaticText146: TStaticText
                  Left = 8
                  Top = 69
                  Width = 100
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #47700#47784#47532#51648#50880#44208#44284
                  TabOrder = 4
                end
                object st_MemoryClearResult: TStaticText
                  Left = 112
                  Top = 69
                  Width = 337
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  ParentColor = False
                  TabOrder = 5
                end
                object st_DeviceResetResult: TStaticText
                  Left = 112
                  Top = 93
                  Width = 337
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Color = clWhite
                  ParentColor = False
                  TabOrder = 6
                end
                object StaticText149: TStaticText
                  Left = 8
                  Top = 93
                  Width = 100
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #51109#48708#47532#49483#44208#44284
                  TabOrder = 7
                end
              end
            end
          end
        end
        object tabDeviceState: TTabSheet
          Caption = #49345#53468#51312#54924
          ImageIndex = 9
          object pg_DeviceState: TPageControl
            Left = 0
            Top = 0
            Width = 844
            Height = 446
            ActivePage = tabPortState
            Align = alClient
            TabOrder = 0
            OnChange = pg_DeviceSettingChange
            object tabLockState: TTabSheet
              Caption = #46973#49345#53468
              object gb_LoackState: TGroupBox
                Left = 0
                Top = 41
                Width = 836
                Height = 378
                Align = alClient
                Caption = #44592#44592#49345#53468
                TabOrder = 0
                object RzPanel13: TRzPanel
                  Left = 78
                  Top = 14
                  Width = 80
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'1'
                  TabOrder = 0
                end
                object RzPanel14: TRzPanel
                  Left = 167
                  Top = 14
                  Width = 80
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'2'
                  TabOrder = 1
                end
                object StaticText47: TStaticText
                  Left = 8
                  Top = 45
                  Width = 57
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = 'COM/NO'
                  TabOrder = 2
                end
                object StaticText48: TStaticText
                  Left = 8
                  Top = 69
                  Width = 57
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = 'EX/GND'
                  TabOrder = 3
                end
                object StaticText49: TStaticText
                  Left = 8
                  Top = 93
                  Width = 57
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = 'DS/GND'
                  TabOrder = 4
                end
                object StaticText50: TStaticText
                  Left = 8
                  Top = 141
                  Width = 57
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #54868#51116
                  TabOrder = 5
                end
                object cmb_COMNO1: TRzComboBox
                  Left = 78
                  Top = 43
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 6
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_COMNO2: TRzComboBox
                  Left = 167
                  Top = 43
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 7
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_ExGnd2: TRzComboBox
                  Left = 167
                  Top = 67
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 8
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_ExGnd1: TRzComboBox
                  Left = 78
                  Top = 67
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 9
                  Items.Strings = (
                    'OPEN'
                    'SHORT'
                    '')
                end
                object cmb_dsgnd2: TRzComboBox
                  Left = 167
                  Top = 91
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 10
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_dsgnd1: TRzComboBox
                  Left = 78
                  Top = 91
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 11
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_Firestat: TRzComboBox
                  Left = 78
                  Top = 139
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 12
                  Items.Strings = (
                    #51221#49345
                    #54868#51116#48156#49373)
                end
                object StaticText51: TStaticText
                  Left = 8
                  Top = 165
                  Width = 57
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #48169#48276#49345#53468
                  TabOrder = 13
                end
                object btn_FireDevice: TRzBitBtn
                  Left = 167
                  Top = 137
                  Width = 80
                  Caption = #54868#51116#48156#49373#44592#44592#51312#54924
                  Color = 15791348
                  Enabled = False
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 14
                  OnClick = btn_FireDeviceClick
                end
                object st_AlarmState21: TStaticText
                  Left = 78
                  Top = 165
                  Width = 80
                  Height = 17
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 15
                end
                object StaticText4: TStaticText
                  Left = 8
                  Top = 117
                  Width = 57
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = 'LS/GND'
                  TabOrder = 16
                end
                object cmb_lsgnd1: TRzComboBox
                  Left = 78
                  Top = 115
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 17
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_lsgnd2: TRzComboBox
                  Left = 167
                  Top = 115
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 18
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object RzPanel58: TRzPanel
                  Left = 254
                  Top = 14
                  Width = 80
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'3'
                  TabOrder = 19
                end
                object RzPanel59: TRzPanel
                  Left = 343
                  Top = 14
                  Width = 80
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'4'
                  TabOrder = 20
                end
                object cmb_COMNO4: TRzComboBox
                  Left = 343
                  Top = 43
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 21
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_COMNO3: TRzComboBox
                  Left = 254
                  Top = 43
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 22
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_ExGnd3: TRzComboBox
                  Left = 254
                  Top = 67
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 23
                  Items.Strings = (
                    'OPEN'
                    'SHORT'
                    '')
                end
                object cmb_ExGnd4: TRzComboBox
                  Left = 343
                  Top = 67
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 24
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_dsgnd4: TRzComboBox
                  Left = 343
                  Top = 91
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 25
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_dsgnd3: TRzComboBox
                  Left = 254
                  Top = 91
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 26
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_lsgnd3: TRzComboBox
                  Left = 254
                  Top = 115
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 27
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_lsgnd4: TRzComboBox
                  Left = 343
                  Top = 115
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 28
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object RzPanel60: TRzPanel
                  Left = 430
                  Top = 14
                  Width = 80
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'5'
                  TabOrder = 29
                end
                object RzPanel61: TRzPanel
                  Left = 519
                  Top = 14
                  Width = 80
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'6'
                  TabOrder = 30
                end
                object cmb_COMNO6: TRzComboBox
                  Left = 519
                  Top = 43
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 31
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_COMNO5: TRzComboBox
                  Left = 430
                  Top = 43
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 32
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_ExGnd5: TRzComboBox
                  Left = 430
                  Top = 67
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 33
                  Items.Strings = (
                    'OPEN'
                    'SHORT'
                    '')
                end
                object cmb_ExGnd6: TRzComboBox
                  Left = 519
                  Top = 67
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 34
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_dsgnd6: TRzComboBox
                  Left = 519
                  Top = 91
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 35
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_dsgnd5: TRzComboBox
                  Left = 430
                  Top = 91
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 36
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_lsgnd5: TRzComboBox
                  Left = 430
                  Top = 115
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 37
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_lsgnd6: TRzComboBox
                  Left = 519
                  Top = 115
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 38
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object RzPanel62: TRzPanel
                  Left = 606
                  Top = 14
                  Width = 80
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'7'
                  TabOrder = 39
                end
                object RzPanel63: TRzPanel
                  Left = 695
                  Top = 14
                  Width = 80
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #52636#51077#47928'8'
                  TabOrder = 40
                end
                object cmb_COMNO8: TRzComboBox
                  Left = 695
                  Top = 43
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 41
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_COMNO7: TRzComboBox
                  Left = 606
                  Top = 43
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 42
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_ExGnd7: TRzComboBox
                  Left = 606
                  Top = 67
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 43
                  Items.Strings = (
                    'OPEN'
                    'SHORT'
                    '')
                end
                object cmb_ExGnd8: TRzComboBox
                  Left = 695
                  Top = 67
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 44
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_dsgnd8: TRzComboBox
                  Left = 695
                  Top = 91
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 45
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_dsgnd7: TRzComboBox
                  Left = 606
                  Top = 91
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 46
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_lsgnd7: TRzComboBox
                  Left = 606
                  Top = 115
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 47
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object cmb_lsgnd8: TRzComboBox
                  Left = 695
                  Top = 115
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 48
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object st_AlarmState22: TStaticText
                  Left = 166
                  Top = 165
                  Width = 80
                  Height = 17
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 49
                end
                object st_AlarmState23: TStaticText
                  Left = 254
                  Top = 165
                  Width = 80
                  Height = 17
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 50
                end
                object st_AlarmState24: TStaticText
                  Left = 342
                  Top = 165
                  Width = 80
                  Height = 17
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 51
                end
                object st_AlarmState25: TStaticText
                  Left = 430
                  Top = 165
                  Width = 80
                  Height = 17
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 52
                end
                object st_AlarmState26: TStaticText
                  Left = 518
                  Top = 165
                  Width = 80
                  Height = 17
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 53
                end
                object st_AlarmState27: TStaticText
                  Left = 606
                  Top = 165
                  Width = 80
                  Height = 17
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 54
                end
                object st_AlarmState28: TStaticText
                  Left = 695
                  Top = 165
                  Width = 80
                  Height = 17
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clWhite
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 55
                end
                object StaticText153: TStaticText
                  Left = 8
                  Top = 189
                  Width = 57
                  Height = 17
                  Alignment = taCenter
                  AutoSize = False
                  BevelKind = bkFlat
                  BorderStyle = sbsSunken
                  Caption = #46973#53440#51077
                  TabOrder = 56
                end
                object ComboBox_LockType21: TRzComboBox
                  Left = 78
                  Top = 187
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 57
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object ComboBox_LockType22: TRzComboBox
                  Left = 166
                  Top = 187
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 58
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object ComboBox_LockType23: TRzComboBox
                  Left = 254
                  Top = 187
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 59
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object ComboBox_LockType24: TRzComboBox
                  Left = 342
                  Top = 187
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 60
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object ComboBox_LockType25: TRzComboBox
                  Left = 430
                  Top = 187
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 61
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object ComboBox_LockType26: TRzComboBox
                  Left = 518
                  Top = 187
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 62
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object ComboBox_LockType27: TRzComboBox
                  Left = 606
                  Top = 187
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 63
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object ComboBox_LockType28: TRzComboBox
                  Left = 695
                  Top = 187
                  Width = 80
                  Height = 20
                  Style = csDropDownList
                  Ctl3D = False
                  FlatButtons = True
                  FrameVisible = True
                  ImeName = 'Microsoft IME 2003'
                  ItemHeight = 12
                  ParentCtl3D = False
                  ReadOnly = True
                  TabOrder = 64
                  Items.Strings = (
                    'OPEN'
                    'SHORT')
                end
                object sg_FireDevice: TAdvStringGrid
                  Left = 168
                  Top = 160
                  Width = 161
                  Height = 129
                  Cursor = crDefault
                  ColCount = 1
                  DefaultColWidth = 90
                  DefaultRowHeight = 21
                  FixedCols = 0
                  RowCount = 2
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goEditing, goRowSelect]
                  ParentFont = False
                  PopupMenu = Popup_Device
                  ScrollBars = ssBoth
                  TabOrder = 65
                  Visible = False
                  ActiveCellFont.Charset = DEFAULT_CHARSET
                  ActiveCellFont.Color = clWindowText
                  ActiveCellFont.Height = -11
                  ActiveCellFont.Name = 'Tahoma'
                  ActiveCellFont.Style = [fsBold]
                  ColumnHeaders.Strings = (
                    #54868#51116#44048#51648#52968#53944#47204#47084)
                  ControlLook.FixedGradientHoverFrom = clGray
                  ControlLook.FixedGradientHoverTo = clWhite
                  ControlLook.FixedGradientDownFrom = clGray
                  ControlLook.FixedGradientDownTo = clSilver
                  ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
                  ControlLook.DropDownHeader.Font.Color = clWindowText
                  ControlLook.DropDownHeader.Font.Height = -11
                  ControlLook.DropDownHeader.Font.Name = 'Tahoma'
                  ControlLook.DropDownHeader.Font.Style = []
                  ControlLook.DropDownHeader.Visible = True
                  ControlLook.DropDownHeader.Buttons = <>
                  ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
                  ControlLook.DropDownFooter.Font.Color = clWindowText
                  ControlLook.DropDownFooter.Font.Height = -11
                  ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
                  ControlLook.DropDownFooter.Font.Style = []
                  ControlLook.DropDownFooter.Visible = True
                  ControlLook.DropDownFooter.Buttons = <>
                  Filter = <>
                  FilterDropDown.Font.Charset = DEFAULT_CHARSET
                  FilterDropDown.Font.Color = clWindowText
                  FilterDropDown.Font.Height = -11
                  FilterDropDown.Font.Name = 'MS Sans Serif'
                  FilterDropDown.Font.Style = []
                  FilterDropDownClear = '(All)'
                  FixedColWidth = 146
                  FixedFont.Charset = DEFAULT_CHARSET
                  FixedFont.Color = clWindowText
                  FixedFont.Height = -11
                  FixedFont.Name = 'Tahoma'
                  FixedFont.Style = [fsBold]
                  FloatFormat = '%.2f'
                  PrintSettings.DateFormat = 'dd/mm/yyyy'
                  PrintSettings.Font.Charset = DEFAULT_CHARSET
                  PrintSettings.Font.Color = clWindowText
                  PrintSettings.Font.Height = -11
                  PrintSettings.Font.Name = 'MS Sans Serif'
                  PrintSettings.Font.Style = []
                  PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
                  PrintSettings.FixedFont.Color = clWindowText
                  PrintSettings.FixedFont.Height = -11
                  PrintSettings.FixedFont.Name = 'MS Sans Serif'
                  PrintSettings.FixedFont.Style = []
                  PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
                  PrintSettings.HeaderFont.Color = clWindowText
                  PrintSettings.HeaderFont.Height = -11
                  PrintSettings.HeaderFont.Name = 'MS Sans Serif'
                  PrintSettings.HeaderFont.Style = []
                  PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
                  PrintSettings.FooterFont.Color = clWindowText
                  PrintSettings.FooterFont.Height = -11
                  PrintSettings.FooterFont.Name = 'MS Sans Serif'
                  PrintSettings.FooterFont.Style = []
                  PrintSettings.PageNumSep = '/'
                  ScrollSynch = True
                  SearchFooter.FindNextCaption = 'Find next'
                  SearchFooter.FindPrevCaption = 'Find previous'
                  SearchFooter.Font.Charset = DEFAULT_CHARSET
                  SearchFooter.Font.Color = clWindowText
                  SearchFooter.Font.Height = -11
                  SearchFooter.Font.Name = 'MS Sans Serif'
                  SearchFooter.Font.Style = []
                  SearchFooter.HighLightCaption = 'Highlight'
                  SearchFooter.HintClose = 'Close'
                  SearchFooter.HintFindNext = 'Find next occurence'
                  SearchFooter.HintFindPrev = 'Find previous occurence'
                  SearchFooter.HintHighlight = 'Highlight occurences'
                  SearchFooter.MatchCaseCaption = 'Match case'
                  Version = '6.0.4.4'
                  ColWidths = (
                    146)
                end
              end
              object Panel13: TPanel
                Left = 0
                Top = 0
                Width = 836
                Height = 41
                Align = alTop
                Caption = #46973#51032' '#54788#51116' '#46041#51089#49345#53468#47484' '#54869#51064#54633#45768#45796'.'
                Color = clGradientActiveCaption
                Font.Charset = HANGEUL_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = #44404#47548#52404
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
            end
            object tabPortState: TTabSheet
              Caption = #51316#49345#53468
              ImageIndex = 1
              object gb_LocalPortState: TGroupBox
                Left = 64
                Top = 8
                Width = 80
                Height = 265
                Caption = #47196#52972
                TabOrder = 0
                object pan_ZonState0: TRzPanel
                  Left = 5
                  Top = 30
                  Width = 70
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #51316#49345#53468
                  TabOrder = 0
                end
                object st_ZoneState1: TStaticText
                  Left = 5
                  Top = 59
                  Width = 70
                  Height = 20
                  Hint = '1'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                end
                object st_ZoneState2: TStaticText
                  Left = 5
                  Top = 83
                  Width = 70
                  Height = 20
                  Hint = '2'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                end
                object st_ZoneState3: TStaticText
                  Left = 5
                  Top = 108
                  Width = 70
                  Height = 20
                  Hint = '3'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                end
                object st_ZoneState4: TStaticText
                  Left = 5
                  Top = 132
                  Width = 70
                  Height = 20
                  Hint = '4'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                end
                object st_ZoneState5: TStaticText
                  Left = 5
                  Top = 157
                  Width = 70
                  Height = 20
                  Hint = '5'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                end
                object st_ZoneState6: TStaticText
                  Left = 5
                  Top = 181
                  Width = 70
                  Height = 20
                  Hint = '6'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 6
                end
                object st_ZoneState7: TStaticText
                  Left = 5
                  Top = 206
                  Width = 70
                  Height = 20
                  Hint = '7'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 7
                end
                object st_ZoneState8: TStaticText
                  Left = 5
                  Top = 231
                  Width = 70
                  Height = 20
                  Hint = '8'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 8
                end
              end
              object RzPanel15: TRzPanel
                Left = 10
                Top = 39
                Width = 50
                Height = 25
                BorderOuter = fsButtonDown
                Caption = #51316#48264#54840
                TabOrder = 1
              end
              object StaticText58: TStaticText
                Left = 10
                Top = 70
                Width = 50
                Height = 17
                Alignment = taCenter
                AutoSize = False
                BevelKind = bkFlat
                BorderStyle = sbsSunken
                Caption = '1'
                Color = 16776176
                ParentColor = False
                TabOrder = 2
              end
              object StaticText60: TStaticText
                Left = 10
                Top = 94
                Width = 50
                Height = 17
                Alignment = taCenter
                AutoSize = False
                BevelKind = bkFlat
                BorderStyle = sbsSunken
                Caption = '2'
                Color = 16776176
                ParentColor = False
                TabOrder = 3
              end
              object StaticText147: TStaticText
                Left = 10
                Top = 119
                Width = 50
                Height = 17
                Alignment = taCenter
                AutoSize = False
                BevelKind = bkFlat
                BorderStyle = sbsSunken
                Caption = '3'
                Color = 16776176
                ParentColor = False
                TabOrder = 4
              end
              object StaticText148: TStaticText
                Left = 10
                Top = 143
                Width = 50
                Height = 17
                Alignment = taCenter
                AutoSize = False
                BevelKind = bkFlat
                BorderStyle = sbsSunken
                Caption = '4'
                Color = 16776176
                ParentColor = False
                TabOrder = 5
              end
              object StaticText150: TStaticText
                Left = 10
                Top = 168
                Width = 50
                Height = 17
                Alignment = taCenter
                AutoSize = False
                BevelKind = bkFlat
                BorderStyle = sbsSunken
                Caption = '5'
                Color = 16776176
                ParentColor = False
                TabOrder = 6
              end
              object StaticText151: TStaticText
                Left = 10
                Top = 192
                Width = 50
                Height = 17
                Alignment = taCenter
                AutoSize = False
                BevelKind = bkFlat
                BorderStyle = sbsSunken
                Caption = '6'
                Color = 16776176
                ParentColor = False
                TabOrder = 7
              end
              object StaticText158: TStaticText
                Left = 10
                Top = 217
                Width = 50
                Height = 17
                Alignment = taCenter
                AutoSize = False
                BevelKind = bkFlat
                BorderStyle = sbsSunken
                Caption = '7'
                Color = 16776176
                ParentColor = False
                TabOrder = 8
              end
              object StaticText161: TStaticText
                Left = 10
                Top = 242
                Width = 50
                Height = 17
                Alignment = taCenter
                AutoSize = False
                BevelKind = bkFlat
                BorderStyle = sbsSunken
                Caption = '8'
                Color = 16776176
                ParentColor = False
                TabOrder = 9
              end
              object gb_ZoneExtensionState1: TGroupBox
                Left = 144
                Top = 8
                Width = 80
                Height = 265
                Caption = #44048#51109#44592'1'
                TabOrder = 10
                object RzPanel8: TRzPanel
                  Left = 5
                  Top = 30
                  Width = 70
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #51316#49345#53468
                  TabOrder = 0
                end
                object st_ZoneState11: TStaticText
                  Left = 5
                  Top = 59
                  Width = 70
                  Height = 20
                  Hint = '1'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                end
                object st_ZoneState12: TStaticText
                  Left = 5
                  Top = 83
                  Width = 70
                  Height = 20
                  Hint = '2'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                end
                object st_ZoneState13: TStaticText
                  Left = 5
                  Top = 108
                  Width = 70
                  Height = 20
                  Hint = '3'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                end
                object st_ZoneState14: TStaticText
                  Left = 5
                  Top = 132
                  Width = 70
                  Height = 20
                  Hint = '4'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                end
                object st_ZoneState15: TStaticText
                  Left = 5
                  Top = 157
                  Width = 70
                  Height = 20
                  Hint = '5'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                end
                object st_ZoneState16: TStaticText
                  Left = 5
                  Top = 181
                  Width = 70
                  Height = 20
                  Hint = '6'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 6
                end
                object st_ZoneState17: TStaticText
                  Left = 5
                  Top = 206
                  Width = 70
                  Height = 20
                  Hint = '7'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 7
                end
                object st_ZoneState18: TStaticText
                  Left = 5
                  Top = 231
                  Width = 70
                  Height = 20
                  Hint = '8'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 8
                end
              end
              object gb_ZoneExtensionState2: TGroupBox
                Left = 224
                Top = 8
                Width = 80
                Height = 265
                Caption = #44048#51109#44592'2'
                TabOrder = 11
                object RzPanel19: TRzPanel
                  Left = 5
                  Top = 30
                  Width = 70
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #51316#49345#53468
                  TabOrder = 0
                end
                object st_ZoneState21: TStaticText
                  Left = 5
                  Top = 59
                  Width = 70
                  Height = 20
                  Hint = '1'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                end
                object st_ZoneState22: TStaticText
                  Left = 5
                  Top = 83
                  Width = 70
                  Height = 20
                  Hint = '2'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                end
                object st_ZoneState23: TStaticText
                  Left = 5
                  Top = 108
                  Width = 70
                  Height = 20
                  Hint = '3'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                end
                object st_ZoneState24: TStaticText
                  Left = 5
                  Top = 132
                  Width = 70
                  Height = 20
                  Hint = '4'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                end
                object st_ZoneState25: TStaticText
                  Left = 5
                  Top = 157
                  Width = 70
                  Height = 20
                  Hint = '5'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                end
                object st_ZoneState26: TStaticText
                  Left = 5
                  Top = 181
                  Width = 70
                  Height = 20
                  Hint = '6'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 6
                end
                object st_ZoneState27: TStaticText
                  Left = 5
                  Top = 206
                  Width = 70
                  Height = 20
                  Hint = '7'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 7
                end
                object st_ZoneState28: TStaticText
                  Left = 5
                  Top = 231
                  Width = 70
                  Height = 20
                  Hint = '8'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 8
                end
              end
              object gb_ZoneExtensionState3: TGroupBox
                Left = 304
                Top = 8
                Width = 80
                Height = 265
                Caption = #44048#51109#44592'3'
                TabOrder = 12
                object RzPanel25: TRzPanel
                  Left = 5
                  Top = 30
                  Width = 70
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #51316#49345#53468
                  TabOrder = 0
                end
                object st_ZoneState31: TStaticText
                  Left = 5
                  Top = 59
                  Width = 70
                  Height = 20
                  Hint = '1'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                end
                object st_ZoneState32: TStaticText
                  Left = 5
                  Top = 83
                  Width = 70
                  Height = 20
                  Hint = '2'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                end
                object st_ZoneState33: TStaticText
                  Left = 5
                  Top = 108
                  Width = 70
                  Height = 20
                  Hint = '3'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                end
                object st_ZoneState34: TStaticText
                  Left = 5
                  Top = 132
                  Width = 70
                  Height = 20
                  Hint = '4'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                end
                object st_ZoneState35: TStaticText
                  Left = 5
                  Top = 157
                  Width = 70
                  Height = 20
                  Hint = '5'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                end
                object st_ZoneState36: TStaticText
                  Left = 5
                  Top = 181
                  Width = 70
                  Height = 20
                  Hint = '6'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 6
                end
                object st_ZoneState37: TStaticText
                  Left = 5
                  Top = 206
                  Width = 70
                  Height = 20
                  Hint = '7'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 7
                end
                object st_ZoneState38: TStaticText
                  Left = 5
                  Top = 231
                  Width = 70
                  Height = 20
                  Hint = '8'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 8
                end
              end
              object gb_ZoneExtensionState4: TGroupBox
                Left = 384
                Top = 8
                Width = 80
                Height = 265
                Caption = #44048#51109#44592'4'
                TabOrder = 13
                object RzPanel27: TRzPanel
                  Left = 5
                  Top = 30
                  Width = 70
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #51316#49345#53468
                  TabOrder = 0
                end
                object st_ZoneState41: TStaticText
                  Left = 5
                  Top = 59
                  Width = 70
                  Height = 20
                  Hint = '1'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                end
                object st_ZoneState42: TStaticText
                  Left = 5
                  Top = 83
                  Width = 70
                  Height = 20
                  Hint = '2'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                end
                object st_ZoneState43: TStaticText
                  Left = 5
                  Top = 108
                  Width = 70
                  Height = 20
                  Hint = '3'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                end
                object st_ZoneState44: TStaticText
                  Left = 5
                  Top = 132
                  Width = 70
                  Height = 20
                  Hint = '4'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                end
                object st_ZoneState45: TStaticText
                  Left = 5
                  Top = 157
                  Width = 70
                  Height = 20
                  Hint = '5'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                end
                object st_ZoneState46: TStaticText
                  Left = 5
                  Top = 181
                  Width = 70
                  Height = 20
                  Hint = '6'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 6
                end
                object st_ZoneState47: TStaticText
                  Left = 5
                  Top = 206
                  Width = 70
                  Height = 20
                  Hint = '7'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 7
                end
                object st_ZoneState48: TStaticText
                  Left = 5
                  Top = 231
                  Width = 70
                  Height = 20
                  Hint = '8'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 8
                end
              end
              object gb_ZoneExtensionState5: TGroupBox
                Left = 464
                Top = 8
                Width = 80
                Height = 265
                Caption = #44048#51109#44592'5'
                TabOrder = 14
                object RzPanel31: TRzPanel
                  Left = 5
                  Top = 30
                  Width = 70
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #51316#49345#53468
                  TabOrder = 0
                end
                object st_ZoneState51: TStaticText
                  Left = 5
                  Top = 59
                  Width = 70
                  Height = 20
                  Hint = '1'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                end
                object st_ZoneState52: TStaticText
                  Left = 5
                  Top = 83
                  Width = 70
                  Height = 20
                  Hint = '2'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                end
                object st_ZoneState53: TStaticText
                  Left = 5
                  Top = 108
                  Width = 70
                  Height = 20
                  Hint = '3'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                end
                object st_ZoneState54: TStaticText
                  Left = 5
                  Top = 132
                  Width = 70
                  Height = 20
                  Hint = '4'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                end
                object st_ZoneState55: TStaticText
                  Left = 5
                  Top = 157
                  Width = 70
                  Height = 20
                  Hint = '5'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                end
                object st_ZoneState56: TStaticText
                  Left = 5
                  Top = 181
                  Width = 70
                  Height = 20
                  Hint = '6'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 6
                end
                object st_ZoneState57: TStaticText
                  Left = 5
                  Top = 206
                  Width = 70
                  Height = 20
                  Hint = '7'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 7
                end
                object st_ZoneState58: TStaticText
                  Left = 5
                  Top = 231
                  Width = 70
                  Height = 20
                  Hint = '8'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 8
                end
              end
              object gb_ZoneExtensionState6: TGroupBox
                Left = 544
                Top = 8
                Width = 80
                Height = 265
                Caption = #44048#51109#44592'6'
                TabOrder = 15
                object RzPanel35: TRzPanel
                  Left = 5
                  Top = 30
                  Width = 70
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #51316#49345#53468
                  TabOrder = 0
                end
                object st_ZoneState61: TStaticText
                  Left = 5
                  Top = 59
                  Width = 70
                  Height = 20
                  Hint = '1'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                end
                object st_ZoneState62: TStaticText
                  Left = 5
                  Top = 83
                  Width = 70
                  Height = 20
                  Hint = '2'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                end
                object st_ZoneState63: TStaticText
                  Left = 5
                  Top = 108
                  Width = 70
                  Height = 20
                  Hint = '3'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                end
                object st_ZoneState64: TStaticText
                  Left = 5
                  Top = 132
                  Width = 70
                  Height = 20
                  Hint = '4'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                end
                object st_ZoneState65: TStaticText
                  Left = 5
                  Top = 157
                  Width = 70
                  Height = 20
                  Hint = '5'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                end
                object st_ZoneState66: TStaticText
                  Left = 5
                  Top = 181
                  Width = 70
                  Height = 20
                  Hint = '6'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 6
                end
                object st_ZoneState67: TStaticText
                  Left = 5
                  Top = 206
                  Width = 70
                  Height = 20
                  Hint = '7'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 7
                end
                object st_ZoneState68: TStaticText
                  Left = 5
                  Top = 231
                  Width = 70
                  Height = 20
                  Hint = '8'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 8
                end
              end
              object gb_ZoneExtensionState7: TGroupBox
                Left = 624
                Top = 8
                Width = 80
                Height = 265
                Caption = #44048#51109#44592'7'
                TabOrder = 16
                object RzPanel39: TRzPanel
                  Left = 5
                  Top = 30
                  Width = 70
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #51316#49345#53468
                  TabOrder = 0
                end
                object st_ZoneState71: TStaticText
                  Left = 5
                  Top = 59
                  Width = 70
                  Height = 20
                  Hint = '1'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                end
                object st_ZoneState72: TStaticText
                  Left = 5
                  Top = 83
                  Width = 70
                  Height = 20
                  Hint = '2'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                end
                object st_ZoneState73: TStaticText
                  Left = 5
                  Top = 108
                  Width = 70
                  Height = 20
                  Hint = '3'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                end
                object st_ZoneState74: TStaticText
                  Left = 5
                  Top = 132
                  Width = 70
                  Height = 20
                  Hint = '4'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                end
                object st_ZoneState75: TStaticText
                  Left = 5
                  Top = 157
                  Width = 70
                  Height = 20
                  Hint = '5'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                end
                object st_ZoneState76: TStaticText
                  Left = 5
                  Top = 181
                  Width = 70
                  Height = 20
                  Hint = '6'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 6
                end
                object st_ZoneState77: TStaticText
                  Left = 5
                  Top = 206
                  Width = 70
                  Height = 20
                  Hint = '7'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 7
                end
                object st_ZoneState78: TStaticText
                  Left = 5
                  Top = 231
                  Width = 70
                  Height = 20
                  Hint = '8'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 8
                end
              end
              object gb_ZoneExtensionState8: TGroupBox
                Left = 704
                Top = 8
                Width = 80
                Height = 265
                Caption = #44048#51109#44592'8'
                TabOrder = 17
                object RzPanel43: TRzPanel
                  Left = 5
                  Top = 30
                  Width = 70
                  Height = 25
                  BorderOuter = fsButtonDown
                  Caption = #51316#49345#53468
                  TabOrder = 0
                end
                object st_ZoneState81: TStaticText
                  Left = 5
                  Top = 59
                  Width = 70
                  Height = 20
                  Hint = '1'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                end
                object st_ZoneState82: TStaticText
                  Left = 5
                  Top = 83
                  Width = 70
                  Height = 20
                  Hint = '2'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 2
                end
                object st_ZoneState83: TStaticText
                  Left = 5
                  Top = 108
                  Width = 70
                  Height = 20
                  Hint = '3'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 3
                end
                object st_ZoneState84: TStaticText
                  Left = 5
                  Top = 132
                  Width = 70
                  Height = 20
                  Hint = '4'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 4
                end
                object st_ZoneState85: TStaticText
                  Left = 5
                  Top = 157
                  Width = 70
                  Height = 20
                  Hint = '5'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 5
                end
                object st_ZoneState86: TStaticText
                  Left = 5
                  Top = 181
                  Width = 70
                  Height = 20
                  Hint = '6'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 6
                end
                object st_ZoneState87: TStaticText
                  Left = 5
                  Top = 206
                  Width = 70
                  Height = 20
                  Hint = '7'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 7
                end
                object st_ZoneState88: TStaticText
                  Left = 5
                  Top = 231
                  Width = 70
                  Height = 20
                  Hint = '8'
                  Alignment = taCenter
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 8
                end
              end
            end
            object tabEtcState: TTabSheet
              Caption = #44592#53440
              ImageIndex = 2
              object GroupBox5: TGroupBox
                Left = 0
                Top = 0
                Width = 836
                Height = 73
                Align = alTop
                TabOrder = 0
                object btn_ShortCheck: TRzBitBtn
                  Tag = 1
                  Left = 16
                  Top = 24
                  Width = 129
                  Hint = '131'
                  Caption = #53685#49888#49440#47196' '#49660#53944#52404#53356
                  Color = 15791348
                  HighlightColor = 16026986
                  HotTrack = True
                  HotTrackColor = 3983359
                  TabOrder = 0
                  OnClick = btn_ShortCheckClick
                end
                object st_LineShortCheck: TStaticText
                  Left = 150
                  Top = 28
                  Width = 363
                  Height = 17
                  AutoSize = False
                  BorderStyle = sbsSunken
                  Color = clWhite
                  Font.Charset = HANGEUL_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = #44404#47548#52404
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  TabOrder = 1
                end
              end
            end
          end
        end
      end
    end
  end
  object pan_Message: TPanel [3]
    Left = 626
    Top = 488
    Width = 505
    Height = 105
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clBlack
    Font.Height = -17
    Font.Name = #44404#47548
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
    object Panel18: TPanel
      Left = 1
      Top = 1
      Width = 503
      Height = 7
      Align = alTop
      BevelInner = bvLowered
      Color = clRed
      TabOrder = 0
    end
    object Panel19: TPanel
      Left = 1
      Top = 97
      Width = 503
      Height = 7
      Align = alBottom
      BevelInner = bvLowered
      Color = clRed
      TabOrder = 1
    end
    object Panel20: TPanel
      Left = 497
      Top = 8
      Width = 7
      Height = 89
      Align = alRight
      BevelInner = bvLowered
      Color = clRed
      TabOrder = 2
    end
    object Panel21: TPanel
      Left = 1
      Top = 8
      Width = 7
      Height = 89
      Align = alLeft
      BevelInner = bvLowered
      Color = clRed
      TabOrder = 3
    end
    object ProgressBar1: TProgressBar
      Left = 16
      Top = 80
      Width = 473
      Height = 17
      TabOrder = 4
    end
  end
  inherited CommandArray: TCommandArray
    Commands = <
      item
        CommandName = 'DETAILVIEW'
        CommandKind = 0
        Name = 'TDETAILVIEW'
        OnExecute = CommandArrayCommandsTDETAILVIEWExecute
      end>
  end
  object toolslist: TImageList
    BkColor = clWhite
    Left = 72
    Top = 168
    Bitmap = {
      494C01010D000E00040010001000FFFFFF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF00000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF00
      000000000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF00000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF00FFFFFF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FF000000FF000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000FF000000FF00FFFF
      FF00FFFFFF000000FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF00000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FF000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF00000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FF000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF00000000000000FFFF
      FF00FFFFFF00FF000000FF000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF0000000000
      0000FF000000FF000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF000000FF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF01C4EDF84D0496F0F06DCFF1B3C0EEFB0EFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0F0291F0FB018EF0FF018EF0FFB5E9F782FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      000080800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF080598F0B4018EF0FF018EF0F8C4EEF949FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      00008080000080800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C4F0FB008AE0F88FC4F0FB48F2FAFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000008D1A00008D1A00008D1A00008D1A0000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000008C0000008C0000008C0000008C00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0ECBE00ECE5B900E0CFAA00E0CF
      AA00E0CFAA00E0CFAA00ECE5B900FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      000080800000808000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBFDFF01D5F4F94A24AEEFDEE1EDF1A8FEFFFF0EFFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00008D1A00008D1A00009E1E00009E1E00008D1A00008D1A00008D1A00008D1A
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000008C0000008C0000009C0000009C0000008C0000008C0000008C000000
      8C0000000000FFFFFF00FFFFFF00FFFFFF00ECE5B900C49D8700B0796E00B079
      6E00B0796E00B0796E00C49D870000000000000000000000000000000000FFFF
      000080800000808000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBFDFF0E018EF0F3018EF0FF40BAE8FFFBFAFC72FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00008D1A00008D1A0000AF2100009E1E0000AF2100008D1A00009E1E00009E1E
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000008C0000008C000000AD0000009C000000AD0000008C0000009C000000
      9C0000000000FFFFFF00FFFFFF00FFFFFF00E0CFAA009AB0AE00728F9400557A
      8F00496D8100384E5A00B0796E00B3A9AC00C0C0C000C0C0C00000000000FFFF
      000080800000808000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBFDFF0E018EF0ED018EF0FF018EF0FFE4E8ECBBFBFDFF14FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008D1A
      00008D1A0000AF210000D6280000D6280000D6280000AF210000AF2100008D1A
      00008D1A000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      8C0000008C000000AD000000CE000000CE000000CE000000AD000000AD000000
      8C0000008C0000000000FFFFFF00FFFFFF0081120C00C1DDDA00FFFFFF00A9C9
      DB0064AED8006CACD00081120C00B3A9AC00C0C0C000C0C0C00000000000FFFF
      000000000000808000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FBFDFF011FADF281018EF0FF018EF0FF018EF0FF8AD3EAEBE7F3
      F980F6FCFF06FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008D1A
      00009E1E0000D6280000EE2D0000EE2D0000D6280000EE2D0000AF2100009E1E
      00008D1A000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      8C0000009C000000CE000000DE000000DE000000CE000000DE000000AD000000
      9C0000008C0000000000FFFFFF00FFFFFF0081120C00D3E9E700FDFFFF008112
      0C00A2CAE2006AACD20081120C00B3A9AC00C0C0C000C0C0C00000000000FFFF
      0000FFFFFF00808000000000000080808000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A7E9FA0C018EF0B3018EF0FF018EF0FF018EF0FF018E
      F0FFABE1F1B1FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000AF21
      0000D6280000FF4C2400FF4C2400FF4C2400EE2D0000EE2D0000AF2100008D1A
      00008D1A000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      AD000000CE000000FF000000FF000000FF000000DE000000DE000000AD000000
      8C0000008C0000000000FFFFFF00FFFFFF0081120C00DFEDEC00D9F3F000FCFE
      FE00AFCBD400A8C9DC0081120C00B6AEB100C0C0C000C0C0C00000000000FFFF
      000080800000808000000000000080808000FFFFFF00FFFFFF00FFFFFF00E7F9
      FE00E7F9FE0FE7F9FE00F6FCFF00F6FCFF06ABEAFA80018EF0EA018EF0FE018E
      F0FF0594F0FFDFF6FC49FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000AF21
      0000D6280000FF4C2400FFFFFF00FF4C2400EE2D0000EE2D0000AF210000AF21
      00008D1A000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      AD000000CE000000FF00FFFFFF000000FF000000DE000000DE000000AD000000
      AD0000008C0000000000FFFFFF00FFFFFF0081120C00FFFFFF00FFFFFF00FEFE
      FE00E1E4E500A5AFB50081120C00C0C0C000C0C0C000C0C0C00000000000FFFF
      000080800000808000000000000080808000FFFFFF00FFFFFF00E7F9FE019FE4
      F74D018EF0F0018EF0B3E7F9FE0CFFFFFF00FBFDFF00E7F9FE1A018EF0F1018E
      F0FF018EF0FFE2F2F988FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000EE2D0000FF4C2400FF4C2400FF4C2400EE2D0000D62800009E1E00008D1A
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000DE000000FF000000FF000000FF000000DE000000CE0000009C000000
      8C0000000000FFFFFF00FFFFFF00FFFFFF00F0ECBE0081120C0081120C00E0CF
      AA0081120C0081120C00E0CFAA00C0C0C000C0C0C000C0C0C00000000000FFFF
      000080800000808000000000000080808000FFFFFF00FFFFFF00E7F9FE0E018E
      F0F3018EF0FF018EF0FFE7F4FA80F6FCFF00FFFFFF00E7F9FE09018EF0F1018E
      F0FF018EF0FFE7F3F982FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000AF210000AF210000EE2D0000EE2D00009E1E00008D1A00008D1A00008D1A
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000AD000000AD000000DE000000DE0000009C0000008C0000008C000000
      8C0000000000FFFFFF00FFFFFF00FFFFFF00F0ECBE0081120C0081120C00BC8F
      7D0081120C0081120C00E4D6AF00C0C0C000C0C0C000C0C0C00000000000FFFF
      000080800000808000000000000080808000FFFFFF00FFFFFF00E7F9FE0E018E
      F0ED018EF0FF018EF0FF018EF0F3E7F1F786E7F3F980E0E5EBB9018EF0FE018E
      F0FF018EF0FFE7F3F979FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000AF210000AF2100008D1A00008D1A0000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000AD000000AD0000008C0000008C00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0ECBE0081120C00CECECE008112
      0C00AAAAAA0081120C00F0ECBE00C0C0C000C0C0C000C0C0C000C0C0C000FFFF
      000080800000808000000000000080808000FFFFFF00FFFFFF00E7F9FE0196E4
      FA81018EF0FF018EF0FF018EF0FF018EF0FF018EF0FF018EF0FF018EF0FF018E
      F0FF71CDEDF2E7F9FE15FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0ECBE00F0ECBE0081120C008112
      0C0081120C00F0ECBE00F0ECBE00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000FFFF0000808000000000000080808000FFFFFF00FFFFFF00FFFFFF00F6FC
      FF0C0D9EF1B1018EF0FF018EF0FF018EF0FF018EF0FF018EF0FF018EF0FF8DD4
      EBEBE1F4FB4DFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0ECBE00F0ECBE00F0ECBE00F0EC
      BE00F0ECBE00F0ECBE00F0ECBE00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000FFFF000000000000F0ECBE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E7F9FE00CDF4FD48018EF0B8018EF0F0018EF0F0018EF0E9E2F4FB80E7F9
      FE14FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C7C7
      C700FFFFFF00C7C7C700FFFEFE00FFFFFF00C3C7C800FFFDFD00C7C7C700FCFE
      FE00FDFDFD00C7C7C700FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFFFF00C0C1
      BF00FFFFFE0000000000FFFEFF00FFFFFF00BFBFBF00FFFFFF00C0C0C000FFFF
      FF00FEFEFE00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C7C7
      C700FFFFFF00FFFEFD00C6C7C500FCFEFF00C4C6C600FFFFFF00FEFDFF00C5C7
      C800FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00BFBFBF00FEFEFE00C1BF
      BF0081800000FCFF0000BDBFBF00FFFFFE00C0C0C000FFFFFF00FFFFFF00C0C0
      C000FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000404040004040400050505000404
      0400040404000204040004040400030303000204040006040300060404000A08
      0800050505000404040005050500FFFFFF00FDFFFE00C1BFBE00FFFFFF008282
      00007B7E0000FFFF0000C2C0C000FFFFFF00FFFFFF00C1C1C100FFFFFF00BFBF
      BF00FFFFFF00FFFFFF00C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000101008584000084850000828402008485000083830100FEFE0000FCFE
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001C211F000001000082800000807F
      000081810000FFFF0100FFFFFE00C0BFC100FEFEFE0020202000212121002121
      21001F1F1F001F1F1F00202020001F1F1F00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000099
      9900009999000099990000999900009999000099990000999900009999000099
      990000999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C6008485000084850000868400008286000082860000FFFF0000FFFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF0082817D00818000008180
      00007F800200FFFF0100FFFFFF00C0C0C000FFFFFF0021212100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0ECBE00ECE5B900E0CFAA00E0CF
      AA00E0CFAA00E0CFAA00ECE5B90080800000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000F0ECBE00FFFFFF00FFFFFF000099990033CC
      CC0033CCCC0033CCCC0033CCCC0033CCCC000099990033CCCC00009999000099
      99000099990000999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C6008384000084850000868400008285000086840000FFFE0200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080800081800000827F
      00007F800200FCFE00007F807E0081807C007F7F7F001F1F1F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECE5B900C49D8700B0796E00B079
      6E00B0796E00B0796E00C49D87007E7C0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000F0ECBE00FFFFFF00FFFFFF000099990000FF
      FF0033CCCC0033CCCC0033CCCC0033CCCC0033CCCC000099990033CCCC000099
      99000099990000999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008485000083840000868400008684000086840000FEFE0000FFFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00808080007F8002007F80
      020081810000FFFE02007D8084007F7E80008080800020202000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0CFAA009AB0AE00728F9400557A
      8F00496D8100384E5A00B0796E0077700000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000F0ECBE00FFFFFF00FFFFFF000099990033CC
      CC0000FFFF0033CCCC0033CCCC0033CCCC0033CCCC0033CCCC000099990033CC
      CC000099990000999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008485000083840000858300008382020000010000FFFE0000FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00808080007D8100000400
      000000000000FDFF0100828080007E817F007F7F7F0020202000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0081120C00C1DDDA00FFFFFF00A9C9
      DB0064AED8006CACD00081120C0077700000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000F0ECBE00FFFFFF00FFFFFF000099990000FF
      FF0033CCCC0000FFFF0033CCCC0033CCCC0033CCCC0033CCCC0033CCCC000099
      990033CCCC0000999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008384000083840000858300008286000000010000FFFF0100FCFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00847F8000807F00000200
      00007F800000FDFF00007E817F0080817F008080800020202000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0081120C00D3E9E700FDFFFF008112
      0C00A2CAE2006AACD20081120C0077700000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000F0ECBE00FFFFFF00FFFFFF000099990000FF
      FF0000FFFF0033CCCC0000FFFF0033CCCC0033CCCC0033CCCC0033CCCC0033CC
      CC000099990000999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000008384000084850000868400008784000084850000FCFE0000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFDFF0080817F0081810000807E
      01007E820100FFFD000080808000828080008080800020202000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0081120C00DFEDEC00D9F3F000FCFE
      FE00AFCBD400A8C9DC0081120C007A7400007C220E00FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000F0ECBE00FFFFFF00FFFFFF0000999900CCFF
      FF0000FFFF0000FFFF0033CCCC0000FFFF0033CCCC0033CCCC0033CCCC0033CC
      CC0033CCCC0000999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C7C7C7008485000084850000868400008485000089840000FFFF0100FEFD
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00807F830081810000857F
      0200817F0200FFFF010080808000808080008080800020202000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0081120C00FFFFFF00FFFFFF00FEFE
      FE00E1E4E500A5AFB50081120C00808000007C220E007C220E00FFFF0000FFFF
      0000FFFF0000FFFF000000000000F0ECBE00FFFFFF00FFFFFF0000999900CCFF
      FF00CCFFFF0000FFFF0000FFFF0033CCCC0000FFFF0033CCCC0033CCCC0033CC
      CC0033CCCC0000999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C6C6C6008384000083840000868400008384000087820100FFFF0100FDFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00818181007E7F01007F80
      020081800000FDFF00007F807E007D7F80008080800020202000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0ECBE0081120C0081120C00E0CF
      AA0081120C0081120C00E0CFAA0080800000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000F0ECBE00FFFFFF00FFFFFF00FFFFFF000099
      9900009999000099990000999900009999000099990000999900009999000099
      990000999900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000100008485000083830100848500008684000086840000FFFF0100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00807F8100807F00007F80
      00007F810000FFFF0100817E80007F7F7F008080800021212100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0ECBE0081120C0081120C00BC8F
      7D0081120C0081120C00E4D6AF0080800000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000F0ECBE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000404
      040002040500060403000604030002040500020404000404040000040200FCFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF0080808000827F00007C80
      0000FEFE0000817F7F00807F8100828080008181810020202000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0ECBE0081120C00CECECE008112
      0C00AAAAAA0081120C00F0ECBE0080800000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000F0ECBE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000808
      08008C8887008888880086878B00898688008B8988008C878900868987008887
      8900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFE00D2D0CF007F800000FFFF
      0100808080007E80810082807F0080817F008181810021212100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0ECBE00F0ECBE0081120C008112
      0C0081120C00F0ECBE00F0ECBE0080800000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF000000000000F0ECBE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFD00FFFFFF00FDFFFF00FFFFFF00FDFFFF00FEFDFF00FFFF
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFFFF00FDFFFE001F2122002020
      200020211F002020200020211F00222020001F1F1F0020202000FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0ECBE00F0ECBE00F0ECBE00F0EC
      BE00F0ECBE00F0ECBE00F0ECBE00808000008080000080800000808000008080
      0000808000008080000000000000F0ECBE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000006666660066666600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000F0FBFF00F0FBFF00A4A0A0004242420066666600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF00F0FBFF00A4A0A00066666600666666004242420000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF00FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF00A4A0A000666666006666660066666600666666006666
      6600A4A0A000FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000FFFFFF000000000000000000000000000000
      00000000FF000000FF000000000000FFFF0000FFFF0000FFFF000000FF000000
      FF000000FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      9900000099000000990000009900000099000000990000009900000099000000
      990000009900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF00A4A0A000666666006666660066666600666666006666
      6600A4A0A000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000008000000080
      000000800000C0C0C00000800000008000000080000000008000008000000080
      0000000080000080000000000000FFFFFF00FFFFFF0000800000008000000080
      0000008000000000FF000000FF0000800000008000000000FF000000FF000000
      FF00000080000080000000000000FFFFFF00FFFFFF00FFFFFF00000099000000
      CC000000CC000000CC000000CC000000CC00000099000000CC00000099000000
      99000000990000009900FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF00A4A0A000666666006666660066666600666666004242
      420000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000808080000000
      0000C0C0C0008080800000800000008000000080000000000000000000000000
      000000000000008000000000000000000000FFFFFF0000800000808080000000
      0000C0C0C0000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000008000000000000000000000FFFFFF00FFFFFF00000099000000
      FF000000CC000000CC000000CC000000CC000000CC00000099000000CC000000
      99000000990000009900FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF00F0FBFF00A4A0A000666666006666660066666600666666006666
      660000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000008000000080
      0000008000000080000000800000008000000080000000800000008000000080
      000000800000008000000000000000000000FFFFFF0000800000008000000080
      000000800000008000000000FF000000FF000000FF000000FF00008000000080
      000000800000008000000000000000000000FFFFFF00FFFFFF00000099000000
      CC000000FF000000CC000000CC000000CC000000CC000000CC00000099000000
      CC000000990000009900FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF00F0FBFF0096969600A4A0A000666666006666660042424200666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000808080000000
      0000C0C0C0008080800000800000008000000080000000800000008000000080
      000000800000008000000000000000000000FFFFFF0000800000808080000000
      0000C0C0C00080808000008000000000FF000000FF000000FF00008000000080
      000000800000008000000000000000000000FFFFFF00FFFFFF00000099000000
      FF000000CC000000FF000000CC000000CC000000CC000000CC000000CC000000
      99000000CC0000009900FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000009696
      9600F0FBFF006666660066666600666666006666660066666600666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000008000000080
      0000008000000080000000800000C0C0C000C0C0C00000800000808080008080
      800000800000C0C0C0000000000000000000FFFFFF0000800000008000000080
      000000800000008000000000FF000000FF000000FF000000FF000000FF008080
      800000800000C0C0C0000000000000000000FFFFFF00FFFFFF00000099000000
      FF000000FF000000CC000000FF000000CC000000CC000000CC000000CC000000
      CC000000990000009900FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000006666
      6600F0FBFF00F0FBFF0066666600424242006666660066666600666666006666
      660042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000808080000000
      0000C0C0C000808080000080000000800000C0C0C00000800000808080008080
      800000800000008000000000000000000000FFFFFF0000800000808080000000
      0000C0C0C0000000FF000000FF000000FF00C0C0C0000000FF000000FF008080
      800000800000008000000000000000000000FFFFFF00FFFFFF00000099009999
      FF000000FF000000FF000000CC000000FF000000CC000000CC000000CC000000
      CC000000CC0000009900FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FB
      FF0066666600F0FBFF00F0FBFF00A4A0A0006666660042424200666666006666
      660066666600FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000C0C0C0000080
      000000800000008000000080000000800000C0C0C00000800000C0C0C0000080
      0000008000000080000000000000FFFFFF00FFFFFF0000800000C0C0C0000080
      00000000FF000000FF000000FF0000800000C0C0C000008000000000FF000000
      FF00008000000080000000000000FFFFFF00FFFFFF00FFFFFF00000099009999
      FF009999FF000000FF000000FF000000CC000000FF000000CC000000CC000000
      CC000000CC0000009900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00A4A0A000666666004242
      420066666600FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000000000FFFFFF00FFFFFF00C0C0C000C0C0C0000000
      FF000000FF000000FF00C0C0C000C0C0C000C0C0C000C0C0C0000000FF000000
      FF000000FF00C0C0C00000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      9900000099000000990000009900000099000000990000009900000099000000
      990000009900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00A4A0
      A00042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00F0FBFF00F0FBFF00F0FBFF00F0FB
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000F0FBFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FC1F000000000000
      E7C7000000000000C3E300000000000081730000000000009879000000000000
      3C79000000000000387D0000000000003FFD0000000000003E3D000000000000
      BE39000000000000BE190000000000009E03000000000000CF83000000000000
      E3C7000000000000F03F000000000000FFFFF83FFFFFFFFF8A42F83FFFFFFFFF
      9284F83FFC3FFC3F3481FC3FF00FF00F0100F83FE007E0070000F83FE007E007
      0000F81FC003C0030000F807C003C0030000FC07C003C0030000E003C203C203
      0000C103E007E0070000C083E007E0070000C003F00FF00F0000C003FC3FFC3F
      0000E007FFFFFFFF0000F00FFFFFFFFFFFFFE902A153FFFFFFFF8848806B8A52
      FFFF000021AD9294FFFF0000000034A5E007000002BF0000C0030000803F0000
      C0030000003F0000C0030000003F0000C0030000803F0000C0030010003F0000
      C0030000003F0000C0030000003F0000E0072010003F0000FFFF2002003F0000
      FFFF0002003F0000FFFF0800001F0000F9FFFFFFFFFFFFFFE0FFFFFFCFF9FFFF
      C07FFFFFC7F1FFFFC01FFE07E203FFFFC00700010001E007C00780018001C003
      C00780008000C003C00780008000C003C00780008000C003C00780008000C003
      C00780008000C003C00780018001C003E00780018001E007F007FFFFC7E3FFFF
      FC07FFFFCFF3FFFFFF1FFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object Popup_Device: TPopupMenu
    AutoHotkeys = maManual
    Left = 107
    Top = 205
    object mn_ControlerReset: TMenuItem
      Caption = #52968#53944#47204#47084#47532#49483
      Visible = False
      OnClick = mn_ControlerResetClick
    end
    object mn_FireRecovery: TMenuItem
      Caption = #51204#52404#54868#51116#48373#44396
      OnClick = mn_FireRecoveryClick
    end
    object mn_ArmMode: TMenuItem
      Caption = #44221#44228#47784#46300
      Visible = False
      OnClick = mn_ArmModeClick
    end
    object mn_DisArmMode: TMenuItem
      Caption = #54644#51228#47784#46300
      Visible = False
      OnClick = mn_DisArmModeClick
    end
    object mn_DoorManagerMode: TMenuItem
      Caption = #50868#50689#47784#46300
      Visible = False
      OnClick = mn_DoorManagerModeClick
    end
    object mn_DoorOpenMode: TMenuItem
      Caption = #44060#48169#47784#46300
      OnClick = mn_DoorOpenModeClick
    end
    object mn_ReaderVersion: TMenuItem
      Caption = #47532#45908#53685#49888#52404#53356
      Visible = False
      OnClick = mn_ReaderVersionClick
    end
  end
  object deviceLoadTimer: TTimer
    Interval = 100
    OnTimer = deviceLoadTimerTimer
    Left = 44
    Top = 207
  end
  object ActiveTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = ActiveTimerTimer
    Left = 36
    Top = 271
  end
  object CardTypeTimer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = CardTypeTimer1Timer
    Left = 556
    Top = 65535
  end
end
