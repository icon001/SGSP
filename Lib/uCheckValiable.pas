unit uCheckValiable;

interface
const
  ALARMCONTROL = 1;           //�˶�����
  ALARMSTATECHECK = 2;        //�������üũ
  ALERTLAMPSIREN = 3;             //���˶��÷������̷�
  ALERTLAMPTIME = 4;             //
  ALERTSIRENTIME = 5;             //
  ARMDSCHECK = 6;            //���� DSüũ
  ARMRELAYTYPE = 7;          //���� ������Ÿ��
  CARDDOWNLOADACK = 8;          //ī��ٿ�ε�
  CARDLIST = 10;              //���ī�帮��Ʈ
  CARDLISTCANCEL = 11;        //ī�帮��Ʈ ��ȸ ���
  CARDREADERCALLTIME = 12;            //ī�帮�� ��ȭ�ð�
  CARDREADERINFO = 13;        //ī�帮�� ����
  CARDREADERSOUNDUSE = 14;    //ī�帮�� ������������
  CARDREADERTELNUMBERCHECK = 15;            //ī�帮�� ��ȭ��ȣ üũ
  CARDREADERTYPE = 16;        //ī�帮�� Ÿ��
  CARDREADERVERSION = 17;     //ī�帮�� ��������
  conARMAREAUSE = 18;          //������� ��� ����
  conCARDREADERExitSOUNDUSE = 19;    //ī�帮�� ���������������
  conCARDREADERSTATE = 20;     //ī�帮�� ��Ż���
  conCARDRegCardCnt = 21;              //���ī�帮��Ʈ
  conCCCInfoCHECK = 22;           //CCC ���� üũ
  conCCCStartTimeCheck = 23;
  conCCCTimeIntervalCheck = 24;
  conDDNSQueryServer = 30;
  conDDNSServer = 31;
  conDOORARMAREA = 32;          //���Թ� �������
  conDOORDSCHECKTIME = 33;      //���庼Ʈ�� ���˻� ����� �˻� �ð�
  conDOORDSCHECKUSE = 34;      //���庼Ʈ�� ���˻� �׻���� ����
  conDoorTimeCodeUse = 35;     //Ÿ���ڵ� �������
  conExtentionVERSION = 36; //�� Ȯ��� ��������
  conEventServer = 37;
  conKTTMUXID = 40;               //Mux ID
  conLineCheckStart = 41;
  conLineCheckTime = 42;
  conLineShortCheck = 43;      //���� ��Ʈ üũ
  conMaxCardCountCheck = 44;      //���� ī�����
  conJaeJungDlayUseCheck = 45;      //���� ������ üũ
  conJavaraArmClose = 46;      //�ڹٶ���ô���
  conJavaraAutoClose = 47;      //�ڹٶ��ڵ�����
  conJavaraSchedule = 48;      //�ڹٶ� ������
  conJavaraStopTime = 49;      //�ڹٶ���ð�
  conPrimaryKTTType = 60;         //����� Ÿ��
  conPoliceTel = 61;
  conServerCardNF = 62;
  conTCPServerPort = 63;
  conTimeCode = 64;
  conRegisterClear = 65;      //�޸����� ����
  conZoneExtensionPortInfo = 70;   //�������� ����
  conZoneExtensionUse = 71;      //��Ȯ��� �������
  conZONEEXTENTIONNETWORK = 72;     //��Ȯ��� ��Ż���
  conZONEUSEDREMOTECONTROL = 73;     //��Ȯ��� ��Ż���
  DEVICECODECHECK = 74;        //����ڵ� ��ȸ
  DEVICERESET = 75;           //��Ʈ�ѷ� ����
  DEVICETYPECHECK = 76;        //ECU/ICU Check
  DEVICEVERSIONCHECK = 77;     //������üũ
  DOORCONTROL = 78;           //���Թ�����
  DOORSTATECHECK = 79;        //���Թ�����üũ
  DOORSYSTEMCHECK = 80;        //���Թ��ý���üũ
  DVRInfoCHECK = 81;            //DVR����
  ECUSTATE = 90;              //Ȯ��� ��Ż���
  FIRERECOVERY = 91;          //ȭ�纹��
  FTPFUNCTION = 92;               //FTP��� üũ
  HOLIDAY = 93;               //Ư����
  IDCHECK = 94;                //ID Check
  KTTRINGCOUNT = 95;             //�������ڴ���ȭ��ȣ
  KTTSYSTEMID = 96;           //�����ý��۾��̵�
  KTTTELNUM = 97;             //�������ڴ���ȭ��ȣ
  LOCKSTATECHECK = 100;        //�� ���� üũ
  MACINFO = 101;
  MAINTOLOCALARM = 102;            //���ο��� ���� ����Ű�� ���
  MAINFROMLOCALARM = 103;          //������ ��� �� �� ������ ��� �Ǵ� ���
  PORTSTATE = 104;             //���� ��Ʈ�� ��Ʈ/�ܼ�üũ
  RELAY2TYPE = 105;                //812 ���Թ� 2 ��뿩��
  SCHEDULE = 106;              //������ ��ȸ
  SERIALWIZNET = 107;           //������
  SYSINFOCHECK = 110;           //�ý�������
  SYSTEMFUNCTION = 111;            //����� üũ
  TIME = 112;                  //�ð�
  USECDMACHECK = 113;          //CDMA��� ���� üũ
  USEDEVICECHECK = 114;         //���Ȯ���üũ
  USEDVRCHECK = 115;            //DVR��� ���� üũ
  WIZNETMODULECHECK = 116;     //����� ����
  ZONESENSECHECK = 117;        //�˶� ���� üũ


var
  G_bResponseChecking : Boolean; //���� ���� ��� ������ ���� - ������̸� ��Ŷ �۽��� ���� ����
  G_bDeviceResponse: Array [0..200] of Boolean; //��� ���� ���� ���� ����
  G_bCardReaderResponse: Array [0..512] of Boolean; //ī�帮�� ���� ���� ����
  G_bCardReaderVersionResponse: Array [0..512] of Boolean; //ī�帮�� ���� ���� ����
  G_bExtentionVersionResponse: Array [0..512] of Boolean; //��Ȯ��� ���� ���� ����
  G_bPortResponse: Array [0..768] of Boolean; //��Ʈ ���� ���� ����
  G_stDeviceType: Array [0..200] of string; //��� Ÿ��

implementation

end.
