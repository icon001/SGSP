unit u812Firmware;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls, Buttons, RzButton, RzCmboBx, RzLabel,
  ExtCtrls, RzPanel, RzRadGrp,iniFiles, Menus;


type
  Tfm812Firmware = class(TForm)
    GroupBox1: TGroupBox;
    RzLabel41: TRzLabel;
    btnClose: TRzBitBtn;
    btnFirmwareUpdate: TRzBitBtn;
    ed_FirmwareFile: TEdit;
    btn_FileSearch: TBitBtn;
    GroupBox2: TGroupBox;
    Gauge_812F00: TGauge;
    lb_gauge: TLabel;
    Group_812: TRzCheckGroup;
    SaveDialog1: TSaveDialog;
    Ktt812FirmwareDownloadStart: TTimer;
    KTT812ENQTimer: TTimer;
    Memo1: TMemo;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    MessageTimer: TTimer;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Group_812Change(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure btnFirmwareUpdateClick(Sender: TObject);
    procedure btn_FileSearchClick(Sender: TObject);
    procedure Ktt812FirmwareDownloadStartTimer(Sender: TObject);
    procedure KTT812ENQTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure MessageTimerTimer(Sender: TObject);
  private
    L_cKTT812Firmware : Array[0..256 * 1024] of char;
    L_stKTT812OFFSET : string;
    L_nLastPage : integer;
    L_bENQStop : Boolean;
    L_bMainFirmWareDownLoadFail : Boolean;

    KTT812FIRMWARECMDList:TStringList;
    KTT812DownloadList : TStringList;
    { Private declarations }
    procedure Ecu_GroupCreate;
    function CheckArmMode:Boolean;
    Function KTT812FileLoad(aFileName:string):Boolean;
    procedure KTT812FirmWareMemoryClear;
    Function KTT812FirmWareMemorySave(aData:string):Boolean;
    Function KTT812MemoryFileSave:Boolean;
    procedure KTT812MainControlerFirmWareUpdate;
    function KTT812FirmWareStart:Boolean;
    function GetKTT812FlashDataLen : integer;
    procedure BroadKTT812FileDownLoad;
    procedure FirmwareUpdateEnd;
    procedure KTT812ExtendBroadCastStart(a812ControlerNum:string);
    Function Get812ControlerNum(CheckGroup:TRZCheckGroup):String;
    procedure DeviceFirmWareDownloadComplete(aEcuID:string);
    procedure DeviceFirmWareDownloadFailed(aEcuID,aFailState:string);
  public
    { Public declarations }
    procedure ProcessKTT812FlashData(aData:string);
    procedure ProcessKTT812FlashDataEnd;
    procedure ProcessKTT812EcuFirmWareDownloadComplete(aECUID:string);
    procedure ProcessKTT812EcuFirmWareDownloadFailed(aECUID,aFailState:string);
    procedure GageMonitor(aEcuID,aPacketData:string);
  end;

var
  fm812Firmware: Tfm812Firmware;

implementation
uses
  uUtil,
  dllFunction,
  uCommon,
  uSocket,
  uMain;

{$R *.dfm}

procedure Tfm812Firmware.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfm812Firmware.Ecu_GroupCreate;
var
  i : integer;
  nIndex : integer;
begin
  Group_812.Items.Clear;
  for I:= 0 to 15 do
  begin
    Group_812.Items.Add(FillZeroNumber(i,2));
    nIndex := DeviceList.IndexOf(FillZeroNumber(i,2));
    if nIndex > -1 then
    begin
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
      begin
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).Connected then
        begin
          if i <> 0 then
            Group_812.ItemChecked[i]:= True;
        end; 
      end;
    end;
  end;
  Group_812.ItemChecked[0]:= True;

end;

procedure Tfm812Firmware.FormCreate(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  Ecu_GroupCreate;
  
  KTT812FIRMWARECMDList := TStringList.Create;
  KTT812DownloadList := TStringList.Create;
  fmMain.L_bKTT812FirmwareDownLoadShow := True;
  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\ztcs.INI');
    ed_FirmwareFile.Text := ini_fun.ReadString('812FirmWare','FileName','');
  Finally
    ini_fun.Free;
  End;
  if FileExists(ed_FirmwareFile.Text) then btnFirmwareUpdate.Enabled := True;
end;

procedure Tfm812Firmware.Group_812Change(Sender: TObject; Index: Integer;
  NewState: TCheckBoxState);
var
  nIndex : integer;
  bChek : Boolean;
  i : integer;
begin
  if Index = 0 then
  begin
//    if Not G_b812MainFirmWareDownloadComplete then
//       Group_812.ItemChecked[Index]:= True;
{    if Group_812.ItemChecked[Index] then
    begin
      for i := 1 to Group_812.Items.Count - 1 do
      begin
        if Group_812.ItemChecked[i] then bChek := True;
        Group_812.ItemChecked[i]:= False;
      end;
    end;  }
  end else
  begin
    if NewState = cbUnchecked then Exit;
    nIndex := DeviceList.IndexOf(FillZeroNumber(Index,2));
    if nIndex < 0 then
    begin
      Group_812.ItemChecked[Index]:= False;
      showmessage('등록되지 않은 컨트롤러입니다.');
      Exit;
    end;
    {if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).Connected then
    begin
      Group_812.ItemChecked[Index]:= False;
      showmessage('해당 컨트롤러는 통신연결 상태가 아닙니다.');
      Exit;
    end;}
    if (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT811) or
       (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = ICU100) or
       (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = ICU200) or
       (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = ACC100) then
    begin
      Group_812.ItemChecked[Index]:= False;
      showmessage('KTT811G 컨트롤러가 아닙니다.');
      Exit;
    end;
    if Group_812.ItemChecked[Index] then
    begin
      {if Group_812.ItemChecked[0] then
      begin
        Group_812.ItemChecked[0] := False;
        bChek := True;
      end; }
    end;
  end;
  //if bChek then showmessage('주장치와 가입자확장기는 동시에 업그레이드 할 수 없습니다.' + #13 + '가입자확장기는 주장치 펌웨어 업그레이드 후 진행하여 주세요'); 

end;

procedure Tfm812Firmware.btnFirmwareUpdateClick(Sender: TObject);
var
  bArmMode : Boolean;
  i : integer;
  bFirmwareStart : Boolean;
  st812ControlerNum : string;
begin
  //bArmMode := CheckArmMode;
  btnFirmwareUpdate.Enabled := False;
  {if bArmMode then
  begin
    showmessage('경계중인 컨트롤러가 있습니다.펌웨어 업데이트를 진행 하시려면 모든 컨트롤러를 해제모드로 변경 하셔야 합니다.');
    btnFirmwareUpdate.Enabled := True;
    Exit;
  end; }
  if Not FileExists(ed_FirmwareFile.Text) then
  begin
    showmessage('파일이 존재하지 않습니다.');
    btnFirmwareUpdate.Enabled := True;
    Exit;
  end;
  if Not KTT812FileLoad(ed_FirmwareFile.Text) then
  begin
    showmessage('메모리 로드에 실패 했습니다.');
    btnFirmwareUpdate.Enabled := True;
    Exit;
  end;

  btnClose.Enabled := False;
  GroupBox1.Enabled := False;
  MessageTimer.Enabled := True;

  if Group_812.ItemChecked[0] then
  begin
    L_bMainFirmWareDownLoadFail := False;
    KTT812MainControlerFirmWareUpdate;
    Delay(1000);

    for i := 0 to 10 do
    begin
      if L_bMainFirmWareDownLoadFail then Exit;
      bFirmwareStart := KTT812FirmWareStart;
      if bFirmwareStart then break;
      KTT812MainControlerFirmWareUpdate;//STX 전문을 다시 한번 전송
      Delay(1000);
    end;
    if Not bFirmwareStart then
    begin
      showmessage('Firmware 가능 버젼인지 확인 하여 주세요.');
      FirmwareUpdateEnd;
    end;
  end else
  begin
    fmMain.ReconnectSocketTimer.Enabled := True;
    st812ControlerNum := Get812ControlerNum(Group_812);
    dmSocket.KTT812BroadFirmWareStarting := False; //한번이라도 응답 오면 성공한것임
    KTT812ExtendBroadCastStart(st812ControlerNum);
  end;

end;

procedure Tfm812Firmware.btn_FileSearchClick(Sender: TObject);
begin
  SaveDialog1.Title:= 'FTP 다운로드 파일 찾기';
  SaveDialog1.DefaultExt:= '';
  SaveDialog1.Filter := 'HEX files (*.hex)|*.hex';
  if SaveDialog1.Execute then
  begin
    ed_FirmwareFile.Text := SaveDialog1.FileName;
    btnFirmwareUpdate.Enabled := True;
  end;

end;

function Tfm812Firmware.CheckArmMode: Boolean;
var
  i : integer;
  nIndex : integer;
begin
  result := False;
  for i := 0 to 15 do
  begin
    if Group_812.ItemChecked[i] then
    begin
      nIndex := DeviceList.IndexOf(FillZeroNumber(i,2));
      if nIndex < 0 then continue;
      if TCurrentDeviceState(DeviceList.Objects[nIndex]).AlarmMode = cmArm then  result := True;
    end;
  end;
end;

function Tfm812Firmware.KTT812FileLoad(aFileName: string): Boolean;
var
  KTT812FirmWareList : TStringList;
  i : integer;
  stTemp : string;
begin
  result := False;
  KTT812FirmWareMemoryClear;
  KTT812FirmWareList := TStringList.create;
  Try
    KTT812FirmWareList.LoadFromFile(aFileName);
    for i := 0 to KTT812FirmWareList.Count - 1 do
    begin
      if Not KTT812FirmWareMemorySave(KTT812FirmWareList.Strings[i]) then Exit;;
    end;
  Finally
    KTT812FirmWareList.Free;
  End;
  result := True;
end;

procedure Tfm812Firmware.KTT812FirmWareMemoryClear;
var
  i : integer;
begin
  for i := 0 to HIGH(L_cKTT812Firmware) do
  begin
    L_cKTT812Firmware[i] := Char(StrToIntDef('$FF',0));
  end;
  L_stKTT812OFFSET := '';

end;

function Tfm812Firmware.KTT812FirmWareMemorySave(aData: string): Boolean;
var
  stASCIIData : string;
  stDataLen : string;
  nDataLen : integer;
  stCSData : string;
  stMakeCSData : string;
  stStartAddress : string;
  stGubun : string;
  stData : string;
  nStartAddress : integer;
  i : integer;
begin
  //Intel hex File 을 메모리에 로드 하자
  result := False;
  stDataLen := copy(aData,2,2);
  nDataLen := Hex2Dec(stDataLen);
  stStartAddress := copy(aData,4,4);
  stGubun := copy(aData,8,2);
  stData := copy(aData,10,nDataLen * 2);
  stCSData := copy(aData,10 + (nDataLen * 2) ,2);
  stASCIIData := Hex2Ascii(stDataLen + stStartAddress + stGubun + stData);
  stMakeCSData := MakeCSData(stASCIIData,G_nProgramType);
  if stCSData <> stMakeCSData then Exit;
  delete(stASCIIData,1,4); //순수 Data 영역만 남기자.

  result := True;

  if stGubun = '01' then Exit; // File End;

  if stGubun = '02' then  //OFFSET을 추출하여 StartAddress를 추출 하자.
  begin
    L_stKTT812OFFSET := stData + '0';
    Exit;
  end else if stGubun = '03' then  //OFFSET을 추출하여 StartAddress를 추출 하자.
  begin
    L_stKTT812OFFSET := stData;
    if Length(L_stKTT812OFFSET) < 8 then L_stKTT812OFFSET := FillZeroStrNum(L_stKTT812OFFSET,8,False);
    Exit;
  end else if stGubun = '04' then  //OFFSET을 추출하여 StartAddress를 추출 하자.
  begin
    L_stKTT812OFFSET := stData;
    if Length(L_stKTT812OFFSET) < 8 then L_stKTT812OFFSET := FillZeroStrNum(L_stKTT812OFFSET,8,False);
    Exit;
  end else if stGubun = '05' then  //OFFSET을 추출하여 StartAddress를 추출 하자.
  begin
    L_stKTT812OFFSET := stData;
    if Length(L_stKTT812OFFSET) < 8 then L_stKTT812OFFSET := FillZeroStrNum(L_stKTT812OFFSET,8,False);
    Exit;
  end;

  if L_stKTT812OFFSET <> '' then
  begin
     nStartAddress := Hex2Dec(L_stKTT812OFFSET) + Hex2Dec(stStartAddress)
  end else nStartAddress := Hex2Dec(stStartAddress);

  for i := nStartAddress to nStartAddress + nDataLen - 1 do
  begin
    if i > HIGH(L_cKTT812Firmware) then Exit;
    L_cKTT812Firmware[i] := stASCIIData[i - nStartAddress + 1];
  end;
end;

function Tfm812Firmware.KTT812MemoryFileSave: Boolean;
var
  st: string;
  iFileHandle: Integer;
begin
{  iFileHandle := FileOpen('c:\812KTFirmware.log', fmOpenWrite);
  FileSeek(iFileHandle,0,0);
  FileWrite(iFileHandle, L_cKTT812Firmware[0], HIGH(L_cKTT812Firmware) + 1);
  Fileclose(iFileHandle);
}
end;

procedure Tfm812Firmware.KTT812MainControlerFirmWareUpdate;
var
  stData : string;
begin
  //KTT812MemoryFileSave;
  stData := 'fw10';
  stData := stData + '1'; //Monitoring
  stData := stData + '1'; //Gauge
  stData := stData + ' 60000000000000000'; //메인 펌웨어 업데이트

  dmSocket.DirectSendPacket('00','R',stData,True);

  fmMain.ReconnectSocketTimer.Enabled := False;
end;

function Tfm812Firmware.KTT812FirmWareStart:Boolean;
var
  stAsciiData : string;
  stHexData : string;
  FirstTickCount : LongInt;
begin
  result := False;
  dmSocket.KTT812FirmwareDownLoadType := True; //KTT812FirmWareDownLoadType 진입
  L_nLastPage := GetKTT812FlashDataLen;
  Gauge_812F00.MaxValue := L_nLastPage;
  stAsciiData:= 'Fbu010000000,' + FillZeroNumber2(L_nLastPage,7) + ' 1000000000000000';
  stHexData := ASCII2Hex(stAsciiData);

  L_bENQStop := True;   //ENQ는 전송 하지 말자.

  //dmSocket.KTT812FirmwareStarting := False;  //한번이라도 펌웨어 진행이 되면 계속 진행 시킴
  KTT812FIRMWARECMDList.Add('20' + stHexData);
  Ktt812FirmwareDownloadStart.Interval := 500;
  Ktt812FirmwareDownloadStart.Enabled := True;

  while KTT812FIRMWARECMDList.Count > 0 do
  begin
    Application.ProcessMessages;
  end;
  Delay(500);

  if Not dmSocket.KTT812FirmwareStarting then Exit; //10회 재시도 하자.

  dmSocket.SendBufferClear;
  result := True;

  Delay(1000);

  stAsciiData:= 'Fbi014F00004F0000FD00004B0000F80000FD0000' ;
  stHexData := ASCII2Hex(stAsciiData);
  dmSocket.KTT812FirmwareStarting := False;
  FirstTickCount := GetTickCount;
  while Not dmSocket.KTT812FirmwareStarting do
  begin
    KTT812FIRMWARECMDList.Add('20' + stHexData);
    //여기에서 부터 펌웨어 데이터 BroadCast 한다.
    while KTT812FIRMWARECMDList.Count > 0 do
    begin
      Application.ProcessMessages;
    end;
  end;

  //Delay(1000);

  Ktt812FirmwareDownloadStart.Interval := 200;
  BroadKTT812FileDownLoad;


  Ktt812FirmwareDownloadStart.Interval := 500;
  stAsciiData:= 'Fbc014F00004F0000FD00004B0000F80000FD0000' ;
  stHexData := ASCII2Hex(stAsciiData);
  dmSocket.KTT812FirmwareStarting := False;
  while Not dmSocket.KTT812FirmwareStarting do
  begin
    KTT812FIRMWARECMDList.Add('20' + stHexData);
    //여기에서 부터 펌웨어 데이터 BroadCast 한다.
    while KTT812FIRMWARECMDList.Count > 0 do
    begin
      Application.ProcessMessages;
    end;
  end;

  L_bENQStop := False;
end;

function Tfm812Firmware.GetKTT812FlashDataLen: integer;
var
  i : integer;
  nStartPosition : integer;
  cCheck : Char;
  nDataLen : integer;
  nPageLen : integer;
begin
  result := 0;
  cCheck := char(Hex2Dec('FF'));
  nStartPosition := Hex2Dec64('3F000') - 1;
  for i := nStartPosition downto 0 do
  begin
    if L_cKTT812Firmware[i] <> cCheck then
    begin
      nDataLen := i;
      break;
    end;
  end;
  nPageLen := nDataLen div KTT812PAGESIZE;
  if (nDataLen mod KTT812PAGESIZE) = 0 then result := nPageLen
  else result := nPageLen + 1;
end;

procedure Tfm812Firmware.Ktt812FirmwareDownloadStartTimer(Sender: TObject);
var
  stCmd : string;
  stData : string;
begin
  if KTT812FIRMWARECMDList.Count < 1 then
  begin
    if Not dmSocket.KTT812FirmwareDownLoadType then
    begin
      Ktt812FirmwareDownloadStart.Enabled := False; //Timer 종료 후
      Exit;
    end;
    if Not L_bENQStop then
    begin
      Ktt812FirmwareDownloadStart.Interval := 200; //전송 모드로 진입
      KTT812ENQTimer.Interval := 400;
      if KTT812ENQTimer.Enabled = False then KTT812ENQTimer.Enabled := True; //ENQ Timer 호출
    end;
    Exit;
  end;

  Try
    KTT812ENQTimer.Enabled := False;
    Ktt812FirmwareDownloadStart.Enabled := False;
    if dmsocket.SocketOutSenting then
    begin
      dmsocket.SocketOutSenting := False; 
      Exit;
    end;
    dmsocket.SocketOutSenting := True;
    stData := KTT812FIRMWARECMDList.Strings[0];
    KTT812FIRMWARECMDList.Delete(0);
    stCmd := copy(stData,1,2);
    Delete(stData,1,2);
    dmSocket.SendKTT812FirmWarePacket(stCmd,stData);
  Finally
    Ktt812FirmwareDownloadStart.Enabled := True;
  End;
end;

procedure Tfm812Firmware.KTT812ENQTimerTimer(Sender: TObject);
begin
  if L_bENQStop then exit;
  if KTT812FIRMWARECMDList.IndexOf('05') < 0 then KTT812FIRMWARECMDList.Add('05');
end;


procedure Tfm812Firmware.BroadKTT812FileDownLoad;
var
  nStartPosition : int64;
  stAsciiData : string;
  i : integer;
  stHexData : string;
  nPage : integer;
begin
  lb_gauge.Caption := 'MCU BroadCast';
  
  for nPage := 0 to L_nLastPage - 1 do
  begin
    nStartPosition := nPage * KTT812PAGESIZE;
    stAsciiData := '';
    for i := nStartPosition to nStartPosition + KTT812PAGESIZE -1 do
    begin
      stAsciiData := stAsciiData + L_cKTT812Firmware[i];
    end;

    stAsciiData := 'Fbd01' + FillzeroNumber2(nPage + 1,7) + stAsciiData;
    stHexData := Ascii2Hex(stAsciiData);
    KTT812FIRMWARECMDList.Add('2A' + stHexData);
    while KTT812FIRMWARECMDList.Count > 0 do
    begin
      Application.ProcessMessages;
    end;
    Gauge_812F00.Progress := nPage + 1;
  end;

end;

procedure Tfm812Firmware.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  ini_fun : TiniFile;
begin
  dmSocket.KTT812FirmwareDownLoadType := False;
  fmMain.L_bKTT812FirmwareDownLoadShow := False;
  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\ztcs.INI');
    ini_fun.WriteString('812FirmWare','FileName',ed_FirmwareFile.Text);
  Finally
    ini_fun.Free;
  End;
end;

procedure Tfm812Firmware.ProcessKTT812FlashData(aData: string);
var
  nStartPosition : int64;
  stAsciiData : string;
  i : integer;
  stHexData : string;
  nPage : int64;
begin
  if Not isDigit(aData) then Exit;
  Gauge_812F00.Progress := strtoint(aData);
  lb_gauge.Caption := 'MCU FlashData';
  nPage := strtoint(aData) - 1;
  nStartPosition := nPage * KTT812PAGESIZE;
  stAsciiData := '';
  for i := nStartPosition to nStartPosition + KTT812PAGESIZE -1 do
  begin
    stAsciiData := stAsciiData + L_cKTT812Firmware[i];
  end;
  stAsciiData := 'FfD01' + aData + stAsciiData;
  stHexData := Ascii2Hex(stAsciiData);
  KTT812FIRMWARECMDList.Add('20' + stHexData);

end;

procedure Tfm812Firmware.ProcessKTT812FlashDataEnd;
var
  stAsciiData : string;
  st812ControlerNum : string;
begin
  stAsciiData := 'FFX01';
  KTT812FIRMWARECMDList.Add('20' + Ascii2Hex(stAsciiData));
  Gauge_812F00.Progress := Gauge_812F00.MaxValue;
  //이부분은 나중에 수정
  //FirmwareUpdateEnd;
  //fmMain.ReconnectSocketTimer.Enabled := True;
  st812ControlerNum := Get812ControlerNum(Group_812);
  DeviceFirmWareDownloadComplete('00');
  G_b812MainFirmWareDownloadComplete := True; //메인 펌웨어 다운로드 완료.
  dmSocket.KTT812BroadFirmWareStarting := False; //한번이라도 응답 오면 성공한것임
  KTT812ExtendBroadCastStart(st812ControlerNum);

end;

procedure Tfm812Firmware.FirmwareUpdateEnd;
begin
  GroupBox1.Enabled := True;
  btnClose.Enabled := True;
  btnFirmwareUpdate.Enabled := True;
  MessageTimer.Enabled := False;
  Panel1.Visible := False;
end;

procedure Tfm812Firmware.KTT812ExtendBroadCastStart(a812ControlerNum:string);
var
  stDeviceID : string;
  stData : string;
  PastTime : dword;
  nRetryCount : integer;
begin
  stData := 'fw10';
  stData := stData + '1';
  stData := stData + '1';
  //st812ControlerNum := Get812ControlerNum(Group_812);
  a812ControlerNum[1] := '0';
  if copy(a812ControlerNum,1,16) = '0000000000000000' then
  begin
    FirmwareUpdateEnd;
    Exit;
  end;
  stData := stData + ' ' + a812ControlerNum; //브로드캐스트 펌웨어 업데이트


  nRetryCount := 0;
  While Not dmSocket.KTT812BroadFirmWareStarting do
  begin
    if Not dmSocket.SocketConnected then
    begin
      dmSocket.KTT812BufferClear;
      delay(3000);
      continue;
    end;
    dmSocket.DirectSendPacket('00','R',stData,True);
    Delay(10000);
    inc(nRetryCount);
    if nRetryCount > 10 then
    begin
      showmessage('응답이 없습니다. 재시도 하세요.');
      btnFirmwareUpdate.Enabled := True;
      Exit;
    end;
  end;
  {
  dmSocket.DirectSendPacket('00','R',stData,True);
  PastTime := GetTickCount + 10000;  //1초간 대기하자
  while Not dmSocket.KTT812BroadFirmWareStarting do
  begin
    if GetTickCount > PastTime then break;  //1000밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
  end;

  if Not dmSocket.KTT812BroadFirmWareStarting then
  begin
    showmessage('응답이 없습니다. 재시도 하세요.');
    btnFirmwareUpdate.Enabled := True;
  end; }
end;

function Tfm812Firmware.Get812ControlerNum(
  CheckGroup: TRZCheckGroup): String;
var
  nTemp : array[0..8, 0..7] of Integer;
  i,j,k : Integer;
  stTemp: String;
  stHex:String;
  nDecimal: Integer;
  FirmWare812Gauge : TGauge;
  FirmWare812Label : TLabel;
begin
  stHex := '0';
  for i:=1 to 15 do
  begin
    stHex := stHex + '0';
  end;

  KTT812DownloadList.Clear;
  //체크 되어 있는 위치에 데이터를 넣는다.
  for k:= 0 to 15 do
  begin
    if CheckGroup.ItemChecked[k] = True then
    begin
      stHex[k+1] := '6';
      KTT812DownloadList.Add(FillZeroNumber(k,2));
    end;
  end;


  Result:=stHex;
end;

procedure Tfm812Firmware.ProcessKTT812EcuFirmWareDownloadComplete(
  aECUID: string);
begin
  DeviceFirmWareDownloadComplete(aEcuID);
end;

procedure Tfm812Firmware.DeviceFirmWareDownloadComplete(aEcuID: string);
var
  nIndex : integer;
begin
  memo1.Lines.Add(aEcuid + ':Download Completed');
  if aEcuID = '00' then
  begin
    While KTT812FIRMWARECMDList.Count > 0 do
    begin
      Application.ProcessMessages;
    end;
  end else FirmwareUpdateEnd;

  nIndex := KTT812DownloadList.IndexOf(aEcuID);
  if nIndex > -1 then KTT812DownloadList.Delete(nIndex);
  if KTT812DownloadList.Count = 0 then
  begin
    FirmwareUpdateEnd;  //메인 펌웨어 업데이트 종료
  end;
end;

procedure Tfm812Firmware.GageMonitor(aEcuID, aPacketData: string);
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

  nPosCount := posCount(' ',aPacketData);
  nStartPos := PosIndex(' ',aPacketData,nPosCount - 1);
  nEndPos := PosIndex(' ',aPacketData,nPosCount);
  stGauge := copy(aPacketData,nStartPos + 1,nEndPos - nStartPos - 1);

  stPrograss := FindCharCopy(stGauge,0,'/');
  stMax := FindCharCopy(stGauge,1,'/');
  stMax := FindCharCopy(stMax,0,' ');

  lb_gauge.Caption := 'ECU DownLoad';
  if isDigit(stMax) and isdigit(stPrograss) then
  begin
    Gauge_812F00.MaxValue := strtoint(stMax);
    Gauge_812F00.Progress := strtoint(stPrograss);
  end;
  
  Application.ProcessMessages;
end;

procedure Tfm812Firmware.DeviceFirmWareDownloadFailed(aEcuID,
  aFailState: string);
var
  nIndex : integer;
begin
  if aEcuID = '00' then
  begin
    L_bMainFirmWareDownLoadFail := True;
    showmessage('메인컨트롤러의 [' + aFailState + '] 상태로 펌웨어 업데이트가 종료 됩니다.');
    KTT812DownloadList.Clear;
    FirmwareUpdateEnd;
    Exit;
  end;
  nIndex := KTT812DownloadList.IndexOf(aEcuID);
  if nIndex > -1 then memo1.Lines.Add(aEcuid + ':[' + aFailState + ']Download Failed');
  if nIndex > -1 then KTT812DownloadList.Delete(nIndex);
  if KTT812DownloadList.Count = 0 then
  begin
    FirmwareUpdateEnd;
  end;
end;

procedure Tfm812Firmware.ProcessKTT812EcuFirmWareDownloadFailed(aECUID,
  aFailState: string);
begin
  DeviceFirmWareDownloadFailed(aEcuID,aFailState);

end;

procedure Tfm812Firmware.N1Click(Sender: TObject);
begin
  Close;
end;

procedure Tfm812Firmware.MessageTimerTimer(Sender: TObject);
begin
  Panel1.Visible := Not Panel1.Visible;
end;

end.
