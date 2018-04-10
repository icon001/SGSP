unit uICUGCU300FirmwareDownload;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, ExtCtrls, RzPanel, RzRadGrp, StdCtrls, Buttons,
  RzButton, RzLabel, Grids, AdvObj, BaseGrid, AdvGrid, LMDCustomComponent,
  LMDIniCtrl,iniFiles, uSubForm, CommandArray;

type
  TfmICUGCU300FirmwareDownload = class(TfmASubForm)
    GroupBox1: TGroupBox;
    RzLabel41: TRzLabel;
    btnClose: TRzBitBtn;
    btnFirmwareUpdate: TRzBitBtn;
    ed_FirmwareFile: TEdit;
    btn_FileSearch: TBitBtn;
    Group_811: TRzCheckGroup;
    GroupBox2: TGroupBox;
    ProgressBar1: TGauge;
    Group_BroadDownLoadBase: TRzCheckGroup;
    sg_Icu300FirmwareDownload: TAdvStringGrid;
    OpenDialog1: TOpenDialog;
    LMDIniCtrl2: TLMDIniCtrl;
    Label519: TLabel;
    ed_Icu300broadTime: TEdit;
    RzOpenDialog1: TOpenDialog;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Group_BroadDownLoadBaseChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure btn_FileSearchClick(Sender: TObject);
    procedure btnFirmwareUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FirmwareDownLoadList_GCU300 : TStringList;
    FirmwareDownLoadList_ICU300 : TStringList;
    FDeviceType: string;
    FDeviceID: string;
    procedure SetDeviceType(const Value: string);
    procedure Ecu_GroupCreate;
    function Check_GCU300ICU300FirmwareComplete : Boolean;
    procedure Clear_FirmwareDownLoadList;
    procedure GCUICU300HexSendPacketEvent(Sender: TObject; aSendHexData,aViewHexData: string);
    function GetFirmWareSelectDevice : string;
    function GetFirmWarePath : string;
    procedure StringGrid_Change(aList:TAdvStringGrid;aEcuID,aNo:string;aMaxSize,aCurPosition:integer);
    procedure MainRequestProcessChange(Sender: TObject; aEcuID,aNo,aDeviceType: string;aMaxSize,aCurPosition:integer);
    { Private declarations }
  public
    procedure ICU300FirmWareProcess(aECUID,aRealPacketData:string);
    procedure GCU300_ICU300FirmwareDownloadState(aEcuID,aRealPacket:string);
  public
    { Public declarations }
    property DeviceID : string read FDeviceID write FDeviceID;
    property DeviceType : string read FDeviceType write SetDeviceType;
  end;

var
  fmICUGCU300FirmwareDownload: TfmICUGCU300FirmwareDownload;

implementation

uses
  dllFunction,
  uCommon,
  uICU300FirmwareData,
  uUtil,
  uSocket,
  uMain;

{$R *.dfm}

procedure TfmICUGCU300FirmwareDownload.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmICUGCU300FirmwareDownload.Ecu_GroupCreate;
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
      if DeviceType = 'SCR302' then
      begin
        if (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT811) or
           (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812) or
           (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT813) 
         then
        begin
          if TCurrentDeviceState(DeviceList.Objects[nIndex]).Connected then
          begin
            Group_811.ItemChecked[i]:= True;
          end;
        end;
      end else if DeviceType = 'ICU300' then
      begin
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = ICU300 then
        begin
          if TCurrentDeviceState(DeviceList.Objects[nIndex]).Connected then
          begin
            Group_811.ItemChecked[i]:= True;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfmICUGCU300FirmwareDownload.SetDeviceType(const Value: string);
var
  ini_fun : TiniFile;
begin
  FDeviceType := Value;

  if Value = 'ICU300' then
  begin
    sg_Icu300FirmwareDownload.ColWidths[1] := 0;
    sg_Icu300FirmwareDownload.ColWidths[3] := 0;
  end else if Value = 'SCR302' then
  begin
    sg_Icu300FirmwareDownload.ColWidths[1] := 88;
    sg_Icu300FirmwareDownload.ColWidths[3] := 0;
  end;
  ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\ztcs.INI');
  ed_FirmwareFile.Text := ini_fun.ReadString(DeviceType,'FileName','');
  ini_fun.Free;
  if FileExists(ed_FirmwareFile.Text) then
    btnFirmwareUpdate.Enabled := True;
end;

procedure TfmICUGCU300FirmwareDownload.FormShow(Sender: TObject);
begin
  Ecu_GroupCreate;
  fmMain.L_bICU300FirmWareSendShow := True;
end;

procedure TfmICUGCU300FirmwareDownload.Group_BroadDownLoadBaseChange(Sender: TObject;
  Index: Integer; NewState: TCheckBoxState);
var
 I: Integer;
 Base: Integer;
begin
  if Index < 7 then
  begin
    Base:= Index * 10;
    if NewState = cbChecked then
    begin
      for I:= 0 to 9 do if (Group_811.Items.Count > Base + I) then Group_811.ItemChecked[Base + I]:= True;
    end else
    begin
      for I:= 0 to 9 do if (Group_811.Items.Count > Base + I) then Group_811.ItemChecked[Base + I]:= False;
    end;
  end else
  begin
    if NewState = cbChecked then
    begin
      for I:= 0 to Group_811.Items.Count -1  do Group_811.ItemChecked[I]:= True;
      for I:= 0 to Group_BroadDownLoadBase.Items.Count -1  do Group_BroadDownLoadBase.ItemChecked[I]:= True;
    end else
    begin
      for I:= 0 to Group_811.Items.Count -1  do Group_811.ItemChecked[I]:= False;
      for I:= 0 to Group_BroadDownLoadBase.Items.Count -1  do Group_BroadDownLoadBase.ItemChecked[I]:= False;
    end;
  end;
end;

procedure TfmICUGCU300FirmwareDownload.btn_FileSearchClick(
  Sender: TObject);
var
  st: string;
  ini_fun : TiniFile;
begin
  RzOpenDialog1.Title:= '펌웨어 설정 파일 찾기';
  RzOpenDialog1.DefaultExt:= 'ini';
  RzOpenDialog1.Filter := 'INI files (*.ini)|*.INI';
  if RzOpenDialog1.Execute then
  begin
    st:= RzOpenDialog1.FileName;
    ed_FirmwareFile.Text:= st;
    ed_FirmwareFile.SelectAll;

    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\ztcs.INI');
    ini_fun.WriteString(DeviceType,'FileName',ed_FirmwareFile.Text);
    ini_fun.Free;
    btnFirmwareUpdate.Enabled := True;
  end;
end;

procedure TfmICUGCU300FirmwareDownload.btnFirmwareUpdateClick(
  Sender: TObject);
var
  ini_fun : TiniFile;
  stFirmwareFile : string;
  stDeviceID : string;
  stTemp : string;
  i : integer;
  nFirmwareIndex : integer;
begin
  Clear_FirmwareDownLoadList;
  dmICU300FirmwareData.DeviceType := DeviceType;
  if Not FileExists(ed_FirmwareFile.Text) then
  begin
    showmessage('INI 파일을 찾을 수 없습니다.');
    Exit;
  end;
  Try
    ini_fun := TiniFile.Create(ed_FirmwareFile.Text);
    if StringReplace(ini_fun.ReadString('Config','TYPE',''),'-','',[rfReplaceAll]) <> DeviceType then
    begin
      showmessage(DeviceType + ' 펌웨어 파일이 아닙니다.');
      Exit;
    end;
    stFirmwareFile := ExtractFileDir(ed_FirmwareFile.Text) + '\' + ini_fun.ReadString('Config','FILE','');
    if Not FileExists(stFirmwareFile) then
    begin
      showmessage(stFirmwareFile + '펌웨어 파일을 찾을 수 없습니다.');
      Exit;
    end;
  Finally
    ini_fun.Free;
  end;

  btnFirmwareUpdate.Enabled := False;
  btnClose.Enabled := False;
  stDeviceID := '00';
  //path 선택 전송
  stTemp := GetFirmWarePath;
  for i:=0 to 5 do  //5회 전송 하자.
  begin
    dmSocket.DirectSendPacket(stDeviceID,'R','FW10 01' + DeviceType + stTemp,True,1);
    MyDelay(500);
  end;
  //기기 선택 전송
  stTemp := GetFirmWareSelectDevice;
  for i:=0 to 5 do  //5회 전송 하자.
  begin
    dmSocket.DirectSendPacket(stDeviceID,'R','FW10 11' + DeviceType + stTemp,True,1);
    MyDelay(500);
  end;
  //BootJump
  stTemp := '00150 ';
  for i:=0 to 63 do stTemp := stTemp + '1';  //출입문 열고 펌웨어 업데이트 하자.
  for i:=0 to 5 do  //5회 전송 하자.
  begin
    dmSocket.DirectSendPacket(stDeviceID,'R','FW10 12' + DeviceType + stTemp,True,1);
    MyDelay(500);
  end;

  dmICU300FirmwareData.FirmwareFileName :=  stFirmwareFile;
  dmICU300FirmwareData.DeviceID:= DeviceID + '00';
  dmICU300FirmwareData.OnSendPacketEvent := GCUICU300HexSendPacketEvent;
  dmICU300FirmwareData.PacketSize := 100;
  for i:=0 to 5 do  //5회 전송 하자.
  begin
    dmSocket.DirectSendPacket(stDeviceID,'R','FW10 10' + DeviceType + FillZeroNumber(dmICU300FirmwareData.FileSize,6) + ' ' + FillZeroNumber(dmICU300FirmwareData.PacketSize,4),True,1);
    MyDelay(500);
  end;

  nFirmwareIndex := 0;
  ProgressBar1.MaxValue := dmICU300FirmwareData.FileSize;
  ProgressBar1.Progress := 0;
  while true do
  begin
    if dmICU300FirmwareData.FileSize < nFirmwareIndex * dmICU300FirmwareData.PacketSize then break;
    dmICU300FirmwareData.CurrentIndex := nFirmwareIndex;
    dmICU300FirmwareData.SendMsgNo := 0;
    dmICU300FirmwareData.SendICU300FirmWarePacket('R','FW10 22' + DeviceType + FillZeroNumber(nFirmwareIndex,5),'K1');
    nFirmwareIndex := nFirmwareIndex + 1;
    ProgressBar1.Progress := dmICU300FirmwareData.PacketSize * nFirmwareIndex;
    MyDelay(strtoint(ed_Icu300broadTime.text));
    Application.ProcessMessages;
  end;

  for i:=0 to 5 do  //5회 전송 하자.
  begin
    dmSocket.DirectSendPacket(stDeviceID,'R','FW10 18' + DeviceType + '00100',True,1);
    MyDelay(500);
  end;
end;

function TfmICUGCU300FirmwareDownload.GetFirmWarePath: string;
var
  stPath : string;
  i : integer;
begin
  if DeviceType = 'ICU300' then
  begin
    stPath := '1'; //확장기 쪽으로만 전송 한다.
  end else if DeviceType = 'SCR302' then
  begin
    if Group_811.ItemChecked[0] = True then stPath := '3'  //확장기와 카드리더 두군데 전송한다.
    else stPath := '1';                                             //확장기쪽으로만 전송한다.

    for i:=1 to 63 do
    begin
      if Group_811.ItemChecked[i] = True then stPath := stPath + '2'
      else stPath := stPath + '0';
    end;
  end;
  result := stPath;
end;

function TfmICUGCU300FirmwareDownload.GetFirmWareSelectDevice: string;
var
  stSelectDevice : string;
  i : integer;
begin
  stSelectDevice := '';
  if DeviceType = 'ICU300' then
  begin
    for i:=0 to 63 do
    begin
      if Group_811.ItemChecked[i] = True then stSelectDevice := stSelectDevice + '1'
      else stSelectDevice := stSelectDevice + '0';
    end;
  end else if DeviceType = 'SCR302' then
  begin
    stSelectDevice := '011111111'; //8개 리더 모두 선택 하자.
  end;
  result := stSelectDevice;
end;

procedure TfmICUGCU300FirmwareDownload.FormCreate(Sender: TObject);
begin
  FirmwareDownLoadList_GCU300 := TStringList.Create;
  FirmwareDownLoadList_ICU300 := TStringList.Create;   
end;

procedure TfmICUGCU300FirmwareDownload.Clear_FirmwareDownLoadList;
var
  i : integer;
begin
  GridInit(sg_Icu300FirmwareDownload,3);
  if FirmwareDownLoadList_GCU300.Count > 0 then
  begin
    for i := FirmwareDownLoadList_GCU300.Count - 1 downto 0 do
    begin
      TICU300FirmwareProcess(FirmwareDownLoadList_GCU300.Objects[i]).Free;
    end;
    FirmwareDownLoadList_GCU300.Clear;
  end;
  if FirmwareDownLoadList_ICU300.Count > 0 then
  begin
    for i := FirmwareDownLoadList_ICU300.Count - 1 downto 0 do
    begin
      TICU300FirmwareProcess(FirmwareDownLoadList_ICU300.Objects[i]).Free;
    end;
    FirmwareDownLoadList_ICU300.Clear;
  end;
end;

procedure TfmICUGCU300FirmwareDownload.GCUICU300HexSendPacketEvent(
  Sender: TObject; aSendHexData, aViewHexData: string);
begin
  dmSocket.HexSendPacketEvent(aSendHexData);
end;

procedure TfmICUGCU300FirmwareDownload.StringGrid_Change(
  aList: TAdvStringGrid; aEcuID, aNo: string; aMaxSize,
  aCurPosition: integer);
var
  stFirmwareID : string;
  i : integer;
  stState : string;
begin
  stFirmwareID := aEcuID + aNo;
  if aCurPosition = 0 then stState := 'Firmware 수신중'
  else if aMaxSize = aCurPosition then stState := '완료'
  else stState := inttostr(aCurPosition) + ' / ' + inttostr(aMaxSize);

  for i := 1 to aList.RowCount - 1 do
  begin
    if aList.Cells[3,i] = stFirmwareID then
    begin
      aList.Cells[2,i] := stState ;
      Exit;
    end;
  end;

  if aList.RowCount = 2 then
  begin
    if aList.Cells[3,1] = '' then //처음 Add 되는 경우
    begin
      aList.Cells[0,1] := aEcuID;
      aList.Cells[1,1] := aNo;
      aList.Cells[2,1] := stState ;
      aList.Cells[3,1] := stFirmwareID;
      Exit;
    end;
  end;
  aList.RowCount := aList.RowCount + 1; //한칸 추가 하자.
  aList.Cells[0,aList.RowCount - 1] := aEcuID;
  aList.Cells[1,aList.RowCount - 1] := aNo;
  aList.Cells[2,aList.RowCount - 1] := stState ;
  aList.Cells[3,aList.RowCount - 1] := stFirmwareID;
end;

function TfmICUGCU300FirmwareDownload.Check_GCU300ICU300FirmwareComplete: Boolean;
var
  i : integer;
  bComplete : Boolean;
begin
  bComplete := True;
  if FirmwareDownLoadList_GCU300.Count > 0 then
  begin
    for i := FirmwareDownLoadList_GCU300.Count - 1 downto 0 do
    begin
      if TICU300FirmwareProcess(FirmwareDownLoadList_GCU300.Objects[i]).MaxSize <> TICU300FirmwareProcess(FirmwareDownLoadList_GCU300.Objects[i]).CurrentPosition then bComplete := False;
    end;
  end;
  if FirmwareDownLoadList_ICU300.Count > 0 then
  begin
    for i := FirmwareDownLoadList_ICU300.Count - 1 downto 0 do
    begin
      if TICU300FirmwareProcess(FirmwareDownLoadList_ICU300.Objects[i]).MaxSize <> TICU300FirmwareProcess(FirmwareDownLoadList_ICU300.Objects[i]).CurrentPosition then bComplete := False;
    end;
  end;

  if bComplete then
  begin
    btnFirmwareUpdate.Enabled := True;
    btnClose.Enabled := True;
  end;
end;

procedure TfmICUGCU300FirmwareDownload.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  fmMain.L_bICU300FirmWareSendShow := False;
end;

procedure TfmICUGCU300FirmwareDownload.ICU300FirmWareProcess(aECUID,
  aRealPacketData: string);
var
  stIndex : string;
  stDeviceType : string;
  stNo : string;
  nIndex : integer;
  oICU300FirmwareProcess : TICU300FirmwareProcess;
begin
  stIndex := copy(aRealPacketData,6,5);
  stDeviceType := copy(aRealPacketData,12,6);
  stNo := copy(aRealPacketData,19,2);
  //showmessage(stIndex);
  if Not isDigit(stIndex) then Exit;
  dmICU300FirmwareData.CurrentIndex := strtoint(stIndex);
  //dmICU300FirmwareData.SendMsgNo := Send_MsgNo;
  dmICU300FirmwareData.SendICU300FirmWarePacket('R','FW10 22' + dmICU300FirmwareData.DeviceType + FillZeroNumber(strtoint(stIndex),5),'K1');

  if stDeviceType = 'SCR302' then
  begin
    nIndex := FirmwareDownLoadList_GCU300.IndexOf(aEcuID+stNo);
    if nIndex < 0 then
    begin
      oICU300FirmwareProcess := TICU300FirmwareProcess.Create(nil);
      oICU300FirmwareProcess.ECUID := aEcuID;
      oICU300FirmwareProcess.NO := stNo;
      oICU300FirmwareProcess.DeviceType := stDeviceType;
      oICU300FirmwareProcess.MaxSize := dmICU300FirmwareData.FileSize;
      oICU300FirmwareProcess.CurrentPosition := strtoint(stIndex) * dmICU300FirmwareData.PacketSize;
      oICU300FirmwareProcess.OnMainRequestProcess := MainRequestProcessChange;
      FirmwareDownLoadList_GCU300.AddObject(aEcuID+stNo,oICU300FirmwareProcess);

      StringGrid_Change(sg_Icu300FirmwareDownload,aEcuID,stNo,dmICU300FirmwareData.FileSize,oICU300FirmwareProcess.CurrentPosition);
    end else
    begin
      TICU300FirmwareProcess(FirmwareDownLoadList_GCU300.Objects[nIndex]).CurrentPosition := strtoint(stIndex) * dmICU300FirmwareData.PacketSize;
    end;
  end else if stDeviceType = 'ICU300' then
  begin
    nIndex := FirmwareDownLoadList_ICU300.IndexOf(aEcuID+stNo);
    if nIndex < 0 then
    begin
      oICU300FirmwareProcess := TICU300FirmwareProcess.Create(nil);
      oICU300FirmwareProcess.ECUID := aEcuID;
      oICU300FirmwareProcess.NO := stNo;
      oICU300FirmwareProcess.DeviceType := stDeviceType;
      oICU300FirmwareProcess.MaxSize := dmICU300FirmwareData.FileSize;
      oICU300FirmwareProcess.CurrentPosition := strtoint(stIndex) * dmICU300FirmwareData.PacketSize;
      oICU300FirmwareProcess.OnMainRequestProcess := MainRequestProcessChange;
      FirmwareDownLoadList_ICU300.AddObject(aEcuID+stNo,oICU300FirmwareProcess);

      StringGrid_Change(sg_Icu300FirmwareDownload,aEcuID,stNo,dmICU300FirmwareData.FileSize,oICU300FirmwareProcess.CurrentPosition);
    end else
    begin
      TICU300FirmwareProcess(FirmwareDownLoadList_ICU300.Objects[nIndex]).CurrentPosition := strtoint(stIndex) * dmICU300FirmwareData.PacketSize;
    end;
  end;

end;

procedure TfmICUGCU300FirmwareDownload.MainRequestProcessChange(
  Sender: TObject; aEcuID, aNo, aDeviceType: string; aMaxSize,
  aCurPosition: integer);
begin
  if aDeviceType = 'ICU300' then
    StringGrid_Change(sg_Icu300FirmwareDownload,aEcuID,aNo,aMaxSize,aCurPosition)
  else if aDeviceType = 'SCR302' then
    StringGrid_Change(sg_Icu300FirmwareDownload,aEcuID,aNo,aMaxSize,aCurPosition);
end;

procedure TfmICUGCU300FirmwareDownload.GCU300_ICU300FirmwareDownloadState(
  aEcuID, aRealPacket: string);
var
  stFirmwarestate : string;
  stDeviceType : string;
  stDeviceNumber : string;
  nIndex : integer;
  oICU300FirmwareProcess : TICU300FirmwareProcess;
begin
  stFirmwarestate := copy(aRealPacket,5,4);
  stDeviceType := copy(aRealPacket,10,6);
  stDeviceNumber := copy(aRealPacket,17,2);
  if stFirmwarestate = 'fCls' then
  begin
    if stDeviceType = 'SCR302' then
    begin
      nIndex := FirmwareDownLoadList_GCU300.IndexOf(aEcuID+stDeviceNumber);
      if nIndex < 0 then
      begin
        oICU300FirmwareProcess := TICU300FirmwareProcess.Create(nil);
        oICU300FirmwareProcess.ECUID := aEcuID;
        oICU300FirmwareProcess.NO := stDeviceNumber;
        oICU300FirmwareProcess.DeviceType := stDeviceType;
        oICU300FirmwareProcess.MaxSize := dmICU300FirmwareData.FileSize;
        oICU300FirmwareProcess.CurrentPosition := 0;
        oICU300FirmwareProcess.OnMainRequestProcess := MainRequestProcessChange;
        FirmwareDownLoadList_GCU300.AddObject(aEcuID+stDeviceNumber,oICU300FirmwareProcess);

        StringGrid_Change(sg_Icu300FirmwareDownload,aEcuID,stDeviceNumber,dmICU300FirmwareData.FileSize,oICU300FirmwareProcess.CurrentPosition);
      end;
    end else if stDeviceType = 'ICU300' then
    begin
      nIndex := FirmwareDownLoadList_ICU300.IndexOf(aEcuID+stDeviceNumber);
      if nIndex < 0 then
      begin
        oICU300FirmwareProcess := TICU300FirmwareProcess.Create(nil);
        oICU300FirmwareProcess.ECUID := aEcuID;
        oICU300FirmwareProcess.NO := stDeviceNumber;
        oICU300FirmwareProcess.DeviceType := stDeviceType;
        oICU300FirmwareProcess.MaxSize := dmICU300FirmwareData.FileSize;
        oICU300FirmwareProcess.CurrentPosition := 0;
        oICU300FirmwareProcess.OnMainRequestProcess := MainRequestProcessChange;
        FirmwareDownLoadList_ICU300.AddObject(aEcuID+stDeviceNumber,oICU300FirmwareProcess);

        StringGrid_Change(sg_Icu300FirmwareDownload,aEcuID,stDeviceNumber,dmICU300FirmwareData.FileSize,oICU300FirmwareProcess.CurrentPosition);
      end;
    end;
  end else if stFirmwarestate = 'Main' then
  begin
    if stDeviceType = 'SCR302' then
    begin
      nIndex := FirmwareDownLoadList_GCU300.IndexOf(aEcuID+stDeviceNumber);
      if nIndex > -1 then
      begin
        TICU300FirmwareProcess(FirmwareDownLoadList_GCU300.Objects[nIndex]).CurrentPosition := dmICU300FirmwareData.FileSize;
      end;
    end else if stDeviceType = 'ICU300' then
    begin
      nIndex := FirmwareDownLoadList_ICU300.IndexOf(aEcuID+stDeviceNumber);
      if nIndex > -1 then
      begin
        TICU300FirmwareProcess(FirmwareDownLoadList_ICU300.Objects[nIndex]).CurrentPosition := dmICU300FirmwareData.FileSize;
      end;
    end;
    Check_GCU300ICU300FirmwareComplete;
  end;
end;

end.
