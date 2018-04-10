unit uCardEvent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, LMDCustomScrollBox, LMDListBox,
  ComCtrls, Menus, Grids, BaseGrid, AdvGrid, uSubForm, CommandArray, Gauges,
  AdvObj;

type
  TfmCardEvent = class(TfmASubForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    Panel5: TPanel;
    GroupBox5: TGroupBox;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel10: TPanel;
    GroupBox6: TGroupBox;
    btn_CardReg: TSpeedButton;
    btn_CardDelete: TSpeedButton;
    Label4: TLabel;
    st_selectCard: TStaticText;
    Panel9: TPanel;
    GroupBox7: TGroupBox;
    Panel12: TPanel;
    GroupBox9: TGroupBox;
    Panel11: TPanel;
    GroupBox8: TGroupBox;
    sg_Card: TAdvStringGrid;
    sg_DoorDevice: TAdvStringGrid;
    sg_AlarmDevice: TAdvStringGrid;
    sg_DoorPermitDevice: TAdvStringGrid;
    sg_AlarmPermitDevice: TAdvStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btn_CardEventDelete: TSpeedButton;
    cmb_Device: TComboBox;
    cmb_Door: TComboBox;
    cmb_CardReader: TComboBox;
    TabSheet2: TTabSheet;
    GroupBox10: TGroupBox;
    Panel13: TPanel;
    GroupBox11: TGroupBox;
    Label5: TLabel;
    btn_CardPermitSearch: TSpeedButton;
    cmb_Device1: TComboBox;
    sg_cardPermit: TAdvStringGrid;
    GroupBox12: TGroupBox;
    LMDListBox2: TLMDListBox;
    sg_cardevent: TAdvStringGrid;
    GroupBox13: TGroupBox;
    LMDListBox3: TLMDListBox;
    chk_eventTolist: TCheckBox;
    chk_SearchToList: TCheckBox;
    Gauge_CardList: TGauge;
    Gauge_Permit: TGauge;
    btn_SearchCancel: TSpeedButton;
    Label6: TLabel;
    ed_date: TEdit;
    Label7: TLabel;
    cmb_CardType: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CardEventDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg_CardCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure cmb_Device1Change(Sender: TObject);
    procedure btn_CardPermitSearchClick(Sender: TObject);
    procedure sg_CardClick(Sender: TObject);
    procedure btn_CardRegClick(Sender: TObject);
    procedure sg_DoorDeviceCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_DoorPermitDeviceCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure btn_CardDeleteClick(Sender: TObject);
    procedure sg_AlarmDeviceCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure sg_AlarmPermitDeviceCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure btn_SearchCancelClick(Sender: TObject);
    procedure cmb_CardTypeChange(Sender: TObject);
  private
    //폼
    L_nCardReadDataCount : integer;
    L_nCheckCount : integer;
    L_nDoorInsertPermitCheckCount : integer;
    L_nAlarmInsertPermitCheckCount : integer;
    L_nDoorDeletePermitCheckCount : integer;
    L_nAlarmDeletePermitCheckCount : integer;
    { Private declarations }
    procedure LoadControler;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    function GetFirstCheckListData(sg_list:TAdvStringGrid;aIndex:integer):string;
  private
    //리스트
    procedure InsertCardEventList(sg_list:TAdvStringGrid;aECUID, aDoorNo, aReaderNo,
      aInOut, aTime, aCardMode, aDoorMode, aChangeState, aAccessResult,
      aDoorState, aATButton, aCardNo:string);
    procedure CardListAdd(aCardNo,aPatrolType,aPositionNum:string);  //sg_card insert
    procedure InsertCardList(sg_list:TAdvStringGrid;aCardNo,aPatrolType:string;aCheckBox:Boolean=True);
    procedure InsertIntoPermitList(sg_list:TAdvStringGrid;aCardNo,aDoor1,aDoor2,aAlarm,
                             aValidDate,aRcvAck,aCardType:string);

    procedure InsertDeviceList(sg_list:TAdvStringGrid;aData:string;aCheckBox:Boolean=True);
    procedure InsertDevicePermitList(sg_list:TAdvStringGrid;aDevice,aState:string;aCheckBox:Boolean=True);
    procedure DeleteDeviceCardPermit(aEcuID:string);
    procedure CuserMovesgCard(aCardNo:string);

    procedure cardPermitTableToList(sg_list:TAdvStringGrid;aECUID:string);
    procedure CardTableToList(sg_list:TAdvStringGrid);
    procedure DeviceTableToList;
    procedure PermitTableToDeviceList(aCardNo:string);
  private
    //테이블 처리
    Function IsCardGrade(aEcuID, aCardNo:string):Boolean;
    Function CheckTB_CARD(aCardNo:string):Boolean;
    Function InsertIntoTB_CARD(aCardNo,aCardType,aPositionNum:string):Boolean;
    Function InsertIntoTB_CARDPERMIT(aEcuID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
             aAlarm,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8,aValidDate,aRcvAck,aPositionNum,aPatrolType:string):Boolean;
    Function DeleteTB_CARDPERMIT_Door(aEcuID,aDoorNo,aCardNo:string):Boolean;
    Function DeleteTB_CARDPERMIT_ALARM(aEcuID,aCardNo:string):Boolean;
  public
    //데이터수신
    { Public declarations }
    procedure RecvCardAccessEvent(aECUID, aDoorNo,
      aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
      aAccessResult, aDoorState, aATButton, stCardNo:string);
    procedure RecvCardListSearch(aECUID,aData:string);
    procedure RecvCardRegist(aECUID, aDoorNo, aCmd,
          aCardType, aCardNo, aExpireDate, aRegResult,aCardAuth, aTimeMode:string);
  public
    procedure SettingChange;
  end;

var
  fmCardEvent: TfmCardEvent;

implementation

uses
  udmDataBase,
  uSocket,
  dllFunction,
  uCommon;
{$R *.dfm}

procedure TfmCardEvent.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('CARDEVENTVIEW').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('CARDEVENTVIEW').Execute;
  Action := caFree;
end;

procedure TfmCardEvent.btn_CardEventDeleteClick(Sender: TObject);
begin
  RowGridInitialize(sg_CardEvent);
  L_nCardReadDataCount:= 0;
end;

procedure TfmCardEvent.FormCreate(Sender: TObject);
begin
  L_nCardReadDataCount := 0;
  L_nCheckCount := 0;
  L_nDoorInsertPermitCheckCount := 0;
  L_nAlarmInsertPermitCheckCount := 0;
  L_nDoorDeletePermitCheckCount := 0;
  L_nAlarmDeletePermitCheckCount := 0;
  LoadControler;
  GridInit(sg_card,1,2,True);
  cardPermitTableToList(sg_cardPermit,cmb_Device1.Text);
  CardTableToList(sg_Card);
  DeviceTableToList;

  with dmDataBase.TB_CARD do
  begin
    First;
    while Not Eof do
    begin
      Delete;
      Next;
    end;
  end;

end;


procedure TfmCardEvent.LoadControler;
begin
  cmb_Device.Clear;
  cmb_Device.Items.Add('전체');
  cmb_Device1.Clear;
  with dmDataBase.TB_DEVICE do
  begin
    First;
    while Not Eof do
    begin
      if FindField('DEVICEUSE').AsString = 'Y' then
      begin
        cmb_Device.Items.Add(FindField('ECU_ID').AsString);
        cmb_Device1.Items.Add(FindField('ECU_ID').AsString);
      end;
      Next;
    end;
  end;
  cmb_Device.ItemIndex := 0;
  cmb_Device1.ItemIndex := 0;
end;

procedure TfmCardEvent.FormShow(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('CARDEVENTVIEW').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('CARDEVENTVIEW').Execute;


  PageControl1.ActivePageIndex := 0;
end;

procedure TfmCardEvent.RecvCardAccessEvent(aECUID, aDoorNo, aReaderNo,
  aInOut, aTime, aCardMode, aDoorMode, aChangeState, aAccessResult,
  aDoorState, aATButton, stCardNo: string);
begin
  if cmb_Device.ItemIndex > 0 then
  begin
    if aECUID <> cmb_Device.Text then Exit;
  end;
  if cmb_Door.ItemIndex > 0 then
  begin
    if strtoint(aDoorNo) <> cmb_Door.ItemIndex then Exit;
  end;
  if cmb_CardReader.ItemIndex > 0 then
  begin
    if strtoint(aReaderNo) <> cmb_CardReader.ItemIndex then Exit;
  end;
  InsertCardEventList(sg_cardevent,aECUID, aDoorNo, aReaderNo,
      aInOut, aTime, aCardMode, aDoorMode, aChangeState, aAccessResult,
      aDoorState, aATButton, stCardNo);
  if chk_eventTolist.Checked then
  begin
    CardListAdd(stCardNo,'','');
  end;
end;

procedure TfmCardEvent.InsertCardEventList(sg_list:TAdvStringGrid; aECUID, aDoorNo,
  aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
  aAccessResult, aDoorState, aATButton, aCardNo: string);
var
  nRow : integer;
  stTemp : string;
begin
  inc(L_nCardReadDataCount);
  with sg_list do
  begin
    if cells[0,1] = '' then nRow := 1
    else
    begin
      AddRow;
      nRow := RowCount - 1;
    end;
    cells[0,nRow] := inttostr(L_nCardReadDataCount);
    cells[1,nRow] := Copy(aTime,1,4)+'-'+
       Copy(aTime,5,2)+'-'+
       Copy(aTime,7,2)+' '+
       Copy(aTime,9,2)+':'+
       Copy(aTime,11,2)+':'+
       Copy(aTime,13,2);
    cells[2,nRow] := aCardNo;
    cells[3,nRow] := aECUID;
    cells[4,nRow] := aDoorNo;
    cells[5,nRow] := aReaderNo;
    cells[6,nRow] := aATButton;
    case aCardMode[1] of
      '0': stTemp := 'Positive';
      '1': stTemp := 'Negative';
      '2': stTemp := 'Positive(2)';
      '3': stTemp := 'Negative(3)';
      else   stTemp := aCardMode ;
    end;
    cells[7,nRow] := stTemp;
    case aDoorMode[1] of
      '0': stTemp:= '운영모드';
      '1': stTemp:= '개방모드';
      '2': stTemp:= '폐쇄모드';
      else   stTemp:= aDoorMode;
    end;
    cells[8,nRow] := stTemp;
    case aChangeState[1] of
      'C': stTemp:= '카드';
      'P': stTemp:= '전화';
      'R': stTemp:= '원격제어';
      'B': stTemp:= '버튼';
      'S': stTemp:= '스케쥴';
      else stTemp:= aChangeState;
    end;
    cells[9,nRow] := stTemp;
    case aAccessResult[1]of
      #$30: stTemp:= '해당사항없음';
      #$31: stTemp:= '출입승인';
      #$32: stTemp:= '방범카드조작'; //방범카드조작(*)
      #$41: stTemp:= '미등록카드';
      #$42: stTemp:= '출입불가';
      #$43: stTemp:= '방범불가'; //미등록카드(*)
      #$44: stTemp:= '경계모드출입불가';
      #$45: stTemp:= '출입제한시간';
      #$46: stTemp:= '유효기간만료';
      else stTemp:= aAccessResult ;
    end;
    cells[10,nRow] := stTemp;
    case aDoorState[1]of
      'C': stTemp:= '닫힘';
      'O': stTemp:= '열림';
      else stTemp:= aDoorState;
    end;
    cells[11,nRow] := stTemp;

    SelectRows(nRow,1);
  end;
end;

procedure TfmCardEvent.CardListAdd(aCardNo,aPatrolType,aPositionNum: string);
begin
  if Not CheckTB_CARD(aCardNo) then
  begin
    if aPositionNum = '' then
    begin
      G_nMaxCardPositionNum := G_nMaxCardPositionNum + 1;
      aPositionNum := inttostr(G_nMaxCardPositionNum);
    end;
    InsertIntoTB_CARD(aCardNo,aPatrolType,aPositionNum);
    InsertCardList(sg_Card,aCardNo,aPatrolType);
  end else CuserMovesgCard(aCardNo);
end;

function TfmCardEvent.CheckTB_CARD(aCardNo: string): Boolean;
begin
  result := dmDataBase.CheckTB_CARD(aCardNo);
end;

function TfmCardEvent.InsertIntoTB_CARD(aCardNo,aCardType,aPositionNum: string): Boolean;
begin
  result := dmDataBase.InsertIntoTB_CARD(aCardNo,aCardType,aPositionNum);
end;

procedure TfmCardEvent.InsertCardList(sg_list: TAdvStringGrid;
  aCardNo,aPatrolType: string;aCheckBox:Boolean=True);
var
  nRow : integer;
begin
  with sg_list do
  begin
    if cells[0,1] = '' then nRow := 1
    else
    begin
      AddRow;
      nRow := RowCount - 1;
    end;
    Cells[0,nRow] := aCardNo;
    Cells[1,nRow] := aPatrolType;
    if aCheckBox then AddCheckBox(0,nRow,False,False);
    SelectRows(nRow,1);
  end;
end;

procedure TfmCardEvent.sg_CardCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nCheckCount := L_nCheckCount + 1
    else L_nCheckCount := L_nCheckCount - 1 ;
  end;

end;

procedure TfmCardEvent.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
  for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
  begin
    (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
  end;
end;

procedure TfmCardEvent.cmb_Device1Change(Sender: TObject);
begin
  cardPermitTableToList(sg_cardPermit,cmb_Device1.Text);
end;



procedure TfmCardEvent.cardPermitTableToList(sg_list: TAdvStringGrid;
  aECUID: string);
begin
  GridInitialize(sg_list);
  with dmDataBase.TB_CARDPERMIT do
  begin
    First;
    while Not Eof do
    begin
      if FindField('ECUID').AsString = aECUID then
      begin
        if FindField('PERMIT').AsString = 'L' then
        begin
          InsertIntoPermitList(sg_list,
                             FindField('CARDNO').AsString,
                             FindField('DOOR1').AsString,
                             FindField('DOOR2').AsString,
                             FindField('ALARM').AsString,
                             FindField('VALIDDATE').AsString,
                             FindField('RCVACK').AsString,
                             FindField('CARDTYPE').AsString);
          if chk_SearchToList.Checked then CardListAdd(FindField('CARDNO').AsString,FindField('CARDTYPE').AsString,FindField('POSITIONNUM').AsString);
        end;
      end;
      Next;
    end;
  end;

end;

procedure TfmCardEvent.InsertIntoPermitList(sg_list: TAdvStringGrid;
  aCardNo, aDoor1, aDoor2, aAlarm, aValidDate, aRcvAck,aCardType: string);
var
  nRow : integer;
begin
  with sg_list do
  begin
    if cells[0,1] = '' then nRow := 1
    else
    begin
      AddRow;
      nRow := RowCount - 1;
    end;
    cells[0,nRow] := aCardNo;
    cells[1,nRow] := aDoor1;
    cells[2,nRow] := aDoor2;
    cells[3,nRow] := aAlarm;
    cells[4,nRow] := aValidDate;
    cells[5,nRow] := aRcvAck;
    cells[6,nRow] := aCardType;
  end;
end;

procedure TfmCardEvent.btn_CardPermitSearchClick(Sender: TObject);
begin
  btn_CardPermitSearch.Enabled := False;
  Gauge_CardList.Progress := 0;
  Gauge_CardList.Visible := True;
  btn_SearchCancel.Visible := True;
  cmb_Device1.Enabled := False;
  DeleteDeviceCardPermit(cmb_Device1.Text);
  dmSocket.DeviceCardSearch(cmb_Device1.Text);

end;

procedure TfmCardEvent.RecvCardListSearch(aECUID, aData: string);
var
  nStartPos : integer;
  nEndPos : integer;
  stPositionNum : string;
  nPosCount : integer;
  stDoorGrade : string;
  stAlarmGrade : string;
  stValiDate : string;
  stPositionCardNo : string;
  stDoor1 : string;
  stDoor2 : string;
  stAlarm : string;
  stPatrolType : string;
begin
{  if Pos('Card list end',aData) > 0 then
  begin
    Gauge_CardList.Visible := False;
    btn_SearchCancel.Visible := False;
    cmb_Device1.Enabled := True;
    btn_CardPermitSearch.Enabled := True;
    Exit;
  end;
  if Pos('Card list start',aData) > 0  then
  begin
    nStartPos := PosIndex('<',aData,1);
    nEndPos := PosIndex('>',aData,1);
    stPositionNum := copy(aData,nStartPos + 1,nEndPos - nStartPos - 1);
    if IsDigit(stPositionNum) then
    begin
      if strtoint(stPositionNum) = 0 then
      begin
        showmessage('조회할 데이터가 없습니다.');
      end
      else begin
        Gauge_CardList.MaxValue := strtoint(stPositionNum);
        Gauge_CardList.Progress := 0;
        //CardSearchTimer.Enabled := True;
      end;
    end;
    Exit;
  end;
  Gauge_CardList.Progress := Gauge_CardList.Progress + 1;
  
  nPosCount := posCount(' ',aData);
  if nPosCount < 8 then Exit;  //카드리스트 내용이 아님
  nStartPos := PosIndex(' ',aData,1);
  nEndPos := PosIndex(' ',aData,2);
  stPositionNum := copy(aData,nStartPos + 1,nEndPos - nStartPos - 1);

  nStartPos := PosIndex(' ',aData,2);
  nEndPos := PosIndex(' ',aData,3);
  stDoorGrade := copy(aData,nStartPos + 1,nEndPos - nStartPos - 1);
  stDoorGrade := HexToBinary(stDoorGrade);

  nStartPos := PosIndex(' ',aData,3);
  nEndPos := PosIndex(' ',aData,4);
  stAlarmGrade := copy(aData,nStartPos + 1,nEndPos - nStartPos - 1);
  stAlarmGrade := HexToBinary(stAlarmGrade);

  nStartPos := PosIndex(' ',aData,6);
  nEndPos := PosIndex(' ',aData,7);
  stValiDate := copy(aData,nStartPos + 1,nEndPos - nStartPos - 1);
  stValiDate := StringReplace(stValiDate,'/','',[rfReplaceAll]);

  nStartPos := PosIndex(' ',aData,7);
  nEndPos := PosIndex(' ',aData,8);
  stPositionCardNo := copy(aData,nStartPos + 1,nEndPos - nStartPos - 1);

  if stDoorGrade[8] = '1' then stDoor1 := 'Y'
  else stDoor1 := 'N';
  if stDoorGrade[7] = '1' then stDoor2 := 'Y'
  else stDoor2 := 'N';
  if stAlarmGrade[8] = '1' then stAlarm := 'Y'
  else stAlarm := 'N';
  if stAlarmGrade[5] = '1' then stPatrolType := 'V'
  else stPatrolType := ' ';

  InsertIntoPermitList(sg_cardPermit,
                       stPositionCardNo,
                       stDoor1,
                       stDoor2,
                       stAlarm,
                       stValiDate,
                       'Y',
                       stPatrolType);
  InsertIntoTB_CARDPERMIT(aEcuID,stPositionCardNo,'L', stDoor1, stDoor2,
            stAlarm, stValiDate, 'Y',stPositionNum,stPatrolType);
  if chk_SearchToList.Checked then CardListAdd(stPositionCardNo,stPatrolType);
}
end;

procedure TfmCardEvent.DeleteDeviceCardPermit(aEcuID: string);
begin
  GridInitialize(sg_cardPermit);
  dmDataBase.DeleteTB_CARDPERMIT_DeviceID(aEcuID);
end;

function TfmCardEvent.InsertIntoTB_CARDPERMIT(aEcuID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
             aAlarm,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8, aValidDate, aRcvAck,aPositionNum,aPatrolType: string): Boolean;
begin
  result := dmDataBase.InsertIntoTB_CARDPERMIT(aEcuID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
             aAlarm,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8, aValidDate, aRcvAck,aPositionNum,aPatrolType);

end;

procedure TfmCardEvent.CuserMovesgCard(aCardNo: string);
var
  i : integer;
begin
  with sg_card do
  begin
    if rowCount < 3 then Exit;
    for i:= 1 to rowcount - 1 do
    begin
      if cells[0,i] = aCardNo then
      begin
        SelectRows(i,1);
        break;
      end;
    end;
  end;

end;

procedure TfmCardEvent.CardTableToList(sg_list: TAdvStringGrid);
begin
  GridInitialize(sg_list,2,TRUE);
  with dmDataBase.TB_CARD do
  begin
    First;
    while Not Eof do
    begin
      CardListAdd(FindField('CARDNO').AsString,FindField('CARDTYPE').AsString,FindField('POSITIONNUM').AsString);
      Next;
    end;
  end;
end;

procedure TfmCardEvent.DeviceTableToList;
var
  bPatrolUse : Boolean;
  i : integer;
  nDoorType : integer;
begin
  GridInitialize(sg_DoorDevice,2,TRUE);
  GridInitialize(sg_AlarmDevice,2,TRUE);
  L_nDoorDeletePermitCheckCount := 0;
  L_nAlarmDeletePermitCheckCount := 0;

  with dmDataBase.TB_DEVICE do
  begin
    First;
    while Not Eof do
    begin
      if FindField('DEVICEUSE').AsString = 'Y' then
      begin
        for i := 1 to FIXMAXDOORNO do
        begin
          Try
            nDoorType := strtoint(dmDataBase.CheckTB_DOORType(FindField('ECU_ID').AsString,'0',inttostr(i)));
          Except
            nDoorType := 0;
          end;
          if nDoorType > 0 then InsertDeviceList(sg_DoorDevice,FindField('ECU_ID').AsString + '-' + inttostr(i));
        end;
        //무조건 방범구역 사용
        InsertDeviceList(sg_AlarmDevice,FindField('ECU_ID').AsString);
      end;
      Next;
    end;
  end;

end;

procedure TfmCardEvent.InsertDeviceList(sg_list: TAdvStringGrid;
  aData: string;aCheckBox:Boolean=True);
var
  nRow : integer;
begin
  with sg_list do
  begin
    if cells[0,1] = '' then nRow := 1
    else
    begin
      AddRow;
      nRow := RowCount - 1;
    end;
    Cells[0,nRow] := aData;
    if aCheckBox then AddCheckBox(0,nRow,False,False);
    SelectRows(nRow,1);
  end;

end;

procedure TfmCardEvent.sg_CardClick(Sender: TObject);
var
  bchkState : Boolean;
begin
  with (Sender as TAdvStringGrid) do
  begin
    GetCheckBoxState(0,Row, bchkState);
    if bchkState then st_selectCard.Caption := Cells[0,Row]
    else
    begin
      st_selectCard.Caption := GetFirstCheckListData(sg_Card,0);
    end;
  end;
  PermitTableToDeviceList(st_selectCard.Caption);
end;

function TfmCardEvent.GetFirstCheckListData(sg_list: TAdvStringGrid;
  aIndex: integer): string;
var
  nRow : integer;
  bchkState : Boolean;
begin
  result := '';

  with sg_list do
  begin
    if rowcount < 2 then Exit;
    for nRow := 1 to rowcount - 1 do
    begin
      GetCheckBoxState(0,nRow, bchkState);
      if bchkState then
      begin
        SelectRows(nRow,1);
        result := Cells[aIndex,nRow];
        Exit;
      end;
    end;
  end;

end;

procedure TfmCardEvent.PermitTableToDeviceList(aCardNo: string);
begin
  GridInitialize(sg_DoorPermitDevice,2,TRUE);
  GridInitialize(sg_AlarmPermitDevice,2,TRUE);
  L_nDoorDeletePermitCheckCount := 0;
  L_nAlarmDeletePermitCheckCount := 0;

  if aCardNo = '' then Exit;
  with dmDataBase.TB_CARDPERMIT do
  begin
    First;
    while Not Eof do
    begin
      if FindField('CARDNO').AsString = aCardNo then
      begin
        if FindField('PERMIT').AsString = 'L' then
        begin
          if FindField('DOOR1').AsString = 'Y' then
          begin
            InsertDevicePermitList(sg_DoorPermitDevice,FindField('ECUID').AsString + '-1',FindField('RCVACK').AsString);
          end;
          if FindField('DOOR2').AsString = 'Y' then
          begin
            InsertDevicePermitList(sg_DoorPermitDevice,FindField('ECUID').AsString + '-2',FindField('RCVACK').AsString);
          end;
          if FindField('ALARM').AsString = 'Y' then
          begin
            InsertDevicePermitList(sg_AlarmPermitDevice,FindField('ECUID').AsString ,FindField('RCVACK').AsString);
          end;
        end;
      end;
      Next;
    end;
  end;


end;

procedure TfmCardEvent.InsertDevicePermitList(sg_list: TAdvStringGrid;
  aDevice, aState: string;aCheckBox:Boolean=True);
var
  nRow : integer;
begin
  with sg_list do
  begin
    if cells[0,1] = '' then nRow := 1
    else
    begin
      AddRow;
      nRow := RowCount - 1;
    end;
    Cells[0,nRow] := aDevice;
    Cells[1,nRow] := aState;
    if aCheckBox then AddCheckBox(0,nRow,False,False);
    SelectRows(nRow,1);
  end;

end;

procedure TfmCardEvent.btn_CardRegClick(Sender: TObject);
var
  nCardCount : integer;
  nDoorCount : integer;
  nAlarmCount : integer;
  bChkState : Boolean;
  stCardNo : string;
  stTemp : string;
  stEcuID : string;
  stDoorNo : string;
  stCardType : string;
  stPositionNum : string;
begin
  if cmb_CardType.ItemIndex <> 1 then
  begin
    if L_nCheckCount < 1 then
    begin
      showmessage('등록할 카드를 선택하여 주세요.');
      Exit;
    end;

    if (L_nDoorInsertPermitCheckCount + L_nAlarmInsertPermitCheckCount) < 1 then
    begin
      showmessage('등록할 출입문이나 방범구역을 선택하여 주세요.');
      Exit;
    end;
  end;

  if ed_date.Text = '' then ed_date.Text := '000000';
  
  if length(ed_date.Text) <> 6 then
  begin
    showmessage('유효기간은 6자리입니다.');
    Exit;
  end;
  if cmb_CardType.ItemIndex = 1 then stCardType := 'V'
  else stCardType := ' ';

  Gauge_Permit.Visible := True;
  Gauge_Permit.MaxValue := L_nCheckCount * (L_nDoorInsertPermitCheckCount + L_nAlarmInsertPermitCheckCount);
  Gauge_Permit.Progress := 0;

  for nCardCount := 1 to sg_Card.RowCount - 1 do
  begin
    sg_Card.GetCheckBoxState(0,nCardCount, bChkState);
    if bChkState then
    begin
      stCardNo := sg_Card.Cells[0,nCardCount];
      stPositionNum := sg_Card.Cells[1,nCardCount];
      for nDoorCount := 1 to sg_DoorDevice.RowCount - 1 do
      begin
        sg_DoorDevice.GetCheckBoxState(0,nDoorCount,bChkState);
        if bChkState then
        begin
          stTemp := sg_DoorDevice.cells[0,nDoorCount];
          stEcuID := copy(stTemp,1,2);
          stDoorNo := copy(stTemp,4,1);
          dmDataBase.InsertIntoTB_CARDPERMIT_Door(stEcuID,stDoorNo,stCardNo,ed_date.Text,stCardType,stPositionNum);
          Gauge_Permit.Progress := Gauge_Permit.Progress + 1;
          Application.ProcessMessages;
        end;
      end;
      for nAlarmCount := 1 to sg_AlarmDevice.RowCount - 1 do
      begin
        sg_AlarmDevice.GetCheckBoxState(0,nAlarmCount,bChkState);
        if bChkState then
        begin
          stTemp := sg_AlarmDevice.cells[0,nAlarmCount];
          stEcuID := copy(stTemp,1,2);
          dmDataBase.InsertIntoTB_CARDPERMIT_ALARM(stEcuID,stCardNo,'0',ed_date.Text,stCardType,stPositionNum);
          dmDataBase.InsertIntoTB_CARDPERMIT_ALARM(stEcuID,stCardNo,'1',ed_date.Text,stCardType,stPositionNum);
          dmDataBase.InsertIntoTB_CARDPERMIT_ALARM(stEcuID,stCardNo,'2',ed_date.Text,stCardType,stPositionNum);
          dmDataBase.InsertIntoTB_CARDPERMIT_ALARM(stEcuID,stCardNo,'3',ed_date.Text,stCardType,stPositionNum);
          dmDataBase.InsertIntoTB_CARDPERMIT_ALARM(stEcuID,stCardNo,'4',ed_date.Text,stCardType,stPositionNum);
          dmDataBase.InsertIntoTB_CARDPERMIT_ALARM(stEcuID,stCardNo,'5',ed_date.Text,stCardType,stPositionNum);
          dmDataBase.InsertIntoTB_CARDPERMIT_ALARM(stEcuID,stCardNo,'6',ed_date.Text,stCardType,stPositionNum);
          dmDataBase.InsertIntoTB_CARDPERMIT_ALARM(stEcuID,stCardNo,'7',ed_date.Text,stCardType,stPositionNum);
          dmDataBase.InsertIntoTB_CARDPERMIT_ALARM(stEcuID,stCardNo,'8',ed_date.Text,stCardType,stPositionNum);
          Gauge_Permit.Progress := Gauge_Permit.Progress + 1;
          Application.ProcessMessages;
        end;
      end;
      if cmb_CardType.ItemIndex = 1 then
      begin
        with dmDataBase.TB_DEVICE do
        begin
          First;
          Gauge_Permit.MaxValue := dmDataBase.TB_DEVICE.RecordCount;
          Gauge_Permit.Progress := 0;
          while Not Eof do
          begin
            if FindField('DEVICEUSE').AsString = 'Y' then
            begin
              stEcuID := FindField('ECU_ID').AsString;
              dmDataBase.InsertIntoTB_CARDPERMIT_Patrol(stEcuID,stCardNo,ed_date.Text,stCardType,stPositionNum);
              Gauge_Permit.Progress := Gauge_Permit.Progress + 1;
              Application.ProcessMessages;
            end;
            Next;
          end;
        end;
      end;
    end;
  end;
  Gauge_Permit.Visible := False;
  PermitTableToDeviceList(st_selectCard.Caption);
  cardPermitTableToList(sg_cardPermit,cmb_Device1.Text);
end;

procedure TfmCardEvent.sg_DoorDeviceCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nDoorInsertPermitCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nDoorInsertPermitCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nDoorInsertPermitCheckCount := L_nDoorInsertPermitCheckCount + 1
    else L_nDoorInsertPermitCheckCount := L_nDoorInsertPermitCheckCount - 1 ;
  end;

end;

procedure TfmCardEvent.sg_DoorPermitDeviceCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nDoorDeletePermitCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nDoorDeletePermitCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nDoorDeletePermitCheckCount := L_nDoorDeletePermitCheckCount + 1
    else L_nDoorDeletePermitCheckCount := L_nDoorDeletePermitCheckCount - 1 ;
  end;

end;

procedure TfmCardEvent.btn_CardDeleteClick(Sender: TObject);
var
  nCardCount : integer;
  bChkState : Boolean;
  nDoorCount : integer;
  nAlarmCount : integer;
  stCardNo : string;
  stTemp : string;
  stEcuID : string;
  stDoorNo : string;
begin
  if L_nCheckCount < 1 then
  begin
    showmessage('삭제할 카드를 선택하여 주세요.');
    Exit;
  end;

  if (L_nDoorDeletePermitCheckCount + L_nAlarmDeletePermitCheckCount) < 1 then
  begin
    showmessage('삭제할 출입문이나 방범구역을 선택하여 주세요.');
    Exit;
  end;
  Gauge_Permit.Visible := True;
  Gauge_Permit.MaxValue := L_nCheckCount * (L_nDoorDeletePermitCheckCount + L_nAlarmDeletePermitCheckCount);
  Gauge_Permit.Progress := 0;

  for nCardCount := 1 to sg_Card.RowCount - 1 do
  begin
    sg_Card.GetCheckBoxState(0,nCardCount, bChkState);
    if bChkState then
    begin
      stCardNo := sg_Card.Cells[0,nCardCount];
      for nDoorCount := 1 to sg_DoorPermitDevice.RowCount - 1 do
      begin
        sg_DoorPermitDevice.GetCheckBoxState(0,nDoorCount,bChkState);
        if bChkState then
        begin
          stTemp := sg_DoorPermitDevice.cells[0,nDoorCount];
          stEcuID := copy(stTemp,1,2);
          stDoorNo := copy(stTemp,4,1);
          DeleteTB_CARDPERMIT_Door(stEcuID,stDoorNo,stCardNo);
          Gauge_Permit.Progress := Gauge_Permit.Progress + 1;
          Application.ProcessMessages;
        end;
      end;
      for nAlarmCount := 1 to sg_AlarmPermitDevice.RowCount - 1 do
      begin
        sg_AlarmPermitDevice.GetCheckBoxState(0,nAlarmCount,bChkState);
        if bChkState then
        begin
          stTemp := sg_AlarmPermitDevice.cells[0,nAlarmCount];
          stEcuID := copy(stTemp,1,2);
          DeleteTB_CARDPERMIT_ALARM(stEcuID,stCardNo);
          Gauge_Permit.Progress := Gauge_Permit.Progress + 1;
          Application.ProcessMessages;
        end;
      end;
    end;
  end;
  Gauge_Permit.Visible := False;
  PermitTableToDeviceList(st_selectCard.Caption);
  cardPermitTableToList(sg_cardPermit,cmb_Device1.Text);
end;


function TfmCardEvent.DeleteTB_CARDPERMIT_ALARM(aEcuID,
  aCardNo: string): Boolean;
begin
  result := dmDataBase.DeleteTB_CARDPERMIT_ALARM(aEcuID,'', aCardNo);

  if Not IsCardGrade(aEcuID, aCardNo) then
  begin
    dmDataBase.UpdateTB_CARDPERMIT_PERMIT(aEcuID, aCardNo,'N');
  end;

end;

function TfmCardEvent.DeleteTB_CARDPERMIT_Door(aEcuID, aDoorNo,
  aCardNo: string): Boolean;
begin
  result := dmDataBase.DeleteTB_CARDPERMIT_Door(aEcuID, aDoorNo,aCardNo);

  if Not IsCardGrade(aEcuID, aCardNo) then
  begin
    dmDataBase.UpdateTB_CARDPERMIT_PERMIT(aEcuID, aCardNo,'N');
  end;

end;

function TfmCardEvent.IsCardGrade(aEcuID, aCardNo: string): Boolean;
begin
  result := dmDataBase.CardPermitCheck(aEcuID, aCardNo);
end;

procedure TfmCardEvent.sg_AlarmDeviceCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nAlarmInsertPermitCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nAlarmInsertPermitCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nAlarmInsertPermitCheckCount := L_nAlarmInsertPermitCheckCount + 1
    else L_nAlarmInsertPermitCheckCount := L_nAlarmInsertPermitCheckCount - 1 ;
  end;

end;

procedure TfmCardEvent.sg_AlarmPermitDeviceCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nAlarmDeletePermitCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nAlarmDeletePermitCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nAlarmDeletePermitCheckCount := L_nAlarmDeletePermitCheckCount + 1
    else L_nAlarmDeletePermitCheckCount := L_nAlarmDeletePermitCheckCount - 1 ;
  end;

end;

procedure TfmCardEvent.RecvCardRegist(aECUID, aDoorNo, aCmd, aCardType,
  aCardNo, aExpireDate, aRegResult, aCardAuth, aTimeMode: string);
begin
  if aEcuid <> cmb_Device1.Text then Exit;
  cardPermitTableToList(sg_cardPermit,cmb_Device1.Text);
end;

procedure TfmCardEvent.btn_SearchCancelClick(Sender: TObject);
begin
  inherited;
  Gauge_CardList.Visible := False;
  btn_SearchCancel.Visible := False;
  dmSocket.CardSearchCancel(cmb_Device1.Text);
  btn_CardPermitSearch.Enabled := True;
end;

procedure TfmCardEvent.SettingChange;
begin
  DeviceTableToList;
end;


procedure TfmCardEvent.cmb_CardTypeChange(Sender: TObject);
begin
  if cmb_CardType.ItemIndex = 1 then
  begin
    //panel14.Visible := True;
    panel10.Visible := False;
    panel9.Visible := False;

    //sg_DoorDevice.Enabled := False;
    //sg_AlarmDevice.Enabled := False;
  end else
  begin
    panel10.Visible := True;
    panel9.Visible := True;
    //sg_DoorDevice.Enabled := True;
    //sg_AlarmDevice.Enabled := True;
  end;  
end;

initialization
  RegisterClass(TfmCardEvent);
Finalization
  UnRegisterClass(TfmCardEvent);

end.
