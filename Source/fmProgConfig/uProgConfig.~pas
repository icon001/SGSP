unit uProgConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzButton, ComCtrls, LMDEdit, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit,
  LMDCustomMaskEdit, LMDCustomExtCombo, LMDCustomListComboBox,
  LMDListComboBox, ExtCtrls, RzPanel, RzRadGrp,iniFiles, Buttons,WinSpool,
  IPEdit, Mask, RzEdit;


type
  TfmProgConfig = class(TForm)
    btnConnect: TRzBitBtn;
    btnClose: TRzBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    ed_DelayTime: TEdit;
    Label2: TLabel;
    ed_LoopCount: TEdit;
    Label3: TLabel;
    ed_LanTime: TEdit;
    Label4: TLabel;
    ed_LANLoop: TEdit;
    TabSheet2: TTabSheet;
    rg_ConnectMode: TRzRadioGroup;
    rg_ServerMode: TRzRadioGroup;
    TabSheet3: TTabSheet;
    rg_Log: TRzRadioGroup;
    ed_LogFileName: TEdit;
    Label5: TLabel;
    SaveDialog1: TSaveDialog;
    btnFileOpen: TSpeedButton;
    CB_SerialComm: TLMDLabeledListComboBox;
    CB_IPList: TIPEdit;
    Label6: TLabel;
    ed_Port: TRzEdit;
    Label21: TLabel;
    btn_LanSetting: TRzBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure rg_ConnectModeChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure rg_LogChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure btnFileOpenClick(Sender: TObject);
    procedure ed_PortKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_LanSettingClick(Sender: TObject);
    procedure CB_IPListChange(Sender: TObject);
    procedure ed_PortChange(Sender: TObject);
    procedure rg_ServerModeChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    ComPortList : TStringList;
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;
    procedure IPSetting;
  public
    L_bConnectStart:Boolean;
    { Public declarations }
  end;

var
  fmProgConfig: TfmProgConfig;

//  {$I zRegT.INC}

implementation
uses
  uCommon,
  dllFunction, uNetConfig;

{$R *.dfm}

procedure TfmProgConfig.FormActivate(Sender: TObject);
var
  stDir : string;
  nCount : integer;
  i : integer;
begin
  ed_DelayTime.Text := inttostr(G_nDelayTime);
  ed_LoopCount.Text := inttostr(G_nLoopCount);
  ed_LanTime.Text := inttostr(G_nLANTime);
  ed_LANLoop.Text := inttostr(G_nLANLoop);


  stDir:= ExtractFileDir(Application.ExeName);
  IPSetting;

  rg_ConnectMode.ItemIndex := G_nConnectMode;


  ComPortList.Clear;
  nCount := GetSerialPortList(ComPortList);
  CB_SerialComm.Items.Clear;
  if nCount = 0 then
  begin
    Exit;
  end;

  for i:= 0 to nCount - 1 do
  begin
    CB_SerialComm.items.Add(ComPortList.Strings[i])
  end;
  CB_SerialComm.ItemIndex := -1;
  if CB_SerialComm.Items.Count > 0 then CB_SerialComm.ItemIndex := 0;
  for i:= 0 to CB_SerialComm.Items.Count -1 do
  begin
    if Integer(ComPortList.Objects[i]) = G_nComPort then
    begin
      CB_SerialComm.ItemIndex := i;
      break;
    end;
  end;

end;

procedure TfmProgConfig.btnCloseClick(Sender: TObject);
begin
  L_bConnectStart := False;
  Close;
end;

procedure TfmProgConfig.btnConnectClick(Sender: TObject);
var
  ini_fun : TiniFile;
  stDir : string;
  nIndex : integer;
begin
  G_nDelayTime := strtoint(ed_DelayTime.Text);
//  G_nLoopCount := strtoint(ed_LoopCount.Text);
//  G_nLANTime := strtoint(ed_LanTime.Text);
//  G_nLANLoop := strtoint(ed_LANLoop.Text);
  G_stTCPConf := CB_IPList.Text+ ','+ ed_Port.Text + ',' + inttostr(rg_ServerMode.ItemIndex);
  G_nConnectMode := rg_ConnectMode.ItemIndex;
  if CB_SerialComm.ItemIndex > -1 then
    G_nComPort :=  Integer(ComPortList.Objects[CB_SerialComm.ItemIndex]);
  {if CB_SerialComm.ItemIndex > -1 then
    G_nComPort :=  CB_SerialComm.ItemIndex + 1;}

  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\ztcs.INI');

    ini_fun.WriteInteger('Config','DelayTime',G_nDelayTime);
    ini_fun.WriteInteger('Config','LoopCount',G_nLoopCount);
    ini_fun.WriteInteger('Config','LANTime',G_nLANTime);
    ini_fun.WriteInteger('Config','LANLoop',G_nLANLoop);

    ini_fun.WriteString('Config','TCP',G_stTCPConf);
    ini_fun.WriteInteger('Config','ConnectMode',G_nConnectMode);
    if CB_SerialComm.ItemIndex > -1 then
      ini_fun.WriteInteger('Config','ComPort',G_nComPort);

  Finally
    ini_fun.Free;
  End;
  L_bConnectStart := True;
  Close;

end;

procedure TfmProgConfig.rg_ConnectModeChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
  if NewIndex = 0 then
  begin
    //rg_ServerMode.Enabled := True;
    CB_IPList.Enabled := True;
    //ed_Port.Enabled := True;
    CB_SerialComm.Enabled := False;
    btn_LanSetting.Enabled := True;
  end else
  begin
    //rg_ServerMode.Enabled := False;
    CB_IPList.Enabled := False;
    //ed_Port.Enabled := False;
    CB_SerialComm.Enabled := True;
    btn_LanSetting.Enabled := False;
  end;
end;

procedure TfmProgConfig.rg_LogChanging(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
  if NewIndex = 0 then
  begin
    btnFileOpen.Enabled := False;
    Label5.Enabled := False;
    ed_LogFileName.Enabled := False;
  end else
  begin
    btnFileOpen.Enabled := True;
    Label5.Enabled := True;
    ed_LogFileName.Enabled := True;
  end;
end;

procedure TfmProgConfig.btnFileOpenClick(Sender: TObject);
begin
    SaveDialog1.DefaultExt:= 'txt';
    SaveDialog1.Filter := 'Text files (*.txt)|*.txt';
    if SaveDialog1.Execute then
    begin
     ed_LogFileName.Text := SaveDialog1.FileName;
    end;

end;

function TfmProgConfig.GetSerialPortList(List: TStringList;
  const doOpenTest: Boolean): LongWord;
type
 TArrayPORT_INFO_1 = array[0..0] Of PORT_INFO_1;
 PArrayPORT_INFO_1 = ^TArrayPORT_INFO_1;
var
{$IF USE_ENUMPORTS_API}
 PL : PArrayPORT_INFO_1;
 TotalSize, ReturnCount : LongWord;
 Buf : String;
 CommNum : WORD;
{$IFEND}
 I : LongWord;
 CHandle : THandle;
begin
 List.Clear;
{$IF USE_ENUMPORTS_API}
 EnumPorts(nil, 1, nil, 0, TotalSize, ReturnCount);
 if TotalSize < 1 then begin
    Result := 0;
    Exit;
    end;
 GetMem(PL, TotalSize);
 EnumPorts(nil, 1, PL, TotalSize, TotalSize, Result);

 if Result < 1 then begin
    FreeMem(PL);
    Exit;
    end;

 for I:=0 to Result-1 do begin
    Buf := UpperCase(PL^[I].pName);
    CommNum := DecodeCommportName(PL^[I].pName);
    if CommNum = 0 then Continue;
    List.AddObject(EncodeCommportName(CommNum), Pointer(CommNum));
    end;
{$ELSE}
 for I:=1 to MAX_COMPORT do List.AddObject(EncodeCommportName(I), Pointer(I));
{$IFEND}
 // Open Test
 if List.Count > 0 then for I := List.Count-1 downto 0 do begin
    CHandle := CreateFile(PChar(List[I]), GENERIC_WRITE or GENERIC_READ,
     0, nil, OPEN_EXISTING,
     FILE_ATTRIBUTE_NORMAL,
     0);
    if CHandle = INVALID_HANDLE_VALUE then begin
if doOpenTest or (GetLastError() <> ERROR_ACCESS_DENIED) then List.Delete(I);
Continue;
end;
    CloseHandle(CHandle);
    end;

 Result := List.Count;
{$IF USE_ENUMPORTS_API}
 if Assigned(PL) then FreeMem(PL);
{$IFEND}

end;

function TfmProgConfig.DecodeCommportName(PortName: String): WORD;
var
 Pt : Integer;
begin
 PortName := UpperCase(PortName);
 if (Copy(PortName, 1, 3) = 'COM') then begin
    Delete(PortName, 1, 3);
    Pt := Pos(':', PortName);
    if Pt = 0 then Result := 0
       else Result := StrToInt(Copy(PortName, 1, Pt-1));
 end
 else if (Copy(PortName, 1, 7) = '\\.\COM') then begin
    Delete(PortName, 1, 7);
    Result := StrToInt(PortName);
 end
 else Result := 0;

end;

function TfmProgConfig.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

procedure TfmProgConfig.ed_PortKeyPress(Sender: TObject; var Key: Char);
var
  nOrd : integer;
begin

  nOrd := Ord(Key);

  if nOrd = 8 then Exit;
  if (nOrd < 48) then Key := #0;
  if (nOrd > 57) then Key := #0;

end;

procedure TfmProgConfig.FormCreate(Sender: TObject);
begin
  ComPortList := TStringList.Create;
  L_bConnectStart := False;
  G_bDirectConnect := False;
end;

procedure TfmProgConfig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ComPortList.Free;
end;

procedure TfmProgConfig.btn_LanSettingClick(Sender: TObject);
begin
  fmNetConfig:= TfmNetConfig.Create(Self);
  fmNetConfig.SHowmodal;
  fmNetConfig.Free;
  IPSetting;
end;

procedure TfmProgConfig.IPSetting;
var
  stIP : string;
  stPort : string;
  nPos : integer;
  stTemp : string;
begin
  stTemp := G_stTCPConf;
  if Trim(stTemp) <> '' then
  begin
    nPos := Pos(',',stTemp);
    stIP := copy(stTemp,1,nPos - 1);
    Delete(stTemp,1,nPos);
    nPos := Pos(',',stTemp);
    stPort := copy(stTemp,1,nPos - 1);
    Delete(stTemp,1,nPos);
    //copy(TCPConf,nPos + 1,Length(TCPConf) - nPos);
    if stIP = '' then Exit;
    CB_IPList.Text := stIP;
    ed_Port.Text := stPort;
    if isDigit(stTemp) then
      rg_ServerMode.ItemIndex := strtoint(stTemp);
  end;

  //ed_Port.Text:= FindCharCopy(TCPConf,1,',');

end;

procedure TfmProgConfig.CB_IPListChange(Sender: TObject);
begin
  G_stTCPConf := CB_IPList.Text + ',' + ed_Port.Text + ',' + inttostr(rg_ServerMode.ItemIndex);
end;

procedure TfmProgConfig.ed_PortChange(Sender: TObject);
begin
  G_stTCPConf := CB_IPList.Text + ',' + ed_Port.Text + ',' + inttostr(rg_ServerMode.ItemIndex);

end;

procedure TfmProgConfig.rg_ServerModeChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
  G_stTCPConf := CB_IPList.Text + ',' + ed_Port.Text + ',' + inttostr(rg_ServerMode.ItemIndex);
end;

procedure TfmProgConfig.Button1Click(Sender: TObject);
begin
CB_IPList.Color := clRed;
end;

end.
