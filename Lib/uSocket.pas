unit uSocket;

interface

uses
  SysUtils, Classes, AdStatLt, OoMisc, AdPort, AdWnPort,
  Dialogs,AdSocket,Windows,Forms,
  uCommon, ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, ScktComp,uWinSocket;

type
  TCurrentDeviceState = Class(TComponent)
  private
    DoorUse: Array [0..FIXMAXDOORNO] of string; //0 �̻��,1 ���   -- ��������� ��� '0' ���� ���� ��
    DoorPossibility: Array [0..FIXMAXDOORNO] of Boolean;  //���Թ� ��� ���� ����
    DoorState: Array [0..FIXMAXDOORNO] of TDoorDSState;
    DoorLockState: Array [0..FIXMAXDOORNO] of TDoorLockState;
    DoorFire: Array [0..FIXMAXDOORNO] of string; //0 ����,1 ȭ��߻�
    DoorPNMode: Array [0..FIXMAXDOORNO] of TDoorPNMode;
    DoorManageMode: Array [0..FIXMAXDOORNO] of TDoorManageMode;
    DoorUseType: Array [0..FIXMAXDOORNO] of string; //0:�������,1:��������,2:���+����
    DoorDSCheckUse: Array [0..FIXMAXDOORNO] of string; //0:�׻�˻�,1:�ɼǰ˻�
    DoorArmArea: Array [0..FIXMAXDOORNO] of integer; //���Թ� �������
    DoorLockType: Array [0..FIXMAXDOORNO] of integer; //���Թ� �� Ÿ��
    LockExtensionUse : Array[0..FIXMAXZONEEXTENDNO] of string; //0: ��Ȯ��� �̻��,1:��Ȯ��� ���
    ReaderUse: Array [0..FIXMAXREADERNO] of string; //0 �̻��,1 ���
    ReaderDoorNo : Array[0..FIXMAXREADERNO] of string; // ������ ���Թ� ��ȣ
    ReaderVersion : Array[0..FIXMAXREADERNO] of string; //���� ���� ����
    ReaderConnectionState : Array[0..FIXMAXREADERNO] of string; //0 ��žȵ�,1:��ż���
    ZoneExtensionUse : Array[0..FIXMAXZONEEXTENDNO] of string; //0: ��Ȯ��� �̻��,1:��Ȯ��� ���,2:��������
    ZoneExtensionConnectionState : Array[0..FIXMAXZONEEXTENDNO] of string; //0 ��žȵ�,1:��ż���
    ZoneExtensionVersion : Array[0..FIXMAXREADERNO] of string; //��Ȯ��� ���� ����
    FECUID: string;
    FConnected: Boolean;
    FDoor1Fire: Boolean;
    FDeviceCode: string;
    FDeviceType: string;
    FDeviceVersion: string;
    FAlarmMode: TWatchMode;
    FOnDeviceChange: TDeviceChange;
    FOnConnected: TDeviceChange;
    FOnAlarmModeChange: TDeviceChange;
    FOnDoorTypeChange: TDeviceChange;
    FOnDoorStateChange: TDeviceChange;
    FOnReaderUseChange: TDeviceChange;
    FOnReaderConnectChange: TDeviceChange;
    FOnDeviceCodeChange: TDeviceChange;
    FOnDeviceTypeChange: TDeviceChange;
    FMaxDoorNo: integer;
    FMaxReaderNo: integer;
    FMaxPortNo: integer;
    FCDMAUse: Boolean;
    FDVRUse: Boolean;
    FCardType: string;
    FOnDvrUseChange: TDeviceChange;
    FCARDREADERTELUse: Boolean;
    FOnCARDREADERTELUseChange: TDeviceChange;
    FOnCardTypeChange: TDeviceChange;
    FOnCDMAUseChange: TDeviceChange;
    FRELAY2TYPE: integer;
    FArmExtension: Boolean;
    FOnArmExtensionChange: TDeviceChange;
    FMaxECUCount: integer;
    FOnMaxECUCountChange: TDeviceChange;
    FDoorArmDSCheckUse: Boolean;
    FDoorDSCheckTimeUse: Boolean;
    FOnDoorDSCheckTimeUseChange: TDeviceChange;
    FOnDoorArmDSCheckUseChange: TDeviceChange;
    FDoorLockExtensionUse: Boolean;
    FOnDoorLockExtensionUseChange: TDeviceChange;
    FArmAreaUse: Boolean;
    FArmAreaSkill: Boolean;
    FOnArmAreaSkillChange: TDeviceChange;
    FOnArmAreaUseChange: TDeviceChange;
    FZoneExtensionSkill: Boolean;
    FOnZoneExtensionSkillChange: TDeviceChange;
    FOnZoneExtensionUseChange: TDeviceChange;
    FOnDoorPossibilityChange: TDeviceChange;
    FScheduleUse: Boolean;
    FOnScheduleUseChange: TDeviceChange;
    FPortZoneUseSkill: Boolean;
    FOnPortZoneUseSkillChange: TDeviceChange;
    FOnZoneExtensionConnectChange: TDeviceChange;
    FPortZoneUseRemoteControlSkill: Boolean;
    FOnPortZoneUseRemoteControlSkill: TDeviceChange;
    FJavaraScheduleSkill: Boolean;
    FOnJavaraScheduleSkillChange: TDeviceChange;
    FMaxCardCount: integer;
    FPOLICEDevice: Boolean;
    FOnPoliceDeviceTypeChange: TDeviceChange;
    FBasicDoorNo: integer;
    procedure SetConnected(const Value: Boolean);
    procedure SetAlarmMode(const Value: TWatchMode);
    procedure SetDeviceCode(const Value: string);
    procedure SetDeviceType(const Value: string);
    procedure SetDeviceVersion(const Value: string);
    procedure SetCDMAUse(const Value: Boolean);
    procedure SetDVRUse(const Value: Boolean);
    procedure SetCardType(const Value: string);
    procedure SetCARDREADERTELUse(const Value: Boolean);
    procedure SetRELAY2TYPE(const Value: integer);
    procedure SetArmExtension(const Value: Boolean);
    procedure SetMaxECUCount(const Value: integer);
    procedure SetDoorArmDSCheckUse(const Value: Boolean);
    procedure SetDoorDSCheckTimeUse(const Value: Boolean);
    procedure SetDoorLockExtensionUse(const Value: Boolean);
    procedure SetArmAreaUse(const Value: Boolean);
    procedure SetArmAreaSkill(const Value: Boolean);
    procedure SetZoneExtensionSkill(const Value: Boolean);
    procedure SetMaxDoorNo(const Value: integer);
    procedure SetScheduleUse(const Value: Boolean);
    procedure SetPortZoneUseSkill(const Value: Boolean);
    procedure SetPortZoneUseRemoteControlSkill(const Value: Boolean);
    procedure SetJavaraScheduleSkill(const Value: Boolean);
    procedure SetMaxCardCount(const Value: integer);
    procedure SetPOLICEDevice(const Value: Boolean);
    procedure SetBasicDoorNo(const Value: integer);
  private
    procedure DoorUseInitialize;
    procedure DoorPossibilityInitialize;
    procedure DoorStateInitialize;
    procedure DoorLockStateInitialize;
    procedure DoorFireInitialize;
    procedure DoorPNModeInitialize;
    procedure DoorManageModeInitialize;
    procedure ReaderUseInitialize;
    procedure ReaderDoorNoInitialize;
    procedure ReaderVersionInitialize;
    procedure ReaderConnectionStateInitialize;
    procedure ZoneExtensionUseInitialize;
    procedure ZoneExtensionConnectionStateInitialize;
    procedure ZoneExtensionVersionInitialize;
    procedure DoorDSCheckUseInitialize;
    procedure DoorArmAreaInitialize;
    procedure DoorLockTypeInitialize;
  published
    Property ECUID : string read FECUID write FECUID;
    property Connected : Boolean read FConnected write SetConnected;
    property AlarmMode : TWatchMode read FAlarmMode write SetAlarmMode;
    Property BasicDoorNo : integer read FBasicDoorNo write SetBasicDoorNo;   //�⺻ ���Թ�
    property DeviceCode : string read FDeviceCode write SetDeviceCode;
    property CardType : string read FCardType write SetCardType;
    property DeviceVersion : string read FDeviceVersion write SetDeviceVersion;
    property DeviceType : string read FDeviceType write SetDeviceType;
    Property MaxCardCount : integer read FMaxCardCount write SetMaxCardCount;
    property MaxECUCount : integer read FMaxECUCount write SetMaxECUCount;
    Property MaxDoorNo : integer read FMaxDoorNo write SetMaxDoorNo;
    Property MaxReaderNo : integer read FMaxReaderNo write FMaxReaderNo;
    Property MaxPortNo : integer read FMaxPortNo write FMaxPortNo;
    property CDMAUse : Boolean read FCDMAUse write SetCDMAUse;
    property DVRUse : Boolean read FDVRUse write SetDVRUse;
    property ScheduleUse : Boolean read FScheduleUse write SetScheduleUse;   //������ ��� ����
    property CARDREADERTELUse : Boolean read FCARDREADERTELUse write SetCARDREADERTELUse;
    property RELAY2TYPE : integer read FRELAY2TYPE write SetRELAY2TYPE;
    property ArmExtension :Boolean read FArmExtension write SetArmExtension;  //���ΰ����
    property DoorDSCheckTimeUse : Boolean read FDoorDSCheckTimeUse write SetDoorDSCheckTimeUse;
    property DoorArmDSCheckUse : Boolean read FDoorArmDSCheckUse write SetDoorArmDSCheckUse;
    property DoorLockExtensionUse : Boolean read FDoorLockExtensionUse write SetDoorLockExtensionUse;
    property ArmAreaSkill : Boolean read FArmAreaSkill write SetArmAreaSkill; //������� ��� ����
    property ArmAreaUse : Boolean read FArmAreaUse write SetArmAreaUse;       //������� ��� ����
    property ZoneExtensionSkill : Boolean read FZoneExtensionSkill write SetZoneExtensionSkill; //��Ȯ��� ��� ����
    property PortZoneUseSkill : Boolean read FPortZoneUseSkill write SetPortZoneUseSkill;       //��Ʈ ������� ���
    property PortZoneUseRemoteControlSkill : Boolean read FPortZoneUseRemoteControlSkill write SetPortZoneUseRemoteControlSkill;       //��Ʈ ������� ���
    property POLICEDevice : Boolean read FPOLICEDevice write SetPOLICEDevice;
    property JavaraScheduleSkill : Boolean read FJavaraScheduleSkill write SetJavaraScheduleSkill; //�ڹٶ� ������ ��� ����
  published
    property OnDeviceChange :TDeviceChange read FOnDeviceChange write FOnDeviceChange;  //View Refresh
    property OnConnected :TDeviceChange read FOnConnected write FOnConnected;           //ECU �� ������� ǥ��
    property OnAlarmModeChange :TDeviceChange read FOnAlarmModeChange write FOnAlarmModeChange; //������� ǥ��
    property OnDoorTypeChange :TDeviceChange read FOnDoorTypeChange write FOnDoorTypeChange;    //���Թ� Ÿ�Ժ��濡 ���� ���Թ����� ��ȸ �� View Refresh
    property OnDoorStateChange :TDeviceChange read FOnDoorStateChange write FOnDoorStateChange; //���Թ� ���� ǥ��
    property OnReaderUseChange :TDeviceChange read FOnReaderUseChange write FOnReaderUseChange; //���� ���� ���� ���� ���� ��ȸ
    property OnReaderConnectChange :TDeviceChange read FOnReaderConnectChange write FOnReaderConnectChange; //���� ��� ���� ����
    property OnDeviceCodeChange :TDeviceChange read FOnDeviceCodeChange write FOnDeviceCodeChange;
    property OnDeviceTypeChange :TDeviceChange read FOnDeviceTypeChange write FOnDeviceTypeChange;
    property OnCDMAUseChange :TDeviceChange read FOnCDMAUseChange write FOnCDMAUseChange;
    property OnDvrUseChange :TDeviceChange read FOnDvrUseChange write FOnDvrUseChange;
    property OnScheduleUseChange :TDeviceChange read FOnScheduleUseChange write FOnScheduleUseChange;
    property OnCARDREADERTELUseChange :TDeviceChange read FOnCARDREADERTELUseChange write FOnCARDREADERTELUseChange;
    property OnCardTypeChange :TDeviceChange read FOnCardTypeChange write FOnCardTypeChange;
    property OnArmExtensionChange :TDeviceChange read FOnArmExtensionChange write FOnArmExtensionChange;
    property OnMaxECUCountChange :TDeviceChange read FOnMaxECUCountChange write FOnMaxECUCountChange;
    property OnDoorDSCheckTimeUseChange :TDeviceChange read FOnDoorDSCheckTimeUseChange write FOnDoorDSCheckTimeUseChange;
    property OnDoorArmDSCheckUseChange :TDeviceChange read FOnDoorArmDSCheckUseChange write FOnDoorArmDSCheckUseChange;
    property OnDoorLockExtensionUseChange :TDeviceChange read FOnDoorLockExtensionUseChange write FOnDoorLockExtensionUseChange;
    property OnArmAreaSkillChange : TDeviceChange read FOnArmAreaSkillChange write FOnArmAreaSkillChange;
    property OnArmAreaUseChange : TDeviceChange read FOnArmAreaUseChange write FOnArmAreaUseChange;
    property OnZoneExtensionSkillChange : TDeviceChange read FOnZoneExtensionSkillChange write FOnZoneExtensionSkillChange;
    property OnDoorPossibilityChange : TDeviceChange read FOnDoorPossibilityChange write FOnDoorPossibilityChange;
    property OnPortZoneUseSkillChange : TDeviceChange read FOnPortZoneUseSkillChange write FOnPortZoneUseSkillChange;
    property OnZoneExtensionConnectChange :TDeviceChange read FOnZoneExtensionConnectChange write FOnZoneExtensionConnectChange; //������Ȯ��� ��� ���� ����
    property OnPortZoneUseRemoteControlSkill : TDeviceChange read FOnPortZoneUseRemoteControlSkill write FOnPortZoneUseRemoteControlSkill;
    property OnPoliceDeviceTypeChange : TDeviceChange read FOnPoliceDeviceTypeChange write FOnPoliceDeviceTypeChange;
    property OnJavaraScheduleSkillChange : TDeviceChange read FOnJavaraScheduleSkillChange write FOnJavaraScheduleSkillChange;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    function GetDoorUsed(aDoorNo:integer):Boolean;
    function GetDoorType(aDoorNo:integer):string;
    function GetDoorPossibility(aDoorNo:integer):Boolean;
    function GetDoorState(aDoorNo:integer):TDoorDSState;
    function GetDoorPNMode(aDoorNo:integer):TDoorPNMode;
    function GetDoorManagerMode(aDoorNo:integer):TDoorManageMode;
    function GetReaderUse(aReaderNo:integer):Boolean;
    function GetReaderDoor(aReaderNo:integer):integer;
    function GetReaderConnectState(aReaderNo:integer):Boolean;
    function GetReaderVersion(aReaderNo:integer):string;
    function GetDoorDSCheckUse(aDoorNo:integer):string;
    function GetDoorArmArea(aDoorNo:integer):integer;
    function GetDoorLockType(aDoorNo:integer):integer;
    function GetZoneExtentionUse(ZoneExtNo:integer):string;
    function GetZoneExtentionConnectState(aZoneExtNo:integer):Boolean;
    function GetZoneExtentionVersion(aZoneExtNo:integer):string;
  public
    procedure SetReaderUse(aReaderNo:integer;aReaderUse:Boolean);
    procedure SetReaderInfo(aReaderNo,aUsedCR,aCRPosition,aDoorNo,aReaderArmArea,aLocate, aBuildingPosi:string);
    procedure SetDoorType(aDoorNo:integer;aDoorType:string);
    procedure SetDoorState(aDoorNo, aCardMode,aDoorMode, aDoorState,aDoorSchedule:string);
    procedure SetReaderVersion(aCardReaderNo, aCardReaderVersion:string);
    procedure setReaderConnected(nReaderNo:integer;aConnected:Boolean);
    procedure setDeviceConnected(aConnected:Boolean);
    procedure SetZoneExtentionUse(aZoneExtNo,aZoneExtUse:string);
    procedure SetZoneExtentionConnected(aZoneExtNo:integer;aConnected:Boolean);
    procedure SetZoneExtentionVersion(aZoneExtNo, aZoneExtentionVersion:string);
    procedure SetDoorDSCheckUse(aDoorNo,aDSCheckUse:string);
    procedure SetDoorArmArea(aDoorNo:string;aArmArea:integer);
    procedure SetDoorLockType(aDoorNo:string;aLockType:integer);
    procedure SetDoorPossibility(aDoorNo:integer;aValue:Boolean);
  end;

  TSocketECUState = Class(TComponent)
  private
    FConnected: Boolean;
    FECUID: string;
  published
    Property ECUID : string read FECUID write FECUID;
    Property Connected : Boolean read FConnected write FConnected;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TdmSocket = class(TDataModule)
    Commport: TApdWinsockPort;
    SendTimer: TTimer;
    ClientSocket: TClientSocket;
    IdTCPClient: TIdTCPClient;
    procedure CommportWsConnect(Sender: TObject);
    procedure CommportWsDisconnect(Sender: TObject);
    procedure CommportWsError(Sender: TObject; ErrCode: Integer);
    procedure CommportWsAccept(Sender: TObject; Addr: TInAddr;
      var Accept: Boolean);
    procedure CommportTriggerAvail(CP: TObject; Count: Word);
    procedure SendTimerTimer(Sender: TObject);
    procedure CommportTriggerOutSent(Sender: TObject);

    procedure WinSocketConnected(Sender: TObject;SockNo:integer);
    procedure WinSocketDisConnected(Sender: TObject;SockNo:integer);
    procedure WinSocketRead(Sender: TObject;SockNo:integer; Buf:String;DataLen: Integer);
    procedure WinSocketSend(Sender: TObject;SockNo:integer; Buf:String;DataLen: Integer);
    procedure WinSocketSendComplete(Sender: TObject;SockNo:integer);
    procedure WinSocketError(Sender: TObject;SockNo:integer;SocketError: Integer);

    procedure ClientSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure IdTCPClientConnected(Sender: TObject);
    procedure IdTCPClientDisconnected(Sender: TObject);
    procedure ClientSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FSocketConnected: Boolean;
    FOnPanelMessage: TPanelMessage;
    FOnNodeConnect: TNodeConnect;
    FOnPacketView: TPacketView;
    FServerMode: Integer;
    FConnectMode: Integer;
    FSocketCOM: integer;
    FSocketAddress: String;
    FSocketPort: String;
    FNodeConnected: Boolean;
    FOnReceivePacket: TReceivePacket;
    FDeviceID: string;
    FOnAlarmEvent: TAlarmEvent;
    FOnCardAccessEvent: TCardAccessEvent;
    FOnDoorEvent: TDoorEvent;
    FOnDoorSettingEvent: TDoorSettingEvent;
    FOnCardRegist: TCardRegist;
    FOnDoorState: TDoorState;
    FOnHolidaySetting: THolidaySetting;
    FOnScheduleSetting: TScheduleSetting;
    FOnDeviceIDSetting: TDeviceIDSetting;
    FOnCardReaderSetting: TCardReaderSetting;
    FOnSystemSetting: TSystemSetting;
    FOnLampSirenOnOff: TLampSirenOnOff;
    FOnLampTime: TLampTime;
    FOnSirenTime: TSirenTime;
    FOnPortSetting: TPortSetting;
    FOnDeviceUsedSetting: TDeviceUsedSetting;
    FOnWiznetInfoSetting: TWiznetInfoSetting;
    FOnCardReaderTypeSetting: TCardReaderTypeSetting;
    FOnDeviceState: TDeviceState;
    FOnDeviceTime: TDeviceTime;
    FOnDeviceType: TDeviceType;
    FOnSystemFunction: TSystemFunction;
    FOnDeviceVersion: TDeviceVersion;
    FOnCardReaderVersion: TCardReaderVersion;
    FOnDeviceReset: TDeviceReset;
    FOnECUConnect: TECUConnect;
    FOnServerModeConnect: TServerModeConnect;
    FOnEcuState: TEcuState;
    FOnCardGrade: TCardGrade;
    FOnCDMASetting: TCCCSetting;
    FOnCCCInfoSetting: TCCCSetting;
    FOnCCCTimeInterval: TCCCSetting;
    FOnCCCStartTime: TCCCSetting;
    FOnDeviceCode: TDeviceType;
    FOnKTTSystemID: TEcuState;
    FOnKTTTelNumber: TDeviceState;
    FOnKTTRingCount: TDeviceState;
    FOnArmDsCheck: TDeviceState;
    FOnArmRelayCheck: TDeviceState;
    FOnDVRUseSetting: TCCCSetting;
    FOnDVRInfoSetting: TCCCSetting;
    FOnCARDREADERTelNumber: TDeviceState;
    FFTPUSE: Boolean;
    FOnGageMonitor: TDeviceState;
    FOnFirmwareProcess: TDeviceState;
    FOnFirmwareProcess2: TDeviceState;
    FOnPTMonitoringProcess: TDeviceState;
    FKTT812FirmwareDownLoadType: Boolean;
    FKTT812FirmwareStarting: Boolean;
    FOnKTT812FlashDataEvent: TEcuState;
    FOnKTT812FlashDataEndEvent: TEcuState;
    FSocketOutSenting: Boolean;
    FKTT812BroadFirmWareStarting: Boolean;
    FOnKTT812EcuFirmWareDownloadComplete: TEcuState;
    FOnConnectError: TNodeConnect;
    FOnKTT811FTPFirmWareDownloadComplete: TEcuState;
    FOnRelay2TypeCheck: TDeviceState;
    FOnCARDREADERCallTime: TDeviceState;
    FOnMainToLocalArm: TDeviceUsedSetting;
    FMainFromLocalArmDevice: string;
    FMainToLocalArmDevice: string;
    FOnMainFromLocalArm: TDeviceUsedSetting;
    FOnArmAreaUseData: TDeviceState;
    FOnDoorArmAreaData: TDeviceState;
    FOnZoneExtensionPortInfoData: TDeviceState;
    FOnDoorDSCheckUse: TDeviceState;
    FOnDoorDSCheckTime: TDeviceState;
    FOnZoneExtensionUseData: TDeviceState;
    FOnMemoryClearControl: TDeviceState;
    FOnFireRecovery: TDeviceState;
    FOnLineShortCheck: TEcuState;
    FOnExitButtonEvent: TCardAccessEvent;
    FOnJaejungDelayUse: TDeviceState;
    FOnCardAllClear: TEcuState;
    FOnJavaraSchedule: TDeviceState;
    FOnKTT812EcuFirmWareDownloadFailed: TEcuState;
    FOnCardReaderState: TEcuState;
    FOnJavaraArmClose: TDeviceState;
    FDataSending: Boolean;
    FOnJavaraAutoClose: TDeviceState;
    FOnZoneExtentionNetworkState: TEcuState;
    FCardFull: Boolean;
    FOnZoneUseRemoteControl: TEcuState;
    FSocketType: integer;
    FOnZoneExtentionVersion: TCardReaderVersion;
    FOnMaxCardCount: TEcuState;
    FOnKTTMuxID: TDeviceState;
    FOnPrimaryKTTType: TDeviceState;
    FOnDDNSServer: TDeviceState;
    FOnEventServer: TDeviceState;
    FOnDDNSQueryServer: TDeviceState;
    FonTCPServerPort: TDeviceState;
    FOnLineCheckStart: TRemoteControl;
    FOnLineCheckTime: TRemoteControl;
    FOnPoliceTelNum: TDeviceState;
    FonServerCardNF: TDeviceState;
    FonJavaraStopTime: TDeviceState;
    FOnCardReaderSoundSetting: TCardReaderTypeSetting;
    FOnICU300FirmWareProcess: TDeviceState;
    FOnGCU300_ICU300FirmwareDownloadState: TRemoteControl;
    FOnCardRegCardCNT: TCardGrade;
    FOnTimeCode: TDeviceState;
    FOnDoorTimeCodeUse: TDeviceState;
    FOnCardReaderExitSoundSetting: TCardReaderTypeSetting;
    procedure SetServerMode(const Value: Integer);
    procedure SetConnectMode(const Value: Integer);
    procedure SetSocketAddress(const Value: String);
    procedure SetSocketCOM(const Value: integer);
    procedure SetSocketPort(const Value: String);
    procedure SetNodeConnected(const Value: Boolean);
    procedure SetSocketConnected(const Value: Boolean);
    procedure SetDeviceID(const Value: string);
    procedure setFTPUSE(const Value: Boolean);
    procedure setDataSending(const Value: Boolean);
  private
    FirstSendDataList : TStringList;
    QuickSendDataList : TStringList;
    ReserveSendDataList : TStringList;
    SearchSendDataList : TStringList;
    CardSendDataList : TStringList;
    ConnectDeviceList : TStringList;
    EcuStateDeviceList : TStringList;

    L_DeviceBuffer : string;
    L_bSocketConnecting : Boolean;
    L_stReceiveHoliday : string;
    L_bDecoderFormat : Boolean;
    L_bKTT812DownloadFormat:Boolean;
    L_bSending : Boolean;
    L_nDelaySendTime : integer;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Private declarations }
    procedure AlarmVariable_Initialize;
    procedure ECUListAdd(aEcuID:string);
    procedure ECUListDelete(aEcuID:string);
  private
    Function ComPort9600Connect:integer;
    Function ComPort38400Connect:integer;
  private
    Function SendPacket(aEcuID,aCmd,aData,aVer:string;aQuick:Boolean=False;aPriority:integer=2):Boolean;
    Function SocketPutString(aData:string):Boolean;
    Function DataPacketProcess(aPacketData:string):Boolean;
    function KTT812DataPacektProcess( aPacketData: string):Boolean;
    function CheckKTT812FirmwareDataPacket(aData: String; var bData:String;var aPacketData:string):integer;
    procedure RcvKTT812FirmWareDownload(aEcuID,aGubun,aRealData:string);
  public
    Function ECUConnected(aEcuID:string;aConnected:Boolean):Boolean;
    function GetSearchBufferCount:integer;
  private
    //���� ��Ŷ �м�
    procedure  DeviceRcvAlarmData(aECUID,aVer,aRealData:string);
    procedure  DeviceRcvAlarmSearchData(aECUID,aVer,aRealData:string);
    //��� ����
    procedure  RegDataProcess(aECUID,aVer,aRealData:string);
    procedure  RcvDeviceID(aECUID,aVer, aRealData:string); //���ID�����ȸ
    procedure  RcvCardReader(aECUID,aVer, aRealData:string); //ī�帮�� �����ȸ
    procedure  RcvCardReaderSoundUse(aEcuID,aVer,aRealData:string); //ī�帮�� ���� ���� ���� ����
    procedure  RcvCardReaderExitSoundUse(aEcuID,aVer,aRealData:string); //ī�帮�� ���� ���� ���� ����
    procedure  RcvSysinfo(aECUID,aVer, aRealData:string);    //�ý��� ���� �����ȸ
    procedure  RcvJaejungDelayUse(aEcuID,aVer,aJaejungDlayUse:string);    //���ߵ�����
    procedure  RcvRelay(aECUID,aVer, aRealData:string);      //���������� �����ȸ
    procedure  RcvLampState(aECUID,aVer,aRealData:string);   //���� ���� ����
    procedure  RcvPort(aECUID,aVer, aRealData:string);       //Loop(��)���� �����ȸ
    procedure  RcvUsedAlarmdisplay(aECUID,aVer, aRealData:string); //�˶�ǥ�ñ� �����ȸ
    procedure  RcvUsedDevice(aECUID,aVer, aRealData:string); //Ȯ��� �������
    procedure  RcvDeviceType(aECUID,aVer,aRealData:string);
    procedure  RcvMainToLocalArm(aECUID,aVer, aRealData:string);
    procedure  RcvMainFromLocalArm(aECUID,aVer, aRealData:string);
    procedure  RcvWiznetInfo(aECUID,aVer, aRealData:string); //��Ʈ������
    procedure  RcvControlDialInfo(aECUID,aVer, aRealData:string);
    procedure  RcvKTTSystemId(aECUID,aVer, aRealData:string);   //���� �ý��۾��̵�
    procedure  RcvKTTTelNo(aECUID,aVer, aRealData:string);      //���� ���ڴ� ��ȭ��ȣ
    procedure  RcvCardReaderTelNo(aECUID,aVer, aRealData:string);      //ī�帮�� ��ȭ��ȣ
    procedure  RcvCallTime(aECUID,aVer, aRealData:string);  //ī�帮�� ��ȭ�ð�
    procedure  RcvCardType(aECUID,aVer, aRealData:string);   //ī��Ÿ��
    procedure  RcvDoorTimeCodeUse(aECUID,aVer, aRealData:string); //���Թ��� Ÿ���ڵ� �������
    procedure  RcvRingCount(aECUID,aVer, aRealData:string);  //
    procedure  DeviceState1Show(aECUID,aVer, aRealData:string);  //����� ���� ���� ��ȸ
    procedure  DoorLockState(aECUID,aVer, aRealData:string);  //�� ���� ��ȸ
    procedure  ZoneStateShow(aECUID,aVer, aRealData:string);
    procedure  ZoneSensState(aECUID,aVer, aRealData:string); //��� �̻� ����
    procedure  RcvFireRecovery(aECUID,aVer, aRealData:string); //ȭ�� ���� ����
    procedure  RcvCCCSettingData(aECUID,aVer, aRealData:string);
    procedure  RcvCCCControlData(aECUID,aVer,aRealData:string);
    procedure  RcvRelay2Type(aECUID,aVer, aRealData:string);
    procedure  RcvDoorDSCheckUse(aECUID,aVer, aRealData:string);
    procedure  RcvDoorDSCheckTIME(aECUID,aVer, aRealData:string);
    procedure  RcvArmDsCheck(aECUID,aVer, aRealData:string);
    procedure  RcvArmRelayCheck(aECUID,aVer, aRealData:string);
    procedure  RcvArmAreaUse(aEcuID,aVer,aRealData:string);
    procedure  RcvJavaraSchedule(aECUID,aVer, aRealData:string);
    procedure  RcvJavaraArmClose(aECUID,aVer, aRealData:string);
    procedure  RcvJavaraAutoClose(aECUID,aVer, aRealData:string);
    procedure  RcvDoorArmAreaGubun(aEcuID,aVer,aRealData:string);
    procedure  RcvDVRSettingData(aECUID,aVer, aRealData:string);
    procedure  RcvFTPCheck(aECUID,aVer, aRealData:string);
    procedure  RcvFTPDownLoadState(aECUID,aVer, aRealData:string);
    procedure  RcvZoneExtensionPortInfo(aECUID,aVer, aRealData:string);
    procedure  RcvZoneExtensionUse(aECUID,aVer, aRealData:string);
    procedure  RcvMemoryClearControl(aEcuID,aVer,aRealData:string);
    procedure  RcvPrimaryKTTTypeCheck(aECUID,aVer, aRealData:string);
    procedure  RcvKTTMuxIDCheck(aECUID,aVer, aRealData:string);
    procedure  RcvDDNSQueryServerCheck(aECUID,aVer, aRealData:string);
    procedure  RcvDDNSServerCheck(aECUID,aVer, aRealData:string);
    procedure  RcvEventServerCheck(aECUID,aVer, aRealData:string);
    procedure  RcvTCPServerPortCheck(aECUID,aVer, aRealData:string);
    procedure  RcvServerCardNFCheck(aECUID,aVer, aRealData:string);
    procedure  RcvJavaraStopTime(aECUID,aVer, aRealData:string);
    procedure  RcvPoliceTelNo(aECUID,aVer, aRealData:string);
    // �������� �޼��� �ڵ� ó��
    procedure  RemoteDataProcess(aECUID,aVer,aRealData:string);
    procedure  RcvDeviceCode(aECUID,aVer, aRealData:string);
    procedure  RcvSystemFunction(aECUID,aVer, aRealData:string);
    procedure  RcvDeviceVersion(aECUID,aVer, aRealData:string);
    procedure  RcvCardReaderVersion(aECUID,aVer, aRealData:string);
    procedure  RcvEcuState(aEcuId,aVer,aRealData:string);
    procedure  RcvCardReaderStateCheck(aEcuId,aVer,aRealData:string);
    procedure  RcvZoneExtentionNetworkStateCheck(aEcuId,aVer,aRealData:string);
    procedure  RcvZoneExtentionVersion(aECUID,aVer, aRealData:string);
    procedure  RcvLineShortCheck(aEcuId,aVer,aRealData:string);
    procedure  RcvZoneUseRemoteControl(aECUID,aVer, aRealData:string);
    procedure  RcvMaxCardCount(aECUID,aVer, aRealData:string);
    procedure  RcvLineCheckStart(aECUID,aVer, aRealData:string);
    procedure  RcvLineCheckTime(aECUID,aVer, aRealData:string);
    procedure  RcvGCU300_ICU300FirmwareDownloadState(aECUID,aRealData:string);

    //������������
    procedure  AccessDataProcess(aECUID,aVer,aRealData:string);
    procedure  RcvAccEventData(aECUID,aVer, aRealData:string);    // ����ī�� �̺�Ʈ
    procedure  RcvDoorEventData(aECUID,aVer, aRealData:string);   // ������ ���� ������ ó��
    procedure  RcvDoorinfo2(aECUID,aVer, aRealData:string);        //���Թ� ��� ����
    procedure  RcvAccControl(aECUID,aVer, aRealData:string);      //��� ���� ����
    procedure  RcvCardRegAck(aECUID,aVer, aRealData:string);      //ī��������
    procedure  RcvSch(aECUID,aVer, aRealData:string);             // ������ ����
    procedure  RcvHoliday(aECUID,aVer, aRealData:string);         // ���� ��ȸ
    procedure  RcvCardAllDelete(aECUID,aVer, aRealData:string);
    procedure  RcvTimeCode(aECUID,aVer, aRealData:string);         //Ÿ���ڵ� ����

    procedure  FirmwareProcess(aECUID,aVer,aRealData:string);

    procedure  FirmwareProcess2(aECUID,aVer,aRealData:string);

    procedure  BroadCastProcess(aECUID,aVer,aRealData:string);
    procedure  ICU300FirmWareRequest(aEcuID,aRealPacketData:string);

    procedure  BroadErrorProcess(aECUID,aVer,aRealData:string);

    procedure  PTMonitoringProcess(aECUID,aVer,aRealData:string);
    procedure  MessageProcess(aECUID,aVer,aRealData:string);

    procedure  GageMonitor(aECUID,aVer,aRealData:string);

    procedure  ErrorDataProcess(aECUID,aVer,aRealData:string) ;

  public
    LastConnectedTime: TDatetime;
    { Public declarations }
    Function SocketConnect:Boolean;
    Function SocketDisConnect : Boolean;
    Function DeviceConnectCheck(aEcuID:string):Boolean;
  private
    Function GetAlarmAreaGrade(aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8:string):string;
    Function GetDoorAreaGrade(aDoor1, aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8:string):string;
    Function Char2Ascii(aBuffer:pchar;aReturnCode:integer):string;
  public
    //����
    Function ChangeAlarmMode(aEcuID, aMode:string;aArmArea:integer = 0):Boolean;
    Function AllFireRecovery:Boolean;
    function RemoteDoorControl(aEcuID,aDoorNo,aControlType,aControl:string):Boolean;
    function ControlerReset(aEcuID:string):Boolean;
    Function MemoryClear(aEcuID:string):Boolean;
    Function ZoneUsedRemoteControl(aEcuID,aExtNo,aZoneNo,aUsed:string):Boolean;
  public
    //������� ���
    Function ID_Registration(aID:string):Boolean;
    Function UsedDevice_Registration(aUseEcu:string):Boolean;
    Function DeviceType_Registration(aUseEcuType:string):Boolean;
    Function RegistSerialWritewiznet(aIP,aSubNet,aGateway,aPort,aServerIP,aServerPort,aMode,aDhcp:string):Boolean;
    Function RegistMainToLocalArm(aEcuID, aSendData:string):Boolean;
    Function RegistMainFromLocalArm(aEcuID, aSendData:string):Boolean;
    Function RegistSystemInfo(aEcuID,aWatchPowerOff,aDelayIn,aDelayOut,aDoor1Type,aDoor2Type,
              aDoor3Type,aDoor4Type,aDoor5Type,aDoor6Type,aDoor7Type,aDoor8Type,aLocate: string):Boolean;
    Function RegistServerCardNF(aEcuID,aServerCardNF:string):Boolean;
    Function RegistRelay2Type(aEcuID,aRegistData:string):Boolean;
    Function RegistJaejungDelayUse(aEcuID,aRegistData:string):Boolean;
    Function RegistDoorSystemInfo(aEcuID,aDoorNo,aCardModeType,aDoorModeType,
              aDoorControlTime,aDoorLongOpenTime,aScheduleUse,aDoorStatusUse,
              aDoorLongTimeUse,aDoorLockType,aDoorFireOpenUse,aDoorDSOpenState,
              aRemoteOpen:string):Boolean;
    Function RegistDoorDSCheckUse(aEcuID,aDoorNo,aDSCheckUse:string):Boolean;
    Function RegistDoorDSCheckTime(aEcuID,aDoorNo,aDSCheckTimeSec:string):Boolean;
    Function RegistCardType(aEcuID,aCardType:string):Boolean;
    Function RegistCardReaderSound(aEcuID,aSoundUseType:string):Boolean;
    Function RegistCardReaderExitSound(aEcuID,stExitSoundUseType:string):Boolean;
    Function RegistCardReaderInfo(aEcuID:string;aReaderNo,aReaderUse,aReaderDoor,aReaderDoorLocate,aReaderBuildingLocate,aReaderArmArea:integer;aLocate:string):Boolean;
    Function RegistPortInfo(aEcuID, aPortNo, aWatchType,aDelayUse, aRecoverUse, aPortDelayTime, aStatusCode,aZoneArmArea,aLocate,aZoneUsed:string):Boolean;
    Function RegistZoneExtensionPortInfo(aEcuID, aExtNo, aSendData:string):Boolean;
    Function RegistAlartLampSiren(aEcuID, aAlertLamp,aAlertSiren:string):Boolean;
    Function CardDownLoad(aEcuID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
                          aAlarm,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8,aValidDate,
                          aPatrolCardType,aCardType,aCardPositionType,aPositionNum:string):Boolean;
    Function RegistrationDeviceSchedule(aEcuID,aDoorNo,aDayCode,aScheduleData:string):Boolean;
    Function registHoliday(aEcuID, aDoorNo,aCMD, aHoliday,aHolidayType:string):Boolean;
    Function registTime(aDate:string):Boolean;
    Function CdmaUseRegist(aData:string):Boolean;
    Function RegistcdmaSetData(aEcuID, aCdmaMin,aCdmaMux, aCdmaIP, aCdmaPort, aCdmachktime, aCdmarssi:string):Boolean;
    Function CCCInfoRegist(aIP,aPort:string):Boolean;
    Function CCCTimeIntervalRegist(aTime:string):Boolean;
    Function CCCStartTimeRegist(aTime:string):Boolean;
    Function DoorTimeCodeUse_Registration(aEcuID,aData:string):Boolean;
    Function DVRUseRegist(aData:string):Boolean;
    Function RegistDVRSetData(aEcuID, aDVRIP,aDVRPort:string):Boolean;
    Function RegistMacAddress(aMac:string):Boolean;
    Function KTTSystemID_Registration(aLinkusID:string):Boolean;
    Function RegistKTTTelNum(aNo,aTelNum:string):Boolean;
    Function RegistKTTRingCount(aArmRingCount,aDisArmRingCount:integer):Boolean;
    function RegistArmDsCheck(aEcuID,aDoorNo,aArmDsCheck:string):Boolean;    //812 ���� DSüũ
    function RegistArmRelay(aEcuID,aArmRelay:string):Boolean;
    function RegistArmAreaUse(aEcuID,aArmAreaUse:string):Boolean;
    function RegistDoorArmArea(aEcuID,aData:string):Boolean;
    function RegistAlertLampTime(aEcuID,aAlertLampTime:string):Boolean;
    function RegistAlertSirenTime(aEcuID,aAlertSirenTime:string):Boolean;
    function CardReaderTelNumberRegist(aEcuID,aNo,aTelNo:string):Boolean;
    function CardReaderCallTime_Registration(aEcuID,aCallTime:string;aDelay:Boolean=True):Boolean;
    function RegistZoneExtensionUse(aEcuID,aData:string):Boolean;
    Function RegistJavaraSchedule(aEcuID,aDoorNo,aData:string;aDelay:Boolean=True):Boolean;
    Function RegArmJavaraClose(aEcuID,aJavaraClose:string;aDelay:Boolean=True):Boolean;
    Function RegJavaraAutoClose(aEcuID,aJavaraAutoClose:string;aDelay:Boolean=True):Boolean;
    Function RegistJavaraStopTime(aEcuID,aData:string;aDelay:Boolean=True):Boolean;
    Function PrimaryKTT_Registration(aPrimaryKey:string;aDelay:Boolean=True):Boolean;
    Function KTTMuxID_Registration(aMuxID:string;aDelay:Boolean=True):Boolean;
    Function DDNSQueryServer_Registration(aServerIP,aServerPort:string;aDelay:Boolean=True):Boolean;
    Function DDNSServer_Registration(aServerIP,aServerPort:string;aDelay:Boolean=True):Boolean;
    Function EventServer_Registration(aServerIP,aServerPort:string;aDelay:Boolean=True):Boolean;
    Function ServerPort_Registration(aServerPort:string;aDelay:Boolean=True):Boolean;
    Function RegistLineCheckStart(aEcuID,aStartTime:string;aDelay:Boolean=True):Boolean;
    Function RegistLineCheckTime(aEcuID,aTime:string;aDelay:Boolean=True):Boolean;
    Function PoliceTel_Registration(aEcuID,aSendData:string;aDelay:Boolean=True):boolean;
    Function TimeCode_Registration(aEcuID,aTimeGroup,aData:string;aDelay:Boolean=True):boolean;
  public
    //��� ���� ��ȸ
    Function AlarmState_Check(aEcuID:string;aArmArea:integer;aDelay:Boolean=True;aMain:Boolean=False):Boolean; //���������ȸ
    function AlartLampSirenStateCheck(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    function AlertLampTimeCheck(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    function AlertSirenTimeCheck(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    function CardReaderCallTimeSearch(aEcuID,aCallTime:string;aDelay:Boolean=True):Boolean;
    Function CardReaderInfo_Check(aEcuID,aReaderNo:string;aDelay:Boolean=True;aPriority:integer=2):Boolean; //ī�帮�� ���� üũ
    function CardReaderStatusCheck(aEcuID:string;aDelay:Boolean=True):Boolean;
    function CardReaderTelNumberSearch(aEcuID,aTelNo:string):Boolean;
    Function CardReaderType_Check(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;  //ī�帮�� Ÿ�� üũ
    Function CardReaderSoundUse_Check(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;  //ī�帮�� ���� ��������
    Function CardReaderExitSoundUse_Check(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;  //ī�帮�� ���� ��������
    Function CardReaderVersion_Check(aEcuID,aReaderNo:string;aDelay:Boolean=True):Boolean; //ī�帮�� ���� üũ
    function CardSearchCancel(aEcuID:string):Boolean;
    Function CCCInfoCheck:Boolean;     //CCC Info ��ȸ
    Function CCCStartTimeCheck : Boolean; //CCC StartTimeCheck
    Function CCCTimeIntervalCheck : Boolean; //CCC TimeInterval
    Function CdmaUseCheck:Boolean;     //CDMA ��� ���� üũ
    Function CheckFTP(aEcuID:string;aDelay:Boolean=True):Boolean;
    Function CheckJaejungDelayUse(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    Function CheckMaxCardNo(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    Function CheckSystemFunction(aEcuID:string;aDelay:Boolean=True):Boolean;
    function DeviceCardRegCountSearch(aEcuID:string):Boolean;
    function DeviceCardSearch(aEcuID:string):Boolean; //
    Function DeviceCode_Check(aEcuID:string;aDelay:Boolean=False;aPriority:integer=2):Boolean;  //ECU/ICU Ÿ�� üũ
    function DeviceSchedule_Check(aEcuID,aDoorNo,aDayCode:string):Boolean;
    Function DeviceType_Check(aDelay:Boolean=False;aPriority:integer=2):Boolean;  //ECU/ICU Ÿ�� üũ
    Function DeviceVersion_Check(aEcuID:string;aDelay: Boolean=True;aPriority:integer=2;aDelayTime:integer=0):Boolean;  //��� ���� üũ
    Function DoorDSCheckTimeSearch(aEcuID,aDoorNo:string;aDelay:Boolean=True):Boolean;
    Function DoorDSCheckUseSearch(aEcuID,aDoorNo:string;aDelay:Boolean=True):Boolean;
    Function DoorLockDeviceState_Check(aEcuID:string):Boolean; //���Թ� ��� ���� ��ȸ
    Function DoorState_Check(aEcuID,aDoorNo:string;aDelay:Boolean=True):Boolean; //���Թ� ������ȸ
    Function DoorSystemInfo_Check(aEcuID,aDoorNo:string;aDelay:Boolean=True;aPriority:integer=2):Boolean; //���Թ�������ȸ
    Function DVRUseCheck(aEcuID:String):Boolean;
    Function DVRSetDataSearch(aEcuID:String):Boolean;
    function EcuStatusCheck:Boolean;         //Ȯ��� ��Ż��� üũ
    function Holiday_Search(aEcuID, aDoorNo, aDate,aHolidayType:string):string;
    Function ID_Check(aDelay:Boolean=False):Boolean;
    Function JavaraAutoCloseSearch(aEcuID:string;aDelay:Boolean=True):Boolean;
    Function JavaraCloseSearch(aEcuID:string;aDelay:Boolean=True):Boolean;
    Function JavaraScheduleSearch(aEcuID,aDoorNo:string;aDelay:Boolean=True):Boolean;
    Function JavaraStopTimeSearch(aEcuID:string;aDelay:Boolean=True):Boolean;
    function KTTRingCountSearch:Boolean;
    function KTTSystemIDSearch(aDelay:Boolean=True;aPriority:integer=2):Boolean;
    function KTTTelNumSearch(aNo:string):Boolean;
    function LineShortCheck(aDelay:Boolean=True):Boolean;
    function MacSearch:Boolean;
    Function MainFromLocalArmSearch(aEcuID:string;aDelay: Boolean=True):Boolean;
    Function MainToLocalArmSearch(aEcuID:string;aDelay: Boolean=True):Boolean;
    Function PortInfo_Check(aEcuID,aPortNo:string;aDelay:Boolean=True;aPriority:integer=2):Boolean; //��Ʈ�������üũ
    function PortState_Check(aEcuID:string):Boolean;  //��Ʈ����üũ
    Function SearchArmAreaUse(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    Function SearchArmDsCheck(aEcuID,aDoorNo:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    Function SearchArmRelay(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    Function SearchDoorArmArea(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    Function SearchDoorTimeCodeUse(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    Function SearchSystemZoneExtensionUse(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    Function SearchRelay2TypeCheck(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    Function SearchTimeCode(aEcuID,aNo:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    Function SysInfo_Check(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    Function ServerCardNFSearch(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    function TimeCheck:Boolean;
    Function UsedDevice_Check(aDelay:Boolean=True):Boolean; //Ȯ��� ���üũ
    function WiznetModuleInfo_Check(aDelay:Boolean=True):Boolean; //����� ���� ��ȸ
    function ZoneExtentionNetworkStatusCheck(aEcuID:string;aDelay:Boolean=True):Boolean;
    function ZoneExtentionPortStateCheck(aEcuID:string):Boolean;  //�� Ȯ��� ��Ʈ����üũ
    function ZoneExtensionSearch(aEcuID,aZoneExtNo:string;aDelay:Boolean=True;aPriority:integer=2):Boolean;
    Function ZoneExtensionVersion_Check(aEcuID,aZoneExtNo:string;aDelay:Boolean=True):Boolean; //��Ȯ��� ���� üũ
    Function ZoneSensState_Check:Boolean;  //�̻�߻� üũ
    Function ZoneUsedRemoteControlState(aEcuID,aExtNo:string;aDelay:Boolean=True):Boolean;  //������������������ȸ
    Function PrimaryKTT_Check(aDelay:Boolean=True):Boolean;
    Function KTTMuxID_Check(aDelay:Boolean=True):Boolean;
    Function DDNSQueryServer_Check(aDelay:Boolean=True):Boolean;
    Function DDNSServer_Check(aDelay:Boolean=True):Boolean;
    Function EventServer_Check(aDelay:Boolean=True):Boolean;
    Function TCPServerPort_Check(aDelay:Boolean=True):Boolean;
    Function PoliceTel_Check(aEcuID,aSendData:string;aDelay:Boolean=True):Boolean;
  public
    Function AllDeviceArmMode(aMode:string):Boolean;
    Function AllDeviceFireRecovery:Boolean;
  public
    Function KTT812BufferClear:Boolean;
    Function DirectSendPacket(aEcuID,aCmd,aData:string;aQuick:Boolean=False;aPriority:integer=2):Boolean;
    Function HexSendPacketEvent(aSendHexData:string):Boolean;
    Function SendKTT812FirmWarePacket(aHexCmd,aHexData:string):Boolean;
    Function SendBufferClear:Boolean;
  published
    property CardFull : Boolean read FCardFull write FCardFull;
    property DeviceID : string Read FDeviceID write SetDeviceID;

    property FTPUSE:Boolean read FFTPUSE write setFTPUSE;
    property DataSending:Boolean read FDataSending write setDataSending;
    Property ConnectMode: Integer Read FConnectMode write SetConnectMode;  //0:LAN 1:RS-232
    Property ServerMode: Integer Read FServerMode write SetServerMode;  //0:Client 1:ServerMode
    Property SocketAddress: String Read FSocketAddress write SetSocketAddress;
    Property SocketPort: String Read FSocketPort write SetSocketPort;
    Property SocketCOM: integer Read FSocketCOM write SetSocketCOM;
    Property SocketConnected : Boolean Read FSocketConnected write SetSocketConnected; //���� ���� ���� ����
    Property NodeConnected : Boolean Read FNodeConnected write SetNodeConnected; //��� ���� ���� �Ͽ� ID üũ�� �Ϸ�� ����
    property KTT812FirmwareDownLoadType:Boolean read FKTT812FirmwareDownLoadType write FKTT812FirmwareDownLoadType;
    property KTT812FirmwareStarting:Boolean read FKTT812FirmwareStarting write FKTT812FirmwareStarting;
    property KTT812BroadFirmWareStarting:Boolean read FKTT812BroadFirmWareStarting write FKTT812BroadFirmWareStarting;
    property SocketOutSenting:Boolean read FSocketOutSenting write FSocketOutSenting;
    property MainToLocalArmDevice : string read FMainToLocalArmDevice write FMainToLocalArmDevice ;
    property MainFromLocalArmDevice : string read FMainFromLocalArmDevice write FMainFromLocalArmDevice ;
    property SocketType : integer read FSocketType write FSocketType;

  published
    property OnPanelMessage: TPanelMessage read FOnPanelMessage write FOnPanelMessage;
    property OnNodeConnect: TNodeConnect read FOnNodeConnect write FOnNodeConnect;
    property OnECUConnect: TECUConnect read FOnECUConnect write FOnECUConnect;
    property OnPacketView : TPacketView read FOnPacketView write FOnPacketView;
    property OnReceivePacket: TReceivePacket read FOnReceivePacket write FOnReceivePacket;
    property OnServerModeConnect: TServerModeConnect read FOnServerModeConnect write FOnServerModeConnect;
    property OnConnectError: TNodeConnect read FOnConnectError write FOnConnectError;

    //�˶� �̺�Ʈ
    property OnAlarmEvent: TAlarmEvent read FOnAlarmEvent write FOnAlarmEvent;
    property OnFireRecovery : TDeviceState read FOnFireRecovery write FOnFireRecovery;
    //��� �̺�Ʈ
    property OnDeviceIDSetting:TDeviceIDSetting read FOnDeviceIDSetting write FOnDeviceIDSetting;
    property OnCardReaderSetting:TCardReaderSetting read FOnCardReaderSetting write FOnCardReaderSetting;
    property OnCardReaderSoundSetting : TCardReaderTypeSetting read FOnCardReaderSoundSetting write FOnCardReaderSoundSetting;
    property OnCardReaderExitSoundSetting : TCardReaderTypeSetting read FOnCardReaderExitSoundSetting write FOnCardReaderExitSoundSetting;
    property OnSystemSetting:TSystemSetting read FOnSystemSetting write FOnSystemSetting;
    property OnLampSirenOnOff:TLampSirenOnOff read FOnLampSirenOnOff write FOnLampSirenOnOff;
    property OnLampTime:TLampTime read FOnLampTime write FOnLampTime;
    property OnSirenTime:TSirenTime read FOnSirenTime write FOnSirenTime;
    property OnPortSetting:TPortSetting read FOnPortSetting write FOnPortSetting;
    property OnDeviceUsedSetting:TDeviceUsedSetting read FOnDeviceUsedSetting write FOnDeviceUsedSetting;
    property OnWiznetInfoSetting:TWiznetInfoSetting read FOnWiznetInfoSetting write FOnWiznetInfoSetting;
    property OnCardReaderTypeSetting:TCardReaderTypeSetting read FOnCardReaderTypeSetting write FOnCardReaderTypeSetting;
    property OnDeviceState:TDeviceState read FOnDeviceState write FOnDeviceState;
    property OnCDMASetting:TCCCSetting read FOnCDMASetting write FOnCDMASetting;
    property OnCCCInfoSetting:TCCCSetting read FOnCCCInfoSetting write FOnCCCInfoSetting;
    property OnCCCTimeInterval:TCCCSetting read FOnCCCTimeInterval write FOnCCCTimeInterval;
    property OnCCCStartTime:TCCCSetting read FOnCCCStartTime write FOnCCCStartTime;
    property OnKTTSystemID:TEcuState read FOnKTTSystemID write FOnKTTSystemID;
    property OnKTTTelNumber:TDeviceState read FOnKTTTelNumber write FOnKTTTelNumber;
    property OnKTTRingCount:TDeviceState read FOnKTTRingCount write FOnKTTRingCount;
    property OnArmDsCheck:TDeviceState read FOnArmDsCheck write FOnArmDsCheck;
    property OnArmRelayCheck:TDeviceState read FOnArmRelayCheck write FOnArmRelayCheck;
    property OnDoorDSCheckUse:TDeviceState read FOnDoorDSCheckUse write FOnDoorDSCheckUse;
    property OnDoorDSCheckTime:TDeviceState read FOnDoorDSCheckTime write FOnDoorDSCheckTime;
    property OnArmAreaUseData:TDeviceState read FOnArmAreaUseData write FOnArmAreaUseData;
    property OnDoorArmAreaData:TDeviceState read FOnDoorArmAreaData write FOnDoorArmAreaData;
    property OnDVRUseSetting:TCCCSetting read FOnDVRUseSetting write FOnDVRUseSetting;
    property OnDVRInfoSetting:TCCCSetting read FOnDVRInfoSetting write FOnDVRInfoSetting;
    property OnCARDREADERTelNumber:TDeviceState read FOnCARDREADERTelNumber write FOnCARDREADERTelNumber;
    property OnCARDREADERCallTime:TDeviceState read FOnCARDREADERCallTime write FOnCARDREADERCallTime;
    property OnGageMonitor:TDeviceState read FOnGageMonitor write FOnGageMonitor;
    property OnFirmwareProcess:TDeviceState read FOnFirmwareProcess write FOnFirmwareProcess;
    property OnFirmwareProcess2:TDeviceState read FOnFirmwareProcess2 write FOnFirmwareProcess2;
    property OnICU300FirmWareProcess:TDeviceState read FOnICU300FirmWareProcess write FOnICU300FirmWareProcess;
    property OnPTMonitoringProcess:TDeviceState read FOnPTMonitoringProcess write FOnPTMonitoringProcess;
    property OnRelay2TypeCheck:TDeviceState read FOnRelay2TypeCheck write FOnRelay2TypeCheck;
    property OnZoneExtensionPortInfoData:TDeviceState read FOnZoneExtensionPortInfoData write FOnZoneExtensionPortInfoData;
    property OnZoneExtensionUseData:TDeviceState read FOnZoneExtensionUseData write FOnZoneExtensionUseData;
    property OnMemoryClearControl:TDeviceState read FOnMemoryClearControl write FOnMemoryClearControl;
    property OnJaejungDelayUse:TDeviceState read FOnJaejungDelayUse write FOnJaejungDelayUse;
    property OnJavaraSchedule:TDeviceState read FOnJavaraSchedule write FOnJavaraSchedule;
    property OnJavaraArmClose:TDeviceState read FOnJavaraArmClose write FOnJavaraArmClose;
    property OnJavaraAutoClose:TDeviceState read FOnJavaraAutoClose write FOnJavaraAutoClose;
    property onJavaraStopTime:TDeviceState read FonJavaraStopTime write FonJavaraStopTime;
    property OnPrimaryKTTType:TDeviceState read FOnPrimaryKTTType write FOnPrimaryKTTType;
    property OnKTTMuxID:TDeviceState read FOnKTTMuxID write FOnKTTMuxID;
    property OnDDNSQueryServer : TDeviceState read FOnDDNSQueryServer write FOnDDNSQueryServer;
    property OnDDNSServer : TDeviceState read FOnDDNSServer write FOnDDNSServer;
    property OnEventServer : TDeviceState read FOnEventServer write FOnEventServer;
    property onTCPServerPort : TDeviceState read FonTCPServerPort write FonTCPServerPort;
    property onServerCardNF : TDeviceState read FonServerCardNF write FonServerCardNF;
    property OnPoliceTelNum:TDeviceState read FOnPoliceTelNum write FOnPoliceTelNum;
    property OnDoorTimeCodeUse : TDeviceState read FOnDoorTimeCodeUse write FOnDoorTimeCodeUse;
    property OnTimeCode : TDeviceState read FOnTimeCode write FOnTimeCode;

    // �������� �޼���
    property OnDeviceTime:TDeviceTime read FOnDeviceTime write FOnDeviceTime;
    property OnDeviceType:TDeviceType read FOnDeviceType write FOnDeviceType;
    property OnMainToLocalArm:TDeviceUsedSetting read FOnMainToLocalArm write FOnMainToLocalArm;
    property OnMainFromLocalArm:TDeviceUsedSetting read FOnMainFromLocalArm write FOnMainFromLocalArm;
    property OnDeviceCode:TDeviceType read FOnDeviceCode write FOnDeviceCode;
    property OnSystemFunction:TSystemFunction read FOnSystemFunction write FOnSystemFunction;
    property OnDeviceVersion:TDeviceVersion read FOnDeviceVersion write FOnDeviceVersion;
    property OnCardReaderVersion:TCardReaderVersion read FOnCardReaderVersion write FOnCardReaderVersion;
    property OnDeviceReset:TDeviceReset read FOnDeviceReset write FOnDeviceReset;
    property OnEcuState:TEcuState read FOnEcuState write FOnEcuState;
    property OnCardGrade:TCardGrade read FOnCardGrade write FOnCardGrade;
    property OnCardRegCardCNT:TCardGrade read FOnCardRegCardCNT write FOnCardRegCardCNT;
    property OnLineShortCheck:TEcuState read FOnLineShortCheck write FOnLineShortCheck;
    property OnCardAllClear:TEcuState read FOnCardAllClear write FOnCardAllClear;
    property OnCardReaderState :TEcuState read FOnCardReaderState write FOnCardReaderState;
    property OnZoneExtentionNetworkState :TEcuState read FOnZoneExtentionNetworkState write FOnZoneExtentionNetworkState;
    property OnZoneExtentionVersion:TCardReaderVersion read FOnZoneExtentionVersion write FOnZoneExtentionVersion;
    property OnZoneUseRemoteControl:TEcuState read FOnZoneUseRemoteControl write FOnZoneUseRemoteControl;
    property OnMaxCardCount:TEcuState read FOnMaxCardCount write FOnMaxCardCount;
    property OnLineCheckStart : TRemoteControl read FOnLineCheckStart write FOnLineCheckStart;
    property OnLineCheckTime : TRemoteControl read FOnLineCheckTime write FOnLineCheckTime;
    property OnGCU300_ICU300FirmwareDownloadState : TRemoteControl read FOnGCU300_ICU300FirmwareDownloadState write FOnGCU300_ICU300FirmwareDownloadState;

    //property OnCardListSearch:TCardListSearch read FOnCardListSearch write FOnCardListSearch;
    //�������� �̺�Ʈ
    property OnCardAccessEvent: TCardAccessEvent read FOnCardAccessEvent write FOnCardAccessEvent;
    property OnExitButtonEvent: TCardAccessEvent read FOnExitButtonEvent write FOnExitButtonEvent;
    property OnDoorEvent: TDoorEvent read FOnDoorEvent write FOnDoorEvent;
    property OnDoorSettingEvent :TDoorSettingEvent read FOnDoorSettingEvent write FOnDoorSettingEvent;
    property OnDoorState: TDoorState read FOnDoorState write FOnDoorState;
    property OnCardRegist: TCardRegist read FOnCardRegist write FOnCardRegist;
    property OnScheduleSetting : TScheduleSetting read FOnScheduleSetting write FOnScheduleSetting;
    property OnHolidaySetting : THolidaySetting read FOnHolidaySetting write FOnHolidaySetting;

    property OnKTT811FTPFirmWareDownloadComplete:TEcuState read FOnKTT811FTPFirmWareDownloadComplete write FOnKTT811FTPFirmWareDownloadComplete;

    //812Firmware Update
    property OnKTT812FlashDataEvent:TEcuState read FOnKTT812FlashDataEvent write FOnKTT812FlashDataEvent;
    property OnKTT812FlashDataEndEvent:TEcuState read FOnKTT812FlashDataEndEvent write FOnKTT812FlashDataEndEvent;
    property OnKTT812EcuFirmWareDownloadComplete:TEcuState read FOnKTT812EcuFirmWareDownloadComplete write FOnKTT812EcuFirmWareDownloadComplete;
    property OnKTT812EcuFirmWareDownloadFailed:TEcuState read FOnKTT812EcuFirmWareDownloadFailed write FOnKTT812EcuFirmWareDownloadFailed;

  end;

var
  dmSocket: TdmSocket;

implementation

uses
  dllFunction,
  uCheckValiable,
  uUtil;

{$R *.dfm}

{ TdmSocket }

function TdmSocket.ID_Check(aDelay:Boolean=False): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'ID' + FillZeroNumber(0,G_nIDLength + 2);

  G_bDeviceResponse[IDCHECK] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, aDelay);
  if aDelay then
    result := ResponseCheck(IDCHECK,G_nDelayTime);
end;

function TdmSocket.ComPort38400Connect: integer;
var
  nLoop : integer;
  bResult : Boolean;
begin
  result := PORTOPENFAIL;
  With CommPort do
  begin
    Baud:= 38400;
    try
      //ApdSLController.Monitoring:= True;
      OPen:= True;
    except
      Exit;
    end;
  end;
  SocketConnected := True;
  Delay(10);
  bResult := False;
  for nLoop := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    bResult := ID_Check(True);
    if bResult then break;
  end;
  if bResult then result := PORTCONNECTED
  else result := PORTCONNECTFAIL;

end;

function TdmSocket.ComPort9600Connect: integer;
var
  nLoop : integer;
  bResult : Boolean;
begin
  result := PORTOPENFAIL;
  With CommPort do
  begin
    Baud:= 9600;
    try
      //ApdSLController.Monitoring:= True;
      OPen:= True;
    except
      Exit;
    end;
  end;
  SocketConnected := True;
  Delay(10);
  bResult := False;
  for nLoop := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    bResult := ID_Check(True);
    if bResult then break;
  end;
  if bResult then result := PORTCONNECTED
  else result := PORTCONNECTFAIL;
end;

constructor TdmSocket.Create(AOwner: TComponent);
var
  i : integer;
begin
  inherited;
  LastConnectedTime := 0;
  NodeConnected := false;
  SocketConnected := False;

  DeviceID := Fillzeronumber(0,G_nIDLength);

  L_DeviceBuffer := '';
  L_bSocketConnecting := False;

  FirstSendDataList := TStringList.Create;
  QuickSendDataList := TStringList.Create;
  ReserveSendDataList := TStringList.Create;
  SearchSendDataList := TStringList.Create;
  CardSendDataList := TStringList.Create;
  ConnectDeviceList := TStringList.Create;
  EcuStateDeviceList := TStringList.Create;

  for i := 0 to 63 do
  begin
    G_bDeviceResponse[i] := False;
  end;
  KTT812FirmwareDownLoadType := False;
  SocketOutSenting := False;
  L_nDelaySendTime := 0;
  CardFull := False;
end;

destructor TdmSocket.Destroy;
begin
  if SocketConnected then SocketDisConnect;
  FirstSendDataList.Free;
  QuickSendDataList.Free;
  ReserveSendDataList.Free;
  SearchSendDataList.Free;
  CardSendDataList.Free;
  ConnectDeviceList.Free;
  EcuStateDeviceList.Free;

  inherited;
end;

function TdmSocket.SendPacket(aEcuID, aCmd, aData,aVer: string;
  aQuick: Boolean=False;aPriority:integer=2): Boolean;
var
  stPacket: string;
  nDataLength: Integer;
  stLen: string;
  nMsgNo: Integer;
  nIndex : integer;
begin
  Result := false;
  if Not SocketConnected then Exit;
  if G_bApplicationTerminate then Exit;
  Try
    nDataLength := (G_nIDLength + 14) + Length(aData);
    stLen := FillZeroNumber(nDataLength, 3);

    if aCmd = 'a' then {���� ó��}
       stPacket := PacketCreate(G_nProgramType,stLen,aVer,DeviceID + aEcuID,aCmd,aData,RecvMsgNo)
    else {���� or ��� }
    begin
      nMsgNo  := SendMsgNo;
      stPacket := PacketCreate(G_nProgramType,stLen,aVer,DeviceID + aEcuID,aCmd,aData,inttostr(nMsgNo));
      if nMsgNo >= 9 then SendMsgNo := 0
      else SendMsgNo := nMsgNo + 1;
    end;

    if aPriority = 1 then
    begin
      //FirstSendDataList.Add(stPacket);
      SocketPutString(stPacket); //�ӵ� ������ ���� �ٷ� ����
    end else
    begin
      if aQuick then
      begin
        QuickSendDataList.Add(stPacket);
      end else
      begin
        if aPriority = 2 then
          ReserveSendDataList.Add(stPacket)
        else if aPriority = 3 then
        begin
          nIndex := SearchSendDataList.IndexOf(stPacket); //��ȸ ���ۿ� �Ȱ��� �����Ͱ� ������ ��ȸ ���� ���� ��ŷ� ���ϸ� ���̱� ����
          if nIndex > -1 then
          begin
            SearchSendDataList.Delete(nIndex);
          end;
          SearchSendDataList.Add(stPacket);
        end else if aPriority = 4 then
        begin
          CardSendDataList.Add(stPacket);
        end;
      end;
    end;
  Finally
    DataSending := True;
  End;
  {
  if aQuick then
  begin
    SocketPutString(stPacket);
  end else
  begin
    ReserveSendDataList.Add(stPacket);
  end; //}
end;
function TdmSocket.DirectSendPacket(aEcuID, aCmd, aData: string;
  aQuick: Boolean=False;aPriority:integer=2): Boolean;
begin
  SendPacket(aEcuID,aCmd,aData,G_stDeviceVer,aQuick,aPriority);
end;
procedure TdmSocket.SetConnectMode(const Value: Integer);
begin
  FConnectMode := Value;
  if Value = 0 then
      CommPort.DeviceLayer:= dlWinsock
  else if Value = 1 then
      CommPort.DeviceLayer:= dlWin32;
end;

procedure TdmSocket.SetNodeConnected(const Value: Boolean);
var
  i : integer;
begin
  if FNodeConnected = Value then exit;
  FNodeConnected := Value;
  if Assigned(FOnNodeConnect) then
  begin
    OnNodeConnect(Self,Value);
  end;
  if Not Value then
  begin
    if ConnectDeviceList.Count > 0 then
    begin
      for i := ConnectDeviceList.Count - 1 to 0 do
      begin
        ECUConnected(ConnectDeviceList.Strings[i],False);
      end;
    end;
  end;

{  if Value then
  begin
    EcuStatusCheck;   
  end;   }
end;

procedure TdmSocket.SetServerMode(const Value: Integer);
begin
  FServerMode := Value;
  if Value = 0 then
    CommPort.wsMode:= wsClient
  else if Value = 1 then
    CommPort.wsMode:= wsServer;
end;

procedure TdmSocket.SetSocketAddress(const Value: String);
begin
  FSocketAddress := Value;
  CommPort.wsAddress :=  Value;
  IdTCPClient.Host := Value;
  ClientSocket.Host := Value;
  dmWinSocket.ConnectIP := Value;
end;

procedure TdmSocket.SetSocketCOM(const Value: integer);
begin
  FSocketCOM := Value;
  CommPort.ComNumber:= Value;
end;

procedure TdmSocket.SetSocketConnected(const Value: Boolean);
var
  i : integer;
begin
  if FSocketConnected = Value then Exit;
  FSocketConnected := Value;
  if Value then
  begin
    ECUListAdd('00');
  end else
  begin
    L_bSending := False;
    for i := EcuStateDeviceList.Count -1 downto 0 do
    begin
      ECUListDelete(EcuStateDeviceList.Strings[i]);
    end;
    NodeConnected := Value;
  end;
end;

procedure TdmSocket.SetSocketPort(const Value: String);
begin
  FSocketPort := Value;
  CommPort.wsPort:=    Value;
  ClientSocket.Port := strtoint(Value);
  IdTCPClient.Port := strtoint(Value);
  dmWinsocket.ConnectPort := strtoint(Value);
end;

Function TdmSocket.SocketConnect:Boolean;
var
  nConnected : integer;
  FirstTickCount : double;
begin
  result := False;
  if L_bSocketConnecting then Exit;
  Try
    L_bSocketConnecting := True;
    NodeConnected := False;
    CommPort.OPen:= False;
    Delay(100);
    if ConnectMode = 0 then //LAN �����̸�
    begin
      if SocketType = 0 then
      begin
        With CommPort do
        begin
          //ApdSLController.Monitoring:= True;
          Try
            OPen:= True;
          Except
            Exit;
          End;
          if ServerMode = 1 then
          begin
            result := True;
            Exit;
          end;
          //���⼭ Connected �� ���� ��� DELAYTIME ��ŭ
          FirstTickCount := GetTickCount + DELAYTIME;
          While Not SocketConnected do
          begin
            Application.ProcessMessages;
            if GetTickCount > FirstTickCount then Break;
          end;
          if Not SocketConnected then Exit; //Delay Time ���� ���� ���� ����
          result := True;
          //NodeConnected := ID_Check;    //2011.07.19 ó�� ���ӽ� ���̵� üũ ���� ����
          //NodeConnected := True;
        end;
      end else if SocketType = 1 then
      begin
        ClientSocket.Active := True;
        //���⼭ Connected �� ���� ��� DELAYTIME ��ŭ
        FirstTickCount := GetTickCount + DELAYTIME;
        While Not SocketConnected do
        begin
          Application.ProcessMessages;
          if GetTickCount > FirstTickCount then Break;
        end;
        if Not SocketConnected then Exit; //Delay Time ���� ���� ���� ����
        result := True;
      end else if SocketType = 2 then
      begin
        IdTCPClient.Connect(1000);
        result := SocketConnected;
      end else if SocketType = 3 then    //WinSocket
      begin
        dmWinsocket.Open := True;
        //���⼭ Connected �� ���� ��� DELAYTIME ��ŭ
        FirstTickCount := GetTickCount + DELAYTIME;
        While Not SocketConnected do
        begin
          Application.ProcessMessages;
          if GetTickCount > FirstTickCount then Break;
        end;
        if Not SocketConnected then Exit; //Delay Time ���� ���� ���� ����
        result := True;
      end;
    end else if ConnectMode = 1 then  //RS-232 �����̸�
    begin
      nConnected := ComPort9600Connect;
      if nConnected <> PORTCONNECTED then
      begin
        if nConnected = PORTOPENFAIL then
        begin
          showmessage('��Ʈ���� ����');
          Exit;
        end else
        begin
          nConnected := ComPort38400Connect;
          if nConnected <> PORTCONNECTED then
          begin
            exit;
          end;
        end;
        //result := ID_Check;
      end;
      result := True;
    end;
    NodeConnected := result;
  Finally
    L_bSocketConnecting := False;
  End;

end;

function TdmSocket.SocketDisConnect: Boolean;
begin
  result := False;
  Try
    NodeConnected := False;
    if Commport.Open then
    begin
      Commport.FlushInBuffer;
      Commport.FlushOutBuffer;
      Commport.Open := false;
      SocketConnected := False;
    end;
    if SocketType = 0 then
    begin
    end else if SocketType = 1 then
    begin
      ClientSocket.Active := False;
    end else if SocketType = 2 then
    begin
      IdTCPClient.Disconnect;
    end else if SocketType = 3 then    //WinSocket
    begin
      dmWinsocket.Open := False;
    end;
  Except
    Exit;
  End;
  result := True;
end;

procedure TdmSocket.CommportWsConnect(Sender: TObject);
begin
  LastConnectedTime:= Now;
  SocketConnected := True;
  if Assigned(FOnPanelMessage) then
  begin
    OnPanelMessage(Self,'���� IP:' + SocketAddress );
  end;
end;

procedure TdmSocket.CommportWsDisconnect(Sender: TObject);
begin
  SocketConnected := False;
  if Assigned(FOnPanelMessage) then
  begin
    OnPanelMessage(Self,SocketAddress + ' ����' );
  end;
end;

procedure TdmSocket.CommportWsError(Sender: TObject; ErrCode: Integer);
begin
  if ErrCode = 10035 then
  begin
    LastConnectedTime:= Now;
    SocketConnected := True;
    if Assigned(FOnPanelMessage) then
    begin
      OnPanelMessage(Self,'���� IP:' + SocketAddress );
    end;
    Exit;
  end;
  //  ErrCode := 0;
  //Commport.Open := False;  --���⼭ ��Ʈ�� Close �ϸ� ���ѷ���
  SocketConnected := False;
  if Assigned(FOnPanelMessage) then
  begin
    OnPanelMessage(Self,' ���ӽ��� - ' + inttostr(ErrCode) );
  end;
  if Assigned(FOnConnectError) then
  begin
    OnConnectError(Self,False);
  end;

end;

procedure TdmSocket.CommportWsAccept(Sender: TObject; Addr: TInAddr;
  var Accept: Boolean);
var
  ConnectedIP: string;
begin
  ConnectedIP:= InttoStr(Ord(Addr.S_un_b.s_b1))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b2))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b3))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b4));

  if SocketAddress = ConnectedIP then
  begin
    SocketConnected := True;
    Accept := true;
    if Assigned(FOnPanelMessage) then
    begin
      OnPanelMessage(Self,ConnectedIP + ' ����');
    end;
    if Assigned(FOnServerModeConnect) then
    begin
      OnServerModeConnect(Self);
    end;
    {
    Delay(10);
    for nLoop := 0 to G_nLoopCount - 1 do
    begin
      bResult := ID_Check;
      if bResult then break;
    end;
    //bResult := ID_Check;
    NodeConnected := true;  }
  end else
  begin
    if Assigned(FOnPanelMessage) then
    begin
      OnPanelMessage(Self,ConnectedIP + ' ���Ӻ���');
    end;
    Accept := False;
  end;

end;

function TdmSocket.SocketPutString(aData: string): Boolean;
begin
  result := False;
  if Not SocketConnected then Exit;
  if (SocketType = 0) or (ConnectMode = 1) then
  begin
    Commport.PutString(aData);
  end else if SocketType = 1 then
  begin
    ClientSocket.Socket.SendText(aData);
  end else if SocketType = 2 then
  begin
    IdTCPClient.Write(aData);
  end else if SocketType = 3 then
  begin
    dmWinsocket.PutString(aData);
  end;
  if Assigned(FOnPacketView) then
  begin
    OnPacketView(Self,aData,'TX');
  end;


end;

procedure TdmSocket.CommportTriggerAvail(CP: TObject; Count: Word);
var
  stTemp: string;
  i: Integer;
  bLoop : Boolean;
  stLeavePacketData : string;
  stPacketData : string;
  nFormat : integer;
begin
  LastConnectedTime:= Now;
  stTemp := '';
  for i := 1 to Count do stTemp := stTemp + TApdWinsockPort(CP).GetChar;

  //NodeConnected:=True;
  if KTT812FirmwareDownLoadType then  //KTT812 Firmware Download ���̸�
  begin
    stTemp := ASCII2Hex(stTemp);
  end;

  L_DeviceBuffer := L_DeviceBuffer + stTemp;

  bLoop := False;
  repeat
    if Trim(L_DeviceBuffer) = '' then Exit;

    if Not KTT812FirmwareDownLoadType then
    begin
      nFormat := PacketFormatCheck(L_DeviceBuffer,G_nProgramType,stLeavePacketData,stPacketData);
      {/*
       nFormat : -1 -> ������ ����
                 -2 -> ���̰� ª�� ����
                  1 ->  STX ����
                  2 ->  SOH ����
      */}
    end else
    begin
      nFormat := CheckKTT812FirmwareDataPacket(L_DeviceBuffer,stLeavePacketData,stPacketData);
    end;
    L_DeviceBuffer:= stLeavePacketData;

    if nFormat < 0 then
    begin
      if L_DeviceBuffer = '' then break;
      if nFormat = -1 then  //������ ���� �ΰ��
      begin
        if Assigned(FOnPacketView) then
        begin
          OnPacketView(Self,L_DeviceBuffer + '[' + Ascii2Hex(L_DeviceBuffer) + ']','Er');
        end;
         Delete(L_DeviceBuffer,1,1);
         continue;
      end else break;   //���� ���̰� �۰� ���� ���

    end;

    L_bDecoderFormat := False;
    L_bKTT812DownloadFormat := False;
    if nFormat = 1 then L_bDecoderFormat := False
    else if nFormat = 2 then L_bDecoderFormat := True
    else if nFormat = 3 then L_bKTT812DownloadFormat := True
    else continue;

    if L_bDecoderFormat then continue;   //���ڴ� ������ ��� ó�� ���� ����

    if stPacketData <> '' then
    begin
      if L_bKTT812DownloadFormat then KTT812DataPacektProcess(stPacketData)
      else DataPacketProcess(stPacketData);
    end;

    if L_bKTT812DownloadFormat then
    begin
      if pos(KTT812FirmwareHeader,L_DeviceBuffer) = 0 then bLoop := True
      else bLoop := False;
    end else
    begin
      if pos(ETX,L_DeviceBuffer) = 0 then bLoop := True
      else bLoop := False;
    end;
    Application.ProcessMessages;
  until bLoop;

end;

function TdmSocket.DataPacketProcess(aPacketData: string): Boolean;
var
  stECUID : string;
  stCMD : string;
  stRealData : string;
begin
  result := False;
  if aPacketData = '' then Exit;
  if Assigned(FOnPacketView) then
  begin
    OnPacketView(Self,aPacketData,'RX');
  end;
  DeviceID := Copy(aPacketData, 8, G_nIDLength);
  stECUID := copy(aPacketData,8 + G_nIDLength,2);
  stCMD:= aPacketData[G_nIDLength + 10];
  RecvMsgNo:= aPacketData[G_nIDLength + 11];
  G_stDeviceVer := copy(aPacketData,6,2);

  stRealData := Copy(aPacketData,G_nIDLength + 12,Length(aPacketData)-(G_nIDLength + 14));

  //if (pos('Bad Command',aPacketData) > 0) or (pos('COMM ERROR',aPacketData) > 0 ) or (pos('UNUSED',aPacketData) > 0 ) then
  if (pos('COMM ERROR',aPacketData) > 0 ) or (pos('UNUSED',aPacketData) > 0 ) then
  begin
    ECUConnected(stECUID,False);
  end else
  begin
    if (stCMD <> 'A') and (stCMD <> 'o') then ECUConnected(stECUID,True);//��ſ��� ������ ��쵵 ����
  end;

  if (stCMD = 'a') then
  begin
    Exit;
  end else if (stCMD <> 'c') then
  begin
    if G_bEventControlerSave then
      SendPacket(stECUID, 'a', 'w060',G_stDeviceVer, true,1)
    else SendPacket(stECUID, 'a', 'w000',G_stDeviceVer, true,1);
  end;

  {���� ������ Ŀ�ǵ庰 ó��}
  { ================================================================================
  "A" = Alarm Data
  "I" = Initial Data
  "R" = Remote Command
  "e" = ENQ
  "E" = ERROR
  "a" = ACK
  "n" = NAK
  "r" = Remote Answer
  "c" = Access Control data
  �� c(�������� ������)�ΰ�쿡�� ACK �� 'c' command�� ����� ������ �ؾ� �Ѵ�.
  �� ACK ������ �ι� �־�� �Ѵ�.(����ü ��Ŷ����,���������� ����)
   ================================================================================ }

  case stCMD[1] of
    'A':{�˶�}          begin  DeviceRcvAlarmData(stECUID,G_stDeviceVer,stRealData)         end;
    'o':{�˶���ȸ}      begin  DeviceRcvAlarmSearchData(stECUID,G_stDeviceVer,stRealData)   end;
    'i':{Initial}       begin  RegDataProcess(stECUID,G_stDeviceVer,stRealData)             end;
    'R':{Remote}        begin  RemoteDataProcess(stECUID,G_stDeviceVer,stRealData)          end;
    'r':{Remote Answer} begin  RemoteDataProcess(stECUID,G_stDeviceVer,stRealData)          end;
    'c':{��������}      begin  AccessDataProcess(stECUID,G_stDeviceVer,stRealData)          end;
    'f':{�߿���}        begin  FirmwareProcess(stECUID,G_stDeviceVer,stRealData)            end;
    'F':{�߿���}        begin  FirmwareProcess2(stECUID,G_stDeviceVer,stRealData)           end;
    '*':{��ε�ĳ��Ʈ}  begin  BroadCastProcess(stECUID,G_stDeviceVer,stRealData)           end;
    'E':{ERROR} begin  ErrorDataProcess(stECUID,G_stDeviceVer,stRealData)       end;
    'm':{���������� ����͸� } begin PTMonitoringProcess(stECUID,G_stDeviceVer,stRealData)  end;
    'M':{�޼������� } begin MessageProcess(stECUID,G_stDeviceVer,stRealData)  end;
    '#':{������ �� ����͸�} begin GageMonitor(stECUID,G_stDeviceVer,stRealData)            end;
    'e':{ENQ}         begin {ErrorDataProcess(stECUID,G_stDeviceVer,stRealData) }           end;
    else {error �߻�: [E003]���� ���� ���� Ŀ�ǵ�}  begin ErrorDataProcess(stECUID,G_stDeviceVer,stRealData) end;
  end;

  Result:= True;
end;

procedure TdmSocket.SetDeviceID(const Value: string);
begin
  if FDeviceID = Value then Exit;
  FDeviceID := Value;
end;

function TdmSocket.DeviceConnectCheck(aEcuID: string): Boolean;
begin
  result := False;
  Try
    if ConnectDeviceList.IndexOf(aEcuID) > -1 then result := True;
  Except
    Exit;
  End;
end;

function TdmSocket.ECUConnected(aEcuID: string;
  aConnected: Boolean): Boolean;
var
  nIndex : integer;
begin
  result := True;
  if aConnected then
  begin
    if ConnectDeviceList.IndexOf(aEcuID) < 0 then ConnectDeviceList.Add(aEcuID);
  end else
  begin
    if ConnectDeviceList.IndexOf(aEcuID) > -1 then ConnectDeviceList.Delete(ConnectDeviceList.IndexOf(aEcuID));
  end;

  nIndex := EcuStateDeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  if TSocketECUState(EcuStateDeviceList.Objects[nIndex]).Connected = aConnected then Exit;
  TSocketECUState(EcuStateDeviceList.Objects[nIndex]).Connected := aConnected;
  
  if Assigned(FOnECUConnect) then
  begin
    OnECUConnect(Self,aEcuID,aConnected);
  end;
end;


procedure TdmSocket.ECUListAdd(aEcuID: string);
var
  oEcuState : TSocketECUState;
  nIndex : integer;
begin
  nIndex := EcuStateDeviceList.IndexOf(aEcuID);
  if nIndex > -1 then Exit;
  oEcuState := TSocketECUState.Create(self);
  oEcuState.ECUID := aEcuID;

  EcuStateDeviceList.AddObject(aEcuID,oEcuState);
  EcuStateDeviceList.Sort;

end;

procedure TdmSocket.ECUListDelete(aEcuID: string);
var
  nIndex : integer;
begin
  nIndex := EcuStateDeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  TSocketECUState(EcuStateDeviceList.Objects[nIndex]).Free;
  EcuStateDeviceList.Delete(nIndex);
end;

{��������}
procedure TdmSocket.AccessDataProcess(aECUID,aVer, aRealData: string);
var
  msgCode: Char;
  stTemp : string;
begin
  msgCode:= aRealData[1];

  {ACK ����:���԰� DOOR}
  if (msgCode <> 'a') and (msgCode <> 'b') and (msgCode <> 'c') and
     (msgCode <> 'l') and (msgCode <> 'm') and (msgCode <> 'n')
  then
  begin
    if G_bEventControlerSave then
      stTemp:='Y' + Copy(aRealData,2,2)+'  '+'a' + '  w060'
    else stTemp:='Y' + Copy(aRealData,2,2)+'  '+'a' + '  w000';  //Temp �����͸� �ްڴ�
    SendPacket(aECUID, 'c', stTemp,aVer, true,1);
  end;

  {�������� ������ ó��}
  case msgcode of
     //'F': RcvTelEventData(aECUID,aVer, aRealData);
    'E': RcvAccEventData(aECUID,aVer, aRealData);
    'D': RcvDoorEventData(aECUID,aVer, aRealData);
    'a': RcvDoorinfo2(aECUID,aVer, aRealData);        //���Թ� ��� ����
    'b': RcvDoorinfo2(aECUID,aVer, aRealData);        //���Թ� ��ȸ ����
    'c': RcvAccControl(aECUID,aVer, aRealData);      //��� ���� ����
'l','n','m','e','h','d','f': RcvCardRegAck(aECUID,aVer, aRealData);  //ī��������
's','p': RcvSch(aECUID,aVer, aRealData);             // ������ ����
'r','q': RcvHoliday(aECUID,aVer, aRealData);         // ���� ��ȸ
't','u': RcvTimeCode(aECUID,aVer, aRealData);                     // Ÿ���ڵ� ����
    'o': RcvCardAllDelete(aECUID,aVer, aRealData);
  end;
end;
{��ε�ĳ��Ʈ}
procedure TdmSocket.BroadCastProcess(aECUID,aVer, aRealData: string);
var
  stCode : string;
  stGubun : string;
begin
  stCode:= Copy(aRealData,1,2);
  stGubun:= Copy(aRealData,3,2);

  if stCode = 'BC' then   //�۽ſ� ���� Ack�� �����
  begin
  end else if stCode = 'bq' then  //Main ��忡�� ������ ��û��
  begin
  end else if stCode = 'be' then //������ �۽� �Ϸ� ���� �˷�����
  begin
  end else if stCode = 'BL' then //������ ���Ž���
  begin
  end else if stCode = 'LQ' then //ICU300Firmware
  begin
    if stGubun = '10' then ICU300FirmWareRequest(aECUID,aRealData);
  end else
  begin
      //���⼭ FirmWare File ��������.
  end;
end;
{��ε�ĳ��Ʈ����}
procedure TdmSocket.BroadErrorProcess(aECUID,aVer, aRealData: string);
begin
//���⼭ ���� ó�� ����
end;

{�˶�}
procedure TdmSocket.DeviceRcvAlarmData(aECUID,aVer, aRealData: string);
var
  stTime : string;
  stSubCLass : string;
  stSubAddr : string;
  stZone : string;
  stMode : string;
  stStatus : string;
  stLoop : string;
  stState : string;
  stOper : string;
begin
  stTime     := copy(aRealData,2,14);
  stSubCLass := copy(aRealData,16,2);
  stSubAddr  := copy(aRealData,18,2);
  stZone     := copy(aRealData,20,2);
  stMode     := copy(aRealData,22,1);
  stStatus   := copy(aRealData,23,2);
  stLoop     := copy(aRealData,25,2);
  stState    := copy(aRealData,27,1);
  if aVer = 'ST' then
  begin
    if isDigit(copy(aRealData,28,2)) then stOper := copy(aRealData,30,strtoint(copy(aRealData,28,2)))
    else stOper     := copy(aRealData,28,10);
  end
  else
  begin
    if isDigit(copy(aRealData,28,2)) then
    begin
      if copy(aRealData,28,2) = '16' then
      begin
        stOper := copy(aRealData,30,strtoint(copy(aRealData,28,2)));
      end else
      begin
        stOper     := copy(aRealData,28,10);
      end;
    end else stOper     := copy(aRealData,28,10);
  end;

  if Assigned(FOnAlarmEvent) then
  begin
    OnAlarmEvent(Self,aECUID,'A',stTime,stSubCLass,stSubAddr,stZone,stMode,stStatus,stLoop,stState,stOper);
  end;

  if (stSubCLass = 'MN') or (stSubCLass = 'EX') or (stSubCLass = 'SC') then
  begin
    if stStatus = 'NF' then ECUConnected(aECUID,False)
    else ECUConnected(aECUID,True);
  end else ECUConnected(aECUID,True);

end;

procedure TdmSocket.ErrorDataProcess(aECUID,aVer, aRealData: string);
var
  stCmd : string;
begin
  //���⼭ ���� ������ ��������.
  stCmd := copy(aRealData,1,4);
  if stCmd = 'ID00' then G_bDeviceResponse[IDCHECK] := True
  else if stCmd = 'EX02' then G_bDeviceResponse[DEVICETYPECHECK] := True
  else if stCmd = 'EX00' then G_bDeviceResponse[USEDEVICECHECK] := True
  else if stCmd = 'VR00' then G_bDeviceResponse[DEVICEVERSIONCHECK] := True
  else if stCmd = 'NW00' then
  begin
    G_bDeviceResponse[SERIALWIZNET] := True;
    G_bDeviceResponse[WIZNETMODULECHECK] := True;
    G_bDeviceResponse[MACINFO] := True;
  end else if stCmd = 'SY00' then G_bDeviceResponse[SYSINFOCHECK] := True
  else if stCmd = 'RD00' then G_bDeviceResponse[ALARMSTATECHECK] := True
  else if stCmd = 'rd01' then G_bDeviceResponse[ALARMSTATECHECK] := True
  else if copy(stCmd,1,2) = 'MC' then G_bDeviceResponse[ALARMCONTROL] := True
  else if copy(stCmd,1,2) = 'B0' then G_bDeviceResponse[DOORSYSTEMCHECK] := True
  else if copy(stCmd,1,2) = 'A0' then G_bDeviceResponse[DOORSYSTEMCHECK] := True
  else if stCmd = 'SM20' then G_bDeviceResponse[LOCKSTATECHECK] := True
  else if stCmd = 'SM24' then G_bDeviceResponse[ZONESENSECHECK] := True
  else if stCmd = 'Ct00' then G_bDeviceResponse[CARDREADERTYPE] := True
  else if copy(stCmd,1,2) = 'CV' then G_bDeviceResponse[CARDREADERVERSION] := True
  else if stCmd = 'SM10' then G_bDeviceResponse[PORTSTATE] := True
  else if stCmd = 'cs00' then G_bDeviceResponse[ECUSTATE] := True
  else if stCmd = 'cs01' then G_bDeviceResponse[conCARDREADERSTATE] := True
  else if stCmd = 'cs03' then G_bDeviceResponse[conZONEEXTENTIONNETWORK] := True
  else if stCmd = 'cs90' then G_bDeviceResponse[conLineShortCheck] := True
  else if stCmd = 'CD01' then G_bDeviceResponse[conCARDRegCardCnt] := True
  else if stCmd = 'CD11' then G_bDeviceResponse[CARDLIST] := True
  else if stCmd = 'CD10' then G_bDeviceResponse[CARDLISTCANCEL] := True
  else if copy(stCmd,1,2) = 'P0' then G_bDeviceResponse[SCHEDULE] := True
  else if copy(stCmd,1,2) = 'R0' then G_bDeviceResponse[HOLIDAY] := True
  else if stCmd = 'TM00' then G_bDeviceResponse[TIME] := True
  else if stCmd = 'WL00' then G_bDeviceResponse[USECDMACHECK] := True
  else if stCmd = 'WL01' then G_bDeviceResponse[conCCCInfoCHECK] := True
  else if stCmd = 'WL20' then G_bDeviceResponse[conCCCTimeIntervalCheck] := True
  else if stCmd = 'WL21' then G_bDeviceResponse[conCCCStartTimeCheck] := True
  else if stCmd = 'VR01' then G_bDeviceResponse[DEVICECODECHECK] := True
  else if stCmd = 'Id00' then G_bDeviceResponse[KTTSYSTEMID] := True
  else if stCmd = 'Tn00' then G_bDeviceResponse[KTTTELNUM] := True
  else if stCmd = 'tn00' then G_bDeviceResponse[conPoliceTel] := True
  else if stCmd = 'Rc00' then G_bDeviceResponse[KTTRINGCOUNT] := True
  else if stCmd = 'RS00' then G_bDeviceResponse[DEVICERESET] := True
  else if stCmd = 'DL01' then G_bDeviceResponse[ARMDSCHECK] := True
  else if stCmd = 'fn02' then G_bDeviceResponse[conARMAREAUSE] := True
  else if stCmd = 'fn05' then G_bDeviceResponse[ARMRELAYTYPE] := True
  else if stCmd = 'fn06' then G_bDeviceResponse[conMaxCardCountCheck] := True
  else if stCmd = 'fn17' then G_bDeviceResponse[conPrimaryKTTType] := True
  else if stCmd = 'fn18' then G_bDeviceResponse[conKTTMUXID] := True
  else if stCmd = 'fn20' then G_bDeviceResponse[conDDNSQueryServer] := True
  else if stCmd = 'fn21' then G_bDeviceResponse[conDDNSServer] := True
  else if stCmd = 'fn22' then G_bDeviceResponse[conEventServer] := True
  else if stCmd = 'fn23' then G_bDeviceResponse[conTCPServerPort] := True
  else if stCmd = 'fn24' then G_bDeviceResponse[conServerCardNF] := True
  else if stCmd = 'fn26' then G_bDeviceResponse[conJavaraStopTime] := True
  else if stCmd = 'fn27' then G_bDeviceResponse[conCARDREADERExitSOUNDUSE] := True
  else if stCmd = 'RYEP' then G_bDeviceResponse[ALERTLAMPSIREN] := True
  else if stCmd = 'RYLP' then G_bDeviceResponse[ALERTLAMPTIME] := True
  else if stCmd = 'RYSI' then G_bDeviceResponse[ALERTSIRENTIME] := True
  else if stCmd = 'DV00' then G_bDeviceResponse[USEDVRCHECK] := True
  else if stCmd = 'DV01' then G_bDeviceResponse[DVRInfoCHECK] := True
  else if stCmd = 'TN01' then G_bDeviceResponse[CARDREADERTELNUMBERCHECK] := True
  else if stCmd = 'VR90' then G_bDeviceResponse[SYSTEMFUNCTION] := True
  else if stCmd = 'fp90' then G_bDeviceResponse[FTPFUNCTION] := True
  else if stCmd = 'DL03' then G_bDeviceResponse[RELAY2TYPE] := True
  else if stCmd = 'CT01' then G_bDeviceResponse[CARDREADERCALLTIME] := True
  else if stCmd = 'EX04' then G_bDeviceResponse[MAINTOLOCALARM] := True
  else if stCmd = 'EX03' then G_bDeviceResponse[MAINFROMLOCALARM] := True
  else if stCmd = 'DL10' then G_bDeviceResponse[conDOORARMAREA] := True
  else if stCmd = 'EL01' then G_bDeviceResponse[conZoneExtensionPortInfo] := True
  else if stCmd = 'DL00' then G_bDeviceResponse[conDOORDSCHECKUSE] := True
  else if stCmd = 'DL02' then G_bDeviceResponse[conDOORDSCHECKTIME] := True
  else if stCmd = 'EL00' then G_bDeviceResponse[conZoneExtensionUse] := True
  else if stCmd = 'ac00' then G_bDeviceResponse[conRegisterClear] := True
  else if stCmd = 'sy00' then G_bDeviceResponse[conJaeJungDlayUseCheck] := True
  else if stCmd = 'DL04' then G_bDeviceResponse[conJavaraSchedule] := True
  else if stCmd = 'DL05' then G_bDeviceResponse[conJavaraArmClose] := True
  else if stCmd = 'DL07' then G_bDeviceResponse[conJavaraAutoClose] := True
  else if copy(stCmd,1,2) = 'el' then G_bDeviceResponse[conExtentionVERSION] := True
  ;

end;
{�߿���}
procedure TdmSocket.FirmwareProcess(aECUID,aVer, aRealData: string);
begin
// �߿��� ������ �۾��� ���
  if Assigned(FOnFirmwareProcess) then
  begin
    OnFirmwareProcess(Self,aECUID,'',aRealData);
  end;
end;
{�߿���}
procedure TdmSocket.FirmwareProcess2(aECUID,aVer, aRealData: string);
begin
// �߿��� ������ �۾��� ���
  if Assigned(FOnFirmwareProcess2) then
  begin
    OnFirmwareProcess2(Self,aECUID,'',aRealData);
  end;
end;
{������ �� ����͸�}
procedure TdmSocket.GageMonitor(aECUID,aVer, aRealData: string);
begin
 // �߿��� ������ �۾��� ���
  if Assigned(FOnGageMonitor) then
  begin
    OnGageMonitor(Self,aECUID,'',aRealData);
  end;
end;
{���������� ����͸� }
procedure TdmSocket.PTMonitoringProcess(aECUID,aVer, aRealData: string);
begin
//������
  if Assigned(FOnPTMonitoringProcess) then
  begin
    OnPTMonitoringProcess(Self,aECUID,'',aRealData);
  end;
end;
{Initial}
procedure TdmSocket.RegDataProcess(aECUID,aVer, aRealData: string);
var
  stRegCode: String;
  stGubun : string;
begin
  stRegCode:= Copy(aRealData,1,2);
  stGubun:= Copy(aRealData,3,2);

  if stRegCode = 'ID' then
  begin
    RcvDeviceID(aECUID,aVer, aRealData);
  end else if stRegCode = 'CD' then
  begin
    RcvCardReader(aECUID,aVer, aRealData);
  end else if stRegCode = 'SY' then
  begin
    RcvSysinfo(aECUID,aVer, aRealData);
  end else if stRegCode = 'RY' then
  begin
    RcvRelay(aECUID,aVer, aRealData);
  end else if stRegCode = 'LP' then
  begin
    RcvPort(aECUID,aVer, aRealData);
  end else if stRegCode = 'AD' then
  begin
    //RcvUsedAlarmdisplay(aECUID,aVer, aRealData);
  end else if stRegCode = 'EX' then
  begin
    if stGubun = '00' then
      RcvUsedDevice(aECUID,aVer, aRealData)
    else if stGubun = '02' then
      RcvDeviceType(aECUID,aVer, aRealData)
    else if stGubun = '03' then
      RcvMainFromLocalArm(aECUID,aVer, aRealData)
    else if stGubun = '04' then
      RcvMainToLocalArm(aECUID,aVer, aRealData);
  end else if stRegCode = 'TN' then
  begin
    if stGubun = '01' then
      RcvCardReaderTelNo(aECUID,aVer, aRealData);
  end else if stRegCode = 'CT' then
  begin
    if stGubun = '01' then
      RcvCallTime(aECUID,aVer, aRealData);
  end else if stRegCode = 'BT' then
  begin
    //RcvbroadcastTime(aECUID,aVer, aRealData);
  end else if stRegCode = 'DI' then
  begin
    //RcvDialInfo(aECUID,aVer, aRealData);
  end else if stRegCode = 'NW' then
  begin
    RcvWiznetInfo(aECUID,aVer, aRealData);
  end else if stRegCode = 'DT' then
  begin
    RcvControlDialInfo(aECUID,aVer, aRealData);
  end else if stRegCode = 'VC' then
  begin
    //RcvVoiceTime(aECUID,aVer, aRealData);
  end else if stRegCode = 'Id' then
  begin
    RcvKTTSystemId(aECUID,aVer, aRealData);
  end else if stRegCode = 'Tn' then
  begin
    RcvKTTTelNo(aECUID,aVer, aRealData);
  end else if stRegCode = 'tn' then
  begin
    RcvPoliceTelNo(aECUID,aVer, aRealData);
  end else if stRegCode = 'Pt' then
  begin
    if stGubun = '00' then
      RcvLineCheckTime(aECUID,aVer, aRealData);
  end else if stRegCode = 'Ct' then
  begin
    RcvCardType(aECUID,aVer, aRealData);
  end else if stRegCode = 'Rc' then
  begin
    RcvRingCount(aECUID,aVer, aRealData);
  end else if stRegCode = 'SM' then
  begin
    if stGubun = '00' then
    begin
      DeviceState1Show(aECUID,aVer, aRealData);
    end else if (stGubun = '10') or (stGubun = '11') then
    begin
      ZoneStateShow(aECUID,aVer, aRealData);
    end else if stGubun = '20' then
    begin
      DoorLockState(aECUID,aVer, aRealData);
    end else if stGubun = '24' then
    begin
      ZoneSensState(aECUID,aVer, aRealData);
    end else if stGubun = '25' then
    begin
      RcvFireRecovery(aECUID,aVer, aRealData);
    end;
  end else if stRegCode = 'WL' then
  begin
    RcvCCCSettingData(aECUID,aVer, aRealData);
  end else if stRegCode = 'DV' then
  begin
    RcvDVRSettingData(aECUID,aVer, aRealData);
  end else if stRegCode = 'DL' then
  begin
    if stGubun = '00' then
    begin
      RcvDoorDSCheckUse(aECUID,aVer, aRealData); //���庼Ʈ�� DS üũ �׻� ���� �Ǵ� �ɼ� ����
    end else if stGubun = '01' then
    begin
      RcvArmDsCheck(aECUID,aVer, aRealData);
    end else if stGubun = '02' then
    begin
      RcvDoorDSCheckTIME(aECUID,aVer, aRealData); //���庼Ʈ�� DS üũ ����� ���� �ð�
    end else if stGubun = '03' then
    begin
      RcvRelay2Type(aECUID,aVer, aRealData);
    end else if stGubun = '04' then
    begin
      RcvJavaraSchedule(aECUID,aVer, aRealData);
    end else if stGubun = '05' then
    begin
      RcvJavaraArmClose(aECUID,aVer, aRealData);
    end else if stGubun = '07' then
    begin
      RcvJavaraAutoClose(aECUID,aVer, aRealData);
    end else if stGubun = '09' then
    begin
      RcvDoorTimeCodeUse(aECUID,aVer, aRealData); //���Թ��� Ÿ���ڵ� �������
    end else if stGubun = '10' then
    begin
      RcvDoorArmAreaGubun(aEcuID,aVer,aRealData);
    end;
  end else if stRegCode = 'fn' then
  begin
    if stGubun = '02' then RcvArmAreaUse(aEcuID,aVer,aRealData)
    else if stGubun = '03' then RcvCardReaderSoundUse(aECUID,aVer, aRealData)
    else if stGubun = '05' then RcvArmRelayCheck(aECUID,aVer, aRealData)
    else if stGubun = '17' then RcvPrimaryKTTTypeCheck(aECUID,aVer, aRealData)
    else if stGubun = '18' then RcvKTTMuxIDCheck(aECUID,aVer, aRealData)
    else if stGubun = '20' then RcvDDNSQueryServerCheck(aECUID,aVer, aRealData)
    else if stGubun = '21' then RcvDDNSServerCheck(aECUID,aVer, aRealData)
    else if stGubun = '22' then RcvEventServerCheck(aECUID,aVer, aRealData)
    else if stGubun = '23' then RcvTCPServerPortCheck(aECUID,aVer, aRealData)
    else if stGubun = '24' then RcvServerCardNFCheck(aECUID,aVer, aRealData)
    else if stGubun = '26' then RcvJavaraStopTime(aECUID,aVer, aRealData)
    else if stGubun = '27' then RcvCardReaderExitSoundUse(aECUID,aVer, aRealData)
    ;

  end else if stRegCode = 'EL' then
  begin
    if stGubun = '00' then RcvZoneExtensionUse(aECUID,aVer, aRealData)
    else if stGubun = '01' then RcvZoneExtensionPortInfo(aECUID,aVer, aRealData);
  end else if stRegCode = 'ac' then
  begin
    if stGubun = '00' then RcvMemoryClearControl(aEcuID,aVer,aRealData);
  end else if stRegCode = 'sy' then
  begin
    if stGubun = '00' then RcvJaejungDelayUse(aEcuID,aVer,aRealData[5]);
  end;
end;
{Remote}
procedure TdmSocket.RemoteDataProcess(aECUID,aVer, aRealData: string);
var
  stCmd: String;
  stGubun : string;
  stTime : string;
begin
  stCmd:= Copy(aRealData,1,2);
  stGubun := Copy(aRealData,3,2);
  if stCmd = 'Pt' then
  begin
    if stGubun = '00' then
      RcvLineCheckStart(aECUID,aVer, aRealData);
  end else if stCmd = 'TM' then
  begin
    G_bDeviceResponse[TIME] := TRUE;
    //�ð�����
    stTime :=  Copy(aRealData,5,14);
    if Assigned(FOnDeviceTime) then
    begin
      OnDeviceTime(Self,aECUID,stTime);
    end;
  end else if stCmd = 'VR' then
  begin
    //��� ����Ȯ��
    if stGubun = '01' then //����ڵ��̸�
    begin
      //RcvDeviceType(aECUID,aVer, aRealData);
      RcvDeviceCode(aECUID,aVer, aRealData);
      Exit;
    end else if stGubun = '90' then
    begin
      RcvSystemFunction(aECUID,aVer, aRealData);
      Exit;
    end else if stGubun = '00' then
    begin
      RcvDeviceVersion(aECUID,aVer, aRealData);
      Exit;
    end;
  end else if stCmd = 'CV' then
  begin
    // ī�帮�� ����
    RcvCardReaderVersion(aECUID,aVer, aRealData);
  end else if stCmd = 'RS' then //Reset
  begin
    G_bDeviceResponse[DEVICERESET] := True;
    if Assigned(FOnDeviceReset) then
    begin
      OnDeviceReset(Self,aECUID);
    end;
  end else if stCmd = 'MC' then   //Change mode
  begin
    //��庯��� Mode Change�� �ö��
      if Pos('ModeChangeStart',aRealData) > 0 then
      begin
        G_bDeviceResponse[ALARMCONTROL] := True;
      end;
  end else if stCmd = 'cs' then //��Ż���üũ
  begin
    if stGubun = '00' then RcvEcuState(aEcuId,aVer,aRealData)
    else if stGubun = '01' then RcvCardReaderStateCheck(aEcuId,aVer,aRealData)
    else if stGubun = '03' then RcvZoneExtentionNetworkStateCheck(aEcuId,aVer,aRealData)
    else if stGubun = '90' then RcvLineShortCheck(aEcuId,aVer,aRealData);
    {
      stGubun = '00' -- cs0011uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu //Ȯ���
      stGubun = '01' -- cs01x01uuuuuu //ī�帮�� 8��
      stGubun = '02' -- cs02xuuuu //��Ȳǥ�ñ�
    }
  end else if stCmd = 'CD' then //ī�嵥����
  begin
    if stGubun = '01' then
    begin
      G_bDeviceResponse[conCARDRegCardCnt] := True;
      if Assigned(FOnCardRegCardCNT) then
      begin
        OnCardRegCardCNT(Self,aECUID,aRealData);
      end;
    end else if stGubun = '10' then
    begin
      G_bDeviceResponse[CARDLISTCANCEL] := True;
    end
    else if stGubun = '11' then
    begin
      if Assigned(FOnCardGrade) then
      begin
        OnCardGrade(Self,aECUID,aRealData);
      end;
    end
    else if stGubun = '20' then
    begin
    end
    else if stGubun = '21' then
    begin
    end;

  end else if stCmd = 'SM' then
  begin
    if stGubun = '00' then
    begin
      DeviceState1Show(aECUID,aVer, aRealData);
    end else if (stGubun = '10') or (stGubun = '11') then    //10 �� ����,11 ��Ȯ��� ��Ʈ ����
    begin
      ZoneStateShow(aECUID,aVer, aRealData);
    end else if stGubun = '20' then
    begin
      DoorLockState(aECUID,aVer, aRealData)
    end else if stGubun = '24' then
    begin
      ZoneSensState(aECUID,aVer, aRealData);
    end else if stGubun = '25' then
    begin
      RcvFireRecovery(aECUID,aVer, aRealData);
    end;
  end else if stCmd = 'WL' then
  begin
    RcvCCCControlData(aECUID,aVer,aRealData);
  end else if stCmd = 'fp' then //FTP ��� ���� ����
  begin
    if stGubun = '90' then RcvFTPCheck(aECUID,aVer, aRealData)
    else if stGubun = '10' then RcvFTPDownLoadState(aECUID,aVer, aRealData);
  end else if stCmd = 'fw' then
  begin
    RcvKTT812FirmWareDownload(aECUID,stGubun,aRealData);
  end else if stCmd = 'fn' then
  begin
    if (stGubun = '04') or (stGubun = '05')  then RcvZoneUseRemoteControl(aECUID,aVer, aRealData)
    else if stGubun = '06' then RcvMaxCardCount(aECUID,aVer, aRealData);
  end else if stCmd = '**' then
  begin
    if stGubun = '00' then
    begin
      if Assigned(FOnCardAllClear) then
      begin
        OnCardAllClear(Self,aECUID,'');
      end;
    end;
  end else if stCmd = 'el' then
  begin
    // ��Ȯ��� ����
    RcvZoneExtentionVersion(aECUID,aVer, aRealData);
  end else if stCmd = 'FW' then
  begin
    if stGubun = '10' then
    begin
      RcvGCU300_ICU300FirmwareDownloadState(aECUID,aRealData);
    end;
  end;
end;

procedure TdmSocket.RcvAccControl(aECUID, aVer, aRealData: string);
Var
  stDoorNo: String;
  stDoorState: string;
  stCardMode: string;
  stDoorMode: string;
  stDoorSchedule : string;
begin
  G_bDeviceResponse[DOORCONTROL] := True;
  
  stDoorNo:=   aRealData[3];
  stCardMode:= aRealData[6];    //Posi/Nega
  stDoorMode:=  aRealData[7];    //�/����
  stDoorState:= aRealData[8];    //������
  stDoorSchedule:= aRealData[9];    //������
  if Assigned(FOnDoorState) then
  begin
    OnDoorState(Self,aECUID,stDoorNo,stCardMode,stDoorMode,stDoorState,stDoorSchedule);
  end;

end;

procedure TdmSocket.RcvAccEventData(aECUID, aVer, aRealData: string);
var
  stDoorNo : string;
  stReaderNo : string;
  stInOut : string;
  stTime : string;
  stCardMode : string;
  stDoorMode : string;
  stChangeState :string;
  stAccessResult : string;
  stDoorState : string;
  stATButton : string;

  nCardNoLen : integer;
  stCardNo : string;
  stExitButton : string;
  bExitButton : Boolean;
begin

  bExitButton := False;
  stDoorNo:=  aRealData[3];
  stReaderNo := aRealData[4];
  stInOut := aRealData[5];
  stTime  := '20' + copy(aRealData,6,12);
  stCardMode := aRealData[18]; //Posi/Nega
  stDoorMode:=  aRealData[19]; //�/����
  stChangeState := aRealData[20]; //�������
  stAccessResult := aRealData[21]; //���Խ��ΰ��
  stDoorState:= aRealData[22]; //������
  stATButton:= aRealData[23]; //���¹�ư

  nCardNoLen := 0;
  if isDigit(Copy(aRealData,24,2)) then nCardNoLen := strtoint(Copy(aRealData,24,2));
  if nCardNoLen = 0 then
  begin
    stCardNo:= copy(aRealData,26,8);  //ī���ȣ 10�ڸ� ����(���� �� 00 �ι���Ʈ ��� ����)
    stCardNo:= DecodeCardNo(stCardNo);
    stCardNo := dec2Hex(strtoint64(stCardNo),8);
  end else
  begin
    stCardNo := copy(aRealData,26,nCardNoLen);
  end;
  if G_nCardType = 0 then
  begin
    if stCardNo = '00000000' then bExitButton := True;
  end else if G_nCardType = 1 then
  begin
    stExitButton := FillZeroNumber(0,11);
    if stCardNo = Ascii2Hex(stExitButton) then bExitButton := True;
  end else if G_nCardType = 2 then
  begin
    stExitButton := FillZeroNumber(0,nCardNoLen);
    if stCardNo = stExitButton then bExitButton := True;
  end;

  if bExitButton then
  begin
    if Assigned(FOnExitButtonEvent) then
    begin
      OnExitButtonEvent(Self,aECUID,stDoorNo,stReaderNo,stInOut,stTime,
                        stCardMode,stDoorMode,stChangeState,stAccessResult,
                        stDoorState,stATButton,stCardNo);
    end;
    Exit;
  end;

  if Assigned(FOnCardAccessEvent) then
  begin
    OnCardAccessEvent(Self,aECUID,stDoorNo,stReaderNo,stInOut,stTime,
                      stCardMode,stDoorMode,stChangeState,stAccessResult,
                      stDoorState,stATButton,stCardNo);
  end;

end;

procedure TdmSocket.RcvCardAllDelete(aECUID, aVer, aRealData: string);
var
  stCmdState : string;
  stDoorNo : string;
  stCardType : string;
  nCardLen : integer;
  stCardNo : string;
  stExpireDate : string;
  stRegResult : string;
  stCardAuth : string;
  stTimeMode : string;
  stCardIDNo : string;
  stAlarmAreaGrade : string;
  stDoorAreaGrade : string;
  stHex : string;
  stBinaryCode : string;
  i : integer;
begin
  stCmdState := aRealData[1];
{  case aRealData[1] of
    'l','e','f':stCmdState:='[���]';
    'm','h':stCmdState:='[��ȸ]';
    'n','d':stCmdState:='[����]';
    'o':stCmdState:='[��ü����]';
  end; }

  stDoorNo   := Copy(aRealData,3,1);
  stCardType := Copy(aRealData,4,2);

  nCardLen := 0;
  if isDigit(Copy(aRealData,7,2)) then nCardLen := strtoint(Copy(aRealData,7,2));

  if nCardLen = 0 then //4Byte ����
  begin
    stCardNo:= copy(aRealData,9,8);  //ī���ȣ 10�ڸ� ����(���� �� 00 �ι���Ʈ ��� ����)
    stCardNo:= DecodeCardNo(stCardNo);
    stCardNo := dec2Hex(strtoint64(stCardNo),8);
    nCardLen := 8;
  end else
  begin
    stCardNo := copy(aRealData,9,nCardLen);
  end;
  stExpireDate := Copy(aRealData,9 + nCardLen ,6);
  stRegResult := copy(aRealData,9 + nCardLen + 6,1); //��ϰ��
  stCardAuth := copy(aRealData,9 + nCardLen + 7,1);  //ī�����
  stTimeMode := copy(aRealData,9 + nCardLen + 8,1);  //���Խð����

  stCardIDNo := '';
  stAlarmAreaGrade := '';
  stDoorAreaGrade := '';
  if Length(aRealData) > (9 + nCardLen + 8) then
    stCardIDNo := copy(aRealData,9 + nCardLen + 9,5);  //��ġ����
  if Length(aRealData) > (9 + nCardLen + 16) then
  begin
    stHex := ASCII2Hex(aRealData[9 + nCardLen + 14]);
    stBinaryCode := HexToBinary(stHex);
    for i := 5 to 8 do
    begin
      if stBinaryCode[i] = '1' then stAlarmAreaGrade := stAlarmAreaGrade + '1'
      else stAlarmAreaGrade := stAlarmAreaGrade + '0';
    end;
    stHex := ASCII2Hex(aRealData[9 + nCardLen + 15]);
    stBinaryCode := HexToBinary(stHex);
    for i := 5 to 8 do
    begin
      if stBinaryCode[i] = '1' then stAlarmAreaGrade := stAlarmAreaGrade + '1'
      else stAlarmAreaGrade := stAlarmAreaGrade + '0';
    end;
    stHex := ASCII2Hex(aRealData[9 + nCardLen + 16]);
    stBinaryCode := HexToBinary(stHex);
    for i := 5 to 8 do
    begin
      if stBinaryCode[i] = '1' then stDoorAreaGrade := stDoorAreaGrade + '1'
      else stDoorAreaGrade := stDoorAreaGrade + '0';
    end;
    stHex := ASCII2Hex(aRealData[9 + nCardLen + 17]);
    stBinaryCode := HexToBinary(stHex);
    for i := 5 to 8 do
    begin
      if stBinaryCode[i] = '1' then stDoorAreaGrade := stDoorAreaGrade + '1'
      else stDoorAreaGrade := stDoorAreaGrade + '0';
    end;
  end;

  if Assigned(FOnCardRegist) then
  begin
    OnCardRegist(Self,aECUID,stDoorNo,stCmdState,stCardType,stCardNo,stExpireDate,
                 stRegResult,stCardAuth,stTimeMode,stCardIDNo,stAlarmAreaGrade,stDoorAreaGrade);
  end;

end;

procedure TdmSocket.RcvCardRegAck(aECUID, aVer, aRealData: string);
var
  stCmd : string;
  stDoorNo : string;
  stCardType : string;
  nCardLen : integer;
  stCardNo : string;
  stExpireDate : string;
  stRegResult : string;
  stCardAuth : string;
  stTimeMode : string;
  stCardIDNo : string;
  stAlarmAreaGrade : string;
  stDoorAreaGrade : string;
  stHex : string;
  stBinaryCode : string;
  i : integer;
begin

  G_bDeviceResponse[CARDDOWNLOADACK] := True;
  
  stCmd := aRealData[1];
{  case aRealData[1] of
    'l','e','f':stCmdState:='[���]';
    'm','h':stCmdState:='[��ȸ]';
    'n','d':stCmdState:='[����]';
    'o':stCmdState:='[��ü����]';
  end; }

  stDoorNo   := Copy(aRealData,3,1);
  stCardType := Copy(aRealData,4,2);

  nCardLen := 0;
  if isDigit(Copy(aRealData,7,2)) then nCardLen := strtoint(Copy(aRealData,7,2));

  if nCardLen = 0 then //4Byte ����
  begin
    stCardNo:= copy(aRealData,9,8);  //ī���ȣ 10�ڸ� ����(���� �� 00 �ι���Ʈ ��� ����)
    stCardNo:= DecodeCardNo(stCardNo);
    stCardNo := dec2Hex(strtoint64(stCardNo),8);
    nCardLen := 8;
  end else
  begin
    stCardNo := copy(aRealData,9,nCardLen);
  end;
  stExpireDate := Copy(aRealData,9 + nCardLen ,6);
  stRegResult := copy(aRealData,9 + nCardLen + 6,1); //��ϰ��
  stCardAuth := copy(aRealData,9 + nCardLen + 7,1);  //ī�����
  stTimeMode := copy(aRealData,9 + nCardLen + 8,1);  //���Խð����
  stCardIDNo := '';
  stAlarmAreaGrade := '';
  stDoorAreaGrade := '';
  if Length(aRealData) > (9 + nCardLen + 8) then
    stCardIDNo := copy(aRealData,9 + nCardLen + 9,5);  //��ġ����
  if Length(aRealData) > (9 + nCardLen + 16) then
  begin
    stHex := ASCII2Hex(aRealData[9 + nCardLen + 14]);
    stBinaryCode := HexToBinary(stHex);
    for i := 5 to 8 do
    begin
      if stBinaryCode[i] = '1' then stAlarmAreaGrade := stAlarmAreaGrade + '1'
      else stAlarmAreaGrade := stAlarmAreaGrade + '0';
    end;
    stHex := ASCII2Hex(aRealData[9 + nCardLen + 15]);
    stBinaryCode := HexToBinary(stHex);
    for i := 5 to 8 do
    begin
      if stBinaryCode[i] = '1' then stAlarmAreaGrade := stAlarmAreaGrade + '1'
      else stAlarmAreaGrade := stAlarmAreaGrade + '0';
    end;
    stHex := ASCII2Hex(aRealData[9 + nCardLen + 16]);
    stBinaryCode := HexToBinary(stHex);
    for i := 5 to 8 do
    begin
      if stBinaryCode[i] = '1' then stDoorAreaGrade := stDoorAreaGrade + '1'
      else stDoorAreaGrade := stDoorAreaGrade + '0';
    end;
    stHex := ASCII2Hex(aRealData[9 + nCardLen + 17]);
    stBinaryCode := HexToBinary(stHex);
    for i := 5 to 8 do
    begin
      if stBinaryCode[i] = '1' then stDoorAreaGrade := stDoorAreaGrade + '1'
      else stDoorAreaGrade := stDoorAreaGrade + '0';
    end;
  end;
  if stRegResult = '1' then
  begin
    CardFull := True;
    CardSendDataList.Clear;
  end;

  if Assigned(FOnCardRegist) then
  begin
    OnCardRegist(Self,aECUID,stDoorNo,stCmd,stCardType,stCardNo,stExpireDate,
                 stRegResult,stCardAuth,stTimeMode,stCardIDNo,stAlarmAreaGrade,stDoorAreaGrade);
  end;

end;

procedure TdmSocket.RcvDoorEventData(aECUID, aVer, aRealData: string);
var
  stDoorNo : string;
  stReaderNo : string;
  stInOut : string;
  stTime : string;
  stCardMode : string;
  stDoorMode : string;
  stChangeState :string;
  stAccessResult : string;
  stDoorState : string;
begin

  stDoorNo:=  aRealData[3];
  stReaderNo := aRealData[4];
  stInOut := aRealData[5];
  stTime  := '20' + copy(aRealData,6,12);
  stCardMode := aRealData[18]; //Posi/Nega
  stDoorMode:=  aRealData[19]; //�/����
  stChangeState := aRealData[20]; //�������
  stAccessResult := aRealData[21]; //���Խ��ΰ��
  stDoorState:= aRealData[22]; //������

  if Assigned(FOnDoorEvent) then
  begin
    OnDoorEvent(Self,aECUID,stDoorNo,stReaderNo,stInOut,stTime,
                      stCardMode,stDoorMode,stChangeState,stAccessResult,
                      stDoorState);
  end;

end;

procedure TdmSocket.RcvHoliday(aECUID, aVer, aRealData: string);
var
  stMonth : string;
  stDate : string;
  stDoorNo : string;
begin
  L_stReceiveHoliday := aECUID + aRealData;
  G_bDeviceResponse[HOLIDAY] := True;
  stDoorNo := aRealData[3];
  stMonth := copy(aRealData,6,2);
  stDate := copy(aRealData,8,31);

  if Assigned(FOnHolidaySetting) then
  begin
    OnHolidaySetting(Self,aECUID,stDoorNo,stMonth,stDate);
  end;

end;

procedure TdmSocket.RcvSch(aECUID, aVer, aRealData: string);
var
  stCmd : string;
  stDoorNo : string;
  stDayOfWeek : string;
  st1ModeTime : string;
  st1Mode : string;
  st2ModeTime : string;
  st2Mode : string;
  st3ModeTime : string;
  st3Mode : string;
  st4ModeTime : string;
  st4Mode : string;
  st5ModeTime : string;
  st5Mode : string;
begin
  G_bDeviceResponse[SCHEDULE] := True;
  stCmd := aRealData[1];
  stDoorNo := aRealData[3];
  stDayOfWeek := aRealData[5];
  //st1ModeTime := copy(aRealData,6,4);
  st1Mode := aRealData[10];
  st1ModeTime := copy(aRealData,11,4);
  st2Mode := aRealData[15];
  st2ModeTime := copy(aRealData,16,4);
  st3Mode := aRealData[20];
  st3ModeTime := copy(aRealData,21,4);
  st4Mode := aRealData[25];
  st4ModeTime := copy(aRealData,26,4);
  st5Mode := aRealData[30];
  st5ModeTime := copy(aRealData,31,4);

  if Assigned(FOnScheduleSetting) then
  begin
    OnScheduleSetting(Self,aECUID,stDoorNo,stCmd,stDayOfWeek,st1ModeTime,st1Mode,
                          st2ModeTime,st2Mode,st3ModeTime,st3Mode,st4ModeTime,st4Mode,
                          st5ModeTime,st5Mode);
  end;

end;

procedure TdmSocket.RcvDoorinfo2(aECUID, aVer, aRealData: string);
var
  stDoorNo : string;
  stCardMode : string;
  stDoorMode : string;
  stDoorControlTime : string;
  nDoorControlTime : integer;
  nOrd : integer;
  nMsec : integer;
  stLongDoorOpenTime : string;
  stSchedule : string;
  stDoorState : string;
  stNetFailRun : string;
  stAntiPass : string;
  stLongDoorOpenUse : string;
  stNetFailAlarm : string;
  stDoorLockType : string;
  nLockType : integer;
  stFireDoorControl : string;
  stLockState : string;
  stDoorOpenState : string;
  stRemoteDoorOpen : string;
begin
  G_bDeviceResponse[DOORSYSTEMCHECK] := True;

  stDoorNo:=  aRealData[3];
  stCardMode := aRealData[6];
  stDoorMode := aRealData[7];
  stDoorControlTime := aRealData[8];
  if aRealData[8] >= #$30 then
  begin
   if aRealData[8] < #$40 then  stDoorControlTime := aRealData[8]
   else
   begin
      if (aRealData[8] >= 'A') and (aRealData[8] <= 'Z') then  nDoorControlTime := Ord(aRealData[8]) - Ord('A')
      else nDoorControlTime := Ord(aRealData[8]) - Ord('a') + 26;
      nDoorControlTime := nDoorControlTime * 5;
      stDoorControlTime := inttostr( 10 + nDoorControlTime );
   end;
  end else
  begin
    nOrd := Ord(aRealData[8]);
    nMsec := (nOrd - $20) * 100;
    stDoorControlTime := inttostr(nMsec) + 'ms';
  end;
  stLongDoorOpenTime := aRealData[9];
  stSchedule := aRealData[10];
  stDoorState := aRealData[11];
  stNetFailRun := aRealData[12];  //������
  stAntiPass := aRealData[13];  //������
  stLongDoorOpenUse := aRealData[14];
  stNetFailAlarm := aRealData[15]; //������
  nLockType := 0;
  if aRealData[16] >= #$30 then
  begin
    nLockType:= ord(aRealData[16]) - ord('0');
  end;
  stDoorLockType := inttostr(nLockType);
  stFireDoorControl := aRealData[17];
  stLockState := aRealData[18];
  stDoorOpenState := aRealData[19];
  stRemoteDoorOpen := aRealData[20];

  if Assigned(FOnDoorSettingEvent) then
  begin
    OnDoorSettingEvent(Self,aECUID,stDoorNo,stCardMode,stDoorMode,stDoorControlTime,
                       stLongDoorOpenTime,stSchedule,stDoorState,stNetFailRun,
                       stAntiPass,stLongDoorOpenUse,stNetFailAlarm,stDoorLockType,
                       stFireDoorControl,stLockState,stDoorOpenState,stRemoteDoorOpen);
  end;

end;


procedure TdmSocket.ZoneSensState(aECUID, aVer, aRealData: string);
var
  stCmd : string;
  stData : string;
  nStartNo : integer;
  stDeviceState : string;
  stEcuID : string;
  stBinary : string;
  i : integer;
  stTemp : string;
begin
  G_bDeviceResponse[ZONESENSECHECK] := True;
  stCmd := copy(aRealData,3,2);
  stData := copy(aRealData,5,Length(aRealData) - 4);
  if Assigned(FOnDeviceState) then
  begin
    OnDeviceState(Self,aECUID,stCmd,stData);
  end;
  nStartNo := strtoint(copy(stData,1,2));
  stDeviceState := copy(stData,4,Length(stData) - 3);
  for i := 0 to 31 do
  begin
    stTemp := Trim(copy(stDeviceState,(i*3) + 1,3));
    stEcuID := FillZeroNumber(nStartNo + i ,2);
    stBinary := HexToBinary(stTemp);
    if stBinary[8] = '1' then G_bFireDevice[strtoint(stEcuID)] := True
    else G_bFireDevice[strtoint(stEcuID)] := False;
  end;

end;

procedure TdmSocket.DeviceState1Show(aECUID, aVer, aRealData: string);
var
  stCmd : string;
  stData : string;
begin
  stCmd := copy(aRealData,3,2);
  stData := copy(aRealData,5,Length(aRealData) - 4);
  if Assigned(FOnDeviceState) then
  begin
    OnDeviceState(Self,aECUID,stCmd,stData);
  end;

end;

procedure TdmSocket.DoorLockState(aECUID, aVer, aRealData: string);
var
  stCmd : string;
  stData : string;
begin
  G_bDeviceResponse[LOCKSTATECHECK] := True;
  stCmd := copy(aRealData,3,2);
  stData := copy(aRealData,5,Length(aRealData) - 4);
  if Assigned(FOnDeviceState) then
  begin
    OnDeviceState(Self,aECUID,stCmd,stData);
  end;

end;

procedure TdmSocket.RcvCardReader(aECUID, aVer, aRealData: string);
var
  stReaderNo : string;
  stUsedCR : string;
  stCRPosition : string;
  stDoorNo : string;
  stLocate : string;
  stBuildingPosi : string;
  nReaderPoint : integer;
  stReaderArmArea : string;
begin
  //G_bDeviceResponse[CARDREADERINFO] := True;

  stReaderNo := Copy(aRealData, 3, 2);
  stUsedCR := Copy(aRealData, 5, 1);         // ī�帮�� ��뿩��
  stCRPosition := Copy(aRealData, 6, 1);               // ��ġ ��ġ
  stDoorNo := Copy(aRealData, 7, 1);                 // ���� ����ȣ
  stReaderArmArea:= Copy(aRealData, 8, 2);           // �������
  stLocate := Copy(aRealData, 10, 16);       // ī�帮�� ��ġ��
  stBuildingPosi := Copy(aRealData, 26, 1);          //���� ��ġ

  if isDigit(stReaderNo) then
  begin
    nReaderPoint := (strtoint(aEcuID) * G_nCardReaderNumber ) + strtoint(stReaderNo);

    G_bCardReaderResponse[nReaderPoint] := True;
  end;

  if Assigned(FOnCardReaderSetting) then
  begin
    OnCardReaderSetting(Self,aECUID,stReaderNo,stUsedCR,stCRPosition,stDoorNo,stReaderArmArea,stLocate,stBuildingPosi);
  end;

end;

procedure TdmSocket.RcvCardType(aECUID, aVer, aRealData: string);
var
  stCardType: string;
begin
  G_bDeviceResponse[CARDREADERTYPE] := True;
  stCardType := Copy(aRealData, 5, 10);
  if Assigned(FOnCardReaderTypeSetting) then
  begin
    OnCardReaderTypeSetting(Self,aECUID,stCardType);
  end;

end;

procedure TdmSocket.RcvControlDialInfo(aECUID, aVer, aRealData: string);
begin
//���ڴ����̾�Ÿ��- ������
end;

procedure TdmSocket.RcvDeviceID(aECUID, aVer, aRealData: string);
var
  stID : string;
begin
  stID := copy(aRealData,5,G_nIDLength);
  G_bDeviceResponse[IDCHECK] := True;
  if Assigned(FOnDeviceIDSetting) then
  begin
    OnDeviceIDSetting(Self,aECUID,stID);
  end;
end;

procedure TdmSocket.RcvPort(aECUID, aVer, aRealData: string);
var
  stPort: string;
  stWatchType : string; //�������
  stAlarmType : string; //�˶��߻�����
  stRecoverType : string;   //��������
  stDelayTimeType :string;  //�����ð�����
  stPortLocate  :string;    //��Ʈ��ġ��
  stDetectTime : string;
  nPortPoint : integer;
  stZoneArmArea : string;
  stZoneUsed : string;
begin
  //         1         2         3         4         5         6
  //123456789012345678901234567890
  //LP08S831001111111101011111111100
  stPort := Copy(aRealData, 3, 2);
  stWatchType := Copy(aRealData, 5, 2);
  stAlarmType := Copy(aRealData, 7, 1);
  stRecoverType := Copy(aRealData, 9, 1);
  stDelayTimeType := Copy(aRealData, 10, 1);
  stZoneArmArea := copy(aRealData,31,2);
  stPortLocate := Copy(aRealData, 33, 16);
  stDetectTime := Copy(aRealData, 49, 4);
  stZoneUsed := '0';
  if Length(aRealData) > 52 then stZoneUsed := aRealData[53];

  if Not isDigit(stZoneArmArea) then stZoneArmArea := '00';
  stZoneArmArea := inttostr(strtoint(stZoneArmArea));

  nPortPoint := (strtoint(aEcuID) * G_nPortNumber ) + strtoint(stPort);
  G_bPortResponse[nPortPoint] := True;

  if Assigned(FOnPortSetting) then
  begin
    OnPortSetting(Self,aECUID,stPort,stWatchType,stAlarmType,stRecoverType,
                  stDelayTimeType,stPortLocate,stDetectTime,stZoneArmArea,stZoneUsed);
  end;

end;

procedure TdmSocket.RcvRelay(aECUID, aVer, aRealData: string);
var
  stRelayNo : string;
begin
  stRelayNo:= Copy(aRealData,3,2);

  if Not IsDigit(stRelayNo) then
  begin
    RcvLampState(aECUID,aVer,aRealData);
    Exit;
  end;
  //������ ������ ����
end;

procedure TdmSocket.RcvRingCount(aECUID, aVer, aRealData: string);
var
  stArmCount : string;
  stDisArmCount : string;
begin
  G_bDeviceResponse[KTTRINGCOUNT] := True;
  Delete(aRealData,1,4);
  stArmCount := Copy(aRealData, 1, 2);
  stDisArmCount := Copy(aRealData, 3, 2);
  if Assigned(FOnKTTRingCount) then
  begin
    OnKTTRingCount(Self,aECUID,stArmCount,stDisArmCount);
  end;

end;

procedure TdmSocket.RcvSysinfo(aECUID, aVer, aRealData: string);
var
  stTemp : string;
  stPowerWatch : string;
  stOutDelay : string;
  stDoor1Type : string;
  stDoor2Type : string;
  stLocate : string;
  stInDelay : string;
  stLockExtend : string;
  nIndex : integer;
  i : integer;
begin
  stLockExtend := '';
  stTemp := Copy(aRealData, 5, 7);
  if not isDigit(stTemp) then Exit;
  G_bDeviceResponse[SYSINFOCHECK] := True;
  //12345678901234567890123456789012345678
  //SY001001211                00102211112E
  stPowerWatch := aRealData[5];  {���� ���ÿ���}
  stOutDelay := Copy(aRealData, 6, 3);  {��������ð�}
  stDoor1Type := aRealData[10];  {Door1 �뵵}
  stDoor2Type := aRealData[11];  {Door2 �뵵}
  stLocate := Trim(Copy(aRealData, 12, 16)); {�ý��� ��ġ��}
  stInDelay := Trim(Copy(aRealData, 28, 3)); {�Խ������ð�}
  if Length(aRealData) > 31 then
    stLockExtend := copy(aRealData,32,6);

  if Assigned(FOnSystemSetting) then
  begin
    OnSystemSetting(Self,aECUID,stPowerWatch,stOutDelay,stDoor1Type,stDoor2Type,stLocate,stInDelay,stLockExtend);
  end;

  nIndex := DeviceList.IndexOf(aECUID);
  if nIndex < 0 then Exit;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo > 0 then
    TCurrentDeviceState(DeviceList.Objects[nIndex]).SetDoorType(1,stDoor1Type);
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo > 1 then
    TCurrentDeviceState(DeviceList.Objects[nIndex]).SetDoorType(2,stDoor2Type);

  if Length(stLockExtend) = 6 then
  begin
    for i := 1 to 6 do
    begin
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo > (i + 1) then
        TCurrentDeviceState(DeviceList.Objects[nIndex]).SetDoorType((i+2),stLockExtend[i]);
    end;
  end;

end;

procedure TdmSocket.RcvUsedAlarmdisplay(aECUID, aVer, aRealData: string);
begin
//������
end;

procedure TdmSocket.RcvWiznetInfo(aECUID, aVer, aRealData: string);
var
  FHeader: string[2];
  FMacAddress: string[12];
  FMode: string[2];
  FIPAddress: string[8];
  FSubnet: string[8];
  FGateway: string[8];
  FClientPort: string[4];
  FServerIP: string[8];
  FServerPort: string[4];
  FSerial_Baud: string[2];
  FSerial_data: string[2];
  FSerial_Parity: string[2];
  FSerial_stop: string[2];
  FSerial_flow: string[2];
  FDelimiterChar: string[2];
  FDelimiterSize: string[4];
  FDelimitertime: string[4];
  FDelimiterIdle: string[4];
  FDebugMode: string[2];
  FROMVer: string[4];
  FOnDHCP: string[2];
  FReserve: string[4];
  DataStr : string;
begin
  G_bDeviceResponse[WIZNETMODULECHECK] := True;
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  DataStr := Copy(aRealData, 5, 94);

  FHeader := Copy(DataStr, 1, 2);
  FMacAddress := Copy(DataStr, 3, 12);
  FMode := Copy(DataStr, 15, 2);
  FIPAddress := Copy(DataStr, 17, 8);
  FSubnet := Copy(DataStr, 25, 8);
  FGateway := Copy(DataStr, 33, 8);
  FClientPort := Copy(DataStr, 41, 4);
  FServerIP := Copy(DataStr, 45, 8);
  FServerPort := Copy(DataStr, 53, 4);
  FSerial_Baud := Copy(DataStr, 57, 2);
  FSerial_data := Copy(DataStr, 59, 2);
  FSerial_Parity := Copy(DataStr, 61, 2);
  FSerial_stop := Copy(DataStr, 63, 2);
  FSerial_flow := Copy(DataStr, 65, 2);
  FDelimiterChar := Copy(DataStr, 67, 2);
  FDelimiterSize := Copy(DataStr, 69, 4);
  FDelimitertime := Copy(DataStr, 73, 4);
  FDelimiterIdle := Copy(DataStr, 77, 4);
  FDebugMode := Copy(DataStr, 81, 2);
  FROMVer := Copy(DataStr, 83, 4);
  FOnDHCP := Copy(DataStr, 87, 2);
  FReserve := Copy(DataStr, 89, 6);

{ //������ ��ȯ�� ������ ����
  // 4.IP address �ڡڡڡڡ�
  stTemp := Hex2Ascii(FIPAddress);
  stData := '';
  for i := 1 to 4 do
  begin
    if i < 4 then stData := stData + IntToStr(Ord(stTemp[I])) + '.'
    else stData := stData + IntToStr(Ord(stTemp[I]));
  end;
  FIPAddress := stData;


  // 5.Subnet mask �ڡڡڡڡ�
  stData := '';
  stTemp := Hex2Ascii(FSubnet);
  for I := 1 to 4 do
  begin
    if I < 4 then stData := stData + IntToStr(Ord(stTemp[I])) + '.'
    else stData := stData + IntToStr(Ord(stTemp[I]));
  end;
  FSubnet := stData;

  // 6.Gateway address  �ڡڡڡڡ�
  stData := '';
  stTemp := Hex2Ascii(FGateway);
  for I := 1 to 4 do
  begin
    if I < 4 then stData := stData + IntToStr(Ord(stTemp[I])) + '.'
    else stData := stData + IntToStr(Ord(stTemp[I]));
  end;
  FGateway := stData;

  //7.Port number (Client) �ڡڡڡڡ�
  FClientPort := Hex2DecStr(FClientPort);

  //8. Server IP address
  stData := '';
  stTemp := Hex2Ascii(FServerIP);
  for I := 1 to 4 do
  begin
    if I < 4 then stData := stData + IntToStr(Ord(stTemp[I])) + '.'
    else stData := stData + IntToStr(Ord(stTemp[I]));
  end;
  FServerIP := stData;

  //9.  Port number (Server)
  FServerPort := Hex2DecStr(FServerPort);

  //10. Serial speed (bps)

  //11. Serial data size (08: 8 bit), (07: 7 bit)

  //12. Parity (00: No), (01: Odd), (02: Even)

  //13. Stop bit

  //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)

  //15. Delimiter char

  //16.Delimiter size
  FDelimiterSize := Hex2DecStr(FDelimiterSize);

  //17. Delimiter time
  FDelimitertime := Hex2DecStr(FDelimitertime);

  //18.Delimiter idle time
  FDelimiterIdle := Hex2DecStr(FDelimiterIdle);

  //19. Debug code (00: ON), (01: OFF)

  //20.Software major version

  // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)
}
  if Assigned(FOnWiznetInfoSetting) then
  begin
    OnWiznetInfoSetting(Self,aECUID,FHeader,FMacAddress,FMode,FIPAddress,FSubnet,
           FGateway,FClientPort,FServerIP,FServerPort,FSerial_Baud,FSerial_data,
           FSerial_Parity,FSerial_stop,FSerial_flow,FDelimiterChar,FDelimiterSize,
           FDelimitertime,FDelimiterIdle,FDebugMode,FROMVer,FOnDHCP,FReserve);
  end;

end;

procedure TdmSocket.ZoneStateShow(aECUID, aVer, aRealData: string);
var
  stCmd : string;
  stData : string;
begin
  G_bDeviceResponse[PORTSTATE] := True;
  
  stCmd := copy(aRealData,3,2);
  stData := copy(aRealData,5,Length(aRealData) - 4);
  if Assigned(FOnDeviceState) then
  begin
    OnDeviceState(Self,aECUID,stCmd,stData);
  end;

end;

procedure TdmSocket.RcvUsedDevice(aECUID, aVer, aRealData: string);
var
  stDevice : string;
  i : integer;
  stEcuID : string;
begin
  G_bDeviceResponse[USEDEVICECHECK] := True;
  stDevice := copy(aRealData,5,100);
  if Assigned(FOnDeviceUsedSetting) then
  begin
    OnDeviceUsedSetting(Self,aECUID,stDevice);
  end;

  for i := 2 to G_nMaxEcuCount + 1 do  // 1��°�� ������
  begin
    stEcuID := FillZeroNumber(i-1, 2);
    if stDevice[i] = '1' then
    begin
      EcuListAdd(stEcuID);
    end else
    begin
      EcuListDelete(stEcuID);
    end;
  end;

end;

procedure TdmSocket.RcvLampState(aECUID, aVer, aRealData: string);
var
  stCmd : string;
  stLampOnOff : string;
  stSirenOnOff : string;
  stLampTime : string;
  stSirenTime : string;
begin
  stCmd := copy(aRealData,3,2);
  if UpperCase(stCmd) = 'EP' then
  begin
    G_bDeviceResponse[ALERTLAMPSIREN] := True;
    stLampOnOff := copy(aRealData,5,1);  //Lamp
    stSirenOnOff := copy(aRealData,6,1);  //Siren
    if Assigned(FOnLampSirenOnOff) then
    begin
      OnLampSirenOnOff(Self,aECUID,stLampOnOff,stSirenOnOff);
    end;
  end else if UpperCase(stCmd) = 'LP' then
  begin
    G_bDeviceResponse[ALERTLAMPTIME] := True;
    stLampTime := copy(aRealData,9,5);
    if IsDigit(stLampTime) then
    begin
      stLampTime := inttostr(strtoint(stLampTime) div 60);
      if Assigned(FOnLampTime) then
      begin
        OnLampTime(Self,aECUID,stLampTime);
      end;
    end;
  end else if UpperCase(stCmd) = 'SI' then
  begin
    G_bDeviceResponse[ALERTSIRENTIME] := True;
    stSirenTime := copy(aRealData,9,5);
    if IsDigit(stSirenTime) then
    begin
      stSirenTime := inttostr(strtoint(stSirenTime) div 60);
      if Assigned(FOnSirenTime) then
      begin
        OnSirenTime(Self,aECUID,stSirenTime);
      end;
    end;
  end;
end;

function TdmSocket.DeviceType_Check(aDelay:Boolean=False;aPriority:integer=2): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'EX02';
  G_bDeviceResponse[DEVICETYPECHECK] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
    result := ResponseCheck(DEVICETYPECHECK,G_nDelayTime);

end;

procedure TdmSocket.RcvDeviceType(aECUID, aVer, aRealData: string);
var
  stDeviceType : string;
begin
  G_bDeviceResponse[DEVICETYPECHECK] := True;
  stDeviceType := copy(aRealData,5,Length(aRealData)-4);
//  if stDeviceCode = 'ACC-503' then  stDeviceType := 'ICU'
//  else stDeviceType := 'ECU';
  if Assigned(FOnDeviceType) then
  begin
    OnDeviceType(Self,aECUID,stDeviceType);
  end;

end;

procedure TdmSocket.RcvSystemFunction(aECUID, aVer, aRealData: string);
var
  stSystemFunction : string;
  stBit : string;
  bJavaraCloseCommand : Boolean;
  bJavaraOpenCommand : Boolean;
  bFireServerCommand : Boolean;
begin
  stSystemFunction := copy(aRealData,5,Length(aRealData)-4);

  G_bDeviceResponse[SYSTEMFUNCTION] := True;

  if Pos('Undefined Command',aRealData) <> 0 then Exit;

  Delete(stSystemFunction,1,4);// 'SyFn' �κ� ����
  stBit := HexToBinary(stSystemFunction);

  case stBit[4] of   //�ڹٶ� ���� ���
    '0' : bJavaraCloseCommand := False;
    '1' : bJavaraCloseCommand := True;
  else
    bJavaraCloseCommand := False;
  end;
  case stBit[5] of   //�ڹٶ� ���� ���
    '0' : bJavaraOpenCommand := False;
    '1' : bJavaraOpenCommand := True;
  else
    bJavaraOpenCommand := False;
  end;
  case stBit[6] of   //ȭ��
    '0' : bFireServerCommand := False;
    '1' : bFireServerCommand := True;
  else
    bFireServerCommand := False;
  end;

  if Assigned(FOnSystemFunction) then
  begin
    OnSystemFunction(Self,aECUID,bJavaraCloseCommand,bJavaraOpenCommand,bFireServerCommand);
  end;

end;

procedure TdmSocket.RcvDeviceVersion(aECUID, aVer, aRealData: string);
var
  stDeviceVersion : string;
begin
  G_bDeviceResponse[DEVICEVERSIONCHECK] := True;
  
  stDeviceVersion := copy(aRealData,5,Length(aRealData)-4);
  if Assigned(FOnDeviceVersion) then
  begin
    OnDeviceVersion(Self,aECUID,stDeviceVersion);
  end;

end;

procedure TdmSocket.RcvCardReaderVersion(aECUID, aVer, aRealData: string);
var
  stCardReaderNo : string;
  stCardReaderVersion : string;
  nReaderPoint : integer;
begin

  stCardReaderNo := copy(aRealData,3,2);

  if isDigit(stCardReaderNo) then
  begin
    nReaderPoint := (strtoint(aEcuID) * G_nCardReaderNumber ) + strtoint(stCardReaderNo);
    G_bCardReaderVersionResponse[nReaderPoint] := True;
  end;

  stCardReaderVersion := copy(aRealData,5,Length(aRealData) - 4);
  if Assigned(FOnCardReaderVersion) then
  begin
    OnCardReaderVersion(Self,aECUID,stCardReaderNo,stCardReaderVersion);
  end;

end;

function TdmSocket.UsedDevice_Check(aDelay:Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'EX00';
  G_bDeviceResponse[USEDEVICECHECK] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(USEDEVICECHECK,G_nDelayTime);

end;

function TdmSocket.DeviceVersion_Check(aEcuID: string;aDelay: Boolean=True;aPriority:integer=2;aDelayTime:integer=0): Boolean;
var
  stData : string;
begin
  Result := false;
  if aDelayTime = 0 then aDelayTime := G_nDelayTime;
  stData := 'VR00';

  G_bDeviceResponse[DEVICEVERSIONCHECK] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
    result := ResponseCheck(DEVICEVERSIONCHECK,aDelayTime);    //���Ÿ���� ��ٸ��� ����.

end;

function TdmSocket.ID_Registration(aID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'ID00' + aID;

  G_bDeviceResponse[IDCHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(IDCHECK,G_nDelayTime);
end;

function TdmSocket.UsedDevice_Registration(aUseEcu: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'EX00' + aUseEcu;

  G_bDeviceResponse[USEDEVICECHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(USEDEVICECHECK,G_nDelayTime);
end;

function TdmSocket.RegistSerialWritewiznet(aIP, aSubNet, aGateway, aPort,
  aServerIP, aServerPort, aMode, aDhcp: string): Boolean;
var
  I: Integer;
  No: Integer;
  st, st2: string;
  DataStr: string;
  FHeader: string[2];
  FMacAddress: string[12];
  FMode: string[2];
  FIPAddress: string[8];
  FSubnet: string[8];
  FGateway: string[8];
  FClientPort: string[4];
  FServerIP: string[8];
  FServerPort: string[4];
  FSerial_Baud: string[2];
  FSerial_data: string[2];
  FSerial_Parity: string[2];
  FSerial_stop: string[2];
  FSerial_flow: string[2];
  FDelimiterChar: string[2];
  FDelimiterSize: string[4];
  FDelimitertime: string[4];
  FDelimiterIdle: string[4];
  FDebugMode: string[2];
  FROMVer: string[4];
  FOnDHCP: string[2];
  FReserve: string[6];
  stData : string;
begin
  Result := false;

  //1.Header
  FHeader := 'AA';
  //2.MAC Address ��������
  FMacAddress := '000000000000';
  //3.Mode (Server mode: 01, Client mode: 00)
  FMode := aMode;
  // 4.IP address
  st2 := '';
  for I := 0 to 3 do
  begin
    st  := FindCharCopy(aIP, I, '.');
    No  := StrToInt(st);
    st2 := st2 + Char(No);
  end;
  FIPAddress := ToHexStrNoSpace(st2);

  // 5.Subnet mask
  st2 := '';
  for I := 0 to 3 do
  begin
    st  := FindCharCopy(aSubnet, I, '.');
    No  := StrToInt(st);
    st2 := st2 + Char(No);
  end;
  FSubnet := ToHexStrNoSpace(st2);

  // 6.Gateway address
  st2 := '';
  for I := 0 to 3 do
  begin
    st  := FindCharCopy(aGateway, I, '.');
    No  := StrToInt(st);
    st2 := st2 + Char(No);
  end;
  FGateway := ToHexStrNoSpace(st2);

  //7.Port number (Client)
  st2 := '';
  if aPort = '' then aPort := '3000';
  st := Dec2Hex(strtoint64(aPort), 2);
  if Length(st) < 4 then st := '0' + st;
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FClientPort := ToHexStrNoSpace(st2);

  //8. Server IP address
  st2 := '';
  for I := 0 to 3 do
  begin
    st  := FindCharCopy(aServerIp, I, '.');
    No  := StrToInt(st);
    st2 := st2 + Char(No);
  end;
  FServerIP := ToHexStrNoSpace(st2);

  //9.  Port number (Server)
  st2 := '';
  if aServerPort = '' then aServerPort := '3000';
  st2 := '';
  st := Dec2Hex(strtoint64(aServerPort), 2);
  if Length(st) < 4 then st := '0' + st;
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FServerPort := ToHexStrNoSpace(st2);

  //10. Serial speed (bps)
  FSerial_Baud := 'FD';
  {
  case ComboBox_Boad.ItemIndex of
    0: FSerial_Baud:= 'F4'; //9600           F4
    1: FSerial_Baud:= 'FA'; //19200          FA
    2: FSerial_Baud:= 'FD'; //38400 Default  FD
    3: FSerial_Baud:= 'FE'; //57600          FE
    4: FSerial_Baud:= 'FF'; //115200         FF
    else FSerial_Baud:= 'FD';
  end;
   }

  //11. Serial data size (08: 8 bit), (07: 7 bit)
  FSerial_data := '08';

  //12. Parity (00: No), (01: Odd), (02: Even)
  FSerial_Parity := '00';
  //13. Stop bit
  FSerial_stop := '01';

  //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)
  FSerial_flow := '00';

  //15. Delimiter char
  FDelimiterChar := '03';

  //16.Delimiter size
  st := '0000';
  st2 := '';
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FDelimiterSize := ToHexStrNoSpace(st2);
                              
  //17. Delimiter time
  st := Dec2Hex(strtoint64('10'), 2);
  st := FillZeroStrNum(st, 4);

  st2 := '';
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FDelimitertime := ToHexStrNoSpace(st2);

  //18.Delimiter idle time
  st := '0000';
  st2 := '';
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FDelimiterIdle := ToHexStrNoSpace(st2);

  //19. Debug code (00: ON), (01: OFF)
  FDebugMode := '01';

  //20.Software major version
  FROMVer := '0000';

  // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)
  FOnDHCP := aDhcp;

  //22.Reserved for future use
  FReserve := '000000';

  DataStr := FHeader + FMacAddress + FMode + FIPAddress + FSubnet +
    FGateway + FClientPort + FServerIP + FServerPort + FSerial_Baud +
    FSerial_data + FSerial_Parity + FSerial_stop + FSerial_flow +
    FDelimiterChar + FDelimiterSize + FDelimitertime + FDelimiterIdle +
    FDebugMode + FROMVer + FOnDHCP + FReserve;

  stData := 'NW00' + DataStr;

  G_bDeviceResponse[SERIALWIZNET] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(SERIALWIZNET,G_nDelayTime);

end;

function TdmSocket.SysInfo_Check(aEcuID: string;aDelay:Boolean=True;aPriority:integer=2): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'SY00';

  G_bDeviceResponse[SYSINFOCHECK] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
    result := ResponseCheck(SYSINFOCHECK,G_nDelayTime);

end;

function TdmSocket.RegistSystemInfo(aEcuID, aWatchPowerOff, aDelayIn,
  aDelayOut, aDoor1Type, aDoor2Type,aDoor3Type,aDoor4Type,aDoor5Type,
  aDoor6Type,aDoor7Type,aDoor8Type, aLocate: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'SY00' +                                   // COMMAND
    aWatchPowerOff +                                  // �������ÿ���
    FillZeroNumber(strtoint(aDelayOut), 3) +          // ��������ð�
    '2' +                                             // ����
    aDoor1Type +                                      // Door1
    aDoor2Type +                                      //Door2
    SetStrLength(aLocate, 16) +                           // ��ġ��
    FillZeroNumber(strtoint(aDelayIn), 3) +           // �Խ������ð�
    '0'  +                                             // ���� ��� ���(����)
    aDoor3Type +                                      // Door3
    aDoor4Type +                                      //Door4
    aDoor5Type +                                      // Door5
    aDoor6Type +                                      //Door6
    aDoor7Type +                                      // Door7
    aDoor8Type ;                                      //Door8

  G_bDeviceResponse[SYSINFOCHECK] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(SYSINFOCHECK,G_nDelayTime);

end;

function TdmSocket.AlarmState_Check(aEcuID: string;aArmArea:integer;aDelay:Boolean=True;aMain:Boolean=False): Boolean;
var
  stData : string;
  stTargetEcuID : string;
  stArmArea : string;
  i : integer;
begin
  stArmArea := '';
  for i := 0 to FIXARMAREANO do
  begin
    stArmArea := stArmArea + '0';
  end;
  stArmArea[aArmArea + 1] := '1';
  Result := false;
  if aArmArea = 0 then
  begin
    if aMain then stData := 'RD00'
    else stData := 'RD00' + aEcuID;
    stTargetEcuID := '00';
  end else
  begin
    stTargetEcuID := aEcuID;
    stData := 'rd01' + stArmArea;
  end;

  G_bDeviceResponse[ALARMSTATECHECK] := False;

  SendPacket(stTargetEcuID, 'R', stData,G_stDeviceVer, aDelay);

  if aDelay then
  result := ResponseCheck(ALARMSTATECHECK,G_nDelayTime);

end;

procedure TdmSocket.DeviceRcvAlarmSearchData(aECUID, aVer,
  aRealData: string);
var
  stTime : string;
  stSubCLass : string;
  stSubAddr : string;
  stZone : string;
  stMode : string;
  stStatus : string;
  stLoop : string;
  stState : string;
  stOper : string;
  nIndex : integer;
begin
  G_bDeviceResponse[ALARMSTATECHECK] := True;
  
  stTime     := copy(aRealData,2,14);
  stSubCLass := copy(aRealData,16,2);
  stSubAddr  := copy(aRealData,18,2);
  stZone     := copy(aRealData,20,2);
  stMode     := copy(aRealData,22,1);
  stStatus   := copy(aRealData,23,2);
  stLoop     := copy(aRealData,25,2);
  stState    := copy(aRealData,27,1);
  if aVer = 'ST' then
  begin
    if isDigit(copy(aRealData,28,2)) then stOper := copy(aRealData,30,strtoint(copy(aRealData,28,2)))
    else stOper     := copy(aRealData,28,10);
  end
  else
    stOper     := copy(aRealData,28,10);

  if Assigned(FOnAlarmEvent) then
  begin
    OnAlarmEvent(Self,aECUID,'O',stTime,stSubCLass,stSubAddr,stZone,stMode,stStatus,stLoop,stState,stOper);
  end;

  if (stSubCLass = 'MN') or (stSubCLass = 'EX') or (stSubCLass = 'SC') then
  begin
    if stStatus = 'NF' then ECUConnected(aECUID,False)
    else ECUConnected(aECUID,True);
  end else ECUConnected(aECUID,True);

end;

function TdmSocket.ChangeAlarmMode(aEcuID, aMode: string;aArmArea:integer = 0): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'MC' +         //COMMAND
            FillZeroNumber(aArmArea,2) + //�������
            aMode;                //A:���, D:����, P:��ȸ

  G_bDeviceResponse[ALARMCONTROL] := False;
  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(ALARMCONTROL,G_nDelayTime);

end;

function TdmSocket.DoorSystemInfo_Check(aEcuID, aDoorNo: string;aDelay:Boolean=True;aPriority:integer=2): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'B' + '0' +                             //MSG Code
            aDoorNo +               //����ȣ
            #$20 + #$20 + '00000000000000000000';          //��ȸ�� ��ü�� '0'���� ��ŷ

  G_bDeviceResponse[DOORSYSTEMCHECK] := False;
  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, aDelay,aPriority);
  result := ResponseCheck(DOORSYSTEMCHECK,G_nDelayTime);

end;

function TdmSocket.RegistDoorSystemInfo(aEcuID, aDoorNo, aCardModeType,
  aDoorModeType, aDoorControlTime, aDoorLongOpenTime, aScheduleUse,
  aDoorStatusUse, aDoorLongTimeUse, aDoorLockType, aDoorFireOpenUse,
  aDoorDSOpenState, aRemoteOpen: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'A' +                       //MSG Code
    '0' +                              //Msg Count(����)
    aDoorNo +                //����ȣ
    #$20 + #$20 +                      // Record count
    aCardModeType +              //ī�����
    aDoorModeType +              //���Թ� ����
    aDoorControlTime +          //Door���� �ð�
    aDoorLongOpenTime +          //��ð� ���� �溸
    aScheduleUse +           //������ ��������
    aDoorStatusUse +         //���Թ���������
    '0' +                              //����̻�� ���(������:����)
    '0' +                              //AntiPassBack(������:����)
    aDoorLongTimeUse +          //��ð� ���� �������
    '0' +                              //��� �̻�� ���� ��� (������:����)
    aDoorLockType +              //������ Ÿ��
    aDoorFireOpenUse +         //ȭ�� �߻��� ������
    '0' +                              //DS LS �˻�(������:����)
    aDoorDSOpenState +           //���Թ��������� (DS OPEN 0x30,DS CLOSE 0x31)
    aRemoteOpen +  //���������� (DoorOpen 0x30,DoorClose 0x31)
    '00000';                           //����

  G_bDeviceResponse[DOORSYSTEMCHECK] := False;

  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);

  result := ResponseCheck(DOORSYSTEMCHECK,G_nDelayTime);


end;

function TdmSocket.DoorLockDeviceState_Check(aEcuID:string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'SM20';

  G_bDeviceResponse[LOCKSTATECHECK] := False;
  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(LOCKSTATECHECK,G_nDelayTime);

end;

//�̻�߻� üũ : ȭ�� ��
function TdmSocket.ZoneSensState_Check: Boolean;
var
  stData : string;
begin
  AlarmVariable_Initialize;

  Result := false;
  stData := 'SM24';

  G_bDeviceResponse[ZONESENSECHECK] := False;
  SendPacket('00', 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(ZONESENSECHECK,G_nDelayTime);

end;

procedure TdmSocket.AlarmVariable_Initialize;
var
  i : integer;
begin
  for i := 0 to HIGH(G_bFireDevice) do
  begin
    G_bFireDevice[i] := False;
  end;

end;

function TdmSocket.CardReaderType_Check(aEcuID:string;aDelay:Boolean=True;aPriority:integer=2): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Ct00';

  G_bDeviceResponse[CARDREADERTYPE] := False;
  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);
  result := ResponseCheck(CARDREADERTYPE,G_nDelayTime);

end;

function TdmSocket.CardReaderInfo_Check(aEcuID,
  aReaderNo: string;aDelay:Boolean=True;aPriority:integer=2): Boolean;
var
  stData : string;
  nReaderPoint : integer;
begin
  Result := false;
  stData := 'CD' + FillZeroNumber(strtoint(aReaderNo), 2);

  nReaderPoint := (strtoint(aEcuID) * G_nCardReaderNumber ) + strtoint(aReaderNo);

  G_bCardReaderResponse[nReaderPoint] := False;
//  G_bDeviceResponse[CARDREADERINFO] := False;
  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
     result := CardReaderResponseCheck(nReaderPoint,G_nDelayTime);

end;

function TdmSocket.CardReaderVersion_Check(aEcuID,
  aReaderNo: string;aDelay:Boolean=True): Boolean;
var
  stData : string;
  nReaderPoint : integer;
begin
  Result := false;
  stData := 'CV' + FillZeroNumber(strtoint(aReaderNo), 2);

  nReaderPoint := (strtoint(aEcuID) * G_nCardReaderNumber ) + strtoint(aReaderNo);
  G_bCardReaderVersionResponse[nReaderPoint] := False;
  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, aDelay);
  if aDelay then
  result := CardReaderVersionResponseCheck(nReaderPoint,G_nDelayTime);

end;

function TdmSocket.RegistCardType(aEcuID, aCardType: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Ct00' + aCardType;

  G_bDeviceResponse[CARDREADERTYPE] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(CARDREADERTYPE,G_nDelayTime);

end;

function TdmSocket.RegistCardReaderInfo(aEcuID: string; aReaderNo,
  aReaderUse, aReaderDoor, aReaderDoorLocate,
  aReaderBuildingLocate,aReaderArmArea: integer; aLocate: string): Boolean;
var
  stData : string;
  nReaderPoint : integer;
begin
  if aReaderArmArea < 0 then aReaderArmArea := 0;
  stData := 'CD' +                                      //COMMAND
    FillZeroNumber(aReaderNo, 2) +                        //���� ��ȣ
    IntToStr(aReaderUse) +                                //���� ��� ����
    IntToStr(aReaderDoorLocate) +                         //���� ��ġ
    IntToStr(aReaderDoor) +                               //Door No
    FillZeroNumber(aReaderArmArea,2) +                    //�������
    SetStrLength(aLocate, 16) +                           //��ġ��
    IntToStr(aReaderBuildingLocate);                      //�ǹ���ġ��ġ

  nReaderPoint := (strtoint(aEcuID) * G_nCardReaderNumber ) + aReaderNo;

  G_bCardReaderResponse[nReaderPoint] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := CardReaderResponseCheck(nReaderPoint,G_nDelayTime);

end;

function TdmSocket.AllFireRecovery: Boolean;
var
  stData : string;
begin
  Result := false;
  //stData := 'SM2599';
  stData := 'SM2699RSM2500a';

  G_bDeviceResponse[FIRERECOVERY] := False;
  SendPacket('00', 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(FIRERECOVERY,G_nDelayTime);

end;

procedure TdmSocket.RcvFireRecovery(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[FIRERECOVERY] := True;
  Delete(aRealData,1,4);
  if Assigned(FOnFireRecovery) then
  begin
    OnFireRecovery(Self,aECUID,'',aRealData);
  end;

end;

function TdmSocket.RemoteDoorControl(aEcuID, aDoorNo, aControlType,
  aControl: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'C' + '0' +                      //����/������ ����
            aDoorNo +                        //��⳻ ����ȣ
            '0' +                            //����
            aControlType +                   //'0':�ش���׾���,'1':ī��,'2':���Կ,'3':��������
            aControl;                        // ī��:Positive:'0',Negative:'1'
  // ���Կ:'0':� ,'1':����
  // ��������:'0':����,'1':����

  G_bDeviceResponse[DOORCONTROL] := False;
  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);
  result := ResponseCheck(DOORCONTROL,G_nDelayTime);

end;

function TdmSocket.PortInfo_Check(aEcuID, aPortNo: string;aDelay:Boolean=True;aPriority:integer=2): Boolean;
var
  stData : string;
  nPortPoint : integer;
begin
  Result := false;
  stData := 'LP' + FillZeroNumber(strtoint(aPortNo), 2);

  nPortPoint := (strtoint(aEcuID) * G_nPortNumber ) + strtoint(aPortNo);
  G_bPortResponse[nPortPoint] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);
  result := PortResponseCheck(nPortPoint,G_nDelayTime);

end;

function TdmSocket.PortState_Check(aEcuID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'SM10';

  G_bDeviceResponse[PORTSTATE] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(PORTSTATE,G_nDelayTime);

end;

function TdmSocket.RegistPortInfo(aEcuID, aPortNo, aWatchType, aDelayUse,
  aRecoverUse, aPortDelayTime, aStatusCode,aZoneArmArea, aLocate,aZoneUsed: string): Boolean;
var
  stData : string;
  nPortPoint : integer;
begin

  stData := 'LP' +                             //COMMAND
    FillZeroNumber(strtoint(aPortNo),2) +      //��Ʈ��ȣ
    aStatusCode +                              //�����ڵ�('SS' ����Ʈ)
    aWatchType +                               //��������
    '0' +                                      //�˶��߻� ���(����)
    aRecoverUse +                              //������ȣ����(����)
    aDelayUse +                                //�����ð� �������
    '00' +                                     //����
    '00' +                                     //���̷�
    '00' +                                     //������1
    '00' +                                     //������2
    '00' +                                     //���Թ�����1
    '00' +                                     //���Թ�����2
    '00' +                                     //���η���
    '00' +                                     //���ν��̷�
    '00' +                                     //���θ�����1
    '00' +                                     //���θ�����2
    aZoneArmArea +                                     //������ȣ
    SetStrLength(aLocate, 16) +                   //��ġ��
    FillZeroNumber(strtoint(aPortDelayTime), 2) +           //�����ð�
    '00'+                                          //������
    aZoneUsed;

  nPortPoint := (strtoint(aEcuID) * G_nPortNumber ) + strtoint(aPortNo);
  G_bPortResponse[nPortPoint] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := PortResponseCheck(nPortPoint,G_nDelayTime);

end;

function TdmSocket.WiznetModuleInfo_Check(aDelay:Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'NW00';

  G_bDeviceResponse[WIZNETMODULECHECK] := False;

  SendPacket('00', 'Q', stData,G_stDeviceVer, aDelay);
  if aDelay then
  result := ResponseCheck(WIZNETMODULECHECK,G_nDelayTime);

end;

function TdmSocket.EcuStatusCheck: Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'cs00';

  G_bDeviceResponse[ECUSTATE] := False;

  SendPacket('00', 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(ECUSTATE,G_nDelayTime);

end;

procedure TdmSocket.RcvEcuState(aEcuId, aVer, aRealData: string);
var
  i : integer;
begin
  G_bDeviceResponse[ECUSTATE] := True;
  if Assigned(FOnEcuState) then
  begin
    OnEcuState(Self,aECUID,aRealData);
  end;
  Delete(aRealData,1,4);
  for i:= 1 to Length(aRealData) do
  begin
    if aRealData[i] = '1' then
    begin
      ECUConnected(FillZeroNumber(i-1,2),True);
    end else
    begin
      ECUConnected(FillZeroNumber(i-1,2),False);
    end;
  end;
end;

procedure TdmSocket.SendTimerTimer(Sender: TObject);
var
  stTemp : string;
begin
  Try
    SendTimer.Enabled := False;

    if SocketType = 0 then
    begin
      if Not Commport.Open then Exit;
    end else if SocketType = 1 then
    begin
      if Not ClientSocket.Active then Exit;
    end else if SocketType = 2 then
    begin
      if Not IdTCPClient.Connected then Exit; 
    end else if SocketType = 2 then
    begin
      if Not dmWinSocket.Open then Exit;
    end;

    if L_bSending then
    begin
      L_bSending := False;
      Exit;
    end;

    if FirstSendDataList.Count > 0 then
    begin
      stTemp := FirstSendDataList.Strings[0];
      FirstSendDataList.Delete(0);
      L_bSending := True;
      SocketPutString(stTemp);
      Exit;
    end;

    if L_nDelaySendTime > 1 then
    begin
      L_nDelaySendTime := L_nDelaySendTime - 1;
      Exit;
    end;
    //if G_bResponseChecking then Exit; //���� ���� ��� ���� ���� ������ ��Ŷ�� �۽����� ����. => �̷��� �ϴ� ù��° ���� ���� ���� ���ؼ� �� �۽��Ҷ� ���� ��

    if QuickSendDataList.Count > 0 then
    begin
      stTemp := QuickSendDataList.Strings[0];
      QuickSendDataList.Delete(0);
      L_bSending := True;
      SocketPutString(stTemp);
      L_nDelaySendTime := 2;
      Exit;
    end;

    if L_nDelaySendTime > 0 then
    begin
      L_nDelaySendTime := L_nDelaySendTime - 1;
      Exit;
    end;

    if ReserveSendDataList.Count > 0 then
    begin
      stTemp := ReserveSendDataList.Strings[0];
      ReserveSendDataList.Delete(0);
      L_bSending := True;
      SocketPutString(stTemp);
      L_nDelaySendTime := 2;
      Exit;
    end;
    if CardFull then CardSendDataList.Clear
    else if (CardSendDataList.Count > 0) then
    begin
      stTemp := CardSendDataList.Strings[0];
      CardSendDataList.Delete(0);
      L_bSending := True;
      SocketPutString(stTemp);
      L_nDelaySendTime := 5;  //5 ���� �׽�Ʈ�� 50
      Exit;
    end;
    if Not G_bDeviceSearch then Exit; //�ǽð� ��ȸ���� �ƴϸ� ��ȸ �����ʹ� �������� ����
    //��ȸ������
    if SearchSendDataList.Count > 0 then
    begin
      stTemp := SearchSendDataList.Strings[0];
      SearchSendDataList.Delete(0);
      L_bSending := True;
      SocketPutString(stTemp);
      L_nDelaySendTime := 2;
      Exit;
    end;
  Finally
    SendTimer.Enabled := DataSending;
  End;

end;

function TdmSocket.DeviceCardSearch(aEcuID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'CD11';

  G_bDeviceResponse[CARDLIST] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(CARDLIST,G_nDelayTime);

end;

function TdmSocket.CardDownLoad(aEcuID, aCardNo, aPermit, aDoor1, aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
         aAlarm,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8, aValidDate,aPatrolCardType,aCardType,
         aCardPositionType,aPositionNum: string): Boolean;
var
  stData : string;
  stRegCode : string;
  stCardType : string;
  stTempCardNo : string;
  nCardLength : integer;
  //stCardIdNo : string;
  stAlarmAreaGrade : string;
  stDoorAreaGrade : string;
  stCardPositionUpdate : string;
  nDelayTime : integer;
  nIndex : integer;
begin
  if aPatrolCardType <> 'V' then aPatrolCardType := ' ';
  stCardPositionUpdate := '0';
  if isDigit(aPositionNum) then aPositionNum := FillZeroNumber(strtoint(aPositionNum),5)
  else aPositionNum := FillZeroNumber(0,5);
  nIndex := DeviceList.IndexOf(aECUID);
  if nIndex < 0 then Exit;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxCardCount < strtoint(aPositionNum) then Exit; //ī�� �ִ� ������� ������ �������� ����.

  
  if aCardPositionType = 'Y' then
  begin
    stCardPositionUpdate := 's';
    if aPermit <> 'N' then aPermit := 'E'; //��ġ��ȣ ���� �Ҷ��� E �������� ��������.
  end else aPositionNum := '*****';

  if aDoor1 = 'Y' then
  begin
    stRegCode := '1';     //ù��° �� ���
    if aDoor2 = 'Y' then stRegCode := '0';       //ù��° �ι�° �����
  end
  else if aDoor2 = 'Y' then
  begin
    stRegCode := '2';  //�ι�° ��
  end else
  begin
    if (aDoor3 = 'Y') or
       (aDoor4 = 'Y') or
       (aDoor5 = 'Y') or
       (aDoor6 = 'Y') or
       (aDoor7 = 'Y') or
       (aDoor8 = 'Y') then stRegCode := '0'
    else
      stRegCode := '3';   //�������
  end;

  if aAlarm = 'Y' then
  begin
    if stRegCode = '3' then stCardType := '1' //�������
    else stCardType := '2';   //���Թ��
  end else
  begin
    if (aAlarm1 = 'Y') or
       (aAlarm2 = 'Y') or
       (aAlarm3 = 'Y') or
       (aAlarm4 = 'Y') or
       (aAlarm5 = 'Y') or
       (aAlarm6 = 'Y') or
       (aAlarm7 = 'Y') or
       (aAlarm8 = 'Y') then
    begin
      if stRegCode = '3' then stCardType := '1' //�������
      else stCardType := '2';   //���Թ��
    end else
    begin
      stCardType := '0';    //��������
      if aPatrolCardType <> 'V' then
      begin
        if stRegCode = '3' then aPermit :='N';  //��� ���� ���� ��� ������ ����
      end;
    end;
  end;

  nCardLength := Length(aCardNo);
  if (aCardType = AUTOKT811) or    //���α���
     (aCardType = COMMON811) then  //����
  begin
    aCardNo := copy(aCardNo,1,8);
    stTempCardNo := inttostr(Hex2Dec64(aCardNo));
    stTempCardNo := EncodeCardNo(stTempCardNo);
    aCardNo := stTempCardNo;
    nCardLength := 0;
  end else if (aCardType = UNIVER811) or (aCardType = MERGECARD) then
  begin
    aCardNo := FillCharStr(aCardNo,'*',16);
  end;
  if Length(aValidDate) <> 6 then aValidDate := FillZeroNumber(0,6);

  //stCardIDNo := FillZeroNumber(0,5);
  stAlarmAreaGrade := GetAlarmAreaGrade(aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8);
  stDoorAreaGrade := GetDoorAreaGrade(aDoor1, aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8);

  stData:= aPermit +
          //InttoStr(Send_MsgNo)+     // Message Count
          '0'+
          stRegCode+                      //����ڵ�(0:1,2   1:1����,  2:2����, 3:�������)
          ' '+                     //RecordCount  #$20
          aPatrolCardType +        //����ī��
          '0'+                      //����
          FillzeroNumber(nCardLength,2) + //ī�����
          aCardNo+                  //ī���ȣ
          aValidDate +              //��ȿ�Ⱓ
          //'0'+                      //��� ���
          stCardPositionUpdate +
          stCardType+               //ī�����(0:��������,1:�������,2:���+����)
          '0' +                       //Ÿ������
          aPositionNum +              // ��ġ ��ȣ
          stAlarmAreaGrade +
          stDoorAreaGrade ;

  G_bDeviceResponse[CARDDOWNLOADACK] := False;

  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, False,4);
  nDelayTime := 5000;
  result := ResponseCheck(CARDDOWNLOADACK,nDelayTime);   //�ǹ��̰����� �������

end;

function TdmSocket.CardSearchCancel(aEcuID: string): Boolean;
var
  stData : string;
begin
  stData := 'CD10';
  G_bDeviceResponse[CARDLISTCANCEL] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);

  result := ResponseCheck(CARDLISTCANCEL,G_nDelayTime);   

end;

function TdmSocket.DeviceSchedule_Check(aEcuID, aDoorNo,
  aDayCode: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData:= 'P'+        //Command
        '0'+        //Message Code
        aDoorNo+      //��⳻ ���Թ� ��ȣ
        #$20+
        aDayCode;       //����:0����,1������,2:�Ͽ���,3����

  G_bDeviceResponse[SCHEDULE] := False;

  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);
  result := ResponseCheck(SCHEDULE,G_nDelayTime);

end;

function TdmSocket.RegistrationDeviceSchedule(aEcuID,aDoorNo,aDayCode,
  aScheduleData: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData:= 'S'+        //Command
        '0'+        //Message Code
        aDoorNo+      //��⳻ ���Թ� ��ȣ
        #$20+
        aDayCode+       //����:0����,1������,2:�Ͽ���,3����
        aScheduleData;      // Mode Data

  G_bDeviceResponse[SCHEDULE] := False;

  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);

  result := ResponseCheck(SCHEDULE,G_nDelayTime);

end;

function TdmSocket.Holiday_Search(aEcuID, aDoorNo, aDate,aHolidayType: string): string;
var
  stData : string;
  bResult : Boolean;
  i : integer;
  stEcuID : string;
  stDoorNo : string;
begin
  Result := '';
  stData := 'R' + //��ȸ'R'
            '0' + //���� 0 ���� 1
            aDoorNo + //0:��ü,1:1����,2:2����
            ' ' + //�����̽�
            ' ' + //A:�߰�,D����,W:��ü����
            aDate + //MMDD
            aHolidayType;  //'3' : Ư����

  G_bDeviceResponse[HOLIDAY] := False;
  L_stReceiveHoliday := '';
  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);

  bResult := ResponseCheck(HOLIDAY,G_nDelayTime);

  if L_stReceiveHoliday = '' then Exit;

  stEcuID := copy(L_stReceiveHoliday,1,2);
  Delete(L_stReceiveHoliday,1,2);
  Try
    stDoorNo := L_stReceiveHoliday[3];
  Except
    Exit;
  End;
  if (stEcuID = aEcuID) and (stDoorNo = aDoorNo) then
  begin
    Delete(L_stReceiveHoliday,1,5);
    result := L_stReceiveHoliday;
    Exit;
  end;
  G_bDeviceResponse[HOLIDAY] := False;
  L_stReceiveHoliday := '';

end;

function TdmSocket.registHoliday(aEcuID, aDoorNo,aCMD, aHoliday,
  aHolidayType: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'Q' + //��ȸ'R'
            '0' + //���� 0 ���� 1
            aDoorNo + //0:��ü,1:1����,2:2����
            ' ' + //�����̽�
            aCMD + //A:�߰�,D����,W:��ü����
            aHoliday + //MMDD
            aHolidayType;  //'3' : Ư����

  G_bDeviceResponse[HOLIDAY] := False;

  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);

  result := ResponseCheck(HOLIDAY,G_nDelayTime);

end;

function TdmSocket.registTime(aDate: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'TM00' +   // COMMAND
            aDate;         // �ð�������

  G_bDeviceResponse[TIME] := False;

  SendPacket('00', 'R', stData,G_stDeviceVer, True);

  result := ResponseCheck(TIME,G_nDelayTime);

end;

function TdmSocket.TimeCheck: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'TM00' +   // COMMAND
            '20999999999999';         // �ð�������

  G_bDeviceResponse[TIME] := False;

  SendPacket('00', 'R', stData,G_stDeviceVer, True);

  result := ResponseCheck(TIME,G_nDelayTime);

end;

function TdmSocket.CdmaUseCheck: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL00';
  G_bDeviceResponse[USECDMACHECK] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);

  result := ResponseCheck(USECDMACHECK,G_nDelayTime);

end;

procedure TdmSocket.RcvCCCSettingData(aECUID, aVer, aRealData: string);
var
  stGubun : string;
begin
  stGubun:= Copy(aRealData,3,2);

  if stGubun = '00' then
  begin
    G_bDeviceResponse[USECDMACHECK] := True;
    if Assigned(FOnCDMASetting) then
    begin
      OnCDMASetting(Self,aECUID,aRealData[5]);
    end;
  end else if stGubun = '01' then
  begin
    G_bDeviceResponse[conCCCInfoCHECK] := True;
    if Assigned(FOnCCCInfoSetting) then
    begin
      Delete(aRealData,1,4);
      OnCCCInfoSetting(Self,aECUID,aRealData);
    end;
  end else if stGubun = '02' then
  begin
    G_bDeviceResponse[conCCCInfoCHECK] := True;
    if Assigned(FOnCCCInfoSetting) then
    begin
      Delete(aRealData,1,4);
      Delete(aRealData,1,1);
      OnCCCInfoSetting(Self,aECUID,aRealData);
    end;
  end else if stGubun = '20' then
  begin
    G_bDeviceResponse[conCCCTimeIntervalCheck] := True;
    if Assigned(FOnCCCTimeInterval) then
    begin
      Delete(aRealData,1,4);
      OnCCCTimeInterval(Self,aECUID,aRealData);
    end;
  end;

end;

function TdmSocket.CCCInfoCheck: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL01';
  G_bDeviceResponse[conCCCInfoCHECK] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCCCInfoCHECK,G_nDelayTime);

end;

function TdmSocket.CCCTimeIntervalCheck: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL20';
  G_bDeviceResponse[conCCCTimeIntervalCheck] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCCCTimeIntervalCheck,G_nDelayTime);

end;

function TdmSocket.CCCStartTimeCheck: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL21';
  G_bDeviceResponse[conCCCStartTimeCheck] := False;
  SendPacket('00', 'R', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCCCStartTimeCheck,G_nDelayTime);

end;

procedure TdmSocket.RcvCCCControlData(aECUID, aVer, aRealData: string);
var
  stGubun : string;
begin
  stGubun:= Copy(aRealData,3,2);
  Delete(aRealData,1,4);
  if stGubun = '20' then
  begin
    G_bDeviceResponse[conCCCStartTimeCheck] := True;
    if Assigned(FOnCCCStartTime) then
    begin
      OnCCCStartTime(Self,aECUID,aRealData);
    end;
  end else if stGubun = '21' then
  begin
    G_bDeviceResponse[conCCCStartTimeCheck] := True;
    if Assigned(FOnCCCStartTime) then
    begin
      OnCCCStartTime(Self,aECUID,aRealData);
    end;
  end;

end;

function TdmSocket.CdmaUseRegist(aData: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL00' + aData;
  G_bDeviceResponse[USECDMACHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(USECDMACHECK,G_nDelayTime);

end;

function TdmSocket.CCCInfoRegist(aIP, aPort: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL01' + aIP + ' ' + aPort;
  G_bDeviceResponse[conCCCInfoCHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCCCInfoCHECK,G_nDelayTime);

end;

function TdmSocket.CCCTimeIntervalRegist(aTime: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL20'+ aTime;
  G_bDeviceResponse[conCCCTimeIntervalCheck] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCCCTimeIntervalCheck,G_nDelayTime);

end;

function TdmSocket.CCCStartTimeRegist(aTime: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL20' + aTime;
  G_bDeviceResponse[conCCCStartTimeCheck] := False;
  SendPacket('00', 'R', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCCCStartTimeCheck,G_nDelayTime);

end;

function TdmSocket.MacSearch: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'NW00';

  G_bDeviceResponse[MACINFO] := False;

  SendPacket('00', 'Q', stData,G_stDeviceVer, True);

  result := ResponseCheck(MACINFO,G_nDelayTime);

end;

function TdmSocket.RegistMacAddress(aMac: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData:= 'NW99'+
          'AA'+
          aMac +
          '~mAc^wRITe^coNFIrm~';

  G_bDeviceResponse[MACINFO] := False;

  SendPacket('00', 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(MACINFO,G_nDelayTime);

end;

function TdmSocket.DoorState_Check(aEcuID, aDoorNo: string;aDelay:Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'C' + '0' +                             //MSG Code
            aDoorNo +                               //����ȣ
            '000' ;                               //��ȸ�� ��ü�� '0'���� ��ŷ

  G_bDeviceResponse[DOORCONTROL] := False;
  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, aDelay);
  if aDelay then
  result := ResponseCheck(DOORCONTROL,G_nDelayTime);

end;

procedure TdmSocket.RcvDeviceCode(aECUID, aVer, aRealData: string);
var
  stDeviceCode : string;
begin
  G_bDeviceResponse[DEVICECODECHECK] := True;
  stDeviceCode := copy(aRealData,5,Length(aRealData)-4);
  if Assigned(FOnDeviceCode) then
  begin
    OnDeviceCode(Self,aECUID,stDeviceCode);
  end;

end;

function TdmSocket.DeviceCode_Check(aEcuID: string;
  aDelay: Boolean=False;aPriority:integer=2): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'VR01';

  G_bDeviceResponse[DEVICECODECHECK] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
    result := ResponseCheck(DEVICECODECHECK,G_nDelayTime);    

end;

function TdmSocket.DeviceType_Registration(aUseEcuType: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'EX02' + aUseEcuType;

  G_bDeviceResponse[DEVICETYPECHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(DEVICETYPECHECK,G_nDelayTime);

end;

function TdmSocket.KTTSystemID_Registration(aLinkusID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Id00' + aLinkusID;

  G_bDeviceResponse[KTTSYSTEMID] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(KTTSYSTEMID,G_nDelayTime);

end;

procedure TdmSocket.RcvKTTSystemId(aECUID, aVer, aRealData: string);
var
  stTemp: string;
begin
  G_bDeviceResponse[KTTSYSTEMID] := True;
  stTemp := copy(aRealData,5,4);
  if stTemp <> 'AAAA' then
  begin
    stTemp := FillZeroNumber(Hex2Dec(stTemp),4);
  end;
  if Assigned(FOnKTTSystemID) then
  begin
    OnKTTSystemID(Self,aECUID,stTemp);
  end;

end;

procedure TdmSocket.RcvKTTTelNo(aECUID, aVer, aRealData: string);
var
  stTemp: string;
begin
  G_bDeviceResponse[KTTTELNUM] := True;
  stTemp := copy(aRealData,5,2);
  Delete(aRealData, 1, 6);
  if Assigned(FOnKTTTelNumber) then
  begin
    OnKTTTelNumber(Self,aECUID,stTemp,aRealData);
  end;

end;

procedure TdmSocket.RcvCardReaderTelNo(aECUID, aVer, aRealData: string);
var
  stTemp: string;
begin
  G_bDeviceResponse[CARDREADERTELNUMBERCHECK] := True;
  stTemp := copy(aRealData,5,2);
  Delete(aRealData, 1, 6);
  if Assigned(FOnCARDREADERTelNumber) then
  begin
    OnCARDREADERTelNumber(Self,aECUID,stTemp,aRealData);
  end;

end;

function TdmSocket.RegistKTTTelNum(aNo, aTelNum: string): Boolean;
var
  stData : string;
begin
  Result := false;
  aTelNum := SetSpaceLength(aTelNum, 20);
  stData := 'Tn00' + FillZeroNumber(strtoint(aNo),2) + aTelNum;

  G_bDeviceResponse[KTTTELNUM] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(KTTTELNUM,G_nDelayTime);

end;

function TdmSocket.RegistKTTRingCount(aArmRingCount,
  aDisArmRingCount: integer): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Rc00' + FillZeroNumber(aArmRingCount,2) + FillZeroNumber(aDisArmRingCount,2);

  G_bDeviceResponse[KTTRINGCOUNT] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(KTTRINGCOUNT,G_nDelayTime);

end;

function TdmSocket.KTTRingCountSearch: Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Rc00';

  G_bDeviceResponse[KTTRINGCOUNT] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);
  result := ResponseCheck(KTTRINGCOUNT,G_nDelayTime);

end;

function TdmSocket.KTTSystemIDSearch(aDelay:Boolean=True;aPriority:integer=2): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Id00';

  G_bDeviceResponse[KTTSYSTEMID] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, aDelay,aPriority);
  result := ResponseCheck(KTTSYSTEMID,G_nDelayTime);

end;

function TdmSocket.KTTTelNumSearch(aNo: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'Tn00' + FillZeroNumber(strtoint(aNo),2);

  G_bDeviceResponse[KTTTELNUM] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);
  result := ResponseCheck(KTTTELNUM,G_nDelayTime);

end;



function TdmSocket.ControlerReset(aEcuID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'RS00Reset';

  G_bDeviceResponse[DEVICERESET] := False;
  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(DEVICERESET,G_nDelayTime);

end;

function TdmSocket.RegistArmDsCheck(aEcuID, aDoorNo,
  aArmDsCheck: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'DL01' +                                   // COMMAND
    FillZeroNumber(strtoint(aDoorNo),2) +             // ���Թ���ȣ
    aArmDsCheck;                                         // 0 : �̻��,1:���

  G_bDeviceResponse[ARMDSCHECK] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(ARMDSCHECK,G_nDelayTime);

end;

procedure TdmSocket.RcvArmDsCheck(aECUID, aVer, aRealData: string);
var
  //stGubun : string;
  stDoorNo : string;
begin
  G_bDeviceResponse[ARMDSCHECK] := True;
  //stGubun:= Copy(aRealData,3,2);
  Delete(aRealData,1,4);
  stDoorNo := copy(aRealData,1,2);
  if Not isDigit(stDoorNo) then Exit;
  stDoorNo := inttostr(strtoint(stDoorNo));
  if isDigit(aRealData[3]) then
  begin
    if strtoint(aRealData[3]) < 2 then
    begin
    //���⼭ ArmDs üũ
      if Assigned(FOnArmDsCheck) then
      begin
        OnArmDsCheck(Self,aECUID,stDoorNo,aRealData[3]);
      end;
    end;
  end;


end;

function TdmSocket.SearchArmDsCheck(aEcuID, aDoorNo: string;aDelay:Boolean=True;aPriority:integer=2): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'DL01' +                                   // COMMAND
    FillZeroNumber(strtoint(aDoorNo),2) ;             // ���Թ���ȣ

  G_bDeviceResponse[ARMDSCHECK] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
    result := ResponseCheck(ARMDSCHECK,G_nDelayTime);

end;

function TdmSocket.RegistArmRelay(aEcuID, aArmRelay: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'fn05';
  if aArmRelay = '1'  then stData := stData + 'D'
  else stData := stData + 'A';

  G_bDeviceResponse[ARMRELAYTYPE] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(ARMRELAYTYPE,G_nDelayTime);

end;

procedure TdmSocket.RcvArmRelayCheck(aECUID, aVer, aRealData: string);
var
  nArmRelay : integer;
begin
  G_bDeviceResponse[ARMRELAYTYPE] := True;
  //stGubun:= Copy(aRealData,3,2);
  Delete(aRealData,1,4);
  if UpperCase(aRealData[1]) = 'A' then nArmRelay := 0
  else if UpperCase(aRealData[1]) = 'D' then nArmRelay := 1
  else Exit;

  if Assigned(FOnArmRelayCheck) then
  begin
    OnArmRelayCheck(Self,aECUID,'',inttostr(nArmRelay));
  end;

end;

function TdmSocket.SearchArmRelay(aEcuID: string;
  aDelay: Boolean=True;aPriority:integer=2): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'fn05';

  G_bDeviceResponse[ARMRELAYTYPE] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
    result := ResponseCheck(ARMRELAYTYPE,G_nDelayTime);

end;

function TdmSocket.RegistAlartLampSiren(aEcuID, aAlertLamp,
  aAlertSiren: string): Boolean;
var
  stData : string;
begin

  stData := 'RYEP'+aAlertLamp+aAlertSiren;

  G_bDeviceResponse[ALERTLAMPSIREN] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(ALERTLAMPSIREN,G_nDelayTime);

end;

function TdmSocket.AlartLampSirenStateCheck(aEcuID: string;aDelay:Boolean=True;aPriority:integer=2): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'RYEP';

  G_bDeviceResponse[ALERTLAMPSIREN] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);
  result := ResponseCheck(ALERTLAMPSIREN,G_nDelayTime);

end;

function TdmSocket.RegistAlertLampTime(aEcuID,
  aAlertLampTime: string): Boolean;
var
  stData : string;
begin

  if Not isDigit(aAlertLampTime) then Exit;

  stData := 'RYLP1110'+FillZeroNumber(strtoint(aAlertLampTime) * 60,5) ;

  G_bDeviceResponse[ALERTLAMPTIME] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(ALERTLAMPTIME,G_nDelayTime);

end;

function TdmSocket.RegistAlertSirenTime(aEcuID,
  aAlertSirenTime: string): Boolean;
var
  stData : string;
begin

  if Not Isdigit(aAlertSirenTime) then Exit;

  stData := 'RYSI1110'+FillZeroNumber(strtoint(aAlertSirenTime) * 60,5);

  G_bDeviceResponse[ALERTSIRENTIME] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(ALERTSIRENTIME,G_nDelayTime);

end;

function TdmSocket.AlertLampTimeCheck(aEcuID: string;aDelay:Boolean=True;aPriority:integer=2): Boolean;
var
  stData : string;
begin
  stData := 'RYLP1110';

  G_bDeviceResponse[ALERTLAMPTIME] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);
  result := ResponseCheck(ALERTLAMPTIME,G_nDelayTime);

end;

function TdmSocket.AlertSirenTimeCheck(aEcuID: string;aDelay:Boolean=True;aPriority:integer=2): Boolean;
var
  stData : string;
begin

  stData := 'RYSI1110';

  G_bDeviceResponse[ALERTSIRENTIME] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);
  result := ResponseCheck(ALERTSIRENTIME,G_nDelayTime);

end;


function TdmSocket.RegistcdmaSetData(aEcuID, aCdmaMin, aCdmaMux, aCdmaIP,
  aCdmaPort, aCdmachktime, aCdmarssi: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'WL02' +
                aCdmaMin + '}' +
                aCdmaMux + '}' +
                aCdmaIP + '}' +
                aCdmaPort + '}' +
                aCdmachktime + '}' +
                aCdmarssi + '}';

  G_bDeviceResponse[conCCCInfoCHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCCCInfoCHECK,G_nDelayTime);

end;

function TdmSocket.DVRUseRegist(aData: string): Boolean;
var
  stData : string;
begin
  Result := false;

  if aData = '1' then
  begin
    stData := 'DV00' + aData;
    G_bDeviceResponse[USEDVRCHECK] := False;
    SendPacket('00', 'I', stData,G_stDeviceVer, True);
  end else
  begin
    stData := 'SM2699IDV00' + aData; //��ü �̻�� �۽�
    G_bDeviceResponse[USEDVRCHECK] := False;
    SendPacket('00', 'R', stData,G_stDeviceVer, True);
  end;
  result := ResponseCheck(USEDVRCHECK,G_nDelayTime);

end;

procedure TdmSocket.RcvDVRSettingData(aECUID, aVer, aRealData: string);
var
  stGubun : string;
begin
  stGubun:= Copy(aRealData,3,2);
  delete(aRealData,1,4);
  if stGubun = '00' then
  begin
    G_bDeviceResponse[USEDVRCHECK] := True;
    if Assigned(FOnDVRUseSetting) then
    begin
      OnDVRUseSetting(Self,aECUID,aRealData);
    end;
  end else if stGubun = '01' then
  begin
    G_bDeviceResponse[DVRInfoCHECK] := True;
    if Assigned(FOnDVRInfoSetting) then
    begin
      OnDVRInfoSetting(Self,aECUID,aRealData);
    end;
  end;

end;

function TdmSocket.RegistDVRSetData(aEcuID, aDVRIP,
  aDVRPort: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'DV01' +
                aDVRIP + ' ' +
                aDVRPort ;

  G_bDeviceResponse[DVRInfoCHECK] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(DVRInfoCHECK,G_nDelayTime);

end;

function TdmSocket.DVRUseCheck(aEcuID: String): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'DV00';
  G_bDeviceResponse[USEDVRCHECK] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);

  result := ResponseCheck(USEDVRCHECK,G_nDelayTime);
end;

function TdmSocket.DVRSetDataSearch(aEcuID: String): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'DV01';
  G_bDeviceResponse[DVRInfoCHECK] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, True);

  result := ResponseCheck(DVRInfoCHECK,G_nDelayTime);

end;

 
function TdmSocket.CardReaderTelNumberSearch(aEcuID,
  aTelNo: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'TN01' + FillZeroNumber(strtoint(aTelNo),2);
  G_bDeviceResponse[CARDREADERTELNUMBERCHECK] := False;
  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, True);

  result := ResponseCheck(CARDREADERTELNUMBERCHECK,G_nDelayTime);

end;


function TdmSocket.CardReaderTelNumberRegist(aEcuID,aNo,
  aTelNo: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'TN01' + FillZeroNumber(strtoint(aNo),2) + SetSpacelength(aTelNo,20);
  G_bDeviceResponse[CARDREADERTELNUMBERCHECK] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(CARDREADERTELNUMBERCHECK,G_nDelayTime + 2000);

end;

function TdmSocket.CheckSystemFunction(aEcuID: string;aDelay:Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'VR90';
  G_bDeviceResponse[SYSTEMFUNCTION] := False;
  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(SYSTEMFUNCTION,G_nDelayTime);

end;

function TdmSocket.CheckFTP(aEcuID: string; aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'fp90';
  G_bDeviceResponse[FTPFUNCTION] := False;
  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(FTPFUNCTION,G_nDelayTime);

end;
  
procedure TdmSocket.RcvFTPCheck(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[FTPFUNCTION] := True;
  if Pos('Undefined Command',aRealData) > 0 then FTPUSE := False
  else FTPUSE := TRUE;

end;
 
procedure TdmSocket.setFTPUSE(const Value: Boolean);
begin
  FFTPUSE := Value;
end;

{ TDeviceState }

constructor TCurrentDeviceState.Create(AOwner: TComponent);
begin
  Connected := False;
  AlarmMode := cmNothing;
  DeviceCode := '';
  DeviceVersion := '';
  DeviceType := NONETYPE;
  CardType := NOTHINGTYPE;
  CARDREADERTELUse := False;
  ArmAreaSkill := False;
  ArmAreaUse := False;
  ZoneExtensionSkill := False;
  PortZoneUseSkill := False; //�� ������� ���
  PortZoneUseRemoteControlSkill := False; //��������� �������� ���

  DoorUseInitialize;
  //DoorPossibilityInitialize;    // KTT811 Ÿ������ ���� �ߴµ� ���⼭ �ٽ� Clear �ϴ� ����
  DoorStateInitialize;
  DoorLockStateInitialize;
  DoorFireInitialize;
  DoorPNModeInitialize;
  DoorManageModeInitialize;
  ReaderUseInitialize;
  ReaderDoorNoInitialize;
  ReaderVersionInitialize;
  ReaderConnectionStateInitialize;
  ZoneExtensionUseInitialize;
  DoorDSCheckUseInitialize;


  ArmExtension := False;

  RELAY2TYPE := 0;  //812 �⺻�� ���Թ� 2 ��� ����
end;

destructor TCurrentDeviceState.Destroy;
begin

  inherited;
end;

procedure TCurrentDeviceState.DoorFireInitialize;
var
  i : integer;
begin
  for i := LOW(DoorFire) to HIGH(DoorFire) do
  begin
    DoorFire[i] := '0';
  end;

end;

procedure TCurrentDeviceState.DoorLockStateInitialize;
var
  i : integer;
begin
  for i := LOW(DoorLockState) to HIGH(DoorLockState) do
  begin
    DoorLockState[i] := lsNothing;
  end;

end;

procedure TCurrentDeviceState.DoorManageModeInitialize;
var
  i : integer;
begin
  for i := LOW(DoorManageMode) to HIGH(DoorManageMode) do
  begin
    DoorManageMode[i] := dmNothing;
  end;

end;

procedure TCurrentDeviceState.DoorPNModeInitialize;
var
  i : integer;
begin
  for i := LOW(DoorPNMode) to HIGH(DoorPNMode) do
  begin
    DoorPNMode[i] := pnNothing;
  end;

end;

procedure TCurrentDeviceState.DoorStateInitialize;
var
  i : integer;
begin
  for i := LOW(DoorState) to HIGH(DoorState) do
  begin
    DoorState[i] := dsNothing;
  end;

end;

procedure TCurrentDeviceState.DoorUseInitialize;
var
  i : integer;
begin
  for i := LOW(DoorUse) to HIGH(DoorUse) do
  begin
    DoorUse[i] := '0';
  end;
end;

function TCurrentDeviceState.GetDoorManagerMode(
  aDoorNo: integer): TDoorManageMode;
begin
  result := dmNothing;
  if aDoorNo > MAXDOORNO then Exit;
  result := DoorManageMode[aDoorNo];

end;

function TCurrentDeviceState.GetDoorPNMode(aDoorNo: integer): TDoorPNMode;
begin
  result := pnNothing;
  if aDoorNo > MAXDOORNO then Exit;
  result := DoorPNMode[aDoorNo];
end;

function TCurrentDeviceState.GetDoorState(aDoorNo: integer): TDoorDSState;
begin
  result := dsNothing;
  if aDoorNo > MAXDOORNO then Exit;
  result := DoorState[aDoorNo];
end;

function TCurrentDeviceState.GetDoorUsed(aDoorNo: integer): Boolean;
begin
  result := False;
  if aDoorNo > MAXDOORNO then Exit;
  if DoorUse[aDoorNo] = '1' then result := True;
end;

function TCurrentDeviceState.GetReaderConnectState(
  aReaderNo: integer): Boolean;
begin
  result := False;
  if aReaderNo > MAXREADERNO then Exit;
  if ReaderConnectionState[aReaderNo] = '1' then result := True;
end;

function TCurrentDeviceState.GetReaderDoor(aReaderNo: integer): integer;
begin
  result := -1;
  if aReaderNo > MAXREADERNO then Exit;
  if isdigit(ReaderDoorNo[aReaderNo]) then result := strtoint(ReaderDoorNo[aReaderNo]);
end;

function TCurrentDeviceState.GetReaderUse(aReaderNo: integer): Boolean;
begin
  result := False;
  if aReaderNo > MAXREADERNO then Exit;
  if ReaderUse[aReaderNo] = '1' then result := True;
end;

procedure TCurrentDeviceState.ReaderDoorNoInitialize;
var
  i : integer;
begin
  for i := LOW(ReaderDoorNo) to HIGH(ReaderDoorNo) do
  begin
    ReaderDoorNo[i] := '0';
  end;
end;

procedure TCurrentDeviceState.ReaderConnectionStateInitialize;
var
  i : integer;
begin
  for i := LOW(ReaderConnectionState) to HIGH(ReaderConnectionState) do
  begin
    ReaderConnectionState[i] := '0';
  end;

end;

procedure TCurrentDeviceState.ReaderUseInitialize;
var
  i : integer;
begin
  for i := LOW(ReaderUse) to HIGH(ReaderUse) do
  begin
    ReaderUse[i] := '0';
  end;

end;

procedure TCurrentDeviceState.ReaderVersionInitialize;
var
  i : integer;
begin
  for i := LOW(ReaderVersion) to HIGH(ReaderVersion) do
  begin
    ReaderVersion[i] := '';
  end;

end;

procedure TCurrentDeviceState.SetAlarmMode(const Value: TWatchMode);
begin
  if FAlarmMode = Value then Exit;
  FAlarmMode := Value;
  if Assigned(FOnAlarmModeChange) then
  begin
    OnAlarmModeChange(Self,EcuID,'',True);
  end;

end;

procedure TCurrentDeviceState.SetConnected(const Value: Boolean);
begin
  if FConnected = Value then exit;
  FConnected := Value;
  if Assigned(FOnConnected) then
  begin
    OnConnected(Self,EcuID,'',Value);
  end;
end;

procedure TCurrentDeviceState.SetDeviceCode(const Value: string);
begin
  if FDeviceCode = Value then Exit;
  FDeviceCode := Value;
  if (Value = 'ACC-503') OR (Value = 'ICU-100') then DeviceType := ICU100
  else if (Value = 'ACC-505') OR (Value = 'ICU-200') then DeviceType := ICU200
  else if (Value = 'ICU-300') then DeviceType := ICU300
  else if (Value = 'ACC-510') OR (Value = 'MCU-200') OR (Value = 'ECU-200') then
  begin
    DeviceType := KTT812;
  end else if (Value = 'ACC-104') OR (Value = 'MCU-100') OR (Value = 'ECU-100') then
  begin
    DeviceType := KTT811;
  end else if  (Value = 'MCU-110') OR (Value = 'ECU-110') then
  begin
    DeviceType := KTT813;
  end else if (Value = 'ACC-100')  then
  begin
    DeviceType := KTT811;
    CardType := AUTOKT811;
  end else if (Value = 'MCU-110N') then
  begin
    DeviceType := KTT813;
    CardType := AUTOKT811;
  end else if (Value = 'ACC-302') then
  begin
    DeviceType := ACC100;
  end else if (Value = 'SGS-100') then
  begin
    DeviceType := SGS100;
  end else
  begin
    DeviceCode := 'ACC-100';
    Exit;
    //DeviceType := KTT811;
    //CardType := AUTOKT811;
  end;
  if Assigned(FOnDeviceCodeChange) then
  begin
    OnDeviceCodeChange(Self,EcuID,Value,True);
  end;

end;

procedure TCurrentDeviceState.SetDeviceType(const Value: string);
begin
  if FDeviceType = Value then Exit;
  FDeviceType := Value;
  ArmExtension := False;
  MaxECUCount := 63;
  DoorDSCheckTimeUse := False;
  DoorArmDSCheckUse := False;
  DoorLockExtensionUse := False;
  PortZoneUseSkill := False;
  PortZoneUseRemoteControlSkill := False;
  if Assigned(FOnDeviceTypeChange) then
  begin
    OnDeviceTypeChange(Self,EcuID,Value,True);
  end;
  JavaraScheduleSkill := False;
  if Value = KTT811 then
  begin
    MaxDoorNo := 2;
    if CardType = AUTOKT811 then MaxDoorNo := 1;
    MaxReaderNo := 8;
    if CardType = AUTOKT811 then MaxReaderNo := 1;
    MaxPortNo := 8;
    CDMAUse := False;
    ScheduleUse := True;
    JavaraScheduleSkill := True;
    MaxCardCount := 10000;
  end else if Value = KTT812 then
  begin
    //if RELAY2TYPE <> 0 then MaxDoorNo := 2
    //else
    MaxDoorNo := 8;
    MaxReaderNo := 8;
    MaxPortNo := 8;
    CDMAUse := True;
    DoorDSCheckTimeUse := True;
    DoorArmDSCheckUse := True;
    DoorLockExtensionUse := True; //Lock Ȯ��� ���

    ArmAreaSkill := True;
    ZoneExtensionSkill := True;
    //PortZoneUseSkill := True;
    PortZoneUseRemoteControlSkill := True;

    if ECUID = '00' then
    begin
      ArmExtension := True;
      MaxECUCount := 15;
    end;
    ScheduleUse := True;
    MaxCardCount := 1000;
  end else if Value = KTT813 then
  begin
    //if RELAY2TYPE <> 0 then MaxDoorNo := 2
    //else
    MaxDoorNo := 8;
    MaxReaderNo := 8;
    MaxPortNo := 8;
    CDMAUse := True;
    DoorDSCheckTimeUse := True;
    DoorArmDSCheckUse := True;
    DoorLockExtensionUse := True; //Lock Ȯ��� ���

    ArmAreaSkill := False;
    ZoneExtensionSkill := True;
    //PortZoneUseSkill := True;
    PortZoneUseRemoteControlSkill := True;

    if ECUID = '00' then
    begin
      ArmExtension := False;
      MaxECUCount := 63;
    end;
    ScheduleUse := True;
    MaxCardCount := 10000;
  end else if Value = SGS100 then
  begin
    MaxDoorNo := 4;
    MaxReaderNo := 8;
    MaxPortNo := 8;
    CDMAUse := False;
    DoorDSCheckTimeUse := True;
    DoorArmDSCheckUse := True;
    DoorLockExtensionUse := True; //Lock Ȯ��� ���
    ArmAreaSkill := True;
    ZoneExtensionSkill := True;
    //PortZoneUseSkill := True;
    PortZoneUseRemoteControlSkill := True;

    if ECUID = '00' then
    begin
      ArmExtension := False;
      MaxECUCount := 63;
    end;
    ScheduleUse := True;
    MaxCardCount := 60000;
  end else if Value = ICU100 then
  begin
    MaxDoorNo := 1;
    MaxReaderNo := 0;
    MaxPortNo := 6;
    CDMAUse := False;
    ScheduleUse := False;
    MaxCardCount := 1000;
  end else if Value = ICU200 then
  begin
    MaxDoorNo := 0;
    MaxReaderNo := 0;
    MaxPortNo := 6;
    CDMAUse := False;
    ScheduleUse := False;
    MaxCardCount := 1000;
  end else if Value = ICU300 then
  begin
    MaxDoorNo := 1;
    MaxReaderNo := 0;
    MaxPortNo := 6;
    CDMAUse := False;
    ScheduleUse := True;
    MaxCardCount := 1000;
    PortZoneUseRemoteControlSkill := True;
  end else if Value = ACC100 then
  begin
    MaxDoorNo := 2;
    MaxReaderNo := 8;
    MaxPortNo := 0;
    CDMAUse := False;
    ScheduleUse := True;
    MaxCardCount := 10000;
  end else
  begin
    MaxDoorNo := 0;
    MaxReaderNo := 0;
    MaxPortNo := 0;
    CDMAUse := False;
    ScheduleUse := True;
    MaxCardCount := 1000;
  end;
  if MaxDoorNo < 1 then  SetDoorType(1,'0');
  if MaxDoorNo < 2 then  SetDoorType(2,'0');
end;

procedure TCurrentDeviceState.SetDeviceVersion(const Value: string);
var
  TempVer : TStringList;
  nIndex : integer;
  stDeviceVersion : string;
begin
  if FDeviceVersion = Value then Exit;
  FDeviceVersion := Value;

  Try
    TempVer := TStringList.Create;
    TempVer.Delimiter := ',';
    stDeviceVersion := StringReplace(Value,' ','_',[rfReplaceAll]);
    TempVer.DelimitedText := stDeviceVersion;
    if TempVer.Count > 2 then
    begin
      stDeviceVersion := StringReplace(TempVer.Strings[0],'_',' ',[rfReplaceAll]);
      //ed_DeviceRegInfo.Text := StringReplace(TempVer.Strings[0],'_',' ',[rfReplaceAll]);
      //ed_DeviceDate.Text := StringReplace(TempVer.Strings[2],'_',' ',[rfReplaceAll]);
    end;
  Finally
    TempVer.Free;
  End;
  if Pos('KTT',stDeviceVersion) > 0  then CardType := COMMON811 //����
  else if Pos('KT',stDeviceVersion) > 0  then CardType := KT811 //KT�����
  else if Pos('KHU',stDeviceVersion) > 0 then CardType := UNIVER811 //������
  else if Pos('UNIV',stDeviceVersion) > 0 then CardType := UNIVER811 //������(������б���)
  else if Pos('MJU',stDeviceVersion) > 0 then CardType := UNIVER811 //������(������б���)
  else if Pos('CNU',stDeviceVersion) > 0 then CardType := UNIVER811 //�泲���
  else if Pos('AJU',stDeviceVersion) > 0 then CardType := UNIVER811 //���ִ��
  else if Pos('C16',UpperCase(stDeviceVersion)) > 0 then CardType := MERGECARD //���� 16�ڸ�
  else
  begin
    if DeviceCode = 'ACC-100' then CardType := AUTOKT811
    else CardType := COMMON811;
  end;

  if Pos('Pol',Value) > 0 then POLICEDevice := True
  else POLICEDevice := False;
end;


procedure TCurrentDeviceState.SetReaderInfo(aReaderNo, aUsedCR,
  aCRPosition, aDoorNo,aReaderArmArea, aLocate, aBuildingPosi: string);
var
  nReaderNo : integer;
  bUpdate : Boolean;
begin
  bUpdate := False;
  if Not IsDigit(aReaderNo) then Exit;
  nReaderNo := strtoint(aReaderNo);
  if ReaderUse[nReaderNo] <> aUsedCR then
  begin
    bUpdate := True;
    ReaderUse[nReaderNo] := aUsedCR;
    if aUsedCR = '1' then
    begin
      if Assigned(FOnReaderUseChange) then
      begin
        OnReaderUseChange(Self,ECUID,aReaderNo,True);
      end;
    end;
  end;

  if ReaderDoorNo[nReaderNo] <> aDoorNo then
  begin
    bUpdate := True;
    ReaderDoorNo[nReaderNo] := aDoorNo;
  end;
  
  if Assigned(FOnDeviceChange) then
  begin
    OnDeviceChange(Self,ECUID,'',bUpdate);
  end;

end;

procedure TCurrentDeviceState.SetDoorType(aDoorNo: integer;
  aDoorType: string);
var
  bUpdate : Boolean;
  stDoorType : string;
begin
  bUpdate := False;
  if aDoorNo > MAXDOORNO then Exit;
  stDoorType := '0';
  if aDoorType <> '0' then stDoorType := '1';
  if DoorUse[aDoorNo] <> stDoorType then
  begin
    bUpdate := True;
    DoorUse[aDoorNo] := stDoorType;
    if Assigned(FOnDoorTypeChange) then
    begin
      if stDoorType = '1' then OnDoorTypeChange(Self,ECUID,inttostr(aDoorNo),True)
      else OnDoorTypeChange(Self,ECUID,inttostr(aDoorNo),False);
    end;
  end;
  if DoorUseType[aDoorNo] <> aDoorType then
  begin
    DoorUseType[aDoorNo] := aDoorType;
  end;


end;

procedure TCurrentDeviceState.SetDoorState(aDoorNo, aCardMode, aDoorMode,
  aDoorState, aDoorSchedule: string);
var
  nDoorNo : integer;
  bUpdate : Boolean;
  oCardMode : TDoorPNMode;
  oDoorMode : TDoorManageMode;
  oDoorState : TDoorDSState;
begin
  bUpdate := False;
  if Not isDigit(aDoorNo) then Exit;

  nDoorNo := strtoint(aDoorNo);

  case aCardMode[1] of
    '0': begin oCardMode := pnPositive end;
    '1': begin oCardMode := pnNegative end;
    '2': begin oCardMode := pnPositive end;
    '3': begin oCardMode := pnNegative end;
    else begin oCardMode := pnNothing  end;
  end;
  case aDoorMode[1] of
    '0' : begin oDoorMode := dmManager end;
    '1' : begin oDoorMode := dmOpen end;
    '2' : begin oDoorMode := dmLock end;
    else  begin oDoorMode := dmNothing end;
  end;
  case aDoorState[1] of
    'C' : begin oDoorState := dsClose end;
    'O' : begin oDoorState := dsOpen end;
    'T' : begin oDoorState := dsLongTime end;
    'U' : begin oDoorState := dsOpenErr end;
    'L' : begin oDoorState := dsCloseErr end;
    else  begin oDoorState := dsNothing end;
  end;

  if DoorPNMode[nDoorNo] <> oCardMode then
  begin
    bUpdate := True;
    DoorPNMode[nDoorNo] := oCardMode;
  end;
  if DoorManageMode[nDoorNo] <> oDoorMode then
  begin
    bUpdate := True;
    DoorManageMode[nDoorNo] := oDoorMode;
  end;
  if DoorState[nDoorNo] <> oDoorState then
  begin
    bUpdate := True;
    DoorState[nDoorNo] := oDoorState;
  end;

  if bUpdate then
  begin
    if Assigned(FOnDoorStateChange) then
    begin
      OnDoorStateChange(Self,ECUID,aDoorNo,bUpdate);
    end;
  end;

end;

procedure TCurrentDeviceState.SetReaderVersion(aCardReaderNo,
  aCardReaderVersion: string);
var
  nReaderNo : integer;
begin
  if Not isDigit(aCardReaderNo) then Exit;
  nReaderNo := strtoint(aCardReaderNo);
  ReaderVersion[nReaderNo] := aCardReaderVersion;
  setReaderConnected(nReaderNo,True);
  if Pos('SCR-203',UpperCase(aCardReaderVersion)) > 0 then
  begin
    //���α��� ī�帮����
    CARDREADERTELUse := True;
  end;
{  if ReaderConnectionState[nReaderNo] <> '1' then
  begin
    setReaderConnected(nReaderNo,True);
    if Assigned(FOnReaderConnectChange) then
    begin
      OnReaderConnectChange(Self,ECUID,aCardReaderNo,True);
    end;
  end; }

end;

procedure TCurrentDeviceState.setReaderConnected(nReaderNo: integer;
  aConnected: Boolean);
var
  stReaderConnected : string;
begin
  if aConnected then stReaderConnected := '1'
  else stReaderConnected := '0';

  if ReaderConnectionState[nReaderNo] <> stReaderConnected then
  begin
    ReaderConnectionState[nReaderNo] := stReaderConnected;
    if Assigned(FOnReaderConnectChange) then
    begin
      OnReaderConnectChange(Self,ECUID,inttostr(nReaderNo),aConnected);
    end;
  end;

end;

procedure TCurrentDeviceState.setDeviceConnected(aConnected: Boolean);
begin
  if Connected = aConnected then Exit;
  Connected := aConnected;
end;


procedure TCurrentDeviceState.SetCDMAUse(const Value: Boolean);
begin
  if FCDMAUse = Value then Exit;
  FCDMAUse := Value;
  if Assigned(FOnCDMAUseChange) then
  begin
    OnCDMAUseChange(Self,ECUID,'',Value);
  end;
end;

procedure TCurrentDeviceState.SetDVRUse(const Value: Boolean);
begin
  if FDVRUse = Value then Exit;
  FDVRUse := Value;
  if Assigned(FOnDvrUseChange) then
  begin
    OnDvrUseChange(Self,ECUID,'',Value);
  end;
end;


procedure TCurrentDeviceState.SetCardType(const Value: string);
begin
  if FCardType = Value then Exit;
  FCardType := Value;
  if Assigned(FOnCardTypeChange) then
  begin
    OnCardTypeChange(Self,ECUID,Value,True);
  end;


  if Value = KT811 then
  begin
    DVRUse := True;
    JavaraScheduleSkill := True;
  end else
  begin
    DVRUse := False;
    JavaraScheduleSkill := False;
  end;
  if Value = AUTOKT811 then //���α����
  begin
    MaxReaderNo := 1;
    MaxDoorNo := 1;
    CARDREADERTELUse := True;
  end;
end;



procedure TCurrentDeviceState.SetCARDREADERTELUse(const Value: Boolean);
begin
  if FCARDREADERTELUse = Value then Exit;
  FCARDREADERTELUse := Value;
  if Assigned(FOnCARDREADERTELUseChange) then
  begin
    OnCARDREADERTELUseChange(Self,ECUID,'',Value);
  end;
end;


function TCurrentDeviceState.GetReaderVersion(aReaderNo: integer): string;
begin
  if aReaderNo > MAXREADERNO then Exit;
  result := ReaderVersion[aReaderNo];

end;

{ TECUState }

constructor TSocketECUState.Create(AOwner: TComponent);
begin
  inherited;
  Connected := False;
end;

destructor TSocketECUState.Destroy;
begin

  inherited;
end;


function TdmSocket.SendKTT812FirmWarePacket(aHexCmd,
  aHexData: string): Boolean;
var
  stHexData : string;
  stASCIIHEADER : string;
  stCheckSum : string;
  nLen : integer;
  i : integer;
  nPacketLength : integer;
  chSendChar : char;
  FirstTickCount : Longint;
begin
  nLen := 0;
  if Length(aHexData) > 0 then
     nLen := Length(aHexData) div 2;
  stHexData := '01'; //�������
  stHexData := stHexData + '00'; //����ȣ
  stHexData := stHexData + 'AA'; //MSG��ȣ
  stHexData := stHexData + aHexCmd; //Command
  stHexData := stHexData + dec2Hex(nLen + 2,2);//FillZeroNumber(nLen + 2,2);
  stHexData := stHexData + '00'; //SenseState
  stHexData := stHexData + '00'; //Comm Flag
  stHexData := stHexData + aHexData;
  stCheckSum := ASCII2Hex(MakeHexSum(stHexData));
  stHexData := stHexData + stCheckSum;

  nPacketLength := Length(stHexData) div 2;
  if SocketType = 0 then
  begin
    if Commport.Open then
    begin
      repeat
        Application.ProcessMessages;
      until Commport.OutBuffUsed = 0;
      //until Commport.OutBuffFree > 512;
      for i := 0 to nPacketLength - 1 do
      begin
        chSendChar := char(Hex2Dec(copy(stHexData,(i * 2) + 1,2)));
          Commport.PutChar(chSendChar);
      end;
    end;
  end else if SocketType = 1 then
  begin
    ClientSocket.Socket.SendText(Hex2Ascii(stHexData));
  end else if SocketType = 2 then
  begin
  end else if SocketType = 3 then
  begin
    if dmWinsocket.PutString(Hex2Ascii(stHexData)) then SocketOutSenting := False;
  end;
end;

function TdmSocket.CheckKTT812FirmwareDataPacket(aData: String; var bData,
  aPacketData: string): integer;
var
  Lenstr: String;
  stCheckSum : string;
  DefinedDataLength : integer;
  StrBuff : string;
  stGetCheckSum : string;
begin

  result := -1; //������ ����

  aPacketData:= '';
  if Length(aData) < 6 then
  begin
    result := -2; //�ڸ����� �۰� ���� ���
    bData:= aData;           //���ڸ� ���� ��  ����
    Exit;
  end;
  if copy(aData,1,6) <> KTT812FirmwareHeader then
  begin
    //delete(aData,1,2);
    bData:= aData;           //���ڸ� ���� ��  ����
    Exit;
  end;
  Lenstr := copy(aData,9,2);
  //��Ŷ�� ���ǵ� ����
  DefinedDataLength:= Hex2Dec(Lenstr);
  //��Ŷ�� ���ǵ� ���̺��� ���� �����Ͱ� ������
  if Length(aData) < (10 + (DefinedDataLength * 2) + 2) then
  begin
    result := -2; //�ڸ����� �۰� ���� ���
    //���� �����Ͱ� ���̰� ������(���� �� ������ ����)
    bData:= aData;
    Exit;
  end;
  stCheckSum := copy(aData,11 + (DefinedDataLength * 2),2);
  stGetCheckSum := MakeHexSum(copy(aData,1,11 + (DefinedDataLength * 2)));
  stGetCheckSum := ASCII2Hex(stGetCheckSum);
  if stCheckSum <> stGetCheckSum then
  begin
    //delete(aData,1,2);
    bData:= aData;           //���ڸ� ���� ��  ����
    Exit;
  end;

  StrBuff:= Copy(aData,1,10 + (DefinedDataLength * 2) + 2);
  Delete(aData, 1, 10 + (DefinedDataLength * 2) + 2);
  bData:= aData;
  aPacketData:=StrBuff;
  result := 3; //KTT812 ������ �´�.
end;

function TdmSocket.KTT812DataPacektProcess(aPacketData: string): Boolean;
var
  stCmd : string;
  stLen : string;
  stData : string;
  stAsciiData : string;
  stSubCmd : string;
begin
  Result:= False;
  if aPacketData = '' then Exit;

  stCmd := copy(aPacketData,7,2);
  stLen := copy(aPacketData,9,2);
  stData := copy(aPacketData,11,(Hex2Dec(stLen) * 2) );
  if stCmd = '06' then
  begin
    KTT812FirmwareStarting := True; //���� �߿��� ������Ʈ ���Դϴ�.
    // ACK �����ʹ� ��������.
  end else if stCmd = '21' then
  begin
    Delete(stData,1,4); //Sense State,Commo Flag ����
    //���⿡�� ������ �м��Ͽ� ó�� ����.
    stAsciiData := Hex2Ascii(stData);
    Delete(stAsciiData,1,1); //'F' ����
    stSubCmd := copy(stAsciiData,1,4);
    if stSubCmd = 'fd01' then
    begin
      Delete(stAsciiData,1,4);
      if Assigned(FOnKTT812FlashDataEvent) then
      begin
        OnKTT812FlashDataEvent(Self,'00',stAsciiData);
      end;
    end else if stSubCmd = 'fx01' then
    begin
      KTT812FirmwareDownLoadType :=False; //������ �߿��� ������Ʈ ����
      if Assigned(FOnKTT812FlashDataEndEvent) then
      begin
        OnKTT812FlashDataEndEvent(Self,'00','');
      end;
    end;
  end;
  Result:= True;
end;


procedure TdmSocket.CommportTriggerOutSent(Sender: TObject);
begin
  L_bSending := False;
  SocketOutSenting := False; //���� �Ϸ�
end;

procedure TdmSocket.RcvKTT812FirmWareDownload(aEcuID, aGubun,
  aRealData: string);
var
  stGubun : string;
  stData : string;
  i : integer;
begin
  stGubun := copy(aRealData,5,3);
  if stGubun = 'f85' then
  begin
    KTT812BroadFirmWareStarting := True;
  end else if stGubun = 'f88' then
  begin
    if Assigned(FOnKTT812EcuFirmWareDownloadComplete) then
    begin
      OnKTT812EcuFirmWareDownloadComplete(Self,aEcuID,'');
    end;
  end else if stGubun = 'f94' then
  begin
    if Pos('A',UpperCase(aRealData)) > 0 then
    begin
      if Assigned(FOnKTT812EcuFirmWareDownloadFailed) then
      begin
        OnKTT812EcuFirmWareDownloadFailed(Self,aEcuID,'�����');
      end;
    end;
  end else if stGubun = 'f95' then
  begin
    if Length(aRealData) < 24 then Exit;
    stData := Trim(copy(aRealData,9,16));
    for i := 1 to Length(stData) do
    begin
      if UpperCase(stData[i]) = 'U' then
      begin
        if Assigned(FOnKTT812EcuFirmWareDownloadFailed) then
        begin
          OnKTT812EcuFirmWareDownloadFailed(Self,FillZeroNumber(i-1,2),'�̻��');
        end;
      end else if UpperCase(stData[i]) = 'F' then
      begin
        if Assigned(FOnKTT812EcuFirmWareDownloadFailed) then
        begin
          OnKTT812EcuFirmWareDownloadFailed(Self,FillZeroNumber(i-1,2),'��ſ���');
        end;
      end;
    end;
  end;

end;

function TdmSocket.SendBufferClear: Boolean;
begin
  FirstSendDataList.Clear;
  QuickSendDataList.Clear;
  ReserveSendDataList.Clear;
  SearchSendDataList.Clear;
  CardSendDataList.Clear;
end;

function TdmSocket.AllDeviceArmMode(aMode:string): Boolean;
var
  stData : string;
  i : integer;
begin
  Result := false;
  i:=0;
  //stData := 'SM2699RMC00'+ aMode;
  //for i := 0 to FIXARMAREANO do   //ICU 300 ���� ��������� ���� �Ҷ� ������ �߻� �Ѵ�.
  begin
    stData := 'SM2699RMC' +         //COMMAND
              FillZeroNumber(i,2) + //�������
              aMode;                //A:���, D:����, P:��ȸ

    SendPacket('00', 'R', stData,G_stDeviceVer, True);
  end;

  //SendPacket('00', 'R', stData,G_stDeviceVer, True);

  result := True;   
end;

function TdmSocket.AllDeviceFireRecovery: Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'SM2599';

  SendPacket('00', 'R', stData,G_stDeviceVer, True);

  result := True;   

end;

procedure TdmSocket.RcvFTPDownLoadState(aECUID, aVer, aRealData: string);
var
  stGubun : string;
begin
  if length(aRealData) < 8 then exit; 
  stGubun := copy(aRealData,5,3);
  if stGubun = 'f88' then
  begin
    if Assigned(FOnKTT811FTPFirmWareDownloadComplete) then
    begin
      OnKTT811FTPFirmWareDownloadComplete(Self,aEcuID,'');
    end;
  end;
end;

function TdmSocket.GetSearchBufferCount: integer;
begin
  result := SearchSendDataList.Count;
end;

function TdmSocket.SearchRelay2TypeCheck(aEcuID: string; aDelay: Boolean;
  aPriority: integer): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'DL03';

  G_bDeviceResponse[RELAY2TYPE] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
    result := ResponseCheck(RELAY2TYPE,G_nDelayTime);

end;

procedure TdmSocket.RcvRelay2Type(aECUID, aVer, aRealData: string);
var
  stDoorNo : string;
begin
  G_bDeviceResponse[RELAY2TYPE] := True;
  //stGubun:= Copy(aRealData,3,2);
  Delete(aRealData,1,4);
  if Assigned(FOnRelay2TypeCheck) then
  begin
    OnRelay2TypeCheck(Self,aECUID,'',aRealData);
  end;

end;

procedure TCurrentDeviceState.SetRELAY2TYPE(const Value: integer);
var
  bDoorPossibility : Boolean;
begin
//  if FRELAY2TYPE = Value then Exit;  //�̺�Ʈ �߻� ����
  FRELAY2TYPE := Value;
  if Value = 0 then bDoorPossibility := False
  else bDoorPossibility := True;
  if DeviceType = KTT812 then
  begin
    SetDoorPossibility(2,bDoorPossibility);
  end;
end;

function TdmSocket.RegistRelay2Type(aEcuID, aRegistData: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'DL03' + aRegistData ;                                             // ���� ��� ���(����)

  G_bDeviceResponse[RELAY2TYPE] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(RELAY2TYPE,G_nDelayTime);

end;

function TdmSocket.CardReaderCallTimeSearch(aEcuID,
  aCallTime: string;aDelay:Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'CT01' ;
  G_bDeviceResponse[CARDREADERCALLTIME] := False;
  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay);

  result := ResponseCheck(CARDREADERCALLTIME,G_nDelayTime);
end;

procedure TdmSocket.RcvCallTime(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[CARDREADERCALLTIME] := True;
  Delete(aRealData, 1, 4);
  if Assigned(FOnCARDREADERCallTime) then
  begin
    OnCARDREADERCallTime(Self,aECUID,aRealData,'');
  end;

end;

function TdmSocket.CardReaderCallTime_Registration(aEcuID,
  aCallTime: string;aDelay:Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;
  if Not isDigit(aCallTime) then Exit;

  stData := 'CT01' + FillZeroNumber(strtoint(aCallTime),4);
  G_bDeviceResponse[CARDREADERCALLTIME] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, aDelay);

  result := ResponseCheck(CARDREADERCALLTIME,G_nDelayTime);

end;

procedure TCurrentDeviceState.SetArmExtension(const Value: Boolean);
var
  stValue : string;
begin
  if ECUID <> '00' then Exit;
  if FArmExtension = Value then Exit;
  if Value then stValue := 'TRUE'
  else stValue := 'FALSE';
  FArmExtension := Value;
  if Assigned(FOnArmExtensionChange) then
  begin
    OnArmExtensionChange(Self,ECUID,stValue,True);
  end;
end;

procedure TCurrentDeviceState.SetMaxECUCount(const Value: integer);
begin
  if ECUID <> '00' then Exit;
  if FMaxECUCount = Value then Exit;
  FMaxECUCount := Value;
  if Assigned(FOnMaxECUCountChange) then
  begin
    OnMaxECUCountChange(Self,ECUID,inttostr(Value),True);
  end;
end;

function TdmSocket.RegistMainToLocalArm(aEcuID,
  aSendData: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'EX04' + aSendData;

  G_bDeviceResponse[MAINTOLOCALARM] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(MAINTOLOCALARM,G_nDelayTime);

end;

procedure TdmSocket.RcvMainToLocalArm(aECUID, aVer, aRealData: string);
var
  stMainToLocalArm : string;
  i : integer;
  stEcuID : string;
begin
  G_bDeviceResponse[MAINTOLOCALARM] := True;
  stMainToLocalArm := copy(aRealData,5,100);
  MainToLocalArmDevice := Trim(stMainToLocalArm);
  if Assigned(FOnMainToLocalArm) then
  begin
    OnMainToLocalArm(Self,aECUID,stMainToLocalArm);
  end;

end;

function TdmSocket.RegistMainFromLocalArm(aEcuID,
  aSendData: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'EX03' + aSendData;

  G_bDeviceResponse[MAINFROMLOCALARM] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(MAINFROMLOCALARM,G_nDelayTime);

end;

procedure TdmSocket.RcvMainFromLocalArm(aECUID, aVer, aRealData: string);
var
  stMainFromLocalArm : string;
  i : integer;
  stEcuID : string;
begin
  G_bDeviceResponse[MAINFROMLOCALARM] := True;
  stMainFromLocalArm := copy(aRealData,5,100);
  MainFromLocalArmDevice := Trim(stMainFromLocalArm);
  if Assigned(FOnMainFromLocalArm) then
  begin
    OnMainFromLocalArm(Self,aECUID,stMainFromLocalArm);
  end;

end;

function TdmSocket.MainFromLocalArmSearch(aEcuID: string;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'EX03';

  G_bDeviceResponse[MAINFROMLOCALARM] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
  result := ResponseCheck(MAINFROMLOCALARM,G_nDelayTime);

end;

function TdmSocket.MainToLocalArmSearch(aEcuID: string;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'EX04';

  G_bDeviceResponse[MAINTOLOCALARM] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
  result := ResponseCheck(MAINTOLOCALARM,G_nDelayTime);

end;

procedure TCurrentDeviceState.SetDoorArmDSCheckUse(
  const Value: Boolean);
begin
  if FDoorArmDSCheckUse = Value then Exit;
  FDoorArmDSCheckUse := Value;
  if Assigned(FOnDoorArmDSCheckUseChange) then
  begin
    OnDoorArmDSCheckUseChange(Self,ECUID,'',Value);
  end; 
end;

procedure TCurrentDeviceState.SetDoorDSCheckTimeUse(const Value: Boolean);
begin
  if FDoorDSCheckTimeUse = Value then Exit;
  FDoorDSCheckTimeUse := Value;
  if Assigned(FOnDoorDSCheckTimeUseChange) then
  begin
    OnDoorDSCheckTimeUseChange(Self,ECUID,'',Value);
  end;
end;

procedure TCurrentDeviceState.SetDoorLockExtensionUse(
  const Value: Boolean);
begin
  if FDoorLockExtensionUse = Value then Exit;
  FDoorLockExtensionUse := Value;
  if Assigned(FOnDoorLockExtensionUseChange) then
  begin
    OnDoorLockExtensionUseChange(Self,ECUID,'',Value);
  end;
end;

procedure TCurrentDeviceState.SetArmAreaUse(const Value: Boolean);
begin
  if FArmAreaUse = Value then Exit;
  FArmAreaUse := Value;
  if Assigned(FOnArmAreaUseChange) then
  begin
    OnArmAreaUseChange(Self,ECUID,'',Value);
  end;
end;

procedure TCurrentDeviceState.SetArmAreaSkill(const Value: Boolean);
begin
  if FArmAreaSkill = Value then Exit;
  FArmAreaSkill := Value;
  if Assigned(FOnArmAreaSkillChange) then
  begin
    OnArmAreaSkillChange(Self,ECUID,'',Value);
  end;
end;

function TdmSocket.RegistArmAreaUse(aEcuID, aArmAreaUse: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'fn02' + aArmAreaUse;

  G_bDeviceResponse[conARMAREAUSE] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(conARMAREAUSE,G_nDelayTime);

end;

procedure TdmSocket.RcvArmAreaUse(aEcuID, aVer, aRealData: string);
var
  nArmRelay : integer;
begin
  G_bDeviceResponse[conARMAREAUSE] := True;
  //stGubun:= Copy(aRealData,3,2);
  Delete(aRealData,1,4);

  if Assigned(FOnArmAreaUseData) then
  begin
    OnArmAreaUseData(Self,aECUID,'',aRealData[1]);
  end;

end;

function TdmSocket.SearchArmAreaUse(aEcuID: string; aDelay: Boolean;
  aPriority: integer): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'fn02';

  G_bDeviceResponse[conARMAREAUSE] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
    result := ResponseCheck(conARMAREAUSE,G_nDelayTime);

end;

function TdmSocket.RegistDoorArmArea(aEcuID, aData: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'DL10** ' + aData;

  G_bDeviceResponse[conDOORARMAREA] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(conDOORARMAREA,G_nDelayTime);

end;

procedure TdmSocket.RcvDoorArmAreaGubun(aEcuID, aVer, aRealData: string);
begin
  G_bDeviceResponse[conDOORARMAREA] := True;
  Delete(aRealData,1,6);

  if Assigned(FOnDoorArmAreaData) then
  begin
    OnDoorArmAreaData(Self,aECUID,'',Trim(aRealData));
  end;

end;

function TdmSocket.SearchDoorArmArea(aEcuID: string; aDelay: Boolean;
  aPriority: integer): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'DL10**';

  G_bDeviceResponse[conDOORARMAREA] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
    result := ResponseCheck(conDOORARMAREA,G_nDelayTime);

end;

function TdmSocket.RegistZoneExtensionPortInfo(aEcuID, aExtNo,
  aSendData: string): Boolean;
var
  stData : string;
begin

  stData := 'EL01' +                             //COMMAND
    FillZeroNumber(strtoint(aExtNo),2) +         //��Ȯ����ȣ
    aSendData;                                   //������

  G_bDeviceResponse[conZoneExtensionPortInfo] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(conZoneExtensionPortInfo,G_nDelayTime);

end;

procedure TdmSocket.RcvZoneExtensionPortInfo(aECUID, aVer,
  aRealData: string);
begin
  G_bDeviceResponse[conZoneExtensionPortInfo] := True;
  //stGubun:= Copy(aRealData,3,2);
  Delete(aRealData,1,4);

  if Assigned(FOnZoneExtensionPortInfoData) then
  begin
    OnZoneExtensionPortInfoData(Self,aECUID,'',aRealData);
  end;

end;

function TdmSocket.ZoneExtensionSearch(aEcuID, aZoneExtNo: string;
  aDelay: Boolean; aPriority: integer): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'EL01' + FillZeroNumber(strtoint(aZoneExtNo),2);

  G_bDeviceResponse[conZoneExtensionPortInfo] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);
  if aDelay then
    result := ResponseCheck(conZoneExtensionPortInfo,G_nDelayTime);
end;

procedure TCurrentDeviceState.SetZoneExtensionSkill(const Value: Boolean);
begin
  if FZoneExtensionSkill = Value then Exit;
  FZoneExtensionSkill := Value;
  if Assigned(FOnZoneExtensionSkillChange) then
  begin
    OnZoneExtensionSkillChange(Self,ECUID,'',Value);
  end;
end;

procedure TCurrentDeviceState.ZoneExtensionUseInitialize;
var
  i : integer;
begin
  for i := LOW(ZoneExtensionUse) to HIGH(ZoneExtensionUse) do
  begin
    ZoneExtensionUse[i] := '0';
  end;

end;

procedure TCurrentDeviceState.SetZoneExtentionUse(aZoneExtNo,
  aZoneExtUse: string);
var
  bDoorUsePossibility : Boolean;
  nDoorNo : integer;
begin
  if Not IsDigit(aZoneExtNo) then Exit;
  if ZoneExtensionUse[strtoint(aZoneExtNo)] <> aZoneExtUse then
  begin
    ZoneExtensionUse[strtoint(aZoneExtNo)] := aZoneExtUse;
  end;
  nDoorNo := strtoint(aZoneExtNo) + 2;
  if aZoneExtUse = '0' then bDoorUsePossibility := False
  else bDoorUsePossibility := True;
  if nDoorNo <= MaxDoorNo then bDoorUsePossibility := True;
  SetDoorPossibility(nDoorNo,bDoorUsePossibility);
end;

function TdmSocket.RegistDoorDSCheckUse(aEcuID, aDoorNo,
  aDSCheckUse: string): Boolean;
var
  stData : string;
begin
  Result := false;
  if Not isDigit(aDoorNo) then Exit;
  stData := 'DL00' +
            FillZeroNumber(strtoint(aDoorNo),2) +
            aDSCheckUse[1];

  G_bDeviceResponse[conDOORDSCHECKUSE] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(conDOORDSCHECKUSE,G_nDelayTime);

end;

procedure TdmSocket.RcvDoorDSCheckUse(aECUID, aVer, aRealData: string);
var
  stDoorNo : string;
begin
  G_bDeviceResponse[conDOORDSCHECKUSE] := True;
  Delete(aRealData,1,4);
  stDoorNo := copy(aRealData,1,2);
  if Not isDigit(stDoorNo) then Exit;
  stDoorNo := inttostr(strtoint(stDoorNo));
  if Assigned(FOnDoorDSCheckUse) then
  begin
    OnDoorDSCheckUse(Self,aECUID,stDoorNo,aRealData[3]);
  end;


end;

procedure TCurrentDeviceState.SetDoorDSCheckUse(aDoorNo,
  aDSCheckUse: string);
begin
  if Not IsDigit(aDoorNo) then Exit;
  if DoorDSCheckUse[strtoint(aDoorNo)] <> aDSCheckUse then
  begin
    DoorDSCheckUse[strtoint(aDoorNo)] := aDSCheckUse;
  end;

end;

procedure TCurrentDeviceState.DoorDSCheckUseInitialize;
var
  i : integer;
begin
  for i := LOW(DoorDSCheckUse) to HIGH(DoorDSCheckUse) do
  begin
    DoorDSCheckUse[i] := '0';
  end;

end;

function TdmSocket.RegistDoorDSCheckTime(aEcuID, aDoorNo,
  aDSCheckTimeSec: string): Boolean;
var
  stData : string;
begin
  Result := false;
  if Not isDigit(aDoorNo) then Exit;
  stData := 'DL02' +
            FillZeroNumber(strtoint(aDoorNo),2) +
            FillZeroNumber(strtoint(aDSCheckTimeSec),2) + '0'; //100ms ������ 1�� �ΰ�� 010

  G_bDeviceResponse[conDOORDSCHECKTIME] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(conDOORDSCHECKTIME,G_nDelayTime);

end;

procedure TdmSocket.RcvDoorDSCheckTIME(aECUID, aVer, aRealData: string);
var
  stDoorNo : string;
  stDoorCheckTime : string;
begin
  G_bDeviceResponse[conDOORDSCHECKTIME] := True;
  Delete(aRealData,1,4);
  stDoorNo := copy(aRealData,1,2);
  if Not isDigit(stDoorNo) then Exit;
  stDoorNo := inttostr(strtoint(stDoorNo));
  stDoorCheckTime := copy(aRealData,3,2); //���� ms ���������� �ʴ��� �����̹Ƿ� ������ ���ڸ��� �������� ����.
  if Assigned(FOnDoorDSCheckTime) then
  begin
    OnDoorDSCheckTime(Self,aECUID,stDoorNo,stDoorCheckTime);
  end;

end;

function TCurrentDeviceState.GetDoorDSCheckUse(aDoorNo: integer): string;
begin
  if aDoorNo > MaxDoorNo then Exit;
  result := DoorDSCheckUse[aDoorNo];
end;

function TdmSocket.DoorDSCheckUseSearch(aEcuID, aDoorNo: string;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;
  if Not isDigit(aDoorNo) then Exit;
  stData := 'DL00' +
            FillZeroNumber(strtoint(aDoorNo),2);

  G_bDeviceResponse[conDOORDSCHECKUSE] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
  result := ResponseCheck(conDOORDSCHECKUSE,G_nDelayTime);

end;

function TdmSocket.DoorDSCheckTimeSearch(aEcuID, aDoorNo: string;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;
  if Not isDigit(aDoorNo) then Exit;
  stData := 'DL02' +
            FillZeroNumber(strtoint(aDoorNo),2) ; //100ms ������ 1�� �ΰ�� 010

  G_bDeviceResponse[conDOORDSCHECKTIME] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
  result := ResponseCheck(conDOORDSCHECKTIME,G_nDelayTime);

end;

function TdmSocket.RegistZoneExtensionUse(aEcuID, aData: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'EL00' + aData;
  G_bDeviceResponse[conZoneExtensionUse] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(conZoneExtensionUse,G_nDelayTime);
end;

procedure TdmSocket.RcvZoneExtensionUse(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[conZoneExtensionUse] := True;
  //stGubun:= Copy(aRealData,3,2);
  Delete(aRealData,1,4);

  if Assigned(FOnZoneExtensionUseData) then
  begin
    OnZoneExtensionUseData(Self,aECUID,'',aRealData);
  end;

end;

function TdmSocket.SearchSystemZoneExtensionUse(aEcuID: string;
  aDelay:Boolean=True;aPriority:integer=2): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'EL00'; //100ms ������ 1�� �ΰ�� 010

  G_bDeviceResponse[conZoneExtensionUse] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
  result := ResponseCheck(conZoneExtensionUse,G_nDelayTime);

end;

function TdmSocket.MemoryClear(aEcuID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'ac00Register Clear';

  G_bDeviceResponse[conRegisterClear] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);
  result := ResponseCheck(conRegisterClear,G_nDelayTime);

end;

procedure TdmSocket.RcvMemoryClearControl(aEcuID, aVer, aRealData: string);
begin
  G_bDeviceResponse[conRegisterClear] := True;
  //stGubun:= Copy(aRealData,3,2);
  Delete(aRealData,1,4);

  if Assigned(FOnMemoryClearControl) then
  begin
    OnMemoryClearControl(Self,aECUID,'',aRealData);
  end;

end;

function TdmSocket.GetAlarmAreaGrade(aAlarm1, aAlarm2, aAlarm3, aAlarm4,
  aAlarm5, aAlarm6, aAlarm7, aAlarm8: string): string;
var
  i : integer;
  stData : string;
  stData1,stData2 : string;
begin
  stData := '';
  for i := 1 to 8 do
  begin
    stData := stData + '0';
  end;
  if aAlarm8 = 'Y' then stData[1] := '1';
  if aAlarm7 = 'Y' then stData[2] := '1';
  if aAlarm6 = 'Y' then stData[3] := '1';
  if aAlarm5 = 'Y' then stData[4] := '1';
  if aAlarm4 = 'Y' then stData[5] := '1';
  if aAlarm3 = 'Y' then stData[6] := '1';
  if aAlarm2 = 'Y' then stData[7] := '1';
  if aAlarm1 = 'Y' then stData[8] := '1';

  stData1 := '0100' + copy(stData,1,4);
  stData2 := '0100' + copy(stData,5,4);

  result := Hex2ASCII(BinaryToHex(stData1) + BinaryToHex(stData2));

end;

function TdmSocket.GetDoorAreaGrade(aDoor1, aDoor2, aDoor3, aDoor4, aDoor5,
  aDoor6, aDoor7, aDoor8: string): string;
var
  i : integer;
  stData : string;
  stData1,stData2 : string;
begin
  stData := '';
  for i := 1 to 8 do
  begin
    stData := stData + '0';
  end;
  if aDoor8 = 'Y' then stData[1] := '1';
  if aDoor7 = 'Y' then stData[2] := '1';
  if aDoor6 = 'Y' then stData[3] := '1';
  if aDoor5 = 'Y' then stData[4] := '1';
  if aDoor4 = 'Y' then stData[5] := '1';
  if aDoor3 = 'Y' then stData[6] := '1';
  if aDoor2 = 'Y' then stData[7] := '1';
  if aDoor1 = 'Y' then stData[8] := '1';

  stData1 := '0100' + copy(stData,1,4);
  stData2 := '0100' + copy(stData,5,4);

  result := Hex2ASCII(BinaryToHex(stData1) + BinaryToHex(stData2));

end;

function TCurrentDeviceState.GetZoneExtentionUse(
  ZoneExtNo: integer): string;
begin
  if ZoneExtNo > FIXMAXZONEEXTENDNO then Exit;
  result := ZoneExtensionUse[ZoneExtNo];
end;

procedure TCurrentDeviceState.DoorPossibilityInitialize;
var
  i : integer;
begin
  for i := LOW(DoorPossibility) to HIGH(DoorPossibility) do
  begin
    DoorPossibility[i] := False;
  end;

end;

function TCurrentDeviceState.GetDoorPossibility(aDoorNo: integer): Boolean;
begin
  result := False;
  if aDoorNo > HIGH(DoorPossibility) then Exit;
  result := DoorPossibility[aDoorNo];

end;

procedure TCurrentDeviceState.SetDoorPossibility(aDoorNo: integer;
  aValue: Boolean);
begin
  if aDoorNo > HIGH(DoorPossibility) then Exit;
  DoorPossibility[aDoorNo] := aValue;
  if Assigned(FOnDoorPossibilityChange) then
  begin
    OnDoorPossibilityChange(Self,ECUID,inttostr(aDoorNo),aValue);
  end;
end;

procedure TCurrentDeviceState.SetMaxDoorNo(const Value: integer);
var
  i : integer;
begin
  FMaxDoorNo := Value;
  for i := 1 to FIXMAXDOORNO do
  begin
    if i > Value then SetDoorPossibility(i,False)
    else SetDoorPossibility(i,True);
  end;      
end;

function TdmSocket.LineShortCheck(aDelay:Boolean=True): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'cs90';

  G_bDeviceResponse[conLineShortCheck] := False;
  SendPacket('00', 'R', stData,G_stDeviceVer, True);
  if aDelay then
  result := ResponseCheck(conLineShortCheck,G_nDelayTime);

end;

procedure TdmSocket.RcvLineShortCheck(aEcuId, aVer, aRealData: string);
begin
  G_bDeviceResponse[conLineShortCheck] := True;
  Delete(aRealData,1,4);
  if Assigned(FOnLineShortCheck) then
  begin
    OnLineShortCheck(Self,aECUID,aRealData);
  end;
end;

function TdmSocket.ZoneExtentionPortStateCheck(aEcuID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'SM11';

  G_bDeviceResponse[PORTSTATE] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(PORTSTATE,G_nDelayTime);

end;

function TdmSocket.RegistJaejungDelayUse(aEcuID,
  aRegistData: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'sy00' + aRegistData ;

  G_bDeviceResponse[conJaeJungDlayUseCheck] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(conJaeJungDlayUseCheck,G_nDelayTime);

end;

procedure TdmSocket.RcvJaejungDelayUse(aEcuID, aVer,
  aJaejungDlayUse: string);
begin
  G_bDeviceResponse[conJaeJungDlayUseCheck] := True;

  if Assigned(FOnJaejungDelayUse) then
  begin
    OnJaejungDelayUse(Self,aECUID,'',aJaejungDlayUse);
  end;

end;

function TdmSocket.CheckJaejungDelayUse(aEcuID: string; aDelay: Boolean;
  aPriority: integer): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'sy00';

  G_bDeviceResponse[conJaeJungDlayUseCheck] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
    result := ResponseCheck(conJaeJungDlayUseCheck,G_nDelayTime);

end;

function TCurrentDeviceState.GetDoorType(aDoorNo: integer): string;
begin
  if aDoorNo > MAXDOORNO then Exit;
  result := DoorUseType[aDoorNo];
end;

procedure TCurrentDeviceState.DoorArmAreaInitialize;
var
  i : integer;
begin
  for i := LOW(DoorArmArea) to HIGH(DoorArmArea) do
  begin
    DoorArmArea[i] := 0;
  end;
end;

function TCurrentDeviceState.GetDoorArmArea(aDoorNo: integer): integer;
begin
  if aDoorNo > MaxDoorNo then Exit;
  if DoorArmArea[aDoorNo] = 0 then result := 1
  else result := DoorArmArea[aDoorNo];
end;

procedure TCurrentDeviceState.SetDoorArmArea(aDoorNo: string;
  aArmArea: integer);
begin
  if Not IsDigit(aDoorNo) then Exit;
  if DoorArmArea[strtoint(aDoorNo)] <> aArmArea then
  begin
    DoorArmArea[strtoint(aDoorNo)] := aArmArea;
  end; 
end;

function TdmSocket.KTT812BufferClear: Boolean;
begin
  SearchSendDataList.Clear;
  FirstSendDataList.Clear;
  QuickSendDataList.Clear;
  ReserveSendDataList.Clear;
  CardSendDataList.Clear;
//  Commport.FlushInBuffer;
//  Commport.FlushOutBuffer;
end;

procedure TCurrentDeviceState.DoorLockTypeInitialize;
var
  i : integer;
begin
  for i := LOW(DoorLockType) to HIGH(DoorLockType) do
  begin
    DoorLockType[i] := 1;
  end;

end;

function TCurrentDeviceState.GetDoorLockType(aDoorNo: integer): integer;
begin
  if aDoorNo > MaxDoorNo then Exit;
  result := DoorLockType[aDoorNo];    
end;

procedure TCurrentDeviceState.SetDoorLockType(aDoorNo: string;
  aLockType: integer);
begin
  if Not IsDigit(aDoorNo) then Exit;
  if DoorLockType[strtoint(aDoorNo)] <> aLockType then
  begin
    DoorLockType[strtoint(aDoorNo)] := aLockType;
  end;
end;

function TdmSocket.JavaraScheduleSearch(aEcuID, aDoorNo: string;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;
  if Not isDigit(aDoorNo) then Exit;
  stData := 'DL04' +
            FillZeroNumber(strtoint(aDoorNo),2) ; //100ms ������ 1�� �ΰ�� 010

  G_bDeviceResponse[conJavaraSchedule] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conJavaraSchedule,G_nDelayTime);

end;

procedure TdmSocket.RcvJavaraSchedule(aECUID, aVer, aRealData: string);
var
  stDoorNo : string;
begin
  G_bDeviceResponse[conJavaraSchedule] := True;
  Delete(aRealData,1,4);
  stDoorNo := copy(aRealData,1,2);
  Delete(aRealData,1,2);
  if Assigned(FOnJavaraSchedule) then
  begin
    OnJavaraSchedule(Self,aECUID,stDoorNo,aRealData);
  end;

end;

function TdmSocket.RegistJavaraSchedule(aEcuID, aDoorNo, aData: string;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;
  if Not isDigit(aDoorNo) then Exit;
  stData := 'DL04' +
            FillZeroNumber(strtoint(aDoorNo),2) +
            ' ' + aData;

  G_bDeviceResponse[conJavaraSchedule] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conJavaraSchedule,G_nDelayTime);

end;

procedure TdmSocket.MessageProcess(aECUID, aVer, aRealData: string);
var
  stMessage : string;
begin
  stMessage := aRealData;

end;

function TdmSocket.CardReaderStatusCheck(aEcuID:string;aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'cs01';

  G_bDeviceResponse[conCARDREADERSTATE] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(conCARDREADERSTATE,G_nDelayTime);

end;

procedure TdmSocket.RcvCardReaderStateCheck(aEcuId, aVer,
  aRealData: string);
var
  i : integer;
begin
  G_bDeviceResponse[conCARDREADERSTATE] := True;
  Delete(aRealData,1,4);
  if Assigned(FOnCardReaderState) then
  begin
    OnCardReaderState(Self,aECUID,aRealData);
  end;
end;

procedure TCurrentDeviceState.SetReaderUse(aReaderNo: integer;
  aReaderUse: Boolean);
begin
  if aReaderNo > MAXREADERNO then Exit;
  if aReaderUse then ReaderUse[aReaderNo] := '1'
  else ReaderUse[aReaderNo] := '0';
end;

procedure TCurrentDeviceState.SetScheduleUse(const Value: Boolean);
begin
  if FScheduleUse = Value then Exit;
  FScheduleUse := Value;
  if Assigned(FOnScheduleUseChange) then
  begin
    OnScheduleUseChange(Self,ECUID,'',Value);
  end;
end;

function TdmSocket.RegArmJavaraClose(aEcuID, aJavaraClose: string;
  aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;

  stData:= 'DL05' +                                     //MSG Code
          '00'+    //����ȣ
          aJavaraClose +    //���� ���ݰ��� ����(1)
          '0' +              //���� ���������� ����(1)
          '0' +              //���� ���ݰ��� ����(1)
          '0' ;              //���� ���������� ����(1)

  G_bDeviceResponse[conJavaraArmClose] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conJavaraArmClose,G_nDelayTime);

end;

procedure TdmSocket.RcvJavaraArmClose(aECUID, aVer, aRealData: string);
var
  stDoorNo : string;
  stArmJavaraClose : string;
  stDisArmJavaraOpen : string;
  stServerArmJavaraClose : string;
  stServerDisArmJavaraOpen : string;
begin
  G_bDeviceResponse[conJavaraArmClose] := True;
  Delete(aRealData,1,4);
  stDoorNo := copy(aRealData,1,2);
  Delete(aRealData,1,2);
  stArmJavaraClose := copy(aRealData,3,1);
  stDisArmJavaraOpen := copy(aRealData,4,1);
  stServerArmJavaraClose := copy(aRealData,5,1);
  stServerDisArmJavaraOpen := copy(aRealData,6,1);

  if Assigned(FOnJavaraArmClose) then
  begin
    OnJavaraArmClose(Self,aECUID,stDoorNo,aRealData);
  end;
end;

function TdmSocket.JavaraCloseSearch(aEcuID: string;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'DL0500'; //100ms ������ 1�� �ΰ�� 010

  G_bDeviceResponse[conJavaraArmClose] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conJavaraArmClose,G_nDelayTime);

end;

procedure TdmSocket.setDataSending(const Value: Boolean);
begin
//  if FDataSending = Value then Exit;
  FDataSending := Value;
  SendTimer.Enabled := Value;
end;

function TdmSocket.RegJavaraAutoClose(aEcuID, aJavaraAutoClose: string;
  aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;

  stData:= 'DL07' +                                     //MSG Code
          '00'+    //����ȣ
          aJavaraAutoClose +    //�ڹٶ��ڵ����� �̻��(0),���(1)
          '1' +              //�ڹٶ� ��ð� ����/���� �������� �̻��(0),���(1)
          '3' +              //�ڵ� ���� ��õ� Ƚ��
          '0000' ;           //�ڹٶ� ���� ���� �Ϸ� �ð� (��) 

  G_bDeviceResponse[conJavaraAutoClose] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conJavaraAutoClose,G_nDelayTime);

end;

procedure TdmSocket.RcvJavaraAutoClose(aECUID, aVer, aRealData: string);
var
  stDoorNo : string;
  stJavaraAutoClose : string;
begin
  G_bDeviceResponse[conJavaraAutoClose] := True;
  Delete(aRealData,1,4);
  stDoorNo := copy(aRealData,1,2);
  Delete(aRealData,1,2);
  stJavaraAutoClose := copy(aRealData,1,1);

  if Assigned(FOnJavaraAutoClose) then
  begin
    OnJavaraAutoClose(Self,aECUID,stDoorNo,aRealData);
  end;
end;

function TdmSocket.JavaraAutoCloseSearch(aEcuID: string;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'DL0700'; //100ms ������ 1�� �ΰ�� 010

  G_bDeviceResponse[conJavaraAutoClose] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conJavaraAutoClose,G_nDelayTime);

end;

procedure TCurrentDeviceState.SetPortZoneUseSkill(const Value: Boolean);
begin
  if FPortZoneUseSkill = Value then Exit;
  FPortZoneUseSkill := Value;
  if Assigned(FOnPortZoneUseSkillChange) then
  begin
    OnPortZoneUseSkillChange(Self,ECUID,'',Value);
  end;
end;

function TdmSocket.ZoneExtentionNetworkStatusCheck(aEcuID: string;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'cs03';

  G_bDeviceResponse[conZONEEXTENTIONNETWORK] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(conZONEEXTENTIONNETWORK,G_nDelayTime);

end;

procedure TdmSocket.RcvZoneExtentionNetworkStateCheck(aEcuId, aVer,
  aRealData: string);
var
  i : integer;
begin
  G_bDeviceResponse[conZONEEXTENTIONNETWORK] := True;
  Delete(aRealData,1,4);
  if Assigned(FOnZoneExtentionNetworkState) then
  begin
    OnZoneExtentionNetworkState(Self,aECUID,aRealData);
  end;
end;

procedure TCurrentDeviceState.SetZoneExtentionConnected(
  aZoneExtNo: integer; aConnected: Boolean);
var
  stZoneExtentionConnected : string;
begin
  if aConnected then stZoneExtentionConnected := '1'
  else stZoneExtentionConnected := '0';

  if ZoneExtensionConnectionState[aZoneExtNo] <> stZoneExtentionConnected then
  begin
    ZoneExtensionConnectionState[aZoneExtNo] := stZoneExtentionConnected;
    if Assigned(FOnZoneExtensionConnectChange) then
    begin
      OnZoneExtensionConnectChange(Self,ECUID,inttostr(aZoneExtNo),aConnected);
    end;
  end;

end;

procedure TCurrentDeviceState.ZoneExtensionConnectionStateInitialize;
var
  i : integer;
begin
  for i := LOW(ZoneExtensionConnectionState) to HIGH(ZoneExtensionConnectionState) do
  begin
    ZoneExtensionConnectionState[i] := '0';
  end;

end;

function TCurrentDeviceState.GetZoneExtentionConnectState(
  aZoneExtNo: integer): Boolean;
begin
  if aZoneExtNo > FIXMAXZONEEXTENDNO then Exit;
  result := False;
  if ZoneExtensionConnectionState[aZoneExtNo] = '1' then result := True;

end;

procedure TCurrentDeviceState.SetPortZoneUseRemoteControlSkill(
  const Value: Boolean);
begin
  if FPortZoneUseRemoteControlSkill = Value then Exit;
  FPortZoneUseRemoteControlSkill := Value;
  if Assigned(FOnPortZoneUseRemoteControlSkill) then
  begin
    OnPortZoneUseRemoteControlSkill(Self,ECUID,'',Value);
  end;
end;

function TdmSocket.ZoneUsedRemoteControl(aEcuID, aExtNo, aZoneNo,
  aUsed: string): Boolean;
var
  stData : string;
  stHeader : string;
begin
  Result := false;
  if Not isDigit(aExtNo) then Exit;
  if Not isDigit(aZoneNo) then Exit;
  if Not isDigit(aUsed) then Exit;
  stData := '********';
  if aExtNo = '0' then
  begin
    stHeader := 'fn04L00*';
    stData[strtoint(aZoneNo)] := aUsed[1];
  end else
  begin
    stHeader := 'fn04E' + FillZeroNumber(strtoint(aExtNo),2) + '*';
    stData[strtoint(aZoneNo)] := aUsed[1];
  end;

  G_bDeviceResponse[conZONEUSEDREMOTECONTROL] := False;
  SendPacket(aEcuID, 'R', stHeader + stData,G_stDeviceVer, True);
  result := ResponseCheck(conZONEUSEDREMOTECONTROL,G_nDelayTime);

end;

procedure TdmSocket.RcvZoneUseRemoteControl(aECUID, aVer,
  aRealData: string);
begin
  G_bDeviceResponse[conZONEUSEDREMOTECONTROL] := True;
  Delete(aRealData,1,4);
  if Assigned(FOnZoneUseRemoteControl) then
  begin
    OnZoneUseRemoteControl(Self,aECUID,aRealData);
  end;

end;

function TdmSocket.ZoneUsedRemoteControlState(aEcuID,
  aExtNo: string;aDelay:Boolean=True): Boolean;
var
  stHeader : string;
begin
  Result := false;
  if Not isDigit(aExtNo) then Exit;
  if aExtNo = '0' then
  begin
    stHeader := 'fn05L00*';
  end else
  begin
    stHeader := 'fn05E' + FillZeroNumber(strtoint(aExtNo),2) + '*';
  end;

  G_bDeviceResponse[conZONEUSEDREMOTECONTROL] := False;
  SendPacket(aEcuID, 'R', stHeader,G_stDeviceVer, True);
  if aDelay then
  result := ResponseCheck(conZONEUSEDREMOTECONTROL,G_nDelayTime);

end;


procedure TCurrentDeviceState.SetJavaraScheduleSkill(const Value: Boolean);
begin
  if FJavaraScheduleSkill = Value then Exit;
  FJavaraScheduleSkill := Value;
  if Assigned(FOnJavaraScheduleSkillChange) then
  begin
    OnJavaraScheduleSkillChange(Self,EcuID,'0',Value);
  end;

end;

procedure TdmSocket.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  LastConnectedTime:= Now;
  SocketConnected := True;
  if Assigned(FOnPanelMessage) then
  begin
    OnPanelMessage(Self,'���� IP:' + Socket.RemoteHost );
  end;
end;

procedure TdmSocket.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  SocketConnected := False;
  if Assigned(FOnPanelMessage) then
  begin
    OnPanelMessage(Self,Socket.RemoteHost + ' ����' );
  end;
end;

procedure TdmSocket.IdTCPClientConnected(Sender: TObject);
begin
  LastConnectedTime:= Now;
  SocketConnected := True;
  if Assigned(FOnPanelMessage) then
  begin
    OnPanelMessage(Self,'���� IP:' + IdTCPClient.Host );
  end;

end;

procedure TdmSocket.IdTCPClientDisconnected(Sender: TObject);
begin
  SocketConnected := False;
  if Assigned(FOnPanelMessage) then
  begin
    OnPanelMessage(Self,IdTCPClient.Host + ' ����' );
  end;

end;

procedure TdmSocket.ClientSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  if ErrorCode = 10035 then
  begin
    LastConnectedTime:= Now;
    SocketConnected := True;
    if Assigned(FOnPanelMessage) then
    begin
      OnPanelMessage(Self,'���� IP:' + SocketAddress );
    end;
    Exit;
  end;
  //  ErrCode := 0;
  //Commport.Open := False;  --���⼭ ��Ʈ�� Close �ϸ� ���ѷ���
  SocketConnected := False;
  if Assigned(FOnPanelMessage) then
  begin
    OnPanelMessage(Self,' ���ӽ��� - ' + inttostr(ErrorCode) );
  end;
  if Assigned(FOnConnectError) then
  begin
    OnConnectError(Self,False);
  end;

end;

procedure TdmSocket.ClientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  stTemp: string;
  i: Integer;
  bLoop : Boolean;
  stLeavePacketData : string;
  stPacketData : string;
  nFormat : integer;
  nReturnCode : integer;
  szBuffer: array[0..1024] of Char;
begin
  LastConnectedTime:= Now;
  nReturnCode := 1;

  stTemp := '';
  while (nReturnCode > 0) do
  begin
    FillChar(szBuffer, SizeOf(szBuffer), 0);
    nReturnCode := Socket.ReceiveBuf(szBuffer, SizeOf(szBuffer));
    if nReturnCode > 0 then
    begin
      stTemp := Char2Ascii(szBuffer,nReturnCode);
      if KTT812FirmwareDownLoadType then  //KTT812 Firmware Download ���̸�
      begin
        stTemp := ASCII2Hex(stTemp);
      end;
    end;
  end;

  L_DeviceBuffer := L_DeviceBuffer + stTemp;

  bLoop := False;
  repeat
    if Trim(L_DeviceBuffer) = '' then Exit;

    if Not KTT812FirmwareDownLoadType then
    begin
      nFormat := PacketFormatCheck(L_DeviceBuffer,G_nProgramType,stLeavePacketData,stPacketData);
      {/*
       nFormat : -1 -> ������ ����
                 -2 -> ���̰� ª�� ����
                  1 ->  STX ����
                  2 ->  SOH ����
      */}
    end else
    begin
      nFormat := CheckKTT812FirmwareDataPacket(L_DeviceBuffer,stLeavePacketData,stPacketData);
    end;
    L_DeviceBuffer:= stLeavePacketData;

    if nFormat < 0 then
    begin
      if L_DeviceBuffer = '' then break;
      if nFormat = -1 then  //������ ���� �ΰ��
      begin
         Delete(L_DeviceBuffer,1,1);
         continue;
      end else break;   //���� ���̰� �۰� ���� ���

    end;

    L_bDecoderFormat := False;
    L_bKTT812DownloadFormat := False;
    if nFormat = 1 then L_bDecoderFormat := False
    else if nFormat = 2 then L_bDecoderFormat := True
    else if nFormat = 3 then L_bKTT812DownloadFormat := True
    else continue;

    if L_bDecoderFormat then continue;   //���ڴ� ������ ��� ó�� ���� ����

    if stPacketData <> '' then
    begin
      if L_bKTT812DownloadFormat then KTT812DataPacektProcess(stPacketData)
      else DataPacketProcess(stPacketData);
    end;

    if L_bKTT812DownloadFormat then
    begin
      if pos(KTT812FirmwareHeader,L_DeviceBuffer) = 0 then bLoop := True
      else bLoop := False;
    end else
    begin
      if pos(ETX,L_DeviceBuffer) = 0 then bLoop := True
      else bLoop := False;
    end;
    Application.ProcessMessages;
  until bLoop;

end;

function TdmSocket.Char2Ascii(aBuffer: pchar;
  aReturnCode: integer): string;
var
  i : integer;
  stTemp : string;
begin
  stTemp := '';
  for i := 0 to aReturnCode - 1 do
  begin
    stTemp := stTemp + aBuffer[i];
  end;
  result := stTemp;
end;

procedure TdmSocket.RcvZoneExtentionVersion(aECUID, aVer,
  aRealData: string);
var
  stExtentionNo : string;
  stExtentionVersion : string;
  nExtentionPoint : integer;
begin

  stExtentionNo := copy(aRealData,3,2);

  if isDigit(stExtentionNo) then
  begin
    nExtentionPoint := (strtoint(aEcuID) * FIXMAXZONEEXTENDNO ) + strtoint(stExtentionNo);
    G_bExtentionVersionResponse[nExtentionPoint] := True;
  end;

  if copy(aRealData,5,2) = 'CV' then
  begin
    stExtentionVersion := copy(aRealData,7,Length(aRealData) - 6);
    if Assigned(FOnZoneExtentionVersion) then
    begin
      OnZoneExtentionVersion(Self,aECUID,stExtentionNo,stExtentionVersion);
    end;
  end;

end;

function TdmSocket.ZoneExtensionVersion_Check(aEcuID, aZoneExtNo: string;
  aDelay: Boolean): Boolean;
var
  stData : string;
  nExtentionPoint : integer;
begin
  Result := false;
  stData := 'el' + FillZeroNumber(strtoint(aZoneExtNo), 2);
  stData := stData + 'CV';

  nExtentionPoint := (strtoint(aEcuID) * FIXMAXZONEEXTENDNO ) + strtoint(aZoneExtNo);
  G_bExtentionVersionResponse[nExtentionPoint] := False;
  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, aDelay);
  if aDelay then
  result := ZoneExtentionVersionResponseCheck(nExtentionPoint,G_nDelayTime);

end;

function TCurrentDeviceState.GetZoneExtentionVersion(
  aZoneExtNo: integer): string;
begin
  if aZoneExtNo > FIXMAXZONEEXTENDNO then Exit;
  result := ZoneExtensionVersion[aZoneExtNo];

end;

procedure TCurrentDeviceState.SetZoneExtentionVersion(aZoneExtNo,
  aZoneExtentionVersion: string);
var
  nZoneExtNo : integer;
begin
  if Not isDigit(aZoneExtNo) then Exit;
  nZoneExtNo := strtoint(aZoneExtNo);
  ZoneExtensionVersion[nZoneExtNo] := aZoneExtentionVersion;
end;

procedure TCurrentDeviceState.ZoneExtensionVersionInitialize;
var
  i : integer;
begin
  for i := LOW(ZoneExtensionVersion) to HIGH(ZoneExtensionVersion) do
  begin
    ZoneExtensionVersion[i] := '';
  end;

end;

procedure TCurrentDeviceState.SetMaxCardCount(const Value: integer);
begin
  FMaxCardCount := Value;
end;

function TdmSocket.CheckMaxCardNo(aEcuID: string;aDelay:Boolean=True;aPriority:integer=2): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'fn06';

  G_bDeviceResponse[conMaxCardCountCheck] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
    result := ResponseCheck(conMaxCardCountCheck,G_nDelayTime);

end;

procedure TdmSocket.RcvMaxCardCount(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[conMaxCardCountCheck] := True;
  Delete(aRealData,1,4);
  if Assigned(FOnMaxCardCount) then
  begin
    OnMaxCardCount(Self,aECUID,Trim(aRealData));
  end;
end;

function TdmSocket.PrimaryKTT_Registration(aPrimaryKey: string;
  aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;

  stData := 'fn17' + aPrimaryKey;

  G_bDeviceResponse[conPrimaryKTTType] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conPrimaryKTTType,G_nDelayTime);

end;

procedure TdmSocket.RcvPrimaryKTTTypeCheck(aECUID, aVer,
  aRealData: string);
begin
  G_bDeviceResponse[conPrimaryKTTType] := True;
  //stGubun:= Copy(aRealData,3,2);
  Delete(aRealData,1,4);

  if Assigned(FOnPrimaryKTTType) then
  begin
    OnPrimaryKTTType(Self,aECUID,'',aRealData);
  end;
end;

function TdmSocket.KTTMuxID_Registration(aMuxID: string;
  aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;

  stData := 'fn18 ' + aMuxID;

  G_bDeviceResponse[conKTTMUXID] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conKTTMUXID,G_nDelayTime);

end;

procedure TdmSocket.RcvKTTMuxIDCheck(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[conKTTMUXID] := True;
  Delete(aRealData,1,4);

  if Assigned(FOnKTTMuxID) then
  begin
    OnKTTMuxID(Self,aECUID,'',aRealData);
  end;

end;

function TdmSocket.PrimaryKTT_Check(aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;

  stData := 'fn17';

  G_bDeviceResponse[conPrimaryKTTType] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conPrimaryKTTType,G_nDelayTime);

end;

function TdmSocket.KTTMuxID_Check(aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;

  stData := 'fn18';

  G_bDeviceResponse[conKTTMUXID] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conKTTMUXID,G_nDelayTime);

end;

function TdmSocket.DDNSQueryServer_Check(aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;
  
  stData := 'fn20';

  G_bDeviceResponse[conDDNSQueryServer] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conDDNSQueryServer,G_nDelayTime);

end;

procedure TdmSocket.RcvDDNSQueryServerCheck(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[conDDNSQueryServer] := True;
  Delete(aRealData,1,4);

  if Assigned(FOnDDNSQueryServer) then
  begin
    OnDDNSQueryServer(Self,aECUID,'',aRealData);
  end;

end;

function TdmSocket.DDNSServer_Check(aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;
  
  stData := 'fn21';

  G_bDeviceResponse[conDDNSServer] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conDDNSServer,G_nDelayTime);

end;

procedure TdmSocket.RcvDDNSServerCheck(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[conDDNSServer] := True;
  Delete(aRealData,1,4);

  if Assigned(FOnDDNSServer) then
  begin
    OnDDNSServer(Self,aECUID,'',aRealData);
  end;

end;

function TdmSocket.EventServer_Check(aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;
  
  stData := 'fn22';

  G_bDeviceResponse[conEventServer] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conEventServer,G_nDelayTime);

end;

procedure TdmSocket.RcvEventServerCheck(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[conEventServer] := True;
  Delete(aRealData,1,4);

  if Assigned(FOnEventServer) then
  begin
    OnEventServer(Self,aECUID,'',aRealData);
  end;

end;

function TdmSocket.TCPServerPort_Check(aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;
  
  stData := 'fn23';

  G_bDeviceResponse[conTCPServerPort] := False;
  SendPacket('00', 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conTCPServerPort,G_nDelayTime);

end;

procedure TdmSocket.RcvTCPServerPortCheck(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[conTCPServerPort] := True;
  Delete(aRealData,1,4);

  if Assigned(FonTCPServerPort) then
  begin
    onTCPServerPort(Self,aECUID,'',aRealData);
  end;

end;

function TdmSocket.DDNSQueryServer_Registration(aServerIP,
  aServerPort: string; aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;
  
  stData := 'fn20 ' + aServerIP + ' ' + aServerPort + ' ';

  G_bDeviceResponse[conDDNSQueryServer] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conDDNSQueryServer,G_nDelayTime);

end;

function TdmSocket.DDNSServer_Registration(aServerIP, aServerPort: string;
  aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;
  
  stData := 'fn21 ' + aServerIP + ' ' + aServerPort + ' ';

  G_bDeviceResponse[conDDNSServer] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conDDNSServer,G_nDelayTime);

end;

function TdmSocket.EventServer_Registration(aServerIP, aServerPort: string;
  aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;
  
  stData := 'fn22 ' + aServerIP + ' ' + aServerPort + ' ';

  G_bDeviceResponse[conEventServer] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conEventServer,G_nDelayTime);

end;

function TdmSocket.ServerPort_Registration(aServerPort: string;
  aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;
  
  stData := 'fn23 ' + aServerPort + ' ';

  G_bDeviceResponse[conTCPServerPort] := False;
  SendPacket('00', 'I', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conTCPServerPort,G_nDelayTime);

end;

procedure TdmSocket.DataModuleCreate(Sender: TObject);
begin
  dmWinsocket := TdmWinsocket.Create(self);
  dmWinsocket.OnSocketConnected := WinSocketConnected;
  dmWinsocket.OnSocketDisConnected := WinSocketDisConnected;
  dmWinSocket.OnSocketRead := WinSocketRead;
  dmWinSocket.OnSocketSend := WinSocketSend;
  dmWinSocket.OnSocketSendComplete := WinSocketSendComplete;
  dmWinSocket.OnSocketError := WinSocketError;
end;

procedure TdmSocket.DataModuleDestroy(Sender: TObject);
begin
  dmWinsocket.Free;
end;

procedure TdmSocket.WinSocketConnected(Sender: TObject; SockNo: integer);
begin
  LastConnectedTime:= Now;
  SocketConnected := True;
  if Assigned(FOnPanelMessage) then
  begin
    OnPanelMessage(Self,'���� IP:' + SocketAddress );
  end;
end;

procedure TdmSocket.WinSocketDisConnected(Sender: TObject;
  SockNo: integer);
begin
  SocketConnected := False;
  if Assigned(FOnPanelMessage) then
  begin
    OnPanelMessage(Self,SocketAddress + ' ����' );
  end;
end;

procedure TdmSocket.WinSocketRead(Sender: TObject; SockNo: integer;
  Buf: String; DataLen: Integer);
var
  stTemp: string;
  i: Integer;
  bLoop : Boolean;
  stLeavePacketData : string;
  stPacketData : string;
  nFormat : integer;
begin
  LastConnectedTime:= Now;
  stTemp := Buf;

  //NodeConnected:=True;
  if KTT812FirmwareDownLoadType then  //KTT812 Firmware Download ���̸�
  begin
    stTemp := ASCII2Hex(stTemp);
  end;

  L_DeviceBuffer := L_DeviceBuffer + stTemp;

  bLoop := False;
  repeat
    if Trim(L_DeviceBuffer) = '' then Exit;

    if Not KTT812FirmwareDownLoadType then
    begin
      nFormat := PacketFormatCheck(L_DeviceBuffer,G_nProgramType,stLeavePacketData,stPacketData);
      {/*
       nFormat : -1 -> ������ ����
                 -2 -> ���̰� ª�� ����
                  1 ->  STX ����
                  2 ->  SOH ����
      */}
    end else
    begin
      nFormat := CheckKTT812FirmwareDataPacket(L_DeviceBuffer,stLeavePacketData,stPacketData);
    end;
    L_DeviceBuffer:= stLeavePacketData;

    if nFormat < 0 then
    begin
      if L_DeviceBuffer = '' then break;
      if nFormat = -1 then  //������ ���� �ΰ��
      begin
        if Assigned(FOnPacketView) then
        begin
          OnPacketView(Self,L_DeviceBuffer + '[' + Ascii2Hex(L_DeviceBuffer) + ']','Er');
        end;
         Delete(L_DeviceBuffer,1,1);
         continue;
      end else break;   //���� ���̰� �۰� ���� ���

    end;

    L_bDecoderFormat := False;
    L_bKTT812DownloadFormat := False;
    if nFormat = 1 then L_bDecoderFormat := False
    else if nFormat = 2 then L_bDecoderFormat := True
    else if nFormat = 3 then L_bKTT812DownloadFormat := True
    else continue;

    if L_bDecoderFormat then continue;   //���ڴ� ������ ��� ó�� ���� ����

    if stPacketData <> '' then
    begin
      if L_bKTT812DownloadFormat then KTT812DataPacektProcess(stPacketData)
      else DataPacketProcess(stPacketData);
    end;

    if L_bKTT812DownloadFormat then
    begin
      if pos(KTT812FirmwareHeader,L_DeviceBuffer) = 0 then bLoop := True
      else bLoop := False;
    end else
    begin
      if pos(ETX,L_DeviceBuffer) = 0 then bLoop := True
      else bLoop := False;
    end;
    Application.ProcessMessages;
  until bLoop;
end;

procedure TdmSocket.WinSocketSendComplete(Sender: TObject;
  SockNo: integer);
begin
  L_bSending := False;
//  SocketOutSenting := False; //���� �Ϸ�
end;

procedure TdmSocket.WinSocketError(Sender: TObject; SockNo,
  SocketError: Integer);
begin
  if SocketError = 10035 then
  begin
    LastConnectedTime:= Now;
//    SocketConnected := True;
    if Assigned(FOnPanelMessage) then
    begin
      OnPanelMessage(Self,'���� IP:' + SocketAddress );
    end;
    Exit;
  end;
  //  ErrCode := 0;
  //Commport.Open := False;  --���⼭ ��Ʈ�� Close �ϸ� ���ѷ���
  SocketConnected := False;
  if Assigned(FOnPanelMessage) then
  begin
    OnPanelMessage(Self,' ���ӽ��� - ' + inttostr(SocketError) );
  end;
  if Assigned(FOnConnectError) then
  begin
    OnConnectError(Self,False);
  end;
end;

procedure TdmSocket.WinSocketSend(Sender: TObject; SockNo: integer;
  Buf: String; DataLen: Integer);
begin
//
end;

function TdmSocket.RegistLineCheckStart(aEcuID, aStartTime: string;
  aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;

  stData:= 'Pt00' +
          aStartTime ;

  G_bDeviceResponse[conLineCheckStart] := False;
  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conLineCheckStart,G_nDelayTime);

end;

function TdmSocket.RegistLineCheckTime(aEcuID, aTime: string;
  aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;

  stData:= 'Pt00' +
          aTime ;

  G_bDeviceResponse[conLineCheckTime] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conLineCheckTime,G_nDelayTime);

end;

procedure TdmSocket.RcvLineCheckStart(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[conLineCheckStart] := True;
  Delete(aRealData,1,4);
  if Assigned(FOnLineCheckStart) then
  begin
    OnLineCheckStart(Self,aECUID,Trim(aRealData));
  end;
end;

procedure TdmSocket.RcvLineCheckTime(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[conLineCheckTime] := True;
  Delete(aRealData,1,4);
  if Assigned(FOnLineCheckTime) then
  begin
    OnLineCheckTime(Self,aECUID,Trim(aRealData));
  end;

end;

procedure TCurrentDeviceState.SetPOLICEDevice(const Value: Boolean);
begin
  if FPOLICEDevice = Value then Exit;
  FPOLICEDevice := Value;
  if Assigned(FOnPoliceDeviceTypeChange) then
  begin
    OnPoliceDeviceTypeChange(Self,EcuID,'0',Value);
  end;

end;

function TdmSocket.PoliceTel_Registration(aEcuID,
  aSendData: string;aDelay:Boolean=True): boolean;
begin
  Result := false;

  G_bDeviceResponse[conPoliceTel] := False;
  SendPacket(aEcuID, 'I', aSendData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conPoliceTel,G_nDelayTime);

end;

procedure TdmSocket.RcvPoliceTelNo(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[conPoliceTel] := True;
  Delete(aRealData,1,4);

  if Assigned(FOnPoliceTelNum) then
  begin
    OnPoliceTelNum(Self,aECUID,'',aRealData);
  end;

end;

function TdmSocket.PoliceTel_Check(aEcuID, aSendData: string;
  aDelay: Boolean): Boolean;
begin
  Result := false;

  G_bDeviceResponse[conPoliceTel] := False;
  SendPacket(aEcuID, 'Q', aSendData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conPoliceTel,G_nDelayTime);

end;

function TdmSocket.ServerCardNFSearch(aEcuID: string; aDelay: Boolean;
  aPriority: integer): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'fn24';

  G_bDeviceResponse[SYSINFOCHECK] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
    result := ResponseCheck(conServerCardNF,G_nDelayTime);
end;

procedure TdmSocket.RcvServerCardNFCheck(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[conServerCardNF] := True;
  Delete(aRealData,1,4);

  if Assigned(FonServerCardNF) then
  begin
    onServerCardNF(Self,aECUID,'',aRealData);
  end;

end;

function TdmSocket.RegistServerCardNF(aEcuID,
  aServerCardNF: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'fn24' + 
    aServerCardNF;

  G_bDeviceResponse[conServerCardNF] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(conServerCardNF,G_nDelayTime); 
end;

function TdmSocket.JavaraStopTimeSearch(aEcuID: string;
  aDelay: Boolean): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'fn26 '; //

  G_bDeviceResponse[conJavaraStopTime] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conJavaraStopTime,G_nDelayTime);

end;

procedure TdmSocket.RcvJavaraStopTime(aECUID, aVer, aRealData: string);
begin
  G_bDeviceResponse[conJavaraStopTime] := True;
  Delete(aRealData,1,4);

  if Assigned(FonJavaraStopTime) then
  begin
    onJavaraStopTime(Self,aECUID,'',aRealData);
  end;

end;

function TdmSocket.RegistJavaraStopTime(aEcuID, aData: string;
  aDelay: Boolean): Boolean;
var
  stData: String;
begin
  Result := false;

  stData:= 'fn26 ' +  aData;

  G_bDeviceResponse[conJavaraStopTime] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, aDelay);

  if aDelay then
    result := ResponseCheck(conJavaraStopTime,G_nDelayTime);

end;

procedure TdmSocket.RcvCardReaderSoundUse(aEcuID, aVer, aRealData: string);
var
  stData: string;
begin
  G_bDeviceResponse[CARDREADERSOUNDUSE] := True;
  //fn03001100000
  stData := Copy(aRealData, 6, 8);
  if Assigned(FOnCardReaderSoundSetting) then
  begin
    OnCardReaderSoundSetting(Self,aECUID,stData);
  end;

end;

function TdmSocket.CardReaderSoundUse_Check(aEcuID: string;
  aDelay: Boolean; aPriority: integer): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'fn03';

  G_bDeviceResponse[CARDREADERSOUNDUSE] := False;
  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);
  result := ResponseCheck(CARDREADERSOUNDUSE,G_nDelayTime);


end;

function TdmSocket.RegistCardReaderSound(aEcuID,
  aSoundUseType: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'fn03 ' + aSoundUseType;

  G_bDeviceResponse[CARDREADERSOUNDUSE] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(CARDREADERSOUNDUSE,G_nDelayTime);
end;

function TdmSocket.HexSendPacketEvent(aSendHexData: string): Boolean;
var
  stSendData: string;
  nDataLength: Integer;
  i :integer;
begin
  Result := false;
  if Not SocketConnected then Exit;
  if G_bApplicationTerminate then Exit;

  nDataLength := Length(aSendHexData) div 2;
  stSendData := Hex2Ascii(aSendHexData);

  if (SocketType = 0) or (ConnectMode = 1) then
  begin
    for i := 0 to nDataLength do Commport.PutChar(stSendData[i]);
  end else if SocketType = 1 then
  begin
    ClientSocket.Socket.SendBuf(stSendData,nDataLength);
  end else if SocketType = 2 then
  begin
    IdTCPClient.WriteBuffer(stSendData[i],nDataLength);
  end else if SocketType = 3 then
  begin
    for i := 0 to nDataLength do dmWinsocket.PutChar(stSendData[i]);
  end;

end;

procedure TdmSocket.ICU300FirmWareRequest(aEcuID, aRealPacketData: string);
begin
// �߿��� ������ �۾��� ���
  if Assigned(FOnICU300FirmWareProcess) then
  begin
    OnICU300FirmWareProcess(Self,aECUID,'',aRealPacketData);
  end;
end;

procedure TdmSocket.RcvGCU300_ICU300FirmwareDownloadState(aECUID,
  aRealData: string);
begin
  if Assigned(FOnGCU300_ICU300FirmwareDownloadState) then
  begin
    OnGCU300_ICU300FirmwareDownloadState(Self,aECUID,Trim(aRealData));
  end;
end;

function TdmSocket.DeviceCardRegCountSearch(aEcuID: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'CD01';

  G_bDeviceResponse[conCARDRegCardCnt] := False;

  SendPacket(aEcuID, 'R', stData,G_stDeviceVer, True);
  result := ResponseCheck(conCARDRegCardCnt,G_nDelayTime);
end;

function TdmSocket.SearchDoorTimeCodeUse(aEcuID: string; aDelay: Boolean;
  aPriority: integer): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'DL09';

  G_bDeviceResponse[conDoorTimeCodeUse] := False;

  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
    result := ResponseCheck(conDoorTimeCodeUse,G_nDelayTime);
end;

function TdmSocket.SearchTimeCode(aEcuID, aNo: string; aDelay: Boolean;
  aPriority: integer): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'U00  ' + aNo;;

  G_bDeviceResponse[conTimeCode] := False;

  SendPacket(aEcuID,'c', stData,G_stDeviceVer, aDelay,aPriority);

  if aDelay then
    result := ResponseCheck(conTimeCode,G_nDelayTime);
end;

procedure TdmSocket.RcvTimeCode(aECUID, aVer, aRealData: string);
var
  stGroup: string;
  stTimeCode : string;
begin
  stGroup:= aRealData[6];
  stTimeCode := copy(aRealData,7,32);
  G_bDeviceResponse[conTimeCode] := True;

  if Assigned(FOnTimeCode) then
  begin
    OnTimeCode(Self,aECUID,stGroup,stTimeCode);
  end;
end;

procedure TdmSocket.RcvDoorTimeCodeUse(aECUID, aVer, aRealData: string);
var
  stTemp : string;
begin
  G_bDeviceResponse[conDoorTimeCodeUse] := True;
  Delete(aRealData,1,4);
  stTemp := copy(aRealData,2,8);

  if Assigned(FOnDoorTimeCodeUse) then
  begin
    OnDoorTimeCodeUse(Self,aECUID,aVer,stTemp);
  end;
end;

function TdmSocket.DoorTimeCodeUse_Registration(aEcuID,
  aData: string): Boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'DL09*' + aData;
  G_bDeviceResponse[conDoorTimeCodeUse] := False;
  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(conDoorTimeCodeUse,G_nDelayTime);
end;

function TdmSocket.TimeCode_Registration(aEcuID, aTimeGroup,
  aData: string; aDelay: Boolean): boolean;
var
  stData : string;
begin
  Result := false;

  stData := 'T00  ' + aTimeGroup + aData;
  G_bDeviceResponse[conTimeCode] := False;
  SendPacket(aEcuID, 'c', stData,G_stDeviceVer, True);

  result := ResponseCheck(conTimeCode,G_nDelayTime);
end;

function TdmSocket.RegistCardReaderExitSound(aEcuID,
  stExitSoundUseType: string): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'fn27 ' + stExitSoundUseType;

  G_bDeviceResponse[conCARDREADERExitSOUNDUSE] := False;

  SendPacket(aEcuID, 'I', stData,G_stDeviceVer, True);

  result := ResponseCheck(conCARDREADERExitSOUNDUSE,G_nDelayTime);
end;

procedure TdmSocket.RcvCardReaderExitSoundUse(aEcuID, aVer,
  aRealData: string);
var
  stData: string;
begin
  G_bDeviceResponse[conCARDREADERExitSOUNDUSE] := True;
  //fn27 00
  stData := Copy(aRealData, 6, 2);
  if Assigned(FOnCardReaderExitSoundSetting) then
  begin
    OnCardReaderExitSoundSetting(Self,aECUID,stData);
  end;

end;

function TdmSocket.CardReaderExitSoundUse_Check(aEcuID: string;
  aDelay: Boolean; aPriority: integer): Boolean;
var
  stData : string;
begin
  Result := false;
  stData := 'fn27';

  G_bDeviceResponse[conCARDREADERExitSOUNDUSE] := False;
  SendPacket(aEcuID, 'Q', stData,G_stDeviceVer, aDelay,aPriority);
  result := ResponseCheck(conCARDREADERExitSOUNDUSE,G_nDelayTime);

end;

procedure TCurrentDeviceState.SetBasicDoorNo(const Value: integer);
begin
  FBasicDoorNo := Value;
end;

end.