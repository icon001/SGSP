unit uCurrentDeviceSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uSubForm, CommandArray, ExtCtrls, Shader, ComCtrls, StdCtrls,
  ImgList, RzButton, RzPanel, RzRadGrp, Mask, RzEdit, RzSpnEdt, RzCmboBx,
  IPEdit, Buttons, RzLabel, Grids, BaseGrid, AdvGrid, Menus, Spin,
  RzLstBox, RzChkLst, RzListVw, RzTabs, AdvPanel, AdvObj;

const
  NOTHINGIMG = -1;
  ECUCONNECT = 1;
  ECUDISCONNECT = 2;
  ARMMODE = 3;
  DISARMMODE = 4;
  DOORCLOSE = 5;
  DOOROPEN = 6;
  DOORMANAGERCLOSE = 7;
  DOORMANAGEROPEN = 8;
  QUESTION = 9;
  READERCONNECT = 10;
  READERDISCONNECT = 11;

type
  TfmCurrentDeviceSetting = class(TfmASubForm)
    toolslist: TImageList;
    Panel1: TPanel;
    pg_DeviceSetting: TPageControl;
    TabMCSetting: TTabSheet;
    TabSystemInfo: TTabSheet;
    tab_DoorLock: TTabSheet;
    tab_CardReader: TTabSheet;
    Tab_Port: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    st_EcuID: TStaticText;
    Label2: TLabel;
    st_DeviceVer: TStaticText;
    Label3: TLabel;
    st_DeviceCode: TStaticText;
    StaticText2: TStaticText;
    ed_mcid: TEdit;
    gb_SystemInfo: TGroupBox;
    StaticText3: TStaticText;
    ComboBox_WatchPowerOff: TRzComboBox;
    st_DoorType1: TStaticText;
    ComboBox_DoorType1: TRzComboBox;
    ComboBox_DoorType2: TRzComboBox;
    st_DoorType2: TStaticText;
    StaticText8: TStaticText;
    Edit_Locate: TEdit;
    Panel3: TPanel;
    gb_ControlButton: TGroupBox;
    btn_UseControlerSearch: TRzBitBtn;
    btn_Registration: TRzBitBtn;
    btn_Next: TRzBitBtn;
    Popup_Device: TPopupMenu;
    mn_FireRecovery: TMenuItem;
    rg_LanSet: TRzGroupBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Rg_Mode: TRadioGroup;
    chk_DHCP: TCheckBox;
    btn_WizNetSetting: TRzBitBtn;
    Edit_IP: TEdit;
    Edit_subnet: TEdit;
    edit_Gateway: TEdit;
    edit_port: TEdit;
    ed_server: TEdit;
    ed_ServerPort: TEdit;
    GroupBox10: TGroupBox;
    btn_TimeSync: TRzBitBtn;
    btn_TimeSearch: TRzBitBtn;
    st_Time: TStaticText;
    GroupMAc: TRzGroupBox;
    editMAC1: TRzEdit;
    editMAC2: TRzEdit;
    editMAC3: TRzEdit;
    editMAC4: TRzEdit;
    editMAC5: TRzEdit;
    editMAC6: TRzEdit;
    btnRegMAC: TRzBitBtn;
    btn_MacSearch: TRzBitBtn;
    deviceLoadTimer: TTimer;
    SpinEdit_OutDelay: TRzSpinEdit;
    Label15: TLabel;
    SpinEdit_InDelay: TRzSpinEdit;
    Label4: TLabel;
    StaticText5: TStaticText;
    StaticText28: TStaticText;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    lvECU: TRzListView;
    cmb_EcuType: TRzComboBox;
    TabSheet2: TRzTabSheet;
    CheckList_Alarm: TRzCheckList;
    btnECUAdd: TRzBitBtn;
    btnECUErase: TRzBitBtn;
    RzGroupBox5: TRzGroupBox;
    RzLabel9: TRzLabel;
    RzLabel17: TRzLabel;
    Label79: TLabel;
    Label25: TLabel;
    RzLabel4: TRzLabel;
    Spinner_Ring: TRzSpinner;
    Spinner_cancelRing: TRzSpinner;
    Edit_LinkusID: TEdit;
    Edit_LinkusTel: TEdit;
    Edit_LinkusTel2: TEdit;
    gb_EcuAdd: TGroupBox;
    lb_regEcucont: TLabel;
    seDeviceNo: TRzSpinEdit;
    cbDeviceType: TRzComboBox;
    Label5: TLabel;
    chk_All: TCheckBox;
    btnAdd: TRzBitBtn;
    btnClose: TRzBitBtn;
    mn_ControlerReset: TMenuItem;
    mn_ArmMode: TMenuItem;
    mn_DisArmMode: TMenuItem;
    mn_DoorManagerMode: TMenuItem;
    mn_DoorOpenMode: TMenuItem;
    mn_ReaderVersion: TMenuItem;
    Panel4: TPanel;
    PageControl1: TPageControl;
    tbDEVICE: TTabSheet;
    GroupBox3: TGroupBox;
    TreeView_Device: TTreeView;
    Shader3: TShader;
    Splitter1: TSplitter;
    Panel5: TPanel;
    cmb_SearchType: TComboBox;
    cmb_ArmRelay: TRzComboBox;
    StaticText32: TStaticText;
    GB_Special: TGroupBox;
    gb_CDMA: TGroupBox;
    btn_WizNetSearch: TRzBitBtn;
    rg_CdmaUse: TRadioGroup;
    gb_Dvr: TGroupBox;
    rg_dvruse: TRadioGroup;
    ed_dvrip: TEdit;
    Label6: TLabel;
    ed_dvrport: TEdit;
    Label7: TLabel;
    btn_DVRUseReg: TRzBitBtn;
    btn_DVRUseSearch: TRzBitBtn;
    btn_cdmasetting: TRzBitBtn;
    btn_cdmaSearch: TRzBitBtn;
    Label373: TLabel;
    ed_cdmaMin: TEdit;
    ed_cdmaMux: TEdit;
    Label374: TLabel;
    Label375: TLabel;
    ed_cdmaIP: TEdit;
    ed_cdmaPort: TEdit;
    Label376: TLabel;
    Label377: TLabel;
    ed_cdmachktime: TEdit;
    st_cdmaRegAck: TStaticText;
    ed_cdmarssi: TEdit;
    Label378: TLabel;
    Tab_CardReaderTel: TTabSheet;
    gb_cardReaderTel: TGroupBox;
    ed_cardreaderTel1: TEdit;
    RzPanel16: TRzPanel;
    RzPanel17: TRzPanel;
    StaticText33: TStaticText;
    StaticText34: TStaticText;
    StaticText35: TStaticText;
    StaticText36: TStaticText;
    StaticText43: TStaticText;
    StaticText44: TStaticText;
    StaticText46: TStaticText;
    StaticText52: TStaticText;
    StaticText53: TStaticText;
    ed_cardreaderTel2: TEdit;
    ed_cardreaderTel3: TEdit;
    ed_cardreaderTel4: TEdit;
    ed_cardreaderTel5: TEdit;
    ed_cardreaderTel6: TEdit;
    ed_cardreaderTel7: TEdit;
    ed_cardreaderTel8: TEdit;
    ed_cardreaderTel9: TEdit;
    StaticText54: TStaticText;
    ed_cardreaderTel0: TEdit;
    ActiveTimer: TTimer;
    btn_DeviceCopy: TRzBitBtn;
    tab_refresh: TTabSheet;
    StaticText6: TStaticText;
    cmb_Relay2Type: TRzComboBox;
    Panel6: TPanel;
    Label10: TLabel;
    se_crCallTime: TRzSpinEdit;
    Label14: TLabel;
    st_Doortype4: TStaticText;
    st_Doortype3: TStaticText;
    ComboBox_DoorType3: TRzComboBox;
    ComboBox_DoorType4: TRzComboBox;
    st_Doortype6: TStaticText;
    st_Doortype5: TStaticText;
    ComboBox_DoorType5: TRzComboBox;
    ComboBox_DoorType6: TRzComboBox;
    st_Doortype8: TStaticText;
    st_Doortype7: TStaticText;
    ComboBox_DoorType7: TRzComboBox;
    ComboBox_DoorType8: TRzComboBox;
    gb_DoorAlarmArea: TGroupBox;
    Panel7: TPanel;
    chk_DoorArmAreaUse: TCheckBox;
    TabArmExtension: TTabSheet;
    pg_PortSetting: TPageControl;
    tab_LocalPort: TTabSheet;
    gb_Port: TGroupBox;
    StaticText37: TStaticText;
    RzPanel9: TRzPanel;
    cmb_WatchType1: TRzComboBox;
    RzPanel10: TRzPanel;
    StaticText38: TStaticText;
    StaticText39: TStaticText;
    StaticText40: TStaticText;
    StaticText41: TStaticText;
    StaticText42: TStaticText;
    RzPanel12: TRzPanel;
    cmb_recorver1: TRzComboBox;
    cmb_WatchType2: TRzComboBox;
    cmb_recorver2: TRzComboBox;
    cmb_WatchType3: TRzComboBox;
    cmb_recorver3: TRzComboBox;
    cmb_WatchType4: TRzComboBox;
    cmb_recorver4: TRzComboBox;
    cmb_WatchType5: TRzComboBox;
    cmb_recorver5: TRzComboBox;
    cmb_WatchType6: TRzComboBox;
    cmb_recorver6: TRzComboBox;
    StaticText63: TStaticText;
    cmb_WatchType7: TRzComboBox;
    cmb_recorver7: TRzComboBox;
    cmb_recorver8: TRzComboBox;
    cmb_WatchType8: TRzComboBox;
    StaticText64: TStaticText;
    RzPanel11: TRzPanel;
    cmb_WatchDelay1: TRzComboBox;
    cmb_WatchDelay2: TRzComboBox;
    cmb_WatchDelay3: TRzComboBox;
    cmb_WatchDelay4: TRzComboBox;
    cmb_WatchDelay5: TRzComboBox;
    cmb_WatchDelay6: TRzComboBox;
    cmb_WatchDelay7: TRzComboBox;
    cmb_WatchDelay8: TRzComboBox;
    panPortAlarmArea0: TRzPanel;
    cmb_PortAlarmArea1: TRzComboBox;
    cmb_PortAlarmArea2: TRzComboBox;
    cmb_PortAlarmArea3: TRzComboBox;
    cmb_PortAlarmArea4: TRzComboBox;
    cmb_PortAlarmArea5: TRzComboBox;
    cmb_PortAlarmArea6: TRzComboBox;
    cmb_PortAlarmArea7: TRzComboBox;
    cmb_PortAlarmArea8: TRzComboBox;
    gb_emergency: TGroupBox;
    Label307: TLabel;
    Label308: TLabel;
    Label310: TLabel;
    Label312: TLabel;
    cmb_alartLamp: TRzComboBox;
    cmb_alartSiren: TRzComboBox;
    gb_action: TGroupBox;
    Label311: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    ed_alertLampTime: TEdit;
    ed_alertSirenTime: TEdit;
    tab_ExtensionPort: TTabSheet;
    pg_ExtensionPort: TPageControl;
    tab_ZoneExtension1: TTabSheet;
    tab_ZoneExtension2: TTabSheet;
    tab_ZoneExtension3: TTabSheet;
    tab_ZoneExtension4: TTabSheet;
    tab_ZoneExtension5: TTabSheet;
    tab_ZoneExtension6: TTabSheet;
    tab_ZoneExtension7: TTabSheet;
    tab_ZoneExtension8: TTabSheet;
    gb_Port1: TGroupBox;
    StaticText61: TStaticText;
    RzPanel20: TRzPanel;
    cmb_WatchType11: TRzComboBox;
    RzPanel21: TRzPanel;
    StaticText62: TStaticText;
    StaticText65: TStaticText;
    StaticText66: TStaticText;
    StaticText67: TStaticText;
    StaticText68: TStaticText;
    RzPanel22: TRzPanel;
    cmb_recorver11: TRzComboBox;
    cmb_WatchType12: TRzComboBox;
    cmb_recorver12: TRzComboBox;
    cmb_WatchType13: TRzComboBox;
    cmb_recorver13: TRzComboBox;
    cmb_WatchType14: TRzComboBox;
    cmb_recorver14: TRzComboBox;
    cmb_WatchType15: TRzComboBox;
    cmb_recorver15: TRzComboBox;
    cmb_WatchType16: TRzComboBox;
    cmb_recorver16: TRzComboBox;
    StaticText75: TStaticText;
    cmb_WatchType17: TRzComboBox;
    cmb_recorver17: TRzComboBox;
    cmb_recorver18: TRzComboBox;
    cmb_WatchType18: TRzComboBox;
    StaticText78: TStaticText;
    panPortAlarmArea1: TRzPanel;
    cmb_PortAlarmArea11: TRzComboBox;
    cmb_PortAlarmArea12: TRzComboBox;
    cmb_PortAlarmArea13: TRzComboBox;
    cmb_PortAlarmArea14: TRzComboBox;
    cmb_PortAlarmArea15: TRzComboBox;
    cmb_PortAlarmArea16: TRzComboBox;
    cmb_PortAlarmArea17: TRzComboBox;
    cmb_PortAlarmArea18: TRzComboBox;
    Label17: TLabel;
    Panel10: TPanel;
    cmb_ZoneExtensionUse1: TRzComboBox;
    gb_Port2: TGroupBox;
    StaticText69: TStaticText;
    RzPanel23: TRzPanel;
    cmb_WatchType21: TRzComboBox;
    RzPanel24: TRzPanel;
    StaticText70: TStaticText;
    StaticText71: TStaticText;
    StaticText72: TStaticText;
    StaticText73: TStaticText;
    StaticText74: TStaticText;
    RzPanel26: TRzPanel;
    cmb_recorver21: TRzComboBox;
    cmb_WatchType22: TRzComboBox;
    cmb_recorver22: TRzComboBox;
    cmb_WatchType23: TRzComboBox;
    cmb_recorver23: TRzComboBox;
    cmb_WatchType24: TRzComboBox;
    cmb_recorver24: TRzComboBox;
    cmb_WatchType25: TRzComboBox;
    cmb_recorver25: TRzComboBox;
    cmb_WatchType26: TRzComboBox;
    cmb_recorver26: TRzComboBox;
    StaticText76: TStaticText;
    cmb_WatchType27: TRzComboBox;
    cmb_recorver27: TRzComboBox;
    cmb_recorver28: TRzComboBox;
    cmb_WatchType28: TRzComboBox;
    StaticText77: TStaticText;
    panPortAlarmArea2: TRzPanel;
    cmb_PortAlarmArea21: TRzComboBox;
    cmb_PortAlarmArea22: TRzComboBox;
    cmb_PortAlarmArea23: TRzComboBox;
    cmb_PortAlarmArea24: TRzComboBox;
    cmb_PortAlarmArea25: TRzComboBox;
    cmb_PortAlarmArea26: TRzComboBox;
    cmb_PortAlarmArea27: TRzComboBox;
    cmb_PortAlarmArea28: TRzComboBox;
    cmb_ZoneExtensionUse2: TRzComboBox;
    Label18: TLabel;
    gb_Port3: TGroupBox;
    StaticText79: TStaticText;
    RzPanel28: TRzPanel;
    cmb_WatchType31: TRzComboBox;
    RzPanel29: TRzPanel;
    StaticText80: TStaticText;
    StaticText81: TStaticText;
    StaticText82: TStaticText;
    StaticText83: TStaticText;
    StaticText84: TStaticText;
    RzPanel30: TRzPanel;
    cmb_recorver31: TRzComboBox;
    cmb_WatchType32: TRzComboBox;
    cmb_recorver32: TRzComboBox;
    cmb_WatchType33: TRzComboBox;
    cmb_recorver33: TRzComboBox;
    cmb_WatchType34: TRzComboBox;
    cmb_recorver34: TRzComboBox;
    cmb_WatchType35: TRzComboBox;
    cmb_recorver35: TRzComboBox;
    cmb_WatchType36: TRzComboBox;
    cmb_recorver36: TRzComboBox;
    StaticText85: TStaticText;
    cmb_WatchType37: TRzComboBox;
    cmb_recorver37: TRzComboBox;
    cmb_recorver38: TRzComboBox;
    cmb_WatchType38: TRzComboBox;
    StaticText86: TStaticText;
    panPortAlarmArea3: TRzPanel;
    cmb_PortAlarmArea31: TRzComboBox;
    cmb_PortAlarmArea32: TRzComboBox;
    cmb_PortAlarmArea33: TRzComboBox;
    cmb_PortAlarmArea34: TRzComboBox;
    cmb_PortAlarmArea35: TRzComboBox;
    cmb_PortAlarmArea36: TRzComboBox;
    cmb_PortAlarmArea37: TRzComboBox;
    cmb_PortAlarmArea38: TRzComboBox;
    cmb_ZoneExtensionUse3: TRzComboBox;
    Label20: TLabel;
    gb_Port4: TGroupBox;
    StaticText87: TStaticText;
    RzPanel32: TRzPanel;
    cmb_WatchType41: TRzComboBox;
    RzPanel33: TRzPanel;
    StaticText88: TStaticText;
    StaticText89: TStaticText;
    StaticText90: TStaticText;
    StaticText91: TStaticText;
    StaticText92: TStaticText;
    RzPanel34: TRzPanel;
    cmb_recorver41: TRzComboBox;
    cmb_WatchType42: TRzComboBox;
    cmb_recorver42: TRzComboBox;
    cmb_WatchType43: TRzComboBox;
    cmb_recorver43: TRzComboBox;
    cmb_WatchType44: TRzComboBox;
    cmb_recorver44: TRzComboBox;
    cmb_WatchType45: TRzComboBox;
    cmb_recorver45: TRzComboBox;
    cmb_WatchType46: TRzComboBox;
    cmb_recorver46: TRzComboBox;
    StaticText93: TStaticText;
    cmb_WatchType47: TRzComboBox;
    cmb_recorver47: TRzComboBox;
    cmb_recorver48: TRzComboBox;
    cmb_WatchType48: TRzComboBox;
    StaticText94: TStaticText;
    panPortAlarmArea4: TRzPanel;
    cmb_PortAlarmArea41: TRzComboBox;
    cmb_PortAlarmArea42: TRzComboBox;
    cmb_PortAlarmArea43: TRzComboBox;
    cmb_PortAlarmArea44: TRzComboBox;
    cmb_PortAlarmArea45: TRzComboBox;
    cmb_PortAlarmArea46: TRzComboBox;
    cmb_PortAlarmArea47: TRzComboBox;
    cmb_PortAlarmArea48: TRzComboBox;
    cmb_ZoneExtensionUse4: TRzComboBox;
    Label22: TLabel;
    gb_Port5: TGroupBox;
    StaticText95: TStaticText;
    RzPanel36: TRzPanel;
    cmb_WatchType51: TRzComboBox;
    RzPanel37: TRzPanel;
    StaticText96: TStaticText;
    StaticText97: TStaticText;
    StaticText98: TStaticText;
    StaticText99: TStaticText;
    StaticText100: TStaticText;
    RzPanel38: TRzPanel;
    cmb_recorver51: TRzComboBox;
    cmb_WatchType52: TRzComboBox;
    cmb_recorver52: TRzComboBox;
    cmb_WatchType53: TRzComboBox;
    cmb_recorver53: TRzComboBox;
    cmb_WatchType54: TRzComboBox;
    cmb_recorver54: TRzComboBox;
    cmb_WatchType55: TRzComboBox;
    cmb_recorver55: TRzComboBox;
    cmb_WatchType56: TRzComboBox;
    cmb_recorver56: TRzComboBox;
    StaticText101: TStaticText;
    cmb_WatchType57: TRzComboBox;
    cmb_recorver57: TRzComboBox;
    cmb_recorver58: TRzComboBox;
    cmb_WatchType58: TRzComboBox;
    StaticText102: TStaticText;
    panPortAlarmArea5: TRzPanel;
    cmb_PortAlarmArea51: TRzComboBox;
    cmb_PortAlarmArea52: TRzComboBox;
    cmb_PortAlarmArea53: TRzComboBox;
    cmb_PortAlarmArea54: TRzComboBox;
    cmb_PortAlarmArea55: TRzComboBox;
    cmb_PortAlarmArea56: TRzComboBox;
    cmb_PortAlarmArea57: TRzComboBox;
    cmb_PortAlarmArea58: TRzComboBox;
    cmb_ZoneExtensionUse5: TRzComboBox;
    Label23: TLabel;
    gb_Port6: TGroupBox;
    StaticText103: TStaticText;
    RzPanel40: TRzPanel;
    cmb_WatchType61: TRzComboBox;
    RzPanel41: TRzPanel;
    StaticText104: TStaticText;
    StaticText105: TStaticText;
    StaticText106: TStaticText;
    StaticText107: TStaticText;
    StaticText108: TStaticText;
    RzPanel42: TRzPanel;
    cmb_recorver61: TRzComboBox;
    cmb_WatchType62: TRzComboBox;
    cmb_recorver62: TRzComboBox;
    cmb_WatchType63: TRzComboBox;
    cmb_recorver63: TRzComboBox;
    cmb_WatchType64: TRzComboBox;
    cmb_recorver64: TRzComboBox;
    cmb_WatchType65: TRzComboBox;
    cmb_recorver65: TRzComboBox;
    cmb_WatchType66: TRzComboBox;
    cmb_recorver66: TRzComboBox;
    StaticText109: TStaticText;
    cmb_WatchType67: TRzComboBox;
    cmb_recorver67: TRzComboBox;
    cmb_recorver68: TRzComboBox;
    cmb_WatchType68: TRzComboBox;
    StaticText110: TStaticText;
    panPortAlarmArea6: TRzPanel;
    cmb_PortAlarmArea61: TRzComboBox;
    cmb_PortAlarmArea62: TRzComboBox;
    cmb_PortAlarmArea63: TRzComboBox;
    cmb_PortAlarmArea64: TRzComboBox;
    cmb_PortAlarmArea65: TRzComboBox;
    cmb_PortAlarmArea66: TRzComboBox;
    cmb_PortAlarmArea67: TRzComboBox;
    cmb_PortAlarmArea68: TRzComboBox;
    cmb_ZoneExtensionUse6: TRzComboBox;
    Label24: TLabel;
    gb_Port7: TGroupBox;
    StaticText111: TStaticText;
    RzPanel44: TRzPanel;
    cmb_WatchType71: TRzComboBox;
    RzPanel45: TRzPanel;
    StaticText112: TStaticText;
    StaticText113: TStaticText;
    StaticText114: TStaticText;
    StaticText115: TStaticText;
    StaticText116: TStaticText;
    RzPanel46: TRzPanel;
    cmb_recorver71: TRzComboBox;
    cmb_WatchType72: TRzComboBox;
    cmb_recorver72: TRzComboBox;
    cmb_WatchType73: TRzComboBox;
    cmb_recorver73: TRzComboBox;
    cmb_WatchType74: TRzComboBox;
    cmb_recorver74: TRzComboBox;
    cmb_WatchType75: TRzComboBox;
    cmb_recorver75: TRzComboBox;
    cmb_WatchType76: TRzComboBox;
    cmb_recorver76: TRzComboBox;
    StaticText117: TStaticText;
    cmb_WatchType77: TRzComboBox;
    cmb_recorver77: TRzComboBox;
    cmb_recorver78: TRzComboBox;
    cmb_WatchType78: TRzComboBox;
    StaticText118: TStaticText;
    panPortAlarmArea7: TRzPanel;
    cmb_PortAlarmArea71: TRzComboBox;
    cmb_PortAlarmArea72: TRzComboBox;
    cmb_PortAlarmArea73: TRzComboBox;
    cmb_PortAlarmArea74: TRzComboBox;
    cmb_PortAlarmArea75: TRzComboBox;
    cmb_PortAlarmArea76: TRzComboBox;
    cmb_PortAlarmArea77: TRzComboBox;
    cmb_PortAlarmArea78: TRzComboBox;
    cmb_ZoneExtensionUse7: TRzComboBox;
    Label26: TLabel;
    gb_Port8: TGroupBox;
    StaticText119: TStaticText;
    RzPanel48: TRzPanel;
    cmb_WatchType81: TRzComboBox;
    RzPanel49: TRzPanel;
    StaticText120: TStaticText;
    StaticText121: TStaticText;
    StaticText122: TStaticText;
    StaticText123: TStaticText;
    StaticText124: TStaticText;
    RzPanel50: TRzPanel;
    cmb_recorver81: TRzComboBox;
    cmb_WatchType82: TRzComboBox;
    cmb_recorver82: TRzComboBox;
    cmb_WatchType83: TRzComboBox;
    cmb_recorver83: TRzComboBox;
    cmb_WatchType84: TRzComboBox;
    cmb_recorver84: TRzComboBox;
    cmb_WatchType85: TRzComboBox;
    cmb_recorver85: TRzComboBox;
    cmb_WatchType86: TRzComboBox;
    cmb_recorver86: TRzComboBox;
    StaticText125: TStaticText;
    cmb_WatchType87: TRzComboBox;
    cmb_recorver87: TRzComboBox;
    cmb_recorver88: TRzComboBox;
    cmb_WatchType88: TRzComboBox;
    StaticText126: TStaticText;
    panPortAlarmArea8: TRzPanel;
    cmb_PortAlarmArea81: TRzComboBox;
    cmb_PortAlarmArea82: TRzComboBox;
    cmb_PortAlarmArea83: TRzComboBox;
    cmb_PortAlarmArea84: TRzComboBox;
    cmb_PortAlarmArea85: TRzComboBox;
    cmb_PortAlarmArea86: TRzComboBox;
    cmb_PortAlarmArea87: TRzComboBox;
    cmb_PortAlarmArea88: TRzComboBox;
    cmb_ZoneExtensionUse8: TRzComboBox;
    Label30: TLabel;
    pgDoorLockSetting: TPageControl;
    tabLock_Controler: TTabSheet;
    gb_DoorInfo: TGroupBox;
    Label12: TLabel;
    Label16: TLabel;
    Label46: TLabel;
    Label11: TLabel;
    RzPanel2: TRzPanel;
    RzPanel4: TRzPanel;
    ComboBox_CardModeType1: TRzComboBox;
    ComboBox_CardModeType2: TRzComboBox;
    StaticText10: TStaticText;
    ComboBox_DoorModeType1: TRzComboBox;
    ComboBox_DoorModeType2: TRzComboBox;
    cmb_DoorControlTime1: TRzComboBox;
    cmb_DoorControlTime2: TRzComboBox;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    ComboBox_SendDoorStatus1: TRzComboBox;
    ComboBox_SendDoorStatus2: TRzComboBox;
    StaticText13: TStaticText;
    ComboBox_AlarmLongOpen1: TRzComboBox;
    ComboBox_AlarmLongOpen2: TRzComboBox;
    StaticText14: TStaticText;
    ComboBox_ControlFire1: TRzComboBox;
    ComboBox_ControlFire2: TRzComboBox;
    StaticText16: TStaticText;
    ComboBox_LockType1: TRzComboBox;
    ComboBox_LockType2: TRzComboBox;
    cmb_DsOpenState2: TRzComboBox;
    cmb_DsOpenState1: TRzComboBox;
    cmb_RemoteDoorOpen1: TRzComboBox;
    cmb_RemoteDoorOpen2: TRzComboBox;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    StaticText9: TStaticText;
    SpinEdit_OpenMoni1: TRzSpinEdit;
    SpinEdit_OpenMoni2: TRzSpinEdit;
    StaticText15: TStaticText;
    ComboBox_UseSch1: TRzComboBox;
    ComboBox_UseSch2: TRzComboBox;
    tabLockExtention: TTabSheet;
    gb_DoorExtensionInfo: TGroupBox;
    Label31: TLabel;
    Label33: TLabel;
    RzPanel52: TRzPanel;
    ComboBox_CardModeType3: TRzComboBox;
    StaticText127: TStaticText;
    ComboBox_DoorModeType3: TRzComboBox;
    cmb_DoorControlTime3: TRzComboBox;
    StaticText128: TStaticText;
    StaticText129: TStaticText;
    ComboBox_SendDoorStatus3: TRzComboBox;
    StaticText130: TStaticText;
    ComboBox_AlarmLongOpen3: TRzComboBox;
    StaticText131: TStaticText;
    ComboBox_ControlFire3: TRzComboBox;
    StaticText132: TStaticText;
    ComboBox_LockType3: TRzComboBox;
    cmb_DsOpenState3: TRzComboBox;
    cmb_RemoteDoorOpen3: TRzComboBox;
    StaticText133: TStaticText;
    StaticText134: TStaticText;
    StaticText135: TStaticText;
    StaticText136: TStaticText;
    SpinEdit_OpenMoni3: TRzSpinEdit;
    StaticText137: TStaticText;
    ComboBox_UseSch3: TRzComboBox;
    RzPanel53: TRzPanel;
    ComboBox_CardModeType4: TRzComboBox;
    ComboBox_DoorModeType4: TRzComboBox;
    cmb_DoorControlTime4: TRzComboBox;
    Label32: TLabel;
    SpinEdit_OpenMoni4: TRzSpinEdit;
    Label34: TLabel;
    ComboBox_AlarmLongOpen4: TRzComboBox;
    ComboBox_SendDoorStatus4: TRzComboBox;
    ComboBox_UseSch4: TRzComboBox;
    ComboBox_ControlFire4: TRzComboBox;
    ComboBox_LockType4: TRzComboBox;
    cmb_DsOpenState4: TRzComboBox;
    cmb_RemoteDoorOpen4: TRzComboBox;
    RzPanel54: TRzPanel;
    ComboBox_CardModeType5: TRzComboBox;
    ComboBox_DoorModeType5: TRzComboBox;
    cmb_DoorControlTime5: TRzComboBox;
    Label35: TLabel;
    SpinEdit_OpenMoni5: TRzSpinEdit;
    Label36: TLabel;
    ComboBox_AlarmLongOpen5: TRzComboBox;
    ComboBox_SendDoorStatus5: TRzComboBox;
    ComboBox_UseSch5: TRzComboBox;
    ComboBox_ControlFire5: TRzComboBox;
    ComboBox_LockType5: TRzComboBox;
    cmb_DsOpenState5: TRzComboBox;
    cmb_RemoteDoorOpen5: TRzComboBox;
    RzPanel55: TRzPanel;
    ComboBox_CardModeType6: TRzComboBox;
    ComboBox_DoorModeType6: TRzComboBox;
    cmb_DoorControlTime6: TRzComboBox;
    Label37: TLabel;
    SpinEdit_OpenMoni6: TRzSpinEdit;
    Label38: TLabel;
    ComboBox_AlarmLongOpen6: TRzComboBox;
    ComboBox_SendDoorStatus6: TRzComboBox;
    ComboBox_UseSch6: TRzComboBox;
    ComboBox_ControlFire6: TRzComboBox;
    ComboBox_LockType6: TRzComboBox;
    cmb_DsOpenState6: TRzComboBox;
    cmb_RemoteDoorOpen6: TRzComboBox;
    RzPanel56: TRzPanel;
    ComboBox_CardModeType7: TRzComboBox;
    ComboBox_DoorModeType7: TRzComboBox;
    cmb_DoorControlTime7: TRzComboBox;
    Label39: TLabel;
    SpinEdit_OpenMoni7: TRzSpinEdit;
    Label40: TLabel;
    ComboBox_AlarmLongOpen7: TRzComboBox;
    ComboBox_SendDoorStatus7: TRzComboBox;
    ComboBox_UseSch7: TRzComboBox;
    ComboBox_ControlFire7: TRzComboBox;
    ComboBox_LockType7: TRzComboBox;
    cmb_DsOpenState7: TRzComboBox;
    cmb_RemoteDoorOpen7: TRzComboBox;
    RzPanel57: TRzPanel;
    ComboBox_CardModeType8: TRzComboBox;
    ComboBox_DoorModeType8: TRzComboBox;
    cmb_DoorControlTime8: TRzComboBox;
    Label41: TLabel;
    SpinEdit_OpenMoni8: TRzSpinEdit;
    Label42: TLabel;
    ComboBox_AlarmLongOpen8: TRzComboBox;
    ComboBox_SendDoorStatus8: TRzComboBox;
    ComboBox_UseSch8: TRzComboBox;
    ComboBox_ControlFire8: TRzComboBox;
    ComboBox_LockType8: TRzComboBox;
    cmb_DsOpenState8: TRzComboBox;
    cmb_RemoteDoorOpen8: TRzComboBox;
    st_DoorDSCheck1: TStaticText;
    cmb_DoorDscheckTime1: TRzComboBox;
    Label43: TLabel;
    cmb_DoorDscheckTime2: TRzComboBox;
    Label44: TLabel;
    cmb_DoorDscheckTime3: TRzComboBox;
    Label45: TLabel;
    st_DoorDSCheck2: TStaticText;
    cmb_DoorDscheckTime4: TRzComboBox;
    Label47: TLabel;
    cmb_DoorDscheckTime5: TRzComboBox;
    Label48: TLabel;
    cmb_DoorDscheckTime6: TRzComboBox;
    Label49: TLabel;
    cmb_DoorDscheckTime7: TRzComboBox;
    Label50: TLabel;
    cmb_DoorDscheckTime8: TRzComboBox;
    Label51: TLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    tabArmAreaSearch: TTabSheet;
    gb_ArmAreaSearch: TRzCheckGroup;
    Panel14: TPanel;
    Panel15: TPanel;
    sg_ArmAreastate: TAdvStringGrid;
    PageControl6: TPageControl;
    TabSheet3: TTabSheet;
    gb_CardReader: TGroupBox;
    StaticText20: TStaticText;
    RzPanel1: TRzPanel;
    cmb_ReaderUse1: TRzComboBox;
    RzPanel5: TRzPanel;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    StaticText25: TStaticText;
    StaticText26: TStaticText;
    StaticText27: TStaticText;
    RzPanel3: TRzPanel;
    RzPanel6: TRzPanel;
    RzPanel7: TRzPanel;
    pan_ReaderVer0: TRzPanel;
    cmb_ReaderDoor1: TRzComboBox;
    cmb_ReaderDoorLocate1: TRzComboBox;
    cmb_ReaderBuildingLocate1: TRzComboBox;
    st_ReaderComstate1: TStaticText;
    cmb_ReaderUse2: TRzComboBox;
    cmb_ReaderDoor2: TRzComboBox;
    cmb_ReaderDoorLocate2: TRzComboBox;
    cmb_ReaderBuildingLocate2: TRzComboBox;
    st_ReaderComstate2: TStaticText;
    cmb_ReaderUse3: TRzComboBox;
    cmb_ReaderDoor3: TRzComboBox;
    cmb_ReaderDoorLocate3: TRzComboBox;
    cmb_ReaderBuildingLocate3: TRzComboBox;
    st_ReaderComstate3: TStaticText;
    cmb_ReaderUse4: TRzComboBox;
    cmb_ReaderDoor4: TRzComboBox;
    cmb_ReaderDoorLocate4: TRzComboBox;
    cmb_ReaderBuildingLocate4: TRzComboBox;
    st_ReaderComstate4: TStaticText;
    cmb_ReaderUse5: TRzComboBox;
    cmb_ReaderDoor5: TRzComboBox;
    cmb_ReaderDoorLocate5: TRzComboBox;
    cmb_ReaderBuildingLocate5: TRzComboBox;
    st_ReaderComstate5: TStaticText;
    cmb_ReaderUse6: TRzComboBox;
    cmb_ReaderDoor6: TRzComboBox;
    cmb_ReaderDoorLocate6: TRzComboBox;
    cmb_ReaderBuildingLocate6: TRzComboBox;
    st_ReaderComstate6: TStaticText;
    cmb_ReaderUse7: TRzComboBox;
    cmb_ReaderDoor7: TRzComboBox;
    cmb_ReaderDoorLocate7: TRzComboBox;
    cmb_ReaderBuildingLocate7: TRzComboBox;
    st_ReaderComstate7: TStaticText;
    cmb_ReaderUse8: TRzComboBox;
    cmb_ReaderDoor8: TRzComboBox;
    cmb_ReaderDoorLocate8: TRzComboBox;
    cmb_ReaderBuildingLocate8: TRzComboBox;
    st_ReaderComstate8: TStaticText;
    RzPanel18: TRzPanel;
    cmb_ReaderType1: TRzComboBox;
    cmb_ReaderType2: TRzComboBox;
    cmb_ReaderType3: TRzComboBox;
    cmb_ReaderType4: TRzComboBox;
    cmb_ReaderType5: TRzComboBox;
    cmb_ReaderType6: TRzComboBox;
    cmb_ReaderType7: TRzComboBox;
    cmb_ReaderType8: TRzComboBox;
    cb_CardType: TRzComboBox;
    st_cardreaderType: TStaticText;
    Panel17: TPanel;
    GroupBox32: TGroupBox;
    Label52: TLabel;
    cmb_ArmExtensionSelect: TComboBox;
    pan_ArmExtension: TPanel;
    pan_ArmExtensionMessage: TPanel;
    Group_MainToLocalDevice: TGroupBox;
    chk_ArmExtension00: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox29: TCheckBox;
    CheckBox30: TCheckBox;
    CheckBox31: TCheckBox;
    CheckBox32: TCheckBox;
    CheckBox33: TCheckBox;
    CheckBox34: TCheckBox;
    CheckBox35: TCheckBox;
    CheckBox36: TCheckBox;
    CheckBox37: TCheckBox;
    CheckBox38: TCheckBox;
    CheckBox39: TCheckBox;
    CheckBox40: TCheckBox;
    CheckBox41: TCheckBox;
    CheckBox42: TCheckBox;
    CheckBox43: TCheckBox;
    CheckBox44: TCheckBox;
    CheckBox45: TCheckBox;
    CheckBox46: TCheckBox;
    CheckBox47: TCheckBox;
    CheckBox48: TCheckBox;
    CheckBox49: TCheckBox;
    CheckBox50: TCheckBox;
    CheckBox51: TCheckBox;
    CheckBox52: TCheckBox;
    CheckBox53: TCheckBox;
    CheckBox54: TCheckBox;
    CheckBox55: TCheckBox;
    CheckBox56: TCheckBox;
    CheckBox57: TCheckBox;
    CheckBox58: TCheckBox;
    CheckBox59: TCheckBox;
    CheckBox60: TCheckBox;
    CheckBox61: TCheckBox;
    CheckBox66: TCheckBox;
    CheckBox69: TCheckBox;
    CheckBox70: TCheckBox;
    CheckBox71: TCheckBox;
    Group_MainToLocalAll: TGroupBox;
    chkMainToLocal1: TCheckBox;
    CheckBox103: TCheckBox;
    CheckBox104: TCheckBox;
    CheckBox105: TCheckBox;
    CheckBox106: TCheckBox;
    CheckBox107: TCheckBox;
    CheckBox108: TCheckBox;
    chkAllMainToLocal: TCheckBox;
    cmbDoorAlarmArea1: TRzComboBox;
    cmbDoorAlarmArea2: TRzComboBox;
    cmbDoorAlarmArea3: TRzComboBox;
    cmbDoorAlarmArea4: TRzComboBox;
    cmbDoorAlarmArea5: TRzComboBox;
    cmbDoorAlarmArea6: TRzComboBox;
    cmbDoorAlarmArea7: TRzComboBox;
    cmbDoorAlarmArea8: TRzComboBox;
    pan_ReaderArmArea0: TRzPanel;
    cmb_ReaderAlarmArea1: TRzComboBox;
    cmb_ReaderAlarmArea2: TRzComboBox;
    cmb_ReaderAlarmArea3: TRzComboBox;
    cmb_ReaderAlarmArea4: TRzComboBox;
    cmb_ReaderAlarmArea5: TRzComboBox;
    cmb_ReaderAlarmArea6: TRzComboBox;
    cmb_ReaderAlarmArea7: TRzComboBox;
    cmb_ReaderAlarmArea8: TRzComboBox;
    tab_RemoteControl: TTabSheet;
    page_RemoteControl: TPageControl;
    tabControlerAlarm: TTabSheet;
    tab_RemoteControlDoor: TTabSheet;
    GroupBox6: TGroupBox;
    gb_DoorControl: TGroupBox;
    gb_RemoteControlDoor2: TGroupBox;
    btn_DoorOpenMode2: TRzBitBtn;
    btn_DoorCloseMode2: TRzBitBtn;
    btn_DoorOpen2: TRzBitBtn;
    gb_RemoteControlDoor1: TGroupBox;
    btn_DoorCloseMode1: TRzBitBtn;
    btn_DoorOpenMode1: TRzBitBtn;
    btn_DoorOpen1: TRzBitBtn;
    gb_RemoteControlDoor8: TGroupBox;
    btn_DoorCloseMode8: TRzBitBtn;
    btn_DoorOpenMode8: TRzBitBtn;
    btn_DoorOpen8: TRzBitBtn;
    gb_RemoteControlDoor5: TGroupBox;
    btn_DoorCloseMode5: TRzBitBtn;
    btn_DoorOpenMode5: TRzBitBtn;
    btn_DoorOpen5: TRzBitBtn;
    gb_RemoteControlDoor4: TGroupBox;
    btn_DoorCloseMode4: TRzBitBtn;
    btn_DoorOpenMode4: TRzBitBtn;
    btn_DoorOpen4: TRzBitBtn;
    gb_RemoteControlDoor3: TGroupBox;
    btn_DoorCloseMode3: TRzBitBtn;
    btn_DoorOpenMode3: TRzBitBtn;
    btn_DoorOpen3: TRzBitBtn;
    gb_RemoteControlDoor7: TGroupBox;
    btn_DoorCloseMode7: TRzBitBtn;
    btn_DoorOpenMode7: TRzBitBtn;
    btn_DoorOpen7: TRzBitBtn;
    gb_RemoteControlDoor6: TGroupBox;
    btn_DoorCloseMode6: TRzBitBtn;
    btn_DoorOpenMode6: TRzBitBtn;
    btn_DoorOpen6: TRzBitBtn;
    Panel16: TPanel;
    GroupBox9: TGroupBox;
    StaticText1: TStaticText;
    st_CtrDoorNum: TStaticText;
    StaticText7: TStaticText;
    st_CtrCardMode: TStaticText;
    StaticText29: TStaticText;
    st_CtrDoorMode: TStaticText;
    StaticText31: TStaticText;
    st_CtrDoorState: TStaticText;
    Panel8: TPanel;
    tabDeviceState: TTabSheet;
    pg_DeviceState: TPageControl;
    tabLockState: TTabSheet;
    tabPortState: TTabSheet;
    gb_LoackState: TGroupBox;
    RzPanel13: TRzPanel;
    RzPanel14: TRzPanel;
    StaticText47: TStaticText;
    StaticText48: TStaticText;
    StaticText49: TStaticText;
    StaticText50: TStaticText;
    cmb_COMNO1: TRzComboBox;
    cmb_COMNO2: TRzComboBox;
    cmb_ExGnd2: TRzComboBox;
    cmb_ExGnd1: TRzComboBox;
    cmb_dsgnd2: TRzComboBox;
    cmb_dsgnd1: TRzComboBox;
    cmb_Firestat: TRzComboBox;
    StaticText51: TStaticText;
    btn_FireDevice: TRzBitBtn;
    st_AlarmState21: TStaticText;
    StaticText4: TStaticText;
    cmb_lsgnd1: TRzComboBox;
    cmb_lsgnd2: TRzComboBox;
    RzPanel58: TRzPanel;
    RzPanel59: TRzPanel;
    cmb_COMNO4: TRzComboBox;
    cmb_COMNO3: TRzComboBox;
    cmb_ExGnd3: TRzComboBox;
    cmb_ExGnd4: TRzComboBox;
    cmb_dsgnd4: TRzComboBox;
    cmb_dsgnd3: TRzComboBox;
    cmb_lsgnd3: TRzComboBox;
    cmb_lsgnd4: TRzComboBox;
    RzPanel60: TRzPanel;
    RzPanel61: TRzPanel;
    cmb_COMNO6: TRzComboBox;
    cmb_COMNO5: TRzComboBox;
    cmb_ExGnd5: TRzComboBox;
    cmb_ExGnd6: TRzComboBox;
    cmb_dsgnd6: TRzComboBox;
    cmb_dsgnd5: TRzComboBox;
    cmb_lsgnd5: TRzComboBox;
    cmb_lsgnd6: TRzComboBox;
    RzPanel62: TRzPanel;
    RzPanel63: TRzPanel;
    cmb_COMNO8: TRzComboBox;
    cmb_COMNO7: TRzComboBox;
    cmb_ExGnd7: TRzComboBox;
    cmb_ExGnd8: TRzComboBox;
    cmb_dsgnd8: TRzComboBox;
    cmb_dsgnd7: TRzComboBox;
    cmb_lsgnd7: TRzComboBox;
    cmb_lsgnd8: TRzComboBox;
    Panel13: TPanel;
    gb_SystemZoneExtension: TGroupBox;
    StaticText138: TStaticText;
    StaticText139: TStaticText;
    StaticText140: TStaticText;
    StaticText141: TStaticText;
    StaticText142: TStaticText;
    StaticText143: TStaticText;
    StaticText144: TStaticText;
    StaticText145: TStaticText;
    cmb_SystemZoneExtensionUse1: TRzComboBox;
    cmb_SystemZoneExtensionUse2: TRzComboBox;
    cmb_SystemZoneExtensionUse3: TRzComboBox;
    cmb_SystemZoneExtensionUse4: TRzComboBox;
    cmb_SystemZoneExtensionUse5: TRzComboBox;
    cmb_SystemZoneExtensionUse6: TRzComboBox;
    cmb_SystemZoneExtensionUse7: TRzComboBox;
    cmb_SystemZoneExtensionUse8: TRzComboBox;
    pan_Message: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    tabArmAreaControl: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    btn_Alarm8: TRzBitBtn;
    RzBitBtn20: TRzBitBtn;
    GroupBox4: TGroupBox;
    btn_Alarm7: TRzBitBtn;
    RzBitBtn22: TRzBitBtn;
    GroupBox8: TGroupBox;
    btn_Alarm6: TRzBitBtn;
    RzBitBtn24: TRzBitBtn;
    GroupBox11: TGroupBox;
    btn_Alarm5: TRzBitBtn;
    RzBitBtn26: TRzBitBtn;
    GroupBox12: TGroupBox;
    btn_Alarm4: TRzBitBtn;
    RzBitBtn28: TRzBitBtn;
    GroupBox13: TGroupBox;
    btn_Alarm3: TRzBitBtn;
    RzBitBtn30: TRzBitBtn;
    GroupBox14: TGroupBox;
    btn_Alarm2: TRzBitBtn;
    RzBitBtn32: TRzBitBtn;
    GroupBox15: TGroupBox;
    btn_Alarm1: TRzBitBtn;
    RzBitBtn34: TRzBitBtn;
    GroupBox16: TGroupBox;
    StaticText55: TStaticText;
    st_AlarmState3: TStaticText;
    StaticText57: TStaticText;
    st_ArmArea3: TStaticText;
    TabSheet9: TTabSheet;
    Panel9: TPanel;
    Panel22: TPanel;
    GroupBox17: TGroupBox;
    StaticText45: TStaticText;
    st_AlarmState: TStaticText;
    GroupBox18: TGroupBox;
    GroupBox26: TGroupBox;
    btn_AllFireRecovery: TRzBitBtn;
    GroupBox27: TGroupBox;
    btn_SyncTime1: TRzBitBtn;
    btn_MemoryClear: TRzBitBtn;
    btn_DeviceReset: TRzBitBtn;
    GroupBox28: TGroupBox;
    GroupBox29: TGroupBox;
    btn_SirenOn: TRzBitBtn;
    RzBitBtn46: TRzBitBtn;
    RzBitBtn41: TRzBitBtn;
    RzBitBtn42: TRzBitBtn;
    RzBitBtn36: TRzBitBtn;
    RzBitBtn39: TRzBitBtn;
    RzBitBtn40: TRzBitBtn;
    RzBitBtn47: TRzBitBtn;
    RzBitBtn48: TRzBitBtn;
    RzBitBtn49: TRzBitBtn;
    RzBitBtn50: TRzBitBtn;
    RzBitBtn51: TRzBitBtn;
    GroupBox25: TGroupBox;
    gb_ArmAll: TGroupBox;
    btn_AllDisArmControl: TRzBitBtn;
    btn_Alarm: TRzBitBtn;
    btn_DisAlarm: TRzBitBtn;
    GroupBox31: TGroupBox;
    btn_AlarmState: TRzBitBtn;
    GroupBox33: TGroupBox;
    StaticText56: TStaticText;
    st_FireResult: TStaticText;
    StaticText59: TStaticText;
    st_Time1: TStaticText;
    StaticText146: TStaticText;
    st_MemoryClearResult: TStaticText;
    st_DeviceResetResult: TStaticText;
    StaticText149: TStaticText;
    gb_LocalPortState: TGroupBox;
    pan_ZonState0: TRzPanel;
    st_ZoneState1: TStaticText;
    st_ZoneState2: TStaticText;
    st_ZoneState3: TStaticText;
    st_ZoneState4: TStaticText;
    st_ZoneState5: TStaticText;
    st_ZoneState6: TStaticText;
    st_ZoneState7: TStaticText;
    st_ZoneState8: TStaticText;
    RzPanel15: TRzPanel;
    StaticText58: TStaticText;
    StaticText60: TStaticText;
    StaticText147: TStaticText;
    StaticText148: TStaticText;
    StaticText150: TStaticText;
    StaticText151: TStaticText;
    StaticText158: TStaticText;
    StaticText161: TStaticText;
    gb_ZoneExtensionState1: TGroupBox;
    RzPanel8: TRzPanel;
    st_ZoneState11: TStaticText;
    st_ZoneState12: TStaticText;
    st_ZoneState13: TStaticText;
    st_ZoneState14: TStaticText;
    st_ZoneState15: TStaticText;
    st_ZoneState16: TStaticText;
    st_ZoneState17: TStaticText;
    st_ZoneState18: TStaticText;
    gb_ZoneExtensionState2: TGroupBox;
    RzPanel19: TRzPanel;
    st_ZoneState21: TStaticText;
    st_ZoneState22: TStaticText;
    st_ZoneState23: TStaticText;
    st_ZoneState24: TStaticText;
    st_ZoneState25: TStaticText;
    st_ZoneState26: TStaticText;
    st_ZoneState27: TStaticText;
    st_ZoneState28: TStaticText;
    gb_ZoneExtensionState3: TGroupBox;
    RzPanel25: TRzPanel;
    st_ZoneState31: TStaticText;
    st_ZoneState32: TStaticText;
    st_ZoneState33: TStaticText;
    st_ZoneState34: TStaticText;
    st_ZoneState35: TStaticText;
    st_ZoneState36: TStaticText;
    st_ZoneState37: TStaticText;
    st_ZoneState38: TStaticText;
    gb_ZoneExtensionState4: TGroupBox;
    RzPanel27: TRzPanel;
    st_ZoneState41: TStaticText;
    st_ZoneState42: TStaticText;
    st_ZoneState43: TStaticText;
    st_ZoneState44: TStaticText;
    st_ZoneState45: TStaticText;
    st_ZoneState46: TStaticText;
    st_ZoneState47: TStaticText;
    st_ZoneState48: TStaticText;
    gb_ZoneExtensionState5: TGroupBox;
    RzPanel31: TRzPanel;
    st_ZoneState51: TStaticText;
    st_ZoneState52: TStaticText;
    st_ZoneState53: TStaticText;
    st_ZoneState54: TStaticText;
    st_ZoneState55: TStaticText;
    st_ZoneState56: TStaticText;
    st_ZoneState57: TStaticText;
    st_ZoneState58: TStaticText;
    gb_ZoneExtensionState6: TGroupBox;
    RzPanel35: TRzPanel;
    st_ZoneState61: TStaticText;
    st_ZoneState62: TStaticText;
    st_ZoneState63: TStaticText;
    st_ZoneState64: TStaticText;
    st_ZoneState65: TStaticText;
    st_ZoneState66: TStaticText;
    st_ZoneState67: TStaticText;
    st_ZoneState68: TStaticText;
    gb_ZoneExtensionState7: TGroupBox;
    RzPanel39: TRzPanel;
    st_ZoneState71: TStaticText;
    st_ZoneState72: TStaticText;
    st_ZoneState73: TStaticText;
    st_ZoneState74: TStaticText;
    st_ZoneState75: TStaticText;
    st_ZoneState76: TStaticText;
    st_ZoneState77: TStaticText;
    st_ZoneState78: TStaticText;
    gb_ZoneExtensionState8: TGroupBox;
    RzPanel43: TRzPanel;
    st_ZoneState81: TStaticText;
    st_ZoneState82: TStaticText;
    st_ZoneState83: TStaticText;
    st_ZoneState84: TStaticText;
    st_ZoneState85: TStaticText;
    st_ZoneState86: TStaticText;
    st_ZoneState87: TStaticText;
    st_ZoneState88: TStaticText;
    StaticText30: TStaticText;
    cmb_ArmDSCheck1: TRzComboBox;
    cmb_ArmDSCheck2: TRzComboBox;
    StaticText218: TStaticText;
    cmb_ArmDSCheck3: TRzComboBox;
    cmb_ArmDSCheck4: TRzComboBox;
    cmb_ArmDSCheck5: TRzComboBox;
    cmb_ArmDSCheck6: TRzComboBox;
    cmb_ArmDSCheck7: TRzComboBox;
    cmb_ArmDSCheck8: TRzComboBox;
    tabEtcState: TTabSheet;
    GroupBox5: TGroupBox;
    btn_ShortCheck: TRzBitBtn;
    st_LineShortCheck: TStaticText;
    st_CardType: TStaticText;
    btn_AllArmControl: TRzBitBtn;
    StaticText152: TStaticText;
    cmb_JaejungDelayUse: TRzComboBox;
    ProgressBar1: TProgressBar;
    st_AlarmState22: TStaticText;
    st_AlarmState23: TStaticText;
    st_AlarmState24: TStaticText;
    st_AlarmState25: TStaticText;
    st_AlarmState26: TStaticText;
    st_AlarmState27: TStaticText;
    st_AlarmState28: TStaticText;
    StaticText153: TStaticText;
    ComboBox_LockType21: TRzComboBox;
    ComboBox_LockType22: TRzComboBox;
    ComboBox_LockType23: TRzComboBox;
    ComboBox_LockType24: TRzComboBox;
    ComboBox_LockType25: TRzComboBox;
    ComboBox_LockType26: TRzComboBox;
    ComboBox_LockType27: TRzComboBox;
    ComboBox_LockType28: TRzComboBox;
    gb_AraeAll: TGroupBox;
    RzBitBtn4: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    CardTypeTimer1: TTimer;
    sg_FireDevice: TAdvStringGrid;
    chk_ArmJavaraClose: TCheckBox;
    chk_JavaraAutoClose: TCheckBox;
    panPortZoneUsed0: TRzPanel;
    cmb_ZonUse1: TRzComboBox;
    cmb_ZonUse2: TRzComboBox;
    cmb_ZonUse3: TRzComboBox;
    cmb_ZonUse4: TRzComboBox;
    cmb_ZonUse5: TRzComboBox;
    cmb_ZonUse6: TRzComboBox;
    cmb_ZonUse7: TRzComboBox;
    cmb_ZonUse8: TRzComboBox;
    panPortZoneUsed1: TRzPanel;
    cmb_ZonUse11: TRzComboBox;
    cmb_ZonUse12: TRzComboBox;
    cmb_ZonUse13: TRzComboBox;
    cmb_ZonUse14: TRzComboBox;
    cmb_ZonUse15: TRzComboBox;
    cmb_ZonUse16: TRzComboBox;
    cmb_ZonUse17: TRzComboBox;
    cmb_ZonUse18: TRzComboBox;
    panPortZoneUsed2: TRzPanel;
    cmb_ZonUse21: TRzComboBox;
    cmb_ZonUse22: TRzComboBox;
    cmb_ZonUse23: TRzComboBox;
    cmb_ZonUse24: TRzComboBox;
    cmb_ZonUse25: TRzComboBox;
    cmb_ZonUse26: TRzComboBox;
    cmb_ZonUse27: TRzComboBox;
    cmb_ZonUse28: TRzComboBox;
    panPortZoneUsed3: TRzPanel;
    cmb_ZonUse31: TRzComboBox;
    cmb_ZonUse32: TRzComboBox;
    cmb_ZonUse33: TRzComboBox;
    cmb_ZonUse34: TRzComboBox;
    cmb_ZonUse35: TRzComboBox;
    cmb_ZonUse36: TRzComboBox;
    cmb_ZonUse37: TRzComboBox;
    cmb_ZonUse38: TRzComboBox;
    panPortZoneUsed4: TRzPanel;
    cmb_ZonUse41: TRzComboBox;
    cmb_ZonUse42: TRzComboBox;
    cmb_ZonUse43: TRzComboBox;
    cmb_ZonUse44: TRzComboBox;
    cmb_ZonUse45: TRzComboBox;
    cmb_ZonUse46: TRzComboBox;
    cmb_ZonUse47: TRzComboBox;
    cmb_ZonUse48: TRzComboBox;
    panPortZoneUsed5: TRzPanel;
    cmb_ZonUse51: TRzComboBox;
    cmb_ZonUse52: TRzComboBox;
    cmb_ZonUse53: TRzComboBox;
    cmb_ZonUse54: TRzComboBox;
    cmb_ZonUse55: TRzComboBox;
    cmb_ZonUse56: TRzComboBox;
    cmb_ZonUse57: TRzComboBox;
    cmb_ZonUse58: TRzComboBox;
    panPortZoneUsed6: TRzPanel;
    cmb_ZonUse61: TRzComboBox;
    cmb_ZonUse62: TRzComboBox;
    cmb_ZonUse63: TRzComboBox;
    cmb_ZonUse64: TRzComboBox;
    cmb_ZonUse65: TRzComboBox;
    cmb_ZonUse66: TRzComboBox;
    cmb_ZonUse67: TRzComboBox;
    cmb_ZonUse68: TRzComboBox;
    panPortZoneUsed7: TRzPanel;
    cmb_ZonUse71: TRzComboBox;
    cmb_ZonUse72: TRzComboBox;
    cmb_ZonUse73: TRzComboBox;
    cmb_ZonUse74: TRzComboBox;
    cmb_ZonUse75: TRzComboBox;
    cmb_ZonUse76: TRzComboBox;
    cmb_ZonUse77: TRzComboBox;
    cmb_ZonUse78: TRzComboBox;
    panPortZoneUsed8: TRzPanel;
    cmb_ZonUse81: TRzComboBox;
    cmb_ZonUse82: TRzComboBox;
    cmb_ZonUse83: TRzComboBox;
    cmb_ZonUse84: TRzComboBox;
    cmb_ZonUse85: TRzComboBox;
    cmb_ZonUse86: TRzComboBox;
    cmb_ZonUse87: TRzComboBox;
    cmb_ZonUse88: TRzComboBox;
    tabZoneUseControl: TTabSheet;
    gb_ZoneUseRemoteControl: TGroupBox;
    RzPanel47: TRzPanel;
    StaticText154: TStaticText;
    StaticText155: TStaticText;
    StaticText156: TStaticText;
    StaticText157: TStaticText;
    StaticText159: TStaticText;
    StaticText160: TStaticText;
    StaticText162: TStaticText;
    StaticText163: TStaticText;
    btn_ZoneUseControl1: TRzBitBtn;
    RzPanel51: TRzPanel;
    btn_ZoneUseControl2: TRzBitBtn;
    btn_ZoneUseControl3: TRzBitBtn;
    btn_ZoneUseControl4: TRzBitBtn;
    btn_ZoneUseControl5: TRzBitBtn;
    btn_ZoneUseControl6: TRzBitBtn;
    btn_ZoneUseControl7: TRzBitBtn;
    btn_ZoneUseControl8: TRzBitBtn;
    pan_RemoteZoneExt1: TRzPanel;
    pan_RemoteZoneExt2: TRzPanel;
    pan_RemoteZoneExt3: TRzPanel;
    pan_RemoteZoneExt4: TRzPanel;
    pan_RemoteZoneExt5: TRzPanel;
    pan_RemoteZoneExt6: TRzPanel;
    pan_RemoteZoneExt7: TRzPanel;
    pan_RemoteZoneExt8: TRzPanel;
    btn_ZoneUseControl11: TRzBitBtn;
    btn_ZoneUseControl12: TRzBitBtn;
    btn_ZoneUseControl13: TRzBitBtn;
    btn_ZoneUseControl14: TRzBitBtn;
    btn_ZoneUseControl15: TRzBitBtn;
    btn_ZoneUseControl16: TRzBitBtn;
    btn_ZoneUseControl17: TRzBitBtn;
    btn_ZoneUseControl18: TRzBitBtn;
    btn_ZoneUseControl21: TRzBitBtn;
    btn_ZoneUseControl22: TRzBitBtn;
    btn_ZoneUseControl23: TRzBitBtn;
    btn_ZoneUseControl24: TRzBitBtn;
    btn_ZoneUseControl25: TRzBitBtn;
    btn_ZoneUseControl26: TRzBitBtn;
    btn_ZoneUseControl27: TRzBitBtn;
    btn_ZoneUseControl28: TRzBitBtn;
    btn_ZoneUseControl31: TRzBitBtn;
    btn_ZoneUseControl32: TRzBitBtn;
    btn_ZoneUseControl33: TRzBitBtn;
    btn_ZoneUseControl34: TRzBitBtn;
    btn_ZoneUseControl35: TRzBitBtn;
    btn_ZoneUseControl36: TRzBitBtn;
    btn_ZoneUseControl37: TRzBitBtn;
    btn_ZoneUseControl38: TRzBitBtn;
    btn_ZoneUseControl41: TRzBitBtn;
    btn_ZoneUseControl42: TRzBitBtn;
    btn_ZoneUseControl43: TRzBitBtn;
    btn_ZoneUseControl44: TRzBitBtn;
    btn_ZoneUseControl45: TRzBitBtn;
    btn_ZoneUseControl46: TRzBitBtn;
    btn_ZoneUseControl47: TRzBitBtn;
    btn_ZoneUseControl48: TRzBitBtn;
    btn_ZoneUseControl51: TRzBitBtn;
    btn_ZoneUseControl52: TRzBitBtn;
    btn_ZoneUseControl53: TRzBitBtn;
    btn_ZoneUseControl54: TRzBitBtn;
    btn_ZoneUseControl55: TRzBitBtn;
    btn_ZoneUseControl56: TRzBitBtn;
    btn_ZoneUseControl57: TRzBitBtn;
    btn_ZoneUseControl58: TRzBitBtn;
    btn_ZoneUseControl61: TRzBitBtn;
    btn_ZoneUseControl62: TRzBitBtn;
    btn_ZoneUseControl63: TRzBitBtn;
    btn_ZoneUseControl64: TRzBitBtn;
    btn_ZoneUseControl65: TRzBitBtn;
    btn_ZoneUseControl66: TRzBitBtn;
    btn_ZoneUseControl67: TRzBitBtn;
    btn_ZoneUseControl68: TRzBitBtn;
    btn_ZoneUseControl71: TRzBitBtn;
    btn_ZoneUseControl72: TRzBitBtn;
    btn_ZoneUseControl73: TRzBitBtn;
    btn_ZoneUseControl74: TRzBitBtn;
    btn_ZoneUseControl75: TRzBitBtn;
    btn_ZoneUseControl76: TRzBitBtn;
    btn_ZoneUseControl77: TRzBitBtn;
    btn_ZoneUseControl78: TRzBitBtn;
    btn_ZoneUseControl81: TRzBitBtn;
    btn_ZoneUseControl82: TRzBitBtn;
    btn_ZoneUseControl83: TRzBitBtn;
    btn_ZoneUseControl84: TRzBitBtn;
    btn_ZoneUseControl85: TRzBitBtn;
    btn_ZoneUseControl86: TRzBitBtn;
    btn_ZoneUseControl87: TRzBitBtn;
    btn_ZoneUseControl88: TRzBitBtn;
    GroupBox7: TGroupBox;
    StaticText164: TStaticText;
    StaticText165: TStaticText;
    rg_Primary: TRzGroupBox;
    rb_Dedicated: TRadioButton;
    rb_tcpip: TRadioButton;
    rb_wcdma: TRadioButton;
    pan_KTTDetail: TPanel;
    RzLabel5: TRzLabel;
    ed_Mux: TEdit;
    btn_DetailKTTInfo: TRzBitBtn;
    GroupBox19: TGroupBox;
    Label80: TLabel;
    edPtDelayTime: TEdit;
    btn_RegCheckTime: TBitBtn;
    gb_SendPacket: TGroupBox;
    StaticText166: TStaticText;
    StaticText167: TStaticText;
    btn_RemoteSendPacket: TRzBitBtn;
    ed_RemoteCmd: TEdit;
    ed_RemoteData: TEdit;
    tab_Police: TTabSheet;
    GroupBox20: TGroupBox;
    StaticText168: TStaticText;
    ed_TelMonitorNum1: TEdit;
    StaticText169: TStaticText;
    ed_TelMonitorsendTime1: TEdit;
    StaticText170: TStaticText;
    ed_TelMonitorStartDelay1: TEdit;
    StaticText171: TStaticText;
    ed_TelMonitorsendCount1: TEdit;
    StaticText172: TStaticText;
    cmb_TelMonitorsSpeaker1: TRzComboBox;
    StaticText173: TStaticText;
    cmb_TelMonitorCountTime1: TRzComboBox;
    StaticText174: TStaticText;
    cmb_TelMonitorDTMFStart1: TRzComboBox;
    StaticText175: TStaticText;
    cmb_TelMonitorDTMFEnd1: TRzComboBox;
    GroupBox21: TGroupBox;
    StaticText176: TStaticText;
    ed_TelMonitorNum2: TEdit;
    StaticText177: TStaticText;
    ed_TelMonitorsendTime2: TEdit;
    StaticText178: TStaticText;
    ed_TelMonitorStartDelay2: TEdit;
    StaticText179: TStaticText;
    ed_TelMonitorsendCount2: TEdit;
    StaticText180: TStaticText;
    cmb_TelMonitorsSpeaker2: TRzComboBox;
    StaticText181: TStaticText;
    cmb_TelMonitorCountTime2: TRzComboBox;
    StaticText182: TStaticText;
    cmb_TelMonitorDTMFStart2: TRzComboBox;
    StaticText183: TStaticText;
    cmb_TelMonitorDTMFEnd2: TRzComboBox;
    StaticText184: TStaticText;
    ed_TelMonitorSoundNo1: TEdit;
    StaticText185: TStaticText;
    ed_TelMonitorSoundNo2: TEdit;
    gb_ServerCard: TGroupBox;
    cmb_ServerCardNF: TRzComboBox;
    gb_JavaraStopTime: TGroupBox;
    Label504: TLabel;
    Label505: TLabel;
    Label506: TLabel;
    Label507: TLabel;
    Label508: TLabel;
    Label509: TLabel;
    ed_OpenStop: TEdit;
    ed_CloseStop: TEdit;
    ed_StopDelay: TEdit;
    ScrollBox1: TScrollBox;
    RzPanel64: TRzPanel;
    cmb_ReaderSound1: TRzComboBox;
    cmb_ReaderSound2: TRzComboBox;
    cmb_ReaderSound3: TRzComboBox;
    cmb_ReaderSound4: TRzComboBox;
    cmb_ReaderSound5: TRzComboBox;
    cmb_ReaderSound6: TRzComboBox;
    cmb_ReaderSound7: TRzComboBox;
    cmb_ReaderSound8: TRzComboBox;
    tab_TimeCode: TTabSheet;
    gb_TimeCodeGroup: TGroupBox;
    Label478: TLabel;
    Label479: TLabel;
    Label480: TLabel;
    Label481: TLabel;
    Label482: TLabel;
    Label483: TLabel;
    Label484: TLabel;
    Label485: TLabel;
    ed_TimeCode01Start: TEdit;
    ed_TimeCode01End: TEdit;
    ed_TimeCode02Start: TEdit;
    ed_TimeCode02End: TEdit;
    ed_TimeCode03Start: TEdit;
    ed_TimeCode03End: TEdit;
    ed_TimeCode04Start: TEdit;
    ed_TimeCode04End: TEdit;
    ed_TimeCode11Start: TEdit;
    ed_TimeCode11End: TEdit;
    ed_TimeCode12Start: TEdit;
    ed_TimeCode12End: TEdit;
    ed_TimeCode13Start: TEdit;
    ed_TimeCode13End: TEdit;
    ed_TimeCode14Start: TEdit;
    ed_TimeCode14End: TEdit;
    gb_TimeCodeUse: TGroupBox;
    chk_TimeDoor1: TCheckBox;
    chk_TimeDoor2: TCheckBox;
    chk_TimeDoor3: TCheckBox;
    chk_TimeDoor4: TCheckBox;
    chk_TimeDoor5: TCheckBox;
    chk_TimeDoor6: TCheckBox;
    chk_TimeDoor7: TCheckBox;
    chk_TimeDoor8: TCheckBox;
    RzPanel65: TRzPanel;
    cmb_ExitSound1: TRzComboBox;
    cmb_ExitSound2: TRzComboBox;
    cmb_ExitSound3: TRzComboBox;
    cmb_ExitSound4: TRzComboBox;
    cmb_ExitSound5: TRzComboBox;
    cmb_ExitSound6: TRzComboBox;
    cmb_ExitSound7: TRzComboBox;
    cmb_ExitSound8: TRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TreeView_DeviceClick(Sender: TObject);
    procedure pg_DeviceSettingChange(Sender: TObject);
    procedure btn_NextClick(Sender: TObject);
    procedure ed_mcidChange(Sender: TObject);
    procedure ed_mcidKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_WizNetSettingClick(Sender: TObject);
    procedure Group_DeviceClick(Sender: TObject);
    procedure ComboBox_WatchPowerOffChange(Sender: TObject);
    procedure Edit_LocateKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_LocateExit(Sender: TObject);
    procedure ComboBox_WatchPowerOffClick(Sender: TObject);
    procedure btn_AlarmClick(Sender: TObject);
    procedure btn_DisAlarmClick(Sender: TObject);
    procedure Group_DeviceChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure ComboBox_CardModeType1Change(Sender: TObject);
    procedure btn_FireDeviceClick(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
    procedure cb_CardTypeChange(Sender: TObject);
    procedure ReaderInfoChange(Sender: TObject);
    procedure mn_FireRecoveryClick(Sender: TObject);
    procedure DoorControl(Sender: TObject);
    procedure cmb_WatchTypeClick(Sender: TObject);
    procedure btn_UseControlerSearchClick(Sender: TObject);
    procedure btn_RegistrationClick(Sender: TObject);
    procedure Edit_IPKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit_subnetKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_GatewayKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edit_portKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_serverKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_ServerPortKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Rg_ModeClick(Sender: TObject);
    procedure chk_DHCPClick(Sender: TObject);
    procedure Edit_LocateKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_TimeSyncClick(Sender: TObject);
    procedure btn_TimeSearchClick(Sender: TObject);
    procedure Edit_LocateChange(Sender: TObject);
    procedure ComboBox_LockType2Enter(Sender: TObject);
    procedure ComboBox_LockType2Exit(Sender: TObject);
    procedure ComboBox_LockType1Exit(Sender: TObject);
    procedure ComboBox_LockType1Enter(Sender: TObject);
    procedure btn_MacSearchClick(Sender: TObject);
    procedure btnRegMACClick(Sender: TObject);
    procedure deviceLoadTimerTimer(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnECUAddClick(Sender: TObject);
    procedure lvECUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnECUEraseClick(Sender: TObject);
    procedure lvECUMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cmb_EcuTypeChange(Sender: TObject);
    procedure cmb_EcuTypeExit(Sender: TObject);
    procedure cmb_SearchTypeChange(Sender: TObject);
    procedure mn_ControlerResetClick(Sender: TObject);
    procedure TreeView_DeviceMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mn_ArmModeClick(Sender: TObject);
    procedure mn_DisArmModeClick(Sender: TObject);
    procedure mn_DoorManagerModeClick(Sender: TObject);
    procedure mn_DoorOpenModeClick(Sender: TObject);
    procedure mn_ReaderVersionClick(Sender: TObject);
    procedure cmb_ArmDSCheck1Change(Sender: TObject);
    procedure cmb_ArmRelayChange(Sender: TObject);
    procedure cmb_alartLampChange(Sender: TObject);
    procedure cmb_alartSirenChange(Sender: TObject);
    procedure btn_WizNetSearchClick(Sender: TObject);
    procedure ed_cdmaMinChange(Sender: TObject);
    procedure ed_cdmaMuxChange(Sender: TObject);
    procedure ed_cdmaIPChange(Sender: TObject);
    procedure ed_cdmaPortChange(Sender: TObject);
    procedure ed_cdmachktimeChange(Sender: TObject);
    procedure ed_cdmarssiChange(Sender: TObject);
    procedure btn_cdmasettingClick(Sender: TObject);
    procedure btn_cdmaSearchClick(Sender: TObject);
    procedure btn_DVRUseRegClick(Sender: TObject);
    procedure ed_dvripChange(Sender: TObject);
    procedure ed_dvrportChange(Sender: TObject);
    procedure btn_DVRUseSearchClick(Sender: TObject);
    procedure ed_cardreaderTel1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure TreeView_DeviceDblClick(Sender: TObject);
    procedure ActiveTimerTimer(Sender: TObject);
    procedure btn_DeviceCopyClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure cmb_Relay2TypeChange(Sender: TObject);
    procedure se_crCallTimeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmb_WatchType1Enter(Sender: TObject);
    procedure chkMainToLocal1Click(Sender: TObject);
    procedure cmb_ArmExtensionSelectChange(Sender: TObject);
    procedure chk_ArmExtension00Click(Sender: TObject);
    procedure TabSheet19Resize(Sender: TObject);
    procedure chk_DoorArmAreaUseClick(Sender: TObject);
    procedure cmb_ZoneExtensionUse1Change(Sender: TObject);
    procedure cmb_SystemZoneExtensionUse1Change(Sender: TObject);
    procedure cmbDoorAlarmArea1Change(Sender: TObject);
    procedure gb_ArmAreaSearchChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure FormResize(Sender: TObject);
    procedure btn_AlarmStateClick(Sender: TObject);
    procedure btn_AllFireRecoveryClick(Sender: TObject);
    procedure btn_AllDisArmControlClick(Sender: TObject);
    procedure btn_SyncTime1Click(Sender: TObject);
    procedure btn_DeviceResetClick(Sender: TObject);
    procedure btn_MemoryClearClick(Sender: TObject);
    procedure Edit_LinkusTelChange(Sender: TObject);
    procedure Edit_LinkusIDKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_alertLampTimeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_alertSirenTimeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpinEdit_InDelayKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpinEdit_InDelayMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpinEdit_OutDelayMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SpinEdit_OutDelayKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpinEdit_InDelayEnter(Sender: TObject);
    procedure SpinEdit_InDelayMouseEnter(Sender: TObject);
    procedure SpinEdit_OutDelayEnter(Sender: TObject);
    procedure SpinEdit_OutDelayMouseEnter(Sender: TObject);
    procedure btn_ShortCheckClick(Sender: TObject);
    procedure cmb_WatchType11Click(Sender: TObject);
    procedure cmb_WatchType11Enter(Sender: TObject);
    procedure chk_AllClick(Sender: TObject);
    procedure CardTypeTimer1Timer(Sender: TObject);
    procedure btn_ZoneUseControl1Click(Sender: TObject);
    procedure page_RemoteControlChange(Sender: TObject);
    procedure rb_DedicatedClick(Sender: TObject);
    procedure rb_tcpipClick(Sender: TObject);
    procedure rb_wcdmaClick(Sender: TObject);
    procedure btn_DetailKTTInfoClick(Sender: TObject);
    procedure CommandArrayCommandsTDETAILVIEWExecute(Command: TCommand;
      Params: TStringList);
    procedure btn_RegCheckTimeClick(Sender: TObject);
    procedure btn_RemoteSendPacketClick(Sender: TObject);
    procedure cmb_ReaderType1Enter(Sender: TObject);
    procedure cmb_ReaderType1Exit(Sender: TObject);
  private
    L_bSettingChanged : Boolean;
    L_nOldPageIndex : integer; //이전 Page
    L_nOldSubPageIndex : integer; //이전 부속 Page
    //Form
    FDeviceType: string;
    L_bDeviceUsedChange : Boolean;
    L_bDoorSystemChange : Boolean;
    L_bDeviceLoad : Boolean;
    L_bDeviceLoadTime : Boolean;
    L_bFormActive : Boolean;
    L_bTableLoading : Boolean;
    L_bDataReceive : Boolean; //데이터 수신 상태
    L_bGroupBoxClear : Boolean;
    L_bGridInitialize : Boolean; //그리드 초기화시 조회하지 말자.
    L_bReaderFormDoorLockSetting : Boolean;   //리더 폼의 도어락 구성 중일때는 재구성 하지 말자.
    L_nOldWhatchType : integer;  //전 감시존 상태
    L_nOldInDelay : integer;
    L_nOldOutDelay : integer;

    L_cRegColor : TColor;
    L_cSearchColor : TColor;

    ZoneStateNameList : TStringList;
    ZoneStateCodeList : TStringList;
    FMaxEcuCount: integer;
    FSocketConnected: Boolean;
    { Private declarations }
    procedure ZoneStatusLoad;
    procedure ZoneWatchDelayLoad;
    procedure ZoneRecoverLoad;
    procedure ZoneStateLoad;
    procedure cmbEcuTypeLoad;
    procedure FormSetting;
    procedure Ecu_GroupCreate(aGroup:TGroupBox;aCount:integer);
    procedure GroupBoxClear(aGroup:TGroupBox);
    procedure GroupBoxFree(aGroup:TGroupBox);
    procedure GroupBoxItemSetting(aGroup:TGroupBox;aIndex:integer;aCaption:string);
    procedure GroupCheckItem(aGroup:TGroupBox;aGroupIndex:integer;aChecked:Boolean);
    procedure KTT811FormSetting;
    procedure KTT812FormSetting;
    procedure ICU100FormSetting;
    procedure ICU200FormSetting;
    procedure setDeviceType(const Value: string);
    function  GetEcu:string;
    function  GetDeviceType : string;
    function  MCUSettingSearch(aDirect:Boolean=False):Boolean;
    function  ArmExtensionSearch(aDirect:Boolean=False):Boolean;
    procedure TableToFormSetting(aEcuID:string);
    procedure TableToFormColorSetting(aEcuID:string);
    function  GetWatchTypeName(aAlarmType: string; var aParentWatchType: string; var aParentIndex: integer): Boolean;
    procedure FormDeviceSetting(aEcuID:string;aReaderDoorRefresh:Boolean=False);
    procedure FormTimeCodeSetting(aEcuID:string;aTimeCodeRefresh:Boolean=False);
    procedure ArmDSFormEnable(aValue:Boolean);
    procedure DoorFormUsed(aDoorNo:integer;aUsed:Boolean);
    procedure ReaderFormUsed(aReaderNo:integer;aUsed:Boolean);
    procedure PortFormUsed(aPortNo:integer;aUsed:Boolean);
    procedure CardReaderTypeLoad(aCardReaderType:integer=0);
    procedure CardReaderAllTypeSetting(aEcuID:string;aCardType:integer;aColor:TColor);
    procedure CardReaderNumTypeSetting(aECUID,aReaderNo,aCardReaderType:string;aColor:TColor);
    procedure CardReaderSoundUseSetting(aECUID,aReaderNo,aData:string;aColor:TColor);
    procedure CardReaderExitSoundUseSetting(aECUID,aReaderNo,aData:string;aColor:TColor);
    procedure SetMaxEcuCount(const Value: integer);
    procedure GetArmExtentionData(var aSendData:string);
    procedure SetArmExtensionTableData(aArmExtensionData:string);
    procedure DoorArmDSCheckEnable(aValue:Boolean);
    procedure DoorDSCheckTimeEnable(aValue:Boolean);
    procedure PortFormArmAreaVisible(aValue:Boolean);
    procedure PortFormArmAreaEnable(aValue : Boolean);
    procedure DoorLockExtensionForm(aValue:Boolean);
    procedure ReaderFormDoorLockSetting(aDoorNo:integer;aDoor2Use:Boolean);  //리더 폼에 문번호 등록 하자
    procedure FormZoneExtensionUse(aEcuID,aZoneExtNo:string;aZoneExtensionUse:Boolean;aColor:TColor);
    procedure FormRemoteZoneExtVisible(aEcuID,aZoneExtNo:string;aZoneExtensionUse:Boolean);
//    procedure FormDoorLock2TypeEnable(aDoor2Type:Boolean);
    procedure GridMergeInitialize;
    procedure FormArmExtensionSetting(aSelectIndex:integer);
    procedure FormSystemDoorUsePossibilityEnable(aDoorNO:string;aValue:Boolean);
    procedure FormRemoteControlDoorEnable(aDoorNO:string;aValue:Boolean);
    procedure FormStateDoorEnable(aDoorNO:string;aValue:Boolean);
    procedure FormZoneExtendChangeCheck;
    procedure FormZoneUseEnable(aZoneExtNo,aZoneNo:integer;aZoneUse:Boolean);
    procedure PortZoneUsedVisible(aValue : Boolean);
    procedure PortZoneUsedEnable(aValue : Boolean);
    procedure SetSocketConnected(const Value: Boolean);
  private
    procedure gb_DoorControlResize;
  public
    //Function
    function GetDoorControlTime(aDoorNo:string;var aDoorControlTime:string):Boolean;
    function GetDoorLockType(aDoorNo:string;var aDoorLockType:string):Boolean;
    function GetDoorCardMode(aDoorNo:string;var aCardModeType:string):Boolean;
    function GetDoorModeType(aDoorNo:string;var aDoorModeType:string):Boolean;
    function GetDoorLongOpenTime(aDoorNo:string;var aDoorLongOpenTime:string):Boolean;
    function GetDoorScheduleUse(aDoorNo:string;var aScheduleUse:string):Boolean;
    function GetDoorStatusUse(aDoorNo:string;var aDoorStatusUse:string):Boolean;
    function GetDoorLongTimeUse(aDoorNo:string;var aDoorLongTimeUse:string):Boolean;
    function GetDoorFireOpenUse(aDoorNo:string;var aDoorFireOpenUse:string):Boolean;
    function GetDoorDSOpenState(aDoorNo:string;var aDoorOpenState:string):Boolean;
    function GetDoorRemoteOpen(aDoorNo:string;var aRemoteOpen:string):Boolean;
    function GetDoorDSCheckTime(aDoorNo:string;var aDoorDSCheckTime:string):Boolean;
    function GetPortComboBox(nExtZoneNo,nPortNo:integer;aComboBoxName:string):TComboBox;
    function GetPortStaticText(aZoneExtNo,nPortNo:integer;aName:string):TStaticText;
    function GetDeviceMaxPortNumber:integer;
    Function GetDeviceMaxDoorNumber: integer;
    function GetReaderNumType:string;
    function GetReaderSoundUseType : string;
    function GetReaderExitSoundUseType : string;
    function GetWatchTypeCode(aPortNo,aWatchType:integer):string;
    function GetDoorArmAreaState:string;
    function GetZoneExtensionUseData:string;
  private
    //Form
    procedure Form_DeviceVersion_Clear;
    procedure Form_DeviceCode_Clear;
    procedure Form_ControllerID_ColorInitialize;
    procedure Form_UsedDevice_ColorInitialize;
    procedure Form_KTTSystem_ColorInitialize;
    procedure Form_WizenetModule_ColorInitialize;
    procedure Form_CDMA_ColorInitialize;
    procedure Form_DVR_ColorInitialize;
    procedure Form_MainToLocalArm_ColorInitialize(aColor:TColor);
    procedure Form_SystemInfo_ColorInitialize;
    procedure Form_SystemDoorArmArea_ColorInitialize;
    procedure Form_SystemZoneExtension_ColorInitialize;
    procedure Form_AlarmState_ColorInitialize;
    procedure Form_DoorSystem_ColorInitialize(aDoorNo:string);
    procedure Form_DoorLockDeviceState_Clear;
    procedure FormTimeCode_ColorInitialize;
    procedure Form_AlarmState_Clear;
    procedure Form_CardReaderType_ColorInitialize;
    procedure Form_AllCardReader_ColorInitialize(aReaderNo:integer);
    procedure Form_AllPort_ColorInitialize(aZoneExtNo,aPortNo:integer);
    procedure Form_DoorControl_Clear;
    procedure Form_AllCardReaderTel_ColorInitialize;
    procedure Form_AllPoliceTel_ColorInitialize;

    //TabForm //Tab이 변경시 화면 클리어
    procedure Form_MCUSetting_Initialize;
    procedure Form_ArmExtension_Initialize;
    procedure Form_SystemInfo_Initialize;
    procedure Form_DoorSystemInfo_Initialize;
    procedure Form_CardReader_Initialize;
    procedure Form_Port_Initialize;
    procedure Form_ECUChange_Initialize;
    procedure Port_DoorEnabelCheck(aEcuID:string);
    procedure PortDoorEnable(aDoorNo:string;aEnable:Boolean);

    procedure PopupMenuAlarmSet;
    procedure PopupMenuDoorSet;
    procedure PopupMenuReaderSet;
    procedure PopupMenuDeviceSet;
  private
    //제어
    function ChangeAlarmMode(aEcuID,aMode:string;aArmArea:integer = 0):Boolean;
    function AllFireRecovery:Boolean;
    function RemoteDoorControl(aEcuID,aDoorNo,aControlType,aControl:string):Boolean;
    function ArmStateCheck(aEcuID:string;aArmArea:integer):Boolean;
    function DoorStateCheck(aEcuID,aDoorNo:string):Boolean;
  private
    //등록
    function RegistControllerID(aControllerID:string):integer;
    function RegistUsedDevice(aUseEcu:string):Boolean;
    function RegistUsedDeviceType(aDeviceType:string):Boolean;
    function RegistKTTSystemID(aLinkusID:string):Boolean;
    function RegistKTTTelNum(aNo,aTelNum:string):Boolean;
    function RegistKTTRingCount(ArmRingCount,DisArmRingCount:integer):Boolean;
    function RegistCdmaUse(aEcuID,aCdmaUse:string):Boolean;
    function RegistcdmaSetData(aEcuID,aCdmaMin,aCdmaMux,aCdmaIP,aCdmaPort,aCdmachktime,aCdmarssi:string):Boolean;
    function RegistDVRUse(aEcuID,aDvrUse:string):Boolean;
    function RegistDVRSetData(aEcuID,aDVRIP,aDVRPort:string):Boolean;
    function RegistMainToLocalArm(aEcuID,aSendData:string):Boolean;
    function RegistMainFromLocalArm(aEcuID,aSendData:string):Boolean;
    function Relay2Type_Registration(aEcuID:string):Boolean;
    function JaejungDelayUse_Registration(aEcuID:string):Boolean;
    function RegistSystemInfo:Boolean;
    function RegistArmDsCheck(aEcuID,aDoorNo,aArmDsCheck:string):Boolean;
    function RegistJavaraArmClose(aEcuID,aArmJavaraClose:string):Boolean;
    function RegistJavaraAutoClose(aEcuID,aJavaraAutoClose:string):Boolean;
    function RegistJavaraStopTime(aEcuID,aData:string):Boolean;
    function RegistArmRelay(aEcuID,aArmRelay:string):Boolean;
    function RegistArmAreaUse(aEcuID,aArmAreaUse:string):Boolean;
    function RegistDoorArmArea(aEcuID:string):Boolean;
    function RegistZoneExtensionUse(aEcuID:string):Boolean;
    function RegistDoorSystyemInfo(aDoorNo:string):Boolean;
    function RegistCardType(aEcuID:string;aCardType:integer):Boolean;
    function RegistCardReaderSound(aEcuID:string):Boolean;
    function RegistCardReaderExitSound(aEcuID:string):Boolean;
    function RegistCardReaderInfo(aEcuID:string;aReaderNo,aReaderUse,aReaderDoor,aReaderDoorLocate,aReaderBuildingLocate,aReaderArmArea:integer;aLocate:string):Boolean;
    function RegistPortInfo(aEcuID,aPortNo,aWatchType,aWatchTypeCode,aDelayUse,aRecoverUse,aPortDelayTime,aZoneArmArea,aLocate,aZoneUsed:string):Boolean;
    function RegistZoneExtensionPortInfo(aEcuID,aExtNo,aSendData:string):Boolean;
    function TimeSync(aDate:string):Boolean;
    function RegistAlartLampSiren(aEcuID,aAlertLamp,aAlertSiren:string):Boolean;
    function RegistAlertLampTime(aEcuID,aAlertLampTime:string):Boolean;
    function RegistAlertSirenTime(aEcuID,aAlertSirenTime:string):Boolean;
    function RegistLineCheckTime(aTime:string):Boolean;
    function RegistLineCheckStart(aStartTime:string):Boolean;

    //등록버튼에 의해 전체 등록사항
    procedure MCUSetting_Registration;
    procedure ArmExtension_Registration;
    procedure SystemInfo_Registration;
    procedure ServerCardNF_Registration;
    procedure DoorSystemInfo_Registration;
    procedure DoorExtensionSystemInfo_Registration;
    procedure AllCardReader_Registration;
    procedure AllPort_Registration(aExtNo:integer);
    procedure ZoneExtensionPort_Registration(aExtNo:integer); //존확장기 정보 등록
    procedure CardReaderTellNo_Registration;
    procedure CardReaderCallTime_Registration;
    procedure PoliceTel_Registration(aTelno:integer);
    procedure DoorTimeCodeUse_Registration;
    procedure TimeCode_Registration(aTimeGroup:string);
    
    function  CardReaderTelNumberRegist(aEcuID:string;nTelNo:integer):Boolean;
    function RegistPrimaryKTT(aPrimaryKey:string):Boolean;
    function RegistKTTMuxID(aMuxID:string):Boolean;

  private
    function CheckPortDelayTime(aExtNo:integer):Boolean;
    function CheckArmDsANDDeadBoltLockType(aDoorNo:integer):Boolean;
  private
    //조회
    function CheckPrimaryKTT(aDirect:Boolean=False):Boolean;
    function CheckKTTMuxID(aDirect:Boolean=False):Boolean;
    function DeviceVersionCheck(aEcuID:string):Boolean;
    function DeviceCodeCheck(aEcuID:string):Boolean;
    function ControllerIDSearch(aDirect:Boolean=False):Boolean;
    function UsedDeviceSearch(aDirect:Boolean=False):Boolean;
    function UsedDeviceTypeSearch(aDirect:Boolean=False):Boolean;
    function KTTSystemIDSearch(aDirect:Boolean=False):Boolean;
    function KTTTelNumSearch(aNo:string;aDirect:Boolean=False):Boolean;
    function KTTRingCountSearch(aDirect:Boolean=False):Boolean;
    function WiznetModuleInfoSearch:Boolean;
    function MainToLocalArmSearch(aEcuID:string;aDirect:Boolean=False):Boolean;
    function MainFromLocalArmSearch(aEcuID:string;aDirect:Boolean=False):Boolean;
    function ServerCardNFSearch(aEcuID:string;aDirect:Boolean=False):Boolean;
    function SystemInfoSearch(aEcuID:string;aDirect:Boolean=False):Boolean;
    function SystemDoorArmAreaSearch(aEcuID:string;aDirect:Boolean=False):Boolean;
    function SystemZoneExtensionUseSearch(aEcuID:string;aDirect:Boolean=False):Boolean;
    function SearchRelay2TypeCheck(aEcuID:string;aDirect:Boolean=False):Boolean;
    function SearchDoorTimeCodeUse(aEcuID:string;aDirect:Boolean=False):Boolean;
    function SearchTimeCode(aEcuID:string;aDirect:Boolean=False):Boolean;
    function CheckJaejungDelayUse(aEcuID:string;aDirect:Boolean=False):Boolean;
    function SearchArmDsCheck(aEcuID,aDoorNo:string;aDirect:Boolean=False):Boolean;
    function SearchArmRelay(aEcuID:string;aDirect:Boolean=False):Boolean;
    function SearchArmAreaUse(aEcuID:string;aDirect:Boolean=False):Boolean;
    function SearchDoorArmArea(aEcuID:string;aDirect:Boolean=False):Boolean;
    function SearchJavaraArmClose(aEcuID:string;aDirect:Boolean=False):Boolean;
    function SearchJavaraAutoClose(aEcuID:string;aDirect:Boolean=False):Boolean;
    function SearchJavaraStopTime(aEcuID:string;aDirect:Boolean=False):Boolean;
    function CurrentAlarmStateSearch(aEcuID:string;aDirect:Boolean=False):Boolean;
    function DoorSystemInfoSearch(aEcuID,aDoorNo:string;aDirect:Boolean=False):Boolean;
    function DoorDSCheckTimeSearch(aEcuID,aDoorNo:string;aDirect:Boolean=False):Boolean;
    function DoorLockDeviceStateCheck:Boolean;
    function ZoneSensState_Check:Boolean;
    function CardReaderTypeSearch(aDirect:Boolean=False):Boolean;
    function CardReaderSoundUseCheck(aDirect:Boolean=False):Boolean;
    function CardReaderExitSoundUseCheck(aDirect:Boolean=False):Boolean;
    function AllCardReaderCheck(aMaxReaderNo:integer;aDirect:Boolean=False):Boolean;
    function CardReaderInfoSearch(aEcuID:string;nCardReaderNo:integer;aDirect:Boolean=False):Boolean;
    function CardReaderVersionCheck(aEcuID:string;nCardReaderNo:integer):Boolean;
    function AllPortCheck(aZoneExtNo:integer;aDirect:Boolean=False):Boolean;
    function AllZoneExtensionCheck(aZoneExtNo:integer;aDirect:Boolean=False):Boolean;
    function PortInfoSearch(aEcuID:string;nPortNo:integer;aDirect:Boolean=False):Boolean;
    function PortStateCheck(aEcuID:string):Boolean;
    function ZoneExtentionPortStateCheck(aEcuID:string):Boolean;
    function AlartLampSirenStateCheck(aEcuID:string;aDirect:Boolean=False):Boolean;
    function AlertLampTimeCheck(aEcuID:string;aDirect:Boolean=False):Boolean;
    function AlertSirenTimeCheck(aEcuID:string;aDirect:Boolean=False):Boolean;
    function ZoneExtensionSearch(aEcuID:string;aZoneExtNo:integer;aDirect:Boolean=False):Boolean;
    function CardReaderCallTimeSearch(aDirect:Boolean=False):Boolean;
    function CardReaderTellNoCheck(aDirect:Boolean=False):Boolean;
    function CardReaderTelNumberSearch(aEcuID:string;nTelNo:integer;aDirect:Boolean=False):Boolean;
    function PoliceTel_Check(aTelNo:integer):Boolean;

    function EcuStatusCheck:Boolean;
    function cdmaUseSearch(aEcuID:string):Boolean;
    function cdmaSetDataSearch(aEcuID:string):Boolean;
    function DVRUseSearch(aEcuID:string):Boolean;
    function DVRSetDataSearch(aEcuID:string):Boolean;

  public
    { Public declarations }
    procedure ECUConnected(aEcuID:string;aValue:Boolean);
    procedure RecvDeviceVersion(aEcuID,aDeviceVersion:string);
    procedure RecvDeviceType(aDeviceType:string);
    procedure RecvDeviceCode(aECUID,aDeviceCode:string);
    procedure RecvControllerID(aDeviceID:string);
    procedure RecvDeviceUsedSetting(aDeviceUsed:string);
    procedure RecvSystemInfoData(aECUID,aPowerWatch,aOutDelay,
                       aDoor1Type,aDoor2Type,aLocate,aInDelay,aLockExtend:string);
    procedure RecvAlarmEvent(aECUID,aTime,aSubCLass,aSubAddr,aZone,
                          aMode,aStatus,aLoop,aState,aOper:string);
    procedure RecvDoorSettingEvent(aECUID,aDoorNo,aCardMode,aDoorMode,
                          aDoorControlTime,aLongDoorOpenTime,aSchedule,aDoorState,
                          aNetFailRun,aAntiPass,aLongDoorOpenUse,aNetFailAlarm,
                          aDoorLockType,aFireDoorControl,aLockState,aDoorOpenState,
                          aRemoteDoorOpen:string);
    procedure RecvDeviceStateData(aECUID,aCmd,aData:string);
    procedure RecvCardReaderType(aECUID, aCardReaderType:string);
    procedure RecvCardReaderSoundSetting(aECUID, aData:string);
    procedure RecvCardReaderExitSoundSetting(aECUID, aData:string);
    procedure RecvCardReaderSetData(aECUID,aReaderNo,aUsedCR,
                       aCRPosition,aDoorNo,aReaderArmArea,aLocate,aBuildingPosi:string);
    procedure RecvCardReaderVersion(aECUID,aCardReaderNo, aCardReaderVersion:string);
    procedure RecvDoorState(aECUID, aDoorNo, aCardMode,aDoorMode, aDoorState,aDoorSchedule:string);
    procedure RecvPortSettingData(aECUID, aPort,aWatchType, aAlarmType, aRecoverType,
                          aDelayTimeType, aPortLocate,aDetectTime,aZoneArmArea,aZoneUse:string);
    procedure RecvWiznetInfo(aECUID, aHeader,aMacAddress, aMode, aIPAddress, aSubnet,
        aGateway, aClientPort,aServerIP, aServerPort, aSerial_Baud, aSerial_data,
        aSerial_Parity,aSerial_stop, aSerial_flow, aDelimiterChar, aDelimiterSize,
        aDelimitertime, aDelimiterIdle, aDebugMode, aROMVer, aOnDHCP,aReserve:string);
    procedure RecvEcuStateData(aECUID, aData:string);
    procedure RecvDeviceTime(aECUID,aTime:string);
    procedure KTTSystemIDData(aECUID,aData:string);
    procedure KTTTelNumberData(aECUID,aNo,aTelNum:string);
    procedure KTTRingCountData(aECUID,aArmRingCount,aDisArmRingCount:string);
    procedure DeviceTypeChange(aEcuID,aDeviceType:string);
    procedure CurrentDeviceTypeChange(aEcuID:string);
    procedure Relay2TypeCheckData(aEcuID,aCmd,aRelay2Type:string);
    procedure ArmDsCheckData(aECUID,aDoorNo,aArmCheck:string);
    procedure ArmRelayCheckData(aECUID,aArmRelay:string);
    procedure ArmAreaUseData(aECUID,aArmUse:string);
    procedure LampSirenOnOff(aECUID, stLampOnOff,aSirenOnOff:string);
    procedure LampTimeSetData(aECUID, aLampTime:string);
    procedure SirenTimeSetData(aECUID, aSirenTime:string);
    procedure CDMASetting(aEcuID,aData:string);
    procedure CDMAInfoSetting(aEcuID,aCdmaMin,aCdmaMux,aCdmaIP,aCdmaPort,aCdmachktime,aCdmarssi:string);
    procedure DVRUseSetting(aEcuID,aData:string);
    procedure DVRInfoSetting(aEcuID,aDvrIP,aDvrPort:string);
    procedure CurrentCDMAUseChange(aEcuID:string;aUsed:Boolean);
    procedure CurrentDVRUseChange(aEcuID:string;aUsed:Boolean);
    procedure CurrentScheduleUseChange(aEcuID:string;aUsed:Boolean);  
    procedure CurrentCARDREADERTELUseChange(aEcuID:string;aUsed:Boolean);
    procedure CARDREADERTelNumberData(aECUID,aNo,aTelNum:string);
    procedure CARDREADERCallTimData(aECUID,aCallTime:string);
    procedure CurrentCardTypeChange(aEcuID,aCardType:string);
    procedure ArmExtensionChange(aEcuID:string;aValue:Boolean);
    procedure MaxECUCountChange(aEcuID,aValue:string);
    procedure RecvArmExtension(aECUID,aExtensionGubun,aData:string;aEvent:Boolean);
    procedure DoorDSCheckTimeUseChange(aEcuID:string;aValue:Boolean);
    procedure DoorArmDSCheckUseChange(aEcuID:string;aValue:Boolean);
    procedure DoorLockExtensionUseChange(aEcuID:string;aValue:Boolean);
    procedure ArmAreaSkillChange(aEcuID:string;aValue:Boolean);
    procedure ArmAreaUseChange(aEcuID:string;aValue,aChange:Boolean);
    procedure RecvDoorArmAreaData(aECUID,aDoorNo,aArmArea:string);
    procedure RcvZoneExtensionPortInfoData(aECUID,aZoneExtNo,aZoneExtUse:string;arrZoneState,arrZoneType,arrZoneArmArea,arrZoneRecover,arrZoneUsed:array of string);
    procedure ZoneExtensionSkillChange(aEcuID:string;aValue:Boolean);
    procedure RecvDoorDSCheckUse(aECUID,aDoorNo,aDSCheckUse:string);
    procedure RecvDoorDSCheckTime(aECUID,aDoorNo,aDSCheckTimeSec:string);
    procedure RecvZoneExtensionUseData(aECUID,aData:string);
    procedure RecvMemoryClearControl(aECUID,aData:string);
    procedure RecvFireRecovery(aECUID,aData:string);
    procedure RecvDeviceResetData(aECUID:string);
    procedure RecvLineShortCheck(aECUID, aData:string);
    procedure RcvJaejungDelayUse(aECUID,aData:string);
    procedure RcvJavaraArmClose(aECUID,aDoorNo,aData:string);
    procedure RcvJavaraAutoClose(aECUID,aDoorNo,aData:string);
    procedure RcvJavaraStopTime(aECUID,aCmd,aData:string);
    procedure CurrentDeviceCodeChange(aEcuID,aDeviceCode:string);
    procedure PortZoneUseSkillChange(aEcuID:string;aValue:Boolean);
    procedure PortZoneUseRemoteControlSkill(aEcuID:string;aValue:Boolean);
    procedure PoliceDeviceTypeChange(aEcuID:string;aValue:Boolean);
    procedure RecvZoneUseRemoteControl(aECUID, aData:string);
    procedure JavaraScheduleSkillChange(aEcuID,aNo:string;aValue:Boolean);
    procedure RcvPrimaryKTTType(aECUID,aCmd,aData:string);
    procedure RcvKTTMuxID(aECUID,aCmd,aData:string);
    procedure RcvDDNSQueryServer(aECUID,aCmd,aData:string);
    procedure RcvDDNSServer(aECUID,aCmd,aData:string);
    procedure RcvEventServer(aECUID,aCmd,aData:string);
    procedure RcvTCPServerPort(aECUID,aCmd,aData:string);
    procedure RcvServerCardNF(aECUID,aCmd,aData:string);
    procedure RecvLineCheckStart(aECUID, aData:string);
    procedure RcvPoliceTelNum(aECUID:string;aTelNo:integer;aSoundNo,aStartDelay,
    aSendTime,aSendCount:string;aSpeak,aCountTime,aDTMFStart,aDTMFEnd:integer;aTelNum:string);
    procedure RcvDoorTimeCodeUse(aECUID,aVer,aData:string);
    procedure RcvTimeCode(aECUID,aGroup,aData:string);
  public
    //이벤트 발생처리
    procedure DoorUseChange(aEcuID,aDoorNo:string;aUse:Boolean);
    procedure ZoneExtensionUseChange(aEcuID,aZoneExtendNo:string;aUse:Boolean); //존확장기 사용유무에 따른 Form Change
    procedure DoorPossibilityChange(aEcuID,aDoorNO:string;aPossibility:Boolean); //출입문 사용 가능 이벤트
  public
    procedure DeviceLoad(aIndex:integer=-1);
    procedure DeviceRefresh;
    procedure NodeReaderAdd(aEcuID:string;aNode:TTreeNode;aDoorNo:string;aExtended:Boolean=False);
    procedure CurrentDeviceView(aExtended:Boolean=False);
    procedure CurrentDeviceConnected(aEcuID:string;aConnected:Boolean);
    procedure CurrentDeviceAlarmModeChange(aEcuID:string;aChange:Boolean);
    procedure CurrentDeviceDoorStateChange(aEcuID,aDoorNo:string);
    procedure CurrentDeviceReaderConnectChange(aEcuID,aReaderNo:string;aConnected:Boolean);
    procedure McuSettingEcuLoad(aColor:TColor = clWhite);
    procedure ZoneExtensionConnectChange(aEcuID,aNo:string;aConnected:Boolean);
  private
    //화면 조회 프로세스
    procedure DoorLockState(aData:string); //출입문 락 상태
    procedure DeviceAlarmState(aData:string); //기기의 이상 알람 상태 체크(화재/침입/비상등)
    procedure Port_ShortOpenCheck(aData:string);
    procedure ZoneExtentionPort_ShortOpenCheck(aData:string);
    procedure InsertFireDevice(aEcuID:string);
    procedure DeleteFireDevice(aEcuID:string);
  private
    //조회 등록 할때 변경값 변경하지 못하도록 처리
    procedure MCUControlEnable(aValue:Boolean);
    procedure ArmExtensionEnable(aValue:Boolean);
    procedure SystemControlEnable(aValue:Boolean);
    procedure SystemDoorArmAreaEnable(aValue:Boolean);
    procedure SystemZoneExtensionEnable(aValue:Boolean);
    procedure LockControlEnable(aDoorNo:string;aValue:Boolean);
    procedure Door1Enable(aValue:Boolean);
    procedure Door2Enable(aValue:Boolean);
    procedure ReaderControlEnable(aValue:Boolean);
    procedure ZoneControlEnable(aValue:Boolean);
    procedure ReaderDoorNoMinValueSetting(aValue:integer);
    procedure ReaderDoorNoMaxValueSetting(aValue:integer);
    procedure ReaderDoorNoEnable(aValue:Boolean);
    procedure CardReaderTelEnable(aValue:Boolean);
  private
    L_bEcuRegist : Boolean;
    procedure EcuRegist(aUsed:Boolean);
    procedure SearchArmAreaSetting; //구역경계현황조회
    procedure ShowGrid(aCol,aRow,aData:integer;aVisible:Boolean);
  published
    property SocketConnected : Boolean read FSocketConnected write SetSocketConnected;
    property DeviceType : string read FDeviceType write setDeviceType;
    property MaxEcuCount : integer read FMaxEcuCount write SetMaxEcuCount;
  public
    L_bTcpIpDetailShow : Boolean;
  end;

var
  fmCurrentDeviceSetting: TfmCurrentDeviceSetting;

implementation
uses
  dllFunction,
  udmDataBase,
  uUtil,
  uSocket,
  uCheckValiable,
  uCopy,
  dbisamtb,
  uCommon,
  Math,
  uTCPIPDetail,
  uDescript;
  
{$R *.dfm}
procedure TfmCurrentDeviceSetting.DeviceLoad(aIndex:integer=-1);
var
  alist: TListItem;
begin
  Try
    L_bDeviceUsedChange := True;

    lvECU.Clear;

    with dmDataBase.TB_DEVICE do
    begin
      First;
      while Not Eof do
      begin
        if FindField('DEVICEUSE').AsString = 'Y' then
        begin
          G_stDeviceType[strtoint(FindField('ECU_ID').AsString)] := FindField('DEVICE_TYPE').AsString;
          if FindField('ECU_ID').AsString <> '00' then
          begin
            aList:= lvECU.Items.Add;
            aList.Caption:= FindField('ECU_ID').AsString; //기기 번호
            aList.ImageIndex:= -1;
            aList.SubItems.Add(DeviceTypeNameList.Strings[strtoint(FindField('DEVICE_TYPE').AsString)]);
          end;
          if aIndex > -1 then
          begin
            if lvECU.Items.Count - 1 = aIndex then
            begin
              lvECU.Items[aIndex].Selected:= True;
            end;
          end;
        end else
        begin
        end;
        Next;
      end;
    end;
  Finally
    L_bDeviceUsedChange := False;
  End;
  TableToFormSetting(G_stSelectEcuID);
  TableToFormColorSetting(G_stSelectEcuID);
  self.FindSubForm('Main').FindCommand('SettingChange').Params.Values['VALUE'] := 'DeviceChange';
  self.FindSubForm('Main').FindCommand('SettingChange').Execute;

end;

procedure TfmCurrentDeviceSetting.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'DEVICE';
  self.FindSubForm('Main').FindCommand('SOCKET').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('SOCKET').Execute;

  MaxEcuCount := G_nMaxEcuCount;

  cmb_SearchType.ItemIndex := G_nSearchType;
  G_stSelectEcuID := '';
  L_bDeviceUsedChange := False;
  L_bDoorSystemChange := False;
  L_bDeviceLoad := False;
  L_bDeviceLoadTime := False;
  
  ZoneStatusLoad;
  ZoneWatchDelayLoad;
  ZoneRecoverLoad;
  ZoneStateLoad;
  cmbEcuTypeLoad;

  FormSetting;
  CurrentDeviceView;
  DeviceLoad;
  L_nOldPageIndex := 0;
  L_bSettingChanged := False;
  L_bTableLoading := False;
  pg_DeviceSetting.ActivePage := TabMCSetting;
  TabArmExtension.TabVisible := False;

  L_cRegColor := $008080FF;
  L_cSearchColor := $0080FF80;
  btn_Registration.Color := L_cRegColor;
  btn_UseControlerSearch.Color := L_cSearchColor;
  
end;

procedure TfmCurrentDeviceSetting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  L_bFormActive := False;
  self.FindSubForm('Main').FindCommand('DEVICESETTING').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('DEVICESETTING').Execute;

  ZoneStateNameList.Free;
  ZoneStateCodeList.Free;

  Action := caFree;
end;


procedure TfmCurrentDeviceSetting.FormShow(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('DEVICESETTING').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('DEVICESETTING').Execute;

//  windowState := wsMaximized;
  
end;

procedure TfmCurrentDeviceSetting.ECUConnected(aEcuID: string; aValue: Boolean);
var
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
  i : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  if TreeView_Device.Items.Count < 1 then Exit;

  aTreeView := TreeView_Device;

  aNode:= GetNodeByText(aTreeView,aEcuID ,False);
  if aNode = nil then Exit;

  if aValue then
  begin
    if aNode.ImageIndex <> 1 then
    begin
      aNode.ImageIndex:=1;
      aNode.SelectedIndex:=1;
    end;
  end else
  begin
    if aNode.ImageIndex <> 2 then
    begin
      aNode.ImageIndex:=2;
      aNode.SelectedIndex:=2;
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.TreeView_DeviceClick(Sender: TObject);
var
  stCaption : string;
  nIndex : integer;
begin
  TreeView_Device.PopupMenu := nil;
  if TreeView_Device.Selected = nil then TreeView_Device.Items[1].Selected := True;
  stCaption := TreeView_Device.Selected.Text;

  nIndex := DeviceList.IndexOf(copy(stCaption,1,2));
  if nIndex < 0 then
  begin
    TreeView_Device.Selected := TreeView_Device.Items[1];
    stCaption := TreeView_Device.Selected.Text;
    nIndex := DeviceList.IndexOf(copy(stCaption,1,2));
    //Exit;
  end;

  TreeView_Device.PopupMenu := Popup_Device;
  if Pos('방범',stCaption) > 0 then PopupMenuAlarmSet
  else if Pos('출입문',stCaption) > 0 then PopupMenuDoorSet
  else if Pos('카드리더',stCaption) > 0 then PopupMenuReaderSet
  else PopupMenuDeviceSet;

  //if G_stSelectEcuID = copy(stCaption,1,2) then Exit;

  G_stSelectEcuID := copy(stCaption,1,2);

  FormDeviceSetting(G_stSelectEcuID);
  if IsDigit(G_stSelectEcuID) then
  begin
    if nIndex > -1 then
    begin
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceCode <> '' then
       G_stDeviceType[strtoint(G_stSelectEcuID)]:= TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType;
    end;
    DeviceType := G_stDeviceType[strtoint(G_stSelectEcuID)];   //FormSetting
  end;

  if (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = ACC100) or (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = SGS100) then CardReaderTypeLoad(1)
  else CardReaderTypeLoad(0);

  TableToFormSetting(G_stSelectEcuID);
  TableToFormColorSetting(G_stSelectEcuID);

  st_EcuID.Caption := G_stSelectEcuID;
  if G_stSelectEcuID = '00' then
  begin
    TabMCSetting.TabVisible := True;
    tabEtcState.TabVisible := True;
    //pg_DeviceSetting.ActivePageIndex := 0;
  end else
  begin
    TabMCSetting.TabVisible := False;
    tabEtcState.TabVisible := False;
    //pg_DeviceSetting.ActivePageIndex := 1;
  end;
  Form_ECUChange_Initialize;
  DeviceCodeCheck(G_stSelectEcuID);
  DeviceVersionCheck(G_stSelectEcuID);
  pg_DeviceSettingChange(self);
end;

procedure TfmCurrentDeviceSetting.FormSetting;
var
  i,j,k : integer;
  oComboBox : TComboBox;
begin
  ed_mcid.MaxLength := G_nIDLength;
  //ed_mcid.Text := FillZeroNumber(0,G_nIDLength);
  ed_mcid.Text := dmSocket.DeviceID;

  if G_nConnectMode = 0 then rg_LanSet.Enabled := False
  else rg_LanSet.Enabled := True;


  with ComboBox_WatchPowerOff do //정전감시
  begin
    Clear;
    Items.Add('정전 감시 OFF');
    Items.Add('정전 감시 ON');
    ItemIndex := 1;
  end;

  for i := 1 to FIXMAXDOORNO do
  begin
    oComboBox := TravelComboBoxItem(gb_SystemInfo,'ComboBox_DoorType',i);
    if oComboBox <> nil then
    begin
      with oComboBox do //문 용도
      begin
        Clear;
        Items.Add('0.방범전용');
        Items.Add('1.출입전용');
        Items.Add('2.방범 + 출입');
        ItemIndex := 2;
      end;
    end;
    if i < 3 then
       oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_CardModeType',i)
    else oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_CardModeType',i);
    if oComboBox <> nil then
    begin
      with oComboBox do //출입문 카드운영 모드
      begin
        Clear;
        Items.Add('Positive');
        Items.Add('Negative');
        Items.Add('Positive-ACK');
        Items.Add('Negative-ACK');
        Items.Add('Positive-NAK');
        ItemIndex := 0;
      end;
    end;
    if i < 3 then
       oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_DoorModeType',i)
    else oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_DoorModeType',i);
    if oComboBox <> nil then
    begin
      with oComboBox do //출입문 운영 모드
      begin
        Clear;
        Items.Add('운영모드');
        Items.Add('개방모드');
        Items.Add('폐쇄모드');
        Items.Add('마스터모드');
        ItemIndex := 0;
      end;
    end;
    if i < 3 then
       oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_UseSch',i)
    else oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_UseSch',i);
    if oComboBox <> nil then
    begin
      with oComboBox do //출입문 스케쥴
      begin
        Clear;
        Items.Add('안함');
        Items.Add('적용');
        ItemIndex := 0;
      end;
    end;
    if i < 3 then
       oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_SendDoorStatus',i)
    else oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_SendDoorStatus',i);
    if oComboBox <> nil then
    begin
      with oComboBox do //출입문 상태 전송여부
      begin
        Clear;
        Items.Add('사용안함');
        Items.Add('출입문상태');
        Items.Add('도어락상태');
        Items.Add('출입문+도어락상태');
        ItemIndex := 1;
      end;
    end;
    if i < 3 then
       oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_AlarmLongOpen',i)
    else oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_AlarmLongOpen',i);
    if oComboBox <> nil then
    begin
      with oComboBox do //출입문 장시간 열림 부저 출력
      begin
        Clear;
        Items.Add('안함');
        Items.Add('사용');
        ItemIndex := 0;
      end;
    end;
    if i < 3 then
       oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType',i)
    else oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_LockType',i);
    if oComboBox <> nil then
    begin
      with oComboBox do //출입문 전기정 타입
      begin
        Clear;
        Items.Add('EM락(정전시 잠김)');
        Items.Add('EM락(정전시 열림)');
        Items.Add('데드볼트(정전시 잠김)');
        Items.Add('데드볼트(정전시 열림)');
        Items.Add('스트라이크(정전시 잠김)');
        Items.Add('스트라이크(정전시 열림)');
    //    Items.Add('0x36 예비');
        Items.Add('자동문/주차');
    //    Items.Add('0x37 식당');
        Items.Add('식당(부져/램프제어)');
        Items.Add('SPEED GATE');
        Items.Add('===========');
        Items.Add('자바라-열림');
        Items.Add('자바라-닫힘');
        Items.Add('디지털도어락'); //운영 개방 없음
        ItemIndex := 1;
      end;
    end;
    oComboBox := TravelComboBoxItem(gb_LoackState,'ComboBox_LockType2',i);
    if oComboBox <> nil then
    begin
      with oComboBox do //출입문 전기정 타입
      begin
        Clear;
        Items.Add('EM(잠김)');
        Items.Add('EM(열림)');
        Items.Add('데드(잠김)');
        Items.Add('데드(열림)');
        Items.Add('ST(잠김)');
        Items.Add('ST(열림)');
    //    Items.Add('0x36 예비');
        Items.Add('자동문/주차');
    //    Items.Add('0x37 식당');
        Items.Add('식당(부져/램프제어)');
        Items.Add('SPEED GATE');
        Items.Add('===========');
        Items.Add('자바라열림');
        Items.Add('자바라닫힘');
        Items.Add('디지털도어락'); //운영 개방 없음
        ItemIndex := 1;
      end;
    end;
    if i < 3 then
       oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_ControlFire',i)
    else oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_ControlFire',i);
    if oComboBox <> nil then
    begin
      with oComboBox do //출입문 화재 발생시 문제어
      begin
        Clear;
        Items.Add('안함');
        Items.Add('사용');
        ItemIndex := 0;
      end;
    end;
  end;

  //gb_DoorAlarmArea 출입문 방범 구역 부분 컴보박스 설정
  for i := 1 to FIXMAXDOORNO do
  begin
    oComboBox := TravelComboBoxItem(gb_DoorAlarmArea,'cmbDoorAlarmArea',i);
    if oComboBox = nil then break;
    oComboBox.Clear;
    for j := 1 to FIXARMAREANO do
    begin
      oComboBox.Items.Add('구역' + inttostr(j));
    end;
    oComboBox.ItemIndex := 0;
  end;

  for i := 0 to FIXMAXZONEEXTENDNO do //존확장기 최대 갯수
  begin
    for j := 1 to FIXMAXZONENO do
    begin
      oComboBox := GetPortComboBox(i,j,'cmb_PortAlarmArea');
      if oComboBox = nil then break;
      oComboBox.Clear;
      for k := 1 to FIXARMAREANO do
      begin
        oComboBox.Items.Add('구역' + inttostr(k));
      end;
      oComboBox.ItemIndex := 0;
    end;
  end;

  for i := 0 to FIXMAXZONEEXTENDNO do //존확장기 최대 갯수
  begin
    for j := 1 to FIXMAXZONENO do
    begin
      oComboBox := GetPortComboBox(i,j,'cmb_ZonUse');
      if oComboBox = nil then break;
      oComboBox.Clear;
      oComboBox.Items.Add('사용');
      oComboBox.Items.Add('미사용');
      oComboBox.ItemIndex := 0;
    end;
  end;

  //카드리더 방범 구역 부분 컴보박스 설정
  for i := 1 to FIXMAXREADERNO do
  begin
    oComboBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',i);
    if oComboBox = nil then break;
    oComboBox.Clear;
    for j := 1 to FIXARMAREANO do
    begin
      oComboBox.Items.Add('구역' + inttostr(j));
    end;
    oComboBox.ItemIndex := 0;
  end;

end;

procedure TfmCurrentDeviceSetting.pg_DeviceSettingChange(Sender: TObject);
var
  nIndex : integer;
  i : integer;
  stEcuID : string;
begin
  if L_bSettingChanged then
  begin
    if Application.MessageBox(pchar('변경된 사항을 등록하지 않으셨습니다. 계속 진행하시겠습니까?'),'주의',MB_OKCANCEL) = ID_CANCEL then
    begin
      pg_DeviceSetting.ActivePageIndex := L_nOldPageIndex;
      if TPageControl(Sender) = pg_PortSetting then
      begin
        pg_PortSetting.ActivePageIndex := L_nOldSubPageIndex;
      end;
      Exit;
    end;
    L_bSettingChanged := False;
  end;
  Try
    Screen.Cursor := crHourGlass;
    btn_UseControlerSearch.Enabled := False;
    btn_Registration.Enabled := False;
    btn_Next.Enabled := False;
    pg_DeviceSetting.Enabled := False;
    btn_DeviceCopy.Enabled := False;

    L_nOldPageIndex := pg_DeviceSetting.ActivePageIndex;
    if TPageControl(Sender) = pg_PortSetting then
    begin
      L_nOldSubPageIndex := pg_PortSetting.ActivePageIndex;
    end;

    nIndex := DeviceList.IndexOf(G_stSelectEcuID);
    if nIndex < 0 then Exit;

    if pg_DeviceSetting.ActivePage = TabMCSetting then
    begin
      //Form_MCUSetting_Initialize;
      if G_bDeviceSearch then MCUSettingSearch;
    end else if pg_DeviceSetting.ActivePage = TabArmExtension then
    begin
      for i := 0 to FIXMAXECUNO do
      begin
        if G_bApplicationTerminate then Exit;
        stEcuID := FillZeroNumber(i,2);
        if dmDataBase.GetTB_DEVICE_Value(stEcuID,'DEVICEUSE') = 'N' then continue;  //미사용컨트롤러면 조회 할 필요 없음
        if Not dmSocket.DeviceConnectCheck(stEcuID) then continue;
        if dmDataBase.GetTB_DEVICERCV_Value(stEcuID,'ArmAreaUse') = 'Y' then continue;
        SearchArmAreaUse(stEcuID,True);
      end;
      if G_bDeviceSearch then ArmExtensionSearch;
    end else if pg_DeviceSetting.ActivePage = TabSystemInfo then
    begin
      //Form_SystemInfo_Initialize;
      ArmExtensionSearch;
      if G_bDeviceSearch then
      begin
        if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT812 then
        begin
          SearchRelay2TypeCheck(G_stSelectEcuID);
          CheckJaejungDelayUse(G_stSelectEcuID);
        end;
        SystemInfoSearch(G_stSelectEcuID);
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill then //구역경계기능
          SystemDoorArmAreaSearch(G_stSelectEcuID);
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then //존확장 기능
          SystemZoneExtensionUseSearch(G_stSelectEcuID);
        ServerCardNFSearch(G_stSelectEcuID);
        //CurrentAlarmStateSearch;  --현재 방벙상태는 체크하지 말자
      end;
    end else if pg_DeviceSetting.ActivePage = tab_DoorLock then
    begin
      //Form_DoorSystemInfo_Initialize;
      if G_bDeviceSearch then
      begin
        SystemInfoSearch(G_stSelectEcuID);
        if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT812 then
          SearchRelay2TypeCheck(G_stSelectEcuID);

        if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then //존확장 기능
          SystemZoneExtensionUseSearch(G_stSelectEcuID);

        if pgDoorLockSetting.ActivePage = tabLock_Controler then
        begin
          if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo > 0 then
          begin
             DoorSystemInfoSearch(G_stSelectEcuID,'1');
             DoorDSCheckTimeSearch(G_stSelectEcuID,'1');
             if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT812 then
                SearchArmDsCheck(G_stSelectEcuID,'1');
             if TCurrentDeviceState(DeviceList.Objects[nIndex]).JavaraScheduleSkill then SearchJavaraArmClose(G_stSelectEcuID);
             if TCurrentDeviceState(DeviceList.Objects[nIndex]).JavaraScheduleSkill then SearchJavaraAutoClose(G_stSelectEcuID);
             //if TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType = KT811 then
             if TCurrentDeviceState(DeviceList.Objects[nIndex]).JavaraScheduleSkill then
             begin
              SearchJavaraStopTime(G_stSelectEcuID);
             end;
          end;
          if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo > 1 then
          begin
            if (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812) and
               (TCurrentDeviceState(DeviceList.Objects[nIndex]).RELAY2TYPE = 0) then Exit; //락 2에서는 조회 하지 말자.
             DoorSystemInfoSearch(G_stSelectEcuID,'2');
             DoorDSCheckTimeSearch(G_stSelectEcuID,'2');
             if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT812 then
                SearchArmDsCheck(G_stSelectEcuID,'2');
          end;
        end else if pgDoorLockSetting.ActivePage = tabLockExtention then
        begin
          if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo < 3 then Exit;
          for i := 3 to TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo do
          begin
            DoorSystemInfoSearch(G_stSelectEcuID,inttostr(i));
            DoorDSCheckTimeSearch(G_stSelectEcuID,inttostr(i));
            if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT812 then
                SearchArmDsCheck(G_stSelectEcuID,inttostr(i));
          end;
        end;
      end;
    end else if pg_DeviceSetting.ActivePage = tab_TimeCode then
    begin
      if G_bDeviceSearch then
      begin
        FormTimeCodeSetting(G_stSelectEcuID,true);
        if (G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT811) OR (G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT813) OR (G_stDeviceType[strtoint(G_stSelectEcuID)] = SGS100) then
        begin
          SearchDoorTimeCodeUse(G_stSelectEcuID);
          SearchTimeCode(G_stSelectEcuID);
        end;
      end;
    end else if pg_DeviceSetting.ActivePage = tab_CardReader then
    begin
      //Form_CardReader_Initialize;
      if G_bDeviceSearch then
      begin
        if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT812 then
        begin
          SearchRelay2TypeCheck(G_stSelectEcuID);
          CheckJaejungDelayUse(G_stSelectEcuID);
        end;
        SystemInfoSearch(G_stSelectEcuID);
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill then //구역경계기능
          SystemDoorArmAreaSearch(G_stSelectEcuID);
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then //존확장 기능
          SystemZoneExtensionUseSearch(G_stSelectEcuID);
        
        FormDeviceSetting(G_stSelectEcuID,true);
        //==> 시스템정보 먼저 조회 후 조회
        ReaderControlEnable(False);
        CardReaderTypeSearch;
        CardReaderSoundUseCheck(False);
        CardReaderExitSoundUseCheck(False);
        AllCardReaderCheck(TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxReaderNo);
        ReaderControlEnable(True);
      end;
    end else if pg_DeviceSetting.ActivePage = Tab_Port then
    begin
      //Form_Port_Initialize;
      if G_bDeviceSearch then
      begin
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then //존확장 기능
          SystemZoneExtensionUseSearch(G_stSelectEcuID);
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
          SearchRelay2TypeCheck(G_stSelectEcuID);

        SystemInfoSearch(G_stSelectEcuID);
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill then //구역경계기능
          SystemDoorArmAreaSearch(G_stSelectEcuID);

        if pg_PortSetting.ActivePage = tab_LocalPort then AllPortCheck(0)
        else
        begin
          if pg_ExtensionPort.ActivePage <> nil then
            AllZoneExtensionCheck((pg_ExtensionPort.ActivePage).Tag);
        end;
      end;
    end else if pg_DeviceSetting.ActivePage = Tab_CardReaderTel then
    begin
      //Form_AllCardReaderTel_ColorInitialize;
      if G_bDeviceSearch then
      begin
        CardReaderCallTimeSearch(True);
        CardReaderTellNoCheck;
      end;
    end else if pg_DeviceSetting.ActivePage = tabArmAreaSearch then
    begin
      if G_bDeviceSearch then SearchArmAreaSetting;
    end else if pg_DeviceSetting.ActivePage = tabDeviceState then
    begin

      if G_bDeviceSearch then
      begin
        if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT812 then
          SearchRelay2TypeCheck(G_stSelectEcuID);

        SystemInfoSearch(G_stSelectEcuID);
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill then //구역경계기능
          SystemDoorArmAreaSearch(G_stSelectEcuID);

        if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then //존확장 기능
          SystemZoneExtensionUseSearch(G_stSelectEcuID);

        if pg_DeviceState.ActivePage = tabLockState then
        begin
          for i := 1 to FIXMAXDOORNO do
          begin
            if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(i) then   //락타입 조회
               DoorSystemInfoSearch(G_stSelectEcuID,inttostr(i));
          end;

          DoorLockDeviceStateCheck;
          ZoneSensState_Check;
          CurrentAlarmStateSearch(G_stSelectEcuID,True);
        end else if pg_DeviceState.ActivePage = tabPortState then
        begin
          PortStateCheck(G_stSelectEcuID);
          if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then
             ZoneExtentionPortStateCheck(G_stSelectEcuID);
        end;
      end;
    end else if pg_DeviceSetting.ActivePage = tab_Police then
    begin
      if G_bDeviceSearch then
      begin
        Form_AllPoliceTel_ColorInitialize;
        PoliceTel_Check(1);
        PoliceTel_Check(2);
      end;
    end else if pg_DeviceSetting.ActivePage = tab_RemoteControl then
    begin

      if G_bDeviceSearch then
      begin
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill then //구역경계기능
          SystemDoorArmAreaSearch(G_stSelectEcuID);
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then //존확장 기능
          SystemZoneExtensionUseSearch(G_stSelectEcuID);
      end;
      if tabControlerAlarm.TabVisible then
        page_RemoteControl.ActivePage := tabControlerAlarm
      else if tabArmAreaControl.TabVisible then
        page_RemoteControl.ActivePage := tabArmAreaControl;
    end;
  Finally
    if Not G_bApplicationTerminate then
    begin
      if L_bFormActive then
      begin
        btn_UseControlerSearch.Enabled := True;
        btn_Registration.Enabled := True;
        if pg_DeviceSetting.ActivePageIndex = pg_DeviceSetting.PageCount - 1 then btn_Next.Enabled := False
        else btn_Next.Enabled := True;
        pg_DeviceSetting.Enabled := True;
        if (pg_DeviceSetting.ActivePage <> TabMCSetting) and
           (pg_DeviceSetting.ActivePage <> TabArmExtension)
        then
           btn_DeviceCopy.Enabled := True;
      end;
      Screen.Cursor := crDefault;
    end;
  End;

//
end;

function TfmCurrentDeviceSetting.DeviceVersionCheck(aEcuID: string): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  Form_DeviceVersion_Clear;
  if Not dmSocket.DeviceConnectCheck(aEcuID) then exit;
  
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '컨트롤러 버젼 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.DeviceVersion_Check(aEcuID,True);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

function TfmCurrentDeviceSetting.MCUSettingSearch(aDirect:Boolean=False): Boolean;
var
  nIndex : integer;
begin
  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then Exit;
  MCUControlEnable(False);
  ControllerIDSearch(aDirect);
  if L_bEcuRegist then
     UsedDeviceSearch(aDirect);
  UsedDeviceTypeSearch(aDirect);
  CheckPrimaryKTT(aDirect);
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType <> AUTOKT811 then CheckKTTMuxID(aDirect);
  KTTSystemIDSearch(aDirect);
  KTTTelNumSearch('0',aDirect);
  KTTTelNumSearch('1',aDirect);
  KTTRingCountSearch(aDirect);
  {if G_nConnectMode = 1 then //시리얼
  begin
    WiznetModuleInfoSearch;
  end; }
  dmSocket.TimeCheck;
//  CCCInfoSearch;
  MCUControlEnable(True);
end;

procedure TfmCurrentDeviceSetting.RecvDeviceVersion(aEcuID,
  aDeviceVersion: string);
var
  TempVer : TStringList;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  Try
    TempVer := TStringList.Create;
    TempVer.Delimiter := ',';
    aDeviceVersion := StringReplace(aDeviceVersion,' ','_',[rfReplaceAll]);
    TempVer.DelimitedText := aDeviceVersion;
    if TempVer.Count > 2 then
    begin
      aDeviceVersion := StringReplace(TempVer.Strings[1],'_',' ',[rfReplaceAll]);
      //ed_DeviceRegInfo.Text := StringReplace(TempVer.Strings[0],'_',' ',[rfReplaceAll]);
      //ed_DeviceDate.Text := StringReplace(TempVer.Strings[2],'_',' ',[rfReplaceAll]);
    end;
  Finally
    TempVer.Free;
  End;
  st_DeviceVer.Caption := aDeviceVersion;
  CardTypeTimer1.Enabled := True;

end;


procedure TfmCurrentDeviceSetting.RecvDeviceType(aDeviceType: string);
var
  i : integer;
  nIndex : integer;
  stDeviceType : string;
begin
  //aDeviceType = '' 인 경우는 확장기 타입 하나만 바뀐 경우 Refresh 용도
  for i:= 0 to lvECU.Items.Count - 1 do
  begin
    if Not isdigit(lvECU.Items[i].Caption) then continue;
    nIndex := strtoint(lvECU.Items[i].Caption);
    stDeviceType := '';
    stDeviceType := DeviceTypeNameList.Strings[strtoint(G_stDeviceType[nIndex])];
    if stDeviceType = '' then stDeviceType := 'Type Checking...';
    lvECU.Items[i].SubItems.Strings[0] := stDeviceType;
  end;

end;

procedure TfmCurrentDeviceSetting.setDeviceType(const Value: string);
begin
  FDeviceType := Value;

//  Exit;
{  ed_mcid.Enabled := False;
  cmb_Relay2Type.Enabled := False;
  cmb_JaejungDelayUse.Enabled := False;
  if DeviceType = KTT811 then KTT811FormSetting
  else if DeviceType = KTT812 then KTT812FormSetting
  else if DeviceType = ICU100 then ICU100FormSetting
  else if DeviceType = ICU200 then ICU200FormSetting
  else KTT811FormSetting;  }
end;


procedure TfmCurrentDeviceSetting.btn_NextClick(Sender: TObject);
var
  i : integer;
begin
  if L_bSettingChanged then
  begin
    if Application.MessageBox(pchar('변경된 사항을 등록하지 않으셨습니다. 계속 진행하시겠습니까?'),'주의',MB_OKCANCEL) = ID_CANCEL then
    begin
      pg_DeviceSetting.ActivePageIndex := L_nOldPageIndex;
      Exit;
    end;
    L_bSettingChanged := False;
  end;
  if (pg_DeviceSetting.ActivePageIndex + 1) > (pg_DeviceSetting.PageCount - 1) then
  begin
    btn_Next.Enabled := False;
    Exit;
  end;
  for i := (pg_DeviceSetting.ActivePageIndex + 1) to (pg_DeviceSetting.PageCount - 1) do
  begin
    if pg_DeviceSetting.Pages[i].TabVisible then
    begin
      pg_DeviceSetting.ActivePageIndex := i;
      if pg_DeviceSetting.ActivePageIndex = pg_DeviceSetting.PageCount - 1 then btn_Next.Enabled := False;
      L_nOldPageIndex := pg_DeviceSetting.ActivePageIndex;
      break;
    end;
    //pg_DeviceSetting.ActivePageIndex := pg_DeviceSetting.ActivePageIndex + 1;
  end;
  pg_DeviceSettingChange(self);
  
end;

function TfmCurrentDeviceSetting.RegistControllerID(
  aControllerID: string): integer;
var
  i : integer;
  bresult : Boolean;
begin
  Form_ControllerID_ColorInitialize;
  
  result := 0;   //포맷에러
  if Length(aControllerID) <> G_nIDLength then Exit;
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '컨트롤러ID 등록중입니다.';
      ProgressBar1.Position := i + 1;
      bresult := dmSocket.ID_Registration(aControllerID);
      if bresult then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

  if bResult then result := 1
  else result := -1;//시간 초과
end;

procedure TfmCurrentDeviceSetting.RecvControllerID(aDeviceID: string);
begin
  ed_mcid.Text := aDeviceID;
  ed_mcid.Color := clYellow;
  L_bSettingChanged := False;
end;

procedure TfmCurrentDeviceSetting.ed_mcidChange(Sender: TObject);
begin
  Form_ControllerID_ColorInitialize;
end;

procedure TfmCurrentDeviceSetting.ed_mcidKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ed_mcid.Color := clWhite;
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'DEVICE_ID',ed_mcid.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'DEVICE_ID','U');
    L_bSettingChanged := True;
  end;
  if G_bRealRegist then RegistControllerID(ed_mcid.Text);
end;

function TfmCurrentDeviceSetting.GetEcu: string;
var
  i : integer;
  aData : String[100];
  aNo : integer;
begin
  aData :='1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
  for I:= 0 to lvECU.Items.Count - 1  do
  begin
    aNo:= StrtoInt(lvECU.Items[I].Caption);
    aData[aNo + 1]:= '1';
  end;
  Result:= aData;

end;

function TfmCurrentDeviceSetting.RegistUsedDevice(aUseEcu: string): Boolean;
var
  i : integer;
begin
  Form_UsedDevice_ColorInitialize;

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '컨트롤러 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.UsedDevice_Registration(aUseEcu);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

procedure TfmCurrentDeviceSetting.RecvDeviceUsedSetting(aDeviceUsed: string);
var
  i : integer;
begin
  if L_bDeviceUsedChange then exit;
  Try
    L_bDeviceUsedChange := True;
    McuSettingEcuLoad(clYellow);
  Finally
    L_bDeviceUsedChange := False;
  End;
  L_bSettingChanged := False;
end;

procedure TfmCurrentDeviceSetting.btn_WizNetSettingClick(Sender: TObject);
var
  bResult : Boolean;
  nLoop : integer;
  aMode : string;
  stIP : string;
  stSubNet : string;
  stGateway : string;
  stServerIP : string;
  stPort : string;
  stServerPort : string;
  stDhcp : string;
begin
  Form_WizenetModule_ColorInitialize;
  if Edit_IP.Text = '' then
  begin
    showmessage('랜 조회 후 Lan 설정 하세요.');
    Exit;
  end;

  if Edit_IP.Text = '' then       Edit_IP.Text :=       '127.0.0.1';
  if Edit_subnet.Text = '' then   Edit_subnet.Text :=   '255.255.255.0';
  if edit_Gateway.Text = '' then  Edit_Gateway.Text :=  '192.168.10.1';
  if ed_Server.Text = '' then    ed_Server.Text := '192.168.10.1';
  if edit_port.Text = '' then     Edit_port.Text :=     '3000';
  if ed_Serverport.Text = ''  then ed_serverport.Text := '3000';
  //Rg_Mode.ItemIndex := 0;
  if rg_mode.ItemIndex = 0 then aMode := '02'
  else aMode := '00';

  stIP := Edit_IP.Text;
  stSubNet := Edit_subnet.Text;
  stGateway := Edit_Gateway.Text;
  stServerIP := ed_Server.Text;
  stPort := Edit_port.Text;
  stServerPort := ed_serverport.Text;

  {Edit_IP.Clear;
  Edit_subnet.Clear;
  edit_Gateway.Clear;
  edit_port.Text := '';
  ed_server.Clear;
  ed_ServerPort.Text := ''; }

// 21.DHCP option (00: DHCP OFF, 01:DHCP ON)
  chk_DHCP.Checked := False;
  if chk_DHCP.Checked then stDhcp := '01'
  else stDhcp := '00';
  
  for nLoop := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    bResult := dmSocket.RegistSerialWritewiznet(stIP,stSubNet,stGateway,stPort,stServerIP,stServerPort,aMode,stDhcp);
    if bResult then break;
  end;
  L_bSettingChanged := False;

end;

function TfmCurrentDeviceSetting.ControllerIDSearch(aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value('00','DEVICE_ID') = 'Y' then Exit;
  end;
  Form_ControllerID_ColorInitialize;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '컨트롤러 ID 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.ID_Check(True);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.UsedDeviceSearch(aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not aDirect then
  begin
    //if dmDataBase.GetTB_DEVICERCV_Value('00','DEVICE_ID') = 'Y' then Exit;
  end;
  Form_UsedDevice_ColorInitialize;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '사용 컨트롤러 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.UsedDevice_Check(True);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.Group_DeviceClick(Sender: TObject);
//var
//  stUseEcu : string;
begin
{  Form_UsedDevice_ColorInitialize;
  stUseEcu := GetEcu;
  if G_bRealRegist then RegistUsedDevice(stUseEcu);
}

end;

function TfmCurrentDeviceSetting.SystemInfoSearch(aEcuID:string;aDirect:Boolean=False): Boolean;
var
  i : integer;
  nIndex : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not dmSocket.DeviceConnectCheck(aEcuID) then exit;

  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  //if G_stDeviceType[strtoint(aEcuID)] <> KTT811 then
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType <> AUTOKT811 then SearchArmRelay(aEcuID,aDirect);

  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'WATCH_POWER') = 'Y' then Exit;
  end;
  Form_SystemInfo_ColorInitialize;
  SystemControlEnable(False);

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '시스템정보 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.SysInfo_Check(aEcuID,True);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

  SystemControlEnable(True);
end;

procedure TfmCurrentDeviceSetting.RecvSystemInfoData(aECUID,
  aPowerWatch, aOutDelay, aDoor1Type, aDoor2Type, aLocate,
  aInDelay,aLockExtend: string);
var
  cmb_Box : TComboBox;
  i,j : integer;
  nReaderDoorNo : integer;
  nIndex : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  nIndex := DeviceList.IndexOf(aEcuID);

  ComboBox_WatchPowerOff.ItemIndex := StrToInt(aPowerWatch);
  ComboBox_WatchPowerOff.Color := clYellow;

  {퇴실지연시간}
  if isDigit(aOutDelay) then
  begin
    SpinEdit_OutDelay.IntValue := StrToInt(aOutDelay);
    SpinEdit_OutDelay.Color := clYellow;
  end;
  {입실지연시간}
  if isDigit(aInDelay) then
  begin
    SpinEdit_InDelay.IntValue := StrToInt(aInDelay);
    SpinEdit_InDelay.Color := clYellow;
  end;

  ComboBox_DoorType1.ItemIndex := StrToInt(aDoor1Type);
  ComboBox_DoorType1.Color := clYellow;
  if StrToInt(aDoor1Type) = 1 then //출입전용이면
  begin
    for j := 1 to FIXMAXREADERNO do
    begin
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetReaderDoor(j) = 1 then //카드리더가 1번문 제어이면
      begin
        cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',j);
        if cmb_Box <> nil then cmb_Box.Enabled := False;
      end;
    end;
  end else
  begin
    for j := 1 to FIXMAXREADERNO do
    begin
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetReaderDoor(j) = 1 then //카드리더가 1번문 제어이면
      begin
        cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',j);
        if cmb_Box <> nil then cmb_Box.Enabled := TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill;
      end;
    end;
  end;

  ComboBox_DoorType2.ItemIndex := StrToInt(aDoor2Type);
  ComboBox_DoorType2.Color := clYellow;
  if StrToInt(aDoor2Type) = 1 then //출입전용이면
  begin
    for j := 1 to FIXMAXREADERNO do
    begin
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetReaderDoor(j) = 2 then //카드리더가 해당문 제어이면
      begin
        cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',j);
        if cmb_Box <> nil then cmb_Box.Enabled := False;
      end;
    end;
  end else
  begin
    for j := 1 to FIXMAXREADERNO do
    begin
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetReaderDoor(j) = 2 then //카드리더가 해당문 제어이면
      begin
        cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',j);
        if cmb_Box <> nil then cmb_Box.Enabled := TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill;
      end;
    end;
  end;

  if Length(aLockExtend) > 5 then
  begin
    for i := 1 to 6 do
    begin
      cmb_Box := TravelComboBoxItem(gb_SystemInfo,'ComboBox_DoorType',i + 2);
      if cmb_Box <> nil then
      begin
        if isDigit(aLockExtend[i]) then
        begin
          cmb_Box.ItemIndex := strtoint(aLockExtend[i]);
          cmb_Box.Color := clYellow;
          if StrToInt(aLockExtend[i]) = 1 then //출입전용이면
          begin
            for j := 1 to FIXMAXREADERNO do
            begin
              if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetReaderDoor(j) = i + 2 then //카드리더가 해당문 제어이면
              begin
                cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',j);
                if cmb_Box <> nil then cmb_Box.Enabled := False;
              end;
            end;
          end else
          begin
            for j := 1 to FIXMAXREADERNO do
            begin
              if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetReaderDoor(j) = i + 2 then //카드리더가 해당문 제어이면
              begin
                cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',j);
                if cmb_Box <> nil then cmb_Box.Enabled := TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill;
              end;
            end;
          end;
        end;
      end;
    end
  end;


  Edit_Locate.Text := aLocate;
  Edit_Locate.Color := clYellow;
  //ComboBox_WatchPowerOffClick(self);
  L_bSettingChanged := False;
end;

procedure TfmCurrentDeviceSetting.ComboBox_WatchPowerOffChange(Sender: TObject);
begin
  if G_bRealRegist then RegistSystemInfo;
  Form_SystemInfo_ColorInitialize;
  self.FindSubForm('Main').FindCommand('SettingChange').Params.Values['VALUE'] := 'WatchPowerOff';
  self.FindSubForm('Main').FindCommand('SettingChange').Execute;
end;

function TfmCurrentDeviceSetting.RegistSystemInfo: Boolean;
var
  i : integer;
begin

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '시스템정보 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistSystemInfo(G_stSelectEcuID,
                         inttostr(ComboBox_WatchPowerOff.ItemIndex),
                         inttostr(SpinEdit_InDelay.IntValue),
                         inttostr(SpinEdit_OutDelay.IntValue),
                         inttostr(ComboBox_DoorType1.ItemIndex),
                         inttostr(ComboBox_DoorType2.ItemIndex),
                         inttostr(ComboBox_DoorType3.ItemIndex),
                         inttostr(ComboBox_DoorType4.ItemIndex),
                         inttostr(ComboBox_DoorType5.ItemIndex),
                         inttostr(ComboBox_DoorType6.ItemIndex),
                         inttostr(ComboBox_DoorType7.ItemIndex),
                         inttostr(ComboBox_DoorType8.ItemIndex),
                         Edit_Locate.Text);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.Edit_LocateKeyPress(Sender: TObject;
  var Key: Char);
begin
  Form_SystemInfo_ColorInitialize;
  if Key = #13 then
  begin
    if G_bRealRegist then RegistSystemInfo;
  end;

end;

procedure TfmCurrentDeviceSetting.Edit_LocateExit(Sender: TObject);
begin
  Form_SystemInfo_ColorInitialize;
  if G_bRealRegist then RegistSystemInfo;
end;

procedure TfmCurrentDeviceSetting.Form_ControllerID_ColorInitialize;
begin
  ed_mcid.Color := clWhite;
end;

procedure TfmCurrentDeviceSetting.Form_UsedDevice_ColorInitialize;
begin
  lvECU.Color := clWhite; 
end;

procedure TfmCurrentDeviceSetting.Form_SystemInfo_ColorInitialize;
var
  cmb_Box : TComboBox;
  i : integer;
begin
  ComboBox_WatchPowerOff.Color := clWhite;
  SpinEdit_OutDelay.Color := clWhite;
  SpinEdit_InDelay.Color := clWhite;
  for i := 1 to FIXMAXDOORNO do
  begin
    cmb_Box := TravelComboBoxItem(gb_SystemInfo,'ComboBox_DoorType',i);
    if cmb_Box <> nil then cmb_Box.Color := clWhite; 
  end;
  Edit_Locate.Color := clWhite;
  cmb_ServerCardNF.Color := clWhite;
end;

procedure TfmCurrentDeviceSetting.ComboBox_WatchPowerOffClick(Sender: TObject);
begin
  {
  //minvalue = 0 으로 설정
  ReaderDoorNoMinValueSetting(0);
  ReaderDoorNoMaxValueSetting(FIXMAXDOORNO);
  ReaderDoorNoEnable(True);
  if (ComboBox_DoorType1.itemIndex = 0) and (ComboBox_DoorType2.itemIndex = 0) then
  begin
    ReaderDoorNoMaxValueSetting(0);
    ReaderDoorNoEnable(False);
    // 문번호 전체 0으로 설정 하고 비활성화
  end;
  if (ComboBox_DoorType1.itemIndex = 1) and (ComboBox_DoorType2.itemIndex = 1) then
  begin
    ReaderDoorNoMinValueSetting(1);
    // minvalue= 1 설정
  end;   }
  
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'WATCH_POWER',inttostr(ComboBox_WatchPowerOff.itemIndex));
    dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,'1','DOOR_TYPE',inttostr(ComboBox_DoorType1.itemIndex));
    dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,'2','DOOR_TYPE',inttostr(ComboBox_DoorType2.itemIndex));
    dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,'3','DOOR_TYPE',inttostr(ComboBox_DoorType3.itemIndex));
    dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,'4','DOOR_TYPE',inttostr(ComboBox_DoorType4.itemIndex));
    dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,'5','DOOR_TYPE',inttostr(ComboBox_DoorType5.itemIndex));
    dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,'6','DOOR_TYPE',inttostr(ComboBox_DoorType6.itemIndex));
    dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,'7','DOOR_TYPE',inttostr(ComboBox_DoorType7.itemIndex));
    dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,'8','DOOR_TYPE',inttostr(ComboBox_DoorType8.itemIndex));

    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'WATCH_POWER','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,'1','DOOR_TYPE','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,'2','DOOR_TYPE','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,'3','DOOR_TYPE','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,'4','DOOR_TYPE','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,'5','DOOR_TYPE','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,'6','DOOR_TYPE','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,'7','DOOR_TYPE','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,'8','DOOR_TYPE','U');
    L_bSettingChanged := True;
  end;

end;

procedure TfmCurrentDeviceSetting.Form_DeviceVersion_Clear;
begin
  st_DeviceVer.Caption := '';
end;

procedure TfmCurrentDeviceSetting.Form_DeviceCode_Clear;
begin
  st_DeviceCode.Caption := '';
end;

function TfmCurrentDeviceSetting.CurrentAlarmStateSearch(aEcuID:string;aDirect:Boolean=False): Boolean;
var
  i,j : integer;
  nIndex : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not dmSocket.DeviceConnectCheck('00') then exit;
  if Not aDirect then
  begin
    Exit;
    //if dmDataBase.GetTB_DEVICERCV_Value('00','ArmRelay') = 'Y' then Exit;
  end;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  
  Form_AlarmState_ColorInitialize;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse then
    begin
      for i := 0 to G_nLoopCount do
      begin
        if G_bApplicationTerminate then Exit;
        pan_Message.Caption := '방범 상태 체크중입니다.';
        ProgressBar1.Position := i + 1;
        result := dmSocket.AlarmState_Check(aEcuID,0,True); //Main 으로만 상태 조회 됨
        if result then Break;
      end;
    end else
    begin
      for i := 1 to FIXARMAREANO do
      begin
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          pan_Message.Caption := '방범구역' + inttostr(i) + ' 방범 상태 체크중입니다.';
          ProgressBar1.Position := j + 1;
          result := dmSocket.AlarmState_Check(aEcuID,i,True); 
          if result then Break;
        end;
      end;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.Form_AlarmState_ColorInitialize;
var
  static_Text : TStaticText;
  i : integer;
begin
  st_AlarmState.Color := clWhite;
  for i := 1 to FIXMAXDOORNO do
  begin
    static_Text := TravelTStaticTextItem(gb_LoackState,'st_AlarmState2',i);
    if static_Text <> nil then static_Text.Color := clWhite;
  end;
  st_ArmArea3.Color := clWhite;
  st_AlarmState3.Color := clWhite;
end;

procedure TfmCurrentDeviceSetting.RecvAlarmEvent(aECUID, aTime, aSubCLass,
  aSubAddr, aZone, aMode, aStatus, aLoop, aState, aOper: string);
var
  stAlarmCaption : string;
  aColor : TColor;
  i : integer;
  static_Text : TStaticText;
  nIndex : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;

  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;

  aColor := clWhite;

  if (aSubCLass = 'MN') or (aSubCLass = 'EX') then
  begin
    if aStatus = 'NF' then Exit;
  end;

  case Uppercase(aMode)[1] of
      'A': begin //경계모드
             aColor := clRed;
             stAlarmCaption:= '경계모드';
           end;
      'D': begin //해제모드
             aColor := clBlue;
             stAlarmCaption:= '해제모드';
           end;
      'P': begin //순회모드
             aColor := clYellow;
             stAlarmCaption:= '해제모드';
           end;
  end;
  if aZone = '00' then
  begin
    st_AlarmState.Color := aColor;
    st_AlarmState.Caption := stAlarmCaption;
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse then Exit;
    for i := 1 to FIXMAXDOORNO do
    begin
      static_Text := TravelTStaticTextItem(gb_LoackState,'st_AlarmState2',i);
      if static_Text <> nil then
      begin
        if (i = 2) and (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812) then
        begin
          if TCurrentDeviceState(DeviceList.Objects[nIndex]).RELAY2TYPE = 0 then //락2 미사용 인경우
          begin
            static_Text.Color := clWhite;
            static_Text.Caption := '';
            continue;
          end;
        end;
        if i > 2 then
        begin
          if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then   //존확장기 기능이 없으면
          begin
            static_Text.Color := clWhite;
            static_Text.Caption := '';
            continue;
          end;
          if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetZoneExtentionUse(i-2) = '0' then //존확장기 미사용이면
          begin
            static_Text.Color := clWhite;
            static_Text.Caption := '';
            continue;
          end;
        end;
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorType(i) = '1' then //출입전용이면
        begin
          static_Text.Color := clWhite;
          static_Text.Caption := '';
          continue;
        end;
        static_Text.Color := aColor;
        static_Text.Caption := stAlarmCaption;
      end;
    end;
  end else
  begin
    st_AlarmState.Color := aColor;
    st_AlarmState.Caption := stAlarmCaption;    //최종 상태가 방범구역 번호를 가지고 올라 올 수 있음
    st_ArmArea3.Color := clYellow;
    st_ArmArea3.Caption := aZone;
    st_AlarmState3.Color := aColor;
    st_AlarmState3.Caption := stAlarmCaption;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse then Exit;
    for i := 1 to FIXMAXDOORNO do
    begin
      static_Text := TravelTStaticTextItem(gb_LoackState,'st_AlarmState2',i);
      if static_Text = nil then continue;

      if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorArmArea(i) = strtoint(aZone) then
      begin
        if (i = 2) and (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812) then
        begin
          if TCurrentDeviceState(DeviceList.Objects[nIndex]).RELAY2TYPE = 0 then //락2 미사용 인경우
          begin
            static_Text.Color := clWhite;
            static_Text.Caption := '';
            continue;
          end;
        end;
        if i > 2 then
        begin
          if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then   //존확장기 기능이 없으면
          begin
            static_Text.Color := clWhite;
            static_Text.Caption := '';
            continue;
          end;
          if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetZoneExtentionUse(i-2) = '0' then //존확장기 미사용이면
          begin
            static_Text.Color := clWhite;
            static_Text.Caption := '';
            continue;
          end;
        end;
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorType(i) = '1' then //출입전용이면
        begin
          static_Text.Color := clWhite;
          static_Text.Caption := '';
          continue;
        end;
        static_Text.Color := aColor;
        static_Text.Caption := stAlarmCaption;
      end;
    end;
  end;

end;

function TfmCurrentDeviceSetting.ChangeAlarmMode(aEcuID, aMode:string;aArmArea:integer): Boolean;
var
  i : integer;
begin
  result := False;
  if Not dmSocket.DeviceConnectCheck(aEcuID) then Exit;
{  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;  }
    result := dmSocket.ChangeAlarmMode(aEcuID, aMode,aArmArea);
{    if result then Break;
  end;
}
end;

procedure TfmCurrentDeviceSetting.btn_AlarmClick(Sender: TObject);
begin
  ChangeAlarmMode(G_stSelectEcuID,'A',(Sender as TRzBitBtn).tag);
end;

procedure TfmCurrentDeviceSetting.btn_DisAlarmClick(Sender: TObject);
begin
  ChangeAlarmMode(G_stSelectEcuID,'D',(Sender as TRzBitBtn).tag);

end;

procedure TfmCurrentDeviceSetting.Group_DeviceChange(Sender: TObject;
  Index: Integer; NewState: TCheckBoxState);
var
  stUseEcu : string;
begin
  if Index = 0 then Exit;
  if Not L_bTableLoading then
  begin
    if NewState = cbChecked then
    begin
      dmDataBase.UpdateTB_DEVICE_FieldName(FillZeroNumber(index,2),'DEVICEUSE','Y');
      dmDataBase.UpdateTB_DEVICERCV_FieldName(FillZeroNumber(index,2),'DEVICEUSE','U');
    end else
    begin
      dmDataBase.UpdateTB_DEVICE_FieldName(FillZeroNumber(index,2),'DEVICEUSE','N');
      dmDataBase.UpdateTB_DEVICERCV_FieldName(FillZeroNumber(index,2),'DEVICEUSE','U');
    end;
  end;
  
  L_bDeviceLoadTime := True;
  //if Not L_bDeviceLoad then DeviceLoad(False);

  if L_bDeviceUsedChange then Exit;
  Form_UsedDevice_ColorInitialize;
  stUseEcu := GetEcu;
//  if Not L_bDeviceUsedChange then
//  begin
    if G_bRealRegist then RegistUsedDevice(stUseEcu);
//  end;
  L_bSettingChanged := True;

end;

function TfmCurrentDeviceSetting.DoorSystemInfoSearch(aEcuID,
  aDoorNo: string;aDirect:Boolean=False): Boolean;
var
  i : integer;
  stTemp : string;
  nIndex : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not isDigit(aDoorNo) then Exit;
  if Not dmSocket.DeviceConnectCheck(aEcuID) then exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DOORSETTINGRCV_Value(aEcuID,'0',aDoorNo,'CARD_TYPE')  = 'Y' then Exit;
  end;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(strtoint(aDoorNo)) then Exit;

  Try
    LockControlEnable(aDoorNo,False);
    Form_DoorSystem_ColorInitialize(aDoorNo);
    Try
      pan_Message.Color := L_cSearchColor;
      pan_Message.Visible := True;
      ProgressBar1.Max := G_nLoopCount + 1;
      for i := 0 to G_nLoopCount do
      begin
        if G_bApplicationTerminate then Exit;
        pan_Message.Caption := '출입문' + aDoorNo +' 설정정보 체크중입니다.';
        ProgressBar1.Position := i + 1;
        result := dmSocket.DoorSystemInfo_Check(aEcuID,aDoorNo);
        if result then Break;
      end;
    Finally
      if Not G_bApplicationTerminate then pan_Message.Visible := False;
    End;
{
    if Not aDirect then Exit;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      result := dmSocket.DoorState_Check(aEcuID,aDoorNo);
      if result then Break;
    end;  } //상태 체크는 상태 체크 화면에서 조회 하자

  Finally
    LockControlEnable(aDoorNo,True);
  End;
end;

procedure TfmCurrentDeviceSetting.Form_DoorSystem_ColorInitialize(
  aDoorNo: string);
begin
  if aDoorNo = '1' then
  begin
    ComboBox_CardModeType1.Color := clWhite;
    ComboBox_DoorModeType1.Color := clWhite;
    cmb_DoorControlTime1.Color := clWhite;
    SpinEdit_OpenMoni1.Color := clWhite;
    ComboBox_UseSch1.Color := clWhite;
    ComboBox_SendDoorStatus1.Color := clWhite;
    ComboBox_AlarmLongOpen1.Color := clWhite;
    ComboBox_ControlFire1.Color := clWhite;
    ComboBox_LockType1.Color := clWhite;
    cmb_DsOpenState1.Color := clWhite;
    cmb_RemoteDoorOpen1.Color := clWhite;
    cmb_DoorDscheckTime1.Color := clWhite;
    cmb_ArmDSCheck1.Color := clWhite;
  end else if aDoorNo = '2' then
  begin
    ComboBox_CardModeType2.Color := clWhite;
    ComboBox_DoorModeType2.Color := clWhite;
    cmb_DoorControlTime2.Color := clWhite;
    SpinEdit_OpenMoni2.Color := clWhite;
    ComboBox_UseSch2.Color := clWhite;
    ComboBox_SendDoorStatus2.Color := clWhite;
    ComboBox_AlarmLongOpen2.Color := clWhite;
    ComboBox_ControlFire2.Color := clWhite;
    ComboBox_LockType2.Color := clWhite;
    cmb_DsOpenState2.Color := clWhite;
    cmb_RemoteDoorOpen2.Color := clWhite;
    cmb_DoorDscheckTime2.Color := clWhite;
    cmb_ArmDSCheck2.Color := clWhite;
  end;
end;

procedure TfmCurrentDeviceSetting.RecvDoorSettingEvent(aECUID, aDoorNo, aCardMode,
  aDoorMode, aDoorControlTime, aLongDoorOpenTime, aSchedule, aDoorState,
  aNetFailRun, aAntiPass, aLongDoorOpenUse, aNetFailAlarm, aDoorLockType,
  aFireDoorControl, aLockState, aDoorOpenState, aRemoteDoorOpen: string);
var
  nDoorControlTime : integer;
  nOrd : integer;
  nMsec : integer;
  nDoorNo : integer;
  cmb_Box : TComboBox;
  spinEdit : TSpinEdit;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;

  if Not isDigit(aDoorNo) then Exit;

  nDoorNo := strtoint(aDoorNo);

  L_bDoorSystemChange := True;

  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_CardModeType',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_CardModeType',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex:=     strtoint(aCardMode);
    cmb_Box.Color := clYellow;
  end;
  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_DoorModeType',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_DoorModeType',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex:=     strtoint(aDoorMode);
    cmb_Box.Color := clYellow;
  end;
  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorControlTime',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorControlTime',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Text := aDoorControlTime;
    cmb_Box.Color := clYellow;
  end;
  if nDoorNo < 3 then spinEdit := TravelSpinEditItem(gb_DoorInfo,'SpinEdit_OpenMoni',nDoorNo)
  else spinEdit := TravelSpinEditItem(gb_DoorExtensionInfo,'SpinEdit_OpenMoni',nDoorNo);
  if spinEdit <> nil then
  begin
    spinEdit.Value:=  strtoint(aLongDoorOpenTime);
    spinEdit.Color := clYellow;
  end;
  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_UseSch',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_UseSch',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex:= strtoint(aSchedule);
    cmb_Box.Color := clYellow;
  end;
  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_SendDoorStatus',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_SendDoorStatus',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex:=   strtoint(aDoorState);
    cmb_Box.Color := clYellow;
  end;
  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_AlarmLongOpen',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_AlarmLongOpen',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex:=    strtoint(aLongDoorOpenUse);
    cmb_Box.Color := clYellow;
  end;
  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_ControlFire',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_ControlFire',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex:= strtoint(aFireDoorControl);
    cmb_Box.Color := clYellow;
  end;
  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_LockType',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex:=         strtoint(aDoorLockType);
    cmb_Box.Color := clYellow;
  end;
  //상태조회 쪽 출입문 타입을 설정 하자
  cmb_Box := TravelComboBoxItem(gb_LoackState,'ComboBox_LockType2',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex:=         strtoint(aDoorLockType);
    cmb_Box.Color := clYellow;
  end;

  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_DsOpenState',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DsOpenState',nDoorNo);
  if cmb_Box <> nil then
  begin
    //출입문열림상태
    if IsDigit(aDoorOpenState) then
    begin
      cmb_Box.ItemIndex := strtoint(aDoorOpenState);
      cmb_Box.Color := clYellow;
    end;
  end;
  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_RemoteDoorOpen',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_RemoteDoorOpen',nDoorNo);
  if cmb_Box <> nil then
  begin
    //원격해제시 Door Open
    if IsDigit(aRemoteDoorOpen) then
    begin
      cmb_Box.ItemIndex := strtoint(aRemoteDoorOpen);
      cmb_Box.Color := clYellow;
    end;
  end;

  L_bSettingChanged := False;
  L_bDoorSystemChange := False;
end;

procedure TfmCurrentDeviceSetting.ComboBox_CardModeType1Change(Sender: TObject);
var
  nDoorNo : integer;
  stComponentName : string;
  cmbBox : TComboBox;
  SpinEdit : TSpinEdit;
  nIndex : integer;
  i : integer;
begin
  nDoorNo := (Sender as TComponent).Tag;
  if nDoorNo < 1 then Exit;
  stComponentName := (Sender as TComponent).Name;

  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then
  begin
    G_stSelectEcuID := '00';
    nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  end;
  if nIndex < 0 then
  begin
    showmessage('프로그램에 문제 발생 했습니다.개발실에 문의해 주세요.');
    Exit;
  end;

  if nDoorNo < 3 then cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , nDoorNo)
  else cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_LockType' , nDoorNo);

  if copy(stComponentName,1,Length('ComboBox_LockType')) = 'ComboBox_LockType' then
  begin
    if cmbBox <> nil then
    begin
      if cmbBox.ItemIndex = 7 then
      begin
        if nDoorNo > 2 then
        begin
          cmbBox.ItemIndex := 1;
          showmessage('락확장 모드에서는 식수 기능을 사용할 수 없습니다.');
          Exit;
        end;
        if (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT811) and (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT813) and (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> SGS100) then
        begin
          cmbBox.ItemIndex := 1;
          showmessage('식수기능은 KT811에서만 사용 가능 합니다.');
          Exit;
        end;
        for i := 1 to 2 do
        begin
          if (TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , i).ItemIndex) <> 7 then
          begin
            TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , i).ItemIndex := 7;
            ComboBox_CardModeType1Change(TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , i));
          end;
        end;
      end else if (cmbBox.ItemIndex = 10) or (cmbBox.ItemIndex = 11) then
      begin
        //if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT811 then
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType <> KT811 then
        begin
          cmbBox.ItemIndex := 1;
          showmessage('자바라타입은 KT사옥용 에서만 사용 가능 합니다.');
          Exit;
        end;
        for i := 1 to 2 do
        begin
          if (TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , i).ItemIndex) = 7 then
          begin
            TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , i).ItemIndex := 1;
            ComboBox_CardModeType1Change(TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , i));
          end;
        end;
        gb_JavaraStopTime.Visible := True;
      end else if (cmbBox.ItemIndex > 11) then
      begin
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT811 then
        begin
          cmbBox.ItemIndex := 1;
          showmessage('해당기능은 KT811에서만 사용 가능 합니다.');
          Exit;
        end;
        for i := 1 to 2 do
        begin
          if (TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , i).ItemIndex) = 7 then
          begin
            TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , i).ItemIndex := 1;
            ComboBox_CardModeType1Change(TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , i));
          end;
        end;
      end else
      begin
        for i := 1 to 2 do
        begin
          if (TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , i).ItemIndex) = 7 then
          begin
            TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , i).ItemIndex := 1;
            ComboBox_CardModeType1Change(TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , i));
          end;
        end;
      end;
      if (cmbBox.ItemIndex = 6) or
         (cmbBox.ItemIndex = 8) or
         (cmbBox.ItemIndex = 10) or
         (cmbBox.ItemIndex = 11) then
      begin
        if nDoorNo < 3 then TravelComboBoxItem(gb_DoorInfo,'cmb_DoorControlTime' , nDoorNo).Text := '500ms'
        else TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorControlTime' , nDoorNo).Text := '500ms';
      end else
      begin
        if nDoorNo < 3 then TravelComboBoxItem(gb_DoorInfo,'cmb_DoorControlTime' , nDoorNo).Text := '5'
        else TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorControlTime' , nDoorNo).Text := '5';

        if nDoorNo < 3 then TravelComboBoxItem(gb_DoorInfo,'cmb_ArmDSCheck' , nDoorNo).Enabled := False
        else TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_ArmDSCheck' , nDoorNo).Enabled := False;
        if (cmbBox.ItemIndex = 2) or   //데드볼트 정전시 잠김
           (cmbBox.ItemIndex = 3) then //데드볼트 정전시 열림
        begin
          if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
          begin
            if nDoorNo < 3 then TravelComboBoxItem(gb_DoorInfo,'cmb_ArmDSCheck' , nDoorNo).Enabled := True
            else TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_ArmDSCheck' , nDoorNo).Enabled := True;
          end;
        end;
      end;
    end;
  end;

  L_bSettingChanged := True;
  if L_bDoorSystemChange then Exit;
  if G_bRealRegist then RegistDoorSystyemInfo(inttostr(nDoorNo));

  if Not L_bTableLoading then
  begin
    if nDoorNo < 3 then cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_CardModeType' , nDoorNo)
    else cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_CardModeType' , nDoorNo);
    if cmbBox <> nil then
      dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'CARD_TYPE',inttostr(cmbBox.itemindex));
    if nDoorNo < 3 then cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_DoorModeType' , nDoorNo)
    else cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_DoorModeType' , nDoorNo);
    if cmbBox <> nil then
      dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'DOORMODE_TYPE',inttostr(cmbBox.itemindex));
    if nDoorNo < 3 then cmbBox := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorControlTime' , nDoorNo)
    else cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorControlTime' , nDoorNo);
    if cmbBox <> nil then
      dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'DOOR_OPEN',cmbBox.Text);
    if nDoorNo < 3 then SpinEdit := TravelSpinEditItem(gb_DoorInfo,'SpinEdit_OpenMoni' , nDoorNo)
    else SpinEdit := TravelSpinEditItem(gb_DoorExtensionInfo,'SpinEdit_OpenMoni' , nDoorNo);
    if SpinEdit <> nil then
      dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'OPEN_MONI',inttostr(SpinEdit.Value));
    if nDoorNo < 3 then cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_UseSch' , nDoorNo)
    else cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_UseSch' , nDoorNo);
    if cmbBox <> nil then
      dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'USE_SCH',inttostr(cmbBox.itemindex));
    if nDoorNo < 3 then cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_SendDoorStatus' , nDoorNo)
    else cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_SendDoorStatus' , nDoorNo);
    if cmbBox <> nil then
      dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'DOOR_STATUS',inttostr(cmbBox.itemindex));
    if nDoorNo < 3 then cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_AlarmLongOpen' , nDoorNo)
    else cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_AlarmLongOpen' , nDoorNo);
    if cmbBox <> nil then
      dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'ALARM_LONG',inttostr(cmbBox.itemindex));
    if nDoorNo < 3 then cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_AlarmLongOpen' , nDoorNo)
    else cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_ControlFire' , nDoorNo);
    if cmbBox <> nil then
      dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'CONTROL_FIRE',inttostr(cmbBox.itemindex));
    if nDoorNo < 3 then cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , nDoorNo)
    else cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_LockType' , nDoorNo);
    if cmbBox <> nil then
      dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'LOCK_TYPE',inttostr(cmbBox.itemindex));
    if nDoorNo < 3 then cmbBox := TravelComboBoxItem(gb_DoorInfo,'cmb_DsOpenState' , nDoorNo)
    else cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DsOpenState' , nDoorNo);
    if cmbBox <> nil then
      dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'DOOR_DSOPENSTATUS',inttostr(cmbBox.itemindex));
    if nDoorNo < 3 then cmbBox := TravelComboBoxItem(gb_DoorInfo,'cmb_RemoteDoorOpen' , nDoorNo)
    else cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_RemoteDoorOpen' , nDoorNo);
    if cmbBox <> nil then
      dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'DOOR_REMOTECANCEL',inttostr(cmbBox.itemindex));

    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'CARD_TYPE','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'DOORMODE_TYPE','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'DOOR_OPEN','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'OPEN_MONI','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'USE_SCH','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'DOOR_STATUS','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'ALARM_LONG','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'CONTROL_FIRE','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'LOCK_TYPE','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'DOOR_DSOPENSTATUS','U');
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nDoorNo),'DOOR_REMOTECANCEL','U');
  end;

end;

function TfmCurrentDeviceSetting.RegistDoorSystyemInfo(aDoorNo: string): Boolean;
var
  i : integer;
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
  stRemoteOpen : string;
  stDoorDSCheck : string;
  stDoorArmModeDSCheck : string;
  stDoorDSCheckTime : string;
  cmb_Box : TComboBox;
  nIndex : integer;
begin
  if Not isDigit(aDoorNo) then exit;

  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then Exit;
  if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(strtoint(aDoorNo)) then Exit;

  Form_DoorSystem_ColorInitialize(aDoorNo);
  for i := 1 to FIXMAXDOORNO do
  begin
    if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_DsOpenState' , i)
    else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DsOpenState' , i);
    if cmb_Box <> nil then
    begin
      if cmb_Box.ItemIndex < 0 then cmb_Box.ItemIndex := 0;
    end;
    if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_RemoteDoorOpen' , i)
    else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_RemoteDoorOpen' , i);
    if cmb_Box <> nil then
    begin
      if cmb_Box.ItemIndex < 0 then cmb_Box.ItemIndex := 0;
    end;
  end;

  if Not GetDoorControlTime(aDoorNo,stDoorControlTime) then Exit;
  if Not GetDoorLockType(aDoorNo,stDoorLockType) then Exit;
  if Not GetDoorCardMode(aDoorNo,stCardModeType) then Exit;
  if Not GetDoorModeType(aDoorNo,stDoorModeType) then Exit;
  if Not GetDoorLongOpenTime(aDoorNo,stDoorLongOpenTime) then Exit;
  if Not GetDoorScheduleUse(aDoorNo,stScheduleUse) then Exit;
  if Not GetDoorStatusUse(aDoorNo,stDoorStatusUse) then Exit;
  if Not GetDoorLongTimeUse(aDoorNo,stDoorLongTimeUse) then Exit;
  if Not GetDoorFireOpenUse(aDoorNo,stDoorFireOpenUse) then Exit;
  if Not GetDoorDSOpenState(aDoorNo,stDoorDSOpenState) then Exit;
  if Not GetDoorRemoteOpen(aDoorNo,stRemoteOpen) then Exit;
  if Not GetDoorDSCheckTime(aDoorNo,stDoorDSCheckTime) then Exit;

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '출입문' + aDoorNo + ' 정보 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistDoorSystemInfo(G_stSelectEcuID,                             // 기기번호
                aDoorNo,                               // 문번호
                stCardModeType,                        // 카드 운영모드 (0:Positive, 1:Negative)
                stDoorModeType,                        // 출입문 운영모드 (0:운영, 1:개방)
                stDoorControlTime,                     // Door 제어시간
                stDoorLongOpenTime,                    // 장시간 열림 경보
                stScheduleUse,                         // 스케줄 적용 여부 (0:사용안함, 1:사용)
                stDoorStatusUse,                       // 출입문 상태 전송(0:사용안함, 1:사용)
                stDoorLongTimeUse,                     // 장시간 열림 부저 출력(0:사용안함, 1:사용)
                stDoorLockType,                        // 전기정 타입
                stDoorFireOpenUse,                     // 화재 발생시 문제어
                stDoorDSOpenState,                     //출입문열림상태 (DS OPEN 0x30,DS CLOSE 0x31)
                stRemoteOpen);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

  if TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType = AUTOKT811 then Exit; //무인국사는 체크하지 말자.

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '출입문' + aDoorNo + ' DS검사 유무 등록중입니다.';
      ProgressBar1.Position := i + 1;
      if stDoorDSCheckTime = '0' then  //항상검사
      begin
        result := dmSocket.RegistDoorDSCheckUse(G_stSelectEcuID,aDoorNo,'0');
      end else
      begin
        result := dmSocket.RegistDoorDSCheckUse(G_stSelectEcuID,aDoorNo,'1'); //옵션만큼 검사
      end;
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

  if stDoorDSCheckTime <> '0' then
  begin
    Try
      pan_Message.Color := L_cRegColor;
      pan_Message.Visible := True;
      ProgressBar1.Max := G_nLoopCount + 1;
      for i := 0 to G_nLoopCount do
      begin
        if G_bApplicationTerminate then Exit;
        pan_Message.Caption := '출입문' + aDoorNo + ' DS검사 시간 등록중입니다.';
        ProgressBar1.Position := i + 1;
        result := dmSocket.RegistDoorDSCheckTime(G_stSelectEcuID,aDoorNo,stDoorDSCheckTime); //옵션 시간을 부여함
        if result then Break;
      end;
    Finally
      if Not G_bApplicationTerminate then pan_Message.Visible := False;
    End;
  end;

end;

function TfmCurrentDeviceSetting.GetDoorControlTime(aDoorNo: string;
  var aDoorControlTime: string): Boolean;
var
  nOrdUDiff : integer;
  nDoorTime : integer;
  stMSEC : string;
  nMSec : integer;
  nOrd : integer;
  oComboBox : TComboBox;
begin
  result := False;
  if Not isDigit(aDoorNo) then Exit;
  if strtoint(aDoorNo) < 3 then
  begin
    oComboBox := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorControlTime', strtoint(aDoorNo));
  end else
  begin
    oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorControlTime', strtoint(aDoorNo));
  end;
  if oComboBox = nil then Exit;
  if oComboBox.ItemIndex < 0 then oComboBox.ItemIndex := 0;

  Try
    if IsDigit(oComboBox.text) then
    begin
      if strtoint(oComboBox.text) < 10 then
      begin
         aDoorControlTime := Trim(oComboBox.text);
      end else
      begin
        nOrdUDiff := 26;
        nDoorTime := strtoint(oComboBox.text) - 10;
        nDoorTime := nDoorTime div 5;
        if nDoorTime < nOrdUDiff then  nOrd := Ord('A') + nDoorTime
        else nOrd := Ord('a') + nDoorTime - nOrdUDiff;
        if nOrd > Ord('z') then nOrd := Ord('z');
        aDoorControlTime := Char(nOrd);
      end;
    end else
    begin
      stMSEC := copy(oComboBox.text,1,3);
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
      aDoorControlTime := Char(nOrd);
    end;
    result := True;
  Except
    Exit;
  End;
{
  Try
    if aDoorNo = '1' then
    begin
      if IsDigit(cmb_DoorControlTime1.text) then
      begin
        if strtoint(cmb_DoorControlTime1.text) < 10 then
        begin
           aDoorControlTime := Trim(cmb_DoorControlTime1.text);
        end else
        begin
          nOrdUDiff := 26;
          nDoorTime := strtoint(cmb_DoorControlTime1.text) - 10;
          nDoorTime := nDoorTime div 5;
          if nDoorTime < nOrdUDiff then  nOrd := Ord('A') + nDoorTime
          else nOrd := Ord('a') + nDoorTime - nOrdUDiff;
          if nOrd > Ord('z') then nOrd := Ord('z');
          aDoorControlTime := Char(nOrd);
        end;
      end else
      begin
        stMSEC := copy(cmb_DoorControlTime1.text,1,3);
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
        aDoorControlTime := Char(nOrd);
      end;
      result := True;
    end else if aDoorNo = '2' then
    begin
      if IsDigit(cmb_DoorControlTime2.text) then
      begin
        if strtoint(cmb_DoorControlTime2.text) < 10 then
        begin
           aDoorControlTime := Trim(cmb_DoorControlTime2.text);
        end else
        begin
          nOrdUDiff := 26;
          nDoorTime := strtoint(cmb_DoorControlTime2.text) - 10;
          nDoorTime := nDoorTime div 5;
          if nDoorTime < nOrdUDiff then  nOrd := Ord('A') + nDoorTime
          else nOrd := Ord('a') + nDoorTime - nOrdUDiff;
          if nOrd > Ord('z') then nOrd := Ord('z');
          aDoorControlTime := Char(nOrd);
        end;
      end else
      begin
        stMSEC := copy(cmb_DoorControlTime2.text,1,3);
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
        aDoorControlTime := Char(nOrd);
      end;
      result := True;
    end;
  Except
    Exit;
  End;   }
end;

function TfmCurrentDeviceSetting.GetDoorLockType(aDoorNo: string;
  var aDoorLockType: string): Boolean;
var
  nLockType : integer;
  oComboBox : TComboBox;
begin
  result := False;
  if Not isDigit(aDoorNo) then Exit;
  if strtoint(aDoorNo) < 3 then
  begin
    oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType', strtoint(aDoorNo));
  end else
  begin
    oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_LockType', strtoint(aDoorNo));
  end;
  if oComboBox = nil then Exit;
  Try
    if oComboBox.ItemIndex < 0 then oComboBox.ItemIndex := 0;
    nLockType := ord('0') + oComboBox.ItemIndex;
    aDoorLockType := char(nLockType);
    result := True;
  Except
    Exit;
  End;
  (*
  Try
    if aDoorNo = '1' then
    begin
      {if ComboBox_LockType1.ItemIndex < 4 then
          nLockType := ord('0') + ComboBox_LockType1.ItemIndex
      else nLockType := ord('0') + ComboBox_LockType1.ItemIndex + 2; }
      nLockType := ord('0') + ComboBox_LockType1.ItemIndex;
      aDoorLockType := char(nLockType);
      result := True;
    end else if aDoorNo = '2' then
    begin
      {if ComboBox_LockType2.ItemIndex < 4 then
          nLockType := ord('0') + ComboBox_LockType2.ItemIndex
      else nLockType := ord('0') + ComboBox_LockType2.ItemIndex + 2; }
      nLockType := ord('0') + ComboBox_LockType2.ItemIndex;
      aDoorLockType := char(nLockType);
      result := True;
    end;
  Except
    Exit;
  End; *)
end;

function TfmCurrentDeviceSetting.GetDoorCardMode(aDoorNo: string;
  var aCardModeType: string): Boolean;
var
  oComboBox : TComboBox;
begin
  result := False;
  if Not isDigit(aDoorNo) then Exit;
  if strtoint(aDoorNo) < 3 then
  begin
    oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_CardModeType', strtoint(aDoorNo));
  end else
  begin
    oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_CardModeType', strtoint(aDoorNo));
  end;
  if oComboBox = nil then Exit;
  Try
    if oComboBox.ItemIndex < 0 then oComboBox.ItemIndex := 0;
    aCardModeType := inttostr(oComboBox.ItemIndex);
    result := True;
  Except
    Exit;
  End;
  {
  Try
    if aDoorNo = '1' then
    begin
      aCardModeType := inttostr(ComboBox_CardModeType1.ItemIndex);
      result := True;
    end else if aDoorNo = '2' then
    begin
      aCardModeType := inttostr(ComboBox_CardModeType2.ItemIndex);
      result := True;
    end;
  Except
    Exit;
  End; }
end;

function TfmCurrentDeviceSetting.GetDoorModeType(aDoorNo: string;
  var aDoorModeType: string): Boolean;
var
  oComboBox : TComboBox;
begin
  result := False;
  if Not isDigit(aDoorNo) then Exit;
  if strtoint(aDoorNo) < 3 then
  begin
    oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_DoorModeType', strtoint(aDoorNo));
  end else
  begin
    oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_DoorModeType', strtoint(aDoorNo));
  end;
  if oComboBox = nil then Exit;

  Try
    if oComboBox.ItemIndex < 0 then oComboBox.ItemIndex := 0;
    aDoorModeType := inttostr(oComboBox.ItemIndex);
    result := True;
  Except
    Exit;
  End;
  {
  Try
    if aDoorNo = '1' then
    begin
      aDoorModeType := inttostr(ComboBox_DoorModeType1.ItemIndex);
      result := True;
    end else if aDoorNo = '2' then
    begin
      aDoorModeType := inttostr(ComboBox_DoorModeType2.ItemIndex);
      result := True;
    end;
  Except
    Exit;
  End; }
end;

function TfmCurrentDeviceSetting.GetDoorLongOpenTime(aDoorNo: string;
  var aDoorLongOpenTime: string): Boolean;
var
  oSpinEdit : TSpinEdit;
begin
  result := False;
  if Not isDigit(aDoorNo) then Exit;
  if strtoint(aDoorNo) < 3 then
  begin
    oSpinEdit := TravelSpinEditItem(gb_DoorInfo,'SpinEdit_OpenMoni', strtoint(aDoorNo));
  end else
  begin
    oSpinEdit := TravelSpinEditItem(gb_DoorExtensionInfo,'SpinEdit_OpenMoni', strtoint(aDoorNo));
  end;
  if oSpinEdit = nil then Exit;
  Try
    aDoorLongOpenTime := char($30 + oSpinEdit.Value);
    result := True;
  Except
    Exit;
  End;

{  Try
    if aDoorNo = '1' then
    begin
      aDoorLongOpenTime := inttostr(SpinEdit_OpenMoni1.IntValue);
      result := True;
    end else if aDoorNo = '2' then
    begin
      aDoorLongOpenTime := inttostr(SpinEdit_OpenMoni2.IntValue);
      result := True;
    end;
  Except
    Exit;
  End; }
  
end;

function TfmCurrentDeviceSetting.GetDoorScheduleUse(aDoorNo: string;
  var aScheduleUse: string): Boolean;
var
  oComboBox : TComboBox;
begin
  result := False;
  if Not isDigit(aDoorNo) then Exit;
  if strtoint(aDoorNo) < 3 then
  begin
    oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_UseSch', strtoint(aDoorNo));
  end else
  begin
    oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_UseSch', strtoint(aDoorNo));
  end;
  if oComboBox = nil then Exit;

  aScheduleUse := '0';
  Try
    if oComboBox.ItemIndex < 0 then oComboBox.ItemIndex := 0;
    aScheduleUse := inttostr(oComboBox.ItemIndex);
    result := True;
  Except
    Exit;
  End;
  {
  Try
    if aDoorNo = '1' then
    begin
      aScheduleUse := inttostr(ComboBox_UseSch1.ItemIndex);
      result := True;
    end else if aDoorNo = '2' then
    begin
      aScheduleUse := inttostr(ComboBox_UseSch2.ItemIndex);
      result := True;
    end;
  Except
    Exit;
  End; }
//  aScheduleUse := '1';
end;

function TfmCurrentDeviceSetting.GetDoorStatusUse(aDoorNo: string;
  var aDoorStatusUse: string): Boolean;
var
  oComboBox : TComboBox;
begin
  result := False;
  if Not isDigit(aDoorNo) then Exit;
  if strtoint(aDoorNo) < 3 then
  begin
    oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_SendDoorStatus', strtoint(aDoorNo));
  end else
  begin
    oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_SendDoorStatus', strtoint(aDoorNo));
  end;
  if oComboBox = nil then Exit;
  Try
    if oComboBox.ItemIndex < 0 then oComboBox.ItemIndex := 0;
    aDoorStatusUse := inttostr(oComboBox.ItemIndex);
    result := True;
  Except
    Exit;
  End;
  {
  Try
    if aDoorNo = '1' then
    begin
      aDoorStatusUse := inttostr(ComboBox_SendDoorStatus1.ItemIndex);
      result := True;
    end else if aDoorNo = '2' then
    begin
      aDoorStatusUse := inttostr(ComboBox_SendDoorStatus2.ItemIndex);
      result := True;
    end;
  Except
    Exit;
  End; }
end;

function TfmCurrentDeviceSetting.GetDoorLongTimeUse(aDoorNo: string;
  var aDoorLongTimeUse: string): Boolean;
var
  oComboBox : TComboBox;
begin
  result := False;
  if Not isDigit(aDoorNo) then Exit;
  if strtoint(aDoorNo) < 3 then
  begin
    oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_AlarmLongOpen', strtoint(aDoorNo));
  end else
  begin
    oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_AlarmLongOpen', strtoint(aDoorNo));
  end;
  if oComboBox = nil then Exit;
  if oComboBox.ItemIndex < 0 then oComboBox.ItemIndex := 0;
  Try
    aDoorLongTimeUse := inttostr(oComboBox.ItemIndex);
    result := True;
  Except
    Exit;
  End;
  {
  Try
    if aDoorNo = '1' then
    begin
      aDoorLongTimeUse := inttostr(ComboBox_AlarmLongOpen1.ItemIndex);
      result := True;
    end else if aDoorNo = '2' then
    begin
      aDoorLongTimeUse := inttostr(ComboBox_AlarmLongOpen2.ItemIndex);
      result := True;
    end;
  Except
    Exit;
  End;  }
end;

function TfmCurrentDeviceSetting.GetDoorFireOpenUse(aDoorNo: string;
  var aDoorFireOpenUse: string): Boolean;
var
  oComboBox : TComboBox;
begin
  result := False;
  if Not isDigit(aDoorNo) then Exit;
  if strtoint(aDoorNo) < 3 then
  begin
    oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_ControlFire', strtoint(aDoorNo));
  end else
  begin
    oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_ControlFire', strtoint(aDoorNo));
  end;
  if oComboBox = nil then Exit;
  if oComboBox.ItemIndex < 0 then oComboBox.ItemIndex := 0;
  Try
    aDoorFireOpenUse := inttostr(oComboBox.ItemIndex);
    result := True;
  Except
    Exit;
  End;
  {
  Try
    if aDoorNo = '1' then
    begin
      aDoorFireOpenUse := inttostr(ComboBox_ControlFire1.ItemIndex);
      result := True;
    end else if aDoorNo = '2' then
    begin
      aDoorFireOpenUse := inttostr(ComboBox_ControlFire2.ItemIndex);
      result := True;
    end;
  Except
    Exit;
  End; }
end;

function TfmCurrentDeviceSetting.GetDoorDSOpenState(aDoorNo: string;
  var aDoorOpenState: string): Boolean;
var
  oComboBox : TComboBox;
begin
  result := False;
  if Not isDigit(aDoorNo) then Exit;
  if strtoint(aDoorNo) < 3 then
  begin
    oComboBox := TravelComboBoxItem(gb_DoorInfo,'cmb_DsOpenState', strtoint(aDoorNo));
  end else
  begin
    oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DsOpenState', strtoint(aDoorNo));
  end;
  if oComboBox = nil then Exit;
  if oComboBox.ItemIndex < 0 then oComboBox.ItemIndex := 0;
  Try
    aDoorOpenState := inttostr(oComboBox.ItemIndex);
    result := True;
  Except
    Exit;
  End;
  {
  Try
    if aDoorNo = '1' then
    begin
      aDoorOpenState := inttostr(cmb_DsOpenState1.ItemIndex);
      result := True;
    end else if aDoorNo = '2' then
    begin
      aDoorOpenState := inttostr(cmb_DsOpenState2.ItemIndex);
      result := True;
    end;
  Except
    Exit;
  End;  }
end;

function TfmCurrentDeviceSetting.GetDoorRemoteOpen(aDoorNo: string;
  var aRemoteOpen: string): Boolean;
var
  oComboBox : TComboBox;
begin
  result := False;
  if Not isDigit(aDoorNo) then Exit;
  if strtoint(aDoorNo) < 3 then
  begin
    oComboBox := TravelComboBoxItem(gb_DoorInfo,'cmb_RemoteDoorOpen', strtoint(aDoorNo));
  end else
  begin
    oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_RemoteDoorOpen', strtoint(aDoorNo));
  end;
  if oComboBox = nil then Exit;
  if oComboBox.ItemIndex < 0 then oComboBox.ItemIndex := 0;
  Try
    aRemoteOpen := inttostr(oComboBox.ItemIndex);
    result := True;
  Except
    Exit;
  End;
  {
  Try
    if aDoorNo = '1' then
    begin
      aRemoteOpen := inttostr(cmb_RemoteDoorOpen1.ItemIndex);
      result := True;
    end else if aDoorNo = '2' then
    begin
      aRemoteOpen := inttostr(cmb_RemoteDoorOpen2.ItemIndex);
      result := True;
    end;
  Except
    Exit;
  End; }
end;

function TfmCurrentDeviceSetting.DoorLockDeviceStateCheck: Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  Form_DoorLockDeviceState_Clear;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '도어락 상태 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.DoorLockDeviceState_Check(G_stSelectEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.Form_DoorLockDeviceState_Clear;
var
  cmb_Box : TComboBox;
  i : integer;
begin
  for i := 1 to FIXMAXDOORNO do
  begin
    cmb_Box := TravelComboBoxItem(gb_LoackState,'cmb_COMNO',i);
    if cmb_Box <> nil then
    begin
      cmb_Box.ItemIndex := -1;
      cmb_Box.Color := clWhite;
    end;
    cmb_Box := TravelComboBoxItem(gb_LoackState,'cmb_ExGnd',i);
    if cmb_Box <> nil then
    begin
      cmb_Box.ItemIndex := -1;
      cmb_Box.Color := clWhite;
    end;
    cmb_Box := TravelComboBoxItem(gb_LoackState,'cmb_dsgnd',i);
    if cmb_Box <> nil then
    begin
      cmb_Box.ItemIndex := -1;
      cmb_Box.Color := clWhite;
    end;
    cmb_Box := TravelComboBoxItem(gb_LoackState,'cmb_lsgnd',i);
    if cmb_Box <> nil then
    begin
      cmb_Box.ItemIndex := -1;
      cmb_Box.Color := clWhite;
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.RecvDeviceStateData(aECUID, aCmd,
  aData: string);
begin
  if Not isDigit(aEcuID) then Exit;
  //if G_stSelectEcuID <> aEcuID then Exit;

  if aCmd = '20' then  //출입문 상태 체크
  begin
    if G_stSelectEcuID = aEcuID then DoorLockState(aData);
  end else if aCmd = '24' then  //알람 발생 기기 체크(화재/비상등)
  begin
    DeviceAlarmState(aData);
  end else if aCmd = '10' then  //존의 현재 단선/쇼트상태 체크
  begin
    if G_stSelectEcuID = aEcuID then Port_ShortOpenCheck(aData);
  end else if aCmd = '11' then  //존확장기의 현재 단선/쇼트상태 체크
  begin
    if G_stSelectEcuID = aEcuID then ZoneExtentionPort_ShortOpenCheck(aData);
  end;

end;

procedure TfmCurrentDeviceSetting.DoorLockState(aData: string);
var
  i : integer;
  stTemp : string;
  cmb_Box : TComboBox;
begin
  for i := 1 to FIXMAXDOORNO do
  begin
    if Length(aData) >= ( 5 * i + 5) then
    begin
      stTemp := copy(aData,5 * i + 1, 5);
      if isDigit(stTemp[1]) then
      begin
        cmb_Box := TravelComboBoxItem(gb_LoackState,'cmb_COMNO',i);
        if cmb_Box <> nil then
        begin
          cmb_Box.ItemIndex := strtoint(stTemp[1]);
          cmb_Box.Color := clYellow;
        end;
      end;
      if isDigit(stTemp[2]) then
      begin
        cmb_Box := TravelComboBoxItem(gb_LoackState,'cmb_lsgnd',i);
        if cmb_Box <> nil then
        begin
          cmb_Box.ItemIndex := strtoint(stTemp[2]);
          cmb_Box.Color := clYellow;
        end;
      end;
      if isDigit(stTemp[3]) then
      begin
        cmb_Box := TravelComboBoxItem(gb_LoackState,'cmb_dsgnd',i);
        if cmb_Box <> nil then
        begin
          cmb_Box.ItemIndex := strtoint(stTemp[3]);
          cmb_Box.Color := clYellow;
        end;
      end;
      if isDigit(stTemp[4]) then
      begin
        cmb_Box := TravelComboBoxItem(gb_LoackState,'cmb_ExGnd',i);
        if cmb_Box <> nil then
        begin
          cmb_Box.ItemIndex := strtoint(stTemp[4]);
          cmb_Box.Color := clYellow;
        end;
      end;
    end;
  end;
  {
  if isDigit(aData[6]) then
  begin
    cmb_COMNO1.ItemIndex := strtoint(aData[6]);
    cmb_COMNO1.Color := clYellow;
  end;

  if isDigit(aData[7]) then
  begin
    cmb_lsgnd1.ItemIndex := strtoint(aData[7]);
    cmb_lsgnd1.Color := clYellow;
  end;

  if isDigit(aData[8]) then
  begin
    cmb_dsgnd1.ItemIndex := strtoint(aData[8]);
    cmb_dsgnd1.Color := clYellow;
  end;

  if isDigit(aData[9]) then
  begin
    cmb_ExGnd1.ItemIndex := strtoint(aData[9]);
    cmb_ExGnd1.Color := clYellow;
  end;

  if G_stDeviceType[strtoint(G_stSelectEcuID)] <> KTT811 then Exit; //KTT811System 이 아니면 빠져 나가자...

  if isDigit(aData[11]) then
  begin
    cmb_COMNO2.ItemIndex := strtoint(aData[11]);
    cmb_COMNO2.Color := clYellow;
  end;

  if isDigit(aData[12]) then
  begin
    cmb_lsgnd2.ItemIndex := strtoint(aData[12]);
    cmb_lsgnd2.Color := clYellow;
  end;

  if isDigit(aData[13]) then
  begin
    cmb_dsgnd2.ItemIndex := strtoint(aData[13]);
    cmb_dsgnd2.Color := clYellow;
  end;

  if isDigit(aData[14]) then
  begin
    cmb_ExGnd2.ItemIndex := strtoint(aData[14]);
    cmb_ExGnd2.Color := clYellow;
  end;
  }

end;

function TfmCurrentDeviceSetting.ZoneSensState_Check: Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  Form_AlarmState_Clear;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '존 이상 상태 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.ZoneSensState_Check;
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.Form_AlarmState_Clear;
begin
  cmb_Firestat.ItemIndex := -1;
  cmb_Firestat.Color := clWhite;
end;

procedure TfmCurrentDeviceSetting.DeviceAlarmState(aData: string);
var
  i : integer;
  bFire : Boolean;
begin
  cmb_Firestat.itemIndex := 0;
  cmb_Firestat.Color := clYellow;

  bFire := False;
  for i:=0 to HIGH(G_bFireDevice) do
  begin
    if G_bFireDevice[i] then
    begin
      bFire := True;
      InsertFireDevice(FillZeroNumber(i,2));
    end else DeleteFireDevice(FillZeroNumber(i,2));
  end;
  if bFire then
  begin
    btn_FireDevice.Enabled := True;
    cmb_Firestat.itemIndex := 1;
    cmb_Firestat.Color := clRed;
  end else
  begin
    btn_FireDevice.Enabled := False;
    sg_FireDevice.Visible := False;
    cmb_Firestat.itemIndex := 0;
    cmb_Firestat.Color := clYellow;
  end;


end;

procedure TfmCurrentDeviceSetting.btn_FireDeviceClick(Sender: TObject);
begin
  sg_FireDevice.Visible := Not sg_FireDevice.Visible;
end;

procedure TfmCurrentDeviceSetting.DeleteFireDevice(aEcuID: string);
var
  i : integer;
begin
  for i := 1 to sg_FireDevice.RowCount - 1 do
  begin
    if sg_FireDevice.Cells[0,i] = aEcuID then
    begin
      sg_FireDevice.RemoveRows(i,1);
      if  sg_FireDevice.RowCount < 2 then sg_FireDevice.RowCount := 2;
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.InsertFireDevice(aEcuID: string);
var
  i : integer;
  bSearch : Boolean;
begin

  bSearch := False;
  for i := 1 to sg_FireDevice.RowCount - 1 do
  begin
    if sg_FireDevice.Cells[0,i] = aEcuID then
    begin
      bSearch := True;
      break;
    end;
  end;
  if Not bSearch then
  begin
    if sg_FireDevice.Cells[0,1] = '' then sg_FireDevice.Cells[0,1] := aEcuID
    else
    begin
      sg_FireDevice.AddRow;
      sg_FireDevice.Cells[0,sg_FireDevice.RowCount - 1] := aEcuID;
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.Panel3Resize(Sender: TObject);
begin
  gb_ControlButton.Left := (Panel3.Width div 2) - (gb_ControlButton.Width div 2);
end;

function TfmCurrentDeviceSetting.AllCardReaderCheck(aMaxReaderNo:integer;aDirect:Boolean=False): Boolean;
var
  i : integer;
  bResult : Boolean;
  stEcuID : string;
  stReaderNo : string;
  nCount : integer;
  static_Text:TStaticText;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;
  for i := 1 to aMaxReaderNo do
  begin
    bResult := CardReaderInfoSearch(G_stSelectEcuID,i,aDirect);
    if Not bResult then
    begin
      if Application.MessageBox(Pchar(inttostr(i) + '번 카드리더 조회시 문제가 발생 했습니다. 계속 하시겠습니까?'),'주의',MB_OKCANCEL) = IDCANCEL then Exit;
    end;
  end;

  if Not aDirect then Exit;

  for i:= 1 to aMaxReaderNo do
  begin
    if G_bCardReaderUse[i] then
    begin
      static_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',i);
      if static_Text <> nil then
      begin
        static_Text.Caption := '버젼체크중';
      end;
      if Not CardReaderVersionCheck(G_stSelectEcuID,i) then
      begin
        if static_Text <> nil then
        begin
          static_Text.Caption := '실패';
          static_Text.Color := clRed;
        end;
      end;
    end else
    begin
      static_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',i);
      if static_Text <> nil then
      begin
        static_Text.Caption := '';
        static_Text.Color := clYellow;
      end;
    end;
  end;
end;

function TfmCurrentDeviceSetting.CardReaderTypeSearch(aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;
  if Not isdigit(G_stSelectEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(G_stSelectEcuID,'CARDREADER_TYPE') = 'Y' then Exit;
  end;
  if (G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU100) or
     (G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU200) or
     (G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU300) then Exit; //KTT811System 이 아니면 빠져 나가자...
  Form_CardReaderType_ColorInitialize;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '카드리더 타입 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.CardReaderType_Check(G_stSelectEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.Form_AllCardReader_ColorInitialize(aReaderNo:integer);
var
  i : integer;
  cmb_box:TCombobox;
  static_Text :TStaticText;
  spinEdit:TSpinEdit;
begin
  if aReaderNo = 0 then
  begin
    for i:=1 to G_nCardReaderNumber do
    begin
      cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',i);
      if cmb_Box <> nil then cmb_Box.Color := clWhite;
      cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor',i);
      if cmb_Box <> nil then cmb_Box.Color := clWhite;
      spinEdit := TravelSpinEditItem(gb_CardReader,'se_ReaderDoor',i);
      if spinEdit <> nil then spinEdit.Color := clWhite;
      cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoorLocate',i);
      if cmb_Box <> nil then cmb_Box.Color := clWhite;
      cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderBuildingLocate',i);
      if cmb_Box <> nil then cmb_Box.Color := clWhite;
      cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderType',i);
      if cmb_Box <> nil then cmb_Box.Color := clWhite;
      cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderSound',i);
      if cmb_Box <> nil then cmb_Box.Color := clWhite;
      static_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',i);
      if static_Text <> nil then
      begin
        static_Text.Caption := '';
        static_Text.Color := clWhite;
      end;
      G_bCardReaderUse[i] := False;
    end;
  end else
  begin
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',aReaderNo);
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor',aReaderNo);
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    spinEdit := TravelSpinEditItem(gb_CardReader,'se_ReaderDoor',aReaderNo);
    if spinEdit <> nil then spinEdit.Color := clWhite;
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoorLocate',aReaderNo);
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderBuildingLocate',aReaderNo);
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderType',aReaderNo);
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    static_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',aReaderNo);
    if static_Text <> nil then
    begin
      static_Text.Caption := '';
      static_Text.Color := clWhite;
    end;
    G_bCardReaderUse[aReaderNo] := False;
  end;
end;

procedure TfmCurrentDeviceSetting.Form_CardReaderType_ColorInitialize;
begin
  cb_CardType.Color := clWhite;
end;

procedure TfmCurrentDeviceSetting.RecvCardReaderType(aECUID,
  aCardReaderType: string);
var
  i : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if Not isDigit(aCardReaderType[1]) then Exit;
  CardReaderAllTypeSetting(aECUID,strtoint(aCardReaderType[1]),clYellow);

  if Length(Trim(aCardReaderType)) > 9 then
  begin
    for i := 3 to 10 do
    begin
      CardReaderNumTypeSetting(aECUID,inttostr(i-2),aCardReaderType[i],clYellow);
    end;
  end else
  begin
    for i := 1 to FIXMAXREADERNO do
    begin
      CardReaderNumTypeSetting(aECUID,inttostr(i),aCardReaderType[1],clYellow);
    end;
  end;
  L_bSettingChanged := False;

end;

function TfmCurrentDeviceSetting.CardReaderInfoSearch(aEcuID: string;
  nCardReaderNo: integer;aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  result := True;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_READERSETTINGRCV_Value(aEcuID,'0',inttostr(nCardReaderNo),'READER_USE') = 'Y' then Exit;
  end;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '카드리더 ' + inttostr(nCardReaderNo) + '번 설정정보 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.CardReaderInfo_Check(aEcuID,inttostr(nCardReaderNo),True);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.RecvCardReaderSetData(aECUID, aReaderNo,
  aUsedCR, aCRPosition, aDoorNo,aReaderArmArea, aLocate, aBuildingPosi: string);
var
  cmb_box:TCombobox;
//  static_Text:TStaticText;
  nCardReaderNo : integer;
  spinEdit : TSpinEdit;
  nIndex : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  Try
    nCardReaderNo := strtoint(aReaderNo);
    if isDigit(aUsedCR) then
    begin
      if strtoint(aUsedCR) = 0 then G_bCardReaderUse[nCardReaderNo] := False
      else G_bCardReaderUse[nCardReaderNo] := True;

      cmb_box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',nCardReaderNo);
      if cmb_box <> nil then
      begin
        cmb_box.ItemIndex := strtoint(aUsedCR);
        cmb_box.Color := clYellow;
      end;
    end;
    if isDigit(aDoorNo) then
    begin
      cmb_box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor',nCardReaderNo);
      if cmb_box <> nil then
      begin
        cmb_box.ItemIndex := strtoint(aDoorNo);
        cmb_box.Color := clYellow;
        if strtoint(aDoorNo) > 0 then
        begin
          nIndex := DeviceList.IndexOf(aECUID);
          if nIndex > -1 then
          begin
            if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorType(strtoint(aDoorNo)) = '1' then
            begin
              cmb_box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',nCardReaderNo);
              if cmb_box <> nil then cmb_box.Enabled := False;
            end else
            begin
              cmb_box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',nCardReaderNo);
              if cmb_box <> nil then cmb_box.Enabled := TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill;
            end;
          end;
        end;
      end;
      spinEdit := TravelSpinEditItem(gb_CardReader,'se_ReaderDoor',nCardReaderNo);
      if spinEdit <> nil then
      begin
        spinEdit.Value := strtoint(aDoorNo);
        spinEdit.Color := clYellow;
      end;
    end;
    if isDigit(aReaderArmArea) then
    begin
      cmb_box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',nCardReaderNo);
      if cmb_box <> nil then
      begin
        cmb_box.ItemIndex := strtoint(aReaderArmArea) - 1;
        if cmb_Box.ItemIndex < 0 then cmb_Box.ItemIndex := 0;
        cmb_box.Color := clYellow;
      end;
    end;

    if isDigit(aCRPosition) then
    begin
      cmb_box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoorLocate',nCardReaderNo);
      if cmb_box <> nil then
      begin
        cmb_box.ItemIndex := strtoint(aCRPosition);
        cmb_box.Color := clYellow;
      end;
    end;
    if isDigit(aBuildingPosi) then
    begin
      cmb_box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderBuildingLocate',nCardReaderNo);
      if cmb_box <> nil then
      begin
        cmb_box.ItemIndex := strtoint(aBuildingPosi);
        cmb_box.Color := clYellow;
      end;
    end;
  Except
    Exit;
  End;
  L_bSettingChanged := False;
end;

function TfmCurrentDeviceSetting.CardReaderVersionCheck(aEcuID: string;
  nCardReaderNo: integer): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not dmSocket.DeviceConnectCheck(aEcuID) then Exit;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '카드리더 ' + inttostr(nCardReaderNo) + '번 버젼정보 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.CardReaderVersion_Check(aEcuID,inttostr(nCardReaderNo));
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.RecvCardReaderVersion(aECUID, aCardReaderNo,
  aCardReaderVersion: string);
var
  static_Text:TStaticText;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if Not isDigit(aCardReaderNo) then Exit;
  static_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',strtoint(aCardReaderNo));
  if static_Text <> nil then
  begin
    static_Text.Caption := aCardReaderVersion;
    static_Text.Color := clYellow;
  end;
end;

procedure TfmCurrentDeviceSetting.cb_CardTypeChange(Sender: TObject);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'CARDREADER_TYPE',inttostr(cb_CardType.ItemIndex));
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'CARDREADER_TYPE','U');
    L_bSettingChanged := True;
  end;
  if G_bRealRegist then
  begin
    if (cb_CardType.ItemIndex < 0) or (cb_CardType.ItemIndex > 4) then Exit;
    RegistCardType(G_stSelectEcuID,cb_CardType.ItemIndex);
  end;
  CardReaderAllTypeSetting(G_stSelectEcuID,cb_CardType.ItemIndex,clWhite);
end;

function TfmCurrentDeviceSetting.RegistCardType(aEcuID: string;
  aCardType: integer): Boolean;
var
  i : integer;
  stReaderType : string;
begin
  if G_nProgramType = 1 then Exit;
  Form_CardReaderType_ColorInitialize;
  stReaderType := GetReaderNumType;
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '카드리더 타입 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistCardType(aEcuID,inttostr(aCardType) + '0' + stReaderType);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.ReaderInfoChange(Sender: TObject);
var
  nReaderNo : integer;
  static_Text :TStaticText;
begin
  if Not isDigit(TComboBox(Sender).Hint) then Exit;
  nReaderNo := strtoint(TComboBox(Sender).Hint);
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_READERSETTING_FieldName(G_stSelectEcuID,'0',inttostr(nReaderNo),'READER_USE',inttostr(TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',nReaderNo).ItemIndex));
    dmDataBase.UpdateTB_READERSETTING_FieldName(G_stSelectEcuID,'0',inttostr(nReaderNo),'READER_DOOR',inttostr(TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor',nReaderNo).ItemIndex));
    dmDataBase.UpdateTB_READERSETTING_FieldName(G_stSelectEcuID,'0',inttostr(nReaderNo),'READER_NAME',inttostr(TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoorLocate',nReaderNo).ItemIndex));
    dmDataBase.UpdateTB_READERSETTING_FieldName(G_stSelectEcuID,'0',inttostr(nReaderNo),'READER_BUILDING',inttostr(TravelComboBoxItem(gb_CardReader,'cmb_ReaderBuildingLocate',nReaderNo).ItemIndex));
    dmDataBase.UpdateTB_READERSETTING_FieldName(G_stSelectEcuID,'0',inttostr(nReaderNo),'READERARMAREA',inttostr(TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',nReaderNo).ItemIndex + 1));
    dmDataBase.UpdateTB_READERSETTING_FieldName(G_stSelectEcuID,'0',inttostr(nReaderNo),'READER_SOUND',inttostr(TravelComboBoxItem(gb_CardReader,'cmb_ReaderSound',nReaderNo).ItemIndex));

    dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(G_stSelectEcuID,'0',inttostr(nReaderNo),'READER_USE','U');
    dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(G_stSelectEcuID,'0',inttostr(nReaderNo),'READER_DOOR','U');
    dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(G_stSelectEcuID,'0',inttostr(nReaderNo),'READER_NAME','U');
    dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(G_stSelectEcuID,'0',inttostr(nReaderNo),'READER_BUILDING','U');
    dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(G_stSelectEcuID,'0',inttostr(nReaderNo),'READERARMAREA','U');
    dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(G_stSelectEcuID,'0',inttostr(nReaderNo),'READER_SOUND','U');
    L_bSettingChanged := True;
  end;

  if G_bRealRegist then
  begin
    RegistCardReaderInfo(G_stSelectEcuID,
                         nReaderNo,
                         TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',nReaderNo).ItemIndex,
                         TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor',nReaderNo).ItemIndex,
                         //TravelSpinEditItem(gb_CardReader,'se_ReaderDoor',nReaderNo).Value,
                         TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoorLocate',nReaderNo).ItemIndex,
                         TravelComboBoxItem(gb_CardReader,'cmb_ReaderBuildingLocate',nReaderNo).ItemIndex,
                         TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',nReaderNo).ItemIndex + 1,
                         '' //위치명
                         );
    if TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',nReaderNo).ItemIndex = 1 then
    begin
      static_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',nReaderNo);
      if static_Text <> nil then
      begin
        static_Text.Caption := '체크중';
      end;
      if Not CardReaderVersionCheck(G_stSelectEcuID,nReaderNo) then
      begin
        if static_Text <> nil then
        begin
          static_Text.Caption := '실패';
          static_Text.Color := clRed;
        end;
      end;
    end else
    begin
      static_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',nReaderNo);
      if static_Text <> nil then
      begin
        static_Text.Caption := '';
        static_Text.Color := clYellow;
      end;
    end;
  end;

end;

function TfmCurrentDeviceSetting.RegistCardReaderInfo(aEcuID: string; aReaderNo,
  aReaderUse, aReaderDoor, aReaderDoorLocate,
  aReaderBuildingLocate,aReaderArmArea: integer; aLocate: string): Boolean;
var
  i : integer;
begin
  if aReaderUse = 1 then G_bCardReaderUse[aReaderNo] := True;
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '카드리더' + inttostr(aReaderNo) + ' 정보 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistCardReaderInfo(aEcuID,aReaderNo,
                    aReaderUse, aReaderDoor, aReaderDoorLocate,
                    aReaderBuildingLocate,aReaderArmArea,aLocate);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.AllPortCheck(aZoneExtNo:integer;aDirect:Boolean=False): Boolean;
var
  i : integer;
  bResult : Boolean;
  static_Text : TStaticText;
  nPortNumber : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;
  //Form_AllPort_ColorInitialize(0);
  Try
    ZoneControlEnable(False);
    nPortNumber := GetDeviceMaxPortNumber;
    for i := 1 to nPortNumber do
    begin
      bResult := PortInfoSearch(G_stSelectEcuID,i,aDirect);
      if Not bResult then
      begin
        if Application.MessageBox(Pchar(inttostr(i) + '번 감시존 조회시 문제가 발생 했습니다. 계속 하시겠습니까?'),'주의',MB_OKCANCEL) = IDCANCEL then Exit;
      end;
    end;
    AlartLampSirenStateCheck(G_stSelectEcuID,aDirect);
    AlertLampTimeCheck(G_stSelectEcuID,aDirect);
    AlertSirenTimeCheck(G_stSelectEcuID,aDirect);
    if Not aDirect then Exit;
{    for i:= 1 to nPortNumber do
    begin
      //static_Text := TravelTStaticTextItem(gb_CardReader,'st_ZoneState',i);
      static_Text := GetPortStaticText(aZoneExtNo,i,'st_ZoneState');
      if static_Text <> nil then
      begin
        static_Text.Caption := '체크중';
      end;
    end;  }
  Finally
    ZoneControlEnable(True);
  End;
end;

procedure TfmCurrentDeviceSetting.Form_AllPort_ColorInitialize(aZoneExtNo,aPortNo: integer);
var
  i : integer;
  cmb_box:TCombobox;
  static_Text :TStaticText;
  //nPortNumber : integer;
begin
  if aPortNo = 0 then
  begin
    for i := 1 to FIXMAXZONENO do
    begin
      cmb_Box := GetPortComboBox(aZoneExtNo,i,'cmb_WatchType');
      if cmb_Box <> nil then cmb_Box.Color := clWhite;
      cmb_Box := GetPortComboBox(aZoneExtNo,i,'cmb_WatchDelay');
      if cmb_Box <> nil then cmb_Box.Color := clWhite;
      cmb_Box := GetPortComboBox(aZoneExtNo,i,'cmb_recorver');
      if cmb_Box <> nil then cmb_Box.Color := clWhite;
      cmb_Box := GetPortComboBox(aZoneExtNo,i,'cmb_PortAlarmArea');
      if cmb_Box <> nil then cmb_Box.Color := clWhite;
      cmb_Box := GetPortComboBox(aZoneExtNo,i,'cmb_ZonUse');
      if cmb_Box <> nil then cmb_Box.Color := clWhite;
      static_Text := GetPortStaticText(aZoneExtNo,i,'st_ZoneState');
      if static_Text <> nil then
      begin
        static_Text.Caption := '';
        static_Text.Color := clWhite;
      end;
    end;
    cmb_alartLamp.Color := clWhite;
    ed_alertLampTime.Color := clWhite;
    cmb_alartSiren.Color := clWhite;
    ed_alertSirenTime.Color := clWhite;
  end else
  begin
    cmb_Box := GetPortComboBox(aZoneExtNo,aPortNo,'cmb_WatchType');
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    cmb_Box := GetPortComboBox(aZoneExtNo,aPortNo,'cmb_WatchDelay');
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    cmb_Box := GetPortComboBox(aZoneExtNo,aPortNo,'cmb_recorver');
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    cmb_Box := GetPortComboBox(aZoneExtNo,aPortNo,'cmb_PortAlarmArea');
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    cmb_Box := GetPortComboBox(aZoneExtNo,aPortNo,'cmb_ZonUse');
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    static_Text := GetPortStaticText(aZoneExtNo,aPortNo,'st_ZoneState');
    if static_Text <> nil then
    begin
      static_Text.Caption := '';
      static_Text.Color := clWhite;
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.ZoneStatusLoad;
var
  nPort,i,nExtZoneNo : integer;
  cmb_Box : TComboBox;
begin
  if ZoneStatusList.Count < 1 then Exit;

  for nExtZoneNo := 0 to FIXMAXZONEEXTENDNO do
  begin
    for nPort := 1 to G_nPortNumber do
    begin
      cmb_Box := GetPortComboBox(nExtZoneNo,nPort,'cmb_WatchType');

      if cmb_Box = nil then continue;
      cmb_Box.Items.Clear;
      for i := 0 to ZoneStatusList.Count - 1 do
      begin
        cmb_Box.Items.Add(ZoneStatusList.Strings[i]);
      end;
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.mn_FireRecoveryClick(Sender: TObject);
begin
  inherited;
//화재 복구
  AllFireRecovery;
end;

function TfmCurrentDeviceSetting.AllFireRecovery: Boolean;
var
  i : integer;
begin
  result := False;
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := dmSocket.AllFireRecovery;
    if result then Break;
  end;
  if result then
  begin
    ZoneSensState_Check;
  end;

end;

procedure TfmCurrentDeviceSetting.DoorControl(Sender: TObject);
var
  stDoorControl:string;
begin
  Form_DoorControl_Clear;
  stDoorControl := TRzBitBtn(Sender).Hint;
  RemoteDoorControl(G_stSelectEcuID,stDoorControl[1],stDoorControl[2],stDoorControl[3]);
end;

function TfmCurrentDeviceSetting.RemoteDoorControl(aEcuID, aDoorNo, aControlType,
  aControl: string): Boolean;
var
  i : integer;
begin
  result := False;
  if Not dmSocket.DeviceConnectCheck(aEcuID) then Exit;
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := dmSocket.RemoteDoorControl(aEcuID, aDoorNo, aControlType,aControl);
    if result then Break;
  end;

end;

procedure TfmCurrentDeviceSetting.RecvDoorState(aECUID, aDoorNo, aCardMode,
  aDoorMode, aDoorState,aDoorSchedule: string);
var
  stTemp : string;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;

  st_CtrDoorNum.Caption := aDoorNo;
  st_CtrDoorNum.Color := clYellow;
  case aCardMode[1] of
    '0': stTemp := 'Positive';
    '1': stTemp := 'Negative';
    '2': stTemp := 'Positive(2)';
    '3': stTemp := 'Negative(3)';
    else   stTemp := aCardMode ;
  end;
  st_CtrCardMode.Caption := stTemp;
  st_CtrCardMode.Color := clYellow;
  if aDoorSchedule = 'S' then
  begin
    case aDoorMode[1] of
      '0' : begin stTemp := '스케줄운영' end;
      '1' : begin stTemp := '스케줄개방' end;
      '2' : begin stTemp := '스케줄폐쇄' end;
      else begin stTemp := '알수 없음' end;
    end;
  end else
  begin
    case aDoorMode[1] of
      '0' : begin stTemp := '운영모드' end;
      '1' : begin stTemp := '개방모드' end;
      '2' : begin stTemp := '폐쇄모드' end;
      else begin stTemp := '알수 없음' end;
    end;
  end;


  st_CtrDoorMode.Caption := stTemp;
  st_CtrDoorMode.Color := clYellow;
  case aDoorState[1] of
    'C' : begin stTemp := '출입문닫힘' end;
    'O' : begin stTemp := '출입문열림' end;
    'T' : begin stTemp := '출입문장시간열림' end;
    'U' : begin stTemp := '출입문해정이상' end;
    'L' : begin stTemp := '출입문시정이상' end;
    else begin stTemp := '알수 없음' end;
  end;
  st_CtrDoorState.Caption := stTemp;
  st_CtrDoorState.Color := clYellow;

end;

procedure TfmCurrentDeviceSetting.Form_DoorControl_Clear;
begin
  st_CtrDoorNum.Caption := '';
  st_CtrDoorNum.Color := clWhite;
  st_CtrCardMode.Caption := '';
  st_CtrCardMode.Color := clWhite;
  st_CtrDoorMode.Caption := '';
  st_CtrDoorMode.Color := clWhite;
  st_CtrDoorState.Caption := '';
  st_CtrDoorState.Color := clWhite;
end;

procedure TfmCurrentDeviceSetting.ZoneRecoverLoad;
var
  nPort,nExtZoneNo : integer;
  cmb_Box : TComboBox;
begin
  for nExtZoneNo := 0 to FIXMAXZONEEXTENDNO do
  begin
    for nPort := 1 to G_nPortNumber do
    begin
      cmb_Box := GetPortComboBox(nExtZoneNo,nPort,'cmb_recorver');

      if cmb_Box = nil then continue;
      cmb_Box.Items.Clear;
      cmb_Box.Items.Add('미전송');
      cmb_Box.Items.Add('전송');
      if cmb_Box.Items.Count > 0 then
      begin
        cmb_Box.ItemIndex := 0;
      end;
    end;
  end;

end;

function TfmCurrentDeviceSetting.PortInfoSearch(aEcuID: string;
  nPortNo: integer;aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    result := True;
    if dmDataBase.GetTB_ZONESETTINGRCV_Value(aEcuID,'0',inttostr(nPortNo),'PORT_TYPE') = 'Y' then Exit;
  end;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '포트' + inttostr(nPortNo) +'번 정보 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.PortInfo_Check(aEcuID,inttostr(nPortNo));
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.RecvPortSettingData(aECUID, aPort, aWatchType,
  aAlarmType, aRecoverType, aDelayTimeType, aPortLocate,
  aDetectTime,aZoneArmArea,aZoneUse: string);
var
  nPort : integer;
  cmb_Box : TComboBox;
  stParentWatchType : string;
  nParentIndex : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  nPort := strtoint(aPort);
  GetWatchTypeName(aAlarmType,stParentWatchType,nParentIndex);
  cmb_Box := GetPortComboBox(0,nPort,'cmb_WatchType');  //로컬에서 올라온 정보
  if cmb_Box <> nil then
  begin
    cmb_Box.Text := stParentWatchType;
    cmb_Box.ItemIndex := nParentIndex;
    cmb_Box.Color := clYellow;
  end;
  cmb_Box := GetPortComboBox(0,nPort,'cmb_WatchDelay');
  if cmb_Box <> nil then
  begin
//    cmb_Box.Text := stDetailWatchType;
    if isdigit(aDelayTimeType) then
      cmb_Box.ItemIndex := strtoint(aDelayTimeType);
    cmb_Box.Color := clYellow;
  end;

  cmb_Box := GetPortComboBox(0,nPort,'cmb_recorver');
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex := strtoint(aRecoverType);
    cmb_Box.Color := clYellow;
  end;
  cmb_Box := GetPortComboBox(0,nPort,'cmb_PortAlarmArea');
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex := strtoint(aZoneArmArea) - 1;
    if cmb_Box.ItemIndex < 0 then cmb_Box.ItemIndex := 0;
    cmb_Box.Color := clYellow;
  end;
  cmb_Box := GetPortComboBox(0,nPort,'cmb_ZonUse');
  if cmb_Box <> nil then
  begin
    if isDigit(aZoneUse) then
    begin
      cmb_Box.ItemIndex := strtoint(aZoneUse);
      if cmb_Box.ItemIndex < 0 then cmb_Box.ItemIndex := 0;
      cmb_Box.Color := clYellow;
    end;
  end;
  L_bSettingChanged := False;

end;

function TfmCurrentDeviceSetting.GetWatchTypeName(aAlarmType: string;
  var aParentWatchType: string;var aParentIndex:integer): Boolean;
var
  i : integer;
  nIndex : integer;
begin
  result := False;
  //nIndex := ZoneStatusCodeList.IndexOf(aAlarmType);
  //if nIndex < 0 then nIndex := 0;
  if Not isdigit(aAlarmType) then Exit;

  aParentWatchType := ZoneStatusList.Strings[strtoint(aAlarmType)];
  aParentIndex := strtoint(aAlarmType);

end;

function TfmCurrentDeviceSetting.PortStateCheck(aEcuID: string): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '존 상태 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.PortState_Check(aEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.Port_ShortOpenCheck(aData: string);
var
  stZoneState : string;
  i : integer;
  nIndex : integer;
  stZoneStateName : string;
  static_Text : TStaticText;
  nPortNumber : integer;
begin
  nPortNumber := GetDeviceMaxPortNumber;
  stZoneState := copy(aData,2,nPortNumber);
  for i := 1 to nPortNumber do
  begin
    static_Text := TravelTStaticTextItem(gb_LocalPortState,'st_ZoneState',i);
    if static_Text = nil then continue;

    static_Text.Color := clYellow;
    if i <= Length(stZoneState) then
    begin
      stZoneStateName := '';

      nIndex := ZoneStateCodeList.IndexOf(stZoneState[i]);
      if nIndex > -1 then
        stZoneStateName := ZoneStateNameList.Strings[nIndex];
      static_Text.Caption := stZoneStateName;
      if stZoneState[i] = 'N' then static_Text.Color := clYellow
      else static_Text.Color := clRed;
    end;
  end;
  if nPortNumber < FIXMAXZONENO then
  begin
    for i := nPortNumber + 1 to FIXMAXZONENO do
    begin
      static_Text := TravelTStaticTextItem(gb_LocalPortState,'st_ZoneState',i);
      if static_Text = nil then continue;

      static_Text.Caption := '미사용';
      static_Text.Color := clGreen;
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.ZoneStateLoad;
begin
  if ZoneStateNameList = nil then
    ZoneStateNameList := TStringList.Create;
  if ZoneStateCodeList = nil then
    ZoneStateCodeList := TStringList.Create;
  ZoneStateNameList.Clear;
  ZoneStateNameList.Add('단선');
  ZoneStateNameList.Add('정상');
  ZoneStateNameList.Add('쇼트');
  ZoneStateNameList.Add('통신단선');
  ZoneStateNameList.Add('불량');
  ZoneStateNameList.Add('미등록');

  ZoneStateCodeList.Clear;
  ZoneStateCodeList.Add('P');
  ZoneStateCodeList.Add('N');
  ZoneStateCodeList.Add('S');
  ZoneStateCodeList.Add('?');
  ZoneStateCodeList.Add('*');
  ZoneStateCodeList.Add('u');

end;

procedure TfmCurrentDeviceSetting.cmb_WatchTypeClick(Sender: TObject);
var
  nPortNo : integer;
  stStatusCode : string;
  cmb_Box : TComboBox;
  nWatchType : integer;
  stWatchTypeCode : string;
  nZoneArmArea : integer;
  nZoneUsed : integer;
  nIndex : integer;
begin

  if Not isDigit(TComboBox(Sender).Hint) then Exit;

  nPortNo := strtoint(TComboBox(Sender).Hint);

  cmb_Box := GetPortComboBox(0,nPortNo,'cmb_WatchType');
  nWatchType := 0;
  if cmb_Box <> nil then nWatchType := cmb_Box.ItemIndex;

  if copy(TComboBox(Sender).Name,1,Length('cmb_WatchType')) = 'cmb_WatchType' then
  begin
    if (nWatchType > 0) and (nWatchType < 5) then
    begin
      //24시간존 시 복구신호전송하자.
      if L_nOldWhatchType <> nWatchType then GetPortComboBox(0,nPortNo,'cmb_recorver').ItemIndex := 1;
    end else
    begin
      if L_nOldWhatchType <> nWatchType then GetPortComboBox(0,nPortNo,'cmb_recorver').ItemIndex := 0;
    end;
    L_nOldWhatchType := nWatchType;
  end;

  stWatchTypeCode := GetWatchTypeCode(nPortNo,nWatchType);
  nZoneArmArea := 1;
  cmb_Box := GetPortComboBox(0,nPortNo,'cmb_PortAlarmArea');
  if cmb_Box <> nil then nZoneArmArea := cmb_Box.ItemIndex + 1;
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse then nZoneArmArea := 0;
  nZoneUsed := 0;
  cmb_Box := GetPortComboBox(0,nPortNo,'cmb_ZonUse');
  if cmb_Box <> nil then nZoneUsed := cmb_Box.ItemIndex;
  if nZoneUsed < 0 then nZoneUsed := 0;

  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_ZONESETTING_FieldName(G_stSelectEcuID,'0',inttostr(nPortNo),'PORT_TYPE',inttostr(nWatchType));
    dmDataBase.UpdateTB_ZONESETTING_FieldName(G_stSelectEcuID,'0',inttostr(nPortNo),'PORT_DELAY',inttostr(GetPortComboBox(0,nPortNo,'cmb_WatchDelay').ItemIndex));
    dmDataBase.UpdateTB_ZONESETTING_FieldName(G_stSelectEcuID,'0',inttostr(nPortNo),'PORT_RECORVER',inttostr(GetPortComboBox(0,nPortNo,'cmb_recorver').ItemIndex));
    dmDataBase.UpdateTB_ZONESETTING_FieldName(G_stSelectEcuID,'0',inttostr(nPortNo),'ZONEARMAREA',inttostr(nZoneArmArea));
    dmDataBase.UpdateTB_ZONESETTING_FieldName(G_stSelectEcuID,'0',inttostr(nPortNo),'PORT_ZONEUSE',inttostr(nZoneUsed));


    dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(G_stSelectEcuID,'0',inttostr(nPortNo),'PORT_TYPE','U');
    dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(G_stSelectEcuID,'0',inttostr(nPortNo),'PORT_DELAY','U');
    dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(G_stSelectEcuID,'0',inttostr(nPortNo),'PORT_RECORVER','U');
    dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(G_stSelectEcuID,'0',inttostr(nPortNo),'ZONEARMAREA','U');
    dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(G_stSelectEcuID,'0',inttostr(nPortNo),'PORT_ZONEUSE','U');
    L_bSettingChanged := True;

    if G_bRealRegist then
    begin
      RegistPortInfo(G_stSelectEcuID,
                           inttostr(nPortNo),
                           inttostr(nWatchType),
                           stWatchTypeCode,
                           '0', //지연시간 사용유무
                           inttostr(GetPortComboBox(0,nPortNo,'cmb_recorver').ItemIndex),
                           '04', //포트감지시간
                           FillZeroNumber(nZoneArmArea,2),
                           '', //위치명
                           inttostr(nZoneUsed)
                           );
    end;
  end;


end;

function TfmCurrentDeviceSetting.GetPortComboBox(nExtZoneNo,nPortNo: integer;
  aComboBoxName: string): TComboBox;
begin
  result := nil;
  if nExtZoneNo = 0 then result := TravelComboBoxItem(gb_Port,aComboBoxName,nPortNo)
  else if nExtZoneNo = 1 then result := TravelComboBoxItem(gb_Port1,aComboBoxName + '1',nPortNo)
  else if nExtZoneNo = 2 then result := TravelComboBoxItem(gb_Port2,aComboBoxName + '2',nPortNo)
  else if nExtZoneNo = 3 then result := TravelComboBoxItem(gb_Port3,aComboBoxName + '3',nPortNo)
  else if nExtZoneNo = 4 then result := TravelComboBoxItem(gb_Port4,aComboBoxName + '4',nPortNo)
  else if nExtZoneNo = 5 then result := TravelComboBoxItem(gb_Port5,aComboBoxName + '5',nPortNo)
  else if nExtZoneNo = 6 then result := TravelComboBoxItem(gb_Port6,aComboBoxName + '6',nPortNo)
  else if nExtZoneNo = 7 then result := TravelComboBoxItem(gb_Port7,aComboBoxName + '7',nPortNo)
  else if nExtZoneNo = 8 then result := TravelComboBoxItem(gb_Port8,aComboBoxName + '8',nPortNo);

end;

function TfmCurrentDeviceSetting.GetPortStaticText(aZoneExtNo,nPortNo: integer;
  aName: string): TStaticText;
begin
  result := nil;
  if aZoneExtNo = 0 then result := TravelTStaticTextItem(gb_Port,aName,nPortNo)
  else if aZoneExtNo = 1 then result := TravelTStaticTextItem(gb_Port1,aName + '1',nPortNo)
  else if aZoneExtNo = 2 then result := TravelTStaticTextItem(gb_Port2,aName + '2',nPortNo)
  else if aZoneExtNo = 3 then result := TravelTStaticTextItem(gb_Port3,aName + '3',nPortNo)
  else if aZoneExtNo = 4 then result := TravelTStaticTextItem(gb_Port4,aName + '4',nPortNo)
  else if aZoneExtNo = 5 then result := TravelTStaticTextItem(gb_Port5,aName + '5',nPortNo)
  else if aZoneExtNo = 6 then result := TravelTStaticTextItem(gb_Port6,aName + '6',nPortNo)
  else if aZoneExtNo = 7 then result := TravelTStaticTextItem(gb_Port7,aName + '7',nPortNo)
  else if aZoneExtNo = 8 then result := TravelTStaticTextItem(gb_Port8,aName + '8',nPortNo);

end;


function TfmCurrentDeviceSetting.RegistPortInfo(aEcuID, aPortNo, aWatchType,aWatchTypeCode,
  aDelayUse, aRecoverUse, aPortDelayTime,aZoneArmArea,
  aLocate,aZoneUsed: string): Boolean;
var
  i : integer;
//  stStatusCode : string;
begin
//  Form_AllPort_ColorInitialize(strtoint(aPortNo));

{  stStatusCode := 'S' + aPortNo;
  if aWatchType = '1' then stStatuscode := 'FI'
  else if aWatchType = '2' then stStatuscode := 'G1'
  else if aWatchType = '3' then stStatuscode := 'E1'
  else if aWatchType = '4' then stStatuscode := 'Q1'
  else if aWatchType = '5' then stStatuscode := 'CL'; }

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '포트' + aPortNo + ' 정보 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistPortInfo(aEcuID, aPortNo, aWatchType,
                        aDelayUse, aRecoverUse, aPortDelayTime, aWatchTypeCode,
                        aZoneArmArea,aLocate,aZoneUsed);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.Form_MCUSetting_Initialize;
begin
  Form_ControllerID_ColorInitialize;
  Form_UsedDevice_ColorInitialize;
  Form_KTTSystem_ColorInitialize;
  Form_WizenetModule_ColorInitialize;
  Form_CDMA_ColorInitialize;

end;

procedure TfmCurrentDeviceSetting.btn_UseControlerSearchClick(Sender: TObject);
var
  nIndex : integer;
  i : integer;
begin
  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then
  begin
    showmessage('통신에러');
    Exit;
  end;
  Try
    Screen.Cursor := crHourGlass;
    btn_UseControlerSearch.Enabled := False;
    btn_Registration.Enabled := False;
    btn_Next.Enabled := False;
    pg_DeviceSetting.Enabled := False;

    nIndex := DeviceList.IndexOf(G_stSelectEcuID);
    if nIndex < 0 then Exit;
    if pg_DeviceSetting.ActivePage = TabMCSetting then
    begin
      MCUSettingSearch(True);
    end else if pg_DeviceSetting.ActivePage = TabArmExtension then
    begin
      ArmExtensionSearch(True);
    end else if pg_DeviceSetting.ActivePage = TabSystemInfo then
    begin
      if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT812 then
      begin
        SearchRelay2TypeCheck(G_stSelectEcuID);
        CheckJaejungDelayUse(G_stSelectEcuID);
      end;
      SystemInfoSearch(G_stSelectEcuID,True);
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill then //구역경계기능
        SystemDoorArmAreaSearch(G_stSelectEcuID,True);
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then //존확장 기능
        SystemZoneExtensionUseSearch(G_stSelectEcuID,True);
      ServerCardNFSearch(G_stSelectEcuID,True);
      //CurrentAlarmStateSearch(True); --현재 방범상태는 체크하지 말자
    end else if pg_DeviceSetting.ActivePage = tab_DoorLock then
    begin
      if pgDoorLockSetting.ActivePage = tabLock_Controler then
      begin
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo > 0 then
        begin
           DoorSystemInfoSearch(G_stSelectEcuID,'1',True);
           DoorDSCheckTimeSearch(G_stSelectEcuID,'1',True);
           if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
              SearchArmDsCheck(G_stSelectEcuID,'1',True);
           SearchJavaraArmClose(G_stSelectEcuID,True);
           SearchJavaraAutoClose(G_stSelectEcuID,True);
           if TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType = KT811 then
           begin
            SearchJavaraStopTime(G_stSelectEcuID,True);
           end;
        end;
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo > 1 then
        begin
          if (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812) and
             (TCurrentDeviceState(DeviceList.Objects[nIndex]).RELAY2TYPE = 0) then Exit; //락 2에서는 조회 하지 말자.
          DoorSystemInfoSearch(G_stSelectEcuID,'2',True);
          DoorDSCheckTimeSearch(G_stSelectEcuID,'2',True);
          if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
              SearchArmDsCheck(G_stSelectEcuID,'2',True);
        end;
      end else if pg_DeviceSetting.ActivePage = tab_TimeCode then
      begin
        FormTimeCodeSetting(G_stSelectEcuID,true);
        if (G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT811) OR (G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT813) OR (G_stDeviceType[strtoint(G_stSelectEcuID)] = SGS100) then
        begin
          SearchDoorTimeCodeUse(G_stSelectEcuID,True);
          SearchTimeCode(G_stSelectEcuID,True);
        end;
      end else if pgDoorLockSetting.ActivePage = tabLockExtention then
      begin
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo < 3 then Exit;
        for i := 3 to TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo do
        begin
          DoorSystemInfoSearch(G_stSelectEcuID,inttostr(i),True);
          DoorDSCheckTimeSearch(G_stSelectEcuID,inttostr(i),True);
          if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
              SearchArmDsCheck(G_stSelectEcuID,inttostr(i),True);
        end;
      end;
    end else if pg_DeviceSetting.ActivePage = tab_CardReader then
    begin
      ReaderControlEnable(False);
      CardReaderTypeSearch(True);
      CardReaderSoundUseCheck(True);
      CardReaderExitSoundUseCheck(True);
      AllCardReaderCheck(TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxReaderNo,True);
      ReaderControlEnable(True);
    end else if pg_DeviceSetting.ActivePage = Tab_Port then
    begin
      if pg_PortSetting.ActivePage = tab_LocalPort then AllPortCheck(0,True)
      else
      begin
        if pg_ExtensionPort.ActivePage <> nil then
          AllZoneExtensionCheck((pg_ExtensionPort.ActivePage).Tag,True);
      end;
    end else if pg_DeviceSetting.ActivePage = Tab_CardReaderTel then
    begin
      Form_AllCardReaderTel_ColorInitialize;
      CardReaderCallTimeSearch(True);
      CardReaderTellNoCheck(True);
    end else if pg_DeviceSetting.ActivePage = tabArmAreaSearch then
    begin
      SearchArmAreaSetting;
    end else if pg_DeviceSetting.ActivePage = tabDeviceState then
    begin
      if pg_DeviceState.ActivePage = tabLockState then
      begin
        DoorLockDeviceStateCheck;
        ZoneSensState_Check;
        CurrentAlarmStateSearch(G_stSelectEcuID,True);
      end else if pg_DeviceState.ActivePage = tabPortState then
      begin
        PortStateCheck(G_stSelectEcuID);
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then
           ZoneExtentionPortStateCheck(G_stSelectEcuID);
      end;
    end else if pg_DeviceSetting.ActivePage = tab_Police then
    begin
      Form_AllPoliceTel_ColorInitialize;
      PoliceTel_Check(1);
      PoliceTel_Check(2);
    end;
    FormDeviceSetting(G_stSelectEcuID);
  Finally
    if L_bFormActive then
    begin
      btn_UseControlerSearch.Enabled := True;
      btn_Registration.Enabled := True;
      if pg_DeviceSetting.ActivePageIndex = pg_DeviceSetting.PageCount - 1 then btn_Next.Enabled := False
      else btn_Next.Enabled := True;
      pg_DeviceSetting.Enabled := True;
    end;
    Screen.Cursor := crDefault;
  end;

end;

procedure TfmCurrentDeviceSetting.Form_SystemInfo_Initialize;
begin
  Form_SystemInfo_ColorInitialize;
  Form_AlarmState_ColorInitialize;
end;

procedure TfmCurrentDeviceSetting.Form_DoorSystemInfo_Initialize;
begin
  Form_DoorSystem_ColorInitialize('1');
  Form_DoorSystem_ColorInitialize('2');
  Form_DoorLockDeviceState_Clear;
  Form_AlarmState_Clear;
  Form_AlarmState_ColorInitialize;
  Form_DoorControl_Clear;

end;

procedure TfmCurrentDeviceSetting.Form_CardReader_Initialize;
begin
  Form_CardReaderType_ColorInitialize;
  Form_AllCardReader_ColorInitialize(0);
end;

procedure TfmCurrentDeviceSetting.Form_Port_Initialize;
var
  nExtZoneNo : integer;
begin
  for nExtZoneNo := 0 to FIXMAXZONEEXTENDNO do
  begin
    Form_AllPort_ColorInitialize(nExtZoneNo,0);
  end;
  Port_DoorEnabelCheck(G_stSelectEcuID);
end;

procedure TfmCurrentDeviceSetting.Form_ECUChange_Initialize;
begin
  Form_DeviceVersion_Clear;
  Form_DeviceCode_Clear;
end;

procedure TfmCurrentDeviceSetting.btn_RegistrationClick(Sender: TObject);
begin
  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then
  begin
    showmessage('통신에러');
    Exit;
  end;
  Try
    Screen.Cursor := crHourGlass;
    btn_UseControlerSearch.Enabled := False;
    btn_Registration.Enabled := False;
    btn_Next.Enabled := False;
    pg_DeviceSetting.Enabled := False;

    if pg_DeviceSetting.ActivePage = TabMCSetting then
    begin
      Form_MCUSetting_Initialize;
      MCUSetting_Registration;
    end else if pg_DeviceSetting.ActivePage = TabArmExtension then
    begin
      Form_ArmExtension_Initialize;
      ArmExtension_Registration;
    end else if pg_DeviceSetting.ActivePage = TabSystemInfo then
    begin
      Form_SystemInfo_Initialize;
      if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT812 then
      begin
        Relay2Type_Registration(G_stSelectEcuID);
        JaejungDelayUse_Registration(G_stSelectEcuID);
      end;
      SystemInfo_Registration;
      ServerCardNF_Registration;
      //CurrentAlarmStateSearch;
    end else if pg_DeviceSetting.ActivePage = tab_DoorLock then
    begin
      Form_DoorSystemInfo_Initialize;
      if pgDoorLockSetting.ActivePage = tabLock_Controler then
      begin
        DoorSystemInfo_Registration;
      end else if pgDoorLockSetting.ActivePage = tabLockExtention then
      begin
        DoorExtensionSystemInfo_Registration;
      end;
    end else if pg_DeviceSetting.ActivePage = tab_TimeCode then
    begin
      FormTimeCode_ColorInitialize;
      if (G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT811) OR (G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT813) OR (G_stDeviceType[strtoint(G_stSelectEcuID)] = SGS100) then
      begin
        DoorTimeCodeUse_Registration;
        TimeCode_Registration('0');
        Delay(500);
        TimeCode_Registration('1');
      end;
    end else if pg_DeviceSetting.ActivePage = tab_CardReader then
    begin
      //ComboBox_WatchPowerOffClick(self);
      ReaderControlEnable(False);

      Form_CardReader_Initialize;

      AllCardReader_Registration;
      ReaderControlEnable(True);
    end else if pg_DeviceSetting.ActivePage = Tab_Port then
    begin
      Form_Port_Initialize;
      if pg_PortSetting.ActivePage = tab_LocalPort then
      begin
        AllPort_Registration(0);
      end else if pg_PortSetting.ActivePage = tab_ExtensionPort then
      begin
        ZoneExtensionPort_Registration((pg_ExtensionPort.ActivePage).Tag);
      end;
      //PortStateCheck(G_stSelectEcuID);
    end else if pg_DeviceSetting.ActivePage = Tab_CardReaderTel then
    begin
      Form_AllCardReaderTel_ColorInitialize;
      CardReaderCallTime_Registration;
      CardReaderTellNo_Registration;
    end else if pg_DeviceSetting.ActivePage = tab_Police then
    begin
      Form_AllPoliceTel_ColorInitialize;
      PoliceTel_Registration(1);
      PoliceTel_Registration(2);
    end;
    L_bSettingChanged := False;
    FormDeviceSetting(G_stSelectEcuID);
  Finally
    if L_bFormActive then
    begin
      btn_UseControlerSearch.Enabled := True;
      btn_Registration.Enabled := True;
      if pg_DeviceSetting.ActivePageIndex = pg_DeviceSetting.PageCount - 1 then btn_Next.Enabled := False
      else btn_Next.Enabled := True;
      pg_DeviceSetting.Enabled := True;
    end;
    Screen.Cursor := crDefault;
  End;

end;

procedure TfmCurrentDeviceSetting.MCUSetting_Registration;
var
  stUseEcu : string;
  stDeviceType : string;
  stPrimary : string;
  nIndex : integer;
begin
  MCUControlEnable(False);
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then Exit;
  RegistControllerID(ed_mcid.Text);
  if L_bEcuRegist then
  begin
    stUseEcu := GetEcu;
    RegistUsedDevice(stUseEcu);
  end;
  stDeviceType := GetDeviceType;
  RegistUsedDeviceType(stDeviceType);
  stPrimary := '1';
  if rb_tcpip.Checked then stPrimary := '2';
  if rb_wcdma.Checked then stPrimary := '3';
  RegistPrimaryKTT(stPrimary);   //전용선 유무 등록
  if Not rb_Dedicated.Checked then
  begin
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType <> AUTOKT811 then
       RegistKTTMuxID(ed_Mux.Text);   //전용선 유무 등록
  end;
  if Not IsDigit(Edit_LinkusID.Text) then Edit_LinkusID.Text := 'AAAA'
  else Edit_LinkusID.Text := FillZeroNumber(strtoint(Edit_LinkusID.Text),4);
  RegistKTTSystemID(Edit_LinkusID.Text);
  RegistKTTTelNum('0',Edit_LinkusTel.Text);
  RegistKTTTelNum('1',Edit_LinkusTel2.Text);
  RegistKTTRingCount(Spinner_Ring.Value,Spinner_cancelRing.Value);

  //if G_nConnectMode = 1 then btn_WizNetSettingClick(self);  //시리얼 접속인 경우
  //RegistCCCInfo;
  MCUControlEnable(True);
end;

function TfmCurrentDeviceSetting.WiznetModuleInfoSearch: Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  Form_WizenetModule_ColorInitialize;
  if (G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT811) or (G_stDeviceType[strtoint(G_stSelectEcuID)] = SGS100) then
  begin
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      result := dmSocket.WiznetModuleInfo_Check;
      if result then Break;
    end;
  end else
  begin
     result := dmSocket.WiznetModuleInfo_Check(False);
  end;
end;

procedure TfmCurrentDeviceSetting.Form_WizenetModule_ColorInitialize;
begin
  Edit_IP.Color := clWhite;
  Edit_subnet.Color := clWhite;
  edit_Gateway.Color := clWhite;
  edit_port.Color := clWhite;
  ed_server.Color := clWhite;
  ed_ServerPort.Color := clWhite;
  Rg_Mode.Color := clBtnFace;
end;

procedure TfmCurrentDeviceSetting.RecvWiznetInfo(aECUID, aHeader, aMacAddress,
  aMode, aIPAddress, aSubnet, aGateway, aClientPort, aServerIP,
  aServerPort, aSerial_Baud, aSerial_data, aSerial_Parity, aSerial_stop,
  aSerial_flow, aDelimiterChar, aDelimiterSize, aDelimitertime,
  aDelimiterIdle, aDebugMode, aROMVer, aOnDHCP, aReserve: string);
var
  i : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  Edit_IP.Text := aIPAddress;
  Edit_IP.Color := clYellow;

  Edit_subnet.Text := aSubnet;
  Edit_subnet.Color := clYellow;


  edit_Gateway.Text := aGateway;
  edit_Gateway.Color := clYellow;

  edit_port.Text := aClientPort;
  edit_port.Color := clYellow;

  ed_server.Text := aServerIP;
  ed_server.Color := clYellow;

  ed_ServerPort.Text := aServerPort;
  ed_ServerPort.Color := clYellow;

  if aMode = '00' then Rg_Mode.ItemIndex := 1           //Client Mode
  else Rg_Mode.ItemIndex := 0;

  if aOnDHCP = '01' then chk_DHCP.Checked := True
  else chk_DHCP.Checked := False;
  L_bSettingChanged := False;

  editMAC1.Color:= clYellow;
  editMAC2.Color:= clYellow;
  editMAC3.Color:= clYellow;
  editMAC4.Color:= clYellow;
  editMAC5.Color:= clYellow;
  editMAC6.Color:= clYellow;

  editMAC1.Text:= Copy(aMacAddress,1,2);
  editMAC2.Text:= Copy(aMacAddress,3,2);
  editMAC3.Text:= Copy(aMacAddress,5,2);
  editMAC4.Text:= Copy(aMacAddress,7,2);
  editMAC5.Text:= Copy(aMacAddress,9,2);
  editMAC6.Text:= Copy(aMacAddress,11,2);

end;

procedure TfmCurrentDeviceSetting.SystemInfo_Registration;
var
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then Exit;

  SystemControlEnable(False);
  RegistSystemInfo;
  //if G_stDeviceType[strtoint(G_stSelectEcuID)] <> KTT811 then
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType <> AUTOKT811 then RegistArmRelay(G_stSelectEcuID,inttostr(cmb_ArmRelay.ItemIndex));

  if nIndex > -1 then
  begin
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill then
    begin
      if chk_DoorArmAreaUse.Checked then
      begin
        RegistArmAreaUse(G_stSelectEcuID,'1');
        RegistDoorArmArea(G_stSelectEcuID);
      end else RegistArmAreaUse(G_stSelectEcuID,'0');
    end;
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then
    begin
      RegistZoneExtensionUse(G_stSelectEcuID);
    end;
  end;

  SystemControlEnable(True);
end;

procedure TfmCurrentDeviceSetting.DoorSystemInfo_Registration;
var
  nDoorMaxNo : integer;
  nIndex : integer;
  stDeviceType : string;
  nRelay2Type : integer; //0:락2 미사용,1:사용
  stArmJavaraClose :string;
  stJavaraAutoClose : string;
  stData : string;
begin
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then
  begin
    stDeviceType := G_stDeviceType[strtoint(G_stSelectEcuID)];
    nRelay2Type := 0;
  end else
  begin
    stDeviceType := TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType;
    nRelay2Type := TCurrentDeviceState(DeviceList.Objects[nIndex]).RELAY2TYPE;
  end;

  nDoorMaxNo := GetDeviceMaxDoorNumber;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
  begin
    //데드볼트시 경계시 문열림 사용으로 되어 있는지 체크 하자.
    if Not CheckArmDsANDDeadBoltLockType(1) then
    begin
      showmessage('출입문1 데드볼트에서만 경계시 문열림검사를 수행 할 수 있습니다.');
      Exit;
    end;
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).RELAY2TYPE > 0 then
    begin
      if Not CheckArmDsANDDeadBoltLockType(2) then
      begin
        showmessage('출입문2 데드볼트에서만 경계시 문열림검사를 수행 할 수 있습니다.');
        Exit;
      end;
    end;
  end;
  LockControlEnable('1',False);
  LockControlEnable('2',False);
  if nDoorMaxNo > 0 then
  begin
    RegistDoorSystyemInfo('1');
    if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT812 then
       RegistArmDsCheck(G_stSelectEcuID,'1',inttostr(cmb_ArmDSCheck1.ItemIndex));
    stArmJavaraClose := '0';
    if chk_ArmJavaraClose.Checked then stArmJavaraClose := '1';
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).JavaraScheduleSkill then RegistJavaraArmClose(G_stSelectEcuID,stArmJavaraClose);
    stJavaraAutoClose := '0';
    if chk_JavaraAutoClose.Checked then stJavaraAutoClose := '1';
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).JavaraScheduleSkill then RegistJavaraAutoClose(G_stSelectEcuID,stJavaraAutoClose);
    //if TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType = KT811 then
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).JavaraScheduleSkill then
    begin
      stData := copy(FillZeroStrNum(ed_OpenStop.Text,5),1,3) + ' ' + copy(FillZeroStrNum(ed_CloseStop.Text,5),1,3) + ' ' + copy(FillZeroStrNum(ed_StopDelay.Text,5),1,3);
      RegistJavaraStopTime(G_stSelectEcuID,stData);
    end;
  end;
  if nDoorMaxNo > 1 then
  begin
    if stDeviceType = KTT812 then
    begin
      if nRelay2Type > 0 then
      begin
        RegistDoorSystyemInfo('2');
        RegistArmDsCheck(G_stSelectEcuID,'2',inttostr(cmb_ArmDSCheck2.ItemIndex));
      end;
    end else
    begin
      RegistDoorSystyemInfo('2');
    end;
  end;
  LockControlEnable('1',True);
  LockControlEnable('2',True);
end;

procedure TfmCurrentDeviceSetting.AllCardReader_Registration;
var
  i : integer;
begin
  if (cb_CardType.ItemIndex < 0) or (cb_CardType.ItemIndex > 4) then cb_CardType.ItemIndex := 0;

  RegistCardType(G_stSelectEcuID,cb_CardType.ItemIndex);
  RegistCardReaderSound(G_stSelectEcuID);
  RegistCardReaderExitSound(G_stSelectEcuID);

  for i := 1 to G_nCardReaderNumber do
  begin
      RegistCardReaderInfo(G_stSelectEcuID,
                         i,
                         TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',i).ItemIndex,
                         TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor',i).ItemIndex,
                         //TravelSpinEditItem(gb_CardReader,'se_ReaderDoor',i).Value,
                         TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoorLocate',i).ItemIndex,
                         TravelComboBoxItem(gb_CardReader,'cmb_ReaderBuildingLocate',i).ItemIndex,
                         TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',i).ItemIndex + 1,
                         '' //위치명
                         );
  end;


end;

procedure TfmCurrentDeviceSetting.AllPort_Registration(aExtNo:integer);
var
  i : integer;
//  stStatusCode : string;
  cmb_Box : TComboBox;
  nDelay : integer;
  nPortNumber : integer;
  nWatchType : integer;
  stWatchTypeCode : string;
  nZoneArmArea : integer;
  nZoneUse : integer;
  nIndex : integer;
begin
  if Not CheckPortDelayTime(aExtNo) then
  begin
    showmessage('포트 지연시간 적용시 입퇴실지연시간이 0초 보다 커야 합니다.');
    Exit;
  end;
  ZoneControlEnable(False);
  nPortNumber := GetDeviceMaxPortNumber;
  for i:= 1 to nPortNumber do
  begin
    cmb_Box := GetPortComboBox(aExtNo,i,'cmb_WatchType');
    nWatchType := 0;
    if cmb_Box <> nil then nWatchType := cmb_Box.ItemIndex;

    stWatchTypeCode := GetWatchTypeCode(i,nWatchType);

    nDelay := 0;
    cmb_Box := GetPortComboBox(aExtNo,i,'cmb_WatchDelay');
    if cmb_Box <> nil then
    begin
      nDelay := cmb_Box.ItemIndex;
    end;
    if nWatchType > 0 then nDelay := 0;   //지연시간은 방범-경계 모드에만 필요함
    nZoneArmArea := 1;
    cmb_Box := GetPortComboBox(aExtNo,i,'cmb_PortAlarmArea');
    if cmb_Box <> nil then
    begin
      nZoneArmArea := cmb_Box.ItemIndex + 1;
    end;
    nIndex := DeviceList.IndexOf(G_stSelectEcuID);
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse then nZoneArmArea := 0;
    nZoneUse := 0;
    cmb_Box := GetPortComboBox(aExtNo,i,'cmb_ZonUse');
    if cmb_Box <> nil then
    begin
      nZoneUse := cmb_Box.ItemIndex;
      if nZoneUse < 0 then nZoneUse := 1;
    end;


    RegistPortInfo(G_stSelectEcuID,
                         inttostr(i),
                         inttostr(nWatchType),
                         stWatchTypeCode,
                         inttostr(nDelay), //지연시간 사용유무
                         inttostr(GetPortComboBox(aExtNo,i,'cmb_recorver').ItemIndex),
                         '04', //포트감지시간
                         FillZeroNumber(nZoneArmArea,2),
                         '', //위치명
                         inttostr(nZoneUse)
                         );
  end;
  if cmb_alartLamp.ItemIndex < 0 then cmb_alartLamp.ItemIndex := 0;
  if cmb_alartSiren.ItemIndex < 0 then cmb_alartSiren.ItemIndex := 0;
  RegistAlartLampSiren(G_stSelectEcuID,inttostr(cmb_alartLamp.ItemIndex),inttostr(cmb_alartSiren.ItemIndex));
  if Not IsDigit(ed_alertLampTime.Text) then ed_alertLampTime.Text := '10';
  RegistAlertLampTime(G_stSelectEcuID,Trim(ed_alertLampTime.Text));
  if Not IsDigit(ed_alertSirenTime.Text) then ed_alertSirenTime.Text := '1';
  RegistAlertSirenTime(G_stSelectEcuID,Trim(ed_alertSirenTime.Text));
  ZoneControlEnable(True);
end;

procedure TfmCurrentDeviceSetting.TableToFormSetting(aEcuID:string);
var
  i,j : integer;
  nTemp : integer;
  cmb_Box : TComboBox;
  spinEdit : TSpinEdit;
  static_Text : TStaticText;
  oGroupBox : TGroupBox;
  oEdit : TEdit;
  stWatchType : string;
  stParentWatchType : string;
  stDetailWatchType : string;
  nParentIndex : integer;
  stTemp : string;
  nIndex : integer;
begin
  if L_bTableLoading then Exit;
  Try
    L_bTableLoading := True;
    with dmDataBase.TB_DEVICE do
    begin
      if FindKey([aEcuID]) then
      begin
        if aEcuID = '00' then
        begin
          ed_mcid.Text := FindField('DEVICE_ID').AsString;
          Edit_LinkusID.Text := FindField('SYSTEM_ID').AsString;
          Edit_LinkusTel.Text := FindField('Linkus_Tel').AsString;
          Edit_LinkusTel2.Text := FindField('Linkus_Tel2').AsString;
          Spinner_Ring.Value := FindField('Ring_Cnt').AsInteger;
          Spinner_cancelRing.Value := FindField('Ring_CancelCnt').AsInteger;

          if FindField('MCU_IP').AsString <> '' then
            Edit_IP.Text := FindField('MCU_IP').AsString;
          if FindField('MCU_SUBNET').AsString <> '' then
            Edit_subnet.Text := FindField('MCU_SUBNET').AsString;
          if FindField('MCU_GATE').AsString <> '' then
            edit_Gateway.Text := FindField('MCU_GATE').AsString;
          edit_port.Text := FindField('MCU_PORT').AsString ;
          if FindField('Server_IP').AsString <> '' then
            ed_server.Text := FindField('Server_IP').AsString ;
          if FindField('MCU_SERVERPORT').AsString <> '' then
            ed_ServerPort.Text := FindField('MCU_SERVERPORT').AsString;
          if FindField('MCU_NETWORKMODE').AsString = '00' then rg_Mode.ItemIndex := 1
          else rg_Mode.ItemIndex := 0;
          if FindField('DHCP').asstring = '01' then chk_DHCP.checked := True
          else chk_DHCP.checked := False;
          if isdigit(FindField('CDMAUSE').AsString) then rg_CdmaUse.ItemIndex := FindField('CDMAUSE').AsInteger;

          ed_cdmaMin.Text := FindField('CDMAMIN').AsString;
          ed_cdmaMux.Text := FindField('CDMAMUX').AsString;
          ed_cdmaIP.Text := FindField('CDMAIP').AsString;
          ed_cdmaPort.Text := FindField('CDMAPORT').AsString;
          ed_cdmachktime.Text := FindField('CDMACHECKTIME').AsString;
          ed_cdmarssi.Text := FindField('CDMARSSI').AsString;

          if isdigit(FindField('DVRUSE').AsString) then rg_dvruse.ItemIndex := FindField('DVRUSE').AsInteger;
          ed_dvrip.Text := FindField('DVRIP').AsString;
          ed_dvrport.Text := FindField('DVRPORT').AsString;

          cmb_ArmExtensionSelect.ItemIndex := strtoint(FindField('ArmExtensionGubun').AsString);
          FormArmExtensionSetting(cmb_ArmExtensionSelect.ItemIndex);
          SetArmExtensionTableData(FindField('ArmExtensionData').AsString);
        end;
        //공통부분
        cmb_Relay2Type.ItemIndex := strtoint(FindField('DOOR2_RELAY').asstring);
        ComboBox_WatchPowerOff.ItemIndex := FindField('WATCH_POWER').AsInteger;
        SpinEdit_OutDelay.IntValue := FindField('OUT_DELAY').AsInteger;
        SpinEdit_InDelay.IntValue := FindField('IN_DELAY').AsInteger;
        cmb_JaejungDelayUse.ItemIndex := strtoint(FindField('JaejungDelayUse').asstring);
        cmb_ArmRelay.ItemIndex := FindField('ArmRelay').AsInteger;
        if FindField('JavaraArmClose').AsString = '1' then chk_ArmJavaraClose.Checked := True
        else chk_ArmJavaraClose.Checked := False;
        if FindField('JavaraAutoClose').AsString = '1' then chk_JavaraAutoClose.Checked := True
        else chk_JavaraAutoClose.Checked := False;

        Edit_Locate.Text := FindField('LOCATE').AsString;

        cb_CardType.itemindex := FindField('CARDREADER_TYPE').AsInteger;

        cmb_alartLamp.ItemIndex := FindField('ZONE_LAMPONOFF').AsInteger;
        cmb_alartSiren.ItemIndex := FindField('ZONE_SIRENONOFF').AsInteger;
        ed_alertLampTime.Text := FindField('ZONE_LAMPONTIME').AsString;
        ed_alertSirenTime.Text := FindField('ZONE_SIRENONTIME').AsString;

        for i := 0 to 9 do
        begin
          oEdit := TravelEditItem(gb_cardReaderTel,'ed_cardreaderTel',i);
          if oEdit <> nil then
          begin
            oEdit.Text := FindField('CARDREADERTEL' + inttostr(i)).AsString
          end;
        end;
        {
        if isDigit(FindField('ZONEEXTENSIONUSE1').AsString) then cmb_ZoneExtensionUse1.ItemIndex := strtoint(FindField('ZONEEXTENSIONUSE1').AsString)
        else cmb_ZoneExtensionUse1.ItemIndex := 0;
        if isDigit(FindField('ZONEEXTENSIONUSE2').AsString) then cmb_ZoneExtensionUse2.ItemIndex := strtoint(FindField('ZONEEXTENSIONUSE2').AsString)
        else cmb_ZoneExtensionUse2.ItemIndex := 0;
        if isDigit(FindField('ZONEEXTENSIONUSE3').AsString) then cmb_ZoneExtensionUse3.ItemIndex := strtoint(FindField('ZONEEXTENSIONUSE3').AsString)
        else cmb_ZoneExtensionUse3.ItemIndex := 0;
        if isDigit(FindField('ZONEEXTENSIONUSE4').AsString) then cmb_ZoneExtensionUse4.ItemIndex := strtoint(FindField('ZONEEXTENSIONUSE4').AsString)
        else cmb_ZoneExtensionUse4.ItemIndex := 0;
        if isDigit(FindField('ZONEEXTENSIONUSE5').AsString) then cmb_ZoneExtensionUse5.ItemIndex := strtoint(FindField('ZONEEXTENSIONUSE5').AsString)
        else cmb_ZoneExtensionUse5.ItemIndex := 0;
        if isDigit(FindField('ZONEEXTENSIONUSE6').AsString) then cmb_ZoneExtensionUse6.ItemIndex := strtoint(FindField('ZONEEXTENSIONUSE6').AsString)
        else cmb_ZoneExtensionUse6.ItemIndex := 0;
        if isDigit(FindField('ZONEEXTENSIONUSE7').AsString) then cmb_ZoneExtensionUse7.ItemIndex := strtoint(FindField('ZONEEXTENSIONUSE7').AsString)
        else cmb_ZoneExtensionUse7.ItemIndex := 0;
        if isDigit(FindField('ZONEEXTENSIONUSE8').AsString) then cmb_ZoneExtensionUse8.ItemIndex := strtoint(FindField('ZONEEXTENSIONUSE8').AsString)
        else cmb_ZoneExtensionUse8.ItemIndex := 0;
        }

        for i := 1 to FIXMAXZONEEXTENDNO do
        begin
          cmb_Box := TravelComboBoxItem(gb_SystemZoneExtension,'cmb_SystemZoneExtensionUse',i);
          if cmb_Box <> nil then
          begin
            if isDigit(FindField('ZONEEXTENSIONUSE' + inttostr(i)).AsString) then cmb_Box.ItemIndex := strtoint(FindField('ZONEEXTENSIONUSE' + inttostr(i)).AsString)
            else cmb_Box.ItemIndex := 0;
            if cmb_Box.ItemIndex < 0 then cmb_Box.ItemIndex := 0;

            if cmb_Box.ItemIndex = 1 then
               FormZoneExtensionUse(aEcuID,inttostr(i),True,clYellow)
            else FormZoneExtensionUse(aEcuID,inttostr(i),False,clYellow);
          end;
        end;
        stTemp := FindField('PoliceTel1').AsString;
        //17001060010010000
        ed_TelMonitorSoundNo1.Text := copy(stTemp,1,2);
        ed_TelMonitorStartDelay1.Text := copy(stTemp,3,3);
        ed_TelMonitorsendTime1.Text := copy(stTemp,6,3);
        ed_TelMonitorsendCount1.Text := copy(stTemp,9,3);
        cmb_TelMonitorsSpeaker1.ItemIndex := strtoint(stTemp[12]);
        cmb_TelMonitorCountTime1.ItemIndex := strtoint(stTemp[13]);
        cmb_TelMonitorDTMFStart1.ItemIndex := strtoint(stTemp[14]);
        cmb_TelMonitorDTMFEnd1.ItemIndex := strtoint(stTemp[15]);
        if copy(stTemp,16,2) = '00' then ed_TelMonitorNum1.Text := ''
        else ed_TelMonitorNum1.Text := copy(stTemp,18,strtoint(copy(stTemp,16,2)));

        stTemp := FindField('PoliceTel2').AsString;
        //17001060010010000
        ed_TelMonitorSoundNo2.Text := copy(stTemp,1,2);
        ed_TelMonitorStartDelay2.Text := copy(stTemp,3,3);
        ed_TelMonitorsendTime2.Text := copy(stTemp,6,3);
        ed_TelMonitorsendCount2.Text := copy(stTemp,9,3);
        cmb_TelMonitorsSpeaker2.ItemIndex := strtoint(stTemp[12]);
        cmb_TelMonitorCountTime2.ItemIndex := strtoint(stTemp[13]);
        cmb_TelMonitorDTMFStart2.ItemIndex := strtoint(stTemp[14]);
        cmb_TelMonitorDTMFEnd2.ItemIndex := strtoint(stTemp[15]);
        if copy(stTemp,16,2) = '00' then ed_TelMonitorNum2.Text := ''
        else ed_TelMonitorNum2.Text := copy(stTemp,18,strtoint(copy(stTemp,16,2)));

        stTemp := FindField('JAVARASTOPTIME').AsString;
        if stTemp <> '' then
        begin
          ed_OpenStop.Text := copy(stTemp,1,3) + '00';
          ed_CloseStop.Text := copy(stTemp,4,3) + '00';
          ed_StopDelay.Text := copy(stTemp,7,3) + '00';
        end;

        stTemp := FindField('DOOR_TIMECODEUSE').AsString;
        if Length(stTemp) = 8 then
        begin
          if stTemp[1] = '1' then chk_TimeDoor1.Checked := True
          else chk_TimeDoor1.Checked := False;
          if stTemp[2] = '1' then chk_TimeDoor2.Checked := True
          else chk_TimeDoor2.Checked := False;
          if Length(stTemp) < 8 then Exit;
          if stTemp[3] = '1' then chk_TimeDoor3.Checked := True
          else chk_TimeDoor3.Checked := False;
          if stTemp[4] = '1' then chk_TimeDoor4.Checked := True
          else chk_TimeDoor4.Checked := False;
          if stTemp[5] = '1' then chk_TimeDoor5.Checked := True
          else chk_TimeDoor5.Checked := False;
          if stTemp[6] = '1' then chk_TimeDoor6.Checked := True
          else chk_TimeDoor6.Checked := False;
          if stTemp[7] = '1' then chk_TimeDoor7.Checked := True
          else chk_TimeDoor7.Checked := False;
          if stTemp[8] = '1' then chk_TimeDoor8.Checked := True
          else chk_TimeDoor8.Checked := False;
        end else
        begin
          chk_TimeDoor1.Checked := False;
          chk_TimeDoor2.Checked := False;
          chk_TimeDoor3.Checked := False;
          chk_TimeDoor4.Checked := False;
          chk_TimeDoor5.Checked := False;
          chk_TimeDoor6.Checked := False;
          chk_TimeDoor7.Checked := False;
          chk_TimeDoor8.Checked := False;
        end;
        stTemp := FindField('TIMECODE01').AsString;
        ed_TimeCode01Start.Text := copy(stTemp,1,4);
        ed_TimeCode01End.Text := copy(stTemp,5,4);
        ed_TimeCode02Start.Text := copy(stTemp,9,4);
        ed_TimeCode02End.Text := copy(stTemp,13,4);
        ed_TimeCode03Start.Text := copy(stTemp,17,4);
        ed_TimeCode03End.Text := copy(stTemp,21,4);
        ed_TimeCode04Start.Text := copy(stTemp,25,4);
        ed_TimeCode04End.Text := copy(stTemp,29,4);

        stTemp := FindField('TIMECODE02').AsString;
        ed_TimeCode11Start.Text := copy(stTemp,1,4);
        ed_TimeCode11End.Text := copy(stTemp,5,4);
        ed_TimeCode12Start.Text := copy(stTemp,9,4);
        ed_TimeCode12End.Text := copy(stTemp,13,4);
        ed_TimeCode13Start.Text := copy(stTemp,17,4);
        ed_TimeCode13End.Text := copy(stTemp,21,4);
        ed_TimeCode14Start.Text := copy(stTemp,25,4);
        ed_TimeCode14End.Text := copy(stTemp,29,4);

        FormZoneExtendChangeCheck; //존확장기의 변경 사항을 체크하자.

      end;
    end;
    with dmDataBase.TB_DOORSettingInfo do
    begin
      for i := 1 to FIXMAXDOORNO do
      begin
        if FindKey([aEcuID,'0',inttostr(i)]) then
        begin
          if aEcuID = '00' then
          begin
          end;
          cmb_Box := TravelComboBoxItem(gb_SystemInfo,'ComboBox_DoorType',i);
          if cmb_Box <> nil then
          begin
            if isDigit(FindField('DOOR_TYPE').AsString) then cmb_Box.ItemIndex := strtoint(FindField('DOOR_TYPE').AsString);
          end;
          if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_CardModeType',i)
          else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_CardModeType',i);
          if cmb_Box <> nil then
          begin
            stTemp := FindField('CARD_TYPE').AsString;
            if isDigit(stTemp) then cmb_Box.ItemIndex := strtoint(stTemp)
            else cmb_Box.ItemIndex := 0;
          end;
          if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_DoorModeType',i)
          else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_DoorModeType',i);
          if cmb_Box <> nil then
          begin
            stTemp := FindField('DOORMODE_TYPE').AsString;
            if isDigit(stTemp) then cmb_Box.ItemIndex := strtoint(stTemp)
            else cmb_Box.ItemIndex := 0;
          end;
          if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorControlTime',i)
          else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorControlTime',i);
          if cmb_Box <> nil then
          begin
            stTemp := FindField('DOOR_OPEN').AsString;
            cmb_Box.Text := stTemp;
            nIndex := cmb_Box.Items.IndexOf(stTemp);
            cmb_Box.ItemIndex := nIndex;
          end;
          if i < 3 then spinEdit := TravelSpinEditItem(gb_DoorInfo,'SpinEdit_OpenMoni',i)
          else spinEdit := TravelSpinEditItem(gb_DoorExtensionInfo,'SpinEdit_OpenMoni',i);
          if spinEdit <> nil then
          begin
            stTemp := FindField('OPEN_MONI').AsString;
            if isDigit(stTemp) then spinEdit.Value := strtoint(stTemp)
            else spinEdit.Value := 0;
          end;
          if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_UseSch',i)
          else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_UseSch',i);
          if cmb_Box <> nil then
          begin
            stTemp := FindField('USE_SCH').AsString;
            if isDigit(stTemp) then cmb_Box.ItemIndex := strtoint(stTemp)
            else cmb_Box.ItemIndex := 0;
          end;
          if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_SendDoorStatus',i)
          else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_SendDoorStatus',i);
          if cmb_Box <> nil then
          begin
            stTemp := FindField('DOOR_STATUS').AsString;
            if isDigit(stTemp) then cmb_Box.ItemIndex := strtoint(stTemp)
            else cmb_Box.ItemIndex := 0;
          end;
          if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_AlarmLongOpen',i)
          else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_AlarmLongOpen',i);
          if cmb_Box <> nil then
          begin
            stTemp := FindField('ALARM_LONG').AsString;
            if isDigit(stTemp) then cmb_Box.ItemIndex := strtoint(stTemp)
            else cmb_Box.ItemIndex := 0;
          end;
          if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_ControlFire',i)
          else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_ControlFire',i);
          if cmb_Box <> nil then
          begin
            stTemp := FindField('CONTROL_FIRE').AsString;
            if isDigit(stTemp) then cmb_Box.ItemIndex := strtoint(stTemp)
            else cmb_Box.ItemIndex := 0;
          end;
          if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType',i)
          else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_LockType',i);
          if cmb_Box <> nil then
          begin
            stTemp := FindField('LOCK_TYPE').AsString;
            if isDigit(stTemp) then cmb_Box.ItemIndex := strtoint(stTemp)
            else cmb_Box.ItemIndex := 0;
          end;
          cmb_Box := TravelComboBoxItem(gb_LoackState,'ComboBox_LockType2',i);
          if cmb_Box <> nil then
          begin
            stTemp := FindField('LOCK_TYPE').AsString;
            if isDigit(stTemp) then cmb_Box.ItemIndex := strtoint(stTemp)
            else cmb_Box.ItemIndex := 0;
          end;

          if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_DsOpenState',i)
          else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DsOpenState',i);
          if cmb_Box <> nil then
          begin
            stTemp := FindField('DOOR_DSOPENSTATUS').AsString;
            if isDigit(stTemp) then cmb_Box.ItemIndex := strtoint(stTemp)
            else cmb_Box.ItemIndex := 0;
          end;
          if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_RemoteDoorOpen',i)
          else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_RemoteDoorOpen',i);
          if cmb_Box <> nil then
          begin
            stTemp := FindField('DOOR_REMOTECANCEL').AsString;
            if isDigit(stTemp) then cmb_Box.ItemIndex := strtoint(stTemp)
            else cmb_Box.ItemIndex := 0;
          end;
          if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorDscheckTime',i)
          else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorDscheckTime',i);
          if cmb_Box <> nil then
          begin
            stTemp := FindField('DSCHECKUSE').AsString;
            if stTemp = '0' then cmb_Box.ItemIndex := 0
            else
            begin
              stTemp := FindField('DSCHECKTIME').AsString;
              if isDigit(stTemp) then cmb_Box.ItemIndex := strtoint(stTemp)
              else cmb_Box.ItemIndex := 0;
            end;
          end;
          if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_ArmDSCheck',i)
          else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_ArmDSCheck',i);
          if cmb_Box <> nil then
          begin
            stTemp := FindField('ArmDSCheck').AsString;
            if isDigit(stTemp) then cmb_Box.ItemIndex := strtoint(stTemp)
            else cmb_Box.ItemIndex := 0;
          end;
          cmb_Box := TravelComboBoxItem(gb_DoorAlarmArea,'cmbDoorAlarmArea',i);
          if cmb_Box <> nil then
          begin
            stTemp := FindField('DOORARMAREA').AsString;
            if isDigit(stTemp) then cmb_Box.ItemIndex := strtoint(stTemp) - 1
            else cmb_Box.ItemIndex := 0;
            if cmb_Box.ItemIndex < 0 then cmb_Box.ItemIndex := 0;
          end;
        end;
      end;
    end;

    ReaderFormDoorLockSetting(FIXMAXDOORNO,True);  //리더 폼에 문번호 무조건 8개 등록 하자

    with dmDataBase.TB_READERSETTING do
    begin
      for i := 1 to FIXMAXREADERNO do
      begin
        if FindKey([aEcuID,'0',inttostr(i)]) then
        begin
          if isDigit(FindField('READER_USE').Asstring) then nTemp := strtoint(FindField('READER_USE').Asstring)
          else nTemp := 0;
          cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',i);
          if cmb_Box <> nil then cmb_Box.ItemIndex := nTemp;
          if isDigit(FindField('READER_DOOR').Asstring) then nTemp := strtoint(FindField('READER_DOOR').Asstring)
          else nTemp := 0;
          cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor',i);
//          if cmb_Box.Items.Count < nTemp then nTemp := 0;
          if cmb_Box <> nil then cmb_Box.ItemIndex := nTemp;
          {
          spinEdit := TravelSpinEditItem(gb_CardReader,'se_ReaderDoor',i);
          if spinEdit <> nil then spinEdit.Value := nTemp;
          }
          if isDigit(FindField('READER_NAME').Asstring) then nTemp := strtoint(FindField('READER_NAME').Asstring)
          else nTemp := 0;
          cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoorLocate',i);
          if cmb_Box <> nil then cmb_Box.ItemIndex := nTemp;

          if isDigit(FindField('READER_BUILDING').Asstring) then nTemp := strtoint(FindField('READER_BUILDING').Asstring)
          else nTemp := 0;
          cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderBuildingLocate',i);
          if cmb_Box <> nil then cmb_Box.ItemIndex := nTemp;

          if isDigit(FindField('CARDREADER_TYPE').Asstring) then nTemp := strtoint(FindField('CARDREADER_TYPE').Asstring)
          else nTemp := 0;
          cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderType',i);
          if cmb_Box <> nil then cmb_Box.ItemIndex := nTemp;

          if isDigit(FindField('READERARMAREA').Asstring) then nTemp := strtoint(FindField('READERARMAREA').Asstring) - 1
          else nTemp := 0;
          if nTemp < 0 then nTemp := 0;
          cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',i);
          if cmb_Box <> nil then cmb_Box.ItemIndex := nTemp;

          if isDigit(FindField('READER_SOUND').Asstring) then nTemp := strtoint(FindField('READER_SOUND').Asstring)
          else nTemp := 0;
          cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderSound',i);
          if cmb_Box <> nil then cmb_Box.ItemIndex := nTemp;

          if isDigit(FindField('EXIT_SOUND').Asstring) then nTemp := strtoint(FindField('EXIT_SOUND').Asstring)
          else nTemp := 0;
          cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ExitSound',i);
          if cmb_Box <> nil then cmb_Box.ItemIndex := nTemp;


        end;
      end;
    end;
    with dmDataBase.TB_ZONESETTING do
    begin
      for i := 0 to FIXMAXZONEEXTENDNO do
      begin
        for j := 1 to FIXMAXZONENO do
        begin
          if FindKey([aEcuID,inttostr(i),inttostr(j)]) then
          begin
            stWatchType := FindField('PORT_TYPE').AsString;
            GetWatchTypeName(stWatchType,stParentWatchType,nParentIndex);
            cmb_Box := GetPortComboBox(i,j,'cmb_WatchType');
            if cmb_Box <> nil then
            begin
              cmb_Box.Text := stParentWatchType;
              cmb_Box.ItemIndex := nParentIndex;
            end;
            cmb_Box := GetPortComboBox(i,j,'cmb_WatchDelay');
            if cmb_Box <> nil then
            begin
              if isDigit(FindField('PORT_DELAY').AsString) then
                cmb_Box.ItemIndex := strtoint(FindField('PORT_DELAY').AsString)
              else cmb_Box.ItemIndex :=  0;
            end;
            cmb_Box := GetPortComboBox(i,j,'cmb_recorver');
            if cmb_Box <> nil then
            begin
              if isDigit(FindField('PORT_RECORVER').AsString) then
                cmb_Box.ItemIndex := strtoint(FindField('PORT_RECORVER').AsString)
              else cmb_Box.ItemIndex :=  1;
            end;
            cmb_Box := GetPortComboBox(i,j,'cmb_PortAlarmArea');
            if cmb_Box <> nil then
            begin
              if isDigit(FindField('ZONEARMAREA').AsString) then
                cmb_Box.ItemIndex := strtoint(FindField('ZONEARMAREA').AsString) - 1
              else cmb_Box.ItemIndex :=  0;
              if cmb_Box.ItemIndex < 0 then  cmb_Box.ItemIndex := 0;
            end;
            cmb_Box := GetPortComboBox(i,j,'cmb_ZonUse');
            if cmb_Box <> nil then
            begin
              if isDigit(FindField('PORT_ZONEUSE').AsString) then
                cmb_Box.ItemIndex := strtoint(FindField('PORT_ZONEUSE').AsString)
              else cmb_Box.ItemIndex :=  0;
              if cmb_Box.ItemIndex < 0 then  cmb_Box.ItemIndex := 0;
            end;
          end;
        end;
      end;
    end;
    st_Time.Caption := '';
    for i := 1 to 8 do
    begin
      static_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',i);
      if static_Text <> nil then
      begin
        static_Text.Caption := '';
      end;
    end;
    st_CtrDoorNum.Caption := '';
    st_CtrCardMode.Caption := '';
    st_CtrDoorMode.Caption := '';
    st_CtrDoorState.Caption := '';
    st_FireResult.Caption := '';
    st_Time1.Caption := '';
    st_MemoryClearResult.Caption := '';
    st_DeviceResetResult.Caption := '';
    st_AlarmState.Caption := '';
    st_ArmArea3.Caption := '';
    st_AlarmState3.Caption := '';
    st_LineShortCheck.Caption := '';

    for i := 1 to FIXMAXZONEEXTENDNO do //존확장기 갯수만큼
    begin
      case i of
        1 : oGroupBox := gb_ZoneExtensionState1;
        2 : oGroupBox := gb_ZoneExtensionState2;
        3 : oGroupBox := gb_ZoneExtensionState3;
        4 : oGroupBox := gb_ZoneExtensionState4;
        5 : oGroupBox := gb_ZoneExtensionState5;
        6 : oGroupBox := gb_ZoneExtensionState6;
        7 : oGroupBox := gb_ZoneExtensionState7;
        8 : oGroupBox := gb_ZoneExtensionState8;
        else oGroupBox := nil;
      end;
      if oGroupBox = nil then continue;
      for j := 1 to FIXMAXZONENO do
      begin
        static_Text := TravelTStaticTextItem(oGroupBox,'st_ZoneState' + inttostr(i),j);
        if static_Text <> nil then
        begin
          static_Text.caption := '';
        end;
      end;
    end;

  Finally
    L_bSettingChanged := False;
    L_bTableLoading := False;
  End;

end;

function TfmCurrentDeviceSetting.EcuStatusCheck:Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
//  for i := 0 to G_nLoopCount do
//  begin
//    if G_bApplicationTerminate then Exit;
    result := dmSocket.EcuStatusCheck;
//    if result then Break;
//  end;

end;

procedure TfmCurrentDeviceSetting.RecvEcuStateData(aECUID, aData: string);
var
  i : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  Delete(aData,1,4);
  for i:= 1 to Length(aData) do
  begin
    if aData[i] = '1' then
    begin
      ECUConnected(FillZeroNumber(i-1,2),True);
    end else
    begin
      ECUConnected(FillZeroNumber(i-1,2),False);
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.Edit_IPKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'MCU_IP',Edit_IP.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'MCU_IP','U');
  end;
  L_bSettingChanged := True;
end;

procedure TfmCurrentDeviceSetting.Edit_subnetKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'MCU_SUBNET',Edit_subnet.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'MCU_SUBNET','U');
  end;
  L_bSettingChanged := True;
end;

procedure TfmCurrentDeviceSetting.edit_GatewayKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'MCU_GATE',edit_Gateway.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'MCU_GATE','U');
  end;
  L_bSettingChanged := True;
end;

procedure TfmCurrentDeviceSetting.edit_portKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'MCU_PORT',edit_port.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'MCU_PORT','U');
  end;
  L_bSettingChanged := True;
end;

procedure TfmCurrentDeviceSetting.ed_serverKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'Server_IP',ed_server.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'Server_IP','U');
  end;
  L_bSettingChanged := True;
end;

procedure TfmCurrentDeviceSetting.ed_ServerPortKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'MCU_SERVERPORT',ed_ServerPort.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'MCU_SERVERPORT','U');
  end;
  L_bSettingChanged := True;
end;

procedure TfmCurrentDeviceSetting.Rg_ModeClick(Sender: TObject);
var
  stMode : string;
begin
  if Rg_Mode.ItemIndex = 0 then stMode := '02'
  else stMode := '00';
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'MCU_NETWORKMODE',stMode);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'MCU_NETWORKMODE','U');
    L_bSettingChanged := True;
  end;
end;

procedure TfmCurrentDeviceSetting.chk_DHCPClick(Sender: TObject);
var
  stDhcp : string;
begin
  if chk_DHCP.Checked then stDhcp := '01'
  else stDhcp := '00';

  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'DHCP',stDhcp);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'DHCP','U');
  end;
  L_bSettingChanged := True;
end;

procedure TfmCurrentDeviceSetting.Edit_LocateKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'LOCATE',Edit_Locate.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'LOCATE','U');
  end;
  L_bSettingChanged := True;
end;

procedure TfmCurrentDeviceSetting.Port_DoorEnabelCheck(aEcuID: string);
begin
end;

procedure TfmCurrentDeviceSetting.PortDoorEnable(aDoorNo: string;
  aEnable: Boolean);
begin
  //L_bZoneDoor[strtoint(aDoorNo)] := aEnable;
end;

procedure TfmCurrentDeviceSetting.btn_TimeSyncClick(Sender: TObject);
begin
  TimeSync(formatDateTime('yyyymmddhhnnss',now));
end;

function TfmCurrentDeviceSetting.TimeSync(aDate: string): Boolean;
begin
  st_Time.Color := clWhite;
  st_Time.Caption := '';
  st_Time1.Color := clWhite;
  st_Time1.Caption := '';
  dmSocket.registTime(aDate);
end;

procedure TfmCurrentDeviceSetting.RecvDeviceTime(aECUID, aTime: string);
begin
  if Not isDigit(aEcuID) then Exit;
  st_Time.Caption := strToTimeFormat(aTime);
  st_Time.Color := clYellow;
  st_Time1.Caption := strToTimeFormat(aTime);
  st_Time1.Color := clYellow;

end;

procedure TfmCurrentDeviceSetting.btn_TimeSearchClick(Sender: TObject);
begin
  st_Time.Color := clWhite;
  st_Time.Caption := '';
  dmSocket.TimeCheck;
end;

procedure TfmCurrentDeviceSetting.Edit_LocateChange(Sender: TObject);
begin
  L_bSettingChanged := True;
end;

procedure TfmCurrentDeviceSetting.MCUControlEnable(aValue: Boolean);
var
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then Exit;
  //ed_mcid.Enabled := aValue;
  if (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT811) or (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT813) then
  begin
    ed_mcid.Enabled := False;
  end;
  if L_bEcuRegist then
  begin
    lvECU.Enabled := aValue;
    btnECUAdd.Enabled := aValue;
    btnECUErase.Enabled := aValue;
  end;
  Edit_IP.Enabled := aValue;
  Edit_subnet.Enabled := aValue;
  edit_Gateway.Enabled := aValue;
  edit_port.Enabled := aValue;
  ed_server.Enabled := aValue;
  ed_ServerPort.Enabled := aValue;
  Rg_Mode.Enabled := aValue;
  chk_DHCP.Enabled := aValue;

end;

procedure TfmCurrentDeviceSetting.SystemControlEnable(aValue: Boolean);
var
  nDoorMaxNo : integer;
  nIndex : integer;
  i : integer;
  oComboBox : TComboBox;
begin
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then Exit;

  if (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT811) or
     (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812) or
     (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT813) or
     (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = SGS100) then
     ComboBox_WatchPowerOff.Enabled := aValue
  else ComboBox_WatchPowerOff.Enabled := False;

  if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
  begin
    cmb_Relay2Type.Enabled := aValue;
    cmb_JaejungDelayUse.Enabled := aValue;
  end else
  begin
    cmb_Relay2Type.Enabled := False;
    cmb_JaejungDelayUse.Enabled := False;
  end;

  for i := 1 to FIXMAXDOORNO do
  begin
    oComboBox := TravelComboBoxItem(gb_SystemInfo,'ComboBox_DoorType',i);
    if oComboBox <> nil then
    begin
      oComboBox.Enabled := aValue;
      if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(i) then oComboBox.Enabled := False;
    end;
  end;

  //if (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT811) then cmb_ArmRelay.Enabled := aValue
  //else cmb_ArmRelay.Enabled := False;
  cmb_ArmRelay.Enabled := aValue;
  Edit_Locate.Enabled := aValue;
end;

procedure TfmCurrentDeviceSetting.LockControlEnable(aDoorNo:string;aValue: Boolean);
var
  nIndex : integer;
  cmb_Box : TComboBox;
  spinEdit : TSpinEdit;
  nDoorNo : integer;
begin
  if Not isDigit(aDoorNo) then Exit;
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then Exit;

  nDoorNo := strtoint(aDoorNo);
  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_CardModeType',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_CardModeType',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Enabled := aValue;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then cmb_Box.Enabled := False;
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorType(nDoorNo) = '0' then
    begin
      cmb_Box.Enabled := False; //방범전용에서는 Posi/Nega 동작 못하도록
      cmb_Box.ItemIndex := 0;
    end;
  end;

  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_DoorModeType',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_DoorModeType',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Enabled := aValue;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then cmb_Box.Enabled := False;
  end;

  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorControlTime',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorControlTime',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Enabled := aValue;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then cmb_Box.Enabled := False;
  end;

  if nDoorNo < 3 then spinEdit := TravelSpinEditItem(gb_DoorInfo,'SpinEdit_OpenMoni',nDoorNo)
  else spinEdit := TravelSpinEditItem(gb_DoorExtensionInfo,'SpinEdit_OpenMoni',nDoorNo);
  if spinEdit <> nil then
  begin
    spinEdit.Enabled := aValue;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then spinEdit.Enabled := False;
  end;

  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_UseSch',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_UseSch',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Enabled := aValue;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then cmb_Box.Enabled := False;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ScheduleUse then cmb_Box.Enabled := False; //스케줄 기능이 없는 장비 이면
  end;

  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_SendDoorStatus',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_SendDoorStatus',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Enabled := aValue;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then cmb_Box.Enabled := False;
  end;

  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_AlarmLongOpen',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_AlarmLongOpen',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Enabled := aValue;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then cmb_Box.Enabled := False;
  end;

  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_ControlFire',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_ControlFire',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Enabled := aValue;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then cmb_Box.Enabled := False;
  end;

  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_LockType',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Enabled := aValue;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then cmb_Box.Enabled := False;
  end;
  //상태조회쪽
  cmb_Box := TravelComboBoxItem(gb_LoackState,'ComboBox_LockType2',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Enabled := aValue;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then cmb_Box.Enabled := False;
  end;


  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_DsOpenState',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DsOpenState',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Enabled := aValue;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then cmb_Box.Enabled := False;
  end;

  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_RemoteDoorOpen',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_RemoteDoorOpen',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Enabled := aValue;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then cmb_Box.Enabled := False;
  end;

  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorDscheckTime',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorDscheckTime',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Enabled := aValue;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then cmb_Box.Enabled := False;
  end;

  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_ArmDSCheck',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_ArmDSCheck',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Enabled := aValue;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then cmb_Box.Enabled := False;
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT812 then cmb_Box.Enabled := False;
    if (TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorLockType(nDoorNo) <> 2) and
       (TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorLockType(nDoorNo) <> 3) then cmb_Box.Enabled := False;  //데드볼트 락이 아니면 False
  end;

end;

procedure TfmCurrentDeviceSetting.Door1Enable(aValue: Boolean);
var
  nIndex : integer;
begin

//  if Not L_bZoneDoor[1] then aValue := False;
  ComboBox_CardModeType1.Enabled := aValue;
  ComboBox_DoorModeType1.Enabled := aValue;
  cmb_DoorControlTime1.Enabled := aValue;
  ComboBox_UseSch1.Enabled := aValue;
  SpinEdit_OpenMoni1.Enabled := aValue;
  ComboBox_SendDoorStatus1.Enabled := aValue;
  ComboBox_AlarmLongOpen1.Enabled := aValue;
  ComboBox_ControlFire1.Enabled := aValue;
  ComboBox_LockType1.Enabled := aValue;
  cmb_DsOpenState1.Enabled := aValue;
  cmb_RemoteDoorOpen1.Enabled := aValue;
  cmb_DoorDscheckTime1.Enabled := aValue;
  cmb_ArmDSCheck1.Enabled := aValue;
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then exit;
  if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ScheduleUse then ComboBox_UseSch1.Enabled := False; //스케줄 기능이 없는 장비 이면
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT812 then cmb_ArmDSCheck1.Enabled := False;

end;

procedure TfmCurrentDeviceSetting.Door2Enable(aValue: Boolean);
var
  nIndex : integer;
begin
  ComboBox_CardModeType2.Enabled := aValue;
  ComboBox_DoorModeType2.Enabled := aValue;
  cmb_DoorControlTime2.Enabled := aValue;
  SpinEdit_OpenMoni2.Enabled := aValue;
  ComboBox_SendDoorStatus2.Enabled := aValue;
  ComboBox_UseSch2.Enabled := aValue;
  ComboBox_AlarmLongOpen2.Enabled := aValue;
  ComboBox_ControlFire2.Enabled := aValue;
  ComboBox_LockType2.Enabled := aValue;
  cmb_DsOpenState2.Enabled := aValue;
  cmb_RemoteDoorOpen2.Enabled := aValue;
  cmb_DoorDscheckTime2.Enabled := aValue;
  cmb_ArmDSCheck2.Enabled := aValue;

  cmb_COMNO2.Enabled := aValue;
  cmb_ExGnd2.Enabled := aValue;
  cmb_dsgnd2.Enabled := aValue;
  cmb_lsgnd2.Enabled := aValue;

  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then exit;
  if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ScheduleUse then ComboBox_UseSch2.Enabled := False; //스케줄 기능이 없는 장비 이면
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT812 then cmb_ArmDSCheck2.Enabled := False;

end;

procedure TfmCurrentDeviceSetting.ReaderControlEnable(aValue: Boolean);
var
  i : integer;
  cmb_box:TCombobox;
  spinEdit : TSpinEdit;
begin
  cb_CardType.Enabled := aValue;
  for i:=1 to G_nCardReaderNumber do
  begin
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',i);
    if cmb_Box <> nil then cmb_Box.Enabled := aValue;
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor',i);
    if cmb_Box <> nil then cmb_Box.Enabled := aValue;
    spinEdit := TravelSpinEditItem(gb_CardReader,'se_ReaderDoor',i);
    if spinEdit <> nil then spinEdit.Enabled := aValue;
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoorLocate',i);
    if cmb_Box <> nil then cmb_Box.Enabled := aValue;
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderBuildingLocate',i);
    if cmb_Box <> nil then cmb_Box.Enabled := aValue;
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderType',i);
    if cmb_Box <> nil then cmb_Box.Enabled := aValue;
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderSound',i);
    if cmb_Box <> nil then cmb_Box.Enabled := aValue;
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ExitSound',i);
    if cmb_Box <> nil then cmb_Box.Enabled := aValue;
  end;
end;

procedure TfmCurrentDeviceSetting.ZoneControlEnable(aValue: Boolean);
var
  i : integer;
  cmb_box:TCombobox;
  nPortNum : integer;
  nExtZoneNo : integer;
  bArmAreaEnabled : Boolean;
  bZoneUsed : Boolean;
  nIndex : integer;
begin
  bArmAreaEnabled := aValue;
  bZoneUsed := aValue;
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex > -1 then
  begin
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse  then bArmAreaEnabled := False;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).PortZoneUseSkill  then bZoneUsed := False;
  end;
  nPortNum := GetDeviceMaxPortNumber;
  for nExtZoneNo := 0 to FIXMAXZONEEXTENDNO do
  begin
    if nExtZoneNo > 0 then nPortNum := FIXMAXZONENO;
    for i:=1 to nPortNum do
    begin
      cmb_Box := GetPortComboBox(nExtZoneNo,i,'cmb_WatchType');
      if cmb_Box <> nil then cmb_Box.Enabled := aValue;
      cmb_Box := GetPortComboBox(nExtZoneNo,i,'cmb_WatchDelay');
      if cmb_Box <> nil then cmb_Box.Enabled := aValue;
      cmb_Box := GetPortComboBox(nExtZoneNo,i,'cmb_recorver');
      if cmb_Box <> nil then cmb_Box.Enabled := aValue;
      cmb_Box := GetPortComboBox(nExtZoneNo,i,'cmb_PortAlarmArea');
      if cmb_Box <> nil then cmb_Box.Enabled := bArmAreaEnabled;
      cmb_Box := GetPortComboBox(nExtZoneNo,i,'cmb_ZonUse');
      if cmb_Box <> nil then cmb_Box.Enabled := aValue;
    end;
    if nPortNum < FIXMAXZONENO then
    begin
      for i:=nPortNum + 1 to FIXMAXZONENO do
      begin
        cmb_Box := GetPortComboBox(nExtZoneNo,i,'cmb_WatchType');
        if cmb_Box <> nil then cmb_Box.Enabled := False;
        cmb_Box := GetPortComboBox(nExtZoneNo,i,'cmb_WatchDelay');
        if cmb_Box <> nil then cmb_Box.Enabled := False;
        cmb_Box := GetPortComboBox(nExtZoneNo,i,'cmb_recorver');
        if cmb_Box <> nil then cmb_Box.Enabled := False;
        cmb_Box := GetPortComboBox(nExtZoneNo,i,'cmb_PortAlarmArea');
        if cmb_Box <> nil then cmb_Box.Enabled := False;
        cmb_Box := GetPortComboBox(nExtZoneNo,i,'cmb_ZonUse');
        if cmb_Box <> nil then cmb_Box.Enabled := False;
      end;
    end;
  end;
  cmb_alartLamp.Enabled := aValue;
  ed_alertLampTime.Enabled := aValue;
  cmb_alartSiren.Enabled := aValue;
  ed_alertSirenTime.Enabled := aValue;
  if (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812) and
     (TCurrentDeviceState(DeviceList.Objects[nIndex]).RELAY2TYPE <> 0) then
  begin
    for i := 6 to 8 do
    begin
      FormZoneUseEnable(0,i,False);
    end;
  end;


end;

procedure TfmCurrentDeviceSetting.ComboBox_LockType2Enter(Sender: TObject);
begin
//  ComboBox_LockType2.Width := 200;
end;

procedure TfmCurrentDeviceSetting.ComboBox_LockType2Exit(Sender: TObject);
begin
//  ComboBox_LockType2.Width := 129;

end;

procedure TfmCurrentDeviceSetting.ComboBox_LockType1Exit(Sender: TObject);
begin
//  ComboBox_LockType1.Width := 129;

end;

procedure TfmCurrentDeviceSetting.ComboBox_LockType1Enter(Sender: TObject);
begin
//  ComboBox_LockType1.Width := 200;

end;


procedure TfmCurrentDeviceSetting.btn_MacSearchClick(Sender: TObject);
begin
  editMAC1.Color:= clWhite;
  editMAC2.Color:= clWhite;
  editMAC3.Color:= clWhite;
  editMAC4.Color:= clWhite;
  editMAC5.Color:= clWhite;
  editMAC6.Color:= clWhite;
  //dmSocket.MacSearch;
  dmSocket.WiznetModuleInfo_Check;
end;

procedure TfmCurrentDeviceSetting.btnRegMACClick(Sender: TObject);
var
  aData: string;
  DeviceID: String;
  stMac: String;
begin
  editMAC1.Color:= clWhite;
  editMAC2.Color:= clWhite;
  editMAC3.Color:= clWhite;
  editMAC4.Color:= clWhite;
  editMAC5.Color:= clWhite;
  editMAC6.Color:= clWhite;

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
  stMac:= editMAC1.Text + editMAC2.Text + editMAC3.Text +
        editMAC4.Text + editMAC5.Text + editMAC6.Text;

  dmSocket.RegistMacAddress(stMac);

  Delay(1000);

  dmSocket.MacSearch;
end;

procedure TfmCurrentDeviceSetting.deviceLoadTimerTimer(Sender: TObject);
begin
  if Not L_bDeviceLoadTime then Exit;
  if Not L_bDeviceLoad then
  begin
    deviceLoadTimer.Enabled := False;
    L_bDeviceLoadTime := False;
    DeviceLoad;
    self.FindSubForm('Main').FindCommand('SettingChange').Params.Values['VALUE'] := 'DeviceChange';
    self.FindSubForm('Main').FindCommand('SettingChange').Execute;
    deviceLoadTimer.Enabled := True;
  end;
end;

procedure TfmCurrentDeviceSetting.ReaderDoorNoMinValueSetting(aValue: integer);
var
  i : integer;
  spinEdit : TSpinEdit;
begin
    for i:=1 to G_nCardReaderNumber do
    begin
      spinEdit := TravelSpinEditItem(gb_CardReader,'se_ReaderDoor',i);
      if spinEdit <> nil then
      begin
        spinEdit.MinValue := aValue;
        if spinEdit.Value < aValue then spinEdit.Value := aValue;
      end;
    end;

end;

procedure TfmCurrentDeviceSetting.ReaderDoorNoMaxValueSetting(aValue: integer);
var
  i : integer;
  spinEdit : TSpinEdit;
begin
    for i:=1 to G_nCardReaderNumber do
    begin
      spinEdit := TravelSpinEditItem(gb_CardReader,'se_ReaderDoor',i);
      if spinEdit <> nil then
      begin
        spinEdit.MaxValue := aValue;
        if spinEdit.Value > aValue then spinEdit.Value := aValue;
      end;
    end;

end;

procedure TfmCurrentDeviceSetting.ReaderDoorNoEnable(aValue: Boolean);
var
  i : integer;
  spinEdit : TSpinEdit;
begin
    for i:=1 to G_nCardReaderNumber do
    begin
      spinEdit := TravelSpinEditItem(gb_CardReader,'se_ReaderDoor',i);
      if spinEdit <> nil then
      begin
        spinEdit.Enabled := aValue;
      end;
    end;

end;

procedure TfmCurrentDeviceSetting.ZoneWatchDelayLoad;
var
  nPort ,nExtZoneNo: integer;
  cmb_Box : TComboBox;
begin
  for nExtZoneNo := 0 to FIXMAXZONEEXTENDNO do
  begin
    for nPort := 1 to G_nPortNumber do
    begin
      cmb_Box := GetPortComboBox(nExtZoneNo,nPort,'cmb_WatchDelay');

      if cmb_Box = nil then continue;
      cmb_Box.Items.Clear;
      cmb_Box.Items.Add('미사용');
      cmb_Box.Items.Add('사용');
      if cmb_Box.Items.Count > 0 then
      begin
        cmb_Box.ItemIndex := 0;
      end;
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.btnCloseClick(Sender: TObject);
begin
  gb_EcuAdd.Visible := False;
end;

procedure TfmCurrentDeviceSetting.btnAddClick(Sender: TObject);
var
  nEcuNo : integer;
  i : integer;
begin
  nEcuNo:= seDeviceNo.IntValue;
  if chk_All.Checked then
  begin
    for i := 0 to nEcuNo do
    begin
      dmDataBase.UpdateTB_DEVICE_FieldName(FillZeroNumber(i,2),'DEVICEUSE','Y');
      dmDataBase.UpdateTB_DEVICE_FieldName(FillZeroNumber(i,2),'DEVICE_TYPE',inttostr(cbDeviceType.ItemIndex + 7));

      dmDataBase.UpdateTB_DEVICERCV_FieldName(FillZeroNumber(i,2),'DEVICEUSE','U');
      dmDataBase.UpdateTB_DEVICERCV_FieldName(FillZeroNumber(i,2),'DEVICE_TYPE','U');
    end;
    for i := nEcuNo + 1 to G_nMaxEcuCount do
    begin
      dmDataBase.UpdateTB_DEVICE_FieldName(FillZeroNumber(i,2),'DEVICEUSE','N');
      dmDataBase.UpdateTB_DEVICERCV_FieldName(FillZeroNumber(i,2),'DEVICEUSE','U');
    end;
  end else
  begin
      dmDataBase.UpdateTB_DEVICE_FieldName(FillZeroNumber(nEcuNo,2),'DEVICEUSE','Y');
      dmDataBase.UpdateTB_DEVICE_FieldName(FillZeroNumber(nEcuNo,2),'DEVICE_TYPE',inttostr(cbDeviceType.ItemIndex + 7));

      dmDataBase.UpdateTB_DEVICERCV_FieldName('00','DEVICEUSE','U');  //메인의 상태가 변경 된것임
      dmDataBase.UpdateTB_DEVICERCV_FieldName('00','DEVICE_TYPE','U');
      dmDataBase.UpdateTB_DEVICERCV_FieldName(FillZeroNumber(nEcuNo,2),'DEVICEUSE','U');
      dmDataBase.UpdateTB_DEVICERCV_FieldName(FillZeroNumber(nEcuNo,2),'DEVICE_TYPE','U');
  end;
  gb_EcuAdd.Visible := False;
  DeviceLoad;
  L_bSettingChanged := True;
end;

procedure TfmCurrentDeviceSetting.btnECUAddClick(Sender: TObject);
var
  stDeviceType : string;
begin
  gb_EcuAdd.Visible := True;
  stDeviceType := dmDataBase.GetTB_DEVICE_Value('00','DEVICE_TYPE');
  if isDigit(stDeviceType) then
    cbDeviceType.ItemIndex := strtoint(stDeviceType) - 7;

end;

procedure TfmCurrentDeviceSetting.lvECUKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  aIndex: Integer;
  stECUID,st : string;
begin
  if Key  = VK_DELETE then
  begin
    if lvECU.Selected <> nil then
    begin
      if lvECU.Selected.Index < 0 then Exit;
      aIndex:= lvECU.Selected.Index;
      stECUID := lvECU.Selected.Caption;
      dmDataBase.UpdateTB_DEVICE_FieldName(FillZeroNumber(strtoint(stECUID),2),'DEVICEUSE','N');
      dmDataBase.UpdateTB_DEVICERCV_FieldName(FillZeroNumber(strtoint(stECUID),2),'DEVICEUSE','U');
      L_bSettingChanged := True;
      lvECU.Selected.Delete;
      lvECU.Color := clWhite;
    end;
    if aIndex >= lvECU.Items.Count then aIndex := lvECU.Items.Count - 1;
    DeviceLoad(aIndex);
  end;

end;

procedure TfmCurrentDeviceSetting.btnECUEraseClick(Sender: TObject);
var
  stECUID,st : string;
  nIndex : integer;
begin
  nIndex:= -1;
  if lvECU.Selected = nil then
  begin
    lvECU.SetFocus;
    if lvECU.Items.Count > 0 then lvECU.Items[0].Selected:= True;
    Exit;
  end else
  begin
    if lvECU.Selected.Index < 0 then Exit;
    nIndex:= lvECU.Selected.Index;
    stECUID := lvECU.Selected.Caption;
    dmDataBase.UpdateTB_DEVICE_FieldName(FillZeroNumber(strtoint(stECUID),2),'DEVICEUSE','N');
    dmDataBase.UpdateTB_DEVICERCV_FieldName(FillZeroNumber(strtoint(stECUID),2),'DEVICEUSE','U');
    lvECU.Selected.Delete;
  end;
  if nIndex >= lvECU.Items.Count then nIndex := lvECU.Items.Count -1;
  DeviceLoad(nIndex);

  lvECU.SetFocus;
end;

procedure TfmCurrentDeviceSetting.NodeReaderAdd(aEcuID: string; aNode: TTreeNode;
  aDoorNo: string;aExtended:Boolean=False);
var
  bNode : TTreeNode;
  nIndex : integer;
  i : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  for i := 1 to FIXMAXREADERNO do
  begin
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetReaderUse(i) then
    begin
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetReaderDoor(i) = strtoint(aDoorNo) then
      begin
        bNode:= TreeView_Device.Items.AddChild(aNode,aEcuID + ':카드리더' + inttostr(i));
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetReaderConnectState(i) then
        begin
          bNode.ImageIndex:=READERCONNECT;
          bNode.SelectedIndex:=READERCONNECT;
        end else
        begin
          bNode.ImageIndex:=READERDISCONNECT;
          bNode.SelectedIndex:=READERDISCONNECT;
        end;
        bNode.StateIndex:= NOTHINGIMG;
      end;
    end;
    aNode.Expanded := aExtended;
  end;
end;

procedure TfmCurrentDeviceSetting.CurrentDeviceView(aExtended:Boolean=False);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode : TTreeNode;
  i,j : integer;
begin

  if L_bDeviceLoad then Exit;

  if cmb_SearchType.ItemIndex = 0 then aExtended := False
  else if cmb_SearchType.ItemIndex = 1 then aExtended := True;

  Try
    L_bDeviceLoad := True;

    aTreeView := TreeView_Device;
    aTreeView.ReadOnly:= True;
    aTreeView.Items.Clear;

    aNode:= aTreeView.Items.Add(nil,'Controller');
    aNode.ImageIndex:=0;
    aNode.SelectedIndex:=0;

    for i := 0 to DeviceList.Count - 1 do
    begin
      bNode:= aTreeView.Items.AddChild(aNode,DeviceList.Strings[i]);
      if TCurrentDeviceState(DeviceList.Objects[i]).Connected then
      begin
        bNode.ImageIndex:= ECUCONNECT;
        bNode.SelectedIndex:= ECUCONNECT;
      end else
      begin
        bNode.ImageIndex:= ECUDISCONNECT;
        bNode.SelectedIndex:= ECUDISCONNECT;
      end;
      bNode.StateIndex:= NOTHINGIMG;
      {
      cNode:= aTreeView.Items.AddChild(bNode,DeviceList.Strings[i] + ':방범');
      if TCurrentDeviceState(DeviceList.Objects[i]).AlarmMode = cmArm then
      begin
        cNode.ImageIndex:=ARMMODE;
        cNode.SelectedIndex:=ARMMODE;
      end else if TCurrentDeviceState(DeviceList.Objects[i]).AlarmMode = cmDisarm then
      begin
        cNode.ImageIndex:=DISARMMODE;
        cNode.SelectedIndex:=DISARMMODE;
      end else
      begin
        cNode.ImageIndex:=QUESTION;
        cNode.SelectedIndex:=QUESTION;
      end;
      cNode.StateIndex:= NOTHINGIMG;
      NodeReaderAdd(DeviceList.Strings[i],cNode,'0',aExtended);
      for j := 1 to FIXMAXDOORNO do
      begin
        if TCurrentDeviceState(DeviceList.Objects[i]).GetDoorUsed(j) then
        begin
          if (j = 2) and (TCurrentDeviceState(DeviceList.Objects[i]).DeviceType = KTT812) and (TCurrentDeviceState(DeviceList.Objects[i]).RELAY2TYPE = 0) then continue;

          if (j > 3) and (TCurrentDeviceState(DeviceList.Objects[i]).GetZoneExtentionUse(j-2) = '0') then continue;

          cNode:= aTreeView.Items.AddChild(bNode,DeviceList.Strings[i] + ':출입문' + inttostr(j));
          if TCurrentDeviceState(DeviceList.Objects[i]).GetDoorState(j) = dsClose then
          begin
            if TCurrentDeviceState(DeviceList.Objects[i]).GetDoorManagerMode(j) = dmManager then
            begin
              cNode.ImageIndex:=DOORMANAGERCLOSE;
              cNode.SelectedIndex:=DOORMANAGERCLOSE;
            end else if TCurrentDeviceState(DeviceList.Objects[i]).GetDoorManagerMode(j) = dmOpen then
            begin
              cNode.ImageIndex:=DOORCLOSE;
              cNode.SelectedIndex:=DOORCLOSE;
            end else
            begin
              cNode.ImageIndex:=QUESTION;
              cNode.SelectedIndex:=QUESTION;
            end;
          end else if TCurrentDeviceState(DeviceList.Objects[i]).GetDoorState(j) = dsOpen then
          begin
            if TCurrentDeviceState(DeviceList.Objects[i]).GetDoorManagerMode(j) = dmManager then
            begin
              cNode.ImageIndex:=DOORMANAGEROPEN;
              cNode.SelectedIndex:=DOORMANAGEROPEN;
            end else if TCurrentDeviceState(DeviceList.Objects[i]).GetDoorManagerMode(j) = dmOpen then
            begin
              cNode.ImageIndex:=DOOROPEN;
              cNode.SelectedIndex:=DOOROPEN;
            end else
            begin
              cNode.ImageIndex:=QUESTION;
              cNode.SelectedIndex:=QUESTION;
            end;
          end else
          begin
            cNode.ImageIndex:=QUESTION;
            cNode.SelectedIndex:=QUESTION;
          end;
          cNode.StateIndex:= NOTHINGIMG;
          NodeReaderAdd(DeviceList.Strings[i],cNode,inttostr(j),aExtended);
        end;
      end;
      bNode.Expanded := aExtended; }
    end;
    aNode.Expanded := True;
  Finally
    L_bDeviceLoad := False;
  End;
  self.FindSubForm('Main').FindCommand('SettingChange').Params.Values['VALUE'] := 'DeviceChange';
  self.FindSubForm('Main').FindCommand('SettingChange').Execute;
end;

procedure TfmCurrentDeviceSetting.CurrentDeviceConnected(aEcuID: string;
  aConnected: Boolean);
var
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
begin
  if Not isDigit(aEcuID) then Exit;
  if TreeView_Device.Items.Count < 1 then Exit;

  aTreeView := TreeView_Device;

  aNode:= GetNodeByText(aTreeView,aEcuID ,False);

  if aNode = nil then Exit;

  if aConnected then
  begin
    aNode.ImageIndex:= ECUCONNECT;
    aNode.SelectedIndex:= ECUCONNECT;
  end else
  begin
    aNode.ImageIndex:= ECUDISCONNECT;
    aNode.SelectedIndex:= ECUDISCONNECT;
  end;
end;

procedure TfmCurrentDeviceSetting.CurrentDeviceAlarmModeChange(
  aEcuID: string; aChange: Boolean);
var
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
  nIndex : integer;
begin
  Exit;
  if Not isDigit(aEcuID) then Exit;
  if TreeView_Device.Items.Count < 1 then Exit;

  aTreeView := TreeView_Device;

  aNode:= GetNodeByText(aTreeView,aEcuID + ':방범' ,False);
  if aNode = nil then exit;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;

  if TCurrentDeviceState(DeviceList.Objects[nIndex]).AlarmMode = cmArm then
  begin
    aNode.ImageIndex:=ARMMODE;
    aNode.SelectedIndex:=ARMMODE;
  end else if TCurrentDeviceState(DeviceList.Objects[nIndex]).AlarmMode = cmDisarm then
  begin
    aNode.ImageIndex:=DISARMMODE;
    aNode.SelectedIndex:=DISARMMODE;
  end else
  begin
    aNode.ImageIndex:=QUESTION;
    aNode.SelectedIndex:=QUESTION;
  end;

end;

procedure TfmCurrentDeviceSetting.CurrentDeviceDoorStateChange(aEcuID,
  aDoorNo: string);
var
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
  nIndex : integer;
  nDoorNo : integer;
begin
  Exit;
  if Not isDigit(aEcuID) then Exit;
  if TreeView_Device.Items.Count < 1 then Exit;
  if Not IsDigit(aDoorNo) then Exit;
  nDoorNo := strtoint(aDoorNo);

  aTreeView := TreeView_Device;

  aNode:= GetNodeByText(aTreeView,aEcuID + ':출입문' + aDoorNo ,False);
  if aNode = nil then exit;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;

  if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorState(nDoorNo) = dsClose then
  begin
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorManagerMode(nDoorNo) = dmManager then
    begin
      aNode.ImageIndex:=DOORMANAGERCLOSE;
      aNode.SelectedIndex:=DOORMANAGERCLOSE;
    end else if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorManagerMode(nDoorNo) = dmOpen then
    begin
      aNode.ImageIndex:=DOORCLOSE;
      aNode.SelectedIndex:=DOORCLOSE;
    end else
    begin
      aNode.ImageIndex:=QUESTION;
      aNode.SelectedIndex:=QUESTION;
    end;
  end else if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorState(nDoorNo) = dsOpen then
  begin
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorManagerMode(nDoorNo) = dmManager then
    begin
      aNode.ImageIndex:=DOORMANAGEROPEN;
      aNode.SelectedIndex:=DOORMANAGEROPEN;
    end else if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorManagerMode(nDoorNo) = dmOpen then
    begin
      aNode.ImageIndex:=DOOROPEN;
      aNode.SelectedIndex:=DOOROPEN;
    end else
    begin
      aNode.ImageIndex:=QUESTION;
      aNode.SelectedIndex:=QUESTION;
    end;
  end else
  begin
    aNode.ImageIndex:=QUESTION;
    aNode.SelectedIndex:=QUESTION;
  end;
  aNode.StateIndex:= NOTHINGIMG;

end;

procedure TfmCurrentDeviceSetting.CurrentDeviceReaderConnectChange(aEcuID,
  aReaderNo: string; aConnected: Boolean);
var
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
  nReaderNo : integer;
begin
  Exit;
  if Not isDigit(aEcuID) then Exit;
  if TreeView_Device.Items.Count < 1 then Exit;
  if Not IsDigit(aReaderNo) then Exit;
  nReaderNo := strtoint(aReaderNo);
  aTreeView := TreeView_Device;

  aNode:= GetNodeByText(aTreeView,aEcuID + ':카드리더' + inttostr(nReaderNo) ,False);
  if aNode = nil then exit;

  if aConnected then
  begin
    aNode.ImageIndex:=READERCONNECT;
    aNode.SelectedIndex:=READERCONNECT;
  end else
  begin
    aNode.ImageIndex:=READERDISCONNECT;
    aNode.SelectedIndex:=READERDISCONNECT;
  end;
  aNode.StateIndex:= NOTHINGIMG;

end;

procedure TfmCurrentDeviceSetting.McuSettingEcuLoad(aColor: TColor = clWhite);
var
  i : integer;
  alist: TListItem;
  stDeviceType : string;
begin
  lvECU.Clear;
  for i := 0 to DeviceList.Count - 1 do
  begin
    if DeviceList.Strings[i] <> '00' then
    begin
      aList:= lvECU.Items.Add;
      aList.Caption:= DeviceList.Strings[i]; //기기 번호
      aList.ImageIndex:= -1;
      if isdigit(DeviceList.Strings[i]) then
      begin
        stDeviceType := '';
        stDeviceType := DeviceTypeNameList.Strings[strtoint(G_stDeviceType[strtoint(DeviceList.Strings[i])])];
        if stDeviceType = '' then stDeviceType := 'Type Checking...';

         aList.SubItems.Add(stDeviceType);
      end;
    end;
  end;
  lvECU.Color := aColor;

end;

procedure TfmCurrentDeviceSetting.cmbEcuTypeLoad;
var
  i : integer;
begin
  cmb_EcuType.Clear;
  for i := 7 to DeviceTypeNameList.Count - 1 do
  begin
    cmb_EcuType.Items.Add(DeviceTypeNameList.Strings[i]);
  end;

end;

procedure TfmCurrentDeviceSetting.lvECUMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Rect: TRect;
  ScreenPoint: TPoint;
  nTop : integer;
  stCurType : string;
begin
  if lvECU.Selected = nil then Exit;

  Rect := lvECU.Selected.DisplayRect(drBounds);
  Rect.TopLeft := lvECU.ClientToScreen(Rect.TopLeft);
  Rect.BottomRight := lvECU.ClientToScreen(Rect.BottomRight);
  if x < lvECU.Columns[0].Width then Exit;
  nTop := (Y div 17) * 17;
  // 현재 Cell의 좌표를 Rect로 저장
  with cmb_EcuType do
  begin
    // 사용 여부 등록
    ItemIndex := 0;
    Visible := true;
    Left := lvECU.Columns[0].Width + 2;
    Top := nTop;
    Width := Rect.Right - Rect.Left - lvECU.Columns[0].Width;
    Height := (Rect.Bottom - Rect.Top);
    stCurType := lvECU.Items[lvECU.Selected.Index].SubItems.Strings[0];
    Text := stCurType;
    BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
    SetFocus;
  end;

end;

procedure TfmCurrentDeviceSetting.cmb_EcuTypeChange(Sender: TObject);
var
  st: string;
  stEcuID : string;
  stDeviceType : string;
  stOldType : string;
  nIndex : integer;
begin
  with Sender as TRzCombobox do
  begin
    hide;
    if ItemIndex >= 0 then
    begin
      st := Items[ItemIndex];
      stOldType := lvECU.Items[lvECU.Selected.Index].SubItems.Strings[0];
      lvECU.Items[lvECU.Selected.Index].SubItems.Strings[0] := st;
      stEcuID := lvECU.Items[lvECU.Selected.Index].Caption;
      if Not L_bTableLoading then
      begin
        dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'DEVICE_TYPE',inttostr(ItemIndex + 7));
        dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'DEVICE_TYPE','U');
      end;
      if isDigit(stEcuID) then G_stDeviceType[strtoint(stEcuID)] := inttostr(ItemIndex + 7) ;
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.ICU100FormSetting;
begin
end;

procedure TfmCurrentDeviceSetting.ICU200FormSetting;
begin
end;

procedure TfmCurrentDeviceSetting.KTT811FormSetting;
begin
  ed_mcid.Enabled := True;
end;

procedure TfmCurrentDeviceSetting.KTT812FormSetting;
begin
  cmb_Relay2Type.Enabled := True;
  cmb_JaejungDelayUse.Enabled := True;
end;

function TfmCurrentDeviceSetting.GetDeviceType: string;
var
  I: Integer;
//  aNo: Integer;
  aData: String[100];
begin
//                  1         2         3         4         5
//         12345678901234567890123456789012345678901234567890
  aData:= '00000000000000000000000000000000000000000000000000'+
          '00000000000000000000000000000000000000000000000000';

  for i:= 0 to G_nMaxEcuCount  do
  begin
    aData[i+1] := G_stDeviceType[i][1];
  end;   //}
  Result:= aData;
end;

function TfmCurrentDeviceSetting.RegistUsedDeviceType(
  aDeviceType: string): Boolean;
var
  i : integer;
begin
//  Form_UsedDevice_ColorInitialize;

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '컨트롤러 타입 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.DeviceType_Registration(aDeviceType);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

procedure TfmCurrentDeviceSetting.RecvDeviceCode(aECUID,
  aDeviceCode: string);
var
  stDeviceName:string;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;

  stDeviceName := aDeviceCode;
  if aEcuID = '00' then
  begin
    if (aDeviceCode = 'ACC-503') OR (aDeviceCode = 'ICU-100') then stDeviceName := 'ICU-100'
    else if (aDeviceCode = 'ACC-505') OR (aDeviceCode = 'ICU-200') then stDeviceName := 'ICU-200'
    else if (aDeviceCode = 'ICU-300') then stDeviceName := 'ICU-300'
    else if (aDeviceCode = 'ACC-510') OR (aDeviceCode = 'MCU-200') OR (aDeviceCode = 'ECU-200') then stDeviceName := 'MCU-200'
    else if (aDeviceCode = 'ACC-104') OR (aDeviceCode = 'MCU-100') OR (aDeviceCode = 'ECU-100') then stDeviceName := 'MCU-100'
    else if (aDeviceCode = 'ACC-100') then stDeviceName := '분기국사'
    else if (aDeviceCode = 'ACC-302') then stDeviceName := 'ACU-100'
    else if (aDeviceCode = 'MCU-110') then stDeviceName := 'MCU-300'
    else if (aDeviceCode = 'MCU-110N') then stDeviceName := 'MCU-300(분기국사)'
    ;
  end else
  begin
    if (aDeviceCode = 'ACC-503') OR (aDeviceCode = 'ICU-100') then stDeviceName := 'ICU-100'
    else if (aDeviceCode = 'ACC-505')  OR (aDeviceCode = 'ICU-200') then stDeviceName := 'ICU-200'
    else if (aDeviceCode = 'ICU-300') then stDeviceName := 'ICU-300'
    else if (aDeviceCode = 'ACC-510')  OR (aDeviceCode = 'MCU-200') OR (aDeviceCode = 'ECU-200') then stDeviceName := 'ECU-200'
    else if (aDeviceCode = 'ACC-104')  OR (aDeviceCode = 'MCU-100') OR (aDeviceCode = 'ECU-100') then stDeviceName := 'ECU-100'
    else if (aDeviceCode = 'ACC-100')  then stDeviceName := '분기국사'
    else if (aDeviceCode = 'ACC-302') then stDeviceName := 'ACU-100'
    else if (aDeviceCode = 'ECU-110') then stDeviceName := 'ECU-300';
  end;
  st_DeviceCode.Caption := stDeviceName;

end;

function TfmCurrentDeviceSetting.DeviceCodeCheck(aEcuID: string): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  Form_DeviceCode_Clear;
  //if Not dmSocket.DeviceConnectCheck(aEcuID) then exit; --통신이 끊겨 있어도 체크해 보자

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '컨트롤러 코드 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.DeviceCode_Check(aEcuID,True);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

function TfmCurrentDeviceSetting.UsedDeviceTypeSearch(aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value('00','DEVICE_TYPE') = 'Y' then Exit;
  end;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    //for i := 0 to G_nLoopCount do
    //begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '사용컨트롤러 기기타입 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.DeviceType_Check(True);
    //  if result then Break;
    //end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.RegistKTTSystemID(
  aLinkusID: string): Boolean;
var
  i : integer;
  nID : integer;
  stHexID : string;
begin
//  Form_KTTSystem_ColorInitialize;
  if aLinkusID <> 'AAAA' then
  begin
    nID := StrToInt(aLinkusId);
    stHexID := Dec2Hex(nID, 4);
  end else stHexID := 'AAAA';

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '관제 시스템ID 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.KTTSystemID_Registration(stHexID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.Form_KTTSystem_ColorInitialize;
begin
  Edit_LinkusID.Color := clWhite;
  Edit_LinkusTel.Color := clWhite;
  Edit_LinkusTel2.Color := clWhite;
end;

procedure TfmCurrentDeviceSetting.KTTSystemIDData(aECUID, aData: string);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  Edit_LinkusID.Text := aData;
  Edit_LinkusID.Color := clYellow;
end;

function TfmCurrentDeviceSetting.RegistKTTTelNum(aNo,
  aTelNum: string): Boolean;
var
  i : integer;
begin
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '데코더전화번호' + inttostr(strtoint(aNo) + 1) +' 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistKTTTelNum(aNo,aTelNum);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.KTTTelNumberData(aECUID, aNo,
  aTelNum: string);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if Not isDigit(aNo) then Exit;

  if strtoint(aNo) = 0 then
  begin
    Edit_LinkusTel.Text := aTelNum;
    Edit_LinkusTel.Color := clYellow;
  end else if strtoint(aNo) = 1 then
  begin
    Edit_LinkusTel2.Text := aTelNum;
    Edit_LinkusTel2.Color := clYellow;
  end;

end;

function TfmCurrentDeviceSetting.RegistKTTRingCount(ArmRingCount,
  DisArmRingCount: integer): Boolean;
var
  i : integer;
begin
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '원격제어링횟수 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistKTTRingCount(ArmRingCount,DisArmRingCount);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.KTTRingCountData(aECUID, aArmRingCount,
  aDisArmRingCount: string);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if Not isDigit(aArmRingCount) then Exit;
  Spinner_Ring.Value := strtoint(aArmRingCount);
  if Not isDigit(aDisArmRingCount) then Exit;
  Spinner_cancelRing.Value := strtoint(aDisArmRingCount);
end;

function TfmCurrentDeviceSetting.KTTRingCountSearch(aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value('00','Ring_Cnt') = 'Y' then Exit;
  end;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '원격제어링 횟수 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.KTTRingCountSearch;
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.KTTSystemIDSearch(aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value('00','SYSTEM_ID') = 'Y' then Exit;
  end;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '관제 시스템 ID 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.KTTSystemIDSearch;
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.KTTTelNumSearch(aNo: string;aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value('00','Linkus_Tel') = 'Y' then Exit;
  end;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '데코더전화번호' + inttostr(strtoint(aNo) + 1) + ' 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.KTTTelNumSearch(aNo);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.DeviceTypeChange(aEcuID,aDeviceType: string);
var
  stDeviceType : string;
  nIndex : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if IsDigit(G_stSelectEcuID) then
    DeviceType := aDeviceType;   //FormSetting

//  stDeviceType := GetDeviceType;
//  RegistUsedDeviceType(stDeviceType);

end;

procedure TfmCurrentDeviceSetting.CurrentDeviceTypeChange(aEcuID: string);
var
  stDeviceType : string;
begin
  if Not isDigit(aEcuID) then Exit;
//  stDeviceType := GetDeviceType;
//  RegistUsedDeviceType(stDeviceType);

end;

procedure TfmCurrentDeviceSetting.cmb_EcuTypeExit(Sender: TObject);
begin
  cmb_EcuType.hide;

end;

function TfmCurrentDeviceSetting.GetDeviceMaxPortNumber: integer;
var
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then
  begin
    if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT811 then result := 8
    else if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT812 then result := 8
    else if G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU100 then result := 6
    else if G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU200 then result := 6
    else if G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU300 then result := 8
    else if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT813 then result := 8
    else if G_stDeviceType[strtoint(G_stSelectEcuID)] = SGS100 then result := 8
    else result := 0;
  end else
  begin
    result := TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxPortNo;
  end;

end;

function TfmCurrentDeviceSetting.GetDeviceMaxDoorNumber: integer;
var
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then
  begin
    if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT811 then result := 2
    else if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT812 then result := 1
    else if G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU100 then result := 1
    else if G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU200 then result := 0
    else if G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU300 then result := 1
    else if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT813 then result := 2
    else if G_stDeviceType[strtoint(G_stSelectEcuID)] = SGS100 then result := 4
    else result := 0;
  end else
  begin
    result := TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo;
  end;

end;

procedure TfmCurrentDeviceSetting.PopupMenuAlarmSet;
begin
  mn_ControlerReset.Visible := False;
  mn_FireRecovery.Visible := False;
  mn_ArmMode.Visible := True;
  mn_DisArmMode.Visible := True;
  mn_DoorManagerMode.Visible := False;
  mn_DoorOpenMode.Visible := False;
  mn_ReaderVersion.Visible := False;
end;

procedure TfmCurrentDeviceSetting.PopupMenuDeviceSet;
begin
  mn_ControlerReset.Visible := True;
  mn_FireRecovery.Visible := True;
  mn_ArmMode.Visible := False;
  mn_DisArmMode.Visible := False;
  mn_DoorManagerMode.Visible := False;
  mn_DoorOpenMode.Visible := False;
  mn_ReaderVersion.Visible := False;

end;

procedure TfmCurrentDeviceSetting.PopupMenuDoorSet;
begin
  mn_ControlerReset.Visible := False;
  mn_FireRecovery.Visible := False;
  mn_ArmMode.Visible := False;
  mn_DisArmMode.Visible := False;
  mn_DoorManagerMode.Visible := True;
  mn_DoorOpenMode.Visible := True;
  mn_ReaderVersion.Visible := False;

end;

procedure TfmCurrentDeviceSetting.PopupMenuReaderSet;
begin
  mn_ControlerReset.Visible := False;
  mn_FireRecovery.Visible := False;
  mn_ArmMode.Visible := False;
  mn_DisArmMode.Visible := False;
  mn_DoorManagerMode.Visible := False;
  mn_DoorOpenMode.Visible := False;
  mn_ReaderVersion.Visible := True;

end;

procedure TfmCurrentDeviceSetting.cmb_SearchTypeChange(Sender: TObject);
begin
  if cmb_SearchType.ItemIndex = 0 then CurrentDeviceView(False)
  else if cmb_SearchType.ItemIndex = 1 then CurrentDeviceView(True);
  G_nSearchType := cmb_SearchType.ItemIndex;
end;

procedure TfmCurrentDeviceSetting.mn_ControlerResetClick(Sender: TObject);
begin
  dmSocket.ControlerReset(G_stSelectEcuID);
end;

procedure TfmCurrentDeviceSetting.TreeView_DeviceMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  TreeView_Device.Selected := TreeView_Device.GetNodeAt(X,Y);
  TreeView_DeviceClick(Sender);
end;

procedure TfmCurrentDeviceSetting.mn_ArmModeClick(Sender: TObject);
begin
  inherited;
  ChangeAlarmMode(G_stSelectEcuID,'A');

end;

procedure TfmCurrentDeviceSetting.mn_DisArmModeClick(Sender: TObject);
begin
  inherited;
  ChangeAlarmMode(G_stSelectEcuID,'D');

end;

procedure TfmCurrentDeviceSetting.mn_DoorManagerModeClick(Sender: TObject);
var
  stCaption : string;
begin
  inherited;
  stCaption := TreeView_Device.Selected.Text;
  stCaption := StringReplace(stCaption,':출입문','',[rfReplaceAll]);
  if Not isDigit(stCaption) then Exit;
  RemoteDoorControl(G_stSelectEcuID,stCaption[3],'2','0');


end;

procedure TfmCurrentDeviceSetting.mn_DoorOpenModeClick(Sender: TObject);
var
  stCaption : string;
begin
  inherited;
  stCaption := TreeView_Device.Selected.Text;
  stCaption := StringReplace(stCaption,':출입문','',[rfReplaceAll]);
  if Not isDigit(stCaption) then Exit;
  if Length(stCaption) < 3 then Exit;
  RemoteDoorControl(G_stSelectEcuID,stCaption[3],'2','1');

end;

procedure TfmCurrentDeviceSetting.mn_ReaderVersionClick(Sender: TObject);
var
  stCaption : string;
begin
  inherited;
  stCaption := TreeView_Device.Selected.Text;
  stCaption := StringReplace(stCaption,':카드리더','',[rfReplaceAll]);
  if Not isDigit(stCaption) then Exit;
  if Length(stCaption) < 3 then Exit;
  CardReaderVersionCheck(G_stSelectEcuID,strtoint(stCaption[3]));
end;

function TfmCurrentDeviceSetting.RegistArmDsCheck(aEcuID, aDoorNo,
  aArmDsCheck: string): Boolean;
var
  i : integer;
  nIndex : integer;
begin
  if Not isDigit(aEcuID) then exit;
  if Not isDigit(aDoorNo) then exit;

  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(strtoint(aDoorNo)) then Exit;

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '출입문' + aDoorNo + ' 경계시문열림검사 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistArmDsCheck(aEcuID,
                         FillZeroNumber(strtoint(aDoorNo),2),
                         aArmDsCheck);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.ArmDsCheckData(aECUID, aDoorNo,
  aArmCheck: string);
var
  cmb_Box : TComboBox;
  nDoorNo : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if Not isDigit(aDoorNo) then Exit;
  
  nDoorNo := strtoint(aDoorNo);

  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_ArmDSCheck',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_ArmDSCheck',nDoorNo);

  if cmb_Box <> nil then
  begin
    if isDigit(aArmCheck) then
    begin
      cmb_Box.ItemIndex := strtoint(aArmCheck);
      cmb_Box.Color := clYellow;
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.cmb_ArmDSCheck1Change(Sender: TObject);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,inttostr((Sender as TRzComboBox).Tag),'ArmDSCheck',inttostr((Sender as TRzComboBox).ItemIndex));
    dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,inttostr((Sender as TRzComboBox).Tag),'ArmDSCheck','U');
    L_bSettingChanged := True;
  end;
  if G_bRealRegist then RegistArmDsCheck(G_stSelectEcuID,inttostr((Sender as TRzComboBox).Tag),inttostr((Sender as TRzComboBox).ItemIndex));

end;

function TfmCurrentDeviceSetting.SearchArmDsCheck(aEcuID,
  aDoorNo: string;aDirect:Boolean=False): Boolean;
var
  i : integer;
  nIndex : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not isDigit(aDoorNo) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DOORSETTINGRCV_Value(aEcuID,'0',aDoorNo,'ArmDSCheck') = 'Y' then Exit;
  end;

  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(strtoint(aDoorNo)) then Exit;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '경계시 문열림검사 사용유무 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.SearchArmDsCheck(aEcuID,aDoorNo);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.RegistArmRelay(aEcuID,
  aArmRelay: string): Boolean;
var
  i : integer;
begin
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '경해Relay동작방법 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistArmRelay(aEcuID,aArmRelay);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.cmb_ArmRelayChange(Sender: TObject);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'ArmRelay',inttostr(cmb_ArmRelay.ItemIndex));
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'ArmRelay','U');
    L_bSettingChanged := True;
  end;
  if G_bRealRegist then RegistArmRelay(G_stSelectEcuID,inttostr(cmb_ArmRelay.ItemIndex));

end;

procedure TfmCurrentDeviceSetting.ArmRelayCheckData(aECUID,
  aArmRelay: string);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if isDigit(aArmRelay) then
  begin
    cmb_ArmRelay.ItemIndex := strtoint(aArmRelay);
    cmb_ArmRelay.Color := clYellow;
  end;

end;

function TfmCurrentDeviceSetting.SearchArmRelay(aEcuID: string;aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ArmRelay') = 'Y' then Exit;
  end;
  cmb_ArmRelay.Color := clWhite;

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := dmSocket.SearchArmRelay(aEcuID);
    if result then Break;
  end;

end;

procedure TfmCurrentDeviceSetting.cmb_alartLampChange(Sender: TObject);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'ZONE_LAMPONOFF',inttostr(cmb_alartLamp.ItemIndex));
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'ZONE_LAMPONOFF','U');
    L_bSettingChanged := True;
  end;
end;

procedure TfmCurrentDeviceSetting.cmb_alartSirenChange(Sender: TObject);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'ZONE_SIRENONOFF',inttostr(cmb_alartSiren.ItemIndex));
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'ZONE_SIRENONOFF','U');
    L_bSettingChanged := True;
  end;
end;

function TfmCurrentDeviceSetting.RegistAlartLampSiren(aEcuID, aAlertLamp,
  aAlertSiren: string): Boolean;
var
  i : integer;
begin
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '비상존이상 발생시 램프/사이렌 정보 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistAlartLampSiren(aEcuID, aAlertLamp,aAlertSiren);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

procedure TfmCurrentDeviceSetting.LampSirenOnOff(aECUID, stLampOnOff,
  aSirenOnOff: string);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if isDigit(stLampOnOff) then
  begin
    cmb_alartLamp.ItemIndex := strtoint(stLampOnOff);
    cmb_alartLamp.Color := clYellow;
  end;
  if isDigit(aSirenOnOff) then
  begin
    cmb_alartSiren.ItemIndex := strtoint(aSirenOnOff);
    cmb_alartSiren.Color := clYellow;
  end;
end;

function TfmCurrentDeviceSetting.AlartLampSirenStateCheck(
  aEcuID: string;aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONE_SIRENONOFF') = 'Y' then Exit;
  end;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '비상존 이상발생시 램프/사이렌 정보 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.AlartLampSirenStateCheck(aEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.RegistAlertLampTime(aEcuID,
  aAlertLampTime: string): Boolean;
var
  i : integer;
begin
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '램프 동작시간 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistAlertLampTime(aEcuID,aAlertLampTime);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.RegistAlertSirenTime(aEcuID,
  aAlertSirenTime: string): Boolean;
var
  i : integer;
begin
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '사이렌 동작시간 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistAlertSirenTime(aEcuID,aAlertSirenTime);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

procedure TfmCurrentDeviceSetting.LampTimeSetData(aECUID,
  aLampTime: string);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if isDigit(aLampTime) then
  begin
    ed_alertLampTime.Text := aLampTime;
    ed_alertLampTime.Color := clYellow;
  end;

end;

procedure TfmCurrentDeviceSetting.SirenTimeSetData(aECUID,
  aSirenTime: string);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if isDigit(aSirenTime) then
  begin
    ed_alertSirenTime.Text := aSirenTime;
    ed_alertSirenTime.Color := clYellow;
  end;

end;

function TfmCurrentDeviceSetting.AlertLampTimeCheck(
  aEcuID: string;aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONE_LAMPONTIME') = 'Y' then Exit;
  end;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '램프 동작시간 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.AlertLampTimeCheck(aEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.AlertSirenTimeCheck(
  aEcuID: string;aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONE_SIRENONTIME') = 'Y' then Exit;
  end;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '사이렌 동작시간 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.AlertSirenTimeCheck(aEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.btn_WizNetSearchClick(Sender: TObject);
begin
  inherited;
  WiznetModuleInfoSearch;
end;

function TfmCurrentDeviceSetting.cdmaSetDataSearch(
  aEcuID: string): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := dmSocket.CCCInfoCheck;
    if result then Break;
  end;

end;

function TfmCurrentDeviceSetting.cdmaUseSearch(aEcuID: string): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := dmSocket.CdmaUseCheck;
    if result then Break;
  end;

end;

procedure TfmCurrentDeviceSetting.ed_cdmaMinChange(Sender: TObject);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'CDMAMIN',ed_cdmaMin.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'CDMAMIN','U');
  end;
end;

procedure TfmCurrentDeviceSetting.ed_cdmaMuxChange(Sender: TObject);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'CDMAMUX',ed_cdmaMux.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'CDMAMUX','U');
  end;
end;

procedure TfmCurrentDeviceSetting.ed_cdmaIPChange(Sender: TObject);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'CDMAIP',ed_cdmaIP.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'CDMAIP','U');
  end;
end;

procedure TfmCurrentDeviceSetting.ed_cdmaPortChange(Sender: TObject);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'CDMAPORT',ed_cdmaPort.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'CDMAPORT','U');
  end;

end;

procedure TfmCurrentDeviceSetting.ed_cdmachktimeChange(Sender: TObject);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'CDMACHECKTIME',ed_cdmachktime.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'CDMACHECKTIME','U');
  end;

end;

procedure TfmCurrentDeviceSetting.ed_cdmarssiChange(Sender: TObject);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'CDMARSSI',ed_cdmarssi.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'CDMARSSI','U');
  end;
end;

procedure TfmCurrentDeviceSetting.CDMAInfoSetting(aEcuID, aCdmaMin,
  aCdmaMux, aCdmaIP, aCdmaPort, aCdmachktime, aCdmarssi: string);
begin
  if Not isDigit(aEcuID) then Exit;
  ed_cdmaMin.Text := aCdmaMin;
  ed_cdmaMux.Text := aCdmaMux;
  ed_cdmaIP.Text := aCdmaIP;
  ed_cdmaPort.Text := aCdmaPort;
  ed_cdmachktime.Text := aCdmachktime;
  ed_cdmarssi.Text := aCdmarssi;

  ed_cdmaMin.Color := clYellow;
  ed_cdmaMux.Color := clYellow;
  ed_cdmaIP.Color := clYellow;
  ed_cdmaPort.Color := clYellow;
  ed_cdmachktime.Color := clYellow;
  ed_cdmarssi.Color := clYellow;
end;

procedure TfmCurrentDeviceSetting.Form_CDMA_ColorInitialize;
begin
  ed_cdmaMin.Color := clWhite;
  ed_cdmaMux.Color := clWhite;
  ed_cdmaIP.Color := clWhite;
  ed_cdmaPort.Color := clWhite;
  ed_cdmachktime.Color := clWhite;
  ed_cdmarssi.Color := clWhite;

end;

procedure TfmCurrentDeviceSetting.CDMASetting(aEcuID, aData: string);
begin
  if Not isDigit(aEcuID) then Exit;
  if Not isDigit(aData) then Exit;
  rg_CdmaUse.ItemIndex := strtoint(aData);
end;

function TfmCurrentDeviceSetting.RegistcdmaSetData(aEcuID, aCdmaMin,
  aCdmaMux, aCdmaIP, aCdmaPort, aCdmachktime, aCdmarssi: string): Boolean;
var
  i : integer;
begin
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := dmSocket.RegistcdmaSetData(aEcuID, aCdmaMin,aCdmaMux, aCdmaIP, aCdmaPort, aCdmachktime, aCdmarssi);
    if result then Break;
  end;

end;

function TfmCurrentDeviceSetting.RegistCdmaUse(aEcuID,
  aCdmaUse: string): Boolean;
var
  i : integer;
begin
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := dmSocket.CdmaUseRegist(aCdmaUse);
    if result then Break;
  end;

end;

procedure TfmCurrentDeviceSetting.btn_cdmasettingClick(Sender: TObject);
begin
  Form_CDMA_ColorInitialize;
  if rg_CdmaUse.ItemIndex < 0 then rg_CdmaUse.ItemIndex := 0;
  RegistCdmaUse(G_stSelectEcuID,inttostr(rg_CdmaUse.ItemIndex));
  RegistcdmaSetData(G_stSelectEcuID,ed_cdmaMin.Text,ed_cdmaMux.Text,ed_cdmaIP.Text,ed_cdmaPort.Text,ed_cdmachktime.Text,ed_cdmarssi.Text);

end;

procedure TfmCurrentDeviceSetting.btn_cdmaSearchClick(Sender: TObject);
begin
  Form_CDMA_ColorInitialize;
  cdmaUseSearch(G_stSelectEcuID);
  cdmaSetDataSearch(G_stSelectEcuID);
end;

procedure TfmCurrentDeviceSetting.btn_DVRUseRegClick(Sender: TObject);
begin
  Form_DVR_ColorInitialize;
  if rg_dvruse.ItemIndex < 0 then rg_dvruse.ItemIndex := 0;
  RegistDVRUse(G_stSelectEcuID,inttostr(rg_dvruse.ItemIndex));
  RegistDVRSetData(G_stSelectEcuID,ed_dvrip.Text,ed_dvrport.Text);

end;

procedure TfmCurrentDeviceSetting.Form_DVR_ColorInitialize;
begin
  ed_dvrip.Color := clWhite;
  ed_dvrport.Color := clWhite;
end;

function TfmCurrentDeviceSetting.RegistDVRSetData(aEcuID, aDVRIP,
  aDVRPort: string): Boolean;
var
  i : integer;
begin
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := dmSocket.RegistDVRSetData(aEcuID, aDVRIP,aDVRPort);
    if result then Break;
  end;

end;

function TfmCurrentDeviceSetting.RegistDVRUse(aEcuID,
  aDvrUse: string): Boolean;
var
  i : integer;
begin
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := dmSocket.DVRUseRegist(aDvrUse);
    if result then Break;
  end;

end;

procedure TfmCurrentDeviceSetting.DVRUseSetting(aEcuID, aData: string);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if Not isDigit(aData) then Exit;
  rg_dvruse.ItemIndex := strtoint(aData);

end;

procedure TfmCurrentDeviceSetting.ed_dvripChange(Sender: TObject);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'DVRIP',ed_dvrip.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'DVRIP','U');
  end;

end;

procedure TfmCurrentDeviceSetting.ed_dvrportChange(Sender: TObject);
begin
  inherited;
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'DVRPORT',ed_dvrport.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'DVRPORT','U');
  end;

end;

procedure TfmCurrentDeviceSetting.DVRInfoSetting(aEcuID, aDvrIP,
  aDvrPort: string);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  ed_dvrip.Text := aDvrIP;
  ed_dvrport.Text := aDvrPort;
  ed_dvrip.Color := clYellow;
  ed_dvrport.Color := clYellow;
end;

procedure TfmCurrentDeviceSetting.btn_DVRUseSearchClick(Sender: TObject);
begin
  Form_DVR_ColorInitialize;
  DVRUseSearch(G_stSelectEcuID);
  DVRSetDataSearch(G_stSelectEcuID);

end;

function TfmCurrentDeviceSetting.DVRSetDataSearch(aEcuID: string): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := dmSocket.DVRSetDataSearch(aEcuID);
    if result then Break;
  end;

end;

function TfmCurrentDeviceSetting.DVRUseSearch(aEcuID: string): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := dmSocket.DVRUseCheck(aEcuID);
    if result then Break;
  end;

end;

procedure TfmCurrentDeviceSetting.CurrentDVRUseChange(aEcuID: string;
  aUsed: Boolean);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  gb_Dvr.Visible := aUsed;
end;

procedure TfmCurrentDeviceSetting.CurrentCARDREADERTELUseChange(
  aEcuID: string; aUsed: Boolean);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  Tab_CardReaderTel.TabVisible := aUsed;
end;

function TfmCurrentDeviceSetting.CardReaderTellNoCheck(aDirect:Boolean=False): Boolean;
var
  i : integer;
  bResult : Boolean;
  Edit : TEdit;
  nNumber : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;
  Try
    CardReaderTelEnable(False);
    for i := 0 to 9 do
    begin
      bResult := CardReaderTelNumberSearch(G_stSelectEcuID,i,aDirect);
      if Not bResult then
      begin
        if Application.MessageBox(Pchar(inttostr(i) + '번 전화번호 조회시 문제가 발생 했습니다. 계속 하시겠습니까?'),'주의',MB_OKCANCEL) = IDCANCEL then Exit;
      end;
    end;
  Finally
    CardReaderTelEnable(True);
  End;
end;

procedure TfmCurrentDeviceSetting.Form_AllCardReaderTel_ColorInitialize;
var
  i : integer;
  Edit:TEdit;
begin
  se_crCallTime.Color := clWhite;
  for i:=0 to 9 do
  begin
    Edit := TravelEditItem(gb_cardReaderTel,'ed_cardreaderTel',i);
    if Edit <> nil then Edit.Color := clWhite;
  end;

end;

procedure TfmCurrentDeviceSetting.CardReaderTelEnable(aValue: Boolean);
var
  i : integer;
  Edit:TEdit;
begin
  for i:=0 to 9 do
  begin
    Edit := TravelEditItem(gb_cardReaderTel,'ed_cardreaderTel',i);
    if Edit <> nil then Edit.Enabled := aValue;
  end;

end;

function TfmCurrentDeviceSetting.CardReaderTelNumberSearch(aEcuID: string;
  nTelNo: integer;aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'CARDREADERTEL' + inttostr(nTelNo)) = 'Y' then Exit;
  end;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := inttostr(nTelNo) + '번 위치 전화번호 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.CardReaderTelNumberSearch(aEcuID,inttostr(nTelNo));
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.CARDREADERTelNumberData(aECUID, aNo,
  aTelNum: string);
var
  Edit:TEdit;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if Not isDigit(aNo) then Exit;
  Edit := TravelEditItem(gb_cardReaderTel,'ed_cardreaderTel',strtoint(aNo));
  if Edit <> nil then
  begin
    Edit.Text := aTelNum;
    Edit.Color := clYellow;
  end;

end;

procedure TfmCurrentDeviceSetting.ed_cardreaderTel1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'CARDREADERTEL' + TEdit(Sender).Hint,TEdit(Sender).Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'CARDREADERTEL' + TEdit(Sender).Hint,'U');
  end;
end;

procedure TfmCurrentDeviceSetting.CardReaderTellNo_Registration;
var
  i : integer;
  bResult : Boolean;
  Edit : TEdit;
  nNumber : integer;
begin
  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;
  CardReaderTelEnable(False);
  for i := 0 to 9 do
  begin
    bResult := CardReaderTelNumberRegist(G_stSelectEcuID,i);
    if Not bResult then
    begin
      if Application.MessageBox(Pchar(inttostr(i) + '번 전화번호 등록시 문제가 발생 했습니다. 계속 하시겠습니까?'),'주의',MB_OKCANCEL) = IDCANCEL then Exit;
    end;
  end;
  CardReaderTelEnable(True);

end;

function TfmCurrentDeviceSetting.CardReaderTelNumberRegist(aEcuID: string;
  nTelNo: integer): Boolean;
var
  i : integer;
  Edit : TEdit;
  stTelNo : string;
begin
  stTelNo := '';
  Edit := TravelEditItem(gb_cardReaderTel,'ed_cardreaderTel',nTelNo);
  if Edit <> nil then
  begin
    stTelNo := Edit.Text;
  end;
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '카드리더 전화번호' + inttostr(nTelNo)+ '번 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.CardReaderTelNumberRegist(aEcuID,inttostr(nTelNo),stTelNo);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.CurrentCardTypeChange(aEcuID,
  aCardType: string);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  FormDeviceSetting(aEcuID);
  case aCardType[1] of
      NOTHINGTYPE : st_CardType.Caption := '알수없음';
      AUTOKT811   : st_CardType.Caption := '무인국사';
      COMMON811   : st_CardType.Caption := '범용';
      KT811       : st_CardType.Caption := 'KT사옥';
      UNIVER811   : st_CardType.Caption := '대학용';
  end;

end;

procedure TfmCurrentDeviceSetting.EcuRegist(aUsed: Boolean);
begin
  L_bEcuRegist := aUsed;
  lvECU.Enabled := aUsed;
  btnECUAdd.Enabled := aUsed;
  btnECUErase.Enabled := aUsed;
end;

procedure TfmCurrentDeviceSetting.FormDeviceSetting(aEcuID: string;aReaderDoorRefresh:Boolean=False);
var
  nIndex : integer;
  i :  integer;
  bDoor2Use : Boolean;
begin
  bDoor2Use := True;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  //if TCurrentDeviceState(DeviceList.Objects[nIndex]).CDMAUse then gb_CDMA.Visible := True
  //else gb_CDMA.Visible := False;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).DVRUse then gb_Dvr.Visible := True
  else gb_Dvr.Visible := False;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).CARDREADERTELUse then Tab_CardReaderTel.TabVisible := True
  else Tab_CardReaderTel.TabVisible := False;

  if TCurrentDeviceState(DeviceList.Objects[nIndex]).PortZoneUseRemoteControlSkill then tabZoneUseControl.TabVisible := True
  else tabZoneUseControl.TabVisible := False;

  cmb_Relay2Type.Enabled := False;
  cmb_JaejungDelayUse.Enabled := False;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT811 then
  begin
    ComboBox_WatchPowerOff.Enabled := True;
    //cmb_ArmRelay.Enabled := False;
    ArmDSFormEnable(False);
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType = KT811 then
    begin
      GB_Special.Visible := True;
    end else
    begin
      GB_Special.Visible := False;
    end;
  end else if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
  begin
    cmb_Relay2Type.Enabled := True;
    cmb_JaejungDelayUse.Enabled := True;
    ComboBox_WatchPowerOff.Enabled := True;
    ArmDSFormEnable(True);
    GB_Special.Visible := True;
  end else if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT813 then
  begin
    ComboBox_WatchPowerOff.Enabled := True;
    //cmb_ArmRelay.Enabled := False;
    ArmDSFormEnable(False);
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType = KT811 then
    begin
      GB_Special.Visible := True;
    end else
    begin
      GB_Special.Visible := False;
    end;
  end else if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = ICU100 then
  begin
    ComboBox_WatchPowerOff.Enabled := False;
    ArmDSFormEnable(False);
    GB_Special.Visible := False;
  end else if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = ICU200 then
  begin
    ComboBox_WatchPowerOff.Enabled := False;
    ArmDSFormEnable(False);
    GB_Special.Visible := False;
  end else if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = ICU300 then
  begin
    ComboBox_WatchPowerOff.Enabled := False;
    ArmDSFormEnable(False);
    GB_Special.Visible := False;
  end else if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = SGS100 then
  begin
    ComboBox_WatchPowerOff.Enabled := True;
    //cmb_ArmRelay.Enabled := False;
    ArmDSFormEnable(False);
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType = KT811 then
    begin
      GB_Special.Visible := True;
    end else
    begin
      GB_Special.Visible := False;
    end;
  end;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).JavaraScheduleSkill then
  begin
    chk_ArmJavaraClose.Visible := True;
    chk_JavaraAutoClose.Visible := True;
  end else
  begin
    chk_ArmJavaraClose.Visible := False;
    chk_JavaraAutoClose.Visible := False;
  end;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo > 0 then
  begin
    st_DoorType1.Enabled := True;
    ComboBox_DoorType1.Enabled := True;
    DoorFormUsed(1,True);
    tab_DoorLock.TabVisible := True;
  end else
  begin
    st_DoorType1.Enabled := False;
    ComboBox_DoorType1.Enabled := False;
    DoorFormUsed(1,False);
    tab_DoorLock.TabVisible := False;
  end;

  if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo > 1 then
  begin
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
    begin
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).RELAY2TYPE = 0 then
      begin
        //FormDoorLock2TypeEnable(False);
        FormSystemDoorUsePossibilityEnable('2',False);
        DoorFormUsed(2,False);
        bDoor2Use := False;
      end else
      begin
        //FormDoorLock2TypeEnable(True);
        FormSystemDoorUsePossibilityEnable('2',True);
        DoorFormUsed(2,True);
      end;
    end else
    begin
      //FormDoorLock2TypeEnable(True);
      FormSystemDoorUsePossibilityEnable('2',True);
      DoorFormUsed(2,True);
    end;
  end else
  begin
    //FormDoorLock2TypeEnable(False);
    FormSystemDoorUsePossibilityEnable('2',False);
    DoorFormUsed(2,False);
  end;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo > 2 then
  begin
    DoorLockExtensionForm(True);
  end else
  begin
    DoorLockExtensionForm(False);
  end;

  if aReaderDoorRefresh then ReaderFormDoorLockSetting(TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo,bDoor2Use);  //리더 폼에 문번호 등록 하자

  if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxReaderNo > 0 then
  begin
    tab_CardReader.TabVisible := True;
    for i := 1 to TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxReaderNo do
    begin
      ReaderFormUsed(i,True);
    end;
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxReaderNo < 8 then
    begin
      for i := TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxReaderNo to 8 do
      begin
        ReaderFormUsed(i,False);
      end;
    end;
  end else
  begin
    tab_CardReader.TabVisible := False;
  end;

  if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxPortNo > 0 then
  begin
    Tab_Port.TabVisible := True;
    for i := 1 to TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxPortNo do
    begin
      PortFormUsed(i,True);
    end;
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxPortNo < 8 then
    begin
      for i := TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxPortNo + 1 to 8 do
      begin
        PortFormUsed(i,False);
      end;
    end;
  end else
  begin
    Tab_Port.TabVisible := False;
  end;

  if TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType = AUTOKT811 then
  begin
    //무인국사용 설정 하자
    tab_CardReader.TabVisible := False;
    //Tab_CardReaderTel.TabVisible := True;
    EcuRegist(False);
  end else
  begin
    //Tab_CardReaderTel.TabVisible := False;
    EcuRegist(True);
  end;
  //DoorDSCheckTimeEnable(TCurrentDeviceState(DeviceList.Objects[nIndex]).DoorDSCheckTimeUse);
  DoorArmDSCheckEnable(TCurrentDeviceState(DeviceList.Objects[nIndex]).DoorArmDSCheckUse);
  tabLockExtention.TabVisible := TCurrentDeviceState(DeviceList.Objects[nIndex]).DoorLockExtensionUse;

  if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse then
     TabArmExtension.TabVisible := TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmExtension  //경계부가기능
  else TabArmExtension.TabVisible := False;

  ArmAreaSkillChange(G_stSelectEcuID,TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill);
  ArmAreaUseChange(G_stSelectEcuID,TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse,False);

  gb_SystemZoneExtension.Visible := TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill;
  tab_ExtensionPort.TabVisible := TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill;

  PortZoneUseSkillChange(G_stSelectEcuID,TCurrentDeviceState(DeviceList.Objects[nIndex]).PortZoneUseSkill);

  if aEcuID = '00' then
  begin
    gb_AraeAll.Visible := True;
    gb_ArmAll.Visible := True;
  end else
  begin
    gb_AraeAll.Visible := False;
    gb_ArmAll.Visible := False;
  end;
end;

procedure TfmCurrentDeviceSetting.DoorFormUsed(aDoorNo: integer;
  aUsed: Boolean);
var
  cmbBox : TComboBox;
  spinEdit : TspinEdit;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then Exit;

  if aDoorNo < 3 then
  begin
    cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_CardModeType' , aDoorNo);
    if cmbBox <> nil then
    begin
      cmbBox.Enabled := aUsed;
      if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(aDoorNo) then cmbBox.Enabled := False;
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorType(aDoorNo) = '0' then
      begin
        cmbBox.Enabled := False; //방범전용에서는 Posi/Nega 동작 못하도록
        cmbBox.ItemIndex := 0;
      end;
    end;
    cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_DoorModeType' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorControlTime' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    spinEdit := TravelSpinEditItem(gb_DoorInfo,'SpinEdit_OpenMoni' , aDoorNo);
    if spinEdit <> nil then spinEdit.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_AlarmLongOpen' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_SendDoorStatus' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_UseSch' , aDoorNo);
    if cmbBox <> nil then
    begin
      cmbBox.Enabled := aUsed;
      if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ScheduleUse then cmbBox.Enabled := False; //스케줄 기능이 없는 장비 이면
    end;
    cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_ControlFire' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorInfo,'cmb_DsOpenState' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorInfo,'cmb_RemoteDoorOpen' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorDscheckTime' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorInfo,'cmb_ArmDSCheck' , aDoorNo);
    if cmbBox <> nil then
    begin
      cmbBox.Enabled := aUsed;
      if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(aDoorNo) then cmbBox.Enabled := False;
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT812 then cmbBox.Enabled := False;
      if (TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorLockType(aDoorNo) <> 2) and
         (TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorLockType(aDoorNo) <> 3) then cmbBox.Enabled := False;  //데드볼트 락이 아니면 False
    end;
  end else
  begin
    cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_CardModeType' , aDoorNo);
    if cmbBox <> nil then
    begin
      cmbBox.Enabled := aUsed;
      if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(aDoorNo) then cmbBox.Enabled := False;
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorType(aDoorNo) = '0' then
      begin
        cmbBox.Enabled := False; //방범전용에서는 Posi/Nega 동작 못하도록
        cmbBox.ItemIndex := 0;
      end;
    end;
    cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_DoorModeType' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorControlTime' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    spinEdit := TravelSpinEditItem(gb_DoorExtensionInfo,'SpinEdit_OpenMoni' , aDoorNo);
    if spinEdit <> nil then spinEdit.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_AlarmLongOpen' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_SendDoorStatus' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_UseSch' , aDoorNo);
    if cmbBox <> nil then
    begin
      cmbBox.Enabled := aUsed;
      if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ScheduleUse then cmbBox.Enabled := False; //스케줄 기능이 없는 장비 이면
    end;
    cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_ControlFire' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_LockType' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DsOpenState' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_RemoteDoorOpen' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorDscheckTime' , aDoorNo);
    if cmbBox <> nil then cmbBox.Enabled := aUsed;
    cmbBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_ArmDSCheck' , aDoorNo);
    if cmbBox <> nil then
    begin
      cmbBox.Enabled := aUsed;
      if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(aDoorNo) then cmbBox.Enabled := False;
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT812 then cmbBox.Enabled := False;
      if (TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorLockType(aDoorNo) <> 2) and
         (TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorLockType(aDoorNo) <> 3) then cmbBox.Enabled := False;  //데드볼트 락이 아니면 False
    end;
  end;
  //상태조회쪽 락타입부분
  cmbBox := TravelComboBoxItem(gb_LoackState,'ComboBox_LockType2',aDoorNo);
  if cmbBox <> nil then cmbBox.Enabled := aUsed;
end;

procedure TfmCurrentDeviceSetting.ReaderFormUsed(aReaderNo: integer;
  aUsed: Boolean);
var
  cmbBox : TComboBox;
begin
  cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse' , aReaderNo);
  if cmbBox <> nil then cmbBox.Enabled := aUsed;
  cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor' , aReaderNo);
  if cmbBox <> nil then cmbBox.Enabled := aUsed;
  cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoorLocate' , aReaderNo);
  if cmbBox <> nil then cmbBox.Enabled := aUsed;
  cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderBuildingLocate' , aReaderNo);
  if cmbBox <> nil then cmbBox.Enabled := aUsed;

end;

procedure TfmCurrentDeviceSetting.PortFormUsed(aPortNo: integer;
  aUsed: Boolean);
var
  cmbBox : TComboBox;
begin
  cmbBox := TravelComboBoxItem(gb_Port,'cmb_WatchType' , aPortNo);
  if cmbBox <> nil then cmbBox.Enabled := aUsed;
  cmbBox := TravelComboBoxItem(gb_Port,'cmb_WatchDelay' , aPortNo);
  if cmbBox <> nil then cmbBox.Enabled := aUsed;
  cmbBox := TravelComboBoxItem(gb_Port,'cmb_recorver' , aPortNo);
  if cmbBox <> nil then cmbBox.Enabled := aUsed;

end;

procedure TfmCurrentDeviceSetting.CurrentCDMAUseChange(aEcuID: string;
  aUsed: Boolean);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  //gb_CDMA.Visible := aUsed;
end;

procedure TfmCurrentDeviceSetting.CardReaderTypeLoad(
  aCardReaderType: integer);
var
  i : integer;
  cmbBox : TComboBox;
begin
  cb_CardType.Clear;
  for i := 1 to 8 do
  begin
    cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderType' , i);
    if cmbBox <> nil then cmbBox.Clear;
  end;
  cb_CardType.Items.Add('일반리더(CRO811)/유니온(SG5000P)');
  for i := 1 to 8 do
  begin
    cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderType' , i);
    if cmbBox <> nil then cmbBox.Items.Add('일반리더(CRO811)/유니온(SG5000P)');
  end;
  cb_CardType.Items.Add('성현지문리더(CRO801)');
  for i := 1 to 8 do
  begin
    cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderType' , i);
    if cmbBox <> nil then cmbBox.Items.Add('성현지문리더(CRO801)');
  end;

  if aCardReaderType < 1 then Exit;
  
  cb_CardType.Items.Add('Wiegand 카드리더(26)');
  for i := 1 to 8 do
  begin
    cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderType' , i);
    if cmbBox <> nil then cmbBox.Items.Add('Wiegand 카드리더(26)');
  end;
  cb_CardType.Items.Add('Wiegand 카드리더(34)');
  for i := 1 to 8 do
  begin
    cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderType' , i);
    if cmbBox <> nil then cmbBox.Items.Add('Wiegand 카드리더(34)');
  end;

end;

procedure TfmCurrentDeviceSetting.CardReaderAllTypeSetting(aEcuID: string;
  aCardType: integer;aColor:TColor);
var
  i : integer;
  cmbBox : TComboBox;
begin
  if aColor = clWhite then dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'CARDREADER_TYPE',inttostr(aCardType));
  if aColor = clWhite then dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'CARDREADER_TYPE','U');
  for i := 1 to 8 do
  begin
    cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderType' , i);
    if cmbBox <> nil then
    begin
      cmbBox.ItemIndex := aCardType;
      cmbBox.Color := aColor;
    end;
    if aColor = clWhite then dmDataBase.UpdateTB_READERSETTING_FieldName(G_stSelectEcuID,'0',inttostr(i),'CARDREADER_TYPE',inttostr(aCardType));
    if aColor = clWhite then dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(G_stSelectEcuID,'0',inttostr(i),'CARDREADER_TYPE','U');
  end;
  cb_CardType.ItemIndex := aCardType;
  cb_CardType.Color := aColor;

end;

procedure TfmCurrentDeviceSetting.CardReaderNumTypeSetting(aECUID,
  aReaderNo, aCardReaderType: string;aColor:TColor);
var
  cmbBox : TComboBox;
begin
  if G_stSelectEcuID <> aEcuID then Exit;

  cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderType' , strtoint(aReaderNo));
  if cmbBox <> nil then
  begin
    if isDigit(aCardReaderType) then
    begin
       cmbBox.ItemIndex := strtoint(aCardReaderType);
       cmbBox.Color := aColor;
    end;
  end;

end;

function TfmCurrentDeviceSetting.GetReaderNumType: string;
var
  i : integer;
  cmbBox : TComboBox;
begin
  result := '';
  for i := 1 to 8 do
  begin
    cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderType' ,i);
    if cmbBox <> nil then
    begin
      if cmbBox.ItemIndex < 0 then cmbBox.ItemIndex := 0;
      result := result + inttostr(cmbBox.ItemIndex);
    end else
    begin
      result := result + '0';
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.FormActivate(Sender: TObject);
begin
  inherited;
  if L_bFormActive then Exit;
  L_bFormActive := True;
  ActiveTimer.Enabled := True;
  GridMergeInitialize;
  GroupMAc.Visible := G_bMacView;
  self.FindSubForm('Main').FindCommand('SOCKET').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('SOCKET').Execute;
  GridMergeInitialize;
end;

procedure TfmCurrentDeviceSetting.TreeView_DeviceDblClick(Sender: TObject);
var
  stCaption : string;
  nIndex : integer;
begin
  TreeView_Device.PopupMenu := nil;
  if TreeView_Device.Selected = nil then Exit;
  stCaption := TreeView_Device.Selected.Text;

  nIndex := DeviceList.IndexOf(copy(stCaption,1,2));
  if nIndex < 0 then
  begin
    TreeView_Device.Selected := TreeView_Device.Items[1];
    stCaption := TreeView_Device.Selected.Text;
    nIndex := DeviceList.IndexOf(copy(stCaption,1,2));
    //Exit;
  end;

  if Pos('방범',stCaption) > 0 then ArmStateCheck(copy(stCaption,1,2),0)
  else if Pos('출입문',stCaption) > 0 then
  begin
    stCaption := StringReplace(stCaption,':출입문','',[rfReplaceAll]);
    DoorStateCheck(copy(stCaption,1,2),copy(stCaption,3,1));
  end
  else if Pos('카드리더',stCaption) > 0 then mn_ReaderVersionClick(self);

end;

function TfmCurrentDeviceSetting.ArmStateCheck(aEcuID: string;aArmArea:integer): Boolean;
begin
  result := dmSocket.AlarmState_Check(aEcuID,aArmArea);
end;

function TfmCurrentDeviceSetting.DoorStateCheck(aEcuID,
  aDoorNo: string): Boolean;
begin
  result := dmSocket.DoorState_Check(aEcuID,aDoorNo);
end;

procedure TfmCurrentDeviceSetting.ActiveTimerTimer(Sender: TObject);
var
  i,j : integer;
begin
  inherited;
  ActiveTimer.Enabled := False;

  //EcuStatusCheck; //통신상태체크

  TreeView_Device.Items[1].Selected:=True;
  TreeView_DeviceClick(self);

  for i := 0 to DeviceList.Count - 1 do
  begin
    if TCurrentDeviceState(deviceList.Objects[i]).Connected then
    begin
      if TCurrentDeviceState(deviceList.Objects[i]).AlarmMode = cmNothing then
      begin
        if i = 0 then dmSocket.AlarmState_Check(deviceList.Strings[i],0,False,True);  // STX와 같은 곳에서 엄청 많은 방범상태 체크 발생 으로 메인에서만 한번만 체크
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
  CurrentDeviceView;

end;

function TfmCurrentDeviceSetting.GetWatchTypeCode(aPortNo,
  aWatchType: integer): string;
begin
  result := 'S' + inttostr(aPortNo);
  if aWatchType > ZoneStatusCodeList.Count - 1 then exit;
  if ZoneStatusCodeList.Strings[aWatchType] <> '' then result := ZoneStatusCodeList.Strings[aWatchType];

end;

procedure TfmCurrentDeviceSetting.btn_DeviceCopyClick(Sender: TObject);
var
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then Exit;
  fmCopy := TfmCopy.Create(Self);
  fmCopy.L_stCaption := pg_DeviceSetting.ActivePage.Caption;
  fmCopy.L_stDeviceType := TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType;
  fmCopy.L_bArmAreaSkill := TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill;
  fmCopy.L_bZoneExtensionSkill := TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill;
  fmCopy.ShowModal;
  fmCopy.Free;

end;

procedure TfmCurrentDeviceSetting.TableToFormColorSetting(aEcuID: string);
var
  i,j : integer;
  nTemp : integer;
  cmb_Box : TComboBox;
  spinEdit : TSpinEdit;
  oEdit : TEdit;
  static_Text : TStaticText;
  oGroupBox : TGroupBox;
  stWatchType : string;
  stParentWatchType : string;
  stDetailWatchType : string;
  nParentIndex : integer;
begin
  with dmDataBase.TB_DEVICERCV do
  begin
    if FindKey([aEcuID]) then
    begin
      if aEcuID = '00' then
      begin
        if FindField('DEVICEUSE').AsString = 'Y' then lvECU.Color := clYellow
        else lvECU.Color := clWhite;
        if FindField('DEVICE_ID').AsString = 'Y' then ed_mcid.Color := clYellow
        else ed_mcid.Color := clWhite;
        if FindField('SYSTEM_ID').AsString = 'Y' then Edit_LinkusID.Color := clYellow
        else Edit_LinkusID.Color := clWhite;
        if FindField('Linkus_Tel').AsString = 'Y' then Edit_LinkusTel.Color := clYellow
        else Edit_LinkusTel.Color := clWhite;
        if FindField('Linkus_Tel2').AsString = 'Y' then Edit_LinkusTel2.Color := clYellow
        else Edit_LinkusTel2.Color := clWhite;
        if FindField('Ring_Cnt').AsString = 'Y' then Spinner_Ring.Color := clYellow
        else Spinner_Ring.Color := clWhite;
        if FindField('Ring_CancelCnt').AsString = 'Y' then Spinner_cancelRing.Color := clYellow
        else Spinner_cancelRing.Color := clWhite;
        if FindField('MCU_IP').AsString = 'Y' then Edit_IP.Color := clYellow
        else Edit_IP.Color := clWhite;
        if FindField('MCU_SUBNET').AsString = 'Y' then Edit_subnet.Color := clYellow
        else Edit_subnet.Color := clWhite;
        if FindField('MCU_GATE').AsString = 'Y' then edit_Gateway.Color := clYellow
        else edit_Gateway.Color := clWhite;
        if FindField('MCU_PORT').AsString = 'Y' then edit_port.Color := clYellow
        else edit_port.Color := clWhite;
        if FindField('Server_IP').AsString = 'Y' then ed_server.Color := clYellow
        else ed_server.Color := clWhite;
        if FindField('MCU_SERVERPORT').AsString = 'Y' then ed_ServerPort.Color := clYellow
        else ed_ServerPort.Color := clWhite;
        if FindField('MCU_NETWORKMODE').AsString = 'Y' then rg_Mode.Color := clYellow
        else rg_Mode.Color := clWhite;
        if FindField('DHCP').asstring = 'Y' then chk_DHCP.Color := clYellow
        else chk_DHCP.Color := clWhite;
        if FindField('CDMAUSE').AsString = 'Y' then rg_CdmaUse.Color := clYellow
        else rg_CdmaUse.Color := clWhite;
        if FindField('CDMAMIN').AsString = 'Y' then ed_cdmaMin.Color := clYellow
        else ed_cdmaMin.Color := clWhite;
        if FindField('CDMAMUX').AsString = 'Y' then ed_cdmaMux.Color := clYellow
        else ed_cdmaMux.Color := clWhite;
        if FindField('CDMAIP').AsString = 'Y' then ed_cdmaIP.Color := clYellow
        else ed_cdmaIP.Color := clWhite;
        if FindField('CDMAPORT').AsString = 'Y' then ed_cdmaPort.Color := clYellow
        else ed_cdmaPort.Color := clWhite;
        if FindField('CDMACHECKTIME').AsString = 'Y' then  ed_cdmachktime.Color := clYellow
        else ed_cdmachktime.Color := clWhite;
        if FindField('CDMARSSI').AsString = 'Y' then ed_cdmarssi.Color := clYellow
        else ed_cdmarssi.Color := clWhite;
        if FindField('DVRUSE').AsString = 'Y' then rg_dvruse.Color := clYellow
        else rg_dvruse.Color := clWhite;
        if FindField('DVRIP').AsString = 'Y' then ed_dvrip.Color := clYellow
        else ed_dvrip.Color := clWhite;
        if FindField('DVRPORT').AsString = 'Y' then ed_dvrport.Color := clYellow
        else ed_dvrport.Color := clWhite;
        if FindField('ArmExtensionGubun').AsString = 'Y' then cmb_ArmExtensionSelect.Color := clYellow
        else cmb_ArmExtensionSelect.Color := clWhite;
        if FindField('ArmExtensionData').AsString = 'Y' then Group_MainToLocalDevice.Color := clYellow
        else Group_MainToLocalDevice.Color := clBtnFace;
      end;
      //공통부분
      if FindField('DOOR2_RELAY').AsString = 'Y' then cmb_Relay2Type.Color := clYellow
      else cmb_Relay2Type.Color := clWhite;
      if FindField('WATCH_POWER').AsString = 'Y' then ComboBox_WatchPowerOff.Color := clYellow
      else ComboBox_WatchPowerOff.Color := clWhite;
      if FindField('OUT_DELAY').AsString = 'Y' then SpinEdit_OutDelay.Color := clYellow
      else SpinEdit_OutDelay.Color := clWhite;
      if FindField('IN_DELAY').AsString = 'Y' then SpinEdit_InDelay.Color := clYellow
      else SpinEdit_InDelay.Color := clWhite;
      if FindField('JaejungDelayUse').AsString = 'Y' then cmb_JaejungDelayUse.Color := clYellow
      else cmb_JaejungDelayUse.Color := clWhite;
      if FindField('ArmRelay').AsString = 'Y' then cmb_ArmRelay.Color := clYellow
      else cmb_ArmRelay.Color := clWhite;
      if FindField('LOCATE').AsString = 'Y' then Edit_Locate.Color := clYellow
      else Edit_Locate.Color := clWhite;
      if FindField('CARDREADER_TYPE').AsString = 'Y' then cb_CardType.Color := clYellow
      else cb_CardType.Color := clWhite;

      if FindField('ZONE_LAMPONOFF').AsString = 'Y' then cmb_alartLamp.Color := clYellow
      else cmb_alartLamp.Color := clWhite;
      if FindField('ZONE_SIRENONOFF').AsString = 'Y' then cmb_alartSiren.Color := clYellow
      else cmb_alartSiren.Color := clWhite;
      if FindField('ZONE_LAMPONTIME').AsString = 'Y' then ed_alertLampTime.Color := clYellow
      else ed_alertLampTime.Color := clWhite;
      if FindField('ZONE_SIRENONTIME').AsString = 'Y' then ed_alertSirenTime.Color := clYellow
      else ed_alertSirenTime.Color := clWhite;
      Try
        for i := 0 to 9 do
        begin
          if FindField('CARDREADERTEL' + inttostr(i)).AsString = 'Y' then TravelEditItem(gb_cardReaderTel,'ed_cardreaderTel',i).Color := clYellow
          else TravelEditItem(gb_cardReaderTel,'ed_cardreaderTel',i).Color := clWhite;
        end;
      Except
        Exit;
      End;
      if FindField('ZONEEXTENSIONUSE1').AsString = 'Y' then cmb_ZoneExtensionUse1.Color := clYellow
      else cmb_ZoneExtensionUse1.Color := clWhite;
      if FindField('ZONEEXTENSIONUSE2').AsString = 'Y' then cmb_ZoneExtensionUse2.Color := clYellow
      else cmb_ZoneExtensionUse2.Color := clWhite;
      if FindField('ZONEEXTENSIONUSE3').AsString = 'Y' then cmb_ZoneExtensionUse3.Color := clYellow
      else cmb_ZoneExtensionUse3.Color := clWhite;
      if FindField('ZONEEXTENSIONUSE4').AsString = 'Y' then cmb_ZoneExtensionUse4.Color := clYellow
      else cmb_ZoneExtensionUse4.Color := clWhite;
      if FindField('ZONEEXTENSIONUSE5').AsString = 'Y' then cmb_ZoneExtensionUse5.Color := clYellow
      else cmb_ZoneExtensionUse5.Color := clWhite;
      if FindField('ZONEEXTENSIONUSE6').AsString = 'Y' then cmb_ZoneExtensionUse6.Color := clYellow
      else cmb_ZoneExtensionUse6.Color := clWhite;
      if FindField('ZONEEXTENSIONUSE7').AsString = 'Y' then cmb_ZoneExtensionUse7.Color := clYellow
      else cmb_ZoneExtensionUse7.Color := clWhite;
      if FindField('ZONEEXTENSIONUSE8').AsString = 'Y' then cmb_ZoneExtensionUse8.Color := clYellow
      else cmb_ZoneExtensionUse8.Color := clWhite;

      for i := 1 to FIXMAXZONEEXTENDNO do
      begin
        cmb_Box := TravelComboBoxItem(gb_SystemZoneExtension,'cmb_SystemZoneExtensionUse',i);
        if cmb_Box <> nil then
        begin
          if FindField('ZONEEXTENSIONUSE' + inttostr(i)).AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
      end;

      if FindField('PoliceTel1').AsString = 'Y' then
      begin
        ed_TelMonitorSoundNo1.Color := clYellow;
        ed_TelMonitorStartDelay1.Color := clYellow;
        ed_TelMonitorsendTime1.Color := clYellow;
        ed_TelMonitorsendCount1.Color := clYellow;
        cmb_TelMonitorsSpeaker1.Color := clYellow;
        cmb_TelMonitorCountTime1.Color := clYellow;
        cmb_TelMonitorDTMFStart1.Color := clYellow;
        cmb_TelMonitorDTMFEnd1.Color := clYellow;
        ed_TelMonitorNum1.Color := clYellow;
      end else
      begin
        ed_TelMonitorSoundNo1.Color := clWhite;
        ed_TelMonitorStartDelay1.Color := clWhite;
        ed_TelMonitorsendTime1.Color := clWhite;
        ed_TelMonitorsendCount1.Color := clWhite;
        cmb_TelMonitorsSpeaker1.Color := clWhite;
        cmb_TelMonitorCountTime1.Color := clWhite;
        cmb_TelMonitorDTMFStart1.Color := clWhite;
        cmb_TelMonitorDTMFEnd1.Color := clWhite;
        ed_TelMonitorNum1.Color := clWhite;
      end;
      if FindField('PoliceTel2').AsString = 'Y' then
      begin
        ed_TelMonitorSoundNo2.Color := clYellow;
        ed_TelMonitorStartDelay2.Color := clYellow;
        ed_TelMonitorsendTime2.Color := clYellow;
        ed_TelMonitorsendCount2.Color := clYellow;
        cmb_TelMonitorsSpeaker2.Color := clYellow;
        cmb_TelMonitorCountTime2.Color := clYellow;
        cmb_TelMonitorDTMFStart2.Color := clYellow;
        cmb_TelMonitorDTMFEnd2.Color := clYellow;
        ed_TelMonitorNum2.Color := clYellow;
      end else
      begin
        ed_TelMonitorSoundNo2.Color := clWhite;
        ed_TelMonitorStartDelay2.Color := clWhite;
        ed_TelMonitorsendTime2.Color := clWhite;
        ed_TelMonitorsendCount2.Color := clWhite;
        cmb_TelMonitorsSpeaker2.Color := clWhite;
        cmb_TelMonitorCountTime2.Color := clWhite;
        cmb_TelMonitorDTMFStart2.Color := clWhite;
        cmb_TelMonitorDTMFEnd2.Color := clWhite;
        ed_TelMonitorNum2.Color := clWhite;
      end;
      if FindField('JAVARASTOPTIME').AsString = 'Y' then
      begin
        ed_OpenStop.Color := clYellow;
        ed_CloseStop.Color := clYellow;
        ed_StopDelay.Color := clYellow;
      end else
      begin
        ed_OpenStop.Color := clWhite;
        ed_CloseStop.Color := clWhite;
        ed_StopDelay.Color := clWhite;
      end;
      if FindField('DOOR_TIMECODEUSE').AsString = 'Y' then gb_TimeCodeUse.Color := clYellow
      else gb_TimeCodeUse.Color := clBtnFace;
      if FindField('TIMECODE01').AsString = 'Y' then gb_TimeCodeGroup.Color := clYellow
      else gb_TimeCodeGroup.Color := clBtnFace;
    end;
  end;
  with dmDataBase.TB_DOORSettingInfoRCV do
  begin
    for i := 1 to FIXMAXDOORNO do
    begin
      if FindKey([aEcuID,'0',inttostr(i)]) then
      begin
        if aEcuID = '00' then
        begin
        end;
        cmb_Box := TravelComboBoxItem(gb_SystemInfo,'ComboBox_DoorType',i);
        if cmb_Box <> nil then
        begin
          if FindField('DOOR_TYPE').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_CardModeType',i)
        else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_CardModeType',i);
        if cmb_Box <> nil then
        begin
          if FindField('CARD_TYPE').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_DoorModeType',i)
        else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_DoorModeType',i);
        if cmb_Box <> nil then
        begin
          if FindField('DOORMODE_TYPE').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorControlTime',i)
        else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorControlTime',i);
        if cmb_Box <> nil then
        begin
          if FindField('DOOR_OPEN').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        if i < 3 then spinEdit := TravelSpinEditItem(gb_DoorInfo,'SpinEdit_OpenMoni',i)
        else spinEdit := TravelSpinEditItem(gb_DoorExtensionInfo,'SpinEdit_OpenMoni',i);
        if spinEdit <> nil then
        begin
          if FindField('OPEN_MONI').AsString = 'Y' then spinEdit.Color := clYellow
          else spinEdit.Color := clWhite;
        end;
        if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_UseSch',i)
        else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_UseSch',i);
        if cmb_Box <> nil then
        begin
          if FindField('USE_SCH').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_SendDoorStatus',i)
        else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_SendDoorStatus',i);
        if cmb_Box <> nil then
        begin
          if FindField('DOOR_STATUS').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_AlarmLongOpen',i)
        else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_AlarmLongOpen',i);
        if cmb_Box <> nil then
        begin
          if FindField('ALARM_LONG').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_ControlFire',i)
        else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_ControlFire',i);
        if cmb_Box <> nil then
        begin
          if FindField('CONTROL_FIRE').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType',i)
        else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_LockType',i);
        if cmb_Box <> nil then
        begin
          if FindField('LOCK_TYPE').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        //상태조회쪽 락타입
        cmb_Box := TravelComboBoxItem(gb_LoackState,'ComboBox_LockType2',i);
        if cmb_Box <> nil then
        begin
          if FindField('LOCK_TYPE').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;

        if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_DsOpenState',i)
        else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DsOpenState',i);
        if cmb_Box <> nil then
        begin
          if FindField('DOOR_DSOPENSTATUS').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_RemoteDoorOpen',i)
        else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_RemoteDoorOpen',i);
        if cmb_Box <> nil then
        begin
          if FindField('DOOR_REMOTECANCEL').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorDscheckTime',i)
        else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorDscheckTime',i);
        if cmb_Box <> nil then
        begin
          if FindField('DSCHECKUSE').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_ArmDSCheck',i)
        else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_ArmDSCheck',i);
        if cmb_Box <> nil then
        begin
          if FindField('ArmDSCheck').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        cmb_Box := TravelComboBoxItem(gb_DoorAlarmArea,'cmbDoorAlarmArea',i);
        if cmb_Box <> nil then
        begin
          if FindField('DOORARMAREA').AsString = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;

      end;
    end;
  end;
  with dmDataBase.TB_READERSETTINGRCV do
  begin
    for i := 1 to FIXMAXREADERNO do
    begin
      if FindKey([aEcuID,'0',inttostr(i)]) then
      begin
        cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',i);
        if cmb_Box <> nil then
        begin
          if FindField('READER_USE').Asstring = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor',i);
        if cmb_Box <> nil then
        begin
          if FindField('READER_DOOR').Asstring = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoorLocate',i);
        if cmb_Box <> nil then
        begin
          if FindField('READER_NAME').Asstring = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderBuildingLocate',i);
        if cmb_Box <> nil then
        begin
          if FindField('READER_BUILDING').Asstring = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderType',i);
        if cmb_Box <> nil then
        begin
          if FindField('CARDREADER_TYPE').Asstring = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',i);
        if cmb_Box <> nil then
        begin
          if FindField('READERARMAREA').Asstring = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderSound',i);
        if cmb_Box <> nil then
        begin
          if FindField('READER_SOUND').Asstring = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
        cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ExitSound',i);
        if cmb_Box <> nil then
        begin
          if FindField('EXIT_SOUND').Asstring = 'Y' then cmb_Box.Color := clYellow
          else cmb_Box.Color := clWhite;
        end;
      end;
    end;
  end;
  with dmDataBase.TB_ZONESETTINGRCV do
  begin
    for i := 0 to FIXMAXZONEEXTENDNO do
    begin
      for j := 1 to FIXMAXZONENO do
      begin
        if FindKey([aEcuID,inttostr(i),inttostr(j)]) then
        begin
          cmb_Box := GetPortComboBox(i,j,'cmb_WatchType');
          if cmb_Box <> nil then
          begin
            if FindField('PORT_TYPE').Asstring = 'Y' then cmb_Box.Color := clYellow
            else cmb_Box.Color := clWhite;
          end;
          cmb_Box := GetPortComboBox(i,j,'cmb_WatchDelay');
          if cmb_Box <> nil then
          begin
            if FindField('PORT_DELAY').Asstring = 'Y' then cmb_Box.Color := clYellow
            else cmb_Box.Color := clWhite;
          end;
          cmb_Box := GetPortComboBox(i,j,'cmb_recorver');
          if cmb_Box <> nil then
          begin
            if FindField('PORT_RECORVER').Asstring = 'Y' then cmb_Box.Color := clYellow
            else cmb_Box.Color := clWhite;
          end;
          cmb_Box := GetPortComboBox(i,j,'cmb_PortAlarmArea');
          if cmb_Box <> nil then
          begin
            if FindField('ZONEARMAREA').Asstring = 'Y' then cmb_Box.Color := clYellow
            else cmb_Box.Color := clWhite;
          end;
          cmb_Box := GetPortComboBox(i,j,'cmb_ZonUse');
          if cmb_Box <> nil then
          begin
            if FindField('PORT_ZONEUSE').Asstring = 'Y' then cmb_Box.Color := clYellow
            else cmb_Box.Color := clWhite;
          end;
        end;
      end;
    end;
  end;

  st_Time.Color := clWhite;
  for i := 1 to 8 do
  begin
    static_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',i);
    if static_Text <> nil then
    begin
      static_Text.Color := clWhite;
    end;
  end;
  st_CtrDoorNum.Color := clWhite;
  st_CtrCardMode.Color := clWhite;
  st_CtrDoorMode.Color := clWhite;
  st_CtrDoorState.Color := clWhite;
  st_FireResult.Color := clWhite;
  st_Time1.Color := clWhite;
  st_MemoryClearResult.Color := clWhite;
  st_DeviceResetResult.Color := clWhite;
  st_AlarmState.Color := clWhite;
  st_ArmArea3.Color := clWhite;
  st_AlarmState3.Color := clWhite;
  st_LineShortCheck.Color := clWhite;

  for i := 1 to FIXMAXZONEEXTENDNO do //존확장기 갯수만큼
  begin
    case i of
      1 : oGroupBox := gb_ZoneExtensionState1;
      2 : oGroupBox := gb_ZoneExtensionState2;
      3 : oGroupBox := gb_ZoneExtensionState3;
      4 : oGroupBox := gb_ZoneExtensionState4;
      5 : oGroupBox := gb_ZoneExtensionState5;
      6 : oGroupBox := gb_ZoneExtensionState6;
      7 : oGroupBox := gb_ZoneExtensionState7;
      8 : oGroupBox := gb_ZoneExtensionState8;
      else oGroupBox := nil;
    end;
    if oGroupBox = nil then continue;
    for j := 1 to FIXMAXZONENO do
    begin
      static_Text := TravelTStaticTextItem(oGroupBox,'st_ZoneState' + inttostr(i),j);
      if static_Text <> nil then
      begin
        static_Text.Color := clWhite;
      end;
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.PageControl1Change(Sender: TObject);
begin
  inherited;
  if PageControl1.ActivePage = tab_refresh then
  begin
    CurrentDeviceView(True);
    PageControl1.ActivePage := tbDEVICE;
  end;
end;

procedure TfmCurrentDeviceSetting.cmb_Relay2TypeChange(Sender: TObject);
var
  bDoor2Type : Boolean;
begin
  bDoor2Type := True;
  if cmb_Relay2Type.ItemIndex = 0 then  bDoor2Type := False;

  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'DOOR2_RELAY',inttostr(cmb_Relay2Type.itemIndex));

    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'DOOR2_RELAY','U');
    L_bSettingChanged := True;
  end;
  //FormDoorLock2TypeEnable(bDoor2Type);
  FormSystemDoorUsePossibilityEnable('2',bDoor2Type);
end;

function TfmCurrentDeviceSetting.SearchRelay2TypeCheck(
  aEcuID: string;aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'DOOR2_RELAY') = 'Y' then Exit;
  end;
  cmb_Relay2Type.Color := clWhite;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := 'Door2 사용구분 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.SearchRelay2TypeCheck(aEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.Relay2TypeCheckData(aEcuID, aCmd, aRelay2Type: string);
var
  bDoor2Type : Boolean;
  i : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if isDigit(aRelay2Type[3]) then
  begin
    cmb_Relay2Type.ItemIndex := strtoint(aRelay2Type[3]);
    cmb_Relay2Type.Color := clYellow;
    if cmb_Relay2Type.ItemIndex = 0 then bDoor2Type := False
    else bDoor2Type := True;
//    if aRelay2Type[3] = '0' then FormDoorLock2TypeEnable(False) //이벤트로 처리 됨
//    else FormDoorLock2TypeEnable(True);
    FormSystemDoorUsePossibilityEnable('2',bDoor2Type);
    for i := 6 to 8 do
    begin
      FormZoneUseEnable(0,i,Not bDoor2Type);
    end;
  end;

end;

function TfmCurrentDeviceSetting.Relay2Type_Registration(aEcuID: string):Boolean;
var
  i : integer;
  stRegistData : string;
begin
  stRegistData := FillZeroNumber(0,9);
  stRegistData[3] := inttostr(cmb_Relay2Type.ItemIndex)[1];
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := 'Door2사용구분 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistRelay2Type(aEcuID,stRegistData);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

procedure TfmCurrentDeviceSetting.se_crCallTimeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'CARDREADER_CALLTIME' ,inttostr(se_crCallTime.IntValue));
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'CARDREADER_CALLTIME','U');
  end;

end;

function TfmCurrentDeviceSetting.CardReaderCallTimeSearch(
  aDirect: Boolean): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;
  Try
    se_crCallTime.Enabled := False;
    if Not aDirect then
    begin
      if dmDataBase.GetTB_DEVICERCV_Value(G_stSelectEcuID,'CARDREADER_CALLTIME') = 'Y' then Exit;
    end;

    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '카드리더 통화시간 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.CardReaderCallTimeSearch(G_stSelectEcuID,FillZeroNumber(se_crCallTime.IntValue,4));
      if result then Break;
    end;

  Finally
    if Not G_bApplicationTerminate then se_crCallTime.Enabled := True;
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

procedure TfmCurrentDeviceSetting.CARDREADERCallTimData(aECUID,
  aCallTime: string);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if Not isDigit(aCallTime) then Exit;
  se_crCallTime.IntValue := strtoint(aCallTime);
  se_crCallTime.Color := clYellow;

end;

procedure TfmCurrentDeviceSetting.CardReaderCallTime_Registration;
var
  bResult : Boolean;
  i : integer;
begin

  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;

  Try
    se_crCallTime.Enabled := False;
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '카드리더 통화시간 등록중입니다.';
      ProgressBar1.Position := i + 1;
      bResult := dmSocket.CardReaderCallTime_Registration(G_stSelectEcuID,FillZeroNumber(se_crCallTime.IntValue,4));
      if bResult then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
    if Not G_bApplicationTerminate then se_crCallTime.Enabled := True;
  End;

end;

procedure TfmCurrentDeviceSetting.cmb_WatchType1Enter(Sender: TObject);
var
  nPortNo : integer;
  cmb_Box : TComboBox;
  nWatchType : integer;
  stWatchTypeCode : string;
begin
  if Not isDigit(TComboBox(Sender).Hint) then Exit;

  nPortNo := strtoint(TComboBox(Sender).Hint);

  cmb_Box := GetPortComboBox(0,nPortNo,'cmb_WatchType');
  if cmb_Box <> nil then L_nOldWhatchType := cmb_Box.ItemIndex;

end;

procedure TfmCurrentDeviceSetting.ArmExtensionChange(aEcuID: string;
  aValue: Boolean);
var
  nIndex : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> '00' then Exit;
  if aEcuID <> '00' then Exit;
  TabArmExtension.TabVisible := aValue;
  nIndex := DeviceList.IndexOf(aEcuID);
  if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse then
     TabArmExtension.TabVisible := TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmExtension;  //경계부가기능

end;

procedure TfmCurrentDeviceSetting.Ecu_GroupCreate(aGroup: TGroupBox;
  aCount: integer);
var
  i : integer;
  nIndex : integer;
begin
  GroupBoxClear(aGroup);
  GroupBoxFree(aGroup);

  for I:= 1 to aCount do
  begin
    GroupBoxItemSetting(aGroup,I-1,FillZeroNumber(i,2));
  end;

end;

procedure TfmCurrentDeviceSetting.MaxECUCountChange(aEcuID,
  aValue: string);
begin
  if aEcuID <> '00' then Exit;
  if Not isDigit(aValue) then Exit;
  MaxEcuCount := strtoint(aValue);
end;

procedure TfmCurrentDeviceSetting.SetMaxEcuCount(const Value: integer);
begin
  if FMaxEcuCount = Value then Exit;
  FMaxEcuCount := Value;
  seDeviceNo.Max := Value;
  Ecu_GroupCreate(Group_MainToLocalDevice,Value);
end;

procedure TfmCurrentDeviceSetting.GroupBoxClear(aGroup: TGroupBox);
var
  i : integer;
  oCheckBox : TCheckBox;
begin
  L_bGroupBoxClear := True;
  for i := 0 to 100 do
  begin
    oCheckBox := TravelCheckBoxTagItem(aGroup,i);
    if oCheckBox <> nil then
    begin
      oCheckBox.Checked := False;
    end;
  end;
  L_bGroupBoxClear := False;
end;

procedure TfmCurrentDeviceSetting.GroupBoxItemSetting(aGroup: TGroupBox;
  aIndex: integer; aCaption: string);
var
  oCheckBox : TCheckBox;
begin
  oCheckBox := TravelCheckBoxTagItem(aGroup,aIndex);
  if oCheckBox <> nil then
  begin
    oCheckBox.Visible := True;
    oCheckBox.Caption := aCaption;
  end;

end;

procedure TfmCurrentDeviceSetting.chkMainToLocal1Click(Sender: TObject);
var
  i : integer;
  oCheckBox : TCheckBox;
begin
  inherited;
  if Sender <> chkAllMainToLocal then
  begin
    GroupCheckItem(Group_MainToLocalDevice,TCheckBox(Sender).Tag,TCheckBox(Sender).Checked);
  end else
  begin
    for i:=0 to 6 do
    begin
      oCheckBox := TravelCheckBoxTagItem(Group_MainToLocalAll,i);
      if oCheckBox <> nil then
      begin
        oCheckBox.Checked := TCheckBox(Sender).Checked;
      end;
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.GroupCheckItem(aGroup: TGroupBox;
  aGroupIndex: integer; aChecked: Boolean);
var
  i : integer;
  nGroupIndexStart,nGroupIndexEnd : integer;
  oCheckBox : TCheckBox;
begin
  nGroupIndexStart := aGroupIndex * 10;
  nGroupIndexEnd := nGroupIndexStart + 9;
  for i := nGroupIndexStart to nGroupIndexEnd do
  begin
    oCheckBox := TravelCheckBoxTagItem(aGroup,i);
    if oCheckBox <> nil then
    begin
      oCheckBox.Checked := aChecked;
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.Form_ArmExtension_Initialize;
begin
  Form_MainToLocalArm_ColorInitialize(clBtnFace);
end;


procedure TfmCurrentDeviceSetting.Form_MainToLocalArm_ColorInitialize(aColor:TColor);
//var
//  i : integer;
//  oCheckBox : TCheckBox;
begin
  if aColor = clBtnFace then cmb_ArmExtensionSelect.Color := clWhite
  else cmb_ArmExtensionSelect.Color := aColor;
  Group_MainToLocalDevice.Color := aColor;
  {
  for i:=0 to 100 do
  begin
    oCheckBox := TravelCheckBoxTagItem(Group_MainToLocalDevice,i);
    if oCheckBox <> nil then
    begin
      oCheckBox.Color := aColor;
    end;
  end;  }
end;

procedure TfmCurrentDeviceSetting.cmb_ArmExtensionSelectChange(
  Sender: TObject);
begin
  inherited;
  FormArmExtensionSetting(cmb_ArmExtensionSelect.ItemIndex);
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'ArmExtensionGubun',inttostr(cmb_ArmExtensionSelect.ItemIndex));

    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'ArmExtensionGubun','U');
    L_bSettingChanged := True;
  end;
end;

procedure TfmCurrentDeviceSetting.ArmExtension_Registration;
var
  stSendData : string;
  stClearData : string;
  i : integer;
begin
  stSendData := '';
  stClearData := '';
  for i := 0 to 63 do
  begin
    stSendData := stSendData + '0';
    stClearData := stClearData + '0';
  end;
  GetArmExtentionData(stSendData);
  ArmExtensionEnable(False);
  dmSocket.MainToLocalArmDevice := stClearData;  //소켓의 사용 유무를 초기화시키자
  dmSocket.MainFromLocalArmDevice := stClearData;
  if cmb_ArmExtensionSelect.ItemIndex = 0 then
  begin
    RegistMainToLocalArm(G_stSelectEcuID,stClearData);
    RegistMainFromLocalArm(G_stSelectEcuID,stClearData);
  end else if cmb_ArmExtensionSelect.ItemIndex = 1 then
  begin
    RegistMainToLocalArm(G_stSelectEcuID,stSendData);
    RegistMainFromLocalArm(G_stSelectEcuID,stClearData);
  end else if cmb_ArmExtensionSelect.ItemIndex = 2 then
  begin
    RegistMainToLocalArm(G_stSelectEcuID,stClearData);
    RegistMainFromLocalArm(G_stSelectEcuID,stSendData);
  end;
  ArmExtensionEnable(True);
end;

procedure TfmCurrentDeviceSetting.ArmExtensionEnable(aValue: Boolean);
begin
  cmb_ArmExtensionSelect.Enabled := aValue;
  Group_MainToLocalDevice.Enabled := aValue;
  Group_MainToLocalAll.Enabled := aValue;
end;

procedure TfmCurrentDeviceSetting.GetArmExtentionData(
  var aSendData: string);
var
  i : integer;
  oCheckBox : TCheckBox;
begin
  for i := 1 to Length(aSendData) do
  begin
    oCheckBox := TravelCheckBoxTagItem(Group_MainToLocalDevice,i - 1);
    if oCheckBox <> nil then
    begin
      if oCheckBox.Checked then
      begin
        if isDigit(oCheckBox.Caption) then
           aSendData[strtoint(oCheckBox.Caption) + 1] := '1';
      end;
    end;
  end;
end;

function TfmCurrentDeviceSetting.RegistMainFromLocalArm(aEcuID,
  aSendData: string): Boolean;
var
  i : integer;
begin

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '로컬경계후 메인경계 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistMainFromLocalArm(aEcuID, aSendData);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.RegistMainToLocalArm(aEcuID,
  aSendData: string): Boolean;
var
  i : integer;
begin
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '메인경계시 로컬경계 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistMainToLocalArm(aEcuID, aSendData);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.chk_ArmExtension00Click(Sender: TObject);
var
  stData : string;
  i : integer;
  stEcuID : string;
  nIndex : integer;
begin
  Group_MainToLocalDevice.Color := clBtnFace;
  stData := '';
  for i := 0 to 63 do
  begin
    stData := stData + '0';
  end;
  if TCheckBox(Sender).Checked then
  begin
    stEcuID := TCheckBox(Sender).Caption;
    nIndex := DeviceList.IndexOf(stEcuID);
    if nIndex > -1 then
    begin
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse then
      begin
        TCheckBox(Sender).Checked := False;
        showmessage('방범구역이 설정된 컨트롤러는 지정할 수 없습니다.');
        Exit;
      end;
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT812 then
      begin
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).Connected then
        begin
          TCheckBox(Sender).Checked := False;
          showmessage('KTT811G 컨트롤러만 지정할 수 있습니다.');
          Exit;
        end;
      end;
    end else
    begin
      TCheckBox(Sender).Checked := False;
      if pg_DeviceSetting.ActivePage = TabArmExtension then
         showmessage('등록되지 않은 컨트롤러는 지정할 수 없습니다.');
      Exit;
    end;
  end;
  GetArmExtentionData(stData);
  if Not (L_bTableLoading or L_bDataReceive or L_bGroupBoxClear) then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'ArmExtensionData',stData);

    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'ArmExtensionData','U');
    L_bSettingChanged := True;
  end;

end;

procedure TfmCurrentDeviceSetting.RecvArmExtension(aECUID,
  aExtensionGubun, aData: string;aEvent:Boolean);
var
  i : integer;
  oCheckBox : TCheckBox;
begin
  if aECUID <> G_stSelectEcuID then Exit;
  if Not isDigit(aExtensionGubun) then Exit;

  if Not aEvent then
  begin
    Group_MainToLocalDevice.Color := clYellow;
    Exit;
  end;
  L_bDataReceive := True;
  cmb_ArmExtensionSelect.ItemIndex := strtoint(aExtensionGubun);
  FormArmExtensionSetting(strtoint(aExtensionGubun));
  cmb_ArmExtensionSelect.Color := clYellow;

  GroupBoxClear(Group_MainToLocalDevice);
  for i := 1 to Length(aData) - 1 do
  begin
    if aData[i+1] = '1' then
    begin
      oCheckBox := TravelCheckBoxTagItem(Group_MainToLocalDevice,i - 1);
      if oCheckBox <> nil then
      begin
        oCheckBox.Checked := True;
      end;
    end;
  end;
  Group_MainToLocalDevice.Color := clYellow;
  L_bDataReceive := False;
end;

procedure TfmCurrentDeviceSetting.GroupBoxFree(aGroup: TGroupBox);
var
  i : integer;
  oCheckBox : TCheckBox;
begin
  for i := 0 to 100 do
  begin
    oCheckBox := TravelCheckBoxTagItem(aGroup,i);
    if oCheckBox <> nil then
    begin
      oCheckBox.Visible := False;
    end;
  end;

end;

function TfmCurrentDeviceSetting.ArmExtensionSearch(
  aDirect: Boolean): Boolean;
var
  stClearData : string;
  i : integer;
begin
  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;
  if G_stSelectEcuID <> '00' then Exit;
//  Form_ArmExtension_Initialize;
  stClearData := '';
  for i := 0 to 63 do
  begin
    stClearData := stClearData + '0';
  end;
  dmSocket.MainToLocalArmDevice := stClearData;  //소켓의 사용 유무를 초기화시키자
  dmSocket.MainFromLocalArmDevice := stClearData;

  ArmExtensionEnable(False);
  MainToLocalArmSearch(G_stSelectEcuID,aDirect);
  MainFromLocalArmSearch(G_stSelectEcuID,aDirect);
  ArmExtensionEnable(True);

end;

function TfmCurrentDeviceSetting.MainFromLocalArmSearch(aEcuID: string;
  aDirect: Boolean): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value('00','ArmExtensionGubun') = 'Y' then Exit;
  end;

  cmb_ArmExtensionSelect.Color := clWhite;
  Group_MainToLocalDevice.Color := clBtnFace;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '로컬경계시 메인경계 사용여부 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.MainFromLocalArmSearch(aEcuID,True);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;


end;

function TfmCurrentDeviceSetting.MainToLocalArmSearch(aEcuID: string;
  aDirect: Boolean): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value('00','ArmExtensionGubun') = 'Y' then Exit;
  end;

  cmb_ArmExtensionSelect.Color := clWhite;
  Group_MainToLocalDevice.Color := clBtnFace;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '메인경계시 로컬경계 사용여부 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.MainToLocalArmSearch(aEcuID,True);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.SetArmExtensionTableData(
  aArmExtensionData: string);
var
  i : integer;
  oCheckBox : TCheckBox;
begin
  GroupBoxClear(Group_MainToLocalDevice);
  for i := 1 to Length(aArmExtensionData) - 1 do
  begin
    if aArmExtensionData[i+1] = '1' then
    begin
      oCheckBox := TravelCheckBoxTagItem(Group_MainToLocalDevice,i - 1);
      if oCheckBox <> nil then
      begin
        oCheckBox.Checked := True;
      end;
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.DoorArmDSCheckUseChange(aEcuID: string;
  aValue: Boolean);
begin
  if aECUID <> G_stSelectEcuID then Exit;

  DoorArmDSCheckEnable(aValue);

end;

procedure TfmCurrentDeviceSetting.DoorDSCheckTimeUseChange(aEcuID: string;
  aValue: Boolean);
begin
  if aECUID <> G_stSelectEcuID then Exit;

  DoorDSCheckTimeEnable(aValue);

end;


procedure TfmCurrentDeviceSetting.DoorArmDSCheckEnable(aValue: Boolean);
var
  i : integer;
  oComboBox : TComboBox;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then Exit;
  
  for i := 1 to FIXMAXDOORNO do
  begin
    if i < 3 then
    begin
      oComboBox := TravelComboBoxItem(gb_DoorInfo,'cmb_ArmDSCheck', i);
    end else
    begin
      oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_ArmDSCheck', i);
    end;
    if oComboBox <> nil then
    begin
      oComboBox.Enabled := aValue;
      if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(i) then oComboBox.Enabled := False;
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT812 then oComboBox.Enabled := False;
      if (TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorLockType(i) <> 2) and
         (TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorLockType(i) <> 3) then oComboBox.Enabled := False;  //데드볼트 락이 아니면 False
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.DoorDSCheckTimeEnable(aValue: Boolean);
var
  i : integer;
  oComboBox : TComboBox;
begin
  //st_DoorDSCheck1.Enabled := aValue;
  //st_DoorDSCheck2.Enabled := aValue;
  
  for i := 1 to FIXMAXDOORNO do
  begin
    if i < 3 then
    begin
      oComboBox := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorDscheckTime', i);
    end else
    begin
      oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorDscheckTime', i);
    end;
    if oComboBox <> nil then
    begin
      oComboBox.Enabled := aValue;
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.DoorLockExtensionUseChange(
  aEcuID: string; aValue: Boolean);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  tabLockExtention.TabVisible := aValue;
end;

procedure TfmCurrentDeviceSetting.TabSheet19Resize(Sender: TObject);
begin
  inherited;
  gb_DoorControlResize;
end;

procedure TfmCurrentDeviceSetting.gb_DoorControlResize;
var
  nWidth : integer;
  i,j : integer;
  oGroupBox : TGroupBox;
  oRzBitBtn : TRzBitBtn;
begin
  nWidth := (gb_DoorControl.Width - 10) div 8 ;

  for i := 1 to FIXMAXDOORNO do
  begin
    oGroupBox := TravelTGroupBoxTagItem(gb_DoorControl,i);
    if oGroupBox <> nil then
    begin
      oGroupBox.Width := nWidth;
      for j := 1 to 3 do
      begin
        oRzBitBtn := TravelRzBitBtnTagItem(oGroupBox,j);
        if oRzBitBtn <> nil then
        begin
          oRzBitBtn.Width := nWidth - 10;
        end;
      end;
    end;
  end;
   
end;

procedure TfmCurrentDeviceSetting.ArmAreaSkillChange(aEcuID: string;
  aValue: Boolean);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  gb_DoorAlarmArea.Visible := aValue;
  PortFormArmAreaVisible(aValue);
end;

procedure TfmCurrentDeviceSetting.ArmAreaUseChange(aEcuID: string;
  aValue,aChange: Boolean);
var
  nIndex : integer;
begin
  if aECUID <> G_stSelectEcuID then Exit;
  if chk_DoorArmAreaUse.Checked <> aValue then
     chk_DoorArmAreaUse.Checked := aValue;
  L_bSettingChanged := aChange;

  tabArmAreaSearch.TabVisible := aValue;  //구역경계 미사용시 표시하지 말자
  tabControlerAlarm.TabVisible := Not aValue;
  tabArmAreaControl.TabVisible := aValue;

  if aEcuID = '00' then
  begin
    nIndex := DeviceList.IndexOf(aEcuID);
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse then
       TabArmExtension.TabVisible := TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmExtension
    else TabArmExtension.TabVisible := False;  //경계부가기능
  end;
  PortFormArmAreaEnable(aValue);
end;

procedure TfmCurrentDeviceSetting.PortFormArmAreaVisible(aValue: Boolean);
var
  i,j : integer;
  cmbBox : TComboBox;
  st_Text : TStaticText;
begin
  panPortAlarmArea0.Visible := aValue;
  panPortAlarmArea1.Visible := aValue;
  panPortAlarmArea2.Visible := aValue;
  panPortAlarmArea3.Visible := aValue;
  panPortAlarmArea4.Visible := aValue;
  panPortAlarmArea5.Visible := aValue;
  panPortAlarmArea6.Visible := aValue;
  panPortAlarmArea7.Visible := aValue;
  panPortAlarmArea8.Visible := aValue;

  for i := 0 to FIXMAXZONEEXTENDNO do
  begin
    for j := 1 to FIXMAXZONENO do
    begin
      cmbBox := GetPortComboBox(i,j,'cmb_PortAlarmArea');
      if cmbBox <> nil then
      begin
        cmbBox.Visible := aValue;
      end;
    end;
  end;

  //if aValue then pan_ZonState0.Left := 462
  //else pan_ZonState0.Left := 368;

  for j := 1 to FIXMAXZONENO do
  begin
    st_Text := TravelTStaticTextItem(gb_Port,'st_ZoneState',j);
    if st_Text <> nil then
    begin
      if aValue then st_Text.Left := 462
      else st_Text.Left := 368;
    end;
  end;

  //pan_ReaderArmArea0.Visible := aValue;
  for i := 1 to FIXMAXZONENO do
  begin
    cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',i);
    if cmbBox <> nil then cmbBox.Enabled := aValue;
  end;

  (*if aValue then pan_ReaderVer0.Left := 597
  else pan_ReaderVer0.Left := 524;

  for j := 1 to FIXMAXZONENO do
  begin
    st_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',j);
    if st_Text <> nil then
    begin
      if aValue then st_Text.Left := 597
      else st_Text.Left := 524;
    end;
  end;
  *)
  
end;

procedure TfmCurrentDeviceSetting.PortFormArmAreaEnable(aValue: Boolean);
var
  i,j : integer;
  cmbBox : TComboBox;
  nIndex : integer;
  nPortNum : integer;
  nReaderDoorNo : integer;
begin
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  for i := 1 to FIXMAXZONENO do
  begin
    cmbBox := TravelComboBoxItem(gb_DoorAlarmArea,'cmbDoorAlarmArea',i);
    if cmbBox <> nil then
    begin
      cmbBox.Enabled := aValue;
      if nIndex > -1 then
      begin
        if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(i) then cmbBox.Enabled := False;
      end;
    end;
  end;
  nPortNum := GetDeviceMaxPortNumber;
  for i := 0 to FIXMAXZONEEXTENDNO do
  begin
    if i > 0 then nPortNum := FIXMAXZONENO;
    for j := 1 to nPortNum do
    begin
      cmbBox := GetPortComboBox(i,j,'cmb_PortAlarmArea');
      if cmbBox <> nil then
      begin
        cmbBox.Enabled := aValue;
      end;
    end;
    if nPortNum < FIXMAXZONENO then
    begin
      for j := nPortNum + 1 to FIXMAXZONENO do
      begin
        cmbBox := GetPortComboBox(i,j,'cmb_PortAlarmArea');
        if cmbBox <> nil then
        begin
          cmbBox.Enabled := False;
        end;
      end;
    end;
  end;
  for i := 1 to FIXMAXREADERNO do
  begin
    cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderAlarmArea',i);
    if cmbBox <> nil then cmbBox.Enabled := aValue;
    if nIndex > -1 then
    begin
      nReaderDoorNo := TCurrentDeviceState(DeviceList.Objects[nIndex]).GetReaderDoor(i);
      if nReaderDoorNo > 0 then
      begin
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorType(nReaderDoorNo) = '1' then cmbBox.Enabled := False;
      end;
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.chk_DoorArmAreaUseClick(Sender: TObject);
begin
  inherited;
  if G_stSelectEcuID = '00' then
  begin
    if chk_DoorArmAreaUse.Checked then
    begin
      if cmb_ArmExtensionSelect.ItemIndex > 0 then
      begin
        showmessage('경계부가기능 사용시에는 방범구역을 사용 하실 수 없습니다.');
        chk_DoorArmAreaUse.Checked := False;
        Exit;
      end;
    end;
  end;

  ArmAreaUseChange(G_stSelectEcuID,chk_DoorArmAreaUse.Checked,True);
  dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'ArmAreaUse','U');
end;

function TfmCurrentDeviceSetting.RegistArmAreaUse(aEcuID,
  aArmAreaUse: string): Boolean;
var
  i : integer;
begin
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '구역경계사용유무 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistArmAreaUse(aEcuID,aArmAreaUse);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.ArmAreaUseData(aECUID, aArmUse: string);
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  if aArmUse = '1' then  chk_DoorArmAreaUse.Checked := True
  else chk_DoorArmAreaUse.Checked := False;
  ArmAreaUseChange(aECUID,chk_DoorArmAreaUse.Checked,False);
end;

function TfmCurrentDeviceSetting.SearchArmAreaUse(aEcuID: string;aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ArmAreaUse') = 'Y' then Exit;
  end;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '출입문 방범구역 사용유무 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.SearchArmAreaUse(aEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.RegistDoorArmArea(
  aEcuID: string): Boolean;
var
  i : integer;
  stData : string;
begin
  stData := GetDoorArmAreaState;
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '출입문 방범구역 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistDoorArmArea(aEcuID,stData);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.GetDoorArmAreaState: string;
var
  cmb_Box : TComboBox;
  i : integer;
  stData : string;
begin
  stData := '';
  for i := 1 to FIXMAXDOORNO do
  begin
    if stData <> '' then stData := stData + ' ';
    cmb_Box := TravelComboBoxItem(gb_DoorAlarmArea,'cmbDoorAlarmArea' ,i);
    if cmb_Box <> nil then
    begin
      if cmb_Box.ItemIndex < 0 then cmb_Box.itemIndex := 0;
      stData := stData + FillZeronumber(cmb_Box.ItemIndex + 1,2);
    end else stData := stData + '00' ;
  end;
  result := stData;
end;

procedure TfmCurrentDeviceSetting.RecvDoorArmAreaData(aECUID, aDoorNo,
  aArmArea: string);
var
  cmb_Box : TComboBox;
begin
  if aECUID <> G_stSelectEcuID then Exit;
  if Not isDigit(aDoorNo) then exit;
  if Not isDigit(aArmArea) then Exit;
  cmb_Box := TravelComboBoxItem(gb_DoorAlarmArea,'cmbDoorAlarmArea' ,strtoint(aDoorNo));
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex := strtoint(aArmArea) - 1 ;
    if cmb_Box.ItemIndex < 0 then cmb_Box.ItemIndex := 0;
    cmb_Box.Color := clYellow;
  end;

end;

function TfmCurrentDeviceSetting.SearchDoorArmArea(
  aEcuID: string;aDirect:Boolean=False): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DOORSETTINGRCV_Value(aEcuID,'0','1','DOORARMAREA') = 'Y' then Exit;
  end;
  Form_SystemDoorArmArea_ColorInitialize;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '출입문별 방범구역 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.SearchDoorArmArea(aEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

procedure TfmCurrentDeviceSetting.cmb_ZoneExtensionUse1Change(
  Sender: TObject);
var
  bGroupBoxVisible : Boolean;
  cmb_Box : TComboBox;
begin
  inherited;
  dmDatabase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'ZONEEXTENSIONUSE' + inttostr((sender as TRzComboBox).Tag),inttostr((sender as TRzComboBox).ItemIndex));
  dmDatabase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'ZONEEXTENSIONUSE' + inttostr((sender as TRzComboBox).Tag),'U');

  If (sender as TRzComboBox).ItemIndex = 1 then bGroupBoxVisible := True
  else bGroupBoxVisible := False;

  case (sender as TRzComboBox).Tag of
    1 : begin
          gb_Port1.Visible := bGroupBoxVisible;
        end;
    2 : begin
          gb_Port2.Visible := bGroupBoxVisible;
        end;
    3 : begin
          gb_Port3.Visible := bGroupBoxVisible;
        end;
    4 : begin
          gb_Port4.Visible := bGroupBoxVisible;
        end;
    5 : begin
          gb_Port5.Visible := bGroupBoxVisible;
        end;
    6 : begin
          gb_Port6.Visible := bGroupBoxVisible;
        end;
    7 : begin
          gb_Port7.Visible := bGroupBoxVisible;
        end;
    8 : begin
          gb_Port8.Visible := bGroupBoxVisible;
        end;
  end;

  cmb_Box := TravelComboBoxItem(gb_SystemZoneExtension,'cmb_SystemZoneExtensionUse',(sender as TRzComboBox).Tag);
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex := (sender as TRzComboBox).ItemIndex;
  end;
end;

procedure TfmCurrentDeviceSetting.ZoneExtensionPort_Registration(
  aExtNo: integer);
var
  nZoneExtensionUse : integer;
  stSendData : string;
  arrBitFunction : array [0..7] of char;
  stBitfunction : string;
  i : integer;
  cmb_Box : TComboBox;
  nWatchType : integer;
  stWatchTypeCode : string;
  nDelay : integer;
  nZoneArmArea : integer;
begin
  ZoneControlEnable(False);
  nZoneExtensionUse := 0;
  stBitfunction := '';
  if aExtNo =  1 then nZoneExtensionUse := cmb_ZoneExtensionUse1.ItemIndex
  else if aExtNo =  2 then nZoneExtensionUse := cmb_ZoneExtensionUse2.ItemIndex
  else if aExtNo =  3 then nZoneExtensionUse := cmb_ZoneExtensionUse3.ItemIndex
  else if aExtNo =  4 then nZoneExtensionUse := cmb_ZoneExtensionUse4.ItemIndex
  else if aExtNo =  5 then nZoneExtensionUse := cmb_ZoneExtensionUse5.ItemIndex
  else if aExtNo =  6 then nZoneExtensionUse := cmb_ZoneExtensionUse6.ItemIndex
  else if aExtNo =  7 then nZoneExtensionUse := cmb_ZoneExtensionUse7.ItemIndex
  else if aExtNo =  8 then nZoneExtensionUse := cmb_ZoneExtensionUse8.ItemIndex;

  if nZoneExtensionUse < 0 then nZoneExtensionUse := 0;
  stSendData := inttostr(nZoneExtensionUse);

  for i:= 1 to FIXMAXZONENO do
  begin
    FillChar(arrBitFunction, 8, '0');
    cmb_Box := GetPortComboBox(aExtNo,i,'cmb_WatchType');
    nWatchType := 0;
    if cmb_Box <> nil then nWatchType := cmb_Box.ItemIndex;

    stWatchTypeCode := GetWatchTypeCode(i,nWatchType);

    nDelay := 0;
    nZoneArmArea := 1;
    cmb_Box := GetPortComboBox(aExtNo,i,'cmb_PortAlarmArea');
    if cmb_Box <> nil then
    begin
      nZoneArmArea := cmb_Box.ItemIndex + 1;
    end;
    if nWatchType < 0 then nWatchType := 0;
    if nZoneArmArea < 0 then nZoneArmArea := 0;
    stSendData := stSendData + stWatchTypeCode + inttostr(nWatchType) + FillZeroNumber(nZoneArmArea,2);

    cmb_Box := GetPortComboBox(aExtNo,i,'cmb_recorver');
    if cmb_Box <> nil then
    begin
      if cmb_Box.ItemIndex = 1 then arrBitFunction[5] := '1';
    end;

    cmb_Box := GetPortComboBox(aExtNo,i,'cmb_ZonUse');
    if cmb_Box <> nil then
    begin
      if cmb_Box.ItemIndex = 0 then arrBitFunction[0] := '1';
    end;

    stBitfunction := stBitfunction + BinaryToHex(string(arrBitFunction));
  end;
  stSendData := stSendData + stBitfunction;
  RegistZoneExtensionPortInfo(G_stSelectEcuID,inttostr(aExtNo),stSendData);

  ZoneControlEnable(True);

end;

function TfmCurrentDeviceSetting.RegistZoneExtensionPortInfo(aEcuID,
  aExtNo, aSendData: string): Boolean;
var
  i : integer;
begin
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '존확장기' + aExtNo + ' 정보 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistZoneExtensionPortInfo(aEcuID, aExtNo, aSendData);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.RcvZoneExtensionPortInfoData(aECUID,
  aZoneExtNo, aZoneExtUse: string; arrZoneState, arrZoneType,
  arrZoneArmArea,arrZoneRecover,arrZoneUsed: array of string);
var
  i : integer;
  cmbBox : TComboBox;
  bZoneExtensionUse : Boolean;
begin
  if aECUID <> G_stSelectEcuID then Exit;
  if Not isDigit(aZoneExtNo) then Exit;
  if aZoneExtUse = '1' then bZoneExtensionUse := True
  else bZoneExtensionUse := False;

  FormZoneExtensionUse(aEcuID,aZoneExtNo,bZoneExtensionUse,clYellow);

  for i := 0 to HIGH(arrZoneType) do
  begin
    cmbBox := GetPortComboBox(strtoint(aZoneExtNo),i + 1,'cmb_WatchType');
    if cmbBox <> nil then
    begin
      if isDigit(arrZoneType[i]) then
      begin
        cmbBox.ItemIndex := strtoint(arrZoneType[i]);
        cmbBox.Color := clYellow;
      end;
    end;
  end;
  for i := 0 to HIGH(arrZoneArmArea) do
  begin
    cmbBox := GetPortComboBox(strtoint(aZoneExtNo),i + 1,'cmb_PortAlarmArea');
    if cmbBox <> nil then
    begin
      if isDigit(arrZoneArmArea[i]) then
      begin
        cmbBox.ItemIndex := strtoint(arrZoneArmArea[i]) - 1;
        if cmbBox.ItemIndex < 0 then cmbBox.ItemIndex := 0;
        cmbBox.Color := clYellow;
      end;
    end;
  end;
  for i := 0 to HIGH(arrZoneRecover) do
  begin
    cmbBox := GetPortComboBox(strtoint(aZoneExtNo),i + 1,'cmb_recorver');
    if cmbBox <> nil then
    begin
      if isDigit(arrZoneRecover[i]) then
      begin
        cmbBox.ItemIndex := strtoint(arrZoneRecover[i]);
        cmbBox.Color := clYellow;
      end;
    end;
  end;
  for i := 0 to HIGH(arrZoneUsed) do
  begin
    cmbBox := GetPortComboBox(strtoint(aZoneExtNo),i + 1,'cmb_ZonUse');
    if cmbBox <> nil then
    begin
      if isDigit(arrZoneUsed[i]) then
      begin
        cmbBox.ItemIndex := strtoint(arrZoneUsed[i]);
        cmbBox.Color := clYellow;
      end;
    end;
  end;

end;

function TfmCurrentDeviceSetting.AllZoneExtensionCheck(aZoneExtNo: integer;
  aDirect: Boolean): Boolean;
var
  i : integer;
  bResult : Boolean;
  static_Text : TStaticText;
  nPortNumber : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;
  //Form_AllPort_ColorInitialize(0);
  Try
    ZoneControlEnable(False);
    ZoneExtensionSearch(G_stSelectEcuID,aZoneExtNo,aDirect);
  Finally
    ZoneControlEnable(True);
  End;
end;

function TfmCurrentDeviceSetting.ZoneExtensionSearch(aEcuID: string;
  aZoneExtNo: integer; aDirect: Boolean): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    result := True;
    if dmDataBase.GetTB_ZONESETTINGRCV_Value(aEcuID,inttostr(aZoneExtNo),'1','PORT_TYPE') = 'Y' then Exit;
  end;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '존확장기' + inttostr(aZoneExtNo) + ' 정보 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.ZoneExtensionSearch(aEcuID,inttostr(aZoneExtNo));
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.ZoneExtensionSkillChange(aEcuID: string;
  aValue: Boolean);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  tab_ExtensionPort.TabVisible := aValue;
  gb_SystemZoneExtension.Visible := aValue;
  DoorLockExtensionForm(aValue);

end;

procedure TfmCurrentDeviceSetting.DoorLockExtensionForm(aValue: Boolean);
var
  cmb_Box :TComboBox;
  staticText : TstaticText;
  i : integer;
begin
  tabLockExtention.TabVisible := aValue;
  for i := 3 to FIXMAXDOORNO do
  begin
    cmb_Box := TravelComboBoxItem(gb_SystemInfo,'ComboBox_DoorType' ,i);
    if cmb_Box <> nil then
    begin
      cmb_Box.Visible := aValue;
    end;
    staticText := TravelTStaticTextItem(gb_SystemInfo,'st_Doortype' ,i);
    if staticText <> nil then
    begin
      staticText.Visible := aValue;
    end;
  end;
  
end;

procedure TfmCurrentDeviceSetting.ReaderFormDoorLockSetting(
  aDoorNo: integer; aDoor2Use: Boolean);
var
  cmb_Box :TComboBox;
  i,j : integer;
  nIndex : integer;
begin
  if L_bReaderFormDoorLockSetting then Exit;
  Try
    L_bReaderFormDoorLockSetting := True;
    for i := 1 to FIXMAXREADERNO do
    begin
      cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor' ,i);
      if cmb_Box <> nil then
      begin
        with cmb_Box do
        begin
          nIndex := ItemIndex;
          Clear;
          Items.add('방범전용');
          if aDoorNo > 0 then
          begin
            for j := 1 to  aDoorNo do
            begin
              if Not aDoor2Use and (j = 2) then Items.add('사용안함')
              else Items.add(inttostr(j));
            end;
          end;
          DropDownCount := aDoorNo + 1;
          ItemIndex := nIndex;
        end;
      end;
    end;
  Finally
    L_bReaderFormDoorLockSetting := False;
  End;

end;

procedure TfmCurrentDeviceSetting.cmb_SystemZoneExtensionUse1Change(
  Sender: TObject);
var
  bZoneExtensionVisible : Boolean;
  oComboBox : TComboBox;
begin
  if (Sender as TRzComboBox).ItemIndex = 0 then bZoneExtensionVisible := False
  else bZoneExtensionVisible := True;

  FormSystemDoorUsePossibilityEnable(inttostr((Sender as TRzComboBox).Tag + 2),bZoneExtensionVisible);

  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'ZONEEXTENSIONUSE' + inttostr((Sender as TRzComboBox).Tag),inttostr((Sender as TRzComboBox).ItemIndex));
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'ZONEEXTENSIONUSE' + inttostr((Sender as TRzComboBox).Tag),'U');
    L_bSettingChanged := True;
  end;
  
end;

procedure TfmCurrentDeviceSetting.FormZoneExtensionUse(aEcuID,
  aZoneExtNo: string; aZoneExtensionUse: Boolean;aColor:TColor);
var
  nComboIndex : integer;
  cmb_Box : TComboBox;
begin
  if aECUID <> G_stSelectEcuID then Exit;

  if aZoneExtensionUse then nComboIndex := 1
  else nComboIndex := 0;

  FormRemoteZoneExtVisible(aEcuID,aZoneExtNo,aZoneExtensionUse);
  case aZoneExtNo[1] of
    '1' : begin
            tab_ZoneExtension1.TabVisible := aZoneExtensionUse;
            cmb_ZoneExtensionUse1.ItemIndex := nComboIndex;
            cmb_ZoneExtensionUse1.Color := aColor;
            gb_ZoneExtensionState1.Visible := aZoneExtensionUse;
            pan_RemoteZoneExt1.Visible := aZoneExtensionUse;
          end;
    '2' : begin
            tab_ZoneExtension2.TabVisible := aZoneExtensionUse;
            cmb_ZoneExtensionUse2.ItemIndex := nComboIndex;
            cmb_ZoneExtensionUse2.Color := aColor;
            gb_ZoneExtensionState2.Visible := aZoneExtensionUse;
            pan_RemoteZoneExt2.Visible := aZoneExtensionUse;
          end;
    '3' : begin
            tab_ZoneExtension3.TabVisible := aZoneExtensionUse;
            cmb_ZoneExtensionUse3.ItemIndex := nComboIndex;
            cmb_ZoneExtensionUse3.Color := aColor;
            gb_ZoneExtensionState3.Visible := aZoneExtensionUse;
            pan_RemoteZoneExt3.Visible := aZoneExtensionUse;
          end;
    '4' : begin
            tab_ZoneExtension4.TabVisible := aZoneExtensionUse;
            cmb_ZoneExtensionUse4.ItemIndex := nComboIndex;
            cmb_ZoneExtensionUse4.Color := aColor;
            gb_ZoneExtensionState4.Visible := aZoneExtensionUse;
            pan_RemoteZoneExt4.Visible := aZoneExtensionUse;
          end;
    '5' : begin
            tab_ZoneExtension5.TabVisible := aZoneExtensionUse;
            cmb_ZoneExtensionUse5.ItemIndex := nComboIndex;
            cmb_ZoneExtensionUse5.Color := aColor;
            gb_ZoneExtensionState5.Visible := aZoneExtensionUse;
            pan_RemoteZoneExt5.Visible := aZoneExtensionUse;
          end;
    '6' : begin
            tab_ZoneExtension6.TabVisible := aZoneExtensionUse;
            cmb_ZoneExtensionUse6.ItemIndex := nComboIndex;
            cmb_ZoneExtensionUse6.Color := aColor;
            gb_ZoneExtensionState6.Visible := aZoneExtensionUse;
            pan_RemoteZoneExt6.Visible := aZoneExtensionUse;
          end;
    '7' : begin
            tab_ZoneExtension7.TabVisible := aZoneExtensionUse;
            cmb_ZoneExtensionUse7.ItemIndex := nComboIndex;
            cmb_ZoneExtensionUse7.Color := aColor;
            gb_ZoneExtensionState7.Visible := aZoneExtensionUse;
            pan_RemoteZoneExt7.Visible := aZoneExtensionUse;
          end;
    '8' : begin
            tab_ZoneExtension8.TabVisible := aZoneExtensionUse;
            cmb_ZoneExtensionUse8.ItemIndex := nComboIndex;
            cmb_ZoneExtensionUse8.Color := aColor;
            gb_ZoneExtensionState8.Visible := aZoneExtensionUse;
            pan_RemoteZoneExt8.Visible := aZoneExtensionUse;
          end;
  end;

end;

procedure TfmCurrentDeviceSetting.cmbDoorAlarmArea1Change(Sender: TObject);
begin
  inherited;
  L_bSettingChanged := True;
  dmDataBase.UpdateTB_DOORSETTING_FieldName(G_stSelectEcuID,inttostr((Sender as TRzComboBox).Tag),'DOORARMAREA',inttostr((Sender as TRzComboBox).ItemIndex + 1));
  dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(G_stSelectEcuID,inttostr((Sender as TRzComboBox).Tag),'DOORARMAREA','U');
  (Sender as TRzComboBox).Color := clWhite;
end;


function TfmCurrentDeviceSetting.SystemDoorArmAreaSearch(aEcuID: string;
  aDirect: Boolean): Boolean;
var
  i : integer;
  nIndex : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  nIndex := DeviceList.IndexOf(aEcuID);
  if Not isDigit(aEcuID) then Exit;
  if Not dmSocket.DeviceConnectCheck(aEcuID) then exit;
{  if Not aDirect then
  begin
    if dmDataBase.GetTB_DOORSETTINGRCV_Value(aEcuID,'0','1','DOORARMAREA') = 'Y' then Exit;
  end; }
  SystemDoorArmAreaEnable(False);
  if nIndex > -1 then
  begin
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill then
      SearchArmAreaUse(G_stSelectEcuID,aDirect);
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse then //방범구역 사용시에만 조회 하자
      SearchDoorArmArea(G_stSelectEcuID,aDirect);
  end;

  SystemDoorArmAreaEnable(chk_DoorArmAreaUse.Checked);
end;

procedure TfmCurrentDeviceSetting.SystemDoorArmAreaEnable(aValue: Boolean);
var
  cmb_Box : TComboBox;
  i : integer;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  for i :=1 to FIXMAXDOORNO do
  begin
    cmb_Box := TravelComboBoxItem(gb_DoorAlarmArea,'cmbDoorAlarmArea' ,i);
    if cmb_Box <> nil then
    begin
      cmb_Box.Enabled := aValue;
      if nIndex > -1 then
      begin
        if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(i) then cmb_Box.Enabled := False;
      end;
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.Form_SystemDoorArmArea_ColorInitialize;
var
  cmb_Box : TComboBox;
  i : integer;
begin
  for i :=1 to FIXMAXDOORNO do
  begin
    cmb_Box := TravelComboBoxItem(gb_DoorAlarmArea,'cmbDoorAlarmArea' ,i);
    if cmb_Box <> nil then
    begin
      cmb_Box.Color := clWhite;
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.DoorExtensionSystemInfo_Registration;
var
  cmb_Box : TComboBox;
  nDoorMaxNo : integer;
  i : integer;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then Exit;

  nDoorMaxNo := GetDeviceMaxDoorNumber;
  if nDoorMaxNo < 3 then Exit;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
  begin
    for i := 3 to nDoorMaxNo do
    begin
      if Not CheckArmDsANDDeadBoltLockType(i) then
      begin
        showmessage('출입문' + inttostr(i) + ' 데드볼트에서는 경계시 문열림검사를 수행 할 수 없습니다.');
        Exit;
      end;
    end;
  end;

  for i := 3 to nDoorMaxNo do
  begin
    LockControlEnable(inttostr(i),False);
  end;

  for i := 3 to nDoorMaxNo do
  begin
    RegistDoorSystyemInfo(inttostr(i));
    if G_stDeviceType[strtoint(G_stSelectEcuID)] = KTT812 then
    begin
      cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_ArmDSCheck',i);
      if cmb_Box <> nil then
        RegistArmDsCheck(G_stSelectEcuID,inttostr(i),inttostr(cmb_Box.ItemIndex));
    end;
  end;

  for i := 3 to nDoorMaxNo do
  begin
    LockControlEnable(inttostr(i),True);
  end;

end;

function TfmCurrentDeviceSetting.GetDoorDSCheckTime(aDoorNo: string;
  var aDoorDSCheckTime: string): Boolean;
var
  oComboBox : TComboBox;
begin
  result := False;
  if Not isDigit(aDoorNo) then Exit;
  if strtoint(aDoorNo) < 3 then
  begin
    oComboBox := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorDscheckTime', strtoint(aDoorNo));
  end else
  begin
    oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorDscheckTime', strtoint(aDoorNo));
  end;
  if oComboBox = nil then Exit;
  if oComboBox.ItemIndex < 0 then oComboBox.ItemIndex := 0;
  Try
    aDoorDSCheckTime := inttostr(oComboBox.ItemIndex);
    result := True;
  Except
    Exit;
  End;
end;

procedure TfmCurrentDeviceSetting.RecvDoorDSCheckUse(aECUID, aDoorNo,
  aDSCheckUse: string);
var
  oComboBox : TComboBox;
begin
  if aECUID <> G_stSelectEcuID then Exit;
  if Not isDigit(aDoorNo) then Exit;
  if strtoint(aDoorNo) < 3 then
  begin
    oComboBox := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorDscheckTime', strtoint(aDoorNo));
  end else
  begin
    oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorDscheckTime', strtoint(aDoorNo));
  end;
  if oComboBox = nil then Exit;
  if aDSCheckUse = '0' then
  begin
    oComboBox.ItemIndex := 0;    //항상검사
    oComboBox.Color := clYellow;
  end;
end;

procedure TfmCurrentDeviceSetting.RecvDoorDSCheckTime(aECUID, aDoorNo,
  aDSCheckTimeSec: string);
var
  nIndex : integer;
  oComboBox : TComboBox;
begin
  if aECUID <> G_stSelectEcuID then Exit;
  if Not isDigit(aDoorNo) then Exit;
  if Not isDigit(aDSCheckTimeSec) then Exit;
  nIndex := DeviceList.IndexOf(aEcuId);
  if nIndex < 0 then Exit;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorDSCheckUse(strtoint(aDoorNo)) = '0' then Exit; //항상 검사 중이라 옵션 수행 안함
  if strtoint(aDoorNo) < 3 then
  begin
    oComboBox := TravelComboBoxItem(gb_DoorInfo,'cmb_DoorDscheckTime', strtoint(aDoorNo));
  end else
  begin
    oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_DoorDscheckTime', strtoint(aDoorNo));
  end;
  if oComboBox = nil then Exit;
  oComboBox.ItemIndex := strtoint(aDSCheckTimeSec);    //항상검사
  oComboBox.Color := clYellow;

end;

function TfmCurrentDeviceSetting.DoorDSCheckTimeSearch(aEcuID,
  aDoorNo: string; aDirect: Boolean): Boolean;
var
  i : integer;
  nIndex : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not isDigit(aDoorNo) then Exit;
  if Not dmSocket.DeviceConnectCheck(aEcuID) then exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DOORSETTINGRCV_Value(aEcuID,'0',aDoorNo,'DSCHECKUSE')  = 'Y' then Exit;
  end;

  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;
  if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(strtoint(aDoorNo)) then Exit;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType = AUTOKT811 then Exit; //무인국사는 체크하지 말자.

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := 'DS검사 사용유무 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.DoorDSCheckUseSearch(G_stSelectEcuID,aDoorNo);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
  if Not result then Exit;

  if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorDSCheckUse(strtoint(aDoorNo)) = '0' then Exit; //항상 사용이면 시간 체크할 필요 없음

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := 'DS검사사용시간 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.DoorDSCheckTimeSearch(G_stSelectEcuID,aDoorNo); //옵션 시간을 조회
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.RegistZoneExtensionUse(
  aEcuID: string): Boolean;
var
  i : integer;
  stData : string;
begin
  stData := GetZoneExtensionUseData;
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '존확장기 사용유무 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistZoneExtensionUse(aEcuID,stData);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.GetZoneExtensionUseData: string;
var
  cmb_Box:TComboBox;
  i : integer;
  stData : string;
begin
  stData := '0';
  for i := 1 to FIXMAXZONEEXTENDNO do
  begin
    cmb_Box := TravelComboBoxItem(gb_SystemZoneExtension,'cmb_SystemZoneExtensionUse', i);
    if cmb_Box <> nil then
    begin
      if cmb_Box.ItemIndex < 0 then stData := stData + '0'
      else stData := stData + inttostr(cmb_Box.ItemIndex);
    end else stData := stData + '0';
  end;
  result := stData;
end;

procedure TfmCurrentDeviceSetting.RecvZoneExtensionUseData(aECUID,
  aData: string);
var
  i : integer;
  bZoneExtensionUse : Boolean;
  nZoneExtentionType : integer; //0 미사용,1.방범+출입,2.출입전용
  cmb_Box : TComboBox;
begin
  if aECUID <> G_stSelectEcuID then Exit;
  if Length(aData) < FIXMAXZONEEXTENDNO then Exit;

  for i := 1 to FIXMAXZONEEXTENDNO do
  begin
    if aData[i] = '1' then bZoneExtensionUse := True
    else bZoneExtensionUse := False;
    if isDigit(aData[i]) then nZoneExtentionType := strtoint(aData[i])
    else nZoneExtentionType := 0;

    FormZoneExtensionUse(aEcuID,inttostr(i),bZoneExtensionUse,clYellow);

    cmb_Box := TravelComboBoxItem(gb_SystemZoneExtension,'cmb_SystemZoneExtensionUse' ,i);
    if cmb_Box <> nil then
    begin
      cmb_Box.ItemIndex := nZoneExtentionType;
      cmb_Box.Color := clYellow;
    end;
  end;

end;

function TfmCurrentDeviceSetting.SystemZoneExtensionUseSearch(
  aEcuID: string; aDirect: Boolean): Boolean;
var
  i : integer;
  nIndex : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  nIndex := DeviceList.IndexOf(aEcuID);
  if Not isDigit(aEcuID) then Exit;
  if Not dmSocket.DeviceConnectCheck(aEcuID) then exit;
  if Not aDirect then
  begin
    if (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE1') = 'Y') and
       (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE2') = 'Y') and
       (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE3') = 'Y') and
       (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE4') = 'Y') and
       (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE5') = 'Y') and
       (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE6') = 'Y') and
       (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE7') = 'Y') and
       (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'ZONEEXTENSIONUSE8') = 'Y') 
        then Exit;
  end;
  SystemZoneExtensionEnable(False);
  Form_SystemZoneExtension_ColorInitialize;
  if nIndex > -1 then
  begin
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then
    begin
      Try
        pan_Message.Color := L_cSearchColor;
        pan_Message.Visible := True;
        ProgressBar1.Max := G_nLoopCount + 1;
        for i := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          pan_Message.Caption := '존확장기 사용유무 체크중입니다.';
          ProgressBar1.Position := i + 1;
          result := dmSocket.SearchSystemZoneExtensionUse(aEcuID);
          if result then Break;
        end;
      Finally
        if Not G_bApplicationTerminate then pan_Message.Visible := False;
      End;
    end;
  end;

  SystemZoneExtensionEnable(True);
end;

procedure TfmCurrentDeviceSetting.SystemZoneExtensionEnable(
  aValue: Boolean);
var
  cmb_Box : TComboBox;
  i : integer;
begin
  for i :=1 to FIXMAXZONEEXTENDNO do
  begin
    cmb_Box := TravelComboBoxItem(gb_SystemZoneExtension,'cmb_SystemZoneExtensionUse' ,i);
    if cmb_Box <> nil then
    begin
      cmb_Box.Enabled := aValue;
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.Form_SystemZoneExtension_ColorInitialize;
var
  cmb_Box : TComboBox;
  i : integer;
begin
  for i :=1 to FIXMAXZONEEXTENDNO do
  begin
    cmb_Box := TravelComboBoxItem(gb_SystemZoneExtension,'cmb_SystemZoneExtensionUse' ,i);
    if cmb_Box <> nil then
    begin
      cmb_Box.Color := clWhite;
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.GridMergeInitialize;
var
  i : integer;
begin
  Try
    L_bGridInitialize := True;
    for i := 0 to 7 do
    begin
      gb_ArmAreaSearch.ItemChecked[i] := True;
    end;

    with sg_ArmAreastate do
    begin
      Clear;
      MergeCells(0,0,1,2);
      MergeCells(1,0,1,2);
      MergeCells(2,0,2,1);
      MergeCells(4,0,9,1);

      cells[0,0] := '번호';
      cells[1,0] := '출입문';
      cells[2,0] := '카드리더';
      cells[2,1] := '리더';
      cells[3,1] := '연결문';
      cells[4,0] := '존정보';
      cells[4,1] := '컨트롤러';
      cells[5,1] := '존확장1';
      cells[6,1] := '존확장2';
      cells[7,1] := '존확장3';
      cells[8,1] := '존확장4';
      cells[9,1] := '존확장5';
      cells[10,1] := '존확장6';
      cells[11,1] := '존확장7';
      cells[12,1] := '존확장8';
      for i := 2 to 9 do
      begin
        cells[0,i] := inttostr(i-1);
      end;
    end;
  Finally
    L_bGridInitialize := False;
  End;
  //sg_ArmAreastate.MergeCells
end;

procedure TfmCurrentDeviceSetting.gb_ArmAreaSearchChange(Sender: TObject;
  Index: Integer; NewState: TCheckBoxState);
begin
  inherited;
  if Not L_bGridInitialize then SearchArmAreaSetting;
end;

procedure TfmCurrentDeviceSetting.SearchArmAreaSetting;
var
  i,j : integer;
  nCount : integer;
  nMaxCheckCount : integer;
  stTemp : string;
  nTemp : integer;
begin
  nMaxCheckCount := 3;
  Try
    pan_Message.Visible := True;
    pan_Message.Color := L_cSearchColor;
    nCount := 0;
    While dmDataBase.GetTB_DOORSETTINGRCV_Value(G_stSelectEcuID,'0','1','DOORARMAREA') <> 'Y' do
    begin
      pan_Message.Caption := '출입문 방범구역 정보 조회중입니다.';
      SystemDoorArmAreaSearch(G_stSelectEcuID,True);
      inc(nCount);
      if nCount > nMaxCheckCount then
      begin
        showmessage('출입문 구역정보 조회에 실패하였습니다.');
        Exit;
      end;
    end;

    for i:= 1 to FIXMAXREADERNO do
    begin
      nCount := 0;
      While dmDataBase.GetTB_READERSETTINGRCV_Value(G_stSelectEcuID,'0',inttostr(i),'READERARMAREA') <> 'Y' do
      begin
        pan_Message.Caption := inttostr(i) + '번 카드리더 방범구역 정보 조회중입니다.';
        CardReaderInfoSearch(G_stSelectEcuID,i,True);
        inc(nCount);
        if nCount > nMaxCheckCount then
        begin
          showmessage('카드리더 구역정보 조회에 실패하였습니다.');
          Exit;
        end;
      end;
    end;

    for i := 1 to FIXMAXZONENO do
    begin
      nCount := 0;
      While dmDataBase.GetTB_ZONESETTINGRCV_Value(G_stSelectEcuID,'0',inttostr(i),'ZONEARMAREA') <> 'Y' do
      begin
        pan_Message.Caption := inttostr(i) + '번 컨트롤러 존 방범구역 정보 조회중입니다.';
        PortInfoSearch(G_stSelectEcuID,i,True);
        inc(nCount);
        if nCount > nMaxCheckCount then
        begin
          showmessage('컨트롤러 존 구역정보 조회에 실패하였습니다.');
          Exit;
        end;
      end;
    end;
    for i := 1 to FIXMAXZONEEXTENDNO do
    begin
      nCount := 0;
      if dmDataBase.GetTB_DEVICE_Value(G_stSelectEcuID,'ZONEEXTENSIONUSE' + inttostr(i)) = '1' then
      begin
        While dmDataBase.GetTB_ZONESETTINGRCV_Value(G_stSelectEcuID,inttostr(i),'1','ZONEARMAREA') <> 'Y' do
        begin
          pan_Message.Caption := inttostr(i) + '번 존확장기 방범구역 정보 조회중입니다.';
          ZoneExtensionSearch(G_stSelectEcuID,i,True);
          inc(nCount);
          if nCount > nMaxCheckCount then
          begin
            showmessage('존확장기 구역정보 조회에 실패하였습니다.');
            //Exit;
          end;
        end;
      end;
    end;
  Finally
    pan_Message.Visible := False;
  End;

  for i := 1 to FIXMAXZONENO do
  begin
    stTemp := dmDataBase.GetTB_DOORSETTING_Value(G_stSelectEcuID,'0',inttostr(i),'DOORARMAREA');
    if isDigit(stTemp) then nTemp := strtoint(stTemp) - 1
    else nTemp := 0;
    if nTemp < 0 then nTemp := 0;
    if gb_ArmAreaSearch.ItemChecked[nTemp] then ShowGrid(1,i + 1,nTemp,True)
    else ShowGrid(1,i + 1,nTemp,False); //출입문

    stTemp := dmDataBase.GetTB_READERSETTING_Value(G_stSelectEcuID,'0',inttostr(i),'READERARMAREA');
    if isDigit(stTemp) then nTemp := strtoint(stTemp) - 1
    else nTemp := 0;
    if nTemp < 0 then nTemp := 0;
    if gb_ArmAreaSearch.ItemChecked[nTemp] then ShowGrid(2,i + 1,nTemp,True)
    else ShowGrid(2,i + 1,nTemp,False);  //카드리더

    if dmDataBase.GetTB_READERSETTING_Value(G_stSelectEcuID,'0',inttostr(i),'READER_USE') = '1' then //리더 사용이면
    begin
      stTemp := dmDataBase.GetTB_READERSETTING_Value(G_stSelectEcuID,'0',inttostr(i),'READER_DOOR');
      if isDigit(stTemp) then nTemp := strtoint(stTemp)
      else nTemp := 0;
      if nTemp < 0 then nTemp := 0;
      ShowGrid(3,i + 1,nTemp,True);  //리더에 연결된 출입문번호
    end;

    for j:= 0 to FIXMAXZONEEXTENDNO do
    begin
      stTemp := dmDataBase.GetTB_ZONESETTING_Value(G_stSelectEcuID,inttostr(j),inttostr(i),'ZONEARMAREA');
      if isDigit(stTemp) then nTemp := strtoint(stTemp) - 1
      else nTemp := 0;
      if nTemp < 0 then nTemp := 0;
      if gb_ArmAreaSearch.ItemChecked[nTemp] then ShowGrid(j + 4,i + 1,nTemp,True)
      else ShowGrid(j + 4,i + 1,nTemp,False);  //존정보
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.FormResize(Sender: TObject);
var
  nLeft : integer;
  nTop : integer;
begin
  inherited;
  nLeft := (Width div 2) - (pan_message.Width div 2);
  nTop := (Height div 2) - (pan_message.Height div 2);
  pan_message.Left := nLeft;
  pan_message.Top := nTop;

end;

procedure TfmCurrentDeviceSetting.ShowGrid(aCol, aRow, aData: integer;aVisible:Boolean);
var
  aColor : TColor;
  stData : string;
begin
  if aVisible then
  begin
    case aData of
      0 : begin
            stData := ' 구역1';
            aColor := clYellow;
          end;
      1 : begin
            stData := ' 구역2';
            aColor := clLime;
          end;
      2 : begin
            stData := ' 구역3';
            aColor := clRed;
          end;
      3 : begin
            stData := ' 구역4';
            aColor := clSilver;
          end;
      4 : begin
            stData := ' 구역5';
            aColor := clPurple;
          end;
      5 : begin
            stData := ' 구역6';
            aColor := clFuchsia;
          end;
      6 : begin
            stData := ' 구역7';
            aColor := clAqua;
          end;
      7 : begin
            stData := ' 구역8';
            aColor := clTeal;
          end;
    end;
  end else
  begin
    stData := '';
    aColor := clWhite;
  end;
  if aCol = 3 then
  begin
    stData := inttostr(aData);
    aColor := clWhite;
  end;

  with sg_ArmAreastate do
  begin
    cells[aCol,aRow] := stData;
    Colors[aCol,aRow] := aColor;
  end;

end;

procedure TfmCurrentDeviceSetting.btn_AlarmStateClick(Sender: TObject);
begin
  inherited;
  ArmStateCheck(G_stSelectEcuID,(Sender as TRzBitBtn).Tag);
end;

procedure TfmCurrentDeviceSetting.btn_AllFireRecoveryClick(
  Sender: TObject);
begin
  inherited;
  st_FireResult.Caption := '화재복구 성공';
  st_FireResult.Color := clWhite;
  dmSocket.AllFireRecovery;
end;

procedure TfmCurrentDeviceSetting.btn_AllDisArmControlClick(
  Sender: TObject);
begin
  inherited;
  if Application.MessageBox(pchar((Sender as TRzBitBtn).Caption + '시 모든 컨트롤러에 적용 됩니다. 계속 진행하시겠습니까?'),'주의',MB_OKCANCEL) = ID_CANCEL then Exit;
  dmSocket.AllDeviceArmMode((Sender as TRzBitBtn).Hint);

end;

procedure TfmCurrentDeviceSetting.btn_SyncTime1Click(Sender: TObject);
begin
  inherited;
  TimeSync(formatDateTime('yyyymmddhhnnss',now));

end;

procedure TfmCurrentDeviceSetting.btn_DeviceResetClick(Sender: TObject);
begin
  inherited;
  st_DeviceResetResult.Caption := '';
  st_DeviceResetResult.Color := clWhite;
  dmSocket.ControlerReset(G_stSelectEcuID);

end;

procedure TfmCurrentDeviceSetting.btn_MemoryClearClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox(pchar('메모리 지움시 설정 및 카드데이터가 전체 삭제 됩니다. 계속 진행하시겠습니까?'),'주의',MB_OKCANCEL) = ID_CANCEL then Exit;
  st_MemoryClearResult.Caption := '';
  st_MemoryClearResult.Color := clWhite;
  
  dmSocket.MemoryClear(G_stSelectEcuID);

end;

procedure TfmCurrentDeviceSetting.RecvMemoryClearControl(aECUID,
  aData: string);
begin
  if aECUID <> G_stSelectEcuID then Exit;
//메모리 지움 데이터 영역
  st_MemoryClearResult.Caption := aData;
  st_MemoryClearResult.Color := clYellow;
end;

procedure TfmCurrentDeviceSetting.RecvFireRecovery(aECUID, aData: string);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  if aData = '' then Exit;

  if aData[1] = 'F' then
  begin
    st_FireResult.Caption := '화재복구 실패';
    st_FireResult.Color := clRed;
  end;
end;

procedure TfmCurrentDeviceSetting.RecvDeviceResetData(aECUID: string);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  st_DeviceResetResult.Caption := '리셋 성공';
  st_DeviceResetResult.Color := clYellow;
end;

procedure TfmCurrentDeviceSetting.Edit_LinkusTelChange(Sender: TObject);
begin
  inherited;
  L_bSettingChanged := True;

end;

procedure TfmCurrentDeviceSetting.ArmDSFormEnable(aValue: Boolean);
var
  i : integer;
  cmb_Box : TComboBox;
  nIndex : integer;
begin
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then Exit;
  for i := 1 to 8 do
  begin
    if i < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'cmb_ArmDSCheck',i)
    else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_ArmDSCheck',i);

    if cmb_Box <> nil then
    begin
      cmb_Box.Enabled := aValue;
      if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(i) then cmb_Box.Enabled := False;
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT812 then cmb_Box.Enabled := False;
      if (TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorLockType(i) <> 2) and
         (TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorLockType(i) <> 3) then cmb_Box.Enabled := False;  //데드볼트 락이 아니면 False
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.FormArmExtensionSetting(
  aSelectIndex: integer);
begin
  pan_ArmExtension.Visible := False;
  cmb_ArmExtensionSelect.Color := clWhite;
  if aSelectIndex = 1 then
  begin
    pan_ArmExtension.Visible := True;
    pan_ArmExtensionMessage.Caption := '메인에서 경계 하면 아래 체크되어 있는 로컬을 경계하는 기능입니다.';
  end else if aSelectIndex = 2 then
  begin
    pan_ArmExtension.Visible := True;
    pan_ArmExtensionMessage.Caption := '로컬이 경계 된 후 메인을 경계 시킬 수 있는 기능입니다.';
  end;

end;

procedure TfmCurrentDeviceSetting.Edit_LinkusIDKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'SYSTEM_ID',Edit_LinkusID.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'SYSTEM_ID','U');
    L_bSettingChanged := True;
  end;

end;

procedure TfmCurrentDeviceSetting.DoorUseChange(aEcuID, aDoorNo: string;
  aUse: Boolean);
var
  nIndex : integer;
  nDoorNo : integer;
  cmb_Box : TComboBox;
begin
  if aECUID <> G_stSelectEcuID then Exit;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then Exit;

  nDoorNo := strtoint(aDoorNo);
  if nDoorNo < 3 then cmb_Box := TravelComboBoxItem(gb_DoorInfo,'ComboBox_CardModeType',nDoorNo)
  else cmb_Box := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_CardModeType',nDoorNo);
  if cmb_Box <> nil then
  begin
    cmb_Box.Enabled := aUse;
    if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(nDoorNo) then cmb_Box.Enabled := False;
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorType(nDoorNo) = '0' then
    begin
      cmb_Box.Enabled := False; //방범전용에서는 Posi/Nega 동작 못하도록
      cmb_Box.ItemIndex := 0;
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.ZoneExtensionUseChange(aEcuID,
  aZoneExtendNo: string; aUse: Boolean);
var
  nDoorNo : integer;
begin
  if aECUID <> G_stSelectEcuID then Exit;
  if Not isDigit(aZoneExtendNo) then Exit;

end;

procedure TfmCurrentDeviceSetting.ed_alertLampTimeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Not isdigit(ed_alertLampTime.Text) then Exit;
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'ZONE_LAMPONTIME',ed_alertLampTime.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'ZONE_LAMPONTIME','U');
    L_bSettingChanged := True;
  end;

end;

procedure TfmCurrentDeviceSetting.ed_alertSirenTimeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Not isdigit(ed_alertSirenTime.Text) then Exit;
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'ZONE_SIRENONTIME',ed_alertSirenTime.Text);
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'ZONE_SIRENONTIME','U');
    L_bSettingChanged := True;
  end;

end;

procedure TfmCurrentDeviceSetting.SpinEdit_InDelayKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if L_nOldInDelay = SpinEdit_InDelay.IntValue then Exit;
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'IN_DELAY',inttostr(SpinEdit_InDelay.IntValue));
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'IN_DELAY','U');
    L_bSettingChanged := True;
  end;

end;

procedure TfmCurrentDeviceSetting.SpinEdit_InDelayMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if L_nOldInDelay = SpinEdit_InDelay.IntValue then Exit;
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'IN_DELAY',inttostr(SpinEdit_InDelay.IntValue));
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'IN_DELAY','U');
    L_bSettingChanged := True;
  end;

end;

procedure TfmCurrentDeviceSetting.SpinEdit_OutDelayMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if L_nOldOutDelay = SpinEdit_OutDelay.IntValue then Exit;
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'OUT_DELAY',inttostr(SpinEdit_OutDelay.IntValue));
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'OUT_DELAY','U');
    L_bSettingChanged := True;
  end;

end;

procedure TfmCurrentDeviceSetting.SpinEdit_OutDelayKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if L_nOldOutDelay = SpinEdit_OutDelay.IntValue then Exit;
  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_DEVICE_FieldName(G_stSelectEcuID,'OUT_DELAY',inttostr(SpinEdit_OutDelay.IntValue));
    dmDataBase.UpdateTB_DEVICERCV_FieldName(G_stSelectEcuID,'OUT_DELAY','U');
    L_bSettingChanged := True;
  end;

end;

procedure TfmCurrentDeviceSetting.SpinEdit_InDelayEnter(Sender: TObject);
begin
  inherited;
  L_nOldInDelay := SpinEdit_InDelay.IntValue;
end;

procedure TfmCurrentDeviceSetting.SpinEdit_InDelayMouseEnter(
  Sender: TObject);
begin
  inherited;
  L_nOldInDelay := SpinEdit_InDelay.IntValue;
end;

procedure TfmCurrentDeviceSetting.SpinEdit_OutDelayEnter(Sender: TObject);
begin
  inherited;
  L_nOldOutDelay := SpinEdit_OutDelay.IntValue;

end;

procedure TfmCurrentDeviceSetting.SpinEdit_OutDelayMouseEnter(
  Sender: TObject);
begin
  inherited;
  L_nOldOutDelay := SpinEdit_OutDelay.IntValue;

end;

procedure TfmCurrentDeviceSetting.DoorPossibilityChange(aEcuID,
  aDoorNO: string; aPossibility: Boolean);
begin
  if aEcuID <> G_stSelectEcuID then Exit;
  FormSystemDoorUsePossibilityEnable(aDoorNO,aPossibility);
  LockControlEnable(aDoorNO,aPossibility);
  FormRemoteControlDoorEnable(aDoorNO,aPossibility);
  FormStateDoorEnable(aDoorNO,aPossibility);
end;

procedure TfmCurrentDeviceSetting.FormRemoteControlDoorEnable(
  aDoorNO: string; aValue: Boolean);
var
  oGroupBox : TGroupBox;
  oButton : TRzBitBtn;
begin
  if Not isDigit(aDoorNO) then Exit;
  oGroupBox := TravelTGroupBoxTagItem(gb_DoorControl,strtoint(aDoorNO));
  if oGroupBox = nil then Exit;
  oGroupBox.Enabled := aValue;

  oButton := TravelRzBitBtnItem(oGroupBox,'btn_DoorOpen',strtoint(aDoorNO));
  if oButton <> nil then oButton.Enabled := aValue;
  oButton := TravelRzBitBtnItem(oGroupBox,'btn_DoorCloseMode',strtoint(aDoorNO));
  if oButton <> nil then oButton.Enabled := aValue;
  oButton := TravelRzBitBtnItem(oGroupBox,'btn_DoorOpenMode',strtoint(aDoorNO));
  if oButton <> nil then oButton.Enabled := aValue;

end;

procedure TfmCurrentDeviceSetting.FormStateDoorEnable(aDoorNO: string;
  aValue: Boolean);
var
  oComboBox : TComboBox;
begin
  if Not isDigit(aDoorNO) then Exit;
  oComboBox := TravelComboBoxItem(gb_LoackState,'cmb_COMNO',strtoint(aDoorNO));
  if oComboBox <> nil then oComboBox.Enabled := aValue;
  oComboBox := TravelComboBoxItem(gb_LoackState,'cmb_ExGnd',strtoint(aDoorNO));
  if oComboBox <> nil then oComboBox.Enabled := aValue;
  oComboBox := TravelComboBoxItem(gb_LoackState,'cmb_dsgnd',strtoint(aDoorNO));
  if oComboBox <> nil then oComboBox.Enabled := aValue;
  oComboBox := TravelComboBoxItem(gb_LoackState,'cmb_lsgnd',strtoint(aDoorNO));
  if oComboBox <> nil then oComboBox.Enabled := aValue; 
end;

procedure TfmCurrentDeviceSetting.FormSystemDoorUsePossibilityEnable(
  aDoorNO: string; aValue: Boolean);
var
  oComboBox : TComboBox;
begin
  if Not isDigit(aDoorNO) then Exit;
  if strtoint(aDoorNo) > FIXMAXDOORNO then Exit;
  oComboBox := TravelComboBoxItem(gb_SystemInfo,'ComboBox_DoorType',strtoint(aDoorNO));
  if oComboBox <> nil then oComboBox.Enabled := aValue;
  oComboBox := TravelComboBoxItem(gb_DoorAlarmArea,'cmbDoorAlarmArea',strtoint(aDoorNO));
  if oComboBox <> nil then
  begin
    oComboBox.Enabled := aValue;
    if Not chk_DoorArmAreaUse.Checked then oComboBox.Enabled := False;
  end;
end;

procedure TfmCurrentDeviceSetting.FormZoneExtendChangeCheck;
var
  i : integer;
  oComboBox : TComboBox;
  bDoorUsePossibility:Boolean;
begin
  //기본으로 존 확장기 사용 유무를 설정 후 초기 화면 구성 하자.
  for i := 1 to FIXMAXZONEEXTENDNO do
  begin
    bDoorUsePossibility := False;
    oComboBox := TravelComboBoxItem(gb_SystemZoneExtension,'cmb_SystemZoneExtensionUse',i);
    if oComboBox <> nil then
    begin
      if oComboBox.ItemIndex = 0 then bDoorUsePossibility := False
      else bDoorUsePossibility := True;
    end;
    DoorPossibilityChange(G_stSelectEcuID,inttostr(i + 2),bDoorUsePossibility);
  end;
end;

procedure TfmCurrentDeviceSetting.btn_ShortCheckClick(Sender: TObject);
begin
  inherited;
  st_LineShortCheck.Caption := '';
  st_LineShortCheck.Color := clWhite;
  dmSocket.LineShortCheck;

end;

procedure TfmCurrentDeviceSetting.RecvLineShortCheck(aECUID,
  aData: string);
begin
  st_LineShortCheck.Caption := aData;
  if Pos('OK',aData) > 0 then st_LineShortCheck.Color := clYellow
  else if Pos('NG',aData) > 0 then st_LineShortCheck.Color := clRed;
end;

procedure TfmCurrentDeviceSetting.ZoneExtentionPort_ShortOpenCheck(
  aData: string);
var
  stZoneState : string;
  i,j : integer;
  nIndex : integer;
  stZoneStateName : string;
  static_Text : TStaticText;
  oGroupBox : TGroupBox;
begin
  if Length(aData) < ((FIXMAXZONENO + 1) * FIXMAXZONEEXTENDNO) then Exit;
  Delete(aData,1,1); //Dummy Flag 삭제
  for i := 1 to FIXMAXZONEEXTENDNO do //존확장기 갯수만큼
  begin
    stZoneState := copy(aData,(i - 1) * (FIXMAXZONENO + 1) + 1,FIXMAXZONENO + 1);
    case i of
      1 : oGroupBox := gb_ZoneExtensionState1;
      2 : oGroupBox := gb_ZoneExtensionState2;
      3 : oGroupBox := gb_ZoneExtensionState3;
      4 : oGroupBox := gb_ZoneExtensionState4;
      5 : oGroupBox := gb_ZoneExtensionState5;
      6 : oGroupBox := gb_ZoneExtensionState6;
      7 : oGroupBox := gb_ZoneExtensionState7;
      8 : oGroupBox := gb_ZoneExtensionState8;
      else oGroupBox := nil;
    end;
    if oGroupBox = nil then continue;

    for j := 1 to FIXMAXZONENO do
    begin
      static_Text := TravelTStaticTextItem(oGroupBox,'st_ZoneState' + inttostr(i),j);
      if static_Text <> nil then
      begin
        static_Text.Color := clYellow;
        if j <= Length(stZoneState) then
        begin
          stZoneStateName := '';

          nIndex := ZoneStateCodeList.IndexOf(stZoneState[j]);
          if nIndex > -1 then
            stZoneStateName := ZoneStateNameList.Strings[nIndex]
          else stZoneStateName := stZoneState[j];
          static_Text.Caption := stZoneStateName;
          if stZoneState[j] = 'N' then static_Text.Color := clYellow
          else if UpperCase(stZoneState[j]) = 'U' then static_Text.Color := clWhite
          else static_Text.Color := clRed;
        end;
      end;
    end;

  end;
end;

function TfmCurrentDeviceSetting.ZoneExtentionPortStateCheck(
  aEcuID: string): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '존확장기 존 상태 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.ZoneExtentionPortStateCheck(aEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.cmb_WatchType11Click(Sender: TObject);
var
  nPortNo : integer;
  stStatusCode : string;
  cmb_Box : TComboBox;
  nWatchType : integer;
  stWatchTypeCode : string;
  nZoneArmArea : integer;
  nExtNo : integer;
begin

  if Not isDigit(TComboBox(Sender).Hint) then Exit;

  nExtNo := TComboBox(Sender).Tag;

  nPortNo := strtoint(TComboBox(Sender).Hint);

  cmb_Box := GetPortComboBox(nExtNo,nPortNo,'cmb_WatchType');
  nWatchType := 0;
  if cmb_Box <> nil then nWatchType := cmb_Box.ItemIndex;

  if copy(TComboBox(Sender).Name,1,Length('cmb_WatchType')) = 'cmb_WatchType' then
  begin
    if (nWatchType > 0) and (nWatchType < 5) then
    begin
      //24시간존 시 복구신호전송하자.
      if L_nOldWhatchType <> nWatchType then GetPortComboBox(nExtNo,nPortNo,'cmb_recorver').ItemIndex := 1;
    end else
    begin
      if L_nOldWhatchType <> nWatchType then GetPortComboBox(nExtNo,nPortNo,'cmb_recorver').ItemIndex := 0;
    end;
    L_nOldWhatchType := nWatchType;
  end;

  stWatchTypeCode := GetWatchTypeCode(nPortNo,nWatchType);
  nZoneArmArea := 1;
  cmb_Box := GetPortComboBox(nExtNo,nPortNo,'cmb_PortAlarmArea');
  if cmb_Box <> nil then nZoneArmArea := cmb_Box.ItemIndex + 1;


  if Not L_bTableLoading then
  begin
    dmDataBase.UpdateTB_ZONESETTING_FieldName(G_stSelectEcuID,inttostr(nExtNo),inttostr(nPortNo),'PORT_TYPE',inttostr(nWatchType));
    dmDataBase.UpdateTB_ZONESETTING_FieldName(G_stSelectEcuID,inttostr(nExtNo),inttostr(nPortNo),'PORT_RECORVER',inttostr(GetPortComboBox(nExtNo,nPortNo,'cmb_recorver').ItemIndex));
    dmDataBase.UpdateTB_ZONESETTING_FieldName(G_stSelectEcuID,inttostr(nExtNo),inttostr(nPortNo),'ZONEARMAREA',inttostr(nZoneArmArea));
    dmDataBase.UpdateTB_ZONESETTING_FieldName(G_stSelectEcuID,inttostr(nExtNo),inttostr(nPortNo),'PORT_ZONEUSE',inttostr(GetPortComboBox(nExtNo,nPortNo,'cmb_ZonUse').ItemIndex));


    dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nExtNo),inttostr(nPortNo),'PORT_TYPE','U');
    dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nExtNo),inttostr(nPortNo),'PORT_RECORVER','U');
    dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nExtNo),inttostr(nPortNo),'ZONEARMAREA','U');
    dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(G_stSelectEcuID,inttostr(nExtNo),inttostr(nPortNo),'PORT_ZONEUSE','U');
    L_bSettingChanged := True;

    if G_bRealRegist then
    begin
      ZoneExtensionPort_Registration(nExtNo);
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.cmb_WatchType11Enter(Sender: TObject);
begin
  L_nOldWhatchType := TcomboBox(Sender).ItemIndex;
end;

procedure TfmCurrentDeviceSetting.chk_AllClick(Sender: TObject);
begin
  inherited;
  if chk_All.Checked then lb_regEcucont.Caption := '등록갯수'
  else lb_regEcucont.Caption := '등록번호';
end;

function TfmCurrentDeviceSetting.CheckArmDsANDDeadBoltLockType(
  aDoorNo: integer): Boolean;
var
  oComboBox : TComboBox;
begin
  result := False;
  if aDoorNo < 3 then
     oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_LockType',aDoorNo)
  else oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_LockType',aDoorNo);

  if oComboBox = nil then Exit;
  if (oComboBox.ItemIndex <> 2) and
     (oComboBox.ItemIndex <> 3) then
  begin
    if aDoorNo < 3 then
       oComboBox := TravelComboBoxItem(gb_DoorInfo,'cmb_ArmDSCheck',aDoorNo)
    else oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'cmb_ArmDSCheck',aDoorNo);
    if oComboBox = nil then Exit;
    if oComboBox.ItemIndex = 1 then Exit;
  end;

  result := True;
end;

procedure TfmCurrentDeviceSetting.FormZoneUseEnable(aZoneExtNo,aZoneNo: integer;
  aZoneUse: Boolean);
var
  oComboBox : TComboBox;
begin
  oComboBox := GetPortComboBox(aZoneExtNo,aZoneNo,'cmb_WatchType');
  if oComboBox <> nil then oComboBox.Enabled := aZoneUse;
  oComboBox := GetPortComboBox(aZoneExtNo,aZoneNo,'cmb_WatchDelay');
  if oComboBox <> nil then oComboBox.Enabled := aZoneUse;
  oComboBox := GetPortComboBox(aZoneExtNo,aZoneNo,'cmb_recorver');
  if oComboBox <> nil then oComboBox.Enabled := aZoneUse;
  oComboBox := GetPortComboBox(aZoneExtNo,aZoneNo,'cmb_PortAlarmArea');
  if oComboBox <> nil then oComboBox.Enabled := aZoneUse;
  oComboBox := GetPortComboBox(aZoneExtNo,aZoneNo,'cmb_ZonUse');
  if oComboBox <> nil then oComboBox.Enabled := aZoneUse;

end;

function TfmCurrentDeviceSetting.JaejungDelayUse_Registration(
  aEcuID: string): Boolean;
var
  i : integer;
begin
  if cmb_JaejungDelayUse.ItemIndex < 0 then cmb_JaejungDelayUse.ItemIndex := 0;
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '재중지연시간 사용유무 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistJaejungDelayUse(aEcuID,inttostr(cmb_JaejungDelayUse.ItemIndex));
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.RcvJaejungDelayUse(aECUID,
  aData: string);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  if Not isdigit(aData) then Exit;
  cmb_JaejungDelayUse.ItemIndex := strtoint(aData);
  cmb_JaejungDelayUse.Color := clYellow;
end;

function TfmCurrentDeviceSetting.CheckJaejungDelayUse(aEcuID: string;
  aDirect: Boolean): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'JaejungDelayUse') = 'Y' then Exit;
  end;
  cmb_JaejungDelayUse.Color := clWhite;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '재중지연 사용유무 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.CheckJaejungDelayUse(aEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.CheckPortDelayTime(aExtNo:integer): Boolean;
var
  nPortNumber : integer;
  cmb_Box : TComboBox;
  i : integer;
begin
  result := True; //디폴트로 이상 없음
  nPortNumber := GetDeviceMaxPortNumber;
  for i:= 1 to nPortNumber do
  begin
    cmb_Box := GetPortComboBox(aExtNo,i,'cmb_WatchDelay');
    if cmb_Box <> nil then
    begin
      if cmb_Box.ItemIndex > 0 then   //지연시간 적용 시
      begin
        if (SpinEdit_OutDelay.IntValue = 0) and
           (SpinEdit_InDelay.IntValue = 0) then
        begin
          result := False;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.CurrentScheduleUseChange(aEcuID: string;
  aUsed: Boolean);
var
  i : integer;
  oComboBox : TComboBox;
  nIndex : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  nIndex := DeviceList.IndexOf(aEcuID);
  if nIndex < 0 then exit;
  
  for i := 1 to FIXMAXDOORNO do
  begin
    if i < 3 then
       oComboBox := TravelComboBoxItem(gb_DoorInfo,'ComboBox_UseSch',i)
    else oComboBox := TravelComboBoxItem(gb_DoorExtensionInfo,'ComboBox_UseSch',i);
    if oComboBox <> nil then
    begin
      oComboBox.Enabled := aUsed;
      //여기에서 미사용인 출입문이면 False 처리 하자
      if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(i) then oComboBox.Enabled := False;
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.CardTypeTimer1Timer(Sender: TObject);
var
  nIndex : integer;
begin
  inherited;
  CardTypeTimer1.Enabled := False;

  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  if nIndex < 0 then Exit;
  case TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType[1] of
      NOTHINGTYPE : st_CardType.Caption := '알수없음';
      AUTOKT811   : st_CardType.Caption := '무인국사';
      COMMON811   : st_CardType.Caption := '범용';
      KT811       : st_CardType.Caption := 'KT사옥';
      UNIVER811   : st_CardType.Caption := '대학용';
      MERGECARD   : st_CardType.Caption := '통합(16)';
  end;

end;

procedure TfmCurrentDeviceSetting.RcvJavaraArmClose(aECUID, aDoorNo,
  aData: string);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  if aData[1] = '1' then
    chk_ArmJavaraClose.Checked := True
  else chk_ArmJavaraClose.Checked := False;
end;

function TfmCurrentDeviceSetting.SearchJavaraArmClose(aEcuID: string;
  aDirect: Boolean): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'JavaraArmClose') = 'Y' then Exit;
  end;
  chk_ArmJavaraClose.Checked := False;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '경계시자바라닫힘 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.JavaraCloseSearch(aEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

function TfmCurrentDeviceSetting.RegistJavaraArmClose(aEcuID,
  aArmJavaraClose: string): Boolean;
var
  i : integer;
  nIndex : integer;
begin
  if Not isDigit(aEcuID) then exit;

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '경계시자바라닫힘 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegArmJavaraClose(aEcuID,aArmJavaraClose);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.RegistJavaraAutoClose(aEcuID,
  aJavaraAutoClose: string): Boolean;
var
  i : integer;
  nIndex : integer;
begin
  if Not isDigit(aEcuID) then exit;

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '자바라자동닫힘 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegJavaraAutoClose(aEcuID,aJavaraAutoClose);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.RcvJavaraAutoClose(aECUID, aDoorNo,
  aData: string);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  if aData[1] = '1' then
    chk_JavaraAutoClose.Checked := True
  else chk_JavaraAutoClose.Checked := False;

end;

function TfmCurrentDeviceSetting.SearchJavaraAutoClose(aEcuID: string;
  aDirect: Boolean): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'JavaraAutoClose') = 'Y' then Exit;
  end;
  chk_JavaraAutoClose.Checked := False;
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '자바라자동닫힘 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.JavaraAutoCloseSearch(aEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

procedure TfmCurrentDeviceSetting.DeviceRefresh;
begin
//  CurrentDeviceView;
//  DeviceLoad;
//  TreeView_DeviceClick(self);
  ActiveTimer.Enabled := True;
end;

procedure TfmCurrentDeviceSetting.CurrentDeviceCodeChange(aEcuID,aDeviceCode:string);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  FormDeviceSetting(G_stSelectEcuID);
//  st_DeviceCode.Caption := aDeviceCode;  //RecvDeviceCode 에서 설정 됨
end;


procedure TfmCurrentDeviceSetting.PortZoneUsedEnable(aValue: Boolean);
var
  i,j : integer;
  cmbBox : TComboBox;
  nIndex : integer;
  nPortNum : integer;
begin
  nIndex := DeviceList.IndexOf(G_stSelectEcuID);
  nPortNum := GetDeviceMaxPortNumber;
  for i := 0 to FIXMAXZONEEXTENDNO do
  begin
    if i > 0 then nPortNum := FIXMAXZONENO;
    for j := 1 to nPortNum do
    begin
      cmbBox := GetPortComboBox(i,j,'cmb_ZonUse');
      if cmbBox <> nil then
      begin
        cmbBox.Enabled := aValue;
      end;
    end;
    if nPortNum < FIXMAXZONENO then
    begin
      for j := nPortNum + 1 to FIXMAXZONENO do
      begin
        cmbBox := GetPortComboBox(i,j,'cmb_ZonUse');
        if cmbBox <> nil then
        begin
          cmbBox.Enabled := False;
        end;
      end;
    end;
  end;

end;

procedure TfmCurrentDeviceSetting.PortZoneUseSkillChange(aEcuID: string;
  aValue: Boolean);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  PortZoneUsedVisible(aValue);

end;

procedure TfmCurrentDeviceSetting.PortZoneUsedVisible(aValue: Boolean);
var
  i,j : integer;
  cmbBox : TComboBox;
  st_Text : TStaticText;
begin
  panPortZoneUsed0.Visible := aValue;
  panPortZoneUsed1.Visible := aValue;
  panPortZoneUsed2.Visible := aValue;
  panPortZoneUsed3.Visible := aValue;
  panPortZoneUsed4.Visible := aValue;
  panPortZoneUsed5.Visible := aValue;
  panPortZoneUsed6.Visible := aValue;
  panPortZoneUsed7.Visible := aValue;
  panPortZoneUsed8.Visible := aValue;

  for i := 0 to FIXMAXZONEEXTENDNO do
  begin
    for j := 1 to FIXMAXZONENO do
    begin
      cmbBox := GetPortComboBox(i,j,'cmb_ZonUse');
      if cmbBox <> nil then
      begin
        cmbBox.Visible := aValue;
      end;
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.ZoneExtensionConnectChange(aEcuID,
  aNo: string; aConnected: Boolean);
var
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
begin
  Exit;

end;

procedure TfmCurrentDeviceSetting.PortZoneUseRemoteControlSkill(
  aEcuID: string; aValue: Boolean);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  tabZoneUseControl.TabVisible := aValue;
end;

procedure TfmCurrentDeviceSetting.btn_ZoneUseControl1Click(Sender: TObject);
var
  stID : string;
begin
  inherited;
  stID := TRzBitBtn(Sender).Hint;
  if Length(stID) < 3 then Exit;
  if TRzBitBtn(Sender).Caption = StaticText164.Caption then
  begin
    if Application.MessageBox(pchar('존 미사용 변경시 센서 무감지 사고 발생할 수 있습니다. 계속 진행하시겠습니까?'),'주의',MB_OKCANCEL) = ID_CANCEL then Exit;
    dmSocket.ZoneUsedRemoteControl(G_stSelectEcuID,copy(stID,1,1),copy(stID,2,1),inttostr(StaticText164.Tag));
  end else if TRzBitBtn(Sender).Caption = StaticText165.Caption then
    dmSocket.ZoneUsedRemoteControl(G_stSelectEcuID,copy(stID,1,1),copy(stID,2,1),inttostr(StaticText165.Tag));
end;

procedure TfmCurrentDeviceSetting.RecvZoneUseRemoteControl(aECUID,
  aData: string);
var
  stExtNo : string;
  stZoneUseData : string;
  oStaticText : TStaticText;
  oRzBitBtn : TRzBitBtn;
  i : integer;
  nLen : integer;
begin
  if aECUID <> G_stSelectEcuID then Exit;
  stExtNo := copy(aData,2,2);
  stZoneUseData := copy(aData,5,8);
  nLen := length(stZoneUseData);
  for i := 1 to nLen do
  begin
    oRzBitBtn := TravelRzBitBtnItem(gb_ZoneUseRemoteControl,'btn_ZoneUseControl',strtoint(stExtNo + inttostr(i)));
    oRzBitBtn.Enabled := True;
    (*oStaticText := TravelTStaticTextItem(gb_ZoneUseRemoteControl,'st_ZoneUseControlState_',strtoint(stExtNo + inttostr(i)));
    if stZoneUseData[i] = '0' then oStaticText.Color := clYellow
    else if stZoneUseData[i] = '1' then oStaticText.Color := clGreen;  *)
    if stZoneUseData[i] = '0' then
    begin
      oRzBitBtn.Color := StaticText165.Color;
      oRzBitBtn.Caption := StaticText165.Caption;
    end else if stZoneUseData[i] = '1' then
    begin
      oRzBitBtn.Color := StaticText164.Color;
      oRzBitBtn.Caption := StaticText164.Caption;
    end else
    begin
      oRzBitBtn.Enabled := False;
      oRzBitBtn.Color := clWhite;
      oRzBitBtn.Caption := '미사용';
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.page_RemoteControlChange(
  Sender: TObject);
var
  i,j : integer;
  oRzBitBtn : TRzBitBtn;
begin
  inherited;
  if page_RemoteControl.ActivePage = tabZoneUseControl then
  begin
    for i := 0 to FIXMAXZONEEXTENDNO do
    begin
      for j := 1 to 8 do
      begin
        oRzBitBtn := TravelRzBitBtnItem(gb_ZoneUseRemoteControl,'btn_ZoneUseControl',strtoint(FillZeroNumber(i,2) + inttostr(j)));
        oRzBitBtn.Enabled := False;
        oRzBitBtn.Color := clWhite;
      end;
      dmSocket.ZoneUsedRemoteControlState(G_stSelectEcuID,inttostr(i));
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.JavaraScheduleSkillChange(aEcuID,
  aNo: string; aValue: Boolean);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  chk_ArmJavaraClose.Visible := aValue;
  chk_JavaraAutoClose.Visible := aValue;
end;

procedure TfmCurrentDeviceSetting.rb_DedicatedClick(Sender: TObject);
begin
  inherited;
  pan_KTTDetail.Visible := False;
end;

procedure TfmCurrentDeviceSetting.rb_tcpipClick(Sender: TObject);
begin
  inherited;
  pan_KTTDetail.Visible := True;
  btn_DetailKTTInfo.Visible := True; 
end;

procedure TfmCurrentDeviceSetting.rb_wcdmaClick(Sender: TObject);
begin
  inherited;
  pan_KTTDetail.Visible := True;
  btn_DetailKTTInfo.Visible := False;
end;

Function TfmCurrentDeviceSetting.CheckKTTMuxID(aDirect:Boolean=False):Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := 'MUX ID 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.KTTMuxID_Check;
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

function TfmCurrentDeviceSetting.CheckPrimaryKTT(aDirect:Boolean=False):Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  rb_Dedicated.Checked := False;
  rb_tcpip.Checked := False;
  rb_wcdma.Checked := False;
  
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '주통신 타입 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.PrimaryKTT_Check(aDirect);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

function TfmCurrentDeviceSetting.RegistKTTMuxID(aMuxID: string):Boolean;
var
  i : integer;
begin
  aMuxID := FillZeroStrNum(Trim(aMuxID),2);
  ed_Mux.Color := clWhite;

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '주통신 MUX ID 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.KTTMuxID_Registration(aMuxID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

function TfmCurrentDeviceSetting.RegistPrimaryKTT(aPrimaryKey: string):Boolean;
var
  i : integer;
begin
  rb_Dedicated.Checked := False;
  rb_tcpip.Checked := False;
  rb_wcdma.Checked := False;

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '주통신 타입 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.PrimaryKTT_Registration(aPrimaryKey);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

procedure TfmCurrentDeviceSetting.RcvKTTMuxID(aECUID, aCmd, aData: string);
begin
  ed_Mux.Text := Trim(aData);
  ed_Mux.Color := clYellow;
end;

procedure TfmCurrentDeviceSetting.RcvPrimaryKTTType(aECUID, aCmd,
  aData: string);
begin
  if Not isDigit(aData[1]) then Exit;

  if aData[1] = '1' then rb_Dedicated.Checked := True
  else if aData[1] = '2' then rb_tcpip.Checked := True
  else if aData[1] = '3' then rb_wcdma.Checked := True;

end;

procedure TfmCurrentDeviceSetting.btn_DetailKTTInfoClick(Sender: TObject);
begin
  inherited;
  if rb_tcpip.Checked then
  begin
    fmTCPIPDetail := TfmTCPIPDetail.Create(Self);
    fmTCPIPDetail.ECUID :='00';
    fmTCPIPDetail.ShowModal;
    fmTCPIPDetail.Free;
  end;
end;

procedure TfmCurrentDeviceSetting.RcvDDNSQueryServer(aECUID, aCmd,
  aData: string);
begin
  if L_bTcpIpDetailShow then
  begin
    fmTCPIPDetail.RcvKTTDDNSQueryCheck(aData);
  end;

end;

procedure TfmCurrentDeviceSetting.RcvDDNSServer(aECUID, aCmd,
  aData: string);
begin
  if L_bTcpIpDetailShow then
  begin
    fmTCPIPDetail.RcvKTTDDNSServerCheck(aData);
  end;

end;

procedure TfmCurrentDeviceSetting.RcvEventServer(aECUID, aCmd,
  aData: string);
begin
  if L_bTcpIpDetailShow then
  begin
    fmTCPIPDetail.RcvKTTEventServerCheck(aData);
  end;

end;

procedure TfmCurrentDeviceSetting.RcvTCPServerPort(aECUID, aCmd,
  aData: string);
begin
  if L_bTcpIpDetailShow then
  begin
    fmTCPIPDetail.RcvKTTServerPortCheck(aData);
  end;

end;

procedure TfmCurrentDeviceSetting.CommandArrayCommandsTDETAILVIEWExecute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
begin
  stValue := Params.Values['VALUE'];

  if stValue = 'TRUE' then L_bTcpIpDetailShow := True
  else L_bTcpIpDetailShow := False;
end;

procedure TfmCurrentDeviceSetting.btn_RegCheckTimeClick(Sender: TObject);
begin
  inherited;
  edPtDelayTime.Color := clWhite;
  RegistLineCheckTime('24');
  RegistLineCheckStart(edPtDelayTime.Text);
end;

function TfmCurrentDeviceSetting.RegistLineCheckStart(
  aStartTime: string): Boolean;
var
  i : integer;
begin
  aStartTime := FillZeroStrNum(aStartTime,2);
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '국선체크 시작시간 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistLineCheckStart(G_stSelectEcuID,aStartTime);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.RegistLineCheckTime(
  aTime: string): Boolean;
var
  i : integer;
begin
  aTime := FillZeroStrNum(aTime,2);
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '국선체크 시작시간 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistLineCheckTime(G_stSelectEcuID,aTime);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.RecvLineCheckStart(aECUID,
  aData: string);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  edPtDelayTime.text := aData;
  edPtDelayTime.Color := clYellow;
end;

procedure TfmCurrentDeviceSetting.btn_RemoteSendPacketClick(
  Sender: TObject);
begin
  inherited;
  if ed_RemoteCmd.Text = '' then
  begin
    showmessage('CMD 가 없습니다.');
    Exit;
  end;
  if ed_RemoteData.Text = '' then
  begin
    showmessage('DATA 가 없습니다.');
    Exit;
  end;
  dmSocket.DirectSendPacket(G_stSelectEcuID,ed_RemoteCmd.Text,ed_RemoteData.Text,True);
end;

procedure TfmCurrentDeviceSetting.PoliceDeviceTypeChange(aEcuID: string;
  aValue: Boolean);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  tab_Police.TabVisible := aValue;
end;

procedure TfmCurrentDeviceSetting.Form_AllPoliceTel_ColorInitialize;
begin
  ed_TelMonitorStartDelay1.Color := clWhite;
  ed_TelMonitorsendTime1.Color := clWhite;
  ed_TelMonitorsendCount1.Color := clWhite;
  cmb_TelMonitorsSpeaker1.Color := clWhite;
  cmb_TelMonitorCountTime1.Color := clWhite;
  cmb_TelMonitorDTMFStart1.Color := clWhite;
  cmb_TelMonitorDTMFEnd1.Color := clWhite;
  ed_TelMonitorNum1.Color := clWhite;

  ed_TelMonitorStartDelay2.Color := clWhite;
  ed_TelMonitorsendTime2.Color := clWhite;
  ed_TelMonitorsendCount2.Color := clWhite;
  cmb_TelMonitorsSpeaker2.Color := clWhite;
  cmb_TelMonitorCountTime2.Color := clWhite;
  cmb_TelMonitorDTMFStart2.Color := clWhite;
  cmb_TelMonitorDTMFEnd2.Color := clWhite;
  ed_TelMonitorNum2.Color := clWhite;

end;

procedure TfmCurrentDeviceSetting.PoliceTel_Registration(aTelno: integer);
var
  bResult : Boolean;
  i : integer;
  stSendData : string;
begin

  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;

  case aTelNo of
    1 : begin
        stSendData:= 'tn00'+ '00' ;
        stSendData := stSendData + ' ' + '17' ;
        stSendData := stSendData + ' ' + FillZeroStrNum(ed_TelMonitorStartDelay1.Text,3);  //음성시작전 대기시간
        stSendData := stSendData + ' ' + FillZeroStrNum(ed_TelMonitorsendTime1.Text,3);    //음성송출시간
        stSendData := stSendData + ' ' + FillZeroStrNum(ed_TelMonitorsendCount1.Text,3);    //음성송출횟수
        stSendData := stSendData + ' ' + inttostr(cmb_TelMonitorsSpeaker1.itemIndex);      // 스피커 OFF/ON
        if cmb_TelMonitorCountTime1.ItemIndex = 0 then stSendData := stSendData + ' ' + 'C'
        else stSendData := stSendData + ' ' + 'T' ;
        stSendData := stSendData + ' ' + inttostr(cmb_TelMonitorDTMFStart1.itemIndex);      // DTMF 수신시 시작
        stSendData := stSendData + ' ' + inttostr(cmb_TelMonitorDTMFEnd1.itemIndex);      // DTMF 수신시 종료
        stSendData := stSendData + ' ' + FillZeroNumber(Length(ed_TelMonitorNum1.Text),2) ;
        stSendData := stSendData + ' ' + ed_TelMonitorNum1.Text;
    end;
    2 : begin
        stSendData:= 'tn00'+ '01' ;
        stSendData := stSendData + ' ' + '17' ;
        stSendData := stSendData + ' ' + FillZeroStrNum(ed_TelMonitorStartDelay2.Text,3);  //음성시작전 대기시간
        stSendData := stSendData + ' ' + FillZeroStrNum(ed_TelMonitorsendTime2.Text,3);    //음성송출시간
        stSendData := stSendData + ' ' + FillZeroStrNum(ed_TelMonitorsendCount2.Text,3);    //음성송출횟수
        stSendData := stSendData + ' ' + inttostr(cmb_TelMonitorsSpeaker2.itemIndex);      // 스피커 OFF/ON
        if cmb_TelMonitorCountTime2.ItemIndex = 0 then stSendData := stSendData + ' ' + 'C'
        else stSendData := stSendData + ' ' + 'T' ;
        stSendData := stSendData + ' ' + inttostr(cmb_TelMonitorDTMFStart2.itemIndex);      // DTMF 수신시 시작
        stSendData := stSendData + ' ' + inttostr(cmb_TelMonitorDTMFEnd2.itemIndex);      // DTMF 수신시 종료
        stSendData := stSendData + ' ' + FillZeroNumber(Length(ed_TelMonitorNum2.Text),2) ;
        stSendData := stSendData + ' ' + ed_TelMonitorNum2.Text;
    end;
  end;
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '경찰청 전화번호' + inttostr(aTelNo) + ' 등록중입니다.';
      ProgressBar1.Position := i + 1;
      bResult := dmSocket.PoliceTel_Registration(G_stSelectEcuID,stSendData);
      if bResult then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
    if Not G_bApplicationTerminate then se_crCallTime.Enabled := True;
  End;

end;

procedure TfmCurrentDeviceSetting.RcvPoliceTelNum(aECUID: string;
  aTelNo: integer; aSoundNo, aStartDelay, aSendTime, aSendCount: string;
  aSpeak, aCountTime, aDTMFStart, aDTMFEnd: integer; aTelNum: string);
begin
  if aECUID <> G_stSelectEcuID then Exit;

  case aTelNo of
    0 : begin
        ed_TelMonitorSoundNo1.Color := clYellow;
        ed_TelMonitorSoundNo1.Text := aSoundNo;

        ed_TelMonitorStartDelay1.Color := clYellow;
        ed_TelMonitorStartDelay1.Text := aStartDelay;

        ed_TelMonitorsendTime1.Color := clYellow;
        ed_TelMonitorsendTime1.Text := aSendTime;

        ed_TelMonitorsendCount1.Color := clYellow;
        ed_TelMonitorsendCount1.Text := aSendCount;

        cmb_TelMonitorsSpeaker1.Color := clYellow;
        cmb_TelMonitorsSpeaker1.itemIndex := aSpeak;

        cmb_TelMonitorCountTime1.Color := clYellow;
        cmb_TelMonitorCountTime1.ItemIndex := aCountTime;

        cmb_TelMonitorDTMFStart1.Color := clYellow;
        cmb_TelMonitorDTMFStart1.itemIndex := aDTMFStart;

        cmb_TelMonitorDTMFEnd1.Color := clYellow;
        cmb_TelMonitorDTMFEnd1.itemIndex := aDTMFEnd;

        ed_TelMonitorNum1.Color := clYellow;
        ed_TelMonitorNum1.Text:= aTelNum;
    end;
    1 : begin
        ed_TelMonitorSoundNo2.Color := clYellow;
        ed_TelMonitorSoundNo2.Text := aSoundNo;

        ed_TelMonitorStartDelay2.Color := clYellow;
        ed_TelMonitorStartDelay2.Text := aStartDelay;

        ed_TelMonitorsendTime2.Color := clYellow;
        ed_TelMonitorsendTime2.Text := aSendTime;

        ed_TelMonitorsendCount2.Color := clYellow;
        ed_TelMonitorsendCount2.Text := aSendCount;

        cmb_TelMonitorsSpeaker2.Color := clYellow;
        cmb_TelMonitorsSpeaker2.itemIndex := aSpeak;

        cmb_TelMonitorCountTime2.Color := clYellow;
        cmb_TelMonitorCountTime2.ItemIndex := aCountTime;

        cmb_TelMonitorDTMFStart2.Color := clYellow;
        cmb_TelMonitorDTMFStart2.itemIndex := aDTMFStart;

        cmb_TelMonitorDTMFEnd2.Color := clYellow;
        cmb_TelMonitorDTMFEnd2.itemIndex := aDTMFEnd;

        ed_TelMonitorNum2.Color := clYellow;
        ed_TelMonitorNum2.Text:= aTelNum;
    end;
  end;
end;

function TfmCurrentDeviceSetting.PoliceTel_Check(aTelNo: integer): Boolean;
var
  i : integer;
  stSendData : string;
begin
  if Not dmSocket.NodeConnected then Exit;
  case aTelNo of
    1 : begin
        stSendData:= 'tn00'+ '00' ;
    end;
    2 : begin
        stSendData:= 'tn00'+ '01' ;
    end;
  end;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '경찰청 전화번호' + inttostr(aTelNo) + ' 조회중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.PoliceTel_Check(G_stSelectEcuID,stSendData);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.ServerCardNFSearch(aEcuID: string;
  aDirect: Boolean): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not dmSocket.DeviceConnectCheck(aEcuID) then exit;

  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'WATCH_POWER') = 'Y' then Exit;
  end;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '시스템정보 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.ServerCardNFSearch(aEcuID,True);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.RcvServerCardNF(aECUID, aCmd,
  aData: string);
begin
  if isdigit(aData) then
  begin
    cmb_ServerCardNF.ItemIndex := strtoint(aData);
    cmb_ServerCardNF.Color := clYellow;
  end;
end;

procedure TfmCurrentDeviceSetting.ServerCardNF_Registration;
var
  i : integer;
  bResult : Boolean;
begin

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '서버카드 정보 등록중입니다.';
      ProgressBar1.Position := i + 1;
      bResult := dmSocket.RegistServerCardNF(G_stSelectEcuID,
                         inttostr(cmb_ServerCardNF.ItemIndex));
      if bResult then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;


end;

function TfmCurrentDeviceSetting.SearchJavaraStopTime(aEcuID: string;
  aDirect: Boolean): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'JAVARASTOPTIME') = 'Y' then Exit;
  end;
  ed_OpenStop.Color := clWhite;
  ed_CloseStop.Color := clWhite;
  ed_StopDelay.Color := clWhite;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '자바라정지시간 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.JavaraStopTimeSearch(aEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

procedure TfmCurrentDeviceSetting.RcvJavaraStopTime(aECUID, aCmd,
  aData: string);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  ed_OpenStop.Text := copy(aData,1,3) + '00';
  ed_CloseStop.Text := copy(aData,4,3) + '00';
  ed_StopDelay.Text := copy(aData,7,3) + '00';
  ed_OpenStop.Color := clYellow;
  ed_CloseStop.Color := clYellow;
  ed_StopDelay.Color := clYellow;
end;

function TfmCurrentDeviceSetting.RegistJavaraStopTime(aEcuID,
  aData: string): Boolean;
var
  i : integer;
  nIndex : integer;
begin
  if Not isDigit(aEcuID) then exit;

  ed_OpenStop.Color := clWhite;
  ed_CloseStop.Color := clWhite;
  ed_StopDelay.Color := clWhite;
  
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '자바라정지시간 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistJavaraStopTime(aEcuID,aData);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

procedure TfmCurrentDeviceSetting.FormRemoteZoneExtVisible(aEcuID,
  aZoneExtNo: string; aZoneExtensionUse: Boolean);
var
  i : integer;
  oButton : TRzBitBtn;
begin
  if aECUID <> G_stSelectEcuID then Exit;
  if Not isdigit(aZoneExtNo) then Exit;
  for i := 1 to 8 do
  begin
    oButton := TravelRzBitBtnItem(gb_ZoneUseRemoteControl,'btn_ZoneUseControl',strtoint(aZoneExtNo) * 10 + i);
    if oButton <> nil then oButton.Visible := aZoneExtensionUse;
  end;

end;

procedure TfmCurrentDeviceSetting.RecvCardReaderSoundSetting(aECUID,
  aData: string);
var
  i : integer;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;

  if Length(Trim(aData)) > 1 then
  begin
    for i := 1 to Length(Trim(aData)) do
    begin
      CardReaderSoundUseSetting(aECUID,inttostr(i),aData[i],clYellow);
    end;
  end;
  L_bSettingChanged := False;

end;

procedure TfmCurrentDeviceSetting.CardReaderSoundUseSetting(aECUID,
  aReaderNo, aData: string; aColor: TColor);
var
  cmbBox : TComboBox;
begin
  if G_stSelectEcuID <> aEcuID then Exit;

  cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderSound' , strtoint(aReaderNo));
  if cmbBox <> nil then
  begin
    if isDigit(aData) then
    begin
       cmbBox.ItemIndex := strtoint(aData);
       cmbBox.Color := aColor;
    end;
  end;

end;

function TfmCurrentDeviceSetting.CardReaderSoundUseCheck(
  aDirect: Boolean): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;
  if Not isdigit(G_stSelectEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_READERSETTINGRCV_Value(G_stSelectEcuID,'0','1','READER_SOUND') = 'Y' then Exit;
  end;
  if (G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU100) or
     (G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU200) or
     (G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU300) then Exit; //KTT811System 이 아니면 빠져 나가자...
     
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '카드리더 음성송출사용유무 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.CardReaderSoundUse_Check(G_stSelectEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

function TfmCurrentDeviceSetting.RegistCardReaderSound(
  aEcuID: string): Boolean;
var
  i : integer;
  stSoundUseType : string;
begin
  if G_nProgramType = 1 then Exit;
  stSoundUseType := GetReaderSoundUseType;
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '카드리더 음성송출타입 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistCardReaderSound(aEcuID,stSoundUseType);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

function TfmCurrentDeviceSetting.GetReaderSoundUseType: string;
var
  i : integer;
  cmbBox : TComboBox;
begin
  result := '';
  for i := 1 to 8 do
  begin
    cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ReaderSound' ,i);
    if cmbBox <> nil then
    begin
      if cmbBox.ItemIndex < 0 then cmbBox.ItemIndex := 0;
      result := result + inttostr(cmbBox.ItemIndex);
    end else
    begin
      result := result + '0';
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.FormTimeCodeSetting(aEcuID: string;
  aTimeCodeRefresh: Boolean);
begin
  FormTimeCode_ColorInitialize;
end;

function TfmCurrentDeviceSetting.SearchDoorTimeCodeUse(aEcuID: string;
  aDirect: Boolean): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'DOOR_TIMECODEUSE') = 'Y' then Exit;
  end;
  chk_TimeDoor1.Checked := False;
  chk_TimeDoor2.Checked := False;
  chk_TimeDoor3.Checked := False;
  chk_TimeDoor4.Checked := False;
  chk_TimeDoor5.Checked := False;
  chk_TimeDoor6.Checked := False;
  chk_TimeDoor7.Checked := False;
  chk_TimeDoor8.Checked := False;
  gb_TimeCodeUse.Color := clBtnFace;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '타임코드 사용구분 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.SearchDoorTimeCodeUse(aEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;

end;

function TfmCurrentDeviceSetting.SearchTimeCode(aEcuID: string;
  aDirect: Boolean): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not isDigit(aEcuID) then Exit;
  if Not aDirect then
  begin
    if (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'TIMECODE01') = 'Y') and (dmDataBase.GetTB_DEVICERCV_Value(aEcuID,'TIMECODE02') = 'Y') then Exit;
  end;
  gb_TimeCodeUse.Color := clBtnFace;

  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '타임코드 체크중입니다.(1)';
      ProgressBar1.Position := i + 1;
      result := dmSocket.SearchTimeCode(aEcuID,'0');
      if result then Break;
    end;
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '타임코드 체크중입니다.(2)';
      ProgressBar1.Position := i + 1;
      result := dmSocket.SearchTimeCode(aEcuID,'1');
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

procedure TfmCurrentDeviceSetting.FormTimeCode_ColorInitialize;
begin
  gb_TimeCodeUse.Color :=  clBtnFace;
  gb_TimeCodeGroup.Color := clBtnFace;
  ed_TimeCode01Start.Color := clWhite;
  ed_TimeCode01End.Color := clWhite;
  ed_TimeCode02Start.Color := clWhite;
  ed_TimeCode02End.Color := clWhite;
  ed_TimeCode03Start.Color := clWhite;
  ed_TimeCode03End.Color := clWhite;
  ed_TimeCode04Start.Color := clWhite;
  ed_TimeCode04End.Color := clWhite;
  ed_TimeCode11Start.Color := clWhite;
  ed_TimeCode11End.Color := clWhite;
  ed_TimeCode12Start.Color := clWhite;
  ed_TimeCode12End.Color := clWhite;
  ed_TimeCode13Start.Color := clWhite;
  ed_TimeCode13End.Color := clWhite;
  ed_TimeCode14Start.Color := clWhite;
  ed_TimeCode14End.Color := clWhite;
end;

procedure TfmCurrentDeviceSetting.DoorTimeCodeUse_Registration;
var
  bResult : Boolean;
  i : integer;
  stPacketData : string;
begin

  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;

  stPacketData := '';
  if chk_TimeDoor1.Checked then stPacketData := stPacketData + '1'
  else stPacketData := stPacketData + '0';
  if chk_TimeDoor2.Checked then stPacketData := stPacketData + '1'
  else stPacketData := stPacketData + '0';
  if chk_TimeDoor3.Checked then stPacketData := stPacketData + '1'
  else stPacketData := stPacketData + '0';
  if chk_TimeDoor4.Checked then stPacketData := stPacketData + '1'
  else stPacketData := stPacketData + '0';
  if chk_TimeDoor5.Checked then stPacketData := stPacketData + '1'
  else stPacketData := stPacketData + '0';
  if chk_TimeDoor6.Checked then stPacketData := stPacketData + '1'
  else stPacketData := stPacketData + '0';
  if chk_TimeDoor7.Checked then stPacketData := stPacketData + '1'
  else stPacketData := stPacketData + '0';
  if chk_TimeDoor8.Checked then stPacketData := stPacketData + '1'
  else stPacketData := stPacketData + '0';

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '타임코드 사용유무 등록중입니다.';
      ProgressBar1.Position := i + 1;
      bResult := dmSocket.DoorTimeCodeUse_Registration(G_stSelectEcuID,stPacketData);
      if bResult then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
    if Not G_bApplicationTerminate then se_crCallTime.Enabled := True;
  End;

end;

procedure TfmCurrentDeviceSetting.TimeCode_Registration(aTimeGroup:string);
var
  bResult : Boolean;
  i : integer;
  stPacketData : string;
begin
  stPacketData := '';
  if aTimeGroup = '0' then
  begin
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode01Start.Text,4);
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode01End.Text,4);
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode02Start.Text,4);
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode02End.Text,4);
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode03Start.Text,4);
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode03End.Text,4);
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode04Start.Text,4);
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode04End.Text,4);
  end else if aTimeGroup = '1' then
  begin
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode11Start.Text,4);
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode11End.Text,4);
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode12Start.Text,4);
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode12End.Text,4);
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode13Start.Text,4);
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode13End.Text,4);
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode14Start.Text,4);
    stPacketData := stPacketData + FillZeroStrNum(ed_TimeCode14End.Text,4);
  end;
  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;

  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '타임코드 그룹 시간 등록중입니다.';
      ProgressBar1.Position := i + 1;
      bResult := dmSocket.TimeCode_Registration(G_stSelectEcuID,aTimeGroup,stPacketData);
      if bResult then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
    if Not G_bApplicationTerminate then se_crCallTime.Enabled := True;
  End;

end;

procedure TfmCurrentDeviceSetting.RcvDoorTimeCodeUse(aECUID, aVer,
  aData: string);
var
  stTemp : string;
begin
  if aECUID <> G_stSelectEcuID then Exit;
  gb_TimeCodeUse.Color := clYellow;
  stTemp := aData;
  if stTemp[1] = '1' then chk_TimeDoor1.Checked := True
  else chk_TimeDoor1.Checked := False;
  if stTemp[2] = '1' then chk_TimeDoor2.Checked := True
  else chk_TimeDoor2.Checked := False;
  if Length(stTemp) < 8 then Exit;
  if stTemp[3] = '1' then chk_TimeDoor3.Checked := True
  else chk_TimeDoor3.Checked := False;
  if stTemp[4] = '1' then chk_TimeDoor4.Checked := True
  else chk_TimeDoor4.Checked := False;
  if stTemp[5] = '1' then chk_TimeDoor5.Checked := True
  else chk_TimeDoor5.Checked := False;
  if stTemp[6] = '1' then chk_TimeDoor6.Checked := True
  else chk_TimeDoor6.Checked := False;
  if stTemp[7] = '1' then chk_TimeDoor7.Checked := True
  else chk_TimeDoor7.Checked := False;
  if stTemp[8] = '1' then chk_TimeDoor8.Checked := True
  else chk_TimeDoor8.Checked := False;
end;

procedure TfmCurrentDeviceSetting.RcvTimeCode(aECUID, aGroup,
  aData: string);
begin
  if aECUID <> G_stSelectEcuID then Exit;
  gb_TimeCodeUse.Color := clYellow;
  if aGroup = '0' then
  begin
    ed_TimeCode01Start.Color := clYellow;
    ed_TimeCode02Start.Color := clYellow;
    ed_TimeCode03Start.Color := clYellow;
    ed_TimeCode04Start.Color := clYellow;
    ed_TimeCode01End.Color := clYellow;
    ed_TimeCode02End.Color := clYellow;
    ed_TimeCode03End.Color := clYellow;
    ed_TimeCode04End.Color := clYellow;
    ed_TimeCode01Start.Text := copy(aData,1,4);
    ed_TimeCode01End.Text := copy(aData,5,4);
    ed_TimeCode02Start.Text := copy(aData,9,4);
    ed_TimeCode02End.Text := copy(aData,13,4);
    ed_TimeCode03Start.Text := copy(aData,17,4);
    ed_TimeCode03End.Text := copy(aData,21,4);
    ed_TimeCode04Start.Text := copy(aData,25,4);
    ed_TimeCode04End.Text := copy(aData,29,4);
  end else if aGroup = '1' then
  begin
    ed_TimeCode11Start.Color := clYellow;
    ed_TimeCode12Start.Color := clYellow;
    ed_TimeCode13Start.Color := clYellow;
    ed_TimeCode14Start.Color := clYellow;
    ed_TimeCode11End.Color := clYellow;
    ed_TimeCode12End.Color := clYellow;
    ed_TimeCode13End.Color := clYellow;
    ed_TimeCode14End.Color := clYellow;
    ed_TimeCode11Start.Text := copy(aData,1,4);
    ed_TimeCode11End.Text := copy(aData,5,4);
    ed_TimeCode12Start.Text := copy(aData,9,4);
    ed_TimeCode12End.Text := copy(aData,13,4);
    ed_TimeCode13Start.Text := copy(aData,17,4);
    ed_TimeCode13End.Text := copy(aData,21,4);
    ed_TimeCode14Start.Text := copy(aData,25,4);
    ed_TimeCode14End.Text := copy(aData,29,4);
  end;
end;

procedure TfmCurrentDeviceSetting.CardReaderExitSoundUseSetting(aECUID,
  aReaderNo, aData: string; aColor: TColor);
var
  cmbBox : TComboBox;
begin
  if G_stSelectEcuID <> aEcuID then Exit;

  cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ExitSound' , strtoint(aReaderNo));
  if cmbBox <> nil then
  begin
    if isDigit(aData) then
    begin
       cmbBox.ItemIndex := strtoint(aData);
       cmbBox.Color := aColor;
    end;
  end;
end;

function TfmCurrentDeviceSetting.GetReaderExitSoundUseType: string;
var
  i : integer;
  cmbBox : TComboBox;
begin
  result := '';
  for i := 1 to 8 do
  begin
    cmbBox := TravelComboBoxItem(gb_CardReader,'cmb_ExitSound' ,i);
    if cmbBox <> nil then
    begin
      if cmbBox.ItemIndex < 0 then cmbBox.ItemIndex := 0;
      result := inttostr(cmbBox.ItemIndex) + result;
    end else
    begin
      result := '0' + result;
    end;
  end;
end;

procedure TfmCurrentDeviceSetting.RecvCardReaderExitSoundSetting(aECUID,
  aData: string);
var
  i : integer;
  stData : string;
begin
  if Not isDigit(aEcuID) then Exit;
  if G_stSelectEcuID <> aEcuID then Exit;
  stData := HexToBinary(aData);

  if Length(Trim(stData)) > 1 then
  begin
    for i := 1 to Length(Trim(stData)) do
    begin
      CardReaderExitSoundUseSetting(aECUID,inttostr(i),stData[9-i],clYellow);
    end;
  end;
  L_bSettingChanged := False;
end;

function TfmCurrentDeviceSetting.RegistCardReaderExitSound(
  aEcuID: string): Boolean;
var
  i : integer;
  stExitSoundUseType : string;
begin
  if G_nProgramType = 1 then Exit;
  stExitSoundUseType := GetReaderExitSoundUseType;
  stExitSoundUseType := BinaryToHex(stExitSoundUseType);
  Try
    pan_Message.Color := L_cRegColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '카드리더 퇴실음성 타입 등록중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.RegistCardReaderExitSound(aEcuID,stExitSoundUseType);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

function TfmCurrentDeviceSetting.CardReaderExitSoundUseCheck(
  aDirect: Boolean): Boolean;
var
  i : integer;
begin
  if Not dmSocket.NodeConnected then Exit;
  if Not dmSocket.DeviceConnectCheck(G_stSelectEcuID) then exit;
  if Not isdigit(G_stSelectEcuID) then Exit;
  if Not aDirect then
  begin
    if dmDataBase.GetTB_READERSETTINGRCV_Value(G_stSelectEcuID,'0','1','EXIT_SOUND') = 'Y' then Exit;
  end;
  if (G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU100) or
     (G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU200) or
     (G_stDeviceType[strtoint(G_stSelectEcuID)] = ICU300) then Exit; //KTT811System 이 아니면 빠져 나가자...
     
  Try
    pan_Message.Color := L_cSearchColor;
    pan_Message.Visible := True;
    ProgressBar1.Max := G_nLoopCount + 1;
    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      pan_Message.Caption := '카드리더 음성송출사용유무 체크중입니다.';
      ProgressBar1.Position := i + 1;
      result := dmSocket.CardReaderExitSoundUse_Check(G_stSelectEcuID);
      if result then Break;
    end;
  Finally
    if Not G_bApplicationTerminate then pan_Message.Visible := False;
  End;
end;

procedure TfmCurrentDeviceSetting.SetSocketConnected(const Value: Boolean);
begin
  FSocketConnected := Value;
  if G_nConnectMode = 0 then rg_LanSet.Enabled := False
  else rg_LanSet.Enabled := True;
end;

procedure TfmCurrentDeviceSetting.cmb_ReaderType1Enter(Sender: TObject);
begin
  inherited;
  TComboBox(Sender).Width :=200;
end;

procedure TfmCurrentDeviceSetting.cmb_ReaderType1Exit(Sender: TObject);
begin
  inherited;
  TComboBox(Sender).Width :=100;
end;

initialization
  RegisterClass(TfmCurrentDeviceSetting);
Finalization
  UnRegisterClass(TfmCurrentDeviceSetting);

end.

