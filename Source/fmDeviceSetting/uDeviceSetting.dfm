inherited fmDeviceSetting: TfmDeviceSetting
  Left = 192
  Top = 107
  Width = 1020
  Height = 665
  Caption = #44592#44592#49444#51221#46321#47197
  Font.Charset = HANGEUL_CHARSET
  Font.Height = -12
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl [0]
    Left = 0
    Top = 0
    Width = 185
    Height = 631
    ActivePage = tbDEVICE
    Align = alLeft
    TabOrder = 0
    object tbDEVICE: TTabSheet
      Caption = #44592#44592#51221#48372
      ImageIndex = 1
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 177
        Height = 604
        Align = alClient
        TabOrder = 0
        object TreeView_Device: TTreeView
          Left = 2
          Top = 23
          Width = 173
          Height = 579
          Align = alClient
          BorderStyle = bsNone
          HideSelection = False
          HotTrack = True
          Images = toolslist
          Indent = 19
          TabOrder = 0
          OnClick = TreeView_DeviceClick
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
          Width = 173
          Height = 9
          Align = alTop
          Caption = 'Shader1'
          TabOrder = 1
          FromColor = 15591915
          ToColor = clSilver
          Direction = False
          Version = '1.1.0.0'
        end
      end
    end
  end
  object Panel1: TPanel [1]
    Left = 185
    Top = 0
    Width = 827
    Height = 631
    Align = alClient
    TabOrder = 1
    object pg_DeviceSetting: TPageControl
      Left = 1
      Top = 33
      Width = 825
      Height = 498
      ActivePage = tab_CardReader
      Align = alClient
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
          Left = 488
          Top = 20
          Width = 241
          Height = 293
          Caption = #9635' LAN '#49444#51221
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
            Top = 176
            Width = 201
            Height = 49
            Caption = 'NetworkMode'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Server'
              'Client')
            TabOrder = 0
            OnClick = Rg_ModeClick
          end
          object chk_DHCP: TCheckBox
            Left = 8
            Top = 232
            Width = 201
            Height = 17
            Caption = 'DHCP Mode'
            TabOrder = 1
            OnClick = chk_DHCPClick
          end
          object btn_WizNetSetting: TRzBitBtn
            Left = 8
            Top = 256
            Width = 201
            Caption = 'LAN '#49444#51221
            Color = 15791348
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
            ImeName = 'Microsoft IME 2003'
            TabOrder = 8
            OnKeyUp = ed_ServerPortKeyUp
          end
        end
        object GroupBox10: TGroupBox
          Left = 488
          Top = 305
          Width = 225
          Height = 112
          Caption = #49884#44036' '#44288#47532
          TabOrder = 3
          object btn_TimeSync: TRzBitBtn
            Left = 16
            Top = 80
            Width = 193
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
            Top = 48
            Width = 193
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
        object gb_cdma: TGroupBox
          Left = 14
          Top = 360
          Width = 449
          Height = 73
          Caption = 'CDMA '#49444#51221
          Color = clBtnFace
          ParentColor = False
          TabOrder = 4
          object chk_Cdma: TCheckBox
            Left = 8
            Top = 16
            Width = 81
            Height = 17
            Caption = 'CDMA '#49324#50857
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = chk_CdmaClick
          end
          object pan_cdma: TPanel
            Left = 88
            Top = 14
            Width = 359
            Height = 57
            Align = alRight
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object lb_cccip: TLabel
              Left = 8
              Top = 8
              Width = 12
              Height = 12
              Caption = 'IP'
            end
            object lb_cccport: TLabel
              Left = 200
              Top = 8
              Width = 24
              Height = 12
              Caption = 'PORT'
            end
            object Label366: TLabel
              Left = 8
              Top = 32
              Width = 48
              Height = 12
              Caption = #51221#49884#48156#48372
            end
            object Label368: TLabel
              Left = 120
              Top = 32
              Width = 42
              Height = 12
              Caption = #48516' '#44036#44201
            end
            object Label367: TLabel
              Left = 200
              Top = 32
              Width = 48
              Height = 12
              Caption = #51221#49884#48156#48372
            end
            object Label369: TLabel
              Left = 296
              Top = 32
              Width = 60
              Height = 12
              Caption = #48516' '#54980' '#49892#49884
            end
            object ed_cccip_org: TRzEdit
              Left = 139
              Top = 36
              Width = 110
              Height = 20
              FrameHotTrack = True
              FrameVisible = True
              ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
              TabOnEnter = True
              TabOrder = 0
              Visible = False
            end
            object ed_cccport: TRzEdit
              Left = 256
              Top = 4
              Width = 87
              Height = 20
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = [fsBold]
              FrameHotTrack = True
              FrameHotStyle = fsFlat
              FrameStyle = fsLowered
              FrameVisible = True
              ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
              ParentFont = False
              TabOnEnter = True
              TabOrder = 1
            end
            object ed_cccTimeInterval: TRzEdit
              Left = 59
              Top = 28
              Width = 54
              Height = 20
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = [fsBold]
              FrameHotTrack = True
              FrameStyle = fsLowered
              FrameVisible = True
              ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
              ParentFont = False
              ReadOnly = True
              TabOnEnter = True
              TabOrder = 2
            end
            object ed_cccStartTime: TRzEdit
              Left = 256
              Top = 28
              Width = 33
              Height = 20
              Font.Charset = HANGEUL_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #44404#47548#52404
              Font.Style = [fsBold]
              FrameHotTrack = True
              FrameStyle = fsLowered
              FrameVisible = True
              ImeName = #54620#44397#50612' '#51077#47141' '#49884#49828#53596' (IME 2000)'
              ParentFont = False
              TabOnEnter = True
              TabOrder = 3
            end
            object Panel5: TPanel
              Left = 184
              Top = 0
              Width = 5
              Height = 57
              BevelInner = bvLowered
              BevelOuter = bvLowered
              TabOrder = 4
            end
            object ed_cccip: TIPEdit
              Left = 59
              Top = 4
              Width = 118
              Height = 20
              BorderStyle = bsNone
              TabOrder = 5
            end
          end
        end
        object GroupMAc: TRzGroupBox
          Left = 552
          Top = 1
          Width = 217
          Height = 112
          Caption = #47589#50612#46300#47112#49828' '#46321#47197
          TabOrder = 5
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
          TabOrder = 6
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
              Align = alClient
              BorderStyle = bsNone
              Columns = <
                item
                  Caption = 'NO'
                end
                item
                  Caption = 'TYPE'
                  Width = 140
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
              ShowHint = False
              ShowWorkAreas = True
              SmallImages = toolslist
              TabOrder = 0
              ViewStyle = vsReport
              OnKeyDown = lvECUKeyDown
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
          Caption = 'ECU/ICU '#46321#47197
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          HotTrack = True
          ParentFont = False
          TabOrder = 7
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
          TabOrder = 8
          OnClick = btnECUEraseClick
          NumGlyphs = 2
        end
        object RzGroupBox5: TRzGroupBox
          Left = 14
          Top = 226
          Width = 219
          Height = 127
          Caption = #9635' '#44288#51228' '#50672#44208#49444#51221
          GroupStyle = gsTopLine
          ParentColor = True
          TabOrder = 9
          ThemeAware = False
          object RzLabel9: TRzLabel
            Left = 5
            Top = 20
            Width = 54
            Height = 12
            Hint = #44288#51228#54016#50640' '#46321#47197#46108' '#48264#54840#47484' '#51077#47141#54616#49464#50836
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
            Hint = #45936#53076#45908' '#51204#54868#48264#54840#47484' '#51077#47141' '#54616#49464#50836
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
            Hint = #45936#53076#45908' '#51204#54868#48264#54840#47484' '#51077#47141' '#54616#49464#50836
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
            ImeName = 'Microsoft IME 2003'
            MaxLength = 4
            TabOrder = 2
          end
          object Edit_LinkusTel: TEdit
            Left = 104
            Top = 37
            Width = 100
            Height = 20
            ImeName = 'Microsoft IME 2003'
            MaxLength = 12
            TabOrder = 3
          end
          object Edit_LinkusTel2: TEdit
            Left = 104
            Top = 59
            Width = 100
            Height = 20
            ImeName = 'Microsoft IME 2003'
            MaxLength = 12
            TabOrder = 4
          end
        end
        object gb_EcuAdd: TGroupBox
          Left = 392
          Top = 216
          Width = 185
          Height = 137
          Caption = 'ECU'#46321#47197
          TabOrder = 10
          Visible = False
          object Label13: TLabel
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
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 1
            Text = 'KTT811'
            Items.Strings = (
              'KTT811'
              'KTT812'
              'ICU100'
              'ICU200')
            ItemIndex = 0
          end
          object chk_All: TCheckBox
            Left = 16
            Top = 72
            Width = 153
            Height = 17
            Caption = #46321#47197#44079#49688#44620#51648#51204#52404#52628#44032
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object btnAdd: TRzBitBtn
            Left = 11
            Top = 96
            Caption = #46321#47197
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
            Caption = #52712#49548
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
      end
      object TabSystemInfo: TTabSheet
        Caption = #49884#49828#53596#51221#48372#46321#47197
        ImageIndex = 1
        object GroupBox1: TGroupBox
          Left = 16
          Top = 16
          Width = 441
          Height = 209
          Caption = #49884#49828#53596#51221#48372
          TabOrder = 0
          object Label15: TLabel
            Left = 267
            Top = 55
            Width = 12
            Height = 12
            Caption = #52488
            Transparent = True
          end
          object Label4: TLabel
            Left = 268
            Top = 85
            Width = 12
            Height = 12
            Caption = #52488
            Transparent = True
          end
          object StaticText3: TStaticText
            Left = 16
            Top = 23
            Width = 161
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = #51221#51204' '#44048#49884' '#50668#48512
            TabOrder = 0
          end
          object ComboBox_WatchPowerOff: TRzComboBox
            Left = 196
            Top = 21
            Width = 205
            Height = 20
            Style = csDropDownList
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 1
            OnChange = ComboBox_WatchPowerOffChange
            OnClick = ComboBox_WatchPowerOffClick
          end
          object StaticText6: TStaticText
            Left = 16
            Top = 113
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
            Top = 111
            Width = 205
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
            Top = 141
            Width = 205
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
          object st_Door2Type: TStaticText
            Left = 16
            Top = 143
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
            Top = 176
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
            Top = 172
            Width = 205
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
            Top = 51
            Width = 51
            Height = 20
            AllowKeyEdit = True
            Max = 600.000000000000000000
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            TabOrder = 8
            OnChange = SpinEdit_OutDelayChange
            OnClick = ComboBox_WatchPowerOffClick
          end
          object SpinEdit_InDelay: TRzSpinEdit
            Left = 196
            Top = 81
            Width = 51
            Height = 20
            AllowKeyEdit = True
            Max = 600.000000000000000000
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            TabOrder = 9
            OnChange = SpinEdit_InDelayChange
            OnClick = ComboBox_WatchPowerOffClick
          end
          object StaticText5: TStaticText
            Left = 16
            Top = 53
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
            Top = 83
            Width = 161
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = #51077#49892#51648#50672#49884#44036
            TabOrder = 11
          end
        end
        object GroupBox6: TGroupBox
          Left = 16
          Top = 272
          Width = 441
          Height = 89
          Caption = #49884#49828#53596#51228#50612
          TabOrder = 1
          object btn_Alarm: TRzBitBtn
            Left = 16
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
            Left = 196
            Top = 24
            Width = 161
            Caption = #54644#51228
            Color = 15791348
            HighlightColor = 16026986
            HotTrack = True
            HotTrackColor = 3983359
            TabOrder = 1
            OnClick = btn_DisAlarmClick
          end
          object StaticText45: TStaticText
            Left = 16
            Top = 55
            Width = 161
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = #54788#51116' '#48169#48276' '#49345#53468
            TabOrder = 2
          end
          object st_AlarmState: TStaticText
            Left = 196
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
            TabOrder = 3
          end
        end
      end
      object tab_DoorLock: TTabSheet
        Caption = #46973'('#52636#51077#47928')'#49444#51221
        ImageIndex = 2
        object GroupBox2: TGroupBox
          Left = 16
          Top = 8
          Width = 537
          Height = 329
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
            Left = 417
            Top = 90
            Width = 12
            Height = 12
            Caption = #52488
            Transparent = True
          end
          object Label46: TLabel
            Left = 233
            Top = 112
            Width = 30
            Height = 12
            Caption = #48516' '#54980
            Transparent = True
          end
          object Label11: TLabel
            Left = 417
            Top = 112
            Width = 30
            Height = 12
            Caption = #48516' '#54980
            Transparent = True
          end
          object RzPanel2: TRzPanel
            Left = 158
            Top = 14
            Width = 180
            Height = 25
            BorderOuter = fsButtonDown
            Caption = #52636#51077#47928'1'
            TabOrder = 0
          end
          object RzPanel4: TRzPanel
            Left = 345
            Top = 14
            Width = 180
            Height = 25
            BorderOuter = fsButtonDown
            Caption = #52636#51077#47928'2'
            TabOrder = 1
          end
          object ComboBox_CardModeType1: TRzComboBox
            Left = 158
            Top = 43
            Width = 180
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
            Left = 345
            Top = 43
            Width = 180
            Height = 20
            Style = csDropDownList
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 3
            OnChange = ComboBox_CardModeType2Change
          end
          object StaticText10: TStaticText
            Left = 16
            Top = 66
            Width = 137
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = #52636#51077#47928' '#50868#50689#47784#46300
            TabOrder = 4
          end
          object ComboBox_DoorModeType1: TRzComboBox
            Left = 158
            Top = 64
            Width = 180
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
            Left = 345
            Top = 64
            Width = 180
            Height = 20
            Style = csDropDownList
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 6
            OnChange = ComboBox_CardModeType2Change
          end
          object cmb_DoorControlTime1: TRzComboBox
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
            ItemIndex = 2
          end
          object cmb_DoorControlTime2: TRzComboBox
            Left = 345
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
            OnChange = ComboBox_CardModeType2Change
            Items.Strings = (
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
            ItemIndex = 2
          end
          object StaticText11: TStaticText
            Left = 16
            Top = 88
            Width = 137
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = #52636#51077#47928' '#51104#44608' '#51648#50672#49884#44036
            TabOrder = 9
          end
          object StaticText12: TStaticText
            Left = 16
            Top = 110
            Width = 137
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = #51109#49884#44036' '#50676#47548' '#51060#48292#53944
            TabOrder = 10
          end
          object ComboBox_SendDoorStatus1: TRzComboBox
            Left = 158
            Top = 152
            Width = 180
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
            Left = 345
            Top = 152
            Width = 180
            Height = 20
            Style = csDropDownList
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 12
            OnChange = ComboBox_CardModeType2Change
          end
          object StaticText13: TStaticText
            Left = 16
            Top = 154
            Width = 137
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = #52636#51077#47928' '#49345#53468#51204#49569
            TabOrder = 13
          end
          object ComboBox_AlarmLongOpen1: TRzComboBox
            Left = 158
            Top = 130
            Width = 180
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
            Left = 345
            Top = 130
            Width = 180
            Height = 20
            Style = csDropDownList
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 15
            OnChange = ComboBox_CardModeType2Change
          end
          object StaticText14: TStaticText
            Left = 16
            Top = 132
            Width = 137
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = #51109#49884#44036' '#50676#47548' '#44221#44256#51020
            TabOrder = 16
          end
          object ComboBox_ControlFire1: TRzComboBox
            Left = 158
            Top = 195
            Width = 180
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
            Left = 345
            Top = 195
            Width = 180
            Height = 20
            Style = csDropDownList
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 18
            OnChange = ComboBox_CardModeType2Change
          end
          object StaticText16: TStaticText
            Left = 16
            Top = 197
            Width = 137
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = #54868#51116#48156#49373#49884' '#47928#50676#47548
            TabOrder = 19
          end
          object ComboBox_LockType1: TRzComboBox
            Left = 158
            Top = 217
            Width = 180
            Height = 20
            Style = csDropDownList
            Ctl3D = False
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
            Left = 345
            Top = 217
            Width = 180
            Height = 20
            Style = csDropDownList
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 21
            OnChange = ComboBox_CardModeType2Change
            OnEnter = ComboBox_LockType2Enter
            OnExit = ComboBox_LockType2Exit
          end
          object cmb_DsOpenState2: TRzComboBox
            Left = 345
            Top = 239
            Width = 180
            Height = 20
            Style = csDropDownList
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 22
            OnChange = ComboBox_CardModeType2Change
            Items.Strings = (
              ''
              'DS OPEN'
              'DS CLOSE')
          end
          object cmb_DsOpenState1: TRzComboBox
            Left = 158
            Top = 239
            Width = 180
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
            Left = 158
            Top = 261
            Width = 180
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
            Left = 345
            Top = 261
            Width = 180
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
            OnChange = ComboBox_CardModeType2Change
            Items.Strings = (
              #48120#49324#50857
              #49324#50857)
            ItemIndex = 1
          end
          object StaticText17: TStaticText
            Left = 16
            Top = 219
            Width = 137
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = #46020#50612#46973' '#53440#51077
            TabOrder = 26
          end
          object StaticText18: TStaticText
            Left = 16
            Top = 241
            Width = 137
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = #52636#51077#47928#50676#47548#49345#53468
            TabOrder = 27
          end
          object StaticText19: TStaticText
            Left = 16
            Top = 263
            Width = 137
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = #50896#44201#54644#51228#49884' '#47928#50676#47548
            TabOrder = 28
          end
          object StaticText9: TStaticText
            Left = 16
            Top = 45
            Width = 137
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = #52852#46300' '#50868#50689#47784#46300
            TabOrder = 29
          end
          object SpinEdit_OpenMoni1: TRzSpinEdit
            Left = 158
            Top = 108
            Width = 67
            Height = 20
            AllowKeyEdit = True
            Max = 9.000000000000000000
            Alignment = taLeftJustify
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            TabOrder = 30
            OnChange = ComboBox_CardModeType1Change
          end
          object SpinEdit_OpenMoni2: TRzSpinEdit
            Left = 345
            Top = 108
            Width = 67
            Height = 20
            AllowKeyEdit = True
            Max = 9.000000000000000000
            Alignment = taLeftJustify
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            TabOrder = 31
            OnChange = ComboBox_CardModeType2Change
          end
          object StaticText15: TStaticText
            Left = 16
            Top = 175
            Width = 137
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = #49828#52992#51460#51201#50857#50976#47924
            TabOrder = 32
          end
          object ComboBox_UseSch1: TRzComboBox
            Left = 158
            Top = 173
            Width = 180
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
            Left = 345
            Top = 173
            Width = 180
            Height = 20
            Style = csDropDownList
            Ctl3D = False
            FlatButtons = True
            FrameVisible = True
            ImeName = 'Microsoft IME 2003'
            ItemHeight = 12
            ParentCtl3D = False
            TabOrder = 34
            OnChange = ComboBox_CardModeType2Change
          end
        end
        object GroupBox7: TGroupBox
          Left = 560
          Top = 8
          Width = 257
          Height = 329
          Caption = #44592#44592#49345#53468
          TabOrder = 1
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
          object btn_DevicState: TRzBitBtn
            Left = 80
            Top = 192
            Width = 169
            Height = 49
            Caption = #49345#53468#51312#54924
            Color = 15791348
            HighlightColor = 16026986
            HotTrack = True
            HotTrackColor = 3983359
            TabOrder = 13
            OnClick = btn_DevicStateClick
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
            Caption = #48169#48276
            TabOrder = 14
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
            TabOrder = 15
            OnClick = btn_FireDeviceClick
          end
          object st_AlarmState2: TStaticText
            Left = 80
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
            TabOrder = 16
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
            TabOrder = 17
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
            TabOrder = 18
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
            TabOrder = 19
            Items.Strings = (
              'OPEN'
              'SHORT')
          end
          object sg_FireDevice: TAdvStringGrid
            Left = 168
            Top = 160
            Width = 80
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
            PopupMenu = Popup_Fire
            ScrollBars = ssBoth
            TabOrder = 20
            Visible = False
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            SearchFooter.FindNextCaption = 'Find next'
            SearchFooter.FindPrevCaption = 'Find previous'
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurence'
            SearchFooter.HintFindPrev = 'Find previous occurence'
            SearchFooter.HintHighlight = 'Highlight occurences'
            SearchFooter.MatchCaseCaption = 'Match case'
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
            FixedColWidth = 109
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clWindowText
            FixedFont.Height = -11
            FixedFont.Name = 'Tahoma'
            FixedFont.Style = [fsBold]
            FloatFormat = '%.2f'
            ColumnHeaders.Strings = (
              #54868#51116#44048#51648#54869#51109#44592)
            Filter = <>
            Version = '3.3.0.1'
            ColWidths = (
              109)
          end
        end
        object GroupBox4: TGroupBox
          Left = 16
          Top = 360
          Width = 353
          Height = 105
          Caption = #52636#51077#47928#51228#50612
          TabOrder = 2
          object GroupBox8: TGroupBox
            Left = 177
            Top = 14
            Width = 174
            Height = 89
            Align = alClient
            Caption = #52636#51077#47928'2'
            TabOrder = 0
            object btn_Door2OpenMode: TRzBitBtn
              Left = 24
              Top = 64
              Width = 129
              Hint = '221'
              Caption = #44060#48169#47784#46300
              Color = 15791348
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 0
              OnClick = DoorControl
            end
            object btn_Door2CloseMode: TRzBitBtn
              Left = 24
              Top = 40
              Width = 129
              Hint = '220'
              Caption = #50868#50689#47784#46300
              Color = 15791348
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 1
              OnClick = DoorControl
            end
            object btn_Door2Open: TRzBitBtn
              Left = 24
              Top = 16
              Width = 129
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
          object GroupBox5: TGroupBox
            Left = 2
            Top = 14
            Width = 175
            Height = 89
            Align = alLeft
            Caption = #52636#51077#47928'1'
            TabOrder = 1
            object btn_Door1CloseMode: TRzBitBtn
              Left = 24
              Top = 40
              Width = 129
              Hint = '120'
              Caption = #50868#50689#47784#46300
              Color = 15791348
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 0
              OnClick = DoorControl
            end
            object btn_Door1OpenMode: TRzBitBtn
              Left = 24
              Top = 64
              Width = 129
              Hint = '121'
              Caption = #44060#48169#47784#46300
              Color = 15791348
              HighlightColor = 16026986
              HotTrack = True
              HotTrackColor = 3983359
              TabOrder = 1
              OnClick = DoorControl
            end
            object btn_Door1Open: TRzBitBtn
              Left = 24
              Top = 16
              Width = 129
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
        end
        object GroupBox9: TGroupBox
          Left = 384
          Top = 360
          Width = 433
          Height = 97
          Caption = #51228#50612#44208#44284
          TabOrder = 3
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
      object tab_CardReader: TTabSheet
        Caption = #52852#46300#47532#45908#49444#51221
        ImageIndex = 3
        object gb_CardReader: TGroupBox
          Left = 16
          Top = 48
          Width = 617
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
            Width = 67
            Height = 25
            BorderOuter = fsButtonDown
            Caption = #49324#50857#50976#47924
            TabOrder = 1
          end
          object cmb_ReaderUse1: TRzComboBox
            Left = 86
            Top = 51
            Width = 67
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
            Left = 158
            Top = 22
            Width = 67
            Height = 25
            BorderOuter = fsButtonDown
            Caption = #47928#48264#54840
            TabOrder = 11
          end
          object RzPanel6: TRzPanel
            Left = 230
            Top = 22
            Width = 67
            Height = 25
            BorderOuter = fsButtonDown
            Caption = #47928#49444#52824
            TabOrder = 12
          end
          object RzPanel7: TRzPanel
            Left = 302
            Top = 22
            Width = 67
            Height = 25
            BorderOuter = fsButtonDown
            Caption = #44148#47932#49444#52824
            TabOrder = 13
          end
          object RzPanel8: TRzPanel
            Left = 374
            Top = 22
            Width = 220
            Height = 25
            BorderOuter = fsButtonDown
            Caption = #47532#45908#48260#51260
            TabOrder = 14
          end
          object cmb_ReaderDoor1: TRzComboBox
            Left = 158
            Top = 51
            Width = 67
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
            Left = 230
            Top = 51
            Width = 67
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
            Left = 302
            Top = 51
            Width = 67
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
            Left = 376
            Top = 53
            Width = 220
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
            Width = 67
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
            Left = 158
            Top = 77
            Width = 67
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
            Left = 230
            Top = 77
            Width = 67
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
            Left = 302
            Top = 77
            Width = 67
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
            Left = 376
            Top = 79
            Width = 220
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
            Width = 67
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
            Left = 158
            Top = 104
            Width = 67
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
            Left = 230
            Top = 104
            Width = 67
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
            Left = 302
            Top = 104
            Width = 67
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
            Left = 376
            Top = 106
            Width = 220
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
            Width = 67
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
            Left = 158
            Top = 131
            Width = 67
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
            Left = 230
            Top = 131
            Width = 67
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
            Left = 302
            Top = 131
            Width = 67
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
            Left = 376
            Top = 133
            Width = 220
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
            Width = 67
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
            Left = 158
            Top = 158
            Width = 67
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
            Left = 230
            Top = 158
            Width = 67
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
            Left = 302
            Top = 158
            Width = 67
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
            Left = 376
            Top = 160
            Width = 220
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
            Width = 67
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
            Left = 158
            Top = 185
            Width = 67
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
            Left = 230
            Top = 185
            Width = 67
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
            Left = 302
            Top = 185
            Width = 67
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
            Left = 376
            Top = 187
            Width = 220
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
            Width = 67
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
            Left = 158
            Top = 212
            Width = 67
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
            Left = 230
            Top = 212
            Width = 67
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
            Left = 302
            Top = 212
            Width = 67
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
            Left = 376
            Top = 214
            Width = 220
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
            Width = 67
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
            Left = 158
            Top = 239
            Width = 67
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
            Left = 230
            Top = 239
            Width = 67
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
            Left = 302
            Top = 239
            Width = 67
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
            Left = 376
            Top = 241
            Width = 220
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
        end
        object st_cardreaderType: TStaticText
          Left = 16
          Top = 21
          Width = 137
          Height = 17
          Alignment = taCenter
          AutoSize = False
          BevelKind = bkFlat
          BorderStyle = sbsSunken
          Caption = #52852#46300#47532#45908#51333#47448
          TabOrder = 1
        end
        object cb_CardType: TRzComboBox
          Left = 164
          Top = 19
          Width = 293
          Height = 20
          Style = csDropDownList
          Ctl3D = False
          FlatButtons = True
          FrameVisible = True
          ImeName = 'Microsoft IME 2003'
          ItemHeight = 12
          ParentCtl3D = False
          TabOrder = 2
          Text = '0.'#51068#48152#47532#45908'(CRO-811)'
          OnChange = cb_CardTypeChange
          Items.Strings = (
            ''
            '0.'#51068#48152#47532#45908'(CRO-811)'
            '1.'#51648#47928#47532#45908'(CRO-801)'
            '2.Wiegand '#52852#46300#47532#45908'(26)'
            '3.Wiegand '#52852#46300#47532#45908'(34)')
          ItemIndex = 1
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
        object gb_Port: TGroupBox
          Left = 16
          Top = 16
          Width = 601
          Height = 377
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
            Left = 336
            Top = 22
            Width = 120
            Height = 25
            BorderOuter = fsButtonDown
            Caption = #48373#44396#49888#54840
            TabOrder = 9
          end
          object cmb_recorver1: TRzComboBox
            Tag = 1
            Left = 336
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
          end
          object cmb_recorver2: TRzComboBox
            Tag = 1
            Left = 336
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
          end
          object cmb_recorver3: TRzComboBox
            Tag = 1
            Left = 336
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
          end
          object cmb_recorver4: TRzComboBox
            Tag = 1
            Left = 336
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
          end
          object cmb_recorver5: TRzComboBox
            Tag = 1
            Left = 336
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
          end
          object cmb_recorver6: TRzComboBox
            Tag = 1
            Left = 336
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
            TabOrder = 20
            OnClick = cmb_WatchTypeClick
          end
          object RzPanel15: TRzPanel
            Left = 462
            Top = 22
            Width = 120
            Height = 25
            BorderOuter = fsButtonDown
            Caption = #51316#49345#53468
            TabOrder = 21
          end
          object st_ZoneState1: TStaticText
            Left = 462
            Top = 51
            Width = 120
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
            TabOrder = 22
          end
          object st_ZoneState2: TStaticText
            Left = 462
            Top = 75
            Width = 120
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
            TabOrder = 23
          end
          object st_ZoneState3: TStaticText
            Left = 462
            Top = 100
            Width = 120
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
            TabOrder = 24
          end
          object st_ZoneState4: TStaticText
            Left = 462
            Top = 124
            Width = 120
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
            TabOrder = 25
          end
          object st_ZoneState5: TStaticText
            Left = 462
            Top = 149
            Width = 120
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
            TabOrder = 26
          end
          object st_ZoneState6: TStaticText
            Left = 462
            Top = 173
            Width = 120
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
            TabOrder = 27
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
            TabOrder = 28
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
            TabOrder = 29
            OnClick = cmb_WatchTypeClick
          end
          object cmb_recorver7: TRzComboBox
            Tag = 1
            Left = 336
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
            TabOrder = 30
            OnClick = cmb_WatchTypeClick
          end
          object st_ZoneState7: TStaticText
            Left = 462
            Top = 198
            Width = 120
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
            TabOrder = 31
          end
          object st_ZoneState8: TStaticText
            Left = 462
            Top = 223
            Width = 120
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
            TabOrder = 32
          end
          object cmb_recorver8: TRzComboBox
            Tag = 1
            Left = 336
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
            TabOrder = 33
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
            TabOrder = 34
            OnClick = cmb_WatchTypeClick
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
            TabOrder = 35
          end
          object RzPanel11: TRzPanel
            Left = 211
            Top = 22
            Width = 120
            Height = 25
            BorderOuter = fsButtonDown
            Caption = #51648#50672#49884#44036
            TabOrder = 36
          end
          object cmb_WatchDelay1: TRzComboBox
            Left = 211
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
            TabOrder = 37
            OnClick = cmb_WatchTypeClick
          end
          object cmb_WatchDelay2: TRzComboBox
            Left = 211
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
            TabOrder = 38
            OnClick = cmb_WatchTypeClick
          end
          object cmb_WatchDelay3: TRzComboBox
            Left = 211
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
            TabOrder = 39
            OnClick = cmb_WatchTypeClick
          end
          object cmb_WatchDelay4: TRzComboBox
            Left = 211
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
            TabOrder = 40
            OnClick = cmb_WatchTypeClick
          end
          object cmb_WatchDelay5: TRzComboBox
            Left = 211
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
            TabOrder = 41
            OnClick = cmb_WatchTypeClick
          end
          object cmb_WatchDelay6: TRzComboBox
            Left = 211
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
            TabOrder = 42
            OnClick = cmb_WatchTypeClick
          end
          object cmb_WatchDelay7: TRzComboBox
            Left = 211
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
            TabOrder = 43
            OnClick = cmb_WatchTypeClick
          end
          object cmb_WatchDelay8: TRzComboBox
            Left = 211
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
            TabOrder = 44
            OnClick = cmb_WatchTypeClick
          end
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 825
      Height = 32
      Align = alTop
      TabOrder = 1
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
        Width = 289
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
    end
    object Panel3: TPanel
      Left = 1
      Top = 531
      Width = 825
      Height = 99
      Align = alBottom
      TabOrder = 2
      OnResize = Panel3Resize
      object gb_ControlButton: TGroupBox
        Left = 96
        Top = 8
        Width = 497
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
          Left = 182
          Top = 18
          Width = 129
          Height = 41
          Caption = #46321#47197
          Color = 15791348
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
          Left = 341
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
      end
    end
  end
  inherited CommandArray: TCommandArray
    Commands = <
      item
        CommandName = 'NODECONNECTED'
        CommandKind = 0
        Name = 'TNODECONNECTED'
        OnExecute = CommandArrayCommandsTNODECONNECTEDExecute
      end>
  end
  object toolslist: TImageList
    BkColor = clWhite
    Left = 72
    Top = 168
    Bitmap = {
      494C01010C000E00040010001000FFFFFF00FF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF83FFFFFFFFF8A42F83FFFFFFFFF
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
      FC07FFFFCFF3FFFFFF1FFFFFFFFFFFFF}
  end
  object Popup_Fire: TPopupMenu
    AutoHotkeys = maManual
    Left = 907
    Top = 253
    object Menu_FireRecovery: TMenuItem
      Caption = #54868#51116#48373#44396
      OnClick = Menu_FireRecoveryClick
    end
  end
  object deviceLoadTimer: TTimer
    Interval = 100
    OnTimer = deviceLoadTimerTimer
    Left = 44
    Top = 207
  end
end
