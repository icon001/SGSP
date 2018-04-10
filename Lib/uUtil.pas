unit uUtil;


interface

uses
  SysUtils, Classes,Windows,Forms,
  ComCtrls,
  uCheckValiable,
  uCommon,
  dllFunction,
  WinSock;

  procedure Delay(MSecs: Longint);
  procedure MyDelay(Milliseconds: DWORD);
  function ResponseCheck(aIndex,aDelay:integer):Boolean;
  Function ByteCopy(p:pAnsiChar;n:cardinal):String;
  function CardReaderResponseCheck(aIndex,aDelay:integer):Boolean;
  function CardReaderVersionResponseCheck(aIndex,aDelay:integer):Boolean;
  function ZoneExtentionVersionResponseCheck(aIndex,aDelay:integer):Boolean;
  function PortResponseCheck(aIndex,aDelay:integer):Boolean;
  function GetNodeByText(ATree : TTreeView; AValue:String; AVisible: Boolean): TTreeNode;
  function CheckIPType(aIP:string;aZeroType:Boolean):Boolean;
  function SetSpacelength(st : String; aLength : Integer) : String;
  function Get_Local_IPAddr : string;
  Function GetIpFromDomain(aDomain:string):string;
  function Ascii2Hex(aData:string;bReverse:Boolean = False):string;
  function MakeHexSum(aHex:string;nCSType:integer=0):Char;
  Function MakeHexCSData(aHexData: string;nCSType:integer=0):String;
  procedure LogSave(aFileName,ast:string);
  function IsIPTypeCheck(ip: string): Boolean;
  function FillCharStr(aCardNo:string;aChar:char;aLen:integer):string;

implementation

function Ascii2Hex(aData:string;bReverse:Boolean = False):string;
var
  i : integer;
  stHex : string;
  nLen : integer;
begin
  stHex := '';
  nLen := Length(aData);
  for i:= 1 to nLen do
  begin
    if Not bReverse then stHex := stHex + Dec2Hex(Ord(aData[i]),2)
    else stHex := Dec2Hex(Ord(aData[i]),2) + stHex;
  end;
  result := stHex;
end;

Function ByteCopy(p:pAnsiChar;n:cardinal):String;
var
  rP:pAnsiChar;
begin
  setLength(result,n);
  rP:=pAnsiChar(result);
  while n <> 0 do
  begin
    rP^:=p^;
    inc(rP);
    inc(p);
    dec(n);
  end;
end;

procedure Delay(MSecs: Longint);
var
  FirstTickCount, Now: Longint;
begin
  FirstTickCount := GetTickCount;
  repeat
    Application.ProcessMessages;
    { allowing access to other controls, etc. }
    Now := GetTickCount;
  until (Now - FirstTickCount >= MSecs) or (Now < FirstTickCount);
end;

procedure MyDelay(Milliseconds: DWORD);
{by Hagen Reddmann}
var
  Tick: DWORD;
  NowTick: DWORD;
  Event: THandle;
begin
  Event := CreateEvent(nil, False, False, nil);
  try
    //WaitForSingleObject(Event,Milliseconds);

    Tick := GetTickCount + DWORD(Milliseconds);
    while (Milliseconds > 0) and
      (MsgWaitForMultipleObjects(1, Event, False, Milliseconds,
      QS_ALLINPUT) <> WAIT_TIMEOUT) do
    begin
      sleep(1);
      //MyProcessMessage;
      Application.ProcessMessages;
      Try
        NowTick := GetTickCount;
        if Tick > NowTick then
          Milliseconds := Tick - NowTick
        else Milliseconds := 0 ;
      Except
        Exit;
      End;
    end;
  finally
    CloseHandle(Event);
  end;
end;


function MakeHexSum(aHex:string;nCSType:integer=0):Char;
var
  i: Integer;
  aBcc: Byte;
  BCC: string;
begin
  aBcc := 0;
  for i := 1 to (Length(aHex) div 2) do
  begin
    //aBcc := aBcc + Ord(Hex2Ascii(copy(aHex,(i * 2) - 1,2)));
    aBcc := aBcc + Hex2Dec(copy(aHex,(i * 2) - 1,2));
  end;
  if nCSType = 1 then
  begin
    aBcc := aBcc + Ord(#$A7);
  end else if nCSType = 2 then
  begin
    aBcc := aBcc + Ord(#$9E);
  end;
  BCC := Chr(aBcc);
  Result := BCC[1];
end;

Function MakeHexCSData(aHexData: string;nCSType:integer=0):String;
var
  aSum: Integer;
  I: Integer;
  st: string;
begin
  aSum:= Ord(MakeHexSum(aHexData,nCSType));
  aSum:= aSum*(-1);
  st:= Dec2Hex(aSum,2);
  st := copy(st,Length(st)-1,2);
  Result := Ascii2Hex(st);
end;

function ResponseCheck(aIndex,aDelay:integer):Boolean;
var
  FirstTickCount : double;
begin
  Try
    G_bResponseChecking := True;
    FirstTickCount := GetTickCount + aDelay;
    While Not G_bDeviceResponse[aIndex] do
    begin
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;
    end;
    result := G_bDeviceResponse[aIndex];
  Finally
    G_bResponseChecking := False;
  End;
end;

function CardReaderResponseCheck(aIndex,aDelay:integer):Boolean;
var
  FirstTickCount : double;
begin
  Try
    G_bResponseChecking := True;
    FirstTickCount := GetTickCount + aDelay;
    While Not G_bCardReaderResponse[aIndex] do
    begin
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;
    end;
    result := G_bCardReaderResponse[aIndex];
  Finally
    G_bResponseChecking := False;
  End;
end;

function CardReaderVersionResponseCheck(aIndex,aDelay:integer):Boolean;
var
  FirstTickCount : double;
begin
  Try
    G_bResponseChecking := True;
    FirstTickCount := GetTickCount + aDelay;
    While Not G_bCardReaderVersionResponse[aIndex] do
    begin
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;
    end;
    result := G_bCardReaderVersionResponse[aIndex];
  Finally
    G_bResponseChecking := False;
  End;
end;

function ZoneExtentionVersionResponseCheck(aIndex,aDelay:integer):Boolean;
var
  FirstTickCount : double;
begin
  Try
    G_bResponseChecking := True;
    FirstTickCount := GetTickCount + aDelay;
    While Not G_bExtentionVersionResponse[aIndex] do
    begin
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;
    end;
    result := G_bExtentionVersionResponse[aIndex];
  Finally
    G_bResponseChecking := False;
  End;
end;

function PortResponseCheck(aIndex,aDelay:integer):Boolean;
var
  FirstTickCount : double;
begin
  Try
    G_bResponseChecking := True;
    FirstTickCount := GetTickCount + aDelay;
    While Not G_bPortResponse[aIndex] do
    begin
      if G_bApplicationTerminate then Exit;
      Application.ProcessMessages;
      if GetTickCount > FirstTickCount then Break;
    end;
    result := G_bPortResponse[aIndex];
  Finally
    G_bResponseChecking := False;
  End;
end;

function GetNodeByText(ATree : TTreeView; AValue:String; AVisible: Boolean): TTreeNode;
var
    Node: TTreeNode;
begin

  Result := nil;
  if ATree.Items.Count = 0 then Exit;
  Node := ATree.Items[0];
  while Node <> nil do
  begin
    if UpperCase(Node.Text) = UpperCase(AValue) then
    begin
      Result := Node;
      if AVisible then
        Result.MakeVisible;
      Break;
    end;
    Node := Node.GetNext;
  end;
end;

function CheckIPType(aIP:string;aZeroType:Boolean):Boolean;
var
  stTemp : string;
  i : integer;
  nSum : integer;
  nTemp : integer;
begin
  Result := False;
  nSum := 0;
  Try
    for i := 0 to 3 do
    begin
      stTemp  := FindCharCopy(aIP, i, '.');
      nTemp  := StrToInt(stTemp);
      if nTemp > 255 then Exit;
      nSum := nSum + nTemp;
    end;
  Except
    Exit;
  End;

  if Not aZeroType then //0.0.0.0 을 잘못된 타입으로 인식하는 경우
  begin
    if nSum = 0 then Exit;
  end;
  result := True;
end;

function SetSpacelength(st : String; aLength : Integer) : String;
begin
  result := st;
  while Length(Result) < aLength do
    Result := Result + ' ';
  Result := Copy(Result,1,aLength);
end;

function Get_Local_IPAddr : string;
 type
   TaPInAddr = array [0..10] of PInAddr;
   PaPInAddr = ^TaPInAddr;
 var
   phe : PHostEnt;
   pptr : PaPInAddr;
   Buffer : array [0..63] of char;
   I : Integer;
   GInitData : TWSADATA;
begin
 try
   WSAStartup($101, GInitData);
   Result := '';
   GetHostName(Buffer, SizeOf(Buffer));
   phe := GetHostByName(buffer);
   if phe = nil then Exit;
   pptr := PaPInAddr(Phe^.h_addr_list);
   i := 0;
   result := '';
   while pptr^[I] <> nil do
   begin
     result:= result + StrPas(inet_ntoa(pptr^[I]^)) + ' ';
     Inc(I);
   end;
 finally WSACleanup; end;
end;

Function GetIpFromDomain(aDomain:string):string;
var
  WSAData1: WSADATA;
  HostEnt: PHostEnt;
  pAddr: PChar;
  addr: in_addr;
begin
  Result:='';
 
  // GetHostByName 을 쓰기 위해 WSAStartup 을 한번 해줘야 함
  if WSAStartup(MAKEWORD(2, 2), WSAData1)<>0 then Exit;
 
  // WSAStartup 호출이 제대로 되지 않음을 체크(?)
  if (LOBYTE(WSAData1.wVersion)<>2) or (HIBYTE(WSAData1.wVersion)<>2) then begin
    WSACleanup;
    Exit;
  end;
 
  // HostEnt 로 매개변수로 받아온 도메인이름의 정보를 받아옴
  HostEnt := GetHostByName(pAnsiChar(aDomain));
  if HostEnt=nil then Exit;
 
  // PChar 형 변수로 ip 주소를 옮김
  pAddr := HostEnt^.h_addr_list^;
  if pAddr=nil then Exit;
 
  // 옮긴 ip 주소를 in_addr 로 적절히 변환
  addr.S_un_b.s_b1 := pAddr[0];
  addr.S_un_b.s_b2 := pAddr[1];
  addr.S_un_b.s_b3 := pAddr[2];
  addr.S_un_b.s_b4 := pAddr[3];
 
  // 변환된 ip 주소를 반환
  Result := inet_ntoa(addr);
end;


procedure LogSave(aFileName,ast:string);
Var
  f: TextFile;
  st: string;
  stDir : string;
begin
  {$I-}
  stDir := ExtractFilePath(aFileName);
  if not DirectoryExists(stDir) then CreateDir(stDir);

  AssignFile(f, aFileName);
  Append(f);
  if IOResult <> 0 then Rewrite(f);
  st := FormatDateTIme('yyyy-mm-dd hh:nn:ss:zzz">"',Now) + ' ' + ast;
  WriteLn(f,st);
  System.Close(f);
  {$I+}
end;

function IsIPTypeCheck(ip: string): Boolean;
var
   z, i: byte;
   st: array[1..3] of byte;
const
   ziff = ['0'..'9'];
begin
   st[1]  := 0;
   st[2]  := 0;
   st[3]  := 0;
   z      := 0;
   Result := False;
   for i := 1 to Length(ip) do
   if ip[i] in ziff then
   else
   begin
     if ip[i] = '.' then
     begin
       Inc(z);
       if z < 4 then st[z] := i
       else
       begin
         Exit;
       end;
     end
     else
     begin
       Exit;
     end;
   end;
   if (z <> 3) or (st[1] < 2) or (st[3] = Length(ip)) or (st[1] + 2 > st[2]) or
     (st[2] + 2 > st[3]) or (st[1] > 4) or (st[2] > st[1] + 4) or (st[3] > st[2] + 4) then
   begin
     Exit;
   end;
   z := StrToInt(Copy(ip, 1, st[1] - 1));
   if (z > 255) or (ip[1] = '0') then
   begin
     Exit;
   end;
   z := StrToInt(Copy(ip, st[1] + 1, st[2] - st[1] - 1));
   if (z > 255) or ((z <> 0) and (ip[st[1] + 1] = '0')) then
   begin
     Exit;
   end;
   z := StrToInt(Copy(ip, st[2] + 1, st[3] - st[2] - 1));
   if (z > 255) or ((z <> 0) and (ip[st[2] + 1] = '0')) then
   begin
     Exit;
   end;
   z := StrToInt(Copy(ip, st[3] + 1, Length(ip) - st[3]));
   if (z > 255) or ((z <> 0) and (ip[st[3] + 1] = '0')) then
   begin
     Exit;
   end;
   result := True;
end;

function FillCharStr(aCardNo:string;aChar:char;aLen:integer):string;
var
  nLen : integer;
  i : integer;
begin
  nLen := length(aCardNo);
  for i:=nLen + 1 to aLen do
  begin
    aCardNo := aCardNo + aChar;
  end;
  result := aCardNo;
end;

end.
