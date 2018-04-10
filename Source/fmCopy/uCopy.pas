unit uCopy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzRadGrp,StdCtrls, Gauges, RzButton;

type
  TfmCopy = class(TForm)
    Group_811: TRzCheckGroup;
    pan_Caption: TPanel;
    Gauge1: TGauge;
    btn_DeviceCopy: TRzBitBtn;
    btn_Close: TRzBitBtn;
    st_caption: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure Group_811Change(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_DeviceCopyClick(Sender: TObject);
  private
    { Private declarations }
    procedure Ecu_GroupCreate;
    Function  MDIForm(FormName:string):TForm;
  private
    function SystemInfo_Registration(aWatchPowerOff,aInDelay,aOutDelay,aDoorType1,aDoorType2,
             aDoorType3,aDoorType4,aDoorType5,aDoorType6,aDoorType7,aDoorType8,aLocate:string):Boolean;
    function RegistArmDsCheck(aDoorNo,aArmDsCheck:string):Boolean;
    function Relay2Type_Registration(aRelay2Type:integer):Boolean;
    function RegistArmRelay(aArmRelay:string):Boolean;
    function RegistArmAreaUse(aUsed:Boolean):Boolean;
    function RegistDoorArmArea(aDoorArmAreaState:string):Boolean;
    function RegistZoneExtensionUse(aZoneExtensionUseData:string):Boolean;
    function DoorSystemInfo_Registration(aDoorNo,aCardModeType,aDoorModeType,aDoorControlTime,aDoorLongOpenTime,
                            aScheduleUse,aDoorStatusUse,aDoorLongTimeUse,aDoorLockType,aDoorFireOpenUse,aDoorDSOpenState,
                            aRemoteOpen:string):Boolean;
    function DoorDSCheckUse_Registration(aDoorNo,aDsCheckUse:string):Boolean;
    function DoorDSCheckTime_Registration(aDoorNo,aDoorDSCheckTime:string):Boolean; //옵션 시간을 부여함
    function ArmDsCheck_Registration(aDoorNo,aArmDSCheck:string):Boolean;
    function RegistCardType(aCardType:string):Boolean;
    function RegistCardReaderInfo(aReaderNo,aReaderUse,aReaderDoor,aReaderDoorLocate,aReaderBuildingLocate,aReaderArmArea:integer;aLocateName:string):Boolean;
    function RegistPortInfo(aPortNo,aWatchType,aWatchTypeCode,aDelayUse,aRecoverUse,aPortDelayTime,aZoneArmArea,aLocate,aZoneUsed:string):Boolean;
    function RegistZoneExtensionPortInfo(aExtNo,aZoneExtensionSendData:string):Boolean;
    function RegistAlartLampSiren(aAlertLamp,aAlertSiren:string):Boolean;
    function RegistAlertLampTime(aAlertLampTime:string):Boolean;
    function RegistAlertSirenTime(aAlertSirenTime:string):Boolean;
    function CardReaderTelNumberRegist(aNo,aTelNumber:string):Boolean;
  public
    { Public declarations }
    L_stCaption : string;
    L_stDeviceType : string;
    L_bArmAreaSkill : Boolean;
    L_bZoneExtensionSkill : Boolean;
  end;

var
  fmCopy: TfmCopy;

implementation

uses
  uSocket,
  uUtil,
  dllFunction,
  uCommon,
  uCurrentDeviceSetting,
  uCheckValiable;
  
{$R *.dfm}

{ TfmCopy }

procedure TfmCopy.Ecu_GroupCreate;
var
  i : integer;
  nIndex : integer;
begin
  Group_811.Items.Clear;
  for I:= 0 to 63 do
  begin
    Group_811.Items.Add(FillZeroNumber(i,2));
    nIndex := DeviceList.IndexOf(FillZeroNumber(i,2));
    if nIndex > -1 then
    begin
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).Connected then
      begin
        Group_811.ItemChecked[i]:= True;
      end;
    end;
  end;

end;

procedure TfmCopy.FormShow(Sender: TObject);
begin
  Ecu_GroupCreate;
  pan_Caption.Caption := L_stCaption;
end;

procedure TfmCopy.Group_811Change(Sender: TObject; Index: Integer;
  NewState: TCheckBoxState);
var
  nIndex : integer;
begin
  if NewState = cbUnchecked then Exit;
  nIndex := DeviceList.IndexOf(FillZeroNumber(Index,2));
  if nIndex < 0 then
  begin
    Group_811.ItemChecked[Index]:= False;
    showmessage('등록되지 않은 컨트롤러입니다.');
    Exit;
  end;
  if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).Connected then
  begin
    Group_811.ItemChecked[Index]:= False;
    showmessage('해당 컨트롤러는 통신연결 상태가 아닙니다.');
    Exit;
  end;

end;

procedure TfmCopy.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

function TfmCopy.MDIForm(FormName: string): TForm;
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  result := nil;
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        result := Screen.Forms[i];
        Exit;
      end;
    end;
  end;
end;

procedure TfmCopy.btn_DeviceCopyClick(Sender: TObject);
var
  fmDeviceSetting :TForm;
  stDoorControlTime : string;
  stDoorLockType : string;
  stCardModeType : string;
  stDoorModeType : string;
  stDoorLongOpenTime : string;
  stScheduleUse : string;
  stDoorStatusUse : string;
  stDoorLongTimeUse : string;
  stDoorFireOpenUse : string;
  stDoorDSOpenState : string;
  stDoorDSCheckTime : string;
  stRemoteOpen : string;
  stReaderType : string;
  i : integer;
  stReaderUse : string;
  stReaderDoor : string;
  cmb_Box : TComboBox;
  nPortNumber : integer;
  nWatchType : integer;
  nDelay : integer;
  stWatchTypeCode : string;
  mRecoverUse : integer;
  nZoneArmArea:integer;
  nZoneUsed:integer;
  Edit : TEdit;
  stTelNo : string;
  nExtNo : integer;
  nZoneExtensionUse : integer;
  stZoneExtensionSendData : string;
  arrBitFunction : array [0..7] of char;
  stBitfunction : string;
  nIndex : integer;
begin
  Try
    btn_DeviceCopy.Enabled := False;
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');

    if TfmCurrentDeviceSetting(fmDeviceSetting).pg_DeviceSetting.ActivePage = TfmCurrentDeviceSetting(fmDeviceSetting).TabMCSetting then
    begin
      //MCUSetting_Registration;
    end else if TfmCurrentDeviceSetting(fmDeviceSetting).pg_DeviceSetting.ActivePage = TfmCurrentDeviceSetting(fmDeviceSetting).TabArmExtension then
    begin
      //Main 에서만 동작함
    end else if TfmCurrentDeviceSetting(fmDeviceSetting).pg_DeviceSetting.ActivePage = TfmCurrentDeviceSetting(fmDeviceSetting).TabSystemInfo then
    begin
      if SystemInfo_Registration(inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).ComboBox_WatchPowerOff.ItemIndex),
                              inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).SpinEdit_InDelay.IntValue),
                              inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).SpinEdit_OutDelay.IntValue),
                              inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).ComboBox_DoorType1.ItemIndex),
                              inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).ComboBox_DoorType2.ItemIndex),
                              inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).ComboBox_DoorType3.ItemIndex),
                              inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).ComboBox_DoorType4.ItemIndex),
                              inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).ComboBox_DoorType5.ItemIndex),
                              inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).ComboBox_DoorType6.ItemIndex),
                              inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).ComboBox_DoorType7.ItemIndex),
                              inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).ComboBox_DoorType8.ItemIndex),
                              TfmCurrentDeviceSetting(fmDeviceSetting).Edit_Locate.Text ) then
      begin
        if L_stDeviceType <> KTT811 then
        begin
          if Not RegistArmRelay(inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).cmb_ArmRelay.ItemIndex)) then Exit;
        end;
        if L_stDeviceType = KTT812 then Relay2Type_Registration(TfmCurrentDeviceSetting(fmDeviceSetting).cmb_Relay2Type.ItemIndex);
        if L_bArmAreaSkill then
        begin
          RegistArmAreaUse(TfmCurrentDeviceSetting(fmDeviceSetting).chk_DoorArmAreaUse.Checked);
          if TfmCurrentDeviceSetting(fmDeviceSetting).chk_DoorArmAreaUse.Checked then
             RegistDoorArmArea(TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorArmAreaState);
        end;
        if L_bZoneExtensionSkill then RegistZoneExtensionUse(TfmCurrentDeviceSetting(fmDeviceSetting).GetZoneExtensionUseData);
      end;
    
    end else if TfmCurrentDeviceSetting(fmDeviceSetting).pg_DeviceSetting.ActivePage = TfmCurrentDeviceSetting(fmDeviceSetting).tab_DoorLock then
    begin
        if TfmCurrentDeviceSetting(fmDeviceSetting).pgDoorLockSetting.ActivePage = TfmCurrentDeviceSetting(fmDeviceSetting).tabLock_Controler then
        begin
          for i := 1 to 2 do
          begin
            if i <= TfmCurrentDeviceSetting(fmDeviceSetting).GetDeviceMaxDoorNumber then   //최대 갯수 보다 작으면
            begin
              if i = 2 then
              begin
                if L_stDeviceType = KTT812 then   //2번째 출입문이고 KTT812 타입이면 릴레이 체크 하자
                begin
                  if TfmCurrentDeviceSetting(fmDeviceSetting).cmb_Relay2Type.ItemIndex = 0 then Exit; 
                end;
              end;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorControlTime(inttostr(i),stDoorControlTime) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorLockType(inttostr(i),stDoorLockType) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorCardMode(inttostr(i),stCardModeType) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorModeType(inttostr(i),stDoorModeType) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorLongOpenTime(inttostr(i),stDoorLongOpenTime) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorScheduleUse(inttostr(i),stScheduleUse) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorStatusUse(inttostr(i),stDoorStatusUse) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorLongTimeUse(inttostr(i),stDoorLongTimeUse) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorFireOpenUse(inttostr(i),stDoorFireOpenUse) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorDSOpenState(inttostr(i),stDoorDSOpenState) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorRemoteOpen(inttostr(i),stRemoteOpen) then continue;

              DoorSystemInfo_Registration(inttostr(i),stCardModeType,stDoorModeType,stDoorControlTime,stDoorLongOpenTime,
                                          stScheduleUse,stDoorStatusUse,stDoorLongTimeUse,stDoorLockType,stDoorFireOpenUse,
                                          stDoorDSOpenState,stRemoteOpen);
              if L_stDeviceType = KTT812 then
              begin
                if TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorDSCheckTime(inttostr(i),stDoorDSCheckTime) then
                begin
                  if stDoorDSCheckTime = '0' then  //항상검사
                  begin
                    DoorDSCheckUse_Registration(inttostr(i),'0');
                  end else
                  begin
                    DoorDSCheckUse_Registration(inttostr(i),'1');
                    DoorDSCheckTime_Registration(inttostr(i),stDoorDSCheckTime); //옵션 시간을 부여함
                  end;
                end;
                cmb_Box := TravelComboBoxItem(TfmCurrentDeviceSetting(fmDeviceSetting).gb_DoorInfo,'cmb_ArmDSCheck',i);
                if cmb_Box <> nil then
                  ArmDsCheck_Registration(inttostr(i),inttostr(cmb_Box.ItemIndex));
              end;
            end;
          end;
        end else if TfmCurrentDeviceSetting(fmDeviceSetting).pgDoorLockSetting.ActivePage = TfmCurrentDeviceSetting(fmDeviceSetting).tabLockExtention then
        begin
          for i := 3 to FIXMAXDOORNO do
          begin
            if i <= TfmCurrentDeviceSetting(fmDeviceSetting).GetDeviceMaxDoorNumber then
            begin
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorControlTime(inttostr(i),stDoorControlTime) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorLockType(inttostr(i),stDoorLockType) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorCardMode(inttostr(i),stCardModeType) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorModeType(inttostr(i),stDoorModeType) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorLongOpenTime(inttostr(i),stDoorLongOpenTime) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorScheduleUse(inttostr(i),stScheduleUse) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorStatusUse(inttostr(i),stDoorStatusUse) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorLongTimeUse(inttostr(i),stDoorLongTimeUse) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorFireOpenUse(inttostr(i),stDoorFireOpenUse) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorDSOpenState(inttostr(i),stDoorDSOpenState) then continue;
              if Not TfmCurrentDeviceSetting(fmDeviceSetting).GetDoorRemoteOpen(inttostr(i),stRemoteOpen) then continue;
              DoorSystemInfo_Registration(inttostr(i),stCardModeType,stDoorModeType,stDoorControlTime,stDoorLongOpenTime,
                                          stScheduleUse,stDoorStatusUse,stDoorLongTimeUse,stDoorLockType,stDoorFireOpenUse,
                                          stDoorDSOpenState,stRemoteOpen);

              if L_stDeviceType = KTT812 then
              begin
                cmb_Box := TravelComboBoxItem(TfmCurrentDeviceSetting(fmDeviceSetting).gb_DoorExtensionInfo,'cmb_ArmDSCheck',i);
                if cmb_Box <> nil then
                  ArmDsCheck_Registration(inttostr(i),inttostr(cmb_Box.ItemIndex));
              end;
            end;
          end;
        end;


    end else if TfmCurrentDeviceSetting(fmDeviceSetting).pg_DeviceSetting.ActivePage = TfmCurrentDeviceSetting(fmDeviceSetting).tab_CardReader then
    begin
      stReaderType := inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).cb_CardType.ItemIndex) + '0' + TfmCurrentDeviceSetting(fmDeviceSetting).GetReaderNumType;
      RegistCardType(stReaderType);


      for i := 1 to G_nCardReaderNumber do
      begin
          RegistCardReaderInfo(i,
                             TravelComboBoxItem(TfmCurrentDeviceSetting(fmDeviceSetting).gb_CardReader,'cmb_ReaderUse',i).ItemIndex,
                             TravelComboBoxItem(TfmCurrentDeviceSetting(fmDeviceSetting).gb_CardReader,'cmb_ReaderDoor',i).ItemIndex,
                             TravelComboBoxItem(TfmCurrentDeviceSetting(fmDeviceSetting).gb_CardReader,'cmb_ReaderDoorLocate',i).ItemIndex,
                             TravelComboBoxItem(TfmCurrentDeviceSetting(fmDeviceSetting).gb_CardReader,'cmb_ReaderBuildingLocate',i).ItemIndex,
                             TravelComboBoxItem(TfmCurrentDeviceSetting(fmDeviceSetting).gb_CardReader,'cmb_ReaderAlarmArea',i).ItemIndex,
                             '' //위치명
                             );
      end;

    end else if TfmCurrentDeviceSetting(fmDeviceSetting).pg_DeviceSetting.ActivePage = TfmCurrentDeviceSetting(fmDeviceSetting).Tab_Port then
    begin
      if TfmCurrentDeviceSetting(fmDeviceSetting).pg_PortSetting.ActivePage = TfmCurrentDeviceSetting(fmDeviceSetting).tab_LocalPort then
      begin
        nPortNumber := TfmCurrentDeviceSetting(fmDeviceSetting).GetDeviceMaxPortNumber;
        for i:= 1 to nPortNumber do
        begin
          cmb_Box := TravelComboBoxItem(TfmCurrentDeviceSetting(fmDeviceSetting).gb_Port,'cmb_WatchType',i);
          nWatchType := 0;
          if cmb_Box <> nil then nWatchType := cmb_Box.ItemIndex;
          stWatchTypeCode := TfmCurrentDeviceSetting(fmDeviceSetting).GetWatchTypeCode(i,nWatchType);

          nDelay := 0;
          cmb_Box := TravelComboBoxItem(TfmCurrentDeviceSetting(fmDeviceSetting).gb_Port,'cmb_WatchDelay',i);
          if cmb_Box <> nil then
          begin
            nDelay := cmb_Box.ItemIndex;
          end;
          mRecoverUse := 0;
          cmb_Box := TravelComboBoxItem(TfmCurrentDeviceSetting(fmDeviceSetting).gb_Port,'cmb_recorver',i);
          if cmb_Box <> nil then
          begin
            mRecoverUse := cmb_Box.ItemIndex;
          end;
          nZoneArmArea := 0;
          cmb_Box := TravelComboBoxItem(TfmCurrentDeviceSetting(fmDeviceSetting).gb_Port,'cmb_PortAlarmArea',i);
          if cmb_Box <> nil then
          begin
            nZoneArmArea := cmb_Box.ItemIndex;
          end;
          nIndex := DeviceList.IndexOf(FillZeroNumber(i,2));
          if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse then nZoneArmArea := 0;
          nZoneUsed := 0;
          cmb_Box := TravelComboBoxItem(TfmCurrentDeviceSetting(fmDeviceSetting).gb_Port,'cmb_ZonUse',i);
          if cmb_Box <> nil then
          begin
            nZoneUsed := cmb_Box.ItemIndex;
            if nZoneUsed < 0 then nZoneUsed := 0;
          end;

          RegistPortInfo(inttostr(i),
                         inttostr(nWatchType),
                         stWatchTypeCode,
                         inttostr(nDelay), //지연시간 사용유무
                         inttostr(mRecoverUse),
                         '04', //포트감지시간
                         FillZeroNumber(nZoneArmArea,2),
                         '', //위치명
                         inttostr(nZoneUsed)
                         );
        end;
        if TfmCurrentDeviceSetting(fmDeviceSetting).cmb_alartLamp.ItemIndex < 0 then TfmCurrentDeviceSetting(fmDeviceSetting).cmb_alartLamp.ItemIndex := 0;
        if TfmCurrentDeviceSetting(fmDeviceSetting).cmb_alartSiren.ItemIndex < 0 then TfmCurrentDeviceSetting(fmDeviceSetting).cmb_alartSiren.ItemIndex := 0;
        RegistAlartLampSiren(inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).cmb_alartLamp.ItemIndex),inttostr(TfmCurrentDeviceSetting(fmDeviceSetting).cmb_alartSiren.ItemIndex));
        if Not IsDigit(TfmCurrentDeviceSetting(fmDeviceSetting).ed_alertLampTime.Text) then TfmCurrentDeviceSetting(fmDeviceSetting).ed_alertLampTime.Text := '10';
        RegistAlertLampTime(Trim(TfmCurrentDeviceSetting(fmDeviceSetting).ed_alertLampTime.Text));
        if Not IsDigit(TfmCurrentDeviceSetting(fmDeviceSetting).ed_alertSirenTime.Text) then TfmCurrentDeviceSetting(fmDeviceSetting).ed_alertSirenTime.Text := '1';
        RegistAlertSirenTime(Trim(TfmCurrentDeviceSetting(fmDeviceSetting).ed_alertSirenTime.Text));
      end else if TfmCurrentDeviceSetting(fmDeviceSetting).pg_PortSetting.ActivePage = TfmCurrentDeviceSetting(fmDeviceSetting).tab_ExtensionPort then
      begin
        nExtNo := TfmCurrentDeviceSetting(fmDeviceSetting).pg_ExtensionPort.ActivePage.Tag;
        case nExtNo of
          1 : nZoneExtensionUse := TfmCurrentDeviceSetting(fmDeviceSetting).cmb_ZoneExtensionUse1.ItemIndex;
          2 : nZoneExtensionUse := TfmCurrentDeviceSetting(fmDeviceSetting).cmb_ZoneExtensionUse2.ItemIndex;
          3 : nZoneExtensionUse := TfmCurrentDeviceSetting(fmDeviceSetting).cmb_ZoneExtensionUse3.ItemIndex;
          4 : nZoneExtensionUse := TfmCurrentDeviceSetting(fmDeviceSetting).cmb_ZoneExtensionUse4.ItemIndex;
          5 : nZoneExtensionUse := TfmCurrentDeviceSetting(fmDeviceSetting).cmb_ZoneExtensionUse5.ItemIndex;
          6 : nZoneExtensionUse := TfmCurrentDeviceSetting(fmDeviceSetting).cmb_ZoneExtensionUse6.ItemIndex;
          7 : nZoneExtensionUse := TfmCurrentDeviceSetting(fmDeviceSetting).cmb_ZoneExtensionUse7.ItemIndex;
          8 : nZoneExtensionUse := TfmCurrentDeviceSetting(fmDeviceSetting).cmb_ZoneExtensionUse8.ItemIndex;
        end;
        if nZoneExtensionUse < 0 then nZoneExtensionUse := 0;
        stZoneExtensionSendData := inttostr(nZoneExtensionUse);
        for i:= 1 to FIXMAXZONENO do
        begin
          FillChar(arrBitFunction, 8, '0');
          cmb_Box := TfmCurrentDeviceSetting(fmDeviceSetting).GetPortComboBox(nExtNo,i,'cmb_WatchType');
          nWatchType := 0;
          if cmb_Box <> nil then nWatchType := cmb_Box.ItemIndex;

          stWatchTypeCode := TfmCurrentDeviceSetting(fmDeviceSetting).GetWatchTypeCode(i,nWatchType);

          nDelay := 0;
          nZoneArmArea := 1;
          cmb_Box := TfmCurrentDeviceSetting(fmDeviceSetting).GetPortComboBox(nExtNo,i,'cmb_PortAlarmArea');
          if cmb_Box <> nil then
          begin
            nZoneArmArea := cmb_Box.ItemIndex + 1;
          end;
          if nWatchType < 0 then nWatchType := 0;
          if nZoneArmArea < 0 then nZoneArmArea := 0;
          stZoneExtensionSendData := stZoneExtensionSendData + stWatchTypeCode + inttostr(nWatchType) + FillZeroNumber(nZoneArmArea,2);

          cmb_Box := TfmCurrentDeviceSetting(fmDeviceSetting).GetPortComboBox(nExtNo,i,'cmb_recorver');
          if cmb_Box <> nil then
          begin
            if cmb_Box.ItemIndex = 1 then arrBitFunction[5] := '1';
          end;

          stBitfunction := stBitfunction + BinaryToHex(string(arrBitFunction));
        end;
        stZoneExtensionSendData := stZoneExtensionSendData + stBitfunction;
        RegistZoneExtensionPortInfo(inttostr(nExtNo),stZoneExtensionSendData);
      end;

    end else if TfmCurrentDeviceSetting(fmDeviceSetting).pg_DeviceSetting.ActivePage = TfmCurrentDeviceSetting(fmDeviceSetting).Tab_CardReaderTel then
    begin
      for i := 0 to 9 do
      begin
        stTelNo := '';
        Edit := TravelEditItem(TfmCurrentDeviceSetting(fmDeviceSetting).gb_cardReaderTel,'ed_cardreaderTel',i);
        if Edit <> nil then
        begin
          stTelNo := Edit.Text;
        end;
        if Not CardReaderTelNumberRegist(inttostr(i),stTelNo) then break;
      end;
    end;
  Finally
    btn_DeviceCopy.Enabled := True;
  End;
end;

function TfmCopy.SystemInfo_Registration(aWatchPowerOff,aInDelay,aOutDelay,aDoorType1,aDoorType2,
    aDoorType3,aDoorType4,aDoorType5,aDoorType6,aDoorType7,aDoorType8,aLocate:string):Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
begin
  result := False;
  st_caption.Caption := '시스템 정보 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      for j := 0 to G_nLoopCount do
      begin
        if G_bApplicationTerminate then Exit;
        bResult := dmSocket.RegistSystemInfo(FillZeroNumber(i,2),
                           aWatchPowerOff,
                           aInDelay,
                           aOutDelay,
                           aDoorType1,
                           aDoorType2,
                           aDoorType3,
                           aDoorType4,
                           aDoorType5,
                           aDoorType6,
                           aDoorType7,
                           aDoorType8,
                           aLocate);
        if bResult then Break;
      end;
      if Not bResult then
      begin
        if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.RegistArmDsCheck(aDoorNo, aArmDsCheck: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
begin
  result := False;
  st_caption.Caption := '경계시 문열림 검사 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      if G_stDeviceType[i] = KTT812 then
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          bResult := dmSocket.RegistArmDsCheck(FillZeroNumber(i,2),
                               FillZeroNumber(strtoint(aDoorNo),2),
                               aArmDsCheck);
          if bResult then Break;
        end;
        if Not bResult then
        begin
          if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
        end;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.RegistArmRelay(aArmRelay: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
begin
  result := False;
  st_caption.Caption := '경해 Relay 동작 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      if G_stDeviceType[i] <> KTT811 then
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          bResult := dmSocket.RegistArmRelay(FillZeroNumber(i,2),aArmRelay);
          if bResult then Break;
        end;
        if Not bResult then
        begin
          if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
        end;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.DoorSystemInfo_Registration(aDoorNo, aCardModeType,
  aDoorModeType, aDoorControlTime, aDoorLongOpenTime, aScheduleUse,
  aDoorStatusUse, aDoorLongTimeUse, aDoorLockType, aDoorFireOpenUse,
  aDoorDSOpenState, aRemoteOpen: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
begin
  result := False;
  st_caption.Caption := aDoorNo + '번 출입문 설정정보 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      if G_stDeviceType[i] <> ICU200 then
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          bResult := dmSocket.RegistDoorSystemInfo(FillZeroNumber(i,2),                             // 기기번호
              aDoorNo,                               // 문번호
              aCardModeType,                        // 카드 운영모드 (0:Positive, 1:Negative)
              aDoorModeType,                        // 출입문 운영모드 (0:운영, 1:개방)
              aDoorControlTime,                     // Door 제어시간
              aDoorLongOpenTime,                    // 장시간 열림 경보
              aScheduleUse,                         // 스케줄 적용 여부 (0:사용안함, 1:사용)
              aDoorStatusUse,                       // 출입문 상태 전송(0:사용안함, 1:사용)
              aDoorLongTimeUse,                     // 장시간 열림 부저 출력(0:사용안함, 1:사용)
              aDoorLockType,                        // 전기정 타입
              aDoorFireOpenUse,                     // 화재 발생시 문제어
              aDoorDSOpenState,                     //출입문열림상태 (DS OPEN 0x30,DS CLOSE 0x31)
              aRemoteOpen);
          if bResult then Break;
        end;
        if Not bResult then
        begin
          if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
        end;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.RegistCardType(aCardType: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
begin
  result := False;
  st_caption.Caption := '카드리더 타입 설정정보 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      if (G_stDeviceType[i] <> ICU200) and (G_stDeviceType[i] <> ICU100) then
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          bResult := dmSocket.RegistCardType(FillZeroNumber(i,2),aCardType);
          if bResult then Break;
        end;
        if Not bResult then
        begin
          if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
        end;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.RegistCardReaderInfo(aReaderNo, aReaderUse, aReaderDoor,
  aReaderDoorLocate, aReaderBuildingLocate,aReaderArmArea: integer;
  aLocateName: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
begin
  result := False;
  st_caption.Caption := inttostr(aReaderNo) + '번 카드리더 설정정보 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      if (G_stDeviceType[i] <> ICU200) and (G_stDeviceType[i] <> ICU100) then
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          bResult := dmSocket.RegistCardReaderInfo(FillZeroNumber(i,2),aReaderNo,
                  aReaderUse, aReaderDoor, aReaderDoorLocate,
                  aReaderBuildingLocate,aReaderArmArea,aLocateName);
          if bResult then Break;
        end;
        if Not bResult then
        begin
          if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
        end;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.RegistPortInfo(aPortNo, aWatchType, aWatchTypeCode,
  aDelayUse, aRecoverUse, aPortDelayTime,aZoneArmArea, aLocate,aZoneUsed: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
begin
  result := False;
  st_caption.Caption := aPortNo + '번 포트 설정정보 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      for j := 0 to G_nLoopCount do
      begin
        if G_bApplicationTerminate then Exit;
        bResult := dmSocket.RegistPortInfo(FillZeroNumber(i,2), aPortNo, aWatchType,
                      aDelayUse, aRecoverUse, aPortDelayTime, aWatchTypeCode,aZoneArmArea,
                      aLocate,aZoneUsed);
        if bResult then Break;
      end;
      if Not bResult then
      begin
        if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.RegistAlartLampSiren(aAlertLamp,
  aAlertSiren: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
begin
  result := False;
  st_caption.Caption := '비상존 이상발생 설정정보 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      for j := 0 to G_nLoopCount do
      begin
        if G_bApplicationTerminate then Exit;
        bResult := dmSocket.RegistAlartLampSiren(FillZeroNumber(i,2), aAlertLamp,aAlertSiren);
        if bResult then Break;
      end;
      if Not bResult then
      begin
        if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.RegistAlertLampTime(aAlertLampTime: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
begin
  result := False;
  st_caption.Caption := '램프 동작 설정정보 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      for j := 0 to G_nLoopCount do
      begin
        if G_bApplicationTerminate then Exit;
        bResult := dmSocket.RegistAlertLampTime(FillZeroNumber(i,2),aAlertLampTime);
        if bResult then Break;
      end;
      if Not bResult then
      begin
        if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.RegistAlertSirenTime(aAlertSirenTime: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
begin
  result := False;
  st_caption.Caption := '사이렌 동작 설정정보 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      for j := 0 to G_nLoopCount do
      begin
        if G_bApplicationTerminate then Exit;
        bResult := dmSocket.RegistAlertSirenTime(FillZeroNumber(i,2),aAlertSirenTime);
        if bResult then Break;
      end;
      if Not bResult then
      begin
        if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.CardReaderTelNumberRegist(aNo,
  aTelNumber: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
begin
  result := False;
  st_caption.Caption := aNo + '번 전화번호 설정정보 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      if (G_stDeviceType[i] = KTT811) then
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          bResult := dmSocket.CardReaderTelNumberRegist(FillZeroNumber(i,2),aNo,aTelNumber);
          if bResult then Break;
        end;
        if Not bResult then
        begin
          if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
        end;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.Relay2Type_Registration(aRelay2Type: integer): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
  stRegistData : string;
begin
  stRegistData := FillZeroNumber(0,9);
  if aRelay2Type < 0 then aRelay2Type := 0;
  stRegistData[3] := inttostr(aRelay2Type)[1];
  result := False;
  st_caption.Caption := 'Door2사용구분 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      if G_stDeviceType[i] = KTT812 then
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          bResult := dmSocket.RegistRelay2Type(FillZeroNumber(i,2),stRegistData);
          if bResult then Break;
        end;
        if Not bResult then
        begin
          if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
        end;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.RegistArmAreaUse(aUsed: Boolean): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
  nIndex : integer;
  stArmAreaUse : string;
begin
  if aUsed then stArmAreaUse := '1'
  else stArmAreaUse := '0';
  result := False;
  st_caption.Caption := '방범구역 설정 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      stEcuID := FillZeroNumber(i,2);
      nIndex := DeviceList.IndexOf(stEcuID);
      if nIndex < 0 then continue;

      if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill then
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          bResult := dmSocket.RegistArmAreaUse(stEcuID,stArmAreaUse);
          if bResult then Break;
        end;
        if Not bResult then
        begin
          if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
        end;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.RegistDoorArmArea(aDoorArmAreaState: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
  nIndex : integer;
begin
  result := False;
  st_caption.Caption := '방범구역 설정 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      stEcuID := FillZeroNumber(i,2);
      nIndex := DeviceList.IndexOf(stEcuID);
      if nIndex < 0 then continue;

      if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill then
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          bResult := dmSocket.RegistDoorArmArea(stEcuID,aDoorArmAreaState);
          if bResult then Break;
        end;
        if Not bResult then
        begin
          if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
        end;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.RegistZoneExtensionUse(
  aZoneExtensionUseData: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
  nIndex : integer;
begin
  result := False;
  st_caption.Caption := '존확장기사용유무 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      stEcuID := FillZeroNumber(i,2);
      nIndex := DeviceList.IndexOf(stEcuID);
      if nIndex < 0 then continue;

      if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          bResult := dmSocket.RegistZoneExtensionUse(stEcuID,aZoneExtensionUseData);
          if bResult then Break;
        end;
        if Not bResult then
        begin
          if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
        end;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.ArmDsCheck_Registration(aDoorNo,
  aArmDSCheck: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
  nIndex : integer;
begin
  result := False;
  st_caption.Caption := aDoorNo + '번 출입문 경계시 문열림 검사 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      stEcuID := FillZeroNumber(i,2);
      nIndex := DeviceList.IndexOf(stEcuID);
      if nIndex < 0 then continue;

      if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          bResult := dmSocket.RegistArmDsCheck(stEcuID,
                       FillZeroNumber(strtoint(aDoorNo),2),
                       aArmDsCheck);
          if bResult then Break;
        end;
        if Not bResult then
        begin
          if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
        end;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.DoorDSCheckTime_Registration(aDoorNo,
  aDoorDSCheckTime: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
  nIndex : integer;
begin
  result := False;
  st_caption.Caption := aDoorNo + '번 출입문 DS검사 시간 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      stEcuID := FillZeroNumber(i,2);
      nIndex := DeviceList.IndexOf(stEcuID);
      if nIndex < 0 then continue;

      if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          bResult := dmSocket.RegistDoorDSCheckTime(stEcuID,aDoorNo,aDoorDSCheckTime);
          if bResult then Break;
        end;
        if Not bResult then
        begin
          if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
        end;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.DoorDSCheckUse_Registration(aDoorNo,
  aDsCheckUse: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
  nIndex : integer;
begin
  result := False;
  st_caption.Caption := aDoorNo + '번 출입문 DS검사 사용유무 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      stEcuID := FillZeroNumber(i,2);
      nIndex := DeviceList.IndexOf(stEcuID);
      if nIndex < 0 then continue;

      if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          bResult := dmSocket.RegistDoorDSCheckUse(stEcuID,aDoorNo,aDsCheckUse);
          if bResult then Break;
        end;
        if Not bResult then
        begin
          if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
        end;
      end;
    End;
  end;
  result := True;
end;

function TfmCopy.RegistZoneExtensionPortInfo(aExtNo,
  aZoneExtensionSendData: string): Boolean;
var
  i,j : integer;
  stEcuID : string;
  bResult : Boolean;
  nIndex : integer;
begin
  result := False;
  st_caption.Caption := aExtNo + '번 존확장기 등록중';
  Gauge1.MaxValue := Group_811.Items.Count - 1;
  for i := 0 to Group_811.Items.Count - 1 do
  begin
    Gauge1.Progress := i;
    if Group_811.ItemChecked[i] then
    begin
      stEcuID := FillZeroNumber(i,2);
      nIndex := DeviceList.IndexOf(stEcuID);
      if nIndex < 0 then continue;

      if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          bResult := dmSocket.RegistZoneExtensionPortInfo(stEcuID, aExtNo, aZoneExtensionSendData);
          if bResult then Break;
        end;
        if Not bResult then
        begin
          if Application.MessageBox(Pchar(FillZeroNumber(i,2) + '번 컨트롤러의 등록이 실패 하였습니다. 계속 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
        end;
      end;
    End;
  end;
  result := True;
end;

end.
