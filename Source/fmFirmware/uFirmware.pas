unit uFirmware;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, RzLabel, Buttons, Gauges,FileInfo,
  LMDCustomComponent, LMDIniCtrl, RzLstBox,iniFiles;

type
  TFirmwareDownInfo = Record
    Version: string;    //Version
    FMM:     string;    //Flash Memory Map
    FSC:     String;    //Flash Start Command
    FWFN:    String;    //Flash Writer File Name
    FDFN:    String;    //Flash Data File Name
    CMDCODE: String;    //FX##(##:00 이거나 CMDCODE)
    DEVICETYPE : string;
  end;

  TfmFirmware = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cmb_ECU: TRzComboBox;
    btnClose: TRzBitBtn;
    btnFirmwareUpdate: TRzBitBtn;
    GroupBox2: TGroupBox;
    RzLabel41: TRzLabel;
    ed_FirmwareFile: TEdit;
    ProgressBar1: TGauge;
    RzOpenDialog1: TOpenDialog;
    btn_FileSearch: TBitBtn;
    LMDIniCtrl2: TLMDIniCtrl;
    ListBox_DownLoadInfo: TRzListBox;
    btn_FirmwareCancel: TRzBitBtn;
    procedure btn_FileSearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure btnFirmwareUpdateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_FirmwareCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmb_ECUChange(Sender: TObject);
  private
    L_stftpsendfilename : string;
    L_stftpsendfilesize : string;
    L_stlocalftproot : string;
    L_bClose  : Boolean;
    { Private declarations }
    Procedure LoadINI_firmwareInfo;
    Procedure SendRomUpDateInfo;
    Procedure Write_ListBox_DownLoadInfo(aData: String);
    procedure SendPacket(aEcuID: string;aCmd: Char; aData: string);
    procedure FileLoad(aFileName:string);
    procedure DownLoadComplete;
    procedure LoadEcu;
  public
    L_stSelectEcuID : string;
    L_bIsDownLoad : Boolean;
    { Public declarations }
    procedure FirmwareProcess(aEcuID,aRealData:string);
    procedure FirmwareProcess2(aEcuID,aRealData:string);
    Procedure DownloadFMM(aEcuID :string);

    Procedure SendCancelRomUpDate(aEcuID:String);
    Procedure SendFPData(aEcuID: String; aNo:Integer;aMode:string);
    Procedure SendFDData(aEcuID: String; aNo:Integer;aMode:string);
    Procedure SendFPBineryData(aEcuID: String; aNo,aSize:Integer;aMode:string);
    Procedure SendFDBineryData(aEcuID: String; aNo,aSize:Integer;aMode:string);
    Procedure SendFSC(aEcuID :string);
  public
    ECUList : TStringList;
    ItemIndex : Integer;

  end;

var
  fmFirmware: TfmFirmware;
  aFI: TFirmwareDownInfo;

  IsFirmwareDownLoad: Boolean;

  ROM_FlashWrite: TStringList;
  ROM_FlashData : TStringList;
  ROM_BineryFlashWrite : PChar;
  ROM_BineryFlashData : PChar;

implementation

uses
  uMain,
  uCommon,
  uUtil,
  dllFunction,
  uSocket;
  
{$R *.dfm}

procedure TfmFirmware.btn_FileSearchClick(Sender: TObject);
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
    FileLoad(st);

    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\ztcs.INI');
    ini_fun.WriteString('FirmWare','FileName',st);
    ini_fun.Free;
  end;

end;

procedure TfmFirmware.LoadINI_firmwareInfo;
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
    aFI.DEVICETYPE   := ReadString('DOWNLOAD','DEVI','');
  end;

end;

procedure TfmFirmware.FormCreate(Sender: TObject);
begin
  ROM_FlashWrite:= TStringList.Create;
  ROM_FlashData := TStringList.Create;

  ROM_BineryFlashWrite := nil;
  ROM_BineryFlashData := nil;

  IsFirmwareDownLoad := False;
  L_bIsDownLoad := False;
  L_bClose := False;

end;

procedure TfmFirmware.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ROM_FlashWrite.Free;
  ROM_FlashData.Free;

  fmMain.L_bFirmWareSendShow := False;
end;

procedure TfmFirmware.btnCloseClick(Sender: TObject);
begin
  if L_bIsDownLoad then
  begin
    if Application.MessageBox('FirmWare Download중입니다. 종료 하시겠습니까?','주의',MB_OKCANCEL) = IDCANCEL then Exit;
    btn_FirmwareCancelClick(self);
    Delay(100);
  end;
  L_bClose := True;
  Close;
end;

procedure TfmFirmware.btnFirmwareUpdateClick(Sender: TObject);
var
  nIndex : integer;
begin
  if Not dmSocket.SocketConnected then
  begin
    showmessage('통신연결이 안되었습니다.');
    Exit;
  end;
  nIndex := DeviceList.IndexOf(L_stSelectEcuID);
  if nIndex < 0 then Exit;
  if (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT811) and (TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType <> KTT813) then
  begin
    showmessage('KTT811 시스템이 아닙니다.');
    Exit;
  end;
  if (copy(TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceCode,1,7) = 'MCU-110') OR (copy(TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceCode,1,7) = 'ECU-110')  then
  begin
    if aFI.DEVICETYPE <> 'MCU110' then
    begin
      showmessage('MCU-300 펌웨어 파일이 아닙니다.');
      Exit;
    end;
  end else
  begin
    if aFI.DEVICETYPE = 'MCU110' then
    begin
      showmessage('MCU-100 펌웨어 파일이 아닙니다.');
      Exit;
    end;
  end;
  //L_bIsDownLoad := True;
  ListBox_DownLoadInfo.Clear;
  Write_ListBox_DownLoadInfo('펌웨어 업그레이드 수동시작');
  Write_ListBox_DownLoadInfo('펌웨어 업그레이드정보 전송');
  Write_ListBox_DownLoadInfo('펌웨어 버젼:' + aFI.Version);

  btnFirmwareUpdate.Enabled := False;
  cmb_ECU.Enabled := False;
  btn_FirmwareCancel.Enabled := True;
  btn_FileSearch.Enabled := False;
  btnClose.Enabled := False;



  SendRomUpDateInfo;

end;

procedure TfmFirmware.SendRomUpDateInfo;
var
  FPAddr: Integer;
  FDAddr: Integer;
  CMD: string;
  st: string;
begin
  FPAddr:= ROM_FlashWrite.Count;
  FDAddr:= ROM_FlashData.Count;

  CMD:= 'FU00';
  if aFI.DEVICETYPE = 'MCU110' then CMD := CMD + 'mMCU110';
  st:= CMD +FillZeroNumber(FPAddr,7)+','+ FillZeroNumber(FDAddr,7);
  SendPacket(L_stSelectEcuID,'F', st);
  Write_ListBox_DownLoadInfo(' firmware upgrade 정보 전송');
end;

procedure TfmFirmware.Write_ListBox_DownLoadInfo(aData: String);
var
  st: string;
begin
  st:= FormatDatetime('hh":"nn":"ss',Now) +'  '+aData;
  ListBox_DownLoadInfo.Add(st);
  ListBox_DownLoadInfo.ItemIndex:= ListBox_DownLoadInfo.Items.Count - 1;
  ListBox_DownLoadInfo.Selected[ListBox_DownLoadInfo.Items.Count - 1] := True;

end;

procedure TfmFirmware.SendPacket(aEcuID: string;aCmd: Char; aData: string);
begin
  dmsocket.DirectSendPacket(aEcuID,aCmd,aData,True,1);
end;

procedure TfmFirmware.FormShow(Sender: TObject);
var
  i : integer;
  ini_fun : TiniFile;
begin

  LoadEcu;
  fmMain.L_bFirmWareSendShow := True;

  ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\ztcs.INI');
  ed_FirmwareFile.Text := ini_fun.ReadString('FirmWare','FileName','');
  ini_fun.Free;

  if Trim(ed_FirmwareFile.Text) <> '' then FileLoad(ed_FirmwareFile.Text);

end;

procedure TfmFirmware.FirmwareProcess(aEcuID,aRealData: string);
var
  aRegCode: String;
begin
  //FI:Flash Memory Map
  //FP:Flash Writer File Name
  //FD:Flash Data File Name
  //FX:Flash Start Command

  //aRegCode:= Copy(aPacketData,G_nIDLength + 12,2);
  aRegCode:= Copy(aRealData,1,2);

  if aRegCode = 'FI' then
  begin
    L_bIsDownLoad:= True;
    Write_ListBox_DownLoadInfo('펌웨어 업그레이드정보 응답');
  end else if aRegCode = 'FP' then
  begin
    Write_ListBox_DownLoadInfo('flash write program 응답');
  end else if aRegCode = 'FD' then
  begin
    Write_ListBox_DownLoadInfo('flash Data program 응답');
  end else if aRegCode = 'FX' then
  begin
    Write_ListBox_DownLoadInfo('flash exec data 요청 응답');
  end else  if aRegCode = 'FU' then
  begin

  end else
  begin

  end;
end;

procedure TfmFirmware.FirmwareProcess2(aEcuID,aRealData: string);
var
  aRegCode: String;
  Addrstr: String;
  Addr: Integer;
  stSeq : string;
begin

//  aDeviceID:= Copy(aPacketData,8,G_nIDLength + 2);
//  aRegCode:= Copy(aPacketData,G_nIDLength + 12,2);
  aRegCode:= Copy(aRealData,1,2);



  if aRegCode = 'fu' then           {버젼정보 확인}
  begin
    if (aFI.Version <> '' ) then
    begin
      ListBox_DownLoadInfo.Clear;
      Write_ListBox_DownLoadInfo('펌웨어 업그레이드정보 전송');
      Write_ListBox_DownLoadInfo('펌웨어 버젼:' + aFI.Version);
      L_bIsDownLoad:= True;
      SendRomUpDateInfo;
    end;

  end else if aRegCode = 'fi' then  {Flash Memory Map 전송}
  begin

    if aFI.FMM <> '' then
    begin
      DownloadFMM(aEcuID);
    end else
    begin
      ShowMessage('메모리맵 데이터가 없습니다.');
      SendCancelRomUpDate(aEcuID);
      Exit;
    end;

  end else if aRegCode = 'fp' then  { flash write program}
  begin
    Addrstr:= Copy(aRealData,5,7);
    Addr:= Strtoint(Addrstr);
    if Length(aRealData) < 16 then stSeq := '0000'
    else stSeq := copy(aRealData,13,4);

    if stSeq = '0000' then
    begin
      ProgressBar1.Progress:= Addr;
      ProgressBar1.MaxValue:= ROM_FlashWrite.Count;
      SendFPData(aEcuID,Addr,'M');
    end else
    begin
      ProgressBar1.Progress:= Addr * strToint(stSeq);
      ProgressBar1.MaxValue:= Length(ROM_BineryFlashWrite);
      SendFPBineryData(aEcuID,Addr,strtoint(stSeq),'M');
    end;

  end else if aRegCode = 'fd' then  {flash data program}
  begin
    Addrstr:= Copy(aRealData,5,G_nIDLength);
    Addr:= Strtoint(Addrstr);
    if Length(aRealData) < 16 then stSeq := '0000'
    else stSeq := copy(aRealData,13,4);
    if stSeq = '0000' then
    begin
      ProgressBar1.Progress:= Addr;
      ProgressBar1.MaxValue:= ROM_FlashData.Count;
      SendFDData(aEcuID,Addr,'M');
    end else
    begin
      ProgressBar1.Progress:= Addr * strToint(stSeq);
      ProgressBar1.MaxValue:= Length(ROM_BineryFlashData);
      SendFDBineryData(aEcuID,Addr,strtoint(stSeq),'M');

    end;


  end else if aRegCode = 'fx' then  {Upgrade flash exec command request}
  begin
    SendFSC(aEcuID);
  end;

end;

procedure TfmFirmware.DownloadFMM(aEcuID: string);
var
  I: Integer;
  CMD: string;
  st: string;
  aLength: Integer;
//SYMFDST052S123455F00005F0000FF00005C0000F80000FF0000
begin
  CMD:= 'FI00';

  st := CMD + aFI.FMM ;

  if aFI.FMM = '' then
  begin
    ShowMessage('데이터 없음');
    Exit;
  end;

  SendPacket(aEcuID,'F', st);
  Write_ListBox_DownLoadInfo('Flash Memory Map 전송');

end;

procedure TfmFirmware.SendCancelRomUpDate(aEcuID: String);
var
  CMD: string;
  st: string;
  i : integer;
begin
  CMD:= 'FU00';
  st:= CMD +'0000000'+','+ '0000000';
  SendPacket(aEcuID,'F', st);
  Write_ListBox_DownLoadInfo(' firmware upgrade 취소 전송');

end;

procedure TfmFirmware.SendFPData(aEcuID: String; aNo: Integer;
  aMode: string);
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
    SendCancelRomUpDate(aEcuID);
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
    SendPacket(aEcuID,'F',st);
    Write_ListBox_DownLoadInfo('flash write 전송:'+InttoStr(aNo));
  end else
  begin
    if MessageDlg('요청된 번지가 잘못되었거나 write 파일에 문제가 있습니다.'+
                  '['+InttoStr(aNo)+']/'+ InttoStr(ROM_FlashWrite.Count)
                  +#13+'취소 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    SendCancelRomUpDate(aEcuID);
  end;
end;

procedure TfmFirmware.SendFPBineryData(aEcuID: String; aNo,
  aSize: Integer; aMode: string);
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
    SendPacket(aEcuID,'F',st);
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
      //RzFieldStatus1.Caption := inttostr(length(stSendData)) + ':' + stSendData;
    end;
  end;
  if Not bSendData then
  begin
    //보낼 데이터가 없음
    if aMode = 'M' then st:= 'fP00' +FillZeroNumber(0,7)
    else if aMode = 'S' then st:= 'fP00';
    SendPacket(aEcuID,'F',st);
    Write_ListBox_DownLoadInfo('flash write 전송:'+InttoStr(aNo));
  end
  else
  begin
    //데이터송신
    if aMode = 'M' then st:= 'fP00' +FillZeroNumber(aNo,7)+ stSendData
    else if aMode = 'S' then  st:= 'fP00' + stSendData;
    SendPacket(aEcuID,'F',st);
    Write_ListBox_DownLoadInfo('flash write 전송:'+InttoStr(aNo));
  end;

end;

procedure TfmFirmware.SendFDData(aEcuID: String; aNo: Integer;
  aMode: string);
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
    SendCancelRomUpDate(aEcuID);
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
    SendPacket(aEcuID,'F',st);
    Write_ListBox_DownLoadInfo('flash data 전송:'+InttoStr(aNo));
  end else
  begin
    if MessageDlg('요청된 번지가 잘못되었거나 Data 파일에 문제가 있습니다.'+
                  '['+InttoStr(aNo)+']/'+ InttoStr(ROM_FlashData.Count)
                  +#13+'취소 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    SendCancelRomUpDate(aEcuID);
  end;
end;

procedure TfmFirmware.SendFDBineryData(aEcuID: String; aNo,
  aSize: Integer; aMode: string);
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
      SendPacket(aEcuID,'F',st);
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
    SendPacket(aEcuID,'F',st);
    Write_ListBox_DownLoadInfo('flash data 전송:'+InttoStr(aNo));
  end
  else
  begin
    //데이터송신
    if aMode = 'M' then st:= 'fD00' + FillZeroNumber(aNo,7) + stSendData
    else if aMode = 'S' then st:= 'fD00' + stSendData;
    SendPacket(aEcuID,'F',st);
    Write_ListBox_DownLoadInfo('flash data 전송:'+InttoStr(aNo));
  end;
end;

procedure TfmFirmware.SendFSC(aEcuID: string);
var
  CMD: string;
  st,stAdd: string;
  aLength: Integer;
  aTime: TDatetime;
  aData: String;
  i : integer;
begin

  Delete(aFI.FSC,9,18);
  aFI.FSC:= aFI.FSC +#$20+'00/00/00 00:00:00';

  CMD:= 'FX'+aFI.CMDCODE;
  aData:= CMD + aFI.FSC ;

//  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(aEcuID,'F', aData);
  Write_ListBox_DownLoadInfo('펌웨어 시작 시간 전송시작');
  
  DownLoadComplete;
end;

procedure TfmFirmware.btn_FirmwareCancelClick(Sender: TObject);
begin
  SendCancelRomUpDate(L_stSelectEcuID);

  DownLoadComplete;

end;

procedure TfmFirmware.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Not L_bClose then
    CanClose := False;
end;

procedure TfmFirmware.FileLoad(aFileName: string);
var
  iFileLength: Integer;
  iBytesRead: Integer;
  iFileHandle: Integer;
  clFileInfo : TFileInfo;
  st : string;
begin
  Try
    btnFirmwareUpdate.Enabled := True;
    clFileInfo := TFileInfo.Create(aFileName);
    L_stftpsendfilename := clFileInfo.FileName;
    L_stftpsendfilesize := inttostr(clFileInfo.FileSize);
    L_stlocalftproot    := clFileInfo.Path;
    clFileInfo.Destroy;
    //if Not FTPUSE then
    //begin
      LMDIniCtrl2.IniFile:= aFileName;
      LoadINI_firmwareInfo;
      st:= aFI.Version + #13+
           aFI.FMM     + #13+
           aFI.FSC     + #13+
           aFI.FWFN    + #13+
           aFI.FDFN;
      ROM_FlashWrite.Clear;
      ROM_FlashWrite.LoadFromFile(L_stlocalftproot + '\' + aFI.FWFN);
      ROM_FlashData.Clear;
      ROM_FlashData.LoadFromFile(L_stlocalftproot + '\' + aFI.FDFN);
      //여기서 첫번째 파일을 읽어 들이자
      iFileHandle := FileOpen(L_stlocalftproot + '\' + aFI.FWFN, fmOpenRead);
      iFileLength := FileSeek(iFileHandle,0,2);
      FileSeek(iFileHandle,0,0);

      ROM_BineryFlashWrite := nil;
      ROM_BineryFlashWrite := PChar(AllocMem(iFileLength + 1));
      iBytesRead := FileRead(iFileHandle, ROM_BineryFlashWrite^, iFileLength);
      FileClose(iFileHandle);
    
      //여기서 두번째 파일을 읽어 들이자
      iFileHandle := FileOpen(L_stlocalftproot + '\' + aFI.FDFN, fmOpenRead);
      iFileLength := FileSeek(iFileHandle,0,2);
      FileSeek(iFileHandle,0,0);

      ROM_BineryFlashData := nil;
      ROM_BineryFlashData := PChar(AllocMem(iFileLength + 1));
      iBytesRead := FileRead(iFileHandle, ROM_BineryFlashData^, iFileLength);

      FileClose(iFileHandle);
  Except
    btnFirmwareUpdate.Enabled := False;
    ed_FirmwareFile.Text := '';
  End;
  //end;
end;

procedure TfmFirmware.DownLoadComplete;
begin
  btnFirmwareUpdate.Enabled := True;
//  ComboBox_ECU.Enabled := True;
  btn_FirmwareCancel.Enabled := False;
  btn_FileSearch.Enabled := True;
  btnClose.Enabled := True;
  
  ProgressBar1.Progress := 0;

  L_bIsDownLoad:= False;

end;

procedure TfmFirmware.LoadEcu;
var
  i : integer;
  stSelectEcuID : string;
begin
  stSelectEcuID := '';
  if cmb_Ecu.Count > 0 then
    stSelectEcuID := cmb_Ecu.Text;
  cmb_Ecu.Clear;

  for i :=0 to deviceList.Count - 1 do
  begin
    if TCurrentDeviceState(DeviceList.Objects[i]).Connected then
    begin
      if (TCurrentDeviceState(DeviceList.Objects[i]).DeviceType = KTT811) or (TCurrentDeviceState(DeviceList.Objects[i]).DeviceType = KTT813) then
      begin
        cmb_Ecu.Add(deviceList.Strings[i]);
        if stSelectEcuID = deviceList.Strings[i] then
        begin
          cmb_Ecu.ItemIndex := cmb_Ecu.Count - 1;
        end;
      end;
    end;
  end;
  if cmb_Ecu.ItemIndex < 0 then cmb_Ecu.ItemIndex := 0;
  L_stSelectEcuID := cmb_Ecu.Text;
end;

procedure TfmFirmware.cmb_ECUChange(Sender: TObject);
begin
  L_stSelectEcuID := cmb_ECU.Text;
end;

end.
