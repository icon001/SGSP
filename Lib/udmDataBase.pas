unit udmDataBase;

interface

uses
  SysUtils, Classes, DB, dbisamtb;

type
  TdmDataBase = class(TDataModule)
    TB_DEVICE: TDBISAMTable;
    TB_CARDPERMIT: TDBISAMTable;
    TB_CARD: TDBISAMTable;
    TB_DOORSCHEDULE: TDBISAMTable;
    TB_DETAILCODE: TDBISAMTable;
    TB_WATCHCODE: TDBISAMTable;
    TB_DEVICERCV: TDBISAMTable;
    TB_DOORSettingInfo: TDBISAMTable;
    TB_DOORSettingInfoRCV: TDBISAMTable;
    TB_READERSETTING: TDBISAMTable;
    TB_READERSETTINGRCV: TDBISAMTable;
    TB_ZONESETTING: TDBISAMTable;
    TB_ZONESETTINGRCV: TDBISAMTable;
    TB_Javaraschedule: TDBISAMTable;
    TB_CARDPERMITTEMP: TDBISAMTable;
  private
    { Private declarations }
    function CreateDeviceTable(aEcuID:string):Boolean;
    function CreateDeviceRcvTable(aEcuID:string):Boolean;
    function CreateDoorSettingInfoTable(aEcuID,aDoorNo:string):Boolean;
    function CreateDoorSettingInfoRcvTable(aEcuID,aDoorNo:string):Boolean;
    function CreateReaderSettingTable(aEcuID,aExtendID,aReaderNo:string):Boolean;
    function CreateReaderSettingRcvTable(aEcuID,aExtendID,aReaderNo:string):Boolean;
    function CreateZoneSettingTable(aEcuID,aExtendID,aZoneNo:string):Boolean;
    function CreateZoneSettingRCVTable(aEcuID,aExtendID,aZoneNo:string):Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    { Public declarations }
    Function DeviceTableCreate:Boolean;
    Function DeviceRcvTableCreate:Boolean;
    Function DeviceDoorTableCreate:Boolean;
    Function DeviceDoorRcvTableCreate:Boolean;
    Function DeviceReaderTableCreate:Boolean;
    Function DeviceReaderRcvTableCreate:Boolean;
    Function DeviceZoneTableCreate:Boolean;
    Function DeviceZoneRcvTableCreate:Boolean;
    Function CardTableCreate:Boolean;
    Function DoorScheduleCreate:Boolean;
    Function WatchCodeCreate:Boolean;
    Function JavaraScheduleCreate : Boolean;
  public
    Function UpdateTB_CARD_FieldName(aCardNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARDPERMIT_FieldName(aEcuID,aCardNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARDPERMIT_PERMIT(aEcuID, aCardNo,aPermit:string):Boolean;
    Function UpdateTB_CARDPERMIT_POSITION(aEcuID, aCardNo,aPositionNum,aCardPositionType:string):Boolean;
    Function UpdateTB_CARDPERMIT_PositionRcvAck(aECUID,aCardNo,aPositionNum,aRevAck,aCardType:string):boolean;
    Function UpdateTB_CARDPERMIT_DeviceAllRCVACK(aECUID,aOldRevAck,aNewRevAck:string):boolean;
    Function UpdateTB_DEVICE_FieldName(aEcuID,aFieldName,aData:string):Boolean;
    Function UpdateTB_DEVICERCV_FieldName(aEcuID,aFieldName,aData:string):Boolean;
    Function UpdateTB_DEVICERCV_AllRcvAck(aRcvAck:string):Boolean;
    Function UpdateTB_DOORSETTING_FieldName(aEcuID,aDoorNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_DOORSETTINGRCV_FieldName(aEcuID,aDoorNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_DOORSettingInfoRCV_AllRcvAck(aRcvAck:string):Boolean;
    Function UpdateTB_READERSETTING_FieldName(aEcuID,aExtendID,aReaderNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_READERSETTINGRCV_FieldName(aEcuID,aExtendID,aReaderNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_READERSETTINGRCV_AllRcvAck(aRcvAck:string):Boolean;
    Function UpdateTB_ZONESETTING_FieldName(aEcuID,aExtendID,aZoneNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_ZONESETTINGRCV_FieldName(aEcuID,aExtendID,aZoneNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_ZONESETTINGRCV_AllRcvAck(aRcvAck:string):Boolean;
    Function UpdateSchedule(aECUID, aDoorNo, aCmd,aDayOfWeek, a1ModeTime,
             a1Mode, a2ModeTime, a2Mode, a3ModeTime, a3Mode,a4ModeTime, a4Mode, a5ModeTime, a5Mode:string):Boolean;
    Function UpdateTB_Schedule_FieldName(aECUID, aDoorNo, aDayOfWeek, aFieldName,aData:string):Boolean;
    Function UpdateTB_JavaraSchedule_FieldName(aECUID, aDoorNo, aWstartTime,aWEndTime,aSstartTime,aSendTime,aNstartTime,aNendTime,aHStartTime,aHendTime,aRcvAck:string):Boolean;

    Function TB_DEVICERCVClear(aEcuID:string):Boolean;
    Function GetTB_DEVICE_Value(aEcuID,aFieldName:string):string;
    Function GetTB_DEVICERCV_Value(aEcuID,aFieldName:string):string;
    Function GetTB_DOORSETTING_Value(aEcuID,aExtendID,aDoorNo,aFieldName:string):string;
    Function GetTB_DOORSETTINGRCV_Value(aEcuID,aExtendID,aDoorNo,aFieldName:string):string;
    Function GetTB_READERSETTING_Value(aEcuID,aExtendID,aReaderNo,aFieldName:string):string;
    Function GetTB_READERSETTINGRCV_Value(aEcuID,aExtendID,aReaderNo,aFieldName:string):string;
    Function GetTB_ZONESETTING_Value(aEcuID,aExtendID,aZoneNo,aFieldName:string):string;
    Function GetTB_ZONESETTINGRCV_Value(aEcuID,aExtendID,aZoneNo,aFieldName:string):string;

    Function CheckTB_CARD(aCardNo:string):Boolean;
    Function checkTB_CARD_POSITIONNUM(aCardNo,aPositionNum:string;var aDupCardNo:string):Boolean;
    function CheckTB_DOORType(aEcuID,aExtendID,aDoorNo:string):string;
    Function CardPermitCheck(aEcuID, aCardNo:string):Boolean;

    Function InsertIntoTB_CARD(aCardNo,aCardType,aPositionNum:string):Boolean;
    Function InsertIntoTB_CARDPERMIT(aEcuID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
             aAlarm,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8, aValidDate, aRcvAck,aPositionNum,aPatrolType:string;aCardPositionType:string='Y'):Boolean;
    Function InsertIntoTB_CARDPERMITTEMP(aEcuID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
             aAlarm,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8, aValidDate, aRcvAck,aPositionNum,aPatrolType:string;aCardPositionType:string='Y'):Boolean;
    Function InsertIntoTB_CARDPERMIT_Door(aEcuID, aDoorNo,aCardNo,aDate,aCardType,aPositionNum:string):Boolean;
    Function InsertIntoTB_CARDPERMIT_ALARM(aEcuID, aCardNo,aAlarmArea,aDate,aCardType,aPositionNum:string):Boolean;
    Function InsertIntoTB_CARDPERMIT_Patrol(aEcuID, aCardNo,aDate,aCardType,aPositionNum:string):Boolean;
    Function InsertIntoTB_WATCHCODE(aCode,aCodeName:string):Boolean;
    Function InsertIntoTB_DETAILCODE(aWatchCode,aDetailCode,aCodeName:string):Boolean;

    Function DeleteTB_CARDList(aCardNo:string):Boolean;
    Function DeleteTB_CARDPERMIT_DeviceID(aEcuID:string):Boolean;
    Function DeleteTB_CARDPERMIT_Door(aEcuID, aDoorNo,aCardNo:string):Boolean;
    Function DeleteTB_CARDPERMIT_ALARM(aEcuID,aArmArea, aCardNo:string):Boolean;
    Function DeleteTB_CARDPERMIT_CardNo(aECUID,aCardNo:string):Boolean;
    Function DeleteTB_CARDPERMIT_AllCardNo(aECUID:string):Boolean;
    Function DeleteTB_CARDPERMITTEMP_All:Boolean;

    Function DeleteTB_WATCHCODE(aWatchCode:string):Boolean;
    Function DeleteTB_DETAILCODE_WatchCode(aWatchCode:string):Boolean;
    Function DeleteTB_DETAILCODE(aWatchCode,aDetailCode:string):Boolean;
  public
    function DeviceToDeviceCardPermitCopy(aOrgEcuID,aTargetEcuID:string):Boolean;
    function TempToDeviceCardPermitCopy:Boolean;
  end;

var
  dmDataBase: TdmDataBase;

  ExeFolder: String;

implementation
uses
  uCommon,
  dllFunction;
{$R *.dfm}

{ TdmDataBase }

function TdmDataBase.CardPermitCheck(aEcuID, aCardNo: string): Boolean;
var
  i : integer;
begin
  result := False;
  with TB_CARDPERMIT do
  begin
    if FindKey([aEcuID,aCardNo]) then
    begin
      if FindField('DOOR1').AsString = 'Y' then result := True;
      if FindField('DOOR2').AsString = 'Y' then result := True;
      if FindField('ALARM').AsString = 'Y' then result := True;
      for i := 1 to FIXARMAREANO do
      begin
        if FindField('ALARM' + inttostr(i)).AsString = 'Y' then result := True;
      end;
    end;
  end;
end;

Function TdmDataBase.CardTableCreate:Boolean;
begin
  result := False;
  Try
    TB_CARD.CreateTable;
    TB_CARD.Active := true;
    TB_CARDPERMIT.CreateTable;
    TB_CARDPERMIT.Active := true;
    TB_CARDPERMITTEMP.CreateTable;
    TB_CARDPERMITTEMP.Active := true;
  Except
    Exit;
  End;
  result := True;
end;

function TdmDataBase.CheckTB_CARD(aCardNo: string): Boolean;
begin
  with TB_CARD do
  begin
    if Not FindKey([aCardNo]) then result := False
    else result := True;
  end;
end;

constructor TdmDataBase.Create(AOwner: TComponent);
begin
  inherited;
  DeviceTableCreate;
  DeviceRcvTableCreate;
  DeviceDoorTableCreate;
  DeviceDoorRcvTableCreate;
  DeviceReaderTableCreate;
  DeviceReaderRcvTableCreate;
  DeviceZoneTableCreate;
  DeviceZoneRcvTableCreate;
  CardTableCreate;
  DoorScheduleCreate;
  WatchCodeCreate;
  JavaraScheduleCreate;
end;

function TdmDataBase.CreateDeviceRcvTable(aEcuID: string): Boolean;
var
  stMcuID : string;
  stEcuType : string;
  stDeviceUse : string;
begin
  Result := False;
  //if aEcuID = '00' then stDeviceUse := 'Y'
  //else
  stDeviceUse := 'N';

  stMcuID := FillZeroNumber(0,G_nIDLength);
  with TB_DEVICERCV do
  begin
    if Not FindKey([aEcuID]) then
    begin
      Append;
      FindField('DEVICE_ID').AsString:= stMcuID;
      FindField('ECU_ID').AsString:= aEcuID;
      FindField('DEVICEUSE').AsString := stDeviceUse;
      try
        Post;
      except
        Exit;
      end;
    end else
    begin
      Edit;
      FindField('DEVICEUSE').AsString := stDeviceUse;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TdmDataBase.CreateDeviceTable(aEcuID: string): Boolean;
var
  stMcuID : string;
  stEcuType : string;
  stDeviceUse : string;
begin
  Result := False;
  //if aEcuID = '00' then stDeviceUse := 'Y'
  //else
  stDeviceUse := 'N';

  stMcuID := FillZeroNumber(0,G_nIDLength);
  with TB_DEVICE do
  begin
    if Not FindKey([aEcuID]) then
    begin
      Append;
      FindField('DEVICE_ID').AsString:= stMcuID;
      FindField('ECU_ID').AsString:= aEcuID;
      FindField('DEVICE_TYPE').AsString := '1';
      FindField('DEVICEUSE').AsString := stDeviceUse;
      try
        Post;
      except
        Exit;
      end;
    end else
    begin
      Edit;
      FindField('DEVICE_TYPE').AsString := stEcuType;
      FindField('DEVICEUSE').AsString := stDeviceUse;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TdmDataBase.CreateDoorSettingInfoRcvTable(aEcuID,
  aDoorNo: string): Boolean;
begin
  Result := False;

  with TB_DOORSettingInfoRcv do
  begin
    if Not FindKey([aEcuID,'0',aDoorNo]) then
    begin
      Append;
      FindField('ECU_ID').AsString:= aEcuID;
      FindField('ECU_EXTEND').AsString:= '0';
      FindField('DOORNO').AsString := aDoorNo;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TdmDataBase.CreateDoorSettingInfoTable(aEcuID,aDoorNo: string): Boolean;
begin
  Result := False;

  with TB_DOORSettingInfo do
  begin
    if Not FindKey([aEcuID,'0',aDoorNo]) then
    begin
      Append;
      FindField('ECU_ID').AsString:= aEcuID;
      FindField('ECU_EXTEND').AsString:= '0';
      FindField('DOORNO').AsString := aDoorNo;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TdmDataBase.DeleteTB_CARDList(aCardNo: string): Boolean;
begin
  result := False;
  with TB_CARD do
  begin
    if FindKey([aCardNo]) then
    begin
      try
        Delete;
      except
        Exit;
      end;
    end;
  end;
  result := True;
end;

function TdmDataBase.DeleteTB_CARDPERMIT_ALARM(aEcuID,aArmArea,
  aCardNo: string): Boolean;
begin
  if aArmArea = '0' then aArmArea := '';
  result := False;
  with TB_CARDPERMIT do
  begin
    if FindKey([aEcuID,aCardNo]) then
    begin
      Edit;
      FindField('ALARM' + aArmArea).AsString := 'N';
      FindField('RCVACK').AsString := 'N';
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  result := True;
end;

function TdmDataBase.DeleteTB_CARDPERMIT_AllCardNo(
  aECUID: string): Boolean;
begin
  result := False;
  with TB_CARDPERMIT do
  begin
    First;
    While Not Eof do
    begin
      if FindField('ECUID').AsString = aEcuID then
      begin
        try
          Delete;
        except
          Exit;
        end;
      end else
      begin
        Next;
      end;
    end;
  end;
end;

function TdmDataBase.DeleteTB_CARDPERMIT_CardNo(aECUID,
  aCardNo: string): Boolean;
begin
  result := False;
  with TB_CARDPERMIT do
  begin
    if FindKey([aEcuID,aCardNo]) then
    begin
      try
        Delete;
      except
        Exit;
      end;
      result := True;
    end;
  end;
end;

function TdmDataBase.DeleteTB_CARDPERMIT_DeviceID(aEcuID: string): Boolean;
var
  i : integer;
begin
  with TB_CARDPERMIT do
  begin
    //Last;
    First;
    While Not Eof do
    begin
      if FindField('ECUID').AsString = aEcuID then
      begin
        Try
          Delete;
        Except
        End;
      end else
      begin
        //Prior;
        Next;
      end;
    end;
  end;
end;

function TdmDataBase.DeleteTB_CARDPERMIT_Door(aEcuID, aDoorNo,
  aCardNo: string): Boolean;
begin
  result := False;
  with TB_CARDPERMIT do
  begin
    if FindKey([aEcuID,aCardNo]) then
    begin
      Edit;
      FindField('DOOR'+aDoorNo).AsString := 'N';
      FindField('RCVACK').AsString := 'N';
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  result := True;
end;

function TdmDataBase.DeleteTB_DETAILCODE(aWatchCode,
  aDetailCode: string): Boolean;
begin
  result := False;
  with TB_DETAILCODE do
  begin
    if FindKey([aDetailCode]) then
    begin
      try
        Delete;
      except
        Exit;
      end;
      result := True;
    end;
  end;

end;

function TdmDataBase.DeleteTB_DETAILCODE_WatchCode(
  aWatchCode: string): Boolean;
begin
  result := False;
  with TB_DETAILCODE do
  begin
    First;
    While Not Eof do
    begin
      if FindField('WATCHCODE').AsString = aWatchCode then
      begin
        try
          Delete;
        except
          Exit;
        end;
      end else
      begin
        Next;
      end;
    end;
    result := True;
  end;
end;

function TdmDataBase.DeleteTB_WATCHCODE(aWatchCode: string): Boolean;
begin
  result := False;
  with TB_WATCHCODE do
  begin
    if FindKey([aWatchCode]) then
    begin
      try
        Delete;
      except
        Exit;
      end;
      result := True;
    end;
  end;

end;

destructor TdmDataBase.Destroy;
begin

  inherited;
end;

function TdmDataBase.DeviceDoorRcvTableCreate: Boolean;
var
  i,j:integer;
  stEcuID : string;
begin
  result := False;
  Try
    TB_DOORSettingInfoRCV.CreateTable;
    TB_DOORSettingInfoRCV.Active := true;
    for i := 0 to G_nMaxEcuCount do
    begin
      stEcuID := FillZeroNumber(i,2);
      for j:= 1 to FIXMAXDOORNO do
      begin
        CreateDoorSettingInfoRcvTable(stEcuID,inttostr(j));
      end;
    end;
  Except
    Exit;
  End;
  result := True;
end;

function TdmDataBase.DeviceDoorTableCreate: Boolean;
var
  i,j:integer;
  stEcuID : string;
begin
  result := False;
  Try
    TB_DOORSettingInfo.CreateTable;
    TB_DOORSettingInfo.Active := true;
    for i := 0 to G_nMaxEcuCount do
    begin
      stEcuID := FillZeroNumber(i,2);
      for j:= 1 to FIXMAXDOORNO do
      begin
        CreateDoorSettingInfoTable(stEcuID,inttostr(j));
      end;
    end;
  Except
    Exit;
  End;
  result := True;
end;

function TdmDataBase.DeviceRcvTableCreate: Boolean;
var
  i : integer;
  stEcuID : string;
begin
  result := False;
  Try
    TB_DEVICERCV.CreateTable;
    TB_DEVICERCV.Active := true;
    for i := 0 to G_nMaxEcuCount do
    begin
      stEcuID := FillZeroNumber(i,2);
      CreateDeviceRcvTable(stEcuID);
    end;
  Except
    Exit;
  End;
  result := True;
end;

function TdmDataBase.DeviceTableCreate:Boolean;
var
  i : integer;
  stEcuID : string;
begin
  result := False;
  Try
    TB_DEVICE.CreateTable;
    TB_DEVICE.Active := true;
    for i := 0 to G_nMaxEcuCount do
    begin
      stEcuID := FillZeroNumber(i,2);
      CreateDeviceTable(stEcuID);
    end;
  Except
    Exit;
  End;
  result := True;
end;

function TdmDataBase.DoorScheduleCreate: Boolean;
begin
  result := False;
  Try
    TB_DOORSCHEDULE.CreateTable;
    TB_DOORSCHEDULE.Active := true;
  Except
    Exit;
  End;
  result := True;

end;

function TdmDataBase.GetTB_DEVICERCV_Value(aEcuID,
  aFieldName: string): string;
begin
  result := 'N';
  with TB_DEVICERCV do
  begin
    if FindKey([aEcuID]) then
    begin
      result := FindField(aFieldName).AsString;
    end;
  end;
end;

function TdmDataBase.GetTB_DEVICE_Value(aEcuID,
  aFieldName: string): string;
begin

  Try
    with TB_DEVICE do
    begin
      if FindKey([aEcuID]) then
      begin
        result := FindField(aFieldName).AsString;
      end;
    end;
  Except
    result := '';
  End;

end;

function TdmDataBase.InsertIntoTB_CARD(aCardNo,aCardType,aPositionNum: string): Boolean;
begin
  result := False;
  with TB_CARD do
  begin
    if Not FindKey([aCardNo]) then
    begin
      Append;
      FindField('CARDNO').AsString := aCardNo;
      FindField('CARDTYPE').AsString := aCardType;
      FindField('POSITIONNUM').AsString := aPositionNum;
      try
        Post;
      except
        Exit;
      end;
      result := True;
    end;
  end;
end;

function TdmDataBase.InsertIntoTB_CARDPERMIT(aEcuID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
             aAlarm,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8, aValidDate, aRcvAck,aPositionNum,aPatrolType: string;aCardPositionType:string='Y'): Boolean;
begin
  result := False;
  with TB_CARDPERMIT do
  begin
    if Not FindKey([aEcuID,aCardNo]) then
    begin
      Append;
      FindField('ECUID').AsString := aEcuID;
      FindField('CARDNO').AsString := aCardNo;
      FindField('PERMIT').AsString := aPermit;
      FindField('DOOR1').AsString := aDoor1;
      FindField('DOOR2').AsString := aDoor2;
      FindField('DOOR3').AsString := aDoor3;
      FindField('DOOR4').AsString := aDoor4;
      FindField('DOOR5').AsString := aDoor5;
      FindField('DOOR6').AsString := aDoor6;
      FindField('DOOR7').AsString := aDoor7;
      FindField('DOOR8').AsString := aDoor8;
      FindField('ALARM').AsString := aAlarm;
      FindField('ALARM1').AsString := aAlarm1;
      FindField('ALARM2').AsString := aAlarm2;
      FindField('ALARM3').AsString := aAlarm3;
      FindField('ALARM4').AsString := aAlarm4;
      FindField('ALARM5').AsString := aAlarm5;
      FindField('ALARM6').AsString := aAlarm6;
      FindField('ALARM7').AsString := aAlarm7;
      FindField('ALARM8').AsString := aAlarm8;
      FindField('VALIDDATE').AsString := aValidDate;
      FindField('RCVACK').AsString := aRcvAck;
      FindField('POSITIONNUM').AsString := aPositionNum;
      FindField('CARDTYPE').AsString := aPatrolType;
      FindField('CARDPOSITIONTYPE').AsString := aCardPositionType;
      try
        Post;
      except
        Exit;
      end;
      result := True;
    end else
    begin
      edit;
      FindField('PERMIT').AsString := aPermit;
      FindField('DOOR1').AsString := aDoor1;
      FindField('DOOR2').AsString := aDoor2;
      FindField('DOOR3').AsString := aDoor3;
      FindField('DOOR4').AsString := aDoor4;
      FindField('DOOR5').AsString := aDoor5;
      FindField('DOOR6').AsString := aDoor6;
      FindField('DOOR7').AsString := aDoor7;
      FindField('DOOR8').AsString := aDoor8;
      FindField('ALARM').AsString := aAlarm;
      FindField('ALARM1').AsString := aAlarm1;
      FindField('ALARM2').AsString := aAlarm2;
      FindField('ALARM3').AsString := aAlarm3;
      FindField('ALARM4').AsString := aAlarm4;
      FindField('ALARM5').AsString := aAlarm5;
      FindField('ALARM6').AsString := aAlarm6;
      FindField('ALARM7').AsString := aAlarm7;
      FindField('ALARM8').AsString := aAlarm8;
      FindField('VALIDDATE').AsString := aValidDate;
      FindField('RCVACK').AsString := aRcvAck;
      FindField('POSITIONNUM').AsString := aPositionNum;
      FindField('CARDTYPE').AsString := aPatrolType;
      FindField('CARDPOSITIONTYPE').AsString := aCardPositionType;
      try
        Post;
      except
        Exit;
      end;
      result := True;
    end;
  end;
end;

function TdmDataBase.InsertIntoTB_DETAILCODE(aWatchCode, aDetailCode,
  aCodeName: string): Boolean;
begin
  result := False;
  with TB_DETAILCODE do
  begin
    if FindKey([aDetailCode]) then
    begin
      Edit;
      FindField('WATCHCODE').AsString := aWatchCode;
      FindField('DETAILNAME').AsString := aCodeName;
      try
        Post;
      except
        Exit;
      end;
    end else
    begin
      Append;
      FindField('WATCHCODE').AsString := aWatchCode;
      FindField('DETAILCODE').AsString := aDetailCode;
      FindField('DETAILNAME').AsString := aCodeName;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  result := True;
end;

function TdmDataBase.InsertIntoTB_WATCHCODE(aCode,
  aCodeName: string): Boolean;
begin
  result := False;
  with TB_WATCHCODE do
  begin
    if FindKey([aCode]) then
    begin
      Edit;
      FindField('WATCHNAME').AsString := aCodeName;
      try
        Post;
      except
        Exit;
      end;
    end else
    begin
      Append;
      FindField('WATCHCODE').AsString := aCode;
      FindField('WATCHNAME').AsString := aCodeName;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  result := True;
end;

function TdmDataBase.InsertIntoTB_CARDPERMIT_ALARM(aEcuID,
  aCardNo,aAlarmArea,aDate,aCardType,aPositionNum: string): Boolean;
var
  stAlarmField : string;
begin
  stAlarmField := 'ALARM';
  if aAlarmArea <> '0' then stAlarmField := stAlarmField + aAlarmArea;
  result := False;
  with TB_CARDPERMIT do
  begin
    if FindKey([aEcuID,aCardNo]) then
    begin
      Edit;
      FindField('PERMIT').AsString := 'L';
      FindField(stAlarmField).AsString := 'Y';
      FindField('RCVACK').AsString := 'N';
      FindField('VALIDDATE').AsString := aDate;
      FindField('CARDTYPE').AsString := aCardType;
      FindField('POSITIONNUM').AsString := aPositionNum;
      FindField('CARDPOSITIONTYPE').AsString := 'Y';
      try
        Post;
      except
        Exit;
      end;
    end else
    begin
      Append;
      FindField('ECUID').AsString := aEcuID;
      FindField('CARDNO').AsString := aCardNo;
      FindField('PERMIT').AsString := 'L';
      FindField(stAlarmField).AsString := 'Y';
      FindField('RCVACK').AsString := 'N';
      FindField('VALIDDATE').AsString := aDate;
      FindField('CARDTYPE').AsString := aCardType;
      FindField('POSITIONNUM').AsString := aPositionNum;
      FindField('CARDPOSITIONTYPE').AsString := 'Y';
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  result := True;
end;

function TdmDataBase.InsertIntoTB_CARDPERMIT_Door(aEcuID, aDoorNo,
  aCardNo,aDate,aCardType,aPositionNum: string): Boolean;
begin
  result := False;
  with TB_CARDPERMIT do
  begin
    if FindKey([aEcuID,aCardNo]) then
    begin
      Edit;
      FindField('PERMIT').AsString := 'L';
      FindField('DOOR'+aDoorNo).AsString := 'Y';
      FindField('RCVACK').AsString := 'N';
      FindField('VALIDDATE').AsString := aDate;
      FindField('CARDTYPE').AsString := aCardType;
      FindField('POSITIONNUM').AsString := aPositionNum;
      FindField('CARDPOSITIONTYPE').AsString := 'Y';
      try
        Post;
      except
        Exit;
      end;
    end else
    begin
      Append;
      FindField('ECUID').AsString := aEcuID;
      FindField('CARDNO').AsString := aCardNo;
      FindField('PERMIT').AsString := 'L';
      FindField('DOOR'+aDoorNo).AsString := 'Y';
      FindField('RCVACK').AsString := 'N';
      FindField('VALIDDATE').AsString := aDate;
      FindField('CARDTYPE').AsString := aCardType;
      FindField('POSITIONNUM').AsString := aPositionNum;
      FindField('CARDPOSITIONTYPE').AsString := 'Y';
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  result := True;
end;

function TdmDataBase.InsertIntoTB_CARDPERMIT_Patrol(aEcuID, aCardNo, aDate,
  aCardType,aPositionNum: string): Boolean;
begin
  result := False;
  with TB_CARDPERMIT do
  begin
    if FindKey([aEcuID,aCardNo]) then
    begin
      Edit;
      FindField('RCVACK').AsString := 'N';
      FindField('VALIDDATE').AsString := aDate;
      FindField('CARDTYPE').AsString := aCardType;
      FindField('POSITIONNUM').AsString := aPositionNum;
      FindField('CARDPOSITIONTYPE').AsString := 'Y';
      try
        Post;
      except
        Exit;
      end;
    end else
    begin
      Append;
      FindField('ECUID').AsString := aEcuID;
      FindField('CARDNO').AsString := aCardNo;
      FindField('PERMIT').AsString := 'L';
      FindField('ALARM').AsString := 'N';
      FindField('RCVACK').AsString := 'N';
      FindField('VALIDDATE').AsString := aDate;
      FindField('CARDTYPE').AsString := aCardType;
      FindField('POSITIONNUM').AsString := aPositionNum;
      FindField('CARDPOSITIONTYPE').AsString := 'Y';
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  result := True;
end;

function TdmDataBase.TB_DEVICERCVClear(aEcuID:string): Boolean;
var
  i,j : integer;
  stFieldName : string;
begin
  result := False;
  with TB_DEVICERCV do
  begin
    if FindKey([aEcuID]) then
    begin
      for j:= 2 to FieldCount - 1 do
      begin
        stFieldName := TB_DEVICERCV.Fields[j].FullName;
        UpdateTB_DEVICERCV_FieldName(aEcuID,stFieldName,'N');
      end;
    end;
  end;
  result := True;
end;

function TdmDataBase.UpdateSchedule(aECUID, aDoorNo, aCmd, aDayOfWeek,
  a1ModeTime, a1Mode, a2ModeTime, a2Mode, a3ModeTime, a3Mode, a4ModeTime,
  a4Mode, a5ModeTime, a5Mode: string): Boolean;
begin
  with TB_DOORSCHEDULE do
  begin
    if Not FindKey([aEcuID,aDoorNo,aDayOfWeek]) then
    begin
      Append;
      FindField('ECUID').AsString := aEcuID;
      FindField('DOORNO').AsString := aDoorNo;
      FindField('DAYCODE').AsString := aDayOfWeek;
      FindField('TIME1').AsString := a1ModeTime;
      FindField('TIME1MODE').AsString := a1Mode;
      FindField('TIME2').AsString := a2ModeTime;
      FindField('TIME2MODE').AsString := a2Mode;
      FindField('TIME3').AsString := a3ModeTime;
      FindField('TIME3MODE').AsString := a3Mode;
      FindField('TIME4').AsString := a4ModeTime;
      FindField('TIME4MODE').AsString := a4Mode;
      FindField('TIME5').AsString := a5ModeTime;
      FindField('TIME5MODE').AsString := a5Mode;
      Try
        Post;
      Except
        Exit;
      End;
      result := True;
    end else
    begin
      Edit;
      FindField('TIME1').AsString := a1ModeTime;
      FindField('TIME1MODE').AsString := a1Mode;
      FindField('TIME2').AsString := a2ModeTime;
      FindField('TIME2MODE').AsString := a2Mode;
      FindField('TIME3').AsString := a3ModeTime;
      FindField('TIME3MODE').AsString := a3Mode;
      FindField('TIME4').AsString := a4ModeTime;
      FindField('TIME4MODE').AsString := a4Mode;
      FindField('TIME5').AsString := a5ModeTime;
      FindField('TIME5MODE').AsString := a5Mode;
      Try
        Post;
      Except
        Exit;
      End;
      result := True;
    end;
  end;

end;

function TdmDataBase.UpdateTB_CARDPERMIT_PERMIT(aEcuID, aCardNo,
  aPermit: string): Boolean;
begin
  result := False;
  with TB_CARDPERMIT do
  begin
    if FindKey([aEcuID,aCardNo]) then
    begin
      Edit;
      FindField('PERMIT').AsString := aPermit;
      FindField('RCVACK').AsString := 'N';
      try
        Post;
      except
        Exit;
      end;
      result := True;
    end;
  end;
end;

function TdmDataBase.UpdateTB_CARDPERMIT_PositionRcvAck(aECUID, aCardNo,aPositionNum,
  aRevAck,aCardType: string): boolean;
begin
  result := False;
  with TB_CARDPERMIT do
  begin
    if FindKey([aEcuID,aCardNo]) then
    begin
      Edit;
      FindField('POSITIONNUM').AsString := aPositionNum;
      FindField('RCVACK').AsString := aRevAck;
      FindField('CARDTYPE').AsString := Trim(aCardType);
      try
        Post;
      except
        Exit;
      end;
      result := True;
    end;
  end;
end;




function TdmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID, aFieldName,
  aData: string): Boolean;
begin
  with TB_DEVICERCV do
  begin
    if FindKey([aEcuID]) then
    begin
      Edit;
      FindField(aFieldName).AsString := aData;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;

end;

function TdmDataBase.UpdateTB_DEVICE_FieldName(aEcuID, aFieldName,
  aData: string): Boolean;
begin
  with TB_DEVICE do
  begin
    if FindKey([aEcuID]) then
    begin
      Edit;
      FindField(aFieldName).AsString := aData;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
end;


function TdmDataBase.UpdateTB_DOORSETTING_FieldName(aEcuID,aDoorNo, aFieldName,
  aData: string): Boolean;
begin
  with TB_DOORSettingInfo do
  begin
    if FindKey([aEcuID,'0',aDoorNo]) then
    begin
      Edit;
      FindField(aFieldName).AsString := aData;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
end;

function TdmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aEcuID,aDoorNo, aFieldName,
  aData: string): Boolean;
begin
  with TB_DOORSettingInfoRCV do
  begin
    if FindKey([aEcuID,'0',aDoorNo]) then
    begin
      Edit;
      FindField(aFieldName).AsString := aData;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;

end;

function TdmDataBase.UpdateTB_Schedule_FieldName(aECUID, aDoorNo,
  aDayOfWeek, aFieldName, aData: string): Boolean;
begin
  with TB_DOORSCHEDULE do
  begin
    if FindKey([aEcuID,aDoorNo,aDayOfWeek]) then
    begin
      Edit;
      FindField(aFieldName).AsString := aData;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;

end;

function TdmDataBase.WatchCodeCreate: Boolean;
begin
  result := False;
  Try
    TB_WATCHCODE.CreateTable;
    TB_WATCHCODE.Active := true;
    TB_DETAILCODE.CreateTable;
    TB_DETAILCODE.Active := True;
  Except
    Exit;
  End;
  result := True;

end;

function TdmDataBase.CreateReaderSettingRcvTable(aEcuID, aExtendID,
  aReaderNo: string): Boolean;
begin
  Result := False;

  with TB_READERSETTINGRCV do
  begin
    if Not FindKey([aEcuID,aExtendID,aReaderNo]) then
    begin
      Append;
      FindField('ECU_ID').AsString:= aEcuID;
      FindField('ECU_EXTEND').AsString:= aExtendID;
      FindField('READERNO').AsString := aReaderNo;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TdmDataBase.CreateReaderSettingTable(aEcuID, aExtendID,
  aReaderNo: string): Boolean;
begin
  Result := False;

  with TB_READERSETTING do
  begin
    if Not FindKey([aEcuID,aExtendID,aReaderNo]) then
    begin
      Append;
      FindField('ECU_ID').AsString:= aEcuID;
      FindField('ECU_EXTEND').AsString:= aExtendID;
      FindField('READERNO').AsString := aReaderNo;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TdmDataBase.DeviceReaderRcvTableCreate: Boolean;
var
  i,j,k:integer;
  stEcuID : string;
begin
  result := False;
  Try
    TB_READERSETTINGRCV.CreateTable;
    TB_READERSETTINGRCV.Active := true;
    for i := 0 to FIXMAXECUNO do
    begin
      stEcuID := FillZeroNumber(i,2);
      for j:= 0 to FIXMAXZONEEXTENDNO do   //0 은 컨트롤러임
      begin
        for k := 1 to FIXMAXREADERNO do
        begin
          CreateReaderSettingRcvTable(stEcuID,inttostr(j),inttostr(k));
        end;
      end;
    end;
  Except
    Exit;
  End;
  result := True;
end;

function TdmDataBase.DeviceReaderTableCreate: Boolean;
var
  i,j,k:integer;
  stEcuID : string;
begin
  result := False;
  Try
    TB_READERSETTING.CreateTable;
    TB_READERSETTING.Active := true;
    for i := 0 to FIXMAXECUNO do
    begin
      stEcuID := FillZeroNumber(i,2);
      for j:= 0 to FIXMAXZONEEXTENDNO do   //0 은 컨트롤러임
      begin
        for k := 1 to FIXMAXREADERNO do
        begin
          CreateReaderSettingTable(stEcuID,inttostr(j),inttostr(k));
        end;
      end;
    end;
  Except
    Exit;
  End;
  result := True;
end;

function TdmDataBase.CreateZoneSettingRCVTable(aEcuID, aExtendID,
  aZoneNo: string): Boolean;
begin
  Result := False;

  with TB_ZONESETTINGRCV do
  begin
    if Not FindKey([aEcuID,aExtendID,aZoneNo]) then
    begin
      Append;
      FindField('ECU_ID').AsString:= aEcuID;
      FindField('ECU_EXTEND').AsString:= aExtendID;
      FindField('ZONENO').AsString := aZoneNo;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TdmDataBase.CreateZoneSettingTable(aEcuID, aExtendID,
  aZoneNo: string): Boolean;
begin
  Result := False;

  with TB_ZONESETTING do
  begin
    if Not FindKey([aEcuID,aExtendID,aZoneNo]) then
    begin
      Append;
      FindField('ECU_ID').AsString:= aEcuID;
      FindField('ECU_EXTEND').AsString:= aExtendID;
      FindField('ZONENO').AsString := aZoneNo;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TdmDataBase.DeviceZoneRcvTableCreate: Boolean;
var
  i,j,k:integer;
  stEcuID : string;
begin
  result := False;
  Try
    TB_ZONESETTINGRCV.CreateTable;
    TB_ZONESETTINGRCV.Active := true;
    for i := 0 to FIXMAXECUNO do
    begin
      stEcuID := FillZeroNumber(i,2);
      for j:= 0 to FIXMAXZONEEXTENDNO do   //0 은 컨트롤러임
      begin
        for k := 1 to FIXMAXZONENO do
        begin
          CreateZoneSettingRcvTable(stEcuID,inttostr(j),inttostr(k));
        end;
      end;
    end;
  Except
    Exit;
  End;
  result := True;
end;

function TdmDataBase.DeviceZoneTableCreate: Boolean;
var
  i,j,k:integer;
  stEcuID : string;
begin
  result := False;
  Try
    TB_ZONESETTING.CreateTable;
    TB_ZONESETTING.Active := true;
    for i := 0 to FIXMAXECUNO do
    begin
      stEcuID := FillZeroNumber(i,2);
      for j:= 0 to FIXMAXZONEEXTENDNO do   //0 은 컨트롤러임
      begin
        for k := 1 to FIXMAXZONENO do
        begin
          CreateZoneSettingTable(stEcuID,inttostr(j),inttostr(k));
        end;
      end;
    end;
  Except
    Exit;
  End;
  result := True;
end;

function TdmDataBase.UpdateTB_READERSETTING_FieldName(aEcuID, aExtendID,aReaderNo,
  aFieldName, aData: string): Boolean;
begin
  with TB_READERSETTING do
  begin
    if FindKey([aEcuID,aExtendID,aReaderNo]) then
    begin
      Edit;
      FindField(aFieldName).AsString := aData;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
end;

function TdmDataBase.UpdateTB_READERSETTINGRCV_FieldName(aEcuID,aExtendID, aReaderNo,
  aFieldName, aData: string): Boolean;
begin
  with TB_READERSETTINGRCV do
  begin
    if FindKey([aEcuID,aExtendID,aReaderNo]) then
    begin
      Edit;
      FindField(aFieldName).AsString := aData;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
end;

function TdmDataBase.UpdateTB_ZONESETTING_FieldName(aEcuID,aExtendID, aZoneNo,
  aFieldName, aData: string): Boolean;
begin
  with TB_ZONESETTING do
  begin
    if FindKey([aEcuID,aExtendID,aZoneNo]) then
    begin
      Edit;
      FindField(aFieldName).AsString := aData;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;

end;

function TdmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(aEcuID,aExtendID, aZoneNo,
  aFieldName, aData: string): Boolean;
begin
  with TB_ZONESETTINGRCV do
  begin
    if FindKey([aEcuID,aExtendID,aZoneNo]) then
    begin
      Edit;
      FindField(aFieldName).AsString := aData;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;

end;

function TdmDataBase.CheckTB_DOORType(aEcuID, aExtendID,
  aDoorNo: string): string;
begin
  result := '0';
  with dmDataBase.TB_DOORSettingInfo do
  begin
    if FindKey([aEcuID,aExtendID,aDoorNo]) then
    begin
      result := FindField('DOOR_TYPE').AsString ;
    end;
  end;
end;

function TdmDataBase.GetTB_DOORSETTING_Value(aEcuID, aExtendID, aDoorNo,
  aFieldName: string): string;
begin
  Try
    with TB_DOORSettingInfo do
    begin
      if FindKey([aEcuID,aExtendID,aDoorNo]) then
      begin
        result := FindField(aFieldName).AsString;
      end;
    end;
  Except
    result := '';
  End;
end;

function TdmDataBase.GetTB_DOORSETTINGRCV_Value(aEcuID, aExtendID, aDoorNo,
  aFieldName: string): string;
begin
  Try
    with TB_DOORSettingInfoRcv do
    begin
      if FindKey([aEcuID,aExtendID,aDoorNo]) then
      begin
        result := FindField(aFieldName).AsString;
      end;
    end;
  Except
    result := '';
  End;

end;

function TdmDataBase.GetTB_READERSETTING_Value(aEcuID, aExtendID,
  aReaderNo, aFieldName: string): string;
begin
  Try
    with TB_READERSETTING do
    begin
      if FindKey([aEcuID,aExtendID,aReaderNo]) then
      begin
        result := FindField(aFieldName).AsString;
      end;
    end;
  Except
    result := '';
  End;

end;

function TdmDataBase.GetTB_READERSETTINGRCV_Value(aEcuID, aExtendID,
  aReaderNo, aFieldName: string): string;
begin
  Try
    with TB_READERSETTINGRCV do
    begin
      if FindKey([aEcuID,aExtendID,aReaderNo]) then
      begin
        result := FindField(aFieldName).AsString;
      end;
    end;
  Except
    result := '';
  End;

end;

function TdmDataBase.GetTB_ZONESETTING_Value(aEcuID, aExtendID, aZoneNo,
  aFieldName: string): string;
begin
  Try
    with TB_ZONESETTING do
    begin
      if FindKey([aEcuID,aExtendID,aZoneNo]) then
      begin
        result := FindField(aFieldName).AsString;
      end;
    end;
  Except
    result := '';
  End;

end;

function TdmDataBase.GetTB_ZONESETTINGRCV_Value(aEcuID, aExtendID, aZoneNo,
  aFieldName: string): string;
begin
  Try
    with TB_ZONESETTINGRCV do
    begin
      if FindKey([aEcuID,aExtendID,aZoneNo]) then
      begin
        result := FindField(aFieldName).AsString;
      end;
    end;
  Except
    result := '';
  End;

end;

function TdmDataBase.UpdateTB_JavaraSchedule_FieldName(aECUID, aDoorNo,
  aWstartTime, aWEndTime, aSstartTime, aSendTime, aNstartTime, aNendTime,
  aHStartTime, aHendTime,aRcvAck: string): Boolean;
begin
  with TB_Javaraschedule do
  begin
    if FindKey([aEcuID,aDoorNo]) then
    begin
      Edit;
      FindField('wStartTime').AsString := aWstartTime;
      FindField('wEndTime').AsString := aWEndTime;
      FindField('sStartTime').AsString := aSstartTime;
      FindField('sEndTime').AsString := aSEndTime;
      FindField('nStartTime').AsString := aNstartTime;
      FindField('nEndTime').AsString := aNEndTime;
      FindField('hStartTime').AsString := aHstartTime;
      FindField('hEndTime').AsString := aHEndTime;
      FindField('rcvack').AsString := aRcvAck;
      try
        Post;
      except
        Exit;
      end;
    end else
    begin
      Append;
      FindField('ECUID').AsString := aECUID;
      FindField('DOORNO').AsString := aDoorNo;
      FindField('wStartTime').AsString := aWstartTime;
      FindField('wEndTime').AsString := aWEndTime;
      FindField('sStartTime').AsString := aSstartTime;
      FindField('sEndTime').AsString := aSEndTime;
      FindField('nStartTime').AsString := aNstartTime;
      FindField('nEndTime').AsString := aNEndTime;
      FindField('hStartTime').AsString := aHstartTime;
      FindField('hEndTime').AsString := aHEndTime;
      FindField('rcvack').AsString := aRcvAck;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
end;

function TdmDataBase.JavaraScheduleCreate: Boolean;
begin
  result := False;
  Try
    TB_Javaraschedule.CreateTable;
    TB_Javaraschedule.Active := true;
  Except
    Exit;
  End;
  result := True;

end;

function TdmDataBase.UpdateTB_CARDPERMIT_POSITION(aEcuID, aCardNo,
  aPositionNum, aCardPositionType: string): Boolean;
begin
  result := False;
  with TB_CARDPERMIT do
  begin
    if FindKey([aEcuID,aCardNo]) then
    begin
      Edit;
      FindField('POSITIONNUM').AsString := aPositionNum;
      FindField('CARDPOSITIONTYPE').AsString := aCardPositionType;
      FindField('RCVACK').AsString := 'N';
      try
        Post;
      except
        Exit;
      end;
      result := True;
    end;
  end;
end;

function TdmDataBase.UpdateTB_CARDPERMIT_DeviceAllRCVACK(aECUID,
  aOldRevAck, aNewRevAck: string): boolean;
begin
  result := False;
  with TB_CARDPERMIT do
  begin
    First;
    While Not Eof do
    begin
      if (FindField('ECUID').AsString = aEcuID) and (FindField('RCVACK').AsString = aOldRevAck) then
      begin
        Edit;
        FindField('RCVACK').AsString := aNewRevAck;
        try
          Post;
        except
          Exit;
        end;
        result := True;
      end;
      Next;
    end;
  end;

end;

function TdmDataBase.UpdateTB_DEVICERCV_AllRcvAck(aRcvAck: string): Boolean;
var
  i : integer;
begin
  result := False;
  with TB_DEVICERCV do
  begin
    First;
    While Not Eof do
    begin
      for i := 2 to FieldCount - 1 do
      begin
        Edit;
        Fields.Fields[i].AsString := aRcvAck;
        //FindField('RCVACK').AsString := aRcvAck;
        try
          Post;
        except
          Exit;
        end;
      end;
      result := True;
      Next;
    end;
  end;
end;

function TdmDataBase.UpdateTB_DOORSettingInfoRCV_AllRcvAck(
  aRcvAck: string): Boolean;
var
  i : integer;
begin
  result := False;
  with TB_DOORSettingInfoRCV do
  begin
    First;
    While Not Eof do
    begin
      for i := 3 to FieldCount - 1 do
      begin
        Edit;
        Fields.Fields[i].AsString := aRcvAck;
        //FindField('RCVACK').AsString := aRcvAck;
        try
          Post;
        except
          Exit;
        end;
      end;
      result := True;
      Next;
    end;
  end;
end;

function TdmDataBase.UpdateTB_READERSETTINGRCV_AllRcvAck(
  aRcvAck: string): Boolean;
var
  i : integer;
begin
  result := False;
  with TB_READERSETTINGRCV do
  begin
    First;
    While Not Eof do
    begin
      for i := 3 to FieldCount - 1 do
      begin
        Edit;
        Fields.Fields[i].AsString := aRcvAck;
        //FindField('RCVACK').AsString := aRcvAck;
        try
          Post;
        except
          Exit;
        end;
      end;
      result := True;
      Next;
    end;
  end;
end;

function TdmDataBase.UpdateTB_ZONESETTINGRCV_AllRcvAck(
  aRcvAck: string): Boolean;
var
  i : integer;
begin
  result := False;
  with TB_ZONESETTINGRCV do
  begin
    First;
    While Not Eof do
    begin
      for i := 3 to FieldCount - 1 do
      begin
        Edit;
        Fields.Fields[i].AsString := aRcvAck;
        //FindField('RCVACK').AsString := aRcvAck;
        try
          Post;
        except
          Exit;
        end;
      end;
      result := True;
      Next;
    end;
  end;
end;

function TdmDataBase.UpdateTB_CARDPERMIT_FieldName(aEcuID, aCardNo,
  aFieldName, aData: string): Boolean;
begin
  with TB_CARDPERMIT do
  begin
    if FindKey([aEcuID,aCardNo]) then
    begin
      Edit;
      FindField(aFieldName).AsString := aData;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
end;

function TdmDataBase.DeviceToDeviceCardPermitCopy(aOrgEcuID,
  aTargetEcuID: string): Boolean;
begin
  DeleteTB_CARDPERMITTEMP_All;
  if aOrgEcuID = aTargetEcuID then Exit;
  with TB_CARDPERMIT do
  begin
    First;
    While Not Eof do
    begin
      if FindField('ECUID').AsString = aOrgEcuID then
      begin
        InsertIntoTB_CARDPERMITTEMP(aTargetEcuID,FindField('CARDNO').AsString,FindField('PERMIT').AsString,
             FindField('DOOR1').AsString,FindField('DOOR2').AsString,FindField('DOOR3').AsString,
             FindField('DOOR4').AsString,FindField('DOOR5').AsString,FindField('DOOR6').AsString,
             FindField('DOOR7').AsString,FindField('DOOR8').AsString,FindField('ALARM').AsString,
             FindField('ALARM1').AsString,FindField('ALARM2').AsString,FindField('ALARM3').AsString,
             FindField('ALARM4').AsString,FindField('ALARM5').AsString,FindField('ALARM6').AsString,
             FindField('ALARM7').AsString,FindField('ALARM8').AsString, FindField('VALIDDATE').AsString,
             'N',FindField('POSITIONNUM').AsString,FindField('CARDTYPE').AsString,FindField('CARDPOSITIONTYPE').AsString);
      end;
      Next;
    end;
  end;
  TempToDeviceCardPermitCopy;
end;

function TdmDataBase.InsertIntoTB_CARDPERMITTEMP(aEcuID, aCardNo, aPermit,
  aDoor1, aDoor2, aDoor3, aDoor4, aDoor5, aDoor6, aDoor7, aDoor8, aAlarm,
  aAlarm1, aAlarm2, aAlarm3, aAlarm4, aAlarm5, aAlarm6, aAlarm7, aAlarm8,
  aValidDate, aRcvAck, aPositionNum, aPatrolType,
  aCardPositionType: string): Boolean;
begin
  result := False;
  with TB_CARDPERMITTEMP do
  begin
    if Not FindKey([aEcuID,aCardNo]) then
    begin
      Append;
      FindField('ECUID').AsString := aEcuID;
      FindField('CARDNO').AsString := aCardNo;
      FindField('PERMIT').AsString := aPermit;
      FindField('DOOR1').AsString := aDoor1;
      FindField('DOOR2').AsString := aDoor2;
      FindField('DOOR3').AsString := aDoor3;
      FindField('DOOR4').AsString := aDoor4;
      FindField('DOOR5').AsString := aDoor5;
      FindField('DOOR6').AsString := aDoor6;
      FindField('DOOR7').AsString := aDoor7;
      FindField('DOOR8').AsString := aDoor8;
      FindField('ALARM').AsString := aAlarm;
      FindField('ALARM1').AsString := aAlarm1;
      FindField('ALARM2').AsString := aAlarm2;
      FindField('ALARM3').AsString := aAlarm3;
      FindField('ALARM4').AsString := aAlarm4;
      FindField('ALARM5').AsString := aAlarm5;
      FindField('ALARM6').AsString := aAlarm6;
      FindField('ALARM7').AsString := aAlarm7;
      FindField('ALARM8').AsString := aAlarm8;
      FindField('VALIDDATE').AsString := aValidDate;
      FindField('RCVACK').AsString := aRcvAck;
      FindField('POSITIONNUM').AsString := aPositionNum;
      FindField('CARDTYPE').AsString := aPatrolType;
      FindField('CARDPOSITIONTYPE').AsString := aCardPositionType;
      try
        Post;
      except
        Exit;
      end;
      result := True;
    end else
    begin
      edit;
      FindField('PERMIT').AsString := aPermit;
      FindField('DOOR1').AsString := aDoor1;
      FindField('DOOR2').AsString := aDoor2;
      FindField('DOOR3').AsString := aDoor3;
      FindField('DOOR4').AsString := aDoor4;
      FindField('DOOR5').AsString := aDoor5;
      FindField('DOOR6').AsString := aDoor6;
      FindField('DOOR7').AsString := aDoor7;
      FindField('DOOR8').AsString := aDoor8;
      FindField('ALARM').AsString := aAlarm;
      FindField('ALARM1').AsString := aAlarm1;
      FindField('ALARM2').AsString := aAlarm2;
      FindField('ALARM3').AsString := aAlarm3;
      FindField('ALARM4').AsString := aAlarm4;
      FindField('ALARM5').AsString := aAlarm5;
      FindField('ALARM6').AsString := aAlarm6;
      FindField('ALARM7').AsString := aAlarm7;
      FindField('ALARM8').AsString := aAlarm8;
      FindField('VALIDDATE').AsString := aValidDate;
      FindField('RCVACK').AsString := aRcvAck;
      FindField('POSITIONNUM').AsString := aPositionNum;
      FindField('CARDTYPE').AsString := aPatrolType;
      FindField('CARDPOSITIONTYPE').AsString := aCardPositionType;
      try
        Post;
      except
        Exit;
      end;
      result := True;
    end;
  end;
end;

function TdmDataBase.DeleteTB_CARDPERMITTEMP_All: Boolean;
begin
  result := False;
  with TB_CARDPERMITTEMP do
  begin
    First;
    While Not Eof do
    begin
      Delete;
    end;
  end;
end;

function TdmDataBase.TempToDeviceCardPermitCopy: Boolean;
begin
  with TB_CARDPERMITTEMP do
  begin
    First;
    While Not Eof do
    begin
      InsertIntoTB_CARDPERMIT(FindField('ECUID').AsString,FindField('CARDNO').AsString,FindField('PERMIT').AsString,
           FindField('DOOR1').AsString,FindField('DOOR2').AsString,FindField('DOOR3').AsString,
           FindField('DOOR4').AsString,FindField('DOOR5').AsString,FindField('DOOR6').AsString,
           FindField('DOOR7').AsString,FindField('DOOR8').AsString,FindField('ALARM').AsString,
           FindField('ALARM1').AsString,FindField('ALARM2').AsString,FindField('ALARM3').AsString,
           FindField('ALARM4').AsString,FindField('ALARM5').AsString,FindField('ALARM6').AsString,
           FindField('ALARM7').AsString,FindField('ALARM8').AsString, FindField('VALIDDATE').AsString,
           'N',FindField('POSITIONNUM').AsString,FindField('CARDTYPE').AsString,FindField('CARDPOSITIONTYPE').AsString);
      Next;
    end;
  end;
end;

function TdmDataBase.UpdateTB_CARD_FieldName(aCardNo, aFieldName,
  aData: string): Boolean;
begin
  with TB_CARD do
  begin
    if FindKey([aCardNo]) then
    begin
      Edit;
      FindField(aFieldName).AsString := aData;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
end;

function TdmDataBase.checkTB_CARD_POSITIONNUM(aCardNo,
  aPositionNum: string; var aDupCardNo: string): Boolean;
begin
  result := False;
  with TB_CARD do
  begin
    First;
    While Not Eof do
    begin
      if FindField('POSITIONNUM').AsInteger = strtoint(aPositionNum) then
      begin
        if aCardNo <> FindField('CARDNO').AsString then
        begin
          aDupCardNo := FindField('CARDNO').AsString;
          result := True;
        end;
        Exit;
      end;
      Next;
    end;
  end;
end;

end.
