object dmDataBase: TdmDataBase
  OldCreateOrder = False
  Left = 635
  Top = 250
  Height = 411
  Width = 523
  object TB_DEVICE: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'DEVICE_ID'
        DataType = ftString
        Size = 50
        DefaultValue = '00000000000000000'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ECU_ID'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DEVICE_TYPE'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SYSTEM_ID'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Linkus_Tel'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Ring_Cnt'
        DataType = ftString
        Size = 2
        DefaultValue = '10'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Ring_CancelCnt'
        DataType = ftString
        Size = 2
        DefaultValue = '10'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_IP'
        DataType = ftString
        Size = 24
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_SUBNET'
        DataType = ftString
        Size = 24
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_GATE'
        DataType = ftString
        Size = 24
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_PORT'
        DataType = ftString
        Size = 5
        DefaultValue = '3000'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Server_IP'
        DataType = ftString
        Size = 26
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'WATCH_POWER'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'OUT_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IN_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LOCATE'
        DataType = ftString
        Size = 50
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADER_TYPE'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DialTimeOn'
        DataType = ftString
        Size = 10
        DefaultValue = '200'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DialTimeOff'
        DataType = ftString
        Size = 10
        DefaultValue = '200'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONE_LAMPONOFF'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONE_LAMPONTIME'
        DataType = ftInteger
        DefaultValue = '10'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONE_SIRENONOFF'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONE_SIRENONTIME'
        DataType = ftInteger
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DEVICESEARCH'
        DataType = ftInteger
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DEVICEUSE'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DHCP'
        DataType = ftString
        Size = 2
        DefaultValue = '00'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_SERVERPORT'
        DataType = ftString
        Size = 20
        DefaultValue = '3000'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_NETWORKMODE'
        DataType = ftString
        Size = 20
        DefaultValue = '00'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CDMAUSE'
        DataType = ftString
        Size = 1
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CDMAIP'
        DataType = ftString
        Size = 30
        DefaultValue = '0.0.0.0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CDMAPORT'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CDMACHECKTIME'
        DataType = ftString
        Size = 20
        DefaultValue = '30'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CDMARSSI'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CDMAMIN'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CDMAMUX'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LASTARMMODE'
        DataType = ftString
        Size = 20
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LASTDOOR1STATE'
        DataType = ftString
        Size = 20
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LASTDOOR2STATE'
        DataType = ftString
        Size = 20
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DEVICE_VER'
        DataType = ftString
        Size = 30
        DefaultValue = 'NF'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Linkus_Tel2'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DEVICE_CODE'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ArmRelay'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DVRUSE'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DVRIP'
        DataType = ftString
        Size = 30
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DVRPORT'
        DataType = ftString
        Size = 20
        DefaultValue = '3003'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL0'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL1'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL2'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL3'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL4'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL5'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL6'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL7'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL8'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL9'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR2_RELAY'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADER_CALLTIME'
        DataType = ftInteger
        DefaultValue = '180'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ArmExtensionGubun'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ArmExtensionData'
        DataType = ftString
        Size = 100
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ArmAreaSkill'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ArmAreaUse'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE1'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE2'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE3'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE4'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE5'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE6'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE7'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE8'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JaejungDelayUse'
        DataType = ftString
        Size = 1
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JavaraArmClose'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JavaraAutoClose'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PoliceTel1'
        DataType = ftString
        Size = 100
        DefaultValue = '17001060010010000'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PoliceTel2'
        DataType = ftString
        Size = 100
        DefaultValue = '17001060010010000'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JAVARASTOPTIME'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_TIMECODEUSE'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TIMECODE01'
        DataType = ftString
        Size = 40
        DefaultValue = '00000000000000000000000000000000'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TIMECODE02'
        DataType = ftString
        Size = 40
        DefaultValue = '00000000000000000000000000000000'
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_DEVICEDBISA1'
        Fields = 'ECU_ID'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_DEVICE'
    StoreDefs = True
    Left = 25
    Top = 8
  end
  object TB_CARDPERMIT: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'seq'
        DataType = ftAutoInc
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ECUID'
        DataType = ftString
        Size = 2
        DefaultValue = '00'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDNO'
        DataType = ftString
        Size = 50
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PERMIT'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR1'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR2'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR3'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR4'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR5'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR6'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR7'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR8'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM1'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM2'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM3'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM4'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM5'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM6'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM7'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM8'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'VALIDDATE'
        DataType = ftString
        Size = 6
        DefaultValue = '000000'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDPERMIT'
        DataType = ftString
        Size = 1
        DefaultValue = '2'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TIMEPATTERN'
        DataType = ftString
        Size = 1
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RCVACK'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'POSITIONNUM'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDTYPE'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDPOSITIONTYPE'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_CARDDBISA1'
        Fields = 'ECUID;CARDNO'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_CARDPERMIT'
    StoreDefs = True
    Left = 161
    Top = 192
  end
  object TB_CARD: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'CARDNO'
        DataType = ftString
        Size = 50
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDTYPE'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'POSITIONNUM'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_CARDDBISA1'
        Fields = 'CARDNO'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_CARD'
    StoreDefs = True
    Left = 249
    Top = 192
  end
  object TB_DOORSCHEDULE: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'ECUID'
        DataType = ftString
        Size = 50
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOORNO'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DAYCODE'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Time1'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Time1mode'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Time2'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Time2mode'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Time3'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Time3mode'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Time4'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Time4mode'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Time5'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Time5mode'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'rcvack'
        DataType = ftString
        Size = 20
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_CARDDBISA1'
        Fields = 'ECUID;DOORNO;DAYCODE'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_DOORSCHEDULE'
    StoreDefs = True
    Left = 41
    Top = 192
  end
  object TB_DETAILCODE: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'DETAILCODE'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'WATCHCODE'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DETAILNAME'
        DataType = ftString
        Size = 50
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_CARDDBISA1'
        Fields = 'DETAILCODE'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_DETAILCODE'
    StoreDefs = True
    Left = 193
    Top = 304
  end
  object TB_WATCHCODE: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'WATCHCODE'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'WATCHNAME'
        DataType = ftString
        Size = 50
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_CARDDBISA1'
        Fields = 'WATCHCODE'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_WATCHCODE'
    StoreDefs = True
    Left = 57
    Top = 304
  end
  object TB_DEVICERCV: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'DEVICE_ID'
        DataType = ftString
        Size = 50
        DefaultValue = '00000000000000000'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ECU_ID'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DEVICE_TYPE'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SYSTEM_ID'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Linkus_Tel'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Ring_Cnt'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Ring_CancelCnt'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_IP'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_SUBNET'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_GATE'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_PORT'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Server_IP'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'WATCH_POWER'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'OUT_DELAY'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IN_DELAY'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LOCATE'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADER_TYPE'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DialTimeOn'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DialTimeOff'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONE_LAMPONOFF'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONE_LAMPONTIME'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONE_SIRENONOFF'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONE_SIRENONTIME'
        DataType = ftString
        Size = 1
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DEVICESEARCH'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DEVICEUSE'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DHCP'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_SERVERPORT'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MCU_NETWORKMODE'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CDMAUSE'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CDMAIP'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CDMAPORT'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CDMACHECKTIME'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CDMARSSI'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CDMAMIN'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CDMAMUX'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LASTARMMODE'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LASTDOOR1STATE'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LASTDOOR2STATE'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DEVICE_VER'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Linkus_Tel2'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DEVICE_CODE'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ArmDSCheck1'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ArmRelay'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DVRUSE'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DVRIP'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DVRPORT'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL0'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL1'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL2'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL3'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL4'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL5'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL6'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL7'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL8'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL9'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR2_RELAY'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADER_CALLTIME'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ArmExtensionGubun'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ArmExtensionData'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ArmAreaSkill'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ArmAreaUse'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE1'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE2'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE3'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE4'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE5'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE6'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE7'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEEXTENSIONUSE8'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JaejungDelayUse'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JavaraArmClose'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JavaraAutoClose'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PoliceTel1'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PoliceTel2'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'JAVARASTOPTIME'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_TIMECODEUSE'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TIMECODE01'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TIMECODE02'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_DEVICEDBISA1'
        Fields = 'ECU_ID'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_DEVICERCV'
    StoreDefs = True
    Left = 25
    Top = 64
  end
  object TB_DOORSettingInfo: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'ECU_ID'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ECU_EXTEND'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOORNO'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_TYPE'
        DataType = ftString
        Size = 2
        DefaultValue = '2'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARD_TYPE'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOORMODE_TYPE'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'USE_SCH'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_OPEN'
        DataType = ftString
        Size = 10
        DefaultValue = '5'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'OPEN_MONI'
        DataType = ftString
        Size = 40
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_STATUS'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM_LONG'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CONTROL_FIRE'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LOCK_TYPE'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_DSOPENSTATUS'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_REMOTECANCEL'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LASTDOORSTATE'
        DataType = ftString
        Size = 20
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOORARMAREA'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DSCHECKUSE'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DSCHECKTIME'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ArmDSCheck'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_DEVICEDBISA1'
        Fields = 'ECU_ID;ECU_EXTEND;DOORNO'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_DOORSettingInfo'
    StoreDefs = True
    Left = 121
    Top = 8
  end
  object TB_DOORSettingInfoRCV: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'ECU_ID'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ECU_EXTEND'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOORNO'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_TYPE'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LOCATE'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARD_TYPE'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOORMODE_TYPE'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_OPEN'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'OPEN_MONI'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'USE_SCH'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_STATUS'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM_LONG'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CONTROL_FIRE'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LOCK_TYPE'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_DSOPENSTATUS'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_REMOTECANCEL'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LASTDOORSTATE'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR2_RELAY'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOORARMAREA'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DSCHECKUSE'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DSCHECKTIME'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ArmDSCheck'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_DEVICEDBISA1'
        Fields = 'ECU_ID;ECU_EXTEND;DOORNO'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_DOORSettingInfoRCV'
    StoreDefs = True
    Left = 129
    Top = 64
  end
  object TB_READERSETTING: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'ECU_ID'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ECU_EXTEND'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READERNO'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SINGLEREADER_TYPE'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER_USE'
        DataType = ftString
        Size = 10
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER_VER'
        DataType = ftString
        Size = 30
        DefaultValue = 'NF'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADER_TYPE'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READERARMAREA'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL0'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL1'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL2'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL3'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL4'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL5'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL6'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL7'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL8'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL9'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADER_CALLTIME'
        DataType = ftInteger
        DefaultValue = '180'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER_SOUND'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'EXIT_SOUND'
        DataType = ftString
        Size = 1
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_DEVICEDBISA1'
        Fields = 'ECU_ID;ECU_EXTEND;READERNO'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_READERSETTING'
    StoreDefs = True
    Left = 249
    Top = 8
  end
  object TB_READERSETTINGRCV: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'ECU_ID'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ECU_EXTEND'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READERNO'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SINGLEREADER_TYPE'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER_USE'
        DataType = ftString
        Size = 10
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER_VER'
        DataType = ftString
        Size = 30
        DefaultValue = 'NF'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADER_TYPE'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READERARMAREA'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL0'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL1'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL2'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL3'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL4'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL5'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL6'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL7'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL8'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADERTEL9'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADER_CALLTIME'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER_SOUND'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'EXIT_SOUND'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_DEVICEDBISA1'
        Fields = 'ECU_ID;ECU_EXTEND;READERNO'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_READERSETTINGRCV'
    StoreDefs = True
    Left = 249
    Top = 64
  end
  object TB_ZONESETTING: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'ECU_ID'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ECU_EXTEND'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONENO'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = 'T1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT_RECORVER'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT_DETAILTYPE'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEARMAREA'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT_ZONEUSE'
        DataType = ftString
        Size = 1
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_DEVICEDBISA1'
        Fields = 'ECU_ID;ECU_EXTEND;ZONENO'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_ZONESETTING'
    StoreDefs = True
    Left = 385
    Top = 8
  end
  object TB_ZONESETTINGRCV: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'ECU_ID'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ECU_EXTEND'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONENO'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = 'T1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT_RECORVER'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT_DETAILTYPE'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ZONEARMAREA'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT_ZONEUSE'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_DEVICEDBISA1'
        Fields = 'ECU_ID;ECU_EXTEND;ZONENO'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_ZONESETTINGRCV'
    StoreDefs = True
    Left = 393
    Top = 64
  end
  object TB_Javaraschedule: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'ECUID'
        DataType = ftString
        Size = 50
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOORNO'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'wStartTime'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'wEndTime'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'sStartTime'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'sEndTime'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'nStartTime'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'nEndTime'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'hStartTime'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'hEndTime'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'rcvack'
        DataType = ftString
        Size = 20
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_CARDDBISA1'
        Fields = 'ECUID;DOORNO'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_Javaraschedule'
    StoreDefs = True
    Left = 41
    Top = 248
  end
  object TB_CARDPERMITTEMP: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'seq'
        DataType = ftAutoInc
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ECUID'
        DataType = ftString
        Size = 2
        DefaultValue = '00'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDNO'
        DataType = ftString
        Size = 50
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PERMIT'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR1'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR2'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR3'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR4'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR5'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR6'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR7'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR8'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM1'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM2'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM3'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM4'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM5'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM6'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM7'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM8'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'VALIDDATE'
        DataType = ftString
        Size = 6
        DefaultValue = '000000'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDPERMIT'
        DataType = ftString
        Size = 1
        DefaultValue = '2'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TIMEPATTERN'
        DataType = ftString
        Size = 1
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RCVACK'
        DataType = ftString
        Size = 1
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'POSITIONNUM'
        DataType = ftString
        Size = 20
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDTYPE'
        DataType = ftString
        Size = 20
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDPOSITIONTYPE'
        DataType = ftString
        Size = 2
        DefaultValue = 'N'
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'TB_CARDDBISA1'
        Fields = 'ECUID;CARDNO'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_CARDPERMITTEMP'
    StoreDefs = True
    Left = 161
    Top = 240
  end
end
