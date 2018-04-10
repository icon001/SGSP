{ Zreg 수정사항 : 마지막 수정자는 반드시 수정내용을 명기 할것..
================================================================================
수정일:   2007.08.04
수정자:   전진운
수정항목: 포트정보등록에서 강시 형태 추가
수정목적: 외부에서 콜버튼을 누르면 관제신호는 발생하지 않고 로컬PC에 상태전달
수정내용: 05.호출 추가
================================================================================
}
(*
0V00.00.001, V00.00.001, Sep 09 2005F

#define LS_ALARM_CMD  					  'A'
#define LS_INIT_CMD							  'I'	// = Initial Data
#define LS_INIT_REQUEST_CMD				'Q'	// = Initial Data Request
#define LS_INIT_ANS_CMD						'i'	// = Initial Data
#define LS_REMOTE_CMD						  'R' // = Remote Command
#define LS_REMOTE_ANS_CMD					'r' // = Remote Answer
#define LS_REMOTE_ERROR_CMD				'e' // = Remote Command				// New
#define LS_ENQ_CMD							  'E' // = ENQ
#define LS_ACK_CMD							  'a' // = ACK
#define LS_NAK_CMD							  'n' // = NAK
#define LS_ACCESS_CMD						  'c' // = Access Control data
#define LS_FLASH_CMD						  'F' // = Flash Down Load Command
#define LS_FLASH_ANS_CMD					'f' // = Flash Down Load Answer Command
*)

unit uMain;

//{$DEFINE DEBUG}
interface

uses
  uLomosUtil,uFunction,
  systeminfos,
  clipbrd,
  Dialogs,
  AdSocket,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ScktComp, LMDStopWatch, RzShellDialogs, DB,  ImgList, ExtCtrls,
  AdStatLt, OoMisc, AdPort, AdWnPort, LMDCustomComponent, LMDIniCtrl,
  Menus, RzPanel, RzButton, ADTrmEmu, Grids, DBGrids, RXDBCtrl,
  RzTabs, StdCtrls, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomSimpleLabel, LMDSimpleLabel, LMDCaptionPanel,
  LMDCustomScrollBox, LMDListBox, RzLstBox, ComCtrls, RzDTP, RzBtnEdt,
  RzSpnEdt, RzRadGrp, RzLabel, RzRadChk, RzCmboBx, Mask, RzEdit, LMDEdit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomEdit, LMDCustomMaskEdit, LMDCustomExtCombo,
  LMDCustomListComboBox, LMDListComboBox, RzGroupBar, RzSplit, RzStatus,
  LMDCustomParentPanel, LMDCustomGroupBox, LMDCustomButtonGroup,
  LMDCustomRadioGroup, LMDRadioGroup, LMDButtonControl, LMDCustomCheckBox,
  LMDCheckBox, LMDGlobalHotKey, Buttons, MPlayer,Math, dbisamtb,
  IdThreadMgr, IdThreadMgrDefault, IdBaseComponent, IdComponent,
  IdTCPServer,DateUtils, Gauges,shellAPI, LMDFileCtrl, FolderDialog,
  OleCtrls, SHDocVw, IdFTPServer,  IdFTPList,
  IdSocketHandle,
  idglobal,
  IdHashCRC, IdUDPBase, IdUDPServer, IdTrivialFTPServer,
  StrUtils, IdUDPClient, Spin,IdThread;

const
  PROGRAM_NAME = 'Firmware DownLoad';
  // 경고음 부분 추가
  CONTROLCNT = 16;
  TCPPort = 1461 + 10;
  nDelayTime = 200;
  BROADSERVERPORT = 5001;
  BROADCLIENTPORT = 1460;
  TCPCLIENTPORT = 1461;
type

  TFirmwareDownInfo = Record
    Version: string;    //Version
    FMM:     string;    //Flash Memory Map
    FSC:     String;    //Flash Start Command
    FWFN:    String;    //Flash Writer File Name
    FDFN:    String;    //Flash Data File Name
    CMDCODE: String;    //FX##(##:00 이거나 CMDCODE)
  end;

  TUser_Send = Record
    Edit      : TRzEdit;
    Func      : TRzEdit;
    Btn_Send  : TRzButton;
    Btn_Clear : TRzButton;
  end;

  TFinger_Send = Record
    FingFUNC       : TRzEdit;
    FingCMD        : TRzEdit;
    FingSTART      : TRzEdit;
    FingData1      : TRzEdit;
    FingData2      : TRzEdit;
    FingData3      : TRzEdit;
    FingData4      : TRzEdit;
    FingCheckSum   : TRzEdit;
    FingEND        : TRzEdit;
    Btn_Send       : TRzButton;
    Btn_Clear      : TRzButton;
  end;

  PNode   = ^TNode;
  TNode = record
    ConnectedIP:  String[20];
    Connected:    TDateTime;
    LastAction:   TDateTime;
    Thread:       Pointer;
    //SocketHandle: Integer;
    ReadData:     shortString;
    SendMsgNo:    Integer;
    RcvMsgNo:     Char;
  end;

  TRecevieAC_Data = Record
    DeviceID: String[9];
    aMsgCode: Char;
    aMsgCount: Char;
    aPosi:Char;
    aAddr:Char;
    aInOut: Char;
    aDate:string;
    aPositive: Char;
    aMode: Char;
    aControll: Char;
    aPermit: Char;
    aDoorStatus: Char;
    aAttend: Char;
    aIDNo_Companey: String[3];
    aIDNo_Resion: String[3];
    aIDNo_Cardtype: String[3];
    aIDNo_CardNo: String[6];
  end;

  TMainForm = class(TForm)
    RzStatusBar1: TRzStatusBar;
    Panel_ActiveClinetCount: TRzStatusPane;
    RzClockStatus1: TRzClockStatus;
    RzSplitter1: TRzSplitter;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzSplitter2: TRzSplitter;
    RzGroupBar1: TRzGroupBar;
    RzGroup1: TRzGroup;
    RzGroup2: TRzGroup;
    RzGroup3: TRzGroup;
    MainMenu1: TMainMenu;
    N6: TMenuItem;
    M_Close: TMenuItem;
    N1: TMenuItem;
    mn_FileLoad: TMenuItem;
    mn_FileSave: TMenuItem;
    LMDIniCtrl1: TLMDIniCtrl;
    RzGroup4: TRzGroup;
    WinsockPort: TApdWinsockPort;
    RXLight: TApdStatusLight;
    TXLight: TApdStatusLight;
    ApdSLController1: TApdSLController;
    Bevel1: TBevel;
    cbPolling: TRzCheckBox;
    RzSpinner1: TRzSpinner;
    Label22: TLabel;
    Polling_Timer: TTimer;
    RzCheckBox2: TRzCheckBox;
    Off_Timer: TTimer;
    RzSplitter3: TRzSplitter;
    RzPanel4: TRzPanel;
    RzLabel3: TRzLabel;
    RzLabel1: TRzLabel;
    Notebook1: TNotebook;
    Label300: TLabel;
    Edit_DeviceID: TEdit;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    Group_Device: TRzCheckGroup;
    RzBitBtn3: TRzBitBtn;
    btn_UseControlerSearch: TRzBitBtn;
    Group_AlarmDisplay: TRzCheckGroup;
    RzBitBtn22: TRzBitBtn;
    RzBitBtn23: TRzBitBtn;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label25: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    RzBitBtn9: TRzBitBtn;
    RzBitBtn10: TRzBitBtn;
    COmBoBox_Linktype1: TRzComboBox;
    ComboBox_OutType1: TRzComboBox;
    ComboBox_RenewTimer1: TRzComboBox;
    ComboBox_UseType1: TRzComboBox;
    RzSpinEdit2: TRzSpinEdit;
    CheckBox1: TCheckBox;
    Group_Relay: TRzRadioGroup;
    Label_CurentIp: TRzLabel;
    GroupBox1: TGroupBox;
    RzToolbar1: TRzToolbar;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    ImageList1: TImageList;
    DBISAMTable1: TDBISAMTable;
    DataSource1: TDataSource;
    DBISAMTable1SeqNo: TAutoIncField;
    DBISAMTable1EventTime: TDateTimeField;
    DBISAMTable1IP: TStringField;
    DBISAMTable1DeviceID: TStringField;
    DBISAMTable1DeviceNo: TStringField;
    DBISAMTable1Cmd: TStringField;
    DBISAMTable1Data: TStringField;
    DBISAMTable1FullData: TStringField;
    RzLabel2: TRzLabel;
    DBISAMTable1way: TStringField;
    RzGroup5: TRzGroup;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    ComboBox1: TComboBox;
    Label59: TLabel;
    ComboBox2: TComboBox;
    Label62: TLabel;
    Btn_RegDialInfo: TRzBitBtn;
    Btn_CheckDialInfo: TRzBitBtn;
    GroupBox5: TGroupBox;
    Label63: TLabel;
    RzSpinner2: TRzSpinner;
    Bevel3: TBevel;
    Btn_RegCalltime: TRzBitBtn;
    Btn_CheckCalltime: TRzBitBtn;
    Memo_CardNo: TMemo;
    Label64: TLabel;
    Btn_RegCardNo: TRzBitBtn;
    Btn_DelCardNo: TRzBitBtn;
    GroupBox6: TGroupBox;
    LMDListBox1: TLMDListBox;
    RzBitBtn25: TRzBitBtn;
    RzBitBtn26: TRzBitBtn;
    RzBitBtn28: TRzBitBtn;
    rg_ConType: TRzRadioGroup;
    CB_SerialComm: TLMDLabeledListComboBox;
    Edit2: TLMDLabeledEdit;
    Button1: TButton;
    RzBitBtn30: TRzBitBtn;
    RzBitBtn31: TRzBitBtn;
    LMDCaptionPanel1: TLMDCaptionPanel;
    ProgressBar3: TProgressBar;
    LMDSimpleLabel1: TLMDSimpleLabel;
    edRegTelNo1: TRzButtonEdit;
    edRegTelNo2: TRzButtonEdit;
    edRegTelNo3: TRzButtonEdit;
    edRegTelNo4: TRzButtonEdit;
    edRegTelNo5: TRzButtonEdit;
    edRegTelNo6: TRzButtonEdit;
    edRegTelNo7: TRzButtonEdit;
    edRegTelNo8: TRzButtonEdit;
    edRegTelNo9: TRzButtonEdit;
    RzLabel21: TRzLabel;
    RzLabel22: TRzLabel;
    RzLabel23: TRzLabel;
    RzLabel24: TRzLabel;
    RzLabel25: TRzLabel;
    RzLabel26: TRzLabel;
    RzLabel27: TRzLabel;
    RzLabel28: TRzLabel;
    RzLabel29: TRzLabel;
    GroupBox8: TGroupBox;
    btnRegVoicetime: TRzBitBtn;
    btnCheckVoicetime: TRzBitBtn;
    Label7: TLabel;
    RzSpinner3: TRzSpinner;
    Bevel4: TBevel;
    edTelNo1: TRzButtonEdit;
    edTelNo2: TRzButtonEdit;
    edTelNo3: TRzButtonEdit;
    edTelNo4: TRzButtonEdit;
    edTelNo5: TRzButtonEdit;
    edTelNo6: TRzButtonEdit;
    edTelNo7: TRzButtonEdit;
    edTelNo8: TRzButtonEdit;
    edTelNo9: TRzButtonEdit;
    RzLabel30: TRzLabel;
    RzLabel31: TRzLabel;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    RzLabel34: TRzLabel;
    RzLabel35: TRzLabel;
    RzLabel36: TRzLabel;
    RzLabel37: TRzLabel;
    RzLabel38: TRzLabel;
    cbVoiceDetect: TRzCheckBox;
    RzLabel39: TRzLabel;
    edRegTelNo0: TRzButtonEdit;
    RzLabel40: TRzLabel;
    edTelNo0: TRzButtonEdit;
    RzButton1: TRzButton;
    cbDisplayPolling: TRzCheckBox;
    GroupBox7: TGroupBox;
    LMDListBox2: TLMDListBox;
    Memo1: TMemo;
    Panel1: TPanel;
    Label12: TLabel;
    Btn_DelEventLog: TRzBitBtn;
    GroupBox9: TGroupBox;
    Label50: TLabel;
    Bevel5: TBevel;
    RzSpinner4: TRzSpinner;
    Btn_Regbroadcasttime: TRzBitBtn;
    Btn_Checkbroadcasttime: TRzBitBtn;
    Button2: TButton;
    RzLabel41: TRzLabel;
    Bevel6: TBevel;
    RzLabel42: TRzLabel;
    RzRadioGroup2: TRzRadioGroup;
    RzDateTimePicker1: TRzDateTimePicker;
    RzDateTimePicker2: TRzDateTimePicker;
    ListBox_DownLoadInfo: TRzListBox;
    LMDIniCtrl2: TLMDIniCtrl;
    cb_Download: TCheckBox;
    Button3: TButton;
    GroupBox10: TGroupBox;
    RzLabel43: TRzLabel;
    RzLabel44: TRzLabel;
    RzLabel45: TRzLabel;
    RzLabel46: TRzLabel;
    RzLabel47: TRzLabel;
    edLinkusTel0: TEdit;
    edLinkusTel1: TEdit;
    edLinkusTel2: TEdit;
    edLinkusTel3: TEdit;
    edLinkusTel4: TEdit;
    btnRegLinkusTel0: TRzBitBtn;
    btnCheckLinkusTel0: TRzBitBtn;
    btnRegLinkusTel1: TRzBitBtn;
    btnCheckLinkusTel1: TRzBitBtn;
    btnRegLinkusTel2: TRzBitBtn;
    btnCheckLinkusTel2: TRzBitBtn;
    btnRegLinkusTel3: TRzBitBtn;
    btnCheckLinkusTel3: TRzBitBtn;
    btnRegLinkusTel4: TRzBitBtn;
    btnCheckLinkusTel4: TRzBitBtn;
    GroupBox11: TGroupBox;
    Label75: TLabel;
    Bevel7: TBevel;
    btnRegPtTime: TRzBitBtn;
    btnCheckPtTime: TRzBitBtn;
    edPtTime: TEdit;
    RadioGroup_Mode: TRzRadioGroup;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    GroupBox12: TGroupBox;
    Bevel8: TBevel;
    btnRegPtDelayTime: TRzBitBtn;
    btnCheckPtDelayTime: TRzBitBtn;
    edPtDelayTime: TEdit;
    GroupBox13: TGroupBox;
    Label79: TLabel;
    Btn_RegRingCount: TRzBitBtn;
    Btn_CheckRingCount: TRzBitBtn;
    RzOpenDialog1: TOpenDialog;
    Label80: TLabel;
    Memo2: TMemo;
    Label74: TLabel;
    Btn_CheckCardNo: TRzBitBtn;
    ClientSocket1: TClientSocket;
    RzFieldStatus1: TRzFieldStatus;
    WiznetTimer: TTimer;
    CB_IPList: TLMDLabeledListComboBox;
    RzButton2: TRzButton;
    ReconnectSocketTimer: TTimer;
    LMDStopWatch1: TLMDStopWatch;
    RxDBGrid1: TRxDBGrid;
    RzSaveDialog1: TSaveDialog;
    AdVT100Emulator1: TAdVT100Emulator;
    cbAutoReg: TRzCheckBox;
    Label88: TLabel;
    cb_Reader: TComboBox;
    DLRadioGroup: TLMDRadioGroup;
    DLCodeEdit: TLMDEdit;
    DLCheckBox: TLMDCheckBox;
    CardNoPopupMenu: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Btn_DelCardNoBtn_DelAllCardNo: TRzBitBtn;
    edFfNo: TEdit;
    rgCmdFilter: TRzRadioGroup;
    edFilter: TEdit;
    RzBitBtn27: TRzBitBtn;
    cbFinterNo: TRzCheckBox;
    Label92: TLabel;
    RzButton3: TRzButton;
    RzButton4: TRzButton;
    rgDeviceNo: TRzRadioGroup;
    Group_DeviceBase: TRzCheckGroup;
    rgNoAckFilter: TRzRadioGroup;
    Edit1: TEdit;
    GroupBox16: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label2: TLabel;
    Label76: TLabel;
    Label87: TLabel;
    ComboBox_WatchPowerOff: TRzComboBox;
    SpinEdit_OutDelay: TRzSpinEdit;
    ComboBox_DeviceType: TRzComboBox;
    RzBitBtn7: TRzBitBtn;
    RzBitBtn8: TRzBitBtn;
    ComboBox_DoorType1: TRzComboBox;
    ComboBox_DoorType2: TRzComboBox;
    Edit_Locate: TEdit;
    SpinEdit_InDelay: TRzSpinEdit;
    ComboBox_ComLikus: TRzComboBox;
    GroupBox17: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label35: TLabel;
    ComBoBox_UseCardReader: TRzComboBox;
    ComBoBox_DoorNo: TRzComboBox;
    Edit_CRLocatge: TEdit;
    RzBitBtn5: TRzBitBtn;
    RzBitBtn6: TRzBitBtn;
    ComBoBox_InOutCR: TRzComboBox;
    ComboBox_Zone1: TRzComboBox;
    Group_CardReader: TRzRadioGroup;
    btnCheckCdVer: TRzBitBtn;
    Label17: TLabel;
    RzBitBtn24: TRzBitBtn;
    RzBitBtn42: TRzBitBtn;
    Label95: TLabel;
    rgSchDoorNo: TRadioGroup;
    Label96: TLabel;
    rgSchCode: TRadioGroup;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    edSch1: TEdit;
    edSch2: TEdit;
    edSch3: TEdit;
    edSch4: TEdit;
    edSch5: TEdit;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    edFood1: TEdit;
    edFood2: TEdit;
    edFood3: TEdit;
    edFood4: TEdit;
    RzBitBtn43: TRzBitBtn;
    RzBitBtn44: TRzBitBtn;
    miSound: TMenuItem;
    GroupBox19: TGroupBox;
    edComp1: TRzEdit;
    Label109: TLabel;
    Label110: TLabel;
    edComp2: TRzEdit;
    Label111: TLabel;
    edComp3: TRzEdit;
    Label112: TLabel;
    edComp4: TRzEdit;
    Label113: TLabel;
    edComp5: TRzEdit;
    Label114: TLabel;
    edComp6: TRzEdit;
    Label115: TLabel;
    edComp7: TRzEdit;
    Label116: TLabel;
    edComp8: TRzEdit;
    Label117: TLabel;
    edComp9: TRzEdit;
    check1: TCheckBox;
    check2: TCheckBox;
    check3: TCheckBox;
    check4: TCheckBox;
    check5: TCheckBox;
    check6: TCheckBox;
    check7: TCheckBox;
    check8: TCheckBox;
    check9: TCheckBox;
    Label118: TLabel;
    check10: TCheckBox;
    edComp10: TRzEdit;
    Label119: TLabel;
    check11: TCheckBox;
    edComp11: TRzEdit;
    Label120: TLabel;
    check12: TCheckBox;
    edComp12: TRzEdit;
    Label121: TLabel;
    check13: TCheckBox;
    edComp13: TRzEdit;
    Label122: TLabel;
    check14: TCheckBox;
    edComp14: TRzEdit;
    Label123: TLabel;
    check15: TCheckBox;
    edComp15: TRzEdit;
    Label126: TLabel;
    check16: TCheckBox;
    edComp16: TRzEdit;
    btWav1: TRzBitBtn;
    btWav2: TRzBitBtn;
    btWav4: TRzBitBtn;
    btWav3: TRzBitBtn;
    btWav5: TRzBitBtn;
    btWav6: TRzBitBtn;
    btWav7: TRzBitBtn;
    btWav8: TRzBitBtn;
    btWav9: TRzBitBtn;
    btWav10: TRzBitBtn;
    btWav11: TRzBitBtn;
    btWav12: TRzBitBtn;
    btWav13: TRzBitBtn;
    btWav14: TRzBitBtn;
    btWav15: TRzBitBtn;
    btPlay1: TRzBitBtn;
    btPlay2: TRzBitBtn;
    btPlay3: TRzBitBtn;
    btPlay4: TRzBitBtn;
    btPlay5: TRzBitBtn;
    btPlay6: TRzBitBtn;
    btPlay7: TRzBitBtn;
    btPlay8: TRzBitBtn;
    btPlay9: TRzBitBtn;
    btPlay10: TRzBitBtn;
    btPlay11: TRzBitBtn;
    btPlay12: TRzBitBtn;
    btPlay13: TRzBitBtn;
    btPlay14: TRzBitBtn;
    btPlay15: TRzBitBtn;
    edFile1: TEdit;
    edFile2: TEdit;
    edFile3: TEdit;
    edFile4: TEdit;
    edFile5: TEdit;
    edFile6: TEdit;
    edFile7: TEdit;
    edFile8: TEdit;
    edFile9: TEdit;
    edFile10: TEdit;
    edFile11: TEdit;
    edFile12: TEdit;
    edFile13: TEdit;
    edFile14: TEdit;
    edFile15: TEdit;
    btAllClear: TBitBtn;
    btSelectClear: TBitBtn;
    MediaPlayer1: TMediaPlayer;
    GroupBox20: TGroupBox;
    lblCard: TLabel;
    rdSelectCardNo: TRadioGroup;
    bt_Broad: TBitBtn;
    edCard: TRzEdit;
    btBroadFile: TBitBtn;
    Group_BroadDevice: TRzCheckGroup;
    btn_CardBroadControlsearch: TRzBitBtn;
    Group_BroadDeviceBase: TRzCheckGroup;
    lbState: TLabel;
    btBroadFileSet: TRzBitBtn;
    chk_BroadFile: TCheckBox;
    Label124: TLabel;
    btCaptureSave: TRzBitBtn;
    edBroadFileSave: TEdit;
    edBRFileLoad: TEdit;
    GroupBox21: TGroupBox;
    Label125: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    cbRegCode: TComboBox;
    rdMsgCode: TRadioGroup;
    cbCardAdmin: TComboBox;
    cbMasterMode: TComboBox;
    cbInOut: TComboBox;
    btBroadStop: TBitBtn;
    rdMaster: TRadioGroup;
    BroadTimer: TTimer;
    broadStopTimer: TTimer;
    lb_start: TLabel;
    lb_end: TLabel;
    lb_Timestat: TLabel;
    btExe1: TRzBitBtn;
    edExe1: TEdit;
    btExe2: TRzBitBtn;
    btExe3: TRzBitBtn;
    btExe4: TRzBitBtn;
    btExe5: TRzBitBtn;
    btExe6: TRzBitBtn;
    btExe7: TRzBitBtn;
    btExe8: TRzBitBtn;
    btExe9: TRzBitBtn;
    btExe10: TRzBitBtn;
    btExe11: TRzBitBtn;
    btExe12: TRzBitBtn;
    btExe13: TRzBitBtn;
    btExe14: TRzBitBtn;
    btExe15: TRzBitBtn;
    edExe2: TEdit;
    edExe3: TEdit;
    edExe4: TEdit;
    edExe5: TEdit;
    edExe6: TEdit;
    edExe7: TEdit;
    edExe8: TEdit;
    edExe9: TEdit;
    edExe10: TEdit;
    edExe11: TEdit;
    edExe12: TEdit;
    edExe13: TEdit;
    edExe14: TEdit;
    edExe15: TEdit;
    rd_UseCardReader: TRadioGroup;
    rd_InOutCR: TRadioGroup;
    rd_DoorNo: TRadioGroup;
    GroupBox22: TGroupBox;
    edYYYY: TEdit;
    Label132: TLabel;
    edMM: TEdit;
    Label133: TLabel;
    edDD: TEdit;
    Label134: TLabel;
    ck_YYMMDD: TCheckBox;
    Label131: TLabel;
    btBroadRetry: TBitBtn;
    rdMode: TRadioGroup;
    Group_BroadDownLoad: TRzCheckGroup;
    btn_BroadControlsearch: TRzBitBtn;
    GroupBox23: TGroupBox;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Group_BroadDownLoadBase: TRzCheckGroup;
    BroadSleep_Timer: TTimer;
    GroupBox24: TGroupBox;
    RzBitBtn20: TRzBitBtn;
    RzBitBtn21: TRzBitBtn;
    btBroadFileRetry: TRzBitBtn;
    rdInOutMode: TRadioGroup;
    rdCardAuth: TRadioGroup;
    rdRegCode: TRadioGroup;
    btCardReg: TRzBitBtn;
    RzButtonEdit1: TEdit;
    BitBtn1: TBitBtn;
    chk_Notupgrade: TCheckBox;
    Label135: TLabel;
    ComBoBox_Building: TRzComboBox;
    Label56: TLabel;
    cb_CardType: TRzComboBox;
    RichEdit1: TRichEdit;
    btWav16: TRzBitBtn;
    btPlay16: TRzBitBtn;
    btExe16: TRzBitBtn;
    edExe16: TEdit;
    edFile16: TEdit;
    bt_CardDelete: TRzBitBtn;
    RzBitBtn48: TRzBitBtn;
    RzBitBtn49: TRzBitBtn;
    RzBitBtn50: TRzBitBtn;
    RzBitBtn51: TRzBitBtn;
    RzBitBtn52: TRzBitBtn;
    Label136: TLabel;
    GroupBox25: TGroupBox;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    cmb_ControlOnTime: TComboBox;
    cmb_ControlOffTime: TComboBox;
    btn_ControlReg: TRzBitBtn;
    btn_ControlSearch: TRzBitBtn;
    Label141: TLabel;
    Label142: TLabel;
    chk_FastSave: TCheckBox;
    chk_SendTime: TCheckBox;
    ed_SendTime: TEdit;
    Label143: TLabel;
    btn_CardDownLoadStop: TRzBitBtn;
    GroupBox26: TGroupBox;
    ed_SortMin: TEdit;
    Label144: TLabel;
    btn_Sort: TButton;
    btn_SortDisp: TButton;
    ed_SortDisp: TEdit;
    Label145: TLabel;
    ed_DeviceCode: TEdit;
    Label146: TLabel;
    ed_SendSize: TEdit;
    RzBitBtn53: TRzBitBtn;
    chk_Hex: TRzCheckBox;
    Button4: TButton;
    chk_CmdX: TCheckBox;
    chk_BinDown: TCheckBox;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    RzLabel19: TRzLabel;
    RzEdit1: TRzEdit;
    Checkbox_Debugmode: TRzCheckBox;
    RzLabel20: TRzLabel;
    RzEdit2: TRzEdit;
    RzGroupBox7: TRzGroupBox;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    Edit_LocalIP: TRzEdit;
    Edit_Sunnet: TRzEdit;
    Edit_Gateway: TRzEdit;
    Edit_LocalPort: TRzEdit;
    RzGroupBox8: TRzGroupBox;
    RzLabel8: TRzLabel;
    RzLabel10: TRzLabel;
    Edit_ServerIp: TRzEdit;
    Edit_Serverport: TRzEdit;
    Checkbox_Client: TRzCheckBox;
    RadioModeClient: TRadioButton;
    RadioModeServer: TRadioButton;
    RadioModeMixed: TRadioButton;
    GroupMAc: TRzGroupBox;
    editMAC1: TRzEdit;
    editMAC2: TRzEdit;
    editMAC3: TRzEdit;
    editMAC4: TRzEdit;
    editMAC5: TRzEdit;
    editMAC6: TRzEdit;
    btnRegMAC: TRzBitBtn;
    RzBitBtn40: TRzBitBtn;
    RzGroupBox9: TRzGroupBox;
    RzLabel9: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    ComboBox_Boad: TRzComboBox;
    ComboBox_Databit: TRzComboBox;
    ComboBox_Parity: TRzComboBox;
    ComboBox_Stopbit: TRzComboBox;
    ComboBox_Flow: TRzComboBox;
    RzGroupBox10: TRzGroupBox;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    Edit_Time: TRzEdit;
    Edit_Size: TRzEdit;
    Edit_Char: TRzEdit;
    Edit_Idle: TRzEdit;
    btnCheckLan: TRzBitBtn;
    RzBitBtn32: TRzBitBtn;
    RzGroupBox4: TRzGroupBox;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    ed_ip: TEdit;
    ed_port: TEdit;
    ed_Subnet: TEdit;
    ed_GateWay: TEdit;
    rg_NM: TRadioGroup;
    ed_Serverip: TEdit;
    ed_ServerPort: TEdit;
    ed_AVServerIP: TEdit;
    ed_AVServerPort: TEdit;
    ed_UserAVIP: TEdit;
    ed_UserAVPort: TEdit;
    ed_Constate: TEdit;
    ed_Connect: TEdit;
    rg_Dhcp: TRadioGroup;
    chk_Local: TCheckBox;
    ed_LocalIP: TEdit;
    ed_LocalPort: TEdit;
    rg_LocalNM: TRadioGroup;
    ed_LocalSubnet: TEdit;
    ed_LocalGateWay: TEdit;
    ed_LocalServerPort: TEdit;
    ed_LocalServerIP: TEdit;
    rg_Debug: TRadioGroup;
    ed_LocalConnect: TEdit;
    ed_LocalConState: TEdit;
    rg_LocalDhcp: TRadioGroup;
    ed_Version: TEdit;
    btnKTLanSet: TButton;
    btnKTLanSearch: TButton;
    KTWinsock: TApdWinsockPort;
    Label164: TLabel;
    ed_Mac: TEdit;
    ed_LocalMac: TEdit;
    Label165: TLabel;
    RzBitBtn58: TRzBitBtn;
    RzBitBtn59: TRzBitBtn;
    RzButton5: TRzButton;
    RzButton6: TRzButton;
    GroupBox29: TGroupBox;
    edLinkusTel00: TEdit;
    RzBitBtn60: TRzBitBtn;
    btmCheckLinkusTeL0: TRzBitBtn;
    Label73: TLabel;
    Edit_LinkusID: TEdit;
    btmRegLinkusID: TRzBitBtn;
    btmCheckLinkusID: TRzBitBtn;
    Label166: TLabel;
    RzBitBtn4: TRzBitBtn;
    RzBitBtn45: TRzBitBtn;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    btnRegisterClear: TRzBitBtn;
    Btn_SyncTime: TRzBitBtn;
    Edit_TimeSync: TRzEdit;
    btn_Timecheck: TRzBitBtn;
    RzBitBtn13: TRzBitBtn;
    Edit_Ver: TRzEdit;
    RzBitBtn14: TRzBitBtn;
    Edit_Reset: TRzEdit;
    RzBitBtn15: TRzBitBtn;
    GroupBox28: TGroupBox;
    RzBitBtn55: TRzBitBtn;
    RzBitBtn56: TRzBitBtn;
    RzBitBtn57: TRzBitBtn;
    ComboBox_Zone: TRzComboBox;
    Label44: TLabel;
    RzComboBox1: TRzComboBox;
    Label43: TLabel;
    RzBitBtn16: TRzBitBtn;
    RzComboBox2: TRzComboBox;
    RzSpinEdit3: TRzSpinEdit;
    Label45: TLabel;
    Edit_Random: TRzEdit;
    RzBitBtn29: TRzBitBtn;
    RzBitBtn34: TRzBitBtn;
    RzBitBtn35: TRzBitBtn;
    RzBitBtn36: TRzBitBtn;
    RzBitBtn37: TRzBitBtn;
    Label65: TLabel;
    cb_RelayNo: TRzComboBox;
    cb_RelayOnOff: TRzComboBox;
    cb_RelayTIme: TRzComboBox;
    RzBitBtn38: TRzBitBtn;
    RzBitBtn33: TRzBitBtn;
    Label89: TLabel;
    RzSpinEdit1: TRzSpinEdit;
    Label91: TLabel;
    Label90: TLabel;
    edPhoneNo: TEdit;
    CheckBox2: TCheckBox;
    btn_Cuerrent: TRzBitBtn;
    RzBitBtn17: TRzBitBtn;
    Edit_CMD1: TEdit;
    GroupBox18: TGroupBox;
    gbDoorNo3: TRadioGroup;
    RzGroupBox3: TRzGroupBox;
    Btn_RDoorOPen: TRzBitBtn;
    Btn_RDoorClose: TRzBitBtn;
    TabSheet6: TTabSheet;
    GroupBox30: TGroupBox;
    GroupBox31: TGroupBox;
    btn_ResetReg: TRzBitBtn;
    btn_ResetSearch: TRzBitBtn;
    chk_Reset: TCheckBox;
    Label78: TLabel;
    ed_ResetMin: TEdit;
    Label167: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    Label170: TLabel;
    ed_firstResetTime: TEdit;
    ed_LastResetTime: TEdit;
    ed_AvrResetTime: TEdit;
    ed_TotResetCnt: TEdit;
    Label171: TLabel;
    Label172: TLabel;
    btn_ResetClear: TRzBitBtn;
    RzBitBtn61: TRzBitBtn;
    Edit_Reset2: TRzEdit;
    RzBitBtn62: TRzBitBtn;
    RzBitBtn63: TRzBitBtn;
    Edit_TimeSync2: TRzEdit;
    RzBitBtn64: TRzBitBtn;
    ed_resetDay: TEdit;
    ed_ResetHour: TEdit;
    Label173: TLabel;
    Label174: TLabel;
    ed_fresetDay: TEdit;
    Label175: TLabel;
    ed_fResetHour: TEdit;
    Label176: TLabel;
    N2: TMenuItem;
    Label177: TLabel;
    btnTempSave: TRzBitBtn;
    btnTempRestore: TRzBitBtn;
    GroupBox32: TGroupBox;
    btnTempSave1: TRzBitBtn;
    btnTempRestore2: TRzBitBtn;
    rg_regReset: TRadioGroup;
    GroupBox34: TGroupBox;
    GroupBox35: TGroupBox;
    RzBitBtn65: TRzBitBtn;
    RzBitBtn66: TRzBitBtn;
    RzBitBtn67: TRzBitBtn;
    RzBitBtn68: TRzBitBtn;
    RzBitBtn69: TRzBitBtn;
    PageControl3: TPageControl;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    GroupBox33: TGroupBox;
    Label178: TLabel;
    Label179: TLabel;
    Label180: TLabel;
    Label181: TLabel;
    Label182: TLabel;
    Label184: TLabel;
    ComBoBox_DoorNo1: TRzComboBox;
    Edit_CRLocatge1: TEdit;
    RzBitBtn70: TRzBitBtn;
    ComBoBox_InOutCR1: TRzComboBox;
    RzComboBox6: TRzComboBox;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    ComBoBox_Building1: TRzComboBox;
    ComBoBox_UseCardReader1: TRzComboBox;
    GroupBox43: TGroupBox;
    Label234: TLabel;
    Label235: TLabel;
    Label236: TLabel;
    Label237: TLabel;
    Label238: TLabel;
    Label239: TLabel;
    Label240: TLabel;
    Label241: TLabel;
    Label242: TLabel;
    Label243: TLabel;
    Label244: TLabel;
    Label245: TLabel;
    Label246: TLabel;
    Label248: TLabel;
    Label249: TLabel;
    ComboBox_CardModeType1: TRzComboBox;
    ComboBox_DoorModeType1: TRzComboBox;
    RzSpinEdit6: TRzSpinEdit;
    RzSpinEdit7: TRzSpinEdit;
    ComboBox_UseSch1: TRzComboBox;
    ComboBox_SendDoorStatus1: TRzComboBox;
    ComboBox_UseCommOff1: TRzComboBox;
    ComboBox_AlarmLongOpen1: TRzComboBox;
    ComboBox_AlramCommoff1: TRzComboBox;
    ComboBox_LockType1: TRzComboBox;
    ComboBox_ControlFire1: TRzComboBox;
    RzBitBtn78: TRzBitBtn;
    ComboBox_AntiPass1: TRzComboBox;
    ComboBox_CheckDSLS1: TRzComboBox;
    ed_DoorControlTime1: TEdit;
    GroupBox45: TGroupBox;
    Label266: TLabel;
    Edit_PTStatus1: TEdit;
    ComboBox_WatchType1: TRzComboBox;
    Label267: TLabel;
    Label268: TLabel;
    ComboBox_AlarmType1: TRzComboBox;
    ComboBox_recover1: TRzComboBox;
    Label269: TLabel;
    Label270: TLabel;
    ComboBox_Delay1: TRzComboBox;
    Edit_PTLocate1: TEdit;
    Label271: TLabel;
    Label272: TLabel;
    Edit_PTZoneNo1: TEdit;
    ComboBox_DetectTime1: TRzComboBox;
    Label273: TLabel;
    btn_PortLoopReg: TRzBitBtn;
    Edit_PTStatus2: TEdit;
    ComboBox_WatchType2: TRzComboBox;
    ComboBox_AlarmType2: TRzComboBox;
    ComboBox_recover2: TRzComboBox;
    ComboBox_Delay2: TRzComboBox;
    Edit_PTLocate2: TEdit;
    Edit_PTZoneNo2: TEdit;
    ComboBox_DetectTime2: TRzComboBox;
    Edit_PTStatus3: TEdit;
    ComboBox_WatchType3: TRzComboBox;
    ComboBox_AlarmType3: TRzComboBox;
    ComboBox_recover3: TRzComboBox;
    ComboBox_Delay3: TRzComboBox;
    Edit_PTLocate3: TEdit;
    Edit_PTZoneNo3: TEdit;
    ComboBox_DetectTime3: TRzComboBox;
    Edit_PTStatus4: TEdit;
    ComboBox_WatchType4: TRzComboBox;
    ComboBox_AlarmType4: TRzComboBox;
    ComboBox_recover4: TRzComboBox;
    ComboBox_Delay4: TRzComboBox;
    Edit_PTLocate4: TEdit;
    Edit_PTZoneNo4: TEdit;
    ComboBox_DetectTime4: TRzComboBox;
    Edit_PTStatus5: TEdit;
    ComboBox_WatchType5: TRzComboBox;
    ComboBox_AlarmType5: TRzComboBox;
    ComboBox_recover5: TRzComboBox;
    ComboBox_Delay5: TRzComboBox;
    Edit_PTLocate5: TEdit;
    Edit_PTZoneNo5: TEdit;
    ComboBox_DetectTime5: TRzComboBox;
    Edit_PTStatus6: TEdit;
    ComboBox_WatchType6: TRzComboBox;
    ComboBox_AlarmType6: TRzComboBox;
    ComboBox_recover6: TRzComboBox;
    ComboBox_Delay6: TRzComboBox;
    Edit_PTLocate6: TEdit;
    Edit_PTZoneNo6: TEdit;
    ComboBox_DetectTime6: TRzComboBox;
    Edit_PTStatus7: TEdit;
    ComboBox_WatchType7: TRzComboBox;
    ComboBox_AlarmType7: TRzComboBox;
    ComboBox_recover7: TRzComboBox;
    ComboBox_Delay7: TRzComboBox;
    Edit_PTLocate7: TEdit;
    Edit_PTZoneNo7: TEdit;
    ComboBox_DetectTime7: TRzComboBox;
    Edit_PTStatus8: TEdit;
    ComboBox_WatchType8: TRzComboBox;
    ComboBox_AlarmType8: TRzComboBox;
    ComboBox_recover8: TRzComboBox;
    ComboBox_Delay8: TRzComboBox;
    Edit_PTLocate8: TEdit;
    Edit_PTZoneNo8: TEdit;
    ComboBox_DetectTime8: TRzComboBox;
    ComboBox_CardModeType2: TRzComboBox;
    ComboBox_DoorModeType2: TRzComboBox;
    ed_DoorControlTime2: TEdit;
    RzSpinEdit8: TRzSpinEdit;
    RzSpinEdit9: TRzSpinEdit;
    Label255: TLabel;
    Label253: TLabel;
    ComboBox_UseSch2: TRzComboBox;
    ComboBox_SendDoorStatus2: TRzComboBox;
    ComboBox_AntiPass2: TRzComboBox;
    ComboBox_UseCommOff2: TRzComboBox;
    ComboBox_AlramCommoff2: TRzComboBox;
    ComboBox_AlarmLongOpen2: TRzComboBox;
    ComboBox_LockType2: TRzComboBox;
    ComboBox_ControlFire2: TRzComboBox;
    ComboBox_CheckDSLS2: TRzComboBox;
    ComBoBox_UseCardReader2: TRzComboBox;
    ComBoBox_InOutCR2: TRzComboBox;
    ComBoBox_Building2: TRzComboBox;
    ComBoBox_DoorNo2: TRzComboBox;
    Edit_CRLocatge2: TEdit;
    ComBoBox_UseCardReader3: TRzComboBox;
    ComBoBox_InOutCR3: TRzComboBox;
    ComBoBox_Building3: TRzComboBox;
    ComBoBox_DoorNo3: TRzComboBox;
    Edit_CRLocatge3: TEdit;
    ComBoBox_UseCardReader4: TRzComboBox;
    ComBoBox_InOutCR4: TRzComboBox;
    ComBoBox_Building4: TRzComboBox;
    ComBoBox_DoorNo4: TRzComboBox;
    Edit_CRLocatge4: TEdit;
    ComBoBox_UseCardReader5: TRzComboBox;
    ComBoBox_InOutCR5: TRzComboBox;
    ComBoBox_Building5: TRzComboBox;
    ComBoBox_DoorNo5: TRzComboBox;
    Edit_CRLocatge5: TEdit;
    ComBoBox_UseCardReader6: TRzComboBox;
    ComBoBox_InOutCR6: TRzComboBox;
    ComBoBox_Building6: TRzComboBox;
    ComBoBox_DoorNo6: TRzComboBox;
    Edit_CRLocatge6: TEdit;
    ComBoBox_UseCardReader7: TRzComboBox;
    ComBoBox_InOutCR7: TRzComboBox;
    ComBoBox_Building7: TRzComboBox;
    ComBoBox_DoorNo7: TRzComboBox;
    Edit_CRLocatge7: TEdit;
    ComBoBox_UseCardReader8: TRzComboBox;
    ComBoBox_InOutCR8: TRzComboBox;
    ComBoBox_Building8: TRzComboBox;
    ComBoBox_DoorNo8: TRzComboBox;
    Edit_CRLocatge8: TEdit;
    ed_Recoverid: TEdit;
    GroupBox36: TGroupBox;
    RzBitBtn71: TRzBitBtn;
    RzBitBtn72: TRzBitBtn;
    chk_DeviceInfoSave: TCheckBox;
    GroupBox37: TGroupBox;
    btnPtMoniStart: TRzBitBtn;
    btnPtMoniStop: TRzBitBtn;
    btnPtMoniStat: TRzBitBtn;
    ed_PtMonstartmin: TEdit;
    Label183: TLabel;
    stPTstate: TStaticText;
    GroupBox38: TGroupBox;
    ListPtMonitor: TRzListBox;
    btnPTMoniterLine: TRzBitBtn;
    btnPTmonitorClear: TRzBitBtn;
    Label186: TLabel;
    lbl_PtMonitor: TStaticText;
    cmb_DoorControlTime1: TComboBox;
    cmb_DoorControlTime2: TComboBox;
    FileCtrl: TLMDFileCtrl;
    RzSpacer2: TRzSpacer;
    Label185: TLabel;
    cmb_WCardBit: TRzComboBox;
    TabVTimer: TTimer;
    RzBitBtn73: TRzBitBtn;
    ck_Log: TCheckBox;
    RzToolButton3: TRzToolButton;
    RzSpacer1: TRzSpacer;
    ed_DeviceNO: TRzEdit;
    tbVersion: TRzToolButton;
    Edit_TopRomVer: TRzEdit;
    tbDeviceCode: TRzToolButton;
    edDeviceCode: TRzEdit;
    chk_AD: TCheckBox;
    btnTempRestore3: TRzBitBtn;
    btnTempSave3: TRzBitBtn;
    GroupBox39: TGroupBox;
    Label187: TLabel;
    ed_ftpip: TEdit;
    ed_ftpport: TEdit;
    Label188: TLabel;
    ed_ftpuserid: TEdit;
    ed_ftpuserpw: TEdit;
    Label189: TLabel;
    Label190: TLabel;
    Label191: TLabel;
    ed_ftpdir: TEdit;
    ed_ftpfilename: TEdit;
    Label192: TLabel;
    Label193: TLabel;
    ed_ftpfilesize: TEdit;
    btn_regftp: TRzBitBtn;
    btn_FtpFilesearch: TSpeedButton;
    ed_ftplocalFile: TEdit;
    btn_FTPRoot: TSpeedButton;
    FolderDialog1: TFolderDialog;
    btn_GetIP: TSpeedButton;
    GroupBox40: TGroupBox;
    WebBrowser1: TWebBrowser;
    C1: TMenuItem;
    R1: TMenuItem;
    GroupBox41: TGroupBox;
    Label194: TLabel;
    Label196: TLabel;
    ed_ftplocaluser: TEdit;
    Label197: TLabel;
    ed_ftplocalpw: TEdit;
    Label198: TLabel;
    ed_localftpRoot: TEdit;
    Label199: TLabel;
    ed_ftpSendFilename: TEdit;
    btn_ftpSendFilesearch: TSpeedButton;
    ed_ftpsendFile: TEdit;
    Label200: TLabel;
    ed_ftpsendfilesize: TEdit;
    btn_FtpSend: TRzBitBtn;
    rg_ftpsendgubun: TRadioGroup;
    IdFTPServer: TIdFTPServer;
    GroupBox42: TGroupBox;
    ListPtMonitor2: TRzListBox;
    btnPTMoniterLine2: TRzBitBtn;
    btnPTmonitorClear2: TRzBitBtn;
    btn_ftpStop: TRzBitBtn;
    RzBitBtn75: TRzBitBtn;
    chk_FTPMonitoring: TCheckBox;
    ftpGauge: TGauge;
    chk_Gauge: TCheckBox;
    S1: TMenuItem;
    N17: TMenuItem;
    B1: TMenuItem;
    GroupBox44: TGroupBox;
    Label201: TLabel;
    ed_ftpSendFilename1: TEdit;
    btn_ftpSendFilesearch1: TSpeedButton;
    chk_FTPMonitoring1: TCheckBox;
    chk_Gauge1: TCheckBox;
    rg_ftpsendgubun1: TRadioGroup;
    btn_FtpSend1: TRzBitBtn;
    btn_ftpStop1: TRzBitBtn;
    ftpGauge1: TGauge;
    ed_ftpsendFile1: TEdit;
    ed_ftpsendfilesize1: TEdit;
    ed_localftproot1: TEdit;
    GroupBox46: TGroupBox;
    Label202: TLabel;
    ed_ftpSendFilename2: TEdit;
    btn_ftpSendFilesearch2: TSpeedButton;
    chk_FTPMonitoring2: TCheckBox;
    chk_Gauge2: TCheckBox;
    ed_ftpsendFile2: TEdit;
    ed_ftpsendfilesize2: TEdit;
    ed_localftproot2: TEdit;
    btn_FtpSend2: TRzBitBtn;
    RzBitBtn76: TRzBitBtn;
    rg_ftpsendgubun2: TRadioGroup;
    ed_ftplocalport: TEdit;
    Label195: TLabel;
    cmb_ftplocalport: TComboBox;
    RzBitBtn74: TRzBitBtn;
    pn_Gauge: TPanel;
    btn_Play: TSpeedButton;
    btn_Moment: TSpeedButton;
    btn_Stop: TSpeedButton;
    Gauge1: TGauge;
    cmb_Multi: TComboBox;
    btn_FilePlay: TButton;
    btn_FileStop: TButton;
    btn_FileSkip: TButton;
    PageControl4: TPageControl;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    Group_Port: TRzRadioGroup;
    Label28: TLabel;
    Edit_PTStatus: TEdit;
    Label29: TLabel;
    ComboBox_WatchType: TRzComboBox;
    Label30: TLabel;
    ComboBox_AlarmType: TRzComboBox;
    Label31: TLabel;
    ComboBox_recover: TRzComboBox;
    Label32: TLabel;
    ComboBox_Delay: TRzComboBox;
    Label34: TLabel;
    Edit_PTLocate: TEdit;
    Label33: TLabel;
    Edit_PTZoneNo: TEdit;
    Label77: TLabel;
    ComboBox_DetectTime: TRzComboBox;
    RzBitBtn11: TRzBitBtn;
    RzBitBtn12: TRzBitBtn;
    Label5: TLabel;
    Port_Out1: TRzCheckGroup;
    Port_Out2: TRzCheckGroup;
    Port_Out3: TRzCheckGroup;
    Port_Out4: TRzCheckGroup;
    Port_Door1: TRzCheckGroup;
    Port_Door2: TRzCheckGroup;
    Label6: TLabel;
    M_Port_Out1: TRzCheckGroup;
    M_Port_Out2: TRzCheckGroup;
    M_Port_Out3: TRzCheckGroup;
    M_Port_Out4: TRzCheckGroup;
    rg_zoneExNum: TRzRadioGroup;
    GroupBox47: TGroupBox;
    Label203: TLabel;
    Edit_ZoneStatus1: TEdit;
    Cmb_ZoneWatchType1: TRzComboBox;
    Label204: TLabel;
    GroupBox48: TGroupBox;
    Label205: TLabel;
    Label206: TLabel;
    Edit_ZoneStatus2: TEdit;
    GroupBox49: TGroupBox;
    Label207: TLabel;
    Label208: TLabel;
    Edit_ZoneStatus3: TEdit;
    GroupBox50: TGroupBox;
    Label209: TLabel;
    Label210: TLabel;
    Edit_ZoneStatus4: TEdit;
    GroupBox51: TGroupBox;
    Label211: TLabel;
    Label212: TLabel;
    Edit_ZoneStatus5: TEdit;
    GroupBox52: TGroupBox;
    Label213: TLabel;
    Label214: TLabel;
    Edit_ZoneStatus6: TEdit;
    GroupBox53: TGroupBox;
    Label215: TLabel;
    Label216: TLabel;
    Edit_ZoneStatus7: TEdit;
    GroupBox54: TGroupBox;
    Label217: TLabel;
    Label218: TLabel;
    Edit_ZoneStatus8: TEdit;
    Label219: TLabel;
    cmb_ZonUse: TRzComboBox;
    btnZoneSearch: TRzBitBtn;
    btnZoneReg: TRzBitBtn;
    Cmb_ZoneWatchType2: TRzComboBox;
    Cmb_ZoneWatchType3: TRzComboBox;
    Cmb_ZoneWatchType4: TRzComboBox;
    Cmb_ZoneWatchType5: TRzComboBox;
    Cmb_ZoneWatchType6: TRzComboBox;
    Cmb_ZoneWatchType7: TRzComboBox;
    Cmb_ZoneWatchType8: TRzComboBox;
    ed_ftpLocalip: TEdit;
    Label220: TLabel;
    chk_sharp: TRzCheckBox;
    gb_ftp: TGroupBox;
    chk_FTPMonitoringFirmware: TCheckBox;
    chk_GaugeFirmware: TCheckBox;
    Label221: TLabel;
    ed_ftpLocalipFirmware: TEdit;
    Label222: TLabel;
    cmb_ftplocalportFirmware: TComboBox;
    rg_ftpselect: TRadioGroup;
    gb_gauge: TGroupBox;
    Gauge_F00: TGauge;
    lb_gauge00: TLabel;
    lb_gauge22: TLabel;
    Gauge_F22: TGauge;
    lb_gauge44: TLabel;
    Gauge_F44: TGauge;
    lb_gauge01: TLabel;
    Gauge_F01: TGauge;
    lb_gauge23: TLabel;
    Gauge_F23: TGauge;
    lb_gauge45: TLabel;
    Gauge_F45: TGauge;
    lb_gauge02: TLabel;
    Gauge_F02: TGauge;
    lb_gauge24: TLabel;
    Gauge_F24: TGauge;
    lb_gauge46: TLabel;
    Gauge_F46: TGauge;
    lb_gauge03: TLabel;
    Gauge_F03: TGauge;
    lb_gauge25: TLabel;
    Gauge_F25: TGauge;
    lb_gauge47: TLabel;
    Gauge_F47: TGauge;
    lb_gauge04: TLabel;
    Gauge_F04: TGauge;
    lb_gauge26: TLabel;
    Gauge_F26: TGauge;
    lb_gauge48: TLabel;
    Gauge_F48: TGauge;
    lb_gauge05: TLabel;
    Gauge_F05: TGauge;
    lb_gauge27: TLabel;
    Gauge_F27: TGauge;
    lb_gauge49: TLabel;
    Gauge_F49: TGauge;
    lb_gauge06: TLabel;
    Gauge_F06: TGauge;
    lb_gauge28: TLabel;
    Gauge_F28: TGauge;
    lb_gauge50: TLabel;
    Gauge_F50: TGauge;
    lb_gauge07: TLabel;
    Gauge_F07: TGauge;
    lb_gauge29: TLabel;
    Gauge_F29: TGauge;
    lb_gauge51: TLabel;
    Gauge_F51: TGauge;
    lb_gauge08: TLabel;
    Gauge_F08: TGauge;
    lb_gauge30: TLabel;
    Gauge_F30: TGauge;
    lb_gauge52: TLabel;
    Gauge_F52: TGauge;
    lb_gauge09: TLabel;
    Gauge_F09: TGauge;
    lb_gauge31: TLabel;
    Gauge_F31: TGauge;
    Gauge_F53: TGauge;
    lb_gauge53: TLabel;
    lb_gauge10: TLabel;
    Gauge_F10: TGauge;
    lb_gauge32: TLabel;
    Gauge_F32: TGauge;
    lb_gauge54: TLabel;
    Gauge_F54: TGauge;
    lb_gauge11: TLabel;
    Gauge_F11: TGauge;
    Gauge_F33: TGauge;
    lb_gauge33: TLabel;
    lb_gauge55: TLabel;
    Gauge_F55: TGauge;
    lb_gauge012: TLabel;
    Gauge_F12: TGauge;
    Gauge_F34: TGauge;
    lb_gauge56: TLabel;
    Gauge_F56: TGauge;
    lb_gauge13: TLabel;
    Gauge_F13: TGauge;
    lb_gauge35: TLabel;
    Gauge_F35: TGauge;
    lb_gauge57: TLabel;
    Gauge_F57: TGauge;
    lb_gauge14: TLabel;
    Gauge_F14: TGauge;
    lb_gauge36: TLabel;
    Gauge_F36: TGauge;
    lb_gauge58: TLabel;
    Gauge_F58: TGauge;
    lb_gauge15: TLabel;
    Gauge_F15: TGauge;
    lb_gauge37: TLabel;
    Gauge_F37: TGauge;
    Gauge_F59: TGauge;
    lb_gauge59: TLabel;
    lb_gauge16: TLabel;
    Gauge_F16: TGauge;
    lb_gauge38: TLabel;
    Gauge_F38: TGauge;
    lb_gauge60: TLabel;
    Gauge_F60: TGauge;
    lb_gauge17: TLabel;
    Gauge_F17: TGauge;
    Gauge_F39: TGauge;
    lb_gauge39: TLabel;
    lb_gauge61: TLabel;
    Gauge_F61: TGauge;
    Gauge_F19: TGauge;
    lb_gauge19: TLabel;
    lb_gauge18: TLabel;
    Gauge_F18: TGauge;
    lb_gauge40: TLabel;
    lb_gauge41: TLabel;
    Gauge_F41: TGauge;
    Gauge_F40: TGauge;
    lb_gauge62: TLabel;
    lb_gauge63: TLabel;
    Gauge_F63: TGauge;
    Gauge_F62: TGauge;
    Gauge_F21: TGauge;
    lb_gauge21: TLabel;
    lb_gauge20: TLabel;
    Gauge_F20: TGauge;
    lb_gauge42: TLabel;
    lb_gauge43: TLabel;
    Gauge_F43: TGauge;
    Gauge_F42: TGauge;
    lb_gauge64: TLabel;
    lb_gauge65: TLabel;
    Gauge_F65: TGauge;
    Gauge_F64: TGauge;
    lb_gauge34: TLabel;
    Gauge_FirmwareMain: TGauge;
    gb_ftpCard: TGroupBox;
    Label223: TLabel;
    ed_cardFile: TEdit;
    btn_CardFile: TSpeedButton;
    chk_FTPCardMonitoring: TCheckBox;
    chk_FTPCardGauge: TCheckBox;
    btn_FTPCardSend: TRzBitBtn;
    btn_FTPCardStop: TRzBitBtn;
    Gauge_FTPCard: TGauge;
    lb_FtpcardECU: TLabel;
    Label224: TLabel;
    ed_FTPCardIP: TEdit;
    Label225: TLabel;
    cmb_FTPCardPort: TComboBox;
    ed_ftplocalportFirmware: TEdit;
    ed_FTPCardPort: TEdit;
    btnFirmwareChange: TRzBitBtn;
    GroupBox55: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Bevel2: TBevel;
    Bevel10: TBevel;
    mn_Update: TMenuItem;
    SpeedButton1: TSpeedButton;
    RzButton7: TRzButton;
    btn_nextPort: TSpeedButton;
    RzBitBtn46: TRzBitBtn;
    btnZeronCheckLan: TRzBitBtn;
    chk_Direct: TCheckBox;
    sg_WiznetList: TStringGrid;
    IdUDPClient1: TIdUDPClient;
    IdUDPServer1: TIdUDPServer;
    IdUDPServer2: TIdUDPServer;
    rd_wiznetLan: TRadioButton;
    rd_zeronLan: TRadioButton;
    chk_ZeronType: TCheckBox;
    GroupBox56: TGroupBox;
    Label226: TLabel;
    ed_OrgCardNo: TEdit;
    btn_GetPosition: TRzBitBtn;
    ed_resultPosition: TEdit;
    ed_resultCardNo: TEdit;
    btn_getCardNo: TRzBitBtn;
    ed_OrgPosition: TEdit;
    Label227: TLabel;
    bt_CardSearch: TRzBitBtn;
    GroupBox57: TGroupBox;
    chk_CardPosition: TCheckBox;
    ed_CardPosition: TEdit;
    Label228: TLabel;
    ed_CardPositionNumber: TEdit;
    ed_CardPositionHex: TEdit;
    Gauge2: TGauge;
    N18: TMenuItem;
    DBISAMTable1VER: TStringField;
    chk_AckView: TRzCheckBox;
    PageControl5: TPageControl;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    RzGroupBox5: TRzGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Edit_Send1: TRzEdit;
    Edit_Send2: TRzEdit;
    Edit_Send3: TRzEdit;
    Edit_Send4: TRzEdit;
    Btn_Send1: TRzBitBtn;
    Btn_Send2: TRzBitBtn;
    Btn_Send3: TRzBitBtn;
    Btn_Send4: TRzBitBtn;
    Btn_Clear1: TRzBitBtn;
    Btn_Clear2: TRzBitBtn;
    Btn_Clear3: TRzBitBtn;
    Btn_Clear4: TRzBitBtn;
    cb_SendFullData: TCheckBox;
    Edit_Func1: TRzEdit;
    Edit_Func2: TRzEdit;
    Edit_Func3: TRzEdit;
    Edit_Func4: TRzEdit;
    Edit_Send5: TRzEdit;
    Edit_Send6: TRzEdit;
    Edit_Send7: TRzEdit;
    Edit_Send8: TRzEdit;
    Btn_Send5: TRzBitBtn;
    Btn_Send6: TRzBitBtn;
    Btn_Send7: TRzBitBtn;
    Btn_Send8: TRzBitBtn;
    Btn_Clear5: TRzBitBtn;
    Btn_Clear6: TRzBitBtn;
    Btn_Clear7: TRzBitBtn;
    Btn_Clear8: TRzBitBtn;
    Edit_Func5: TRzEdit;
    Edit_Func6: TRzEdit;
    Edit_Func7: TRzEdit;
    Edit_Func8: TRzEdit;
    Edit_Send9: TRzEdit;
    Edit_Send0: TRzEdit;
    Btn_Send9: TRzBitBtn;
    Btn_Send0: TRzBitBtn;
    Btn_Clear9: TRzBitBtn;
    Btn_Clear0: TRzBitBtn;
    Edit_Func9: TRzEdit;
    Edit_Func0: TRzEdit;
    Edit_SendA: TRzEdit;
    Edit_SendB: TRzEdit;
    Edit_SendC: TRzEdit;
    Edit_SendD: TRzEdit;
    Btn_SendA: TRzBitBtn;
    Btn_SendB: TRzBitBtn;
    Btn_SendC: TRzBitBtn;
    Btn_SendD: TRzBitBtn;
    Btn_ClearA: TRzBitBtn;
    Btn_ClearB: TRzBitBtn;
    Btn_ClearC: TRzBitBtn;
    Btn_ClearD: TRzBitBtn;
    Edit_FuncA: TRzEdit;
    Edit_FuncB: TRzEdit;
    Edit_FuncC: TRzEdit;
    Edit_FuncD: TRzEdit;
    Edit_SendE: TRzEdit;
    Edit_SendF: TRzEdit;
    Btn_SendE: TRzBitBtn;
    Btn_SendF: TRzBitBtn;
    Btn_ClearE: TRzBitBtn;
    Btn_ClearF: TRzBitBtn;
    Edit_FuncE: TRzEdit;
    Edit_FuncF: TRzEdit;
    btn_FileOpen1: TRzBitBtn;
    btn_FileSave1: TRzBitBtn;
    rg_Decoder: TRadioGroup;
    ed_DecMCode1: TRzEdit;
    ed_DecCMD1: TRzEdit;
    ed_DecMCode2: TRzEdit;
    ed_DecCMD2: TRzEdit;
    ed_DecMCode3: TRzEdit;
    ed_DecCMD3: TRzEdit;
    chk_Decoder: TCheckBox;
    ed_DecModem1: TRzEdit;
    ed_DecChannel1: TRzEdit;
    ed_DecModem2: TRzEdit;
    ed_DecChannel2: TRzEdit;
    ed_DecModem3: TRzEdit;
    ed_DecChannel3: TRzEdit;
    ed_DecCntl1: TRzEdit;
    ed_DecCntl2: TRzEdit;
    ed_DecCntl3: TRzEdit;
    ed_Dectail3: TRzEdit;
    ed_Dectail2: TRzEdit;
    ed_Dectail1: TRzEdit;
    RzGroupBox11: TRzGroupBox;
    Label229: TLabel;
    Label230: TLabel;
    Label231: TLabel;
    Label232: TLabel;
    Label233: TLabel;
    Label247: TLabel;
    Label250: TLabel;
    Label251: TLabel;
    Label252: TLabel;
    Label254: TLabel;
    Label256: TLabel;
    Label257: TLabel;
    Label258: TLabel;
    Label259: TLabel;
    Label260: TLabel;
    Label261: TLabel;
    Edit_Send21: TRzEdit;
    Edit_Send22: TRzEdit;
    Edit_Send23: TRzEdit;
    Edit_Send24: TRzEdit;
    Btn_Send21: TRzBitBtn;
    Btn_Send22: TRzBitBtn;
    Btn_Send23: TRzBitBtn;
    Btn_Send24: TRzBitBtn;
    Btn_Clear21: TRzBitBtn;
    Btn_Clear22: TRzBitBtn;
    Btn_Clear23: TRzBitBtn;
    Btn_Clear24: TRzBitBtn;
    cb_SendFullData2: TCheckBox;
    Edit_Func21: TRzEdit;
    Edit_Func22: TRzEdit;
    Edit_Func23: TRzEdit;
    Edit_Func24: TRzEdit;
    Edit_Send25: TRzEdit;
    Edit_Send26: TRzEdit;
    Edit_Send27: TRzEdit;
    Edit_Send28: TRzEdit;
    Btn_Send25: TRzBitBtn;
    Btn_Send26: TRzBitBtn;
    Btn_Send27: TRzBitBtn;
    Btn_Send28: TRzBitBtn;
    Btn_Clear25: TRzBitBtn;
    Btn_Clear26: TRzBitBtn;
    Btn_Clear27: TRzBitBtn;
    Btn_Clear28: TRzBitBtn;
    Edit_Func25: TRzEdit;
    Edit_Func26: TRzEdit;
    Edit_Func27: TRzEdit;
    Edit_Func28: TRzEdit;
    Edit_Send29: TRzEdit;
    Edit_Send20: TRzEdit;
    Btn_Send29: TRzBitBtn;
    Btn_Send20: TRzBitBtn;
    Btn_Clear29: TRzBitBtn;
    Btn_Clear20: TRzBitBtn;
    Edit_Func29: TRzEdit;
    Edit_Func20: TRzEdit;
    Edit_Send2A: TRzEdit;
    Edit_Send2B: TRzEdit;
    Edit_Send2C: TRzEdit;
    Edit_Send2D: TRzEdit;
    Btn_Send2A: TRzBitBtn;
    Btn_Send2B: TRzBitBtn;
    Btn_Send2C: TRzBitBtn;
    Btn_Send2D: TRzBitBtn;
    Btn_Clear2A: TRzBitBtn;
    Btn_Clear2B: TRzBitBtn;
    Btn_Clear2C: TRzBitBtn;
    Btn_Clear2D: TRzBitBtn;
    Edit_Func2A: TRzEdit;
    Edit_Func2B: TRzEdit;
    Edit_Func2C: TRzEdit;
    Edit_Func2D: TRzEdit;
    Edit_Send2E: TRzEdit;
    Edit_Send2F: TRzEdit;
    Btn_Send2E: TRzBitBtn;
    Btn_Send2F: TRzBitBtn;
    Btn_Clear2E: TRzBitBtn;
    Btn_Clear2F: TRzBitBtn;
    Edit_Func2E: TRzEdit;
    Edit_Func2F: TRzEdit;
    btn_FileOpen2: TRzBitBtn;
    btn_FileSave2: TRzBitBtn;
    RzGroupBox12: TRzGroupBox;
    Label262: TLabel;
    Label263: TLabel;
    Label264: TLabel;
    Label265: TLabel;
    Label274: TLabel;
    Label275: TLabel;
    Label276: TLabel;
    Label277: TLabel;
    Label278: TLabel;
    Label279: TLabel;
    Label280: TLabel;
    Label281: TLabel;
    Label282: TLabel;
    Label283: TLabel;
    Label284: TLabel;
    Label285: TLabel;
    Edit_Send31: TRzEdit;
    Edit_Send32: TRzEdit;
    Edit_Send33: TRzEdit;
    Edit_Send34: TRzEdit;
    Btn_Send31: TRzBitBtn;
    Btn_Send32: TRzBitBtn;
    Btn_Send33: TRzBitBtn;
    Btn_Send34: TRzBitBtn;
    Btn_Clear31: TRzBitBtn;
    Btn_Clear32: TRzBitBtn;
    Btn_Clear33: TRzBitBtn;
    Btn_Clear34: TRzBitBtn;
    cb_SendFullData3: TCheckBox;
    Edit_Func31: TRzEdit;
    Edit_Func32: TRzEdit;
    Edit_Func33: TRzEdit;
    Edit_Func34: TRzEdit;
    Edit_Send35: TRzEdit;
    Edit_Send36: TRzEdit;
    Edit_Send37: TRzEdit;
    Edit_Send38: TRzEdit;
    Btn_Send35: TRzBitBtn;
    Btn_Send36: TRzBitBtn;
    Btn_Send37: TRzBitBtn;
    Btn_Send38: TRzBitBtn;
    Btn_Clear35: TRzBitBtn;
    Btn_Clear36: TRzBitBtn;
    Btn_Clear37: TRzBitBtn;
    Btn_Clear38: TRzBitBtn;
    Edit_Func35: TRzEdit;
    Edit_Func36: TRzEdit;
    Edit_Func37: TRzEdit;
    Edit_Func38: TRzEdit;
    Edit_Send39: TRzEdit;
    Edit_Send30: TRzEdit;
    Btn_Send39: TRzBitBtn;
    Btn_Send30: TRzBitBtn;
    Btn_Clear39: TRzBitBtn;
    Btn_Clear30: TRzBitBtn;
    Edit_Func39: TRzEdit;
    Edit_Func30: TRzEdit;
    Edit_Send3A: TRzEdit;
    Edit_Send3B: TRzEdit;
    Edit_Send3C: TRzEdit;
    Edit_Send3D: TRzEdit;
    Btn_Send3A: TRzBitBtn;
    Btn_Send3B: TRzBitBtn;
    Btn_Send3C: TRzBitBtn;
    Btn_Send3D: TRzBitBtn;
    Btn_Clear3A: TRzBitBtn;
    Btn_Clear3B: TRzBitBtn;
    Btn_Clear3C: TRzBitBtn;
    Btn_Clear3D: TRzBitBtn;
    Edit_Func3A: TRzEdit;
    Edit_Func3B: TRzEdit;
    Edit_Func3C: TRzEdit;
    Edit_Func3D: TRzEdit;
    Edit_Send3E: TRzEdit;
    Edit_Send3F: TRzEdit;
    Btn_Send3E: TRzBitBtn;
    Btn_Send3F: TRzBitBtn;
    Btn_Clear3E: TRzBitBtn;
    Btn_Clear3F: TRzBitBtn;
    Edit_Func3E: TRzEdit;
    Edit_Func3F: TRzEdit;
    btn_FileOpen3: TRzBitBtn;
    btn_FileSave3: TRzBitBtn;
    rg_DecorderSelect: TRzGroup;
    RzRadioGroup3: TRzRadioGroup;
    RzComboBox3: TRzComboBox;
    chk_CardBinHD: TCheckBox;
    btn_CardBinCreat: TRzBitBtn;
    btn_CardStruct: TRzBitBtn;
    ed_BinSize: TEdit;
    Label286: TLabel;
    ed_CardCount: TEdit;
    chk_BinHeader: TCheckBox;
    chk_CardBin: TCheckBox;
    Panel2: TPanel;
    Panel3: TPanel;
    btn_DeviceState: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    rg_AcState: TRadioGroup;
    rg_batterrystate: TRadioGroup;
    rg_fskLevelstate: TRadioGroup;
    rg_TemperState: TRadioGroup;
    rg_SirenState: TRadioGroup;
    rg_AlarmState: TRadioGroup;
    GroupBox59: TGroupBox;
    rg_Dip1: TRadioGroup;
    rg_Dip2: TRadioGroup;
    rg_Dip3: TRadioGroup;
    rg_Dip4: TRadioGroup;
    rg_Dip5: TRadioGroup;
    rg_Dip6: TRadioGroup;
    rg_Dip7: TRadioGroup;
    rg_LampState: TRadioGroup;
    GroupBox58: TGroupBox;
    rg_ExitState1: TRadioGroup;
    rg_dsState1: TRadioGroup;
    rg_lsState1: TRadioGroup;
    rg_LockRelayState1: TRadioGroup;
    GroupBox60: TGroupBox;
    rg_ExitState2: TRadioGroup;
    rg_dsState2: TRadioGroup;
    rg_lsState2: TRadioGroup;
    rg_LockRelayState2: TRadioGroup;
    ed_DeviceMonitoringTime: TEdit;
    Label287: TLabel;
    Panel6: TPanel;
    GroupBox61: TGroupBox;
    TabSheet15: TTabSheet;
    RzGroupBox13: TRzGroupBox;
    Label288: TLabel;
    Label289: TLabel;
    Label290: TLabel;
    Label291: TLabel;
    Label292: TLabel;
    Label293: TLabel;
    Label294: TLabel;
    Label295: TLabel;
    Label296: TLabel;
    Label297: TLabel;
    Label298: TLabel;
    Label299: TLabel;
    Label301: TLabel;
    Label302: TLabel;
    Label303: TLabel;
    Label304: TLabel;
    edit_CMD41: TRzEdit;
    edit_CMD42: TRzEdit;
    edit_CMD43: TRzEdit;
    edit_CMD44: TRzEdit;
    Btn_Send41: TRzBitBtn;
    Btn_Send42: TRzBitBtn;
    Btn_Send43: TRzBitBtn;
    Btn_Send44: TRzBitBtn;
    Btn_Clear41: TRzBitBtn;
    Btn_Clear42: TRzBitBtn;
    Btn_Clear43: TRzBitBtn;
    Btn_Clear44: TRzBitBtn;
    CheckBox3: TCheckBox;
    Edit_Func41: TRzEdit;
    Edit_Func42: TRzEdit;
    Edit_Func43: TRzEdit;
    Edit_Func44: TRzEdit;
    edit_CMD45: TRzEdit;
    edit_CMD46: TRzEdit;
    edit_CMD47: TRzEdit;
    edit_CMD48: TRzEdit;
    Btn_Send45: TRzBitBtn;
    Btn_Send46: TRzBitBtn;
    Btn_Send47: TRzBitBtn;
    Btn_Send48: TRzBitBtn;
    Btn_Clear45: TRzBitBtn;
    Btn_Clear46: TRzBitBtn;
    Btn_Clear47: TRzBitBtn;
    Btn_Clear48: TRzBitBtn;
    Edit_Func45: TRzEdit;
    Edit_Func46: TRzEdit;
    Edit_Func47: TRzEdit;
    Edit_Func48: TRzEdit;
    edit_CMD49: TRzEdit;
    edit_CMD40: TRzEdit;
    Btn_Send49: TRzBitBtn;
    Btn_Send40: TRzBitBtn;
    Btn_Clear49: TRzBitBtn;
    Btn_Clear40: TRzBitBtn;
    Edit_Func49: TRzEdit;
    Edit_Func40: TRzEdit;
    edit_CMD4A: TRzEdit;
    edit_CMD4B: TRzEdit;
    edit_CMD4C: TRzEdit;
    edit_CMD4D: TRzEdit;
    Btn_Send4A: TRzBitBtn;
    Btn_Send4B: TRzBitBtn;
    Btn_Send4C: TRzBitBtn;
    Btn_Send4D: TRzBitBtn;
    Btn_Clear4A: TRzBitBtn;
    Btn_Clear4B: TRzBitBtn;
    Btn_Clear4C: TRzBitBtn;
    Btn_Clear4D: TRzBitBtn;
    Edit_Func4A: TRzEdit;
    Edit_Func4B: TRzEdit;
    Edit_Func4C: TRzEdit;
    Edit_Func4D: TRzEdit;
    edit_CMD4E: TRzEdit;
    edit_CMD4F: TRzEdit;
    Btn_Send4E: TRzBitBtn;
    Btn_Send4F: TRzBitBtn;
    Btn_Clear4E: TRzBitBtn;
    Btn_Clear4F: TRzBitBtn;
    Edit_Func4E: TRzEdit;
    Edit_Func4F: TRzEdit;
    btn_FileOpen4: TRzBitBtn;
    btn_FileSave6: TRzBitBtn;
    ed_FinCMD41: TRzEdit;
    ed_FinCMD42: TRzEdit;
    ed_FinCMD43: TRzEdit;
    ed_FinCMD44: TRzEdit;
    ed_FinCMD45: TRzEdit;
    ed_FinCMD46: TRzEdit;
    ed_FinCMD47: TRzEdit;
    ed_FinCMD48: TRzEdit;
    ed_FinCMD49: TRzEdit;
    ed_FinCMD40: TRzEdit;
    ed_FinCMD4A: TRzEdit;
    ed_FinCMD4B: TRzEdit;
    ed_FinCMD4C: TRzEdit;
    ed_FinCMD4D: TRzEdit;
    ed_FinCMD4E: TRzEdit;
    ed_FinCMD4F: TRzEdit;
    ed_FinDT141: TRzEdit;
    ed_FinDT142: TRzEdit;
    ed_FinDT143: TRzEdit;
    ed_FinDT144: TRzEdit;
    ed_FinDT145: TRzEdit;
    ed_FinDT146: TRzEdit;
    ed_FinDT147: TRzEdit;
    ed_FinDT148: TRzEdit;
    ed_FinDT149: TRzEdit;
    ed_FinDT140: TRzEdit;
    ed_FinDT14A: TRzEdit;
    ed_FinDT14B: TRzEdit;
    ed_FinDT14C: TRzEdit;
    ed_FinDT14D: TRzEdit;
    ed_FinDT14E: TRzEdit;
    ed_FinDT14F: TRzEdit;
    ed_FinDT241: TRzEdit;
    ed_FinDT242: TRzEdit;
    ed_FinDT243: TRzEdit;
    ed_FinDT244: TRzEdit;
    ed_FinDT245: TRzEdit;
    ed_FinDT246: TRzEdit;
    ed_FinDT247: TRzEdit;
    ed_FinDT248: TRzEdit;
    ed_FinDT249: TRzEdit;
    ed_FinDT240: TRzEdit;
    ed_FinDT24A: TRzEdit;
    ed_FinDT24B: TRzEdit;
    ed_FinDT24C: TRzEdit;
    ed_FinDT24D: TRzEdit;
    ed_FinDT24E: TRzEdit;
    ed_FinDT24F: TRzEdit;
    ed_FinDT341: TRzEdit;
    ed_FinDT342: TRzEdit;
    ed_FinDT343: TRzEdit;
    ed_FinDT344: TRzEdit;
    ed_FinDT345: TRzEdit;
    ed_FinDT346: TRzEdit;
    ed_FinDT347: TRzEdit;
    ed_FinDT348: TRzEdit;
    ed_FinDT349: TRzEdit;
    ed_FinDT340: TRzEdit;
    ed_FinDT34A: TRzEdit;
    ed_FinDT34B: TRzEdit;
    ed_FinDT34C: TRzEdit;
    ed_FinDT34D: TRzEdit;
    ed_FinDT34E: TRzEdit;
    ed_FinDT34F: TRzEdit;
    ed_FinDT441: TRzEdit;
    ed_FinDT442: TRzEdit;
    ed_FinDT443: TRzEdit;
    ed_FinDT444: TRzEdit;
    ed_FinDT445: TRzEdit;
    ed_FinDT446: TRzEdit;
    ed_FinDT447: TRzEdit;
    ed_FinDT448: TRzEdit;
    ed_FinDT449: TRzEdit;
    ed_FinDT440: TRzEdit;
    ed_FinDT44A: TRzEdit;
    ed_FinDT44B: TRzEdit;
    ed_FinDT44C: TRzEdit;
    ed_FinDT44D: TRzEdit;
    ed_FinDT44E: TRzEdit;
    ed_FinDT44F: TRzEdit;
    ed_FinCheck41: TRzEdit;
    ed_FinCheck42: TRzEdit;
    ed_FinCheck43: TRzEdit;
    ed_FinCheck44: TRzEdit;
    ed_FinCheck45: TRzEdit;
    ed_FinCheck46: TRzEdit;
    ed_FinCheck47: TRzEdit;
    ed_FinCheck48: TRzEdit;
    ed_FinCheck49: TRzEdit;
    ed_FinCheck40: TRzEdit;
    ed_FinCheck4A: TRzEdit;
    ed_FinCheck4B: TRzEdit;
    ed_FinCheck4C: TRzEdit;
    ed_FinCheck4D: TRzEdit;
    ed_FinCheck4E: TRzEdit;
    ed_FinCheck4F: TRzEdit;
    ed_FinEnd41: TRzEdit;
    ed_FinEnd42: TRzEdit;
    ed_FinEnd43: TRzEdit;
    ed_FinEnd44: TRzEdit;
    ed_FinEnd45: TRzEdit;
    ed_FinEnd46: TRzEdit;
    ed_FinEnd47: TRzEdit;
    ed_FinEnd48: TRzEdit;
    ed_FinEnd49: TRzEdit;
    ed_FinEnd40: TRzEdit;
    ed_FinEnd4A: TRzEdit;
    ed_FinEnd4B: TRzEdit;
    ed_FinEnd4C: TRzEdit;
    ed_FinEnd4D: TRzEdit;
    ed_FinEnd4E: TRzEdit;
    ed_FinEnd4F: TRzEdit;
    N19: TMenuItem;
    ed_LanState: TRzEdit;
    btn_CardSave: TRzBitBtn;
    Label305: TLabel;
    RzGroup6: TRzGroup;
    rg_CardType: TRzRadioGroup;
    chk_UserSyncTime: TCheckBox;
    dt_SyncTime: TDateTimePicker;
    dt_SyncDate: TDateTimePicker;
    Label306: TLabel;
    Spinner_Ring: TSpinEdit;
    Spinner_CancelRing: TSpinEdit;
    Panel7: TPanel;
    GroupBox62: TGroupBox;
    Label307: TLabel;
    Label308: TLabel;
    cmb_alartLamp: TRzComboBox;
    cmb_alartSiren: TRzComboBox;
    btn_AlertLampReg: TRzBitBtn;
    btn_AlertLampSearch: TRzBitBtn;
    GroupBox63: TGroupBox;
    Label309: TLabel;
    Label310: TLabel;
    ed_alertLampTime: TEdit;
    ed_alertSirenTime: TEdit;
    btn_AlertLampTimeReg: TRzBitBtn;
    btn_AlertLampTimeSearch: TRzBitBtn;
    Label311: TLabel;
    Label312: TLabel;
    chk_CardPosition2: TCheckBox;
    Label314: TLabel;
    Label315: TLabel;
    Label316: TLabel;
    Label317: TLabel;
    Label318: TLabel;
    Label319: TLabel;
    Label320: TLabel;
    Label321: TLabel;
    ed_dipswitch: TEdit;
    Label322: TLabel;
    Label323: TLabel;
    Label324: TLabel;
    Label325: TLabel;
    Label326: TLabel;
    Label327: TLabel;
    Label328: TLabel;
    Label329: TLabel;
    DoorState_List: TLMDListBox;
    Panel8: TPanel;
    GroupBox14: TGroupBox;
    Label18: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label66: TLabel;
    Label93: TLabel;
    Label313: TLabel;
    ComboBox_CardModeType: TRzComboBox;
    ComboBox_DoorModeType: TRzComboBox;
    RzSpinEdit4: TRzSpinEdit;
    RzSpinEdit5: TRzSpinEdit;
    ComboBox_UseSch: TRzComboBox;
    ComboBox_SendDoorStatus: TRzComboBox;
    ComboBox_UseCommOff: TRzComboBox;
    ComboBox_AlarmLongOpen: TRzComboBox;
    ComboBox_AlramCommoff: TRzComboBox;
    ComboBox_LockType: TRzComboBox;
    ComboBox_ControlFire: TRzComboBox;
    RzBitBtn18: TRzBitBtn;
    RzBitBtn19: TRzBitBtn;
    ComboBox_AntiPass: TRzComboBox;
    ComboBox_CheckDSLS: TRzComboBox;
    ed_DoorControlTime: TEdit;
    cmb_DoorControlTime: TComboBox;
    cmb_DsOpenState: TRzComboBox;
    chk_RemoteCancelDoorOpen: TCheckBox;
    Panel9: TPanel;
    gbDoorNo: TRadioGroup;
    Label55: TLabel;
    GroupBox15: TGroupBox;
    RzGroupBox1: TRzGroupBox;
    Btn_Positive: TRzBitBtn;
    Btn_Negative: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    Btn_Nomal: TRzBitBtn;
    Btn_Open: TRzBitBtn;
    btn_Close: TRzBitBtn;
    RzGroupBox6: TRzGroupBox;
    Btn_DoorOPen: TRzBitBtn;
    Btn_DoorClose: TRzBitBtn;
    RzBitBtn54: TRzBitBtn;
    Btn_CheckStatus: TRzBitBtn;
    lbDoorControl: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    GroupBox27: TGroupBox;
    Label94: TLabel;
    Label330: TLabel;
    Label331: TLabel;
    Label332: TLabel;
    rg_dExitState1: TRadioGroup;
    rg_ddsState1: TRadioGroup;
    rg_dlsState1: TRadioGroup;
    rg_dLockRelayState1: TRadioGroup;
    GroupBox64: TGroupBox;
    Label333: TLabel;
    Label334: TLabel;
    Label335: TLabel;
    Label336: TLabel;
    rg_dExitState2: TRadioGroup;
    rg_ddsState2: TRadioGroup;
    rg_dlsState2: TRadioGroup;
    rg_dLockRelayState2: TRadioGroup;
    Panel12: TPanel;
    btnDoorState: TSpeedButton;
    CB_SerialBoard: TLMDLabeledListComboBox;
    RzBitBtn47: TRzBitBtn;
    GroupBox65: TGroupBox;
    btn_DoorTypeReg: TRzBitBtn;
    btn_graphSchedule: TRzBitBtn;
    stVerType: TStaticText;
    pan_vertype: TPanel;
    Label337: TLabel;
    chk_AccessAck: TRzCheckBox;
    ed_FixMac: TRzEdit;
    chk_FixMac: TCheckBox;
    Checkbox_DHCP: TRzCheckBox;
    btn_AckSend: TRzBitBtn;
    btn_CackSend: TRzBitBtn;
    Edit_PTStatus9: TEdit;
    ComboBox_WatchType9: TRzComboBox;
    ComboBox_AlarmType9: TRzComboBox;
    ComboBox_recover9: TRzComboBox;
    ComboBox_Delay9: TRzComboBox;
    Edit_PTLocate9: TEdit;
    Edit_PTZoneNo9: TEdit;
    ComboBox_DetectTime9: TRzComboBox;
    Edit_PTStatus10: TEdit;
    ComboBox_WatchType10: TRzComboBox;
    ComboBox_AlarmType10: TRzComboBox;
    ComboBox_recover10: TRzComboBox;
    ComboBox_Delay10: TRzComboBox;
    Edit_PTLocate10: TEdit;
    Edit_PTZoneNo10: TEdit;
    ComboBox_DetectTime10: TRzComboBox;
    Edit_PTStatus11: TEdit;
    ComboBox_WatchType11: TRzComboBox;
    ComboBox_AlarmType11: TRzComboBox;
    ComboBox_recover11: TRzComboBox;
    ComboBox_Delay11: TRzComboBox;
    Edit_PTLocate11: TEdit;
    Edit_PTZoneNo11: TEdit;
    ComboBox_DetectTime11: TRzComboBox;
    Edit_PTStatus12: TEdit;
    ComboBox_WatchType12: TRzComboBox;
    ComboBox_AlarmType12: TRzComboBox;
    ComboBox_recover12: TRzComboBox;
    ComboBox_Delay12: TRzComboBox;
    Edit_PTLocate12: TEdit;
    Edit_PTZoneNo12: TEdit;
    ComboBox_DetectTime12: TRzComboBox;
    rg_tourCard: TRadioGroup;
    TabSheet16: TTabSheet;
    RzGroupBox14: TRzGroupBox;
    Label3: TLabel;
    Label338: TLabel;
    Label339: TLabel;
    Label340: TLabel;
    Label341: TLabel;
    Label342: TLabel;
    Label343: TLabel;
    Label344: TLabel;
    Label345: TLabel;
    Label346: TLabel;
    Label347: TLabel;
    Label348: TLabel;
    Label349: TLabel;
    Label350: TLabel;
    Label351: TLabel;
    Label352: TLabel;
    Edit_Send51: TRzEdit;
    Edit_Send52: TRzEdit;
    Edit_Send53: TRzEdit;
    Edit_Send54: TRzEdit;
    Btn_Send51: TRzBitBtn;
    Btn_Send52: TRzBitBtn;
    Btn_Send53: TRzBitBtn;
    Btn_Send54: TRzBitBtn;
    Btn_Clear51: TRzBitBtn;
    Btn_Clear52: TRzBitBtn;
    Btn_Clear53: TRzBitBtn;
    Btn_Clear54: TRzBitBtn;
    cb_SendFullData5: TCheckBox;
    Edit_Func51: TRzEdit;
    Edit_Func52: TRzEdit;
    Edit_Func53: TRzEdit;
    Edit_Func54: TRzEdit;
    Edit_Send55: TRzEdit;
    Edit_Send56: TRzEdit;
    Edit_Send57: TRzEdit;
    Edit_Send58: TRzEdit;
    Btn_Send55: TRzBitBtn;
    Btn_Send56: TRzBitBtn;
    Btn_Send57: TRzBitBtn;
    Btn_Send58: TRzBitBtn;
    Btn_Clear55: TRzBitBtn;
    Btn_Clear56: TRzBitBtn;
    Btn_Clear57: TRzBitBtn;
    Btn_Clear58: TRzBitBtn;
    Edit_Func55: TRzEdit;
    Edit_Func56: TRzEdit;
    Edit_Func57: TRzEdit;
    Edit_Func58: TRzEdit;
    Edit_Send59: TRzEdit;
    Edit_Send50: TRzEdit;
    Btn_Send59: TRzBitBtn;
    Btn_Send50: TRzBitBtn;
    Btn_Clear59: TRzBitBtn;
    Btn_Clear50: TRzBitBtn;
    Edit_Func59: TRzEdit;
    Edit_Func50: TRzEdit;
    Edit_Send5A: TRzEdit;
    Edit_Send5B: TRzEdit;
    Edit_Send5C: TRzEdit;
    Edit_Send5D: TRzEdit;
    Btn_Send5A: TRzBitBtn;
    Btn_Send5B: TRzBitBtn;
    Btn_Send5C: TRzBitBtn;
    Btn_Send5D: TRzBitBtn;
    Btn_Clear5A: TRzBitBtn;
    Btn_Clear5B: TRzBitBtn;
    Btn_Clear5C: TRzBitBtn;
    Btn_Clear5D: TRzBitBtn;
    Edit_Func5A: TRzEdit;
    Edit_Func5B: TRzEdit;
    Edit_Func5C: TRzEdit;
    Edit_Func5D: TRzEdit;
    Edit_Send5E: TRzEdit;
    Edit_Send5F: TRzEdit;
    Btn_Send5E: TRzBitBtn;
    Btn_Send5F: TRzBitBtn;
    Btn_Clear5E: TRzBitBtn;
    Btn_Clear5F: TRzBitBtn;
    Edit_Func5E: TRzEdit;
    Edit_Func5F: TRzEdit;
    btn_FileOpen5: TRzBitBtn;
    btn_FileSave5: TRzBitBtn;
    Edit_CurrentID: TRzEdit;
    ComboBox_IDNO: TRzComboBox;
    Label40: TLabel;
    Label4: TLabel;
    procedure RzGroup2ItemsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure RegClick(Sender: TObject);
    procedure btnCheck(Sender: TObject);
    procedure Edit_DeviceIDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure M_CloseClick(Sender: TObject);
    procedure Btn_SyncTimeClick(Sender: TObject);
    procedure RzBitBtn13Click(Sender: TObject);
    procedure RzBitBtn14Click(Sender: TObject);
    procedure RzBitBtn15Click(Sender: TObject);
    procedure RzBitBtn16Click(Sender: TObject);
    procedure RzBitBtn17Click(Sender: TObject);
    procedure btn_ConnectClick(Sender: TObject);
    procedure Btn_DisConnectClick(Sender: TObject);
    procedure WinsockPortWsConnect(Sender: TObject);
    procedure WinsockPortWsDisconnect(Sender: TObject);
    procedure WinsockPortWsError(Sender: TObject; ErrCode: Integer);
    procedure WinsockPortTriggerAvail(CP: TObject; Count: Word);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure btn_UseControlerSearchClick(Sender: TObject);
    procedure RzGroup3Items0Click(Sender: TObject);
    procedure ListBox_EventKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure cbPollingClick(Sender: TObject);
    procedure Polling_TimerTimer(Sender: TObject);
    procedure RzSpinner1Change(Sender: TObject);
    procedure Btn_SBtn_Send41Click(Sender: TObject);
    procedure Btn_Clear1Click(Sender: TObject);
    procedure Off_TimerTimer(Sender: TObject);
    procedure RzBitBtn20Click(Sender: TObject);
    procedure RzBitBtn21Click(Sender: TObject);
    procedure RzBitBtn22Click(Sender: TObject);
    procedure RzBitBtn23Click(Sender: TObject);
    procedure RzBitBtn18Click(Sender: TObject);
    procedure RzBitBtn19Click(Sender: TObject);
    procedure RzGroup3Items1Click(Sender: TObject);
    procedure Btn_NomalClick(Sender: TObject);
    procedure Btn_OpenClick(Sender: TObject);
    procedure WinsockPortWsAccept(Sender: TObject; Addr: TInAddr;
      var Accept: Boolean);
    procedure Btn_PositiveClick(Sender: TObject);
    procedure Btn_NegativeClick(Sender: TObject);
    procedure Btn_DoorOPenClick(Sender: TObject);
    procedure Btn_DoorCloseClick(Sender: TObject);
    procedure RzGroup3Items2Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure DBISAMTable1EventTimeGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure RzGroup2Items7Click(Sender: TObject);
    procedure Btn_RegDialInfoClick(Sender: TObject);
    procedure Btn_CheckDialInfoClick(Sender: TObject);
    procedure Btn_RegCalltimeClick(Sender: TObject);
    procedure Btn_CheckCalltimeClick(Sender: TObject);

    procedure Edit_Combo_Enter(Sender: TObject);
    procedure Btn_RegCardNoClick(Sender: TObject);
    procedure Btn_DelCardNoClick(Sender: TObject);
    procedure Btn_DelEventLogClick(Sender: TObject);
    procedure RzGroup2Items0Click(Sender: TObject);
    procedure RzGroup2Items1Click(Sender: TObject);
    procedure RzGroup2Items2Click(Sender: TObject);
    procedure RzGroup2Items3Click(Sender: TObject);
    procedure RzGroup2Items4Click(Sender: TObject);
    procedure RzGroup2Items5Click(Sender: TObject);
    procedure RzGroup2Items6Click(Sender: TObject);
    procedure RzBitBtn26Click(Sender: TObject);
    procedure RzBitBtn25Click(Sender: TObject);
    procedure RzBitBtn27Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure RzBitBtn28Click(Sender: TObject);
    procedure RzGroup1Open(Sender: TObject);
    procedure rg_ConTypeChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure RzBitBtn32Click(Sender: TObject);
    procedure btnCheckLanClick(Sender: TObject);
    procedure RzBitBtn30Click(Sender: TObject);
    procedure RzBitBtn31Click(Sender: TObject);
    procedure LMDCaptionPanel1CloseBtnClick(Sender: TObject;
      var Cancel: Boolean);
    procedure edRegTelNoButtonClick(Sender: TObject);
    procedure edTelNoButtonClick(Sender: TObject);
    procedure cbVoiceDetectClick(Sender: TObject);
    procedure btnRegVoicetimeClick(Sender: TObject);
    procedure btnCheckVoicetimeClick(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure LMDListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_RegbroadcasttimeClick(Sender: TObject);
    procedure Btn_CheckbroadcasttimeClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RzButtonEdit100ButtonClick(Sender: TObject);
    procedure RzGroup2Items8Click(Sender: TObject);
    procedure btmRegLinkusIDClick(Sender: TObject);
    procedure btmCheckLinkusIDClick(Sender: TObject);
    procedure btnRegLinkusTel0Click(Sender: TObject);
    procedure btnCheckLinkusTel0Click(Sender: TObject);
    procedure btnRegPtTimeClick(Sender: TObject);
    procedure btnCheckPtTimeClick(Sender: TObject);
    procedure btnRegPtDelayTimeClick(Sender: TObject);
    procedure Btn_CheckRingCountClick(Sender: TObject);
    procedure Btn_RegRingCountClick(Sender: TObject);
    procedure Btn_CheckCardNoClick(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure WiznetTimerTimer(Sender: TObject);
    procedure btnRegMACClick(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure editMAC1Click(Sender: TObject);
    procedure ReconnectSocketTimerTimer(Sender: TObject);
    procedure tbVersionClick(Sender: TObject);
    procedure RzBitBtn38Click(Sender: TObject);
    procedure RzBitBtn33Click(Sender: TObject);
    procedure btn_FileOpen1Click(Sender: TObject);
    procedure btn_FileSave1Click(Sender: TObject);
    procedure DLRadioGroupChange(Sender: TObject; ButtonIndex: Integer);
    procedure DLCheckBoxChange(Sender: TObject);
    procedure btnRegisterClearClick(Sender: TObject);
    procedure Memo_CardNoChange(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Btn_DelCardNoBtn_DelAllCardNoClick(Sender: TObject);
    procedure RzButton3Click(Sender: TObject);
    procedure LMDGlobalHotKey1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox_IDNOChange(Sender: TObject);
    procedure rgDeviceNoChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure RzButton4Click(Sender: TObject);
    procedure Group_DeviceBaseChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure Btn_CheckStatusClick(Sender: TObject);
    procedure btnCheckCdVerClick(Sender: TObject);
    procedure RzGroup3Items3Click(Sender: TObject);
    procedure RzBitBtn43Click(Sender: TObject);
    procedure Btn_RDoorOPenClick(Sender: TObject);
    procedure Btn_RDoorCloseClick(Sender: TObject);
    procedure miSoundClick(Sender: TObject);
    procedure btWavClick(Sender: TObject);
    procedure edFileChange(Sender: TObject);
    procedure btPlayClick(Sender: TObject);
    procedure btAllClearClick(Sender: TObject);
    procedure btSelectClearClick(Sender: TObject);
    procedure rdSelectCardNoClick(Sender: TObject);
    procedure chk_BroadFileClick(Sender: TObject);
    procedure btBroadFileClick(Sender: TObject);
    procedure Group_BroadDeviceBaseChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure bt_BroadClick(Sender: TObject);
    procedure edCardChange(Sender: TObject);
    procedure btBroadFileSetClick(Sender: TObject);
    procedure btCaptureSaveClick(Sender: TObject);
    procedure btBroadStopClick(Sender: TObject);
    procedure BroadTimerTimer(Sender: TObject);
    procedure broadStopTimerTimer(Sender: TObject);
    procedure btExe1Click(Sender: TObject);
    procedure edExe1Change(Sender: TObject);
    procedure edYYYYKeyPress(Sender: TObject; var Key: Char);
    procedure edMMKeyPress(Sender: TObject; var Key: Char);
    procedure edDDKeyPress(Sender: TObject; var Key: Char);
    procedure edMMExit(Sender: TObject);
    procedure edDDExit(Sender: TObject);
    procedure ck_YYMMDDClick(Sender: TObject);
    procedure btBroadRetryClick(Sender: TObject);
    procedure Group_BroadDownLoadBaseChange(Sender: TObject;
      Index: Integer; NewState: TCheckBoxState);
    procedure BroadSleep_TimerTimer(Sender: TObject);
    procedure btBroadFileRetryClick(Sender: TObject);
    procedure btCardRegClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_TimecheckClick(Sender: TObject);
    procedure btn_CuerrentClick(Sender: TObject);
    procedure mn_FileLoadClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_PlayClick(Sender: TObject);
    procedure btn_MomentClick(Sender: TObject);
    procedure btn_StopClick(Sender: TObject);
    procedure bt_CardDeleteClick(Sender: TObject);
    procedure RzBitBtn48Click(Sender: TObject);
    procedure RzBitBtn49Click(Sender: TObject);
    procedure RzBitBtn50Click(Sender: TObject);
    procedure RzBitBtn51Click(Sender: TObject);
    procedure RzBitBtn52Click(Sender: TObject);
    procedure btn_ControlRegClick(Sender: TObject);
    procedure btn_ControlSearchClick(Sender: TObject);
    procedure chk_SendTimeClick(Sender: TObject);
    procedure btn_CardDownLoadStopClick(Sender: TObject);
    procedure btn_SortClick(Sender: TObject);
    procedure btn_SortDispClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure RzBitBtn53Click(Sender: TObject);
    procedure RzBitBtn54Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnKTLanSearchClick(Sender: TObject);
    procedure btnKTLanSetClick(Sender: TObject);
    procedure chk_LocalClick(Sender: TObject);
    procedure KTWinsockTriggerAvail(CP: TObject; Count: Word);
    procedure RzBitBtn58Click(Sender: TObject);
    procedure RzBitBtn59Click(Sender: TObject);
    procedure RzButton5Click(Sender: TObject);
    procedure RzButton6Click(Sender: TObject);
    procedure RzBitBtn60Click(Sender: TObject);
    procedure tbDeviceCodeClick(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure RzBitBtn45Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btn_ResetClearClick(Sender: TObject);
    procedure btn_ResetRegClick(Sender: TObject);
    procedure btn_ResetSearchClick(Sender: TObject);
    procedure ed_ResetMinChange(Sender: TObject);
    procedure chk_ResetClick(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure ed_AvrResetTimeChange(Sender: TObject);
    procedure ed_TotResetCntChange(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTempSaveClick(Sender: TObject);
    procedure btnTempRestoreClick(Sender: TObject);
    procedure chk_ADClick(Sender: TObject);
    procedure RzBitBtn78Click(Sender: TObject);
    procedure RzBitBtn70Click(Sender: TObject);
    procedure btn_PortLoopRegClick(Sender: TObject);
    procedure btnPtMoniStartClick(Sender: TObject);
    procedure btnPtMoniStopClick(Sender: TObject);
    procedure btnPtMoniStatClick(Sender: TObject);
    procedure btnPTmonitorClearClick(Sender: TObject);
    procedure btnPTMoniterLineClick(Sender: TObject);
    procedure test1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btn_TestClick(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
    procedure TabVTimerTimer(Sender: TObject);
    procedure RzBitBtn73Click(Sender: TObject);
    procedure ck_LogClick(Sender: TObject);
    procedure RzGroup3Items5Click(Sender: TObject);
    procedure btn_FtpFilesearchClick(Sender: TObject);
    procedure btn_regftpClick(Sender: TObject);
    procedure btn_FTPRootClick(Sender: TObject);
    procedure btn_GetIPClick(Sender: TObject);
    procedure WebBrowser1NavigateComplete2(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure FTP1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure btn_ftpSendFilesearchClick(Sender: TObject);
    procedure btn_FtpSendClick(Sender: TObject);
    procedure btnPTmonitorClear2Click(Sender: TObject);
    procedure btnPTMoniterLine2Click(Sender: TObject);
    procedure btn_ftpStopClick(Sender: TObject);
    procedure RzBitBtn75Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CB_IPListChange(Sender: TObject);
    procedure rg_ftpsendgubun2Click(Sender: TObject);
    procedure RzBitBtn74Click(Sender: TObject);
    procedure btn_FilePlayClick(Sender: TObject);
    procedure btn_FileStopClick(Sender: TObject);
    procedure btn_FileSkipClick(Sender: TObject);
    procedure btnZoneRegClick(Sender: TObject);
    procedure btnZoneSearchClick(Sender: TObject);
    procedure chk_FTPMonitoringFirmwareClick(Sender: TObject);
    procedure chk_FTPMonitoring1Click(Sender: TObject);
    procedure chk_GaugeFirmwareClick(Sender: TObject);
    procedure chk_Gauge1Click(Sender: TObject);
    procedure ed_ftpLocalipFirmwareChange(Sender: TObject);
    procedure ed_ftpLocalipChange(Sender: TObject);
    procedure cmb_ftplocalportFirmwareChange(Sender: TObject);
    procedure cmb_ftplocalportChange(Sender: TObject);
    procedure ed_cardFileChange(Sender: TObject);
    procedure ed_ftpSendFilenameChange(Sender: TObject);
    procedure btn_CardFileClick(Sender: TObject);
    procedure chk_FTPMonitoringClick(Sender: TObject);
    procedure chk_FTPCardMonitoringClick(Sender: TObject);
    procedure chk_GaugeClick(Sender: TObject);
    procedure chk_FTPCardGaugeClick(Sender: TObject);
    procedure btn_FTPCardSendClick(Sender: TObject);
    procedure ed_FTPCardIPChange(Sender: TObject);
    procedure cmb_FTPCardPortChange(Sender: TObject);
    procedure ed_ftplocalportChange(Sender: TObject);
    procedure ed_ftplocalportFirmwareChange(Sender: TObject);
    procedure ed_FTPCardPortChange(Sender: TObject);
    procedure btnFirmwareChangeClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure mn_UpdateClick(Sender: TObject);
    procedure RzButton7Click(Sender: TObject);
    procedure btn_nextPortClick(Sender: TObject);
    procedure RzBitBtn46Click(Sender: TObject);
    procedure sg_WiznetListClick(Sender: TObject);
    procedure IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure Edit_LocateChange(Sender: TObject);
    procedure LMDListBox1Click(Sender: TObject);
    procedure btn_GetPositionClick(Sender: TObject);
    procedure btn_getCardNoClick(Sender: TObject);
    procedure bt_CardSearchClick(Sender: TObject);
    procedure IdUDPServer2UDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure N18Click(Sender: TObject);
    procedure btn_CardBinCreatClick(Sender: TObject);
    procedure btn_CardStructClick(Sender: TObject);
    procedure chk_CardBinClick(Sender: TObject);
    procedure chk_CardBinHDClick(Sender: TObject);
    procedure RzGroup3Items6Click(Sender: TObject);
    procedure btn_DeviceStateClick(Sender: TObject);
    procedure Btn_Send41Click(Sender: TObject);
    procedure ed_FinDT141Exit(Sender: TObject);
    procedure ed_FinDT241Exit(Sender: TObject);
    procedure ed_FinDT341Exit(Sender: TObject);
    procedure ed_FinDT441Exit(Sender: TObject);
    procedure Btn_Clear41Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure cmb_DoorControlTimeCloseUp(Sender: TObject);
    procedure cmb_DoorControlTimeDropDown(Sender: TObject);
    procedure btn_CardSaveClick(Sender: TObject);
    procedure ComboBox_WatchTypeChange(Sender: TObject);
    procedure ed_alertSirenTimeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_alertLampTimeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_AlertLampRegClick(Sender: TObject);
    procedure btn_AlertLampSearchClick(Sender: TObject);
    procedure btn_AlertLampTimeRegClick(Sender: TObject);
    procedure btn_AlertLampTimeSearchClick(Sender: TObject);
    procedure chk_CardPositionClick(Sender: TObject);
    procedure chk_CardPosition2Click(Sender: TObject);
    procedure btnDoorStateClick(Sender: TObject);
    procedure N110Click(Sender: TObject);
    procedure ECU00Click(Sender: TObject);
    procedure RzBitBtn47Click(Sender: TObject);
    procedure btn_graphScheduleClick(Sender: TObject);
    procedure btn_DoorTypeRegClick(Sender: TObject);
    procedure rg_ConTypeClick(Sender: TObject);
    procedure LMDListBox1DblClick(Sender: TObject);
    procedure stVerTypeClick(Sender: TObject);
    procedure pan_vertypeClick(Sender: TObject);
    procedure Label337Click(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure sg_WiznetListDblClick(Sender: TObject);
    procedure btn_AckSendClick(Sender: TObject);
    procedure btn_CackSendClick(Sender: TObject);
  private
    //S-TEC 추가에 따른 부분
    procedure FormProgramSetting(aProgramType:integer);
  private
    L_stDBGridSeq : integer;
    L_bDirectSearch : Boolean;
    L_nDirectConnectWaitTime : integer;
    L_bDirectClientConnect : Boolean;
    L_bCTRLKeyPress : Boolean;
    procedure AnyMessage(var Msg: TMsg; var Handled: Boolean);
  private
    L_nSeq : integer;
    L_nDoorItemIndex : integer;
    L_nPortNum : integer;
    stPW : string;
    L_Direct : string;
    stPasswdErr : string;
    bStop : Boolean;
    bStart : Boolean;
    bFileSkip : Boolean;
    bCardDownLoadStop : Boolean;
    FTPSockList : TStringList;
    SockNo : integer;
    nPreTop,nPreLeft,nPreWidth,nPreHeight:integer;
    nTop,nLeft,nWidth,nHeight:integer;
    bMove:Boolean;
    FFTPUSE: Boolean;
    bDecoderFormat:Boolean;
    { Private declarations }
    function LanPanelCheck:boolean;
    function  GetSetData:string;
    procedure LanControl_Yellow;
    procedure LanControl_White;
    procedure ViewLocal;
    procedure HideLocal;
    //카드리더 타입 등록
    function RegCardReaderType(aDeviceID:string;nType:integer):Boolean;
    procedure ConfigInit;
    function  DataPacektProcess( aPacketData: string):Boolean;
    function  DecoderDataPacektProcess( aPacketData: string):Boolean;
    procedure AddEventList(aRealData: String);
    function KTNetSendPacket(aCmd, aSendData: string):Boolean;
    Procedure PollingAck(aDeviceID: String);

    procedure Init_IDNO_ComboBox(aComBoBox:TRzComboBox);
    Procedure RegDataProcess(aPacketData: String);
    procedure RemoteDataProcess(aPacketData: String);
    Procedure AccessDataProcess(aPacketData: String;aReal:Boolean=True);
    procedure PTMonitoringProcess(aPacketData:string);

    // FTP 사용 유무 체크
    procedure RcvFTPCheck(aPacketData:string);

    {커스 관련 등록 항목}
    //관제용 ID 등록/조회
    Procedure RegLinkusID(aDeviceID: String;aLinkusId:String);
    Procedure CheckLinkusID(aDeviceID: String);
    Procedure RcvLinkusId(aPacketData:String);
    //관제 전화번호 등록 조회
    Procedure RegLinksTellNo(aDeviceID:String;aNo:Integer;aTellno:String);
    Procedure CheckLinkusTellNo(aDeviceID:String;aNo:Integer);
    Procedure RcvLinkusTelNo(aPacketData:String);
    //국선체크
    Procedure RegLinkusPt(aDeviceID:String;aTime:String);
    Procedure CheckLinkusPt(aDeviceID:String);
    Procedure RcvLinkusPt(aPacketData:String);

    //국선체크 대기시간
    Procedure RegLinkusPtDelay(aDeviceID:String;aTime:String);

    /// 방법  등록 /제어
    Procedure RegID(aDeviceID: String);
    Procedure RegCR(aDeviceID: String; aReaderNo: Integer;aWCardBit:string);
    Procedure ReCoverCR(aDeviceID: String; aReaderNo: Integer);
    Procedure RegSysInfo(aDeviceID: String);
    Procedure RegRelay(aDeviceID: String; aRelayNo: Integer);
    Procedure RegPort(aDeviceID: String; aPortNo: Integer);
    Procedure RecoverPort(aDeviceID: String; aPortNo: Integer);
    Procedure RegUsedDevice(aDeviceID: String; UsedDevice:String);

    Procedure CheckUsedDevice(aDeviceID,aCmd: String);
    Procedure RegUsedAlarmDisplay(aDeviceID: String; UsedDevice:String);
    Procedure CheckUsedAlarmDisplay(aDeviceID: String);
    Procedure CheckID(aDeviceID: String);
    Procedure CheckCR(aDeviceID: String; aReaderNo: Integer);
    Procedure CheckSysInfo(aDeviceID: String);
    Procedure CheckRelay(aDeviceID: String; aRelayNo: Integer);
    Procedure CheckPort(aDeviceID: String; aPortNo: Integer);
    Procedure RegTellNo(aDeviceID:String;aNo:Integer;aTellno:String);
    Procedure CheckTellNo(aDeviceID:String;aNo:Integer);

    Procedure RegDialTime(aDeviceID:String;OnTime: Integer;OffTime:Integer);
    Procedure RegControlDialTime(aDeviceID:String;OnTime: Integer;OffTime:Integer);
    Procedure CheckDialTime(aDeviceID:String);
    Procedure CheckControlDialTime(aDeviceID:String);
    Procedure RegCallTime(aDeviceID:String;aTime: Integer);
    Procedure CheckCallTime(aDeviceID:String);
    Procedure RegVoiceTime(aDeviceID:String;aTime: Integer);
    Procedure CheckVoiceTime(DeviceID: String);
    Procedure RegbroadcastTime(aDeviceID:String;aTime: Integer);
    Procedure CheckbroadcastTime(aDeviceID:String);
    Procedure RegRingCount(aDeviceID:String;aCount,aCancelCount: Integer);
    Procedure CheckRingCount(aDeviceID:String);

    Procedure RcvRingCount(aPacketData:String);
    procedure RcvDeviceID(aPacketData: String);
    procedure RcvCR(aPacketData: String);
    Procedure RcvSysinfo(aPacketData: String);
    Procedure RcvRelay(aPacketData: String);
    procedure RcvLampState(acmd,aData: String);
    Procedure RcvPort(aPacketData: String);
    Procedure RcvUsedDevice(aPacketData,aRegGubun: String);
    Procedure RcvUsedAlarmdisplay(aPacketData:String);
    Procedure RcvTellNo(aPacketData:String);
    Procedure RcvVoiceTime(aPacketData:String);
    Procedure RcvCallTime(aPacketData:String);
    Procedure RcvbroadcastTime(aPacketData:String);
    //카드타입 응답
    procedure RcvCardType(aPacketData: string);
    //Reset 테이타 응답
    Procedure RcvResetData(aPacketData:string);
    //존확장기 응답
    procedure RcvZoneExInfo(aPacketData:string);


    Procedure RcvDialInfo(aPacketData:String);
    Procedure RcvControlDialInfo(aPacketData:String);
    Procedure RcvWiznetInfo(aPacketData:String);
    //KT랜정보 응답
    Function RcvKTLAN(aPacketData:string):Boolean;
    procedure KTRcvDataProcess;

    Procedure Cnt_TimeSync(aDeviceID: String; aTimeStr:String);
    Procedure Cnt_CheckVer(aDeviceID: String);
    procedure checkFTP(aDeviceID:string);//FTP 사용가능 유무 체크
    Procedure Cnt_CheckDeviceCode(aDeviceID:string);
    Procedure Cnt_CheckCdVer(aDeviceID: String; aReaderNo:Integer);
    Procedure Cnt_Reset(aDeviceID:String);
    Procedure Cnt_ClearRegister(aDeviceID:String);

    Procedure Cnt_ChangeMode(aDeviceID:String; aZoneNo:Integer; aMode:Char);
    Procedure Cnt_Random(aDeviceID:String; onOn:Boolean; aTime:Integer);
    Procedure Cnt_USerCMD(aDeviceID:String;  aData: String);
    Procedure Cnt_Relay(aDeviceID: String; aNo:String; aFunction:Char; aTime:String);
    Procedure Cnt_RemoteTellCall(aDeviceID: String; CallTime: String; aSpeaker:Char; aTellNo:String);

    /// 출입통제  등록 /제어
    procedure RegSch(aDeviceID: String);   // 스케줄 등록
    Procedure CheckSch(aDeviceID: String); // 스케줄 조회
    Procedure RcvSch(aRealData: String);       // 스케쥴데이터 응답

    Procedure RegFoodTime(aDeviceID: String); //식사시간등록
    Procedure RcvFoodTime(aRealData: String);     //식사시간응답

    procedure ClearSysInfo2;
    procedure RegSysInfo2(aDeviceID,aDoorNo: String);
    procedure RecoverySysInfo2(DeviceID,aDoorNo: String);
    procedure CheckSysInfo2(aDeviceID: String);
    Procedure EmptySysinfo2;
    Procedure RcvSysinfo2(aRealData: String);
    Procedure RcvAccControl(aRealData:String);
    Procedure RcvAccEventData(aRealData,aDeviceID:String;bReal:Boolean=True);
    Procedure RcvAccXEventData(aRealData,aDeviceID:String;bReal:Boolean=True);
    Procedure RcvDoorEventData(aRealData:String);
    Procedure RcvCardRegAck(aRealData:String);
    Procedure RcvTelEventData(aRealData:String);
    Procedure DoorControl(DeviceID:String; aNo:Integer; aControlType:Char; aControl:Char);

    Procedure FillArray_Send; //임의 데이터 전송용 EditBox Array

    {펌웨에 다운로드 관련 루틴}
    Procedure LoadINI_firmwareInfo;
    function  CheckRomVer:Boolean;
    Procedure DownLoadRom(aDeviceID:String;aType:Integer;aFileName: String);
    Procedure SendRomData(aDeviceID:String;aType:Integer; adata: String);
    Procedure Write_ListBox_DownLoadInfo(aData: String);
    Procedure SendFSC(aDeviceID :string);
    Procedure DownloadFMM(aDeviceID :string);
    Procedure ReceiveFI(aPacketData:String);   //FI:Flash Memory Map
    Procedure ReceiveFPFD(aPacketData:String);
    Procedure ReceiveFX(aPacketData:String);   //FX:Flash Start Command

    procedure CD_PositionDownLoad(aDeviceID,aCardNo,aCardPosition:String;func:Char;aLength:integer = 10;bHex : Boolean = False);
    Procedure CD_DownLoad(aDevice: String;aCardNo:String;func:Char;aLength:integer = 10;bHex : Boolean = False);
    Function  GetCardDownLoadData(aCardNo:String;func:Char;aLength:integer = 10;bHex : Boolean = False):string;
    Function  GetHEXCardDownLoadData(aCardNo:String;aCount:integer):string;
    Procedure CD_XDownLoad(aDevice: String;aCardNo:String;func:Char);
    Procedure CardAllDownLoad(aFunc:Char);
    Procedure ClearWiznetInfo;
    function  PacketFormatCheck(aData: String; var aLeavePacketData:String;var aPacketData:String):integer; //데코더 포맷인지 체크하자.
    function  CheckDataPacket(aData: String; var bData:String;var aPacketData:string):integer;
    function  ChekCSData(aData: String;nLength:integer):Boolean;
    function  getCheckSumData(aData:string;nLength:integer):String;
    function  CheckDecorderDataPacket(aData: String; var bData:String;var aPacketData:string):integer;
    procedure FirmwareProcess(aPacketData: String);
    procedure FirmwareProcess2(aPacketData: String);
    Procedure SendFPData(aDeviceID: String; aNo:Integer;aMode:string);
    Procedure SendFDData(aDeviceID: String; aNo:Integer;aMode:string);
    Procedure SendFPBineryData(aDeviceID: String; aNo,aSize:Integer;aMode:string);
    Procedure SendFDBineryData(aDeviceID: String; aNo,aSize:Integer;aMode:string);
    Procedure SendRomUpDateInfo;
    Procedure SendRomBroadFileInfo; //브로드 파일 전송

    Procedure SendCancelRomUpDate(aDeviceID:String);

    Procedure ClearLanInfo;

    Procedure Append_Memo_CardNo(aCardNo:String);

   // 경고음을 내주기 위해 추가
    Function WarningCompare(Data:String):Boolean;   //경고 메시지가 있는지 체크해 보자
    Function DataCompare(Data:String;no:Integer):Boolean;  //해당항목과 데이터 비교
    Procedure WarningBeep(no:Integer); //해당항목의 소리를 울려주자
    Procedure ExeFile(no:Integer); //해당항목의 파일을 실행해 주자

    //카드데이터 브로드캐스팅 부분 추가
    Function GetSendCount():Integer;
    Procedure SendServerBroadData;
    Procedure SendMainBroadData(ID:String; NO:Integer); //Main 주관 요청 데이터 전송
    Function MakeBroadData(No:Integer):String;
    Procedure BroadCastProcess(aPacketData:String);
    Function GetBroadControlerNum(CheckGroup:TRZCheckGroup):String;
    Function GetFTPControlerNum(CheckGroup:TRZCheckGroup):String;
    Function BroadControlNumConvert(Num:Integer):String;
    Function BroadText2Hex(stTemp:String):String; //File format을 전송포맷 변경
    Procedure BroadErrorProcess(aPacketData:String);  //브로드 데이터 에러 내역 정리
    Procedure PrintLog(aData:String);
    procedure GageMonitor(aPacketData:string);

    procedure AutoCardDownLoad(bCardNo,aMode,aDeviceID:string;aLength:integer = 10;bHex:Boolean = False); //카드 자동등록모드

    procedure Edit_right_align(Sender: TObject; edt_name: TEdit);

    //상태표시기 등록 처리
    procedure RegStateIndicateProcess(aPacketData:string);
    procedure StateIndicateAccessDataProcess(aPacketData:string);
    procedure setFTPUSE(const Value: Boolean);
    procedure DetailWizNetList(aWiznetData:string);

    function GetCardNoToPosition(aPacketData:string):string;
    function GetPositionToCardNo(aPacketData:string):string;
    function GetEventData(aVer,aPacketData:string):string;

    procedure DeviceState1Show(aRealData:string);
    procedure DeviceState2Show(aRealData:string);
    procedure DeviceDoorStateShow(aDeviceID,aData:string);
    procedure DeviceStateClear;

    Function FingerCheckSum(aData:string):char;

  private
    { Private declarations }
    procedure IdFTPServer1UserLogin( ASender: TIdFTPServerThread; const AUsername, APassword: string; var AAuthenticated: Boolean ) ;
    procedure IdFTPServer1ListDirectory( ASender: TIdFTPServerThread; const APath: string; ADirectoryListing: TIdFTPListItems ) ;
    procedure IdFTPServer1RenameFile( ASender: TIdFTPServerThread; const ARenameFromFile, ARenameToFile: string ) ;
    procedure IdFTPServer1RetrieveFile( ASender: TIdFTPServerThread; const AFilename: string; var VStream: TStream ) ;
    procedure IdFTPServer1StoreFile( ASender: TIdFTPServerThread; const AFilename: string; AAppend: Boolean; var VStream: TStream ) ;
    procedure IdFTPServer1RemoveDirectory( ASender: TIdFTPServerThread; var VDirectory: string ) ;
    procedure IdFTPServer1MakeDirectory( ASender: TIdFTPServerThread; var VDirectory: string ) ;
    procedure IdFTPServer1GetFileSize( ASender: TIdFTPServerThread; const AFilename: string; var VFileSize: Int64 ) ;
    procedure IdFTPServer1DeleteFile( ASender: TIdFTPServerThread; const APathname: string ) ;
    procedure IdFTPServer1ChangeDirectory( ASender: TIdFTPServerThread; var VDirectory: string ) ;
    procedure IdFTPServer1CommandXCRC( ASender: TIdCommand ) ;
    procedure IdFTPServer1DisConnect( AThread: TIdPeerThread ) ;
    procedure IdFTPServer1Connect( AThread: TIdPeerThread ) ;
    procedure FTPSERVERStart();
  published
    property FTPUSE:Boolean read FFTPUSE write setFTPUSE;
  protected
    function TransLatePath( const APathname, homeDir: string ) : string;
    function GetDecordeFormat(aDecMCode,aDecCMD,aMsgNo,aData,aDecTail:string):string;
    function GetDecorderRecvData(aPacketData:string):string;
    function GetDecoderInfo(aPacketData:string):string;
    function DecoderSendPacket(aDecMCode,aDecCMD,aMsgNo,aData,aDecTail:string;bVisible:Boolean = True):Boolean;
  public
    { Public declarations }
    Rcv_MsgNo     : Char;
    Send_MsgNo    : Integer;
    Array_SendEdit: Array[0..63] of TUser_Send;
    Array_FingerEdit : Array[0..16] of  TFinger_Send;
    OffCount      : Integer;
    IsDownLoad    : Boolean;
    EventIndex    : Integer;
    OnMoni        : Boolean;
    WiznetData    : String;
    WizNetRegMode : Boolean;
    WizNetRcvACK  : Boolean;
    DoCloseWinsock: Boolean;
    StopConnection: Boolean;
    OnWritewiznet : Boolean;
    BroadID       : String; //브로드 파일 다운로드시 순서
    TempSave      :string;
    bDoorSchRegShow : Boolean;
    bWizeNetLanRecv : Boolean;
    function  SendPacket(aDeviceID: String;aCmd:Char; aData: String;aVer:string):Boolean;
    procedure ACC_sendData(aDeviceID:CString; aData:CString;aVer:string);
    procedure  WndProc(var Message: TMessage);Override;

  end;

var
  MainForm: TMainForm;
  ComBuff: String;
  LastMsg: String;
  aFI: TFirmwareDownInfo;


  DownLoadList: TStringList;
  ROM_FlashWrite: TStringList;
  ROM_FlashData : TStringList;
  ROM_BineryFlashWrite : PChar;
  ROM_BineryFlashData : PChar;

  DownLoadType: Integer;
  DownLoadCount: Integer;
  CancelDownload: Boolean;
  IsFirmwareDownLoad: Boolean;
  SockErroCode: Integer;
  CountCardReadData: Integer;
  //카드 브로드 캐스팅 부분 추가
  CardBroadSendCount : Integer;  //총 전송할 건수
  CurCBCount : Integer;          //현재 진행중인 건수
  BroadControlerNum : String;    //ControlerNum 9자리
  BroadFileList: TStringList;    //Broad File List
  BroadSaveFileList: TStringList;    //Broad File Save List
  BroadSendData : String;        //메모리에 저장후 응답이 없을때 2분간 전송시도
  BroadOrgDataList : TStringList; //브로드데이터 원본
  BroadSendDataList : TStringList;  //브로드데이터 전송내역 저장
  BroadErrorDataList : TStringList;  //브로드데이터 에러내역 저장
  BroadRetryDataList : TStringList;  //브로드데이터 재송신 내역
  startTime : Tdatetime;
  bBroadFileSendERR : Boolean; //브로드파일 송신 성공유무
  KTRecvData : string;
  ECUList : TStringList;
  bFormStateIndicateShow : Boolean; //상태표시기 화면 표시 여부
  bAutoDeviceInfoSave :Boolean;
  nFileSeq : integer;
  LogFileName : string;
  bConnected : Boolean;
  Sent_Ver : string;
  bWizNetModule : Boolean;

implementation

uses
  UStateIndicate,FileInfo, DoorSchReg, uProcess, uMonitorMain, uLogin,
  uConfig,DIMime, uDeviceRegMessage, uSelect,uCommon;

{$R *.dfm}

procedure TMainForm.KTWinsockTriggerAvail(CP: TObject; Count: Word);
var
  st : string;
  i : integer;
begin
  st:= '';
  for i := 1 to Count do st := st + KTWinsock.GetChar;
  KTRecvData := KTRecvData + st;
  KTRcvDataProcess;
end;

//카드번호 10자리 이상 처리
procedure TMainForm.RcvAccXEventData(aRealData,aDeviceID: String;bReal:Boolean=True);
var
  st: String;
  aCardNo: String;
  NoStr: String;
  i : Integer;
  nCardLength : integer;
begin
  st := GetAccEventString(aRealData);
  //카드번호 추출
  if aRealData[24] > '9' then nCardLength :=  10 + (Ord(aRealData[24]) - Ord('A'))
  else nCardLength := strtoint(aRealData[24]);
  {8.카드번호/출입번호}
  aCardNo:= copy(aRealData,25,nCardLength);  //카드번호 10자리 수정(현재 앞 00 두바이트 사용 안함)
  st:= st+ aCardNo + ';' ;//+ '000000';

  NoStr:= InttoStr(CountCardReadData);
  st:= NoStr + ' ;'+st;

  RzFieldStatus1.Caption := stringReplace(st,';','   ',[rfReplaceAll]);
  LMDListBox1.Items.Add(st);

  for i := 0 to LMDListBox1.Count-1 do
  begin
     if LMDListBox1.Selected[i] then LMDListBox1.Selected[i]:= False;
  end;
  LMDListBox1.Selected[LMDListBox1.Count-1]:= True;
  Inc(CountCardReadData);
  LMDListBox1.ItemIndex:= LMDListBox1.Items.Count -1;

   // 자동 등록 모드이면...
  if bReal then
  begin
    if cbAutoReg.Checked = True then AutoCardDownLoad(aCardNo,'X',aDeviceID);
  end;

end;

// 바이너리 데이터 롬파일 업데이트
procedure TMainForm.SendFDBineryData(aDeviceID: String; aNo,
  aSize: Integer;aMode:string);
var
  st: String;
  iFileLength: Integer;
  bSendData : Boolean;
  stSendData : string;
begin
  if aNo = 0 then
  begin
    ShowMessage('flash data 요청번지가 0 입니다.');
    Exit;
  end;
  if ROM_BineryFlashData = nil then
  begin
    if aMode = 'M' then
    begin
      st:= 'fD00' +FillZeroNumber(0,7);
      SendPacket(aDeviceID,'F',st,Sent_Ver);
    end;
    ShowMessage('전송 가능한 flash data 가 없습니다.');
    Exit;
  end;

  bSendData := False;
  iFileLength := length(ROM_BineryFlashData);
  if iFileLength > 0 then
  begin
    //요청 데이터가 끝난 시점인지...체크
    if iFileLength < ((aNo - 1) * aSize) then
    begin
      bSendData := False;
    end
    else
    begin
      //여기에서 데이터 셋팅
      bSendData := True;
      if (aNo * aSize) < iFileLength then
      begin
        stSendData := copy(ROM_BineryFlashData,((aNo - 1) * aSize) + 1,aSize);
      end
      else
      begin
        stSendData := copy(ROM_BineryFlashData,((aNo - 1) * aSize) + 1,iFileLength -((aNo - 1) * aSize));
      end;
    end;
  end;
  if Not bSendData then
  begin
    //보낼 데이터가 없음
    if aMode = 'M' then   st:= 'fD00' + FillZeroNumber(0,7)
    else if aMode = 'S' then st:= 'fD00' ;
    SendPacket(aDeviceID,'F',st,Sent_Ver);
    Write_ListBox_DownLoadInfo('flash data 전송:'+InttoStr(aNo));
  end
  else
  begin
    //데이터송신
    if aMode = 'M' then st:= 'fD00' + FillZeroNumber(aNo,7) + stSendData
    else if aMode = 'S' then st:= 'fD00' + stSendData;
    SendPacket(aDeviceID,'F',st,Sent_Ver);
    Write_ListBox_DownLoadInfo('flash data 전송:'+InttoStr(aNo));
  end;
end;

procedure TMainForm.SendFPBineryData(aDeviceID: String; aNo,
  aSize: Integer;aMode:string);
var
  st: String;
  iFileLength: Integer;
  bSendData : Boolean;
  stSendData : string;
begin
  if aNo = 0 then
  begin
    ShowMessage('flash write 요청번지가 0 입니다.');
    Exit;
  end;

  if ROM_BineryFlashWrite = nil then
  begin
    st:= 'fP00' +FillZeroNumber(0,7);
    SendPacket(aDeviceID,'F',st,Sent_Ver);
    ShowMessage('전송 가능한 flash write 가 없습니다.');
    Exit;
  end;

  bSendData := False;
  iFileLength := length(ROM_BineryFlashWrite);
  if iFileLength > 0 then
  begin
    //요청 데이터가 끝난 시점인지...체크
    if iFileLength < ((aNo - 1) * aSize) then
    begin
      bSendData := False;
    end
    else
    begin
      //여기에서 데이터 셋팅
      bSendData := True;
      if (aNo * aSize) < iFileLength then
      begin
        stSendData := copy(ROM_BineryFlashWrite,((aNo - 1) * aSize) + 1,aSize);
      end
      else
      begin
        stSendData := copy(ROM_BineryFlashWrite,((aNo - 1) * aSize) + 1,iFileLength -((aNo - 1) * aSize));
      end;
      RzFieldStatus1.Caption := inttostr(length(stSendData)) + ':' + stSendData;
    end;
  end;
  if Not bSendData then
  begin
    //보낼 데이터가 없음
    if aMode = 'M' then st:= 'fP00' +FillZeroNumber(0,7)
    else if aMode = 'S' then st:= 'fP00';
    SendPacket(aDeviceID,'F',st,Sent_Ver);
    Write_ListBox_DownLoadInfo('flash write 전송:'+InttoStr(aNo));
  end
  else
  begin
    //데이터송신
    if aMode = 'M' then st:= 'fP00' +FillZeroNumber(aNo,7)+ stSendData
    else if aMode = 'S' then  st:= 'fP00' + stSendData;
    SendPacket(aDeviceID,'F',st,Sent_Ver);
    Write_ListBox_DownLoadInfo('flash write 전송:'+InttoStr(aNo));
  end;

end;

//롬데이터 다운로드 수신
procedure TMainForm.ReceiveFPFD(aPacketData: String);
var
  st: string;
  aDeviceID: String;
begin

  aDeviceID:= Copy(aPacketData,8,G_nIDLength + 2);

  Off_Timer.enabled:= False;
  OffCount:=0;
  ProgressBar1.Position:= DownLoadCount;

  Inc(DownLoadCount);

  if DownLoadList.Count > 0 then DownLoadList.Delete(0);

  if DownLoadList.Count < 1 then
  begin
    if DownLoadType > 1 then
    begin
      SetForegroundWindow(MainForm.Handle);
      MainForm.SetFocus;
      //Write_ListBox_DownLoadInfo('Flash Data File 다운로드가 완료 되었습니다.');
      SendFSC(aDeviceID);
      //Write_ListBox_DownLoadInfo('Flash Start Command 전송');
      //ShowMessage('다운로드가 완료 되었습니다.');
      GroupBox23.visible := False;
      IsFirmwareDownLoad := False;

    end else
    begin
      //Write_ListBox_DownLoadInfo('Flash Writer File 다운로드가 완료 되었습니다.');
      if aFI.FDFN <> '' then
      begin
        DownLoadRom(aDeviceID,2,aFI.FDFN);
      //Write_ListBox_DownLoadInfo('Flash Data File Name 전송시작');
      end;
    end;
  end else
  begin
    st:= DownLoadList[0];
    SendRomData(aDeviceID,Downloadtype,st);
    Label1.Caption:= InttoStr(ProgressBar1.Position)+'/'+ InttoStr(ProgressBar1.Max);
  end;
   
end;

procedure TMainForm.BroadSleep_TimerTimer(Sender: TObject);
var
  stData:String;
  st:String;
  CMD:String;
  Loop:Integer;
  aTime: TDatetime;

begin
  if bBroadFileSendERR then
  begin
    bBroadFileSendERR := False;
    showmessage('브로드 파일 전송중 에러가 있습니다. 재전송 하여 주세요.');
    BroadSleep_Timer.enabled := false;
    exit;
  end;

  case strtoint('0' + BroadID)  of
    1 : {FU송신완료}
          begin
            CMD:= 'FI00';
            BroadID := '02';
            st:= CMD + aFI.FMM;
            CardBroadSendCount := 1;
            ProgressBar1.Max := 1;
            CurCBCount := 0;
            if rdMode.ItemIndex = 2 then stData := 'BS' + BroadID + FillZeroNumber(1,7)
            else if rdMode.ItemIndex = 3 then stData := 'BI' + BroadID + FillZeroNumber(1,7) ;           //ID가 02 이면 Fu송신

            st:= 'BD' + BroadID + FillZeroNumber(1,7) + BroadControlerNum + st;
            BroadOrgDataList.Clear;
            BroadOrgDataList.Add(st);
            BroadSendDataList := BroadOrgDataList;   //다음 송신 데이터 리스트에 추가

            //데이터 전송
            SendPacket(Edit_CurrentID.text + '00','*',stData,Sent_Ver);
            Write_ListBox_DownLoadInfo('Flash Memory Map 전송');
          end;
    2 : {FI송신완료}
          begin
            BroadID := '03';
            CurCBCount := 0;
            ProgressBar1.Max := ROM_FlashWrite.Count;
            CardBroadSendCount := ROM_FlashWrite.Count;
            if rdMode.ItemIndex = 2 then stData := 'BS' + BroadID + FillZeroNumber(ROM_FlashWrite.Count,7)
            else if rdMode.ItemIndex = 3 then stData := 'BI' + BroadID + FillZeroNumber(ROM_FlashWrite.Count,7) ;           //ID가 02 이면 Fu송신

            //st:= 'BD' + BroadID + FillZeroNumber(1,7) + BroadControlerNum + st;
            BroadOrgDataList.Clear;
            for Loop :=0 to ROM_FlashWrite.count-1 do
            begin
              st:= 'fP00'+FillZeroNumber(Loop + 1,7) + ROM_FlashWrite[Loop];
              st:= 'BD' + BroadID + FillZeroNumber(Loop + 1,7) + BroadControlerNum + st;

              BroadOrgDataList.Add(st)
            end;
            BroadSendDataList := BroadOrgDataList;   //다음 송신 데이터 리스트에 추가

            //데이터 전송
            SendPacket(Edit_CurrentID.text + '00','*',stData,Sent_Ver);
            Write_ListBox_DownLoadInfo('flash write 전송:'+InttoStr(CardBroadSendCount) + '건');
          end;
    3 : {FP송신완료}
          begin
            BroadID := '04';
            CurCBCount := 0;
            CardBroadSendCount := ROM_FlashData.Count;
            ProgressBar1.Max := CardBroadSendCount;
            if rdMode.ItemIndex = 2 then stData := 'BS' + BroadID + FillZeroNumber(ROM_FlashData.Count,7)
            else if rdMode.ItemIndex = 3 then stData := 'BI' + BroadID + FillZeroNumber(ROM_FlashData.Count,7) ;           //ID가 02 이면 Fu송신

            //st:= 'BD' + BroadID + FillZeroNumber(1,7) + BroadControlerNum + st;
            BroadOrgDataList.Clear;
            for Loop :=0 to ROM_FlashData.count-1 do
            begin
              st:= 'fD00'+FillZeroNumber(Loop + 1,7) + ROM_FlashData[Loop];
              st:= 'BD' + BroadID + FillZeroNumber(Loop + 1,7) + BroadControlerNum + st;

              BroadOrgDataList.Add(st)
            end;
            BroadSendDataList := BroadOrgDataList;   //다음 송신 데이터 리스트에 추가

            //데이터 전송
            SendPacket(Edit_CurrentID.text + '00','*',stData,Sent_Ver);
            Write_ListBox_DownLoadInfo('flash Data 전송:'+ InttoStr(CardBroadSendCount) + '건');

          end;
    4 : {FD송신완료}
          begin
            BroadID := '05';
            CurCBCount := 0;
            CardBroadSendCount := 1;
            ProgressBar1.Max := CardBroadSendCount;
            if rdMode.ItemIndex = 2 then stData := 'BS' + BroadID + FillZeroNumber(1,7)
            else if rdMode.ItemIndex = 3 then stData := 'BI' + BroadID + FillZeroNumber(1,7) ;           //ID가 02 이면 Fu송신

            Delete(aFI.FSC,9,18);
            if RzRadioGroup2.ItemIndex = 0 then   // 즉시 다운로드
            begin
              aFI.FSC:= aFI.FSC +#$20+'00/00/00 00:00:00';
            end else                              // 예약 다운로드
            begin
              RzDateTimePicker2.Date:= RzDateTimePicker1.Date;
              aTime:= RzDateTimePicker2.DateTime;
              st:= FormatDatetime('yy"/"mm"/"dd" "hh":"nn":"ss',aTime);

              aFI.FSC:= aFI.FSC + #$20 + st;
            end;

            CMD:= 'FX'+aFI.CMDCODE;
            st:= CMD + aFI.FSC;
            st:= 'BD' + BroadID + FillZeroNumber(Loop + 1,7) + BroadControlerNum + st;

            BroadOrgDataList.Clear;
            BroadSendDataList := BroadOrgDataList;   //다음 송신 데이터 리스트에 추가

            //데이터 전송
            SendPacket(Edit_CurrentID.text + '00','*',stData,Sent_Ver);

            Write_ListBox_DownLoadInfo('펌웨어 시작 시간 전송시작');
            GroupBox23.Visible := False;
            IsFirmwareDownLoad := False;
            
          end;
  end;
  BroadSleep_Timer.Enabled := False;
end;

procedure TMainForm.SendRomBroadFileInfo;
var
  stDeviceID : String;
  stData : String;
  FPAddr: Integer;
  FDAddr: Integer;
  CMD: string;
  st: string;
begin
  BroadSendDataList.Clear;
  BroadErrorDataList.Clear;
  btBroadRetry.Enabled := False;
  //여기서 한번만 Controler 셋팅해주자.
  BroadControlerNum := '';
  BroadControlerNum := GetBroadControlerNum(Group_BroadDownLoad);

  CurCBCount := 0 ; //현재 진행 건수를 0으로 표시하자

  {전송건수 추출}
  CardBroadSendCount := 1;    //CMD:= 'FU00';FU는 한건이다.
  //ControlID추출
  stDeviceID := Edit_CurrentID.Text + '00';

  //송신데이터 생성
  if rdMode.ItemIndex = 3 then   //Server 이면
  begin
    BroadID := '02';
    stData := 'BI' + BroadID + FillZeroNumber(CardBroadSendCount,7);
    CMD:= 'FI00';
    st:= CMD + aFI.FMM;
    if aFI.FMM = '' then
    begin
      ShowMessage('데이터 없음');
      Exit;
    end;
    Write_ListBox_DownLoadInfo('Flash Memory Map 전송');
  end
  else if rdMode.ItemIndex = 2 then   //Main주관이면
  begin
    BroadID := '01';
    stData := 'BS' + BroadID + FillZeroNumber(CardBroadSendCount,7);           //ID가 02 이면 Fu송신
    CMD:= 'FU00';
    FPAddr:= ROM_FlashWrite.Count;
    FDAddr:= ROM_FlashData.Count;
    st:=  CMD +FillZeroNumber(FPAddr,7)+','+ FillZeroNumber(FDAddr,7);
    Write_ListBox_DownLoadInfo(' firmware upgrade 정보 전송');


  end
  else exit;

  st:= 'BD' + BroadID + FillZeroNumber(1,7) + BroadControlerNum + st;


  BroadOrgDataList.Clear;
  BroadOrgDataList.Add(st);
  BroadSendDataList := BroadOrgDataList;   //다음 송신 데이터 리스트에 추가

  //데이터 전송
  SendPacket(stDeviceID,'*',stData,Sent_Ver);

end;


procedure TMainForm.BroadErrorProcess(aPacketData: String);
var
  st : string;
  nFrom : integer;
  nTo : integer;
  Loop : integer;
  stBLData : String;
  aCode,aGubun : string;
begin
  aCode:= Copy(aPacketData,G_nIDLength + 12,2);
  aGubun:= Copy(aPacketData,G_nIDLength + 14,2);
  if aCode = 'fp' then //FTP 사용 가능 유무
  begin
    if aGubun = '90' then RcvFTPCheck(aPacketData);
  end;
  if copy(aPacketData,G_nIDLength + 12,2) <> 'BL' then exit;

  nFrom := strtoint(copy(aPacketData,G_nIDLength + 16,7));
  nTo := strtoint(copy(aPacketData,G_nIDLength + 24,7));
  stBLData := (copy(aPacketData,G_nIDLength + 8,2));
  if BroadSendDataList.Count < nTo then exit;

  for Loop := nFrom to nTo do
  begin
      st := BroadSendDataList.Strings[Loop-1];
      BroadErrorDataList.add(stBLData + st);
  end;

  if copy(aPacketData,G_nIDLength + 14,2) = '00' then btBroadRetry.Enabled:=True
  else
  begin
    bBroadFileSendERR := True;
    btBroadFileRetry.Enabled := True;
  end;

end;

procedure TMainForm.ExeFile(no: Integer);
var
  edExe : TEdit;
begin
  edExe := TravelEditItem(GroupBox19,'edexe',no);
  if edExe <> nil then
  begin
    if Not FileExists(edExe.Text) then Exit;
    if edExe.text <> '' then
       WinExec( Pchar(edExe.text), SW_SHOWNORMAL );

  end;

end;


procedure TMainForm.SendMainBroadData(ID:String; NO: Integer);
var
  stSendData : String;
  stDeviceID : String;
  progTime : cardinal;
  st:String;
begin

  st:='';
//  if CardBroadSendCount = CurCBCount then exit;

  CurCBCount := CurCBCount + 1; //현재 상태를 증가 시켜주자.

  if ID = '00' then
  begin
    lbState.caption := inttostr(CurCBCount) + ' / ' + inttostr(CardBroadSendCount);  //송신상태를 표시해 주자
    progTime := DateTimeToUnix(Now) - DateTimeToUnix(startTime);

    lb_TimeStat.Caption := '진행: ' +  FormatDateTime('hh:mm:ss', UnixToDateTime(progTime));
  end
  else
  begin
    ProgressBar1.Position := CurCBCount;
    Label1.Caption:= InttoStr(ProgressBar1.Position)+'/'+ InttoStr(ProgressBar1.Max);
  end;

    //ControlID추출
  stDeviceID := Edit_CurrentID.Text + '00';

  //여기서는 Sever모드에서 데이터 생성후 전송하는 부분이다.
  //stSendData := MakeBroadData(NO);
  if BroadSendDataList.count < NO then exit;

  stSendData := BroadSendDataList.Strings[NO-1];

  //데이터 전송
  SendPacket(stDeviceID,'*',stSendData,Sent_Ver);
end;


function TMainForm.BroadText2Hex(stTemp: String): String;
VAR
  Loop : integer;
  stHex : String;
  bHex : Boolean;
  st : String;
begin
  Result := '';
  st := '';
  stHex := '';
  bHex := False;
//stTemp 중 [] 부분을 Hex 부분으로 추출하여 Char 로 변경 후 리턴
  for Loop:=1 to length(stTemp) do
  begin
    if stTemp[Loop] = '[' then
    begin
      bHex := True;
      Continue;
    end;
    if stTemp[Loop] = ']' then
    begin
      bHex := False;
      st := st + Char(StrToIntDef('$' + stHex, 0));
      stHex := '';
      Continue;
    end;
    if bHex then  stHex := stHex + stTemp[Loop]
    else st := st + stTemp[Loop];

  end;   //For 문

  Result := st;

end;

Function TMainForm.WarningCompare(Data: String):Boolean;
var
  check:TCheckBox;
  Loop:Integer;
  bRtn:Boolean;
begin
  Result := False;

  if Data = '' then exit;

  for Loop := 1 to CONTROLCNT - 1 do   //16번째는 노랑색으로 표시 안함
  begin
     bRtn := False;
     check := TravelCheckBoxItem(Groupbox19,'check',Loop);
     if check.checked then
     begin
       bRtn := DataCompare(Data,strtoint(check.hint));  //체크 되어 있으면 해당 내용과 데이터 비교
       if bRtn then
       begin
          WarningBeep(strtoint(check.hint));    //동일하면 메시지 울림 ,한번만 찾아 주자.
          ExeFile(strtoint(check.hint)); //실행 파일 실행해 주자.
          Result := True;
          break;
       end;
     end;
  end;

end;


procedure TMainForm.RzBitBtn26Click(Sender: TObject);
var
  st: string;
begin
  st:=  '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '==== STOP ==== '+#9+
        ''+#9+
        ''+#9+
        '';
  AddEventList(st);
  OnMoni:= False;
end;



function TMainForm.GetSendCount: Integer;
begin
  Result:=0;
  //전송건수를 추출한다. 순차 또는 난수일때에는 전송건수
  if (rdSelectCardNo.ItemIndex = 0) or (rdSelectCardNo.ItemIndex = 1) then  //난수 또는 순차증가
  begin
    Result := strtoint('0' + edcard.text);
  end
  else if rdSelectCardNo.ItemIndex = 2 then    //파일인경우
  begin
     Result := BroadFileList.Count;
  end
  else if rdSelectCardNo.ItemIndex = 3 then  //고정인 경우 1
  begin
    Result := 1;
  end;

end;

procedure TMainForm.SendServerBroadData;
var
//  stSendData : String;
  stDeviceID : String;
  progTime : cardinal;
  st : String;
begin
  st := '';
  BroadTimer.Enabled := False; // Timer 동작 정지
  broadStopTimer.Enabled := False;

  if CardBroadSendCount <=  CurCBCount then exit;

  CurCBCount := CurCBCount + 1; //현재 상태를 증가 시켜주자.
  lbState.caption := inttostr(CurCBCount) + ' / ' + inttostr(CardBroadSendCount);  //송신상태를 표시해 주자
  progTime := DateTimeToUnix(Now) - DateTimeToUnix(startTime);

  lb_TimeStat.Caption := '진행: ' +  FormatDateTime('hh:mm:ss', UnixToDateTime(progTime));

    //ControlID추출
  stDeviceID := Edit_CurrentID.Text + '00';

  //여기서는 Sever모드에서 데이터 생성후 전송하는 부분이다.
  BroadSendData := '';
//  BroadSendData := MakeBroadData(CurCBCount);
  BroadSendData := BroadSendDataList.Strings[CurCBCount-1];

  //데이터 전송
  SendPacket(stDeviceID,'*',BroadSendData,Sent_Ver);

  BroadTimer.Enabled := True; // Timer 동작 시작 - 전송후 Timer 체크해서 무한정 기다리지 않고 데이터 송신
  broadStopTimer.Enabled := True;

end;

procedure TMainForm.edCardChange(Sender: TObject);
begin
  if (rdSelectCardNo.ItemIndex = 0) or (rdSelectCardNo.ItemIndex = 1) then  CardBroadSendCount := strtoint(edCard.text);
end;

function TMainForm.MakeBroadData(No: Integer): String;
var
  stExt: String; //확장기의 정보
  stCardData : String;
  nCardNo1,nCardNo2 : Integer;
  stMsgCode,stRegCode,stCardNo,hexCardNo,stCardAdmin : String;
  stInOut,stMasterMode : String ;
  stTemp : String;
begin
  Result := '';
  stExt := BroadControlerNum ; //확장기의 정보
  //###############카드 데이터 생성################
  stCardData := '';
  case rdMsgCode.ItemIndex  of
    0 : {등록}      begin stMsgCode := 'L'  end;
    1 : {조회}      begin stMsgCode := 'M' end;
    2 : {삭제}      begin stMsgCode := 'N' end;
    3 : {전체삭제}  begin stMsgCode := 'O' end;
    else            begin stMsgCode := 'L' end;
  end;
  case cbRegCode.ItemIndex  of
    0 : {첫번째두번째}      begin stRegCode := '0' end;
    1 : {첫번째출입문}      begin stRegCode := '1' end;
    2 : {두번째출입문}      begin stRegCode := '2' end;
    3 : {방범카드전용}      begin stRegCode := '3' end;
    else                    begin stRegCode := '0' end;
  end;

  case cbCardAdmin.ItemIndex  of
    0 : {출입전용}      begin stCardAdmin := '0' end;
    1 : {방범전용}      begin stCardAdmin := '1' end;
    2 : {방범/출입}     begin stCardAdmin := '2' end;
    else                begin stCardAdmin := '0' end;
  end;

  case cbInOut.ItemIndex  of
    0 : {해당없음}      begin stInOut := '0' end;
    1 : {1모드}         begin stInOut := '1' end;
    2 : {2모드}         begin stInOut := '2' end;
    3 : {3모드}         begin stInOut := '3' end;
    else                begin stInOut := '0' end;
  end;

  case cbMasterMode.ItemIndex  of
    0 : {일반}          begin stMasterMode := '0' end;
    1 : {마스터}        begin stMasterMode := '1' end;
    else                begin stMasterMode := '0' end;
  end;

  if rdSelectCardNo.ItemIndex = 0 then
  begin //난수이면
    Randomize;
    nCardNo1 := Random(99999);
    Randomize;
    nCardNo2 := Random(99999);
    stCardNo := FillZeroNumber(nCardNo1,5) + FillZeroNumber(nCardNo2,5);
  end
  else   if rdSelectCardNo.ItemIndex = 1 then
  begin //순차이면
    stCardNo := FillZeroNumber(CurCBCount,10);
  end
  else   if rdSelectCardNo.ItemIndex = 2 then
  begin //파일이면
     stTemp := BroadFileList[No - 1];
     stTemp := BroadText2Hex(stTemp);
     Result := stTemp;
     exit;
    //stCardNo := FillZeroNumber(CurCBCount,10);
  end
  else   if rdSelectCardNo.ItemIndex = 3 then
  begin //고정이면
    stCardNo := FillZeroNumber(strtoint(edcard.text),10);
  end;

  hexCardNo := '00' + EncodeCardNo(stCardNo);


  stCardData := stCardData + stMsgCode + '0' + stRegCode + '  ' + '0'
                + hexCardNo + FormatDatetime('yymmdd',Now) + '0' + stCardAdmin
                + stInOut + stMasterMode;
  //###############카드 데이터 생성 끝 ################


  Result := 'BD' + FillZeroNumber(No,9) + stExt + 'CD00' + stCardData;
end;

procedure TMainForm.BroadCastProcess(aPacketData: String);
begin
    if Copy(aPacketData,G_nIDLength + 12,2) = 'BC' then   //송신에 대한 Ack가 날라옴
    begin
        if rdMaster.ItemIndex = 0 then //서버모드이면
        begin
           SendServerBroadData(); //브로드캐스트 데이터를 만들어 송신하자.
        end
        else if rdMode.ItemIndex = 3 then //서버모드이면
        begin
          //여기에서 데이터를 만들어 송신하자.
        end
        else exit;  //Main 모드 이면 Ack는 무시하고 다음 요청데이터를 기다리자.
    end else if Copy(aPacketData,G_nIDLength + 12,2) = 'bq' then  //Main 모드에서 데이터 요청시
    begin
        SendMainBroadData(Copy(aPacketData,G_nIDLength + 14,2),strtoint(Copy(aPacketData,G_nIDLength + 16,7)));
        //if Copy(aData,21,2) = '00' then SendMainBroadData(Copy(aData,21,2),strtoint(Copy(aData,21,9)))
        //else Copy(aData,21,2) = '01' then SendMainBroadData(strtoint(Copy(aData,21,9))); //요청데이터 확인 후 브로드캐스트 데이터를 만들어 송신하자.
    end else if Copy(aPacketData,G_nIDLength + 12,2) = 'be' then //데이터 송신 완료 됨을 알려주자
    begin
        if Copy(aPacketData,G_nIDLength + 14,2) = '00' then
        begin
          lbState.Caption := lbState.Caption + '송신성공';
          lb_end.Caption := '종료:' + FormatDateTime('hh:mm:ss',Now);
        end else
        begin
          BroadID := Copy(aPacketData,G_nIDLength + 14,2);
          if Copy(aPacketData,G_nIDLength + 14,2) <> '05' then
          begin
            BroadSleep_Timer.Enabled := True;
            //3초간 대기 브로드 파일 전송후  다음 데이터 전송
          end;
        end;
    end else if Copy(aPacketData,G_nIDLength + 12,2) = 'BL' then //데이터 수신실패
    begin
        BroadErrorProcess(aPacketData);
    end else
    begin
        //여기서 FirmWare File 전송하자.
    end;
end;

function TMainForm.GetBroadControlerNum(CheckGroup:TRZCheckGroup): String;
var
  nTemp : array[0..8, 0..7] of Integer;
  i,j,k : Integer;
  stTemp: String;
  stHex:String;
  nDecimal: Integer;
begin

  for i:=0 to 8 do
  begin
    for j:=0 to 7 do
    begin
      nTemp[i,j]:=0;
    end;
  end;

  //체크 되어 있는 위치에 데이터를 넣는다.
  for k:= 0 to 63 do
  begin
    if CheckGroup.ItemChecked[k] = True then
    begin
      i := k div 8;
      j := k Mod 8 ;
      nTemp[i,j] := 1;
    end;
  end;

  stHex := '';
  for k:=0 to 8 do
  begin
    nDecimal := 0;
    stTemp := '';
    For j:= 4 to 7 do
    Begin
        nDecimal := nDecimal + nTemp[k,j] * Trunc(Power(2, j - 4));
    end;
    stTemp := '3' + IntToHex(nDecimal,1);
    stHex := stHex + Char(StrToIntDef('$' + stTemp, 0));
    nDecimal := 0;

    For j:= 0 to 3 do
    Begin
        nDecimal := nDecimal + nTemp[k,j] * Trunc(Power(2, j));
    end;
    stTemp := '3' + IntToHex(nDecimal,1);
    stHex := stHex + Char(StrToIntDef('$' + stTemp, 0));
{
    For j:= 3 downto 0 do
    Begin
        nDecimal := nDecimal + nTemp[k,j] * Trunc(Power(2, 3 - j));
    end;

    stTemp := intTostr(nDecimal);
    nDecimal := 0;
    For j:= 7 downto 4 do
    Begin
        nDecimal := nDecimal + nTemp[k,j] * Trunc(Power(2, 7 - j));
    end;

    stTemp := stTemp + intToStr(nDecimal);
    stHex := stHex + Char(StrToIntDef('$' + stTemp, 0));   }
  end;

  //showmessage(stTemp);
  Result:=stHex;

end;

procedure TMainForm.Init_IDNO_ComboBox(aComBoBox:TRzComboBox);
var
  I: Integer;
  st: String;
begin

  aComBoBox.Clear;
  for I:= 0 to 64 do
  begin
    if I < 10 then st:= '0'+InttoStr(I)
    else           st:= InttoStr(I);
    aComBoBox.Items.Add(st);
  end;
  aComBoBox.ItemIndex:= 0;
end;

procedure TMainForm.ConfigInit;
var
 aTCP: String;
 I: Integer;
 st: string;
 ViewMAC: Integer;
begin


  {장비 IP}
  with LMDIniCtrl1 do
  begin
    rg_ConType.ItemIndex:= ReadInteger('설정','연결방식',0);
    if rg_ConType.ItemIndex <> 0 then
    begin
      CB_SerialComm.Enabled := True;
      CB_SerialBoard.Enabled := True; 
    end;
    CB_SerialComm.ItemIndex:= ReadInteger('설정','ComNo',0);
    CB_SerialBoard.ItemIndex := ReadInteger('설정','Board',0);

    RadioGroup_Mode.ItemIndex:= ReadInteger('설정','TCPMode',1);
    if ReadInteger('설정','LOG',1) = 1 then ck_Log.Checked := True
    else ck_Log.Checked := False;

    aTCP:= ReadString('설정','TCP','127.0.0.1,3000');

    Edit_send1.Text:= Hex2Ascii(ReadString('설정','SEND1',''));
    Edit_send2.Text:= Hex2Ascii(ReadString('설정','SEND2',''));
    Edit_send3.Text:= Hex2Ascii(ReadString('설정','SEND3',''));
    Edit_send4.Text:= Hex2Ascii(ReadString('설정','SEND4',''));
    Edit_send5.Text:= Hex2Ascii(ReadString('설정','SEND5',''));
    Edit_send6.Text:= Hex2Ascii(ReadString('설정','SEND6',''));
    Edit_send7.Text:= Hex2Ascii(ReadString('설정','SEND7',''));
    Edit_send8.Text:= Hex2Ascii(ReadString('설정','SEND8',''));
    Edit_send9.Text:= Hex2Ascii(ReadString('설정','SEND9',''));
    Edit_send0.Text:= Hex2Ascii(ReadString('설정','SEND0',''));
    Edit_sendA.Text:= Hex2Ascii(ReadString('설정','SENDA',''));
    Edit_sendB.Text:= Hex2Ascii(ReadString('설정','SENDB',''));
    Edit_sendC.Text:= Hex2Ascii(ReadString('설정','SENDC',''));
    Edit_sendD.Text:= Hex2Ascii(ReadString('설정','SENDD',''));
    Edit_sendE.Text:= Hex2Ascii(ReadString('설정','SENDE',''));
    Edit_sendF.Text:= Hex2Ascii(ReadString('설정','SENDF',''));

    Edit_send21.Text:= Hex2Ascii(ReadString('설정','SEND21',''));
    Edit_send22.Text:= Hex2Ascii(ReadString('설정','SEND22',''));
    Edit_send23.Text:= Hex2Ascii(ReadString('설정','SEND23',''));
    Edit_send24.Text:= Hex2Ascii(ReadString('설정','SEND24',''));
    Edit_send25.Text:= Hex2Ascii(ReadString('설정','SEND25',''));
    Edit_send26.Text:= Hex2Ascii(ReadString('설정','SEND26',''));
    Edit_send27.Text:= Hex2Ascii(ReadString('설정','SEND27',''));
    Edit_send28.Text:= Hex2Ascii(ReadString('설정','SEND28',''));
    Edit_send29.Text:= Hex2Ascii(ReadString('설정','SEND29',''));
    Edit_send20.Text:= Hex2Ascii(ReadString('설정','SEND20',''));
    Edit_send2A.Text:= Hex2Ascii(ReadString('설정','SEND2A',''));
    Edit_send2B.Text:= Hex2Ascii(ReadString('설정','SEND2B',''));
    Edit_send2C.Text:= Hex2Ascii(ReadString('설정','SEND2C',''));
    Edit_send2D.Text:= Hex2Ascii(ReadString('설정','SEND2D',''));
    Edit_send2E.Text:= Hex2Ascii(ReadString('설정','SEND2E',''));
    Edit_send2F.Text:= Hex2Ascii(ReadString('설정','SEND2F',''));

    Edit_send31.Text:= Hex2Ascii(ReadString('설정','SEND31',''));
    Edit_send32.Text:= Hex2Ascii(ReadString('설정','SEND32',''));
    Edit_send33.Text:= Hex2Ascii(ReadString('설정','SEND33',''));
    Edit_send34.Text:= Hex2Ascii(ReadString('설정','SEND34',''));
    Edit_send35.Text:= Hex2Ascii(ReadString('설정','SEND35',''));
    Edit_send36.Text:= Hex2Ascii(ReadString('설정','SEND36',''));
    Edit_send37.Text:= Hex2Ascii(ReadString('설정','SEND37',''));
    Edit_send38.Text:= Hex2Ascii(ReadString('설정','SEND38',''));
    Edit_send39.Text:= Hex2Ascii(ReadString('설정','SEND39',''));
    Edit_send30.Text:= Hex2Ascii(ReadString('설정','SEND30',''));
    Edit_send3A.Text:= Hex2Ascii(ReadString('설정','SEND3A',''));
    Edit_send3B.Text:= Hex2Ascii(ReadString('설정','SEND3B',''));
    Edit_send3C.Text:= Hex2Ascii(ReadString('설정','SEND3C',''));
    Edit_send3D.Text:= Hex2Ascii(ReadString('설정','SEND3D',''));
    Edit_send3E.Text:= Hex2Ascii(ReadString('설정','SEND3E',''));
    Edit_send3F.Text:= Hex2Ascii(ReadString('설정','SEND3F',''));

    Edit_Func1.Text:= ReadString('설정','FUNC1','');
    Edit_Func2.Text:= ReadString('설정','FUNC2','');
    Edit_Func3.Text:= ReadString('설정','FUNC3','');
    Edit_Func4.Text:= ReadString('설정','FUNC4','');
    Edit_Func5.Text:= ReadString('설정','FUNC5','');
    Edit_Func6.Text:= ReadString('설정','FUNC6','');
    Edit_Func7.Text:= ReadString('설정','FUNC7','');
    Edit_Func8.Text:= ReadString('설정','FUNC8','');
    Edit_Func9.Text:= ReadString('설정','FUNC9','');
    Edit_Func0.Text:= ReadString('설정','FUNC0','');
    Edit_FuncA.Text:= ReadString('설정','FUNCA','');
    Edit_FuncB.Text:= ReadString('설정','FUNCB','');
    Edit_FuncC.Text:= ReadString('설정','FUNCC','');
    Edit_FuncD.Text:= ReadString('설정','FUNCD','');
    Edit_FuncE.Text:= ReadString('설정','FUNCE','');
    Edit_FuncF.Text:= ReadString('설정','FUNCF','');

    Edit_Func21.Text:= ReadString('설정','FUNC21','');
    Edit_Func22.Text:= ReadString('설정','FUNC22','');
    Edit_Func23.Text:= ReadString('설정','FUNC23','');
    Edit_Func24.Text:= ReadString('설정','FUNC24','');
    Edit_Func25.Text:= ReadString('설정','FUNC25','');
    Edit_Func26.Text:= ReadString('설정','FUNC26','');
    Edit_Func27.Text:= ReadString('설정','FUNC27','');
    Edit_Func28.Text:= ReadString('설정','FUNC28','');
    Edit_Func29.Text:= ReadString('설정','FUNC29','');
    Edit_Func20.Text:= ReadString('설정','FUNC20','');
    Edit_Func2A.Text:= ReadString('설정','FUNC2A','');
    Edit_Func2B.Text:= ReadString('설정','FUNC2B','');
    Edit_Func2C.Text:= ReadString('설정','FUNC2C','');
    Edit_Func2D.Text:= ReadString('설정','FUNC2D','');
    Edit_Func2E.Text:= ReadString('설정','FUNC2E','');
    Edit_Func2F.Text:= ReadString('설정','FUNC2F','');

    Edit_Func31.Text:= ReadString('설정','FUNC31','');
    Edit_Func32.Text:= ReadString('설정','FUNC32','');
    Edit_Func33.Text:= ReadString('설정','FUNC33','');
    Edit_Func34.Text:= ReadString('설정','FUNC34','');
    Edit_Func35.Text:= ReadString('설정','FUNC35','');
    Edit_Func36.Text:= ReadString('설정','FUNC36','');
    Edit_Func37.Text:= ReadString('설정','FUNC37','');
    Edit_Func38.Text:= ReadString('설정','FUNC38','');
    Edit_Func39.Text:= ReadString('설정','FUNC39','');
    Edit_Func30.Text:= ReadString('설정','FUNC30','');
    Edit_Func3A.Text:= ReadString('설정','FUNC3A','');
    Edit_Func3B.Text:= ReadString('설정','FUNC3B','');
    Edit_Func3C.Text:= ReadString('설정','FUNC3C','');
    Edit_Func3D.Text:= ReadString('설정','FUNC3D','');
    Edit_Func3E.Text:= ReadString('설정','FUNC3E','');
    Edit_Func3F.Text:= ReadString('설정','FUNC3F','');
    for i:= 1 to 16 do
    begin
      Array_FingerEdit[i].FingFUNC.Text := ReadString('설정','FingFUNC' + FillZeroNumber(i,2),'');
      Array_FingerEdit[i].FingCMD.Text := ReadString('설정','FingCMD' + FillZeroNumber(i,2),'');
      Array_FingerEdit[i].FingData1.Text := ReadString('설정','FingData1' + FillZeroNumber(i,2),'');
      Array_FingerEdit[i].FingData2.Text := ReadString('설정','FingData2' + FillZeroNumber(i,2),'');
      Array_FingerEdit[i].FingData3.Text := ReadString('설정','FingData3' + FillZeroNumber(i,2),'');
      Array_FingerEdit[i].FingData4.Text := ReadString('설정','FingData4' + FillZeroNumber(i,2),'');
      Array_FingerEdit[i].FingCheckSum.Text := ReadString('설정','FingCheckSum' + FillZeroNumber(i,2),'');
    end;


    // DBGrid 칼럼 사이즈
    RxDBGrid1.Columns[0].Width:= ReadInteger('모니터링그리드설정','순번'      ,RxDBGrid1.Columns[0].Width);
    RxDBGrid1.Columns[1].Width:= ReadInteger('모니터링그리드설정','방향'      ,RxDBGrid1.Columns[1].Width);
    RxDBGrid1.Columns[2].Width:= ReadInteger('모니터링그리드설정','시간'      ,RxDBGrid1.Columns[2].Width);
    RxDBGrid1.Columns[3].Width:= ReadInteger('모니터링그리드설정','버젼'    ,RxDBGrid1.Columns[3].Width);
    RxDBGrid1.Columns[4].Width:= ReadInteger('모니터링그리드설정','기기ID'    ,RxDBGrid1.Columns[4].Width);
    RxDBGrid1.Columns[5].Width:= ReadInteger('모니터링그리드설정','No'        ,RxDBGrid1.Columns[5].Width);
    RxDBGrid1.Columns[6].Width:= ReadInteger('모니터링그리드설정','커맨드'    ,RxDBGrid1.Columns[6].Width);
    RxDBGrid1.Columns[7].Width:= ReadInteger('모니터링그리드설정','데이터'    ,RxDBGrid1.Columns[7].Width);
    RxDBGrid1.Columns[8].Width:= ReadInteger('모니터링그리드설정','전체데이터',RxDBGrid1.Columns[8].Width);
//    RzSplitter3.Position := ReadInteger('모니터링그리드설정','높이',RzSplitter3.Position);

    //소리부분 셋팅
    edComp1.Text:= Hex2Ascii(ReadString('소리','EDCOMP1',''));
    edComp2.Text:= Hex2Ascii(ReadString('소리','EDCOMP2',''));
    edComp3.Text:= Hex2Ascii(ReadString('소리','EDCOMP3',''));
    edComp4.Text:= Hex2Ascii(ReadString('소리','EDCOMP4',''));
    edComp5.Text:= Hex2Ascii(ReadString('소리','EDCOMP5',''));
    edComp6.Text:= Hex2Ascii(ReadString('소리','EDCOMP6',''));
    edComp7.Text:= Hex2Ascii(ReadString('소리','EDCOMP7',''));
    edComp8.Text:= Hex2Ascii(ReadString('소리','EDCOMP8',''));
    edComp9.Text:= Hex2Ascii(ReadString('소리','EDCOMP9',''));
    edComp10.Text:= Hex2Ascii(ReadString('소리','EDCOMP10',''));
    edComp11.Text:= Hex2Ascii(ReadString('소리','EDCOMP11',''));
    edComp12.Text:= Hex2Ascii(ReadString('소리','EDCOMP12',''));
    edComp13.Text:= Hex2Ascii(ReadString('소리','EDCOMP13',''));
    edComp14.Text:= Hex2Ascii(ReadString('소리','EDCOMP14',''));
    edComp15.Text:= Hex2Ascii(ReadString('소리','EDCOMP15',''));
    edComp16.Text:= Hex2Ascii(ReadString('소리','EDCOMP16',''));

    edFile1.Text:= ReadString('소리','EDFILE1','');
    edFile2.Text:= ReadString('소리','EDFILE2','');
    edFile3.Text:= ReadString('소리','EDFILE3','');
    edFile4.Text:= ReadString('소리','EDFILE4','');
    edFile5.Text:= ReadString('소리','EDFILE5','');
    edFile6.Text:= ReadString('소리','EDFILE6','');
    edFile7.Text:= ReadString('소리','EDFILE7','');
    edFile8.Text:= ReadString('소리','EDFILE8','');
    edFile9.Text:= ReadString('소리','EDFILE9','');
    edFile10.Text:= ReadString('소리','EDFILE10','');
    edFile11.Text:= ReadString('소리','EDFILE11','');
    edFile12.Text:= ReadString('소리','EDFILE12','');
    edFile13.Text:= ReadString('소리','EDFILE13','');
    edFile14.Text:= ReadString('소리','EDFILE14','');
    edFile15.Text:= ReadString('소리','EDFILE15','');
    edFile16.Text:= ReadString('소리','EDFILE16','');

    edExe1.Text:= ReadString('실행','EDEXE1','');
    edExe2.Text:= ReadString('실행','EDEXE2','');
    edExe3.Text:= ReadString('실행','EDEXE3','');
    edExe4.Text:= ReadString('실행','EDEXE4','');
    edExe5.Text:= ReadString('실행','EDEXE5','');
    edExe6.Text:= ReadString('실행','EDEXE6','');
    edExe7.Text:= ReadString('실행','EDEXE7','');
    edExe8.Text:= ReadString('실행','EDEXE8','');
    edExe9.Text:= ReadString('실행','EDEXE9','');
    edExe10.Text:= ReadString('실행','EDEXE10','');
    edExe11.Text:= ReadString('실행','EDEXE11','');
    edExe12.Text:= ReadString('실행','EDEXE12','');
    edExe13.Text:= ReadString('실행','EDEXE13','');
    edExe14.Text:= ReadString('실행','EDEXE14','');
    edExe15.Text:= ReadString('실행','EDEXE15','');
    edExe16.Text:= ReadString('실행','EDEXE16','');

    if ReadInteger('소리','CHECK1',0) = 0 then check1.Checked := false
    else check1.Checked := True;
    if ReadInteger('소리','CHECK2',0) = 0 then check2.Checked := false
    else check2.Checked := True;
    if ReadInteger('소리','CHECK3',0) = 0 then check3.Checked := false
    else check3.Checked := True;
    if ReadInteger('소리','CHECK4',0) = 0 then check4.Checked := false
    else check4.Checked := True;
    if ReadInteger('소리','CHECK5',0) = 0 then check5.Checked := false
    else check5.Checked := True;
    if ReadInteger('소리','CHECK6',0) = 0 then check6.Checked := false
    else check6.Checked := True;
    if ReadInteger('소리','CHECK7',0) = 0 then check7.Checked := false
    else check7.Checked := True;
    if ReadInteger('소리','CHECK8',0) = 0 then check8.Checked := false
    else check8.Checked := True;
    if ReadInteger('소리','CHECK9',0) = 0 then check9.Checked := false
    else check9.Checked := True;
    if ReadInteger('소리','CHECK10',0) = 0 then check10.Checked := false
    else check10.Checked := True;
    if ReadInteger('소리','CHECK11',0) = 0 then check11.Checked := false
    else check11.Checked := True;
    if ReadInteger('소리','CHECK12',0) = 0 then check12.Checked := false
    else check12.Checked := True;
    if ReadInteger('소리','CHECK13',0) = 0 then check13.Checked := false
    else check13.Checked := True;
    if ReadInteger('소리','CHECK14',0) = 0 then check14.Checked := false
    else check14.Checked := True;
    if ReadInteger('소리','CHECK15',0) = 0 then check15.Checked := false
    else check15.Checked := True;
    if ReadInteger('소리','CHECK16',0) = 0 then check16.Checked := false
    else check16.Checked := True;

    ed_DecMCode1.Text := ReadString('Decoder','MCode1','');
    ed_DecMCode2.Text := ReadString('Decoder','MCode2','');
    ed_DecMCode2.Text := ReadString('Decoder','MCode2','');
    ed_DecCMD1.Text := ReadString('Decoder','CMD1','');
    ed_DecCMD2.Text := ReadString('Decoder','CMD2','');
    ed_DecCMD3.Text := ReadString('Decoder','CMD3','');
    ed_DecModem1.Text := ReadString('Decoder','Modem1','');
    ed_DecModem2.Text := ReadString('Decoder','Modem2','');
    ed_DecModem3.Text := ReadString('Decoder','Modem3','');
    ed_DecChannel1.Text := ReadString('Decoder','Channel1','');
    ed_DecChannel2.Text := ReadString('Decoder','Channel2','');
    ed_DecChannel3.Text := ReadString('Decoder','Channel3','');
    ed_DecCntl1.Text := ReadString('Decoder','Cntl1','');
    ed_DecCntl2.Text := ReadString('Decoder','Cntl2','');
    ed_DecCntl3.Text := ReadString('Decoder','Cntl3','');
    ed_Dectail1.Text := ReadString('Decoder','tail1','');
    ed_Dectail2.Text := ReadString('Decoder','tail2','');
    ed_Dectail3.Text := ReadString('Decoder','tail3','');


    //브로드 캐스트 부분
    edBroadFileSave.Text := ReadString('BroadCasting','SaveFileName','');
    BroadSaveFileList.Clear;
    if edBroadFileSave.Text <> '' then
    begin
     if fileexists(edBroadFileSave.Text) = true then BroadSaveFileList.LoadFromFile(edBroadFileSave.Text);
    end;

    edBRFileLoad.Text := ReadString('BroadCasting','OpenFileName','');
    BroadFileList.Clear;
    if edBRFileLoad.text <> '' then
    begin
      if fileexists(edBRFileLoad.text) = true then BroadFileList.LoadFromFile(edBRFileLoad.text);
    end;


    ViewMAC:= ReadInteger('설정','VIEWMAC',0);

    if ViewMAC < 1 then GroupMAc.Visible:= False
    else                GroupMAc.Visible:= True;

    if ReadInteger('설정','Reset',0) = 1 then TabVTimer.Enabled := True;
    ed_ftpip.Text := ReadString('FTP','FTPIP','');
    ed_ftpport.Text := ReadString('FTP','FTPPORT','');
    ed_ftpuserid.Text := ReadString('FTP','FTPUSERID','');
    ed_ftpuserpw.Text := ReadString('FTP','FTPUSERPW','');
    ed_ftpdir.Text := ReadString('FTP','FTPROOT','');
    ed_ftpFilename.Text := ReadString('FTP','FTPFILENAME','');
    ed_ftplocalFile.Text := ReadString('FTP','FTPLOCALFILE','');
    ed_ftpFilesize.Text := ReadString('FTP','FTPFILESIZE','');
    ed_ftpLocalip.Text := ReadString('FTP','FTPLOCALIP','');
    ed_ftplocalport.Text := inttostr(Readinteger('FTP','FTPLOCALPORT',30021));
    ed_ftplocalportFirmware.text := ed_ftplocalport.Text;
    ed_ftpCardPort.Text := ed_ftplocalport.Text;
    //WriteString('FTP','FTPLOCALPORT',ed_ftplocalport.Text);
    btn_nextPortClick(Self);
    stPW := MimeDecodeString(ReadString('Config','PW','MDIyMDU3NDk4MQ=='));
    L_Direct := ReadString('Config','Direct','');
    stPasswdErr := ReadString('Config','PasswdErr','TRUE');
  end;

  CB_IPList.Text:= FindCharCopy(aTCP,0,',');
  Edit2.Text:= FindCharCopy(aTCP,1,',');
  (*
  if Length(aTCP) > 5 then aTCP:= '3000';
  Edit2.Text:= aTCP;
    *)
  Group_Device.Items.Clear;
  for I:= 0 to 99 do
  begin
    st:= FillZeroNumber(I,2);
    Group_Device.Items.Add(st);
  end;

  Group_BroadDevice.Items.Clear;
  for I:= 0 to 99 do
  begin
    st:= FillZeroNumber(I,2) + '  ';
    Group_BroadDevice.Items.Add(st);
  end;

  Group_BroadDownLoad.Items.Clear;
  for I:= 0 to 99 do
  begin
    st:= FillZeroNumber(I,2) ;
    Group_BroadDownLoad.Items.Add(st);
  end;

  {1.방범_위치정보등록}
  Init_IDNO_ComboBox(ComboBox_IDNO);

  {2.방범_카드리더 등록}
  with ComBoBox_UseCardReader do
  begin
    Clear;
    Items.Add('안함');
    Items.Add('사용');
    ItemIndex:= 0;
  end;
  for i:=1 to 8 do
  begin
    {2.방범_카드리더 등록}
    with TravelComboBoxItem(GroupBox33,'ComBoBox_UseCardReader',i) do
    begin
      Clear;
      Items.Add('안함');
      Items.Add('사용');
      ItemIndex:= 0;
    end;
  end;

  with ComBoBox_InOutCR do
  begin
    Clear;
    Items.Add('내부');
    Items.Add('외부');
    ItemIndex:= 0;
  end;
  for i:=1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox33,'ComBoBox_InOutCR',i) do
    begin
      Clear;
      Items.Add('내부');
      Items.Add('외부');
      ItemIndex:= 0;
    end;
  end;

  with ComBoBox_Building do
  begin
    Clear;
    Items.Add('내부');
    Items.Add('외부');
    ItemIndex:= 0;
  end;
  for i:=1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox33,'ComBoBox_Building',i) do
    begin
      Clear;
      Items.Add('내부');
      Items.Add('외부');
      ItemIndex:= 0;
    end;
  end;

  with ComBoBox_DoorNo do
  begin
    Clear;
    Items.Add('없음');
    Items.Add('1');
    Items.Add('2');
    Items.Add('3');
    Items.Add('4');
    Items.Add('5');
    Items.Add('6');
    Items.Add('7');
    Items.Add('8');
    ItemIndex:= 0;
  end;
  for i:=1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox33,'ComBoBox_DoorNo',i) do
    begin
      Clear;
      Items.Add('없음');
      Items.Add('1');
      Items.Add('2');
      Items.Add('3');
      Items.Add('4');
      Items.Add('5');
      Items.Add('6');
      Items.Add('7');
      Items.Add('8');
      ItemIndex:= 0;
    end;
  end;

  {3.방범 시스템 등록 정보}
  with ComboBox_WatchPowerOff do
  begin
    Clear;
    Items.Add('정전 감시 OFF');
    Items.Add('정전 감시 ON');
    ItemIndex:= 0;
  end;
  with ComboBox_DeviceType do
  begin
    Clear;
    Items.Add('0.방범전용');
    Items.Add('1.출입전용');
    Items.Add('2.방범 + 출입');
    ItemIndex:= 2;
  end;
  with ComboBox_DoorType1 do
  begin
    Clear;
    Items.Add('0.방범전용');
    Items.Add('1.출입전용');
    Items.Add('2.방범 + 출입');
    ItemIndex:= 0;
  end;
  with ComboBox_DoorType2 do
  begin
    Clear;
    Items.Add('0.방범전용');
    Items.Add('1.출입전용');
    Items.Add('2.방범 + 출입');
    ItemIndex:= 0;
  end;

  {방범_릴레이 등록 정보}
  with COmBoBox_Linktype1 do     //릴레이 연동 방법
  begin
    Clear;
    Items.Add('처음 발생시만');
    Items.Add('발생시마다');
    ItemIndex:= 0;
  end;
  with ComboBox_OutType1 do     //릴레이 출력 빙식
  begin
    Clear;
    Items.Add('OPEN 접점');
    Items.Add('CLOSE 접점');
    ItemIndex:= 0;
  end;
  with ComboBox_RenewTimer1 do     //Timer Renew
  begin
    Clear;
    Items.Add('Timer Renew OFF');
    Items.Add('Timer Renew ON');
    ItemIndex:= 0;
  end;
  with ComboBox_UseType1 do     //릴레이 사용방식
  begin
    Clear;
    Items.Add('포트 연동');
    Items.Add('모드 연동');
    Items.Add('전등 사용');
    ItemIndex:= 0;
  end;

  {포트정보 등록}
  with ComboBox_WatchType do     //감시형태
  begin
    Clear;
    Items.Add('0.방범---경계');
    Items.Add('1.화재---24시간');
    Items.Add('2.가스---24시간');
    Items.Add('3.비상---24시간');
    Items.Add('4.설비---24시간');
    Items.Add('5.호출---해제'); //2007.08.05 추가
    Items.Add('6.방범---재중'); //2010.10.21 추가

    ItemIndex:= 0;
  end;
  for i:= 1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox45,'ComboBox_WatchType',i) do
    begin
      Clear;
      Items.Add('0.방범---경계');
      Items.Add('1.화재---24시간');
      Items.Add('2.가스---24시간');
      Items.Add('3.비상---24시간');
      Items.Add('4.설비---24시간');
      Items.Add('5.호출---해제'); //2007.08.05 추가
      Items.Add('6.방범---재중'); //2010.10.21 추가

      ItemIndex:= 0;
    end;
  end;

  with ComboBox_AlarmType do     //경보발생방식
  begin
    Clear;
    Items.Add('1회발생');
    Items.Add('발생시마다');
    ItemIndex:= 0;
  end;
  for i:=1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox45,'ComboBox_AlarmType',i) do     //경보발생방식
    begin
      Clear;
      Items.Add('1회발생');
      Items.Add('발생시마다');
      ItemIndex:= 0;
    end;
  end;

  with ComboBox_recover do     //복구신호 전송 유무
  begin
    Clear;
    Items.Add('안함');
    Items.Add('전송 ');
    ItemIndex:= 0;
  end;
  for i:=1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox45,'ComboBox_recover',i) do     //복구신호 전송 유무
    begin
      Clear;
      Items.Add('안함');
      Items.Add('전송 ');
      ItemIndex:= 0;
    end;
  end;

  with ComboBox_Delay do     //복구신호 전송 유무
  begin
    Clear;
    Items.Add('안함');
    Items.Add('적용');
    ItemIndex:= 0;
  end;

  for i:=1 to 8 do
  begin
    with TravelComboBoxItem(GroupBox45,'ComboBox_Delay',i) do     //복구신호 전송 유무
    begin
      Clear;
      Items.Add('안함');
      Items.Add('적용');
      ItemIndex:= 0;
    end;
  end;

 {출입통제:시스템정보 등록(II)}
 {
  with ComboBox_DoorNo2 do     //문 번호
  begin
    Clear;
    Items.Add('1번');
    Items.Add('2번');
    ItemIndex:= 0;
  end;
  }
  with ComboBox_CardModeType do     //카드운영 모드
  begin
    Clear;
    Items.Add('Positive');
    Items.Add('Negative');
    ItemIndex:= 0;
  end;
  for i:=1 to 2 do
  begin
    with TravelComboBoxItem(GroupBox43,'ComboBox_CardModeType',i) do     //카드운영 모드
    begin
      Clear;
      Items.Add('Positive');
      Items.Add('Negative');
      ItemIndex:= 0;
    end;
  end;

  with ComboBox_DoorModeType do     //출입문 운영 모드
  begin
    Clear;
    Items.Add('운영');
    Items.Add('개방');
    Items.Add('폐쇄');
    ItemIndex:= 0;
  end;
  for i:= 1 to 2 do
  begin
    with TravelComboBoxItem(GroupBox43,'ComboBox_DoorModeType',i) do     //출입문 운영 모드
    begin
      Clear;
      Items.Add('운영');
      Items.Add('개방');
      Items.Add('폐쇄');
      ItemIndex:= 0;
    end;
  end;

  with ComboBox_UseSch do     //출입문 운영 모드
  begin
    Clear;
    Items.Add('안함');
    Items.Add('적용');
    ItemIndex:= 0;
  end;
  for i:=1 to 2 do
  begin
    with TravelComboBoxItem(GroupBox43,'ComboBox_UseSch',i) do     //출입문 운영 모드
    begin
      Clear;
      Items.Add('안함');
      Items.Add('적용');
      ItemIndex:= 0;
    end;
  end;

  with ComboBox_SendDoorStatus do     //출입문 상태 전송여부
  begin
    Clear;
    Items.Add('사용안함');
    Items.Add('출입문상태');
    Items.Add('전기정상태');
    Items.Add('출입문+전기정상태');
    ItemIndex:= 0;
  end;
  for i:=1 to 2 do
  begin
    with TravelComboBoxItem(GroupBox43,'ComboBox_SendDoorStatus',i) do     //출입문 상태 전송여부
    begin
      Clear;
      Items.Add('사용안함');
      Items.Add('출입문상태');
      Items.Add('전기정상태');
      Items.Add('출입문+전기정상태');
      ItemIndex:= 0;
    end;
  end;

  with ComboBox_AntiPass do     //AntiPassBAck 사용여부
  begin
    Clear;
    Items.Add('사용안함');
    Items.Add('사용');
    ItemIndex:= 0;
  end;
  for i:=1 to 2 do
  begin
    with TravelComboBoxItem(GroupBox43,'ComboBox_AntiPass',i) do     //AntiPassBAck 사용여부
    begin
      Clear;
      Items.Add('사용안함');
      Items.Add('사용');
      ItemIndex:= 0;
    end;
  end;

  with ComboBox_UseCommOff do     //통신이상시 기기 운영
  begin
    Clear;
    Items.Add('정지');
    Items.Add('동작');
    ItemIndex:= 0;
  end;
  for i:=1 to 2 do
  begin
    with TravelComboBoxItem(GroupBox43,'ComboBox_UseCommOff',i) do     //통신이상시 기기 운영
    begin
      Clear;
      Items.Add('정지');
      Items.Add('동작');
      ItemIndex:= 0;
    end;
  end;

  with ComboBox_AlramCommoff do     //통신 이상시 부저 출력
  begin
    Clear;
    Items.Add('안함');
    Items.Add('사용');
    ItemIndex:= 0;
  end;
  for i:=1 to 2 do
  begin
    with TravelComboBoxItem(GroupBox43,'ComboBox_AlramCommoff',i) do     //통신 이상시 부저 출력
    begin
      Clear;
      Items.Add('안함');
      Items.Add('사용');
      ItemIndex:= 0;
    end;
  end;

  with ComboBox_AlarmLongOpen do     //장시간 열림 부저 출력
  begin
    Clear;
    Items.Add('안함');
    Items.Add('사용');
    ItemIndex:= 0;
  end;
  for i:=1 to 2 do
  begin
    with TravelComboBoxItem(GroupBox43,'ComboBox_AlarmLongOpen',i) do     //장시간 열림 부저 출력
    begin
      Clear;
      Items.Add('안함');
      Items.Add('사용');
      ItemIndex:= 0;
    end;
  end;

  with ComboBox_LockType do       //전기정 타입
  begin
    Clear;
    Items.Add('일반형(정전시 잠김)');
//    Items.Add('자동문');
    Items.Add('일반형(정전시 열림)');
//    Items.Add('데드락/EM락/스트라이커');
    Items.Add('데드볼트(정전시 잠김)');
    Items.Add('데드볼트(정전시 열림)');
    Items.Add('스트라이크(정전시 잠김)');
//    Items.Add('0x35 예비');
    Items.Add('스트라이크(정신시 열림)');
//    Items.Add('0x36 예비');
    Items.Add('자동문/주차');
//    Items.Add('0x37 식당');
    Items.Add('부져/램프제어/식당');
    Items.Add('SPEED GATE');
    Items.Add('순시타입');
    Items.Add('자바라-열림');
    Items.Add('자바라-닫힘');
    ItemIndex := 1;
  end;
  for i:=1 to 2 do
  begin
    with TravelComboBoxItem(GroupBox43,'ComboBox_LockType',i) do       //전기정 타입
    begin
      Clear;
      Items.Add('일반형(정전시 잠김)');
  //    Items.Add('자동문');
      Items.Add('일반형(정전시 열림)');
  //    Items.Add('데드락/EM락/스트라이커');
      Items.Add('데드볼트(정전시 잠김)');
      Items.Add('데드볼트(정전시 열림)');
      Items.Add('스트라이크(정전시 잠김)');
  //    Items.Add('0x35 예비');
      Items.Add('스트라이크(정신시 열림)');
  //    Items.Add('0x36 예비');
      Items.Add('자동문/주차');
  //    Items.Add('0x37 식당');
      Items.Add('부져/램프제어/식당');
      Items.Add('SPEED GATE');
      Items.Add('순시타입');
      Items.Add('자바라-열림');
      Items.Add('자바라-닫힘');
      ItemIndex := 1;
    end;
  end;

  with ComboBox_ControlFire do     //화재 발생시 문제어
  begin
    Clear;
    Items.Add('안함');
    Items.Add('사용');
    ItemIndex:= 0;
  end;
  for i:=1 to 2 do
  begin
    with TravelComboBoxItem(GroupBox43,'ComboBox_ControlFire',i) do     //화재 발생시 문제어
    begin
      Clear;
      Items.Add('안함');
      Items.Add('사용');
      ItemIndex:= 0;
    end;
  end;


  with ComboBox_CheckDSLS do     //DS , LS 검사 설정
  begin
    Clear;
    Items.Add('안함');
    Items.Add('DS 검사');
    Items.Add('LS 검사');
    Items.Add('DS+LS 검사');
    ItemIndex:= 0;
  end;
  for i:=1 to 2 do
  begin
    with TravelComboBoxItem(GroupBox43,'ComboBox_CheckDSLS',i) do     //DS , LS 검사 설정
    begin
      Clear;
      Items.Add('안함');
      Items.Add('DS 검사');
      Items.Add('LS 검사');
      Items.Add('DS+LS 검사');
      ItemIndex:= 0;
    end;
  end;

 {출입통제:DOOR 제어}
 {
  with ComboBox_DoorNo3 do     //문 번호
  begin
    Clear;
    Items.Add('1번');
    Items.Add('2번');
    ItemIndex:= 0;
  end;
  }

  {EDIT, COMBO 마우스 클릭시 색상을 White로 만들자}

  for I:= 0 to MainForm.ComponentCount -1 do
  begin
    if Components[I] is TEdit then TEdit(Components[I]).OnEnter:= Edit_Combo_Enter
    else if Components[I] is TComboBox then TComboBox(Components[I]).OnEnter:= Edit_Combo_Enter
    else if Components[I] is TRzComboBox then TRzComboBox(Components[I]).OnEnter:= Edit_Combo_Enter;
  end;


end;

procedure TMainForm.AddEventList(aRealData: String);
var
  acmd: String;
  aIP:String;
  aDeviceID: String;
  aDeviceNo: String;
  amsgData:  String;
  aFullData: String;
  aWay:      String;
//  aNo:       String;
  st : string;
  aVer : string;
begin

  if not OnMoni then Exit;
  aIP:= FindCharCopy(aRealData,0,#9);
  acmd:= FindCharCopy(aRealData,3,#9);
  aDeviceID:= FindCharCopy(aRealData,1,#9);
  aDeviceNo:= FindCharCopy(aRealData,2,#9);
  amsgData:=  FindCharCopy(aRealData,4,#9);
  aWay:=      FindCharCopy(aRealData,5,#9);
  aFullData:= FindCharCopy(aRealData,6,#9);
  aVer := FindCharCopy(aRealData,7,#9);
  if chk_Hex.Checked then aFullData := ConvertToHex(aFullData);

  if aCmd = '*' then // 브로드캐스팅 부분때문에 데이터 처리
  begin
    //showmessage(aWay);
  end;

  //커맨드 필터 적용
  if rgCmdFilter.ItemIndex = 1 then
  begin
    if (edFilter.Text = '') or (Pos(acmd,edFilter.Text) = 0) then Exit;
  end else if rgCmdFilter.ItemIndex = 2 then
  begin
    if (edFilter.Text = '') or (Pos(acmd,edFilter.Text) > 0) then Exit;
  end;
  if Not chk_sharp.Checked then
  begin
    if aCmd = '#' then Exit;
  end;
  if Not chk_AckView.Checked then
  begin
    if aCmd = 'a' then Exit;
  end;


  if WarningCompare(aFullData) then amsgData := 'Y:' + amsgData
  else amsgData := 'N:' + amsgData;
  // 기기번호 필터 사용
  if cbFinterNo.Checked then
  begin
    if Pos(aDeviceNo,edFfNo.Text) = 0 then Exit;
  end;

  with DBISAMTable1 do
  begin
    Append;
    FindField('EventTime').asDatetime:= Now;
    FindField('IP').asString         := aIP;
    FindField('DeviceID').asString   := aDeviceID;
    FindField('DeviceNo').asString   := aDeviceNo;
    FindField('cmd').asString        := aCmd;
    FindField('Data').asString       := amsgData;
    FindField('FullData').asString   := aFullData;
    FindField('Way').asString        := aWay;
    FindField('VER').AsString := aVer;
    //SHowMessage(FindCharCopy(aData,5,';'));

    try
      Post;
    except
      Exit;
    end;
    if (aCmd <> 'e') and (aCmd <> 'a') then
    begin
      if FindField('Way').asString = 'RX' then
      begin
      //Beep;
      end;
    end;
  end;

  if Not ck_Log.Checked then
  begin
    st := inttostr(nFileSeq) + ',' + aWay + ',' + DateTimeToStr(now) + ',' + aIP + ',' ;
    st := st + aDeviceID + ',' + aDeviceNo + ',' + aCmd + ',' + amsgData + ',' + aFullData;
    inc(nFileSeq);
    FileAdd( LogFileName,st);
  end;

end;

procedure TMainForm.FormShow(Sender: TObject);
var
  I: Integer;
  aDir:String;
  nPos : integer;
begin
  Application.OnMessage:= AnyMessage;

  ECUList := TStringList.Create;
  ECUList.Clear;
  BroadFileList := TStringList.Create;
  BroadSaveFileList := TStringList.Create;
  BroadSendDataList := TStringList.Create;  //브로드데이터 전송내역 저장
  BroadSendDataList.Clear;
  BroadErrorDataList := TStringList.Create; //브로드데이터 에러내역 저장
  BroadErrorDataList.Clear;
  BroadRetryDataList := TStringList.Create;
  BroadRetryDataList.Clear;
  BroadOrgDataList:= TStringList.Create;

//  MainForm.Caption:= PROGRAM_NAME +' '+ strBuildInfo;//+'[관제등록포함]';
  Notebook1.PageIndex:= 10;
  IsDownLoad:= False;
  DownLoadList:= TStringList.Create;
  ROM_FlashWrite:= TStringList.Create;
  ROM_FlashData := TStringList.Create;
  ROM_BineryFlashWrite := nil;
  ROM_BineryFlashData := nil;

  EventIndex:= 0;
  CountCardReadData:= 1;
  DBISAMTable1.CreateTable;
  DBISAMTable1.Active:= True;
  OnMoni:= True;

  for I:= 0 to RzGroupBar1.GroupCount -1 do
  begin
       TRzGroup(RzGroupBar1.Groups[i]).OPen;
  end;

  aDir:= ExtractFileDir(Application.ExeName);
  aDir:= aDir +'\iplist.ini';
  if FileExists(aDir) then
  begin
    CB_IPList.Items.LoadFromFile(aDir);
    //CB_IPList.ItemIndex:= 0;
  end;
  //Server.Open;
  //Server.Active:= True;

  CardBroadSendCount :=0;  //총 전송할 건수
  CurCBCount :=0;          //현재 진행중인 건수
  BroadControlerNum := '';
  BroadID := '';
  btBroadFileRetry.Enabled := False;
  BroadSleep_Timer.Enabled := False;

  RzPageControl1.ActivePageIndex:= 0;
  bFormStateIndicateShow := False;
  bAutoDeviceInfoSave := False;
  {
  ed_ftpLocalip.text := Trim(Get_Local_IPAddr);
  nPos := Pos(' ',ed_ftpLocalip.text);
  if nPos > 0 then
  begin
    ed_ftpLocalip.Text := Trim(copy(ed_ftpLocalip.Text,1,nPos));
    showmessage('Lan Card가 2개 이상입니다. FTP IP는 ' + ed_ftpLocalip.Text + '으로 셋팅됩니다.');
  end;    }
//  MainForm.Caption := MainForm.Caption + '[' + ed_ftpLocalip.Text + ']';

{  fmSelect := TfmSelect.Create(nil);
  fmSelect.Showmodal;
  G_nProgramType := fmSelect.L_nSelected;
  fmSelect.free;
}
  FormProgramSetting(G_nProgramType);
  if G_nProgramType = 1 then
    MainForm.Caption := PROGRAM_NAME +' '+ strBuildInfo+'[' + CB_IPList.Text + '] - [ S-TEC ] '
  else MainForm.Caption := PROGRAM_NAME +' '+ strBuildInfo+'[' + CB_IPList.Text + '] - [ KTTELECOP ] ';

end;

Procedure TMainForm.FillArray_Send;
begin
  Array_SendEdit[1].Edit:= Edit_Send1;
  Array_SendEdit[1].Func:= Edit_Func1;
  Array_SendEdit[1].Btn_Send:= Btn_Send1;
  Array_SendEdit[1].Btn_Clear:= Btn_Clear1;

  Array_SendEdit[2].Edit:= Edit_Send2;
  Array_SendEdit[2].Func:= Edit_Func2;
  Array_SendEdit[2].Btn_Send:= Btn_Send2;
  Array_SendEdit[2].Btn_Clear:= Btn_Clear2;

  Array_SendEdit[3].Edit:= Edit_Send3;
  Array_SendEdit[3].Func:= Edit_Func3;
  Array_SendEdit[3].Btn_Send:= Btn_Send3;
  Array_SendEdit[3].Btn_Clear:= Btn_Clear3;

  Array_SendEdit[4].Edit:= Edit_Send4;
  Array_SendEdit[4].Func:= Edit_Func4;
  Array_SendEdit[4].Btn_Send:= Btn_Send4;
  Array_SendEdit[4].Btn_Clear:= Btn_Clear4;

  Array_SendEdit[5].Edit:= Edit_Send5;
  Array_SendEdit[5].Func:= Edit_Func5;
  Array_SendEdit[5].Btn_Send:= Btn_Send5;
  Array_SendEdit[5].Btn_Clear:= Btn_Clear5;

  Array_SendEdit[6].Edit:= Edit_Send6;
  Array_SendEdit[6].Func:= Edit_Func6;
  Array_SendEdit[6].Btn_Send:= Btn_Send6;
  Array_SendEdit[6].Btn_Clear:= Btn_Clear6;

  Array_SendEdit[7].Edit:= Edit_Send7;
  Array_SendEdit[7].Func:= Edit_Func7;
  Array_SendEdit[7].Btn_Send:= Btn_Send7;
  Array_SendEdit[7].Btn_Clear:= Btn_Clear7;

  Array_SendEdit[8].Edit:= Edit_Send8;
  Array_SendEdit[8].Func:= Edit_Func8;
  Array_SendEdit[8].Btn_Send:= Btn_Send8;
  Array_SendEdit[8].Btn_Clear:= Btn_Clear8;

  Array_SendEdit[9].Edit:= Edit_Send9;
  Array_SendEdit[9].Func:= Edit_Func9;
  Array_SendEdit[9].Btn_Send:= Btn_Send9;
  Array_SendEdit[9].Btn_Clear:= Btn_Clear9;

  Array_SendEdit[0].Edit:= Edit_Send0;
  Array_SendEdit[0].Func:= Edit_Func0;
  Array_SendEdit[0].Btn_Send:= Btn_Send0;
  Array_SendEdit[0].Btn_Clear:= Btn_Clear0;

  Array_SendEdit[10].Edit:= Edit_SendA;
  Array_SendEdit[10].Func:= Edit_FuncA;
  Array_SendEdit[10].Btn_Send:= Btn_SendA;
  Array_SendEdit[10].Btn_Clear:= Btn_ClearA;

  Array_SendEdit[11].Edit:= Edit_SendB;
  Array_SendEdit[11].Func:= Edit_FuncB;
  Array_SendEdit[11].Btn_Send:= Btn_SendB;
  Array_SendEdit[11].Btn_Clear:= Btn_ClearB;

  Array_SendEdit[12].Edit:= Edit_SendC;
  Array_SendEdit[12].Func:= Edit_FuncC;
  Array_SendEdit[12].Btn_Send:= Btn_SendC;
  Array_SendEdit[12].Btn_Clear:= Btn_ClearC;

  Array_SendEdit[13].Edit:= Edit_SendD;
  Array_SendEdit[13].Func:= Edit_FuncD;
  Array_SendEdit[13].Btn_Send:= Btn_SendD;
  Array_SendEdit[13].Btn_Clear:= Btn_ClearD;

  Array_SendEdit[14].Edit:= Edit_SendE;
  Array_SendEdit[14].Func:= Edit_FuncE;
  Array_SendEdit[14].Btn_Send:= Btn_SendE;
  Array_SendEdit[14].Btn_Clear:= Btn_ClearE;

  Array_SendEdit[15].Edit:= Edit_SendF;
  Array_SendEdit[15].Func:= Edit_FuncF;
  Array_SendEdit[15].Btn_Send:= Btn_SendF;
  Array_SendEdit[15].Btn_Clear:= Btn_ClearF;

  Array_SendEdit[16].Edit:= Edit_Send21;
  Array_SendEdit[16].Func:= Edit_Func21;
  Array_SendEdit[16].Btn_Send:= Btn_Send21;
  Array_SendEdit[16].Btn_Clear:= Btn_Clear21;

  Array_SendEdit[17].Edit:= Edit_Send22;
  Array_SendEdit[17].Func:= Edit_Func22;
  Array_SendEdit[17].Btn_Send:= Btn_Send22;
  Array_SendEdit[17].Btn_Clear:= Btn_Clear22;

  Array_SendEdit[18].Edit:= Edit_Send23;
  Array_SendEdit[18].Func:= Edit_Func23;
  Array_SendEdit[18].Btn_Send:= Btn_Send23;
  Array_SendEdit[18].Btn_Clear:= Btn_Clear23;

  Array_SendEdit[19].Edit:= Edit_Send24;
  Array_SendEdit[19].Func:= Edit_Func24;
  Array_SendEdit[19].Btn_Send:= Btn_Send24;
  Array_SendEdit[19].Btn_Clear:= Btn_Clear24;

  Array_SendEdit[20].Edit:= Edit_Send25;
  Array_SendEdit[20].Func:= Edit_Func25;
  Array_SendEdit[20].Btn_Send:= Btn_Send25;
  Array_SendEdit[20].Btn_Clear:= Btn_Clear25;

  Array_SendEdit[21].Edit:= Edit_Send26;
  Array_SendEdit[21].Func:= Edit_Func26;
  Array_SendEdit[21].Btn_Send:= Btn_Send26;
  Array_SendEdit[21].Btn_Clear:= Btn_Clear26;

  Array_SendEdit[22].Edit:= Edit_Send27;
  Array_SendEdit[22].Func:= Edit_Func27;
  Array_SendEdit[22].Btn_Send:= Btn_Send27;
  Array_SendEdit[22].Btn_Clear:= Btn_Clear27;

  Array_SendEdit[23].Edit:= Edit_Send28;
  Array_SendEdit[23].Func:= Edit_Func28;
  Array_SendEdit[23].Btn_Send:= Btn_Send28;
  Array_SendEdit[23].Btn_Clear:= Btn_Clear28;

  Array_SendEdit[24].Edit:= Edit_Send29;
  Array_SendEdit[24].Func:= Edit_Func29;
  Array_SendEdit[24].Btn_Send:= Btn_Send29;
  Array_SendEdit[24].Btn_Clear:= Btn_Clear29;

  Array_SendEdit[25].Edit:= Edit_Send20;
  Array_SendEdit[25].Func:= Edit_Func20;
  Array_SendEdit[25].Btn_Send:= Btn_Send20;
  Array_SendEdit[25].Btn_Clear:= Btn_Clear20;

  Array_SendEdit[26].Edit:= Edit_Send2A;
  Array_SendEdit[26].Func:= Edit_Func2A;
  Array_SendEdit[26].Btn_Send:= Btn_Send2A;
  Array_SendEdit[26].Btn_Clear:= Btn_Clear2A;

  Array_SendEdit[27].Edit:= Edit_Send2B;
  Array_SendEdit[27].Func:= Edit_Func2B;
  Array_SendEdit[27].Btn_Send:= Btn_Send2B;
  Array_SendEdit[27].Btn_Clear:= Btn_Clear2B;

  Array_SendEdit[28].Edit:= Edit_Send2C;
  Array_SendEdit[28].Func:= Edit_Func2C;
  Array_SendEdit[28].Btn_Send:= Btn_Send2C;
  Array_SendEdit[28].Btn_Clear:= Btn_Clear2C;

  Array_SendEdit[29].Edit:= Edit_Send2D;
  Array_SendEdit[29].Func:= Edit_Func2D;
  Array_SendEdit[29].Btn_Send:= Btn_Send2D;
  Array_SendEdit[29].Btn_Clear:= Btn_Clear2D;

  Array_SendEdit[30].Edit:= Edit_Send2E;
  Array_SendEdit[30].Func:= Edit_Func2E;
  Array_SendEdit[30].Btn_Send:= Btn_Send2E;
  Array_SendEdit[30].Btn_Clear:= Btn_Clear2E;

  Array_SendEdit[31].Edit:= Edit_SendF;
  Array_SendEdit[31].Func:= Edit_FuncF;
  Array_SendEdit[31].Btn_Send:= Btn_SendF;
  Array_SendEdit[31].Btn_Clear:= Btn_ClearF;

  Array_SendEdit[32].Edit:= Edit_Send31;
  Array_SendEdit[32].Func:= Edit_Func31;
  Array_SendEdit[32].Btn_Send:= Btn_Send31;
  Array_SendEdit[32].Btn_Clear:= Btn_Clear31;

  Array_SendEdit[33].Edit:= Edit_Send32;
  Array_SendEdit[33].Func:= Edit_Func32;
  Array_SendEdit[33].Btn_Send:= Btn_Send32;
  Array_SendEdit[33].Btn_Clear:= Btn_Clear32;

  Array_SendEdit[34].Edit:= Edit_Send33;
  Array_SendEdit[34].Func:= Edit_Func33;
  Array_SendEdit[34].Btn_Send:= Btn_Send33;
  Array_SendEdit[34].Btn_Clear:= Btn_Clear33;

  Array_SendEdit[35].Edit:= Edit_Send34;
  Array_SendEdit[35].Func:= Edit_Func34;
  Array_SendEdit[35].Btn_Send:= Btn_Send34;
  Array_SendEdit[35].Btn_Clear:= Btn_Clear34;

  Array_SendEdit[36].Edit:= Edit_Send35;
  Array_SendEdit[36].Func:= Edit_Func35;
  Array_SendEdit[36].Btn_Send:= Btn_Send35;
  Array_SendEdit[36].Btn_Clear:= Btn_Clear35;

  Array_SendEdit[37].Edit:= Edit_Send36;
  Array_SendEdit[37].Func:= Edit_Func36;
  Array_SendEdit[37].Btn_Send:= Btn_Send36;
  Array_SendEdit[37].Btn_Clear:= Btn_Clear36;

  Array_SendEdit[38].Edit:= Edit_Send37;
  Array_SendEdit[38].Func:= Edit_Func37;
  Array_SendEdit[38].Btn_Send:= Btn_Send37;
  Array_SendEdit[38].Btn_Clear:= Btn_Clear37;

  Array_SendEdit[39].Edit:= Edit_Send38;
  Array_SendEdit[39].Func:= Edit_Func38;
  Array_SendEdit[39].Btn_Send:= Btn_Send38;
  Array_SendEdit[39].Btn_Clear:= Btn_Clear38;

  Array_SendEdit[40].Edit:= Edit_Send39;
  Array_SendEdit[40].Func:= Edit_Func39;
  Array_SendEdit[40].Btn_Send:= Btn_Send39;
  Array_SendEdit[40].Btn_Clear:= Btn_Clear39;

  Array_SendEdit[41].Edit:= Edit_Send30;
  Array_SendEdit[41].Func:= Edit_Func30;
  Array_SendEdit[41].Btn_Send:= Btn_Send30;
  Array_SendEdit[41].Btn_Clear:= Btn_Clear30;

  Array_SendEdit[42].Edit:= Edit_Send3A;
  Array_SendEdit[42].Func:= Edit_Func3A;
  Array_SendEdit[42].Btn_Send:= Btn_Send3A;
  Array_SendEdit[42].Btn_Clear:= Btn_Clear3A;

  Array_SendEdit[43].Edit:= Edit_Send3B;
  Array_SendEdit[43].Func:= Edit_Func3B;
  Array_SendEdit[43].Btn_Send:= Btn_Send3B;
  Array_SendEdit[43].Btn_Clear:= Btn_Clear3B;

  Array_SendEdit[44].Edit:= Edit_Send3C;
  Array_SendEdit[44].Func:= Edit_Func3C;
  Array_SendEdit[44].Btn_Send:= Btn_Send3C;
  Array_SendEdit[44].Btn_Clear:= Btn_Clear3C;

  Array_SendEdit[45].Edit:= Edit_Send3D;
  Array_SendEdit[45].Func:= Edit_Func3D;
  Array_SendEdit[45].Btn_Send:= Btn_Send3D;
  Array_SendEdit[45].Btn_Clear:= Btn_Clear3D;

  Array_SendEdit[46].Edit:= Edit_Send3E;
  Array_SendEdit[46].Func:= Edit_Func3E;
  Array_SendEdit[46].Btn_Send:= Btn_Send3E;
  Array_SendEdit[46].Btn_Clear:= Btn_Clear3E;

  Array_SendEdit[47].Edit:= Edit_Send3F;
  Array_SendEdit[47].Func:= Edit_Func3F;
  Array_SendEdit[47].Btn_Send:= Btn_Send3F;
  Array_SendEdit[47].Btn_Clear:= Btn_Clear3F;

  Array_SendEdit[48].Edit:= Edit_Send51;
  Array_SendEdit[48].Func:= Edit_Func51;
  Array_SendEdit[48].Btn_Send:= Btn_Send51;
  Array_SendEdit[48].Btn_Clear:= Btn_Clear51;

  Array_SendEdit[49].Edit:= Edit_Send52;
  Array_SendEdit[49].Func:= Edit_Func52;
  Array_SendEdit[49].Btn_Send:= Btn_Send52;
  Array_SendEdit[49].Btn_Clear:= Btn_Clear52;

  Array_SendEdit[50].Edit:= Edit_Send53;
  Array_SendEdit[50].Func:= Edit_Func53;
  Array_SendEdit[50].Btn_Send:= Btn_Send53;
  Array_SendEdit[50].Btn_Clear:= Btn_Clear53;

  Array_SendEdit[51].Edit:= Edit_Send54;
  Array_SendEdit[51].Func:= Edit_Func54;
  Array_SendEdit[51].Btn_Send:= Btn_Send54;
  Array_SendEdit[51].Btn_Clear:= Btn_Clear54;

  Array_SendEdit[52].Edit:= Edit_Send55;
  Array_SendEdit[52].Func:= Edit_Func55;
  Array_SendEdit[52].Btn_Send:= Btn_Send55;
  Array_SendEdit[52].Btn_Clear:= Btn_Clear55;

  Array_SendEdit[53].Edit:= Edit_Send56;
  Array_SendEdit[53].Func:= Edit_Func56;
  Array_SendEdit[53].Btn_Send:= Btn_Send56;
  Array_SendEdit[53].Btn_Clear:= Btn_Clear56;

  Array_SendEdit[54].Edit:= Edit_Send57;
  Array_SendEdit[54].Func:= Edit_Func57;
  Array_SendEdit[54].Btn_Send:= Btn_Send57;
  Array_SendEdit[54].Btn_Clear:= Btn_Clear57;

  Array_SendEdit[55].Edit:= Edit_Send58;
  Array_SendEdit[55].Func:= Edit_Func58;
  Array_SendEdit[55].Btn_Send:= Btn_Send58;
  Array_SendEdit[55].Btn_Clear:= Btn_Clear58;

  Array_SendEdit[56].Edit:= Edit_Send59;
  Array_SendEdit[56].Func:= Edit_Func59;
  Array_SendEdit[56].Btn_Send:= Btn_Send59;
  Array_SendEdit[56].Btn_Clear:= Btn_Clear59;

  Array_SendEdit[57].Edit:= Edit_Send50;
  Array_SendEdit[57].Func:= Edit_Func50;
  Array_SendEdit[57].Btn_Send:= Btn_Send50;
  Array_SendEdit[57].Btn_Clear:= Btn_Clear50;

  Array_SendEdit[58].Edit:= Edit_Send5A;
  Array_SendEdit[58].Func:= Edit_Func5A;
  Array_SendEdit[58].Btn_Send:= Btn_Send5A;
  Array_SendEdit[58].Btn_Clear:= Btn_Clear5A;

  Array_SendEdit[59].Edit:= Edit_Send5B;
  Array_SendEdit[59].Func:= Edit_Func5B;
  Array_SendEdit[59].Btn_Send:= Btn_Send5B;
  Array_SendEdit[59].Btn_Clear:= Btn_Clear5B;

  Array_SendEdit[60].Edit:= Edit_Send5C;
  Array_SendEdit[60].Func:= Edit_Func5C;
  Array_SendEdit[60].Btn_Send:= Btn_Send5C;
  Array_SendEdit[60].Btn_Clear:= Btn_Clear5C;

  Array_SendEdit[61].Edit:= Edit_Send5D;
  Array_SendEdit[61].Func:= Edit_Func5D;
  Array_SendEdit[61].Btn_Send:= Btn_Send5D;
  Array_SendEdit[61].Btn_Clear:= Btn_Clear5D;

  Array_SendEdit[62].Edit:= Edit_Send5E;
  Array_SendEdit[62].Func:= Edit_Func5E;
  Array_SendEdit[62].Btn_Send:= Btn_Send5E;
  Array_SendEdit[62].Btn_Clear:= Btn_Clear5E;

  Array_SendEdit[63].Edit:= Edit_Send5F;
  Array_SendEdit[63].Func:= Edit_Func5F;
  Array_SendEdit[63].Btn_Send:= Btn_Send5F;
  Array_SendEdit[63].Btn_Clear:= Btn_Clear5F;


  Array_FingerEdit[1].FingFUNC := edit_Func41;
  Array_FingerEdit[1].FingCMD  := edit_cmd41;
  Array_FingerEdit[1].FingSTART := ed_finCmd41;
  Array_FingerEdit[1].FingData1 := ed_Findt141;
  Array_FingerEdit[1].FingData2 := ed_Findt241;
  Array_FingerEdit[1].FingData3 := ed_findt341;
  Array_FingerEdit[1].FingData4 := ed_findt441;
  Array_FingerEdit[1].FingCheckSum := ed_fincheck41;
  Array_FingerEdit[1].FingEND := ed_finEnd41;
  Array_FingerEdit[1].Btn_Send := btn_send41;
  Array_FingerEdit[1].Btn_Clear := btn_Clear41;


  Array_FingerEdit[2].FingFUNC := edit_Func42;
  Array_FingerEdit[2].FingCMD  := edit_cmd42;
  Array_FingerEdit[2].FingSTART := ed_finCmd42;
  Array_FingerEdit[2].FingData1 := ed_Findt142;
  Array_FingerEdit[2].FingData2 := ed_Findt242;
  Array_FingerEdit[2].FingData3 := ed_findt342;
  Array_FingerEdit[2].FingData4 := ed_findt442;
  Array_FingerEdit[2].FingCheckSum := ed_fincheck42;
  Array_FingerEdit[2].FingEND := ed_finEnd42;
  Array_FingerEdit[2].Btn_Send := btn_send42;
  Array_FingerEdit[2].Btn_Clear := btn_Clear42;

  Array_FingerEdit[3].FingFUNC := edit_Func43;
  Array_FingerEdit[3].FingCMD  := edit_cmd43;
  Array_FingerEdit[3].FingSTART := ed_finCmd43;
  Array_FingerEdit[3].FingData1 := ed_Findt143;
  Array_FingerEdit[3].FingData2 := ed_Findt243;
  Array_FingerEdit[3].FingData3 := ed_findt343;
  Array_FingerEdit[3].FingData4 := ed_findt443;
  Array_FingerEdit[3].FingCheckSum := ed_fincheck43;
  Array_FingerEdit[3].FingEND := ed_finEnd43;
  Array_FingerEdit[3].Btn_Send := btn_send43;
  Array_FingerEdit[3].Btn_Clear := btn_Clear43;

  Array_FingerEdit[4].FingFUNC := edit_Func44;
  Array_FingerEdit[4].FingCMD  := edit_cmd44;
  Array_FingerEdit[4].FingSTART := ed_finCmd44;
  Array_FingerEdit[4].FingData1 := ed_Findt144;
  Array_FingerEdit[4].FingData2 := ed_Findt244;
  Array_FingerEdit[4].FingData3 := ed_findt344;
  Array_FingerEdit[4].FingData4 := ed_findt444;
  Array_FingerEdit[4].FingCheckSum := ed_fincheck44;
  Array_FingerEdit[4].FingEND := ed_finEnd44;
  Array_FingerEdit[4].Btn_Send := btn_send44;
  Array_FingerEdit[4].Btn_Clear := btn_Clear44;

  Array_FingerEdit[5].FingFUNC := edit_Func45;
  Array_FingerEdit[5].FingCMD  := edit_cmd45;
  Array_FingerEdit[5].FingSTART := ed_finCmd45;
  Array_FingerEdit[5].FingData1 := ed_Findt145;
  Array_FingerEdit[5].FingData2 := ed_Findt245;
  Array_FingerEdit[5].FingData3 := ed_findt345;
  Array_FingerEdit[5].FingData4 := ed_findt445;
  Array_FingerEdit[5].FingCheckSum := ed_fincheck45;
  Array_FingerEdit[5].FingEND := ed_finEnd45;
  Array_FingerEdit[5].Btn_Send := btn_send45;
  Array_FingerEdit[5].Btn_Clear := btn_Clear45;

  Array_FingerEdit[6].FingFUNC := edit_Func46;
  Array_FingerEdit[6].FingCMD  := edit_cmd46;
  Array_FingerEdit[6].FingSTART := ed_finCmd46;
  Array_FingerEdit[6].FingData1 := ed_Findt146;
  Array_FingerEdit[6].FingData2 := ed_Findt246;
  Array_FingerEdit[6].FingData3 := ed_findt346;
  Array_FingerEdit[6].FingData4 := ed_findt446;
  Array_FingerEdit[6].FingCheckSum := ed_fincheck46;
  Array_FingerEdit[6].FingEND := ed_finEnd46;
  Array_FingerEdit[6].Btn_Send := btn_send46;
  Array_FingerEdit[6].Btn_Clear := btn_Clear46;

  Array_FingerEdit[7].FingFUNC := edit_Func47;
  Array_FingerEdit[7].FingCMD  := edit_cmd47;
  Array_FingerEdit[7].FingSTART := ed_finCmd47;
  Array_FingerEdit[7].FingData1 := ed_Findt147;
  Array_FingerEdit[7].FingData2 := ed_Findt247;
  Array_FingerEdit[7].FingData3 := ed_findt347;
  Array_FingerEdit[7].FingData4 := ed_findt447;
  Array_FingerEdit[7].FingCheckSum := ed_fincheck47;
  Array_FingerEdit[7].FingEND := ed_finEnd47;
  Array_FingerEdit[7].Btn_Send := btn_send47;
  Array_FingerEdit[7].Btn_Clear := btn_Clear47;

  Array_FingerEdit[8].FingFUNC := edit_Func48;
  Array_FingerEdit[8].FingCMD  := edit_cmd48;
  Array_FingerEdit[8].FingSTART := ed_finCmd48;
  Array_FingerEdit[8].FingData1 := ed_Findt148;
  Array_FingerEdit[8].FingData2 := ed_Findt248;
  Array_FingerEdit[8].FingData3 := ed_findt348;
  Array_FingerEdit[8].FingData4 := ed_findt448;
  Array_FingerEdit[8].FingCheckSum := ed_fincheck48;
  Array_FingerEdit[8].FingEND := ed_finEnd48;
  Array_FingerEdit[8].Btn_Send := btn_send48;
  Array_FingerEdit[8].Btn_Clear := btn_Clear48;

  Array_FingerEdit[9].FingFUNC := edit_Func49;
  Array_FingerEdit[9].FingCMD  := edit_cmd49;
  Array_FingerEdit[9].FingSTART := ed_finCmd49;
  Array_FingerEdit[9].FingData1 := ed_Findt149;
  Array_FingerEdit[9].FingData2 := ed_Findt249;
  Array_FingerEdit[9].FingData3 := ed_findt349;
  Array_FingerEdit[9].FingData4 := ed_findt449;
  Array_FingerEdit[9].FingCheckSum := ed_fincheck49;
  Array_FingerEdit[9].FingEND := ed_finEnd49;
  Array_FingerEdit[9].Btn_Send := btn_send49;
  Array_FingerEdit[9].Btn_Clear := btn_Clear49;

  Array_FingerEdit[10].FingFUNC := edit_Func40;
  Array_FingerEdit[10].FingCMD  := edit_cmd40;
  Array_FingerEdit[10].FingSTART := ed_finCmd40;
  Array_FingerEdit[10].FingData1 := ed_Findt140;
  Array_FingerEdit[10].FingData2 := ed_Findt240;
  Array_FingerEdit[10].FingData3 := ed_findt340;
  Array_FingerEdit[10].FingData4 := ed_findt440;
  Array_FingerEdit[10].FingCheckSum := ed_fincheck40;
  Array_FingerEdit[10].FingEND := ed_finEnd40;
  Array_FingerEdit[10].Btn_Send := btn_send40;
  Array_FingerEdit[10].Btn_Clear := btn_Clear40;

  Array_FingerEdit[11].FingFUNC := edit_Func4A;
  Array_FingerEdit[11].FingCMD  := edit_cmd4A;
  Array_FingerEdit[11].FingSTART := ed_finCmd4A;
  Array_FingerEdit[11].FingData1 := ed_Findt14A;
  Array_FingerEdit[11].FingData2 := ed_Findt24A;
  Array_FingerEdit[11].FingData3 := ed_findt34A;
  Array_FingerEdit[11].FingData4 := ed_findt44A;
  Array_FingerEdit[11].FingCheckSum := ed_fincheck4A;
  Array_FingerEdit[11].FingEND := ed_finEnd4A;
  Array_FingerEdit[11].Btn_Send := btn_send4A;
  Array_FingerEdit[11].Btn_Clear := btn_Clear4A;

  Array_FingerEdit[12].FingFUNC := edit_Func4B;
  Array_FingerEdit[12].FingCMD  := edit_cmd4B;
  Array_FingerEdit[12].FingSTART := ed_finCmd4B;
  Array_FingerEdit[12].FingData1 := ed_Findt14B;
  Array_FingerEdit[12].FingData2 := ed_Findt24B;
  Array_FingerEdit[12].FingData3 := ed_findt34B;
  Array_FingerEdit[12].FingData4 := ed_findt44B;
  Array_FingerEdit[12].FingCheckSum := ed_fincheck4B;
  Array_FingerEdit[12].FingEND := ed_finEnd4B;
  Array_FingerEdit[12].Btn_Send := btn_send4B;
  Array_FingerEdit[12].Btn_Clear := btn_Clear4B;

  Array_FingerEdit[13].FingFUNC := edit_Func4C;
  Array_FingerEdit[13].FingCMD  := edit_cmd4C;
  Array_FingerEdit[13].FingSTART := ed_finCmd4C;
  Array_FingerEdit[13].FingData1 := ed_Findt14C;
  Array_FingerEdit[13].FingData2 := ed_Findt24C;
  Array_FingerEdit[13].FingData3 := ed_findt34C;
  Array_FingerEdit[13].FingData4 := ed_findt44C;
  Array_FingerEdit[13].FingCheckSum := ed_fincheck4C;
  Array_FingerEdit[13].FingEND := ed_finEnd4C;
  Array_FingerEdit[13].Btn_Send := btn_send4C;
  Array_FingerEdit[13].Btn_Clear := btn_Clear4C;

  Array_FingerEdit[14].FingFUNC := edit_Func4D;
  Array_FingerEdit[14].FingCMD  := edit_cmd4D;
  Array_FingerEdit[14].FingSTART := ed_finCmd4D;
  Array_FingerEdit[14].FingData1 := ed_Findt14D;
  Array_FingerEdit[14].FingData2 := ed_Findt24D;
  Array_FingerEdit[14].FingData3 := ed_findt34D;
  Array_FingerEdit[14].FingData4 := ed_findt44D;
  Array_FingerEdit[14].FingCheckSum := ed_fincheck4D;
  Array_FingerEdit[14].FingEND := ed_finEnd4D;
  Array_FingerEdit[14].Btn_Send := btn_send4D;
  Array_FingerEdit[14].Btn_Clear := btn_Clear4D;

  Array_FingerEdit[15].FingFUNC := edit_Func4E;
  Array_FingerEdit[15].FingCMD  := edit_cmd4E;
  Array_FingerEdit[15].FingSTART := ed_finCmd4E;
  Array_FingerEdit[15].FingData1 := ed_Findt14E;
  Array_FingerEdit[15].FingData2 := ed_Findt24E;
  Array_FingerEdit[15].FingData3 := ed_findt34E;
  Array_FingerEdit[15].FingData4 := ed_findt44E;
  Array_FingerEdit[15].FingCheckSum := ed_fincheck4E;
  Array_FingerEdit[15].FingEND := ed_finEnd4E;
  Array_FingerEdit[15].Btn_Send := btn_send4E;
  Array_FingerEdit[15].Btn_Clear := btn_Clear4E;

  Array_FingerEdit[16].FingFUNC := edit_Func4F;
  Array_FingerEdit[16].FingCMD  := edit_cmd4F;
  Array_FingerEdit[16].FingSTART := ed_finCmd4F;
  Array_FingerEdit[16].FingData1 := ed_Findt14F;
  Array_FingerEdit[16].FingData2 := ed_Findt24F;
  Array_FingerEdit[16].FingData3 := ed_findt34F;
  Array_FingerEdit[16].FingData4 := ed_findt44F;
  Array_FingerEdit[16].FingCheckSum := ed_fincheck4F;
  Array_FingerEdit[16].FingEND := ed_finEnd4F;
  Array_FingerEdit[16].Btn_Send := btn_send4F;
  Array_FingerEdit[16].Btn_Clear := btn_Clear4F;

  Array_FingerEdit[1].FingFUNC := edit_Func41;
  Array_FingerEdit[1].FingCMD  := edit_cmd41;
  Array_FingerEdit[1].FingSTART := ed_finCmd41;
  Array_FingerEdit[1].FingData1 := ed_Findt141;
  Array_FingerEdit[1].FingData2 := ed_Findt241;
  Array_FingerEdit[1].FingData3 := ed_findt341;
  Array_FingerEdit[1].FingData4 := ed_findt441;
  Array_FingerEdit[1].FingCheckSum := ed_fincheck41;
  Array_FingerEdit[1].FingEND := ed_finEnd41;
  Array_FingerEdit[1].Btn_Send := btn_send41;
  Array_FingerEdit[1].Btn_Clear := btn_Clear41;

end;


function TMainForm.CheckDataPacket(aData: String; var bData:String;var aPacketData:string):integer;
var
  aIndex: Integer;
  Lenstr: String;
  DefinedDataLength: Integer;
  StrBuff: String;
  etxIndex: Integer;
  aKey: Byte;
  st : string;
begin

  result := -1; //비정상 전문

  aPacketData:= '';
  Lenstr:= Copy(aData,2,3);
  //데이터 길이 위치 데이터가 숫자가 아니면...
  if not isDigit(Lenstr) then
  begin
    //Delete(aData,1,1);       //1'st STX 삭제
    bData:= aData;           //한자리 삭제 후  리턴
    {
    aIndex:= Pos(STX,aData); // 다음 STX 찾기
    if aIndex = 0 then       //STX가 없으면...
    begin
      //전체 데이터 버림
      bData:= '';
    end else if aIndex > 1 then // STX가 1'st가 아니면
    begin
      Delete(aData,1,aIndex-1);//STX 앞 데이터 삭제
      bData:= aData;
    end else
    begin
      bData:= aData;
    end;   }
    Exit;
  end;

  //패킷에 정의된 길이
  DefinedDataLength:= StrtoInt(Lenstr);
  //패킷에 정의된 길이보다 실제 데이터가 작으면
  if Length(aData) < DefinedDataLength then
  begin
    result := -2; //자릿수가 작게 들어온 경우
    //실제 데이터가 길이가 작으면(아직 다 못받은 상태)
    {etxIndex:= POS(ETX,aData);
    if etxIndex > 0 then
    begin
     Delete(aData,1,etxIndex);
    end;   }
    bData:= aData;
    Exit;
  end;

  // 정의된 길이 마지막 데이터가 ETX가 맞는가?
  if aData[DefinedDataLength] = ETX then
  begin

    StrBuff:= Copy(aData,1,DefinedDataLength);
    // 2010.11.22 패킷 체크 부분에서 체크썸까지 체크로 변경 하기 위해서 작업 함.
    //31:Q++()./,-**s*S^**+()./,-()
    aKey:= Ord(StrBuff[5]);
    st:= Copy(StrBuff,1,5) + EncodeData(aKey,Copy(StrBuff,6,Length(StrBuff)-6))+StrBuff[Length(StrBuff)];

    if Not ChekCSData(st,Length(StrBuff)) then
    begin
      //Delete(aData,1,1);
      bData:= aData;
      Exit;
    end;
    // 2010.11.22 패킷 체크 부분에서 체크썸까지 체크로 변경 하기 위해서 작업 함.

    result := 1; //STX 포맷이 맞다
    Delete(aData, 1, DefinedDataLength);
    bData:= aData;
    //if ChekCSData(StrBuff,DefinedDataLength) then
    aPacketData:=st;
  end else
  begin
    //마직막 데이터가 EXT가 아니면 1'st STX지우고 다음 STX를 찾는다.
    //Delete(aData,1,1);
    bData:= aData;
    {aIndex:= Pos(STX,aData); // 다음 STX 찾기
    if aIndex = 0 then       //STX가 없으면...
    begin
      //전체 데이터 버림
      bData:= '';
    end else if aIndex > 1 then // STX가 1'st가 아니면
    begin
      Delete(aData,1,aIndex-1);//STX 앞 데이터 삭제
      bData:= aData;
    end else
    begin
      bData:= aData;
    end;  }
  end;
end;

{정상적으로 들어온 데이터 패킷 처리 루틴}
function TMainForm.DataPacektProcess(aPacketData: string):Boolean;
var
  aKey: Byte;
  st: string;
  aCommand: Char;
  aCntId: String;
  aRealData : String;
  aVer : string;
  stEventData : string;
begin
  Result:= False;
  if aPacketData = '' then Exit;

{ //체크썸 부분을 패킷 체크하는 부분으로 빼자.
  //31:Q++()./,-**s*S^**+()./,-()
  aKey:= Ord(aPacketData[5]);
  st:= Copy(aPacketData,1,5) + EncodeData(aKey,Copy(aPacketData,6,Length(aPacketData)-6))+aPacketData[Length(aPacketData)];

  if Not ChekCSData(st,Length(aPacketData)) then Exit;

  aPacketData:= st;
}
  aVer := copy(aPacketData,6,2);
  Sent_Ver :=  aVer;
  stEventData := GetEventData(aVer,aPacketData);

  aCntId:= Copy(aPacketData,8,G_nIDLength + 2);
  aCommand:= aPacketData[G_nIDLength + 10];
  Rcv_MsgNo:= aPacketData[G_nIDLength + 11];

  aRealData := Copy(aPacketData,G_nIDLength + 12,Length(aPacketData)-(G_nIDLength + 14));

  st:=  WinsockPort.WsAddress +#9+
        Copy(aCntId,1,G_nIDLength)+#9+
        Copy(aCntId,G_nIDLength + 1,2)+#9+
        aCommand+#9+
        aRealData+#9+
        'RX'+#9+
        aPacketData;
//        Copy(aData,19,Length(aData)-21)+#9+
//  if aCommand <> '#' then
//  begin
    if cbDisplayPolling.Checked = True then
    begin
      AddEventList(stEventData);
    end else
    begin
      if aCommand <> 'e' then AddEventList(stEventData);
    end;
//  end else
//  begin
//    if chk_Gauge.Checked then AddEventList(stEventData);
//  end;

  if  (aCommand = 'e') then
  begin
      if RzCheckBox2.Checked then PollingAck(aCntID);
  end else if (aCommand = 'a') then
  begin
    Exit;
  end else if (aCommand <> 'c') then
  begin
    if (aCommand <> '#') then
    begin
      if RzCheckBox2.Checked then // ACK 응답 처리
      begin
        if (aCommand <> '*') then SendPacket(aCntID,'a','',aVer);   //브로드캐스팅일때는 무시
      end;
    end;
  end;


  {받은 데이터 커맨드별 처리}
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
  ★ c(출입통제 데이터)인경우에는 ACK 를 'c' command를 만들어 응답을 해야 한다.
  즉 ACK 응답을 두번 주어야 한다.(①전체 패킷응답,②출입통제 응답)
   ================================================================================ }

  if (aVer = 'K1') or (aVer = 'ST') then
  begin
    //codesite.SendMsg(st);
    case aCommand of
      'A':{알람}          begin  end;
      'i':{Initial}       begin  RegDataProcess(aPacketData)    end;
      'R':{Remote}        begin  RemoteDataProcess(aPacketData) end;
      'r':{Remote Answer} begin  RemoteDataProcess(aPacketData) end;
      'c':{출입통제}      begin  AccessDataProcess(aPacketData) end;
      'f':{펌웨어}        begin  FirmwareProcess(aPacketData)   end;
      'F':{펌웨어}        begin  FirmwareProcess2(aPacketData)  end;
      '*':{브로드캐스트}  begin  BroadCastProcess(aPacketData)  end;
      'E':{브로드캐스트에러} begin  BroadErrorProcess(aPacketData) end;
      'm':{관제데이터 모니터링 } begin PTMonitoringProcess(aPacketData) end;
      '#':{게이지 값 모니터링} begin GageMonitor(aPacketData) end;
      'e':{ERROR}
      else {error 발생: [E003]정의 되지 않은 커맨드}
    end;
  end else if aVer = 'AD' then
  begin
    case aCommand of
      'i':{Initial}       begin  RegStateIndicateProcess(aPacketData)    end;
      'c':{출입통제}      begin  StateIndicateAccessDataProcess(aPacketData) end;
      else {error 발생: [E003]정의 되지 않은 커맨드}
    end;
  end;

  Result:= True;
end;

{등록데이터 응답 처리}
Procedure TMainForm.RegDataProcess(aPacketData: String);
var
  aDeviceCode: String;
  I: Integer;
  aRegCode: cString;
  aRegGubun : string;
begin
  aDeviceCode := Copy(aPacketData, 8,G_nIDLength);
  RzLabel1.Caption:= aDeviceCode;
  Edit_DeviceID.Color:= clYellow;
  Edit_DEviceID.Text:= aDeviceCode;
  Edit_CurrentID.Text:= aDeviceCode;

  For I:= 0 to ComponentCount -1 do
  begin
     if (Components[I] is TRzEdit) and
        (Pos('DeviceID', TRzEdit(Components[I]).Name) > 0 ) then
     begin
      TRzEdit(Components[I]).Text:= aDeviceCode;
     end;
  end;

  aRegCode:= Copy(aPacketData,G_nIDLength + 12,2);
  aRegGubun := Copy(aPacketData,G_nIDLength + 14,2);
  //40 K1123456700i1IF00제론시스템      61
  if aRegCode = 'ID' then
  begin
    RcvDeviceID(aPacketData);
  end else if aRegCode = 'CD' then
  begin
    RcvCR(aPacketData);
  end else if aRegCode = 'SY' then
  begin
    RcvSysinfo(aPacketData);
  end else if aRegCode = 'RY' then
  begin
    RcvRelay(aPacketData)
  end else if aRegCode = 'LP' then
  begin
    RcvPort(aPacketData)
  end else if aRegCode = 'AD' then
  begin
    RcvUsedAlarmdisplay(aPacketData)
  end else if aRegCode = 'EX' then
  begin
    RcvUsedDevice(aPacketData,aRegGubun)
  end else if aRegCode = 'TN' then
  begin
    RcvTellNo(aPacketData);
  end else if aRegCode = 'CT' then
  begin
    RcvCallTime(aPacketData);
  end else if aRegCode = 'BT' then
  begin
    RcvbroadcastTime(aPacketData);
  end else if aRegCode = 'DI' then
  begin
    RcvDialInfo(aPacketData);
  end else if aRegCode = 'DT' then
  begin
    RcvControlDialInfo(aPacketData);
  end else if aRegCode = 'NW' then
  begin
    ClearWiznetInfo;
    if aRegGubun = '00' then
      RcvWiznetInfo(aPacketData)
    else if aRegGubun = '50' then
      RcvKTLAN(copy(aPacketData,G_nIDLength + 11,Length(aPacketData)-(G_nIDLength + 10)));
  end else if aRegCode = 'VC' then
  begin
    RcvVoiceTime(aPacketData);
  end else if aRegCode = 'Id' then
  begin
    RcvLinkusId(aPacketData);
  end else if aRegCode = 'Tn' then
  begin
    RcvLinkusTelNo(aPacketData);
  end else if aRegCode = 'Pt' then
  begin
    RcvLinkusPt(aPacketData);
  end else if aRegCode = 'Rc' then
  begin
    RcvRingCount(aPacketData);
  end else if aRegCode = 'Ct' then
  begin
    RcvCardType(aPacketData);
  end else if aRegCode = '0@' then
  begin
    RcvResetData(aPacketData);
  end else if aRegCode = 'EL' then //존확장기 추가
  begin
    RcvZoneExInfo(aPacketData);
  end;

end;

procedure TMainForm.RemoteDataProcess(aPacketData: String);
var
  aRealData : string;
  aCode: String;
  aGubun:string;
  st: string;
  aIndex: Integer;
  aType:String;
  aRelayNo: Integer;
begin
  //037 K1123456700r1TM00050107180637EF
  aRealData := Copy(aPacketData,G_nIDLength + 12,Length(aPacketData)-(G_nIDLength + 14));
  aCode:= Copy(aPacketData,G_nIDLength + 12,2);
  aGubun:= Copy(aPacketData,G_nIDLength + 14,2);
  if aCode = 'TM' then          //시간설정
  begin
    Edit_TimeSync.Text:= Copy(aPacketData,G_nIDLength + 16,4)+'-'+  //년
                         Copy(aPacketData,G_nIDLength + 20,2)+'-'+  //월
                         Copy(aPacketData,G_nIDLength + 22,2)+' '+  //일
                         Copy(aPacketData,G_nIDLength + 24,2)+':'+  //시
                         Copy(aPacketData,G_nIDLength + 26,2)+':'+  //분
                         Copy(aPacketData,G_nIDLength + 28,2);      //초
    Edit_TimeSync2.Text := Edit_TimeSync.Text;
  end else if aCode = 'VR' then //버젼확인
  begin
    if aGubun = '00' then
    begin
      Edit_Ver.Text:= Copy(aPacketData,G_nIDLength + 16,Length(aPacketData)- (G_nIDLength + 18));
      Edit_TopRomVer.Text:= Edit_Ver.Text;
    end else if aGubun = '01' then
    begin
      edDeviceCode.Text:= Copy(aPacketData,G_nIDLength + 16,Length(aPacketData)-(G_nIDLength + 18));
    end;

  end else if aCode = 'CV' then
  begin
    Label17.Caption:= 'Reader Ver:' + Copy(aPacketData,G_nIDLength + 16,Length(aPacketData)-(G_nIDLength + 18));
  end else if aCode = 'RS' then //Reset
  begin
    Edit_Reset.Text:= Copy(aPacketData,G_nIDLength + 16,Length(aPacketData)-(G_nIDLength + 16));
    Edit_Reset2.Text := Edit_Reset.Text;
  end else if aCode = 'MC' then   //Change mode
  begin
    ComboBox_Zone.Color:= clYellow;
    RzComboBox1.Color:= ClYellow;
    st:= Copy(aPacketData,G_nIDLength + 14,2);
    if isDigit(st) then
    begin
      aIndex:=  StrtoInt(st);
      if aIndex >= ComboBox_Zone.Items.Count  then Exit;
      ComboBox_Zone.ItemIndex:= aIndex;
      ComboBox_Zone.Text:=ComboBox_Zone.Items[aIndex];
    end;

    case aPacketData[G_nIDLength + 16] of
      'A': RzComboBox1.ItemIndex:= 0;
      'D': RzComboBox1.ItemIndex:= 1;
      'P': RzComboBox1.ItemIndex:= 2;
    end;
    RzComboBox1.Text:= RzComboBox1.Items[RzComboBox1.ItemIndex];
  end else if aCode = 'RN' then
  begin
    Edit_Random.Text:= Copy(aPacketData,G_nIDLength + 16,Length(aPacketData)-(G_nIDLength + 17));
  end else if aCode = 'RY' then
  begin
    aType:= Copy(aPacketData,G_nIDLength + 16,2);
    if aType = 'SI' then
    begin
      if aPacketData[G_nIDLength + 18] = '1' then SHowMessage('싸이렌이 ON 되었습니다.')
      else                    SHowMessage('싸이렌이 OFF 되었습니다.')
    end else if aType = 'LP'then
    begin
      if aPacketData[G_nIDLength + 18] = '1' then SHowMessage('경광등이 ON 되었습니다.')
      else                    SHowMessage('경광등이 OFF 되었습니다.')
    end else
    begin
{      if isDigit(aType) then
      begin
        aRelayNo:= StrtoInt(aType);
        cb_RelayNo.ItemIndex:= aRelayNo-1;
        if aData[25] = '1' then cb_RelayOnOff.ItemIndex:= 1
        else if aData[25] = 'o' then cb_RelayOnOff.ItemIndex:= 2
        else if aData[25] = 'f' then cb_RelayOnOff.ItemIndex:= 3
        else                    cb_RelayOnOff.ItemIndex:= 0;
      end;  }
    end;
  end else if aCode = 'Pt' then //
  begin
    st:= Copy(aPacketData,G_nIDLength + 16,2);
    edPtDelayTime.Color:= clYellow;
    edPtDelayTime.Text:= st;
  end else if aCode = 'Rd' then
  begin
   SHowMessage('전화걸기 요청 응답'+#13+ Copy(aPacketData,G_nIDLength + 16,Length(aPacketData)-(G_nIDLength + 17)));
  end else if aCode = 'sc' then //
  begin
    st:= Copy(aPacketData,G_nIDLength + 16,Length(aPacketData)-(G_nIDLength + 18));
    ed_SortDisp.Color:= clYellow;
    ed_SortDisp.Text:= st;
  end else if aCode = 'CD' then
  begin
    aType:= Copy(aPacketData,G_nIDLength + 14,2);
    if aType = '00' then Label141.Caption := copy(aPacketData,G_nIDLength + 16,Length(aPacketData)-(G_nIDLength + 18))
    else if aType = '01' then Label142.Caption := copy(aPacketData,G_nIDLength + 16,Length(aPacketData)-(G_nIDLength + 18))
    else if aType = '20' then ed_resultCardNo.Text := GetPositionToCardNo(aPacketData)
    else if aType = '21' then ed_resultPosition.Text := GetCardNoToPosition(aPacketData);
  end else if aCode = 'SM' then
  begin
    if aGubun = '51' then
    begin
      if Copy(aPacketData,G_nIDLength + 16,5) = '00000' then stPTstate.Caption := 'OFF'
      else stPTstate.Caption := 'ON';
      lbl_PtMonitor.Caption := inttostr(strtoint(Copy(aPacketData,G_nIDLength + 16,5)));
    end else if aGubun = '00' then
    begin
      DeviceState1Show(Copy(aPacketData,G_nIDLength + 16,9));
    end else if aGubun = '20' then
    begin
      DeviceState2Show(Copy(aRealData,5,Length(aRealData) - 4));
    end;
  end else if aCode = 'fp' then //FTP 사용 가능 유무
  begin
    if aGubun = '90' then RcvFTPCheck(aPacketData);
  end;
end;

{출입 통제 데이터 처리루틴}
procedure TMainForm.AccessDataProcess(aPacketData:String;aReal:Boolean=True);
var
  DeviceID: String;
  st: string;
  msgCode: Char;
  aRealData: String;
  stVer : string;
begin

  // STX ~ 21's Byte :Header
  //040 K1123456700i1IFN00제론시스템      61

  //DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  DeviceID:= Copy(aPacketData,8,G_nIDLength + 2);
  stVer := copy(aPacketData,6,2);

  aRealData:= Copy(aPacketData,G_nIDLength + 12,Length(aPacketData)-(G_nIDLength + 13)); //출입통제 위한 실제 데이터
  msgCode:= aRealData[1];

  {ACK 응답:출입과 DOOR}
  if (msgCode <> 'a') and (msgCode <> 'b') and (msgCode <> 'c') and
     (msgCode <> 'l') and (msgCode <> 'm') and (msgCode <> 'n')
  then
  begin
    st:='Y' + Copy(aPacketData,G_nIDLength + 13,2)+'  '+'a';
    //st:='Y' + '01'+'  '+'a';
    ACC_sendData(DeviceID, st,stVer);
  end;

  {출입통제 데이터 처리}
//0460K1100000400c2a51  005000000010000000009E
  case msgcode of
    'F': RcvTelEventData(aRealData);
    'E','J': RcvAccEventData(aRealData,DeviceID);
    'X': RcvAccXEventData(aRealData,DeviceID);
    'D': RcvDoorEventData(aRealData);
    'a': RcvSysinfo2(aRealData);        //기기 등록 응답
    'b': RcvSysinfo2(aRealData);        //기기 조회 응답
    'c': RcvAccControl(aRealData);      //기기 제어 응답
'l','n','m','e','h','d': RcvCardRegAck(aRealData);  //카드등록응답
's','p': RcvSch(aRealData);             // 스케줄 응답
    'v': RcvFoodTime(aRealData);        //식사시간응답
  end;

  {
  제어내용             PC  <-> COntroller
  ====================================
  출입이벤트            #$90 <-> #$31
  DOOR 이벤트           #$90 <-> #32

  제어                  #$31 <-> #$41

  시스템정보 등록       #$50 <-> #$60
  시스템저보 조회       #$51 <-> #$61
  카드데이터 등록       #$52 <-> #$62
  카드데이터 조회       #$53 <-> #$63
  스케줄데이터 등록     #$56 <-> #$66
  스케줄데이터 조회     #$57 <-> #$67
  특정일데이터 등록     #$58 <-> #$68
  특정일데이터 조희     #$59 <-> #$69
  카드데이터(개별)등록  #$70 <-> #$80
  카드데이터(개별)조회  #$71 <-> #$81
  카드데이터(개별)삭제  #$72 <-> #$82
  ACK 전송              #$90
  }


end;

{펌웨에 :f 수신}
Procedure TMainForm.FirmwareProcess(aPacketData:String);
var
  aRegCode: String;
begin
  //FI:Flash Memory Map
  //FP:Flash Writer File Name
  //FD:Flash Data File Name
  //FX:Flash Start Command

  aRegCode:= Copy(aPacketData,G_nIDLength + 12,2);

  if aRegCode = 'FI' then
  begin
    IsDownLoad:= True;
    //if cb_Download.Checked = False then  ReceiveFI(aData)
    if rdMode.ItemIndex = 1 then ReceiveFI(aPacketData)
    else Write_ListBox_DownLoadInfo('펌웨어 업그레이드정보 응답');
  end else if aRegCode = 'FP' then
  begin
    //if cb_Download.Checked = False then ReceiveFPFD(aData)
    if rdMode.ItemIndex = 1 then ReceiveFPFD(aPacketData)
    else Write_ListBox_DownLoadInfo('flash write program 응답');
  end else if aRegCode = 'FD' then
  begin
    //if cb_Download.Checked = False then ReceiveFPFD(aData)
    if rdMode.ItemIndex = 1 then ReceiveFPFD(aPacketData)
    else Write_ListBox_DownLoadInfo('flash Data program 응답');
  end else if aRegCode = 'FX' then
  begin
    //if cb_Download.Checked = False then ReceiveFX(aData)
    if rdMode.ItemIndex = 1 then ReceiveFX(aPacketData)
    else Write_ListBox_DownLoadInfo('flash exec data 요청 응답');
  end else  if aRegCode = 'FU' then
  begin

  end else
  begin

  end;
end;

{펌웨에 :F 수신}
procedure TMainForm.FirmwareProcess2(aPacketData: String);
var
  aRegCode: String;
  Addrstr: String;
  Addr: Integer;
  stSeq : string;
  aDeviceID: String;
begin

  aDeviceID:= Copy(aPacketData,8,G_nIDLength + 2);
  aRegCode:= Copy(aPacketData,G_nIDLength + 12,2);



  if aRegCode = 'fu' then           {버젼정보 확인}
  begin
    //if (cb_Download.Checked = true) and (aFI.Version <> '' ) then
    if (rdMode.ItemIndex = 0) and (aFI.Version <> '' ) and (Not chk_Notupgrade.Checked) then
    begin
      ListBox_DownLoadInfo.Clear;
      Write_ListBox_DownLoadInfo('펌웨어 업그레이드정보 전송');
      Write_ListBox_DownLoadInfo('펌웨어 버젼:aFI.Version');
      IsDownLoad:= True;
      SendRomUpDateInfo;
    end;

  end else if aRegCode = 'fi' then  {Flash Memory Map 전송}
  begin

    if aFI.FMM <> '' then
    begin
      DownloadFMM(aDeviceID);
    end else
    begin
      ShowMessage('메모리맵 데이터가 없습니다.');
      SendCancelRomUpDate(aDeviceID);
      Exit;
    end;

  end else if aRegCode = 'fp' then  { flash write program}
  begin
    Addrstr:= Copy(aPacketData,G_nIDLength + 16,7);
    Addr:= Strtoint(Addrstr);
    if Length(aPacketData) < (G_nIDLength + 27) then stSeq := '0000'
    else stSeq := copy(aPacketData,G_nIDLength + 24,4);
    RzFieldStatus1.Caption := stSeq;
    if stSeq = '0000' then
    begin
      ProgressBar1.Position:= Addr;
      ProgressBar1.Max:= ROM_FlashWrite.Count;
      if rdMode.ItemIndex = 1 then SendFPData(aDeviceID,Addr,'S')
      else if rdMode.ItemIndex = 0 then SendFPData(aDeviceID,Addr,'M');
    end else
    begin
      ProgressBar1.Position:= Addr * strToint(stSeq);
      ProgressBar1.Max:= Length(ROM_BineryFlashWrite);
      if rdMode.ItemIndex = 1 then SendFPBineryData(aDeviceID,Addr,strtoint(stSeq),'S')
      else if rdMode.ItemIndex = 0 then SendFPBineryData(aDeviceID,Addr,strtoint(stSeq),'M');
    end;


  end else if aRegCode = 'fd' then  {flash data program}
  begin
    Addrstr:= Copy(aPacketData,G_nIDLength + 16,G_nIDLength);
    Addr:= Strtoint(Addrstr);
    if Length(aPacketData) < (G_nIDLength + 28) then stSeq := '0000'
    else stSeq := copy(aPacketData,(G_nIDLength + 24),4);
    if stSeq = '0000' then
    begin
      ProgressBar1.Position:= Addr;
      ProgressBar1.Max:= ROM_FlashData.Count;
      if rdMode.ItemIndex = 1 then SendFDData(aDeviceID,Addr,'S')
      else if rdMode.ItemIndex = 0 then   SendFDData(aDeviceID,Addr,'M');
    end else
    begin
      ProgressBar1.Position:= Addr * strToint(stSeq);
      ProgressBar1.Max:= Length(ROM_BineryFlashData);
      if rdMode.ItemIndex = 1 then SendFDBineryData(aDeviceID,Addr,strtoint(stSeq),'S')
      else if rdMode.ItemIndex = 0 then SendFDBineryData(aDeviceID,Addr,strtoint(stSeq),'M');

    end;


  end else if aRegCode = 'fx' then  {Upgrade flash exec command request}
  begin
    SendFSC(aDeviceID);
  end;

end;

{UpDate취소}
Procedure TMainForm.SendCancelRomUpDate(aDeviceID:String);
var
  CMD: string;
  st: string;
  i : integer;
begin
  CMD:= 'FU00';
  st:= CMD +'0000000'+','+ '0000000';
  SendPacket(aDeviceID,'F', st,Sent_Ver);
  // 2007년 10월 12일 추가
  Delay(300);
  CMD:= 'FC00';
  st:='1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
  for I:= 1 to Group_BroadDownLoad.Items.Count-1 do
  begin
    if Group_BroadDownLoad.ItemChecked[I] then st[I+1]:= '1';
  end;
  //aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if chk_BinDown.Checked then
  begin
    SendPacket(aDeviceID,'F', CMD + ed_DeviceCode.Text + ' ---- ' + st,Sent_Ver);
  end;
  Write_ListBox_DownLoadInfo(' firmware upgrade 취소 전송');
end;


{UpDate정보 전송}
Procedure TMainForm.SendRomUpDateInfo;
var
  FPAddr: Integer;
  FDAddr: Integer;
  CMD: string;
  st: string;
  aDeviceID: String;

begin

  FPAddr:= ROM_FlashWrite.Count;
  FDAddr:= ROM_FlashData.Count;

  CMD:= 'FU00';
  st:= CMD +FillZeroNumber(FPAddr,7)+','+ FillZeroNumber(FDAddr,7);

//  if rdMode.ItemIndex = 3 then st:= 'BD' + '01' + FillZeroNumber(1,7) + BroadControlerNum + st;
  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(aDeviceID,'F', st,Sent_Ver);
  Write_ListBox_DownLoadInfo(' firmware upgrade 정보 전송');
end;

{ flash write program 다운로드 실행}
procedure TMainForm.SendFPData(aDeviceID:String; aNo:Integer;aMode:string);
var
  aData:String;
  st: String;

begin
  if ROM_FlashWrite.Count < 1 then
  begin
    if MessageDlg('전송할 데이터가 없습니다.'+
                  '['+InttoStr(aNo)+']/'+ InttoStr(ROM_FlashWrite.Count)
                  +#13+'취소 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    SendCancelRomUpDate(aDeviceID);
    Exit;
  end;

  if aNo = 0 then
  begin
    ShowMessage('flash write 요청번지가 0 입니다.');
    Exit;
  end;

  if aNo <= ROM_FlashWrite.Count then
  begin
    aData:= ROM_FlashWrite[aNo-1];
    if aMode = 'M' then st:= 'fP00'+FillZeroNumber(aNo,7)+aData
    else if aMode = 'S' then st:= 'FP00'+aData;
    SendPacket(aDeviceID,'F',st,Sent_Ver);
    Write_ListBox_DownLoadInfo('flash write 전송:'+InttoStr(aNo));
  end else
  begin
    if MessageDlg('요청된 번지가 잘못되었거나 write 파일에 문제가 있습니다.'+
                  '['+InttoStr(aNo)+']/'+ InttoStr(ROM_FlashWrite.Count)
                  +#13+'취소 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    SendCancelRomUpDate(aDeviceID);
  end;
end;

{flash data program 다운로드 실행}
procedure TMainForm.SendFDData(aDeviceID:String;aNo:Integer;aMode:string);
var
  aData:String;
  st: String;
begin
  if ROM_FlashData.Count < 1 then
  begin
    if MessageDlg('전송할 데이터가 없습니다.'+
                  '['+InttoStr(aNo)+']/'+ InttoStr(ROM_FlashWrite.Count)
                  +#13+'취소 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    SendCancelRomUpDate(aDeviceID);
    Exit;
  end;

  if aNo = 0 then
  begin
    ShowMessage('flash data 요청번지가 0 입니다.');
    Exit;
  end;

  if aNo <= ROM_FlashData.Count then
  begin
    aData:= ROM_FlashData[aNo-1];
    if aMode = 'M' then st:= 'fD00'+FillZeroNumber(aNo,7)+aData
    else if aMode = 'S' then  st:= 'FD00'+aData;
    SendPacket(aDeviceID,'F',st,Sent_Ver);
    Write_ListBox_DownLoadInfo('flash data 전송:'+InttoStr(aNo));
  end else
  begin
    if MessageDlg('요청된 번지가 잘못되었거나 Data 파일에 문제가 있습니다.'+
                  '['+InttoStr(aNo)+']/'+ InttoStr(ROM_FlashData.Count)
                  +#13+'취소 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    SendCancelRomUpDate(aDeviceID);
  end;
end;

Procedure TMainForm.PollingAck(aDeviceID: String);
var
  ACKStr: String;
  ACKStr2: String;
  aDataLength: Integer;
  aLengthStr: String;
  aKey:Integer;
  st: string;
begin
  aDataLength:= G_nIDLength + 14;
  aLengthStr:= FillZeroNumber(aDataLength,3);

  ACkStr:= STX +aLengthStr+  #$20+Sent_Ver+ aDeviceID+ 'a'+Rcv_MsgNo;
  ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX,G_nProgramType)+ETX;
  aKey:= $20;
  ACkStr2:= Copy(ACKStr,1,5)+EncodeData(aKey,Copy(ACkStr,6,Length(ACkStr)-6))+ETX;


  //WinsockPort.FlushOutBuffer;
  WinsockPort.PutString(ACKStr2);



  st:=  'Server:' +#9+
        Copy(aDeviceID,1,G_nIDLength)+#9+
        Copy(aDeviceID,G_nIDLength + 1,2)+#9+
        //Copy(ACKStr2,17,2)+';'+
        ACKStr2[G_nIDLength + 10]+#9+
        Copy(ACKStr2,G_nIDLength + 12,Length(ACKStr2)-(G_nIDLength + 14))+#9+
        'TX'+#9+
        ACkStr2 +#9+
        '' ;

  if cbDisplayPolling.Checked = True then
  begin
    AddEventList(st);
  end;
end;

function TMainForm.SendPacket(aDeviceID: String;aCmd:Char; aData: String;aVer:string):Boolean;
var
  ErrCode: Integer;
  ACKStr: String;
  ACKStr2: String;
  aDataLength: Integer;
  aLengthStr: String;
  aKey:Integer;
  aMsgNo: Integer;
  amsgData : String;
  st: string;
  DecorderFormat : string;
begin

  Result := False;

  
  if DoCloseWinsock then Exit;

  if not WinsockPort.Open then
  begin
    Off_Timer.Enabled:= False;
    BroadTimer.Enabled:= False;
    BroadStopTimer.Enabled := False;
    bCardDownLoadStop := True;
    bConnected := False;
    ShowMessage('통신 연결이 안되었습니다.');
    Exit;
  end;
  bConnected := True;

  ErrCode:= 0;
  Result:= False;
  aDataLength:= (G_nIDLength + 14) + Length(aData);
  aLengthStr:= FillZeroNumber(aDataLength,3);

  if aCmd = 'a' then {응답 처리}
  begin
    ACkStr:= STX +aLengthStr+  #$20+ aVer + aDeviceID+ aCmd+Rcv_MsgNo;
    ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX,G_nProgramType)+ETX;
    aKey:= $20;
    ACkStr2:= Copy(ACKStr,1,5)+EncodeData(aKey,Copy(ACkStr,6,Length(ACkStr)-6))+ETX;
  end else           {제어 or 등록 }
  begin
    aMsgNo:= Send_MsgNo;
    ACkStr:= STX +aLengthStr+ #$20+ aVer + aDeviceID+ aCmd+InttoStr(aMsgNo) +aData;
    ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX,G_nProgramType)+ETX;
    aKey:= Ord(ACkStr[5]);
    ACkStr2:= Copy(ACKStr,1,5)+EncodeData(aKey,Copy(ACkStr,6,Length(ACkStr)-6))+ETX;
    if aMsgNo >= 9 then  Send_MsgNo:= 0
    else                 Send_MsgNo:= aMsgNo + 1;
  end;

  //WinsockPort.FlushOutBuffer;
{  if chk_Decoder.Checked then
  begin
    //DecorderFormat := copy(ACKStr2,2,Length(ACKStr2) - 2);
    DecorderFormat := ACKStr2;
    ACKStr2 := GetDecordeFormat(DecorderFormat);
  end;}
  WinsockPort.PutString(ACKStr2);

  if aCmd = '*' then // 브로드캐스팅 부분때문에 데이터 처리
  begin
    if Copy(ACKStr2,G_nIDLength + 12,2) = 'BD' then
    begin
       //amsgData := BroadToHex(Copy(ACKStr2,19,Length(ACKStr2)-21));
       amsgData := Copy(ACKStr2,G_nIDLength + 12,Length(ACKStr2)-(G_nIDLength + 14));
       if chk_BroadFile.Checked then
       begin
          BroadSaveFileList.Add(amsgData);
       end;
       //ACKStr2 := Copy(ACKStr2,1,18) + amsgData + Copy(ACKStr2,Length(ACKStr2)- 2,2)
    end else
    begin
      amsgData :=  Copy(ACKStr2,G_nIDLength + 12,Length(ACKStr2)-(G_nIDLength + 14));
    end;
  end else  amsgData :=  Copy(ACKStr2,G_nIDLength + 12,Length(ACKStr2)-(G_nIDLength + 14));


  st:=  'Server:'+INttoStr(Errcode) +#9+
        Copy(aDeviceID,1,G_nIDLength)+#9+
        Copy(aDeviceID,G_nIDLength + 1,2)+#9+
        //Copy(ACKStr2,17,2)+';'+
        ACKStr2[G_nIDLength + 10]+#9+
        amsgData+#9+
        //Copy(ACKStr2,19,Length(ACKStr2)-21)+#9+
        'TX'+#9+
        ACkStr2 + #9 +
        '';

  AddEventList(st);

  Result:= True;
end;




{출입통제 Send data}
procedure TMainForm.ACC_sendData(aDeviceID:CString; aData:CString;aVer:string);
begin
  if Not chk_AccessAck.Checked then Exit; 
  SendPacket(aDeviceID,'c', aData,aVer);
end;











(*
function TMainForm.SendPackettoClient(ClientThread: PNode;aDeviceID: String;
          aCmd:Char; aData: String):Boolean;
var
  ErrCode: Integer;
  ACKStr: cString;
  ACKStr2: cString;
  aDataLength: Integer;
  aLengthStr: cString;
  aKey:Integer;
  aMsgNo: Integer;
  I: Integer;
  st: string;
begin
  Result:= False;
  aDataLength:= 20 + Length(aData);
  aLengthStr:= InttoStr(aDataLength);

  if aCmd = 'a' then {응답 처리}
  begin
    ACkStr:= STX +aLengthStr+  #$20+'K1'+ aDeviceID+ aCmd+ClientThread.RcvMsgNo;
    ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX,G_nProgramType)+ETX;
    aKey:= $20;
    ACkStr2:= Copy(ACKStr,1,4)+EncodeData(aKey,Copy(ACkStr,5,Length(ACkStr)-5))+ETX;
  end else           {제어 or 등록 }
  begin
    aMsgNo:= ClientThread.SendMsgNo;
    ACkStr:= STX +aLengthStr+ #$20+'K1'+ aDeviceID+ aCmd+InttoStr(aMsgNo) +aData;
    ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX,G_nProgramType)+ETX;
    aKey:= Ord(ACkStr[4]);
    ACkStr2:= Copy(ACKStr,1,4)+EncodeData(aKey,Copy(ACkStr,5,Length(ACkStr)-5))+ETX;


    if aMsgNo >= 9 then  ClientThread.SendMsgNo:= 0
    else                 ClientThread.SendMsgNo:= aMsgNo + 1;
  end;

  try
    TDXClientThread(ClientThread.Thread).Socket.Write(ACKStr2);
    {$IFDEF DEBUG}
    CodeSite.SendMsg(ACKStr2);
    CodeSite.SendMsg(toHexStr(ACKStr2));
    {$ENDIF}
    st:=  'Server:'+INttoStr(Errcode) +';'+ ACkStr2;
    AddEventList(st);

  except
    //TDXClientThread(ClientThread.Thread).Terminate;
  end;

  Result:= True;
end;
*)



{시스템 정보 등록}
procedure TMainForm.RzGroup2Items1Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 1;
end;

{포트정보등록}
procedure TMainForm.RzGroup2Items2Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 2;
end;
{릴레이정보 등록}
procedure TMainForm.RzGroup2Items3Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 4;
end;
{원격제어}
procedure TMainForm.RzGroup2Items4Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 5;
  PageControl2.ActivePageIndex := 0;

end;
{전화관련등록}
procedure TMainForm.RzGroup2Items5Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 12;
end;

procedure TMainForm.RzGroup2Items6Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 13;
end;

procedure TMainForm.RzGroup2Items7Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 6;
end;


{랜모듈 설정}
procedure TMainForm.RzGroup2ItemsClick(Sender: TObject);
begin

end;

{출입통제 등록/제어}
procedure TMainForm.RzGroup3Items0Click(Sender: TObject);
begin
  //Notebook1.ActivePage:= RzGroup3.Items[0].Caption;
  Notebook1.PageIndex:= 7;
end;

procedure TMainForm.RzGroup3Items1Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 7;
end;

procedure TMainForm.RzGroup3Items2Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 9;
end;





procedure TMainForm.Notebook1PageChanged(Sender: TObject);
begin
//  if Notebook1.PageIndex = 14 then  RzLabel3.Caption:=  TNoteBook(Sender).ActivePage
//  else
  RzLabel3.Caption:= '세부 등록['+ TNoteBook(Sender).ActivePage+']';
  if TNoteBook(Sender).PageIndex = 6 then
  begin
    if FTPUSE then RzLabel3.Caption:= RzLabel3.Caption + '펌웨어 FTP 다운로드'
    else  RzLabel3.Caption:= RzLabel3.Caption + '펌웨어 기존 다운로드';
  end;

end;


Procedure TMainForm.RegID(aDeviceID: String);
begin
  SendPacket(FillZeroNumber(0,G_nIDLength + 2),'I','ID00'+aDeviceID,Sent_Ver);
end;

Procedure TMainForm.RegCR(aDeviceID: String; aReaderNo: Integer;aWCardBit:string);
var
  aData: String;
  ReaderNoStr: String[2];
  I: Integer;
  bResult : Boolean;
  stWCardBit : string;
begin
  if cb_CardType.ItemIndex = 0 then cb_CardType.ItemIndex := 1;
  bResult := RegCardReaderType(aDeviceID,cb_CardType.ItemIndex);

  if aWCardBit <> '26' then stWCardBit := '2'
  else stWCardBit := '0';

//
  aData:= InttoStr(ComBoBox_UseCardReader.ItemIndex)+   //리더 사용 유무
          InttoStr(ComBoBox_InOutCR.ItemIndex)+         //리더 위치
          InttoStr(ComBoBox_DoorNo.ItemIndex) +         //Door No
          Copy(ComboBox_Zone1.Text,1,2)+                //존번호
          Setlength(Edit_CRLocatge.Text,16) +           //위치명
          InttoStr(ComBoBox_Building.ItemIndex) +  //건물 설치 위치
          stWCardBit;       //Wigand Card Bit

  if Length(aDeviceID) <> (G_nIDLength + 2) then
  begin
    ShowMessage('ID를 확인하세요');
    Exit;
  end;

  if Group_CardReader.ItemIndex > 0 then
  begin
    ReaderNoStr:= '0'+InttoStr(Group_CardReader.ItemIndex);
    SendPacket(aDeviceID,'I','CD'+ReaderNoStr+aData,Sent_Ver);
  end else
  begin
    for I:= 1 to 8 do
    begin
      ReaderNoStr:= '0'+InttoStr(I);
      SendPacket(aDeviceID,'I','CD'+ReaderNoStr+aData,Sent_Ver);
      Sleep(100);
      Application.ProcessMessages;
    end;
  end;


end;

Procedure TMainForm.RegSysInfo(aDeviceID: String);
var
  aData: String;
  aTime: Integer;
  bTime: Integer;
  aLinkusComType: String[1];
begin

  aTime:= SpinEdit_OutDelay.IntValue;
  bTime:= SpinEdit_inDelay.IntValue;
  if ComboBox_ComLikus.Text <> '' then aLinkusComType:= ComboBox_ComLikus.Text[1]
  else aLinkusComType:= '2';


  aData:= InttoStr(ComboBox_WatchPowerOff.ItemIndex) + // 정전감시여부
          FillZeroNumber(aTime,3)+                     // 퇴실지연시간
          InttoStr(ComboBox_DeviceType.ItemIndex)+     //예비
          InttoStr(ComboBox_DoorType1.ItemIndex)+      //문1 모드
          InttoStr(ComboBox_DoorType2.ItemIndex)+      //문2 모드
          Setlength(Edit_Locate.Text,16)+              //위치명
          FillZeroNumber(bTime,3)+                     //입실지연시간
          aLinkusComType;                              //관제통신 방식




  if  Length(aDeviceID) = (G_nIDLength + 2) then
  begin
    SendPacket(aDeviceID,'I','SY00'+aData,Sent_Ver);
  end else
  begin
    SHowMessage('ID를 확인하세요');
  end;

end;

Procedure TMainForm.RegRelay(aDeviceID: String; aRelayNo: Integer);
var
  aData: String;
  aTime: String;
  RelayNoStr: String;
  I: Integer;
begin

  aData:= InttoStr(ComBoBox_Linktype1.ItemIndex)+   //연동방식
          InttoStr(ComboBox_OutType1.ItemIndex)+    //출력방식
          InttoStr(ComboBox_RenewTimer1.ItemIndex)+ //타이머
          InttoStr(ComboBox_UseType1.ItemIndex);    //릴레이 용도

  if CheckBox1.Checked then RzSpinEdit2.IntValue:= 65535;

  aTime:= FillZeroNumber(RzSpinEdit2.IntValue,5);//동작시간

  aData:= aData + aTime;

  if aRelayNo > 0 then
  begin
    RelayNoStr:= '0'+InttoStr(aRelayNo);
    SendPacket(aDeviceID,'I','RY'+RelayNoStr +aData,Sent_Ver);
  end else
  begin
    for I:= 1 to 4 do
    begin
      RelayNoStr:= '0'+InttoStr(I);
      SendPacket(aDeviceID,'I','RY'+RelayNoStr +aData,Sent_Ver);
      Sleep(100);
      application.ProcessMessages;
    end;
  end;
end;


Procedure TMainForm.RegPort(aDeviceID: String; aPortNo: Integer);
var
  aData: String;
  aFlg: String[8];
  PortStr: String[2];
  I: Integer;
  stStatuscode : string;
begin

  if  (ComboBox_WatchType.ItemIndex <> 0)
    and (ComboBox_WatchType.ItemIndex <> 6)
  then ComboBox_Delay.ItemIndex := 0;

  stStatuscode := Edit_PTStatus.text;//'S' + inttostr(aPortNo)[1];

  if ComboBox_WatchType.ItemIndex = 1 then stStatuscode := 'FI'  //화재
  else if ComboBox_WatchType.ItemIndex = 2 then stStatuscode := 'G1' //가스
  else if ComboBox_WatchType.ItemIndex = 3 then stStatuscode := 'E1' //비상
  else if ComboBox_WatchType.ItemIndex = 4 then stStatuscode := 'Q1' //설비
  else if ComboBox_WatchType.ItemIndex = 5 then stStatuscode := 'CL'; //호출

  aData:= stStatuscode +                      //상태코드
          InttoStr(ComboBox_WatchType.ItemIndex) + //감시형태
          InttoStr(ComboBox_AlarmType.ItemIndex) + //알람발생 방식
          InttoStr(ComboBox_recover.ItemIndex) +   //복구신호전송
          InttoStr(ComboBox_Delay.ItemIndex);      //지연시간 사용유무


  {램프}
  aFlg:= '00';
  if Port_Out1.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Out1.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {싸이렌}
  aFlg:= '00';
  if Port_Out2.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Out2.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {릴레이1}
  aFlg:= '00';
  if Port_Out3.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Out3.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {릴레이2}
  aFlg:= '00';
  if Port_Out4.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Out4.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {출입문 연동1}
  aFlg:= '00';
  if Port_Door1.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Door1.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {출입문 연동2}
  aFlg:= '00';
  if Port_Door2.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Door2.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {메인램프}
  aFlg:= '00';
  if M_Port_Out1.ItemChecked[0] then aFlg[1]:= '1';
  if M_Port_Out1.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {메인싸이렌}
  aFlg:= '00';
  if M_Port_Out2.ItemChecked[0] then aFlg[1]:= '1';
  if M_Port_Out2.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {메인릴레이1}
  aFlg:= '00';
  if M_Port_Out3.ItemChecked[0] then aFlg[1]:= '1';
  if M_Port_Out3.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {메인릴레이2}
  aFlg:= '00';
  if M_Port_Out4.ItemChecked[0] then aFlg[1]:= '1';
  if M_Port_Out4.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;

  {존 번호}
  if Length(Edit_PTZoneNo.Text) < 2 then Edit_PTZoneNo.Text:= '0'+Edit_PTZoneNo.Text;
  aData:= aData + Edit_PTZoneNo.Text;
  {위치정보}
  aData:= aData + Setlength(Edit_PTLocate.Text,16);

  {감지시간}

  if (ComboBox_DetectTime.Text = '') or (Isdigit(ComboBox_DetectTime.Text) = False) then
    ComboBox_DetectTime.Text:= '0400';
  aData:= aData + ComboBox_DetectTime.Text;

  if aPortNo > 0 then
  begin
    PortStr:= FillZeroNumber(aPortNo,2);
    SendPacket(aDeviceID,'I','LP'+PortStr+aData,Sent_Ver);
  end else
  begin
    for I := 1 to 8 do
    begin
      PortStr:= FillZeroNumber(I,2);
      SendPacket(aDeviceID,'I','LP'+PortStr+aData,Sent_Ver);
      Sleep(100);
      Application.ProcessMessages;
    end;

  end;
end;

Procedure TMainForm.RegUsedDevice(aDeviceID: String; UsedDevice:String);
begin
  SendPacket(aDeviceID,'I','EX00'+UsedDevice,Sent_Ver);
end;

Procedure TMainForm.CheckUsedDevice(aDeviceID,aCmd: String);
begin
  SendPacket(aDeviceID,'Q','EX0' + aCmd,Sent_Ver);
end;

Procedure TMainForm.RegUsedAlarmDisplay(aDeviceID: String; UsedDevice:String);
begin
  //SHowMessage(UsedDevice);
  SendPacket(aDeviceID,'I','AD00'+'0'+UsedDevice,Sent_Ver);
end;

Procedure TMainForm.CheckUsedAlarmDisplay(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','AD00',Sent_Ver);
end;



Procedure TMainForm.CheckID(aDeviceID: String);
begin
  Label_CurentIp.Color:= clWhite;
  Edit_DeviceID.Color:= clWhite;
  Edit_DeviceID.Text:= '';
  SendPacket(FillZeroNumber(0,G_nIDLength + 2),'Q','ID000000000',Sent_Ver);

end;

Procedure TMainForm.CheckCR(aDeviceID: String; aReaderNo: Integer);
var
  ReaderNoStr:String;
begin

  cb_CardType.ItemIndex := 0;
  SendPacket(aDeviceID, 'Q', 'Ct00',Sent_Ver);  //카드리더종류 조회

  ComBoBox_UseCardReader.Text:= '';
  ComBoBox_InOutCR.Text:= '';
  ComBoBox_Building.Text:= '';
  ComBoBox_DoorNo.Text:= '';
  ComboBox_Zone1.ItemIndex:= 0;
  Edit_CRLocatge.Text:= '';

  if aReaderNo > 0 then
  begin
    ReaderNoStr:= '0'+IntToStr(aReaderNo);
    SendPacket(aDeviceID,'Q','CD'+ReaderNoStr,Sent_Ver);
  end else
  begin
    ShowMessage('전체 조회는 불가 합니다.');
  end;


end;

Procedure TMainForm.CheckSysInfo(aDeviceID: String);
begin
  ComboBox_WatchPowerOff.Text:= '';
  ComboBox_ComLikus.Text:= '';
  SpinEdit_OutDelay.IntValue:= 0;
  SpinEdit_InDelay.IntValue:= 0;
  ComboBox_DeviceType.Text:= '';
  ComboBox_DoorType1.Text:= '';
  ComboBox_DoorType2.Text:='';
  Edit_Locate.Text:= '';
  SendPacket(aDeviceID,'Q','SY00',Sent_Ver);
end;

Procedure TMainForm.CheckRelay(aDeviceID: String; aRelayNo: Integer);
var
  RelayNoStr: String;
begin
  COmBoBox_Linktype1.Text:= '';
  ComboBox_OutType1.Text:= '';
  ComboBox_RenewTimer1.Text:= '';
  ComboBox_UseType1.Text:= '';
  RzSpinEdit2.IntValue:= 0;
  CheckBox1.Checked:= False;
  if aRelayNo > 0 then
  begin
    RelayNoStr:= '0'+InttoStr(aRelayNo);
    SendPacket(aDeviceID,'Q','RY'+RelayNoStr,Sent_Ver);
  end else
  begin
    ShowMessage('전체 조회가 불가능합니다.');
  end;


end;

Procedure TMainForm.CheckPort(aDeviceID: String; aPortNo: Integer);
var
  PortStr: String;
Procedure ClearCheckGroup(aCheckBox:TRzCheckGroup);
var
  I:Integer;
begin
  for I:= 0 to aCHeckBox.Items.Count-1 do
  begin
    aCheckBox.ItemChecked[I]:= False;
  end;
end;

begin
  Edit_PTStatus.Text:= '';
  ComboBox_WatchType.Text:= '';
  ComboBox_AlarmType.Text:= '';
  ComboBox_recover.Text:= '';
  ComboBox_Delay.Text:= '';
  Edit_PTZoneNo.Text:= '';
  Edit_PTLocate.Text:= '';
  ClearCheckGroup(Port_Out1);
  ClearCheckGroup(Port_Out2);
  ClearCheckGroup(Port_Out3);
  ClearCheckGroup(Port_Out4);
  ClearCheckGroup(Port_Door1);
  ClearCheckGroup(Port_Door2);
  ClearCheckGroup(M_Port_Out1);
  ClearCheckGroup(M_Port_Out2);
  ClearCheckGroup(M_Port_Out3);
  ClearCheckGroup(M_Port_Out4);

  ComboBox_DetectTime.Text:= '';

  if aPortNo > 0 then
  begin
    PortStr:= FillZeroNumber(aPortNo,2);
    SendPacket(aDeviceID,'Q','LP'+ PortStr,Sent_Ver);
  end else
  begin
    ShowMessage('전체 조회는 불가능 합니다.');
  end;
end;

{전화번호 등록}
procedure TMainForm.RegTellNo(aDeviceID: String; aNo: Integer;
  aTellno: String);
var
  NoStr: String[2];
  st: string;
  ReaderNo:String;
begin
  NoStr:= InttoStr(aNo);
  if Length(NoStr) < 2 then NoStr:= '0'+NoStr;
  st:= Setlength(aTellNo,20);
  ReaderNo:= cb_Reader.Text;
  SendPacket(aDeviceID,'I','TN'+ReaderNo+NoStr+st,Sent_Ver);
end;

{등록 전화번호 확인}
procedure TMainForm.CheckTellNo(aDeviceID: String; aNo: Integer);
var
  NoStr: String[2];
  ReaderNo:String;
begin
  NoStr:= InttoStr(aNo);
  if Length(NoStr) < 2 then NoStr:= '0'+NoStr;
  ReaderNo:= cb_Reader.Text;
  SendPacket(aDeviceID,'Q','TN'+ReaderNo+NoStr,Sent_Ver);
end;

{통화시간 등록}
procedure TMainForm.RegCallTime(aDeviceID: String; aTime: Integer);
var
  Timestr: string;
begin
  TimeStr:= FillZeroNumber(aTime,4);
  SendPacket(aDeviceID,'I','CT01'+TimeStr,Sent_Ver);
end;
{통화시간 조회}
procedure TMainForm.CheckCallTime(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','CT01',Sent_Ver);
end;

{방송시간 조회}
procedure TMainForm.CheckbroadcastTime(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','BT01',Sent_Ver);
end;
{방송시간 등록}
procedure TMainForm.RegbroadcastTime(aDeviceID: String; aTime: Integer);
var
  Timestr: string;
begin
  TimeStr:= FillZeroNumber(aTime,4);
  SendPacket(aDeviceID,'I','BT01'+TimeStr,Sent_Ver);
end;


{다이얼링 정보 등록}
procedure TMainForm.RegDialTime(aDeviceID:String;OnTime: Integer;OffTime:Integer);
var
  aTime: Integer;
  bTIme: Integer;
  Timestr: string;
begin
  aTime:= onTime div 20;
  bTime:= OffTime div 20;

  Timestr:= FillZeroNumber(aTime,2) +   // On Time
            FillZeroNumber(bTime,2);    // Off Time
  SendPacket(aDeviceID,'I','DI01'+TimeStr,Sent_Ver);

end;

{다이얼링 정보 조회}
procedure TMainForm.CheckDialTime(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','DI01',Sent_Ver);
end;

procedure TMainForm.RcvDeviceID(aPacketData: String);
var
  st: string;
begin
  ComboBox_IDNO.Color:= clYellow;
  //40 K1123456700i1IF00제론시스템      61
  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:=  Copy(aPacketData,G_nIDLength + 15,G_nIDLength);
  Edit_CurrentID.Text:= st;

  //ComboBox_IDNO.ItemIndex:= 0;
  //ComboBox_IDNO.Text:= ComboBox_IDNO.Items[ComboBox_IDNO.ItemIndex];
  Cnt_CheckVer(st+'00');
  delay(200);
  checkFTP(st+'00');
  delay(200);
  Cnt_CheckDeviceCode(st+'00');
  //ComboBox_IDNO.ItemIndex:=rgDeviceNo.ItemIndex;
end;

procedure TMainForm.RcvCR(aPacketData: String);
var
  st: String;
  nCardNo : integer;
  cmb_box:TCombobox;
begin

  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st := Copy(aPacketData,G_nIDLength + 13,2);
  nCardNo := StrtoInt(st);
  Group_CardReader.ItemIndex:= nCardNo;
  //Info1:= IntToBin(Ord(aData[22]),8);
  //if Info1[8] = '1' then
  {카드리더 사용유무}
  st:= copy(aPacketData,G_nIDLength + 15,5);
  if not isdigit(st) then Exit;

  ComBoBox_UseCardReader.ItemIndex:= StrtoInt(st[1]);
  ComBoBox_UseCardReader.Text:= ComBoBox_UseCardReader.Items[StrtoInt(st[1])];
  cmb_Box := TravelComboBoxItem(GroupBox33,'ComBoBox_UseCardReader',nCardNo);
  cmb_Box.ItemIndex:= StrtoInt(st[1]);
  cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
  cmb_Box.Color := clYellow;
  //rd_UseCardReader.ItemIndex:= StrtoInt(st[1]);
  {카드리더 위치}
  ComBoBox_InOutCR.ItemIndex:= StrtoInt(st[2]);
  //rd_InOutCR.ItemIndex:= StrtoInt(st[2]);
  ComBoBox_InOutCR.Text:= ComBoBox_InOutCR.Items[ComboBox_InOutCR.ItemIndex];
  cmb_Box := TravelComboBoxItem(GroupBox33,'ComBoBox_InOutCR',nCardNo);
  cmb_Box.ItemIndex:= StrtoInt(st[2]);
  cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
  cmb_Box.Color := clYellow;
  {카드리더 건물위치}
  if (aPacketData[G_nIDLength + 36] = '0') or (aPacketData[G_nIDLength + 36] = '1') then
  begin
    ComBoBox_Building.ItemIndex:= StrtoInt(aPacketData[G_nIDLength + 36]);
    cmb_Box := TravelComboBoxItem(GroupBox33,'ComBoBox_Building',nCardNo);
    cmb_Box.ItemIndex:= StrtoInt(aPacketData[G_nIDLength + 36]);
    cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
    cmb_Box.Color := clYellow;
  end;
  {연동 문번호}
  ComBoBox_DoorNo.ItemIndex:= StrtoInt(st[3]);
  //rd_DoorNo.ItemIndex:= StrtoInt(st[3]);
  ComBoBox_DoorNo.Text:= ComBoBox_DoorNo.Items[ComBoBox_DoorNo.ItemIndex];
  cmb_Box := TravelComboBoxItem(GroupBox33,'ComBoBox_DoorNo',nCardNo);
  cmb_Box.ItemIndex:= StrtoInt(st[3]);
  cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
  cmb_Box.Color := clYellow;
  {존번호}
  ComboBox_Zone1.ItemIndex := StrtoInt(Copy(st,4,2));
  {위치명}
  Edit_CRLocatge.Text:= Copy(aPacketData,G_nIDLength + 20,16);
  TravelEditItem(GroupBox33,'Edit_CRLocatge',nCardNo).Text := Copy(aPacketData,G_nIDLength + 20,16);

  {Wiegand Card Bit}
  if Length(aPacketData) > (G_nIDLength + 39) then
  begin
    if aPacketData[G_nIDLength + 37] = '0' then cmb_WCardBit.Text := '26'
    else if aPacketData[G_nIDLength + 37] = '2' then cmb_WCardBit.Text := '34'
    else cmb_WCardBit.Text := '';
  end
  else cmb_WCardBit.Text := '';
  ComBoBox_UseCardReader.Color:= ClYellow;
  ComBoBox_InOutCR.Color:= ClYellow;
  ComBoBox_Building.Color:= ClYellow;
  ComBoBox_DoorNo.Color:= ClYellow;
  ComboBox_Zone1.Color:= ClYellow;
  Edit_CRLocatge.Color:= ClYellow;


end;

Procedure TMainForm.RcvSysinfo(aPacketData: String);
var
  st:String;
begin

//         1         2         3         4         5
//12345678901234567890123456789012345678901234567890123
//052 K1000000000i5SY001000221                000157
//                      ---------------------------
  ComboBox_WatchPowerOff.Color:= clYellow;
  ComboBox_ComLikus.Color:= clYellow;
  ComboBox_DeviceType.Color:= clYellow;
  ComboBox_DoorType1.Color:= clYellow;
  ComboBox_DoorType2.Color:= clYellow;
  Edit_Locate.Color:= clYellow;

  //Delete(aData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= Copy(aPacketData,G_nIDLength + 16,7);
  if not isDigit(st) then Exit;

  {정전 감시여부}
  ComboBox_WatchPowerOff.ItemIndex:= StrtoInt(st[1]);
  ComboBox_WatchPowerOff.Text:= ComboBox_WatchPowerOff.Items[ComboBox_WatchPowerOff.ItemIndex];
  {퇴실지연시간}
  SpinEdit_OutDelay.IntValue:= StrtoInt(Copy(st,2,3));
  {예비}
  ComboBox_DeviceType.ItemIndex:= StrtoInt(st[5]);
  ComboBox_DeviceType.Text:= ComboBox_DeviceType.Items[ComboBox_DeviceType.ItemIndex];
  {Door1 용도}
  ComboBox_DoorType1.ItemIndex:= StrtoInt(st[6]);
  ComboBox_DoorType1.Text:= ComboBox_DoorType1.Items[ComboBox_DoorType1.ItemIndex];
  {Door2 용도}
  ComboBox_DoorType2.ItemIndex:= StrtoInt(st[7]);
  ComboBox_DoorType2.Text:= ComboBox_DoorType2.Items[ComboBox_DoorType2.ItemIndex];
  {시스템 위치명}
  Edit_Locate.Text:=Copy(aPacketData,G_nIDLength + 23,16);
  {입실지연시간}
  SpinEdit_InDelay.IntValue:= StrtoInt(Copy(aPacketData,G_nIDLength + 39,3));
  {관제통신방식}
  ComboBox_ComLikus.ItemIndex:= StrtoInt(aPacketData[G_nIDLength + 42]) - 1;
  ComboBox_ComLikus.Text:= ComboBox_ComLikus.Items[ComboBox_ComLikus.ItemIndex];




end;

Procedure TMainForm.RcvRelay(aPacketData: String);
var
  TimeStr: String[5];
  st: string;
begin
  ComBoBox_Linktype1.Color:= clYellow;
  ComboBox_OutType1.Color:= clYellow;
  ComboBox_RenewTimer1.Color:= clYellow;
  ComboBox_UseType1.Color:= clYellow;

  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= Copy(aPacketData,G_nIDLength + 13,2);

  if Not IsDigit(st) then
  begin
    RcvLampState(st,copy(aPacketData,G_nIDLength + 15,Length(aPacketData) - (G_nIDLength + 14)));
    Exit;
  end;

  Group_Relay.ItemIndex:= StrtoInt(st);

  st:= Copy(aPacketData,(G_nIDLength + 15),9);

  {릴레이 연동 방식}
  if IsDigit(st[1]) then
    ComBoBox_Linktype1.ItemIndex:= StrtoInt(st[1]);
  ComBoBox_Linktype1.Text:= ComBoBox_Linktype1.Items[ComBoBox_Linktype1.ItemIndex];
  {릴레이 출력 방식}
  if IsDigit(st[2]) then
    ComboBox_OutType1.ItemIndex:= StrtoInt(st[2]);
  ComboBox_OutType1.Text:= ComboBox_OutType1.Items[ComboBox_OutType1.ItemIndex];
  {TImer Renew}
  if IsDigit(st[3]) then
    ComboBox_RenewTimer1.ItemIndex:= StrtoInt(st[3]);
  ComboBox_RenewTimer1.Text:= ComboBox_RenewTimer1.Items[ComboBox_RenewTimer1.ItemIndex];
  {릴레이 사용방식}
  if IsDigit(st[4]) then
    ComboBox_UseType1.ItemIndex:= StrtoInt(st[4]);
  ComboBox_UseType1.Text:= ComboBox_UseType1.Items[ComboBox_UseType1.ItemIndex];

  {동작시간}
  TimeStr:= Copy(st,5,5);
  if TimeStr = '65535' then
  begin
    CheckBox1.Checked:= True;
    RzSpinEdit2.IntValue:= 65535;
  end else
  begin
    CheckBox1.Checked:= False;
    RzSpinEdit2.IntValue:= StrtoInt(TimeStr);
  end;
end;

Procedure TMainForm.RcvPort(aPacketData: String);
var
  st: String;
  aIndex: Integer;
  nPortNo : integer;
  cmb_box:TCombobox;
begin

  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= Copy(aPacketData,G_nIDLength + 13,2);
  aIndex:= StrtoInt(st);

  Group_Port.ItemIndex:= aIndex;
  nPortNo := aIndex;

  Edit_PTStatus.Text:= Copy(aPacketData,G_nIDLength + 15,2);
  TravelEditItem(GroupBox45,'Edit_PTStatus',nPortNo).Text := Copy(aPacketData,G_nIDLength + 15,2);

  st:= Copy(aPacketData,G_nIDLength + 17,26);

  {감시형태}
  ComboBox_WatchType.ItemIndex:= StrtoInt(st[1]);
  ComboBox_WatchType.Text:= ComboBox_WatchType.Items[ComboBox_WatchType.ItemIndex];
  cmb_Box := TravelComboBoxItem(GroupBox45,'ComboBox_WatchType',nPortNo);
  cmb_Box.ItemIndex:= StrtoInt(st[1]);
  cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
  cmb_Box.Color := clYellow;
  {알람 발생 방식}
  ComboBox_AlarmType.ItemIndex:= StrtoInt(st[2]);
  ComboBox_AlarmType.Text:= ComboBox_AlarmType.Items[ComboBox_AlarmType.ItemIndex];
  cmb_Box := TravelComboBoxItem(GroupBox45,'ComboBox_AlarmType',nPortNo);
  cmb_Box.ItemIndex:= StrtoInt(st[2]);
  cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
  cmb_Box.Color := clYellow;
  {복구신호 전송 유무}
  ComboBox_recover.ItemIndex:= StrtoInt(st[3]);
  //ComboBox_recover.Text:= '';
  ComboBox_recover.Text:= ComboBox_recover.Items[ComboBox_recover.ItemIndex];
  cmb_Box := TravelComboBoxItem(GroupBox45,'ComboBox_recover',nPortNo);
  cmb_Box.ItemIndex:= StrtoInt(st[3]);
  cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
  cmb_Box.Color := clYellow;
  {지연시간}
  ComboBox_Delay.ItemIndex:= StrtoInt(st[4]);
  ComboBox_Delay.Text:= ComboBox_Delay.Items[ComboBox_Delay.ItemIndex];
  cmb_Box := TravelComboBoxItem(GroupBox45,'ComboBox_Delay',nPortNo);
  cmb_Box.ItemIndex:= StrtoInt(st[4]);
  cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
  cmb_Box.Color := clYellow;

  {램프}
  if st[5] = '1' then Port_Out1.ItemChecked[0]:= True;
  if st[6] = '1' then Port_Out1.ItemChecked[1]:= True;
  {싸이렌}
  if st[7] = '1' then Port_Out2.ItemChecked[0]:= True;
  if st[8] = '1' then Port_Out2.ItemChecked[1]:= True;
  {릴레이1}
  if st[9] = '1' then Port_Out3.ItemChecked[0]:= True;
  if st[10] = '1' then Port_Out3.ItemChecked[1]:= True;
  {릴레이2}
  if st[11] = '1' then Port_Out4.ItemChecked[0]:= True;
  if st[12] = '1' then Port_Out4.ItemChecked[1]:= True;
  {출입문 제어1}
  if st[13] = '1' then Port_Door1.ItemChecked[0]:= True;
  if st[14] = '1' then Port_Door1.ItemChecked[1]:= True;
 {출입문 제어2}
  if st[15] = '1' then Port_Door2.ItemChecked[0]:= True;
  if st[16] = '1' then Port_Door2.ItemChecked[1]:= True;
  {메인 램프}
  if st[17] = '1' then M_Port_Out1.ItemChecked[0]:= True;
  if st[18] = '1' then M_Port_Out1.ItemChecked[1]:= True;
  {메인 싸이렌 }
  if st[19] = '1' then M_Port_Out2.ItemChecked[0]:= True;
  if st[20] = '1' then M_Port_Out2.ItemChecked[1]:= True;
  {메인 릴레이1}
  if st[21] = '1' then M_Port_Out3.ItemChecked[0]:= True;
  if st[22] = '1' then M_Port_Out3.ItemChecked[1]:= True;
  {메인 릴레이2}
  if st[23] = '1' then M_Port_Out4.ItemChecked[0]:= True;
  if st[24] = '1' then M_Port_Out4.ItemChecked[1]:= True;
  {존번호}
  Edit_PTZoneNo.Text:= st[25] + st[26];
  TravelEditItem(GroupBox45,'Edit_PTZoneNo',nPortNo).Text := st[25] + st[26];
  {위치명}
  Edit_PTLocate.Text:= Copy(aPacketData,G_nIDLength + 43,16);
  TravelEditItem(GroupBox45,'Edit_PTLocate',nPortNo).Text := Copy(aPacketData,G_nIDLength + 43,16);
  {감지기 감지시간}
  ComboBox_DetectTime.Text:= Copy(aPacketData,G_nIDLength + 59,4);
  cmb_Box := TravelComboBoxItem(GroupBox45,'ComboBox_DetectTime',nPortNo);
  cmb_Box.Text:= Copy(aPacketData,G_nIDLength + 59,4);
  cmb_Box.Color := clYellow;

  Edit_PTStatus.Color:= clYellow;
  ComboBox_WatchType.Color:= clYellow;
  ComboBox_AlarmType.Color:= clYellow;
  ComboBox_recover.Color:= clYellow;
  ComboBox_Delay.Color:= clYellow;

  if ComboBox_WatchType.ItemIndex <> 0 then
  begin
    if ComboBox_Delay.ItemIndex <> 0 then showmessage('24시간 존에서는 지연시간을 적용할 수 없습니다.');
  end;
end;

Procedure TMainForm.RcvUsedDevice(aPacketData,aRegGubun:String);
var
  st: string;
  I: Integer;
begin
  ECUList.Clear;
  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= Copy(aPacketData,G_nIDLength + 15,100);

  for I:= 1 to 100 do
  begin
    if aRegGubun = '00' then
    begin
      if st[I] = '1' then
      begin
       Group_Device.ItemChecked[I-1]:= True;
       ECUList.Add(FillZeroNumber(I-1,2))
      end
      else                Group_Device.ItemChecked[I-1]:= False;
      //브로드 캐스팅 부분으로 추가 됨
      if st[I] = '1' then Group_BroadDevice.ItemChecked[I-1]:= True
      else                Group_BroadDevice.ItemChecked[I-1]:= False;
    end else
    begin
      //브로드 펌웨어 다운로드 부분으로 추가 됨
      if st[I] = '1' then Group_BroadDownLoad.ItemChecked[I-1]:= True
      else                Group_BroadDownLoad.ItemChecked[I-1]:= False;
    end;

  end;
end;

Procedure TMainForm.RcvUsedAlarmdisplay(aPacketData:String);
var
  st: string;
  I: Integer;
begin
  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= Copy(aPacketData,G_nIDLength + 15,5);
  //SHowMessage(st);
  for I:= 2 to 5 do
  begin
    if st[I] = '1' then Group_Alarmdisplay.ItemChecked[I-2]:= True
    else                Group_Alarmdisplay.ItemChecked[I-2]:= False;
  end;
end;

procedure TMainForm.RcvTellNo(aPacketData: String);
var
  st: string;
  MNo: Integer;
begin
  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= copy(aPacketData,G_nIDLength + 15,Length(aPacketData)-(G_nIDLength + 17));
  MNo:= StrtoInt(Copy(st,1,2));
  Delete(st,1,2);
  case MNo of
    0: edTelNo0.Text:= st;
    1: edTelNo1.Text:= st;
    2: edTelNo2.Text:= st;
    3: edTelNo3.Text:= st;
    4: edTelNo4.Text:= st;
    5: edTelNo5.Text:= st;
    6: edTelNo6.Text:= st;
    7: edTelNo7.Text:= st;
    8: edTelNo8.Text:= st;
    9: edTelNo9.Text:= st;
  end;
end;


procedure TMainForm.RcvCallTime(aPacketData: String);
var
  st: string;
  aTime: Integer;
begin
  RzSpinner2.Color:= ClYellow;
  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= copy(aPacketData,G_nIDLength + 15,4);
  aTime:= StrtoInt(st);
  RzSpinner2.Value:= aTime;
end;

procedure TMainForm.RcvbroadcastTime(aPacketData: String);
var
  st: string;
  aTime: Integer;
begin
  RzSpinner4.Color:= ClYellow;
  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= copy(aPacketData,G_nIDLength + 15,4);
  aTime:= StrtoInt(st);
  RzSpinner4.Value:= aTime;
end;


procedure TMainForm.RcvDialInfo(aPacketData: String);
var
  st: string;
  aTime: Integer;
  bTime: Integer;
begin
  ComboBox1.Color:= ClYellow;
  ComboBox2.Color:= ClYellow;
  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= copy(aPacketData,G_nIDLength + 15,4);
  aTime:= StrtoInt(Copy(st,1,2));
  bTime:= StrtoInt(Copy(st,3,2));

  ComboBox1.Text:= InttoStr(aTime * 20);
  ComboBox2.Text:= InttoStr(bTime * 20);
end;

Procedure TMainForm.RcvWiznetInfo(aPacketData:String);
var
  I: Integer;
  st,st2: String;
  DataStr:String;
  ErrorLog: String;
  FHeader:        String[2];
  FMacAddress:    String[12];
  FMode:          String[2];
  FIPAddress:     String[8];
  FSubnet:        String[8];
  FGateway:       String[8];
  FClientPort:    String[4];
  FServerIP:      String[8];
  FServerPort:    String[4];
  FSerial_Baud:   String[2];
  FSerial_data:   String[2];
  FSerial_Parity: String[2];
  FSerial_stop:   String[2];
  FSerial_flow:   String[2];
  FDelimiterChar: String[2];
  FDelimiterSize: String[4];
  FDelimitertime: String[4];
  FDelimiterIdle: String[4];
  FDebugMode:     String[2];
  FROMVer:        String[4];
  FOnDHCP:        String[2];
  FReserve:       String[4];
  FConnected: char;
begin

  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  DataStr:= copy(aPacketData,G_nIDLength + 15,94);

  FHeader:=            Copy(DataStr, 1,2);
  FMacAddress:=        Copy(DataStr, 3,12);
  FMode:=              Copy(DataStr,15,2);
  FIPAddress:=         Copy(DataStr,17,8);
  FSubnet:=            Copy(DataStr,25,8);
  FGateway:=           Copy(DataStr,33,8);
  FClientPort:=        Copy(DataStr,41,4);
  FServerIP:=          Copy(DataStr,45,8);
  FServerPort:=        Copy(DataStr,53,4);
  FSerial_Baud:=       Copy(DataStr,57,2);
  FSerial_data:=       Copy(DataStr,59,2);
  FSerial_Parity:=     Copy(DataStr,61,2);
  FSerial_stop:=       Copy(DataStr,63,2);
  FSerial_flow:=       Copy(DataStr,65,2);
  FDelimiterChar:=     Copy(DataStr,67,2);
  FDelimiterSize:=     Copy(DataStr,69,4);
  FDelimitertime:=     Copy(DataStr,73,4);
  FDelimiterIdle:=     Copy(DataStr,77,4);
  FDebugMode:=         Copy(DataStr,81,2);
  FROMVer:=            Copy(DataStr,83,4);
  FOnDHCP:=            Copy(DataStr,87,2);
  FReserve:=           Copy(DataStr,89,6);

  //헤더가 aa이면 설정응답
  if FHeader = 'aa' then
  begin
    WizNetRcvACK:= True;
    Exit;
  end;

  LMDCaptionPanel1.visible := False;
  LMDSimpleLabel1.Twinkle:= False;
  Off_Timer.Enabled:= False;

  //2.MAC Address
  //RzEdit2.Text:=  FMacAddress;

  editMAC1.Color:= clYellow;
  editMAC2.Color:= clYellow;
  editMAC3.Color:= clYellow;
  editMAC4.Color:= clYellow;
  editMAC5.Color:= clYellow;
  editMAC6.Color:= clYellow;

  editMAC1.Text:= Copy(FMacAddress,1,2);
  editMAC2.Text:= Copy(FMacAddress,3,2);
  editMAC3.Text:= Copy(FMacAddress,5,2);
  editMAC4.Text:= Copy(FMacAddress,7,2);
  editMAC5.Text:= Copy(FMacAddress,9,2);
  editMAC6.Text:= Copy(FMacAddress,11,2);

  RzEdit2.Text:= editMAC1.Text +' '+
                 editMAC2.Text +' '+
                 editMAC3.Text +' '+
                 editMAC4.Text +' '+
                 editMAC5.Text +' '+
                 editMAC6.Text;


  //3.Mode (Server mode: 01, Client mode: 00)
  //if FMode = '00' then Checkbox_Client.Checked:= True
  //else               Checkbox_Client.Checked:= False;

  if FMode = '00' then RadioModeClient.Checked:= True
  else if FMode = '02' then RadioModeServer.Checked:= True
  else                      RadioModeMixed.Checked:= True;

  // 4.IP address
  st2:= '';
  st:= Hex2Ascii(FIPAddress);
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_LocalIP.Text:= st2;

  // 5.Subnet mask
  st2:= '';
  st:= Hex2Ascii(FSubnet);
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_Sunnet.Text:= st2;

  // 6.Gateway address
  st2:= '';
  st:= Hex2Ascii(FGateway);
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_Gateway.Text:= st2;

  //7.Port number (Client)
  st2:= Hex2DecStr(FClientPort);
  Edit_LocalPort.Text:= st2;

  //8. Server IP address
  st2:= '';
  st:= Hex2Ascii(FServerIP);
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_ServerIp.Text:= st2;

  //9.  Port number (Server)
  st2:= '';
  st2:= Hex2DecStr(FServerPort);
  Edit_Serverport.Text:= st2;

  //10. Serial speed (bps)
  if FSerial_Baud = 'A0' then ComboBox_Boad.ItemIndex:=0
  else if FSerial_Baud = 'D0' then ComboBox_Boad.ItemIndex:=1
  else if FSerial_Baud = 'E8' then ComboBox_Boad.ItemIndex:=2
  else if FSerial_Baud = 'F4' then ComboBox_Boad.ItemIndex:=3
  else if FSerial_Baud = 'FA' then ComboBox_Boad.ItemIndex:=4
  else if FSerial_Baud = 'FD' then ComboBox_Boad.ItemIndex:=5
  else if FSerial_Baud = 'FE' then ComboBox_Boad.ItemIndex:=6
  else if FSerial_Baud = 'FF' then ComboBox_Boad.ItemIndex:=7
  else ComboBox_Boad.ItemIndex:=-1;

  //11. Serial data size (08: 8 bit), (07: 7 bit)
  if FSerial_data = '07' then      ComboBox_Databit.ItemIndex:= 0
  else if FSerial_data = '08' then ComboBox_Databit.ItemIndex:= 1
  else                             ComboBox_Databit.ItemIndex:= -1;

  //12. Parity (00: No), (01: Odd), (02: Even)
  if FSerial_Parity = '00' then      ComboBox_Parity.ItemIndex:= 0
  else if FSerial_Parity = '01' then ComboBox_Parity.ItemIndex:= 1
  else if FSerial_Parity = '02' then ComboBox_Parity.ItemIndex:= 2
  else                               ComboBox_Parity.ItemIndex:= -1;

  //13. Stop bit
  if FSerial_stop = '01' then ComboBox_Stopbit.ItemIndex:= 0
  else                        ComboBox_Stopbit.ItemIndex:= -1;

  //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)
  if FSerial_flow = '00' then ComboBox_Flow.ItemIndex:= 0
  else if FSerial_flow = '01' then ComboBox_Flow.ItemIndex:= 1
  else if FSerial_flow = '02' then ComboBox_Flow.ItemIndex:= 2
  else                             ComboBox_Flow.ItemIndex:= -1;


  //15. Delimiter char

  Edit_Char.Text:= FDelimiterChar;

  //16.Delimiter size
  st2:= '';
  st2:= Hex2DecStr(FDelimiterSize);
  Edit_Size.Text:= st2;


  //17. Delimiter time
  st2:= '';
  st2:= Hex2DecStr(FDelimitertime);
  Edit_Time.Text:= st2;

  //18.Delimiter idle time
  st2:= '';
  st2:= Hex2DecStr(FDelimiterIdle);
  Edit_Idle.Text:= st2;

  //19. Debug code (00: ON), (01: OFF)
  if FDebugMode = '00' then Checkbox_Debugmode.Checked:= True
  else                      Checkbox_Debugmode.Checked:= False;

  //20.Software major version
   st:= Hex2Ascii(FROMVer);
   RzEdit1.Text:= InttoStr(Ord(st[1]))+'.'+InttoStr(Ord(st[2]));

  // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)
  if FOnDHCP = '01' then  Checkbox_DHCP.Checked:= True
  else if FOnDHCP = '00' then  Checkbox_DHCP.Checked:= False;


  ErrorLog:= '';

  if FMode <> Copy(wiznetData,15,2)then
     ErrorLog:= ErrorLog +'Mode:' +Copy(wiznetData,15,2) +'<>'+FMode+#13;
  if FIPAddress <> Copy(wiznetData,17,8) then
     ErrorLog:= ErrorLog +'IPAddress:' +Copy(wiznetData,17,8) +'<>'+FIPAddress+#13;
  if FSubnet <> Copy(wiznetData,25,8) then
     ErrorLog:= ErrorLog +'SubNet:' +Copy(wiznetData,25,8) +'<>'+FSubnet+#13;
  if FGateway <> Copy(wiznetData,33,8) then
     ErrorLog:= ErrorLog +'Gateway:' +Copy(wiznetData,33,8) +'<>'+FGateway+#13;
  if FClientPort <> Copy(wiznetData,41,4) then
     ErrorLog:= ErrorLog +'ClientPort:' +Copy(wiznetData,41,8) +'<>'+FClientPort+#13;
  if FServerIP <> Copy(wiznetData,45,8)then
     ErrorLog:= ErrorLog +'ServerIP:' +Copy(wiznetData,45,8) +'<>'+FServerIP+#13;
  if FServerPort <> Copy(wiznetData,53,4)then
     ErrorLog:= ErrorLog +'ServerPort:' +Copy(wiznetData,53,8) +'<>'+FServerPort+#13;
  if FSerial_Baud <> Copy(wiznetData,57,2)then
     ErrorLog:= ErrorLog +'Serial_Baud:' +Copy(wiznetData,57,2) +'<>'+FSerial_Baud+#13;
  if FSerial_data <> Copy(wiznetData,59,2)then
     ErrorLog:= ErrorLog +'Serial_data:' +Copy(wiznetData,59,2) +'<>'+FSerial_data+#13;
  if FSerial_Parity <> Copy(wiznetData,61,2)then
     ErrorLog:= ErrorLog +'Serial_Parity:' +Copy(wiznetData,61,2) +'<>'+FSerial_Parity+#13;
  if FSerial_stop <> Copy(wiznetData,63,2)then
     Errorlog:= Errorlog +'Serial_stop:' +Copy(wiznetData,63,2) +'<>'+FSerial_stop+#13;
  if FSerial_flow <> Copy(wiznetData,65,2)then
     Errorlog:= Errorlog +'Serial_flow:' +Copy(wiznetData,65,2) +'<>'+FSerial_flow+#13;
  if FDelimiterChar <> Copy(wiznetData,67,2)then
     Errorlog:= Errorlog +'DelimiterChar:' +Copy(wiznetData,67,2) +'<>'+FDelimiterChar+#13;
  if FDelimiterSize <> Copy(wiznetData,69,4)then
     Errorlog:= Errorlog +'DelimiterSize:' +Copy(wiznetData,69,2) +'<>'+FDelimiterSize+#13;
  if FDelimitertime <> Copy(wiznetData,73,4)then
     Errorlog:= Errorlog +'Delimitertime:' +Copy(wiznetData,73,4) +'<>'+FDelimitertime+#13;
  if FDelimiterIdle <> Copy(wiznetData,77,4)then
     Errorlog:= Errorlog +'DelimiterIdle:' +Copy(wiznetData,77,4) +'<>'+FDelimiterIdle+#13;
  if FDebugMode <> Copy(wiznetData,81,2) then
     Errorlog:= Errorlog +'DebugMode:' +Copy(wiznetData,81,4) +'<>'+FDebugMode+#13;
  {
  if FROMVer <> Copy(wiznetData,83,4)then
     Errorlog:= Errorlog +'ROMVer:' +Copy(wiznetData,83,4) +'<>'+FROMVer+#13;
  }
  if FOnDHCP <> Copy(wiznetData,87,2)then
     Errorlog:= Errorlog +'OnDHCP:' +Copy(wiznetData,87,4) +'<>'+FOnDHCP;
  if FReserve <> Copy(wiznetData,89,6) then
  if (Errorlog <> '') and (WizNetRegMode = True) then
  begin
     Errorlog:= '설정값과 응답값이 틀립니다.' +#13+
                 '==========================='+#13+
                 '  설정값 < ===== > 응답값  '+#13+
                 '==========================='+#13+
                  Errorlog;
     SHowMessage(Errorlog);
  end else
  begin
    //SHowMessage('설정/조회 완료 되었습니다..');
  end;


  (*
  if (wiznetData <> DataStr) and (WizNetRegMode = True) then
  begin
    ShowMessage('설정값과 응답값이 틀립니다.'+#13+'설정데이터:'+wiznetdata+#13+'응답데이터:'+DataStr);
  end else
  begin
    SHowMessage('설정/조회 완료 되었습니다..');
  end;
    *)
end;



Procedure TMainForm.Cnt_TimeSync(aDeviceID: String; aTimeStr:String);
begin
  SendPacket(aDeviceID,'R','TM00'+aTimeStr,Sent_Ver);
end;

Procedure TMainForm.Cnt_CheckVer(aDeviceID: String);
begin
  SendPacket(aDeviceID,'R','VR00',Sent_Ver);
end;

{리더버젼확인}
procedure TMainForm.Cnt_CheckCdVer(aDeviceID:String; aReaderNo: Integer);
var
  aNo: String;
begin
  aNo:= '0'+InttoStr(aReaderNo);
  SendPacket(aDeviceID,'R','CV'+aNo,Sent_Ver);
end;


Procedure TMainForm.Cnt_Reset(aDeviceID:String);
begin
  SendPacket(aDeviceID,'R','RS00Reset',Sent_Ver);
end;

Procedure TMainForm.Cnt_ClearRegister(aDeviceID:String);
begin
  SendPacket(aDeviceID,'I','ac00Register Clear',Sent_Ver);
end;


Procedure TMainForm.Cnt_ChangeMode(aDeviceID:String; aZoneNo:Integer; aMode:Char);
var
  aZone: String[2];
begin
  aZone:= FillZeroNumber(aZoneNo,2);
  SendPacket(aDeviceID,'R','MC'+aZone+aMode,Sent_Ver);
end;

Procedure TMainForm.Cnt_Random(aDeviceID:String; onOn:Boolean; aTime:Integer);
var
  TimeStr: String[3];
begin
  if onOn then
  begin
    SendPacket(aDeviceID,'R','rn00random on',Sent_Ver)
  end else
  begin
    TimeStr:= FillZeroNumber(aTime,3);
    SendPacket(aDeviceID,'R','rn00random off '+TimeStr,Sent_Ver);
  end;
end;

Procedure TMainForm.Cnt_USerCMD(aDeviceID:String; aData: String);
begin
  SendPacket(aDeviceID,'c',aData,Sent_Ver);
end;

/// 출입통제 제어/등록 ////////////////////////////////////////////////////////

procedure TMainForm.RegSch(aDeviceID: String);
var
  aData: String;
  DeviceID: String;
begin
  aData:= 'S' +                                        //MSG Code
          '0'+
          IntToStr(rgSchDoorNo.ItemIndex+1)+          //문번호
          #$20 +
          IntToStr(rgSchCode.ItemIndex) +             // 요일코드 0.평일 1.반휴일 2.일요일 3.특정일
          copy(edSch1.Text,1,4)+edSch1.Text[6]+       //구간1
          copy(edSch2.Text,1,4)+edSch2.Text[6]+      //구간2
          copy(edSch3.Text,1,4)+edSch3.Text[6]+      //구간3
          copy(edSch4.Text,1,4)+edSch4.Text[6]+      //구간4
          copy(edSch5.Text,1,4)+edSch5.Text[6];      //구간5

   DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
   ACC_sendData(DeviceID, aData,Sent_Ver);

end;

Procedure TMainForm.CheckSch(aDeviceID:String);
var
  aData: String;
  DeviceID: String;
begin
  aData:= 'P' +                                    //MSG Code
          //IntToStr(Send_MsgNo)+                 //Msg Count
          '0'+
          IntToStr(rgSchDoorNo.ItemIndex+1)+      //문번호
          #$20 +
          IntToStr(rgSchCode.ItemIndex) +         // 요일코드 0.평일 1.반휴일 2.일요일 3.특정일
          '00000000000000000000000';              //조회는 전체를 '0'으로 마킹
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  ACC_sendData(DeviceID, aData,Sent_Ver);

end;

procedure TMainForm.RegSysInfo2(aDeviceID,aDoorNo: String);
var
  aData: String;
  DeviceID: String;
  stDoorControlTime : string;
  nDoorTime : integer;
  nOrd : integer;
  nOrdUDiff : integer;
  stMSEC : string;
  nMSec : integer;
  stRemoteCancelDoorOpen : string;
begin
  if IsDigit(cmb_DoorControlTime.text) then
  begin
    if strtoint(cmb_DoorControlTime.text) < 10 then
    begin
       stDoorControlTime := Trim(cmb_DoorControlTime.text);
    end else
    begin
      nOrdUDiff := 26;
      nDoorTime := strtoint(cmb_DoorControlTime.text) - 10;
      nDoorTime := nDoorTime div 5;
      if nDoorTime < nOrdUDiff then  nOrd := Ord('A') + nDoorTime
      else nOrd := Ord('a') + nDoorTime - nOrdUDiff;
      if nOrd > Ord('z') then nOrd := Ord('z');
      stDoorControlTime := Char(nOrd);
    end;
  end else
  begin
    stMSEC := copy(cmb_DoorControlTime.text,1,3);
    if Not isDigit(stMSEC) then
    begin
      showmessage('밀리초 단위는 선택에 의해서만 가능합니다.');
      Exit;
    end;
    nMSec := strtoint(stMsec) div 100;
    if nMSec < 1 then
    begin
      showmessage('밀리초 단위는 선택에 의해서만 가능합니다.');
      Exit;
    end;
    if nMSec > 9 then
    begin
      showmessage('밀리초 단위는 선택에 의해서만 가능합니다.');
      Exit;
    end;
    nOrd := $20 + nMSec; //21~29 까지 MSEC;
    stDoorControlTime := Char(nOrd);
  end;
  if cmb_DsOpenState.ItemIndex < 0 then cmb_DsOpenState.ItemIndex := 0;
  if chk_RemoteCancelDoorOpen.Checked then  stRemoteCancelDoorOpen := '1'
  else stRemoteCancelDoorOpen := '0';

  aData:= 'A' +                                        //MSG Code
          //IntToStr(Send_MsgNo)+                         //Msg Count
          '0'+
          aDoorNo +  //문번호
          //IntToStr(gbDoorNo.ItemIndex+1)+       //문번호

          #$20 + #$20 +                                 // Record count
          InttoStr(ComboBox_CardModeType.ItemIndex) +   //카드운영모드
          InttoStr(ComboBox_DoorModeType.ItemIndex) +   //출입문 운영모드
          stDoorControlTime                         +   //Door제어 시간
//          InttoStr(RzSpinEdit4.IntValue)            +   //Door제어 시간
          InttoStr(RzSpinEdit5.IntValue)            +   //장시간 열림 경보
          InttoStr(ComboBox_UseSch.ItemIndex)       +   //스케줄 적용유무
          InttoStr(ComboBox_SendDoorStatus.ItemIndex)+  //출입단독 사용유무
          InttoStr(ComboBox_UseCommOff.ItemIndex)   +   //통신이상시 기기운영
          //#$FF+                                         //분실카드 추적 기능(기능삭제)
          InttoStr(ComboBox_AntiPass.ItemIndex      )+   //AntiPassBack
          InttoStr(ComboBox_AlarmLongOpen.ItemIndex)+   //장시간 열림 부저출력
          InttoStr(ComboBox_AlramCommoff.ItemIndex) +   //통신 이상시 부저 출력
          //InttoStr(ComboBox_LockType.ItemIndex)     +   //전기정 타입
          char(ord('0') + ComboBox_LockType.ItemIndex) +
          InttoStr(ComboBox_ControlFire.ItemIndex)  +   //화재 발생시 문제어
          InttoStr(ComboBox_CheckDSLS.ItemIndex)    +   //DS LS 검사
          InttoStr(cmb_DsOpenState.ItemIndex)       +   //출입문열림상태 (DS OPEN 0x30,DS CLOSE 0x31)
          stRemoteCancelDoorOpen                    +   //원격해제시 (DoorOpen 0x30,DoorClose 0x31)
          '00000';
          //#$ff+#$ff+#$ff+#$ff+#$ff+#$ff+#$ff+#$ff;      //예비
   DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
   ACC_sendData(DeviceID, aData,Sent_Ver);
   (*
   Sleep(100);
   aData:=  #90 +
            IntToStr(Send_MsgNo)+                         //Msg Count
            IntToStr(ComboBox_DoorNo2.ItemIndex+1)+
            '  '+#$80;
   ACC_sendData(DeviceID, aData);
   *)

end;

procedure TMainForm.EmptySysinfo2;
begin
  //ComboBox_DoorNo2.ItemIndex:= 0;
  ComboBox_CardModeType.ItemIndex:= 0;
  ComboBox_DoorModeType.ItemIndex:= 0;
  RzSpinEdit4.Text:= '3';
  RzSpinEdit5.Text:= '0';
  ComboBox_UseSch.ItemIndex:= 0;
  ComboBox_SendDoorStatus.ItemIndex:= 0;
  ComboBox_UseCommOff.ItemIndex:= 0;
  ComboBox_AlramCommoff.ItemIndex:= 0;
  ComboBox_AntiPass.ItemIndex:= 0;
  ComboBox_AlarmLongOpen.ItemIndex:= 0;
  ComboBox_LockType.ItemIndex:= 1;
  ComboBox_ControlFire.ItemIndex:= 0;
  ComboBox_CheckDSLS.ItemIndex:= 0;
  cmb_DsOpenState.ItemIndex := 0;
  chk_RemoteCancelDoorOpen.Checked := True;
end;

procedure TMainForm.CheckSysInfo2(aDeviceID: String);
var
  aData: String;
  DeviceID: String;
begin
  aData:= 'B' +                                     //MSG Code
          //IntToStr(Send_MsgNo)+                      //Msg Count
          '0'+
          IntToStr(gbDoorNo.ItemIndex+1)+    //문번호
          #$20 + #$20 +
          '00000000000000000000';                    //조회는 전체를 '0'으로 마킹
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  ACC_sendData(DeviceID, aData,Sent_Ver);
  EmptySysinfo2;
end;

Procedure TMainForm.RcvSysinfo2(aRealData: String);
var
  aNo: Integer;
  nDoorControlTime : integer;
  nDoorNo : integer;
  cmb_Box : TComboBox;
  nOrd : integer;
  nMsec : integer;
begin
//         1         2
//123456789012345678901234567
//a11  0040000000100000000095
  {기기 문번호}



  if aRealData[3] >= #$30 then
  begin
    aNo:= StrtoInt(aRealData[3]);
    gbDoorNo.ItemIndex:= aNo -1;
    nDoorNo := StrtoInt(aRealData[3]);
    //ComboBox_DoorNo2.Text:= ComboBox_DoorNo2.Items[ComboBox_DoorNo2.ItemIndex];
  end;
  if nDoorNo > 8 then
  begin
    showmessage('문번호는 8보다 클수 없습니다.');
    Exit;
  end;
  {카드운영모드}
  if aRealData[6] >= #$30 then
  begin
    aNo:= StrtoInt(aRealData[6]);
    ComboBox_CardModeType.ItemIndex:= aNo;
    ComboBox_CardModeType.Text:= ComboBox_CardModeType.Items[ComboBox_CardModeType.ItemIndex];
    if nDoorNo < 3 then
    begin
      cmb_Box := TravelComboBoxItem(GroupBox43,'ComboBox_CardModeType',nDoorNo);
      cmb_Box.ItemIndex:= aNo;
      cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
      cmb_Box.Color := clYellow;
    end;
  end;
  {출입문 운영모드}
  if aRealData[7] >= #$30 then
  begin
    aNo:= StrtoInt(aRealData[7]);
    ComboBox_DoorModeType.ItemIndex:= aNo;
    ComboBox_DoorModeType.Text:= ComboBox_DoorModeType.Items[ComboBox_DoorModeType.ItemIndex];
    if nDoorNo < 3 then
    begin
      cmb_Box := TravelComboBoxItem(GroupBox43,'ComboBox_DoorModeType',nDoorNo);
      cmb_Box.ItemIndex:= aNo;
      cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
      cmb_Box.Color := clYellow;
    end;
  end;
  {DOOR제어시간}
  if aRealData[8] >= #$30 then
  begin
   if aRealData[8] < #$40 then  cmb_DoorControlTime.Text := aRealData[8]
   else
   begin
      if (aRealData[8] >= 'A') and (aRealData[8] <= 'Z') then  nDoorControlTime := Ord(aRealData[8]) - Ord('A')
      else nDoorControlTime := Ord(aRealData[8]) - Ord('a') + 26;
      nDoorControlTime := nDoorControlTime * 5;
      cmb_DoorControlTime.Text := inttostr( 10 + nDoorControlTime );
      //TravelEditItem(GroupBox43,'ed_DoorControlTime',nDoorNo).Text := inttostr( 10 + nDoorControlTime );
   end;
   TravelComboBoxItem(GroupBox43,'cmb_DoorControlTime',nDoorNo).Text := cmb_DoorControlTime.Text;
   //RzSpinEdit4.Text:= aData[8];
  end else
  begin
    nOrd := Ord(aRealData[8]);
    nMsec := (nOrd - $20) * 100;
    cmb_DoorControlTime.Text := inttostr(nMsec) + 'ms';
    TravelComboBoxItem(GroupBox43,'cmb_DoorControlTime',nDoorNo).Text := cmb_DoorControlTime.Text;
  end;
  {장시간 열림 경보}
  if aRealData[9] >= #$30 then
  begin
   RzSpinEdit5.Text:= aRealData[9];
   if nDoorNo = 1 then RzSpinEdit7.Text:= aRealData[9];
   if nDoorNo = 2 then RzSpinEdit8.Text:= aRealData[9];
  end;
  {스케줄 적용 여부}
  if aRealData[10] >= #$30 then
  begin
    aNo:= StrtoInt(aRealData[10]);
    ComboBox_UseSch.ItemIndex:= aNo;
    ComboBox_UseSch.Text:= ComboBox_UseSch.Items[ComboBox_UseSch.ItemIndex];
    if nDoorNo < 3 then
    begin
      cmb_Box := TravelComboBoxItem(GroupBox43,'ComboBox_UseSch',nDoorNo);
      cmb_Box.ItemIndex:= aNo;
      cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
      cmb_Box.Color := clYellow;
    end;
  end;
  {출입문 상태 전송}
  if aRealData[11] >= #$30 then
  begin
     aNo:= StrtoInt(aRealData[11]);
     ComboBox_SendDoorStatus.ItemIndex:= aNo;
     ComboBox_SendDoorStatus.Text:= ComboBox_SendDoorStatus.Items[ComboBox_SendDoorStatus.ItemIndex];
    if nDoorNo < 3 then
    begin
      cmb_Box := TravelComboBoxItem(GroupBox43,'ComboBox_SendDoorStatus',nDoorNo);
      cmb_Box.ItemIndex:= aNo;
      cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
      cmb_Box.Color := clYellow;
    end;
  end;
  {통신 이상시 기기운영 }
  if aRealData[12] >= #$30 then
  begin
    aNo:= StrtoInt(aRealData[12]);
    ComboBox_UseCommOff.ItemIndex:= aNo;
    ComboBox_UseCommOff.Text:= ComboBox_UseCommOff.Items[ComboBox_UseCommOff.ItemIndex];
    if nDoorNo < 3 then
    begin
      cmb_Box := TravelComboBoxItem(GroupBox43,'ComboBox_UseCommOff',nDoorNo);
      cmb_Box.ItemIndex:= aNo;
      cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
      cmb_Box.Color := clYellow;
    end;
  end;
  {Antipassback}
  if aRealData[13] >= #$30 then
  begin
   aNo:= StrtoInt(aRealData[13]);
   ComboBox_AntiPass.ItemIndex:= aNo;
   ComboBox_AntiPass.Text:= ComboBox_AntiPass.Items[ComboBox_AntiPass.ItemIndex];
    if nDoorNo < 3 then
    begin
      cmb_Box := TravelComboBoxItem(GroupBox43,'ComboBox_AntiPass',nDoorNo);
      cmb_Box.ItemIndex:= aNo;
      cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
      cmb_Box.Color := clYellow;
    end;
  end;

  {장시간 열림 부저 출력}
  if aRealData[14] >= #$30 then
  begin
   aNo:= StrtoInt(aRealData[14]);
   ComboBox_AlarmLongOpen.ItemIndex:= aNo;
   ComboBox_AlarmLongOpen.Text:= ComboBox_AlarmLongOpen.Items[ComboBox_AlarmLongOpen.ItemIndex];
    if nDoorNo < 3 then
    begin
      cmb_Box := TravelComboBoxItem(GroupBox43,'ComboBox_AlarmLongOpen',nDoorNo);
      cmb_Box.ItemIndex:= aNo;
      cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
      cmb_Box.Color := clYellow;
    end;
  end;

  {통신 이상시 부저 출력}
  if aRealData[15] >= #$30 then
  begin
   aNo:= StrtoInt(aRealData[15]);
   ComboBox_AlramCommoff.ItemIndex:= aNo;
   ComboBox_AlramCommoff.Text:= ComboBox_AlramCommoff.Items[ComboBox_AlramCommoff.ItemIndex];
    if nDoorNo < 3 then
    begin
      cmb_Box := TravelComboBoxItem(GroupBox43,'ComboBox_AlramCommoff',nDoorNo);
      cmb_Box.ItemIndex:= aNo;
      cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
      cmb_Box.Color := clYellow;
    end;
  end;
  {전기정 타입}
  if aRealData[16] >= #$30 then
  begin
   //aNo:= StrtoInt(aData[16]);
   aNo := ord(aRealData[16]) - ord('0');
   ComboBox_LockType.ItemIndex:= aNo;
   ComboBox_LockType.Text:= ComboBox_LockType.Items[ComboBox_LockType.ItemIndex];
    if nDoorNo < 3 then
    begin
      cmb_Box := TravelComboBoxItem(GroupBox43,'ComboBox_LockType',nDoorNo);
      cmb_Box.ItemIndex:= aNo;
      cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
      cmb_Box.Color := clYellow;
    end;
  end;
  {화재 발생시 문제어}
  if aRealData[17] >= #$30 then
  begin
   aNo:= StrtoInt(aRealData[17]);
   ComboBox_ControlFire.ItemIndex:= aNo;
   ComboBox_ControlFire.Text:= ComboBox_ControlFire.Items[ComboBox_ControlFire.ItemIndex];
    if nDoorNo < 3 then
    begin
      cmb_Box := TravelComboBoxItem(GroupBox43,'ComboBox_ControlFire',nDoorNo);
      cmb_Box.ItemIndex:= aNo;
      cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
      cmb_Box.Color := clYellow;
    end;
  end;

  {DS LS 검사}
  if aRealData[18] >= #$30 then
  begin
   aNo:= StrtoInt(aRealData[18]);
   ComboBox_CheckDSLS.ItemIndex:= aNo;
   ComboBox_CheckDSLS.Text:= ComboBox_CheckDSLS.Items[ComboBox_CheckDSLS.ItemIndex];
    if nDoorNo < 3 then
    begin
      cmb_Box := TravelComboBoxItem(GroupBox43,'ComboBox_CheckDSLS',nDoorNo);
      cmb_Box.ItemIndex:= aNo;
      cmb_Box.Text:= cmb_Box.Items[cmb_Box.ItemIndex];
      cmb_Box.Color := clYellow;
    end;
  end;
  //출입문열림상태
  if IsDigit(aRealData[19]) then
  begin
    cmb_DsOpenState.ItemIndex := strtoint(aRealData[19]);
    cmb_DsOpenState.Color := clYellow;
  end;
  //원격해제시 Door Open
  if IsDigit(aRealData[20]) then
  begin
    if aRealData[20] = '1' then chk_RemoteCancelDoorOpen.Checked := True
    else chk_RemoteCancelDoorOpen.Checked := False;
  end;

  //ComboBox_DoorNo2.Color:= clYellow;
  ComboBox_CardModeType.Color:= clYellow;
  ComboBox_DoorModeType.Color:= clYellow;
  ComboBox_UseSch.Color:= clYellow;
  ComboBox_SendDoorStatus.Color:= clYellow;
  ComboBox_UseCommOff.Color:= clYellow;
  ComboBox_AntiPass.Color:= clYellow;
  ComboBox_AlarmLongOpen.Color:= clYellow;
  ComboBox_AlramCommoff.Color:= clYellow;
  ComboBox_LockType.Color:= clYellow;
  ComboBox_ControlFire.Color:= clYellow;
  ComboBox_CheckDSLS.Color:= clYellow;

  //SHowMessage(aData);
end;


Procedure TMainForm.RcvSch(aRealData: String);
var
  aCode: Integer;
begin
  aCode:= StrtoInt(aRealData[5]);
  rgSchCode.ItemIndex:= aCode;
  edSch1.Text:= Copy(aRealData,6,4)+ ' '+Copy(aRealData,10,1);
  edSch2.Text:= Copy(aRealData,11,4)+ ' '+Copy(aRealData,15,1);
  edSch3.Text:= Copy(aRealData,16,4)+ ' '+Copy(aRealData,20,1);
  edSch4.Text:= Copy(aRealData,21,4)+ ' '+Copy(aRealData,25,1);
  edSch5.Text:= Copy(aRealData,26,4)+ ' '+Copy(aRealData,30,1);
  if Not bDoorSchRegShow then Exit; //스케줄조회 화면이 떠 있지 않으면 무시하자...
  DoorscheduleRegForm.LoadSchadule(aRealData);
end;

//식사시간등록
procedure TMainForm.RegFoodTime(aDeviceID: String);
var
  aData: String;
  DeviceID: String;
begin
  aData:= 'V' +                                        //MSG Code
          '0'+
          IntToStr(rgSchDoorNo.ItemIndex+1)+          //문번호
          #$20 +
          IntToStr(rgSchCode.ItemIndex) +             // 요일코드 0.평일 1.반휴일 2.일요일 3.특정일
          edFood1.Text +'1'+                          //조식
          edFood2.Text +'2'+                          //중식
          edFood3.Text +'3'+                          //석식
          edFood4.Text+'4';                           //야식

   DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
   ACC_sendData(DeviceID, aData,Sent_Ver);

end;

//식사시간응답
procedure TMainForm.RcvFoodTime(aRealData: String);
var
  aCode: Integer;
begin
  aCode:= StrtoInt(aRealData[5]);
  rgSchCode.ItemIndex:= aCode;
  edFood1.Text:= Copy(aRealData,6,4);
  edFood2.Text:= Copy(aRealData,11,4);
  edFood3.Text:= Copy(aRealData,16,4);
  edFood4.Text:= Copy(aRealData,21,4);
end;



procedure TMainForm.RcvAccControl(aRealData: String);
var
  st:String;
begin
//a11  0040000000100000000095

  st:='';
  if aRealData[6] = '0' then st:= 'POSITIVE'
  else                   st:= 'NEGATIVE';
  st := st + #13;

  if aRealData[7] = '0' then st:= st + '운영모드'
  else if aRealData[7] = '1' then st:= st + '개방모드'
  else if aRealData[7] = '2' then st:= st + '폐쇄모드'
  else                   st:= st + aRealData[7] + '';
  st := st + #13;

  if aRealData[8] = 'O' then st:= st + '열림상태'
  else                   st:= st + '닫힘상태';
  st := st + #13+ #13+ #13;

  lbDoorControl.Caption:= st+aRealData;
 (*
  case aData[5] of
    '0':begin
          //SHowMessage(aData);
          st:='';
          if aData[6] = '0' then st:= 'POSITIVE:'
          else                   st:= 'NEGATIVE:';

          if aData[7] = '0' then st:= st + '운영모드:'
          else                   st:= st + '개방모드:';

          if aData[8] = 'O' then st:= st + '열림상태:'
          else                   st:= st + '닫힘태:';

          lbDoorControl.Caption:= st+aData;


        end;
    '1':begin
          if aData[6] = '0' then
            lbDoorControl.Caption:= '카드운영모드:POSITIVE로 변경:'+aData
            //ShowMessage('카드운영모드'+#13+'POSITIVE로 변경'+#13+aData)
          else
            lbDoorControl.Caption:= '카드운영모드:NEGATIVE로 변경:'+aData;
            //ShowMessage('카드운영모드'+#13+'NEGATIVE로 변경'+#13+aData);
        end;
    '2':begin
          if aData[6] = '0' then
            lbDoorControl.Caption:= '출입운영모드:운영모드로 변경:'+aData
            //ShowMessage('출입운영모드'+#13+'운영모드로 변경'+#13+aData)
          else
            lbDoorControl.Caption:= '출입운영모드:개방모드로 변경:'+aData;
            //ShowMessage('출입운영모드'+#13+'개방모드로 변경'+#13+aData);
        end;
    '3':begin
          if aData[6] = '0' then
            lbDoorControl.Caption:= '원격제어:시정 변경:'+aData
            //ShowMessage('원격제어'+#13+'시정 변경'+#13+aData)
          else
            lbDoorControl.Caption:= '원격제어:해정 변경:'+aData;
            //ShowMessage('원격제어'+#13+'해정 변경'+#13+aData);
        end;
  end;
 *)
end;


procedure TMainForm.RcvAccEventData(aRealData,aDeviceID:String;bReal:Boolean=True);
var
  st: String;
  aCardNo: String;
  bCardNo: String;
  NoStr: String;
  i : Integer;
  nCardLength : integer;
begin

  st := GetAccEventString(aRealData);

  nCardLength := 8;
  if rg_CardType.ItemIndex = 1 then  //가변인경우
  begin
    nCardLength := strtoint(copy(aRealData,24,2));
    aCardNo:= copy(aRealData,26,nCardLength);  //카드번호 10자리 수정(현재 앞 00 두바이트 사용 안함)
    bCardNo := aCardNo;
  end else  //4Byte 고정인 경우
  begin
    aCardNo:= copy(aRealData,26,8);  //카드번호 10자리 수정(현재 앞 00 두바이트 사용 안함)
    bCardNo:= DecodeCardNo(aCardNo); //숫자 변환
  end;


  {10.카드번호}
  st:= st+ bCardNo;//+ '000000';
  //st:= st + DecodeCardNo(aCardNo);
  NoStr:= InttoStr(CountCardReadData);
  st:= NoStr + ' ;'+st;
  {11.HEX카드번호}
  if rg_CardType.ItemIndex = 1 then  //가변인경우
  begin
    st := st + ' ;' + bCardNo;
  end else
  begin
    st := st + ' ;' + Dec2Hex64(StrtoInt64(bCardNo),8);
  end;
  //기기번호
  st := st + ' ;' + copy(aDeviceID,8,2);
  //리더번호
  st := st + ' ;' + aRealData[4];


  RzFieldStatus1.Caption := stringReplace(st,';','   ',[rfReplaceAll]);
  LMDListBox1.Items.Add(st);
  //LMDListBox1.Selected[LMDListBox1.ItemIndex]:= True;
  for i := 0 to LMDListBox1.Count-1 do
  begin
     if LMDListBox1.Selected[i] then LMDListBox1.Selected[i]:= False;
  end;
  LMDListBox1.Selected[LMDListBox1.Count-1]:= True;


  Inc(CountCardReadData);
  LMDListBox1.ItemIndex:= LMDListBox1.Items.Count -1;
   // 자동 등록 모드이면...
  if bReal then
  begin
    if cbAutoReg.Checked = True then
    begin
      if rg_CardType.ItemIndex = 1 then  //가변인경우
      begin
        AutoCardDownLoad(bCardNo,'E',aDeviceID,nCardLength,True);
      end else
      begin
        AutoCardDownLoad(bCardNo,'E',aDeviceID);
      end;
    end;
  end;

end;



procedure TMainForm.RcvDoorEventData(aRealData:String);
begin

end;

procedure TMainForm.RcvCardRegAck(aRealData:String);
var
  aMsg: String;
  aCardNo: string;
  LinkusNo: String;
  nLength : integer;
  bCardSearch : Boolean;
begin

  bCardSearch := False;
  //if Copy(aData,7,10) <> '0000000000' then Exit;

  case aRealData[1] of
    'l','e':aMsg:='[등록]';
    'm','h':begin
              aMsg:='[조회]';
              bCardSearch := True;
            end;
    'n','d':aMsg:='[삭제]';
  end;
  aMsg := aMsg + aRealData[3] + ':' ;
  nLength := 8;
  if rg_CardType.ItemIndex = 1 then
    nLength := strtoint(copy(aRealData,7,2));
  aCardNo:= Copy(aRealData,9,nLength);

  if rg_CardType.ItemIndex = 1 then
    aMsg:= aMsg + aCardNo+ ':'
  else
    aMsg:= aMsg + DeCodeCardNo(aCardNo)+ ':';

  aMsg:= aMsg + Copy(aRealData,9 + nLength,6)+':';  //17

  LinkusNo:= Copy(aRealData,4,3);
  aMsg:= aMsg + Hex2DecStr(LinkusNo)+':';

  case aRealData[9 + nLength + 6] of   //23
    '0': aMsg:= aMsg +'  정상'+':';
    '1': aMsg:= aMsg +'미등록'+':';
    '2': aMsg:= aMsg +'  등록'+':';
  end;

  case aRealData[9 + nLength + 7] of   //24
    '0': aMsg:= aMsg +'출입';
    '1': aMsg:= aMsg +'방범';
    '2': aMsg:= aMsg +'출입방범';
  end;

  Memo2.Lines.Add(aMsg);
  case aRealData[1] of
    'e','h','d':begin
        if rg_CardType.ItemIndex = 1 then   ed_CardPositionNumber.Text := aCardNo
        else ed_CardPositionNumber.Text := DeCodeCardNo(aCardNo);
        ed_CardPositionNumber.Color := clYellow;
        if rg_CardType.ItemIndex = 1 then ed_CardPositionHex.Text := aCardNo
        else  ed_CardPositionHex.Text := Dec2Hex64(strtoint64(DeCodeCardNo(aCardNo)),8);
        ed_CardPositionHex.Color := clYellow;
        ed_CardPosition.Text := copy(aRealData,9 + nLength + 9,5);  //26
        ed_CardPosition.Color := clYellow;
       end;
  end;

  if Not bCardSearch then Exit;

  if isDigit(aRealData[3]) then
    rdRegCode.itemIndex := strtoint(aRealData[3]);

  edYYYY.text := copy(aRealData,9 + nLength,2);
  edMM.text := copy(aRealData,9 + nLength + 2,2);
  edDD.text := copy(aRealData,9 + nLength + 4,2);

  if isDigit(aRealData[9 + nLength + 7]) then
  begin
    case aRealData[9 + nLength + 7] of
      '0' : rdCardAuth.itemIndex := 1;
      '1' : rdCardAuth.itemIndex := 2;
      '2' : rdCardAuth.itemIndex := 0;
    end;
  end;

  if isDigit(aRealData[9 + nLength + 8]) then
    rdInOutMode.itemIndex := strtoint(aRealData[9 + nLength + 8]);

  //순찰카드 추가
  if aRealData[5] = ' ' then rg_tourCard.ItemIndex := 0
  else rg_tourCard.ItemIndex := 1;

end;

{전화 사용 이벤트 처리}
procedure TMainForm.RcvTelEventData(aRealData: String);
var
  st: string;
begin
  Memo1.Lines.Add(aRealData);
  st:= ToHexStr(aRealData);
  Memo1.Lines.Add(st);


end;



procedure TMainForm.DoorControl(DeviceID: String; aNo:Integer; aControlType,
  aControl: Char);
var
  st: string;
begin

  st:= 'C' +
       //IntToStr(Send_MsgNo)+                       //Msg Count
       '0'+
       InttoStr(aNo)+                             //기기내 문번호
       '0'+
       aControlType+                              //'0':해당사항없음,'1':카드운영,'2':출입운영,'3':원격제어
       aControl;                                  // 카드운영:Positive:'0',Negative:'1'
                                                  // 출입운영:'0':운영 ,'1':개방
                                                  // 원격제어:'0':시정,'1':해정
  ACC_sendData(DeviceID, st,Sent_Ver);
end;



{조회}
procedure TMainForm.btnCheck(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if sender = RzBitBtn2 then CheckID(DeviceID);
  if sender = RzBitBtn8 then CheckSysInfo(DeviceID);
  if Sender = RzBitBtn6 then CheckCR(DeviceID,Group_CardReader.ItemIndex);
  if sender = RzBitBtn12 then CheckPort(DeviceID,Group_Port.ItemIndex);
  if Sender = RzBitBtn42 then CheckSch(DeviceID);
  if Sender = RzBitBtn10 then CheckRelay(DeviceID,Group_Relay.ItemIndex);

{  Case Notebook1.PageIndex of
    0: CheckID(DeviceID);
    1: begin
         if sender = RzBitBtn8 then CheckSysInfo(DeviceID);
         if Sender = RzBitBtn6 then CheckCR(DeviceID,Group_CardReader.ItemIndex);
       end;
    2: CheckPort(DeviceID,Group_Port.ItemIndex);
    3: begin CheckSch(DeviceID) end;
    4: CheckRelay(DeviceID,Group_Relay.ItemIndex);
    else SHowMessage('선택된 메뉴 번호가 없습니다.');
  end;  }
end;

procedure TMainForm.Edit_DeviceIDMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 TEdit(Sender).Color:= clWhite;
end;


procedure TMainForm.M_CloseClick(Sender: TObject);
begin
//  M_Close.Enabled := False;
  Close;
end;

{시간동기화}
procedure TMainForm.Btn_SyncTimeClick(Sender: TObject);
var
  TimeStr: String;
begin
  if chk_UserSyncTime.Checked then
  begin
    TimeStr:= FormatDatetime('yyyymmdd',dt_SyncDate.Date) + FormatDatetime('hhnnss',dt_SyncTime.DateTime);
  end else
    TimeStr:= FormatDatetime('yyyymmddhhnnss',Now);
  Cnt_TimeSync(Edit_CurrentID.Text + ComboBox_IDNO.Text,TimeStr);
  Edit_TimeSync.Text:= '';
  Edit_TimeSync2.Text := '';
end;

{버젼 확인}
procedure TMainForm.RzBitBtn13Click(Sender: TObject);
begin
  Cnt_CheckVer(Edit_CurrentID.Text + ComboBox_IDNO.Text);
  Edit_Ver.Text:= '';
  Edit_TopRomVer.Text:= '';
end;



{리셋}
procedure TMainForm.RzBitBtn14Click(Sender: TObject);
begin
  Cnt_Reset(Edit_CurrentID.Text + ComboBox_IDNO.Text);
  Edit_Reset.Text:= '';
  Edit_Reset2.Text := '';
end;

{모드변경}
procedure TMainForm.RzBitBtn15Click(Sender: TObject);
var
  aMode:Char;
  stCaption : string;
begin
  stCaption := (Sender as TRzBitBtn).Caption ;
  aMode:= ' ';
  ComboBox_Zone.Color:= clWhite;
  RzComboBox1.Color:= ClWhite;

{  Case RzComboBox1.ItemIndex of
    0: aMode:= 'A';  //경비모드
    1: aMode:= 'D';  //해제모드
    2: aMode:= 'P';  //순회모드
  end;    }
  if stCaption = '경계' then
  begin
    aMode:= 'A';
    RzComboBox1.ItemIndex := 0;
  end else if stCaption = '해제' then
  begin
    aMode:= 'D';
    RzComboBox1.ItemIndex := 1;
  end else if stCaption = '순회' then
  begin
    aMode:= 'P' ;
    RzComboBox1.ItemIndex := 2;
  end else Exit;

  Cnt_ChangeMode(Edit_CurrentID.Text + ComboBox_IDNO.Text,
                 ComboBox_Zone.ItemIndex,
                 aMode);
end;








{암호화 사용}
procedure TMainForm.RzBitBtn16Click(Sender: TObject);
begin
  if RzComboBox2.ItemIndex  = 0 then
  begin
    Cnt_Random(Edit_CurrentID.Text + ComboBox_IDNO.Text,
               False,
               RzSpinEdit3.IntValue);
  end else
  begin
    Cnt_Random(Edit_CurrentID.Text + ComboBox_IDNO.Text,
               True,
               RzSpinEdit3.IntValue);
  end;
end;
{사용자 정의 명령어 }
procedure TMainForm.RzBitBtn17Click(Sender: TObject);
begin
  Cnt_USerCMD(Edit_CurrentID.Text + ComboBox_IDNO.Text,Edit_CMD1.Text);

end;

procedure TMainForm.btn_ConnectClick(Sender: TObject);
var
  aTCP: String;
  aIndex: Integer;
  aDir: String;
begin
//  DBISAMQuery1.Active := True;
  //Server.Open;
  with WinsockPort do
  begin
    if rg_ConType.ItemIndex = 0 then
    begin
      DeviceLayer:= dlWinsock;
      wsAddress:= CB_IPList.Text;
      wsPort:=    Edit2.Text;
      Rcv_MsgNo:='0';
      Send_MsgNo:= 0;
      ComBuff:= '';
      ApdSLController1.Monitoring:= True;
      OPen:= False;
      Sleep(100);


      aIndex:= CB_IPList.Items.IndexOf(wsAddress);
      if aIndex < 0 then
      begin
        if CB_IPList.Items.Count >= 20 then CB_IPList.Items.Delete(19);
        CB_IPList.Items.Insert(0,wsAddress);
      end;

      {aDir:= ExtractFileDir(Application.ExeName);
      aDir:= aDir +'\iplist.ini';
      CB_IPList.Items.SaveToFile(adir); }


      if RadioGroup_Mode.ItemIndex < 1 then
      begin
        wsMode:= wsClient;
      end else
      begin
        wsMode:= wsServer;
        Panel_ActiveClinetCount.Caption:= CB_IPList.Text+ ' 접속대기중';
      end;
      OPen:= True;
      StopConnection:= False;

      aTCP:= CB_IPList.Text+ ','+ Edit2.Text;
      //LMDIniCtrl1.WriteString('설정','TCP',aTCP);
      //LMDIniCtrl1.WriteInteger('설정','TCPMode',RadioGroup_Mode.ItemIndex);


    end else
    begin
      DeviceLayer:= dlWin32;
      Baud:= StrtoInt(CB_SerialBoard.Text); //38400
      WinsockPort.ComNumber:=  StrtoInt(copy(CB_SerialComm.Text,4,2));
      try
        ApdSLController1.Monitoring:= True;
        OPen:= True;
      except
        ShowMessage('통신포트 를 확인하세요');
        Exit;
      end;
      Panel_ActiveClinetCount.Caption:=  'Com'+ CB_SerialComm.Text[4] + ' 연결대기';
      //LMDIniCtrl1.WriteInteger('설정','ComNo',CB_SerialComm.ItemIndex);
      //LMDIniCtrl1.WriteInteger('설정','Board',CB_SerialBoard.ItemIndex);
      Delay(100);
      CheckID('0000000');
      
    end;

  end;



end;

procedure TMainForm.Btn_DisConnectClick(Sender: TObject);
begin
  StopConnection:= True;
  Polling_Timer.Enabled:= False;
  Off_Timer.Enabled:= False;

  WinsockPort.OPen:= False;

  if rg_ConType.ItemIndex = 1 then
    Panel_ActiveClinetCount.Caption:=  'Com'+ CB_SerialComm.Text[4] + ' 연결해제'
  else
    Panel_ActiveClinetCount.Caption:=  CB_IPList.Text + ' 연결해제'
end;

{}
procedure TMainForm.WinsockPortWsConnect(Sender: TObject);
var
  st: string;
begin
  SockErroCode:= 0;
  Panel_ActiveClinetCount.Caption:= CB_IPList.Text + ' 접속';
  st:=  '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        ''+#9+
        '<==== Connected :'+CB_IPList.Text + #9 +
        '';
  AddEventList(st);

  //btn_Connect.Color:= $00F48D6A;
  //Btn_DisConnect.Color:= $00F0F4F4;
  CheckID('0000000');



end;

procedure TMainForm.WinsockPortWsDisconnect(Sender: TObject);
var
  st: string;
begin

  if ReconnectSocketTimer.Enabled then exit; // only do once



  if cbPolling.Checked then
  begin
   Polling_Timer.Enabled:= False;
   cbPolling.Checked:= False;
  end;


  Panel_ActiveClinetCount.Caption:= CB_IPList.Text + ' 해제';
  //btn_Connect.Color:= $00F0F4F4;
  //Btn_DisConnect.Color:= $003CC7FF;

  st:=  '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9 +
        '' +#9 +
        '====>Disconnected: '+CB_IPList.Text + #9 +
        '';
  AddEventList(st);

  //Btn_DisConnectClick(Self);

  if StopConnection then Exit;

  DoCloseWinsock := true;
  ReconnectSocketTimer.Enabled := true;


end;

procedure TMainForm.WinsockPortWsError(Sender: TObject; ErrCode: Integer);
var
  st:string;
begin

  if ReconnectSocketTimer.Enabled then exit; // only do once


  if SockErroCode <> ErrCode then
  begin
    SockErroCode:= ErrCode;
    Panel_ActiveClinetCount.Caption:= CB_IPList.Text + ' 접속 에러['+InttoStr(ErrCode)+']';
    st:=  '' +#9+
          '' +#9+
          '' +#9+
          '' +#9+
          ''+#9+
          ''+#9+
          '====> Error:'+InttoStr(ErrCode) +#9+
          '';
    AddEventList(st);
  end;
  if cbPolling.Checked then
  begin
   Polling_Timer.Enabled:= False;
   cbPolling.Checked:= False;
  end;

  if StopConnection then Exit;
  
  DoCloseWinsock := true;
  ReconnectSocketTimer.Enabled := true;

  //btn_Connect.Color:= $00F0F4F4;
  //Btn_DisConnect.Color:= $003CC7FF;
end;


procedure TMainForm.WinsockPortTriggerAvail(CP: TObject; Count: Word);
var
  st: string;
  st2: String;
  st3: String;
  aIndex: Integer;
  I: Integer;
  DataLength: Integer;
  bLoop : Boolean;
  nFormat : integer; //-1: 포맷 모름, 1: STX 포맷,2:SOH 포맷
begin
  st:= '';

  for I := 1 to Count do st := st + WinsockPort.GetChar;

  if OnMoni then PrintLog(st);

  ComBuff:= ComBuff + st;

  { 2010.11.23 깨진 데이터로 인해 패킷 체크 루틴 변경}
  if Trim(ComBuff) = '' then Exit;
  bLoop := False;

  repeat

    if ComBuff = '' then break;

    nFormat := PacketFormatCheck(ComBuff,st2,st3);
    {/*
     nFormat : -1 -> 비정상 전문
               -2 -> 길이가 짧은 전문
                1 ->  STX 포맷
                2 ->  SOH 포맷
    */}
    ComBuff:= st2;

    if nFormat < 0 then
    begin
      if ComBuff = '' then break;
      if nFormat = -1 then  //비정상 전문 인경우
      begin
         Delete(ComBuff,1,1);
         continue;
      end else break;   //포맷 길이가 작게 들어온 경우

    end;

    if nFormat = 1 then bDecoderFormat := False
    else if nFormat = 2 then bDecoderFormat := True
    else continue;

    if st3 <> '' then
    begin
      if bDecoderFormat then DecoderDataPacektProcess(st3)
      else DataPacektProcess(st3);
    end;

    //데코더 포맷으로 추가 됨 2009,01,20
    if bDecoderFormat then
    begin
      if pos(EOH,comBuff) = 0 then bLoop := True
      else bLoop := False;
    end else
    begin
      if pos(ETX,comBuff) = 0 then bLoop := True
      else bLoop := False;
    end;
  until bLoop;

{
  if Pos(SOH,ComBuff) > 0 then
  begin
    bDecoderFormat := True;
    rg_DecorderSelect.Visible := True;
  end else
  begin
    bDecoderFormat := False;
    rg_DecorderSelect.Visible := False;
  end;
  if bDecoderFormat then aIndex := Pos(SOH,ComBuff)  //데코더 포맷
  else aIndex:= Pos(STX,ComBuff);  // STX 위치를 확인 한다.
  if aIndex = 0 then Exit    // STX 또는 SOH가 없으면 루틴에서 나간다.
  else if aIndex > 1 then
  begin
    //SHowMessage(ComBuff);
    Delete(ComBuff,1,aIndex-1);  //STX위치가 1아니면 STX앞까지 삭제
  end;
  if Length(Combuff) < (G_nIDLength + 14) then Exit;
  bLoop := False;
  repeat
    //데코더 포맷으로 변경 됨 2009,01,20
    if bDecoderFormat then st3:= CheckDecorderDataPacket(ComBuff,st2)
    else st3:= CheckDataPacket(ComBuff,st2);

    ComBuff:= st2;
    if st3 <> '' then
    begin
      if bDecoderFormat then DecoderDataPacektProcess(st3)
      else DataPacektProcess(st3);
    end;

    //데코더 포맷으로 추가 됨 2009,01,20
    if bDecoderFormat then
    begin
      if pos(EOH,comBuff) = 0 then bLoop := True
      else bLoop := False;
    end else
    begin
      if pos(ETX,comBuff) = 0 then bLoop := True
      else bLoop := False;
    end;
  until bLoop;
  //until pos(ETX,comBuff) = 0;   }

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
begin
  if IsFirmwareDownLoad then
  begin
    Exit;
  end;
  //RzBitBtn74Click(Sender);//FTP 서버 중지


  if WinsockPort.Open then WinsockPort.Open:= False;
{  //DelayTicks( 9, true); // Give the com port time to shut down before we destroy it.
  LMDIniCtrl1.WriteString('설정','SEND1',ToHexStr(Edit_Send1.Text));
  LMDIniCtrl1.WriteString('설정','SEND2',ToHexStr(Edit_Send2.Text));
  LMDIniCtrl1.WriteString('설정','SEND3',ToHexStr(Edit_Send3.Text));
  LMDIniCtrl1.WriteString('설정','SEND4',ToHexStr(Edit_Send4.Text));
  LMDIniCtrl1.WriteString('설정','SEND5',ToHexStr(Edit_Send5.Text));
  LMDIniCtrl1.WriteString('설정','SEND6',ToHexStr(Edit_Send6.Text));
  LMDIniCtrl1.WriteString('설정','SEND7',ToHexStr(Edit_Send7.Text));
  LMDIniCtrl1.WriteString('설정','SEND8',ToHexStr(Edit_Send8.Text));
  LMDIniCtrl1.WriteString('설정','SEND9',ToHexStr(Edit_Send9.Text));
  LMDIniCtrl1.WriteString('설정','SEND0',ToHexStr(Edit_Send0.Text));
  LMDIniCtrl1.WriteString('설정','SENDA',ToHexStr(Edit_SendA.Text));
  LMDIniCtrl1.WriteString('설정','SENDB',ToHexStr(Edit_SendB.Text));
  LMDIniCtrl1.WriteString('설정','SENDC',ToHexStr(Edit_SendC.Text));
  LMDIniCtrl1.WriteString('설정','SENDD',ToHexStr(Edit_SendD.Text));
  LMDIniCtrl1.WriteString('설정','SENDE',ToHexStr(Edit_SendE.Text));
  LMDIniCtrl1.WriteString('설정','SENDF',ToHexStr(Edit_SendF.Text));

  LMDIniCtrl1.WriteString('설정','SEND21',ToHexStr(Edit_Send21.Text));
  LMDIniCtrl1.WriteString('설정','SEND22',ToHexStr(Edit_Send22.Text));
  LMDIniCtrl1.WriteString('설정','SEND23',ToHexStr(Edit_Send23.Text));
  LMDIniCtrl1.WriteString('설정','SEND24',ToHexStr(Edit_Send24.Text));
  LMDIniCtrl1.WriteString('설정','SEND25',ToHexStr(Edit_Send25.Text));
  LMDIniCtrl1.WriteString('설정','SEND26',ToHexStr(Edit_Send26.Text));
  LMDIniCtrl1.WriteString('설정','SEND27',ToHexStr(Edit_Send27.Text));
  LMDIniCtrl1.WriteString('설정','SEND28',ToHexStr(Edit_Send28.Text));
  LMDIniCtrl1.WriteString('설정','SEND29',ToHexStr(Edit_Send29.Text));
  LMDIniCtrl1.WriteString('설정','SEND20',ToHexStr(Edit_Send20.Text));
  LMDIniCtrl1.WriteString('설정','SEND2A',ToHexStr(Edit_Send2A.Text));
  LMDIniCtrl1.WriteString('설정','SEND2B',ToHexStr(Edit_Send2B.Text));
  LMDIniCtrl1.WriteString('설정','SEND2C',ToHexStr(Edit_Send2C.Text));
  LMDIniCtrl1.WriteString('설정','SEND2D',ToHexStr(Edit_Send2D.Text));
  LMDIniCtrl1.WriteString('설정','SEND2E',ToHexStr(Edit_Send2E.Text));
  LMDIniCtrl1.WriteString('설정','SEND2F',ToHexStr(Edit_Send2F.Text));

  LMDIniCtrl1.WriteString('설정','SEND31',ToHexStr(Edit_Send31.Text));
  LMDIniCtrl1.WriteString('설정','SEND32',ToHexStr(Edit_Send32.Text));
  LMDIniCtrl1.WriteString('설정','SEND33',ToHexStr(Edit_Send33.Text));
  LMDIniCtrl1.WriteString('설정','SEND34',ToHexStr(Edit_Send34.Text));
  LMDIniCtrl1.WriteString('설정','SEND35',ToHexStr(Edit_Send35.Text));
  LMDIniCtrl1.WriteString('설정','SEND36',ToHexStr(Edit_Send36.Text));
  LMDIniCtrl1.WriteString('설정','SEND37',ToHexStr(Edit_Send37.Text));
  LMDIniCtrl1.WriteString('설정','SEND38',ToHexStr(Edit_Send38.Text));
  LMDIniCtrl1.WriteString('설정','SEND39',ToHexStr(Edit_Send39.Text));
  LMDIniCtrl1.WriteString('설정','SEND30',ToHexStr(Edit_Send30.Text));
  LMDIniCtrl1.WriteString('설정','SEND3A',ToHexStr(Edit_Send3A.Text));
  LMDIniCtrl1.WriteString('설정','SEND3B',ToHexStr(Edit_Send3B.Text));
  LMDIniCtrl1.WriteString('설정','SEND3C',ToHexStr(Edit_Send3C.Text));
  LMDIniCtrl1.WriteString('설정','SEND3D',ToHexStr(Edit_Send3D.Text));
  LMDIniCtrl1.WriteString('설정','SEND3E',ToHexStr(Edit_Send3E.Text));
  LMDIniCtrl1.WriteString('설정','SEND3F',ToHexStr(Edit_Send3F.Text));


  LMDIniCtrl1.WriteString('설정','FUNC1',Edit_Func1.Text);
  LMDIniCtrl1.WriteString('설정','FUNC2',Edit_Func2.Text);
  LMDIniCtrl1.WriteString('설정','FUNC3',Edit_Func3.Text);
  LMDIniCtrl1.WriteString('설정','FUNC4',Edit_Func4.Text);
  LMDIniCtrl1.WriteString('설정','FUNC5',Edit_Func5.Text);
  LMDIniCtrl1.WriteString('설정','FUNC6',Edit_Func6.Text);
  LMDIniCtrl1.WriteString('설정','FUNC7',Edit_Func7.Text);
  LMDIniCtrl1.WriteString('설정','FUNC8',Edit_Func8.Text);
  LMDIniCtrl1.WriteString('설정','FUNC9',Edit_Func9.Text);
  LMDIniCtrl1.WriteString('설정','FUNC0',Edit_Func0.Text);
  LMDIniCtrl1.WriteString('설정','FUNCA',Edit_FuncA.Text);
  LMDIniCtrl1.WriteString('설정','FUNCB',Edit_FuncB.Text);
  LMDIniCtrl1.WriteString('설정','FUNCC',Edit_FuncC.Text);
  LMDIniCtrl1.WriteString('설정','FUNCD',Edit_FuncD.Text);
  LMDIniCtrl1.WriteString('설정','FUNCE',Edit_FuncE.Text);
  LMDIniCtrl1.WriteString('설정','FUNCF',Edit_FuncF.Text);

  LMDIniCtrl1.WriteString('설정','FUNC21',Edit_Func21.Text);
  LMDIniCtrl1.WriteString('설정','FUNC22',Edit_Func22.Text);
  LMDIniCtrl1.WriteString('설정','FUNC23',Edit_Func23.Text);
  LMDIniCtrl1.WriteString('설정','FUNC24',Edit_Func24.Text);
  LMDIniCtrl1.WriteString('설정','FUNC25',Edit_Func25.Text);
  LMDIniCtrl1.WriteString('설정','FUNC26',Edit_Func26.Text);
  LMDIniCtrl1.WriteString('설정','FUNC27',Edit_Func27.Text);
  LMDIniCtrl1.WriteString('설정','FUNC28',Edit_Func28.Text);
  LMDIniCtrl1.WriteString('설정','FUNC29',Edit_Func29.Text);
  LMDIniCtrl1.WriteString('설정','FUNC20',Edit_Func20.Text);
  LMDIniCtrl1.WriteString('설정','FUNC2A',Edit_Func2A.Text);
  LMDIniCtrl1.WriteString('설정','FUNC2B',Edit_Func2B.Text);
  LMDIniCtrl1.WriteString('설정','FUNC2C',Edit_Func2C.Text);
  LMDIniCtrl1.WriteString('설정','FUNC2D',Edit_Func2D.Text);
  LMDIniCtrl1.WriteString('설정','FUNC2E',Edit_Func2E.Text);
  LMDIniCtrl1.WriteString('설정','FUNC2F',Edit_Func2F.Text);

  LMDIniCtrl1.WriteString('설정','FUNC31',Edit_Func31.Text);
  LMDIniCtrl1.WriteString('설정','FUNC32',Edit_Func32.Text);
  LMDIniCtrl1.WriteString('설정','FUNC33',Edit_Func33.Text);
  LMDIniCtrl1.WriteString('설정','FUNC34',Edit_Func34.Text);
  LMDIniCtrl1.WriteString('설정','FUNC35',Edit_Func35.Text);
  LMDIniCtrl1.WriteString('설정','FUNC36',Edit_Func36.Text);
  LMDIniCtrl1.WriteString('설정','FUNC37',Edit_Func37.Text);
  LMDIniCtrl1.WriteString('설정','FUNC38',Edit_Func38.Text);
  LMDIniCtrl1.WriteString('설정','FUNC39',Edit_Func39.Text);
  LMDIniCtrl1.WriteString('설정','FUNC30',Edit_Func30.Text);
  LMDIniCtrl1.WriteString('설정','FUNC3A',Edit_Func3A.Text);
  LMDIniCtrl1.WriteString('설정','FUNC3B',Edit_Func3B.Text);
  LMDIniCtrl1.WriteString('설정','FUNC3C',Edit_Func3C.Text);
  LMDIniCtrl1.WriteString('설정','FUNC3D',Edit_Func3D.Text);
  LMDIniCtrl1.WriteString('설정','FUNC3E',Edit_Func3E.Text);
  LMDIniCtrl1.WriteString('설정','FUNC3F',Edit_Func3F.Text);

  for i:= 1 to 16 do
  begin
    LMDIniCtrl1.WriteString('설정','FingFUNC' + FillZeroNumber(i,2),Array_FingerEdit[i].FingFUNC.Text);
    LMDIniCtrl1.WriteString('설정','FingCMD' + FillZeroNumber(i,2),Array_FingerEdit[i].FingCMD.Text);
    LMDIniCtrl1.WriteString('설정','FingData1' + FillZeroNumber(i,2),Array_FingerEdit[i].FingData1.Text);
    LMDIniCtrl1.WriteString('설정','FingData2' + FillZeroNumber(i,2),Array_FingerEdit[i].FingData2.Text);
    LMDIniCtrl1.WriteString('설정','FingData3' + FillZeroNumber(i,2),Array_FingerEdit[i].FingData3.Text);
    LMDIniCtrl1.WriteString('설정','FingData4' + FillZeroNumber(i,2),Array_FingerEdit[i].FingData4.Text);
    LMDIniCtrl1.WriteString('설정','FingCheckSum' + FillZeroNumber(i,2),Array_FingerEdit[i].FingCheckSum.Text);
  end;

  // 모니터링 그리드 현재값저장

  LMDIniCtrl1.WriteInteger('모니터링그리드설정','순번'      ,RxDBGrid1.Columns[0].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','방향'      ,RxDBGrid1.Columns[1].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','시간'      ,RxDBGrid1.Columns[2].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','버젼'    ,RxDBGrid1.Columns[3].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','기기ID'    ,RxDBGrid1.Columns[4].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','No'        ,RxDBGrid1.Columns[5].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','커맨드'    ,RxDBGrid1.Columns[6].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','데이터'    ,RxDBGrid1.Columns[7].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','전체데이터',RxDBGrid1.Columns[8].Width);
//  LMDIniCtrl1.WriteInteger('모니터링그리드설정','높이',RzSplitter3.Position);

  //소리부분 저장
  LMDIniCtrl1.WriteString('소리','EDCOMP1',ToHexStr(edComp1.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP2',ToHexStr(edComp2.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP3',ToHexStr(edComp3.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP4',ToHexStr(edComp4.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP5',ToHexStr(edComp5.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP6',ToHexStr(edComp6.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP7',ToHexStr(edComp7.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP8',ToHexStr(edComp8.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP9',ToHexStr(edComp9.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP10',ToHexStr(edComp10.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP11',ToHexStr(edComp11.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP12',ToHexStr(edComp12.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP13',ToHexStr(edComp13.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP14',ToHexStr(edComp14.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP15',ToHexStr(edComp15.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP16',ToHexStr(edComp16.Text));

  LMDIniCtrl1.WriteString('소리','EDFILE1',edFile1.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE2',edFile2.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE3',edFile3.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE4',edFile4.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE5',edFile5.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE6',edFile6.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE7',edFile7.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE8',edFile8.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE9',edFile9.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE10',edFile10.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE11',edFile11.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE12',edFile12.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE13',edFile13.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE14',edFile14.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE15',edFile15.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE16',edFile16.Text);

  LMDIniCtrl1.WriteString('실행','EDEXE1',edExe1.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE2',edExe2.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE3',edExe3.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE4',edExe4.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE5',edExe5.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE6',edExe6.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE7',edExe7.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE8',edExe8.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE9',edExe9.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE10',edExe10.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE11',edExe11.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE12',edExe12.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE13',edExe13.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE14',edExe14.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE15',edExe15.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE16',edExe16.Text);

  if check1.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK1',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK1',0);
  if check2.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK2',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK2',0);
  if check3.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK3',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK3',0);
  if check4.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK4',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK4',0);
  if check5.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK5',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK5',0);
  if check6.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK6',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK6',0);
  if check7.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK7',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK7',0);
  if check8.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK8',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK8',0);
  if check9.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK9',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK9',0);
  if check10.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK10',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK10',0);
  if check11.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK11',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK11',0);
  if check12.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK12',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK12',0);
  if check13.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK13',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK13',0);
  if check14.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK14',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK14',0);
  if check15.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK15',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK15',0);
  if check16.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK16',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK16',0);

  LMDIniCtrl1.WriteString('Decoder','MCode1',ed_DecMCode1.Text);
  LMDIniCtrl1.WriteString('Decoder','MCode2',ed_DecMCode2.Text);
  LMDIniCtrl1.WriteString('Decoder','MCode2',ed_DecMCode2.Text);
  LMDIniCtrl1.WriteString('Decoder','CMD1',ed_DecCMD1.Text);
  LMDIniCtrl1.WriteString('Decoder','CMD2',ed_DecCMD2.Text);
  LMDIniCtrl1.WriteString('Decoder','CMD3',ed_DecCMD3.Text);
  LMDIniCtrl1.WriteString('Decoder','Modem1',ed_DecModem1.Text);
  LMDIniCtrl1.WriteString('Decoder','Modem2',ed_DecModem2.Text);
  LMDIniCtrl1.WriteString('Decoder','Modem3',ed_DecModem3.Text);
  LMDIniCtrl1.WriteString('Decoder','Channel1',ed_DecChannel1.Text);
  LMDIniCtrl1.WriteString('Decoder','Channel2',ed_DecChannel2.Text);
  LMDIniCtrl1.WriteString('Decoder','Channel3',ed_DecChannel3.Text);
  LMDIniCtrl1.WriteString('Decoder','Cntl1',ed_DecCntl1.Text);
  LMDIniCtrl1.WriteString('Decoder','Cntl2',ed_DecCntl2.Text);
  LMDIniCtrl1.WriteString('Decoder','Cntl3',ed_DecCntl3.Text);
  LMDIniCtrl1.WriteString('Decoder','tail1',ed_Dectail1.Text);
  LMDIniCtrl1.WriteString('Decoder','tail2',ed_Dectail2.Text);
  LMDIniCtrl1.WriteString('Decoder','tail3',ed_Dectail3.Text);



  LMDIniCtrl1.WriteInteger('설정','연결방식',rg_ConType.ItemIndex);
  //LMDIniCtrl1.WriteInteger('설정','Comno',WinsockPort.ComNumber);

  //브로드캐스트 부분 저장
  LMDIniCtrl1.WriteString('BroadCasting','SaveFileName',edBroadFileSave.text);
  LMDIniCtrl1.WriteString('BroadCasting','OpenFileName',edBRFileLoad.text);

  //폼 위치 저장
  if MainForm.WindowState = wsMaximized then
  begin
    LMDIniCtrl1.WriteInteger('폼','Maximized',1);
    LMDIniCtrl1.WriteInteger('폼','Width',nPreWidth);
    LMDIniCtrl1.WriteInteger('폼','Height',nPreHeight);
    LMDIniCtrl1.WriteInteger('폼','Left',nPreLeft);
    LMDIniCtrl1.WriteInteger('폼','Top',nPreTop);
  end
  else
  begin
    LMDIniCtrl1.WriteInteger('폼','Maximized',0);
    LMDIniCtrl1.WriteInteger('폼','Width',nWidth);
    LMDIniCtrl1.WriteInteger('폼','Height',nHeight);
    LMDIniCtrl1.WriteInteger('폼','Left',nLeft);
    LMDIniCtrl1.WriteInteger('폼','Top',nTop);
  end;
  LMDIniCtrl1.WriteString('FTP','FTPLOCALIP',ed_ftpLocalip.Text);
  LMDIniCtrl1.WriteString('FTP','FTPLOCALPORT',ed_ftplocalport.Text);
}

  if BroadSaveFileList.count > 0 then BroadSaveFileList.SaveToFile(edBroadFileSave.text);
  if BroadFileList <> nil then BroadFileList.Free;
  if BroadSaveFileList <> nil then BroadSaveFileList.Free;

  if DownLoadList <> nil then DownLoadList.Free;
  if ROM_FlashWrite <> nil then ROM_FlashWrite.Free;
  if ROM_FlashData <> nil then ROM_FlashData.Free;

  Try
    if IdFTPServer.Active then IdFTPServer.Active := False;
    IdFTPServer.Free;
  Except
  end;
  Off_Timer.Enabled := False;
  Polling_Timer.Enabled := False;
  ReconnectSocketTimer.Enabled := False;
  WiznetTimer.Enabled := False;
  BroadTimer.Enabled := False;
  broadStopTimer.Enabled := False;
  BroadSleep_Timer.Enabled := False;
  BroadSleep_Timer.Destroy;
  broadStopTimer.Destroy;
  BroadTimer.Destroy;
  WiznetTimer.Destroy;
  ReconnectSocketTimer.Destroy;
  Polling_Timer.Destroy;
  Off_Timer.Destroy;

end;

{연결장비 등록}
procedure TMainForm.RzBitBtn3Click(Sender: TObject);
var
  st: string;
  I: Integer;
  DeviceID: String;
begin
{}
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  st:='1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
  for I:= 1 to Group_Device.Items.Count-1 do
  begin
    if Group_Device.ItemChecked[I] then st[I+1]:= '1';
  end;
  RegUsedDevice(DeviceID,st);
end;




procedure TMainForm.ListBox_EventKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  st: string;  
begin

  if key = 17 then Exit;

  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    st:= DBISAMTable1.FindField('FullData').asString;
    ClipBoard.SetTextBuf(PChar(st));

  end;

end;
      
procedure TMainForm.cbPollingClick(Sender: TObject);
begin

  if cbPolling.Checked then
  begin
    Polling_TimerTimer(Self);
    Polling_Timer.Interval:= RzSpinner1.Value * 1000;
    Polling_Timer.Enabled:= True;
  end else
  begin
    Polling_Timer.Enabled:= False;
  end;

end;

{폴링 타이머}
procedure TMainForm.Polling_TimerTimer(Sender: TObject);
var
  aDeviceID: String;
begin
  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(aDeviceID,'e', '',Sent_Ver);
end;

procedure TMainForm.RzSpinner1Change(Sender: TObject);
begin
  Polling_Timer.Interval:= RzSpinner1.Value * 1000;
end;

{임의 데이터 전송}
procedure TMainForm.Btn_SBtn_Send41Click(Sender: TObject);
var
  I: Integer;
  aDeviceID: String;
  aData: String;
  st: string;
  aFunc: Char;
begin
  for I:= 0 to 63 do
  begin
    if Array_SendEdit[I].Btn_Send = Sender then
    begin
      if Array_SendEdit[I].Edit.Text <> '' then
      begin
        aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

        if cb_SendFullData.Checked = False then
        begin
          if Array_SendEdit[I].Func.Text <> '' then
          begin
            aData:= Array_SendEdit[I].Edit.Text;
            aFunc:= Array_SendEdit[I].Func.Text[1];
            SendPacket(aDeviceID,aFunc,aData,Sent_Ver);
          end else
          begin
            SHowMessage('펑션코드가  없습니다.');
            Exit;
          end;
        end else
        begin
          //WinsockPort.FlushOutBuffer;
          aData:= Array_SendEdit[I].Edit.Text;
          WinsockPort.PutString(aData);
          st:=  'Server:'+'0' +#9+
                Copy(aDeviceID,1,7)+#9+
                Copy(aDeviceID,8,2)+#9+
                //Copy(ACKStr2,17,2)+';'+
                aData[17]+#9+
                Copy(aData,19,Length(aData)-21)+#9+
                'TX'+#9+
                aData +#9+
                '';
           //showMessage(st);
          AddEventList(st);

        end;


      end else
      begin
        if MessageDlg('전송할 데이터가 없습니다.취소 하시겠습니까?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        SendCancelRomUpDate(aDeviceID);
      end;

      Exit;
    end;
  end;
end;

{전송 데이터 Edit 내용 삭제}
procedure TMainForm.Btn_Clear1Click(Sender: TObject);
var
  I: Integer;
begin
  for I:= 1 to 63 do
  begin
    if Array_SendEdit[I].Btn_Clear = Sender then
    begin
      Array_SendEdit[I].Edit.Text:= '';
      Exit;
    end;
  end;
end;

{펌웨어 다운로드}
Procedure TMainForm.DownLoadRom(aDeviceID:String;aType:Integer;aFileName: String);
var
  I: Integer;
  st: string;
begin
  DownLoadList.Clear;
  DOwnLoadType:= aType;
  DownLoadList.LoadFromFile(aFileName);
  st:= DownLoadList[0];
  SendRomData(aDeviceID,Downloadtype,st);

  OffCount:= 0;
  DownLoadCount:= 0;
  ProgressBar1.Position:= 0;
  ProgressBar1.Max:= DownLoadList.Count;
  Label1.Caption:= InttoStr(ProgressBar1.Position)+'/'+ InttoStr(ProgressBar1.Max);
end;

Procedure TMainForm.SendRomData(aDeviceID:String;aType:Integer; adata: String);
var
  st: string;
begin


  if aType =1 then st:= 'FP00'+aData
  else             st:= 'FD00'+aData;
  SendPacket(aDeviceID,'F',st,Sent_Ver);
  Off_Timer.Enabled:= True;

end;



procedure TMainForm.Off_TimerTimer(Sender: TObject);
var
  st: string;
  I: Integer;
  aDeviceID:String;
begin

  if not WinsockPort.Open then
  begin
    //if not ISDwonLoad then Off_Timer.Enabled:= False;
    Exit;
  end;

  if LMDCaptionPanel1.Visible then
  begin
    if ProgressBar3.Position >= 10 then
    begin
       if not WizNetRcvACK then
       begin
         LMDCaptionPanel1.visible := False;
         LMDSimpleLabel1.Twinkle:= False;
         Off_Timer.Enabled:= False;
         SHowMessage('기기 조회/설정을 실패 했습니다.재시도 하세요');
       end else
       begin
         btnCheckLanClick(Self);
       end;
       Exit;
    end else
    begin
      I:= ProgressBar3.Position;
      Inc(I);
      ProgressBar3.Position:= I;
    end;
  end else // 펌웨어 다운로드
  begin
    (*
    if OffCount > 10 then
    begin
      Off_Timer.enabled:= False;
      ShowMessage('다운로드가 실패 했습니다.');
      IsDwonLoad:= False;
      Exit;
    end;
      *)
    if DownLoadList.Count > 0 then
    begin
      st:= DownLoadList[0];
      aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
      SendRomData(aDeviceID,Downloadtype,st);
      Inc(OffCount);
    end else
    begin
      IsDownLoad:= False;
      Off_Timer.Enabled:= False;
    end;
  end;
end;

procedure TMainForm.RzBitBtn20Click(Sender: TObject);
begin

  if Not WinsockPort.Open then
  begin
    showmessage('통신연결이 안되었습니다.');
    Exit;
  end;
  if chk_DeviceInfoSave.Checked then
  begin
    bAutoDeviceInfoSave := True;
    btnTempSaveClick(self);
    while bAutoDeviceInfoSave do
    begin
      Application.ProcessMessages;
      sleep(1);
    end;
  end;
  if FTPUSE then
  begin
    btn_FtpSendClick(btn_FtpSend1);
    Exit;
  end;
  bBroadFileSendERR := False;//처음 시작 할때는 Err 가 없다.
  btBroadFileRetry.Enabled := False;
  BroadSendDataList.Clear;
  BroadErrorDataList.Clear;
  btBroadRetry.Enabled := False;
  //여기서 한번만 Controler 셋팅해주자.
  BroadControlerNum := '';
  BroadControlerNum := GetBroadControlerNum(Group_BroadDownLoad);

 {다운로드 이전에 코드를 확인한다.}
 if DLCheckBox.Checked then
 begin
   if DLRadioGroup.ItemIndex = 0 then aFI.CMDCODE:= '00'
   else                               aFI.CMDCODE:= DLCodeEdit.Text;

   if Length(aFI.CMDCODE) <> 2 then
   begin
    ShowMessage('코드를 2자리로 입력 확인하세요');
    exit;
   end;
 end;

 GroupBox23.Visible := True;
 IsFirmwareDownLoad := True;


// if cb_Download.Checked then
 if rdMode.ItemIndex = 0 then
 begin

    ListBox_DownLoadInfo.Clear;
    Write_ListBox_DownLoadInfo('펌웨어 업그레이드 수동시작');
    Write_ListBox_DownLoadInfo('펌웨어 업그레이드정보 전송');
    Write_ListBox_DownLoadInfo('펌웨어 버젼:aFI.Version');
    SendRomUpDateInfo;
 end else if rdMode.ItemIndex = 2 then
 begin
    ListBox_DownLoadInfo.Clear;
    Write_ListBox_DownLoadInfo('펌웨어 업그레이드 수동시작');
    Write_ListBox_DownLoadInfo('펌웨어 업그레이드정보 전송');
    Write_ListBox_DownLoadInfo('펌웨어 버젼:aFI.Version');
    SendRomBroadFileInfo;

 end else
 begin

    LMDStopWatch1.Start;
    CancelDownload:= False;

    {
    if RzButtonEdit1.Text = '' then
    begin
      ShowMessage('선택한 파일이 없습니다.');
      Exit;
    end;
     }
    //Req_Version;

    ListBox_DownLoadInfo.Clear;
    if WinsockPort.Open = False then
    begin
      WinsockPort.Open:= True;
    end;

    Write_ListBox_DownLoadInfo('펌웨어 버젼 확인');

    if CheckRomVer then
    begin
      if MessageDlg('펌웨어 버젼이 같습니다.'+#13+'['+aFI.Version+']'+#13+'전송 하시겠습니까?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Write_ListBox_DownLoadInfo('현재 펌웨어 버젼:'+Edit_Ver.Text);
        Write_ListBox_DownLoadInfo('전송할 펌웨어 버젼:'+aFI.Version);
        DownloadFMM(Edit_CurrentID.Text + ComboBox_IDNO.Text);
      end;
    end else
    begin
      Write_ListBox_DownLoadInfo('현재 펌웨어 버젼:'+Edit_Ver.Text);
      Write_ListBox_DownLoadInfo('전송할 펌웨어 버젼:'+aFI.Version);
      DownloadFMM(Edit_CurrentID.Text + ComboBox_IDNO.Text);
    end;
 end;

end;

procedure TMainForm.RzBitBtn21Click(Sender: TObject);
var
  aDeviceID:String;
  stData : String;
begin
//  if cb_Download.Checked then

  if FTPUSE then
  begin
    btn_ftpStopClick(btn_ftpStop1);
    Exit;
  end;

  BroadID := '05';

  if rdMode.ItemIndex = 0 then
  begin
    aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
    SendCancelRomUpDate(aDeviceID);
  end else if rdMode.ItemIndex = 1 then
  begin
    CancelDownload:= True;
    OffCount:=0;
    DownLoadList.Clear;
  end else if rdMode.ItemIndex = 2 then    //Main주관
  begin
    aDeviceID:= Edit_CurrentID.Text + '00';
    stData := 'BS' + BroadID + FillZeroNumber(0,7);
    SendPacket(aDeviceID,'*',stData,Sent_Ver);
  end else if rdMode.ItemIndex = 3 then   //Server주관
  begin
    aDeviceID:= Edit_CurrentID.Text + '00';
    stData := 'BI' + BroadID + FillZeroNumber(0,7);
    SendPacket(aDeviceID,'*',stData,Sent_Ver);
  end;
  IsDownLoad:= False;

  GroupBox23.Visible := False;
  IsFirmwareDownLoad := False;
  ProgressBar1.Position:= 0;
  BroadSleep_Timer.Enabled := False;

end;

procedure TMainForm.RzBitBtn22Click(Sender: TObject);
var
  st: string;
  I: Integer;
  DeviceID: String;
begin
{}
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  st:='0000';
  for I:= 0 to Group_AlarmDisplay.Items.Count-1 do
  begin
    if Group_AlarmDisplay.ItemChecked[I] then st[I+1]:= '1';
  end;

  RegUsedAlarmDisplay(DeviceID,st);

end;

procedure TMainForm.RzBitBtn23Click(Sender: TObject);
var
  DeviceID: String;
begin
{}
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckUsedAlarmDisplay(DeviceID);
end;

procedure TMainForm.RzBitBtn18Click(Sender: TObject);
var
  DeviceID: String;
begin
//  if RzSpinEdit4.IntValue < 3 then
  if IsDigit(cmb_DoorControlTime.Text) then
  begin
    if strtoint(cmb_DoorControlTime.Text) < 3 then
    begin
      if ComboBox_LockType.ItemIndex <> 7 then
      if Application.MessageBox('Door 제어 시간이 3초 이하인 경우 문제가 발생할 수 있습니다. 계속하시겠습니까?','주의',MB_OKCANCEL) = IDCANCEL then Exit;
    end;
  end else
  begin
    if Application.MessageBox('Door 제어 시간이 3초 이하인 경우 문제가 발생할 수 있습니다. 계속하시겠습니까?','주의',MB_OKCANCEL) = IDCANCEL then Exit;
  end;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegSysInfo2(DeviceID,IntToStr(gbDoorNo.ItemIndex+1));
  ClearSysInfo2;

end;

procedure TMainForm.RzBitBtn19Click(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  ClearSysInfo2;
  CheckSysInfo2(DeviceID);
end;

{출입통제/운영모드}
procedure TMainForm.Btn_NomalClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo.ItemIndex+1,'2','0' );
  //DoorModeChange(DeviceID,'0');

end;

{출입통제/개방모드}
procedure TMainForm.Btn_OpenClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo.ItemIndex+1,'2','1' );
  //DoorModeChange(DeviceID,'1');
end;

{POSI/NEGATIVE}
procedure TMainForm.Btn_PositiveClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo.ItemIndex+1,'1','0' );
  //DoorModeChange(DeviceID,'1');
end;

procedure TMainForm.Btn_NegativeClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo.ItemIndex+1,'1','1' );
  //DoorModeChange(DeviceID,'1');
end;
{Door Close}
procedure TMainForm.Btn_DoorOPenClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo.ItemIndex+1,'3','0' );
  //DoorModeChange(DeviceID,'1');
end;

{Door OPen}
procedure TMainForm.Btn_DoorCloseClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo.ItemIndex+1,'3','1' );
  //DoorModeChange(DeviceID,'1');
  //beep
end;

procedure TMainForm.WinsockPortWsAccept(Sender: TObject; Addr: TInAddr;
  var Accept: Boolean);
var
  ConnectedIP: string;
begin
  SockErroCode:= 0;
  //btn_Connect.Color:= $00F48D6A;
  //Btn_DisConnect.Color:= $00F0F4F4;

  ConnectedIP:= InttoStr(Ord(Addr.S_un_b.s_b1))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b2))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b3))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b4));

  if ConnectedIP = CB_IPList.Text then
  begin
    Panel_ActiveClinetCount.Caption:= ConnectedIP+ ' 접속';
    //Edit1.Text:= st;
    Accept := true;
    CheckID('0000000');
  end else
  begin
    Panel_ActiveClinetCount.Caption:= ConnectedIP+ ' 접속불허';
    //Edit1.Text:= ConnectedIP;
    Accept := False;
  end;


end;

procedure TMainForm.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  st: String;
  stWarning: String;
begin

  st:= (Sender as TRxDBGrid).Datasource.Dataset.FindField('Way').asString;
  stWarning:= copy((Sender as TRxDBGrid).Datasource.Dataset.FindField('Data').asString,1,2);
  if      st = 'RX' then  Background:= $00DDFFDD
  else if st = 'TX' then  Background:= $00E2EDFA
  else                    Background:= clWhite;
  if Highlight= True then
  begin
    Background:= clNavy;
    AFont.Color:= clWhite;
  end;
  if stWarning = 'Y:' then
  begin
    Background:= clYellow;
    AFont.Color:= clBlack;
  end;
end;

procedure TMainForm.DBISAMTable1EventTimeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:= FormatDatetime('hh":"nn":"ss":"zzz', Sender.ASDatetime);
end;


procedure TMainForm.Btn_RegDialInfoClick(Sender: TObject);
var
  DeviceID:String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegDialTime(DeviceID,StrtoInt(ComboBox1.Text),StrtoInt(ComboBox2.Text));
end;

procedure TMainForm.Btn_CheckDialInfoClick(Sender: TObject);
var
  DeviceID:String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckDialTime(DeviceID);
end;

procedure TMainForm.Btn_RegCalltimeClick(Sender: TObject);
var
  DeviceID:String;
begin
  RzSpinner2.Color:= ClWhite;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegCallTime(DeviceID,RzSpinner2.Value);
end;

procedure TMainForm.Btn_CheckCalltimeClick(Sender: TObject);
var
  DeviceID:String;
begin
  RzSpinner2.Color:= ClWhite;;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckCallTime(DeviceID);
end;


procedure TMainForm.Edit_Combo_Enter(Sender: TObject);
begin
  if Sender is TEdit then TEdit(Sender).Color:= clWhite
  else if Sender is TComboBox then TComboBox(Sender).Color:= clWHite
  else if Sender is TrzComboBox then TrzComboBox(Sender).Color:= clWhite;
end;


Procedure TMainForm.CD_DownLoad(aDevice: String;aCardNo:String;func:Char;aLength:integer = 10;bHex : Boolean = False);
var
  aData: String;
  I: Integer;
  xCardNo: String;
  RealCardNo: String;
  ValidDay: String;
  nLength: Integer;
  stYY,stMM,stDD:String;
  aRegCode,aCardAuth,aInOutMode : String;
  stCardType : string;
begin

  nLength:= Length(aCardNo);
  if nLength < aLength then
    aCardNo:= FillZeroStrNum(aCardNo,aLength);

  nLength:= Length(aCardNo);

  if nLength < (aLength + 6) then
  begin
    for I := 1  to (aLength + 6) - nLength do
    begin
      aCardNo:= aCardNo + '0';
    end;
  end;


  //SHowMessage(aCardNo);
  RealCardNo:= Copy(aCardNo,1,aLength);
  ValidDay:=   Copy(aCardNo,aLength + 1,6);
  //xCardNo:=  '00'+Dec2Hex64(StrtoInt64(RealCardNo),8);
  if Not bHex then    //Old 버젼이면
  begin
    xCardNo:=  '00'+EncodeCardNo(RealCardNo);
  end else
  begin
    xCardNo:= FillZeroNumber(aLength,2) +  RealCardNo;
  end;

  stYY := edYYYY.text;
  stMM := edMM.text;
  stDD := edDD.text;
  if (ck_YYMMDD.checked = False) or (stYY = '') then stYY := '0';
  if (ck_YYMMDD.checked = False) or (stMM = '') then stMM := '0';
  if (ck_YYMMDD.checked = False) or (stDD = '') then stDD := '0';

  aRegCode := inttostr(rdRegCode.itemindex);
  if rdCardAuth.itemindex > 0 then
    aCardAuth := inttostr(rdCardAuth.itemindex - 1)
  else aCardAuth := '2';
  aInOutMode := inttostr(rdInOutMode.itemindex);
  //순찰카드 추가
  if rg_tourCard.ItemIndex = 0 then stCardType := ' '
  else stCardType := 'V';

  aData:= '';
  aData:= func +
          //InttoStr(Send_MsgNo)+     // Message Count
          '0'+
          aRegCode+                      //등록코드(0:1,2   1:1번문,  2:2번문, 3:방범전용)
          ' '+                     //RecordCount #$20 #$20
          stCardType +
          '0'+                      //예비
          xCardNo+                  //카드번호
//          ValidDay+                 //유효기간
          FillZeroNumber(strtoint(stYY),2) +
          FillZeroNumber(strtoint(stMM),2) +
          FillZeroNumber(strtoint(stDD),2) + //유효기간
          '0'+                      //등록 결과
          aCardAuth+                      //카드권한(0:출입전용,1:방범전용,2:방범+출입)
          aInOutMode;                      //타입패턴

  //SHowMessage(aData);
  SendPacket(aDevice,'c',aData,Sent_Ver);
end;

Procedure TMainForm.CardAllDownLoad(aFunc:Char);
var
  I: Integer;
  DeviceID: String;
  aCardNo: String;
  nCardLength : integer;
begin
  // aFunc:L등록,N삭제,M조회
  if Memo_CardNo.Lines.Count < 1 then
  begin
    ShowMessage('등록할 카드번호/출입번호 가 없습니다.');
    Exit;
  end;

  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  for I:= 0 to Memo_CardNo.Lines.Count -1 do
  begin
    if bCardDownLoadStop then break;
    
    aCardNo:= Trim(Memo_CardNo.Lines[I]);

    if chk_CmdX.Checked then CD_XDownLoad(DeviceID,aCardNo,aFunc)
    else
    begin
      nCardLength := Length(aCardNo);
      if rg_CardType.ItemIndex = 1 then CD_DownLoad(DeviceID,aCardNo,aFunc,nCardLength,True)
      else CD_DownLoad(DeviceID,aCardNo,aFunc);
    end;
//    CD_DownLoad(DeviceID,aCardNo,aFunc);
    if chk_SendTime.checked then Sleep(strtoint(ed_SendTime.Text))
    else Sleep(100);
    Application.ProcessMessages;
  end;
  //CD_DownLoad(DeviceID,'0000000000',aFunc);
end;

{카드번호 등록}
procedure TMainForm.Btn_RegCardNoClick(Sender: TObject);
var
  I: Integer;
begin
  if Memo_CardNo.Lines.Count < 1 then
  begin
    ShowMessage('등록할 카드번호/출입번호 가 없습니다.');
    Exit;
  end;
  Memo2.Clear;
  bCardDownLoadStop := False;
  if chk_FastSave.Checked then CardAllDownLoad('F')
  else
  CardAllDownLoad('L');

end;

procedure TMainForm.Btn_DelCardNoClick(Sender: TObject);
var
  I: Integer;
begin
  if Memo_CardNo.Lines.Count < 1 then
  begin
    ShowMessage('삭제할 카드번호/출입번호 가 없습니다.');
    Exit;
  end;
  Memo2.Clear;
  CardAllDownLoad('N');
end;


procedure TMainForm.Btn_DelEventLogClick(Sender: TObject);
begin
  LMDListBox1.Items.Clear;
  CountCardReadData:= 1;

end;












procedure TMainForm.RzBitBtn25Click(Sender: TObject);
begin

  if RzBitBtn25.Caption = '시작' then
  begin
    RzBitBtn25.Caption := '정지';
    S1.Caption := '정지(&S)';
    RzBitBtn25.Down := True;
    OnMoni:= True;
  end
  else
  begin
    RzBitBtn25.Caption := '시작';
    S1.Caption := '시작(&S)';
    RzBitBtn25.Down := False;
    OnMoni:= False;
  end;
end;

procedure TMainForm.RzBitBtn27Click(Sender: TObject);
var
  aFile: String;
begin
  RzSaveDialog1.InitialDir:= ExtractFileDir(Application.ExeName);
  if RzSaveDialog1.Execute then
  begin
    aFile:= RzSaveDialog1.FileName;
    DBISAMTable1.ExportTable(aFile,',');
  end;
end;

procedure TMainForm.ComboBox1Click(Sender: TObject);
begin
  if Sender is TCombobox then
    TCombobox(Sender).Color:= clWhite
  else if Sender is TRzSpinner then
    TRzSpinner(Sender).Color:= clWhite;

end;

procedure TMainForm.RzBitBtn28Click(Sender: TObject);
begin

  if RzPageControl1.ActivePage = TabSheet1 then
  begin
    with DBISAMTable1 do
    begin
      Append;
      FindField('EventTime').asString:= '';
      FindField('IP').asString:= '';
      FindField('DeviceID').asString:= '';
      FindField('DeviceNo').asString:= '';
      FindField('cmd').asString:= '';
      FindField('Data').asString:= '';
      FindField('FullData').asString:='';
      FindField('Way').asString:= '';
      try
        Post;
      except
        Exit;
      end;
    end;
  end else
  begin
    RichEdit1.Lines.Add('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<<<'+#$0D+#$0A);
    //RichEdit1.Lines.Add(#13);
  end;
end;

procedure TMainForm.RzGroup1Open(Sender: TObject);
var
  I: Integer;
begin
(*
  for I:= 0 to RzGroupBar1.GroupCount -1 do
  begin
    if TRzGroup(Sender) <> TRzGroup(RzGroupBar1.Groups[i]) then
       TRzGroup(RzGroupBar1.Groups[i]).Close;
  end;
  *)
end;

procedure TMainForm.rg_ConTypeChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
{    if NewIndex = 0 then
    begin
      //LAN
      CB_SerialComm.Enabled:= False;
      CB_SerialBoard.Enabled := False;
      RadioGroup_Mode.Enabled:= True;
      CB_IPList.Enabled:= True;
      Edit2.Enabled:= True;
    end else
    begin
      //Serial
      CB_SerialComm.Enabled:= True;
      CB_SerialBoard.Enabled := True;
      RadioGroup_Mode.Enabled:= False;
      CB_IPList.Enabled:= False;
      Edit2.Enabled:= False;
    end;
}
end;
{랜모둘 데이터 설정}
procedure TMainForm.RzBitBtn32Click(Sender: TObject);
var
  I: Integer;
  No: Integer;
  st,st2: String;
  DataStr: String;
  aDeviceID: String;
  FHeader:         String[2];
  FMacAddress:    String[12];
  FMode:          String[2];
  FIPAddress:     String[8];
  FSubnet:        String[8];
  FGateway:       String[8];
  FClientPort:    String[4];
  FServerIP:      String[8];
  FServerPort:    String[4];
  FSerial_Baud:   String[2];
  FSerial_data:   String[2];
  FSerial_Parity: String[2];
  FSerial_stop:   String[2];
  FSerial_flow:   String[2];
  FDelimiterChar: String[2];
  FDelimiterSize: String[4];
  FDelimitertime: String[4];
  FDelimiterIdle: String[4];
  FDebugMode:     String[2];
  FROMVer:        String[4];
  FOnDHCP:        String[2];
  FReserve:       String[6];

  PastTime : dword;
begin
  bWizeNetLanRecv := False;
  if rg_ConType.ItemIndex = 1 then
  begin

    WizNetRegMode:= True;
    WizNetRcvACK:= False;
    //1.Header
    FHeader:= 'AA';
    //2.MAC Address 지정안함
    FMacAddress:='000000000000';
    //3.Mode (Server mode: 02, Client mode: 00)
    //if Checkbox_Client.Checked then FMode:= '00'
    //else                            FMode:= '01';
    if RadioModeClient.Checked then FMode:= '00'
    else if RadioModeServer.Checked then FMode:= '02'
    else if RadioModeMixed.Checked then  FMode:= '01';



    // 4.IP address
    st2:= '';
    if Edit_LocalIP.Text = '' then Edit_LocalIP.Text:= '0.0.0.0';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_LocalIP.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    FIPAddress:= ToHexStrNoSpace(st2);

    // 5.Subnet mask
    st2:= '';
    if Edit_Sunnet.Text = '' then Edit_Sunnet.Text:= '0.0.0.0';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_Sunnet.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    FSubnet:= ToHexStrNoSpace(st2);

    // 6.Gateway address
    st2:= '';
    if Edit_Gateway.Text = '' then Edit_Gateway.Text:= '0.0.0.0';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_Gateway.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    FGateway:= ToHexStrNoSpace(st2);

    //7.Port number (Client)
    st2:= '';
    if Edit_LocalPort.Text = '' then Edit_LocalPort.Text:= '0';
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_LocalPort.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    FClientPort:= ToHexStrNoSpace(st2);

    //8. Server IP address
    st2:= '';
    if Edit_ServerIp.Text = '' then Edit_ServerIp.Text:= '0.0.0.0';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_ServerIp.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    FServerIP:= ToHexStrNoSpace(st2);

    //9.  Port number (Server)
    st2:= '';
    if Edit_Serverport.Text = '' then Edit_Serverport.Text:= '0';
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Serverport.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    FServerPort:= ToHexStrNoSpace(st2);

    //10. Serial speed (bps)
    case ComboBox_Boad.ItemIndex of
      0: FSerial_Baud:= 'F4'; //9600           F4
      1: FSerial_Baud:= 'FA'; //19200          FA
      2: FSerial_Baud:= 'FD'; //38400 Default  FD
      3: FSerial_Baud:= 'FE'; //57600          FE
      4: FSerial_Baud:= 'FF'; //115200         FF
      else FSerial_Baud:= 'FD';
    end;

    //11. Serial data size (08: 8 bit), (07: 7 bit)
    case ComboBox_Databit.ItemIndex of
        0: FSerial_data:= '07';
        1: FSerial_data:= '08';
        else FSerial_data:= '08';
    end;

    //12. Parity (00: No), (01: Odd), (02: Even)
    case ComboBox_Parity.ItemIndex of
      0: FSerial_Parity:= '00'; //None
      1: FSerial_Parity:= '01'; //Odd
      2: FSerial_Parity:= '02'; //Even
      else FSerial_Parity:= '00';
    end;

    //13. Stop bit
    FSerial_stop:= '01';

    //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)
    case ComboBox_Flow.ItemIndex  of
      0: FSerial_flow:= '00';
      1: FSerial_flow:= '01';
      2: FSerial_flow:= '02';
    end;

    //15. Delimiter char
    if Edit_Char.Text ='' then Edit_Char.Text:= '00';
    FDelimiterChar:= Edit_Char.Text;

    //16.Delimiter size
    st2:= '';
    if Edit_Size.Text ='' then Edit_Size.Text:= '0';
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Size.Text),2);
    st:=FillZeroStrNum(st,4);
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    FDelimiterSize:= ToHexStrNoSpace(st2);

    //17. Delimiter time
    if Edit_Time.Text = '' then Edit_Time.Text:= '20';
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Time.Text),2);
    st:=FillZeroStrNum(st,4);
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    FDelimitertime:= ToHexStrNoSpace(st2);

    //18.Delimiter idle time
    if Edit_Idle.Text = '' then Edit_Idle.Text:= '0';
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Idle.Text),2);
    st:=FillZeroStrNum(st,4);
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    FDelimiterIdle:= ToHexStrNoSpace(st2);

    //19. Debug code (00: ON), (01: OFF)
    if Checkbox_Debugmode.Checked then FDebugMode:= '00'
    else                               FDebugMode:= '01';

    //20.Software major version
    FROMVer:='0000';

    // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)
    if Checkbox_DHCP.Checked then FOnDHCP:= '01'
    else                          FOnDHCP:= '00';

    //22.Reserved for future use
    FReserve:= '000000';

    DataStr:= FHeader+
              FMacAddress+
              FMode+
              FIPAddress+
              FSubnet+
              FGateway+
              FClientPort+
              FServerIP+
              FServerPort+
              FSerial_Baud+
              FSerial_data+
              FSerial_Parity+
              FSerial_stop+
              FSerial_flow+
              FDelimiterChar+
              FDelimiterSize+
              FDelimitertime+
              FDelimiterIdle+
              FDebugMode+
              FROMVer+
              FOnDHCP+
              FReserve;
    WiznetData:= DataStr;

    aDeviceID:= Edit_DeviceID.Text;
    {
    SHowMessage(FHeader+#13+
                FMacAddress+#13+
                FMode+#13+
                FIPAddress+#13+
                FSubnet+#13+
                FGateway+#13+
                FClientPort+#13+
                FServerIP+#13+
                FServerPort+#13+
                FSerial_Baud+#13+
                FSerial_data+#13+
                FSerial_Parity+#13+
                FSerial_stop+#13+
                FSerial_flow+#13+
                FDelimiterChar+#13+
                FDelimiterSize+#13+
                FDelimitertime+#13+
                FDelimiterIdle+#13+
                FDebugMode+#13+
                FROMVer+#13+
                FOnDHCP+#13+
                FReserve+#13+
              '길이:'+InttoStr(Length(DataStr)));
    }
    if  Length(aDeviceID) < 9 then
    begin
      aDeviceID:= '000000000';
    end;
    SendPacket(aDeviceID,'I','NW00'+DataStr,Sent_Ver);
    //ClearWiznetInfo;
    Off_Timer.Enabled:= True;
    LMDSimpleLabel1.Caption:= '랜정보 설정중 입니다. 잠시만 기다려 주십시오';
    LMDCaptionPanel1.visible := True;
    LMDSimpleLabel1.Twinkle:= True;
    ProgressBar3.Position:= 0;
  end else
  begin
    if Not chk_ZeronType.Checked then
    begin
      wiznetData[1]:='S';
      wiznetData[2]:='E';
      wiznetData[3]:='T';
      wiznetData[4]:='T';
    end else
    begin
      wiznetData[1]:='L';
      wiznetData[2]:='N';
      wiznetData[3]:='S';
      wiznetData[4]:='V';
    end;

    {LocalIP}
    st2:='';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_LocalIP.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    for I:= 1 to 4 do
    begin
      wiznetData[11+I]:= st2[I];
    end;

   {Local subnet}
   st2:='';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_Sunnet.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    for I:= 1 to 4 do
    begin
      wiznetData[15+I]:= st2[I];
    end;

   {Local Gateway}
   st2:='';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_Gateway.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    for I:= 1 to 4 do
    begin
      wiznetData[19+I]:= st2[I];
    end;

    {Local Port}
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_LocalPort.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[24]:= st2[1];
    wiznetData[25]:= st2[2];

   {Server IP}
   st2:='';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_ServerIp.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    for I:= 1 to 4 do
    begin
      wiznetData[25+I]:= st2[I];
    end;

    {Server Port}
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Serverport.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[30]:= st2[1];
    wiznetData[31]:= st2[2];

    {Mode}
    //if Checkbox_Client.Checked then wiznetData[11] := #$00
    //else                            wiznetData[11] := #$01;

    if RadioModeClient.Checked then wiznetData[11] := #$00
    else if RadioModeServer.Checked then wiznetData[11] := #$02
    else if RadioModeMixed.Checked then  wiznetData[11] := #$01;



    {Board}
    case ComboBox_Boad.ItemIndex of
      3: wiznetData[32]:= #$F4; //9600
      4: wiznetData[32]:= #$FA; //19200
      5: wiznetData[32]:= #$FD; //38400
      6: wiznetData[32]:= #$FE; //57600
      7: wiznetData[32]:= #$FF; //115200
    else wiznetData[32]:= #$FD; //38400
    end;

    {DataBit}
    case ComboBox_Databit.ItemIndex of
      0: wiznetData[33]:= #$07;
      1: wiznetData[33]:= #$08;
    end;

    {Parity}
    case ComboBox_Parity.ItemIndex of
      0: wiznetData[34]:= #$00;
      1: wiznetData[34]:= #$01;
      2: wiznetData[34]:= #$02;
    end;

    {Stop Bit}
    wiznetData[35]:= #$01;

    {Flow}
    case ComboBox_Flow.ItemIndex of
      0: wiznetData[36]:= #$00;
      1: wiznetData[36]:= #$01;
      2: wiznetData[36]:= #$02;
    end;

    {Delimeter Time}
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Time.Text),2);
    //if Length(st) < 4 then st:= '0'+st;
    st:=FillZeroStrNum(st,4);
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[40]:= st2[1];
    wiznetData[41]:= st2[2];

    {Delimeter Size}
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Size.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[38]:= st2[1];
    wiznetData[39]:= st2[2];

    {Delimeter Char}
    st:= Edit_Char.Text;
    wiznetData[37]:= Char(Hex2Dec(st));

    {Delimeter IdleTIme}
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Idle.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[42]:= st2[1];
    wiznetData[43]:= st2[2];
    {Debug Mode}
    if Checkbox_Debugmode.Checked then  wiznetData[44]:= #$00
    else                                wiznetData[44] := #$01;

    if Checkbox_DHCP.Checked then wiznetData[47]:= #$01
    else                          wiznetData[47]:= #$00;


    if chk_Direct.Checked then
    begin
      {ClientSocket1.Active:= False;
      ClientSocket1.Host:= CB_IPList.Text;
      if bWizNetModule then ClientSocket1.Port := TCPCLIENTPORT
      else ClientSocket1.Port := TCPCLIENTPORT + 60000;
      ClientSocket1.Active:= True;
      ClientSocket1.Socket.SendText(wiznetData);
      ClearLanInfo;  }
      if Not L_bDirectSearch then
      begin
        SHowMessage('랜모듈 정보 읽기를 해주세요');
        Exit;
      end;
      if ClientSocket1.Active then
      begin
        OnWritewiznet:= True;
        ClientSocket1.Socket.SendText(wiznetData);
        ClearLanInfo;
      end else
      begin
        ClientSocket1.Host:= CB_IPList.Text;
        if bWizNetModule then
        begin
          if G_nProgramType = 1 then ClientSocket1.Port := TCPCLIENTPORT + 2000
          else ClientSocket1.Port := TCPCLIENTPORT;

        end else ClientSocket1.Port := TCPCLIENTPORT + 60000;
        ClientSocket1.Active:= True;

        PastTime := GetTickCount + L_nDirectConnectWaitTime;  //Connect 될때까지 대기하자
        while Not L_bDirectClientConnect do
        begin
          Application.ProcessMessages;
          if GetTickCount > PastTime then Exit;  //300밀리동안 응답 없으면 실패로 처리함
        end;
        if L_bDirectClientConnect then
        begin
          ClientSocket1.Socket.SendText(wiznetData)
        end;

        //ClientSocket1.Socket.SendText(wiznetData);
        ClearLanInfo;
        //SHowMessage('랜모듈 정보 읽기를 해주세요');
        //Exit;
      end;
      L_bDirectSearch := False;
    end else
    begin
      IdUDPServer1.Active := False;
      IdUDPServer2.Active := False;
      if bWizNetModule then
      begin
        //IdUDPClient1.Broadcast(wiznetData,BROADCLIENTPORT);
        if G_nProgramType = 1 then IdUDPServer1.Broadcast(wiznetData,BROADCLIENTPORT + 2000)
        else IdUDPServer1.Broadcast(wiznetData,BROADCLIENTPORT);
        if G_nProgramType = 1 then IdUDPServer1.DefaultPort := BROADSERVERPORT + 2000
        else
          IdUDPServer1.DefaultPort := BROADSERVERPORT;
        IdUDPServer1.Active := True;
      end else
      begin
        IdUDPClient1.Broadcast(wiznetData,BROADCLIENTPORT + 60000);
        IdUDPServer2.DefaultPort := BROADSERVERPORT + 60000;
        IdUDPServer2.Active := True;
      end;
      sg_WiznetList.Cells[1,sg_WiznetList.Row] := wiznetData;
//      ClearLanInfo;
      fmPrograss:= TfmPrograss.Create(Self);
      fmPrograss.L_bSetting := True;
      fmPrograss.ShowModal;
      fmPrograss.Free;
    end;


  end;

end;



procedure TMainForm.btnCheckLanClick(Sender: TObject);
var
  aDeviceID: String;
  nRow,nCol : integer;
  PastTime : dword;
begin
{  if Not chk_Direct.Checked and
     chk_FixMac.Checked then
  begin

    sg_WiznetList.RowCount := 2;
    sg_WiznetList.Cells[0,1] := '';
    sg_WiznetList.Cells[0,0] := 'Broad List';
  end;}
  bWizeNetLanRecv := False;
  with sg_WiznetList do
  begin
    for nRow := 1 to RowCount - 1 do
    begin
      for nCol := 0 to ColCount - 1 do
      begin
        Cells[nCol,nRow] := '';
      end;
    end;
    RowCount := 2;
    Application.ProcessMessages;
  end;
  if sender = btnCheckLan then
  begin
    bWizNetModule := True;
    rd_wiznetLan.Checked := True;
  end else if sender = btnZeronCheckLan then
  begin
    bWizNetModule := False;
    rd_ZeronLan.Checked := True;
  end;
  wiznetData:= '';
  OnWritewiznet:= False;
  //OnWritewiznet := True;
  if rg_ConType.ItemIndex <> 0 then
  begin
    WizNetRegMode:= False;
    WizNetRcvACK:= False;
    aDeviceID:= Edit_DeviceID.Text;
    if  Length(aDeviceID) < 9 then
    begin
      aDeviceID:= '000000000';
    end;
    SendPacket(aDeviceID,'Q','NW00',Sent_Ver);
    //ClearWiznetInfo;
    Off_Timer.Enabled:= True;
    LMDSimpleLabel1.Caption:= '랜정보 조회중 입니다. 잠시만 기다려 주십시오';
    LMDCaptionPanel1.visible := True;
    LMDSimpleLabel1.Twinkle:= True;
    ProgressBar3.Position:= 0;
 end else
 begin
   ClearLanInfo;
   if chk_Direct.Checked then
   begin
    ClientSocket1.Active:= False;
    ClientSocket1.Host:= CB_IPList.Text;
    if bWizNetModule then
    begin
      if G_nProgramType = 1 then ClientSocket1.Port := TCPCLIENTPORT + 2000
      else ClientSocket1.Port := TCPCLIENTPORT;
    end else ClientSocket1.Port := TCPCLIENTPORT + 60000;
    ClientSocket1.Active:= True;

    PastTime := GetTickCount + L_nDirectConnectWaitTime;  //Connect 될때까지 대기하자
    while Not L_bDirectClientConnect do
    begin
      Application.ProcessMessages;
      if GetTickCount > PastTime then Exit;  //300밀리동안 응답 없으면 실패로 처리함
    end;
    if L_bDirectClientConnect then
    begin
      ClientSocket1.Socket.SendText('FIND')
    end;

    WiznetTimer.Enabled:= True;
   end else
   begin
      IdUDPServer1.Active := False;
      IdUDPServer2.Active := False;

      if bWizNetModule then
      begin
        //IdUDPClient1.Broadcast('FIND',BROADCLIENTPORT);
        {IdUDPClient1.Host := '255.255.255.255';
        IdUDPClient1.Port := BROADCLIENTPORT;
        IdUDPClient1.Active := True;
        IdUDPClient1.Send('FIND');  }
        if G_nProgramType = 1 then IdUDPServer1.DefaultPort := BROADSERVERPORT + 2000
        else IdUDPServer1.DefaultPort := BROADSERVERPORT;
        if G_nProgramType = 1 then IdUDPServer1.Broadcast('FIND',BROADCLIENTPORT + 2000)
        else IdUDPServer1.Broadcast('FIND',BROADCLIENTPORT);
        IdUDPServer1.Active := True;
      end else
      begin
        //서버 포트를 다르게 띄워서 사용 하려고 하다가 그냥 명령어만 변경해서 사용으로 바꿈으로 미사용 되는 로직임
        IdUDPClient1.Broadcast('FIND',BROADCLIENTPORT + 60000);
        IdUDPServer2.DefaultPort := BROADSERVERPORT + 60000;
        IdUDPServer2.Active := True;
      end;
      {IdUDPClient1.Broadcast('FIND',BROADCLIENTPORT);
      IdUDPServer1.DefaultPort := BROADSERVERPORT;
      IdUDPServer1.Active := True;
      IdUDPServer2.DefaultPort := BROADSERVERPORT + 60000;
      IdUDPServer2.Active := True;}
      fmPrograss:= TfmPrograss.Create(Self);
      fmPrograss.Showmodal;
      fmPrograss.Free;

   end;
   //WiznetTimer.Enabled:= True;
 end;
end;

procedure TMainForm.RzBitBtn30Click(Sender: TObject);
begin

  if MessageDlg('현재 설정된 값을 기본값으로 지정 하시겠습니까?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    LMDIniCtrl1.WriteString('Wiznet','LocalIP',Edit_LocalIP.Text);
    LMDIniCtrl1.WriteString('Wiznet','Subnet',Edit_Sunnet.Text);
    LMDIniCtrl1.WriteString('Wiznet','Gateway',Edit_Gateway.Text);
    LMDIniCtrl1.WriteString('Wiznet','Localport',Edit_LocalPort.Text);
    LMDIniCtrl1.WriteString('Wiznet','Serverip',Edit_ServerIp.Text);
    LMDIniCtrl1.WriteString('Wiznet','Serverport',Edit_Serverport.Text);
    LMDIniCtrl1.WriteString('Wiznet','DTime',Edit_Time.Text);
    LMDIniCtrl1.WriteString('Wiznet','DSize',Edit_Size.Text);
    LMDIniCtrl1.WriteString('Wiznet','DChar',Edit_Char.Text);
    LMDIniCtrl1.WriteString('Wiznet','DIdle',Edit_Idle.Text);
    LMDIniCtrl1.WriteInteger('Wiznet','Boad',ComboBox_Boad.ItemIndex);
    LMDIniCtrl1.WriteInteger('Wiznet','Databit',ComboBox_Databit.ItemIndex);
    LMDIniCtrl1.WriteInteger('Wiznet','Parity',ComboBox_Parity.ItemIndex);
    LMDIniCtrl1.WriteInteger('Wiznet','Stopbit',ComboBox_Stopbit.ItemIndex);
    LMDIniCtrl1.WriteInteger('Wiznet','Flow',ComboBox_Flow.ItemIndex);
    LMDIniCtrl1.WriteBool('Wiznet','ClinetOnly',Checkbox_Client.Checked);
    LMDIniCtrl1.WriteBool('Wiznet','Debugmode',Checkbox_Debugmode.Checked);
    LMDIniCtrl1.WriteBool('Wiznet','DHCP',Checkbox_DHCP.Checked);
  end;

end;

procedure TMainForm.RzBitBtn31Click(Sender: TObject);
var
  aBool: Boolean;
begin
  Edit_LocalIP.Text:=     LMDIniCtrl1.ReadString('Wiznet','LocalIP','0.0.0.0');
  Edit_Sunnet.Text:=      LMDIniCtrl1.ReadString('Wiznet','Subnet','0.0.0.0');
  Edit_Gateway.Text:=     LMDIniCtrl1.ReadString('Wiznet','Gateway','0.0.0.0');
  Edit_LocalPort.Text:=   LMDIniCtrl1.ReadString('Wiznet','Localport','0');
  Edit_ServerIp.Text:=    LMDIniCtrl1.ReadString('Wiznet','Serverip','0.0.0.0');
  Edit_Serverport.Text:=  LMDIniCtrl1.ReadString('Wiznet','Serverport','0');
  Edit_Time.Text:=        LMDIniCtrl1.ReadString('Wiznet','DTime','0');
  Edit_Size.Text:=        LMDIniCtrl1.ReadString('Wiznet','DSize','0');
  Edit_Char.Text:=        LMDIniCtrl1.ReadString('Wiznet','DChar','00');
  Edit_Idle.Text:=        LMDIniCtrl1.ReadString('Wiznet','DIdle','0');
  ComboBox_Boad.ItemIndex:=     LMDIniCtrl1.ReadInteger('Wiznet','Boad',2);
  ComboBox_Databit.ItemIndex:=  LMDIniCtrl1.ReadInteger('Wiznet','Databit',1);
  ComboBox_Parity.ItemIndex:=   LMDIniCtrl1.ReadInteger('Wiznet','Parity',0);
  ComboBox_Stopbit.ItemIndex:=  LMDIniCtrl1.ReadInteger('Wiznet','Stopbit',0);
  ComboBox_Flow.ItemIndex:=     LMDIniCtrl1.ReadInteger('Wiznet','Flow',0);
  aBool:=                       LMDIniCtrl1.ReadBool('Wiznet','ClinetOnly',True);
  if aBool then  RadioModeClient.Checked:= True
  else           RadioModeServer.Checked:= True;

  Checkbox_Debugmode.Checked:=  LMDIniCtrl1.ReadBool('Wiznet','Debugmode',False);
  Checkbox_DHCP.Checked:=       LMDIniCtrl1.ReadBool('Wiznet','DHCP',False);


end;

procedure TMainForm.LMDCaptionPanel1CloseBtnClick(Sender: TObject;
  var Cancel: Boolean);
begin
  //LMDCaptionPanel1.visible := False;
  LMDSimpleLabel1.Twinkle:= False;
  Off_Timer.Enabled:= False;
  SHowMessage('기기 설정을 취소 했습니다.');
end;

procedure TMainForm.edRegTelNoButtonClick(Sender: TObject);
var
  M_No: Integer;
  T_No: String;
  DeviceID: String;
begin
{}
  M_No:= TRzButtonEdit(Sender).Tag;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  T_No:= TRzButtonEdit(Sender).Text;
  if T_No = '' then T_No:= '1234567890';
  RegTellNo(DeviceID,M_No,T_No);

end;

procedure TMainForm.edTelNoButtonClick(Sender: TObject);
var
  DeviceID: String;
  aNo: Integer;
begin
  aNo:= TRzButtonEdit(Sender).Tag;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckTellNo(DeviceID, aNo );
  TRzButtonEdit(Sender).Text:= '';

end;

procedure TMainForm.cbVoiceDetectClick(Sender: TObject);
begin
  cbVoiceDetect.Color:= clBtnFace;
  if cbVoiceDetect.Checked then RzSpinner3.Enabled:= True
  else                          RzSpinner3.Enabled:= False;
end;

{보이스 감지 시간 조회}
procedure TMainForm.CheckVoiceTime(DeviceID: String);
var
  aDeviceID: String;
begin
  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(aDeviceID,'Q','VC00',Sent_Ver);
end;

{보이스 감지시간}
//0:사용 안함
//구간 5 ~99초
procedure TMainForm.RcvVoiceTime(aPacketData: String);
var
  st: string;
  aTime: Integer;
begin

  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= copy(aPacketData,G_nIDLength + 15,2);
  aTime:= StrtoInt(st);
  if aTime < 1 then
  begin
    cbVoiceDetect.Color:= clBtnFace;
    cbVoiceDetect.Checked:= False;
    RzSpinner3.Enabled:= False;
  end else
  begin
    RzSpinner3.Color:= ClYellow;
    cbVoiceDetect.Checked:= True;
    RzSpinner3.Enabled:= True;
    RzSpinner3.Value:= aTime;
  end;
end;

{보이스 감지 사간 등록}
procedure TMainForm.RegVoiceTime(aDeviceID: String; aTime: Integer);
var
  Timestr: string;
begin
  TimeStr:= FillZeroNumber(aTime,2);
  SendPacket(aDeviceID,'I','VC00'+TimeStr,Sent_Ver);
end;

procedure TMainForm.btnRegVoicetimeClick(Sender: TObject);
var
  DeviceID:String;
  aTime: Integer;
begin
  RzSpinner3.Color:= ClWhite;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if cbVoiceDetect.Checked then aTime:= RzSpinner3.Value
  else                          aTime:= 0;

  RegVoiceTime(DeviceID,aTime);
end;

procedure TMainForm.btnCheckVoicetimeClick(Sender: TObject);
var
  DeviceID:String;
begin
  RzSpinner3.Color:= ClWhite;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckVoiceTime(DeviceID);
end;

procedure TMainForm.RzButton1Click(Sender: TObject);
begin
  (*
  if RzRadioGroup1.ItemIndex = 0 then
  begin
    SHowMessage('연결 방식을 RS-232로 바꾸세요');
    Exit;
  end;
  Notebook1.PageIndex:= 10;
  *)

  if rg_ConType.ItemIndex <> 0 then ClientSocket1.Active:= False;
  Notebook1.PageIndex:= 10;


end;

procedure TMainForm.LMDListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  st: string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    st:= LMDListBox1.ItemPart(LMDListBox1.ItemIndex,10);
    ClipBoard.SetTextBuf(PChar(st));
  end;
end;


procedure TMainForm.Btn_RegbroadcasttimeClick(Sender: TObject);
var
  DeviceID:String;
begin
  RzSpinner4.Color:= ClWhite;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegbroadcastTime(DeviceID,RzSpinner4.Value);
end;

procedure TMainForm.Btn_CheckbroadcasttimeClick(Sender: TObject);
var
  DeviceID:String;
begin
  RzSpinner2.Color:= ClWhite;;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckbroadcastTime(DeviceID);
end;



procedure TMainForm.Button2Click(Sender: TObject);
var
  M_No: Integer;
  T_No: String;
  DeviceID: String;
begin

  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  for M_No:= 0 to 9 do
  begin
    T_No:= '123450'+InttoStr(M_No);
    RegTellNo(DeviceID,M_No,T_No);
    Delay(200);
  end;



end;

procedure TMainForm.RzButtonEdit100ButtonClick(Sender: TObject);
var
  st: string;
  iFileLength: Integer;
  iBytesRead: Integer;
  iFileHandle: Integer;
begin

  RzOpenDialog1.Title:= '펌웨어 설정 파일 찾기';
  RzOpenDialog1.DefaultExt:= 'ini';
  RzOpenDialog1.Filter := 'INI files (*.ini)|*.INI';
  if RzOpenDialog1.Execute then
  begin
    st:= RzOpenDialog1.FileName;
    RzButtonEdit1.Text:= st;
    LMDIniCtrl2.IniFile:= st;
    LoadINI_firmwareInfo;
    st:= aFI.Version + #13+
         aFI.FMM     + #13+
         aFI.FSC     + #13+
         aFI.FWFN    + #13+
         aFI.FDFN;
    ROM_FlashWrite.Clear;
    ROM_FlashWrite.LoadFromFile(aFI.FWFN);
    ROM_FlashData.Clear;
    ROM_FlashData.LoadFromFile(aFI.FDFN);
    //여기서 첫번째 파일을 읽어 들이자
    iFileHandle := FileOpen(aFI.FWFN, fmOpenRead);
    iFileLength := FileSeek(iFileHandle,0,2);
    FileSeek(iFileHandle,0,0);

    ROM_BineryFlashWrite := nil;
    ROM_BineryFlashWrite := PChar(AllocMem(iFileLength + 1));
    iBytesRead := FileRead(iFileHandle, ROM_BineryFlashWrite^, iFileLength);
    //여기서 두번째 파일을 읽어 들이자
    iFileHandle := FileOpen(aFI.FDFN, fmOpenRead);
    iFileLength := FileSeek(iFileHandle,0,2);
    FileSeek(iFileHandle,0,0);

    ROM_BineryFlashData := nil;
    ROM_BineryFlashData := PChar(AllocMem(iFileLength + 1));
    iBytesRead := FileRead(iFileHandle, ROM_BineryFlashData^, iFileLength);

    FileClose(iFileHandle);
  end;
end;

function TMainForm.CheckRomVer: Boolean;
var
  st: string;
begin
  st:= Edit_Ver.Text;
  if pos(aFI.Version, st) > 0 then Result:= True
  else                             Result:= False;
end;

{다운로드 시작시간}
procedure TMainForm.SendFSC(aDeviceID :string);
var
  CMD: string;
  st,stAdd: string;
  aLength: Integer;
  aTime: TDatetime;
  aData: String;
  i : integer;
begin

  Delete(aFI.FSC,9,18);
  if RzRadioGroup2.ItemIndex = 0 then   // 즉시 다운로드
  begin
    aFI.FSC:= aFI.FSC +#$20+'00/00/00 00:00:00';
  end else                              // 예약 다운로드
  begin
    RzDateTimePicker2.Date:= RzDateTimePicker1.Date;
    aTime:= RzDateTimePicker2.DateTime;
    st:= FormatDatetime('yy"/"mm"/"dd" "hh":"nn":"ss',aTime);

    aFI.FSC:= aFI.FSC + #$20 + st;
  end;
  //2007 10 12 변경
  st:='1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
  for I:= 1 to Group_BroadDownLoad.Items.Count-1 do
  begin
    if Group_BroadDownLoad.ItemChecked[I] then st[I+1]:= '1';
  end;

  stAdd:= ed_DeviceCode.Text + ' ' + FillZeroNumber(strtoint(ed_SendSize.Text),4) ;
  stAdd:= stAdd + ' ' + st;

  CMD:= 'FX'+aFI.CMDCODE;
  if chk_BinDown.Checked then
  begin
    aData:= CMD + aFI.FSC + ' ' + stAdd;
  end else
  begin
    aData:= CMD + aFI.FSC ;
  end;

//  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(aDeviceID,'F', aData,Sent_Ver);
  Write_ListBox_DownLoadInfo('펌웨어 시작 시간 전송시작');
end;


procedure TMainForm.Write_ListBox_DownLoadInfo(aData: String);
var
  st: string;
begin
  st:= FormatDatetime('hh":"nn":"ss',Now) +'  '+aData;
  ListBox_DownLoadInfo.Add(st);
  ListBox_DownLoadInfo.ItemIndex:= ListBox_DownLoadInfo.Items.Count;
end;


{Flash Memory Map을 다운로드 한다.}
procedure TMainForm.DownloadFMM(aDeviceID:string);
var
  I: Integer;
  CMD: string;
  st: string;
  aLength: Integer;
//SYMFDST052S123455F00005F0000FF00005C0000F80000FF0000
begin
  CMD:= 'FI00';
  //st:= CMD + aFI.FMM;
  //2007 10 12 수정
  st:='1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
  for I:= 1 to Group_BroadDownLoad.Items.Count-1 do
  begin
    if Group_BroadDownLoad.ItemChecked[I] then st[I+1]:= '1';
  end;

  if chk_BinDown.checked then
  begin
    st := CMD + aFI.FMM + ' ' + ed_DeviceCode.Text + ' ' + FillZeroNumber(strtoint(ed_SendSize.text),4) + ' ' + st;
  end else
  begin
    st := CMD + aFI.FMM ;
  end;
//  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if aFI.FMM = '' then
  begin
    ShowMessage('데이터 없음');
    Exit;
  end;

  SendPacket(aDeviceID,'F', st,Sent_Ver);
  Write_ListBox_DownLoadInfo('Flash Memory Map 전송');
end;

procedure TMainForm.LoadINI_firmwareInfo;
var
  st: string;
begin
  //GetDir(0,aDir);

  with LMDIniCtrl2 do
  begin
    aFI.Version:= ReadString('DOWNLOAD','Version','');
    aFI.FMM    := ReadString('DOWNLOAD','FMM','');

    st         := ReadString('DOWNLOAD','FSC','');
    aFI.FSC    := FindCharCopy(st,0,',');
    aFI.CMDCODE:= FindCharCopy(st,1,',');

    if aFI.CMDCODE = '' then aFI.CMDCODE:= '00';

    aFI.FWFN   := ReadString('DOWNLOAD','FWFN','');
    aFI.FDFN   := ReadString('DOWNLOAD','FDFN','');
  end;

end;


procedure TMainForm.ReceiveFI(aPacketData: String);
var
  aDeviceID:String;
begin
  aDeviceID:= Copy(aPacketData,8,G_nIDLength + 2);
  if aFI.FWFN <> '' then DownLoadRom(aDeviceID,1,aFI.FWFN);
end;


procedure TMainForm.ReceiveFX(aPacketData: String);
begin
  if LMDStopWatch1.Active then
  begin
    LMDStopWatch1.Stop;
    Write_ListBox_DownLoadInfo('전송 완료시간:'+LMDStopWatch1.TimeString);
    IsDownLoad:= False;
  end;

end;

procedure TMainForm.Cnt_Relay(aDeviceID: String; aNo:String; aFunction:Char; aTime:String);
var
  No: String[2];
begin
  No:= Setlength(aNo,2);
  SendPacket(aDeviceID,'R','RY00'+No+aFunction+aTime,Sent_Ver)
end;


{국선체크시간 확인}
procedure TMainForm.CheckLinkusPt(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','Pt00',Sent_Ver);

end;


{국선체크시간 등록}
procedure TMainForm.RegLinkusPt(aDeviceID, aTime: String);
begin
  SendPacket(aDeviceID,'I','Pt00'+aTime,Sent_Ver);
end;



{관제 전화번호 확인}
procedure TMainForm.CheckLinkusTellNo(aDeviceID: String; aNo: Integer);
var
  NoStr: String[2];
begin
  NoStr:= InttoStr(aNo);
  if Length(NoStr) < 2 then NoStr:= '0'+NoStr;
  SendPacket(aDeviceID,'Q','Tn00'+NoStr,Sent_Ver);
end;

{관제 전화번호 등록}
procedure TMainForm.RegLinksTellNo(aDeviceID: String; aNo: Integer;
  aTellno: String);
var
  NoStr: String[2];
  st: string;
begin
  NoStr:= InttoStr(aNo);
  if Length(NoStr) < 2 then NoStr:= '0'+NoStr;
  st:= Setlength(aTellNo,20);
  SendPacket(aDeviceID,'I','Tn00'+NoStr+st,Sent_Ver);
end;

{링커스 ID확인}
procedure TMainForm.CheckLinkusID(aDeviceID: String);
begin
  Edit_LinkusID.Color:= clWhite;
  Edit_LinkusID.Text:= '';
  SendPacket(aDeviceID,'Q','Id00',Sent_Ver);
end;

{링커스 ID 등록}
procedure TMainForm.RegLinkusID(aDeviceID, aLinkusId: String);
var
  aID: integer;
  bID: String;
begin
  if not isdigit(aLinkusId) then
  begin
    ShowMessage('관제ID가 잘못 되었습니다.');
    Exit;
  end;
  aID:= Strtoint(aLinkusId);
  bID:= Dec2Hex(aID,4);
  SendPacket(aDeviceID,'I','Id00'+bID,Sent_Ver);
end;

{링커스 아이디 등록}
procedure TMainForm.btmRegLinkusIDClick(Sender: TObject);
var
  DeviceID: String;
begin
  if Edit_DeviceID.Text = '' then Edit_DeviceID.Text:= '0000000';
  if Edit_LinkusID.Text = '' then Edit_LinkusID.Text := '0000';

  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegLinkusID(DeviceID,Edit_LinkusID.Text);
end;

{링커스 아이디 확인}
procedure TMainForm.btmCheckLinkusIDClick(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckLinkusID(DeviceID);
end;

{링커스 관제 전화번호 등록}
procedure TMainForm.btnRegLinkusTel0Click(Sender: TObject);
var
  st: string;
  No: Integer;
  DeviceID: String;
begin
//  st:= TRzBitBtn(Sender).Name ;
//  Delete(st,1,15);
  No:= TRzBitBtn(Sender).tag;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  case No of
    0: if Sender = RzBitBtn60 then RegLinksTellNo(DeviceID,No,edLinkusTel00.Text)
       else RegLinksTellNo(DeviceID,No,edLinkusTel0.Text);
    1: RegLinksTellNo(DeviceID,No,edLinkusTel1.Text);
    2: RegLinksTellNo(DeviceID,No,edLinkusTel2.Text);
    3: RegLinksTellNo(DeviceID,No,edLinkusTel3.Text);
    4: RegLinksTellNo(DeviceID,No,edLinkusTel4.Text);
  end;
end;
{링커스 관제 전화번호 확인}
procedure TMainForm.btnCheckLinkusTel0Click(Sender: TObject);
var
  st: string;
  No: Integer;
  DeviceID: String;
begin
//
//  st:= TRzBitBtn(Sender).Name;
//  Delete(st,1,17);
//  No:= StrtoInt(st);
  No := TRzBitBtn(Sender).tag;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  case No of
    0: begin
      CheckLinkusTellNo(DeviceID,No);
      edLinkusTel0.Color:= clWhite;
      edLinkusTel00.Color:= clWhite;
      end;
    1: begin CheckLinkusTellNo(DeviceID,No); edLinkusTel1.Color:= clWhite; end;
    2: begin CheckLinkusTellNo(DeviceID,No); edLinkusTel2.Color:= clWhite; end;
    3: begin CheckLinkusTellNo(DeviceID,No); edLinkusTel3.Color:= clWhite; end;
    4: begin CheckLinkusTellNo(DeviceID,No); edLinkusTel4.Color:= clWhite; end;
  end;
end;

{국선 체크시간 등록}
procedure TMainForm.btnRegPtTimeClick(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegLinkusPt(DeviceID,FillZeroNumber(strtoint(edPtTime.Text),2));
  edPtDelayTime.Color:= clWhite;
end;
{국선 체크시간 확인}
procedure TMainForm.btnCheckPtTimeClick(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckLinkusPt(DeviceID);
end;
{링커스 ID수신}
procedure TMainForm.RcvLinkusId(aPacketData: String);
var
  st: string;
begin
  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= Copy(aPacketData,G_nIDLength + 15,4);
  Edit_LinkusID.Color:= clYellow;
  Edit_LinkusID.Text:= Hex2DecStr(st);
end;
{링커스 국선체크시간 수신}
procedure TMainForm.RcvLinkusPt(aPacketData: String);
var
  st: String;
begin
  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= Copy(aPacketData,G_nIDLength + 15,2);
  edPtTime.Color:= clYellow;
  edPtTime.Text:= st;
end;

{링커스 관제 번호 수신}
procedure TMainForm.RcvLinkusTelNo(aPacketData: String);
var
  st: String;
  MNo: Integer;
begin
  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= copy(aPacketData,G_nIDLength + 15,Length(aPacketData)-(G_nIDLength + 17));
  MNo:= StrtoInt(Copy(st,1,2));
  Delete(st,1,2);
  DeleteChar(st,' ');
  case MNo of
    0:begin
      edLinkusTel0.Color:= clYellow;
      edLinkusTel0.Text:= st;
      edLinkusTel00.Color:= clYellow;
      edLinkusTel00.Text:= st;
      end;
    1:begin edLinkusTel1.Color:= clYellow; edLinkusTel1.Text:= st; end;
    2:begin edLinkusTel2.Color:= clYellow; edLinkusTel2.Text:= st; end;
    3:begin edLinkusTel3.Color:= clYellow; edLinkusTel3.Text:= st; end;
    4:begin edLinkusTel4.Color:= clYellow; edLinkusTel4.Text:= st; end;
  end;
end;

{원격제어:국선체크 대기시간 }
procedure TMainForm.RegLinkusPtDelay(aDeviceID, aTime: String);
begin
  if not isdigit(aTime) then
  begin
    ShowMessage('시간이  올바르지 않습니다.');
    Exit;
  end;
  if Length(aTime) < 2 then aTime:= '0'+aTime;
  SendPacket(aDeviceID,'R','Pt00'+aTime,Sent_Ver);
end;

procedure TMainForm.btnRegPtDelayTimeClick(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegLinkusPtDelay(DeviceID,FillZeroNumber(strtoint(edPtDelayTime.Text),2));
  edPtDelayTime.Color:= clWhite;
end;


procedure TMainForm.RegRingCount(aDeviceID: String; aCount,aCancelCount: Integer);
var
  Countstr: string;
begin
  CountStr:= FillZeroNumber(aCount,2);
  SendPacket(aDeviceID,'I','Rc00'+ CountStr + FillZeroNumber(aCancelCount,2),Sent_Ver);
end;

procedure TMainForm.CheckRingCount(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','Rc00',Sent_Ver);
end;

procedure TMainForm.RcvRingCount(aPacketData: String);
var
  st: string;
  stCancelCount : string;
  aCount: Integer;
begin
  Spinner_Ring.Color:= ClYellow;
  Spinner_CancelRing.Color := clYellow;
  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= copy(aPacketData,G_nIDLength + 15,2);
  stCancelCount := copy(aPacketData,G_nIDLength + 17,2);
  aCount:= StrtoInt(st);
  Spinner_Ring.Value:= aCount;
  if IsDigit(stCancelCount) then Spinner_CancelRing.Value := strtoint(stCancelCount);
end;


procedure TMainForm.Btn_CheckRingCountClick(Sender: TObject);
var
  DeviceID:String;
begin
  Spinner_Ring.Color:= ClWhite;
  Spinner_CancelRing.Color := clWhite;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckRingCount(DeviceID);
end;

procedure TMainForm.Btn_RegRingCountClick(Sender: TObject);
var
  DeviceID:String;
begin
  Spinner_Ring.Color:= ClWhite;
  Spinner_CancelRing.Color := clWhite;
  
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegRingCount(DeviceID,Spinner_Ring.Value,Spinner_CancelRing.value);
end;

procedure TMainForm.Btn_CheckCardNoClick(Sender: TObject);
var
  I: Integer;
begin
  if Memo_CardNo.Lines.Count < 1 then
  begin
    ShowMessage('조회할 카드번호/출입번호 가 없습니다.');
    Exit;
  end;
  Memo2.Clear;
  CardAllDownLoad('M');
end;


procedure TMainForm.ClearWiznetInfo;
begin

  Edit_LocalIP.Text:= '';
  Edit_Sunnet.Text:= '';
  Edit_Gateway.Text:= '';
  Edit_LocalPort.Text:= '';
  Edit_ServerIp.Text:= '';
  Edit_Serverport.Text:= '';
  Edit_Time.Text:= '';
  Edit_Size.Text:= '';
  Edit_Char.Text:= '';
  Edit_Idle.Text:= '';
  RzEdit1.Text:= '';
  RzEdit2.Text:= '';
  ComboBox_Boad.ItemIndex:= -1;
  ComboBox_Databit.ItemIndex:= -1;
  ComboBox_Parity.ItemIndex:= -1;
  ComboBox_Stopbit.ItemIndex:= -1;
  ComboBox_Flow.ItemIndex:= -1;

end;


procedure TMainForm.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
var
  I: Integer;
  S: string;
  st: String;
  st2: String;
  n: Integer;
  MAcStr:String;
  nRow : integer;
  bSearch : Boolean;
begin

  WiznetTimer.Enabled:= False;

  S:= Socket.ReceiveText;

  if  Length(S) < 47 then Exit;

  WiznetData:= S;
  {MAC Address}

  if (copy(S,1,4) <> 'IMIN') and (copy(S,1,4) <> 'SETC')
     and (copy(S,1,4) <> 'LNDT') and (copy(S,1,4) <> 'LNSD')
  then Exit;

  if (copy(S,1,4) = 'IMIN') or (copy(S,1,4) <> 'SETC') then chk_ZeronType.Checked := False
  else chk_ZeronType.Checked := True;

  //Wiznet 접속을 끊는다.
  //if (OnWritewiznet = True) and ClientSocket1.Active  then
  //begin
  if ClientSocket1.Active  then
  begin
    ClientSocket1.Active:= False;
    L_bDirectSearch := True;
  end;

  st:= copy(S,5,6);
  MAcStr:= ToHexStrNoSpace(st);
  MAcStr:=  Copy(MAcStr,1,2) + ':' +
            Copy(MAcStr,3,2) + ':' +
            Copy(MAcStr,5,2) + ':' +
            Copy(MAcStr,7,2) + ':' +
            Copy(MAcStr,9,2) + ':' +
            Copy(MAcStr,11,2);
  with sg_WiznetList do
  begin
    bSearch := False;
    for nRow := 1 to RowCount - 1 do
    begin
      if cells[0,nRow] = MAcStr then
      begin
        cells[0,nRow] := MAcStr ;
        cells[1,nRow] := WiznetData;
        cells[2,nRow] := copy(S,1,4);
        sg_WiznetList.Row := nRow;
        bSearch := True;
      end;
    end;
    if Not bSearch then
    begin
      if Not chk_Direct.Checked and
         chk_FixMac.Checked then
      begin
        if ed_FixMac.Text = MAcStr then
        begin
          if Cells[0,1] <> '' then rowCount := RowCount + 1;
          cells[0,RowCount - 1] := MAcStr ;
          cells[1,RowCount - 1] := WiznetData;
          cells[2,RowCount - 1] := copy(S,1,4);
        end;
      end else
      begin
        if Cells[0,1] <> '' then rowCount := RowCount + 1;
        cells[0,RowCount - 1] := MAcStr ;
        cells[1,RowCount - 1] := WiznetData;
        cells[2,RowCount - 1] := copy(S,1,4);
      end;
    end;
  end;
  sg_WiznetListClick(self);

end;

procedure TMainForm.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  RzFieldStatus1.Caption:= '[7100A]'+ClientSocket1.Host + '연결 되었습니다.';
  L_bDirectClientConnect := True;
  //if not OnWritewiznet then Socket.SendText('FIND');
  //Socket.SendText('FIND');
end;

procedure TMainForm.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  ErrorCode:= 0;
  RzFieldStatus1.Caption:='[7100A]'+ ClientSocket1.Host + '에러가 발생 했습니다.';
  L_bDirectClientConnect := False;
end;

procedure TMainForm.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  RzFieldStatus1.Caption:='[7100A]'+ ClientSocket1.Host + '끊어졌습니다.';
  L_bDirectClientConnect := False;
end;

procedure TMainForm.ClearLanInfo;
begin

  RzEdit1.Text:= '';
  RzEdit2.Text:= '';
  Edit_LocalIP.Text:= '';
  Edit_Sunnet.Text:= '';
  Edit_Gateway.Text:= '';
  Edit_LocalPort.Text:= '';
  ComboBox_Boad.Text:= '';
  ComboBox_Databit.Text:= '';
  ComboBox_Parity.Text:= '';
  ComboBox_Stopbit.Text:= '';
  ComboBox_Flow.Text:= '';
  Edit_Time.Text:= '';
  Edit_Size.Text:= '';
  Edit_Char.Text:= '';
  Edit_Idle.Text:= '';
  Edit_ServerIp.Text:= '';
  Edit_Serverport.Text:= '';
  Checkbox_Debugmode.Checked:= False;
  Checkbox_DHCP.Checked:= False;
  RadioModeMixed.Checked:= True;
end;

procedure TMainForm.WiznetTimerTimer(Sender: TObject);
begin
  
  WiznetTimer.Enabled:= False;
  ClientSocket1.Active:= False;
  RzFieldStatus1.Caption:= '';
  ShowMessage('연결이 안됩니다.');

end;

{맥어드레스 등록}
procedure TMainForm.btnRegMACClick(Sender: TObject);
var
  aData: string;
  DeviceID: String;
  MAC: String;
begin
  if editMAC1.Text = '' then editMAC1.Text:= '00';
  if editMAC2.Text = '' then editMAC2.Text:= '00';
  if editMAC3.Text = '' then editMAC3.Text:= '00';
  if editMAC4.Text = '' then editMAC4.Text:= '00';
  if editMAC5.Text = '' then editMAC5.Text:= '00';
  if editMAC6.Text = '' then editMAC6.Text:= '00';

  if Length(editMAC1.Text) < 2 then editMAC1.Text:= '0' + editMAC1.Text;
  if Length(editMAC2.Text) < 2 then editMAC2.Text:= '0' + editMAC2.Text;
  if Length(editMAC3.Text) < 2 then editMAC3.Text:= '0' + editMAC3.Text;
  if Length(editMAC4.Text) < 2 then editMAC4.Text:= '0' + editMAC4.Text;
  if Length(editMAC5.Text) < 2 then editMAC5.Text:= '0' + editMAC5.Text;
  if Length(editMAC6.Text) < 2 then editMAC6.Text:= '0' + editMAC6.Text;
  MAC:= editMAC1.Text + editMAC2.Text + editMAC3.Text +
        editMAC4.Text + editMAC5.Text + editMAC6.Text;

  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  aData:= 'NW99'+
          'AA'+
          MAC +
          '~mAc^wRITe^coNFIrm~';
  SendPacket(DeviceID,'I',aData,Sent_Ver);

  Delay(1000);
  btnCheckLanClick(self);
end;

procedure TMainForm.RzButton2Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 6;
end;

procedure TMainForm.RzButton4Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 5;
  PageControl2.ActivePageIndex := 0;
end;


procedure TMainForm.editMAC1Click(Sender: TObject);
begin
  editMAC1.Color:= clWhite;
  editMAC2.Color:= clWhite;
  editMAC3.Color:= clWhite;
  editMAC4.Color:= clWhite;
  editMAC5.Color:= clWhite;
  editMAC6.Color:= clWhite;
end;

procedure TMainForm.ReconnectSocketTimerTimer(Sender: TObject);
begin
  if DoCloseWinsock then
  begin
    DoCloseWinsock:= False;
    WinsockPort.OPen:= False;
    Panel_ActiveClinetCount.Caption:= 'Closed socket !!!';
  end else
  begin
    //Panel_ActiveClinetCount.Caption:= 'DoCloseWinsock= False';
    if RadioGroup_Mode.ItemIndex = 0 then
      Panel_ActiveClinetCount.Caption:= CB_IPList.Text+ ' 접속시도'
    else
      Panel_ActiveClinetCount.Caption:= CB_IPList.Text+ ' 접속대기중';
    ReconnectSocketTimer.Enabled:= False;
    WinsockPort.OPen:= True;
  end;
end;

{버젼확인}
procedure TMainForm.tbVersionClick(Sender: TObject);
begin
  Cnt_CheckVer(Edit_CurrentID.Text + ComboBox_IDNO.Text);
  Edit_Ver.Text:= '';
  Edit_TopRomVer.Text:= '';
end;

procedure TMainForm.RzBitBtn38Click(Sender: TObject);
var
  aDeviceID: String;
  aFunc: Char;
begin

  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  case cb_RelayOnOff.ItemIndex of
    0: aFunc:= '0';
    1: aFunc:= '1';
    2: aFunc:= 'o';
    3: aFunc:= 'f';
  end;
  Cnt_Relay(aDeviceID,cb_RelayNo.Text,aFunc,cb_RelayTIme.Text);

end;

procedure TMainForm.Cnt_RemoteTellCall(aDeviceID, CallTime: String;aSpeaker: Char; aTellNo: String);
begin
  SendPacket(aDeviceID,'R','Rd01'+'T'+CallTime+aSpeaker+aTellNo,Sent_Ver);
end;

procedure TMainForm.RzBitBtn33Click(Sender: TObject);
var
  aDeviceID: String;
  aCallTime: String;
  aSpeaker: Char;
begin
  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  aCallTime:= FillZeroNumber(RzSpinEdit1.IntValue,3);
  if CheckBox2.Checked = True then aSpeaker:= 'o'
  else                             aSpeaker:= 'f';
  Cnt_RemoteTellCall(aDeviceID,aCallTime,aSpeaker,edPhoneNo.Text);
end;

procedure TMainForm.btn_FileOpen1Click(Sender: TObject);
var
  cmdList: TStringList;
  st: string;
  I: Integer;
  aData: String;
begin
  cmdList:= TStringList.Create;
  cmdList.Clear;

  RzOpenDialog1.Title:= '데이터 전송 파일 찾기';
  RzOpenDialog1.DefaultExt:= 'cmd';
  RzOpenDialog1.Filter := 'INI files (*.cmd)|*.CMD';
  if RzOpenDialog1.Execute then
  begin
    st:= RzOpenDialog1.FileName;
    cmdList.LoadFromFile(st);
  end;

  for I:= 0 to cmdList.Count-1 do
  begin
    aData:= cmdList[I];
    Array_SendEdit[I].Edit.Text := FindCharCopy(aData,1,',');
    Array_SendEdit[I].Func.Text := FindCharCopy(aData,0,',');
  end;
  cmdList.Free;
end;

procedure TMainForm.btn_FileSave1Click(Sender: TObject);
var
  cmdList: TStringList;
  st: String;
  aFile: String;
  I:Integer;
begin
  cmdList:= TStringList.Create;
  cmdList.Clear;
  for I:= 0 to 47 do
  begin
    st:= Array_SendEdit[I].Func.Text + ',' + Array_SendEdit[I].Edit.Text;
    cmdList.Add(st);
  end;

  RzSaveDialog1.DefaultExt:= 'cmd';
  RzSaveDialog1.Filter := 'INI files (*.cmd)|*.CMD';

  if RzSaveDialog1.Execute then
  begin
    aFile:= RzSaveDialog1.FileName;
    cmdList.SavetoFile(aFile);
  end;
  cmdList.Free;
  SHowMessage('저장이 완료 되었습니다.');

end;

procedure TMainForm.DLRadioGroupChange(Sender: TObject;
  ButtonIndex: Integer);
begin
  if ButtonIndex = 0 then DLCodeEdit.enabled := False
  else begin DLCodeEdit.enabled := True; DLCodeEdit.Setfocus; end;
end;

procedure TMainForm.DLCheckBoxChange(Sender: TObject);
begin
  if DLCheckBox.Checked then
  begin
    DLRadioGroup.Enabled:= True;
    DLRadioGroup.ItemIndex:= 0;
  end else
  begin
    DLRadioGroup.Enabled:= False;
    DLCodeEdit.Enabled:= False;
  end;
end;

procedure TMainForm.btnRegisterClearClick(Sender: TObject);
begin
  if MessageDlg('기기가 초기화 됩니다. 정말 진행 하시겠습니까 ?'+#13#13+ '기기번호: '+ComboBox_IDNO.Text,
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Cnt_ClearRegister(Edit_CurrentID.Text + ComboBox_IDNO.Text);
end;

// 등록할 카드 번호 메모장에 추가
procedure TMainForm.Append_Memo_CardNo(aCardNo: String);
begin
  if Memo_CardNo.Lines.Indexof(aCardNo) < 0 then
  begin
    Memo_CardNo.Lines.Add(aCardNo);
  end;
end;

procedure TMainForm.Memo_CardNoChange(Sender: TObject);
begin
  GroupBox1.Caption:= '등록할 카드 번호['+InttoStr(Memo_CardNo.Lines.Count)+']';
end;

//카드번호 불러오기
procedure TMainForm.N4Click(Sender: TObject);
var
  filename: String;
begin
  Memo_CardNo.Lines.Clear;
  OpenDialog1.DefaultExt:= 'TXT';
  OpenDialog1.Filter := 'Text files (*.txt)|*.txt';
  if OpenDialog1.Execute then
  begin
   filename := OpenDialog1.FileName;

   Memo_CardNo.Lines.LoadFromFile(Filename);
  end;
end;

//카드번호 저장하기
procedure TMainForm.N5Click(Sender: TObject);
var
  filename: String;
begin

  SaveDialog1.DefaultExt:= 'TXT';
  SaveDialog1.Filter := 'Text files (*.txt)|*.txt';
  if SaveDialog1.Execute then
  begin
   filename := SaveDialog1.FileName;
   Memo_CardNo.Lines.SavetoFile(FileName);
  end;
end;


//카드데이터 전체 삭제
procedure TMainForm.Btn_DelCardNoBtn_DelAllCardNoClick(Sender: TObject);
Var
  DeviceID:String;
begin
  DeviceID:=Edit_CurrentID.Text + ComboBox_IDNO.Text;

  CD_DownLoad(DeviceID,'0000000000','O');
end;

procedure TMainForm.RzButton3Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 13;
end;

procedure TMainForm.LMDGlobalHotKey1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then SHowMessage('12121');
end;

procedure TMainForm.ComboBox_IDNOChange(Sender: TObject);
begin
  if ComboBox_IDNO.ItemIndex < 6 then
     rgDeviceNo.ItemIndex:= ComboBox_IDNO.ItemIndex;
  ed_DeviceNo.text := ComboBox_IDNO.text;
end;

procedure TMainForm.rgDeviceNoChanging(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
  ComboBox_IDNO.ItemIndex:= NewIndex;
  ed_DeviceNo.text := rgDeviceNo.Items[NewIndex];
end;


procedure TMainForm.Group_DeviceBaseChange(Sender: TObject; Index: Integer;
  NewState: TCheckBoxState);
var
 I: Integer;
 Base: Integer;
begin
  if Index < 10 then
  begin
    Base:= Index * 10;
    if NewState = cbChecked then
    begin
      for I:= 0 to 9 do Group_Device.ItemChecked[Base + I]:= True;
    end else
    begin
      for I:= 0 to 9 do Group_Device.ItemChecked[Base + I]:= False;
    end;
  end else
  begin
    if NewState = cbChecked then
    begin
      for I:= 0 to Group_Device.Items.Count -1  do Group_Device.ItemChecked[I]:= True;
      for I:= 0 to Group_DeviceBase.Items.Count -1  do Group_DeviceBase.ItemChecked[I]:= True;

    end else
    begin
      for I:= 0 to Group_Device.Items.Count -1  do Group_Device.ItemChecked[I]:= False;
      for I:= 0 to Group_DeviceBase.Items.Count -1  do Group_DeviceBase.ItemChecked[I]:= False;
    end;

  end;
end;

procedure TMainForm.Btn_CheckStatusClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:='';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo.ItemIndex+1,'0','0' );
end;

procedure TMainForm.btnCheckCdVerClick(Sender: TObject);
var
  DeviceID: String;
begin
  if Group_CardReader.ItemIndex > 0 then
  begin
    Label17.Caption:= 'Reader Ver:' ;
    DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
    Cnt_CheckCdVer(DeviceID,Group_CardReader.ItemIndex);
  end else
  begin
    MessageDlg('리더기 번호를 선택해 주세요 (1 ~ 8)', mtError, [mbOK], 0);
  end;
end;

// 스케쥴 지정
procedure TMainForm.RzGroup3Items3Click(Sender: TObject);
begin
  CheckUsedDevice(Edit_CurrentID.text + ComboBox_IDNO.Text,'0');

  Notebook1.PageIndex:= 3;

end;


procedure TMainForm.RzBitBtn43Click(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegFoodTime(DeviceID);
end;

procedure TMainForm.Btn_RDoorOPenClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo3.ItemIndex+1,'3','0' );
  //DoorModeChange(DeviceID,'1');
end;

procedure TMainForm.Btn_RDoorCloseClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo3.ItemIndex+1,'3','1' );
  //DoorModeChange(DeviceID,'1');
  //beep

end;

procedure TMainForm.miSoundClick(Sender: TObject);
begin
  Notebook1.PageIndex := 14;
end;

procedure TMainForm.btWavClick(Sender: TObject);
var
  st : string;
  edit : TEdit;
begin

  RzOpenDialog1.Title:= '소리 파일 찾기';
  RzOpenDialog1.DefaultExt:= 'wav,mp3';
  RzOpenDialog1.Filter := 'WAV files (*.wav,*.mp3)|*.WAV;*.MP3';
  if RzOpenDialog1.Execute then
  begin
    edit := TravelEditItem(GroupBox19,'edfile', strtoint((Sender as TRzBitBtn).Hint));
    if edit <> nil then
    edit.Text := RzOpenDialog1.FileName;
 end;

end;

procedure TMainForm.edFileChange(Sender: TObject);
var
  Play : TRzBitBtn;
begin
  Play := TravelRzBitBtnItem(GroupBox19,'btplay',strtoint((Sender as TEdit).hint ));
  if Play <> nil then
  begin
    if (Sender as TEdit).text = '' then Play.enabled := false
    else  Play.enabled := True;
  end;

end;



procedure TMainForm.btPlayClick(Sender: TObject);
var
  edit : TEdit;
begin
  edit := TravelEditItem(GroupBox19,'edfile',strtoint((Sender as TRzBitBtn).Hint));
  if edit.text = '' then exit;
  if Not FileExists(edit.text) then Exit;
  
  MediaPlayer1.FileName := edit.text;
  MediaPlayer1.Open;
  MediaPlayer1.play;
end;

procedure TMainForm.btAllClearClick(Sender: TObject);
var
  edit:TEdit;
  Loop:Integer;
  rzedit: TEdit;
  check:TCheckBox;
  edExe:TEdit;
begin
  for Loop := 1 to CONTROLCNT do
  begin
     check := TravelCheckBoxItem(Groupbox19,'check',Loop);
     check.checked := False;

     rzedit := TravelEditItem(GroupBox19,'edcomp', Loop);
     rzedit.Text := '';
     edit := TravelEditItem(GroupBox19,'edfile', Loop);
     edit.text := '';
     edExe := TravelEditItem(GroupBox19,'edexe',Loop);
     edExe.text := '';
  end;

end;

procedure TMainForm.btSelectClearClick(Sender: TObject);
var
  edit:TEdit;
  edExe:TEdit;
  Loop:Integer;
  check:TCheckBox;
  rzedit: TEdit;
begin

  for Loop := 1 to CONTROLCNT do
  begin
    check := TravelCheckBoxItem(Groupbox19,'check',Loop);
    if check.checked then
    begin
     rzedit := TravelEditItem(GroupBox19,'edcomp', Loop);
     rzedit.Text := '';
     edit := TravelEditItem(GroupBox19,'edfile', Loop);
     edit.text := '';
     edExe := TravelEditItem(GroupBox19,'edexe', Loop);
     edExe.text := '';
    end;
  end;

end;

function TMainForm.DataCompare(Data: String; no: Integer): Boolean;
var
  stTemp : String;
  rzedit: TEdit;
  Loop:Integer;
begin

  Result:= False;
  rzedit := TravelEditItem(GroupBox19,'edcomp', no);
  if rzedit.text = '' then exit;

  stTemp:= StringAND(rzedit.Text,Data,length(rzedit.Text));
  Result:= StringXOR(StrToHex(rzedit.Text),stTemp);

end;

procedure TMainForm.WarningBeep(no: Integer);
var
  Play : TRzBitBtn;
begin
  Play := TravelRzBitBtnItem(GroupBox19,'btplay',no);
  if Play <> nil then
  begin
    Play.click;
  end;
end;

procedure TMainForm.rdSelectCardNoClick(Sender: TObject);
begin

  lblcard.Visible := False;
  edcard.visible := False;
  btBroadFile.visible := False;
  //chk_BroadFile.Left := 392;

  if (rdSelectCardNo.ItemIndex = 0) or (rdSelectCardNo.ItemIndex = 1) then  //난수 또는 순차증가
  begin
    lblcard.Visible := True ;
    lblcard.caption := '카드번호생성갯수';
    edcard.visible := True;
    edcard.text := '';
    //chk_BroadFile.Left := 492;
  end
  else if rdSelectCardNo.ItemIndex = 2 then
  begin
    btBroadFile.visible := True;
    if edBRFileLoad.text = '' then
    begin
      btBroadFileclick(Self);
    end;
    //chk_BroadFile.Left := 492;
  end
  else if rdSelectCardNo.ItemIndex = 3 then
  begin
    lblcard.Visible := True ;
    lblcard.caption := '카드번호';
    edcard.visible := True;
    edcard.text := '';
  end;
end;

procedure TMainForm.chk_BroadFileClick(Sender: TObject);
begin
  if chk_BroadFile.Checked then
  begin
    if edBroadFileSave.Text = '' then
    begin
      SaveDialog1.Title:= '생성할 파일 이름';
      SaveDialog1.DefaultExt:= 'txt';
  //    OpenDialog1.Options := [ofCreatePrompt]	;
      SaveDialog1.Filter := 'TXT files (*.txt)|*.TXT';
      if SaveDialog1.Execute then
      begin
        edBroadFileSave.Text := SaveDialog1.FileName;
      end;
    end;
    btBroadFileSet.enabled := True;
    btCaptureSave.enabled := True;
    if edBroadFileSave.Text = '' then
    begin
      chk_BroadFile.Checked := False;
      btBroadFileSet.enabled := False;
      btCaptureSave.enabled := False;
    end else
    begin
         if fileexists(edBroadFileSave.Text) = true then BroadSaveFileList.LoadFromFile(edBroadFileSave.Text);
    end;

  end
  else
  begin
    btBroadFileSet.enabled := False;
    btCaptureSave.enabled := False;
    if BroadSaveFileList.count > 0 then BroadSaveFileList.SaveToFile(edBroadFileSave.text);
    BroadSaveFileList.clear;
  end;
end;


procedure TMainForm.Group_BroadDeviceBaseChange(Sender: TObject; Index: Integer;
  NewState: TCheckBoxState);
var
 I: Integer;
 Base: Integer;
begin
  if Index < 10 then
  begin
    Base:= Index * 10;
    if NewState = cbChecked then
    begin
      for I:= 0 to 9 do Group_BroadDevice.ItemChecked[Base + I]:= True;
    end else
    begin
      for I:= 0 to 9 do Group_BroadDevice.ItemChecked[Base + I]:= False;
    end;
  end else
  begin
    if NewState = cbChecked then
    begin
      for I:= 0 to Group_BroadDevice.Items.Count -1  do Group_BroadDevice.ItemChecked[I]:= True;
      for I:= 0 to Group_BroadDeviceBase.Items.Count -1  do Group_BroadDeviceBase.ItemChecked[I]:= True;

    end else
    begin
      for I:= 0 to Group_BroadDevice.Items.Count -1  do Group_Device.ItemChecked[I]:= False;
      for I:= 0 to Group_BroadDeviceBase.Items.Count -1  do Group_BroadDeviceBase.ItemChecked[I]:= False;
    end;

  end;
end;






procedure TMainForm.btBroadFileSetClick(Sender: TObject);
begin
  BroadSaveFileList.Clear;
  edBroadFileSave.Text := '';
  SaveDialog1.Title:= '생성할 파일 이름';
  SaveDialog1.DefaultExt:= 'txt';
  SaveDialog1.Filter := 'TXT files (*.txt)|*.TXT';

  if SaveDialog1.Execute then
  begin
    edBroadFileSave.Text := SaveDialog1.FileName;
  end;
  if edBroadFileSave.Text = '' then
  begin
      chk_BroadFile.Checked := False;
      btBroadFileSet.enabled := False;
  end else
  begin
    if fileexists(edBroadFileSave.Text) = true then BroadSaveFileList.LoadFromFile(edBroadFileSave.Text);
  end;
end;


procedure TMainForm.btCaptureSaveClick(Sender: TObject);
begin
  btCaptureSave.enabled := False;
  BroadSaveFileList.SaveToFile(edBroadFileSave.text);
  BroadSaveFileList.clear;
  if chk_broadfile.checked then
  begin
     chk_broadfile.checked := False ;
     btBroadFileSet.enabled := False;
     btCaptureSave.enabled := False;
  end;
end;




procedure TMainForm.BroadTimerTimer(Sender: TObject);
var
  stDeviceID : String;
begin
  stDeviceID := Edit_CurrentID.Text + '00';
  SendPacket(stDeviceID,'*',BroadSendData,Sent_Ver);
end;

procedure TMainForm.broadStopTimerTimer(Sender: TObject);
begin
  BroadTimer.Enabled := False;
  showmessage('통신상태가 불량합니다.');
end;

procedure TMainForm.btExe1Click(Sender: TObject);
var
  edit : TEdit;
begin

  RzOpenDialog1.Title:= '실행 파일 찾기';
  RzOpenDialog1.DefaultExt:= 'exe';
  RzOpenDialog1.Filter := 'EXE files (*.exe)|*.exe';
  if RzOpenDialog1.Execute then
  begin
    edit := TravelEditItem(GroupBox19,'edexe', strtoint((Sender as TRzBitBtn).Hint)); 
    if edit <> nil then
    edit.Text := RzOpenDialog1.FileName;

 end;

end;

procedure TMainForm.edExe1Change(Sender: TObject);
var
  btExe : TRzBitBtn;
begin
  btExe := TravelRzBitBtnItem(GroupBox19,'btexe',strtoint((Sender as TEdit).hint ));
  if btExe <> nil then
  begin
    if (Sender as TEdit).text = '' then btExe.Font.color := clBlack
    else  btExe.Font.color := clYellow;
  end;

end;

procedure TMainForm.edYYYYKeyPress(Sender: TObject; var Key: Char);
begin
  if length(edYYYY.text)=2 then edMM.setfocus;
end;

procedure TMainForm.edMMKeyPress(Sender: TObject; var Key: Char);
begin
  if  ck_YYMMDD.checked And  (length(edMM.text)=2)  then
  begin
      edDD.setfocus;
  end;
end;

procedure TMainForm.edDDKeyPress(Sender: TObject; var Key: Char);
begin
  if  ck_YYMMDD.checked And (length(edDD.text)=2)  then
  begin
    Btn_RegCardNo.setfocus;
  end;
end;

procedure TMainForm.edMMExit(Sender: TObject);
begin
  if  ck_YYMMDD.checked  then
  begin
    if (strtoint('0' + edMM.text) > 12) OR (strtoint('0' + edMM.text) < 1)  then
    begin
      showmessage('월의 형식이 맞지 않습니다.');
      edMM.setfocus;
    end;
  end;
end;

procedure TMainForm.edDDExit(Sender: TObject);
begin
    if (strtoint('0' + edDD.text) > 31) OR (strtoint('0' + edDD.text) < 1)  then
    begin
      showmessage('일의 형식이 맞지 않습니다.');
      edDD.setfocus;
    end;

end;

procedure TMainForm.ck_YYMMDDClick(Sender: TObject);
begin
  if ck_YYMMDD.checked then edYYYY.setfocus;
end;



procedure TMainForm.Group_BroadDownLoadBaseChange(Sender: TObject;
  Index: Integer; NewState: TCheckBoxState);
var
 I: Integer;
 Base: Integer;
begin
  if Index < 10 then
  begin
    Base:= Index * 10;
    if NewState = cbChecked then
    begin
      for I:= 0 to 9 do Group_BroadDownLoad.ItemChecked[Base + I]:= True;
    end else
    begin
      for I:= 0 to 9 do Group_BroadDownLoad.ItemChecked[Base + I]:= False;
    end;
  end else
  begin
    if NewState = cbChecked then
    begin
      for I:= 0 to Group_BroadDownLoad.Items.Count -1  do Group_BroadDownLoad.ItemChecked[I]:= True;
      for I:= 0 to Group_BroadDownLoadBase.Items.Count -1  do Group_BroadDownLoadBase.ItemChecked[I]:= True;

    end else
    begin
      for I:= 0 to Group_BroadDownLoad.Items.Count -1  do Group_BroadDownLoad.ItemChecked[I]:= False;
      for I:= 0 to Group_BroadDownLoadBase.Items.Count -1  do Group_BroadDownLoadBase.ItemChecked[I]:= False;
    end;

  end;
end;




function TMainForm.BroadControlNumConvert(Num: Integer): String;
var
  nTemp : array[0..8, 0..7] of Integer;
  i,j,k : Integer;
  stTemp: String;
  stHex:String;
  nDecimal: Integer;
begin

  for i:=0 to 8 do
  begin
    for j:=0 to 7 do
    begin
      nTemp[i,j]:=0;
    end;
  end;


  i := Num div 8;
  j := Num Mod 8 ;

  nTemp[i,j] := 1;

  stHex := '';
  for k:=0 to 8 do
  begin
    nDecimal := 0;
    stTemp := '';
    For j:= 4 to 7 do
    Begin
        nDecimal := nDecimal + nTemp[k,j] * Trunc(Power(2, j - 4));
    end;
    stTemp := '3' + IntToHex(nDecimal,1);
    stHex := stHex + Char(StrToIntDef('$' + stTemp, 0));
    nDecimal := 0;

    For j:= 0 to 3 do
    Begin
        nDecimal := nDecimal + nTemp[k,j] * Trunc(Power(2, j));
    end;
    stTemp := '3' + IntToHex(nDecimal,1);
    stHex := stHex + Char(StrToIntDef('$' + stTemp, 0));

  end;

  //showmessage(stTemp);
  Result:=stHex;

end;


procedure TMainForm.BitBtn1Click(Sender: TObject);
var
  st: string;
  iFileLength: Integer;
  iBytesRead: Integer;
  iFileHandle: Integer;
  clFileInfo : TFileInfo;
begin

  RzOpenDialog1.Title:= '펌웨어 설정 파일 찾기';
  RzOpenDialog1.DefaultExt:= 'ini';
  RzOpenDialog1.Filter := 'INI files (*.ini)|*.INI';
  if RzOpenDialog1.Execute then
  begin
    st:= RzOpenDialog1.FileName;
    RzButtonEdit1.Text:= st;
    RzButtonEdit1.SelectAll;
    ed_ftpsendFile1.Text := st;
    clFileInfo := TFileInfo.Create(ed_ftpsendFile1.Text);
    ed_ftpsendfilename1.Text := clFileInfo.FileName;
    ed_ftpsendfilesize1.Text := inttostr(clFileInfo.FileSize);
    ed_localftproot.Text := clFileInfo.Path;
    clFileInfo.Destroy;
    //if Not FTPUSE then
    //begin
      LMDIniCtrl2.IniFile:= st;
      LoadINI_firmwareInfo;
      st:= aFI.Version + #13+
           aFI.FMM     + #13+
           aFI.FSC     + #13+
           aFI.FWFN    + #13+
           aFI.FDFN;
      ROM_FlashWrite.Clear;
      ROM_FlashWrite.LoadFromFile(aFI.FWFN);
      ROM_FlashData.Clear;
      ROM_FlashData.LoadFromFile(aFI.FDFN);
      //여기서 첫번째 파일을 읽어 들이자
      iFileHandle := FileOpen(aFI.FWFN, fmOpenRead);
      iFileLength := FileSeek(iFileHandle,0,2);
      FileSeek(iFileHandle,0,0);

      ROM_BineryFlashWrite := nil;
      ROM_BineryFlashWrite := PChar(AllocMem(iFileLength + 1));
      iBytesRead := FileRead(iFileHandle, ROM_BineryFlashWrite^, iFileLength);
      FileClose(iFileHandle);
    
      //여기서 두번째 파일을 읽어 들이자
      iFileHandle := FileOpen(aFI.FDFN, fmOpenRead);
      iFileLength := FileSeek(iFileHandle,0,2);
      FileSeek(iFileHandle,0,0);

      ROM_BineryFlashData := nil;
      ROM_BineryFlashData := PChar(AllocMem(iFileLength + 1));
      iBytesRead := FileRead(iFileHandle, ROM_BineryFlashData^, iFileLength);

      FileClose(iFileHandle);
    //end;
  end;

end;

function TMainForm.RegCardReaderType(aDeviceID: string;
  nType: integer): Boolean;
var
  aData: string;
  nTime : integer;
begin
  Result := false;
  cb_CardType.itemIndex := 0;
  if (nType < 1) or (nType > 4) then Exit;
  aData := 'Ct00' + inttostr(nType - 1);                               //카드리더 타입 등록

//  bCardReaderTypeCheck := False;
  SendPacket(aDeviceID, 'I', aData,Sent_Ver);


  Result := true;

end;

procedure TMainForm.btn_TimecheckClick(Sender: TObject);
begin
  Edit_TimeSync.Text:= '';
  Edit_TimeSync2.Text := '';
  SendPacket(Edit_CurrentID.Text + ComboBox_IDNO.Text,'R','TM0020999999999999',Sent_Ver);
end;

procedure TMainForm.RcvCardType(aPacketData: string);
var
  st: string;
  aCount: Integer;
  stECUID : string;
begin
  Delete(aPacketData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st := Copy(aPacketData,G_nIDLength + 15, 1);
  stECUID := Copy(aPacketData,G_nIDLength + 7,2);
  Try
    cb_CardType.ItemIndex := strtoint(st) + 1;
  Except
    cb_CardType.ItemIndex := 0;
  End;
{  if st = '0' then
  begin
    cb_CardType.ItemIndex := 1;
  end else if st = '1' then
  begin
    cb_CardType.ItemIndex := 2;
  end else
  begin
    cb_CardType.ItemIndex := 0;
  end;  }

  cb_CardType.Color := clYellow;

end;

procedure TMainForm.btn_CuerrentClick(Sender: TObject);
begin
  SendPacket(Edit_CurrentID.Text + ComboBox_IDNO.Text,'R','RD00',Sent_Ver);

end;

procedure TMainForm.PrintLog(aData: String);
var
 position: Integer;
 LineNo: Integer;
begin

  LineNo:= RichEdit1.Lines.Count;
  position := RichEdit1.Perform(EM_LINEINDEX, LineNo, 0) + Length(RichEdit1.Lines[LineNo]);
  RichEdit1.SelStart := position;
  RichEdit1.SelLength := 0;
  RichEdit1.SelText := aData;
  SendMessage(RichEdit1.handle, EM_SCROLLCARET,0,0);


end;

procedure TMainForm.FormActivate(Sender: TObject);
var
  bLogined : Boolean;
begin
  L_bDirectSearch := False;
  L_bDirectClientConnect := False;
  L_nDirectConnectWaitTime := 1000; //3초 정도 기다리자
  
  L_nDoorItemIndex := 9;
  IsFirmwareDownLoad := False;
  bStop := False;
  PageControl1.ActivePageIndex := 0;
  ConfigInit;
  //rg_ConTypeClick(self);
  //cmb_ftplocalportChange(Self);
  FTPUSE := True;
  //MainForm.WindowState := wsMaximized;
  rg_DecorderSelect.Visible := False;

{  if UpperCase(stPasswdErr) = 'FALSE' then
  begin
    showmessage('비밀번호 3회이상 실패로 프로그램을 종료합니다');
    Self.Close;
    Exit;
  end;

  if stPW <> '****' then
  begin
    fmLogin := TfmLogin.Create(Self);
    fmLogin.OrgPW := '0220574981';//MimeDecodeString('MDIyMDU3NDk4MQ==');
    fmLogin.ShowModal;
    bLogined := fmLogin.bLogined;
    fmLogin.Free;
  end
  else}
  bLogined := True;

  if Not bLogined then
  begin
    Self.Close;
  end;

  if UpperCase(L_Direct) <> 'TRUE' then
  begin
    chk_Direct.Checked := False;
    chk_Direct.Visible := False;
  end;

  L_bCTRLKeyPress := False;

  if G_nProgramType = 1 then
    RxDBGrid1.Columns[4].Width := 123
  else RxDBGrid1.Columns[4].Width := 60;

end;

procedure TMainForm.btn_PlayClick(Sender: TObject);
begin
  bStart := True;
  btn_Moment.enabled := True;
  btn_Stop.enabled := True;
  btn_Play.enabled := False;
end;

procedure TMainForm.btn_MomentClick(Sender: TObject);
begin
  bStart := False;
  btn_Play.enabled := True;
  btn_Moment.enabled := False;
  btn_Stop.enabled := False;
end;

procedure TMainForm.btn_StopClick(Sender: TObject);
begin
  bStop := True;
  pn_Gauge.Visible := False;
end;

procedure TMainForm.bt_CardDeleteClick(Sender: TObject);
var
 DeviceID : String;
 i,j : Integer;
 aCardNo : String;
 stPositoinCardNumber : string;
 nLength : integer;
begin
  Label136.Caption :=inttostr(LMDListBox1.SelCount);
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if (chk_CardPosition.Checked) or (chk_CardPosition2.Checked) then
  begin
    if Not Isdigit(ed_CardPosition.Text) then
    begin
      showmessage('카드 위치는 숫자 5자리 이내입니다.');
      Exit;
    end;
    ed_CardPositionNumber.Color := clWhite;
    ed_CardPosition.Color := clWhite;
    ed_CardPositionHex.Color := clWhite;
    stPositoinCardNumber := ed_CardPositionHex.Text;
    stPositoinCardNumber := inttostr(Hex2Dec64(stPositoinCardNumber));
    CD_PositionDownLoad(DeviceID,stPositoinCardNumber,ed_CardPosition.Text,'D');
    Exit;
  end;

  for i:= 0 to  LMDListBox1.Count - 1 do
  begin
    if  LMDListBox1.Selected[i] then
    begin
      aCardNo:= FindCharCopy(LMDListBox1.Items.Strings[i],10,';');
      Label136.Caption := LMDListBox1.Items.Strings[i];
      //CD_DownLoad(DeviceID,aCardNo,'N');
      if chk_CmdX.Checked then CD_XDownLoad(DeviceID,aCardNo,'N')
      else
      begin
        nLength := Length(aCardNo);
        if rg_CardType.ItemIndex = 1 then CD_DownLoad(DeviceID,aCardNo,'N',nLength,True)
        else CD_DownLoad(DeviceID,aCardNo,'N');
      end;
    end;
    Sleep(100);
    Application.ProcessMessages;
  end;
end;

procedure TMainForm.RzBitBtn48Click(Sender: TObject);
var
  stDeviceID : string;
begin
  Label141.Caption := '';
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'R','CD00',Sent_Ver);
end;

procedure TMainForm.RzBitBtn49Click(Sender: TObject);
var
  stDeviceID : string;
begin
  Label142.Caption := '';
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'R','CD01',Sent_Ver);

end;

procedure TMainForm.RzBitBtn50Click(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'R','CD11',Sent_Ver);

end;

procedure TMainForm.RzBitBtn51Click(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'R','CD12',Sent_Ver);

end;

procedure TMainForm.RzBitBtn52Click(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'R','CD10',Sent_Ver);

end;

procedure TMainForm.RegControlDialTime(aDeviceID: String; OnTime,
  OffTime: Integer);
var
  aTime: Integer;
  bTIme: Integer;
  Timestr: string;
begin
  aTime:= onTime div 20;
  bTime:= OffTime div 20;

  Timestr:= FillZeroNumber(aTime,2) +   // On Time
            FillZeroNumber(bTime,2);    // Off Time
  SendPacket(aDeviceID,'I','DT00'+TimeStr,Sent_Ver);

end;

procedure TMainForm.btn_ControlRegClick(Sender: TObject);
var
  DeviceID:String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegControlDialTime(DeviceID,StrtoInt(cmb_ControlOnTime.Text),StrtoInt(cmb_ControlOffTime.Text));

end;

procedure TMainForm.CheckControlDialTime(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','DT00',Sent_Ver);
end;

procedure TMainForm.btn_ControlSearchClick(Sender: TObject);
var
  DeviceID:String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckControlDialTime(DeviceID);

end;

procedure TMainForm.RcvControlDialInfo(aPacketData: String);
var
  st: string;
  aTime: Integer;
  bTime: Integer;
begin
  cmb_ControlOnTime.Color:= ClYellow;
  cmb_ControlOffTime.Color:= ClYellow;
  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= copy(aPacketData,G_nIDLength + 15,4);
  aTime:= StrtoInt(Copy(st,1,2));
  bTime:= StrtoInt(Copy(st,3,2));

  cmb_ControlOnTime.Text:= InttoStr(aTime * 20);
  cmb_ControlOffTime.Text:= InttoStr(bTime * 20);
end;

procedure TMainForm.chk_SendTimeClick(Sender: TObject);
begin
  if chk_SendTime.Checked then ed_SendTime.Enabled := True
  else ed_SendTime.Enabled := False;
end;

procedure TMainForm.btn_CardDownLoadStopClick(Sender: TObject);
begin
  bCardDownLoadStop := True;
end;

procedure TMainForm.btn_SortClick(Sender: TObject);
begin
  SendPacket(Edit_CurrentID.text + ComboBox_IDNO.Text,'R','st00' + FillZeroNumber(strtoint(ed_SortMin.text),2),Sent_Ver);
end;

procedure TMainForm.btn_SortDispClick(Sender: TObject);
begin
  ed_SortDisp.Color:= clWhite;
  ed_SortDisp.Text := '';
  SendPacket(Edit_CurrentID.text + ComboBox_IDNO.Text,'R','sc00',Sent_Ver);

end;

procedure TMainForm.btn_CloseClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo.ItemIndex+1,'2','2' );

end;

procedure TMainForm.RzBitBtn53Click(Sender: TObject);
begin
    Notebook1.PageIndex:= 7;
end;

procedure TMainForm.RzBitBtn54Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 9;

end;

procedure TMainForm.Button4Click(Sender: TObject);
begin
  showmessage(ConvertToHex('abcdefg'));
end;


procedure TMainForm.CD_XDownLoad(aDevice, aCardNo: String; func: Char);
var
  aData: String;
  I: Integer;
  xCardNo: String;
  RealCardNo: String;
  ValidDay: String;
  aLength: Integer;
  stYY,stMM,stDD:String;
  aRegCode,aCardAuth,aInOutMode : String;
  stCardLength : string;
  stCardType : string;
begin

  aLength:= Length(aCardNo);
  if aLength < 10 then
    stCardLength := inttoStr(aLength)
  else
    stCardLength := Hex2Ascii(Dec2Hex(Ord('A') + (aLength - 10),2));

  //SHowMessage(aCardNo);
  RealCardNo:= Copy(aCardNo,1,10);
  ValidDay:=   Copy(aCardNo,11,6);
  //xCardNo:=  '00'+Dec2Hex64(StrtoInt64(RealCardNo),8);
  xCardNo:=  '00'+EncodeCardNo(RealCardNo);

  stYY := edYYYY.text;
  stMM := edMM.text;
  stDD := edDD.text;
  if (ck_YYMMDD.checked = False) or (stYY = '') then stYY := '0';
  if (ck_YYMMDD.checked = False) or (stMM = '') then stMM := '0';
  if (ck_YYMMDD.checked = False) or (stDD = '') then stDD := '0';

  aRegCode := inttostr(rdRegCode.itemindex);
  if rdCardAuth.itemindex > 0 then
    aCardAuth := inttostr(rdCardAuth.itemindex - 1)
  else aCardAuth := '2';
  aInOutMode := inttostr(rdInOutMode.itemindex);
  //순찰카드 추가
  if rg_tourCard.ItemIndex = 0 then stCardType := ' '
  else stCardType := 'V';

  aData:= '';
  aData:= func +
          //InttoStr(Send_MsgNo)+     // Message Count
          '0'+
          aRegCode+                      //등록코드(0:1,2   1:1번문,  2:2번문, 3:방범전용)
          ' '+                     //RecordCount #$20 #$20
          stCardType + 
          stCardLength +                      //카드번호길이
          aCardNo+                  //카드번호
//          ValidDay+                 //유효기간
          FillZeroNumber(strtoint(stYY),2) +
          FillZeroNumber(strtoint(stMM),2) +
          FillZeroNumber(strtoint(stDD),2) + //유효기간
          '0'+                      //등록 결과
          aCardAuth+                      //카드권한(0:출입전용,1:방범전용,2:방범+출입)
          aInOutMode;                      //타입패턴

  //SHowMessage(aData);
  SendPacket(aDevice,'c',aData,Sent_Ver);
end;

procedure TMainForm.btnKTLanSearchClick(Sender: TObject);
var
  stDeviceID : string;
begin
  LanControl_White;
  stDeviceID := Edit_CurrentID.text + '00';
  //SendPacket(stDeviceID, 'Q', 'NW50',Sent_Ver);
  KTNetSendPacket('QNW50','');

end;

procedure TMainForm.btnKTLanSetClick(Sender: TObject);
var
  stSendData : string;
  stDeviceID : string;
  bResult : boolean;
begin
  LanControl_White;
  bResult := LanPanelCheck;
  if Not bResult then
  begin
    showmessage('랜정보 셋팅데이터가 정확하지 않습니다.');
    Exit;
  end;
  stDeviceID := Edit_CurrentID.text + '00';
  //stSendData := 'NW50' + GetSetData;
  //SendPacket(stDeviceID, 'I', stSendData,Sent_Ver);
  KTNetSendPacket('INW50',GetSetData);

end;

function TMainForm.LanPanelCheck: boolean;
begin
  result := False;
  Try
    if ed_ip.Text = '' then Exit;
    if strtoint(ed_port.Text) < 0 then Exit;
    if ed_subnet.Text = '' then Exit;
    if ed_GateWay.Text = '' then Exit;
    if ed_ServerIp.Text = '' then Exit;
    if strtoint(ed_serverPort.Text) < 0 then Exit;
    if ed_AVServerIP.Text = '' then Exit;
    if strtoint(ed_AVServerPort.Text) < 0 then Exit;
    if ed_UserAVIP.Text = '' then Exit;
    if strtoint(ed_UserAVPort.Text) < 0 then Exit;
    if ed_Constate.Text = '' then ed_Constate.Text := 'C';
    if chk_Local.Checked then
    begin
      if ed_LocalIP.Text = '' then Exit;
      if strtoint(ed_LocalPort.Text) < 0 then Exit;
      if ed_LocalSubnet.Text = '' then Exit;
      if ed_LocalGateWay.Text = '' then Exit;
      if ed_LocalServerIP.Text = '' then Exit;
      if strtoint(ed_LocalServerPort.Text) < 0 then Exit;
    end else
    begin
      if ed_LocalIP.Text = '' then ed_LocalIP.Text := '127.0.0.1';
      if ed_LocalPort.Text = '' then ed_LocalPort.Text := '3000';
      if ed_LocalSubnet.Text = '' then ed_LocalSubnet.Text := '255.255.255.0';
      if ed_LocalGateWay.Text = '' then ed_LocalGateWay.Text := '127.0.0.1';
      if ed_LocalServerIP.Text = '' then ed_LocalServerIP.Text := '127.0.0.1';
      if ed_LocalServerPort.Text = '' then ed_LocalServerPort.Text := '3000';
    end;
    if ed_LocalConstate.Text = '' then ed_LocalConstate.Text := 'C';
  Except
    Exit;
  End;
  result := True;
end;

function TMainForm.GetSetData: string;
var
  stData : string;
begin
  stData := '1';  //네트웍정보
  stData := stData + '000000000000';          //MAC
  stData := stData + IPtoHex(ed_ip.Text);           //IP
  stData := stData + IPtoHex(ed_subnet.Text);       //SUBNET
  stData := stData + IPtoHex(ed_gateway.Text);      //GateWay
  stData := stData + PortToHex(ed_port.Text);       //Port
  stData := stData + IPtoHex(ed_ServerIp.Text);     //ServerIp
  stData := stData + PortToHex(ed_ServerPort.Text); //ServerPort
  if rg_nm.ItemIndex = 0 then                       //NetWork Mode
    stData := stData + 'C'
  else stData := stData + 'S';
  if rg_Dhcp.ItemIndex < 0 then rg_Dhcp.ItemIndex := 0;
  stData := stData + inttostr(rg_Dhcp.ItemIndex);
  stData := stData + ed_Constate.Text;               //Connect Sate
  stData := stData + '^';
  if chk_Local.Checked then stData := stData + '1'  //로칼 네트웍 정보
  else stData := stData + '0';
  stData := stData + '000000000000'; //Local Mac
  stData := stData + IPtoHex(ed_Localip.Text);           //LocalIP
  stData := stData + IPtoHex(ed_Localsubnet.Text);       //LocalSUBNET
  stData := stData + IPtoHex(ed_Localgateway.Text);      //LocalGateWay
  stData := stData + PortToHex(ed_Localport.Text);       //LocalPort
  stData := stData + IPtoHex(ed_LocalServerIp.Text);     //LocalServerIp
  stData := stData + PortToHex(ed_LocalServerPort.Text); //LocalServerPort
  if rg_Localnm.ItemIndex = 0 then                       //LocalNetWork Mode
    stData := stData + 'C'
  else stData := stData + 'S';
  if rg_LocalDhcp.ItemIndex < 0 then rg_LocalDhcp.ItemIndex := 0;
  stData := stData + inttostr(rg_LocalDhcp.ItemIndex);
  stData := stData + ed_LocalConstate.Text;               //LocalConnect Sate
  stData := stData + '^';
  stData := stData + IPtoHex(ed_AVServerIP.Text);         //AV Manager Server Ip
  stData := stData + PortToHex(ed_AVServerPort.Text);     //AV Manager Server Port
  stData := stData + IPtoHex(ed_UserAVIP.Text);         //AV Generl Server Ip
  stData := stData + PortToHex(ed_UserAVPort.Text);     //AV Generl Server Port
  if rg_Debug.ItemIndex < 0 then rg_Debug.ItemIndex := 0;
  stData := stData + inttostr(rg_Debug.ItemIndex);
  stData := stData + FillSpace(ed_Version.Text,4);

  result := stData;
end;

function TMainForm.RcvKTLAN(aPacketData: string): Boolean;
begin

  ed_mac.Text := MacFormat(copy(aPacketData,7,12));     //Mac
  ed_ip.Text := HexToIP(copy(aPacketData,19,8));         //IP
  ed_Subnet.Text := HexToIP(copy(aPacketData,27,8));    //SubNet
  ed_GateWay.Text := HexToIP(copy(aPacketData,35,8));   //GateWay
  ed_port.Text := Hex2DecStr(copy(aPacketData,43,4));   //Port
  ed_Serverip.Text := HexToIP(copy(aPacketData,47,8));  //ServerIP
  ed_ServerPort.Text := Hex2DecStr(copy(aPacketData,55,4));  //ServerPort
  if copy(aPacketData,59,1) = 'S' then rg_NM.ItemIndex := 1
  else rg_NM.ItemIndex := 0;
  rg_Dhcp.ItemIndex := strtoint(copy(aPacketData,60,1));
  if copy(aPacketData,61,1) = 'C' then ed_Connect.Text := 'Connected'
  else ed_Connect.Text := 'DisConnected';
  ed_Constate.Text := copy(aPacketData,61,1);
  if copy(aPacketData,63,1) = '1' then
  begin
    chk_Local.Checked := True;
    ViewLocal;
  end else
  begin
    chk_Local.Checked := False;
    HideLocal;
  end;
  ed_LocalMac.Text := MacFormat(copy(aPacketData,64,12));  //Local Mac
  ed_LocalIP.Text := HexToIP(copy(aPacketData,76,8));  //LocalIP
  ed_LocalSubnet.Text := HexToIP(copy(aPacketData,84,8));  //LocalSubNet
  ed_LocalGateWay.Text := HexToIP(copy(aPacketData,92,8));  //LocalGateWay
  ed_LocalPort.Text := Hex2DecStr(copy(aPacketData,100,4));  //LocalPort
  ed_LocalServerIP.Text := HexToIP(copy(aPacketData,104,8));  //LocalServerIP
  ed_LocalServerPort.Text := Hex2DecStr(copy(aPacketData,112,4));  //LocalServerPort
  if copy(aPacketData,116,1) = 'S' then rg_LocalNM.ItemIndex := 1
  else rg_LocalNM.ItemIndex := 0;
  rg_LocalDhcp.ItemIndex := strtoint(copy(aPacketData,117,1));
  if copy(aPacketData,118,1) = 'C' then ed_LocalConnect.Text := 'Connected'
  else ed_LocalConnect.Text := 'DisConnected';
  ed_LocalConState.Text := copy(aPacketData,118,1);
  ed_AVServerIP.Text := HexToIP(copy(aPacketData,120,8));  //AV Manager IP
  ed_AVServerPort.Text := Hex2DecStr(copy(aPacketData,128,4));  //AV Manager Port
  ed_UserAVIP.Text := HexToIP(copy(aPacketData,132,8));  //AV General IP
  ed_UserAVPort.Text := Hex2DecStr(copy(aPacketData,140,4));  //AV General Port
  rg_debug.ItemIndex := strtoint(copy(aPacketData,144,1));  //Debug Code
  ed_Version.Text := copy(aPacketData,145,4);  //Version
  LanControl_Yellow;
end;

procedure TMainForm.LanControl_Yellow;
begin
    //chk_Local.Color := clWhite;
    //ed_mac.Color := clYellow;
    ed_ip.Color := clYellow;
    ed_Subnet.Color := clYellow;
    ed_GateWay.Color := clYellow;
    ed_port.Color := clYellow;
    ed_Serverip.Color := clYellow;
    ed_ServerPort.Color := clYellow;
    //rg_NM.Color := clWhite;
    //rg_Dhcp.Color := clWhite;
    ed_Connect.Color := clYellow;
    ed_Constate.Color := clYellow;
    //ed_LocalMac.Color := clYellow;
    ed_LocalIP.Color := clYellow;
    ed_LocalSubnet.Color := clYellow;
    ed_LocalGateWay.Color := clYellow;
    ed_LocalPort.Color := clYellow;
    ed_LocalServerIP.Color := clYellow;
    ed_LocalServerPort.Color := clYellow;
    //rg_LocalNM.Color := clWhite;
    //rg_LocalDhcp.Color := clWhite;
    ed_LocalConnect.Color := clYellow;
    ed_LocalConState.Color := clYellow;
    ed_AVServerIP.Color := clYellow;
    ed_AVServerPort.Color := clYellow;
    ed_UserAVIP.Color := clYellow;
    ed_UserAVPort.Color := clYellow;
    //rg_debug.Color := clWhite;
    ed_Version.Color := clYellow;
end;

procedure TMainForm.HideLocal;
begin
  Label157.Enabled := False;
  ed_LocalIP.Enabled := False;
  Label158.Enabled := False;
  ed_LocalPort.Enabled := False;
  Label159.Enabled := False;
  ed_LocalSubnet.Enabled := False;
  rg_LocalNm.Enabled := False;
  Label160.Enabled := False;
  ed_LocalGateWay.Enabled := False;
  Label161.Enabled := False;
  ed_LocalServerIP.Enabled := False;
  Label162.Enabled := False;
  ed_LocalServerPort.Enabled := False;
  ed_LocalConnect.Enabled := False;

end;

procedure TMainForm.ViewLocal;
begin

  Label157.Enabled := True;
  ed_LocalIP.Enabled := True;
  Label158.Enabled := True;
  ed_LocalPort.Enabled := True;
  Label159.Enabled := True;
  ed_LocalSubnet.Enabled := True;
  rg_LocalNm.Enabled := True;
  Label160.Enabled := True;
  ed_LocalGateWay.Enabled := True;
  Label161.Enabled := True;
  ed_LocalServerIP.Enabled := True;
  Label162.Enabled := True;
  ed_LocalServerPort.Enabled := True;
  ed_LocalConnect.Enabled := True;

end;

procedure TMainForm.chk_LocalClick(Sender: TObject);
begin
  if chk_Local.Checked then ViewLocal
  else HideLocal;

end;

procedure TMainForm.LanControl_White;
begin
    //chk_Local.Color := clWhite;
    //ed_mac.Color := clYellow;
    ed_ip.Color := clWhite;
    ed_Subnet.Color := clWhite;
    ed_GateWay.Color := clWhite;
    ed_port.Color := clWhite;
    ed_Serverip.Color := clWhite;
    ed_ServerPort.Color := clWhite;
    //rg_NM.Color := clWhite;
    //rg_Dhcp.Color := clWhite;
    ed_Connect.Color := clWhite;
    ed_Constate.Color := clWhite;
    //ed_LocalMac.Color := clYellow;
    ed_LocalIP.Color := clWhite;
    ed_LocalSubnet.Color := clWhite;
    ed_LocalGateWay.Color := clWhite;
    ed_LocalPort.Color := clWhite;
    ed_LocalServerIP.Color := clWhite;
    ed_LocalServerPort.Color := clWhite;
    //rg_LocalNM.Color := clWhite;
    //rg_LocalDhcp.Color := clWhite;
    ed_LocalConnect.Color := clWhite;
    ed_LocalConState.Color := clWhite;
    ed_AVServerIP.Color := clWhite;
    ed_AVServerPort.Color := clWhite;
    ed_UserAVIP.Color := clWhite;
    ed_UserAVPort.Color := clWhite;
    //rg_debug.Color := clWhite;
    ed_Version.Color := clWhite;
end;

function TMainForm.KTNetSendPacket(aCmd, aSendData: string): Boolean;
var
  stSendData : string;
begin
  stSendData := aCmd + aSendData;
  if KTWinsock.Open then KTWinsock.Open := False;
  KTWinsock.WsAddress := CB_IPList.Text;
  KTWinsock.WsPort := inttostr(TCPPort);
  KTWinsock.Open := True;
  KTWinsock.PutString(stSendData);
  result := True;

end;

procedure TMainForm.KTRcvDataProcess;
var
  nIndex : integer;
  stPacket : string;
  nLen : integer;
begin
  nIndex := Pos('NW50',KTRecvData);
  if nIndex < 2 then
  begin
    KTRecvData := '';
    Exit;
  End;
  While Length(KTRecvData) >= 148 do
  begin
    if nIndex > 2 then Delete(KTRecvData,1,nIndex - 1);
    nLen := Length(KTRecvData);
    if  nLen < 148 then Exit;
    stPacket := copy(KTRecvData,1,148);
    Delete(KTRecvData,1,148);
    RcvKTLAN(stPacket);
  end;
end;


procedure TMainForm.RzBitBtn58Click(Sender: TObject);
begin
btnKTLanSearchClick(self);
end;

procedure TMainForm.RzBitBtn59Click(Sender: TObject);
begin
  btnKTLanSetClick(self);
end;

procedure TMainForm.RzButton5Click(Sender: TObject);
var
  stExe:string;
begin
  stExe := 'cmd.exe /c ping.exe ' + CB_IPList.text ;//+ ' -t';
  My_RunDosCommand(stExe,True);
  //winexec(pchar(stExe),0);
  //winexec('cmd.exe /c "배치파일경로\배치파일명.bat"', 0);
  //ShellExecute(0,Nil,pchar(stExe),Nil,Nil,SW_SHOWNORMAL);
end;

procedure TMainForm.RzButton6Click(Sender: TObject);
var
  stExe:string;
begin
  stExe := 'cmd.exe /c ping.exe ' + CB_IPList.text + ' -t';
  My_RunDosCommand(stExe,True);
  showmessage('test');
end;

procedure TMainForm.RzBitBtn60Click(Sender: TObject);
var
  No: Integer;
  DeviceID: String;
begin
  No:= 0;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegLinksTellNo(DeviceID,No,edLinkusTel00.Text);
end;

procedure TMainForm.AutoCardDownLoad(bCardNo,aMode,aDeviceID: string;aLength:integer = 10;bHex:Boolean = False);
var
  stDeviceID : string;
begin
    //stDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
    stDeviceID := aDeviceID;
    //메모장에 등록
    Append_Memo_CardNo(bCardNo);
    // 다운로드
    if aMode = 'E' then  CD_DownLoad(stDeviceID,bCardNo+'000000' ,'L',aLength,bHex)
    else if aMode = 'X' then CD_XDownLoad(stDeviceID,bCardNo,'L');
end;

//******************************************//
//***********버튼 클릭시 동작 모드 *********//
//******************************************//

//파일 불러와서 기존 데이터와 동일하게 뿌려줌
procedure TMainForm.mn_FileLoadClick(Sender: TObject);
var
  aFile: String;
  FileList : TStringList;
  LineList : TStringList;
  i : integer;
  stTime : string;
  CurTime : TDateTime;
  BeforTime:TDateTime;
  SpaceTime : Cardinal;
  st : string;
  stMulti : string;
  FirstTickCount: Longint;
  stCmd : string;
  stFullData : string;
  stRealData : string;
  stDeviceID : string;
begin

  bStart := True;
  bFileSkip := False;
  bStop := False;
  btn_Play.Enabled := False;
  btn_Moment.Enabled := True;
  btn_Stop.Enabled := True;
  pn_Gauge.Visible := True;

  FileList := TStringList.Create;
  LineList := TStringList.Create;
  BeforTime := Now + 1;

  RzOpenDialog1.InitialDir:= ExtractFileDir(Application.ExeName);
  if RzOpenDialog1.Execute then
  begin
    FileList.Clear;
    aFile:= RzOpenDialog1.FileName;
    FileList.LoadFromFile(aFile);
    Gauge1.MaxValue := FileList.Count;
    Gauge1.Progress := 0;
    for i:=0 to FileList.Count - 1 do
    begin
      if bStop then
      begin
        FileList.Free;
        LineList.Free;
        pn_Gauge.Visible := False;
        Exit;
      end;
      
      stMulti := cmb_Multi.Text;
      stMulti := StringReplace(stMulti,'X','',[rfReplaceAll]);
      if stMulti = '' then stMulti := '1';
      stTime := FindCharCopy(FileList.Strings[i],2,',');
      //stTime := LineList.Strings[2];
      try
        CurTime := strToDateTime(stTime);
      Except
        st:=  StringReplace(FindCharCopy(FileList.Strings[i],4,','),'"','',[rfReplaceAll]) +#9+
              StringReplace(FindCharCopy(FileList.Strings[i],5,','),'"','',[rfReplaceAll]) +#9+
              StringReplace(FindCharCopy(FileList.Strings[i],6,','),'"','',[rfReplaceAll]) +#9+
              StringReplace(FindCharCopy(FileList.Strings[i],7,','),'"','',[rfReplaceAll]) +#9+
              StringReplace(FindCharCopy(FileList.Strings[i],8,','),'"','',[rfReplaceAll]) +#9+
              StringReplace(FindCharCopy(FileList.Strings[i],1,','),'"','',[rfReplaceAll]) +#9+
              StringReplace(FindCharCopy(FileList.Strings[i],9,','),'"','',[rfReplaceAll]) +#9+
              StringReplace(FindCharCopy(FileList.Strings[i],3,','),'"','',[rfReplaceAll]);

        AddEventList(st);
        Gauge1.Progress := Gauge1.Progress + 1;
        continue;
      end;
      if BeforTime < Now then
      begin
        SpaceTime := DateTimeToUnix(CurTime * 1000) - DateTimeToUnix(BeforTime * 1000);
        //Application.ProcessMessages;
        SpaceTime := SpaceTime div strtoint(stMulti);
        FirstTickCount := GetTickCount + SpaceTime;
        while True do
        begin
          if bFileSkip then Break;
          Application.ProcessMessages;
          if GetTickCount > FirstTickCount then Break;  //300밀리동안 응답 없으면 실패로 처리함
          if SpaceTime > 3000 then
          begin
            Gauge2.MaxValue := SpaceTime;
            Gauge2.Progress := GetTickCount - (FirstTickCount - SpaceTime);
          end;
        end;
        Gauge2.Progress := 0;
        bFileSkip := False;
        //delay(SpaceTime);
        //Sleep(SpaceTime);
      end;
      BeforTime := CurTime;

      While Not bStart do
      begin
        Application.ProcessMessages;
      end;

      st:=  StringReplace(FindCharCopy(FileList.Strings[i],4,','),'"','',[rfReplaceAll]) +#9+
            StringReplace(FindCharCopy(FileList.Strings[i],5,','),'"','',[rfReplaceAll]) +#9+
            StringReplace(FindCharCopy(FileList.Strings[i],6,','),'"','',[rfReplaceAll]) +#9+
            StringReplace(FindCharCopy(FileList.Strings[i],7,','),'"','',[rfReplaceAll]) +#9+
            StringReplace(FindCharCopy(FileList.Strings[i],8,','),'"','',[rfReplaceAll]) +#9+
            StringReplace(FindCharCopy(FileList.Strings[i],1,','),'"','',[rfReplaceAll]) +#9+
            StringReplace(FindCharCopy(FileList.Strings[i],9,','),'"','',[rfReplaceAll]) +#9+
            StringReplace(FindCharCopy(FileList.Strings[i],3,','),'"','',[rfReplaceAll]);

      AddEventList(st);
      stCmd:= FindCharCopy(st,3,#9);
      if stCmd = 'c' then
      begin
        stFullData := FindCharCopy(st,6,#9);
        stRealData := Copy(stFullData,19,Length(stFullData)-20);
        stDeviceID := FindCharCopy(st,1,#9);
        case stRealData[1] of
          'F': RcvTelEventData(stRealData);
          'E','J': RcvAccEventData(stRealData,stDeviceID,False);
          'X': RcvAccXEventData(stRealData,stDeviceID,False);
          'D': RcvDoorEventData(stRealData);
          'a': RcvSysinfo2(stRealData);        //기기 등록 응답
          'b': RcvSysinfo2(stRealData);        //기기 조회 응답
          'c': RcvAccControl(stRealData);      //기기 제어 응답
      'l','n','m','e','h','d': RcvCardRegAck(stRealData);  //카드등록응답
      's','p': RcvSch(stRealData);             // 스케줄 응답
          'v': RcvFoodTime(stRealData);        //식사시간응답
        end;
      end;
      Gauge1.Progress := Gauge1.Progress + 1;
//      LineList.DelimitedText
    end;
  end;

  FileList.Free;
  LineList.Free;
  pn_Gauge.Visible := False;

end;

{ID등록}
procedure TMainForm.RzGroup2Items0Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 0;
end;
//ID등록
procedure TMainForm.RegClick(Sender: TObject);
var
  DeviceID: String;
//  bResult : Boolean;
begin
{}
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if sender = RzBitBtn1 then RegID(Edit_DeviceID.Text);
  if Sender = RzBitBtn7 then RegSysInfo(DeviceID)
  else if Sender = RzBitBtn5 then RegCR(DeviceID,Group_CardReader.ItemIndex,cmb_WCardBit.text);

  Case Notebook1.PageIndex of
    2: RegPort(DeviceID,Group_Port.ItemIndex);
    3: begin RegSch(DeviceID); end;
    4: RegRelay(DeviceID,Group_Relay.ItemIndex);
  end;
end;

//사용컨트롤러 검색
procedure TMainForm.btn_UseControlerSearchClick(Sender: TObject);
var
  DeviceID: String;
begin
{}
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if Sender = btn_BroadControlsearch then CheckUsedDevice(DeviceID,'1')
  else CheckUsedDevice(DeviceID,'0');
end;


//출입 이벤트 선택 카드 등록
procedure TMainForm.btCardRegClick(Sender: TObject);
var
 DeviceID : String;
 i,j : Integer;
 aCardNo : String;
 stPositoinCardNumber : string;
 nLength : integer;
begin
  Label136.Caption :=inttostr(LMDListBox1.SelCount);
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if (chk_CardPosition.Checked) or (chk_CardPosition2.Checked) then
  begin
    if Not Isdigit(ed_CardPosition.Text) then
    begin
      showmessage('카드 위치는 숫자 5자리 이내입니다.');
      Exit;
    end;
    ed_CardPositionNumber.Color := clWhite;
    ed_CardPosition.Color := clWhite;
    ed_CardPositionHex.Color := clWhite;
    stPositoinCardNumber := Trim(ed_CardPositionHex.Text);
    nLength := Length(stPositoinCardNumber);
    if rg_CardType.ItemIndex <> 1 then
    begin
      stPositoinCardNumber := inttostr(Hex2Dec64(stPositoinCardNumber));
      if chk_CardPosition.Checked then CD_PositionDownLoad(DeviceID,stPositoinCardNumber,ed_CardPosition.Text,'E')
      else CD_PositionDownLoad(DeviceID,stPositoinCardNumber,ed_CardPosition.Text,'J');
    end else
    begin
      if chk_CardPosition.Checked then CD_PositionDownLoad(DeviceID,stPositoinCardNumber,ed_CardPosition.Text,'E',nLength,True)
      else CD_PositionDownLoad(DeviceID,stPositoinCardNumber,ed_CardPosition.Text,'J',nLength,True);
    end;
    Exit;
  end;
  for i:= 0 to  LMDListBox1.Count - 1 do
  begin
    if  LMDListBox1.Selected[i] then
    begin
      aCardNo:= Trim(FindCharCopy(LMDListBox1.Items.Strings[i],10,';'));
      Label136.Caption := LMDListBox1.Items.Strings[i];
      if chk_CmdX.Checked then CD_XDownLoad(DeviceID,aCardNo,'L')
      else
      begin
        nLength := Length(aCardNo);
        if rg_CardType.ItemIndex = 1 then CD_DownLoad(DeviceID,aCardNo,'L',nLength,True)
        else CD_DownLoad(DeviceID,aCardNo,'L');
      end;
      Sleep(100);
      Application.ProcessMessages;
    end;
  end;
end;
//다운로드 재전송 버튼 클릭시
procedure TMainForm.btBroadFileRetryClick(Sender: TObject);
var
  stData,st : String;
  Loop : integer;
  stBroadControlNum : String;
begin

//BroadControlNumConvert(Num)
   btBroadFileRetry.enabled := False;
   bBroadFileSendERR := False;
   
   BroadSendDataList.Clear;

   IsFirmwareDownLoad := True;

   for Loop := 0 to BroadErrorDataList.count - 1 do
   begin
      st := BroadErrorDataList.Strings[Loop];
      stBroadControlNum := BroadControlNumConvert(strtoint(copy(st,1,2)));
      st := copy(st,3,4) + FillZeroNumber(Loop+1,7) + copy(st,15,Length(st)-15);
      st := copy(st,1,11) + stBroadControlNum + copy(st,30,Length(st)-30);
      BroadSendDataList.Add(st);
   end;
   BroadErrorDataList.Clear;
  //송신데이터 생성
  if rdMode.ItemIndex = 3 then   //Server 이면
  begin
    stData := 'BI' + BroadID + FillZeroNumber(BroadSendDataList.count,7);
  end
  else if rdMode.ItemIndex = 2 then   //Main 이면
  begin
    stData := 'BS' + BroadID + FillZeroNumber(BroadSendDataList.count,7);
  end else
  begin
    exit;
  end;

  SendPacket(Edit_CurrentID.Text + '00','*',stData,Sent_Ver);

end;

{카드 데이터 브로드캐스팅 전송}
procedure TMainForm.RzGroup2Items8Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 15;
end;
//카드 데이터 브로드캐스팅 버튼 클릭
procedure TMainForm.bt_BroadClick(Sender: TObject);
var
  stDeviceID : String;
  stData : String;
  Loop : integer;
begin
  BroadSendDataList.Clear;
  BroadErrorDataList.Clear;
  btBroadRetry.Enabled := False;

  startTime := Now;
  lb_start.Caption := '시작:' + FormatDateTime('hh:mm:ss',startTime);
  lb_end.Caption := '종료:' ;

  btBroadStop.Enabled := True;
  //여기서 한번만 Controler 셋팅해주자.
  BroadControlerNum := '';
  BroadControlerNum := GetBroadControlerNum(Group_BroadDevice);

  CurCBCount := 0 ; //현재 진행 건수를 0으로 표시하자

  {전송건수 추출}
  CardBroadSendCount := GetSendCount();
  //ControlID추출
  stDeviceID := Edit_CurrentID.Text + '00';

  //송신데이터 생성
  if rdMaster.ItemIndex = 0 then   //Server 이면
  begin
    stData := 'BI' + FillZeroNumber(CardBroadSendCount,9);
  end
  else
  begin
    stData := 'BS' + FillZeroNumber(CardBroadSendCount,9);
  end;

  //여기에서 송신할 데이터를 만들어 버릴까나???
  BroadOrgDataList.Clear;
  for Loop := 0 to CardBroadSendCount - 1 do
  begin
    BroadOrgDataList.Add(MakeBroadData(Loop + 1));
  end;
  BroadSendDataList := BroadOrgDataList;
  //데이터 전송
  SendPacket(stDeviceID,'*',stData,Sent_Ver);

end;
//카드 데이터 브로드 캐스트 중지 버튼 클릭
procedure TMainForm.btBroadStopClick(Sender: TObject);
var
  stDeviceID : String;
  stData : String;
begin
  btBroadStop.Enabled := False;
  //ControlID추출
  stDeviceID := Edit_CurrentID.Text + '00';

  //송신데이터 생성
  if rdMaster.ItemIndex = 0 then   //Server 이면
  begin
    CardBroadSendCount := 0;
    stData := 'BI' + FillZeroNumber(0,9);
  end
  else
  begin
    stData := 'BS' + FillZeroNumber(0,9);
  end;
  
  //데이터 전송
  SendPacket(stDeviceID,'*',stData,Sent_Ver);
end;
//카드 데이터 브로드캐스팅 재전송
procedure TMainForm.btBroadRetryClick(Sender: TObject);
var
  stData,st : String;
  Loop : integer;
begin

  btBroadRetry.enabled := False;
  startTime := Now;
  btBroadStop.Enabled := True;
  lb_start.Caption := '시작:' + FormatDateTime('hh:mm:ss',startTime);
  lb_end.Caption := '종료:' ;

   BroadSendDataList.Clear;

   for Loop := 0 to BroadErrorDataList.count - 1 do
   begin
      st := BroadErrorDataList.Strings[Loop];
      st := copy(st,1+2,2) + FillZeroNumber(Loop+1+2,9) + copy(st,11+2,Length(st)-13);
      BroadSendDataList.Add(st);
   end;
   BroadErrorDataList.Clear;
  //송신데이터 생성
  if rdMaster.ItemIndex = 0 then   //Server 이면
  begin
    stData := 'BI' + FillZeroNumber(BroadSendDataList.count,9);
  end
  else
  begin
    stData := 'BS' + FillZeroNumber(BroadSendDataList.count,9);
  end;

  SendPacket(Edit_CurrentID.Text + '00','*',stData,Sent_Ver);
end;
//카드데이터 브로드캐스팅-파일찾기 클릭
procedure TMainForm.btBroadFileClick(Sender: TObject);
begin
  OpenDialog1.Title:= '카드 데이터 찾기';
  OpenDialog1.DefaultExt:= 'txt';
//  OpenDialog1.Options := [ofReadOnly]	;
  OpenDialog1.Filter := 'TXT files (*.txt)|*.TXT';
  if OpenDialog1.Execute then
  begin
    BroadFileList.Clear;
    edBRFileLoad.text := OpenDialog1.FileName;
    if edBRFileLoad.text <> '' then
    begin
      if fileexists(edBRFileLoad.text) = true then BroadFileList.LoadFromFile(edBRFileLoad.text);
    end;
  end;
end;
procedure TMainForm.Cnt_CheckDeviceCode(aDeviceID: string);
begin
  SendPacket(aDeviceID,'R','VR01',Sent_Ver);
end;

procedure TMainForm.tbDeviceCodeClick(Sender: TObject);
begin
  Cnt_CheckDeviceCode(Edit_CurrentID.Text + ComboBox_IDNO.Text);
  edDeviceCode.Text:= '';
end;

procedure TMainForm.RzBitBtn4Click(Sender: TObject);
begin
  Memo_CardNo.Clear;
end;

procedure TMainForm.RzBitBtn45Click(Sender: TObject);
begin
Memo2.Clear;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if IsFirmwareDownLoad then
  begin
    if (Application.MessageBox(PChar('Firmware DownLoad 중에는 프로그램 종료 할수 없습니다.' + #13 + '강제로 종료 하시겠습니까?'),'경고',MB_OKCANCEL) = ID_CANCEL)   then  CanClose := False
    Else begin
      FTPUSE := False;
      RzBitBtn21Click(Self);
    end;
  end;

end;

procedure TMainForm.btn_ResetClearClick(Sender: TObject);
begin
//  chk_Reset.Color := clWhite;
  if Application.MessageBox('기기의 Reset데이터가 삭제 됩니다. 계속하시겠습니까?','주의',MB_OKCANCEL) = IDCANCEL then Exit;	

  ed_ResetMin.Color := clWhite;
  ed_firstResetTime.Color := clWhite;
  ed_LastResetTime.Color := clWhite;
  ed_AvrResetTime.Color := clWhite;
  ed_TotResetCnt.Color := clWhite;
  ed_resetDay.Color := clWhite;
  ed_resetHour.Color := clWhite;

  SendPacket(Edit_CurrentID.Text + ComboBox_IDNO.Text,'I','0@000',Sent_Ver);
end;

procedure TMainForm.btn_ResetRegClick(Sender: TObject);
var
  stSendData,stReset,stTime : string;
  rTime : Real;
  nTime : integer;
  nIndex : integer;
begin
//  chk_Reset.Color := clWhite;
  if ed_ResetMin.Text = '' then ed_ResetMin.Text := '6';
  
  ed_ResetMin.Color := clWhite;
  ed_firstResetTime.Color := clWhite;
  ed_LastResetTime.Color := clWhite;
  ed_AvrResetTime.Color := clWhite;
  ed_TotResetCnt.Color := clWhite;
  ed_resetDay.Color := clWhite;
  ed_resetHour.Color := clWhite;

  if rg_regReset.ItemIndex < 0 then rg_regReset.ItemIndex := 0;
  
  if chk_Reset.Checked then  stReset := '1'
  else stReset := '0';
  stSendData := inttostr(rg_regReset.ItemIndex) + ' ' + stReset + ' ' + stReset; 
  stTime := FloatTostr(StrToFloat(ed_ResetMin.Text) * 60);
  nIndex := pos('.',stTime);
  if nIndex > 0 then stTime := copy(stTime,0,nIndex-1);
  stTime := FillZeroNumber(strtoint(stTime),10);
  stSendData := stSendData + ' ' + stTime;
  SendPacket(Edit_CurrentID.Text + ComboBox_IDNO.Text,'I','0@01' + stSendData,Sent_Ver);
end;

procedure TMainForm.btn_ResetSearchClick(Sender: TObject);
begin
//  chk_Reset.Color := clWhite;
  ed_ResetMin.Color := clWhite;
  ed_firstResetTime.Color := clWhite;
  ed_LastResetTime.Color := clWhite;
  ed_AvrResetTime.Color := clWhite;
  ed_TotResetCnt.Color := clWhite;
  ed_resetDay.Color := clWhite;
  ed_resetHour.Color := clWhite;

  SendPacket(Edit_CurrentID.Text + ComboBox_IDNO.Text,'Q','0@01',Sent_Ver);

end;

procedure TMainForm.RcvResetData(aPacketData: string);
var
  stData: string;
  stReset: string;
  stTime: string;
  stResetCnt: string;
  stTotReset : string;
  stTotResetTime: string;
  stFirstResetTime: string;
  stLastResetTime: string;
  stFirstDiffResetTime : string;
  stLastDiffResetTime: string;
  nTime : integer;
  nAvrResetTime : integer;
  stPower : string;

begin
  Delete(aPacketData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  stData := Copy(aPacketData, G_nIDLength + 11, Length(aPacketData) - (G_nIDLength + 10));
  stPower := Copy(stData,5,1);
  stReset := Copy(stData,7,1);
  stTime := copy(stData,11,10);
  stResetCnt := copy(stData,22,10);
  stTotReset := copy(stData,33,10);
  stTotResetTime := Copy(stData,44,10);
  stFirstDiffResetTime := Copy(stData,55,10);
  stLastDiffResetTime := Copy(stData,66,10);
  stFirstResetTime := Copy(stData,77,19);
  stLastResetTime := Copy(stData,97,19);
  
  rg_regReset.ItemIndex := strtoint(stPower);
  if stReset = '1' then chk_Reset.Checked := True
  else chk_Reset.Checked := False;
  nTime := strtoint(stTime) div 60;
  ed_ResetMin.Text := inttostr(nTime);
  ed_LastResetTime.Text := stLastResetTime;
  ed_resetDay.Text := inttostr(GetDay(strtoint(stLastDiffResetTime)));
  ed_ResetHour.Text := inttostr(GetHour(strtoint(stLastDiffResetTime)));
  nAvrResetTime := 0;
  if strtoint(stResetCnt) > 0 then
  begin
    nAvrResetTime := TRUNC(( strtoint(stTotResetTime) / strtoint(stResetCnt) ) / 60);
    ed_firstResetTime.Text := stFirstResetTime;
    ed_fresetDay.Text := inttostr(GetDay(strtoint(stFirstDiffResetTime)));
    ed_fResetHour.Text := inttostr(GetHour(strtoint(stFirstDiffResetTime)));
  end else
  begin
    ed_firstResetTime.Text := stLastResetTime;
    ed_fresetDay.Text := inttostr(GetDay(strtoint(stLastDiffResetTime)));
    ed_fResetHour.Text := inttostr(GetHour(strtoint(stLastDiffResetTime)));
  end;
  ed_AvrResetTime.Text := inttostr(nAvrResetTime);
  ed_TotResetCnt.Text := inttostr(strtoint(stResetCnt));
//  chk_Reset.Color := clYellow;
  ed_ResetMin.Color := clYellow;
  ed_firstResetTime.Color := clYellow;
  ed_LastResetTime.Color := clYellow;
  ed_AvrResetTime.Color := clYellow;
  ed_TotResetCnt.Color := clYellow;
  ed_resetDay.Color := clYellow;
  ed_resetHour.Color := clYellow;
  Edit_right_align(self,ed_ResetMin);
  Edit_right_align(self,ed_TotResetCnt);
  Edit_right_align(self,ed_AvrResetTime);

end;
//Edit 오른쪽 정렬
procedure TMainForm.Edit_right_align(Sender: TObject; edt_name: TEdit);
var
AStyle:Integer;
begin
AStyle:=GetWindowLong(edt_name.Handle,GWL_STYLE);
AStyle:=AStyle or ES_RIGHT;
SetWindowLong(edt_name.Handle,GWL_STYLE,AStyle);
edt_name.Repaint;
end;

procedure TMainForm.ed_ResetMinChange(Sender: TObject);
begin
  Edit_right_align(self,ed_ResetMin);
end;

procedure TMainForm.chk_ResetClick(Sender: TObject);
begin
  if chk_Reset.Checked then
  begin
    ed_ResetMin.Enabled := True;
    Label78.Enabled := True;
  end
  else
  begin
    ed_ResetMin.Enabled := False;
    Label78.Enabled := False;
  End;
end;

procedure TMainForm.PageControl2Change(Sender: TObject);
begin
  if chk_Reset.Checked then
  begin
    ed_ResetMin.Enabled := True;
    Label78.Enabled := True;
  end
  else
  begin
    ed_ResetMin.Enabled := False;
    Label78.Enabled := False;
  End;
end;

procedure TMainForm.ed_AvrResetTimeChange(Sender: TObject);
begin
  Edit_right_align(self,ed_AvrResetTime);
end;

procedure TMainForm.ed_TotResetCntChange(Sender: TObject);
begin
  Edit_right_align(self,ed_TotResetCnt);
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
  fmStateIndicate:= TfmStateIndicate.Create(Self);
  fmStateIndicate.DeviceID := Edit_CurrentID.Text;
  fmStateIndicate.ECUList := TStringList.Create;
  fmStateIndicate.ECUList.Clear;
  fmStateIndicate.ECUList := ECUList;
  bFormStateIndicateShow := True;
  fmStateIndicate.Showmodal;
  fmStateIndicate.Free;
  bFormStateIndicateShow := False;
end;

procedure TMainForm.RegStateIndicateProcess(aPacketData: string);
begin
  if bFormStateIndicateShow then fmStateIndicate.RegStateIndicateProcess(aPacketData);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  G_nProgramType := 1;
  //RxDBGrid1.Columns[4].Width := 165;
{  if ParamCount > 0 then
  begin
    if UpperCase(ParamStr(1)) = 'ST' then
    begin
      G_nProgramType := 1;
    end;
  end;}
  Sent_Ver := 'ST';
  L_nSeq := 0;
  Application.HintPause := 300;
  Application.HintHidePause := 180000;
  TempSave := '';
  nFileSeq := 1;
  LogFileName :=  ExtractFileDir(Application.ExeName) + '\' + formatdatetime('yyyymmddHHMMSS',now) + '.log';
  WebBrowser1.Navigate('About:Blank');

  IdFTPServer := tIdFTPServer.create( nil ) ;
  IdFTPServer.DefaultPort := 21;
  IdFTPServer.AllowAnonymousLogin := False;
  IdFTPServer.EmulateSystem := ftpsUNIX;
  IdFTPServer.HelpReply.text := 'Help is not implemented';
  IdFTPServer.OnChangeDirectory := IdFTPServer1ChangeDirectory;
//  IdFTPServer.OnChangeDirectory := IdFTPServer1ChangeDirectory;
  IdFTPServer.OnGetFileSize := IdFTPServer1GetFileSize;
  IdFTPServer.OnListDirectory := IdFTPServer1ListDirectory;
  IdFTPServer.OnUserLogin := IdFTPServer1UserLogin;
  IdFTPServer.OnRenameFile := IdFTPServer1RenameFile;
  IdFTPServer.OnDeleteFile := IdFTPServer1DeleteFile;
  IdFTPServer.OnRetrieveFile := IdFTPServer1RetrieveFile;
  IdFTPServer.OnStoreFile := IdFTPServer1StoreFile;
  IdFTPServer.OnMakeDirectory := IdFTPServer1MakeDirectory;
  IdFTPServer.OnRemoveDirectory := IdFTPServer1RemoveDirectory;

  IdFTPServer.Greeting.NumericCode := 220;
  IdFTPServer.OnDisconnect := IdFTPServer1DisConnect;
  IdFTPServer.OnConnect := IdFTPServer1Connect;
  with IdFTPServer.CommandHandlers.add do
  begin
    Command := 'XCRC';
    OnCommand := IdFTPServer1CommandXCRC;
  end;

  FTPSockList := TStringList.Create;
  FTPSockList.Clear;
  SockNo := 0;
  nWidth :=   LMDIniCtrl1.ReadInteger('폼','Width',1280);
  nHeight :=   LMDIniCtrl1.ReadInteger('폼','Height',734);
  nLeft :=   LMDIniCtrl1.ReadInteger('폼','Left',0);
  nTop :=   LMDIniCtrl1.ReadInteger('폼','Top',0);
  nPreTop := nTop;
  nPreLeft := nLeft;
  nPreWidth := nWidth;
  nPreHeight := nHeight;
//  MainForm.Position := poDesigned;
//  MainForm.Width :=   LMDIniCtrl1.ReadInteger('폼','Width',1280);
//  MainForm.Height :=   LMDIniCtrl1.ReadInteger('폼','Height',734);
//  MainForm.Left :=   LMDIniCtrl1.ReadInteger('폼','Left',0);
//  MainForm.Top :=    LMDIniCtrl1.ReadInteger('폼','Top',0);
//  if LMDIniCtrl1.ReadInteger('폼','Maximized',0) = 0 then MainForm.WindowState := wsNormal
//  else MainForm.WindowState := wsMaximized;
  bMove := False;

  sg_WiznetList.ColWidths[1] := 0;
  sg_WiznetList.Cells[0,0] := 'Broad List';

  FillArray_Send;

  dt_SyncDate.DateTime := Now;
  dt_SyncTime.DateTime := Now;

end;

procedure TMainForm.StateIndicateAccessDataProcess(aPacketData: string);
begin
  if bFormStateIndicateShow then fmStateIndicate.StateIndicateAccessDataProcess(aPacketData);

end;

procedure TMainForm.btnTempSaveClick(Sender: TObject);
begin
  if Not WinsockPort.Open then
  begin
    showmessage('통신연결이 안되었습니다.');
    Exit;
  end;
{  TempSave := '';

  TempSave := Edit_DeviceID.Text;
  TempSave := TempSave + ';' + Edit_LinkusID.Text ;
  TempSave := TempSave + ';' + edLinkusTel00.Text ;
  TempSave := TempSave + ';' + inttostr(ComboBox_WatchPowerOff.ItemIndex);
  TempSave := TempSave + ';' + inttostr(ComboBox_ComLikus.ItemIndex);
  TempSave := TempSave + ';' + inttostr(SpinEdit_OutDelay.IntValue);
  TempSave := TempSave + ';' + inttostr(SpinEdit_InDelay.IntValue);
  TempSave := TempSave + ';' + inttostr(ComboBox_DeviceType.ItemIndex);
  TempSave := TempSave + ';' + inttostr(ComboBox_DoorType1.ItemIndex);
  TempSave := TempSave + ';' + inttostr(ComboBox_DoorType2.ItemIndex);
  TempSave := TempSave + ';' + Edit_Locate.text;
}
  if Not bAutoDeviceInfoSave then
  begin
    if Application.MessageBox('조회'+#13#13+ '기기정보를 읽어와 메모리에 저장하시겠습니까?','조회',MB_OKCANCEL) = IDCANCEL then Exit;
  end;
  btnTempRestore2.Enabled := True;
  btnTempRestore3.Enabled := True;
  RzBitBtn72.Enabled := True;
  RzBitBtn2.Click;    //ID조회
  Delay(nDelayTime);
  btmCheckLinkusID.Click;  //관제ID조회
  Delay(nDelayTime);
  btmCheckLinkusTeL0.Click;  //관제번호조회
  Delay(nDelayTime);
  btn_UseControlerSearch.Click; //사용컨트롤러 조회
  Delay(nDelayTime);
  RzBitBtn23.Click;        //알람표시기조회
  Delay(nDelayTime);
  RzBitBtn8.Click;         //시스템 정보조회
  Delay(nDelayTime);
  Group_CardReader.ItemIndex := 1;  //1번카드리더 조회
  RzBitBtn6.Click;
  Delay(nDelayTime);
  Group_CardReader.ItemIndex := 2;  //2번카드리더 조회
  RzBitBtn6.Click;
  Delay(nDelayTime);
  Group_CardReader.ItemIndex := 3;  //3번카드리더 조회
  RzBitBtn6.Click;
  Delay(nDelayTime);
  Group_CardReader.ItemIndex := 4;  //4번카드리더 조회
  RzBitBtn6.Click;
  Delay(nDelayTime);
  Group_CardReader.ItemIndex := 5;  //5번카드리더 조회
  RzBitBtn6.Click;
  Delay(nDelayTime);
  Group_CardReader.ItemIndex := 6;  //6번카드리더 조회
  RzBitBtn6.Click;
  Delay(nDelayTime);
  Group_CardReader.ItemIndex := 7;  //7번카드리더 조회
  RzBitBtn6.Click;
  Delay(nDelayTime);
  Group_CardReader.ItemIndex := 8;  //8번카드리더 조회
  RzBitBtn6.Click;
  Delay(nDelayTime);
  Group_Port.ItemIndex := 1;        //1번포트 조회
  RzBitBtn12.Click;
  Delay(nDelayTime);
  Group_Port.ItemIndex := 2;        //2번포트 조회
  RzBitBtn12.Click;
  Delay(nDelayTime);
  Group_Port.ItemIndex := 3;        //3번포트 조회
  RzBitBtn12.Click;
  Delay(nDelayTime);
  Group_Port.ItemIndex := 4;        //4번포트 조회
  RzBitBtn12.Click;
  Delay(nDelayTime);
  Group_Port.ItemIndex := 5;        //5번포트 조회
  RzBitBtn12.Click;
  Delay(nDelayTime);
  Group_Port.ItemIndex := 6;        //6번포트 조회
  RzBitBtn12.Click;
  Delay(nDelayTime);
  Group_Port.ItemIndex := 7;        //7번포트 조회
  RzBitBtn12.Click;
  Delay(nDelayTime);
  Group_Port.ItemIndex := 8;        //8번포트 조회
  RzBitBtn12.Click;
  Delay(nDelayTime);
  if G_nProgramType = 1 then
  begin
    Group_Port.ItemIndex := 9;        //9번포트 조회
    RzBitBtn12.Click;
    Delay(nDelayTime);
    Group_Port.ItemIndex := 10;        //10번포트 조회
    RzBitBtn12.Click;
    Delay(nDelayTime);
    Group_Port.ItemIndex := 11;        //11번포트 조회
    RzBitBtn12.Click;
    Delay(nDelayTime);
    Group_Port.ItemIndex := 12;        //12번포트 조회
    RzBitBtn12.Click;
    Delay(nDelayTime);
  end;

  Btn_CheckCalltime.Click;
  Delay(nDelayTime);
  Btn_CheckRingCount.Click;
  Delay(nDelayTime);
  btnCheckPtTime.Click;
  Delay(nDelayTime);
  btn_ControlSearch.Click;
  Delay(nDelayTime);
  gbDoorNo.ItemIndex := 0;
  RzBitBtn19.Click;
  gbDoorNo.ItemIndex := 1;
  RzBitBtn19.Click;
  ed_Recoverid.Text := Edit_DeviceID.Text;

  if Not bAutoDeviceInfoSave then
  begin
    showmessage('기기정보 조회 완료');
  end;
  bAutoDeviceInfoSave := False;
  //NoteBook1.PageIndex := 11;
end;

procedure TMainForm.btnTempRestoreClick(Sender: TObject);
var
  nMessage : LongInt;
begin
  //nMessage := Application.MessageBox('등록'+#13#13+ '기기정보를 현재상태로 경계해제 후 등록하시겠습니까?','등록',MB_YESNOCANCEL);

  fmDeviceRegMessage:= TfmDeviceRegMessage.Create(Self);
  fmDeviceRegMessage.ShowModal;
  nMessage := fmDeviceRegMessage.L_bResult;
  fmDeviceRegMessage.Free;

  if nMessage = IDCANCEL then Exit;

  if Trim(ed_Recoverid.Text) <> '' then Edit_DeviceID.Text := ed_Recoverid.Text;
//  if nMessage = IDYES then RzBitBtn56.Click;
  if nMessage = IDYES then RzBitBtn15Click(RzBitBtn56);
  Delay(nDelayTime);

  RzBitBtn1.Click;
  Delay(nDelayTime);
  btmRegLinkusIDClick(self);
  Delay(nDelayTime);
  RzBitBtn3.Click;
  Delay(nDelayTime);
  RzBitBtn22.Click;
  Delay(nDelayTime);
  Btn_RegCalltime.Click;
  Delay(nDelayTime);
  Btn_RegRingCount.Click;
  Delay(nDelayTime);
  btnRegPtTime.Click;
  Delay(nDelayTime);
  btn_ControlReg.Click;
  Delay(nDelayTime);
  RzBitBtn78Click(self);
  Delay(nDelayTime);
  RzBitBtn70Click(self);
  Delay(nDelayTime);
  btn_PortLoopRegClick(self);

  Delay(nDelayTime);
  SendPacket(Edit_CurrentID.Text + ComboBox_IDNO.Text,'R','BC10',Sent_Ver);
  Delay(nDelayTime);
  RzBitBtn7.Click;
  Delay(nDelayTime);
  RzBitBtn60.Click;
  Delay(nDelayTime);
  SendPacket(Edit_CurrentID.Text + ComboBox_IDNO.Text,'R','BC10',Sent_Ver);
  
  showmessage('기기정보 등록완료');


{  if TempSave = '' then Exit;
  Edit_DeviceID.Text := FindCharCopy(TempSave,0,';');
  Edit_LinkusID.Text := FindCharCopy(TempSave,1,';');
  edLinkusTel00.Text := FindCharCopy(TempSave,2,';');
  ComboBox_WatchPowerOff.ItemIndex := strtoint(FindCharCopy(TempSave,3,';'));
  ComboBox_ComLikus.ItemIndex := strtoint(FindCharCopy(TempSave,4,';'));
  SpinEdit_OutDelay.IntValue := strtoint(FindCharCopy(TempSave,5,';'));
  SpinEdit_InDelay.IntValue := strtoint(FindCharCopy(TempSave,6,';'));
  ComboBox_DeviceType.ItemIndex := strtoint(FindCharCopy(TempSave,7,';'));
  ComboBox_DoorType1.ItemIndex := strtoint(FindCharCopy(TempSave,8,';'));
  ComboBox_DoorType2.ItemIndex := strtoint(FindCharCopy(TempSave,9,';'));  }
end;

procedure TMainForm.chk_ADClick(Sender: TObject);
begin
  if chk_AD.Checked then Sent_Ver := 'AD'
  else
  begin
    if G_nProgramType = 1 then
    begin
      Sent_Ver := 'ST';
    end else
      Sent_Ver := 'K1';
  end;
end;

procedure TMainForm.RzBitBtn78Click(Sender: TObject);
var
  DeviceID : string;
  i : integer;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  for i:=1 to 2 do
  begin
    RecoverySysInfo2(DeviceID,inttostr(i));
    Delay(200);
  end;

end;

procedure TMainForm.RecoverySysInfo2(DeviceID, aDoorNo: String);
var
  aData: String;
  stDoorControlTime : string;
  nDoorTime : integer;
  nOrd : integer;
  nOrdUDiff : integer;
  stOrgDoorControlTime : string;
  stLongDoorOpenTime : string;
begin
  //stOrgDoorControlTime := TravelEditItem(GroupBox43,'ed_DoorControlTime',strtoint(aDoorNo)).Text;
  stOrgDoorControlTime := TravelComboBoxItem(GroupBox43,'cmb_DoorControlTime',strtoint(aDoorNo)).Text;

  if strtoint(stOrgDoorControlTime) < 10 then
  begin
     stDoorControlTime := Trim(stOrgDoorControlTime);
  end else
  begin
    nOrdUDiff := 26;
    nDoorTime := strtoint(stOrgDoorControlTime) - 10;
    nDoorTime := nDoorTime div 5;
    if nDoorTime < nOrdUDiff then  nOrd := Ord('A') + nDoorTime
    else nOrd := Ord('a') + nDoorTime - nOrdUDiff;
    if nOrd > Ord('z') then nOrd := Ord('z');
    stDoorControlTime := Char(nOrd);
  end;
  if aDoorNo = '1' then
  begin
    stLongDoorOpenTime := InttoStr(RzSpinEdit7.IntValue);
  end else if aDoorNo = '2' then
  begin
    stLongDoorOpenTime := InttoStr(RzSpinEdit9.IntValue);
  end;
  aData:= 'A' +                                        //MSG Code
          //IntToStr(Send_MsgNo)+                         //Msg Count
          '0'+
          aDoorNo +  //문번호
          //IntToStr(gbDoorNo.ItemIndex+1)+       //문번호

          #$20 + #$20 +                                // Record count
          InttoStr(TravelComboBoxItem(GroupBox43,'ComboBox_CardModeType',strtoint(aDoorNo)).ItemIndex) +   //카드운영모드
          InttoStr(TravelComboBoxItem(GroupBox43,'ComboBox_DoorModeType',strtoint(aDoorNo)).ItemIndex) +   //출입문 운영모드
          stDoorControlTime                         +   //Door제어 시간
//          InttoStr(RzSpinEdit4.IntValue)            +   //Door제어 시간
          stLongDoorOpenTime            +   //장시간 열림 경보
          InttoStr(TravelComboBoxItem(GroupBox43,'ComboBox_UseSch',strtoint(aDoorNo)).ItemIndex)       +   //스케줄 적용유무
          InttoStr(TravelComboBoxItem(GroupBox43,'ComboBox_SendDoorStatus',strtoint(aDoorNo)).ItemIndex)+  //출입단독 사용유무
          InttoStr(TravelComboBoxItem(GroupBox43,'ComboBox_UseCommOff',strtoint(aDoorNo)).ItemIndex)   +   //통신이상시 기기운영
          //#$FF+                                         //분실카드 추적 기능(기능삭제)
          InttoStr(TravelComboBoxItem(GroupBox43,'ComboBox_AntiPass',strtoint(aDoorNo)).ItemIndex      )+   //AntiPassBack
          InttoStr(TravelComboBoxItem(GroupBox43,'ComboBox_AlarmLongOpen',strtoint(aDoorNo)).ItemIndex)+   //장시간 열림 부저출력
          InttoStr(TravelComboBoxItem(GroupBox43,'ComboBox_AlramCommoff',strtoint(aDoorNo)).ItemIndex) +   //통신 이상시 부저 출력
          InttoStr(TravelComboBoxItem(GroupBox43,'ComboBox_LockType',strtoint(aDoorNo)).ItemIndex)     +   //전기정 타입
          InttoStr(TravelComboBoxItem(GroupBox43,'ComboBox_ControlFire',strtoint(aDoorNo)).ItemIndex)  +   //화재 발생시 문제어
          InttoStr(TravelComboBoxItem(GroupBox43,'ComboBox_CheckDSLS',strtoint(aDoorNo)).ItemIndex)    +   //DS LS 검사
          '0000000';
          //#$ff+#$ff+#$ff+#$ff+#$ff+#$ff+#$ff+#$ff;      //예비
   ACC_sendData(DeviceID, aData,Sent_Ver);

end;

procedure TMainForm.ReCoverCR(aDeviceID: String; aReaderNo: Integer);
var
  aData: String;
  ReaderNoStr: String[2];
  I: Integer;
  bResult : Boolean;
begin
  aData:= InttoStr(TravelComboBoxItem(GroupBox33,'ComBoBox_UseCardReader',aReaderNo).ItemIndex)+   //리더 사용 유무
          InttoStr(TravelComboBoxItem(GroupBox33,'ComBoBox_InOutCR',aReaderNo).ItemIndex)+         //리더 위치
          InttoStr(TravelComboBoxItem(GroupBox33,'ComBoBox_DoorNo',aReaderNo).ItemIndex) +         //Door No
          Copy(ComboBox_Zone1.Text,1,2)+                //존번호
          Setlength(TravelEditItem(GroupBox33,'Edit_CRLocatge',aReaderNo).Text,16) +           //위치명
          InttoStr(TravelComboBoxItem(GroupBox33,'ComBoBox_Building',aReaderNo).ItemIndex);         //건물 설치 위치

  ReaderNoStr:= '0'+InttoStr(aReaderNo);
  SendPacket(aDeviceID,'I','CD'+ReaderNoStr+aData,Sent_Ver);

end;

procedure TMainForm.RzBitBtn70Click(Sender: TObject);
var
  DeviceID: string;
  i : integer;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if cb_CardType.ItemIndex = 0 then cb_CardType.ItemIndex := 1;
  RegCardReaderType(DeviceID,cb_CardType.ItemIndex);

  for i := 1 to 8 do
  begin
    ReCoverCR(DeviceID,i);
    Delay(200);
  end;
end;

procedure TMainForm.RecoverPort(aDeviceID: String; aPortNo: Integer);
var
  aData: String;
  aFlg: String[8];
  PortStr: String[2];
  I: Integer;
begin


  aData:= TravelEditItem(GroupBox45,'Edit_PTStatus',aPortNo).Text +                      //상태코드
          InttoStr(TravelComboBoxItem(GroupBox45,'ComboBox_WatchType',aPortNo).ItemIndex) + //감시형태
          InttoStr(TravelComboBoxItem(GroupBox45,'ComboBox_AlarmType',aPortNo).ItemIndex) + //알람발생 방식
          InttoStr(TravelComboBoxItem(GroupBox45,'ComboBox_recover',aPortNo).ItemIndex) +   //복구신호전송
          InttoStr(TravelComboBoxItem(GroupBox45,'ComboBox_Delay',aPortNo).ItemIndex);      //지연시간 사용유무


  {램프}
  aFlg:= '00';
  if Port_Out1.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Out1.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {싸이렌}
  aFlg:= '00';
  if Port_Out2.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Out2.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {릴레이1}
  aFlg:= '00';
  if Port_Out3.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Out3.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {릴레이2}
  aFlg:= '00';
  if Port_Out4.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Out4.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {출입문 연동1}
  aFlg:= '00';
  if Port_Door1.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Door1.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {출입문 연동2}
  aFlg:= '00';
  if Port_Door2.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Door2.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {메인램프}
  aFlg:= '00';
  if M_Port_Out1.ItemChecked[0] then aFlg[1]:= '1';
  if M_Port_Out1.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {메인싸이렌}
  aFlg:= '00';
  if M_Port_Out2.ItemChecked[0] then aFlg[1]:= '1';
  if M_Port_Out2.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {메인릴레이1}
  aFlg:= '00';
  if M_Port_Out3.ItemChecked[0] then aFlg[1]:= '1';
  if M_Port_Out3.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {메인릴레이2}
  aFlg:= '00';
  if M_Port_Out4.ItemChecked[0] then aFlg[1]:= '1';
  if M_Port_Out4.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;

  {존 번호}
  if Length(TravelEditItem(GroupBox45,'Edit_PTZoneNo',aPortNo).Text) < 2 then TravelEditItem(GroupBox45,'Edit_PTZoneNo',aPortNo).Text:= '0'+TravelEditItem(GroupBox45,'Edit_PTZoneNo',aPortNo).Text;
  aData:= aData + TravelEditItem(GroupBox45,'Edit_PTZoneNo',aPortNo).Text;
  {위치정보}
  aData:= aData + Setlength(TravelEditItem(GroupBox45,'Edit_PTLocate',aPortNo).Text,16);

  {감지시간}

  if (TravelComboBoxItem(GroupBox45,'ComboBox_DetectTime',aPortNo).Text = '') or (Isdigit(TravelComboBoxItem(GroupBox45,'ComboBox_DetectTime',aPortNo).Text) = False) then
    TravelComboBoxItem(GroupBox45,'ComboBox_DetectTime',aPortNo).Text:= '0400';
  aData:= aData + TravelComboBoxItem(GroupBox45,'ComboBox_DetectTime',aPortNo).Text;

  PortStr:= FillzeroNumber(aPortNo,2);
  SendPacket(aDeviceID,'I','LP'+PortStr+aData,Sent_Ver);

end;

procedure TMainForm.btn_PortLoopRegClick(Sender: TObject);
var
  DeviceID :string;
  i : integer;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  for i:=1 to L_nPortNum do
  begin
    RecoverPort(DeviceID,i);
    Delay(200);
  end;
end;

procedure TMainForm.btnPtMoniStartClick(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if ed_PtMonstartmin.Text = '' then ed_PtMonstartmin.Text := '30';
  SendPacket(stDeviceID,'R','SM50' + FillzeroNumber(strtoint(ed_PtMonstartmin.Text),5),Sent_Ver);
end;

procedure TMainForm.btnPtMoniStopClick(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'R','SM50' + FillzeroNumber(0,5),Sent_Ver);

end;

procedure TMainForm.btnPtMoniStatClick(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'R','SM51' ,Sent_Ver);

end;

procedure TMainForm.PTMonitoringProcess(aPacketData: string);
var
  st : string;
  stCode,stGubun : string;
  stDeviceID:string;
begin
  st := copy(aPacketData,G_nIDLength + 12,Length(aPacketData) - (G_nIDLength + 14));
  stCode:= Copy(aPacketData,G_nIDLength + 12,2);
  stGubun:= Copy(aPacketData,G_nIDLength + 14,2);
  stDeviceID:= Copy(aPacketData,8,G_nIDLength + 2);
  if copy(st,1,4) = 'Mc02' then
  begin
    DeviceDoorStateShow(stDeviceID,st);
    Exit;
  end;
  if RzBitBtn75.Caption = '정지' then ListPtMonitor.Add(st);
  ListPtMonitor2.Add(st);
  ListPTMonitor.ItemIndex:= ListPTMonitor.Items.Count;
  ListPTMonitor.Selected[ListPTMonitor.Items.Count - 1 ] := True;
  ListPTMonitor2.ItemIndex:= ListPTMonitor2.Items.Count;
  ListPTMonitor2.Selected[ListPTMonitor2.Items.Count - 1 ] := True;
end;

procedure TMainForm.btnPTmonitorClearClick(Sender: TObject);
begin
  ListPTMonitor.Clear;
end;

procedure TMainForm.btnPTMoniterLineClick(Sender: TObject);
begin
  ListPTMonitor.Add('================================================');
  ListPTMonitor.ItemIndex:= ListPTMonitor.Items.Count;
  ListPTMonitor.Selected[ListPTMonitor.Items.Count - 1 ] := True;
end;

procedure TMainForm.test1Click(Sender: TObject);
begin
  RzToolButton1.Click;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
  RzToolButton2.Click;
end;

procedure TMainForm.btn_TestClick(Sender: TObject);
var
  aCardNo : string;
  CheckSumData : string;
  nCheckSum : integer;
  stCheckSum : string;
  nMessage : LongInt;
begin
  fmDeviceRegMessage:= TfmDeviceRegMessage.Create(Self);
  fmDeviceRegMessage.ShowModal;
  nMessage := fmDeviceRegMessage.L_bResult;
  fmDeviceRegMessage.Free;

{  aCardNo := EncodeHEXCardNo('1234567890');
  CheckSumData := Hex2ASCII(aCardNo);
  nCheckSum := 0;
  for i:= 1 to Length(CheckSumData) do
  begin
    nCheckSum := nCheckSum + Ord(CheckSumData[i]);
  end;
  stCheckSum := Dec2Hex(nCheckSum,2);
  if Length(stCheckSum) < 2 then stCheckSum := '0' + stCheckSum
  else if Length(stCheckSum) > 2 then stCheckSum := copy(stCheckSum,Length(stCheckSum) - 1,2);

  showmessage(stCheckSum);}
end;

procedure TMainForm.RzToolButton3Click(Sender: TObject);
var
  stFile : string;
begin
  stFile := ExtractFileDir(Application.ExeName) + '\*.log';
  FileCtrl.DeleteFiles(stFile)
end;

procedure TMainForm.TabVTimerTimer(Sender: TObject);
begin
  TabSheet6.TabVisible := True;
  TabVTimer.Enabled := False;
end;

procedure TMainForm.RzBitBtn73Click(Sender: TObject);
var
  stFileName : string;
  CardList : TStringList;
  i : integer;
  stCardNo : string;
  nRandomCard : integer;
begin
  if Not RzOpenDialog1.Execute then Exit;
  RzBitBtn73.Enabled := False;
  stFileName := RzOpenDialog1.FileName;
  CardList := TStringList.Create;
  CardList.Clear;
  for i:= 0 to Memo_CardNo.Lines.Count -1 do
  begin
    stCardNo:= Memo_CardNo.Lines[i];
    CardList.add(GetCardDownLoadData(stCardNo,'L'));
    Application.ProcessMessages;
  end;
  Randomize;
  for i:= Memo_CardNo.Lines.Count + 1 to strtoint(ed_CardCount.Text) do
  begin
    nRandomCard := Random(1000000000);
    CardList.add(GetCardDownLoadData(inttostr(nRandomCard),'L'));
  end;
  CardList.SaveToFile(stFileName);
  CardList.Destroy;
  RzBitBtn73.Enabled := True;
end;

function TMainForm.GetCardDownLoadData(aCardNo: String;
  func: Char;aLength:integer = 10;bHex : Boolean = False): string;
var
  aData: String;
  I: Integer;
  xCardNo: String;
  RealCardNo: String;
  ValidDay: String;
  nLength: Integer;
  stYY,stMM,stDD:String;
  aRegCode,aCardAuth,aInOutMode : String;
  nCheckSum : integer;
  stCheckSum : string;
  stCardType : string;
begin

  nLength:= Length(aCardNo);
  if nLength < aLength then
    aCardNo:= FillZeroStrNum(aCardNo,aLength);
  nLength:= Length(aCardNo);

  if nLength < (aLength + 6) then
  begin
    for I := 1  to (aLength + 6) - nLength do
    begin
      aCardNo:= aCardNo + '0';
    end;
  end;


  //SHowMessage(aCardNo);
  RealCardNo:= Copy(aCardNo,1,aLength);
  ValidDay:=   Copy(aCardNo,aLength + 1,6);
  //xCardNo:=  '00'+Dec2Hex64(StrtoInt64(RealCardNo),8);
  if Not bHex then
  begin
    xCardNo:=  '00'+EncodeCardNo(RealCardNo);
  end else
  begin
    xCardNo:= FillZeroNumber(aLength,2) +  RealCardNo;
  end;

  stYY := edYYYY.text;
  stMM := edMM.text;
  stDD := edDD.text;
  if (ck_YYMMDD.checked = False) or (stYY = '') then stYY := '0';
  if (ck_YYMMDD.checked = False) or (stMM = '') then stMM := '0';
  if (ck_YYMMDD.checked = False) or (stDD = '') then stDD := '0';

  aRegCode := inttostr(rdRegCode.itemindex);
  if rdCardAuth.itemindex > 0 then
    aCardAuth := inttostr(rdCardAuth.itemindex - 1)
  else aCardAuth := '2';
  aInOutMode := inttostr(rdInOutMode.itemindex);
  //순찰카드 추가
  if rg_tourCard.ItemIndex = 0 then stCardType := ' '
  else stCardType := 'V';

  aData:= '';
  aData:= func +
          //InttoStr(Send_MsgNo)+     // Message Count
          '0'+
          aRegCode+                      //등록코드(0:1,2   1:1번문,  2:2번문, 3:방범전용)
          ' '+                     //RecordCount #$20 #$20
          stCardType + 
          '0'+                      //예비
          xCardNo+                  //카드번호
//          ValidDay+                 //유효기간
          FillZeroNumber(strtoint(stYY),2) +
          FillZeroNumber(strtoint(stMM),2) +
          FillZeroNumber(strtoint(stDD),2) + //유효기간
          '0'+                      //등록 결과
          aCardAuth+                      //카드권한(0:출입전용,1:방범전용,2:방범+출입)
          aInOutMode;                      //타입패턴
  //체크섬
  nCheckSum := 0;
  for i:= 1 to Length(aData) do
  begin
    nCheckSum := nCheckSum + Ord(aData[i]);
  end;
  stCheckSum := Dec2Hex(nCheckSum,2);
  if Length(stCheckSum) < 2 then stCheckSum := '0' + stCheckSum
  else if Length(stCheckSum) > 2 then stCheckSum := copy(stCheckSum,Length(stCheckSum) - 1,2);
  result := aData + ',' + stCheckSum;
end;

procedure TMainForm.ck_LogClick(Sender: TObject);
begin
  if ck_Log.Checked then LMDIniCtrl1.WriteInteger('설정','LOG',1)
  else LMDIniCtrl1.WriteInteger('설정','LOG',0);
end;

procedure TMainForm.RzGroup3Items5Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 16;
end;

procedure TMainForm.btn_FtpFilesearchClick(Sender: TObject);
var
  clFileInfo : TFileInfo;
begin
  if RzOpenDialog1.Execute then
  begin
    ed_ftplocalFile.Text := RzOpenDialog1.FileName;
    clFileInfo := TFileInfo.Create(ed_ftplocalFile.Text);
    ed_ftpfilename.Text := clFileInfo.FileName;
    ed_ftpfilesize.Text := inttostr(clFileInfo.FileSize);
    clFileInfo.Destroy;

  end;
end;

procedure TMainForm.btn_regftpClick(Sender: TObject);
var
  stDeviceID : string;
  stData : string;
  stFileName:string;
begin
  stDeviceID := Edit_CurrentID.text + ComboBox_IDNO.Text ;
  if ed_ftpip.Text = '' then
  begin
    showmessage('FTP IP를 입력하세요.');
    ed_ftpip.SetFocus;
    Exit;
  end;
  if ed_ftpport.Text = '' then
  begin
    showmessage('FTP Port를 입력하세요.');
    ed_ftpport.SetFocus;
    Exit;
  end;
  if ed_ftpuserid.Text = '' then
  begin
    showmessage('FTP User ID를 입력하세요.');
    ed_ftpuserid.SetFocus;
    Exit;
  end;
  if ed_ftpuserpw.Text = '' then
  begin
    showmessage('FTP User PW를 입력하세요.');
    ed_ftpuserpw.SetFocus;
    Exit;
  end;
  if ed_ftpdir.Text = '' then
  begin
    showmessage('FTP Root을 선택하세요.');
    Exit;
  end;

  if ed_ftpfilename.Text = '' then
  begin
    showmessage('FTP File을 선택하세요.');
    Exit;
  end;

  if pos(ed_ftpdir.Text,ed_ftplocalFile.Text) > 0 then
  begin
    stFileName := copy(ed_ftplocalFile.Text,Length(ed_ftpdir.Text) + 1,Length(ed_ftplocalFile.Text) - Length(ed_ftpdir.Text));
  end;
  stFileName := stringReplace(stFileName,'\','/',[rfReplaceAll]);
  if stFileName[1] <> '/' then stFileName := '/' + stFileName;
  stData := 'fp02' + ed_ftpip.Text ;
  stData := stData + ' ' + ed_ftpport.Text;
  stData := stData + ' ' + ed_ftpuserid.Text;
  stData := stData + ' ' + ed_ftpuserpw.Text;
  stData := stData + ' ' + stFileName;
  stData := stData + ' ' + ed_ftpfilesize.Text + ' ';
  SendPacket(stDeviceID,'R',stData,Sent_Ver);

{  with LMDIniCtrl1 do
  begin
    WriteString('FTP','FTPIP',ed_ftpip.Text);
    WriteString('FTP','FTPPORT',ed_ftpport.Text);
    WriteString('FTP','FTPUSERID',ed_ftpuserid.Text);
    WriteString('FTP','FTPUSERPW',ed_ftpuserpw.Text);
    WriteString('FTP','FTPROOT',ed_ftpdir.Text);
    WriteString('FTP','FTPFILENAME',ed_ftpFilename.Text);
    WriteString('FTP','FTPLOCALFILE',ed_ftplocalFile.Text);
    WriteString('FTP','FTPFILESIZE',ed_ftpFilesize.Text);
  end; }


end;

procedure TMainForm.btn_FTPRootClick(Sender: TObject);
begin
  if FolderDialog1.Execute then
  begin
    ed_ftpdir.Text := FolderDialog1.Directory;
  end;
end;

procedure TMainForm.btn_GetIPClick(Sender: TObject);
begin
  WebBrowser1.Navigate('http://www.arasnt.co.kr/myip.php');
end;

procedure TMainForm.WebBrowser1NavigateComplete2(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  stData : string;
  nPos1,nPos2 : integer;
begin
  //showmessage('다운로드 완료');
  stData:= WebBrowser1.OleObject.Document.DocumentElement.InnerHTML;
  nPos1 := Pos('IP:',stData);
  if nPos1 > 0 then
  begin
    stData := copy(stData,nPos1 + 3,Length(stData)-nPos1);
    nPos2 := Pos('</BODY>',stData);
    ed_ftpip.Text := copy(stData,1,nPos2 - 1);
    ed_ftpLocalipFirmware.Text := ed_ftpip.Text;
  end;

end;

procedure TMainForm.FTP1Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 16;
end;

procedure TMainForm.C1Click(Sender: TObject);
begin
btn_ConnectClick(Self);
end;

procedure TMainForm.R1Click(Sender: TObject);
begin
Btn_DisConnectClick(self);
end;

procedure TMainForm.btn_ftpSendFilesearchClick(Sender: TObject);
var
  clFileInfo : TFileInfo;
begin
  SaveDialog1.Title:= 'FTP 다운로드 파일 찾기';
  SaveDialog1.DefaultExt:= '';
  SaveDialog1.Filter := 'ALL files (*.*)|*.*';
  if SaveDialog1.Execute then
  begin
    if Sender = btn_ftpSendFilesearch then
    begin
      ed_ftpsendFile.Text := SaveDialog1.FileName;
      clFileInfo := TFileInfo.Create(ed_ftpsendFile.Text);
      ed_ftpsendfilename.Text := clFileInfo.FileName;
      ed_ftpsendfilesize.Text := inttostr(clFileInfo.FileSize);
      ed_localftproot.Text := clFileInfo.Path;
      clFileInfo.Destroy;
    end else if Sender = btn_ftpSendFilesearch1 then
    begin
      ed_ftpsendFile1.Text := SaveDialog1.FileName;
      clFileInfo := TFileInfo.Create(ed_ftpsendFile1.Text);
      ed_ftpsendfilename1.Text := clFileInfo.FileName;
      ed_ftpsendfilesize1.Text := inttostr(clFileInfo.FileSize);
      ed_localftproot.Text := clFileInfo.Path;
      clFileInfo.Destroy;
    end else
    begin
      ed_ftpsendFile2.Text := SaveDialog1.FileName;
      ed_ftpsendfilename2.Text := ExtractFileName( ed_ftpsendFile2.Text );
      if rg_ftpsendgubun2.ItemIndex > 2 then
      begin
        clFileInfo := TFileInfo.Create(ed_ftpsendFile2.Text);
        //ed_ftpsendfilename2.Text := clFileInfo.FileName;
        ed_ftpsendfilesize2.Text := inttostr(clFileInfo.FileSize);
        ed_localftproot.Text := clFileInfo.Path;
        clFileInfo.Destroy;
      end;
    end;

  end;

end;

procedure TMainForm.btn_FtpSendClick(Sender: TObject);
var
  stDeviceID : string;
  stData : string;
  stFileName:string;
  stFTPControlerNum : string;
begin
//  btn_FtpSend.Enabled := False;
  if rg_ftpselect.ItemIndex > 0 then stDeviceID := Edit_CurrentID.text + '00'
  else stDeviceID := Edit_CurrentID.text + ComboBox_IDNO.Text ;
  if sender = btn_FtpSend then
  begin
    stFileName := ed_ftpSendFilename.Text;
    if rg_ftpsendgubun.ItemIndex = 0 then stData := 'fp02'
    else if rg_ftpsendgubun.ItemIndex = 1 then stData := 'fp03'
    else stData := 'fp02';
    if chk_CardBin.Checked then stData := 'fp30';
    if chk_CardBinHD.Checked then stData := 'fp31';
    if chk_FTPMonitoring.Checked then stData := stData + '1'
    else stData := stData + '0';
    if chk_Gauge.Checked then stData := stData + '1'
    else stData := stData + '0';
  
    stData := stData + 'pc' + ' ' + Trim(ed_ftpLocalip.Text);
    stData := stData + ' ' + ed_ftplocalport.Text;
    stData := stData + ' ' + ed_ftplocaluser.Text;
    stData := stData + ' ' + ed_ftplocalpw.Text;
    stData := stData + ' ' + stFileName;
    stData := stData + ' ' + ed_ftpsendfilesize.Text;
  end
  else if sender = btn_FtpSend1 then
  begin
    stFileName := ed_ftpSendFilename1.Text;
    if Not FileExists(stFileName) then
    begin
      showmessage('펌웨어 파일을 선택 하세요.');
      Exit;
    end;
    if rg_ftpselect.ItemIndex = 0 then stData := 'fp01'
    else if rg_ftpselect.ItemIndex = 1 then stData := 'fp10'
    else if rg_ftpselect.ItemIndex = 2 then stData := 'fp11'
    else stData := 'fp01';
    if chk_FTPMonitoring1.Checked then stData := stData + '1'
    else stData := stData + '0';
    if chk_Gauge1.Checked then stData := stData + '1'
    else stData := stData + '0';
  
    stData := stData + 'pc' + ' ' + Trim(ed_ftpLocalip.Text);
    stData := stData + ' ' + ed_ftplocalport.Text;
    stData := stData + ' ' + ed_ftplocaluser.Text;
    stData := stData + ' ' + ed_ftplocalpw.Text;
    stData := stData + ' ' + stFileName;
    stData := stData + ' ' + ed_ftpsendfilesize1.Text;

    if rg_ftpselect.ItemIndex > 0 then
    begin
      stFTPControlerNum := '';
      stFTPControlerNum := GetFTPControlerNum(Group_BroadDownLoad);

      stData := stData + ' ' + stFTPControlerNum;
    end;
  end
  else if sender = btn_FtpSend2 then
  begin
    stFileName := ed_ftpSendFilename2.Text;
    if rg_ftpsendgubun2.ItemIndex = 0 then stData := 'fp12'
    else if rg_ftpsendgubun2.ItemIndex = 1 then stData := 'fp13'
    else if rg_ftpsendgubun2.ItemIndex = 2 then stData := 'fp14'
    else if rg_ftpsendgubun2.ItemIndex = 3 then stData := 'fp23'
    else if rg_ftpsendgubun2.ItemIndex = 4 then stData := 'fp24'
    else stData := 'fp12';
    if chk_FTPMonitoring2.Checked then stData := stData + '1'
    else stData := stData + '0';
    if chk_Gauge2.Checked then stData := stData + '1'
    else stData := stData + '0';
  
    stData := stData + 'pc' + ' ' + Trim(ed_ftpLocalip.Text);
    stData := stData + ' ' + ed_ftplocalport.Text;
    stData := stData + ' ' + ed_ftplocaluser.Text;
    stData := stData + ' ' + ed_ftplocalpw.Text;
    stData := stData + ' ' + stFileName;
    stData := stData + ' ' + ed_ftpsendfilesize2.Text;
  end;
    //FTP SERVER START
  //  FTPSERVERStart();
  IdFTPServer.DefaultPort := strtoint(ed_ftplocalport.Text);

  if IdFTPServer.Active = False then  IdFTPServer.Active := true;
  SendPacket(stDeviceID,'R',stData,Sent_Ver);

end;

//*****************************************
//FTP SERVER 관련 모듈
//*****************************************

function StartsWith( const str, substr: string ) : boolean;
begin
  result := copy( str, 1, length( substr ) ) = substr;
end;

function BackSlashToSlash( const str: string ) : string;
var
  a: dword;
begin
  result := str;
  for a := 1 to length( result ) do
    if result[a] = '\' then
      result[a] := '/';
end;

function SlashToBackSlash( const str: string ) : string;
var
  a: dword;
begin
  result := str;
  for a := 1 to length( result ) do
    if result[a] = '/' then
      result[a] := '\';
end;

function GetSizeOfFile( const APathname: string ) : int64;
begin
  result := FileSizeByName( APathname ) ;
end;

function GetNewDirectory( old, action: string ) : string;
var
  a: integer;
begin
  if action = '../' then
  begin
    if old = '/' then
    begin
      result := old;
      exit;
    end;
    a := length( old ) - 1;
    while ( old[a] <> '\' ) and ( old[a] <> '/' ) do
      dec( a ) ;
    result := copy( old, 1, a ) ;
    exit;
  end;
  if ( action[1] = '/' ) or ( action[1] = '\' ) then
    result := action
  else
    result := old + action;
end;

function CalculateCRC( const path: string ) : string;
var
  f: tfilestream;
  value: dword;
  IdHashCRC32: TIdHashCRC32;
begin
  IdHashCRC32 := nil;
  f := nil;
  try
    IdHashCRC32 := TIdHashCRC32.create;
    f := TFileStream.create( path, fmOpenRead or fmShareDenyWrite ) ;
    value := IdHashCRC32.HashValue( f ) ;
    result := inttohex( value, 8 ) ;
  finally
    f.free;
    IdHashCRC32.free;
  end;
end;

function TMainForm.TransLatePath(const APathname, homeDir: string): string;
var
  tmppath: string;
begin
  result := SlashToBackSlash( homeDir ) ;
  tmppath := SlashToBackSlash( APathname ) ;
  if homedir = '/' then
  begin
    result := tmppath;
    exit;
  end;

  if length( APathname ) = 0 then
    exit;
  if result[length( result ) ] = '\' then
    result := copy( result, 1, length( result ) - 1 ) ;
  if tmppath[1] <> '\' then
    result := result + '\';
  result := result + tmppath;
end;

procedure TMainForm.IdFTPServer1ChangeDirectory(
  ASender: TIdFTPServerThread; var VDirectory: string);
begin
  VDirectory := GetNewDirectory( ASender.CurrentDir, VDirectory ) ;
end;

procedure TMainForm.IdFTPServer1CommandXCRC(ASender: TIdCommand);
var
  s: string;
begin
  with TIdFTPServerThread( ASender.Thread ) do
  begin
    if Authenticated then
    begin
      try
        s := ProcessPath( CurrentDir, ASender.UnparsedParams ) ;
        s := TransLatePath( s, TIdFTPServerThread( ASender.Thread ) .HomeDir ) ;
        ASender.Reply.SetReply( 213, CalculateCRC( s ) ) ;
      except
        ASender.Reply.SetReply( 500, 'file error' ) ;
      end;
    end;
  end;

end;

procedure TMainForm.IdFTPServer1DeleteFile(ASender: TIdFTPServerThread;
  const APathname: string);
begin
  DeleteFile( pchar( TransLatePath( ASender.CurrentDir + '/' + APathname, ASender.HomeDir ) ) ) ;
end;

procedure TMainForm.IdFTPServer1DisConnect(AThread: TIdPeerThread);
var
  st : string;
  i : integer;
begin
  AThread.Data := nil;
  AThread.Stop;
{
  st:=  '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '==== FTP STOP ==== '+#9+
        ''+#9+
        ''+#9+
        '';
  AddEventList(st);
  Try
    IdFTPServer.Active := False;
  Finally
    btn_FtpSend.Enabled := True;
  End; }
end;

procedure TMainForm.IdFTPServer1GetFileSize(ASender: TIdFTPServerThread;
  const AFilename: string; var VFileSize: Int64);
begin
  VFileSize := GetSizeOfFile( TransLatePath( AFilename, ASender.HomeDir ) ) ;
end;

procedure TMainForm.IdFTPServer1ListDirectory(ASender: TIdFTPServerThread;
  const APath: string; ADirectoryListing: TIdFTPListItems);

  procedure AddlistItem( aDirectoryListing: TIdFTPListItems; Filename: string; ItemType: TIdDirItemType; size: int64; date: tdatetime ) ;
  var
    listitem: TIdFTPListItem;
  begin
    listitem := aDirectoryListing.Add;
    listitem.ItemType := ItemType;
    listitem.FileName := Filename;
    listitem.OwnerName := 'anonymous';
    listitem.GroupName := 'all';
    listitem.OwnerPermissions := '---';
    listitem.GroupPermissions := '---';
    listitem.UserPermissions := '---';
    listitem.Size := size;
    listitem.ModifiedDate := date;
  end;

var
  f: tsearchrec;
  a: integer;
begin
  ADirectoryListing.DirectoryName := apath;

  a := FindFirst( TransLatePath( apath, ASender.HomeDir ) + '*.*', faAnyFile, f ) ;
  while ( a = 0 ) do
  begin
    if ( f.Attr and faDirectory > 0 ) then
      AddlistItem( ADirectoryListing, f.Name, ditDirectory, f.size, FileDateToDateTime( f.Time ) )
    else
      AddlistItem( ADirectoryListing, f.Name, ditFile, f.size, FileDateToDateTime( f.Time ) ) ;
    a := FindNext( f ) ;
  end;

  FindClose( f ) ;
end;

procedure TMainForm.IdFTPServer1MakeDirectory(ASender: TIdFTPServerThread;
  var VDirectory: string);
begin
  MkDir( TransLatePath( VDirectory, ASender.HomeDir ) ) ;
end;

procedure TMainForm.IdFTPServer1RemoveDirectory(
  ASender: TIdFTPServerThread; var VDirectory: string);
begin
  RmDir( TransLatePath( VDirectory, ASender.HomeDir ) ) ;
end;

procedure TMainForm.IdFTPServer1RenameFile(ASender: TIdFTPServerThread;
  const ARenameFromFile, ARenameToFile: string);
begin
  if not MoveFile( pchar( TransLatePath( ARenameFromFile, ASender.HomeDir ) ) , pchar( TransLatePath( ARenameToFile, ASender.HomeDir ) ) ) then
    RaiseLastWin32Error;
end;

procedure TMainForm.IdFTPServer1RetrieveFile(ASender: TIdFTPServerThread;
  const AFilename: string; var VStream: TStream);
var
  st : string;
begin
  st:=  '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '==== FTP SEND FILE Name : ' + AFilename +#9+
        ''+#9+
        ''+#9+
        '';
  AddEventList(st);

  //ASender.SetSendBuffer(1460);
  //ASender.SetDelayTime(5000);
  //ASender.StopMode := smSuspend;
  //ASender.ALLOSize := 15;
  VStream := TFileStream.create( translatepath( AFilename, ASender.HomeDir ) , fmopenread or fmShareDenyWrite ) ;

end;

procedure TMainForm.IdFTPServer1StoreFile(ASender: TIdFTPServerThread;
  const AFilename: string; AAppend: Boolean; var VStream: TStream);
begin
  if FileExists( translatepath( AFilename, ASender.HomeDir ) ) and AAppend then
  begin
    VStream := TFileStream.create( translatepath( AFilename, ASender.HomeDir ) , fmOpenWrite or fmShareExclusive ) ;
    VStream.Seek( 0, soFromEnd ) ;
  end
  else
    VStream := TFileStream.create( translatepath( AFilename, ASender.HomeDir ) , fmCreate or fmShareExclusive ) ;
end;

procedure TMainForm.IdFTPServer1UserLogin(ASender: TIdFTPServerThread;
  const AUsername, APassword: string; var AAuthenticated: Boolean);
var
  st : string;
begin
  AAuthenticated := ( AUsername = 'zregid' ) and ( APassword = 'zregpw' ) ;
  if not AAuthenticated then
    exit;
  st:=  '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '==== FTP USER LOGIN ==== '+#9+
        ''+#9+
        ''+#9+
        '';
  AddEventList(st);
  ASender.HomeDir := ed_localftpRoot.Text;
  asender.currentdir := '/';


end;
//*****************************************
//FTP SERVER 관련 모듈
//*****************************************

procedure TMainForm.btnPTmonitorClear2Click(Sender: TObject);
begin
  ListPtMonitor.Clear;
end;

procedure TMainForm.btnPTMoniterLine2Click(Sender: TObject);
begin
  ListPTMonitor2.Add('================================================');
  ListPTMonitor2.ItemIndex:= ListPTMonitor2.Items.Count;
  ListPTMonitor2.Selected[ListPTMonitor2.Items.Count - 1 ] := True;
end;

procedure TMainForm.btn_ftpStopClick(Sender: TObject);
var
  i : integer;
  st : string;
  stDeviceID : string;
begin
{//  My_RunDosCommand('taskkill /f /im FTPServer.exe');
  RzBitBtn74.Enabled := False;
  for i:=0 to FTPSockList.Count - 1 do
  begin
    if Assigned(FTPSockList.Objects[i]) then
    begin
      TIdPeerThread(FTPSockList.Objects[i]).Data := Nil;
      TIdPeerThread(FTPSockList.Objects[i]).CleanupInstance;
      TIdPeerThread(FTPSockList.Objects[i]).Stop;
//      TIdPeerThread(FTPSockList.Objects[i]).Destroy;
    end;
  end;
  FTPSockList.Clear;
  IdFTPServer.CleanupInstance;
//  delay(2000);
  IdFTPServer.Active := False; 
  st:=  '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '==== FTP STOP ==== '+#9+
        ''+#9+
        ''+#9+
        '';
  AddEventList(st);
  RzBitBtn74.Enabled := True;   R fp00}
  if rg_ftpselect.ItemIndex > 0 then stDeviceID := Edit_CurrentID.text + '00'
  else stDeviceID := Edit_CurrentID.text + ComboBox_IDNO.Text ;
  SendPacket(stDeviceID,'R','fp00',Sent_Ver);

end;

procedure TMainForm.RzBitBtn75Click(Sender: TObject);
begin
  if RzBitBtn75.Caption = '정지' then RzBitBtn75.Caption := '시작'
  else RzBitBtn75.Caption := '정지';
end;

procedure TMainForm.IdFTPServer1Connect(AThread: TIdPeerThread);
begin
  FTPSockList.AddObject(inttostr(SockNo),AThread);
end;

procedure TMainForm.FTPSERVERStart;
var
  stFtpServerFile : string;
  stUserInfo : string;
  iHandle : THandle;
  st : string;
begin
  stUserInfo := 'zregid,zregpw,' + ed_localftpRoot.Text;
  stFtpServerFile := ExtractFileDir(Application.ExeName) + '\FTPServer.exe ' + stUserInfo;
  iHandle := FindWindow(Nil, 'Zeron FTP Server');
  if iHandle = 0 then
  begin
    if Not FileExists(ExtractFileDir(Application.ExeName) + '\FTPServer.exe') then
    begin
      showmessage(ExtractFileDir(Application.ExeName) + '\FTPServer.exe 파일이 존재하지 않습니다.');
      Exit;
    end;
    st:=  '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '==== FTP START ==== '+#9+
        ''+#9+
        ''+#9+
        '';
    AddEventList(st);
    WinExec(PChar(stFtpServerFile),sw_hide);
  end;
  //My_RunDosCommand(stFtpServerFile,False,False)
end;

procedure TMainForm.GageMonitor(aPacketData: string);
var
  stGauge : string;
  nPos : integer;
  stMax,stPrograss:string;
  stEcuID : string;
  FirmWareGauge : TGauge;
  FirmWareLabel : TLabel;
  nPosCount : integer;
  nStartPos : integer;
  nEndPos : integer;
begin
  //if Not chk_Gauge.Checked then Exit;
  //048 K1000000000#UGc01     168550/495530 (34)76
  stEcuID := copy(aPacketData,G_nIDLength + 8,2);
  if stEcuID = '00' then Gauge_FirmwareMain.Visible := True;
  ////// Firm Ware Gauge 조회 ////
  FirmWareLabel := TravelLabelItem(gb_gauge,'lb_gauge',stEcuID);
  FirmWareLabel.Visible := True;
  FirmWareGauge := TravelGaugeItem(gb_gauge,'Gauge_F',stEcuID);
  FirmWareGauge.Visible :=  True;
  lb_FtpcardECU.Visible := True;
  lb_FtpcardECU.Caption := stEcuID;
  Gauge_FTPCard.Visible := True;
  //////
  ftpGauge.Visible := True;
  ftpGauge1.Visible := True;
  nPosCount := posCount(' ',aPacketData);
  nStartPos := PosIndex(' ',aPacketData,nPosCount - 1);
  nEndPos := PosIndex(' ',aPacketData,nPosCount);
  stGauge := copy(aPacketData,nStartPos + 1,nEndPos - nStartPos - 1);
  //stGauge := copy(aData,PosEx(' ',aData,nPosCount - 1),
  //stGauge := copy(aData,19 + 5 + 4,Length(aData) - 19 - 5 - 4);
  stPrograss := FindCharCopy(stGauge,0,'/');
  stMax := FindCharCopy(stGauge,1,'/');
  stMax := FindCharCopy(stMax,0,' ');

  ftpGauge.MaxValue := strtoint(stMax);
  ftpGauge.Progress := strtoint(stPrograss);
  ftpGauge1.MaxValue := strtoint(stMax);
  ftpGauge1.Progress := strtoint(stPrograss);
  if stEcuID = '00' then
  begin
    Gauge_FirmwareMain.MaxValue := strtoint(stMax);
    Gauge_FirmwareMain.Progress := strtoint(stPrograss);
    Gauge_FirmwareMain.MaxValue := strtoint(stMax);
    Gauge_FirmwareMain.Progress := strtoint(stPrograss);
  end;
  ////// Firm Ware Gauge 조회 ////
  FirmWareGauge.MaxValue := strtoint(stMax);
  FirmWareGauge.Progress := strtoint(stPrograss);

  ////// Card Gauge 조회 ////
  Gauge_FTPCard.MaxValue := strtoint(stMax);
  Gauge_FTPCard.Progress := strtoint(stPrograss);

  if ftpGauge.MaxValue = ftpGauge.Progress then
  begin
    ftpGauge.Visible := False;
    ftpGauge1.Visible := False;
  end;

  if FirmWareGauge.MaxValue = FirmWareGauge.Progress then
  begin
    FirmWareLabel.Visible := False;
    FirmWareGauge.Visible := False;
    if stEcuID = '00' then Gauge_FirmwareMain.Visible := False;
    lb_FtpcardECU.Visible := False;
    Gauge_FTPCard.Visible := False;
  end;

  Application.ProcessMessages;
  
end;

procedure TMainForm.S1Click(Sender: TObject);
begin
  RzBitBtn25.Click;
  {if S1.Caption = '시작(&S)' then
  begin
    RzBitBtn25.Click;
    //RzBitBtn25.Down := True;
    //S1.Caption := '정지(&S)';
  end else
  begin
    RzBitBtn25.Click;
//    RzBitBtn26.Click;
//    RzBitBtn26.Down := True;
    //S1.Caption := '시작(&S)';
  end; }
end;

procedure TMainForm.N17Click(Sender: TObject);
var
  stExec:string;
begin
  stExec := Application.ExeName;
  My_RunDosCommand(stExec,True,False);
end;

procedure TMainForm.B1Click(Sender: TObject);
begin
  RzBitBtn28.Click;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  if Not bMove then
  begin
      nPreTop := nTop;
      nPreLeft := nLeft;
      nPreWidth := nWidth;
      nPreHeight := nHeight;
      nTop := MainForm.Top;
      nLeft := MainForm.Left;
      nWidth := MainForm.Width;
      nHeight := MainForm.Height;
  end;
  bMove := False;
end;


procedure TMainForm.WndProc(var Message: TMessage);
begin
  inherited;
  case Message.Msg of
    WM_MOVE:
    begin
      bMove := True;
      nPreTop := nTop;
      nPreLeft := nLeft;
      nPreWidth := nWidth;
      nPreHeight := nHeight;
      nTop := MainForm.Top;
      nLeft := MainForm.Left;
      nWidth := MainForm.Width;
      nHeight := MainForm.Height;
    end;
  end;

end;

procedure TMainForm.CB_IPListChange(Sender: TObject);
begin
  //MainForm.Caption := PROGRAM_NAME +' '+ strBuildInfo+'[' + CB_IPList.Text + '] - [ ' + Trim(Edit_Locate.Text) + ' ] ';
  if G_nProgramType = 1 then
    MainForm.Caption := PROGRAM_NAME +' '+ strBuildInfo+'[' + CB_IPList.Text + '] - [ S-TEC ] '
  else MainForm.Caption := PROGRAM_NAME +' '+ strBuildInfo+'[' + CB_IPList.Text + '] - [ KTTELECOP ] ';
end;

procedure TMainForm.rg_ftpsendgubun2Click(Sender: TObject);
var
  clFileInfo : TFileInfo;
begin
  if rg_ftpsendgubun2.ItemIndex > 2 then
  begin
    clFileInfo := TFileInfo.Create(ed_ftpsendFile2.Text);
    //ed_ftpsendfilename2.Text := clFileInfo.FileName;
    ed_ftpsendfilesize2.Text := inttostr(clFileInfo.FileSize);
    ed_localftproot.Text := clFileInfo.Path;
    clFileInfo.Destroy;
  end;

end;

procedure TMainForm.RzBitBtn74Click(Sender: TObject);
var
  i : integer;
begin
  if RzPageControl1.ActivePageIndex = 0 then
  begin
    DBISAMTable1.Active:= False;
    DBISAMTable1.DeleteTable;
    DBISAMTable1.CreateTable;
    DBISAMTable1.Active:= True;
  end else RichEdit1.Clear;
end;

procedure TMainForm.btn_FilePlayClick(Sender: TObject);
begin
  if btn_FilePlay.Caption = '시작' then
  begin
    bStart := True;
    btn_Moment.enabled := True;
    btn_Stop.enabled := True;
    btn_Play.enabled := False;
    btn_FilePlay.Caption := '일시정지';
  end
  else
  begin
    bStart := False;
    btn_Play.enabled := True;
    btn_Moment.enabled := False;
    btn_Stop.enabled := False;
    btn_FilePlay.Caption := '시작';
  end;
end;

procedure TMainForm.btn_FileStopClick(Sender: TObject);
begin
  bStop := True;
  pn_Gauge.Visible := False;
end;

procedure TMainForm.btn_FileSkipClick(Sender: TObject);
begin
  bFileSkip := True;
end;

procedure TMainForm.btnZoneRegClick(Sender: TObject);
var
  DeviceID: String;
  aData : string;
begin
  cmb_ZonUse.Color := clWhite;
  Edit_ZoneStatus1.Color := clWhite;
  Cmb_ZoneWatchType1.Color := clWhite;
  Edit_ZoneStatus2.Color := clWhite;
  Cmb_ZoneWatchType2.Color := clWhite;
  Edit_ZoneStatus3.Color := clWhite;
  Cmb_ZoneWatchType3.Color := clWhite;
  Edit_ZoneStatus4.Color := clWhite;
  Cmb_ZoneWatchType4.Color := clWhite;
  Edit_ZoneStatus5.Color := clWhite;
  Cmb_ZoneWatchType5.Color := clWhite;
  Edit_ZoneStatus6.Color := clWhite;
  Cmb_ZoneWatchType6.Color := clWhite;
  Edit_ZoneStatus7.Color := clWhite;
  Cmb_ZoneWatchType7.Color := clWhite;
  Edit_ZoneStatus8.Color := clWhite;
  Cmb_ZoneWatchType8.Color := clWhite;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  aData:= 'EL01' +                      //상태코드
          FillZeroNumber(rg_zoneExNum.ItemIndex,2) + //존 확장기 번호
          Inttostr(cmb_ZonUse.ItemIndex) + //등록 유무
          Edit_ZoneStatus1.Text + //포트1Status
          inttostr(Cmb_ZoneWatchType1.ItemIndex) + //포트1감시형태
          '00' +                  //예비
          Edit_ZoneStatus2.Text + //포트2Status
          inttostr(Cmb_ZoneWatchType2.ItemIndex) + //포트2감시형태
          '00' +                  //예비
          Edit_ZoneStatus3.Text + //포트3Status
          inttostr(Cmb_ZoneWatchType3.ItemIndex) + //포트3감시형태
          '00' +                  //예비
          Edit_ZoneStatus4.Text + //포트4Status
          inttostr(Cmb_ZoneWatchType4.ItemIndex) + //포트4감시형태
          '00' +                  //예비
          Edit_ZoneStatus5.Text + //포트5Status
          inttostr(Cmb_ZoneWatchType5.ItemIndex) + //포트5감시형태
          '00' +                  //예비
          Edit_ZoneStatus6.Text + //포트6Status
          inttostr(Cmb_ZoneWatchType6.ItemIndex) + //포트6감시형태
          '00' +                  //예비
          Edit_ZoneStatus7.Text + //포트7Status
          inttostr(Cmb_ZoneWatchType7.ItemIndex) + //포트7감시형태
          '00' +                  //예비
          Edit_ZoneStatus8.Text + //포트8Status
          inttostr(Cmb_ZoneWatchType8.ItemIndex) + //포트8감시형태
          '00';

          SendPacket(DeviceID,'I',aData,Sent_Ver);

end;

procedure TMainForm.btnZoneSearchClick(Sender: TObject);
var
  DeviceID: String;
  aData : string;
begin
  cmb_ZonUse.Color := clWhite;
  Edit_ZoneStatus1.Color := clWhite;
  Cmb_ZoneWatchType1.Color := clWhite;
  Edit_ZoneStatus2.Color := clWhite;
  Cmb_ZoneWatchType2.Color := clWhite;
  Edit_ZoneStatus3.Color := clWhite;
  Cmb_ZoneWatchType3.Color := clWhite;
  Edit_ZoneStatus4.Color := clWhite;
  Cmb_ZoneWatchType4.Color := clWhite;
  Edit_ZoneStatus5.Color := clWhite;
  Cmb_ZoneWatchType5.Color := clWhite;
  Edit_ZoneStatus6.Color := clWhite;
  Cmb_ZoneWatchType6.Color := clWhite;
  Edit_ZoneStatus7.Color := clWhite;
  Cmb_ZoneWatchType7.Color := clWhite;
  Edit_ZoneStatus8.Color := clWhite;
  Cmb_ZoneWatchType8.Color := clWhite;

  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  aData:= 'EL01' +                      //상태코드
          FillZeroNumber(rg_zoneExNum.ItemIndex,2); //존 확장기 번호
  SendPacket(DeviceID,'Q',aData,Sent_Ver);

end;

procedure TMainForm.RcvZoneExInfo(aPacketData: string);
var
  st:string;
begin
//  Exit;
  Delete(aPacketData,1,1); //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st:= copy(aPacketData,G_nIDLength + 15,Length(aPacketData) - (G_nIDLength + 14));
//  showmessage(st);
  rg_zoneExNum.ItemIndex := strtoint(copy(st,1,2));
  cmb_ZonUse.ItemIndex := strtoint(copy(st,3,1));
  Edit_ZoneStatus1.Text := copy(st,4,2); //포트1Status
  Cmb_ZoneWatchType1.ItemIndex:= strtoint(copy(st,6,1)); //포트1감시형태
  Edit_ZoneStatus2.Text := copy(st,9,2);  //포트2Status
  Cmb_ZoneWatchType2.ItemIndex:= strtoint(copy(st,11,1)); //포트2감시형태
  Edit_ZoneStatus3.Text := copy(st,14,2); //포트3Status
  Cmb_ZoneWatchType3.ItemIndex:= strtoint(copy(st,16,1)); //포트3감시형태
  Edit_ZoneStatus4.Text := copy(st,19,2);  //포트4Status
  Cmb_ZoneWatchType4.ItemIndex:= strtoint(copy(st,21,1)); //포트4감시형태
  Edit_ZoneStatus5.Text := copy(st,24,2); //포트5Status
  Cmb_ZoneWatchType5.ItemIndex:= strtoint(copy(st,26,1)); //포트5감시형태
  Edit_ZoneStatus6.Text := copy(st,29,2);  //포트6Status
  Cmb_ZoneWatchType6.ItemIndex:= strtoint(copy(st,31,1)); //포트6감시형태
  Edit_ZoneStatus7.Text := copy(st,34,2); //포트7Status
  Cmb_ZoneWatchType7.ItemIndex:= strtoint(copy(st,36,1)); //포트7감시형태
  Edit_ZoneStatus8.Text := copy(st,39,2);  //포트8Status
  Cmb_ZoneWatchType8.ItemIndex:= strtoint(copy(st,41,1)); //포트8감시형태
  cmb_ZonUse.Color := clYellow;
  Edit_ZoneStatus1.Color := clYellow;
  Cmb_ZoneWatchType1.Color := clYellow;
  Edit_ZoneStatus2.Color := clYellow;
  Cmb_ZoneWatchType2.Color := clYellow;
  Edit_ZoneStatus3.Color := clYellow;
  Cmb_ZoneWatchType3.Color := clYellow;
  Edit_ZoneStatus4.Color := clYellow;
  Cmb_ZoneWatchType4.Color := clYellow;
  Edit_ZoneStatus5.Color := clYellow;
  Cmb_ZoneWatchType5.Color := clYellow;
  Edit_ZoneStatus6.Color := clYellow;
  Cmb_ZoneWatchType6.Color := clYellow;
  Edit_ZoneStatus7.Color := clYellow;
  Cmb_ZoneWatchType7.Color := clYellow;
  Edit_ZoneStatus8.Color := clYellow;
  Cmb_ZoneWatchType8.Color := clYellow;

end;

procedure TMainForm.checkFTP(aDeviceID: string);
begin
  SendPacket(aDeviceID,'R','fp90',Sent_Ver);
end;

procedure TMainForm.setFTPUSE(const Value: Boolean);
begin
  FFTPUSE := Value;
  if Value then
  begin
    rdMode.Visible := False;
    RzLabel42.Visible := False;
    ListBox_DownLoadInfo.Visible := False;
    RzDateTimePicker1.Visible := False;
    RzDateTimePicker2.Visible := False;
    chk_Notupgrade.Visible := False;
    RzRadioGroup2.Visible := False;
    gb_ftp.Visible := True;
    rg_ftpselect.Visible := True;
    btBroadFileRetry.Visible := False;
    gb_gauge.Visible := True;
    //gb_ftpCard.Visible := True;
    btnFirmwareChange.Caption := '펌웨어 기존 다운로드';
  end else
  begin
    rdMode.Visible := True;
    RzLabel42.Visible := True;
    ListBox_DownLoadInfo.Visible := True;
    RzDateTimePicker1.Visible := True;
    RzDateTimePicker2.Visible := True;
    chk_Notupgrade.Visible := True;
    RzRadioGroup2.Visible := True;
    gb_ftp.Visible := False;
    rg_ftpselect.Visible := False;
    btBroadFileRetry.Visible := True;
    gb_gauge.Visible := False;
    //gb_ftpCard.Visible := False;
    btnFirmwareChange.Caption := '펌웨어 FTP 다운로드';
  end;
end;

procedure TMainForm.RcvFTPCheck(aPacketData: string);
begin
  if bAutoDeviceInfoSave then Exit;
  if Pos('Undefined Command',aPacketData) > 0 then FTPUSE := False
  else FTPUSE := TRUE;
end;

procedure TMainForm.chk_FTPMonitoringFirmwareClick(Sender: TObject);
begin
  chk_FTPMonitoring1.Checked := chk_FTPMonitoringFirmware.Checked;
end;

procedure TMainForm.chk_FTPMonitoring1Click(Sender: TObject);
begin
  chk_FTPMonitoringFirmware.Checked := chk_FTPMonitoring1.Checked;
end;

procedure TMainForm.chk_GaugeFirmwareClick(Sender: TObject);
begin
  chk_Gauge1.Checked := chk_GaugeFirmware.Checked ;
end;

procedure TMainForm.chk_Gauge1Click(Sender: TObject);
begin
  chk_GaugeFirmware.Checked := chk_Gauge1.Checked ;
end;

procedure TMainForm.ed_ftpLocalipFirmwareChange(Sender: TObject);
begin
  ed_ftpLocalip.Text := ed_ftpLocalipFirmware.Text;
end;

procedure TMainForm.ed_ftpLocalipChange(Sender: TObject);
begin
  ed_ftpLocalipFirmware.Text := ed_ftpLocalip.Text;
  ed_FTPCardIP.Text := ed_ftpLocalip.Text;
end;

procedure TMainForm.cmb_ftplocalportFirmwareChange(Sender: TObject);
begin
  cmb_ftplocalport.text := cmb_ftplocalportFirmware.text;
end;

procedure TMainForm.cmb_ftplocalportChange(Sender: TObject);
begin
  cmb_ftplocalportFirmware.Text := cmb_ftplocalport.Text;
  cmb_FTPCardPort.text := cmb_ftplocalport.text;
end;

function TMainForm.GetFTPControlerNum(CheckGroup: TRZCheckGroup): String;
var
  nTemp : array[0..8, 0..7] of Integer;
  i,j,k : Integer;
  stTemp: String;
  stHex:String;
  nDecimal: Integer;
begin
  stHex := '0';
  for i:=1 to 99 do
  begin
    stHex := stHex + '0';
  end;

  //체크 되어 있는 위치에 데이터를 넣는다.
  for k:= 0 to 63 do
  begin
    if CheckGroup.ItemChecked[k] = True then
    begin
      stHex[k+1] := '1';
    end;
  end;


  Result:=stHex;

end;

procedure TMainForm.ed_cardFileChange(Sender: TObject);
begin
  ed_ftpSendFilename.Text := ed_cardFile.Text;
end;

procedure TMainForm.ed_ftpSendFilenameChange(Sender: TObject);
begin
  ed_cardFile.Text := ed_ftpSendFilename.Text;
end;

procedure TMainForm.btn_CardFileClick(Sender: TObject);
begin
  btn_ftpSendFilesearchClick(btn_ftpSendFilesearch);
end;

procedure TMainForm.chk_FTPMonitoringClick(Sender: TObject);
begin
  chk_FTPCardMonitoring.Checked := chk_FTPMonitoring.Checked;
end;

procedure TMainForm.chk_FTPCardMonitoringClick(Sender: TObject);
begin
  chk_FTPMonitoring.Checked := chk_FTPCardMonitoring.Checked;
end;

procedure TMainForm.chk_GaugeClick(Sender: TObject);
begin
  chk_FTPCardGauge.Checked := chk_Gauge.Checked;
end;

procedure TMainForm.chk_FTPCardGaugeClick(Sender: TObject);
begin
  chk_Gauge.Checked := chk_FTPCardGauge.Checked;

end;

procedure TMainForm.btn_FTPCardSendClick(Sender: TObject);
begin
  btn_FtpSendClick(btn_FtpSend);
end;

procedure TMainForm.ed_FTPCardIPChange(Sender: TObject);
begin
  ed_ftpLocalip.Text := ed_FTPCardIP.Text;
end;

procedure TMainForm.cmb_FTPCardPortChange(Sender: TObject);
begin
  cmb_ftplocalportFirmware.text := cmb_FTPCardPort.text;
  cmb_ftplocalport.text := cmb_FTPCardPort.text;
end;

procedure TMainForm.ed_ftplocalportChange(Sender: TObject);
begin
  ed_ftplocalportFirmware.Text := ed_ftplocalport.Text;
  ed_FTPCardPort.Text := ed_ftplocalport.Text;
  //LMDIniCtrl1.WriteString('FTP','FTPLOCALPORT',ed_ftplocalport.Text);
end;

procedure TMainForm.ed_ftplocalportFirmwareChange(Sender: TObject);
begin
  ed_ftplocalport.Text := ed_ftplocalportFirmware.Text;
  ed_FTPCardPort.Text := ed_ftplocalportFirmware.Text;
end;

procedure TMainForm.ed_FTPCardPortChange(Sender: TObject);
begin
  ed_ftplocalport.Text := ed_FTPCardPort.Text;
  ed_ftplocalportFirmware.Text := ed_FTPCardPort.Text;

end;

procedure TMainForm.btnFirmwareChangeClick(Sender: TObject);
begin
  FTPUSE := Not FTPUSE;


end;

procedure TMainForm.RadioButton1Click(Sender: TObject);
begin
  rg_ftpsendgubun2.ItemIndex := 0;    
end;

procedure TMainForm.RadioButton2Click(Sender: TObject);
begin
rg_ftpsendgubun2.ItemIndex := 1;
end;

procedure TMainForm.RadioButton3Click(Sender: TObject);
begin
rg_ftpsendgubun2.ItemIndex := 2;

end;

procedure TMainForm.RadioButton4Click(Sender: TObject);
begin
rg_ftpsendgubun2.ItemIndex := 3;

end;

procedure TMainForm.RadioButton5Click(Sender: TObject);
begin
  rg_ftpsendgubun2.ItemIndex := 4;
end;

procedure TMainForm.mn_UpdateClick(Sender: TObject);
var
  stExec:string;
begin
  stExec := ExtractFileDir(Application.ExeName) + '\SmartUpdate.exe';
  My_RunDosCommand(stExec,True,False);
  Close;

end;

procedure TMainForm.RzButton7Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 6;
  checkFTP(Edit_CurrentID.Text+'00');
end;

procedure TMainForm.btn_nextPortClick(Sender: TObject);
var
  stPort : string;
  stPrePort : string;
  stNextPort : string;
  nNextPort : integer;
begin
  stPort := ed_ftplocalportFirmware.Text;
  if Length(stPort) > 3 then
  begin
    stPrePort := copy(stPort,1,Length(stPort) - 3);
    stNextPort := copy(stPort,Length(stPort) - 3 + 1,3);
  end else
  begin
    stPrePort := '';
    stNextPort := stPort;
  end;
  nNextPort := strtoint(stNextPort) + 5;
  if nNextPort > 500 then nNextPort := 0;
  ed_ftpLocalPortFirmware.Text := stPrePort + FillzeroNumber(nNextPort,3);
end;

procedure TMainForm.RzBitBtn46Click(Sender: TObject);
var
  CardList : TStringList;
  i : integer;
  stCardNo : string;
begin
  CardList := TStringList.Create;
  CardList.Clear;
  for i:= 0 to LMDListBox1.Items.Count -1 do
  begin
    stCardNo := LMDListBox1.ItemPart(i,10);
    CardList.add(stCardNo);
    Application.ProcessMessages;
  end;
  CardList.SaveToFile('c:\card.csv');

  CardList.Free;
end;

procedure TMainForm.sg_WiznetListClick(Sender: TObject);
begin
  if Trim(sg_WiznetList.Cells[0,sg_WiznetList.Row]) <> '' then
    ed_FixMac.Text := sg_WiznetList.Cells[0,sg_WiznetList.Row];
  WiznetData := sg_WiznetList.Cells[1,sg_WiznetList.Row];
  DetailWizNetList(WiznetData);
end;

procedure TMainForm.DetailWizNetList(aWiznetData: string);
var
  I: Integer;
  S: string;
  st: String;
  st2: String;
  n: Integer;
  MAcStr:String;
begin
  ClearLanInfo;

  S:= aWiznetData;

  if  Length(S) < 47 then Exit;

  {MAC Address}

  if (copy(S,1,4) <> 'IMIN') and (copy(S,1,4) <> 'SETC')
     and (copy(S,1,4) <> 'LNDT') and (copy(S,1,4) <> 'LNSD')
     and (copy(S,1,4) <> 'SETT') and (copy(S,1,4) <> 'LNSV')
  then Exit;

  if (copy(S,1,4) = 'IMIN') or (copy(S,1,4) = 'SETC') then chk_ZeronType.Checked := False
  else chk_ZeronType.Checked := True;


  st:= copy(S,5,6);
  RzEdit2.Text:= ToHexStr(st);
  MAcStr:= ToHexStrNoSpace(st);

  editMAC1.Color:= clYellow;
  editMAC2.Color:= clYellow;
  editMAC3.Color:= clYellow;
  editMAC4.Color:= clYellow;
  editMAC5.Color:= clYellow;
  editMAC6.Color:= clYellow;

  editMAC1.Text:= Copy(MAcStr,1,2);
  editMAC2.Text:= Copy(MAcStr,3,2);
  editMAC3.Text:= Copy(MAcStr,5,2);
  editMAC4.Text:= Copy(MAcStr,7,2);
  editMAC5.Text:= Copy(MAcStr,9,2);
  editMAC6.Text:= Copy(MAcStr,11,2);

  {Mode}
  //if S[11] = #$00 then Checkbox_Client.Checked:= True
  //else                 Checkbox_Client.Checked:= False;

  if S[11] = #$00 then RadioModeClient.Checked:= True
  else if S[11] = #$02 then RadioModeServer.Checked:= True
  else if S[11] = #$01 then RadioModeMixed.Checked:= True;


  {IP Address}
  st:= Copy(S,12,4);
  st2:='';
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_LocalIP.Text:= st2;

  {Subnet Mask}
  st:= Copy(S,16,4);
  st2:='';
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_Sunnet.Text:= st2;

  {GateWay}
  st:= Copy(S,20,4);
  st2:='';
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_Gateway.Text:= st2;

  {Port Number- Client}
  st:= copy(S,24,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  Edit_LocalPort.Text:= st2;

  {Server IP}
  st:= copy(s,26,4);
  st2:='';
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_ServerIp.Text:= st2;

  {Server Port}
  st:= copy(S,30,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  Edit_Serverport.Text:= st2;

  {Serial Baudrate}
  case S[32] of
     #$BB: begin ComboBox_Boad.ItemIndex:= 8; end;
     #$FF: begin ComboBox_Boad.ItemIndex:= 7; end;
     #$FE: begin ComboBox_Boad.ItemIndex:= 6; end;
     #$FD: begin ComboBox_Boad.ItemIndex:= 5; end;
     #$FA: begin ComboBox_Boad.ItemIndex:= 4; end;
     #$F4: begin ComboBox_Boad.ItemIndex:= 3; end;
     #$E8: begin ComboBox_Boad.ItemIndex:= 2; end;
     #$D0: begin ComboBox_Boad.ItemIndex:= 1; end;
     #$A0: begin ComboBox_Boad.ItemIndex:= 0; end;
  end;
  ComboBox_Boad.Text:= ComboBox_Boad.Items[ComboBox_Boad.ItemIndex];
  {Data Bit}
  st:= copy(s,33,1);
  n:= Ord(st[1]);
  if n = 7 then ComboBox_Databit.ItemIndex:= 0
  else if n =8 then ComboBox_Databit.ItemIndex:= 1
  else ComboBox_Databit.Text:= InttoStr(n);
  ComboBox_Databit.Text:= ComboBox_Databit.Items[ComboBox_Databit.ItemIndex];

  {Parity}
  case S[34] of
    #$00: ComboBox_Parity.ItemIndex:= 0;
    #$01: ComboBox_Parity.ItemIndex:= 1;
    #$02: ComboBox_Parity.ItemIndex:= 2;
  end;
  ComboBox_Parity.Text:= ComboBox_Parity.Items[ComboBox_Parity.ItemIndex];
  {Stop Bit}
  st:= copy(s,35,1);
  ComboBox_Stopbit.Text:= InttoStr(Ord(st[1]));

  {Flow Control}
  case S[36] of
    #$00: ComboBox_Flow.ItemIndex:= 0;
    #$01: ComboBox_Flow.ItemIndex:= 1;
    #$02: ComboBox_Flow.ItemIndex:= 2;
  end;
  ComboBox_Flow.Text:= ComboBox_Flow.Items[ComboBox_Flow.ItemIndex];
  {DelimiterChar}
  Edit_Char.Text:= ToHexStrNoSpace(s[37]);
  {FDelimiterSize}
  st:= Copy(S,38,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  Edit_Size.Text:= st2;
  {Delimitertime}
  st:= Copy(S,40,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  Edit_Time.Text:= st2;

  {FDelimiterIdle}
  st:= Copy(S,42,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  Edit_Idle.Text:= st2;

  {Debug Mode}
  if S[44] = #$0 then Checkbox_Debugmode.Checked:= True //IIM7100.FDebugMode:='0' //ON
  else                Checkbox_Debugmode.Checked:= False;// IIM7100.FDebugMode:='1';//OFF

  {Major Version}
  RzEdit1.Text:= InttoStr(Ord(s[45]))+'.'+InttoStr(Ord(s[46]));
  if Not chk_ZeronType.Checked then RzEdit1.Color := $0080FFFF
  else RzEdit1.Color := clSkyBlue;

  {DHCP MODE}
  if S[47] = #$0 then Checkbox_DHCP.Checked:= False//IIM7100.FOnDHCP:= '0'//OFF
  else                Checkbox_DHCP.Checked:= True;//IIM7100.FOnDHCP:= '1'; //ON

  {Connected State}
  if S[49] = #$0 then ed_LanState.Text := 'DisConnected'//IIM7100.FOnDHCP:= '0'//OFF
  else                ed_LanState.Text := 'Connected';//IIM7100.FOnDHCP:= '1'; //ON

  //Wiznet 접속을 끊는다.
  //if (OnWritewiznet = True) and
  if ClientSocket1.Active  then  ClientSocket1.Active:= False;

end;

procedure TMainForm.IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  DataStringStream: TStringStream;
  RecvData : String;
  S,st : string;
  MAcStr : string;
  nRow : integer;
  bSearch : Boolean;
begin
  DataStringStream := TStringStream.Create('');
  try
    DataStringStream.CopyFrom(AData, AData.Size);
    RecvData:=DataStringStream.DataString;
  finally
    DataStringStream.Free;
  end;

  WiznetTimer.Enabled:= False;

  S:= RecvData;

  if  Length(S) < 47 then Exit;

  WiznetData:= S;
  {MAC Address}

  if (copy(S,1,4) <> 'IMIN') and (copy(S,1,4) <> 'SETC')
     and (copy(S,1,4) <> 'LNDT') and (copy(S,1,4) <> 'LNSD')
  then Exit;

  if (copy(S,1,4) = 'IMIN') or (copy(S,1,4) <> 'SETC') then chk_ZeronType.Checked := False
  else chk_ZeronType.Checked := True;

  bWizeNetLanRecv := True;

  if (copy(S,1,4) = 'SETC') or (copy(S,1,4) = 'LNSD') then Exit;
  
  st:= copy(S,5,6);
  MAcStr:= ToHexStrNoSpace(st);
  MAcStr:=  Copy(MAcStr,1,2) + ':' +
            Copy(MAcStr,3,2) + ':' +
            Copy(MAcStr,5,2) + ':' +
            Copy(MAcStr,7,2) + ':' +
            Copy(MAcStr,9,2) + ':' +
            Copy(MAcStr,11,2);
  with sg_WiznetList do
  begin
    bSearch := False;
    for nRow := 1 to RowCount - 1 do
    begin
      if cells[0,nRow] = MAcStr then
      begin
        cells[0,nRow] := MAcStr ;
        cells[1,nRow] := WiznetData;
        sg_WiznetList.Row := nRow;
        bSearch := True;
      end;
    end;
    if Not bSearch then
    begin
      //if Cells[0,1] <> '' then rowCount := RowCount + 1;
      //cells[0,RowCount - 1] := MAcStr ;
      //cells[1,RowCount - 1] := WiznetData;
      if Not chk_Direct.Checked and
         chk_FixMac.Checked then
      begin
        if ed_FixMac.Text = MAcStr then
        begin
          if Cells[0,1] <> '' then rowCount := RowCount + 1;
          cells[0,RowCount - 1] := MAcStr ;
          cells[1,RowCount - 1] := WiznetData;
          cells[2,RowCount - 1] := copy(S,1,4);
        end;
      end else
      begin
        if Cells[0,1] <> '' then rowCount := RowCount + 1;
        cells[0,RowCount - 1] := MAcStr ;
        cells[1,RowCount - 1] := WiznetData;
        cells[2,RowCount - 1] := copy(S,1,4);
      end;
    end;
  end;
  sg_WiznetListClick(self);
end;

procedure TMainForm.Edit_LocateChange(Sender: TObject);
begin
  //MainForm.Caption := PROGRAM_NAME +' '+ strBuildInfo+'[' + CB_IPList.Text + '] - [ ' + Trim(Edit_Locate.Text) + ' ] ';
  //if G_nProgramType = 1 then
  //  MainForm.Caption := PROGRAM_NAME +' '+ strBuildInfo+'[' + CB_IPList.Text + '] - [ S-TEC ] '
  //else MainForm.Caption := PROGRAM_NAME +' '+ strBuildInfo+'[' + CB_IPList.Text + '] - [ KTTELECOP ] ';
end;

procedure TMainForm.LMDListBox1Click(Sender: TObject);
begin
  ed_OrgCardNo.Text := LMDListBox1.ItemPart(LMDListBox1.ItemIndex,11);
  ed_CardPositionNumber.Text := LMDListBox1.ItemPart(LMDListBox1.ItemIndex,10);
  ed_CardPositionHex.Text := LMDListBox1.ItemPart(LMDListBox1.ItemIndex,11);
  ed_CardPosition.Text := LMDListBox1.ItemPart(LMDListBox1.ItemIndex,12);
  ed_CardPositionNumber.Color := clWhite;
  ed_CardPosition.Color := clWhite;
  ed_CardPositionHex.Color := clWhite;
end;

procedure TMainForm.btn_GetPositionClick(Sender: TObject);
var
  stDeviceID : string;
  stData : string;
begin
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if Length(ed_OrgCardNo.Text) <> 8 then
  begin
    showmessage('카드번호는 8자리 HEX입니다.');
    Exit;
  end;
  stData := 'CD21' + ed_OrgCardNo.Text;
  sendPacket(stDeviceID,'R',stData,Sent_Ver);
end;

procedure TMainForm.btn_getCardNoClick(Sender: TObject);
var
  stDeviceID : string;
  stData : string;
begin
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if Not IsDigit(ed_OrgPosition.Text) then
  begin
    showmessage('위치정보는 숫자로만 기재하셔야 합니다.');
    Exit;
  end;
  stData := 'CD20' + FillZeroNumber(strtoint(ed_OrgPosition.Text),5);
  sendPacket(stDeviceID,'R',stData,Sent_Ver);
end;

function TMainForm.GetCardNoToPosition(aPacketData: string): string;
var
  nStartPos,nEndPos : integer;
  stPosition : string;

begin
  nStartPos := PosIndex(' ',aPacketData,2);
  nEndPos := PosIndex(' ',aPacketData,3);
  stPosition := copy(aPacketData,nStartPos + 1,nEndPos - nStartPos - 1);
  result := stPosition;

end;

function TMainForm.GetPositionToCardNo(aPacketData: string): string;
var
  nPosCount : integer;
  nStartPos,nEndPos : integer;
  stCardNo : string;
begin
  nPosCount := posCount(' ',aPacketData);
  nStartPos := PosIndex(' ',aPacketData,nPosCount - 1);
  nEndPos := PosIndex(' ',aPacketData,nPosCount);
  stCardNo := copy(aPacketData,nStartPos + 1,nEndPos - nStartPos - 1);
  result := stCardNo;

end;

procedure TMainForm.CD_PositionDownLoad(aDeviceID, aCardNo,
  aCardPosition: String; func: Char;aLength:integer = 10;bHex : Boolean = False);
var
  aData: String;
  I: Integer;
  xCardNo: String;
  RealCardNo: String;
  ValidDay: String;
  nLength: Integer;
  stYY,stMM,stDD:String;
  aRegCode,aCardAuth,aInOutMode : String;
  stCardType : string;
begin

  if isdigit(aCardPosition) then
    aCardPosition := FillZeroNumber(strtoint(aCardPosition),5)
  else
  begin
    aCardPosition := '*****';
  end;
  nLength:= Length(Trim(aCardNo));
  if nLength < aLength then
    aCardNo:= FillZeroStrNum(Trim(aCardNo),aLength);

  nLength:= Length(Trim(aCardNo));

  if nLength < (aLength + 6) then
  begin
    for I := 1  to (aLength + 6) - nLength do
    begin
      aCardNo:= aCardNo + '0';
    end;
  end;


  //SHowMessage(aCardNo);
  RealCardNo:= Copy(aCardNo,1,aLength);
  ValidDay:=   Copy(aCardNo,(aLength+1),6);
  //xCardNo:=  '00'+Dec2Hex64(StrtoInt64(RealCardNo),8);
  if Not bHex then    //Old 버젼이면
  begin
    xCardNo:=  '00'+EncodeCardNo(RealCardNo);
  end else
  begin
    xCardNo:= FillZeroNumber(aLength,2) +  RealCardNo;
  end;

  stYY := edYYYY.text;
  stMM := edMM.text;
  stDD := edDD.text;
  if (ck_YYMMDD.checked = False) or (stYY = '') then stYY := '0';
  if (ck_YYMMDD.checked = False) or (stMM = '') then stMM := '0';
  if (ck_YYMMDD.checked = False) or (stDD = '') then stDD := '0';

  aRegCode := inttostr(rdRegCode.itemindex);
  if rdCardAuth.itemindex > 0 then
    aCardAuth := inttostr(rdCardAuth.itemindex - 1)
  else aCardAuth := '2';
  aInOutMode := inttostr(rdInOutMode.itemindex);
  //순찰카드 추가
  if rg_tourCard.ItemIndex = 0 then stCardType := ' '
  else stCardType := 'V';

  aData:= '';
  aData:= func +
          //InttoStr(Send_MsgNo)+     // Message Count
          '0'+
          aRegCode+                      //등록코드(0:1,2   1:1번문,  2:2번문, 3:방범전용)
          ' '+                     //RecordCount #$20 #$20
          stCardType +
          '0'+                      //예비
          xCardNo+                  //카드번호
//          ValidDay+                 //유효기간
          FillZeroNumber(strtoint(stYY),2) +
          FillZeroNumber(strtoint(stMM),2) +
          FillZeroNumber(strtoint(stDD),2) + //유효기간
          '0'+                      //등록 결과
          aCardAuth+                      //카드권한(0:출입전용,1:방범전용,2:방범+출입)
          aInOutMode +                       //타입패턴
          aCardPosition;                  // 위치 정보

  //SHowMessage(aData);
  SendPacket(aDeviceID,'c',aData,Sent_Ver);
end;

procedure TMainForm.bt_CardSearchClick(Sender: TObject);
var
 DeviceID : String;
 i,j : Integer;
 aCardNo : String;
 stPositoinCardNumber : string;
 nLength : integer;
begin
  Label136.Caption :=inttostr(LMDListBox1.SelCount);
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if (chk_CardPosition.Checked) or (chk_CardPosition2.Checked) then
  begin
    ed_CardPositionNumber.Color := clWhite;
    ed_CardPosition.Color := clWhite;
    ed_CardPositionHex.Color := clWhite;
    stPositoinCardNumber := Trim(ed_CardPositionHex.Text);
    nLength := Length(stPositoinCardNumber);
    if rg_CardType.ItemIndex <> 1 then
    begin
      stPositoinCardNumber := inttostr(Hex2Dec64(stPositoinCardNumber));
      CD_PositionDownLoad(DeviceID,stPositoinCardNumber,ed_CardPosition.Text,'H');
    end else CD_PositionDownLoad(DeviceID,stPositoinCardNumber,ed_CardPosition.Text,'H',nLength,True);
    Exit;
  end;
  for i:= 0 to  LMDListBox1.Count - 1 do
  begin
    if  LMDListBox1.Selected[i] then
    begin
      aCardNo:= Trim(FindCharCopy(LMDListBox1.Items.Strings[i],10,';'));
      Label136.Caption := LMDListBox1.Items.Strings[i];
      if chk_CmdX.Checked then CD_XDownLoad(DeviceID,aCardNo,'M')
      else
      begin
        nLength := Length(aCardNo);
        if rg_CardType.ItemIndex = 1 then  CD_DownLoad(DeviceID,aCardNo,'M',nLength,True)
        else  CD_DownLoad(DeviceID,aCardNo,'M');
      end;
    end;
    Sleep(100);
    Application.ProcessMessages;
  end;
end;

procedure TMainForm.IdUDPServer2UDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  DataStringStream: TStringStream;
  RecvData : String;
  S,st : string;
  MAcStr : string;
  nRow : integer;
  bSearch : Boolean;
begin
  DataStringStream := TStringStream.Create('');
  try
    DataStringStream.CopyFrom(AData, AData.Size);
    RecvData:=DataStringStream.DataString;
  finally
    DataStringStream.Free;
  end;

  WiznetTimer.Enabled:= False;

  S:= RecvData;

  if  Length(S) < 47 then Exit;

  WiznetData:= S;
  {MAC Address}

  if (copy(S,1,4) <> 'IMIN') and (copy(S,1,4) <> 'SETC')
     and (copy(S,1,4) <> 'LNDT') and (copy(S,1,4) <> 'LNSD')
  then Exit;

  if (copy(S,1,4) = 'IMIN') or (copy(S,1,4) <> 'SETC') then chk_ZeronType.Checked := False
  else chk_ZeronType.Checked := True;

  bWizeNetLanRecv := True;

  st:= copy(S,5,6);
  MAcStr:= ToHexStrNoSpace(st);
  MAcStr:=  Copy(MAcStr,1,2) + ':' +
            Copy(MAcStr,3,2) + ':' +
            Copy(MAcStr,5,2) + ':' +
            Copy(MAcStr,7,2) + ':' +
            Copy(MAcStr,9,2) + ':' +
            Copy(MAcStr,11,2);
  with sg_WiznetList do
  begin
    bSearch := False;
    for nRow := 1 to RowCount - 1 do
    begin
      if cells[0,nRow] = MAcStr then
      begin
        cells[0,nRow] := MAcStr ;
        cells[1,nRow] := WiznetData;
        sg_WiznetList.Row := nRow;
        bSearch := True;
      end;
    end;
    if Not bSearch then
    begin
      //if Cells[0,1] <> '' then rowCount := RowCount + 1;
      //cells[0,RowCount - 1] := MAcStr ;
      //cells[1,RowCount - 1] := WiznetData;
      if Not chk_Direct.Checked and
         chk_FixMac.Checked then
      begin
        if ed_FixMac.Text = MAcStr then
        begin
          if Cells[0,1] <> '' then rowCount := RowCount + 1;
          cells[0,RowCount - 1] := MAcStr ;
          cells[1,RowCount - 1] := WiznetData;
          cells[2,RowCount - 1] := copy(S,1,4);
        end;
      end else
      begin
        if Cells[0,1] <> '' then rowCount := RowCount + 1;
        cells[0,RowCount - 1] := MAcStr ;
        cells[1,RowCount - 1] := WiznetData;
        cells[2,RowCount - 1] := copy(S,1,4);
      end;
    end;
  end;
  sg_WiznetListClick(self);
end;

procedure TMainForm.N18Click(Sender: TObject);
begin
  fmMonitorMain:= TfmMonitorMain.Create(Self);
  MainForm.WindowState := wsMinimized;
  fmMonitorMain.Showmodal;
  MainForm.WindowState := wsMaximized;
  fmMonitorMain.Free;

end;

function TMainForm.GetDecordeFormat(aDecMCode,aDecCMD,aMsgNo,aData,aDecTail: string): string;
var
  nLength : integer;
  stDecHeader : string;
  stDecTail : string;
  stDecFormat : string;
begin
  stDecHeader := '';
  stDecTail := aDecTail;
  stDecHeader := #$20 + aDecMCode + '*' + '0000000000' + FormatDateTime('yymmddHHMMSS',Now)
                 + aDecCMD + aMsgNo
                 + FillZeroNumber(Length(aData),3);
//  stDecTail := ed_DecModem1.Text + ed_DecChannel1.Text + ed_DecCntl1.Text + Trim(ed_Dectail1.text);
{  if rg_Decoder.ItemIndex = 0 then
  begin
    stDecHeader := #$20 + ed_DecMCode1.Text + FormatDateTime('yymmddHHMMSS',Now)
                   + ed_DecCMD1.Text + InttoStr(Send_MsgNo)
                   + FillZeroNumber(Length(aData),3);
    stDecTail := ed_DecModem1.Text + ed_DecChannel1.Text + ed_DecCntl1.Text + Trim(ed_Dectail1.text);
  end else if rg_Decoder.ItemIndex = 1 then
  begin
    stDecHeader := #$20 + ed_DecMCode2.Text + FormatDateTime('yymmddHHMMSS',Now)
                   + ed_DecCMD2.Text + InttoStr(Send_MsgNo)
                   + FillZeroNumber(Length(aData),3);
    stDecTail := ed_DecModem2.Text + ed_DecChannel2.Text + ed_DecCntl2.Text + Trim(ed_Dectail2.text);
  end else if rg_Decoder.ItemIndex = 2 then
  begin
    stDecHeader := #$20 + ed_DecMCode3.Text + FormatDateTime('yymmddHHMMSS',Now)
                   + ed_DecCMD3.Text + InttoStr(Send_MsgNo)
                   + FillZeroNumber(Length(aData),3);
    stDecTail := ed_DecModem2.Text + ed_DecChannel2.Text + ed_DecCntl2.Text + Trim(ed_Dectail2.text);
  end else
  begin
    result := aData;
    Exit;
  end; }
  nLength := Length(stDecHeader) + Length(aData) + Length(stDecTail);

  stDecFormat := SOH + FillZeroNumber(nLength+7,3) + stDecHeader + aData + stDecTail;
  result := stDecFormat + MakeCSData(stDecFormat+EOH,G_nProgramType) + EOH;
end;

function TMainForm.GetDecorderRecvData(aPacketData: string): string;
var
  Lenstr : string;
begin
  Lenstr:= Copy(aPacketData,G_nIDLength + 25,3);
  //result := STX + copy(aData,25,strtoint(LenStr)) + ETX;
  if Not isDigit(Lenstr) then result := aPacketData
  else result := copy(aPacketData,G_nIDLength + 29,strtoint(LenStr));
end;

function TMainForm.GetEventData(aVer, aPacketData: string): string;
var
  st : string;
  stCntId : string;
  stCommand : string;
  stmsgData : string;
  nLen : integer;
begin
  if (aVer = 'K1') or (aVer = 'ST') then
  begin
    stCntId:= Copy(aPacketData,8,G_nIDLength + 2);
    stCommand:= aPacketData[G_nIDLength + 10];

    stmsgData := Copy(aPacketData,G_nIDLength + 12,Length(aPacketData)-(G_nIDLength + 14));
    st := WinsockPort.WsAddress +#9+
          Copy(stCntId,1,G_nIDLength)+#9+
          Copy(stCntId,G_nIDLength + 1,2)+#9+
          stCommand+#9+
          stmsgData+#9+
          'RX'+#9+
          aPacketData +#9+
          aVer ;

  end else
  begin
    stCommand:= aPacketData[G_nIDLength + 24];
    nLen := strtoint(copy(aPacketData,G_nIDLength + 26,3));

    stmsgData := Copy(aPacketData,G_nIDLength + 29,nLen);
    st := WinsockPort.WsAddress +#9+
          Copy(aPacketData,G_nIDLength + 12,12)+#9+
          ''+#9+
          stCommand+#9+
          stmsgData+#9+
          'RX'+#9+
          aPacketData +#9+
          aVer ;
  end;
  result:= st;
end;

function TMainForm.CheckDecorderDataPacket(aData: String;
  var bData: String;var aPacketData:string):integer;
var
  aIndex: Integer;
  Lenstr: String;
  DefinedDataLength: Integer;
  StrBuff: String;
  etxIndex: Integer;
begin

  result := -1;

  aPacketData:= '';
  Lenstr:= Copy(aData,2,3);
  //데이터 길이 위치 데이터가 숫자가 아니면...
  if not isDigit(Lenstr) then
  begin
    //Delete(aData,1,1);       //1'st SOH 삭제
    { 2010.11.25 수정
    aIndex:= Pos(SOH,aData); // 다음 SOH 찾기
    if aIndex = 0 then       //SOH가 없으면...
    begin
      //전체 데이터 버림
      bData:= '';
    end else if aIndex > 1 then // SOH가 1'st가 아니면
    begin
      Delete(aData,1,aIndex-1);//SOH 앞 데이터 삭제
      bData:= aData;
    end else
    begin
      bData:= aData;
    end;   }
    bData:= aData;
    Exit;
  end;

  //패킷에 정의된 길이
  DefinedDataLength:= StrtoInt(Lenstr);
  //패킷에 정의된 길이보다 실제 데이터가 작으면
  if Length(aData) < DefinedDataLength then
  begin
    result := -2;  // 2010.11.25 수정 작게 들어 온 상태
    {
    //실제 데이터가 길이가 작으면(아직 다 못받은 상태)
    etxIndex:= POS(EOH,aData);
    if etxIndex > 0 then
    begin
     Delete(aData,1,etxIndex);
    end;   }
    bData:= aData;
    Exit;
  end;

  // 정의된 길이 마지막 데이터가 ETX가 맞는가?
  if aData[DefinedDataLength] = EOH then
  begin
    result := 2; //Decorder Format 이 맞음
    StrBuff:= Copy(aData,1,DefinedDataLength);
    aPacketData:=StrBuff;
    Delete(aData, 1, DefinedDataLength);
    bData:= aData;
  end else
  begin
    //마직막 데이터가 EOH가 아니면 1'st SOH지우고 다음 SOH를 찾는다.
    //Delete(aData,1,1);
    { 2010.11.25 한 패킷만 삭제 하고
    aIndex:= Pos(SOH,aData); // 다음 SOH 찾기
    if aIndex = 0 then       //SOH가 없으면...
    begin
      //전체 데이터 버림
      bData:= '';
    end else if aIndex > 1 then // SOH가 1'st가 아니면
    begin
      Delete(aData,1,aIndex-1);//SOH 앞 데이터 삭제
      bData:= aData;
    end else
    begin
      bData:= aData;
    end; }
    bData:= aData;
  end;
end;

function TMainForm.DecoderDataPacektProcess(aPacketData: string): Boolean;
var
  aKey: Byte;
  st: string;
  aCommand: Char;
  aCntId: String;
  amsgData : String;
  aVer : string;
  stEventData : string;
  stDecMCode : string;
  stDecCMD : string;
  stMsgNo : string;
  stDecTail : string;
  stData : string;
begin
  Result:= False;
  if aPacketData = '' then Exit;

  //31:Q++()./,-**s*S^**+()./,-()
  aKey:= Ord(aPacketData[5]);
  st:= Copy(aPacketData,1,5) + EncodeData(aKey,Copy(aPacketData,6,Length(aPacketData)-6))+aPacketData[Length(aPacketData)];

  aPacketData:= st;
  aVer := copy(aPacketData,6,2);
  stEventData := GetEventData(aVer,aPacketData);
  //if aVer <> 'K1' then aData := GetDecorderRecvData(aData);
  stDecMCode := copy(aPacketData,6,2);
  stDecCMD := copy(aPacketData,G_nIDLength + 24,1);
  stMsgNo := copy(aPacketData,G_nIDLength + 25,1);
  stDecTail := GetDecoderInfo(aPacketData);
  stData := GetDecorderRecvData(aPacketData);

//        Copy(aData,19,Length(aData)-21)+#9+
//  if aCommand <> '#' then
//  begin
  if cbDisplayPolling.Checked = True then
  begin
    AddEventList(stEventData);
  end else
  begin
    if stDecCMD <> 'e' then AddEventList(stEventData);
  end;

  if stDecCMD <> 'a' then    //Ack Data 가 아닌경우
  begin
    if stDecCMD = 'e' then
    begin
      if Not cbDisplayPolling.Checked then DecoderSendPacket(stDecMCode,'a',stMsgNo,'',stDecTail,False)
      else DecoderSendPacket(stDecMCode,'a',stMsgNo,'',stDecTail)
    end else
      DecoderSendPacket(stDecMCode,'a',stMsgNo,'',stDecTail);  //Decoder Ack신호
  end;

  Result:= True;
end;

function TMainForm.GetDecoderInfo(aPacketData: string): string;
var
  DecLenstr : string;
  DataLenstr : string;
begin
  result := '';
  DecLenstr := Copy(aPacketData,2,3);
  DataLenstr:= Copy(aPacketData,G_nIDLength + 26,3);
  //result := STX + copy(aData,25,strtoint(LenStr)) + ETX;
  if Not isDigit(DecLenstr) then Exit;
  if Not isDigit(DataLenstr) then Exit;
                                                                                                  // CS + EOH
  result := copy(aPacketData,G_nIDLength + 29 + strtoint(DataLenstr), strtoint(DecLenstr) - strtoint(DataLenstr) - (G_nIDLength + 29) - 2 );
end;

function TMainForm.DecoderSendPacket(aDecMCode, aDecCMD, aMsgNo, aData,
  aDecTail: string;bVisible:Boolean = True): Boolean;
var
  ErrCode: Integer;
  ACKStr: String;
  ACKStr2: String;
  aDataLength: Integer;
  aLengthStr: String;
  aKey:Integer;
  amsgData : String;
  st: string;
  DecorderFormat : string;
begin

  Result := False;

  
  if DoCloseWinsock then Exit;

  if not WinsockPort.Open then
  begin
    Off_Timer.Enabled:= False;
    BroadTimer.Enabled:= False;
    BroadStopTimer.Enabled := False;
    bCardDownLoadStop := True;
    bConnected := False;
    ShowMessage('통신 연결이 안되었습니다.');
    Exit;
  end;
  bConnected := True;

  ErrCode:= 0;
  Result:= False;
  ACKStr2 := GetDecordeFormat(aDecMCode, aDecCMD, aMsgNo, aData,aDecTail);

  WinsockPort.PutString(ACKStr2);

  amsgData :=  Copy(ACKStr2,36,Length(ACKStr2)-36-2);

  st:=  'Server:'+INttoStr(Errcode) +#9+
        ''+#9+
        ''+#9+
        //Copy(ACKStr2,17,2)+';'+
        ACKStr2[31]+#9+
        amsgData+#9+
        //Copy(ACKStr2,19,Length(ACKStr2)-21)+#9+
        'TX'+#9+
        ACkStr2 + #9 +
        '';

  if bVisible then
    AddEventList(st);

  Result:= True;
end;

procedure TMainForm.btn_CardBinCreatClick(Sender: TObject);
var
  stFileName : string;
  CardData:string;
  i : integer;
  stCardNo : string;
  nRandomCard : integer;
  stHeader : string;
  nHeaderLength : integer;
begin
  stHeader := 'Card Count : @@@@@@' + #13 + #10;
  stHeader := stHeader + 'Card Unit  : $$' + #13 + #10;
  stHeader := stHeader + 'Card Offset: ####' + #13 + #10;
  stHeader := stHeader + '================================= ' + #13 + #10;
  nHeaderLength := Length(stHeader);
  if Not IsDigit(ed_CardCount.Text) then ed_CardCount.Text := '10000';
  if Not IsDigit(ed_BinSize.Text) then ed_BinSize.Text := '14';
  stHeader := StringReplace(stHeader,'@@@@@@',FillZeroNumber(strtoint(ed_CardCount.Text),6),[rfReplaceAll]);
  stHeader := StringReplace(stHeader,'$$',FillZeroNumber(strtoint(ed_BinSize.Text),2),[rfReplaceAll]);
  stHeader := StringReplace(stHeader,'####',FillZeroNumber(nHeaderLength,4),[rfReplaceAll]);
  if Not RzOpenDialog1.Execute then Exit;
  btn_CardBinCreat.Enabled := False;
  stFileName := RzOpenDialog1.FileName;
  CardData := '';
  for i:= 0 to Memo_CardNo.Lines.Count -1 do
  begin
    if (i + 1) > strtoint(ed_CardCount.Text) then break; 
    stCardNo:= Memo_CardNo.Lines[i];
    CardData := CardData + GetHEXCardDownLoadData(stCardNo,i);
    Application.ProcessMessages;
  end;
  Randomize;
  for i:= Memo_CardNo.Lines.Count + 1 to strtoint(ed_CardCount.Text) do
  begin
    nRandomCard := Random(1000000000);
    CardData := CardData + GetHEXCardDownLoadData(inttostr(nRandomCard),i);
  end;
  if chk_BinHeader.Checked then  Hex2BinFile(stFileName,stHeader,CardData)
  else Hex2BinFile(stFileName,'',CardData);
  btn_CardBinCreat.Enabled := True;
end;

function TMainForm.GetHEXCardDownLoadData(aCardNo: String;aCount:integer): string;
var
  nLength: Integer;
  CheckSumData : string;
  nCheckSum : integer;
  stCheckSum : string;
  stCardData :string;
  i : integer;
  stCount : string;
begin
  stCount := intToHex(aCount,4);
  if Length(stCount) < 4 then stCheckSum := '0' + stCount
  else if Length(stCount) > 4 then stCount := copy(stCount,Length(stCount) - 1,4);
  nLength:= Length(aCardNo);
  if nLength < 10 then
    aCardNo:= FillZeroStrNum(aCardNo,10);
  aCardNo := EncodeHEXCardNo(aCardNo);

  CheckSumData := Hex2ASCII(aCardNo);
  nCheckSum := 0;
  for i:= 1 to Length(CheckSumData) do
  begin
    nCheckSum := nCheckSum + Ord(CheckSumData[i]);
  end;
  stCheckSum := Dec2Hex(nCheckSum,2);
  if Length(stCheckSum) < 2 then stCheckSum := '0' + stCheckSum
  else if Length(stCheckSum) > 2 then stCheckSum := copy(stCheckSum,Length(stCheckSum) - 1,2);


  stCardData := '';
  stCardData := stCardData + '03'; //DOOR TYPE 01 : 1번문 02 : 2번문,03:1,2번문
  stCardData := stCardData + '03'; //Card Type 01 : 방범 02 :출입,03:방범출입
  stCardData := stCardData + '00'; //CardPattern 현재 0x00으로 사용
  stCardData := stCardData + '00'; //Card 차수 현재 0x00으로 사용
  stCardData := stCardData + '00'; //유효기간 (년) 현재 0x00으로 사용
  stCardData := stCardData + '00'; //유효기간 (월) 현재 0x00으로 사용
  stCardData := stCardData + '00'; //유효기간 (일) 현재 0x00으로 사용
  stCardData := stCardData + aCardNo; //카드데이터 4바이트 8자리 HexString
  stCardData := stCardData + stCheckSum; //Cs card Data 4 자리의 합
  stCardData := stCardData + stCount; //카드데이터 4바이트 8자리 HexString

  if Not IsDigit(ed_BinSize.text) then ed_BinSize.text := '14';
  nLength := strtoint(ed_BinSize.text);
  if Length(stCardData) > (nLength * 2) then stCardData := copy(stCardData,1,(nLength * 2))
  else stCardData := FillZeroStrNum(stCardData,(nLength * 2),False);
  result := stCardData;
end;

procedure TMainForm.btn_CardStructClick(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := Edit_CurrentID.text + ComboBox_IDNO.Text ;
  SendPacket(stDeviceID,'R','CD30',Sent_Ver);
end;

procedure TMainForm.chk_CardBinClick(Sender: TObject);
begin
  if chk_CardBin.Checked then
  if chk_CardBinHD.Checked then chk_CardBinHD.Checked := False;
end;

procedure TMainForm.chk_CardBinHDClick(Sender: TObject);
begin
  if chk_CardBinHD.Checked then
  if chk_CardBin.Checked then chk_CardBin.Checked := False;

end;

procedure TMainForm.RzGroup3Items6Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 17;
end;

procedure TMainForm.btn_DeviceStateClick(Sender: TObject);
var
  stDeviceID : string;
begin
  DeviceStateClear;
  stDeviceID :=  Edit_CurrentID.text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'R','SM00',Sent_Ver);
  Delay(500);
  SendPacket(stDeviceID,'R','SM20',Sent_Ver);
  Delay(500);
  SendPacket(stDeviceID,'R','SM21' + FillZeroNumber(strtoint(ed_DeviceMonitoringTime.Text),5),Sent_Ver);
end;

procedure TMainForm.DeviceState1Show(aRealData: string);
var
  //nDip1:integer;
  //nDip2:integer;
  stBinaryCode:string;
begin
  if IsDigit(aRealData[1]) then rg_AcState.ItemIndex := strtoint(aRealData[1])
  else rg_AcState.ItemIndex := -1;
  if IsDigit(aRealData[2]) then rg_batterrystate.ItemIndex := strtoint(aRealData[2])
  else rg_batterrystate.ItemIndex := -1;
  if IsDigit(aRealData[3]) then rg_TemperState.ItemIndex := strtoint(aRealData[3])
  else rg_TemperState.ItemIndex := -1;
  if IsDigit(aRealData[4]) then rg_SirenState.ItemIndex := strtoint(aRealData[4])
  else rg_SirenState.ItemIndex := -1;
  if IsDigit(aRealData[5]) then rg_LampState.ItemIndex := strtoint(aRealData[5])
  else rg_LampState.ItemIndex := -1;
  if IsDigit(aRealData[6]) then rg_AlarmState.ItemIndex := strtoint(aRealData[6])
  else rg_AlarmState.ItemIndex := -1;
  if IsDigit(aRealData[7]) then rg_fskLevelstate.ItemIndex := strtoint(aRealData[7])
  else rg_fskLevelstate.ItemIndex := -1;
  stBinaryCode := HexToBinary(copy(aRealData,8,2));
  ed_dipswitch.Text := copy(stBinaryCode,2,7);
  if IsDigit(stBinaryCode[2]) then rg_Dip7.ItemIndex := iif(strtoint(stBinaryCode[2])=0,1,0);
  if IsDigit(stBinaryCode[3]) then rg_Dip6.ItemIndex := iif(strtoint(stBinaryCode[3])=0,1,0);
  if IsDigit(stBinaryCode[4]) then rg_Dip5.ItemIndex := iif(strtoint(stBinaryCode[4])=0,1,0);
  if IsDigit(stBinaryCode[5]) then rg_Dip4.ItemIndex := iif(strtoint(stBinaryCode[5])=0,1,0);
  if IsDigit(stBinaryCode[6]) then rg_Dip3.ItemIndex := iif(strtoint(stBinaryCode[6])=0,1,0);
  if IsDigit(stBinaryCode[7]) then rg_Dip2.ItemIndex := iif(strtoint(stBinaryCode[7])=0,1,0);
  if IsDigit(stBinaryCode[8]) then rg_Dip1.ItemIndex := iif(strtoint(stBinaryCode[8])=0,1,0);
  
end;

procedure TMainForm.DeviceState2Show(aRealData: string);
begin
  if IsDigit(aRealData[6]) then
  begin
    rg_LockRelayState1.ItemIndex := strtoint(aRealData[6]);
    rg_dLockRelayState1.ItemIndex := strtoint(aRealData[6]);
  end else
  begin
    rg_LockRelayState1.ItemIndex := -1;
    rg_dLockRelayState1.ItemIndex := -1;
  end;
  if IsDigit(aRealData[7]) then
  begin
    rg_lsState1.ItemIndex := strtoint(aRealData[7]);
    rg_dlsState1.ItemIndex := strtoint(aRealData[7]);
  end else
  begin
    rg_lsState1.ItemIndex := -1;
    rg_dlsState1.ItemIndex := -1;
  end;
  if IsDigit(aRealData[8]) then
  begin
    rg_dsState1.ItemIndex := strtoint(aRealData[8]);
    rg_ddsState1.ItemIndex := strtoint(aRealData[8]);
  end else
  begin
    rg_dsState1.ItemIndex := -1;
    rg_ddsState1.ItemIndex := -1;
  end;
  if IsDigit(aRealData[9]) then
  begin
    rg_ExitState1.ItemIndex := strtoint(aRealData[9]);
    rg_dExitState1.ItemIndex := strtoint(aRealData[9]);
  end else
  begin
    rg_ExitState1.ItemIndex := -1;
    rg_dExitState1.ItemIndex := -1;
  end;

  if IsDigit(aRealData[11]) then
  begin
    rg_LockRelayState2.ItemIndex := strtoint(aRealData[11]);
    rg_dLockRelayState2.ItemIndex := strtoint(aRealData[11]);
  end else
  begin
    rg_LockRelayState2.ItemIndex := -1;
    rg_dLockRelayState2.ItemIndex := -1;
  end;
  if IsDigit(aRealData[12]) then
  begin
    rg_lsState2.ItemIndex := strtoint(aRealData[12]);
    rg_dlsState2.ItemIndex := strtoint(aRealData[12]);
  end else
  begin
    rg_lsState2.ItemIndex := -1;
    rg_dlsState2.ItemIndex := -1;
  end;
  if IsDigit(aRealData[13]) then
  begin
    rg_dsState2.ItemIndex := strtoint(aRealData[13]);
    rg_ddsState2.ItemIndex := strtoint(aRealData[13]);
  end else
  begin
    rg_dsState2.ItemIndex := -1;
    rg_ddsState2.ItemIndex := -1;
  end;
  if IsDigit(aRealData[14]) then
  begin
    rg_ExitState2.ItemIndex := strtoint(aRealData[14]);
    rg_dExitState2.ItemIndex := strtoint(aRealData[14]);
  end else
  begin
    rg_ExitState2.ItemIndex := -1;
    rg_dExitState2.ItemIndex := -1;
  end;

end;

procedure TMainForm.DeviceStateClear;
begin
  rg_AcState.ItemIndex := -1;
  rg_batterrystate.ItemIndex := -1;
  rg_TemperState.ItemIndex := -1;
  rg_SirenState.ItemIndex := -1;
  rg_LampState.ItemIndex := -1;
  rg_AlarmState.ItemIndex := -1;
  rg_fskLevelstate.ItemIndex := -1;

  rg_Dip7.ItemIndex := -1;
  rg_Dip6.ItemIndex := -1;
  rg_Dip5.ItemIndex := -1;
  rg_Dip4.ItemIndex := -1;
  rg_Dip3.ItemIndex := -1;
  rg_Dip2.ItemIndex := -1;
  rg_Dip1.ItemIndex := -1;

  rg_LockRelayState1.ItemIndex := -1;
  rg_lsState1.ItemIndex := -1;
  rg_dsState1.ItemIndex := -1;
  rg_ExitState1.ItemIndex := -1;

  rg_LockRelayState2.ItemIndex := -1;
  rg_lsState2.ItemIndex := -1;
  rg_dsState2.ItemIndex := -1;
  rg_ExitState2.ItemIndex := -1;

end;

procedure TMainForm.DeviceDoorStateShow(aDeviceID,aData: string);
var
  stData: string;
  stEventData : string;
  stOpenMode:string;
  stCloseMode:string;
  stTemp : string;
begin
  stData := copy(aData,5,Length(aData) - 4);
  inc(L_nSeq);
  stEventData := inttostr(L_nSeq) + ';';
  stEventData := stEventData + copy(aDeviceID,8,2) + ';';               // 기기번호
  stEventData := stEventData + stData[1] + ';'; //출입문 번호
  stOpenMode := copy(stData,3,3);
  stCloseMode := copy(stData,7,3);
  if stOpenMode = '000' then
  begin
    stEventData := stEventData + '닫힘' + ';';
    stEventData := stEventData + stCloseMode[1] + ';';
    stEventData := stEventData + stCloseMode[2] + ';';
    if stCloseMode[3] = 'L' then stEventData := stEventData + 'OFF' + ';'
    else stEventData := stEventData + 'ON' + ';';
    //stEventData := stEventData + stCloseMode[3] + ';';
  end else
  begin
    stEventData := stEventData + '열림' + ';';
    if stOpenMode[1] = 'R' then stTemp := '원격'
    else if stOpenMode[1] = 'B' then stTemp := '버튼'
    else if stOpenMode[1] = 'C' then stTemp := '카드'
    else if stOpenMode[1] = 'S' then stTemp := '스케줄'
    else stTemp := stOpenMode[1];

    stEventData := stEventData +stTemp + ';';
    stEventData := stEventData + stOpenMode[2] + ';' ;
    //stEventData := stEventData + stOpenMode[3] + ';';
    if stOpenMode[3] = 'L' then stEventData := stEventData + 'OFF' + ';'
    else stEventData := stEventData + 'ON' + ';';
  end;
  if stData[11] = 'O' then stEventData := stEventData + 'OPEN' + ';'
  else stEventData := stEventData + 'CLOSE' + ';';
  //stEventData := stEventData + stData[11] + ';'; //LS
  if stData[12] = 'O' then stEventData := stEventData + 'OPEN' + ';'
  else stEventData := stEventData + 'CLOSE' + ';';
  //stEventData := stEventData + stData[12] + ';'; //DS
  if stData[13] = 'O' then stEventData := stEventData + 'OPEN' + ';'
  else stEventData := stEventData + 'CLOSE' + ';';
  //stEventData := stEventData + stData[13] + ';'; //Exit
  Case stData[14] of
    '0' : begin stTemp := '운영모드'; end;
    '1' : begin stTemp := '개방모드'; end;
    '2' : begin stTemp := '폐쇄모드'; end;
    else stTemp := stData[14];
  end;
  stEventData := stEventData + stTemp + ';'; //Lock Mode
  //  stEventData := stEventData + stData[14] + ';'; //Lock Mode
  Case stData[15] of
    '0' : begin stTemp := '일반형(정전시 잠김)'; end;
    '1' : begin stTemp := '일반형(정전시 열림)'; end;
    '2' : begin stTemp := '데드볼트(정전시 잠김)'; end;
    '3' : begin stTemp := '데드볼트(정전시 열림)'; end;
    '4' : begin stTemp := '스트라이크(정전시 잠김)'; end;
    '5' : begin stTemp := '스트라이크(정신시 열림)'; end;
    '6' : begin stTemp := '자동문/주차'; end;
    '7' : begin stTemp := '부져/램프제어/식당'; end;
    '8' : begin stTemp := 'SPEED GATE'; end;
    '9' : begin stTemp := '순시타입'; end;
    else stTemp := stData[14]; 
  end;
  stEventData := stEventData + stTemp + ';'; //Lock Type
//  stEventData := stEventData + stData[15] + ';'; //Lock Type
  stEventData := stEventData + stData[16] + ';'; //화재
  stEventData := stEventData + stData[17] + ';'; //스케줄
  stEventData := stEventData + stData[18] + ';'; //Access Mode
  stEventData := stEventData + stData[19] + ';'; //구간

  DoorState_List.Items.Add(stEventData);
  //DoorState_List.ItemIndex := DoorState_List.Items.Count;
  DoorState_List.Selected[DoorState_List.Items.Count-1] := True;

end;

procedure TMainForm.Btn_Send41Click(Sender: TObject);
var
  I: Integer;
  aDeviceID: String;
  aData: String;
  st: string;
  aFunc: Char;
  aCmd : string;
begin
  for I:= 1 to 16 do
  begin
    if Array_FingerEdit[I].Btn_Send = Sender then
    begin
      if Array_FingerEdit[I].FingFUNC.Text <> '' then
      begin
        aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

        if cb_SendFullData.Checked = False then
        begin
          if Array_SendEdit[I].Func.Text <> '' then
          begin
            aFunc:= Array_FingerEdit[I].FingFUNC.Text[1];
            aCmd := Array_FingerEdit[I].FingCMD.Text;
            aData:= Array_FingerEdit[I].FingSTART.Text +
                    Array_FingerEdit[I].FingData1.Text +
                    Array_FingerEdit[I].FingData2.Text +
                    Array_FingerEdit[I].FingData3.Text +
                    Array_FingerEdit[I].FingData4.Text +
                    Array_FingerEdit[I].FingCheckSum.Text +
                    Array_FingerEdit[I].FingEND.Text;

            SendPacket(aDeviceID,aFunc,aCmd + aData,Sent_Ver);
          end else
          begin
            SHowMessage('펑션코드가  없습니다.');
            Exit;
          end;
        end else
        begin
        {  //WinsockPort.FlushOutBuffer;
          aData:= Array_SendEdit[I].Edit.Text;
          WinsockPort.PutString(aData);
          st:=  'Server:'+'0' +#9+
                Copy(aDeviceID,1,7)+#9+
                Copy(aDeviceID,8,2)+#9+
                //Copy(ACKStr2,17,2)+';'+
                aData[17]+#9+
                Copy(aData,19,Length(aData)-21)+#9+
                'TX'+#9+
                aData +#9+
                '';
           //showMessage(st);
          AddEventList(st);
        }
        end;


      end else
      begin
      end;

      Exit;
    end;
  end;
end;

procedure TMainForm.ed_FinDT141Exit(Sender: TObject);
var
  I :integer;
  aData : string;
begin
  for I:= 1 to 16 do
  begin
    if Array_FingerEdit[I].FingData1 = Sender then
    begin
      aData := Array_FingerEdit[I].FingSTART.Text +
               Array_FingerEdit[I].FingData1.Text +
               Array_FingerEdit[I].FingData2.Text +
               Array_FingerEdit[I].FingData3.Text +
               Array_FingerEdit[I].FingData4.Text;
      Array_FingerEdit[I].FingCheckSum.Text := Dec2Hex(Ord(FingerCheckSum(aData)),2);
      Exit;
    end;
  end;

end;

function TMainForm.FingerCheckSum(aData: string): Char;
var
  stHex : string;
  i : integer;
  aBcc: Byte;
  BCC: string;
begin
  aBcc := 0; //Ord(char(StrToIntDef('$00', 0)));
  for i:=0 to (Length(aData) div 2) do
  begin
    stHex := copy(aData,1 + (i * 2),2);
    aBcc := aBcc + Ord(char(StrToIntDef('$' + stHex, 0)));
  end;
  BCC := Chr(aBcc);
  result := BCC[1];
end;

procedure TMainForm.ed_FinDT241Exit(Sender: TObject);
var
  I :integer;
  aData : string;
begin
  for I:= 1 to 16 do
  begin
    if Array_FingerEdit[I].FingData2 = Sender then
    begin
      aData := Array_FingerEdit[I].FingSTART.Text +
               Array_FingerEdit[I].FingData1.Text +
               Array_FingerEdit[I].FingData2.Text +
               Array_FingerEdit[I].FingData3.Text +
               Array_FingerEdit[I].FingData4.Text;
      Array_FingerEdit[I].FingCheckSum.Text := Dec2Hex(Ord(FingerCheckSum(aData)),2);
      Exit;
    end;
  end;

end;

procedure TMainForm.ed_FinDT341Exit(Sender: TObject);
var
  I :integer;
  aData : string;
begin
  for I:= 1 to 16 do
  begin
    if Array_FingerEdit[I].FingData3 = Sender then
    begin
      aData := Array_FingerEdit[I].FingSTART.Text +
               Array_FingerEdit[I].FingData1.Text +
               Array_FingerEdit[I].FingData2.Text +
               Array_FingerEdit[I].FingData3.Text +
               Array_FingerEdit[I].FingData4.Text;
      Array_FingerEdit[I].FingCheckSum.Text := Dec2Hex(Ord(FingerCheckSum(aData)),2);
      Exit;
    end;
  end;

end;

procedure TMainForm.ed_FinDT441Exit(Sender: TObject);
var
  I :integer;
  aData : string;
begin
  for I:= 1 to 16 do
  begin
    if Array_FingerEdit[I].FingData4 = Sender then
    begin
      aData := Array_FingerEdit[I].FingSTART.Text +
               Array_FingerEdit[I].FingData1.Text +
               Array_FingerEdit[I].FingData2.Text +
               Array_FingerEdit[I].FingData3.Text +
               Array_FingerEdit[I].FingData4.Text;
      Array_FingerEdit[I].FingCheckSum.Text := Dec2Hex(Ord(FingerCheckSum(aData)),2);
      Exit;
    end;
  end;

end;

procedure TMainForm.Btn_Clear41Click(Sender: TObject);
var
  I: Integer;
begin
  for I:= 1 to 16 do
  begin
    if Array_FingerEdit[I].Btn_Clear = Sender then
    begin
      Array_FingerEdit[I].FingData1.Text := '';
      Array_FingerEdit[I].FingData2.Text := '';
      Array_FingerEdit[I].FingData3.Text := '';
      Array_FingerEdit[I].FingData4.Text := '';
      Exit;
    end;
  end;
end;

procedure TMainForm.N19Click(Sender: TObject);
begin
    fmConfig := TfmConfig.Create(Self);
    fmConfig.OrgPW := stPW;
    fmConfig.ShowModal;
    fmConfig.Free;

end;

procedure TMainForm.cmb_DoorControlTimeCloseUp(Sender: TObject);
begin
  L_nDoorItemIndex := cmb_DoorControlTime.itemIndex;
end;

procedure TMainForm.cmb_DoorControlTimeDropDown(Sender: TObject);
begin
  cmb_DoorControlTime.SelStart := L_nDoorItemIndex;
  cmb_DoorControlTime.ItemIndex := L_nDoorItemIndex;
end;

procedure TMainForm.btn_CardSaveClick(Sender: TObject);
begin
  LMDListBox1.Items.SaveToFile('c:\'+FormatdateTime('yyyymmddHHMMSS',Now) + 'CardData.txt');
  showmessage('파일저장완료');
end;

procedure TMainForm.ComboBox_WatchTypeChange(Sender: TObject);
begin
{  if ComboBox_WatchType.ItemIndex = 0 then
  begin
    Label32.Visible := True;
    ComboBox_Delay.Visible := True;
  end else
  begin
    Label32.Visible := False;
    ComboBox_Delay.Visible := False;
    ComboBox_Delay.ItemIndex := 0;
  end; }
end;

procedure TMainForm.ed_alertSirenTimeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Not IsDigit(ed_alertSirenTime.Text) then
  begin
    ed_alertSirenTime.Text := '1';
    Exit;
  End;
  if strtoint(ed_alertSirenTime.Text) > 20 then
  begin
    ed_alertSirenTime.Text := '20';
    Exit;
  end;
  if strtoint(ed_alertSirenTime.Text) < 1 then
  begin
    ed_alertSirenTime.Text := '1';
    Exit;
  end;
end;

procedure TMainForm.ed_alertLampTimeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Not IsDigit(ed_alertLampTime.Text) then
  begin
    ed_alertLampTime.Text := '1';
    Exit;
  End;
  if strtoint(ed_alertLampTime.Text) > 20 then
  begin
    ed_alertLampTime.Text := '20';
    Exit;
  end;
  if strtoint(ed_alertLampTime.Text) < 1 then
  begin
    ed_alertSirenTime.Text := '1';
    Exit;
  end;

end;

procedure TMainForm.btn_AlertLampRegClick(Sender: TObject);
var
  stDeviceID : string;
begin
  cmb_alartLamp.Color := clWhite;
  cmb_alartSiren.Color := clWhite;
  stDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if cmb_alartLamp.ItemIndex < 0 then cmb_alartLamp.ItemIndex := 0;
  if cmb_alartSiren.ItemIndex < 0 then cmb_alartSiren.ItemIndex := 0;
  SendPacket(stDeviceID,'I','RYEP'+inttostr(cmb_alartLamp.ItemIndex)+inttostr(cmb_alartSiren.ItemIndex),Sent_Ver);

end;

procedure TMainForm.btn_AlertLampSearchClick(Sender: TObject);
var
  stDeviceID : string;
begin
  cmb_alartLamp.Color := clWhite;
  cmb_alartSiren.Color := clWhite;
  stDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'Q','RYEP',Sent_Ver);
end;

procedure TMainForm.btn_AlertLampTimeRegClick(Sender: TObject);
var
  stDeviceID : string;
  stLampTime : string;
  stSirenTime : string;
begin
  ed_alertLampTime.Color := clWhite;
  ed_alertSirenTime.Color := clWhite;
  stDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if Not IsDigit(ed_alertLampTime.Text) then ed_alertLampTime.Text := '10';
  if Not IsDigit(ed_alertSirenTime.Text) then ed_alertSirenTime.Text := '1';

  stLampTime := FillZeroNumber(strtoint(ed_alertLampTime.Text) * 60,5);
  stSirenTime := FillZeroNumber(strtoint(ed_alertSirenTime.Text) * 60,5);

  SendPacket(stDeviceID,'I','RYLP1110'+stLampTime,Sent_Ver);
  Delay(200);
  SendPacket(stDeviceID,'I','RYSI1110'+stSirenTime,Sent_Ver);
end;

procedure TMainForm.RcvLampState(acmd,aData: String);
var
  stTemp : string;
  nTime : integer;
begin
  if UpperCase(aCmd) = 'EP' then
  begin
    stTemp := copy(aData,1,1);  //Lamp
    if IsDigit(stTemp) then
    begin
      cmb_alartLamp.Color := clYellow;
      cmb_alartLamp.ItemIndex := strtoint(stTemp);
    end;
    stTemp := copy(aData,2,1);  //Siren
    if IsDigit(stTemp) then
    begin
      cmb_alartSiren.Color := clYellow;
      cmb_alartSiren.ItemIndex := strtoint(stTemp);
    end;
  end else if UpperCase(aCmd) = 'LP' then
  begin
    stTemp := copy(aData,5,5);
    if IsDigit(stTemp) then
    begin
      ed_alertLampTime.Color := clYellow;
      ed_alertLampTime.Text := inttostr(strtoint(stTemp) div 60);
    end;
  end else if UpperCase(aCmd) = 'SI' then
  begin
    stTemp := copy(aData,5,5);
    if IsDigit(stTemp) then
    begin
      ed_alertSirenTime.Color := clYellow;
      ed_alertSirenTime.Text := inttostr(strtoint(stTemp) div 60);
    end;
  end;
end;

procedure TMainForm.btn_AlertLampTimeSearchClick(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  SendPacket(stDeviceID,'Q','RYLP1110',Sent_Ver);
  Delay(200);
  SendPacket(stDeviceID,'Q','RYSI1110',Sent_Ver);

end;

procedure TMainForm.chk_CardPositionClick(Sender: TObject);
begin
  if chk_CardPosition.Checked then
  begin
    if chk_CardPosition2.Checked then chk_CardPosition2.Checked := False;
  end;
end;

procedure TMainForm.chk_CardPosition2Click(Sender: TObject);
begin
  if chk_CardPosition2.Checked then
  begin
    if chk_CardPosition.Checked then chk_CardPosition.Checked := False;
  end;

end;

procedure TMainForm.btnDoorStateClick(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID :=  Edit_CurrentID.text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'R','SM20',Sent_Ver);
end;

procedure TMainForm.ClearSysInfo2;
begin
  ComboBox_CardModeType.ItemIndex := -1;
  ComboBox_CardModeType.Color := clWhite;
  ComboBox_DoorModeType.ItemIndex := -1;
  ComboBox_DoorModeType.Color := clWhite;
  cmb_DoorControlTime.ItemIndex := -1;
  cmb_DoorControlTime.Color := clWhite;
  RzSpinEdit5.Value := 0;
  RzSpinEdit5.Color := clWhite;
  ComboBox_UseSch.ItemIndex := -1;
  ComboBox_UseSch.Color := clWhite;
  ComboBox_SendDoorStatus.ItemIndex := -1;
  ComboBox_SendDoorStatus.Color := clWhite;
  ComboBox_AntiPass.ItemIndex := -1;
  ComboBox_AntiPass.Color := clWhite;
  ComboBox_UseCommOff.ItemIndex := -1;
  ComboBox_UseCommOff.Color := clWhite;
  ComboBox_AlramCommoff.ItemIndex := -1;
  ComboBox_AlramCommoff.Color := clWhite;
  ComboBox_AlarmLongOpen.ItemIndex := -1;
  ComboBox_AlarmLongOpen.Color := clWhite;
  ComboBox_CheckDSLS.ItemIndex := -1;
  ComboBox_CheckDSLS.Color := clWhite;
  ComboBox_ControlFire.ItemIndex := -1;
  ComboBox_ControlFire.Color := clWhite;
  ComboBox_LockType.ItemIndex := -1;
  ComboBox_LockType.Color := clWhite;
  cmb_DsOpenState.ItemIndex := -1;
  cmb_DsOpenState.Color := clWhite;
  chk_RemoteCancelDoorOpen.Checked := True;
end;

procedure TMainForm.N110Click(Sender: TObject);
begin
showmessage('TEST');
end;

procedure TMainForm.ECU00Click(Sender: TObject);
var
  nEcuNo : integer;
begin
  nEcuNo := 0;
  if isDigit(TMenuItem(Sender).Hint) then
    nEcuNo := strtoint(TMenuItem(Sender).Hint);
  if nEcuNo < (ComboBox_IDNO.Items.Count - 1) then
    ComboBox_IDNO.ItemIndex := nEcuNo;
  if nEcuNo < 6 then rgDeviceNo.ItemIndex := nEcuNo;

end;

procedure TMainForm.RzBitBtn47Click(Sender: TObject);
begin
  //스케줄 등록
  CheckUsedDevice(Edit_CurrentID.text + ComboBox_IDNO.Text,'0');

  Notebook1.PageIndex:= 3;
end;

procedure TMainForm.btn_graphScheduleClick(Sender: TObject);
begin
  Delay(500);
  DoorscheduleRegForm:= TDoorscheduleRegForm.Create(Self);
  DoorscheduleRegForm.ECUList := TStringList.Create;
  DoorscheduleRegForm.ECUList.Clear;
  DoorscheduleRegForm.ECUList := ECUList;
  DoorscheduleRegForm.DeviceID := Edit_CurrentID.text;
  DoorscheduleRegForm.Showmodal;
  DoorscheduleRegForm.Free;
end;

procedure TMainForm.btn_DoorTypeRegClick(Sender: TObject);
begin
  //출입제어등록
  Notebook1.PageIndex:= 7;

end;

procedure TMainForm.rg_ConTypeClick(Sender: TObject);
begin
    if rg_ConType.ItemIndex = 0 then
    begin
      //LAN
      CB_SerialComm.Enabled:= False;
      CB_SerialBoard.Enabled := False;
      RadioGroup_Mode.Enabled:= True;
      CB_IPList.Enabled:= True;
      Edit2.Enabled:= True;
    end else
    begin
      //Serial
      CB_SerialComm.Enabled:= True;
      CB_SerialBoard.Enabled := True;
      RadioGroup_Mode.Enabled:= False;
      CB_IPList.Enabled:= False;
      Edit2.Enabled:= False;
    end;

end;

procedure TMainForm.LMDListBox1DblClick(Sender: TObject);
begin
  Memo_CardNo.Lines.Add( LMDListBox1.ItemPart(LMDListBox1.ItemIndex,10));
end;

procedure TMainForm.stVerTypeClick(Sender: TObject);
begin
  pan_vertype.Visible := Not pan_vertype.Visible;
end;

procedure TMainForm.pan_vertypeClick(Sender: TObject);
begin
  pan_vertype.Visible := False;
end;

procedure TMainForm.Label337Click(Sender: TObject);
begin
  pan_vertype.Visible := False;
end;

procedure TMainForm.AnyMessage(var Msg: TMsg; var Handled: Boolean);
begin
  if Msg.Message = WM_MouseWheel then
  begin
    if ActiveControl is TDBgrid then 
    begin 
      if Msg.wParam > 0 then 
      begin 
        keybd_event(VK_UP, VK_UP, 0, 0); 
        keybd_event(VK_UP, VK_UP, KEYEVENTF_KEYUP, 0); 
      end 
      else if Msg.wParam < 0 then 
      begin 
        keybd_event(VK_DOWN, VK_DOWN, 0, 0);
        keybd_event(VK_DOWN, VK_DOWN, KEYEVENTF_KEYUP, 0); 
      end;
      ActiveControl.Invalidate;
    end;
  end else if Msg.message = WM_KEYDOWN then
  begin
    if Msg.wParam = VK_CONTROL then L_bCTRLKeyPress := True;
  end else if Msg.message = WM_KEYUP then
  begin
    if Msg.wParam = VK_CONTROL then L_bCTRLKeyPress := False;
  end;

end;

procedure TMainForm.RxDBGrid1CellClick(Column: TColumn);
begin
  Try
    L_stDBGridSeq := DBISAMTable1.FindField('SeqNo').AsInteger;
  Except
    Exit;
  End;
  RzFieldStatus1.Caption := inttostr(L_stDBGridSeq);
end;

procedure TMainForm.RxDBGrid1DblClick(Sender: TObject);
begin
//  DBISAMTable1.Locate('SeqNo',L_stDBGridSeq,[]);

end;

procedure TMainForm.FormProgramSetting(aProgramType: integer);
var
  nPort : integer;
begin
  if G_nProgramType = 0 then
  begin
    L_nPortNum := 8;
    G_nIDLength := 7;
    Sent_Ver := 'K1';
    rg_tourCard.Visible := False;
  end else if G_nProgramType = 1 then
  begin
    L_nPortNum := 12;
    G_nIDLength := 17;
    rg_CardType.ItemIndex := 1;
    Sent_Ver := 'ST';
    rg_tourCard.Visible := True;
  end else
  begin
    L_nPortNum := 8;
    G_nIDLength := 7;
    Sent_Ver := 'K1';
    rg_tourCard.Visible := False;
  end;
  Group_Port.Columns := L_nPortNum + 1;
  Group_Port.Items.Clear;
  Group_Port.Items.Add('전체');
  for nPort := 1 to L_nPortNum do
  begin
    Group_Port.Items.Add('#'+FillZeroNumber(nPort,2));
  end;
  
  Edit_CurrentID.MaxLength := G_nIDLength;
  Edit_CurrentID.Text := Fillzeronumber(0,G_nIDLength);
  Edit_DeviceID.MaxLength := G_nIDLength;
  Edit_DeviceID.Text := Fillzeronumber(0,G_nIDLength);
end;

procedure TMainForm.N20Click(Sender: TObject);
begin
  RzButton1Click(self);
end;

procedure TMainForm.sg_WiznetListDblClick(Sender: TObject);
var
  stWiznetData:string;
  stIP : string;
  stTemp : string;
  i : integer;
begin
  stWiznetData := sg_WiznetList.Cells[1,sg_WiznetList.Row];

  if  Length(stWiznetData) < 47 then Exit;
  stTemp:= Copy(stWiznetData,12,4);
  stIP:='';
  for i:= 1 to 4 do
  begin
    if i < 4 then stIP:= stIP + InttoStr(Ord(stTemp[i]))+'.'
    else          stIP:= stIP + InttoStr(Ord(stTemp[i]));
  end;
  CB_IPList.Text:= stIP;
  if stWiznetData[11] = #$00 then
  begin
    RadioGroup_Mode.ItemIndex := 1;
    Edit2.Text := Edit_Serverport.Text;
  end else if stWiznetData[11] = #$02 then
  begin
    RadioGroup_Mode.ItemIndex := 0;
    Edit2.Text := Edit_LocalPort.Text;
  end;

  if L_bCTRLKeyPress then
  begin
    rg_ConType.ItemIndex := 0;

    Btn_DisConnectClick(self);
    Delay(100);
    btn_ConnectClick(self);
  end;
end;

function TMainForm.ChekCSData(aData: String;nLength:integer): Boolean;
var
  stCheckSum : string;
  stMakeCS : string;
begin
  result := False;
  stCheckSum := getCheckSumData(aData,nLength);
  stMakeCS := MakeCSData(copy(aData,1,nLength - 3) + ETX,G_nProgramType);
  if stMakeCS = stCheckSum then result := True
  else RzFieldStatus1.Caption := 'CheckSum Error!!!!';

end;

function TMainForm.getCheckSumData(aData: string;nLength:integer): String;
begin
  result := copy(aData,nLength - 2,2);
end;

procedure TMainForm.btn_AckSendClick(Sender: TObject);
begin
  //SendPacket();
  SendPacket(Edit_CurrentID.text + ComboBox_IDNO.text,'a','',Sent_Ver);
end;

procedure TMainForm.btn_CackSendClick(Sender: TObject);
var
  st : string;
begin
    //st:='Y' + Copy(aPacketData,G_nIDLength + 13,2)+'  '+'a';
    st:='Y' + '01'+'  '+'a';
    ACC_sendData(Edit_CurrentID.text + ComboBox_IDNO.text, st,Sent_Ver);
end;

function TMainForm.PacketFormatCheck(aData: String; var aLeavePacketData,
  aPacketData: String): integer;
begin

  aPacketData := '';
  result := -1; //비정상 전문

  if aData[1] = SOH then
  begin
    result := CheckDecorderDataPacket(aData,aLeavePacketData,aPacketData);
    //if aPacketData <> '' then result := 2;
  end else if aData[1] = STX then
  begin
    result:= CheckDataPacket(aData,aLeavePacketData,aPacketData);
    //if aPacketData <> '' then result := 1;
  end else
  begin
    //Delete(aData,1,1);
    aLeavePacketData := aData;
  end;
end;

end.

