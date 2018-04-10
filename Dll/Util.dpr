library Util;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  ShareMem,
  SysUtils,
  Classes,
  Forms,
  ShellAPI,
  Windows,
  WinSock,
  Controls,
  StdCtrls,
  RzButton,
  Gauges,
  ExtCtrls,
  Spin;

const
  SOH = #$1;
  STX = #$2;
  ETX = #$3;
  EOH = #$4;
  ENQ = #$5;
  ACK = #$6;
  NAK = #$15;
  EOT = #$04;
  TAB = #$09;
  HexString : String = '0123456789ABCDEF';

{$R *.res}
procedure ClearBitB(var b:byte; BitToClear: integer);
{ clear a bit in a byte }
begin
  if (BitToClear < 0) or (BitToClear > 7) then exit;
  b := b and not (1 shl BitToClear);
end;

{난수 번호만(BIT4,BIT3,BIT2,BIT1,BIT0) 을 data와 XOR 한다.}
Function DataConvert1(aMakeValue:Byte;aData:String):String;
var
  I: Integer;
  bData: String;
begin
  bData:= aData;
  for I:= 1 to Length(bData) do
  begin
    bData[I]:= Char(ord(bData[I]) XOR aMakeValue);
  end;
  Result:= bData;
end;

{ 난수 번호만(BIT4,BIT3,BIT2,BIT1,BIT0) 을 data와 XOR 후 Message No의 하위 Nibble과 다시 XOR 한다.}
Function DataConvert2(aMakeValue:Byte;aData:String):String;
var
  I: Integer;
  bMakeValue: Byte;
  bData: String;
  TempByte: Byte;
begin
  bData:= aData;
  {13번쩨 Byte 가 MessageNo}
  bMakeValue:= Ord(aData[13]) and $F;
  Result:= '';
  for I:= 1 to Length(bData) do
  begin
    if I <> 13 then
    begin
      TempByte:= ord(bData[I]) XOR aMakeValue;
      bData[I]:= Char(TempByte XOR bMakeValue);
    end;
  end;
  Result:= bData;
end;

function Convrtstr2Time(ast: string):TDatetime; export;
var
  aHour: Word;
  aMin: word;
begin
  Convrtstr2Time:= 0;
  if length(ast) < 4 then Exit;
  aHour:= StrtoInt(Copy(ast,1,2));
  aMin:= StrtoInt(Copy(ast,3,2));
  Convrtstr2Time:= Encodetime(aHour,aMin,00,00);
end;

function strToTimeFormat(aTime:string):string;export;
begin
  result := Copy(aTime,1,4)+'-'+Copy(aTime,5,2)+'-'+Copy(aTime,7,2) +' '+
                    Copy(aTime,9,2)+':'+Copy(aTime,11,2)+':'+Copy(aTime,13,2);
end;


function MakeSum(st:string;nCSType:integer=0):Char;
var
  i: Integer;
  aBcc: Byte;
  BCC: string;
begin
  aBcc := Ord(st[1]);
  for i := 2 to Length(st) do
  begin
    aBcc := aBcc + Ord(st[i]);
  end;
  if nCSType = 1 then
  begin
    aBcc := aBcc + Ord(#$A7);
  end;
  BCC := Chr(aBcc);
  Result := BCC[1];
end;

function Dec2Hex(N: LongInt; A: Byte): string; export;
begin
  Result := IntToHex(N, A);
end;

function Dec2Hex64(N: int64; A: Byte): string; export;
begin
    Result := IntToHex(N, A);
end;

function Hex2Dec(const S: string): Longint; export;
var
  HexStr: string;
begin
  if Pos('$', S) = 0 then HexStr := '$' + S
  else HexStr := S;
  Result := StrToIntDef(HexStr, 0);
end;

function Hex2Dec64(const S: string): int64; export;
var
  HexStr: string;
begin
  if Pos('$', S) = 0 then HexStr := '$' + S
  else HexStr := S;
  Result := StrToInt64Def(HexStr, 0);
end;

Function Hex2DecStr(S:String):String; export;
var
  i: longint;
  L: int64;
begin
  L:=0;
  for i := 1 to length(S) do L:=L*16 + pos(S[i],HexString)-1;
  Result:=intToStr(L);
end;

function ToHexStrNoSpace(st:string):String;export;
var
  I : Integer;
  st2: string;
  st3: string[3];
begin
  for I:= 1 to length(st) do
  begin
    st3:= Dec2Hex(ord(st[I]),1);
    if Length(st3) < 2 then st3:= '0'+ st3;
    st2:=st2 +st3;
  end;
  ToHexStrnospace:= st2;
end;

function Isdigit(st: string):Boolean;export;
var
  I: Integer;
begin
  result:=True;
  if Length(st) < 1 then
  begin
    result:=False;
    Exit;
  end;
  for I:=1 to Length(st) do
    if (st[I]< '0') or (st[I] > '9')  then result:=False
end;

function Hex2Ascii(St: String): String; export;
var
  st2: string;
  I: Integer;
  aLength: Integer;
  aa: Integer;
begin
  st2:= '';
  for I:= 1 to Length(st) do
  begin
    if st[i] <> #$20 then st2:= st2 + st[I];
  end;

  if Length(st2) MOD 2 <> 0 then
  begin
    aLength:= Length(st2);
    st:= copy(st2,1,aLength-1) + '0'+ st2[aLength];
  end else
  begin
   st:= st2;
  end;

  st2:= '';
  while st <> '' do
  begin
    aa:= Hex2Dec(copy(st,1,2));
    st2:= st2 + Char(aa);
    delete(st,1,2);
  end;
  Hex2Ascii:= st2;
end;

function HexToBinary(Hexadecimal: string):string; export;
const 
  BCD: array [0..15] of string = 
    ('0000', '0001', '0010', '0011', '0100', '0101', '0110', '0111', 
    '1000', '1001', '1010', '1011', '1100', '1101', '1110', '1111'); 
var 
  i: integer;
begin
  for i := Length(Hexadecimal) downto 1 do
    result := BCD[StrToInt('$' + Hexadecimal[i])] + result;
end;

function BinaryToHex(Binary:string):string;export;
function Bit2Dec(aBit:string):integer;
begin
  result := 0;
  if Length(aBit) <> 4 then Exit;
  result := strtoint(aBit[1]) * 8 +
            strtoint(aBit[2]) * 4 +
            strtoint(aBit[3]) * 2 +
            strtoint(aBit[4]) * 1;
end;
var
  nReminder : integer;
  i : integer;
  nDiv : integer;
  nDec : integer;
begin
  result := '';
  nReminder := length(Binary) mod 4;
  if nReminder <> 0 then
  begin
    for i := nReminder to 3 do
    begin
      Binary := '0' + Binary;
    end;
  end;
  nDiv := length(Binary) div 4;
  if length(Binary) = 0 then Exit;
  for i := 1 to nDiv do
  begin
    nDec := Bit2Dec(copy(Binary,(i - 1) * 4 + 1,4));
    result := result + Dec2Hex(nDec,1);
  end;
end;

function FillZeroNumber(aNo:LongInt; aLength:Integer): string; export;
var
  I       : Integer;
  st      : string;
  strNo   : String;
  StrCount: Integer;
begin
  Strno:= InttoStr(aNo);
  StrCount:= Length(Strno);
  St:= '';
  StrCount:=  aLength - StrCount;
  if StrCount > 0 then
  begin
    st:='';
    for I:=1 to StrCount do St:=st+'0';
    St:= St + StrNo;
    FillZeroNumber:= st;
  end else FillZeroNumber:= copy(Strno,1,aLength);
end;

function FillZeroNumber2(aNo:INt64; aLength:Integer): string;  export;
var
  I       : Integer;
  st      : string;
  strNo   : String;
  StrCount: Integer;
begin
  Strno:= InttoStr(aNo);
  StrCount:= Length(Strno);
  St:= '';
  StrCount:=  aLength - StrCount;
  if StrCount > 0 then
  begin
    st:='';
    for I:=1 to StrCount do St:=st+'0';
    St:= St + StrNo;
    FillZeroNumber2:= st;
  end else FillZeroNumber2:= copy(Strno,1,aLength);
end;

function FillZeroStrNum(aNo:String; aLength:Integer;bFront:Boolean = True): string; export;
var
  I       : Integer;
  st      : string;
  strNo   : String;
  StrCount: Integer;
begin
  Strno:= aNo;
  StrCount:= Length(Strno);
  St:= '';
  StrCount:=  aLength - StrCount;
  if StrCount > 0 then
  begin
    st:='';
    for I:=1 to StrCount do St:=st+'0';
    if bFront then St:= St + StrNo
    else St:= StrNo + St;
    FillZeroStrNum:= st;
  end else FillZeroStrNum:= copy(Strno,1,aLength);
end;

function SetStrlength(st : String; aLength : Integer) : String; export;
begin
  result := st;
  while Length(Result) < aLength do
    Result := Result + ' ';
  Result := Copy(Result,1,aLength);
end;

function IncTime(ATime: TDateTime; Hours, Minutes, Seconds,
  MSecs: Integer): TDateTime;  export;
begin
  Result := ATime + (Hours div 24) + (((Hours mod 24) * 3600000 +
    Minutes * 60000 + Seconds * 1000 + MSecs) / MSecsPerDay);
  if Result < 0 then Result := Result + 1;
end;

Function FindCharCopy(SourceStr : String; Index : integer; aChar:Char) : String; export;
Var
  a, b : Integer;
  st   : String;
begin
  a := 0;
//  b := 1;
  st := '';
  if (Length(SourceStr) < 1) then begin result:= ''; exit;  end;
  for b:=1 to Length(SourceStr) do
  begin
    if a = index then break;
    if SourceStr[b] = aChar then Inc(a);
  end;
  if (a = Index) then
  begin
    while (b <= Length(SourceStr)) and (SourceStr[b] <> aChar) do
    begin
      st := st + SourceStr[b];
      Inc(b);
    end;
  end;
  Result := st;
end;

function posCount(SubStr,S:string):integer; export;
var
  nCount : integer;
  stTemp : string;
  nPosition : integer;
begin
  nCount := 0;
  stTemp := S;
  nPosition := pos(substr,stTemp);
  while Not(nPosition = 0) do
  begin
    inc(nCount);
    stTemp := copy(stTemp,nPosition + 1 ,Length(stTemp) - nPosition);
    nPosition := pos(substr,stTemp);
  end;
  result := nCount;
end;

function PosIndex(SubStr,S:string;nIndex:integer):integer; export;
var
  nPosition : integer;
  stTemp : string;
  i : integer;
  nTemp : integer;
begin
  nPosition := 0;
  stTemp := S;
  nTemp := pos(substr,stTemp);
  for i := 1 to nIndex do
  begin
    nPosition := nPosition + nTemp;
    stTemp := copy(stTemp,nTemp + 1 ,Length(stTemp) - nTemp);
    nTemp := pos(substr,stTemp);
  end;
  result := nPosition;
end;

//***********************************//
//  전문 관련                        //
//***********************************//



{CheckSum을 만든다}
Function MakeCSData(aData: string;nCSType:integer=0):String; export;
var
  aSum: Integer;
  st: string;
begin
  aSum:= Ord(MakeSum(aData,nCSType));
  aSum:= aSum*(-1);
  st:= Dec2Hex(aSum,2);

  Result:= copy(st,Length(st)-1,2);
end;

function EncodeData(aKey:Byte; aData: String): String; export;
var
  Encodetype: Integer;
  aMakeValue: Byte;
  I: Integer;
begin
  EncodeType:= aKey SHR 6; //7,6 번 Bit가 엔코딩 타입
  aMakeValue:= aKey;
  for I:= 5 to 7 do ClearBitB(aMakeValue,I); //1,2,3,4,5 Bit가 난수번호

  case EncodeType of
    0: Result:= DataConvert1(aMakeValue,aData);
    1: Result:= DataConvert2(aMakeValue,aData);
    else Result:= aData;
  end;
end;

function EncodeCardNo(aCardNo: string): String; export;
var
  I: Integer;
  xCardNo: String;
  st: String;
begin
  aCardNo:= Dec2Hex64(StrtoInt64(aCardNo),8);
  xCardNo:= Hex2Ascii(aCardNo);
  for I:= 1 to 4 do
  begin
    st := st + Char((Ord(xCardNo[I]) shr 4) + $30) + Char((Ord(xCardNo[I]) and $F) + $30);
  end;
  Result:= st;
end;

function DecodeCardNo(aCardNo: string): String; export;
var
  I: Integer;
  st: string;
  bCardNo: int64;
  nTemp : integer;
  stTemp : string;
begin

  for I := 1 to 8 do
  begin
    if (I mod 2) <> 0 then
    begin
      nTemp := Ord(aCardNo[I]);
      nTemp := nTemp shl 4;
      aCardNo[I] := Char(nTemp);
    end else
    begin
      nTemp := ord(aCardNo[I]);
      nTemp := nTemp - $30;
      stTemp :=  Char(nTemp);
      aCardNo[I] := Char(nTemp);
      //aCardNo[I] := Char(Ord(aCardNo[I]) - $30); //상위니블을 0으로 만든다.
      //st:= st + char(ord(aCardNo[I-1]) +ord(aCardNo[I]));
      nTemp := ord(aCardNo[I-1]);
      nTemp := nTemp + ord(aCardNo[I]);
      stTemp := char(nTemp);
      st:= st + char(ord(aCardNo[I-1]) + ord(aCardNo[I]));
    end;
    //aCardNo[I] := Char(Ord(aCardNo[I]) - $30);
    //st := st + aCardNo[I];
  end;


  st:= tohexstrNospace(st);


  bCardNo:= Hex2Dec64(st);
  st:= FillZeroNumber2(bCardNo,10);
  Result:= st;

end;

function getCheckSumData(aData: string;aLength:integer): String;
begin
  result := copy(aData,aLength - 2,2);
end;

function ChekCSData(aData: String;aLength,aProgramType:integer): Boolean;
var
  stCheckSum : string;
  stMakeCS : string;
begin
  result := False;
  stCheckSum := getCheckSumData(aData,aLength);
  stMakeCS := MakeCSData(copy(aData,1,aLength - 3) + ETX,aProgramType);
  if stMakeCS = stCheckSum then result := True;
end;

function CheckDecorderDataPacket(aData: String;
  var aLeavePacketData: String;var aPacketData:string):integer;
var
  stLen: String;
  nDefinedDataLength: Integer;
  stBuff: String;
begin
  result := -1;

  aPacketData:= '';
  stLen:= Copy(aData,2,3);
  //데이터 길이 위치 데이터가 숫자가 아니면...
  if not isDigit(stLen) then
  begin
    aLeavePacketData:= aData;
    Exit;
  end;

  //패킷에 정의된 길이
  nDefinedDataLength:= StrtoInt(stLen);
  //패킷에 정의된 길이보다 실제 데이터가 작으면
  if Length(aData) < nDefinedDataLength then
  begin
    result := -2;  // 2010.11.25 수정 작게 들어 온 상태
    aLeavePacketData:= aData;
    Exit;
  end;

  // 정의된 길이 마지막 데이터가 ETX가 맞는가?
  if aData[nDefinedDataLength] = EOH then
  begin
    result := 2; //Decorder Format 이 맞음
    stBuff:= Copy(aData,1,nDefinedDataLength);
    aPacketData:=stBuff;
    Delete(aData, 1, nDefinedDataLength);
    aLeavePacketData:= aData;
  end else
  begin
    aLeavePacketData:= aData;
  end;
end;

function CheckDataPacket(aData: String;aProgramType:integer; var aLeavePacketData:String;var aPacketData:string):integer;
var
  stLen: String;
  nDefinedDataLength: Integer;
  stBuff: String;
  stTemp : string;
  aKey: Byte;
begin

  result := -1; //비정상 전문

  aPacketData:= '';
  if Length(aData) < 5 then
  begin
    result := -2; //자릿수가 작게 들어온 경우
    aLeavePacketData:= aData;           //한자리 삭제 후  리턴
    Exit;
  end;
  stLen:= Copy(aData,2,3);
  //데이터 길이 위치 데이터가 숫자가 아니면...
  if not isDigit(stLen) then
  begin
    //Delete(aData,1,1);       //1'st STX 삭제
    aLeavePacketData:= aData;           //한자리 삭제 후  리턴
    Exit;
  end;

  //패킷에 정의된 길이
  nDefinedDataLength:= StrtoInt(stLen);
  //패킷에 정의된 길이보다 실제 데이터가 작으면
  if Length(aData) < nDefinedDataLength then
  begin
    result := -2; //자릿수가 작게 들어온 경우
    aLeavePacketData:= aData;
    Exit;
  end;

  // 정의된 길이 마지막 데이터가 ETX가 맞는가?
  if aData[nDefinedDataLength] = ETX then
  begin

    stBuff:= Copy(aData,1,nDefinedDataLength);
    // 2010.11.22 패킷 체크 부분에서 체크썸까지 체크로 변경 하기 위해서 작업 함.
    //31:Q++()./,-**s*S^**+()./,-()
    aKey:= Ord(stBuff[5]);
    stTemp:= Copy(stBuff,1,5) + EncodeData(aKey,Copy(stBuff,6,Length(stBuff)-6))+stBuff[Length(stBuff)];

    if Not ChekCSData(stTemp,Length(stBuff),aProgramType) then
    begin
      //Delete(aData,1,1);
      aLeavePacketData:= aData;
      Exit;
    end;

    result := 1; //STX 포맷이 맞다
    Delete(aData, 1, nDefinedDataLength);
    aLeavePacketData:= aData;
    aPacketData:=stTemp;
  end else
  begin
    aLeavePacketData:= aData;
  end;
end;

function PacketCreate(aProgramType:integer;aLen,aVer,aDeviceID,aCmd,aData,aMsgNo:string):string; export;
var
  stPacket : string;
  nKey : integer;
begin
  stPacket := STX + aLen + #$20 + aVer + aDeviceID + aCmd + aMsgNo + aData;
  stPacket  := stPacket + MakeCSData(stPacket + ETX,aProgramType) + ETX;
  nKey    := $20;
  result := Copy(stPacket, 1, 5) + EncodeData(nKey,
    Copy(stPacket, 6, Length(stPacket) - 6)) + ETX;
end;

function PacketFormatCheck(aData: String;aProgramType:integer; var aLeavePacketData,
  aPacketData: String): integer; export;
begin

  aPacketData := '';
  result := -1; //비정상 전문

  if aData[1] = SOH then
  begin
    result := CheckDecorderDataPacket(aData,aLeavePacketData,aPacketData);
  end else if aData[1] = STX then
  begin
    result:= CheckDataPacket(aData,aProgramType,aLeavePacketData,aPacketData);
  end else
  begin
    aLeavePacketData := aData;
  end;
end;


//*********************Form 관련 함수
//Edit 찾는 함수
Function TravelEditItem(GroupBox:TGroupBox;stName:string; no:Integer):TEdit;export;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TEdit(GroupBox.Controls[Loop]);
      exit;
    End;
  End;

end;
//SpinEdit 찾는 함수
Function TravelSpinEditItem(GroupBox:TGroupBox;stName:string; no:Integer):TSpinEdit;export;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TSpinEdit(GroupBox.Controls[Loop]);
      exit;
    End;
  End;

end;
//RzBitBtn 찾는 함수
Function TravelRzBitBtnItem(GroupBox:TGroupBox;stName:string; no:Integer):TRzBitBtn; export;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TRzBitBtn(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;
//RzBitBtn Tag로 찾는 함수
Function TravelRzBitBtnTagItem(GroupBox:TGroupBox;aTag:Integer):TRzBitBtn; export;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    if GroupBox.Controls[Loop].Tag = aTag then
    Begin
      Try
        Result:=TRzBitBtn(GroupBox.Controls[Loop]);
        exit;
      Except
        continue;
      End;
    End;
  End;
end;
//CheckBox 찾는 함수
Function TravelCheckBoxItem(GroupBox:TGroupBox;stName:string; no:Integer):TCheckBox; export;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TCheckBox(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

//CheckBox Tag로  찾는 함수
Function TravelCheckBoxTagItem(GroupBox:TGroupBox;aTag:integer):TCheckBox; export;
var
Loop:integer;
begin
  Result:= Nil;   
  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If GroupBox.Controls[Loop].Tag = aTag then
    Begin
      Try
        Result:=TCheckBox(GroupBox.Controls[Loop]);
        exit;
      Except
        continue;
      End;
    End;
  End;
end;

//ComboBox 찾는 함수
Function TravelComboBoxItem(GroupBox:TGroupBox;stName:string; no:Integer):TComboBox; export;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TComboBox(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;
//Label 찾는 함수
Function TravelLabelItem(GroupBox:TGroupBox;stName:string; no:Integer):TLabel; export;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TLabel(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

//Gauge 찾는 함수
Function TravelGaugeItem(GroupBox:TGroupBox;stName:string; no:Integer):TGauge;export;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TGauge(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

//StaticText 찾는 함수
Function TravelTStaticTextItem(GroupBox:TGroupBox;stName:string; no:Integer):TStaticText;export;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TStaticText(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

//StaticText 찾는 함수
Function TravelTPanelItem(GroupBox:TGroupBox;stName:string; no:Integer):TPanel;export;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = LowerCase(stName) + inttostr(no) then
    Begin
      Result:=TPanel(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

//GroupBox Tag로  찾는 함수
Function TravelTGroupBoxTagItem(GroupBox:TGroupBox;aTag:integer):TGroupBox; export;
var
Loop:integer;
begin
  Result:= Nil;
  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If GroupBox.Controls[Loop].Tag = aTag then
    Begin
      Try
        Result:=TGroupBox(GroupBox.Controls[Loop]);
        exit;
      Except
        continue;
      End;
    End;
  End;
end;

//********************OS관련 함수
// 도스 명령 실행 함수/프로시져

function MyF_UsingWinNT: Boolean;
var
  OS: TOSVersionInfo; 
begin 
  OS.dwOSVersionInfoSize := Sizeof(OS); 
  GetVersionEx(OS);
  if OS.dwPlatformId = VER_PLATFORM_WIN32_NT then Result:= True 
  else Result:= False; 
end; 

// 도스 명령 실행 프로시져 
procedure My_RunDosCommand(Command : string; nShow : Boolean = False; bWait:Boolean = True);export;
var 
  hReadPipe : THandle; 
  hWritePipe : THandle; 
  SI : TStartUpInfo; 
  PI : TProcessInformation; 
  SA : TSecurityAttributes; 
  SD : TSecurityDescriptor; 
  BytesRead : DWORD; 
  Dest : array[0..1023] of char; 
  CmdLine : array[0..512] of char;
  TmpList : TStringList; 
  S, Param : string; 
  Avail, ExitCode, wrResult : DWORD; 
begin
  if MyF_UsingWinNT then begin
    InitializeSecurityDescriptor(@SD, SECURITY_DESCRIPTOR_REVISION); 
    SetSecurityDescriptorDacl(@SD, True, nil, False); 
    SA.nLength := SizeOf(SA); 
    SA.lpSecurityDescriptor := @SD; 
    SA.bInheritHandle := True; 
    Createpipe(hReadPipe, hWritePipe, @SA, 1024); 
  end else begin 
    Createpipe(hReadPipe, hWritePipe, nil, 1024); 
  end;
  
  try
     //Screen.Cursor := crHourglass; 
     FillChar(SI, SizeOf(SI), 0); 
     SI.cb := SizeOf(TStartUpInfo); 
     if nShow then begin 
       SI.wShowWindow := SW_SHOWNORMAL 
     end else begin 
       SI.wShowWindow := SW_HIDE; 
     end;
     SI.dwFlags := STARTF_USESHOWWINDOW;
     SI.dwFlags := SI.dwFlags or STARTF_USESTDHANDLES; 
     SI.hStdOutput := hWritePipe; 
     SI.hStdError := hWritePipe; 
     StrPCopy(CmdLine, Command); 
     //if CreateProcess(nil,CmdLine , nil, nil, True, NORMAL_PRIORITY_CLASS, nil, nil, SI, PI) then begin
     if CreateProcess(nil,pchar(Command) , nil, nil, True,  DETACHED_PROCESS, nil, nil, SI, PI) then begin
       if bWait then
       begin
         ExitCode := 0;
         while ExitCode = 0 do begin
           wrResult := WaitForSingleObject(PI.hProcess, 50);
           if PeekNamedPipe(hReadPipe, nil, 0, nil, @Avail, nil) then begin 
             if Avail > 0 then begin 
               TmpList := TStringList.Create; 
               try 
                 FillChar(Dest, SizeOf(Dest), 0); 
                 ReadFile(hReadPipe, Dest, Avail, BytesRead, nil); 
               finally
                 TmpList.Free; 
               end; 
             end; 
           end;
           if wrResult <> WAIT_TIMEOUT then begin
             ExitCode := 1;
           end;
           Application.ProcessMessages; 
         end; 
         GetExitCodeProcess(PI.hProcess, ExitCode); 
         CloseHandle(PI.hProcess); 
         CloseHandle(PI.hThread);
       end;
     end; 
  finally 
     CloseHandle(hReadPipe); 
     CloseHandle(hWritePipe); 
     Screen.Cursor := crDefault; 
  end;
end;


exports
  Convrtstr2Time,
  strToTimeFormat,
  MakeCSData,
  Dec2Hex,
  Dec2Hex64,
  Hex2Dec,
  Hex2Dec64,
  Hex2DecStr,
  Hex2Ascii,
  HexToBinary,
  BinaryToHex,
  ToHexStrNoSpace,
  Isdigit,
  IncTime,
  FindCharCopy,
  posCount,
  PosIndex,
  FillZeroNumber,
  FillZeroNumber2,
  FillZeroStrNum,
  SetStrlength,
  EncodeData,
  EncodeCardNo,
  DecodeCardNo,

  PacketCreate,
  PacketFormatCheck,

  TravelEditItem,
  TravelSpinEditItem,
  TravelRzBitBtnItem,
  TravelRzBitBtnTagItem,
  TravelCheckBoxItem,
  TravelCheckBoxTagItem,
  TravelComboBoxItem,
  TravelLabelItem,
  TravelGaugeItem,
  TravelTStaticTextItem,
  TravelTPanelItem,
  TravelTGroupBoxTagItem,

  My_RunDosCommand;

begin
end.
