unit uCommon;

interface

uses
  SysUtils, Classes, DB, dbisamtb,Windows,Forms;



const
  SOH = #$1;
  STX = #$2;
  ETX = #$3;
  ENQ = #$5;
  ACK = #$6;
  NAK = #$15;
  EOT = #$04;
  TAB = #$09;
  HexString : String = '0123456789ABCDEF';

const PORTOPENFAIL = -1;
const PORTCONNECTFAIL = 0;
const PORTCONNECTED = 1;
const
  DELAYTIME = 3000;
  USEDDEVICE = 16;
  BROADSERVERPORT = 5001;
  BROADCLIENTPORT = 1460;
  TCPCLIENTPORT = 1461;
  TCPCLIENTKTTPORT = 4101;
  MAX_COMPORT = 35;
  FIXMAXECUNO = 63;    //�ִ� Ȯ��� ����
  FIXMAXDOORNO = 8;    //���Թ� �ִ� ����
  FIXMAXREADERNO = 8;  //ī�帮�� �ִ� ����
  FIXMAXZONEEXTENDNO = 8; //��Ȯ��� �ִ밹��
  FIXMAXZONENO = 8;    //��⺰ �ִ� �� ����
  FIXARMAREANO = 8;    //������� �ִ� ����

const MCUNAME = 'MCU-100';
      ECUNAME = 'ECU-100';
      ICUNAME = 'ICU-100';
const ECUTYPE = 'ECU';
      ICUTYPE = 'ICU';
//DeviceType
const NONETYPE = '0';
      KTT811 = '1';
      KTT812 = '2';
      ICU100 = '3';
      ICU200 = '4';
      ICU300 = '5';
      ACC100 = '6'; //��������
      KTT813 = '7'; //MCU-300
      SGS100 = '8'; //SG 4Door
//CARDType
const
  NOTHINGTYPE = '0';
  AUTOKT811 = '1'; //���α���
  COMMON811 = '2'; //����
  KT811     = '3'; //KT�����
  UNIVER811 = '4'; //���б���
  MERGECARD = '5'; //���� 16�ڸ�
  SERVERCARD = '6'; //���� �����

const
  KTT812FirmwareHeader = '0100AA';
  KTT812PAGESIZE = 128;


type CString = string[100];

type
  TZoneStatus = Class(TComponent)
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    FOnParentStatus: string;
    FOnStatusCode: string;
    FOnStatusName: string;
    procedure SetParentStatus(const Value: string);
    procedure SetStatusCode(const Value: string);
    procedure SetStatusName(const Value: string);
  published
    property ParentStatus:string Read FOnParentStatus write SetParentStatus;
    property StatusCode:string Read FOnStatusCode write SetStatusCode;
    property StatusName:string Read FOnStatusName write SetStatusName;
  end;

type
  TPanelMessage = procedure(Sender: TObject;  aMessage:string) of object; //�޽��� ���� ��
  TNodeConnect = procedure(Sender: TObject;  aConnected:Boolean) of object; //
  TECUConnect = procedure(Sender: TObject; aEcuID:string; aConnected:Boolean) of object;
  TPacketView = procedure(Sender: TObject;  aSendingData,aType:string) of object;
  TReceivePacket = procedure(Sender: TObject;  aReceiveData:string) of object;
  TServerModeConnect = procedure(Sender:TObject) of object;
  //�˶��̺�Ʈ
  TAlarmEvent = procedure(Sender: TObject;  aECUID,aCmd,aTime,aSubCLass,aSubAddr,aZone,
                          aMode,aStatus,aLoop,aState,aOper:string) of object;
  //��� �̺�Ʈ
  TDeviceIDSetting = procedure(Sender: TObject;  aECUID,aDeviceID:string) of object;
  TCardReaderSetting = procedure(Sender: TObject;  aECUID,aReaderNo,aUsedCR,
                       aCRPosition,aDoorNo,aReaderArmArea,aLocate,aBuildingPosi:string) of object;
  TSystemSetting = procedure(Sender: TObject;  aECUID,aPowerWatch,aOutDelay,
                       aDoor1Type,aDoor2Type,aLocate,aInDelay,aLockExtend:string) of object;
  TLampSirenOnOff = procedure(Sender: TObject;  aECUID,stLampOnOff,aSirenOnOff:string) of object;
  TLampTime = procedure(Sender: TObject;  aECUID,aLampTime:string) of object;
  TSirenTime = procedure(Sender: TObject;  aECUID,aSirenTime:string) of object;
  TPortSetting = procedure(Sender: TObject;  aECUID,aPort,aWatchType,aAlarmType,
                          aRecoverType,aDelayTimeType,aPortLocate,aDetectTime,aZoneArmArea,aZoneUsed:string) of object;
  TDeviceUsedSetting = procedure(Sender: TObject;  aECUID,aDeviceUsed:string) of object;
  TWiznetInfoSetting = procedure(Sender: TObject;  aECUID,aHeader,aMacAddress,aMode,
                          aIPAddress,aSubnet,aGateway,aClientPort,aServerIP,aServerPort,
                          aSerial_Baud,aSerial_data,aSerial_Parity,aSerial_stop,
                          aSerial_flow,aDelimiterChar,aDelimiterSize,aDelimitertime,
                          aDelimiterIdle,aDebugMode,aROMVer,aOnDHCP,aReserve:string) of object;
  TCardReaderTypeSetting = procedure(Sender: TObject;  aECUID,aCardReaderType:string) of object;
  TDeviceState = procedure(Sender: TObject;  aECUID,aCmd,aData:string) of object;
  TCCCSetting = procedure(Sender:TObject; aEcuID,aData:String) of object;
  //��������
  TDeviceTime = procedure(Sender: TObject;  aECUID,aTime:string) of object;
  TDeviceType = procedure(Sender: TObject;  aECUID,aDeviceType:string) of object;
  TSystemFunction = procedure(Sender: TObject;  aECUID:string;
                          aJavaraCloseCommand,aJavaraOpenCommand,aFireServerCommand:Boolean) of object;
  TDeviceVersion = procedure(Sender: TObject;  aECUID,aDeviceVersion:string) of object;
  TCardReaderVersion = procedure(Sender: TObject;  aECUID,aCardReaderNo,aCardReaderVersion:string) of object;
  TDeviceReset = procedure(Sender: TObject;  aECUID:string) of object;
  TCardListSearch = procedure(Sender: TObject;  aECUID,aData:string) of object;
  TEcuState = procedure(Sender: TObject;  aECUID,aData:string) of object;
  TCardGrade = procedure(Sender:TObject; aEcuID,aData:string) of object;
  TRemoteControl = procedure(Sender:TObject; aEcuID,aData:string) of object;
  //���������̺�Ʈ
  TCardAccessEvent = procedure(Sender: TObject;  aECUID,aDoorNo,aReaderNo,aInOut,aTime,
                          aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState,
                          aATButton,stCardNo:string) of object;
  TDoorEvent = procedure(Sender: TObject;  aECUID,aDoorNo,aReaderNo,aInOut,aTime,
                          aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState:string) of object;
  TDoorSettingEvent = procedure(Sender: TObject;  aECUID,aDoorNo,aCardMode,aDoorMode,
                          aDoorControlTime,aLongDoorOpenTime,aSchedule,aDoorState,
                          aNetFailRun,aAntiPass,aLongDoorOpenUse,aNetFailAlarm,
                          aDoorLockType,aFireDoorControl,aLockState,aDoorOpenState,
                          aRemoteDoorOpen:string) of object;
  TDoorState  = procedure(Sender: TObject;  aECUID,aDoorNo,aCardMode,aDoorMode,aDoorState,aDoorSchedule:string) of object;
  TCardRegist  = procedure(Sender: TObject;  aECUID,aDoorNo,aCmdState,aCardType,
                          aCardNo,aExpireDate,aRegResult,aCardAuth,aTimeMode,
                          aCardIDNo,aAlarmAreaGrade,aDoorAreaGrade:string) of object;
  TScheduleSetting = procedure(Sender: TObject;  aECUID,aDoorNo,aCmd,aDayOfWeek,a1ModeTime,a1Mode,
                          a2ModeTime,a2Mode,a3ModeTime,a3Mode,a4ModeTime,a4Mode,
                          a5ModeTime,a5Mode:string) of object;
  THolidaySetting = procedure(Sender: TObject;  aECUID,aDoorNo,aMonth,aDate:string) of object;
 
  TDoorDSState = (dsNothing,dsClose,dsOpen,dsLongTime,dsOpenErr,dsCloseErr);        //����/���� ����
  TDoorLockState = (lsNothing,lsClose,lsOpen);        //���/���� ����
  TDoorManageMode = (dmNothing,dmManager,dmOpen,dmLock);   //�/���� ��� /���
  TDoorPNMode = (pnNothing,pnPositive,pnNegative);   //Positive/Negative ����
  TWatchMode = (cmNothing,cmArm, cmDisarm,cmPatrol,cmInit,cmTest);
  TDeviceChange = procedure(Sender: TObject;aEcuID,aNo:string;aValue:Boolean) of object; //�̺�Ʈ ����

  TdmCommon = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  dmCommon: TdmCommon;
  DeviceTypeNameList : TStringList;
  DeviceList : TStringList;
  //���� ����
  RecvMsgNo : string; //���Ÿ޽�����ȣ
  SendMsgNo : integer = 0; //�۽Ÿ޽�����ȣ

  // KT-TELECOP ��� S-TEC �� �����ϱ� ����
  {
  G_nIDLength : integer = 17;
  G_stDeviceVer : string = 'ST'; //���� ���� ����
  G_nProgramType : integer = 1; //0 : KTTelecop,1:S-TEC
  G_nCardType : integer = 2;  // 0: 4Byte ����,1:KT���,2:���б�
  G_nHolidayCount : integer =  5;
  }
  //{
  G_nIDLength : integer = 7;
  G_stDeviceVer : string = 'K1'; //���� ���� ����
  G_nProgramType : integer = 0; //0 : KTTelecop,1:S-TEC
  G_nCardType : integer = 0;  // 0: 4Byte ����,1:KT���,2:���б�
  G_nHolidayCount : integer =  5;
  G_nMaxCardPositionNum : integer = 0; //���� ū ��ġ��ȣ
  //}
  G_nDelayTime : integer = 1000;  //������� �� ��� �ð�
  G_stTCPConf : string;    //TCPIP,TCPPort
  G_nComPort : integer;    //�ø��� ��Ʈ
  G_nLoopCount : integer ; //���� ��� Ƚ��
  G_nLANTime : integer;
  G_nLANLoop : integer;
  G_nConnectMode : Integer; //0:TCP,1:RS232
  G_nServerMode : integer;  //0:Ŭ���̾�Ʈ��� 1:�������
  G_bDeviceConnected : Boolean; //��� ���� ����

  G_bDeviceSearch : Boolean;  //��⼱�ý� ������� ��ȸ
  G_bRealRegist : Boolean;    //�ǽð� ��� ���
  G_bMacView : Boolean = True;    //�ǽð� ��� ���
  G_bEventControlerSave : Boolean;    //�ǽð� ��� ���
  G_bDirectConnect : Boolean;         //��� ����� �ٷ� ����
  G_stSelectEcuID : string; //���� ���õ� ECUID

  G_nCardReaderNumber :integer = 8; //ī�帮�� ����
  G_nPortNumber :integer = 8; //�� ����
  //G_nDoorNumber :integer = 8; //���Թ� ����

  G_bFireDevice: Array [0..100] of Boolean;     //ȭ��߻����
  G_bCardReaderUse: Array [0..8] of Boolean;  //ī�帮�� ��� ���� üũ

  ZoneStatusList : TStringList; //������ ����Ʈ
  ZoneStatusCodeList : TStringList; //������ �ڵ� ����Ʈ

  G_bApplicationTerminate : Boolean; //Application ���� ����

  G_nMCMode : integer;
  G_b812MainFirmWareDownloadComplete : boolean; //812 ���� �߿��� �ٿ�ε� �Ϸ� ����
  G_nSearchType : integer; //0:�⺻��ȸ,1:Ȯ����ȸ

  G_nMaxEcuCount : integer = 63;

//{$DEFINE DEBUG}


implementation

{$R *.dfm}

{ TZoneStatus }

constructor TZoneStatus.Create(AOwner: TComponent);
begin
  inherited;
//
end;

destructor TZoneStatus.Destroy;
begin
//
  inherited;
end;

procedure TZoneStatus.SetParentStatus(const Value: string);
begin
  FOnParentStatus := Value;
end;

procedure TZoneStatus.SetStatusCode(const Value: string);
begin
  FOnStatusCode := Value;
end;

procedure TZoneStatus.SetStatusName(const Value: string);
begin
  FOnStatusName := Value;
end;

end.