unit uMain;

interface

uses
  ShareMem,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, RzPanel, RzButton, ExtCtrls, ComCtrls, ToolWin,
  StdCtrls, AdPort, AdWnPort, OoMisc, AdStatLt, ActnList,iniFiles, RzStatus,
  AdSocket, uSubForm, CommandArray, IPEdit, ScktComp,systeminfos, Buttons,
  DB, Compile;

type
  TfmMain = class(TfmASubForm)
    MainMenu1: TMainMenu;
    mn_program: TMenuItem;
    N21: TMenuItem;
    mn_Exit: TMenuItem;
    Menu_ImageList: TImageList;
    Image1: TImage;
    ToolBar1: TToolBar;
    btnDeviceConnect: TToolButton;
    btnDeviceDisConnect: TToolButton;
    btnDeviceSetting: TToolButton;
    BtnDeviceAdmin: TToolButton;
    btn_CurrentState: TToolButton;
    mn_Connect: TMenuItem;
    mn_DisConnect: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ActionList1: TActionList;
    Action_DeviceConnect: TAction;
    Action_DeviceDisConnect: TAction;
    N1: TMenuItem;
    mn_PWChange: TMenuItem;
    RzStatusBar1: TRzStatusBar;
    FieldStatus_ComStatus: TRzFieldStatus;
    RzFieldStatus2: TRzFieldStatus;
    Label2: TLabel;
    Label7: TLabel;
    StatusLight_TX: TApdStatusLight;
    StatusLight_RX: TApdStatusLight;
    Status_CardEvent: TRzFieldStatus;
    mn_Setting: TMenuItem;
    Action_DeviceSetting: TAction;
    N2: TMenuItem;
    ReconnectSocketTimer: TTimer;
    Splitter1: TSplitter;
    ApdSLController: TApdSLController;
    N3: TMenuItem;
    N4: TMenuItem;
    NodeConnectTimer: TTimer;
    mn_LanModule: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    mn_Schedule: TMenuItem;
    Action_CardReg: TAction;
    Action_ScheduleReg: TAction;
    CardDownloadTimer: TTimer;
    mn_Holiday: TMenuItem;
    btn_Holiday: TToolButton;
    Action_Holiday: TAction;
    ToolButton3: TToolButton;
    N11: TMenuItem;
    N12: TMenuItem;
    tb_DeviceFileSave: TToolButton;
    Action_DeviceFileSave: TAction;
    SaveDialog1: TSaveDialog;
    tb_DeviceFileLoad: TToolButton;
    Action_DeviceFileLoad: TAction;
    OpenDialog1: TOpenDialog;
    N14: TMenuItem;
    N15: TMenuItem;
    mn_State: TMenuItem;
    N18: TMenuItem;
    mn_CardEvent: TMenuItem;
    ActionDeviceTimer: TTimer;
    MessageTimer: TTimer;
    mn_DeviceInfo: TMenuItem;
    mn_deviceVer: TMenuItem;
    mn_Monitoring: TMenuItem;
    mn_CardManager: TMenuItem;
    N17: TMenuItem;
    mn_FirmWareUpdate: TMenuItem;
    N20: TMenuItem;
    mn_LinkusSateMonitoring: TMenuItem;
    mn_cdmaMonitoring: TMenuItem;
    mn_dvrMonitoring: TMenuItem;
    mn_cardVer: TMenuItem;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    ClientSocket1: TClientSocket;
    StateCheckTimer: TTimer;
    mn_Control: TMenuItem;
    mn_AllDisArm: TMenuItem;
    mn_AllFireRecovery: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N13: TMenuItem;
    SearchTimer: TTimer;
    MCUStateCheckTimer: TTimer;
    mn_javaraSchedule: TMenuItem;
    tb_NetworkCheck: TToolButton;
    ToolButton4: TToolButton;
    Compile1: TCompile;
    mn_ExtentionVer: TMenuItem;
    N6: TMenuItem;
    mn_DeviceFormat: TMenuItem;
    KTT8111: TMenuItem;
    KTT811G1: TMenuItem;
    ICU1001: TMenuItem;
    ICU2001: TMenuItem;
    mn_GCU300Firmware: TMenuItem;
    mn_ICU300Firmware: TMenuItem;
    procedure mn_ExitClick(Sender: TObject);
    procedure Action_DeviceConnectExecute(Sender: TObject);
    procedure mn_PWChangeClick(Sender: TObject);
    procedure Action_DeviceDisConnectExecute(Sender: TObject);
    procedure Action_DeviceSettingExecute(Sender: TObject);
    procedure ReconnectSocketTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CommandArrayCommandsTDEVICESETTINGExecute(Command: TCommand;
      Params: TStringList);
    procedure N4Click(Sender: TObject);
    procedure NodeConnectTimerTimer(Sender: TObject);
    procedure mn_LanModuleClick(Sender: TObject);
    procedure CommandArrayCommandsTCARDEVENTVIEWExecute(Command: TCommand;
      Params: TStringList);
    procedure Action_CardRegExecute(Sender: TObject);
    procedure CardDownloadTimerTimer(Sender: TObject);
    procedure Action_ScheduleRegExecute(Sender: TObject);
    procedure Action_HolidayExecute(Sender: TObject);
    procedure CommandArrayCommandsTSCHEDULEVIEWExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTHolidayViewExecute(Command: TCommand;
      Params: TStringList);
    procedure mn_WatchCodeClick(Sender: TObject);
    procedure Action_DeviceFileSaveExecute(Sender: TObject);
    procedure Action_DeviceFileLoadExecute(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure mn_StateClick(Sender: TObject);
    procedure CommandArrayCommandsTCURRENTSTATEExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTSettingChangeExecute(Command: TCommand;
      Params: TStringList);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CommandArrayCommandsTCardRegViewExecute(Command: TCommand;
      Params: TStringList);
    procedure mn_CardEventClick(Sender: TObject);
    procedure ActionDeviceTimerTimer(Sender: TObject);
    procedure MessageTimerTimer(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure mn_FirmWareUpdateClick(Sender: TObject);
    procedure mn_LinkusSateMonitoringClick(Sender: TObject);
    procedure mn_cdmaMonitoringClick(Sender: TObject);
    procedure mn_dvrMonitoringClick(Sender: TObject);
    procedure mn_deviceVerClick(Sender: TObject);
    procedure mn_cardVerClick(Sender: TObject);
    procedure StateCheckTimerTimer(Sender: TObject);
    procedure mn_AllDisArmClick(Sender: TObject);
    procedure mn_AllFireRecoveryClick(Sender: TObject);
    procedure CommandArrayCommandsTACCESSEVENTExecute(Command: TCommand;
      Params: TStringList);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure CommandArrayCommandsTALARMEVENTExecute(Command: TCommand;
      Params: TStringList);
    procedure SearchTimerTimer(Sender: TObject);
    procedure MCUStateCheckTimerTimer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure mn_javaraScheduleClick(Sender: TObject);
    procedure CommandArrayCommandsTJAVARASCHEDULEExecute(Command: TCommand;
      Params: TStringList);
    procedure tb_NetworkCheckClick(Sender: TObject);
    procedure CommandArrayCommandsTSOCKETExecute(Command: TCommand;
      Params: TStringList);
    procedure mn_ExtentionVerClick(Sender: TObject);
    procedure KTT8111Click(Sender: TObject);
    procedure mn_ICU300FirmwareClick(Sender: TObject);
    procedure CommandArrayCommandsTNetworkCheckExecute(Command: TCommand;
      Params: TStringList);
  private
    FDeviceSettingView: Boolean;
    FOnCardEventView: Boolean;
    FOnScheduleView: Boolean;
    FOnHolidayView: Boolean;
    FOnCurrentStateView: Boolean;
    FOnCardRegView: Boolean;
    L_bProgramClose : Boolean;
    FOnAccessEventView: Boolean;
    FOnAlarmEventView: Boolean;
    FOnJavaraScheduleView: Boolean;
    FDeviceID: string;
    FNetworkCheckView: Boolean;
    Function  MDIForm(FormName:string):TForm;
    Procedure MDIChildShow(FormName:String);
    procedure SetDeviceSettingView(const Value: Boolean);
    procedure SocketCreate;
    procedure LoadZoneStatus;
    procedure LoadDeviceTypeName;
    procedure ZoneStatusmemoryInitialize;
    procedure ZoneStatusMemoryToTable;
  private
    L_stPw : string;
    L_bConnectCheck : Boolean; //최초 연결 시 ID를 체크 해 본다.
    L_bStopConnection : Boolean;

    L_bDirectSearch : Boolean;
    L_bWiznetZeronType : Boolean;
    L_bDirectClientConnect : Boolean;
    L_stWiznetData : string;
    L_nOrgWiznetServerMode : integer;
    L_nDeviceServerMode : integer;
    L_nDeviceFormtView : integer;
    L_nConnectRetryCount : integer;
    L_stDeviceRomVer : string;

    FSocketConnected: Boolean;
    { Private declarations }
    procedure iniConfigSetting;
    function DeviceConnectStart(aDirect:boolean):Boolean;
    procedure SetSocketConnected(const Value: Boolean);
    procedure MenuEnable(aValue:Boolean);
    procedure DeviceListAdd(aEcuID:string);
    procedure DeviceListDelete(aEcuID:string);
    procedure DeviceListStateClear;
    procedure DeviceTypeInitialize;
    Function ClientModeSetting(aDeviceIP:string;aServerMode:integer;aFinish:Boolean=False):Boolean;
    Function WiznetModuleSearch(aDeviceIP:string;aPort:integer):Boolean;
    Function WiznetModuleSetting(aDeviceIP,aWiznetData:string;aServerMode,aPort:integer):Boolean;
  private
    procedure PanelMessage(Sender: TObject;  aMessage:string);
    procedure NodeConnect(Sender: TObject; aConnected:Boolean);
    procedure ConnectError(Sender: TObject; aConnected:Boolean);

    procedure ECUConnect(Sender: TObject; aEcuID:string; aConnected:Boolean);
    procedure PacketView(Sender: TObject;  aPacket,aType:string);
    procedure ServerModeConnect(Sender:TObject);
    procedure CurrentDeviceChange(Sender:TObject;aEcuID,aNo:string;aChange:Boolean);
    procedure CurrentDeviceConnected(Sender:TObject;aEcuID,aNo:string;aConnected:Boolean);
    procedure CurrentDeviceAlarmModeChange(Sender:TObject;aEcuID,aNo:string;aChange:Boolean);
    procedure CurrentDeviceDoorTypeChange(Sender:TObject;aEcuID,aNo:string;aUse:Boolean);
    procedure CurrentDeviceDoorStateChange(Sender:TObject;aEcuID,aNo:string;aChange:Boolean);
    procedure CurrentDeviceReaderUseChange(Sender:TObject;aEcuID,aNo:string;aUse:Boolean);
    procedure CurrentDeviceReaderConnectChange(Sender:TObject;aEcuID,aNo:string;aConnected:Boolean);
    procedure CurrentDeviceCodeChange(Sender:TObject;aEcuID,aDeviceCode:string;aChange:Boolean);
    procedure CurrentDeviceTypeChange(Sender:TObject;aEcuID,aDeviceType:string;aChange:Boolean);
    procedure CurrentCDMAUseChange(Sender:TObject;aEcuID,aNo:string;aUsed:Boolean);
    procedure CurrentDVRUseChange(Sender:TObject;aEcuID,aNo:string;aUsed:Boolean);
    procedure CurrentScheduleUseChange(Sender:TObject;aEcuID,aNo:string;aUsed:Boolean);
    procedure CurrentCARDREADERTELUseChange(Sender:TObject;aEcuID,aNo:string;aChange:Boolean);
    procedure CurrentCardTypeChange(Sender:TObject;aEcuID,aCardType:string;aChange:Boolean);
    procedure ArmExtensionChange(Sender:TObject;aEcuID,aValue:string;aChange:Boolean);
    procedure MaxECUCountChange(Sender:TObject;aEcuID,aValue:string;aChange:Boolean);
    procedure DoorDSCheckTimeUseChange(Sender:TObject;aEcuID,aTemp:string;aValue:Boolean);
    procedure DoorArmDSCheckUseChange(Sender:TObject;aEcuID,aTemp:string;aValue:Boolean);
    procedure DoorLockExtensionUseChange(Sender:TObject;aEcuID,aTemp:string;aValue:Boolean);
    procedure ArmAreaSkillChange(Sender:TObject;aEcuID,aTemp:string;aValue:Boolean);
    procedure ArmAreaUseChange(Sender:TObject;aEcuID,aTemp:string;aValue:Boolean);
    procedure ZoneExtensionSkillChange(Sender:TObject;aEcuID,aTemp:string;aValue:Boolean);
    procedure DoorPossibilityChange(Sender:TObject;aEcuID,aDoorNO:string;aValue:Boolean);
    procedure PortZoneUseSkillChange(Sender:TObject;aEcuID,aTemp:string;aValue:Boolean);
    procedure ZoneExtensionConnectChange(Sender:TObject;aEcuID,aNo:string;aConnected:Boolean);
    procedure PortZoneUseRemoteControlSkill(Sender:TObject;aEcuID,aTemp:string;aValue:Boolean);
    procedure PoliceDeviceTypeChange(Sender:TObject;aEcuID,aTemp:string;aValue:Boolean);
    procedure JavaraScheduleSkillChange(Sender:TObject;aEcuID,aNo:string;aValue:Boolean);

  private
    //수신 이벤트 처리
    //알람이벤트
    procedure AlarmEvent(Sender: TObject;  aECUID,aCmd,aTime,aSubCLass,aSubAddr,aZone,
                          aMode,aStatus,aLoop,aState,aOper:string);
    procedure RcvFireRecovery(Sender: TObject;  aECUID,aCmd,aData:string);
    //등록이벤트
    procedure DeviceIDData(Sender: TObject;  aECUID,aDeviceID:string);
    procedure CardReaderSetData(Sender: TObject;  aECUID,aReaderNo,aUsedCR,
                       aCRPosition,aDoorNo,aReaderArmArea,aLocate,aBuildingPosi:string);
    procedure SystemSetData(Sender: TObject;  aECUID,aPowerWatch,aOutDelay,
                       aDoor1Type,aDoor2Type,aLocate,aInDelay,aLockExtend:string);
    procedure LampSirenOnOff(Sender: TObject;  aECUID,stLampOnOff,aSirenOnOff:string);
    procedure LampTimeSetData(Sender: TObject;  aECUID,aLampTime:string);
    procedure SirenTimeSetData(Sender: TObject;  aECUID,aSirenTime:string);
    procedure PortSettingData(Sender: TObject;  aECUID,aPort,aWatchType,aAlarmType,
                          aRecoverType,aDelayTimeType,aPortLocate,aDetectTime,aZoneArmArea,aZoneUsed:string);
    procedure DeviceUsedSettingData(Sender: TObject;  aECUID,aDeviceUsed:string);
    procedure WiznetInfoSettingData(Sender: TObject;  aECUID,aHeader,aMacAddress,aMode,
                          aIPAddress,aSubnet,aGateway,aClientPort,aServerIP,aServerPort,
                          aSerial_Baud,aSerial_data,aSerial_Parity,aSerial_stop,
                          aSerial_flow,aDelimiterChar,aDelimiterSize,aDelimitertime,
                          aDelimiterIdle,aDebugMode,aROMVer,aOnDHCP,aReserve:string);
    procedure CardReaderTypeSettingData(Sender: TObject;  aECUID,aCardReaderType:string);
    procedure CardReaderSoundSetting(Sender: TObject;  aECUID,aData:string);
    procedure CardReaderExitSoundSetting(Sender: TObject;  aECUID,aData:string);
    procedure DeviceStateData(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure CDMASetting(Sender:TObject; aEcuID,aData:string);
    procedure CDMAInfoSetting(Sender:TObject; aEcuID,aData:string);
    procedure CCCTimeInterval(Sender:TObject; aEcuID,aData:string);
    procedure CCCStartTime(Sender:TObject; aEcuID,aData:string);
    procedure KTTSystemIDData(Sender:TObject; aEcuID,aData:string);
    procedure KTTTelNumberData(Sender:TObject; aEcuID,aNo,aTelNum:string);
    procedure KTTRingCountData(Sender:TObject; aEcuID,aArmRingCount,aDisArmRingCount:string);
    procedure ArmDsCheckData(Sender:TObject; aEcuID,aDoorNo,aArmCheck:string);
    procedure RecvDoorDSCheckUse(Sender:TObject; aEcuID,aDoorNo,aDSCheckUse:string);
    procedure RecvDoorDSCheckTime(Sender:TObject; aEcuID,aDoorNo,aDSCheckTimeSec:string);
    procedure ArmRelayCheckData(Sender:TObject; aEcuID,aNo,aArmRelay:string);
    procedure ArmAreaUseData(Sender:TObject; aEcuID,aNo,aArmUse:string);
    procedure DoorArmAreaData(Sender:TObject; aEcuID,aNo,aDoorArmData:string);

    procedure DVRUseSetting(Sender:TObject; aEcuID,aData:string);
    procedure DVRInfoSetting(Sender:TObject; aEcuID,aData:string);
    procedure CARDREADERTelNumberData(Sender:TObject; aEcuID,aNo,aTelNum:string);
    procedure CARDREADERCallTimData(Sender:TObject; aEcuID,aCallTime,aTemp:string);
    procedure Relay2TypeCheckData(Sender:TObject; aEcuID,aCmd,aRelay2Type:string);
    procedure RecvMainToLocalArm(Sender: TObject;  aECUID,aData:string);
    procedure RecvMainFromLocalArm(Sender: TObject;  aECUID,aData:string);
    procedure RcvZoneExtensionPortInfoData(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure RcvZoneExtensionUseData(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure RcvMemoryClearControl(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure RcvJaejungDelayUse(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure RcvJavaraSchedule(Sender: TObject;  aECUID,aDoorNo,aData:string);
    procedure RcvJavaraArmClose(Sender: TObject;  aECUID,aDoorNo,aData:string);
    procedure RcvJavaraAutoClose(Sender: TObject;  aECUID,aDoorNo,aData:string);
    procedure RcvJavaraStopTime(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure RcvPrimaryKTTType(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure RcvKTTMuxID(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure RcvDDNSQueryServer(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure RcvDDNSServer(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure RcvEventServer(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure RcvTCPServerPort(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure RcvServerCardNF(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure RcvPoliceTelNum(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure RcvDoorTimeCodeUse(Sender: TObject;  aECUID,aVer,aData:string);
    procedure RcvTimeCode(Sender: TObject;  aECUID,aGroup,aData:string);

    //원격제어 데이터
    procedure DeviceTimeData(Sender: TObject;  aECUID,aTime:string);
    procedure DeviceTypeData(Sender: TObject;  aECUID,aDeviceType:string);
    procedure DeviceCodeData(Sender: TObject;  aECUID,aDeviceCode:string);
    procedure SystemFunctionData(Sender: TObject;  aECUID:string;
                          aJavaraCloseCommand,aJavaraOpenCommand,aFireServerCommand:Boolean);
    procedure DeviceVersionData(Sender: TObject;  aECUID,aDeviceVersion:string);
    procedure CardReaderVersionData(Sender: TObject;  aECUID,aCardReaderNo,aCardReaderVersion:string);
    procedure DeviceResetData(Sender: TObject;  aECUID:string);
    procedure CardListSearchData(Sender: TObject;  aECUID,aData:string);
    procedure CardRegCardCNT(Sender: TObject;  aECUID,aData:string);
    procedure EcuStateData(Sender: TObject;  aECUID,aData:string);
    procedure CardReaderStateData(Sender: TObject;  aECUID,aData:string);
    procedure ZoneExtentionNetworkStateData(Sender: TObject;  aECUID,aData:string);
    procedure RecvLineShortCheck(Sender: TObject;  aECUID,aData:string);
    procedure RecvCardAllClear(Sender: TObject;  aECUID,aData:string);
    procedure RecvZoneUseRemoteControl(Sender: TObject;  aECUID,aData:string);
    procedure ZoneExtentionVersionData(Sender: TObject;  aECUID,aZoneExtNo,aVersion:string);
    procedure RecvMaxCardCount(Sender: TObject;  aECUID,aData:string);
    procedure RecvLineCheckStart(Sender: TObject;  aECUID,aData:string);
    procedure RecvLineCheckTime(Sender: TObject;  aECUID,aData:string);
    procedure RecvGCU300_ICU300FirmwareDownloadState(Sender: TObject;  aECUID,aData:string);
    //출입통제이벤트
    procedure CardAccessEvent(Sender: TObject;  aECUID,aDoorNo,aReaderNo,aInOut,aTime,
                          aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState,
                          aATButton,stCardNo:string);
    procedure RcvExitButtonEvent(Sender: TObject;  aECUID,aDoorNo,aReaderNo,aInOut,aTime,
                          aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState,
                          aATButton,stCardNo:string);

    procedure DoorEvent(Sender: TObject;  aECUID,aDoorNo,aReaderNo,aInOut,aTime,
                          aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState:string);

    procedure DoorSettingEvent(Sender: TObject;  aECUID,aDoorNo,aCardMode,aDoorMode,
                          aDoorControlTime,aLongDoorOpenTime,aSchedule,aDoorState,
                          aNetFailRun,aAntiPass,aLongDoorOpenUse,aNetFailAlarm,
                          aDoorLockType,aFireDoorControl,aLockState,aDoorOpenState,
                          aRemoteDoorOpen:string);
    procedure DoorState(Sender: TObject;  aECUID,aDoorNo,aCardMode,aDoorMode,aDoorState,aDoorSchedule:string);
    procedure CardRegist(Sender: TObject;  aECUID,aDoorNo,aCmd,aCardType,
                          aCardNo,aExpireDate,aRegResult,aCardAuth,aTimeMode,
                          aCardIDNo,aAlarmAreaGrade,aDoorAreaGrade:string);
    procedure ScheduleData(Sender: TObject;  aECUID,aDoorNo,aCmd,aDayOfWeek,a1ModeTime,a1Mode,
                          a2ModeTime,a2Mode,a3ModeTime,a3Mode,a4ModeTime,a4Mode,
                          a5ModeTime,a5Mode:string);
    procedure HolidayData(Sender: TObject;  aECUID,aDoorNo,aMonth,aDate:string);
    //펌웨어 업데이트
    procedure GageMonitor(Sender: TObject;  aECUID,aNo,aData:string);
    procedure FirmwareProcess(Sender: TObject;  aECUID,aNo,aData:string);
    procedure FirmwareProcess2(Sender: TObject;  aECUID,aNo,aData:string);
    procedure ICU300FirmWareProcess(Sender: TObject;  aECUID,aNo,aData:string);
    procedure PTMonitoringProcess(Sender: TObject;  aECUID,aNo,aData:string);

    procedure ProcessKTT811FTPFirmWareDownloadComplete(Sender: TObject;  aECUID,aData:string);
    //KTT812 펌웨어 다운로드
    procedure ProcessKTT812FlashData(Sender: TObject;  aECUID,aData:string);
    procedure ProcessKTT812FlashDataEnd(Sender: TObject;  aECUID,aData:string);
    procedure ProcessKTT812EcuFirmWareDownloadComplete(Sender: TObject;  aECUID,aData:string);
    procedure ProcessKTT812EcuFirmWareDownloadFailed(Sender: TObject;  aECUID,aFailed:string);
  public
    { Public declarations }
    procedure DeviceVersionChange(aEcuID,aVersion:string);
    function ConnectDeviceCardTypeCheck : Boolean;
  public
    property SocketConnected: Boolean read FSocketConnected write SetSocketConnected;
    property DeviceSettingView: Boolean read FDeviceSettingView write SetDeviceSettingView;
    property CardEventView: Boolean read FOnCardEventView write FOnCardEventView;
    property CardRegView: Boolean read FOnCardRegView write FOnCardRegView;
    property ScheduleView: Boolean read FOnScheduleView write FOnScheduleView;
    property HolidayView: Boolean read FOnHolidayView write FOnHolidayView;
    property CurrentStateView: Boolean read FOnCurrentStateView write FOnCurrentStateView;
    property AccessEventView: Boolean read FOnAccessEventView write FOnAccessEventView;
    property AlarmEventView: Boolean read FOnAlarmEventView write FOnAlarmEventView;
    property JavaraScheduleView: Boolean read FOnJavaraScheduleView write FOnJavaraScheduleView;
    property NetworkCheckView : Boolean read FNetworkCheckView write FNetworkCheckView;
  public
    property DeviceID : string read FDeviceID write FDeviceID;
  public
    L_bFTPFirmWareSendShow : Boolean;
    L_bICU300FirmWareSendShow : Boolean;
    L_bFirmWareSendShow : Boolean;
    L_bLinkusStateCheckShow :Boolean;
    L_bCdmaStateCheckShow :Boolean;
    L_bDVRStateCheckShow : Boolean;
    L_bDeviceVersionShow : Boolean;
    L_bCardReaderVersionShow : Boolean;
    L_bZoneExtentionVersionShow : Boolean;
    L_bKTT812FirmwareDownLoadShow : Boolean;
    L_bCardMemorySaving : Boolean;
  private
    procedure SearchDeviceInfo;
    function CheckDeviceInfo(aEcuID:string):Boolean;
    function UsedDeviceTypeSearch(aEcuID:string):Boolean;
    function KTTSystemIDSearch(aEcuID:string):Boolean;
    function SystemInfoSearch(aEcuID:string):Boolean;
    function SearchDeviceVersionCheck(aEcuID:string):Boolean;
    function SearchDeviceCodeCheck(aEcuID:string):Boolean;
    function SearchRelay2TypeCheck(aEcuID:string):Boolean;
    function SearchArmRelay(aEcuID:string):Boolean;
    function SearchArmDsCheck(aEcuID,aDoorNo:string):Boolean;
    function SystemZoneExtensionUseSearch(aEcuID:string):Boolean;
    function SearchArmAreaUseCheck(aEcuID:string):Boolean;
    function SearchDoorArmArea(aEcuID:string):Boolean;
    function DoorSystemInfoSearch(aEcuID,aDoorNo:string):Boolean;
    function CardReaderTypeSearch(aEcuID:string):Boolean;
    function CardReaderInfoSearch(aEcuID:string;aReaderNo:integer):Boolean;
    function PortInfoSearch(aEcuID:string;aPortNo:integer):Boolean;
    function AlartLampSirenStateCheck(aEcuID:string):Boolean;
    function AlertLampTimeCheck(aEcuID:string):Boolean;
    function AlertSirenTimeCheck(aEcuID:string):Boolean;
  private
    procedure  AppException( Sender:  TObject;  E:  Exception) ;
  end;

var
  fmMain: TfmMain;

implementation
uses
  dllFunction,
  Project,
  uSocket,
  uCommon,
  uCheckValiable,
  uProgConfig,
  uLogin,
  uPWConfig,
  uConnectStatusMsg,
  udmDataBase,
  uUtil,
  uCurrentDeviceSetting,
  uSregConfig,
  uNetConfig,
  uCardReg,
  uSchedule,
  uHoliday,
  uWatchCode,
  uCurrentState,
  uCardEvent,
  uFirmware,
  uFTPFirmware,
  uLinkusStateCheck,
  uCdmaStateCheck,
  uDVRStateCheck,
  uDeviceVersion,
  uCardReaderVersion,
  u812Firmware,
  uAccessEvent,
  uAlarmEvent,
  udmDBBackupAndRecovery,
  uJavaraSchedule,
  uZoneExtentionVersion,
  uICUGCU300FirmwareDownload,
  uNetworkCheck;


{$R *.dfm}


procedure TfmMain.mn_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.Action_DeviceConnectExecute(Sender: TObject);
var
  bConnectStart : Boolean;
begin
  fmProgConfig := TfmProgConfig.Create(Self);
  fmProgConfig.PageControl1.ActivePageIndex := 1;
  fmProgConfig.ShowModal;
  bConnectStart := fmProgConfig.L_bConnectStart;
  fmProgConfig.Free;

  if Not bConnectStart then Exit;
  Action_DeviceConnect.Enabled := False;
  if Not DeviceConnectStart(G_bDirectConnect) then Action_DeviceConnect.Enabled := True;
end;

procedure TfmMain.iniConfigSetting;
var
  ini_fun : TiniFile;
begin

  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\ztcs.INI');
    L_stPw := ini_fun.ReadString('Config','PW','1234');

    G_nDelayTime := ini_fun.ReadInteger('Config','DelayTime',2000);

    G_stTCPConf := ini_fun.ReadString('Config','TCP','127.0.0.1,3000,0');
    G_nComPort := ini_fun.ReadInteger('Config','ComPort',0);
    G_nConnectMode := ini_fun.ReadInteger('Config','ConnectMode',0);
    G_nLoopCount := ini_fun.ReadInteger('Config','LoopCount',3)  ; //에러 대기 횟수
    G_nLANTime := ini_fun.ReadInteger('Config','LANTime',4000);
    G_nLANLoop := ini_fun.ReadInteger('Config','LANLoop',2);
    //if UpperCase(ini_fun.ReadString('Config','DEVICESEARCH','TRUE')) = 'FALSE' then  G_bDeviceSearch := False
    //else G_bDeviceSearch := True;

    L_nDeviceFormtView := ini_fun.ReadInteger('Config','DeviceFormt',0);

    G_bDeviceSearch := True;
    if UpperCase(ini_fun.ReadString('Config','MACVIEW','FALSE')) = 'FALSE' then  G_bMacView := False
    else G_bMacView := True;

    if UpperCase(ini_fun.ReadString('Config','EventControlerSave','FALSE')) = 'FALSE' then  G_bEventControlerSave := False
    else G_bEventControlerSave := True;

    {if UpperCase(ini_fun.ReadString('Config','REALREGIST','FALSE')) = 'TRUE' then
       G_bRealRegist := True
    else  }

    G_nSearchType := ini_fun.ReadInteger('Setting','SearchType',1);
    G_bRealRegist := False;

  Finally
    ini_fun.free;
  End;  //}

end;

procedure TfmMain.mn_PWChangeClick(Sender: TObject);
begin
  fmPWConfig := TfmPWConfig.Create(Self);
  fmPWConfig.OrgPW := L_stPW;
  fmPWConfig.ShowModal;
  fmPWConfig.Free; //}
end;

function TfmMain.DeviceConnectStart(aDirect:boolean): Boolean;
var
  i : integer;
  bResult : Boolean;
begin
  result := False;
  bResult := False;
  L_bStopConnection := False;
  L_nOrgWiznetServerMode := -1;//모드 변경 없음 상태
  G_b812MainFirmWareDownloadComplete := False;//812 메인 펌웨어 다운로드 완료
  dmSocket.SocketDisConnect;
  G_nServerMode := strtoint(FindCharCopy(G_stTCPConf,2,','));
  dmSocket.ConnectMode := G_nConnectMode;
  dmSocket.ServerMode := G_nServerMode;
  dmSocket.SocketAddress := FindCharCopy(G_stTCPConf,0,',');
  dmSocket.SocketPort := FindCharCopy(G_stTCPConf,1,',');
  dmSocket.SocketCOM := G_nComPort;
  if G_nConnectMode = 1 then
  begin
    dmSocket.SocketType := 0; // 0.ComPort,1.ClientSocket,2.IndySocket
  end else
  begin
    dmSocket.SocketType := 3; // 0.ComPort,1.ClientSocket,2.IndySocket,3.WinSocket
  end;
  ApdSLController.Monitoring:= True;

  Panel1.Visible := True;
  Panel1.Color := clYellow;
  if aDirect then
  begin
    for i := 1 to 5 do
    begin
      Panel1.Caption := '컨트롤러 접속 시도 중입니다(' + inttostr(i) + ')';
      dmSocket.SocketDisConnect;
      bResult := dmSocket.SocketConnect;
      if bResult then break;
      Application.ProcessMessages;
    end;
  end;


  if (G_nConnectMode = 0) and (G_nServerMode = 0) then //LAN 접속이면서 Client 모드 이면
  begin
    if Not bResult then
    begin
      if Not ClientModeSetting(FindCharCopy(G_stTCPConf,0,','),2) then  //컨트롤러를 ServerMode로 변경 함다.
      begin
        showmessage('기기 접속에 실패 하였습니다. IP 정보를 확인 하시거나 해당 컨트롤러를 리셋 후 재시도 해 주세요.');
        Exit;
      end;
    end;
  end;

  if (Not  bResult) and (G_nServerMode = 0) then
  begin
    Panel1.Visible := True;
    Panel1.Color := clYellow;
    for i := 0 to G_nLoopCount do
    begin
      Panel1.Caption := '컨트롤러 접속 시도 중입니다(' + inttostr(i+1) + ')';
      if G_bApplicationTerminate then Exit;
      dmSocket.SocketDisConnect;
      Delay(100);
      bResult := dmSocket.SocketConnect;
      if G_nServerMode = 1 then break;
      if bResult then Break;
      Application.ProcessMessages;
    end;
  end;
  if Not bResult then Panel1.Visible := False;

  if bResult then
  begin
    if G_nServerMode <> 1 then
    begin
      fmConnectStatusMsg:= TfmConnectStatusMsg.Create(Self);
      fmConnectStatusMsg.ShowModal;
      fmConnectStatusMsg.Free;
    end;
    ReconnectSocketTimer.Enabled := True;
  end else
  begin
    showmessage('접속실패');
    Exit;
  end;


  if G_nConnectMode = 0 then //LAN 접속이면
  begin
    if G_nServerMode = 1 then FieldStatus_ComStatus.Caption:= FindCharCopy(G_stTCPConf,0,',') + ' 접속대기중';
  end;
  result := True;

  //}
end;

procedure TfmMain.SetSocketConnected(const Value: Boolean);
var
  fmDeviceSetting :TForm;
begin
  FSocketConnected := Value;
  MenuEnable(Value);
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).SocketConnected := Value;
  end;

end;

procedure TfmMain.MenuEnable(aValue: Boolean);
begin
  Action_DeviceConnect.Enabled := Not aValue;
  Action_DeviceDisConnect.Enabled := aValue;
  //mn_Setting.Enabled := aValue;
  //Action_DeviceSetting.Enabled := aValue;
  //Action_CardReg.Enabled := aValue;
  //Action_ScheduleReg.Enabled := aValue;
  //Action_Holiday.Enabled := aValue;
  //mn_CardManager.Enabled := aValue;
  //mn_Monitoring.Enabled := aValue;
  tb_NetworkCheck.Enabled := aValue;
  mn_DeviceInfo.Enabled := aValue;
  mn_Control.Enabled := aValue;
end;

procedure TfmMain.Action_DeviceDisConnectExecute(Sender: TObject);
begin
  L_bStopConnection := True;
  ReconnectSocketTimer.Enabled := False;
  dmSocket.SocketDisConnect; //}

  if G_nConnectMode <> 0 then Exit;

  if L_nOrgWiznetServerMode <> -1 then //모드가 변경 되었으면
  begin
    if Not ClientModeSetting(FindCharCopy(G_stTCPConf,0,','),L_nOrgWiznetServerMode,True) then  //컨트롤러를 ServerMode로 변경 함다.
    begin
      showmessage('기기 정보설정에 실패 하였습니다. 랜설정을 이용하여 클라이언트 서버모드를 변경 하여 주세요.');
      Exit;
    end;
  end;
end;

procedure TfmMain.Action_DeviceSettingExecute(Sender: TObject);
begin
{  if Not DeviceSettingView then
  begin
    pan_Message.Caption := '컨트롤러 정보를 구성중입니다. 잠시만 기다려 주세요...';
    pan_Message.Visible := True;
    MessageTimer.Enabled := True;
    Action_DeviceSetting.Enabled := False;
  end;  }
  MDIChildShow('TfmCurrentDeviceSetting');
  
end;



procedure TfmMain.ReconnectSocketTimerTimer(Sender: TObject);
var
  dtPollingTime: TDatetime;
  dtTimeOut: TDatetime;
begin
  if G_bApplicationTerminate then Exit;
  if G_nServerMode = 1 then exit;
  if G_nConnectMode = 1 then exit; //시리얼이면 빠져 나감
  
  dtPollingTime:= dmSocket.LastConnectedTime;
  dtTimeOut:= IncTime(dtPollingTime,0,0,60,0);
  if Now > dtTimeout then
  begin
    dmSocket.SocketDisConnect;
    Delay(50);
    if G_bApplicationTerminate then Exit;
    dmSocket.SocketConnect;
  end;
//  if Not dmSocket.SocketConnected then
//     dmSocket.SocketConnect;
{
  if G_nServerMode = 0 then
    FieldStatus_ComStatus.Caption:= FindCharCopy(G_stTCPConf,0,',') + ' 접속시도'
  else
    FieldStatus_ComStatus.Caption:= FindCharCopy(G_stTCPConf,0,',') + ' 접속대기중';

  DeviceConnectStart;
}
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  stLogoFile : string;
begin
  self.ModuleID := 'Main';

  ZoneStatusList := TStringList.create;
  ZoneStatusCodeList := TStringList.Create;
  DeviceTypeNameList := TStringList.create;
  DeviceList := TStringList.Create;
  DeviceListAdd('00');
  DeviceTypeInitialize;

  L_bConnectCheck := False;
  L_bProgramClose := False;
  L_nConnectRetryCount := 0;
  G_bApplicationTerminate := False;
  ReconnectSocketTimer.Enabled := False;

  DeviceSettingView := False;
  CardEventView := False;
  CardRegView := False;
  ScheduleView := False;
  HolidayView := False;
  CurrentStateView := False;
  AccessEventView := False;
  AlarmEventView := False;

  SocketCreate;
  MenuEnable(False);
  LoadZoneStatus;
  LoadDeviceTypeName;

  if FileExists(ExtractFileDir(Application.ExeName) + '\logo.ico') then
  begin
    self.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
    Application.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
  end;
  stLogoFile := ExtractFileDir(Application.ExeName) + '\Logo.JPG';
  if FileExists(stLogoFile) then
    Image1.Picture.LoadFromFile(stLogoFile);

  CardDownloadTimer.Enabled := True;

  fmMain.Caption := 'Setup Program[' + strBuildInfo + ']' + COMPILE_DATE;
  Application.OnException := AppException;
end;


procedure TfmMain.NodeConnect(Sender: TObject; aConnected: Boolean);
var
  i : integer;
  bResult : Boolean;
  fmDeviceSetting :TForm;
begin
  if aConnected then mn_DeviceFormat.Visible := False;
  SocketConnected := aConnected;
  if aConnected then
  begin
    Panel1.Caption := '메인 컨트롤러의 응답을 확인중입니다. 잠시만 기다려 주세요.';
    Panel1.Visible := True;
    Panel1.Color := clYellow;
    MCUStateCheckTimer.Enabled := True;
    SearchTimer.Interval := 50000;
    SearchTimer.Enabled := True;
    //dmSocket.UsedDevice_Check(True);
    //dmSocket.DeviceType_Check(False);
    //방범상태확인
    //dmSocket.AlarmState_Check('00',False);
    {
    //ECU Check
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      bResult := dmSocket.UsedDevice_Check;
      if bResult then Break;
    end;   }
    //ActionDeviceTimer.Enabled := True;
  end else  // } // 2011.07.19 전송 중
  begin
    SearchTimer.Enabled := False;
    dmDataBase.UpdateTB_DEVICE_FieldName('00','DEVICEUSE','N');
    dmDataBase.UpdateTB_DEVICERCV_FieldName('00','DEVICEUSE','N');
    DeviceListStateClear;
    dmDataBase.UpdateTB_DEVICERCV_AllRcvAck('N');
    dmDataBase.UpdateTB_DOORSettingInfoRCV_AllRcvAck('N');
    dmDataBase.UpdateTB_READERSETTINGRCV_AllRcvAck('N');
    dmDataBase.UpdateTB_ZONESETTINGRCV_AllRcvAck('N');
  end;
{
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).NodeConnected(aConnected);
  end; //}
end;

procedure TfmMain.PanelMessage(Sender: TObject; aMessage: string);
begin
  FieldStatus_ComStatus.Caption := aMessage;
end;

procedure TfmMain.PacketView(Sender: TObject; aPacket,aType: string);
var
  fmCurrentState :TForm;
  stCmd : string;
  stEcuID : string;
begin
  if CurrentStateView then
  begin
    stCmd := aPacket[G_nIDLength + 10];
    stEcuID := copy(aPacket,8 + G_nIDLength,2);
    fmCurrentState := MDIForm('TfmCurrentState');
    TfmCurrentState(fmCurrentState).DisplayStringGrid(stCmd,aType,TdmSocket(Sender).SocketAddress,stEcuID,aPacket);
  end;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini_fun : TiniFile;
begin

  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\ztcs.INI');
    ini_fun.WriteInteger('Setting','SearchType',G_nSearchType);
    if btnDeviceDisConnect.Enabled then Action_DeviceDisConnectExecute(sender);
    G_bApplicationTerminate := True;
    dmSocket.Free;
    CardDownloadTimer.Enabled := False;  //}

  Finally
    ini_fun.Free;
  End;

end;


procedure TfmMain.AlarmEvent(Sender: TObject; aECUID,aCmd, aTime, aSubCLass,
  aSubAddr, aZone, aMode, aStatus, aLoop, aState, aOper: string);
var
  fmDeviceSetting :TForm;
  fmAlarmEvent : TForm;
  nIndex : integer;
  oWatchMode : TWatchMode;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvAlarmEvent(aECUID, aTime, aSubCLass,
                    aSubAddr, aZone, aMode, aStatus, aLoop, aState, aOper);
  end;  // }
  if UpperCase(aCmd) = 'A' then
  begin
    if AlarmEventView then
    begin
      fmAlarmEvent := MDIForm('TfmAlarmEvent');
      TfmAlarmEvent(fmAlarmEvent).RecvAlarmEvent(aECUID, aTime, aSubCLass,
                      aSubAddr, aZone, aMode, aStatus, aLoop, aState, aOper);
    end;
  end;

  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;

  oWatchMode := cmNothing;
  case Uppercase(aMode)[1] of
      'A': begin //경계모드
             oWatchMode := cmArm;
           end;
      'D': begin //해제모드
             oWatchMode := cmDisarm;
           end;
      'P': begin //순회모드
             oWatchMode := cmPatrol;
           end;
  end;

  if (aSubCLass = 'CD') then
  begin
    if Not isDigit(aSubAddr) then Exit;
    if aStatus = 'NF' then
    begin
      TCurrentDeviceState(DeviceList.Objects[nIndex]).setReaderConnected(strtoint(aSubAddr),False);
    end else if aStatus = 'NR' then
    begin
      TCurrentDeviceState(DeviceList.Objects[nIndex]).setReaderConnected(strtoint(aSubAddr),True);
    end;
  end else if (aSubCLass = 'EX') then  //확장기이면
  begin
    if aStatus = 'NF' then
    begin
      oWatchMode := cmNothing;
      TCurrentDeviceState(DeviceList.Objects[nIndex]).setDeviceConnected(False);
    end else if aStatus = 'NR' then
    begin
      TCurrentDeviceState(DeviceList.Objects[nIndex]).setDeviceConnected(True);
    end;
  end;
  TCurrentDeviceState(DeviceList.Objects[nIndex]).AlarmMode := oWatchMode;

end;

procedure TfmMain.CardAccessEvent(Sender: TObject; aECUID, aDoorNo,
  aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
  aAccessResult, aDoorState, aATButton, stCardNo: string);
var
  fmCardReg :TForm;
  fmCardEvent : TForm;
  fmAccessEvent : TForm;
  nIndex : integer;
begin
  if CardRegView then
  begin
    fmCardReg := MDIForm('TfmCardReg');
    TfmCardReg(fmCardReg).RecvCardAccessEvent(aECUID, aDoorNo,
      aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
      aAccessResult, aDoorState, aATButton, stCardNo);
  end;   //}
  if CardEventView then
  begin
    fmCardEvent := MDIForm('TfmCardEvent');
    TfmCardEvent(fmCardEvent).RecvCardAccessEvent(aECUID, aDoorNo,
      aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
      aAccessResult, aDoorState, aATButton, stCardNo);
  end;   //}
  if AccessEventView then
  begin
    fmAccessEvent := MDIForm('TfmAccessEvent');
    TfmAccessEvent(fmAccessEvent).RecvCardAccessEvent(aECUID, aDoorNo,
      aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
      aAccessResult, aDoorState, aATButton, stCardNo);
  end;

  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TCurrentDeviceState(DeviceList.Objects[nIndex]).SetDoorState(aDoorNo, aCardMode,aDoorMode, aDoorState,'');

end;

procedure TfmMain.DoorEvent(Sender: TObject; aECUID, aDoorNo, aReaderNo,
  aInOut, aTime, aCardMode, aDoorMode, aChangeState, aAccessResult,
  aDoorState: string);
var
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TCurrentDeviceState(DeviceList.Objects[nIndex]).SetDoorState(aDoorNo, aCardMode,aDoorMode, aDoorState,'');

end;

procedure TfmMain.DoorSettingEvent(Sender: TObject; aECUID, aDoorNo,
  aCardMode, aDoorMode, aDoorControlTime, aLongDoorOpenTime, aSchedule,
  aDoorState, aNetFailRun, aAntiPass, aLongDoorOpenUse, aNetFailAlarm,
  aDoorLockType, aFireDoorControl, aLockState, aDoorOpenState,
  aRemoteDoorOpen: string);
var
  fmDeviceSetting :TForm;
  nDoorOpenTime : integer;
  nDoorLockType : integer;
  nIndex : integer;
begin
  nDoorOpenTime := Ord(aLongDoorOpenTime[1]) - $30;

  //if strtoint(aDoorLockType) < 4 then
    nDoorLockType:=         strtoint(aDoorLockType);
  //else nDoorLockType:=         strtoint(aDoorLockType) - 2;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex > -1 then
    TCurrentDeviceState(DeviceList.Objects[nIndex]).SetDoorLockType(aDoorNo,nDoorLockType);

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvDoorSettingEvent(aECUID, aDoorNo,
        aCardMode, aDoorMode, aDoorControlTime, inttostr(nDoorOpenTime), aSchedule,
        aDoorState, aNetFailRun, aAntiPass, aLongDoorOpenUse, aNetFailAlarm,
        inttostr(nDoorLockType), aFireDoorControl, aLockState, aDoorOpenState,
        aRemoteDoorOpen);
  end;
  dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,aDoorNo,'CARD_TYPE',aCardMode);
  dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,aDoorNo,'DOORMODE_TYPE',aDoorMode);
  dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,aDoorNo,'DOOR_OPEN',aDoorControlTime);
  dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,aDoorNo,'OPEN_MONI',inttostr(nDoorOpenTime));
  dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,aDoorNo,'USE_SCH',aSchedule);
  dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,aDoorNo,'DOOR_STATUS',aDoorState);
  dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,aDoorNo,'ALARM_LONG',aLongDoorOpenUse);
  dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,aDoorNo,'CONTROL_FIRE',aFireDoorControl);
  dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,aDoorNo,'LOCK_TYPE',inttostr(nDoorLockType));
  dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,aDoorNo,'DOOR_DSOPENSTATUS',aDoorOpenState);
  dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,aDoorNo,'DOOR_REMOTECANCEL',aRemoteDoorOpen);

  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,aDoorNo,'CARD_TYPE','Y');
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,aDoorNo,'DOORMODE_TYPE','Y');
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,aDoorNo,'DOOR_OPEN','Y');
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,aDoorNo,'OPEN_MONI','Y');
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,aDoorNo,'USE_SCH','Y');
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,aDoorNo,'DOOR_STATUS','Y');
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,aDoorNo,'ALARM_LONG','Y');
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,aDoorNo,'CONTROL_FIRE','Y');
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,aDoorNo,'LOCK_TYPE','Y');
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,aDoorNo,'DOOR_DSOPENSTATUS','Y');
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,aDoorNo,'DOOR_REMOTECANCEL','Y');

end;

procedure TfmMain.DoorState(Sender: TObject; aECUID, aDoorNo, aCardMode,
  aDoorMode, aDoorState,aDoorSchedule: string);
var
  fmDeviceSetting :TForm;
  nIndex : integer;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvDoorState(aECUID, aDoorNo, aCardMode,aDoorMode, aDoorState,aDoorSchedule);
  end;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TCurrentDeviceState(DeviceList.Objects[nIndex]).SetDoorState(aDoorNo, aCardMode,aDoorMode, aDoorState,aDoorSchedule);


end;

procedure TfmMain.CardRegist(Sender: TObject; aECUID, aDoorNo, aCmd,
  aCardType, aCardNo, aExpireDate, aRegResult,aCardAuth, aTimeMode,
  aCardIDNo,aAlarmAreaGrade,aDoorAreaGrade: string);
var
  fmCardReg :TForm;
begin

  case aCmd[1] of
    'l','e','f': //등록
      begin
        if aRegResult <> '3' then
        begin
          if Not isDigit(aCardIDNo) then
          begin
            aCardIDNo := '0';  //위치번호가 없는 경우 0 으로 입력 하자
          end else
          begin
            if strtoint(aCardIDNo) > G_nMaxCardPositionNum then
              G_nMaxCardPositionNum := strtoint(aCardIDNo);
          end;
        end;
        if aRegResult = '2' then
        begin
          dmDataBase.UpdateTB_CARDPERMIT_PositionRcvAck(aECUID,aCardNo,aCardIDNo,'Y',aCardType);
        end else if aRegResult = '1' then dmDataBase.UpdateTB_CARDPERMIT_DeviceAllRCVACK(aEcuID,'N','E');
        begin
        end;
      end;
    'n','d':     //삭제
      begin
        dmDataBase.DeleteTB_CARDPERMIT_CardNo(aECUID,aCardNo);
      end;
    'o':         //전체삭제
      begin
        dmDataBase.DeleteTB_CARDPERMIT_AllCardNo(aECUID);
      end;
  end;

  if CardRegView then
  begin
    fmCardReg := MDIForm('TfmCardReg');
    TfmCardReg(fmCardReg).RecvCardRegist(aECUID, aDoorNo, aCmd,
          aCardType, aCardNo, aExpireDate, aRegResult,aCardAuth,
          aTimeMode,aCardIDNo,aAlarmAreaGrade,aDoorAreaGrade);
  end;
//}
end;

procedure TfmMain.ScheduleData(Sender: TObject; aECUID, aDoorNo, aCmd,
  aDayOfWeek, a1ModeTime, a1Mode, a2ModeTime, a2Mode, a3ModeTime, a3Mode,
  a4ModeTime, a4Mode, a5ModeTime, a5Mode: string);
var
  fmSchedule :TForm;
begin
  dmDataBase.UpdateSchedule(aECUID, aDoorNo, aCmd,
        aDayOfWeek, a1ModeTime, a1Mode, a2ModeTime, a2Mode, a3ModeTime, a3Mode,
        a4ModeTime, a4Mode, a5ModeTime, a5Mode);

  if SCHEDULEVIEW then
  begin
    fmSchedule := MDIForm('TfmSchedule');
    TfmSchedule(fmSchedule).RecvScheduleData(aECUID, aDoorNo, aCmd,
        aDayOfWeek, a1ModeTime, a1Mode, a2ModeTime, a2Mode, a3ModeTime, a3Mode,
        a4ModeTime, a4Mode, a5ModeTime, a5Mode);
  end;

end;

procedure TfmMain.HolidayData(Sender: TObject; aECUID,aDoorNo, aMonth,
  aDate: string);
var
  Form_Holiday :TForm;
begin
  if HolidayView then
  begin
    Form_Holiday := MDIForm('TForm_Holiday');
    TForm_Holiday(Form_Holiday).RecvHoliday(aECUID,aDoorNo,aMonth,aDate);
  end;

end;

procedure TfmMain.DeviceIDData(Sender: TObject; aECUID, aDeviceID: string);
var
  fmDeviceSetting :TForm;
begin
  DeviceID := aDeviceID;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvControllerID(aDeviceID);
  end;
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'DEVICE_ID',aDeviceID);
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'DEVICE_ID','Y');
end;

procedure TfmMain.CardReaderSetData(Sender: TObject; aECUID, aReaderNo,
  aUsedCR, aCRPosition, aDoorNo, aReaderArmArea, aLocate, aBuildingPosi: string);
var
  fmDeviceSetting :TForm;
  nReaderNo : integer;
  nIndex : integer;
begin
  nReaderNo := strtoint(aReaderNo);

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvCardReaderSetData( aECUID, aReaderNo,
          aUsedCR, aCRPosition, aDoorNo,aReaderArmArea, aLocate, aBuildingPosi);
  end;

  if isDigit(aUsedCR) then dmDataBase.UpdateTB_READERSETTING_FieldName(aECUID,'0',inttostr(nReaderNo),'READER_USE',inttostr(strtoint(aUsedCR)));
  if isDigit(aDoorNo) then dmDataBase.UpdateTB_READERSETTING_FieldName(aECUID,'0',inttostr(nReaderNo),'READER_DOOR',inttostr(strtoint(aDoorNo)));
  if isDigit(aCRPosition) then dmDataBase.UpdateTB_READERSETTING_FieldName(aECUID,'0',inttostr(nReaderNo),'READER_NAME',inttostr(strtoint(aCRPosition)));
  if isDigit(aBuildingPosi) then dmDataBase.UpdateTB_READERSETTING_FieldName(aECUID,'0',inttostr(nReaderNo),'READER_BUILDING',inttostr(strtoint(aBuildingPosi)));
  if isDigit(aReaderArmArea) then dmDataBase.UpdateTB_READERSETTING_FieldName(aECUID,'0',inttostr(nReaderNo),'READERARMAREA',inttostr(strtoint(aReaderArmArea)));

  dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(aECUID,'0',inttostr(nReaderNo),'READER_USE','Y');
  dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(aECUID,'0',inttostr(nReaderNo),'READER_DOOR','Y');
  dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(aECUID,'0',inttostr(nReaderNo),'READER_NAME','Y');
  dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(aECUID,'0',inttostr(nReaderNo),'READER_BUILDING','Y');
  dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(aECUID,'0',inttostr(nReaderNo),'READERARMAREA','Y');

  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex > -1 then
  begin
    TCurrentDeviceState(DeviceList.Objects[nIndex]).SetReaderInfo(aReaderNo,aUsedCR,aCRPosition,aDoorNo,aReaderArmArea,aLocate, aBuildingPosi);
  end;
  //}
end;

procedure TfmMain.SystemSetData(Sender: TObject; aECUID, aPowerWatch,
  aOutDelay, aDoor1Type, aDoor2Type, aLocate, aInDelay,aLockExtend: string);
var
  fmDeviceSetting :TForm;
  i : integer;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvSystemInfoData(aECUID, aPowerWatch,
  aOutDelay, aDoor1Type, aDoor2Type, aLocate, aInDelay,aLockExtend);
  end;
  dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'WATCH_POWER',aPowerWatch);
  dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,'1','DOOR_TYPE',aDoor1Type);
  dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,'2','DOOR_TYPE',aDoor2Type);
  dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'LOCATE',aLocate);
  dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'OUT_DELAY',aOutDelay);
  dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'IN_DELAY',aInDelay);
  if Length(aLockExtend) = 6 then
  begin
    for i := 1 to 6 do
    begin
      dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,inttostr(i+2),'DOOR_TYPE',aLockExtend[i]);
      dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,inttostr(i+2),'DOOR_TYPE','Y')
    end;
  end;

  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'WATCH_POWER','Y');
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,'1','DOOR_TYPE','Y');
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,'2','DOOR_TYPE','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'LOCATE','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'OUT_DELAY','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'IN_DELAY','Y');
  //}
end;

procedure TfmMain.LampSirenOnOff(Sender: TObject; aECUID, stLampOnOff,
  aSirenOnOff: string);
var
  fmDeviceSetting :TForm;
begin
  if isDigit(stLampOnOff) then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'ZONE_LAMPONOFF',stLampOnOff);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'ZONE_LAMPONOFF','Y');
  end;
  if isDigit(aSirenOnOff) then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'ZONE_SIRENONOFF',aSirenOnOff);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'ZONE_SIRENONOFF','Y');
  end;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).LampSirenOnOff(aECUID, stLampOnOff,aSirenOnOff);
  end;

end;

procedure TfmMain.LampTimeSetData(Sender: TObject; aECUID,
  aLampTime: string);
var
  fmDeviceSetting :TForm;
begin
  if isDigit(aLampTime) then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'ZONE_LAMPONTIME',aLampTime);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'ZONE_LAMPONTIME','Y');
  end;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).LampTimeSetData(aECUID, aLampTime);
  end;

end;

procedure TfmMain.SirenTimeSetData(Sender: TObject; aECUID,
  aSirenTime: string);
var
  fmDeviceSetting :TForm;
begin
  if isDigit(aSirenTime) then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'ZONE_SIRENONTIME',aSirenTime);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'ZONE_SIRENONTIME','Y');
  end;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).SirenTimeSetData(aECUID, aSirenTime);
  end;

end;

procedure TfmMain.PortSettingData(Sender: TObject; aECUID, aPort,
  aWatchType, aAlarmType, aRecoverType, aDelayTimeType, aPortLocate,
  aDetectTime,aZoneArmArea,aZoneUsed: string);
var
  fmDeviceSetting :TForm;
  nPortNo : integer;
begin
  nPortNo := strtoint(aPort);

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvPortSettingData(aECUID, aPort,
          aWatchType, aAlarmType, aRecoverType, aDelayTimeType, aPortLocate,
          aDetectTime,aZoneArmArea,aZoneUsed);
  end;
  dmDataBase.UpdateTB_ZONESETTING_FieldName(aECUID,'0',inttostr(nPortNo),'PORT_TYPE',aAlarmType);
  dmDataBase.UpdateTB_ZONESETTING_FieldName(aECUID,'0',inttostr(nPortNo),'PORT_DELAY',aDelayTimeType);
  dmDataBase.UpdateTB_ZONESETTING_FieldName(aECUID,'0',inttostr(nPortNo),'PORT_RECORVER',aRecoverType);
  dmDataBase.UpdateTB_ZONESETTING_FieldName(aECUID,'0',inttostr(nPortNo),'ZONEARMAREA',aZoneArmArea);

  dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(aECUID,'0',inttostr(nPortNo),'PORT_TYPE','Y');
  dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(aECUID,'0',inttostr(nPortNo),'PORT_DELAY','Y');
  dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(aECUID,'0',inttostr(nPortNo),'PORT_RECORVER','Y');
  dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(aECUID,'0',inttostr(nPortNo),'ZONEARMAREA','Y');
//}
end;

procedure TfmMain.DeviceUsedSettingData(Sender: TObject; aECUID,
  aDeviceUsed: string);
var
  i : integer;
  stEcuID : string;
  fmDeviceSetting :TForm;
begin
  dmDataBase.UpdateTB_DEVICE_FieldName('00','DEVICEUSE','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName('00','DEVICEUSE','Y');
  for i := 2 to G_nMaxEcuCount + 1 do  // 1번째는 메인임
  begin
    stEcuID := FillZeroNumber(i-1, 2);
    if aDeviceUsed[i] = '1' then
    begin
      dmDataBase.UpdateTB_DEVICE_FieldName(stEcuID,'DEVICEUSE','Y');
      dmDataBase.UpdateTB_DEVICERCV_FieldName(stEcuID,'DEVICEUSE','Y');
      DeviceListAdd(stEcuID);
    end else
    begin
      dmDataBase.UpdateTB_DEVICE_FieldName(stEcuID,'DEVICEUSE','N');
      dmDataBase.UpdateTB_DEVICERCV_FieldName(stEcuID,'DEVICEUSE','Y');
      DeviceListDelete(stEcuID);
    end;
  end;

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvDeviceUsedSetting(aDeviceUsed);
  end;
//}
end;

procedure TfmMain.WiznetInfoSettingData(Sender: TObject; aECUID, aHeader,
  aMacAddress, aMode, aIPAddress, aSubnet, aGateway, aClientPort,
  aServerIP, aServerPort, aSerial_Baud, aSerial_data, aSerial_Parity,
  aSerial_stop, aSerial_flow, aDelimiterChar, aDelimiterSize,
  aDelimitertime, aDelimiterIdle, aDebugMode, aROMVer, aOnDHCP,
  aReserve: string);
var
  fmDeviceSetting :TForm;
  stMcuIp : string;
  stSubnetMask : string;
  stGateWayIp : string;
  stMcuPort : string;
  stServerIp : string;
  stServerPort : string;
  stTemp : string;
  i : integer;
begin
  stMcuIp := '';
  stTemp := Hex2Ascii(aIPAddress);
  for I := 1 to 4 do
  begin
    if I < 4 then stMcuIp := stMcuIp + IntToStr(Ord(stTemp[I])) + '.'
    else stMcuIp := stMcuIp + IntToStr(Ord(stTemp[I]));
  end;

  stSubnetMask := '';
  stTemp := Hex2Ascii(aSubnet);
  for I := 1 to 4 do
  begin
    if I < 4 then stSubnetMask := stSubnetMask + IntToStr(Ord(stTemp[I])) + '.'
    else stSubnetMask := stSubnetMask + IntToStr(Ord(stTemp[I]));
  end;

  stGateWayIp := '';
  stTemp := Hex2Ascii(aGateway);
  for I := 1 to 4 do
  begin
    if I < 4 then stGateWayIp := stGateWayIp + IntToStr(Ord(stTemp[I])) + '.'
    else stGateWayIp := stGateWayIp + IntToStr(Ord(stTemp[I]));
  end;

  stMcuPort := Hex2DecStr(aClientPort);

  stServerIp := '';
  stTemp := Hex2Ascii(aServerIP);
  for I := 1 to 4 do
  begin
    if I < 4 then stServerIp := stServerIp + IntToStr(Ord(stTemp[I])) + '.'
    else stServerIp := stServerIp + IntToStr(Ord(stTemp[I]));
  end;

  stServerPort := Hex2DecStr(aServerPort);

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvWiznetInfo(aECUID, aHeader,
        aMacAddress, aMode, stMcuIp, stSubnetMask, stGateWayIp, stMcuPort,
        stServerIp, stServerPort, aSerial_Baud, aSerial_data, aSerial_Parity,
        aSerial_stop, aSerial_flow, aDelimiterChar, aDelimiterSize,
        aDelimitertime, aDelimiterIdle, aDebugMode, aROMVer, aOnDHCP,
        aReserve);
  end;
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'MCU_IP',stMcuIp);
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'MCU_SUBNET',stSubnetMask);
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'MCU_GATE',stGateWayIp);
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'MCU_PORT',stMcuPort);
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'Server_IP',stServerIp);
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'MCU_SERVERPORT',stServerPort);
  dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'MCU_NETWORKMODE',aMode);
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'DHCP',aOnDHCP);

  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'MCU_IP','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'MCU_SUBNET','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'MCU_GATE','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'MCU_PORT','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'Server_IP','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'MCU_SERVERPORT','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'MCU_NETWORKMODE','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'DHCP','Y');
//}
end;

procedure TfmMain.CardReaderTypeSettingData(Sender: TObject; aECUID,
  aCardReaderType: string);
var
  fmDeviceSetting :TForm;
  i : integer;
begin

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvCardReaderType(aECUID, aCardReaderType);
  end;
  if Not isDigit(aCardReaderType[1]) then Exit;
  dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'CARDREADER_TYPE',aCardReaderType[1]);
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'CARDREADER_TYPE','Y');
  if Length(Trim(aCardReaderType)) > 9 then
  begin
    for i := 3 to 10 do
    begin
      dmDataBase.UpdateTB_READERSETTING_FieldName(aEcuID,'0',inttostr(i-2),'CARDREADER_TYPE',aCardReaderType[i]);
      dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(aEcuID,'0',inttostr(i-2),'CARDREADER_TYPE','Y');
    end;
  end;
//}
end;

procedure TfmMain.DeviceStateData(Sender: TObject; aECUID, aCmd,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvDeviceStateData(aECUID, aCmd,aData);
  end;
//}
end;

procedure TfmMain.DeviceTimeData(Sender: TObject; aECUID, aTime: string);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvDeviceTime(aECUID,aTime);
  end;

end;

procedure TfmMain.DeviceTypeData(Sender: TObject; aECUID,
  aDeviceType: string);
var
  fmDeviceSetting :TForm;
  i : integer;
  nIndex : integer;
begin
  dmDatabase.UpdateTB_DEVICERCV_FieldName('00','DEVICE_TYPE','Y');
  for i := 2 to G_nMaxEcuCount + 1 do
  begin
    if aDeviceType[i] <> '0' then
    begin
      nIndex := DeviceList.IndexOf(FillZeroNumber(i-1,2));
      if nIndex > -1 then
      begin
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceCode = '' then  //실제 기기코드를 가져 오지 못한 경우만
        begin
          case aDeviceType[i] of
            '1' : TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType := KTT811;
            '2' : TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType := KTT812;
            '3' : TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType := ICU100;
            '4' : TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType := ICU200;
            '5' : TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType := ICU300;
            '6' : TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType := ACC100;
            '7' : TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType := KTT813;
          end;
          G_stDeviceType[i-1] := aDeviceType[i];
          dmDatabase.UpdateTB_DEVICE_FieldName(Fillzeronumber(i-1,2),'DEVICE_TYPE',aDeviceType[i]);
          dmDatabase.UpdateTB_DEVICERCV_FieldName(Fillzeronumber(i-1,2),'DEVICE_TYPE','Y');
        end;
      end else
      begin
        G_stDeviceType[i-1] := aDeviceType[i];
        dmDatabase.UpdateTB_DEVICE_FieldName(Fillzeronumber(i-1,2),'DEVICE_TYPE',aDeviceType[i]);
        dmDatabase.UpdateTB_DEVICERCV_FieldName(Fillzeronumber(i-1,2),'DEVICE_TYPE','Y');
      end;
    end;
  end;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvDeviceType(aDeviceType);
  end;
//}
end;

procedure TfmMain.SystemFunctionData(Sender: TObject; aECUID: string;
  aJavaraCloseCommand, aJavaraOpenCommand, aFireServerCommand: Boolean);
begin

end;

procedure TfmMain.DeviceVersionData(Sender: TObject; aECUID,
  aDeviceVersion: string);
var
  fmDeviceSetting :TForm;
  fmDeviceVersion :TForm;
  nIndex : integer;
begin
  if L_bDeviceVersionShow then
  begin
    fmDeviceVersion := MDIForm('TfmDeviceVersion');
    TfmDeviceVersion(fmDeviceVersion).DeviceVersionSearch;
  end;


  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvDeviceVersion(aECUID,aDeviceVersion);
  end;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceVersion := aDeviceVersion;
//}
end;

procedure TfmMain.CardReaderVersionData(Sender: TObject; aECUID,
  aCardReaderNo, aCardReaderVersion: string);
var
  fmDeviceSetting :TForm;
  fmCardReaderVersion :TForm;
  nIndex : integer;
begin
  if L_bCardReaderVersionShow then
  begin
    fmCardReaderVersion := MDIForm('TfmCardReaderVersion');
    TfmCardReaderVersion(fmCardReaderVersion).CardReaderVersionSearch;
  end;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvCardReaderVersion(aECUID,aCardReaderNo, aCardReaderVersion);
  end;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TCurrentDeviceState(DeviceList.Objects[nIndex]).SetReaderVersion(aCardReaderNo, aCardReaderVersion);


end;

procedure TfmMain.DeviceResetData(Sender: TObject; aECUID: string);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvDeviceResetData(aECUID);
  end;
end;

procedure TfmMain.CardListSearchData(Sender: TObject; aECUID,
  aData: string);
var
  fmCardReg :TForm;
begin
  if CardRegView then
  begin
    fmCardReg := MDIForm('TfmCardReg');
    TfmCardReg(fmCardReg).RecvCardListSearch(aECUID,aData);
  end; //}
end;

procedure TfmMain.FormShow(Sender: TObject);
var
  bLogined :Boolean;
begin
//  dmDataBase.DeviceTableCreate;
//  dmDataBase.CardTableCreate;

  iniConfigSetting;

  if L_nDeviceFormtView = 1 then mn_DeviceFormat.Visible := True
  else mn_DeviceFormat.Visible := False;
  
  if L_stPW <> '*' then
  begin
    fmLogin := TfmLogin.Create(Self);
    fmLogin.OrgPW := L_stPW;
    fmLogin.ShowModal;
    bLogined := fmLogin.bLogined;
    fmLogin.Free;
  end
  else bLogined := True;

  if Not bLogined then
  begin
    L_bProgramClose := True;
    Self.Close;
  end;
  Action_DeviceSettingExecute(self);

//  SocketConnected := False;
//}
end;


procedure TfmMain.MDIChildShow(FormName: String);
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        if Screen.ActiveForm = Screen.Forms[i] then
        begin
          Screen.Forms[i].WindowState := wsMaximized;
          Exit;
        end;
        Screen.Forms[i].Show;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    tmpForm.Show;
  end;

end;

function TfmMain.MDIForm(FormName: string): TForm;
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

procedure TfmMain.FormActivate(Sender: TObject);
begin
  inherited;
//  showmessage('Form Active');
  //SearchTimer.Enabled := True;
end;

procedure TfmMain.CommandArrayCommandsTDEVICESETTINGExecute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
begin
  stValue := Params.Values['VALUE'];

  if stValue = 'TRUE' then DeviceSettingView := True
  else DeviceSettingView := False;

end;

procedure TfmMain.SetDeviceSettingView(const Value: Boolean);
begin
  FDeviceSettingView := Value;
  //StateCheckTimer.Enabled := Value;
{  Action_DeviceSetting.Enabled := True;
  
  if Value then
  begin
    MessageTimer.Enabled := False;
    pan_Message.Visible := False;
  end;   }
end;

procedure TfmMain.SocketCreate;
begin

  dmSocket.OnPanelMessage:=   PanelMessage;
  dmSocket.OnNodeConnect:=    NodeConnect;
  dmSocket.OnConnectError:=    ConnectError;
  dmSocket.OnECUConnect:=    ECUConnect;
  dmSocket.OnPacketView:=     PacketView;
  dmSocket.OnServerModeConnect := ServerModeConnect;
  //알람이벤트
  dmSocket.OnAlarmEvent :=    AlarmEvent;
  dmSocket.OnFireRecovery :=    RcvFireRecovery;

  //등록정보
  dmSocket.OnDeviceIDSetting := DeviceIDData;
  dmSocket.OnCardReaderSetting := CardReaderSetData;
  dmSocket.OnCardReaderSoundSetting := CardReaderSoundSetting;
  dmSocket.OnCardReaderExitSoundSetting := CardReaderExitSoundSetting;
  dmSocket.OnSystemSetting := SystemSetData;
  dmSocket.OnLampSirenOnOff := LampSirenOnOff;
  dmSocket.OnLampTime := LampTimeSetData;
  dmSocket.OnSirenTime := SirenTimeSetData;
  dmSocket.OnPortSetting := PortSettingData;
  dmSocket.OnDeviceUsedSetting := DeviceUsedSettingData;
  dmSocket.OnWiznetInfoSetting := WiznetInfoSettingData;
  dmSocket.OnCardReaderTypeSetting := CardReaderTypeSettingData;
  dmSocket.OnDeviceState := DeviceStateData;
  dmSocket.OnCDMASetting := CDMASetting;
  dmSocket.OnCCCInfoSetting := CDMAInfoSetting;
  dmSocket.OnCCCTimeInterval := CCCTimeInterval;
  dmSocket.OnCCCStartTime := CCCStartTime;
  dmSocket.OnKTTSystemID := KTTSystemIDData;
  dmSocket.OnKTTTelNumber := KTTTelNumberData;
  dmSocket.OnKTTRingCount := KTTRingCountData;
  dmSocket.OnArmDsCheck := ArmDsCheckData;
  dmSocket.OnDoorDSCheckUse := RecvDoorDSCheckUse;
  dmSocket.OnDoorDSCheckTime := RecvDoorDSCheckTime;
  dmSocket.OnArmRelayCheck := ArmRelayCheckData;
  dmSocket.OnArmAreaUseData := ArmAreaUseData;
  dmSocket.OnDoorArmAreaData := DoorArmAreaData;
  dmSocket.OnDVRUseSetting := DVRUseSetting;
  dmSocket.OnDVRInfoSetting := DVRInfoSetting;
  dmSocket.OnCARDREADERTelNumber := CARDREADERTelNumberData;
  dmSocket.OnCARDREADERCallTime := CARDREADERCallTimData;
  dmSocket.OnRelay2TypeCheck := Relay2TypeCheckData;
  dmSocket.OnZoneExtensionPortInfoData := RcvZoneExtensionPortInfoData;
  dmSocket.OnZoneExtensionUseData := RcvZoneExtensionUseData;
  dmSocket.OnMemoryClearControl := RcvMemoryClearControl;
  dmSocket.OnJaejungDelayUse := RcvJaejungDelayUse;
  dmSocket.OnJavaraSchedule := RcvJavaraSchedule;
  dmSocket.OnJavaraArmClose := RcvJavaraArmClose;
  dmSocket.OnJavaraAutoClose := RcvJavaraAutoClose;
  dmSocket.onJavaraStopTime := RcvJavaraStopTime;
  dmSocket.OnPrimaryKTTType := RcvPrimaryKTTType;
  dmSocket.OnKTTMuxID := RcvKTTMuxID;
  dmSocket.OnDDNSQueryServer := RcvDDNSQueryServer;
  dmSocket.OnDDNSServer := RcvDDNSServer;
  dmSocket.OnEventServer := RcvEventServer;
  dmSocket.onTCPServerPort := RcvTCPServerPort;
  dmSocket.onServerCardNF := RcvServerCardNF;
  dmSocket.OnPoliceTelNum := RcvPoliceTelNum;
  dmSocket.OnDoorTimeCodeUse := RcvDoorTimeCodeUse;
  dmSocket.OnTimeCode := RcvTimeCode;


  //원격제어
  dmSocket.OnDeviceTime := DeviceTimeData;
  dmSocket.OnDeviceType := DeviceTypeData;
  dmSocket.OnMainToLocalArm := RecvMainToLocalArm;
  dmSocket.OnMainFromLocalArm := RecvMainFromLocalArm;
  dmSocket.OnDeviceCode := DeviceCodeData;
  dmSocket.OnSystemFunction := SystemFunctionData;
  dmSocket.OnDeviceVersion := DeviceVersionData;
  dmSocket.OnCardReaderVersion := CardReaderVersionData;
  dmSocket.OnDeviceReset := DeviceResetData;
  dmSocket.OnCardGrade := CardListSearchData;
  dmSocket.OnCardRegCardCNT := CardRegCardCNT;
  dmSocket.OnEcuState := EcuStateData;
  dmSocket.OnLineShortCheck := RecvLineShortCheck;
  dmSocket.OnCardAllClear := RecvCardAllClear;
  dmSocket.OnCardReaderState := CardReaderStateData;
  dmSocket.OnZoneExtentionNetworkState := ZoneExtentionNetworkStateData;
  dmSocket.OnZoneUseRemoteControl := RecvZoneUseRemoteControl;
  dmSocket.OnZoneExtentionVersion := ZoneExtentionVersionData;
  dmSocket.OnMaxCardCount := RecvMaxCardCount;
  dmSocket.OnLineCheckStart := RecvLineCheckStart;
  dmSocket.OnLineCheckTime := RecvLineCheckTime;
  dmSocket.OnGCU300_ICU300FirmwareDownloadState := RecvGCU300_ICU300FirmwareDownloadState;

  //출입통제
  dmSocket.OnCardAccessEvent:=CardAccessEvent;
  dmSocket.OnExitButtonEvent:=RcvExitButtonEvent;
  dmSocket.OnDoorEvent      :=DoorEvent;
  dmSocket.OnDoorSettingEvent := DoorSettingEvent;
  dmSocket.OnDoorState := DoorState;
  dmSocket.OnCardRegist := CardRegist;
  dmSocket.OnScheduleSetting := ScheduleData;
  dmSocket.OnHolidaySetting := HolidayData;
  //펌웨어
  dmSocket.OnGageMonitor := GageMonitor;
  dmSocket.OnFirmwareProcess := FirmwareProcess;
  dmSocket.OnFirmwareProcess2 := FirmwareProcess2;
  dmSocket.OnICU300FirmWareProcess := ICU300FirmWareProcess;
  dmSocket.OnPTMonitoringProcess := PTMonitoringProcess;
  dmSocket.OnKTT811FTPFirmWareDownloadComplete := ProcessKTT811FTPFirmWareDownloadComplete;
  //KTT812 FirmwareDownload
  dmSocket.OnKTT812FlashDataEvent := ProcessKTT812FlashData;
  dmSocket.OnKTT812FlashDataEndEvent := ProcessKTT812FlashDataEnd;
  dmSocket.OnKTT812EcuFirmWareDownloadComplete := ProcessKTT812EcuFirmWareDownloadComplete;
  dmSocket.OnKTT812EcuFirmWareDownloadFailed := ProcessKTT812EcuFirmWareDownloadFailed;
//}

end;

procedure TfmMain.ECUConnect(Sender: TObject; aEcuID: string;
  aConnected: Boolean);
var
  fmDeviceSetting :TForm;
  i : integer;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex > -1 then
  begin
    TCurrentDeviceState(DeviceList.Objects[nIndex]).Connected := aConnected;
  end;
  if aConnected then
  begin
    { //속도 개선에 따른 버젼 체크 부분은 빼도록 처리 함
    dmSocket.DeviceVersion_Check(aEcuID,False);
    //기기코드 확인
    dmSocket.DeviceCode_Check(aEcuID,False);
    }
    //시스템정보확인
    {dmSocket.SysInfo_Check(aEcuID,False);
    //리더정보 확인 - 리더 사용유무
    for i := 1 to FIXMAXREADERNO do
    begin
      dmSocket.CardReaderInfo_Check(aEcuID,inttostr(i),False);
    end;   }
    //출입문상태확인 --출입문 사용 유무 변경시 처리
  end else
  begin
    dmDataBase.TB_DEVICERCVClear(aEcuID);
  end;

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).ECUConnected(aEcuID,aConnected);
  end;

end;

procedure TfmMain.N4Click(Sender: TObject);
begin
  fmsregTConfig := TfmsregTConfig.Create(Self);
  fmsregTConfig.ShowModal;
  fmsregTConfig.Free;
//}
end;

procedure TfmMain.LoadZoneStatus;
var
  stFileName : string;
begin
  if ZoneStatusList = nil then ZoneStatusList := TStringList.Create;
  if ZoneStatusCodeList = nil then ZoneStatusCodeList := TStringList.Create;
  ZoneStatusmemoryInitialize;
end;
 
procedure TfmMain.ServerModeConnect(Sender: TObject);
begin
  NodeConnectTimer.Enabled := True;
end;

procedure TfmMain.NodeConnectTimerTimer(Sender: TObject);
var
  nLoop : integer;
begin
  NodeConnectTimer.Enabled := False;
  if Not dmSocket.NodeConnected then
  begin
    for nLoop := 0 to G_nLoopCount - 1 do
    begin
      if G_bApplicationTerminate then Exit;
      dmSocket.NodeConnected := dmSocket.ID_Check;
      if dmSocket.NodeConnected then
      begin
        Panel1.Caption := '메인 컨트롤러의 응답이 없습니다. 통신연결을 해제합니다.';
        dmSocket.SocketDisConnect;
        break;
      end;
    end;
  end;
//}
end;

procedure TfmMain.mn_LanModuleClick(Sender: TObject);
begin
  fmNetConfig:= TfmNetConfig.Create(Self);
  fmNetConfig.SHowmodal;
  fmNetConfig.Free;
//}
end;

procedure TfmMain.EcuStateData(Sender: TObject; aECUID, aData: string);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvEcuStateData(aECUID, aData);
  end;
{  Delete(aData,1,4);
  aData := UpperCase(aData);
  for i:= 1 to Length(aData) do
  begin
    if aData[i] = '1' then
    begin
      dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'DEVICEUSE','Y');
      dmSocket.ECUConnected(aEcuID,True);
    end else if aData[i] = '0' then
    begin
      dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'DEVICEUSE','Y');
      dmSocket.ECUConnected(aEcuID,False);
    end else if aData[i] = 'U' then
    begin
      dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'DEVICEUSE','N');
      //dmSocket.ECUConnected(aEcuID,False);
    end;
  end; }

end;

procedure TfmMain.CommandArrayCommandsTCARDEVENTVIEWExecute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
begin
  stValue := Params.Values['VALUE'];

  if stValue = 'TRUE' then CardEventView := True
  else CardEventView := False;

end;

procedure TfmMain.Action_CardRegExecute(Sender: TObject);
var
  fmDeviceSetting : TForm;
begin
{  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).DoorTypeCheck;
  end;
}
  MDIChildShow('TfmCardReg');
end;

procedure TfmMain.CardDownloadTimerTimer(Sender: TObject);
var
  nIndex : integer;
  nCardIndex : integer;
  nDeviceIndex : integer;
  nSeq : integer;
  ECUCardSeqList : TStringList;
  MCUCardSeqList : TStringList;
  CardDataDownLoadList : TStringList;
  i : integer;
  fmCardReg : TForm;
  nMaxCount : integer;
begin
  nIndex := DeviceList.IndexOf('00');
  if nIndex < 0 then Exit;
  if L_bCardMemorySaving then Exit;

  Try
    CardDownloadTimer.Enabled := False;
    ECUCardSeqList := TStringList.Create;
    MCUCardSeqList := TStringList.Create;
    dmSocket.CardFull := False;

    with dmDataBase.TB_CARDPERMIT do
    begin
      First;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if FindField('RCVACK').AsString = 'N' then
        begin
          nSeq := FindField('seq').AsInteger;
          if FindField('ECUID').AsString = '00' then
          begin
            nDeviceIndex := DeviceList.IndexOf(FindField('ECUID').AsString);
            if nDeviceIndex > -1 then
            begin
              if TCurrentDeviceState(DeviceList.Objects[nDeviceIndex]).Connected then
              begin
                CardDataDownLoadList := TStringList.Create;
                CardDataDownLoadList.Clear;
                CardDataDownLoadList.Add(FindField('ECUID').AsString);
                CardDataDownLoadList.Add(FindField('CARDNO').AsString);
                CardDataDownLoadList.Add(FindField('PERMIT').AsString);
                CardDataDownLoadList.Add(FindField('DOOR1').AsString);
                CardDataDownLoadList.Add(FindField('DOOR2').AsString);
                CardDataDownLoadList.Add(FindField('DOOR3').AsString);
                CardDataDownLoadList.Add(FindField('DOOR4').AsString);
                CardDataDownLoadList.Add(FindField('DOOR5').AsString);
                CardDataDownLoadList.Add(FindField('DOOR6').AsString);
                CardDataDownLoadList.Add(FindField('DOOR7').AsString);
                CardDataDownLoadList.Add(FindField('DOOR8').AsString);
                CardDataDownLoadList.Add(FindField('ALARM').AsString);
                CardDataDownLoadList.Add(FindField('ALARM1').AsString);
                CardDataDownLoadList.Add(FindField('ALARM2').AsString);
                CardDataDownLoadList.Add(FindField('ALARM3').AsString);
                CardDataDownLoadList.Add(FindField('ALARM4').AsString);
                CardDataDownLoadList.Add(FindField('ALARM5').AsString);
                CardDataDownLoadList.Add(FindField('ALARM6').AsString);
                CardDataDownLoadList.Add(FindField('ALARM7').AsString);
                CardDataDownLoadList.Add(FindField('ALARM8').AsString);
                CardDataDownLoadList.Add(FindField('VALIDDATE').AsString);
                CardDataDownLoadList.Add(FindField('CARDTYPE').AsString);
                CardDataDownLoadList.Add(TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType);
                CardDataDownLoadList.Add(FindField('CARDPOSITIONTYPE').AsString);
                CardDataDownLoadList.Add(FindField('POSITIONNUM').AsString);

                nCardIndex := MCUCardSeqList.IndexOf(FillZeroNumber(nSeq,9));
                if nCardIndex < 0 then MCUCardSeqList.AddObject(FillZeroNumber(nSeq,9),CardDataDownLoadList);
              end;
            end;
          end else
          begin
            nDeviceIndex := DeviceList.IndexOf(FindField('ECUID').AsString);
            if nDeviceIndex > -1 then
            begin
              if TCurrentDeviceState(DeviceList.Objects[nDeviceIndex]).Connected then
              begin
                CardDataDownLoadList := TStringList.Create;
                CardDataDownLoadList.Clear;
                CardDataDownLoadList.Add(FindField('ECUID').AsString);
                CardDataDownLoadList.Add(FindField('CARDNO').AsString);
                CardDataDownLoadList.Add(FindField('PERMIT').AsString);
                CardDataDownLoadList.Add(FindField('DOOR1').AsString);
                CardDataDownLoadList.Add(FindField('DOOR2').AsString);
                CardDataDownLoadList.Add(FindField('DOOR3').AsString);
                CardDataDownLoadList.Add(FindField('DOOR4').AsString);
                CardDataDownLoadList.Add(FindField('DOOR5').AsString);
                CardDataDownLoadList.Add(FindField('DOOR6').AsString);
                CardDataDownLoadList.Add(FindField('DOOR7').AsString);
                CardDataDownLoadList.Add(FindField('DOOR8').AsString);
                CardDataDownLoadList.Add(FindField('ALARM').AsString);
                CardDataDownLoadList.Add(FindField('ALARM1').AsString);
                CardDataDownLoadList.Add(FindField('ALARM2').AsString);
                CardDataDownLoadList.Add(FindField('ALARM3').AsString);
                CardDataDownLoadList.Add(FindField('ALARM4').AsString);
                CardDataDownLoadList.Add(FindField('ALARM5').AsString);
                CardDataDownLoadList.Add(FindField('ALARM6').AsString);
                CardDataDownLoadList.Add(FindField('ALARM7').AsString);
                CardDataDownLoadList.Add(FindField('ALARM8').AsString);
                CardDataDownLoadList.Add(FindField('VALIDDATE').AsString);
                CardDataDownLoadList.Add(FindField('CARDTYPE').AsString);
                CardDataDownLoadList.Add(TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType);
                CardDataDownLoadList.Add(FindField('CARDPOSITIONTYPE').AsString);
                CardDataDownLoadList.Add(FindField('POSITIONNUM').AsString);

                nCardIndex := ECUCardSeqList.IndexOf(FillZeroNumber(nSeq,9));
                if nCardIndex < 0 then ECUCardSeqList.AddObject(FillZeroNumber(nSeq,9),CardDataDownLoadList);
              end;
            end;
          end;
        end;
        Application.ProcessMessages;
        Next;
      end;
      if (ECUCardSeqList.Count + MCUCardSeqList.Count) < 1 then Exit;
      nMaxCount := ECUCardSeqList.Count + MCUCardSeqList.Count;
      if CardRegView then
      begin
        fmCardReg := MDIForm('TfmCardReg');
        TfmCardReg(fmCardReg).DownLoadCount(0,nMaxCount,True);
      end;
      ECUCardSeqList.Sort;
      MCUCardSeqList.Sort;
      for i := 0 to ECUCardSeqList.Count - 1 do
      begin
        //FieldStatus_ComStatus.Caption := ECUCardSeqList.Strings[i];
        //Delay(1000);
        if G_bApplicationTerminate then Exit;
        dmSocket.CardDownLoad(TStringList(ECUCardSeqList.Objects[i]).Strings[0],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[1],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[2],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[3],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[4],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[5],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[6],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[7],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[8],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[9],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[10],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[11],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[12],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[13],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[14],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[15],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[16],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[17],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[18],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[19],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[20],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[21],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[22],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[23],
                              TStringList(ECUCardSeqList.Objects[i]).Strings[24]);
        if CardRegView then
        begin
          fmCardReg := MDIForm('TfmCardReg');
          TfmCardReg(fmCardReg).DownLoadCount(i,nMaxCount,True);
        end;
        Application.ProcessMessages;
      end;
      for i := 0 to MCUCardSeqList.Count - 1 do
      begin
        //FieldStatus_ComStatus.Caption := ECUCardSeqList.Strings[i];
        //Delay(1000);
        if G_bApplicationTerminate then Exit;
        dmSocket.CardDownLoad(TStringList(MCUCardSeqList.Objects[i]).Strings[0],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[1],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[2],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[3],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[4],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[5],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[6],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[7],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[8],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[9],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[10],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[11],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[12],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[13],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[14],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[15],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[16],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[17],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[18],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[19],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[20],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[21],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[22],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[23],
                              TStringList(MCUCardSeqList.Objects[i]).Strings[24]
                              );
        if CardRegView then
        begin
          fmCardReg := MDIForm('TfmCardReg');
          TfmCardReg(fmCardReg).DownLoadCount(ECUCardSeqList.Count + i,nMaxCount,True);
        end;
        Application.ProcessMessages;
      end;
      if CardRegView then
      begin
        fmCardReg := MDIForm('TfmCardReg');
        TfmCardReg(fmCardReg).DownLoadCount(nMaxCount,nMaxCount,False);
      end;
      for i := ECUCardSeqList.Count - 1 downto 0 do
      begin
        if G_bApplicationTerminate then Exit;
        TStringList(ECUCardSeqList.Objects[i]).Free;
      end;
      ECUCardSeqList.Clear;
      for i := MCUCardSeqList.Count - 1 downto 0 do
      begin
        if G_bApplicationTerminate then Exit;
        TStringList(MCUCardSeqList.Objects[i]).Free;
      end;
      MCUCardSeqList.Clear;
{              dmSocket.CardDownLoad(FindField('ECUID').AsString,
                                  FindField('CARDNO').AsString,
                                  FindField('PERMIT').AsString,
                                  FindField('DOOR1').AsString,
                                  FindField('DOOR2').AsString,
                                  FindField('DOOR3').AsString,
                                  FindField('DOOR4').AsString,
                                  FindField('DOOR5').AsString,
                                  FindField('DOOR6').AsString,
                                  FindField('DOOR7').AsString,
                                  FindField('DOOR8').AsString,
                                  FindField('ALARM').AsString,
                                  FindField('ALARM1').AsString,
                                  FindField('ALARM2').AsString,
                                  FindField('ALARM3').AsString,
                                  FindField('ALARM4').AsString,
                                  FindField('ALARM5').AsString,
                                  FindField('ALARM6').AsString,
                                  FindField('ALARM7').AsString,
                                  FindField('ALARM8').AsString,
                                  FindField('VALIDDATE').AsString,
                                  FindField('CARDTYPE').AsString,
                                  TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType
                                  );   }
    end; //}
  Finally
    if Not G_bApplicationTerminate then
    begin
      CardDownloadTimer.Enabled := True;
      ECUCardSeqList.Free;
      MCUCardSeqList.Free;
    end;
  End;
end;

procedure TfmMain.Action_ScheduleRegExecute(Sender: TObject);
begin
  MDIChildShow('TfmSchedule');
end;

procedure TfmMain.Action_HolidayExecute(Sender: TObject);
begin
  MDIChildShow('TForm_Holiday');
end;

procedure TfmMain.CommandArrayCommandsTSCHEDULEVIEWExecute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
begin
  stValue := Params.Values['VALUE'];

  if stValue = 'TRUE' then SCHEDULEVIEW := True
  else SCHEDULEVIEW := False;

end;

procedure TfmMain.CommandArrayCommandsTHolidayViewExecute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
begin
  stValue := Params.Values['VALUE'];

  if stValue = 'TRUE' then HolidayVIEW := True
  else HolidayVIEW := False;
end;

procedure TfmMain.mn_WatchCodeClick(Sender: TObject);
begin
  fmWatchCode := TfmWatchCode.Create(Self);
  fmWatchCode.ShowModal;
  fmWatchCode.Free;
  LoadZoneStatus;

end;

procedure TfmMain.ZoneStatusMemoryToTable;
var
  i : integer;
  stTemp : string;
  stCode : string;
begin
  for i := 0 to ZoneStatusList.Count - 1 do
  begin
    stTemp := ZoneStatusList.Strings[i];
    stCode := inttostr(i);
    dmDataBase.InsertIntoTB_WATCHCODE(stCode,stTemp);
  end;

end;

procedure TfmMain.ZoneStatusmemoryInitialize;
begin
  ZoneStatusList.Clear;
  ZoneStatusList.Add('방범--경계');
  ZoneStatusList.Add('화재--24시간');
  ZoneStatusList.Add('가스--24시간');
  ZoneStatusList.Add('비상--24시간');
  ZoneStatusList.Add('설비--24시간');
  ZoneStatusList.Add('============');
  ZoneStatusList.Add('방범--재중');
  ZoneStatusCodeList.Clear;
  ZoneStatusCodeList.Add('');
  ZoneStatusCodeList.Add('FI');
  ZoneStatusCodeList.Add('G1');
  ZoneStatusCodeList.Add('E1');
  ZoneStatusCodeList.Add('Q1');
  ZoneStatusCodeList.Add('CL');
//  ZoneStatusCodeList.Add('');
  ZoneStatusMemoryToTable;
end;

procedure TfmMain.Action_DeviceFileSaveExecute(Sender: TObject);
var
  filename : string;
begin
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  if SaveDialog1.Execute then
  begin
   filename := SaveDialog1.FileName;
   dmDBBackupAndRecovery.DeviceTabletoFile(filename);
  end;
end;


procedure TfmMain.Action_DeviceFileLoadExecute(Sender: TObject);
var
  stfilename : string;
  fmDeviceSetting :TForm;
  nResult : integer;
begin
  Try
    OpenDialog1.DefaultExt:= 'CSV';
    OpenDialog1.Filter := 'Text files (*.CSV)|*.CSV';
    if OpenDialog1.Execute then
    begin
     stfilename := OpenDialog1.FileName;
     Screen.Cursor:= crHourGlass;
     Panel1.Visible := True;
     Panel1.Color := clYellow;
     Panel1.Caption := '기기정보 파일 로딩 중입니다.';
     nResult := dmDBBackupAndRecovery.FileToInsertDeviceTable(stfilename);
     if nResult = -1 then
     begin
        showmessage('현재 지원 포맷이 아닙니다. 구버젼으로 다운그레이드 후 작업 하세요.');
        Exit;
     end;
     G_bDeviceSearch := False;
    end;
    if DeviceSettingView then
    begin
      fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
      TfmCurrentDeviceSetting(fmDeviceSetting).DeviceLoad;
    end;
  Finally
    Screen.Cursor:= crDefault;
    Panel1.Visible := False;
  end;
end;


procedure TfmMain.N14Click(Sender: TObject);
var
  stExec:string;
begin
  stExec := ExtractFileDir(Application.ExeName) + '\SmartUpdate.exe';
  if FileExists(stExec) then
  begin
    My_RunDosCommand(stExec,True,False);
    L_bProgramClose := True;
    Close;
  end;
end;

procedure TfmMain.mn_StateClick(Sender: TObject);
begin
  MDIChildShow('TfmCurrentState');
end;

procedure TfmMain.CommandArrayCommandsTCURRENTSTATEExecute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
begin
  stValue := Params.Values['VALUE'];

  if stValue = 'TRUE' then CurrentStateView := True
  else CurrentStateView := False;

end;

procedure TfmMain.CommandArrayCommandsTSettingChangeExecute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
  fmCardReg : TForm;
  fmSchedule : TForm;
begin
  stValue := Params.Values['VALUE'];
  fmCardReg := MDIForm('TfmCardReg');
  if fmCardReg <> nil then
  begin
    TfmCardReg(fmCardReg).SettingChange;
  end;

  fmSchedule := MDIForm('TfmSchedule');
  if fmSchedule <> nil then
  begin
    TfmSchedule(fmSchedule).SettingChange;
  end;

end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if L_bProgramClose then Exit;

{  if btnDeviceDisConnect.Enabled then
  begin
    showmessage('현재 컨트롤러와 통신 중입니다. 통신연결 해제 후 종료 하세요.');
    CanClose := False;
  end;  }
end;

procedure TfmMain.CommandArrayCommandsTCardRegViewExecute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
begin
  stValue := Params.Values['VALUE'];

  if stValue = 'TRUE' then CardRegView := True
  else CardRegView := False;

end;

procedure TfmMain.mn_CardEventClick(Sender: TObject);
begin
  MDIChildShow('TfmCardEvent');

end;

procedure TfmMain.CDMASetting(Sender: TObject; aEcuID, aData: string);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CDMASetting(aEcuID,aData);
  end;
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'CDMAUSE',aData[1]);
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'CDMAUSE','Y');

end;

procedure TfmMain.CDMAInfoSetting(Sender: TObject; aEcuID, aData: string);
var
  fmDeviceSetting :TForm;
  stTemp : string;
  stCdmaMin : string;
  stCdmaMux : string;
  stCdmaIP : string;
  stCdmaPort : string;
  stCdmachktime : string;
  stCdmarssi : string;
begin
  stTemp  := FindCharCopy(aData, 0, '}');
  stCdmaMin := stTemp;
  stTemp  := FindCharCopy(aData, 1, '}');
  stCdmaMux := stTemp;
  stTemp  := FindCharCopy(aData, 2, '}');
  stCdmaIP := stTemp;
  stTemp  := FindCharCopy(aData, 3, '}');
  stCdmaPort := stTemp;
  stTemp  := FindCharCopy(aData, 4, '}');
  stCdmachktime := stTemp;
  stTemp  := FindCharCopy(aData, 5, '}');
  stCdmarssi := stTemp;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CDMAInfoSetting(aEcuID,stCdmaMin,stCdmaMux,stCdmaIP,stCdmaPort,stCdmachktime,stCdmarssi);
  end;
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'CDMAMIN',stCdmaMin);
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'CDMAMUX',stCdmaMux);
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'CDMAIP',stCdmaIP);
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'CDMAPORT',stCdmaPort);
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'CDMACHECKTIME',stCdmachktime);
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'CDMARSSI',stCdmarssi);

  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'CDMAMIN','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'CDMAMUX','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'CDMAIP','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'CDMAPORT','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'CDMACHECKTIME','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'CDMARSSI','Y');

end;

procedure TfmMain.CCCTimeInterval(Sender: TObject; aEcuID, aData: string);
var
  fmDeviceSetting :TForm;
begin
{  if isDigit(aData) then aData := inttostr(strtoint(aData))
  else aData := '0';
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CCCTimeInterval(aEcuID,aData);
  end;
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'CCCTIMEINTERVAL',aData);
}
end;

procedure TfmMain.CCCStartTime(Sender: TObject; aEcuID, aData: string);
var
  fmDeviceSetting :TForm;
begin
{  if isDigit(aData) then aData := inttostr(strtoint(aData))
  else aData := '0';
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CCCStartTime(aEcuID,aData);
  end;
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'CCCSTARTTIME',aData);
}
end;

procedure TfmMain.LoadDeviceTypeName;
begin
  DeviceTypeNameList.Clear;
  DeviceTypeNameList.Add('');
  DeviceTypeNameList.Add('ECU-100');
  DeviceTypeNameList.Add('ECU-200');
  DeviceTypeNameList.Add('ICU-100');
  DeviceTypeNameList.Add('ICU-200');
  DeviceTypeNameList.Add('ICU-300');
  DeviceTypeNameList.Add('ACC-100');
  DeviceTypeNameList.Add('ECU-300');
  DeviceTypeNameList.Add('ECU-4000');
end;

procedure TfmMain.DeviceListAdd(aEcuID: string);
var
  oCurrentDeviceState : TCurrentDeviceState;
  nIndex : integer;
  fmDeviceSetting :TForm;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex > -1 then Exit;
  oCurrentDeviceState := TCurrentDeviceState.Create(self);
  oCurrentDeviceState.ECUID := aEcuID;
  oCurrentDeviceState.OnDeviceChange := CurrentDeviceChange;
  oCurrentDeviceState.OnConnected := CurrentDeviceConnected;
  oCurrentDeviceState.OnAlarmModeChange := CurrentDeviceAlarmModeChange;
  oCurrentDeviceState.OnDoorTypeChange := CurrentDeviceDoorTypeChange;
  oCurrentDeviceState.OnDoorStateChange := CurrentDeviceDoorStateChange;
  oCurrentDeviceState.OnReaderUseChange := CurrentDeviceReaderUseChange;
  oCurrentDeviceState.OnReaderConnectChange := CurrentDeviceReaderConnectChange;
  oCurrentDeviceState.OnDeviceCodeChange := CurrentDeviceCodeChange;
  oCurrentDeviceState.OnDeviceTypeChange := CurrentDeviceTypeChange;
  oCurrentDeviceState.OnCDMAUseChange := CurrentCDMAUseChange;
  oCurrentDeviceState.OnDvrUseChange := CurrentDVRUseChange;
  oCurrentDeviceState.OnScheduleUseChange := CurrentScheduleUseChange;
  oCurrentDeviceState.OnCARDREADERTELUseChange := CurrentCARDREADERTELUseChange;
  oCurrentDeviceState.OnCardTypeChange := CurrentCardTypeChange;
  oCurrentDeviceState.OnArmExtensionChange := ArmExtensionChange;
  oCurrentDeviceState.OnMaxECUCountChange := MaxECUCountChange;
  oCurrentDeviceState.OnDoorDSCheckTimeUseChange := DoorDSCheckTimeUseChange;
  oCurrentDeviceState.OnDoorArmDSCheckUseChange := DoorArmDSCheckUseChange;
  oCurrentDeviceState.OnDoorLockExtensionUseChange := DoorLockExtensionUseChange;
  oCurrentDeviceState.OnArmAreaSkillChange := ArmAreaSkillChange;
  oCurrentDeviceState.OnArmAreaUseChange := ArmAreaUseChange;
  oCurrentDeviceState.OnZoneExtensionSkillChange := ZoneExtensionSkillChange;
  oCurrentDeviceState.OnDoorPossibilityChange := DoorPossibilityChange;
  oCurrentDeviceState.OnPortZoneUseSkillChange := PortZoneUseSkillChange;
  oCurrentDeviceState.OnZoneExtensionConnectChange := ZoneExtensionConnectChange;
  oCurrentDeviceState.OnPortZoneUseRemoteControlSkill := PortZoneUseRemoteControlSkill;
  oCurrentDeviceState.OnPoliceDeviceTypeChange := PoliceDeviceTypeChange;
  oCurrentDeviceState.OnJavaraScheduleSkillChange := JavaraScheduleSkillChange;

  DeviceList.AddObject(aEcuID,oCurrentDeviceState);
  DeviceList.Sort;

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CurrentDeviceView;
  end;

end;

procedure TfmMain.DeviceListDelete(aEcuID: string);
var
  nIndex : integer;
  fmDeviceSetting :TForm;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TCurrentDeviceState(DeviceList.Objects[nIndex]).Free;
  DeviceList.Delete(nIndex);  

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CurrentDeviceView;
  end;
end;

procedure TfmMain.CurrentDeviceChange(Sender: TObject;aEcuID,aNo:string; aChange: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if Not aChange then  Exit;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
//    TfmCurrentDeviceSetting(fmDeviceSetting).CurrentDeviceView;
  end;

end;

procedure TfmMain.CurrentDeviceConnected(Sender: TObject;aEcuID,aNo:string;
  aConnected: Boolean);
var
  fmDeviceSetting :TForm;
  nIndex : integer;
  i : integer;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CurrentDeviceConnected(aEcuID,aConnected);
  end;
  if Not aConnected then
  begin
    nIndex := DeviceList.IndexOf(aEcuID);
    if nIndex < 0 then Exit;
    for i := 1 to FIXMAXDOORNO do
    begin
      TCurrentDeviceState(DeviceList.Objects[nIndex]).SetDoorState(inttostr(i),' ',' ',' ',' ');
    end;
    for i := 1 to FIXMAXREADERNO do
    begin
      TCurrentDeviceState(DeviceList.Objects[nIndex]).setReaderConnected(i,False);
    end;
  end;
end;

procedure TfmMain.CurrentDeviceAlarmModeChange(Sender: TObject;
  aEcuID,aNo: string; aChange: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if Not aChange then Exit;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CurrentDeviceAlarmModeChange(aEcuID,aChange);
  end;

end;

procedure TfmMain.CurrentDeviceDoorTypeChange(Sender: TObject; aEcuID,
  aNo: string; aUse: Boolean);
var
  fmDeviceSetting :TForm;
  fmCardReg : TForm;
begin

  if aUse then
  begin
    //여기에서 출입문 상태를 확인하자.
    dmSocket.DoorState_Check(aEcuID,Trim(aNo),False);
  end;

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).DoorUseChange(aEcuID,aNo,aUse);
  end;
  if CardRegView then
  begin
    fmCardReg := MDIForm('TfmCardReg');
    TfmCardReg(fmCardReg).SettingChange;
  end;

end;

procedure TfmMain.CurrentDeviceDoorStateChange(Sender: TObject; aEcuID,
  aNo: string; aChange: Boolean);
var
  fmDeviceSetting :TForm;
begin

  if Not aChange then Exit;

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CurrentDeviceDoorStateChange(aEcuID,aNo);
  end;

end;

procedure TfmMain.CurrentDeviceReaderUseChange(Sender: TObject; aEcuID,
  aNo: string; aUse: Boolean);
begin
  if aUse then
  begin
    //여기에서 카드리더 버젼을 체크 하자.
    dmSocket.CardReaderVersion_Check(aEcuID,Trim(aNo),False);
  end;

end;

procedure TfmMain.CurrentDeviceReaderConnectChange(Sender: TObject; aEcuID,
  aNo: string; aConnected: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CurrentDeviceReaderConnectChange(aEcuID,aNo,aConnected);
  end;

end;

procedure TfmMain.DeviceListStateClear;
var
  i : integer;
begin
  for i:= DeviceList.Count -1 downto 0 do
  begin
    TCurrentDeviceState(DeviceList.Objects[i]).Free;
    DeviceList.Delete(i);
  end;
  DeviceListAdd('00');
end;

procedure TfmMain.DeviceTypeInitialize;
var
  i : integer;
begin
  for i:= 0 to HIGH(G_stDeviceType)  do
  begin
    G_stDeviceType[i] := '0';
  end;
end;

procedure TfmMain.DeviceCodeData(Sender: TObject; aECUID,
  aDeviceCode: string);
var
  fmDeviceSetting :TForm;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex > -1 then
  begin
    TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceCode := aDeviceCode;
  end;
  dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'DEVICE_CODE',aDeviceCode);
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'DEVICE_CODE','Y');
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvDeviceCode(aECUID,aDeviceCode);
  end;

end;

procedure TfmMain.KTTSystemIDData(Sender: TObject; aEcuID, aData: string);
var
  fmDeviceSetting :TForm;
begin
  dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'SYSTEM_ID',aData);
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'SYSTEM_ID','Y');
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).KTTSystemIDData(aECUID,aData);
  end;

end;

procedure TfmMain.KTTTelNumberData(Sender: TObject; aEcuID, aNo,
  aTelNum: string);
var
  fmDeviceSetting :TForm;
begin
  if Not isDigit(aNo) then Exit;
  if strtoint(aNo) = 0 then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'Linkus_Tel',aTelNum);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'Linkus_Tel','Y');
  end else if strtoint(aNo) = 1 then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'Linkus_Tel2',aTelNum);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'Linkus_Tel2','Y');
  end;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).KTTTelNumberData(aECUID,aNo,aTelNum);
  end;
end;

procedure TfmMain.KTTRingCountData(Sender: TObject; aEcuID, aArmRingCount,
  aDisArmRingCount: string);
var
  fmDeviceSetting :TForm;
begin
  if isDigit(aArmRingCount) then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'Ring_Cnt',aArmRingCount);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'Ring_Cnt','Y');
  end;
  if isDigit(aDisArmRingCount) then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'Ring_CancelCnt',aDisArmRingCount);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'Ring_CancelCnt','Y');
  end;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).KTTRingCountData(aECUID,aArmRingCount,aDisArmRingCount);
  end;

end;

procedure TfmMain.DeviceVersionChange(aEcuID, aVersion: string);
begin

end;

procedure TfmMain.CurrentDeviceCodeChange(Sender: TObject; aEcuID,
  aDeviceCode: string; aChange: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CurrentDeviceCodeChange(aEcuID,aDeviceCode);
  end;

end;

procedure TfmMain.CurrentDeviceTypeChange(Sender: TObject; aEcuID,
  aDeviceType: string; aChange: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if Trim(aDeviceType) = '' then Exit;
  if aEcuID = '00' then
  begin
    if aDeviceType = KTT812 then
    begin
      mn_FirmWareUpdate.Visible := True;
    end else if (aDeviceType = KTT811) or (aDeviceType = KTT813) then
    begin
      mn_FirmWareUpdate.Visible := True;
    end;
  end;
  G_stDeviceType[strtoint(aEcuID)] := aDeviceType;
  dmDatabase.UpdateTB_DEVICE_FieldName(aEcuID,'DEVICE_TYPE',aDeviceType);
  dmDatabase.UpdateTB_DEVICERCV_FieldName(aEcuID,'DEVICE_TYPE','Y');
  if aChange then
  begin
    if DeviceSettingView then
    begin
      fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
      TfmCurrentDeviceSetting(fmDeviceSetting).DeviceTypeChange(aEcuID,aDeviceType);
      TfmCurrentDeviceSetting(fmDeviceSetting).RecvDeviceType('');
    end;
  end;

end;

procedure TfmMain.ActionDeviceTimerTimer(Sender: TObject);
var
  fmDeviceSetting :TForm;
begin
  ActionDeviceTimer.Enabled := False;
//  Action_DeviceSettingExecute(self);
  Panel1.Visible := False;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).DeviceRefresh;
  end;

end;

procedure TfmMain.ArmDsCheckData(Sender: TObject; aEcuID, aDoorNo,
  aArmCheck: string);
var
  fmDeviceSetting :TForm;
begin
  if isDigit(aArmCheck) then
  begin
    dmDataBase.UpdateTB_DOORSETTING_FieldName(aEcuID,aDoorNo,'ArmDSCheck',aArmCheck);
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aEcuID,aDoorNo,'ArmDSCheck','Y');
  end;

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).ArmDsCheckData(aECUID,aDoorNo,aArmCheck);
  end;
end;

procedure TfmMain.ArmRelayCheckData(Sender: TObject; aEcuID, aNo,
  aArmRelay: string);
var
  fmDeviceSetting :TForm;
begin
  if isDigit(aArmRelay) then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'ArmRelay',aArmRelay);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'ArmRelay','Y');
  end;

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).ArmRelayCheckData(aECUID,aArmRelay);
  end;

end;

procedure TfmMain.DVRUseSetting(Sender: TObject; aEcuID, aData: string);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).DVRUseSetting(aEcuID,aData);
  end;
  if aData <> '' then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'DVRUSE',aData[1]);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'DVRUSE','Y');
  end;

end;

procedure TfmMain.DVRInfoSetting(Sender: TObject; aEcuID, aData: string);
var
  fmDeviceSetting :TForm;
  stTemp : string;
  stDvrIP : string;
  stDvrPort : string;
begin
  stDvrIP  := FindCharCopy(aData, 0, ' ');
  stDvrPort  := FindCharCopy(aData, 1, ' ');
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'DVRIP',stDvrIP);
  dmDataBase.UpdateTB_DEVICE_FieldName(aEcuID,'DVRPORT',stDvrPort);

  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'DVRIP','Y');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'DVRPORT','Y');

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).DVRInfoSetting(aEcuID,stDvrIP,stDvrPort);
  end;

end;

procedure TfmMain.CurrentDVRUseChange(Sender: TObject; aEcuID, aNo: string;
  aUsed: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if aEcuID = '00' then
    mn_dvrMonitoring.Visible := aUsed;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CurrentDVRUseChange(aEcuID,aUsed);
  end;

end;

procedure TfmMain.CurrentCARDREADERTELUseChange(Sender: TObject; aEcuID,
  aNo: string; aChange: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CurrentCARDREADERTELUseChange(aEcuID,aChange);
  end;

end;

procedure TfmMain.CARDREADERTelNumberData(Sender: TObject; aEcuID, aNo,
  aTelNum: string);
var
  fmDeviceSetting :TForm;
begin
  if Not isDigit(aNo) then Exit;
  dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'CARDREADERTEL' + inttostr(strtoint(aNo)),aTelNum);
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'CARDREADERTEL' + inttostr(strtoint(aNo)),'Y');
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CARDREADERTelNumberData(aECUID,aNo,aTelNum);
  end;
end;

procedure TfmMain.CurrentCardTypeChange(Sender: TObject; aEcuID,
  aCardType: string; aChange: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CurrentCardTypeChange(aEcuID,aCardType);
  end;
  if Not ConnectDeviceCardTypeCheck then
  begin
    Status_CardEvent.Caption := '호환되지 않는 카드 타입의 컨트롤러가 있습니다. 컨트롤러 버젼을 확인 하여 주시기 바랍니다.';
    Status_CardEvent.Font.Color := clRed;
    Status_CardEvent.Visible := True;
    //pan_Message.Visible := True;
    MessageTimer.Enabled := True;
  end else
  begin
    MessageTimer.Enabled := False;
    Status_CardEvent.Caption := '';
  end;

end;

function TfmMain.ConnectDeviceCardTypeCheck: Boolean;
var
  i : integer;
  stOldCardType : string;
begin
  result := False;
  stOldCardType := '';

  for i := 0 to DeviceList.Count - 1 do
  begin
    if Not TCurrentDeviceState(DeviceList.Objects[i]).Connected then continue;
    if stOldCardType = '' then stOldCardType := TCurrentDeviceState(DeviceList.Objects[i]).CardType;
    if stOldCardType = COMMON811 then
    begin
      if TCurrentDeviceState(DeviceList.Objects[i]).CardType <> NOTHINGTYPE then
      begin
        if TCurrentDeviceState(DeviceList.Objects[i]).CardType <> COMMON811 then Exit;
      end;
    end else if stOldCardType = KT811 then
    begin
      if TCurrentDeviceState(DeviceList.Objects[i]).CardType <> NOTHINGTYPE then
      begin
        if TCurrentDeviceState(DeviceList.Objects[i]).CardType <> KT811 then Exit;
      end;
    end else if stOldCardType = UNIVER811 then
    begin
      if TCurrentDeviceState(DeviceList.Objects[i]).CardType <> NOTHINGTYPE then
      begin
        if TCurrentDeviceState(DeviceList.Objects[i]).CardType <> UNIVER811 then Exit;
      end;
    end else if stOldCardType = MERGECARD then
    begin
      if TCurrentDeviceState(DeviceList.Objects[i]).CardType <> NOTHINGTYPE then
      begin
        if TCurrentDeviceState(DeviceList.Objects[i]).CardType <> MERGECARD then Exit;
      end;
    end;
  end;

  result := True;
end;

procedure TfmMain.MessageTimerTimer(Sender: TObject);
begin
  inherited;
  Status_CardEvent.Visible := Not Status_CardEvent.Visible;
  //pan_Message.Visible := Not pan_Message.Visible;
end;

function TfmMain.ClientModeSetting(aDeviceIP: string;
  aServerMode: integer;aFinish:Boolean=False): Boolean;
var
  PastTime : dword;
  i : integer;
  bZeronDefaultPort : Boolean;
begin
  if Not aFinish then L_nOrgWiznetServerMode := -1;
  Try
    Panel1.Visible := True;
    Panel1.Color := clYellow;
    //Panel1.Caption := '컨트롤러 LAN설정 확인 중입니다.';
    bZeronDefaultPort := True;
    for i:= 0 to 2 do
    begin
      Panel1.Caption := '컨트롤러 LAN설정 확인 중입니다(' + inttostr(i+1) + ')';
      if WiznetModuleSearch(aDeviceIP,TCPCLIENTPORT) then   //WiznetModule를 조회 하자.
      begin
        bZeronDefaultPort := True;
        break;
      end else
      begin
        if WiznetModuleSearch(aDeviceIP,TCPCLIENTKTTPORT) then
        begin
          bZeronDefaultPort := False;
          break;
        end;
      end;
    end;
{    result := false;
    ClientSocket1.Active := False;
    Delay(200);
    ClientSocket1.Host:= aDeviceIP;
    ClientSocket1.Port := TCPCLIENTPORT;
    PastTime := GetTickCount + 5000;  //Connect 될때까지 대기하자

    L_bDirectClientConnect := False;

    ClientSocket1.Active:= True;
    while Not L_bDirectClientConnect do
    begin
      Application.ProcessMessages;
      if GetTickCount > PastTime then
      begin
        Exit;  //300밀리동안 응답 없으면 실패로 처리함
      end;
    end;


    L_bDirectSearch := False;
    L_stWiznetData := '';
    ClientSocket1.Socket.SendText('FIND');
    PastTime := GetTickCount + 5000;  //Connect 될때까지 대기하자
    while Not L_bDirectSearch do
    begin
      Application.ProcessMessages;
      if GetTickCount > PastTime then
      begin
        Exit;  //300밀리동안 응답 없으면 실패로 처리함
      end;
    end;    }

    if L_stWiznetData = '' then Exit;
    if aServerMode = 2 then
    begin
      if L_stWiznetData[11] = #$02 then  //현재가 서버모드이면서
      begin
        if L_stWiznetData[49] = #$0 then  // DisConnected 상태 이면 바로 접속
        begin
          result := True;  //이미 클라이언트 모드 이므로 설정 할 필요 없다- 서버와 통신중이면 설정해야 됨
          Exit;
        end;
      end else
      begin
        if Not aFinish then L_nOrgWiznetServerMode := 0; //현재가 클라이언트 모드임
      end;
    end else if aServerMode = 0 then
    begin
      if L_stWiznetData[11] = #$00 then  //현재가 클라이언트모드이면서
      begin
        if L_stWiznetData[49] = #$0 then  // DisConnected 상태 이면 바로 접속
        begin
          result := True;  //이미 클라이언트 모드 이므로 설정 할 필요 없다- 서버와 통신중이면 설정해야 됨
          Exit;
        end;
      end else
      begin
        if Not aFinish then L_nOrgWiznetServerMode := 2; //현재가 서버 모드임
      end;
    end;

    for i:= 0 to 2 do
    begin
      if bZeronDefaultPort then
      begin
        if WiznetModuleSetting(aDeviceIP,L_stWiznetData,aServerMode,TCPCLIENTPORT) then   //WiznetModule를 설정 하자.
        begin
          result := True;
          Exit;
        end;
      end else
      begin
        if WiznetModuleSetting(aDeviceIP,L_stWiznetData,aServerMode,TCPCLIENTKTTPORT) then   //WiznetModule를 설정 하자.
        begin
          result := True;
          Exit;
        end;
      end;
    end;

  Finally
    Panel1.Visible := False;
  End;

end;

procedure TfmMain.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  L_bDirectClientConnect := True;

end;

procedure TfmMain.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  L_bDirectClientConnect := False;

end;

procedure TfmMain.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  ErrorCode := 0;
  L_bDirectClientConnect := False;

end;

procedure TfmMain.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
var
  I: Integer;
  S: string;
begin

  S:= Socket.ReceiveText;

  if  Length(S) < 47 then Exit;

  L_stWiznetData:= S;
  {MAC Address}

  if (copy(S,1,4) <> 'IMIN') and (copy(S,1,4) <> 'SETC')
     and (copy(S,1,4) <> 'LNDT') and (copy(S,1,4) <> 'LNSD')
  then Exit;
{
04945    IMIN --> LNDT,    SETT --> LNSV,    SETC --> LNSD 로 변경 함.
04946    Wiznet IIM7100A tool은 Open Tool 및 source 이므로 누구나 사용할 수 있어서 기기가 많이 설치될 경우
04947    Wiznwet IIM7100A 로 Zeron기기의 LAN 정보를 변경 할 수 있기 때문에 Data를 달리 사용 하도록 함.
04948    
04949    //변경전                                          변경후
04950    
04951                    PC        w3100a                                PC        w3100a
04952    
04953        < UDP >     |               |                   < UDP >     |               |
04954                    |               |                               |               |
04955    Search    5001  | FIND -->      |  1460         Search    5001  | FIND -->      |  1460
04956              5001  |  <-- IMIN#### |  1460                   5001  |  <-- LNDT#### |  1460
04957                    |               |                               |               |
04958    Setting   5001  | SETT#### -->  |  1460         Setting   5001  | LNSV#### -->  |  1460
04959              5001  |  <-- SETC#### |  1460                   5001  |  <-- LNSD#### |  1460
04960                    |               |                               |               |
04961                    |               |                               |               |
04962        < TCP >     |               |                   < TCP >     |               |
04963                    |               |                               |               |
04964    Search    ????  | FIND -->      |  1461         Search    ????  | FIND -->      |  1461
04965              ????  |  <-- IMIN#### |  1461                   ????  |  <-- LNDT#### |  1461
04966                    |               |                               |               |
04967    Setting   ????  | SETT#### -->  |  1461         Setting   ????  | LNSV#### -->  |  1461
04968              ????  |  <-- SETC#### |  1461                   ????  |  <-- LNSD#### |  1461
04969                    |               |
}

  if (copy(S,1,4) = 'IMIN') or (copy(S,1,4) = 'SETC') then L_bWiznetZeronType := False
  else L_bWiznetZeronType := True;

  if L_stWiznetData[11] = #$00 then L_nDeviceServerMode := 0
  else if L_stWiznetData[11] = #$01 then L_nDeviceServerMode := 1
  else if L_stWiznetData[11] = #$02 then L_nDeviceServerMode := 2;

  //lb_RomVer.Caption := InttoStr(Ord(L_stWiznetData[45]))+'.'+InttoStr(Ord(L_stWiznetData[46]));
  L_stDeviceRomVer := InttoStr(Ord(L_stWiznetData[45])) + InttoStr(Ord(L_stWiznetData[46]));

  //Wiznet 접속을 끊는다.
  //if (OnWritewiznet = True) and ClientSocket1.Active  then
  //begin
  if ClientSocket1.Active  then
  begin
    ClientSocket1.Active:= False;
    L_bDirectSearch := True;
  end;
end;

function TfmMain.WiznetModuleSetting(aDeviceIP, aWiznetData: string;
  aServerMode,aPort:integer): Boolean;
var
  PastTime : dword;
begin
  if Not L_bWiznetZeronType then
  begin
    aWiznetData[1]:='S';
    aWiznetData[2]:='E';
    aWiznetData[3]:='T';
    aWiznetData[4]:='T';
  end else
  begin
    aWiznetData[1]:='L';
    aWiznetData[2]:='N';
    aWiznetData[3]:='S';
    aWiznetData[4]:='V';
  end;

  if aServerMode = 2 then
     aWiznetData[11] := #$02
  else if aServerMode = 0 then aWiznetData[11] := #$00
  else Exit;

  L_bDirectSearch := False;
  ClientSocket1.Active := False;
  ClientSocket1.Host:= aDeviceIP;
  ClientSocket1.Port := aPort;
  Delay(200);
  ClientSocket1.Active:= True;
  PastTime := GetTickCount + 5000;  //Connect 될때까지 대기하자
  while Not L_bDirectClientConnect do
  begin
    Application.ProcessMessages;
    if GetTickCount > PastTime then
    begin
      Exit;  //300밀리동안 응답 없으면 실패로 처리함
    end;
  end;
  if Not L_bDirectClientConnect then Exit;
  ClientSocket1.Socket.SendText(aWiznetData);
  PastTime := GetTickCount + 5000;  //Connect 될때까지 대기하자
  while Not L_bDirectSearch do
  begin
    Application.ProcessMessages;
    if GetTickCount > PastTime then
    begin
      Exit;  //300밀리동안 응답 없으면 실패로 처리함
    end;
  end;
  result := True;

end;

procedure TfmMain.mn_FirmWareUpdateClick(Sender: TObject);
var
  nIndex : integer;
  bFirmWareChange : Boolean;
  bOldDeviceSearch : Boolean;
begin
  inherited;
  Try
    bOldDeviceSearch := G_bDeviceSearch;
    G_bDeviceSearch := False; //기기 실시간 조회를 정지 하자
    //메인 컨트롤러의 기기정보를 확인하여
    nIndex := DeviceList.IndexOf('00');
    if nIndex < 0 then Exit;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).Connected then Exit;
    if (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT811) or (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT813) then
    begin
      //시리얼 접속인지 체크
      if G_nConnectMode = 1 then
      begin
        //시리얼 펌웨어
        fmFirmware := TfmFirmware.Create(Self);
        fmFirmware.ShowModal;
        fmFirmware.Free;
      end else
      begin
        //무조건 FTP Firmware Download
        fmFTPFirmware := TfmFTPFirmware.Create(Self);
        fmFTPFirmware.ShowModal;
        bFirmWareChange := fmFTPFirmware.L_bFirmWareChange;
        fmFTPFirmware.Free;
        if bFirmWareChange then
        begin
          bFirmWareChange := False;
          fmFirmware := TfmFirmware.Create(Self);
          fmFirmware.ShowModal;
          fmFirmware.Free;
        end;
        //FTP 가능 버젼인지 체크 하자...
        {if dmSocket.CheckFTP('00') then
        begin
          if dmSocket.FTPUSE then
          begin
            fmFTPFirmware := TfmFTPFirmware.Create(Self);
            fmFTPFirmware.ShowModal;
            bFirmWareChange := fmFTPFirmware.L_bFirmWareChange;
            fmFTPFirmware.Free;
            if bFirmWareChange then
            begin
              fmFirmware := TfmFirmware.Create(Self);
              fmFirmware.ShowModal;
              fmFirmware.Free;
            end;
          end else
          begin
            //시리얼 펌웨어
            fmFirmware := TfmFirmware.Create(Self);
            fmFirmware.ShowModal;
            fmFirmware.Free;
          end;
        end else
        begin
          //시리얼 펌웨어
          fmFirmware := TfmFirmware.Create(Self);
          fmFirmware.ShowModal;
          fmFirmware.Free;
        end; }
      end;
    end else if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
    begin
      //812 펌웨어 업데이트
      fm812Firmware := Tfm812Firmware.Create(Self);
      fm812Firmware.ShowModal;
      fm812Firmware.Free;
    end;
  Finally
    G_bDeviceSearch := bOldDeviceSearch;
  End;
end;

procedure TfmMain.GageMonitor(Sender: TObject; aECUID, aNo, aData: string);
begin
  if L_bFTPFirmWareSendShow then
  begin
    fmFTPFirmware.GageMonitor(aECUID,aData);
  end;
  if L_bKTT812FirmwareDownLoadShow then
  begin
    fm812Firmware.GageMonitor(aECUID,aData);
  end;

end;

procedure TfmMain.FirmwareProcess(Sender: TObject; aECUID, aNo,
  aData: string);
begin
  if L_bFirmWareSendShow then
  begin
    fmFirmware.FirmwareProcess(aECUID,aData);
  end;
end;

procedure TfmMain.FirmwareProcess2(Sender: TObject; aECUID, aNo,
  aData: string);
begin
  if L_bFirmWareSendShow then
  begin
    fmFirmware.FirmwareProcess2(aECUID,aData);
  end;
end;

function TfmMain.WiznetModuleSearch(aDeviceIP: string;aPort:integer): Boolean;
var
  PastTime : dword;
begin
    result := false;
    ClientSocket1.Active := False;
    Delay(200);
    ClientSocket1.Host:= aDeviceIP;
    ClientSocket1.Port := aPort;
    PastTime := GetTickCount + 5000;  //Connect 될때까지 대기하자

    L_bDirectClientConnect := False;
    Try
      ClientSocket1.Active:= True;
      while Not L_bDirectClientConnect do
      begin
        Application.ProcessMessages;
        if GetTickCount > PastTime then
        begin
          Exit;  //300밀리동안 응답 없으면 실패로 처리함
        end;
      end;

      L_bDirectSearch := False;
      L_stWiznetData := '';
      ClientSocket1.Socket.SendText('FIND');
      PastTime := GetTickCount + 5000;  //Connect 될때까지 대기하자
      while Not L_bDirectSearch do
      begin
        Application.ProcessMessages;
        if GetTickCount > PastTime then
        begin
          Exit;  //300밀리동안 응답 없으면 실패로 처리함
        end;
      end;
    Finally
      ClientSocket1.Active := False;
    End;
    result := True;
end;

procedure TfmMain.mn_LinkusSateMonitoringClick(Sender: TObject);
begin
  MDIChildShow('TfmLinkusStateCheck');

end;

procedure TfmMain.PTMonitoringProcess(Sender: TObject; aECUID, aNo,
  aData: string);
var
  stGubun : string;
  fmLinkusStateCheck :TForm;
  fmCdmaStateCheck :TForm;
  fmDVRStateCheck :TForm;
begin
  stGubun := copy(aData,3,2);
  if (stGubun = '01') or (stGubun = '04') or (stGubun = '06') then
  begin
    if L_bLinkusStateCheckShow then
    begin
      fmLinkusStateCheck := MDIForm('TfmLinkusStateCheck');
      TfmLinkusStateCheck(fmLinkusStateCheck).LinkusStateMonitoring(aData,stGubun);
    end;
  end else if stGubun = '04' then
  begin
    if L_bCdmaStateCheckShow then
    begin
      fmCdmaStateCheck := MDIForm('TfmCdmaStateCheck');
      TfmCdmaStateCheck(fmCdmaStateCheck).CdmaStateMonitoring(aData);
    end;
  end else if stGubun = '05' then
  begin
    if L_bDVRStateCheckShow then
    begin
      fmDVRStateCheck := MDIForm('TfmDVRStateCheck');
      TfmDVRStateCheck(fmDVRStateCheck).DVRStateMonitoring(aData);
    end;
  end;
end;

procedure TfmMain.mn_cdmaMonitoringClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmCdmaStateCheck');

end;

procedure TfmMain.mn_dvrMonitoringClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmDVRStateCheck');

end;

procedure TfmMain.CurrentCDMAUseChange(Sender: TObject; aEcuID,
  aNo: string; aUsed: Boolean);
var
  fmDeviceSetting :TForm;
begin
//  if aEcuID = '00' then
//    mn_cdmaMonitoring.Visible := aUsed;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CurrentCDMAUseChange(aEcuID,aUsed);
  end;

end;

procedure TfmMain.mn_deviceVerClick(Sender: TObject);
begin
  MDIChildShow('TfmDeviceVersion');
end;

procedure TfmMain.mn_cardVerClick(Sender: TObject);
begin
  MDIChildShow('TfmCardReaderVersion');

end;

procedure TfmMain.ProcessKTT812FlashData(Sender: TObject; aECUID,
  aData: string);
begin
  if L_bKTT812FirmwareDownLoadShow then
  begin
    fm812Firmware.ProcessKTT812FlashData(aData);
  end;
end;

procedure TfmMain.ProcessKTT812FlashDataEnd(Sender: TObject; aECUID,
  aData: string);
begin
//  memo1.Lines.Add(aEcuID + ':' + '(fx01)KTT812FlashDataEnd');
  if L_bKTT812FirmwareDownLoadShow then
  begin
    fm812Firmware.ProcessKTT812FlashDataEnd;
  end;
end;

procedure TfmMain.ProcessKTT812EcuFirmWareDownloadComplete(Sender: TObject;
  aECUID, aData: string);
begin
//  memo1.Lines.Add(aEcuID + ':' + '(f88)FirmWareDownloadComplete');
  if L_bKTT812FirmwareDownLoadShow then
  begin
    fm812Firmware.ProcessKTT812EcuFirmWareDownloadComplete(aECUID);
  end;
end;

procedure TfmMain.StateCheckTimerTimer(Sender: TObject);
var
  i : integer;
  j : integer;
begin
  StateCheckTimer.Enabled := False;
  //Exit;
  Try
    StateCheckTimer.Enabled := False;
    for i := 0 to DeviceList.Count - 1 do
    begin
      if TCurrentDeviceState(deviceList.Objects[i]).Connected then
      begin
        if TCurrentDeviceState(deviceList.Objects[i]).AlarmMode = cmNothing then
        begin
          dmSocket.AlarmState_Check(deviceList.Strings[i],0,False);
        end;
        for j:=1 to TCurrentDeviceState(deviceList.Objects[i]).MaxDoorNo do
        begin
          if TCurrentDeviceState(deviceList.Objects[i]).GetDoorUsed(j)
          and (TCurrentDeviceState(deviceList.Objects[i]).GetDoorState(j) = dsNothing) then
          begin
            dmSocket.DoorState_Check(deviceList.Strings[i],inttostr(j),False);
          end;
        end;   
      end;
    end;
  Finally
    if dmSocket.SocketConnected then
       StateCheckTimer.Enabled := True;
  End;
end;

procedure TfmMain.mn_AllDisArmClick(Sender: TObject);
begin
  if Application.MessageBox(pchar('전체 해제시 모든 컨트롤러에 적용 됩니다. 계속 진행하시겠습니까?'),'주의',MB_OKCANCEL) = ID_CANCEL then Exit;
  dmSocket.AllDeviceArmMode('D');

end;

procedure TfmMain.mn_AllFireRecoveryClick(Sender: TObject);
begin
  inherited;
  dmSocket.AllFireRecovery;
end;

procedure TfmMain.ConnectError(Sender: TObject; aConnected: Boolean);
begin
  ReconnectSocketTimer.Enabled := True;
end;

procedure TfmMain.ProcessKTT811FTPFirmWareDownloadComplete(Sender: TObject;
  aECUID, aData: string);
begin
  if L_bFTPFirmWareSendShow then
  begin
    fmFTPFirmware.ProcessKTT811FTPFirmWareDownloadComplete(aECUID);
  end;

end;

procedure TfmMain.CommandArrayCommandsTACCESSEVENTExecute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
begin
  stValue := Params.Values['VALUE'];

  if stValue = 'TRUE' then AccessEventView := True
  else AccessEventView := False;

end;

procedure TfmMain.N9Click(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmAccessEvent');

end;

procedure TfmMain.N10Click(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmAlarmEvent');

end;

procedure TfmMain.CommandArrayCommandsTALARMEVENTExecute(Command: TCommand;
  Params: TStringList);
var
  stValue : string;
begin
  stValue := Params.Values['VALUE'];

  if stValue = 'TRUE' then AlarmEventView := True
  else AlarmEventView := False;

end;

procedure TfmMain.SearchTimerTimer(Sender: TObject);
begin
  inherited;
  Try
    SearchTimer.Interval := 1000;
    SearchTimer.Enabled := False;
    if Not G_bDeviceSearch then Exit; //실시간 조회가 아닌 경우 조회 하지 말자.
    SearchDeviceInfo;
  Finally
    if Not G_bApplicationTerminate and SocketConnected then SearchTimer.Enabled := True;
  End;
end;

procedure TfmMain.SearchDeviceInfo;
var
  i :integer;
  stEcuID : string;
  bResult : Boolean;
begin
  if dmSocket.GetSearchBufferCount > 0 then Exit;
  for i := 0 to 63 do
  begin
    if G_bApplicationTerminate then Exit;
    stEcuID := FillZeroNumber(i,2);
    if dmDataBase.GetTB_DEVICE_Value(stEcuID,'DEVICEUSE') = 'Y' then
    begin
      bResult := CheckDeviceInfo(stEcuID);
      if bResult then Exit;
    end;
  end;
end;

function TfmMain.CheckDeviceInfo(aEcuID: string): Boolean;
var
  nIndex : integer;
  i : integer;
begin
  result := False;
  if dmDataBase.GetTB_DEVICE_Value(aEcuID,'DEVICEUSE') = 'N' then Exit; //사용하지 않는 컨트롤러면 빠져 나감
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).Connected then Exit; //연결중이 아니면 빠져 나가자.
  result := True;
  if aEcuID = '00' then
  begin
//    if UsedDeviceTypeSearch(aEcuID) then Exit;
//    if KTTSystemIDSearch(aEcuID) then Exit;
//    if KTTTelNumSearch('0',aDirect) then Exit;
  end;

  SearchDeviceVersionCheck(aEcuID);
  SearchDeviceCodeCheck(aEcuID);


  if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
  begin
    if SearchRelay2TypeCheck(aEcuID) then Exit;
  end;
  if SystemInfoSearch(aEcuID) then Exit;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT811 then
  begin
    if SearchArmRelay(aEcuID) then Exit;
  end;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
  begin
    for i := 1 to TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo do
    begin
      if (i = 2) and (TCurrentDeviceState(DeviceList.Objects[nIndex]).RELAY2TYPE = 0) then continue;
      if SearchArmDsCheck(aEcuID,inttostr(i)) then Exit;
    end;
  end;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then //존확장기사용유무
  begin
    if SystemZoneExtensionUseSearch(aEcuID) then Exit;
  end;

  if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill then
  begin
    SearchArmAreaUseCheck(aEcuID);
    SearchDoorArmArea(aEcuID);
  end;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo > 0 then
  begin
    if DoorSystemInfoSearch(aEcuID,'1') then Exit;
  end;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo > 1 then
  begin
    if DoorSystemInfoSearch(aEcuID,'2') then Exit;
  end;
  if (G_stDeviceType[strtoint(aEcuID)] <> ICU100) and
     (G_stDeviceType[strtoint(aEcuID)] <> ICU200) then  //ICU는 카드리더가 없다.
  begin
    if CardReaderTypeSearch(aEcuID) then Exit;
    for i := 1 to TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxReaderNo do
    begin
      if CardReaderInfoSearch(aEcuID,i) then exit;
    end;
  end;
  for i := 1 to TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxPortNo do
  begin
    if PortInfoSearch(aEcuID,i) then Exit;
  end;
  if AlartLampSirenStateCheck(aEcuID) then Exit;
  if AlertLampTimeCheck(aEcuID) then Exit;
  if AlertSirenTimeCheck(aEcuID) then Exit;

  result := False; //이 컨트롤러는 송신할 내역이 없다.
end;

function TfmMain.UsedDeviceTypeSearch(aEcuID: string): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'DEVICE_TYPE') <> 'N' then Exit;
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'DEVICE_TYPE','S');
  dmSocket.DeviceType_Check(False,3);
  result := True;
end;

function TfmMain.KTTSystemIDSearch(aEcuID: string): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'SYSTEM_ID') <> 'N' then Exit;
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'SYSTEM_ID','S');
  dmSocket.KTTSystemIDSearch(False,3);
  result := True;
end;

function TfmMain.SystemInfoSearch(aEcuID: string): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'WATCH_POWER') <> 'N' then Exit;
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'WATCH_POWER','S');
  dmSocket.SysInfo_Check(aEcuID,False,3);
  result := True;
end;

function TfmMain.SearchArmRelay(aEcuID: string): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ArmRelay') <> 'N' then Exit;
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'ArmRelay','S');
  dmSocket.SearchArmRelay(aEcuID,False,3);
  result := True;
end;

function TfmMain.SearchArmDsCheck(aEcuID, aDoorNo: string): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_DOORSETTINGRCV_Value(aEcuID,'0',aDoorNo,'ArmDSCheck') <> 'N' then Exit;
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aEcuID,aDoorNo,'ArmDSCheck','S');
  dmSocket.SearchArmDsCheck(aEcuID,aDoorNo,False,3);
  result := True;
end;

function TfmMain.DoorSystemInfoSearch(aEcuID, aDoorNo: string): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_DOORSETTING_Value(aEcuID,'0',aDoorNo,'CARD_TYPE') <> 'N' then Exit;
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aEcuID,aDoorNo,'CARD_TYPE','S');
  dmSocket.DoorSystemInfo_Check(aEcuID,aDoorNo,False,3);
  result := True;

end;

function TfmMain.CardReaderTypeSearch(aEcuID: string): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'CARDREADER_TYPE') <> 'N' then Exit;
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'CARDREADER_TYPE','S');
  dmSocket.CardReaderType_Check(aEcuID,False,3);
  result := True;
end;

function TfmMain.CardReaderInfoSearch(aEcuID: string;
  aReaderNo: integer): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_READERSETTINGRCV_Value(aEcuID,'0',inttostr(aReaderNo),'READER_USE') <> 'N' then Exit;
  dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(aEcuID,'0',inttostr(aReaderNo),'READER_USE','S');
  dmSocket.CardReaderInfo_Check(aEcuID,inttostr(aReaderNo),False,3);
  result := True;

end;

function TfmMain.PortInfoSearch(aEcuID: string; aPortNo: integer): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_ZONESETTINGRCV_Value(aEcuID,'0',inttostr(aPortNo),'PORT_TYPE') <> 'N' then Exit;
  dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(aEcuID,'0',inttostr(aPortNo),'PORT_TYPE','S');
  dmSocket.PortInfo_Check(aEcuID,inttostr(aPortNo),False,3);
  result := True;
end;

function TfmMain.AlartLampSirenStateCheck(aEcuID: string): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONE_SIRENONOFF') <> 'N' then Exit;
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'ZONE_SIRENONOFF','S');
  dmSocket.AlartLampSirenStateCheck(aEcuID,False,3);
  result := True;
end;

function TfmMain.AlertLampTimeCheck(aEcuID: string): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONE_LAMPONTIME') <> 'N' then Exit;
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'ZONE_LAMPONTIME','S');
  dmSocket.AlertLampTimeCheck(aEcuID,False,3);
  result := True;
end;

function TfmMain.AlertSirenTimeCheck(aEcuID: string): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONE_SIRENONTIME') <> 'N' then Exit;
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'ZONE_SIRENONTIME','S');
  dmSocket.AlertSirenTimeCheck(aEcuID,False,3);
  result := True;
end;

procedure TfmMain.Relay2TypeCheckData(Sender: TObject; aEcuID, aCmd,
  aRelay2Type: string);
var
  fmDeviceSetting :TForm;
  nIndex : integer;
begin
  if isDigit(aRelay2Type[3]) then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'DOOR2_RELAY',aRelay2Type[3]);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'DOOR2_RELAY','Y');
    nIndex := DeviceList.IndexOf(aEcuID);
    if nIndex > -1 then
    begin
      TCurrentDeviceState(DeviceList.Objects[nIndex]).RELAY2TYPE := strtoint(aRelay2Type[3]);
      if strtoint(aRelay2Type[3]) = 0 then TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxPortNo := FIXMAXZONENO
      else TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxPortNo := 5;
    end;
  end;

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).Relay2TypeCheckData(aECUID,aCmd,aRelay2Type);
  end;

end;

function TfmMain.SearchRelay2TypeCheck(aEcuID: string): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'DOOR2_RELAY') <> 'N' then Exit;
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'DOOR2_RELAY','S');
  dmSocket.SearchRelay2TypeCheck(aEcuID,False,3);
  result := True;
end;

procedure TfmMain.CARDREADERCallTimData(Sender: TObject; aEcuID, aCallTime,
  aTemp: string);
var
  fmDeviceSetting :TForm;
begin
  if Not isDigit(aCallTime) then Exit;
  dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'CARDREADER_CALLTIME',aCallTime);
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'CARDREADER_CALLTIME' ,'Y');
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CARDREADERCallTimData(aECUID,aCallTime);
  end;
end;

procedure TfmMain.MCUStateCheckTimerTimer(Sender: TObject);
begin
  inherited;
  MCUStateCheckTimer.Enabled := False;
  if dmDataBase.GetTB_DEVICERCV_Value('00','DEVICEUSE') = 'N' then //소켓 접속 후 바로
  begin
    if SocketConnected then
    begin
      inc(L_nConnectRetryCount);
      if L_nConnectRetryCount > G_nLoopCount then
      begin
        (*
          2015년 8월 27일 윤부장님 요청에 의해 응답이 없으면 통신연결을 해제한다.
        *)
        Panel1.Caption := '메인 컨트롤러의 응답이 없습니다. 통신연결을 해제합니다.';
        dmSocket.SocketDisConnect;
        L_nConnectRetryCount := 0;
        Delay(1000);
        Panel1.Visible := False;
        Exit;
      end;
      dmSocket.UsedDevice_Check(True);
      dmSocket.EcuStatusCheck;
      MCUStateCheckTimer.Interval := 100;
      MCUStateCheckTimer.Enabled := True;
    end;
  end else
  begin
    if dmDataBase.GetTB_DEVICERCV_Value('00','DEVICE_TYPE') = 'N' then
    begin
      if SocketConnected then
      begin
        dmSocket.DeviceType_Check(False);  //Device_type 은 응답이 없는 놈이 있을수 있음
      end;
    end;
    ActionDeviceTimer.Enabled := True;
  end;
end;

procedure TfmMain.ArmExtensionChange(Sender: TObject; aEcuID,
  aValue: string; aChange: Boolean);
var
  bValue : Boolean;
  fmDeviceSetting :TForm;
begin
  if aValue = 'TRUE' then bValue := True
  else bValue := False;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).ArmExtensionChange(aEcuID,bValue);
  end;  

end;

procedure TfmMain.MaxECUCountChange(Sender: TObject; aEcuID,
  aValue: string; aChange: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if aEcuID <> '00' then Exit;
  if isdigit(aValue) then
    G_nMaxEcuCount := strtoint(aValue);

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).MaxECUCountChange(aEcuID,aValue);
  end;
end;

procedure TfmMain.RecvMainToLocalArm(Sender: TObject; aECUID,
  aData: string);
var
  fmDeviceSetting :TForm;
  nIndex : integer;
  bUsed : Boolean;
  i : integer;
  stExtensionGubun : string; //0:미사용,1:메인경계시로컬경계,2:로컬경계시메인경계
  bEvent : Boolean;
  stRecv : string;
begin
  bUsed := False;
  bEvent := False;
  stExtensionGubun := '0';
  stRecv := 'Y';// 일단은 수신한것으로 인정
  for i := 1 to Length(aData) - 1 do
  begin
    if aData[i+1] = '1' then
    begin
      bUsed := True;
      break;
    end;
  end;
  if bUsed then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'ArmExtensionData',aData);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'ArmExtensionData','Y');
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'ArmExtensionGubun','1');
    stExtensionGubun := '1';
    bEvent := True; //화면 이벤트 발생

    bUsed := False;
    for i := 1 to Length(dmSocket.MainFromLocalArmDevice) - 1 do
    begin
      if aData[i+1] = '1' then
      begin
        bUsed := True;
        break;
      end;
    end;
    if bUsed then
    begin
      //여기서 메시지 표시 두가지 기능을 모두 사용하고 있는 경우로 재등록 필요
    end;

  end else
  begin
    bUsed := False;
    for i := 1 to Length(dmSocket.MainFromLocalArmDevice) - 1 do
    begin
      if dmSocket.MainFromLocalArmDevice[i+1] = '1' then
      begin
        bUsed := True;
        break;
      end;
    end;
    if Not bUsed then
    begin
      dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'ArmExtensionGubun','0');  //사용안함
      stRecv := 'N'; //둘다 사용중이 아니면 미수신으로 설정
      stExtensionGubun := '0';
      bEvent := True; //화면 미사용 이벤트 발생
    end;
  end;
  {
  if Not bEvent then
  begin
    Exit;
  end;  }

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvArmExtension(aECUID,stExtensionGubun,aData,bEvent);
  end;
  if bEvent then
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'ArmExtensionGubun',stRecv);

end;

procedure TfmMain.RecvMainFromLocalArm(Sender: TObject; aECUID,
  aData: string);
var
  fmDeviceSetting :TForm;
  nIndex : integer;
  bUsed : Boolean;
  i : integer;
  stExtensionGubun : string; //0:미사용,1:메인경계시로컬경계,2:로컬경계시메인경계
  bEvent : Boolean;
  stRecv : string;
begin
  bUsed := False;
  bEvent := False;
  stExtensionGubun := '0';
  stRecv := 'Y';// 일단은 수신한것으로 인정
  for i := 1 to Length(aData) - 1 do
  begin
    if aData[i+1] = '1' then
    begin
      bUsed := True;
      break;
    End;
  end;
  if bUsed then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'ArmExtensionData',aData);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'ArmExtensionData','Y');
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'ArmExtensionGubun','2');
//    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'ArmExtensionGubun','Y');
    stExtensionGubun := '2';
    bEvent := True; //화면 이벤트 발생

    bUsed := False;
    for i := 1 to Length(dmSocket.MainToLocalArmDevice) - 1 do
    begin
      if aData[i+1] = '1' then
      begin
        bUsed := True;
        break;
      end;
    end;
    if bUsed then
    begin
      //여기서 메시지 표시 두가지 기능을 모두 사용하고 있는 경우로 재등록 필요
    end;

  end else
  begin
    bUsed := False;
    for i := 1 to Length(dmSocket.MainToLocalArmDevice) - 1 do
    begin
      if dmSocket.MainToLocalArmDevice[i+1] = '1' then
      begin
        bUsed := True;
        break;
      end;
    end;
    if Not bUsed then
    begin
      dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'ArmExtensionGubun','0');  //사용안함
      stRecv := 'N'; //둘다 사용중이 아니면 미수신으로 설정
      stExtensionGubun := '0';
      bEvent := True; //화면 미사용 이벤트 발생
    end;
  end;

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvArmExtension(aECUID,stExtensionGubun,aData,bEvent);
  end;
  if bEvent then
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'ArmExtensionGubun',stRecv);
end;

procedure TfmMain.DoorArmDSCheckUseChange(Sender: TObject; aEcuID,
  aTemp: string; aValue: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).DoorArmDSCheckUseChange(aEcuID,aValue);
  end;
end;

procedure TfmMain.DoorDSCheckTimeUseChange(Sender: TObject; aEcuID,
  aTemp: string; aValue: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).DoorDSCheckTimeUseChange(aEcuID,aValue);
  end;
end;

procedure TfmMain.DoorLockExtensionUseChange(Sender: TObject; aEcuID,
  aTemp: string; aValue: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).DoorLockExtensionUseChange(aEcuID,aValue);
  end;

end;

procedure TfmMain.ArmAreaSkillChange(Sender: TObject; aEcuID,
  aTemp: string; aValue: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).ArmAreaSkillChange(aEcuID,aValue);
  end;

end;

procedure TfmMain.ArmAreaUseChange(Sender: TObject; aEcuID, aTemp: string;
  aValue: Boolean);
var
  fmDeviceSetting :TForm;
  fmCardReg : TForm;
begin
  //수신되는 부분에서 디스플레이
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).ArmAreaUseChange(aEcuID,aValue,False);
  end;
{  if CardRegView then
  begin
    fmCardReg := MDIForm('TfmCardReg');
    TfmCardReg(fmCardReg).ArmAreaUseData(aECUID,aValue);
  end;   //}
end;

procedure TfmMain.ArmAreaUseData(Sender: TObject; aEcuID, aNo,
  aArmUse: string);
var
  fmDeviceSetting :TForm;
  fmCardReg : TForm;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex > -1 then
  begin
    if aArmUse = '1' then
      TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse := True
    else TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse := False;
  end;
  if isDigit(aArmUse) then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(aECUID,'ArmAreaUse',aArmUse);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'ArmAreaUse','Y');
  end;

   //상태 변경 이벤트에 의해서 디스플레이 시키니 수정 후 조회 되는 경우 이벤트 발생 하지 않음
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).ArmAreaUseData(aECUID,aArmUse);
  end;
  if CardRegView then
  begin
    fmCardReg := MDIForm('TfmCardReg');
    TfmCardReg(fmCardReg).ArmAreaUseData(aECUID,aArmUse);
  end;   //}

end;

function TfmMain.SearchArmAreaUseCheck(aEcuID: string): Boolean;
var
  nIndex : integer;
begin
  result := False;
  if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ArmAreaUse') <> 'N' then Exit;
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'ArmAreaUse','S');

  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex > -1 then
  begin
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill then
    begin
      dmSocket.SearchArmAreaUse(aEcuID,False,3);
    end;
  end;

  result := True;
end;

procedure TfmMain.DoorArmAreaData(Sender: TObject; aEcuID, aNo,
  aDoorArmData: string);
var
  stTemp : string;
  i : integer;
  stIndex : string;
  fmDeviceSetting : TForm;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;

  stTemp := Trim(aDoorArmData);
  for i:= 1 to FIXMAXDOORNO do
  begin
    stIndex := FindCharCopy(stTemp,i - 1,' ');
    if Not isDigit(stIndex) then stIndex := '00';
    TCurrentDeviceState(DeviceList.Objects[nIndex]).SetDoorArmArea(inttostr(i),strtoint(stIndex));
    stIndex := inttostr(strtoint(stIndex));
    if DeviceSettingView then
    begin
      fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
      TfmCurrentDeviceSetting(fmDeviceSetting).RecvDoorArmAreaData(aECUID,inttostr(i),stIndex);
    end;
    dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,inttostr(i),'DOORARMAREA',stIndex);
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,inttostr(i),'DOORARMAREA','Y');
  end;

end;

procedure TfmMain.RcvZoneExtensionPortInfoData(Sender: TObject; aECUID,
  aCmd, aData: string);
var
  fmDeviceSetting :TForm;
  nIndex : integer;
  nZoneExtNo : integer;
  nZoneExtUse : integer; //0:미사용,1:사용
  arrZoneState : array[0..FIXMAXZONENO - 1] of string;
  arrZoneType : array[0..FIXMAXZONENO - 1] of string;
  arrZoneArmArea : array[0..FIXMAXZONENO - 1] of string;
  arrZoneRecover : array[0..FIXMAXZONENO - 1] of string;
  arrZoneUsed : array[0..FIXMAXZONENO - 1] of string;
  i : integer;
  stHexData : string;
  stBinaryData : string;
begin
  if Not isDigit(copy(aData,1,2)) then Exit;
  nZoneExtNo := strtoint(copy(aData,1,2));
  if isDigit(aData[3]) then
    nZoneExtUse := strtoint(aData[3])
  else nZoneExtUse := 0;

  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex > -1 then
  begin
    TCurrentDeviceState(DeviceList.Objects[nIndex]).SetZoneExtentionUse(inttostr(nZoneExtNo),inttostr(nZoneExtUse));
  end;

  dmDatabase.UpdateTB_DEVICE_FieldName(aECUID,'ZONEEXTENSIONUSE' + inttostr(nZoneExtNo),inttostr(nZoneExtUse));
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'ZONEEXTENSIONUSE' + inttostr(nZoneExtNo),'Y');

  Delete(aData,1,3);
  for i := 1 to FIXMAXZONENO do
  begin
    arrZoneState[i-1] := copy(aData,(i-1) * 5 + 1,2);
    arrZoneType[i-1] := aData[(i-1) * 5 + 3];
    arrZoneArmArea[i-1] := copy(aData,(i-1) * 5 + 4,2);
    dmDataBase.UpdateTB_ZONESETTING_FieldName(aECUID,inttostr(nZoneExtNo),inttostr(i),'PORT_TYPE',arrZoneType[i-1]);
    dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(aECUID,inttostr(nZoneExtNo),inttostr(i),'PORT_TYPE','Y');
    dmDataBase.UpdateTB_ZONESETTING_FieldName(aECUID,inttostr(nZoneExtNo),inttostr(i),'ZONEARMAREA',arrZoneArmArea[i-1]);
    dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(aECUID,inttostr(nZoneExtNo),inttostr(i),'ZONEARMAREA','Y');
  end;
  Delete(aData,1,FIXMAXZONENO * 5);
  for i := 1 to FIXMAXZONENO do  //복구신호 추출
  begin
    stHexData := copy(aData,(i-1) * 2 + 1,2);
    stBinaryData := '';
    stBinaryData := HexToBinary(stHexData);
    arrZoneRecover[i-1] := stBinaryData[6];
    arrZoneUsed[i-1] := stBinaryData[1];
    dmDataBase.UpdateTB_ZONESETTING_FieldName(aECUID,inttostr(nZoneExtNo),inttostr(i),'PORT_RECORVER',arrZoneRecover[i-1]);
    dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(aECUID,inttostr(nZoneExtNo),inttostr(i),'PORT_RECORVER','Y');
    dmDataBase.UpdateTB_ZONESETTING_FieldName(aECUID,inttostr(nZoneExtNo),inttostr(i),'PORT_ZONEUSE',arrZoneUsed[i-1]);
    dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(aECUID,inttostr(nZoneExtNo),inttostr(i),'PORT_ZONEUSE','Y');
  end;

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvZoneExtensionPortInfoData(aECUID,inttostr(nZoneExtNo),inttostr(nZoneExtUse),arrZoneState,arrZoneType,arrZoneArmArea,arrZoneRecover,arrZoneUsed);
  end;

end;

procedure TfmMain.ZoneExtensionSkillChange(Sender: TObject; aEcuID,
  aTemp: string; aValue: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if aEcuID = '00' then mn_ExtentionVer.Visible := aValue;
  
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).ZoneExtensionSkillChange(aEcuID,aValue);
  end;

end;

procedure TfmMain.RecvDoorDSCheckUse(Sender: TObject; aEcuID, aDoorNo,
  aDSCheckUse: string);
var
  fmDeviceSetting :TForm;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex > -1 then
  begin
    TCurrentDeviceState(DeviceList.Objects[nIndex]).SetDoorDSCheckUse(aDoorNo,aDSCheckUse);
  end;
  if isDigit(aDSCheckUse) then
  begin
    dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,aDoorNo,'DSCHECKUSE',aDSCheckUse);
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,aDoorNo,'DSCHECKUSE','Y');
  end;

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvDoorDSCheckUse(aECUID,aDoorNo,aDSCheckUse);
  end;
end;

procedure TfmMain.RecvDoorDSCheckTime(Sender: TObject; aEcuID, aDoorNo,
  aDSCheckTimeSec: string);
var
  fmDeviceSetting :TForm;
begin
  if isDigit(aDSCheckTimeSec) then
  begin
    dmDataBase.UpdateTB_DOORSETTING_FieldName(aECUID,aDoorNo,'DSCHECKTIME',aDSCheckTimeSec);
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aECUID,aDoorNo,'DSCHECKTIME','Y');
  end;

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvDoorDSCheckTime(aECUID,aDoorNo,aDSCheckTimeSec);
  end;
end;

procedure TfmMain.RcvZoneExtensionUseData(Sender: TObject; aECUID, aCmd,
  aData: string);
var
  fmDeviceSetting :TForm;
  nIndex : integer;
  nZoneExtNo : integer;
  nZoneExtUse : integer; //0:미사용,1:사용
  i : integer;
begin
  if length(aData) < 9 then Exit;
  delete(aData,1,1);

  nIndex := DeviceList.IndexOf(aEcuID);
  for i := 1 to FIXMAXZONEEXTENDNO do
  begin
    if nIndex > -1 then
    begin
      TCurrentDeviceState(DeviceList.Objects[nIndex]).SetZoneExtentionUse(inttostr(i),aData[i]);
    end;
    dmDatabase.UpdateTB_DEVICE_FieldName(aECUID,'ZONEEXTENSIONUSE' + inttostr(i),aData[i]);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'ZONEEXTENSIONUSE' + inttostr(i),'Y');
  end;

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvZoneExtensionUseData(aECUID,aData);
  end;

end;

procedure TfmMain.RcvMemoryClearControl(Sender: TObject; aECUID, aCmd,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvMemoryClearControl(aECUID,aData);
  end;

end;

procedure TfmMain.RcvFireRecovery(Sender: TObject; aECUID, aCmd,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvFireRecovery(aECUID,aData[1]);
  end;

end;
{
function TfmMain.InsertIntoTB_DEVICE_Value(aFieldName,
  aData: string): Boolean;
var
  slFieldNameList : TStringList;
  slDataList : TStringList;
  i : integer;
  nKeyIndex : integer;
  stKey : string;
  stData : string;
begin
  result := False;
  Try
    aFieldName := stringReplace(aFieldName,' ',SOH,[rfReplaceAll]);
    aData := stringReplace(aData,' ',SOH,[rfReplaceAll]);
    
    slFieldNameList := TStringList.Create;
    slDataList := TStringList.Create;

    slFieldNameList.Delimiter := ',';
    slFieldNameList.DelimitedText := aFieldName;

    slDataList.Delimiter := ',';
    slDataList.DelimitedText := aData;

    if slFieldNameList.Count > slDataList.Count then Exit;

    nKeyIndex := slFieldNameList.IndexOf('ECU_ID');
    if nKeyIndex < 0 then
    begin
      Exit;
    end;

    stKey := slDataList.Strings[nKeyIndex];
    stKey := stringReplace(stKey,SOH,' ',[rfReplaceAll]);
    for i := 1 to slFieldNameList.Count - 1 do
    begin
      if i <> nKeyIndex then
      begin
        stData := slDataList.Strings[i];
        stData := stringReplace(stData,SOH,' ',[rfReplaceAll]);
        dmDataBase.UpdateTB_DEVICE_FieldName(stKey,slFieldNameList.Strings[i],stData);
        dmDataBase.UpdateTB_DEVICERCV_FieldName(stKey,slFieldNameList.Strings[i],'U');
      end;
    end; 
    result := True;
  Finally
    slFieldNameList.Free;
    slDataList.Free;
  End;
end;

function TfmMain.InsertIntoTB_DOORSETTINGINFO_Value(aFieldName,
  aData: string): Boolean;
var
  slFieldNameList : TStringList;
  slDataList : TStringList;
  i : integer;
  nKeyIndex1 : integer;
  nKeyIndex2 : integer;
  nKeyIndex3 : integer;
  stKey1 : string;
  stKey2 : string;
  stKey3 : string;
  stData : string;
begin
  result := False;
  Try
    aFieldName := stringReplace(aFieldName,' ',SOH,[rfReplaceAll]);
    aData := stringReplace(aData,' ',SOH,[rfReplaceAll]);
    
    slFieldNameList := TStringList.Create;
    slDataList := TStringList.Create;

    slFieldNameList.Delimiter := ',';
    slFieldNameList.DelimitedText := aFieldName;

    slDataList.Delimiter := ',';
    slDataList.DelimitedText := aData;

    if slFieldNameList.Count > slDataList.Count then Exit;

    nKeyIndex1 := slFieldNameList.IndexOf('ECU_ID');
    nKeyIndex2 := slFieldNameList.IndexOf('ECU_EXTEND');
    nKeyIndex3 := slFieldNameList.IndexOf('DOORNO');
    if (nKeyIndex1 < 0) or
       (nKeyIndex2 < 0) or
       (nKeyIndex3 < 0) then
    begin
      Exit;
    end;

    stKey1 := slDataList.Strings[nKeyIndex1];
    stKey2 := slDataList.Strings[nKeyIndex2];
    stKey3 := slDataList.Strings[nKeyIndex3];
    stKey1 := stringReplace(stKey1,SOH,' ',[rfReplaceAll]);
    stKey2 := stringReplace(stKey2,SOH,' ',[rfReplaceAll]);
    stKey3 := stringReplace(stKey3,SOH,' ',[rfReplaceAll]);

    for i := 1 to slFieldNameList.Count - 1 do
    begin
      if (i <> nKeyIndex1) and
         (i <> nKeyIndex2) and
         (i <> nKeyIndex3) then
      begin
        stData := slDataList.Strings[i];
        stData := stringReplace(stData,SOH,' ',[rfReplaceAll]);
        dmDataBase.UpdateTB_DOORSETTING_FieldName(stKey1,stKey3,slFieldNameList.Strings[i],stData);
        dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(stKey1,stKey3,slFieldNameList.Strings[i],'U');
      end;
    end; 
    result := True;
  Finally
    slFieldNameList.Free;
    slDataList.Free;
  End;
end;

function TfmMain.InsertIntoTB_READERSETTING_Value(aFieldName,
  aData: string): Boolean;
var
  slFieldNameList : TStringList;
  slDataList : TStringList;
  i : integer;
  nKeyIndex1 : integer;
  nKeyIndex2 : integer;
  nKeyIndex3 : integer;
  stKey1 : string;
  stKey2 : string;
  stKey3 : string;
  stData : string;
begin
  result := False;
  Try
    aFieldName := stringReplace(aFieldName,' ',SOH,[rfReplaceAll]);
    aData := stringReplace(aData,' ',SOH,[rfReplaceAll]);
    
    slFieldNameList := TStringList.Create;
    slDataList := TStringList.Create;

    slFieldNameList.Delimiter := ',';
    slFieldNameList.DelimitedText := aFieldName;

    slDataList.Delimiter := ',';
    slDataList.DelimitedText := aData;

    if slFieldNameList.Count > slDataList.Count then Exit;

    nKeyIndex1 := slFieldNameList.IndexOf('ECU_ID');
    nKeyIndex2 := slFieldNameList.IndexOf('ECU_EXTEND');
    nKeyIndex3 := slFieldNameList.IndexOf('READERNO');
    if (nKeyIndex1 < 0) or
       (nKeyIndex2 < 0) or
       (nKeyIndex3 < 0) then
    begin
      Exit;
    end;

    stKey1 := slDataList.Strings[nKeyIndex1];
    stKey2 := slDataList.Strings[nKeyIndex2];
    stKey3 := slDataList.Strings[nKeyIndex3];
    stKey1 := stringReplace(stKey1,SOH,' ',[rfReplaceAll]);
    stKey2 := stringReplace(stKey2,SOH,' ',[rfReplaceAll]);
    stKey3 := stringReplace(stKey3,SOH,' ',[rfReplaceAll]);

    for i := 1 to slFieldNameList.Count - 1 do
    begin
      if (i <> nKeyIndex1) and
         (i <> nKeyIndex2) and
         (i <> nKeyIndex3) then
      begin
        stData := slDataList.Strings[i];
        stData := stringReplace(stData,SOH,' ',[rfReplaceAll]);
        dmDataBase.UpdateTB_READERSETTING_FieldName(stKey1,stKey2,stKey3,slFieldNameList.Strings[i],stData);
        dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(stKey1,stKey2,stKey3,slFieldNameList.Strings[i],'U');
      end;
    end; 
    result := True;
  Finally
    slFieldNameList.Free;
    slDataList.Free;
  End;
end;

function TfmMain.InsertIntoTB_ZONESETTING_Value(aFieldName,
  aData: string): Boolean;
var
  slFieldNameList : TStringList;
  slDataList : TStringList;
  i : integer;
  nKeyIndex1 : integer;
  nKeyIndex2 : integer;
  nKeyIndex3 : integer;
  stKey1 : string;
  stKey2 : string;
  stKey3 : string;
  stData : string;
begin
  result := False;
  Try
    aFieldName := stringReplace(aFieldName,' ',SOH,[rfReplaceAll]);
    aData := stringReplace(aData,' ',SOH,[rfReplaceAll]);
    
    slFieldNameList := TStringList.Create;
    slDataList := TStringList.Create;

    slFieldNameList.Delimiter := ',';
    slFieldNameList.DelimitedText := aFieldName;

    slDataList.Delimiter := ',';
    slDataList.DelimitedText := aData;

    if slFieldNameList.Count > slDataList.Count then Exit;

    nKeyIndex1 := slFieldNameList.IndexOf('ECU_ID');
    nKeyIndex2 := slFieldNameList.IndexOf('ECU_EXTEND');
    nKeyIndex3 := slFieldNameList.IndexOf('ZONENO');
    if (nKeyIndex1 < 0) or
       (nKeyIndex2 < 0) or
       (nKeyIndex3 < 0) then
    begin
      Exit;
    end;

    stKey1 := slDataList.Strings[nKeyIndex1];
    stKey2 := slDataList.Strings[nKeyIndex2];
    stKey3 := slDataList.Strings[nKeyIndex3];
    stKey1 := stringReplace(stKey1,SOH,' ',[rfReplaceAll]);
    stKey2 := stringReplace(stKey2,SOH,' ',[rfReplaceAll]);
    stKey3 := stringReplace(stKey3,SOH,' ',[rfReplaceAll]);

    for i := 1 to slFieldNameList.Count - 1 do
    begin
      if (i <> nKeyIndex1) and
         (i <> nKeyIndex2) and
         (i <> nKeyIndex3) then
      begin
        stData := slDataList.Strings[i];
        stData := stringReplace(stData,SOH,' ',[rfReplaceAll]);
        dmDataBase.UpdateTB_ZONESETTING_FieldName(stKey1,stKey2,stKey3,slFieldNameList.Strings[i],stData);
        dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(stKey1,stKey2,stKey3,slFieldNameList.Strings[i],'U');
      end;
    end; 
    result := True;
  Finally
    slFieldNameList.Free;
    slDataList.Free;
  End;
end;
}
procedure TfmMain.BitBtn1Click(Sender: TObject);
var
  filename : string;
begin
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  if SaveDialog1.Execute then
  begin
   filename := SaveDialog1.FileName;
   dmDBBackupAndRecovery.CardPermitTabletoFile(filename);
  end;

end;


procedure TfmMain.DoorPossibilityChange(Sender: TObject; aEcuID,
  aDoorNO: string; aValue: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).DoorPossibilityChange(aEcuID,aDoorNO,aValue);
  end;

end;

procedure TfmMain.RecvLineShortCheck(Sender: TObject; aECUID,
  aData: string);
var
  fmDeviceSetting :TForm;
  fmNetworkCheck : TForm;
begin
  if aData = '' then Exit;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvLineShortCheck(aECUID, aData);
  end;
  if NetworkCheckView then
  begin
    fmNetworkCheck := MDIForm('TfmNetworkCheck');
    TfmNetworkCheck(fmNetworkCheck).RecvLineShortCheck(aECUID, aData);
  end;  

end;

function TfmMain.SystemZoneExtensionUseSearch(aEcuID: string): Boolean;
begin
  result := False;
  if (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE1') <> 'N') or
     (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE2') <> 'N') or
     (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE3') <> 'N') or
     (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE4') <> 'N') or
     (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE5') <> 'N') or
     (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE6') <> 'N') or
     (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE7') <> 'N') or
     (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE8') <> 'N') then Exit;

  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'ZONEEXTENSIONUSE1','S');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'ZONEEXTENSIONUSE2','S');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'ZONEEXTENSIONUSE3','S');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'ZONEEXTENSIONUSE4','S');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'ZONEEXTENSIONUSE5','S');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'ZONEEXTENSIONUSE6','S');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'ZONEEXTENSIONUSE7','S');
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'ZONEEXTENSIONUSE8','S');

  dmSocket.SearchSystemZoneExtensionUse(aEcuID,False,3);
  result := True;

end;

function TfmMain.SearchDoorArmArea(aEcuID: string): Boolean;
var
  nIndex : integer;
begin
  result := False;
  if dmDataBase.GetTB_DOORSETTINGRCV_Value(aEcuID,'0','1','DOORARMAREA') <> 'N' then Exit;
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(aEcuID,'1','DOORARMAREA','S');

  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex > -1 then
  begin
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill then
    begin
      dmSocket.SearchDoorArmArea(aEcuID,False,3);
    end;
  end;

  result := True;
end;

function TfmMain.SearchDeviceCodeCheck(aEcuID: string): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'DEVICE_CODE') <> 'N' then Exit;
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'DEVICE_CODE','S');
  //기기코드 확인
  dmSocket.DeviceCode_Check(aEcuID,False,3);
  result := True;
end;

function TfmMain.SearchDeviceVersionCheck(aEcuID: string): Boolean;
begin
  result := False;
  if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'DEVICE_VER') <> 'N' then Exit;
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aEcuID,'DEVICE_VER','S');
  dmSocket.DeviceVersion_Check(aEcuID,False,3);
  result := True;
end;

procedure TfmMain.RcvExitButtonEvent(Sender: TObject; aECUID, aDoorNo,
  aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
  aAccessResult, aDoorState, aATButton, stCardNo: string);
var
  fmAccessEvent : TForm;
begin
  if AccessEventView then
  begin
    fmAccessEvent := MDIForm('TfmAccessEvent');
    TfmAccessEvent(fmAccessEvent).RcvExitButtonEvent(aECUID, aDoorNo,
      aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
      aAccessResult, aDoorState, aATButton, stCardNo);
  end;

end;

procedure TfmMain.RcvJaejungDelayUse(Sender: TObject; aECUID, aCmd,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  dmDatabase.UpdateTB_DEVICE_FieldName(aECUID,'JaejungDelayUse',aData[1]);
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'JaejungDelayUse','Y');
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvJaejungDelayUse(aECUID,aData);
  end;

end;

procedure TfmMain.RecvCardAllClear(Sender: TObject; aECUID, aData: string);
var
  fmCardReg : TForm;
begin
  if CardRegView then
  begin
    fmCardReg := MDIForm('TfmCardReg');
    TfmCardReg(fmCardReg).RecvCardAllClear(aEcuID);
  end;   //}

end;

procedure TfmMain.mn_javaraScheduleClick(Sender: TObject);
begin
  inherited;
  fmJavaraSchedule := TfmJavaraSchedule.Create(Self);
  fmJavaraSchedule.ShowModal;
  fmJavaraSchedule.Free;

end;

procedure TfmMain.RcvJavaraSchedule(Sender: TObject; aECUID, aDoorNo,
  aData: string);
var
  stWstartTime,stWendTime : string;
  stSstartTime,stSendTime : string;
  stNstartTime,stNendTime : string;
  stHstartTime,stHendTime : string;
begin
  aData := Trim(aData);
  stWstartTime := copy(aData,1,4);
  stWendTime := copy(aData,5,4);
  Delete(aData,1,8);
  aData := Trim(aData);
  stSstartTime := copy(aData,1,4);
  stSendTime := copy(aData,5,4);
  Delete(aData,1,8);
  aData := Trim(aData);
  stNstartTime := copy(aData,1,4);
  stNendTime := copy(aData,5,4);
  Delete(aData,1,8);
  aData := Trim(aData);
  stHstartTime := copy(aData,1,4);
  stHendTime := copy(aData,5,4);
  dmDataBase.UpdateTB_JavaraSchedule_FieldName(aECUID, '00',
    stWstartTime, stWEndTime, stSstartTime, stSendTime, stNstartTime, stNendTime,
    stHStartTime, stHendTime,'Y');
  if JavaraScheduleView then
  begin
    fmJavaraSchedule.ListClick;
  end;
end;

procedure TfmMain.CommandArrayCommandsTJAVARASCHEDULEExecute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
begin
  stValue := Params.Values['VALUE'];

  if stValue = 'TRUE' then JavaraScheduleView := True
  else JavaraScheduleView := False;

end;

procedure TfmMain.ProcessKTT812EcuFirmWareDownloadFailed(Sender: TObject;
  aECUID, aFailed: string);
begin
//  memo1.Lines.Add(aEcuID + ':' + '(f94)FirmWareDownloadFailed');
  if L_bKTT812FirmwareDownLoadShow then
  begin
    fm812Firmware.ProcessKTT812EcuFirmWareDownloadFailed(aECUID,aFailed);
  end;

end;

procedure TfmMain.tb_NetworkCheckClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmNetWorkCheck');  
end;

procedure TfmMain.CardReaderStateData(Sender: TObject; aECUID,
  aData: string);
var
  i : integer;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuid);
  if nIndex < 0 then Exit;
  Delete(aData,1,1);

  for i:= 1 to Length(aData) do
  begin
    if aData[i] = '1' then
    begin
      TCurrentDeviceState(DeviceList.Objects[nIndex]).setReaderConnected(i,True);
      TCurrentDeviceState(DeviceList.Objects[nIndex]).SetReaderUse(i,True);
    end else if uppercase(aData[i]) = '0' then
    begin
      TCurrentDeviceState(DeviceList.Objects[nIndex]).setReaderConnected(i,False);
      TCurrentDeviceState(DeviceList.Objects[nIndex]).SetReaderUse(i,True);
    end else if UpperCase(aData[i]) = 'U' then
    begin
      TCurrentDeviceState(DeviceList.Objects[nIndex]).setReaderConnected(i,False);
      TCurrentDeviceState(DeviceList.Objects[nIndex]).SetReaderUse(i,False);
    end;
  end;

end;

procedure TfmMain.CurrentScheduleUseChange(Sender: TObject; aEcuID,
  aNo: string; aUsed: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if aEcuID <> G_stSelectEcuID then Exit;
  mn_Schedule.Visible := aUsed;
  mn_Holiday.Visible := aUsed;
  Action_ScheduleReg.Enabled := aUsed;
  Action_Holiday.Enabled := aUsed;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).CurrentScheduleUseChange(aEcuID,aUsed);
  end;

end;

procedure TfmMain.AppException(Sender: TObject; E: Exception);
var
  sObj : string;
  ctrl : TControl;
  Comp : TComponent;
begin
  sObj := '';
  if Sender <> nil then
  begin
    if Sender.InheritsFrom(TControl) then
    begin
      ctrl := TControl(Sender);
      While (ctrl <> nil) do
      begin
        sObj := ctrl.Name + '->' + sObj;
        ctrl := ctrl.Parent;
      end;
    end else if Sender.InheritsFrom(TComponent) then
    begin
      Comp := TComponent(Sender);
      sObj := Comp.Name;
      if (Comp.Owner <> nil) then
      begin
        sObj := comp.Owner.Name + '->' + sObj;
      end;
    end;
  end;
  LogSave(ExtractFileDir(Application.ExeName) + '\' + Application.Name + FormatDateTime('yyyymmdd',now) + '.log',sObj);

end;

procedure TfmMain.RcvJavaraArmClose(Sender: TObject; aECUID, aDoorNo,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  dmDatabase.UpdateTB_DEVICE_FieldName(aECUID,'JavaraArmClose',aData[1]);
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'JavaraArmClose','Y');
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvJavaraArmClose(aECUID,aDoorNo,aData);
  end;

end;

procedure TfmMain.RcvJavaraAutoClose(Sender: TObject; aECUID, aDoorNo,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  dmDatabase.UpdateTB_DEVICE_FieldName(aECUID,'JavaraAutoClose',aData[1]);
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'JavaraAutoClose','Y');
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvJavaraAutoClose(aECUID,aDoorNo,aData);
  end;

end;

procedure TfmMain.CommandArrayCommandsTSOCKETExecute(Command: TCommand;
  Params: TStringList);
var
  stValue : string;
begin
  stValue := Params.Values['VALUE'];

  if stValue = 'TRUE' then dmSocket.SendTimer.Enabled := True
  else dmSocket.SendTimer.Enabled := False;

end;

procedure TfmMain.PortZoneUseSkillChange(Sender: TObject; aEcuID,
  aTemp: string; aValue: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).PortZoneUseSkillChange(aEcuID,aValue);
  end;

end;

procedure TfmMain.ZoneExtentionNetworkStateData(Sender: TObject; aECUID,
  aData: string);
var
  i : integer;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(aEcuid);
  if nIndex < 0 then Exit;
  Delete(aData,1,1);

  for i:= 1 to Length(aData) do
  begin
    if aData[i] = '1' then
    begin
      TCurrentDeviceState(DeviceList.Objects[nIndex]).SetZoneExtentionConnected(i,True);
      TCurrentDeviceState(DeviceList.Objects[nIndex]).SetZoneExtentionUse(inttostr(i),'1');
    end else if uppercase(aData[i]) = '0' then
    begin
      TCurrentDeviceState(DeviceList.Objects[nIndex]).SetZoneExtentionConnected(i,False);
      TCurrentDeviceState(DeviceList.Objects[nIndex]).SetZoneExtentionUse(inttostr(i),'1');
    end else if UpperCase(aData[i]) = 'U' then
    begin
      TCurrentDeviceState(DeviceList.Objects[nIndex]).SetZoneExtentionConnected(i,False);
      TCurrentDeviceState(DeviceList.Objects[nIndex]).SetZoneExtentionUse(inttostr(i),'0');
    end;
  end;

end;

procedure TfmMain.ZoneExtensionConnectChange(Sender: TObject; aEcuID,
  aNo: string; aConnected: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).ZoneExtensionConnectChange(aEcuID,aNo,aConnected);
  end;   
end;

procedure TfmMain.PortZoneUseRemoteControlSkill(Sender: TObject; aEcuID,
  aTemp: string; aValue: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).PortZoneUseRemoteControlSkill(aEcuID,aValue);
  end;

end;

procedure TfmMain.RecvZoneUseRemoteControl(Sender: TObject; aECUID,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  if aData = '' then Exit;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvZoneUseRemoteControl(aECUID, aData);
  end;

end;

procedure TfmMain.JavaraScheduleSkillChange(Sender: TObject; aEcuID,
  aNo: string; aValue: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if aEcuID = '00' then
    mn_javaraSchedule.Visible := aValue;
  
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).JavaraScheduleSkillChange(aECUID, aNo,aValue);
  end;

end;

procedure TfmMain.mn_ExtentionVerClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmZoneExtentionVersion');

end;

procedure TfmMain.ZoneExtentionVersionData(Sender: TObject; aECUID,
  aZoneExtNo, aVersion: string);
var
  fmZoneExtentionVersion :TForm;
  nIndex : integer;
begin
  if L_bZoneExtentionVersionShow then
  begin
    fmZoneExtentionVersion := MDIForm('TfmZoneExtentionVersion');
    TfmZoneExtentionVersion(fmZoneExtentionVersion).ZoneExtentionVersionSearch;
  end;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TCurrentDeviceState(DeviceList.Objects[nIndex]).SetZoneExtentionVersion(aZoneExtNo, aVersion);

end;

procedure TfmMain.RecvMaxCardCount(Sender: TObject; aECUID, aData: string);
begin
  aData := Trim(aData);
  if isDigit(aData) then
  begin
    if strtoint(aData) > G_nMaxCardPositionNum then
      G_nMaxCardPositionNum := strtoint(aData);
  end;
end;

procedure TfmMain.RcvKTTMuxID(Sender: TObject; aECUID, aCmd,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvKTTMuxID(aECUID,aCmd,aData);
  end;

end;

procedure TfmMain.RcvPrimaryKTTType(Sender: TObject; aECUID, aCmd,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvPrimaryKTTType(aECUID,aCmd,aData);
  end;

end;

procedure TfmMain.RcvDDNSQueryServer(Sender: TObject; aECUID, aCmd,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvDDNSQueryServer(aECUID,aCmd,aData);
  end;

end;

procedure TfmMain.RcvDDNSServer(Sender: TObject; aECUID, aCmd,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvDDNSServer(aECUID,aCmd,aData);
  end;

end;

procedure TfmMain.RcvEventServer(Sender: TObject; aECUID, aCmd,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvEventServer(aECUID,aCmd,aData);
  end;

end;

procedure TfmMain.RcvTCPServerPort(Sender: TObject; aECUID, aCmd,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvTCPServerPort(aECUID,aCmd,aData);
  end;

end;

procedure TfmMain.RecvLineCheckStart(Sender: TObject; aECUID,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  if aData = '' then Exit;
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvLineCheckStart(aECUID, aData);
  end;
end;

procedure TfmMain.RecvLineCheckTime(Sender: TObject; aECUID,
  aData: string);
begin

end;

procedure TfmMain.PoliceDeviceTypeChange(Sender: TObject; aEcuID,
  aTemp: string; aValue: Boolean);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).PoliceDeviceTypeChange(aEcuID,aValue);
  end;
end;

procedure TfmMain.RcvPoliceTelNum(Sender: TObject; aECUID, aCmd,
  aData: string);
var
  fmDeviceSetting :TForm;
  nTelNo : integer;
  stSoundNo : string;
  stStartDelay : string;
  stSendTime : string;
  stSendCount : string;
  nSpeak : integer;
  nCountTime : integer;
  nDTMFStart : integer;
  nDTMFEnd : integer;
  stTelNum : string;
begin
  nTelNo := strtoint(copy(aData,1,2));
  Delete(aData,1,2);
  aData := StringReplace(aData,' ','',[rfReplaceAll]);
  if aData[13] = 'C' then aData[13] := '0'
  else if aData[13] = 'T' then aData[13] := '1';
  if nTelNo = 0 then
  begin
    dmDatabase.UpdateTB_DEVICE_FieldName(aECUID,'PoliceTel1',aData);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'PoliceTel1','Y');
  end else if nTelNo = 1 then
  begin
    dmDatabase.UpdateTB_DEVICE_FieldName(aECUID,'PoliceTel2',aData);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'PoliceTel2','Y');
  end;
  stSoundNo := copy(aData,1,2);
  stStartDelay := copy(aData,3,3);
  stSendTime := copy(aData,6,3);
  stSendCount := copy(aData,9,3);
  nSpeak := strtoint(aData[12]);
  nCountTime := strtoint(aData[13]);
  nDTMFStart := strtoint(aData[14]);
  nDTMFEnd := strtoint(aData[15]);
  if copy(aData,16,2) = '00' then stTelNum := ''
  else stTelNum := copy(aData,18,strtoint(copy(aData,16,2)));

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvPoliceTelNum(aECUID,nTelNo,stSoundNo,stStartDelay,
    stSendTime,stSendCount,nSpeak,nCountTime,nDTMFStart,nDTMFEnd,stTelNum);
  end;

end;

procedure TfmMain.RcvServerCardNF(Sender: TObject; aECUID, aCmd,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvServerCardNF(aECUID,aCmd,aData);
  end;
end;

procedure TfmMain.RcvJavaraStopTime(Sender: TObject; aECUID, aCmd,
  aData: string);
var
  fmDeviceSetting :TForm;
  stData : string;
begin
  stData := stringReplace(aData,' ','',[rfReplaceAll]);
  dmDatabase.UpdateTB_DEVICE_FieldName(aECUID,'JAVARASTOPTIME',stData);
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'JAVARASTOPTIME','Y');
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvJavaraStopTime(aECUID,aCmd,stData);
  end;
end;

procedure TfmMain.KTT8111Click(Sender: TObject);
var
  i : integer;
begin
  inherited;

  for i:=0 to DeviceList.Count - 1 do
  begin
    TCurrentDeviceState(DeviceList.Objects[i]).DeviceCode := TMenuITem(Sender).Hint;
  end;

end;

procedure TfmMain.CardReaderSoundSetting(Sender: TObject; aECUID,
  aData: string);
var
  fmDeviceSetting :TForm;
  i : integer;
begin

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvCardReaderSoundSetting(aECUID, aData);
  end;
  if Length(Trim(aData)) > 1 then
  begin
    for i := 1 to Length(Trim(aData)) do
    begin
      dmDataBase.UpdateTB_READERSETTING_FieldName(aEcuID,'0',inttostr(i),'READER_SOUND',aData[i]);
      dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(aEcuID,'0',inttostr(i),'READER_SOUND','Y');
    end;
  end;
end;

procedure TfmMain.mn_ICU300FirmwareClick(Sender: TObject);
begin
  inherited;
  fmICUGCU300FirmwareDownload := TfmICUGCU300FirmwareDownload.Create(Self);
  fmICUGCU300FirmwareDownload.Caption := TMenuItem(Sender).Caption;
  fmICUGCU300FirmwareDownload.DeviceType := TMenuItem(Sender).Hint;
  fmICUGCU300FirmwareDownload.DeviceID := DeviceID;
  fmICUGCU300FirmwareDownload.ShowModal;
end;

procedure TfmMain.ICU300FirmWareProcess(Sender: TObject; aECUID, aNo,
  aData: string);
begin
  if L_bICU300FirmWareSendShow then
  begin
    fmICUGCU300FirmwareDownload.ICU300FirmWareProcess(aECUID,aData);
  end;
end;

procedure TfmMain.RecvGCU300_ICU300FirmwareDownloadState(Sender: TObject;
  aECUID, aData: string);
begin
  if L_bICU300FirmWareSendShow then
  begin
    fmICUGCU300FirmwareDownload.GCU300_ICU300FirmwareDownloadState(aECUID,aData);
  end;
end;

procedure TfmMain.CommandArrayCommandsTNetworkCheckExecute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
begin
  stValue := Params.Values['VALUE'];

  if stValue = 'TRUE' then NetworkCheckView := True
  else NetworkCheckView := False;

end;

procedure TfmMain.CardRegCardCNT(Sender: TObject; aECUID, aData: string);
var
  fmCardReg :TForm;
begin
  if CardRegView then
  begin
    fmCardReg := MDIForm('TfmCardReg');
    TfmCardReg(fmCardReg).RecvCardRegCardCNT(aECUID,aData);
  end; //}
end;


procedure TfmMain.RcvDoorTimeCodeUse(Sender: TObject; aECUID, aVer,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  dmDatabase.UpdateTB_DEVICE_FieldName(aECUID,'DOOR_TIMECODEUSE',aData);
  dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'DOOR_TIMECODEUSE','Y');
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvDoorTimeCodeUse(aECUID,aVer,aData);
  end;
end;

procedure TfmMain.RcvTimeCode(Sender: TObject; aECUID, aGroup,
  aData: string);
var
  fmDeviceSetting :TForm;
begin
  if aGroup = '0' then
  begin
    dmDatabase.UpdateTB_DEVICE_FieldName(aECUID,'TIMECODE01',aData);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'TIMECODE01','Y');
  end else if aGroup = '1' then
  begin
    dmDatabase.UpdateTB_DEVICE_FieldName(aECUID,'TIMECODE02',aData);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(aECUID,'TIMECODE02','Y');
  end;
  
  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RcvTimeCode(aECUID,aGroup,aData);
  end;
end;

procedure TfmMain.CardReaderExitSoundSetting(Sender: TObject; aECUID,
  aData: string);
var
  fmDeviceSetting :TForm;
  i : integer;
  stData : string;
begin

  if DeviceSettingView then
  begin
    fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
    TfmCurrentDeviceSetting(fmDeviceSetting).RecvCardReaderExitSoundSetting(aECUID, aData);
  end;
  if Length(Trim(aData)) > 1 then
  begin
    stData := HexToBinary(aData);
    for i := 1 to Length(Trim(stData)) do
    begin
      dmDataBase.UpdateTB_READERSETTING_FieldName(aEcuID,'0',inttostr(i),'READER_SOUND',stData[9 - i]);
      dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(aEcuID,'0',inttostr(i),'READER_SOUND','Y');
    end;
  end;

end;

end.
