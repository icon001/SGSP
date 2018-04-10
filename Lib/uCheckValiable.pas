unit uCheckValiable;

interface
const
  ALARMCONTROL = 1;           //알람제어
  ALARMSTATECHECK = 2;        //방범상태체크
  ALERTLAMPSIREN = 3;             //비상알람시램프사이렌
  ALERTLAMPTIME = 4;             //
  ALERTSIRENTIME = 5;             //
  ARMDSCHECK = 6;            //경계시 DS체크
  ARMRELAYTYPE = 7;          //경계시 릴레이타입
  CARDDOWNLOADACK = 8;          //카드다운로드
  CARDLIST = 10;              //등록카드리스트
  CARDLISTCANCEL = 11;        //카드리스트 조회 취소
  CARDREADERCALLTIME = 12;            //카드리더 통화시간
  CARDREADERINFO = 13;        //카드리더 정보
  CARDREADERSOUNDUSE = 14;    //카드리더 음성송출유무
  CARDREADERTELNUMBERCHECK = 15;            //카드리더 전화번호 체크
  CARDREADERTYPE = 16;        //카드리더 타입
  CARDREADERVERSION = 17;     //카드리더 버젼정보
  conARMAREAUSE = 18;          //방범구역 사용 유무
  conCARDREADERExitSOUNDUSE = 19;    //카드리더 퇴실음성송출유무
  conCARDREADERSTATE = 20;     //카드리더 통신상태
  conCARDRegCardCnt = 21;              //등록카드리스트
  conCCCInfoCHECK = 22;           //CCC 정보 체크
  conCCCStartTimeCheck = 23;
  conCCCTimeIntervalCheck = 24;
  conDDNSQueryServer = 30;
  conDDNSServer = 31;
  conDOORARMAREA = 32;          //출입문 방범구역
  conDOORDSCHECKTIME = 33;      //데드볼트시 문검사 수행시 검사 시간
  conDOORDSCHECKUSE = 34;      //데드볼트시 문검사 항상수행 여부
  conDoorTimeCodeUse = 35;     //타임코드 사용유무
  conExtentionVERSION = 36; //존 확장기 버젼정보
  conEventServer = 37;
  conKTTMUXID = 40;               //Mux ID
  conLineCheckStart = 41;
  conLineCheckTime = 42;
  conLineShortCheck = 43;      //선로 쇼트 체크
  conMaxCardCountCheck = 44;      //최종 카드번지
  conJaeJungDlayUseCheck = 45;      //재중 딜레이 체크
  conJavaraArmClose = 46;      //자바라경계시닫힘
  conJavaraAutoClose = 47;      //자바라자동닫힘
  conJavaraSchedule = 48;      //자바라 스케줄
  conJavaraStopTime = 49;      //자바라스톱시간
  conPrimaryKTTType = 60;         //주통신 타입
  conPoliceTel = 61;
  conServerCardNF = 62;
  conTCPServerPort = 63;
  conTimeCode = 64;
  conRegisterClear = 65;      //메모리지움 제어
  conZoneExtensionPortInfo = 70;   //감지기존 설정
  conZoneExtensionUse = 71;      //존확장기 사용유무
  conZONEEXTENTIONNETWORK = 72;     //존확장기 통신상태
  conZONEUSEDREMOTECONTROL = 73;     //존확장기 통신상태
  DEVICECODECHECK = 74;        //기기코드 조회
  DEVICERESET = 75;           //컨트롤러 리셋
  DEVICETYPECHECK = 76;        //ECU/ICU Check
  DEVICEVERSIONCHECK = 77;     //기기버젼체크
  DOORCONTROL = 78;           //출입문제어
  DOORSTATECHECK = 79;        //출입문상태체크
  DOORSYSTEMCHECK = 80;        //출입문시스템체크
  DVRInfoCHECK = 81;            //DVR정보
  ECUSTATE = 90;              //확장기 통신상태
  FIRERECOVERY = 91;          //화재복구
  FTPFUNCTION = 92;               //FTP기능 체크
  HOLIDAY = 93;               //특정일
  IDCHECK = 94;                //ID Check
  KTTRINGCOUNT = 95;             //관제데코더전화번호
  KTTSYSTEMID = 96;           //관제시스템아이디
  KTTTELNUM = 97;             //관제데코더전화번호
  LOCKSTATECHECK = 100;        //락 상태 체크
  MACINFO = 101;
  MAINTOLOCALARM = 102;            //메인에서 로컬 경계시키는 기능
  MAINFROMLOCALARM = 103;          //로컬이 경계 된 후 메인이 경계 되는 기능
  PORTSTATE = 104;             //현재 포트의 쇼트/단선체크
  RELAY2TYPE = 105;                //812 출입문 2 사용여부
  SCHEDULE = 106;              //스케줄 조회
  SERIALWIZNET = 107;           //랜정보
  SYSINFOCHECK = 110;           //시스템정보
  SYSTEMFUNCTION = 111;            //기기기능 체크
  TIME = 112;                  //시간
  USECDMACHECK = 113;          //CDMA사용 유무 체크
  USEDEVICECHECK = 114;         //사용확장기체크
  USEDVRCHECK = 115;            //DVR사용 유무 체크
  WIZNETMODULECHECK = 116;     //랜모듈 정보
  ZONESENSECHECK = 117;        //알람 상태 체크


var
  G_bResponseChecking : Boolean; //현재 응답 대기 중인지 여부 - 대기중이면 패킷 송신을 보류 하자
  G_bDeviceResponse: Array [0..200] of Boolean; //기기 설정 정보 응답 여부
  G_bCardReaderResponse: Array [0..512] of Boolean; //카드리더 정보 응답 여부
  G_bCardReaderVersionResponse: Array [0..512] of Boolean; //카드리더 정보 응답 여부
  G_bExtentionVersionResponse: Array [0..512] of Boolean; //존확장기 정보 응답 여부
  G_bPortResponse: Array [0..768] of Boolean; //포트 정보 응답 여부
  G_stDeviceType: Array [0..200] of string; //기기 타입

implementation

end.
