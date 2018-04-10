object dmDataBase: TdmDataBase
  OldCreateOrder = False
  Left = 564
  Top = 162
  Height = 325
  Width = 314
  object TB_DEVICE: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'memory'
    EngineVersion = '4.24 Build 1'
    FieldDefs = <
      item
        Name = 'DEVICE_ID'
        DataType = ftString
        Size = 17
        DefaultValue = '00000000000000000'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'EUC_ID'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DEVICE_TYPE'
        DataType = ftString
        Size = 20
        DefaultValue = 'SC'
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
        Size = 12
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
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IN_DELAY'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_TYPE1'
        DataType = ftString
        Size = 2
        DefaultValue = '2'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_TYPE2'
        DataType = ftString
        Size = 2
        DefaultValue = '2'
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
        Name = 'CARD_TYPE1'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARD_TYPE2'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOORMODE_TYPE1'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOORMODE_TYPE2'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_OPEN1'
        DataType = ftString
        Size = 50
        DefaultValue = '5'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_OPEN2'
        DataType = ftString
        Size = 50
        DefaultValue = '5'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'OPEN_MONI1'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'OPEN_MONI2'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'USE_SCH1'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'USE_SCH2'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_STATUS1'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_STATUS2'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM_LONG1'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ALARM_LONG2'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CONTROL_FIRE1'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CONTROL_FIRE2'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LOCK_TYPE1'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LOCK_TYPE2'
        DataType = ftString
        Size = 2
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_DSOPENSTATUS1'
        DataType = ftInteger
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_DSOPENSTATUS2'
        DataType = ftInteger
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_REMOTECANCEL1'
        DataType = ftInteger
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DOOR_REMOTECANCEL2'
        DataType = ftInteger
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER1_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER1_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER1_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #50808#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER1_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER2_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER2_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER2_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #50808#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER2_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER3_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER3_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER3_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #50808#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER3_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER4_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER4_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER4_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #50808#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER4_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER5_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER5_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER5_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #50808#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER5_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER6_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER6_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER6_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #50808#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER6_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER7_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER7_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER7_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #50808#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER7_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER8_USE'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER8_DOOR'
        DataType = ftString
        Size = 4
        DefaultValue = '1'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER8_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #50808#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'READER8_BUILDING'
        DataType = ftString
        Size = 20
        DefaultValue = #45236#48512
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT1_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = #48169#48276
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT1_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT1_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT1_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT2_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = #48169#48276
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT2_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT2_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT2_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT3_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = #48169#48276
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT3_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT3_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT3_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT4_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = #48169#48276
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT4_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT4_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT4_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT5_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = #48169#48276
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT5_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT5_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT5_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT6_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = #48169#48276
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT6_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT6_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT6_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT7_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = #48169#48276
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT7_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT7_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT7_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT8_TYPE'
        DataType = ftString
        Size = 10
        DefaultValue = #48708#49345
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT8_DELAY'
        DataType = ftString
        Size = 10
        DefaultValue = #48120#49324#50857
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT8_SENS'
        DataType = ftString
        Size = 4
        DefaultValue = '400'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT8_NAME'
        DataType = ftString
        Size = 40
        DefaultValue = #48120#49444#51221
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Mode'
        DataType = ftString
        Size = 2
        DefaultValue = '0'
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'CARDREADER_TYPE'
        DataType = ftString
        Size = 1
        DefaultValue = '1'
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
        Name = 'PORT1_RECORVER'
        DataType = ftString
        Size = 20
        DefaultValue = #48120#51204#49569
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT2_RECORVER'
        DataType = ftString
        Size = 20
        DefaultValue = #48120#51204#49569
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT3_RECORVER'
        DataType = ftString
        Size = 20
        DefaultValue = #48120#51204#49569
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT4_RECORVER'
        DataType = ftString
        Size = 20
        DefaultValue = #48120#51204#49569
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT5_RECORVER'
        DataType = ftString
        Size = 20
        DefaultValue = #48120#51204#49569
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT6_RECORVER'
        DataType = ftString
        Size = 20
        DefaultValue = #48120#51204#49569
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT7_RECORVER'
        DataType = ftString
        Size = 20
        DefaultValue = #48120#51204#49569
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PORT8_RECORVER'
        DataType = ftString
        Size = 20
        DefaultValue = #51204#49569
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
      end>
    IndexDefs = <
      item
        Name = 'TB_DEVICEDBISA1'
        Fields = 'EUC_ID'
        Options = [ixPrimary, ixUnique]
        Compression = icNone
      end>
    TableName = 'TB_DEVICE'
    StoreDefs = True
    Left = 17
    Top = 8
  end
end
