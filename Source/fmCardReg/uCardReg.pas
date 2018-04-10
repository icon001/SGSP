unit uCardReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, LMDCustomScrollBox, LMDListBox,
  ComCtrls, Menus, Grids, BaseGrid, AdvGrid, uSubForm, CommandArray, Gauges,
  AdvObj, AsgLinks,AdvEdit;

type
  TfmCardReg = class(TfmASubForm)
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
    Gauge_Permit: TGauge;
    Label6: TLabel;
    ed_date: TEdit;
    pan_CardDelete: TPanel;
    btn_DeviceCardDelete: TSpeedButton;
    LoadTimer: TTimer;
    pan_Message: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    ButtonEnableTimer: TTimer;
    el1: TAdvEditEditLink;
    ed_Focus: TEdit;
    ed_CardPosition: TEdit;
    Gauge_CardList: TGauge;
    btn_SearchCancel: TSpeedButton;
    chk_SearchToList: TCheckBox;
    btn_RetrySend: TSpeedButton;
    btn_Copy: TSpeedButton;
    pan_cardCopy: TPanel;
    btn_CardCopy: TSpeedButton;
    btn_CopyCancel: TSpeedButton;
    Label7: TLabel;
    cmb_Device2: TComboBox;
    ed_PositionNum: TEdit;
    btn_RegCardCnt: TSpeedButton;
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
    procedure pan_CardDeleteClick(Sender: TObject);
    procedure btn_DeviceCardDeleteClick(Sender: TObject);
    procedure LoadTimerTimer(Sender: TObject);
    procedure pan_MessageResize(Sender: TObject);
    procedure ButtonEnableTimerTimer(Sender: TObject);
    procedure mn_CardPositionUpdateClick(Sender: TObject);
    procedure sg_cardPermitCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure sg_cardPermitGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure sg_cardPermitGetEditorProp(Sender: TObject; ACol,
      ARow: Integer; AEditLink: TEditLink);
    procedure sg_cardPermitKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sg_cardPermitMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sg_cardPermitSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ed_CardPositionKeyPress(Sender: TObject; var Key: Char);
    procedure ed_CardPositionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_CardPositionExit(Sender: TObject);
    procedure btn_RetrySendClick(Sender: TObject);
    procedure btn_CopyCancelClick(Sender: TObject);
    procedure btn_CopyClick(Sender: TObject);
    procedure btn_CardCopyClick(Sender: TObject);
    procedure sg_CardGetEditorProp(Sender: TObject; ACol, ARow: Integer;
      AEditLink: TEditLink);
    procedure sg_CardGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure sg_CardMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sg_CardSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ed_PositionNumExit(Sender: TObject);
    procedure ed_PositionNumKeyPress(Sender: TObject; var Key: Char);
    procedure ed_PositionNumKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_RegCardCntClick(Sender: TObject);
  private
    //폼
    L_bInformationLoad : Boolean;
    L_bRealKeyExit : Boolean;
    L_nCardReadDataCount : integer;
    L_nCheckCount : integer;
    L_nDoorInsertPermitCheckCount : integer;
    L_nAlarmInsertPermitCheckCount : integer;
    L_nDoorDeletePermitCheckCount : integer;
    L_nAlarmDeletePermitCheckCount : integer;
    L_nSelectRow : integer;
    { Private declarations }
    procedure DeviceCodeSearch;
    procedure DoorStateSearch;
    procedure DoorRelay2TypeSearch;
    procedure AlarmAreaUseSearch;
    procedure SystemZoneExtensionUseSearch;
    procedure MaxCardCountSearch;
    procedure LoadControler;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    function GetFirstCheckListData(sg_list:TAdvStringGrid;aIndex:integer):string;
  private
    //리스트
    procedure InsertCardEventList(sg_list:TAdvStringGrid;aECUID, aDoorNo, aReaderNo,
      aInOut, aTime, aCardMode, aDoorMode, aChangeState, aAccessResult,
      aDoorState, aATButton, aCardNo:string);
    procedure CardListAdd(aCardNo,aPatrolType,aPositionNum:string);  //sg_card insert
    procedure CardPermitSelect(aCardNo:string);
    procedure InsertCardList(sg_list:TAdvStringGrid;aCardNo,aPatrolType,aPositionNum:string;aCheckBox:Boolean=True);
    procedure InsertIntoPermitList(sg_list:TAdvStringGrid;aCardNo,aPositionNum,
              aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
              aAlarm,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8,
              aValidDate,aRcvAck,aCardType:string);

    procedure InsertDeviceList(sg_list:TAdvStringGrid;aData,aEcuID,aNo:string;aCheckBox:Boolean=True);
    procedure InsertDevicePermitList(sg_list:TAdvStringGrid;aDevice,aState,aEcuID,aNo:string;aCheckBox:Boolean=True);
    procedure DeleteDeviceCardPermit(aEcuID:string);
    procedure CuserMovesgCard(sg_list: TAdvStringGrid;aCardNo,aPatrolType,aPositionNum:string);

    procedure cardPermitTableToList(sg_list:TAdvStringGrid;aECUID:string);
    procedure CardTableToList(sg_list:TAdvStringGrid);
    procedure DeviceTableToList;
    procedure PermitTableToDeviceList(aCardNo:string);
    procedure SendCardStatusChange(aEcuID,aDoorNo,aSendState:string);
  private
    //테이블 처리
    Function IsCardGrade(aEcuID, aCardNo:string):Boolean;
    Function CheckTB_CARD(aCardNo:string):Boolean;
    Function InsertIntoTB_CARD(aCardNo,aCardType,aPositionNum:string):Boolean;
    Function InsertIntoTB_CARDPERMIT(aEcuID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
             aAlarm,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8,aValidDate,aRcvAck,aPositionNum,aPatrolType:string):Boolean;
    Function DeleteTB_CARDPERMIT_Door(aEcuID,aDoorNo,aCardNo:string):Boolean;
    Function DeleteTB_CARDPERMIT_ALARM(aEcuID,aArmArea,aCardNo:string):Boolean;
    Function CheckList(aCardNo:string):Boolean;
  public
    //데이터수신
    { Public declarations }
    procedure RecvCardAccessEvent(aECUID, aDoorNo,
      aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
      aAccessResult, aDoorState, aATButton, stCardNo:string);
    procedure RecvCardListSearch(aECUID,aData:string);
    procedure RecvCardRegist(aECUID, aDoorNo, aCmd,
          aCardType, aCardNo, aExpireDate, aRegResult,aCardAuth, aTimeMode,
          aCardIDNo,aAlarmAreaGrade,aDoorAreaGrade:string);
    procedure RecvCardRegCardCNT(aECUID,aData:string);
    procedure ArmAreaUseData(aECUID,aArmUse:string);
    procedure RecvCardAllClear(aECUID:string);

    procedure DownLoadCount(aCurrentPos,aMaxPos:integer;aGuageVisible:Boolean);
  public
    procedure SettingChange;
  end;

var
  fmCardReg: TfmCardReg;

implementation

uses
  udmDataBase,
  uSocket,
  dllFunction,
  uCommon, uMain,
  uMessage;
{$R *.dfm}

procedure TfmCardReg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('CARDREGVIEW').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('CARDREGVIEW').Execute;
  Action := caFree;
end;

procedure TfmCardReg.btn_CardEventDeleteClick(Sender: TObject);
begin
  RowGridInitialize(sg_CardEvent);
  L_nCardReadDataCount:= 0;
end;

procedure TfmCardReg.FormCreate(Sender: TObject);
begin
  L_nCardReadDataCount := 0;
  L_nCheckCount := 0;
  L_nDoorInsertPermitCheckCount := 0;
  L_nAlarmInsertPermitCheckCount := 0;
  L_nDoorDeletePermitCheckCount := 0;
  L_nAlarmDeletePermitCheckCount := 0;
  GridInit(sg_card,2,2,True);
  cardPermitTableToList(sg_cardPermit,cmb_Device1.Text);
  CardTableToList(sg_Card);
  LoadControler;

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


procedure TfmCardReg.LoadControler;
begin
  cmb_Device.Clear;
  cmb_Device.Items.Add('전체');
  cmb_Device1.Clear;
  cmb_Device2.Clear;
  with dmDataBase.TB_DEVICE do
  begin
    First;
    while Not Eof do
    begin
      if FindField('DEVICEUSE').AsString = 'Y' then
      begin
        cmb_Device.Items.Add(FindField('ECU_ID').AsString);
        cmb_Device1.Items.Add(FindField('ECU_ID').AsString);
        cmb_Device2.Items.Add(FindField('ECU_ID').AsString);
      end;
      Next;
    end;
  end;
  cmb_Device.ItemIndex := 0;
  cmb_Device1.ItemIndex := 0;
  cmb_Device2.ItemIndex := 0;
  cmb_Device1Change(cmb_Device1);
end;

procedure TfmCardReg.FormShow(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('CARDREGVIEW').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('CARDREGVIEW').Execute;

  //LockTypeCheck;

  PageControl1.ActivePageIndex := 1;
  LoadTimer.Enabled := True;
end;

procedure TfmCardReg.RecvCardAccessEvent(aECUID, aDoorNo, aReaderNo,
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
  //if chk_eventTolist.Checked then
  begin
    if L_bInformationLoad then
    begin
      //if Not isDigit(aAccessResult) then  //미승인 카드만 List Add 하자.
        CardListAdd(stCardNo,'','');
      //else CuserMovesgCard(sg_Card,stCardNo,'','');
    end else
    begin
      fmMessage := TfmMessage.Create(nil);
      fmMessage.Panel1.Caption := '기기 정보 조회 중에는 카드 이벤트를 표시하지 않습니다.';
      fmMessage.Show;
    end;
  end;
  CardPermitSelect(stCardNo);
end;

procedure TfmCardReg.InsertCardEventList(sg_list:TAdvStringGrid; aECUID, aDoorNo,
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

procedure TfmCardReg.CardListAdd(aCardNo,aPatrolType,aPositionNum: string);
begin
  if Not CheckList(aCardNo) then
  begin
    if aPositionNum = '' then
    begin
      G_nMaxCardPositionNum := G_nMaxCardPositionNum + 1;
      aPositionNum := inttostr(G_nMaxCardPositionNum);
    end;
    
    InsertIntoTB_CARD(aCardNo,aPatrolType,aPositionNum);
    InsertCardList(sg_Card,aCardNo,aPatrolType,aPositionNum);
  end else
  begin
    CuserMovesgCard(sg_Card,aCardNo,aPatrolType,aPositionNum);
  end;
end;

function TfmCardReg.CheckTB_CARD(aCardNo: string): Boolean;
begin
  result := dmDataBase.CheckTB_CARD(aCardNo);
end;

function TfmCardReg.InsertIntoTB_CARD(aCardNo,aCardType,aPositionNum: string): Boolean;
begin
  result := dmDataBase.InsertIntoTB_CARD(aCardNo,aCardType,aPositionNum);
end;

procedure TfmCardReg.InsertCardList(sg_list: TAdvStringGrid;
  aCardNo,aPatrolType,aPositionNum: string;aCheckBox:Boolean=True);
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
    Cells[1,nRow] := aPositionNum;
    Cells[2,nRow] := aPatrolType;
    if aCheckBox then AddCheckBox(0,nRow,False,False);
    SelectCells(0,nRow,0,nRow);
    //SelectRows(nRow,1);
  end;
end;

procedure TfmCardReg.sg_CardCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmCardReg.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
  for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
  begin
    (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
  end;
end;

procedure TfmCardReg.cmb_Device1Change(Sender: TObject);
var
  nIndex : integer;
  i : integer;
begin
  cardPermitTableToList(sg_cardPermit,cmb_Device1.Text);

  nIndex := DeviceList.IndexOf(cmb_Device1.Text);
  if nIndex < 0 then Exit;

  for i := 1 to FIXMAXDOORNO do
  begin
    if i > TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo then
    begin
      sg_cardPermit.ColWidths[i + 1] := 0;
    end else
    begin
      sg_cardPermit.ColWidths[i + 1] := 130;
    end;
  end;
  if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse then
  begin
    sg_cardPermit.ColWidths[10] := 0;
  end else
  begin
    sg_cardPermit.ColWidths[10] := 130;
  end;
  for i := 1 to FIXARMAREANO do
  begin
    if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse then
    begin
      sg_cardPermit.ColWidths[i + 10] := 130;
    end else
    begin
      sg_cardPermit.ColWidths[i + 10] := 0;
    end;
  end;
end;



procedure TfmCardReg.cardPermitTableToList(sg_list: TAdvStringGrid;
  aECUID: string);
var
  nSelectRow : integer;
  nTopRow : integer;
begin
  nSelectRow := sg_list.Row;
  nTopRow := sg_list.TopRow;
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
                             FindField('POSITIONNUM').AsString,
                             FindField('DOOR1').AsString,
                             FindField('DOOR2').AsString,
                             FindField('DOOR3').AsString,
                             FindField('DOOR4').AsString,
                             FindField('DOOR5').AsString,
                             FindField('DOOR6').AsString,
                             FindField('DOOR7').AsString,
                             FindField('DOOR8').AsString,
                             FindField('ALARM').AsString,
                             FindField('ALARM1').AsString,
                             FindField('ALARM2').AsString,
                             FindField('ALARM3').AsString,
                             FindField('ALARM4').AsString,
                             FindField('ALARM5').AsString,
                             FindField('ALARM6').AsString,
                             FindField('ALARM7').AsString,
                             FindField('ALARM8').AsString,
                             FindField('VALIDDATE').AsString,
                             FindField('RCVACK').AsString,
                             FindField('CARDTYPE').AsString);
          if chk_SearchToList.Checked then
             CardListAdd(FindField('CARDNO').AsString,FindField('CARDTYPE').AsString,FindField('POSITIONNUM').AsString);
        end;
      end;
      Next;
    end;
  end;
  sg_list.SortByColumn(1);
  if nTopRow >= sg_list.RowCount then Exit;
  sg_list.TopRow := nTopRow;
  sg_list.SelectCells(0,nSelectRow,0,nSelectRow);
  ed_CardPosition.Visible := False;
end;

procedure TfmCardReg.InsertIntoPermitList(sg_list: TAdvStringGrid;
  aCardNo,aPositionNum, aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
  aAlarm,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8,
  aValidDate, aRcvAck,aCardType: string);
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
    cells[1,nRow] := aPositionNum;
    cells[2,nRow] := aDoor1;
    cells[3,nRow] := aDoor2;
    cells[4,nRow] := aDoor3;
    cells[5,nRow] := aDoor4;
    cells[6,nRow] := aDoor5;
    cells[7,nRow] := aDoor6;
    cells[8,nRow] := aDoor7;
    cells[9,nRow] := aDoor8;
    cells[10,nRow] := aAlarm;
    cells[11,nRow] := aAlarm1;
    cells[12,nRow] := aAlarm2;
    cells[13,nRow] := aAlarm3;
    cells[14,nRow] := aAlarm4;
    cells[15,nRow] := aAlarm5;
    cells[16,nRow] := aAlarm6;
    cells[17,nRow] := aAlarm7;
    cells[18,nRow] := aAlarm8;
    cells[19,nRow] := aValidDate;
    cells[20,nRow] := aRcvAck;
    cells[21,nRow] := aCardType;
  end;
end;

procedure TfmCardReg.btn_CardPermitSearchClick(Sender: TObject);
begin
  btn_CardPermitSearch.Enabled := False;
  Gauge_CardList.Progress := 0;
  Gauge_CardList.Visible := True;
  btn_SearchCancel.Visible := True;
  cmb_Device1.Enabled := False;
  DeleteDeviceCardPermit(cmb_Device1.Text);
  dmSocket.DeviceCardSearch(cmb_Device1.Text);

end;

procedure TfmCardReg.RecvCardListSearch(aECUID, aData: string);
var
  nStartPos : integer;
  nEndPos : integer;
  stPositionNum : string;
  nPosCount : integer;
  stDoorGrade : string;
  stAlarmGrade : string;
  stAlarmAreaGrade : string;
  stValiDate : string;
  stPositionCardNo : string;
  stDoor1 : string;
  stDoor2 : string;
  stDoor3 : string;
  stDoor4 : string;
  stDoor5 : string;
  stDoor6 : string;
  stDoor7 : string;
  stDoor8 : string;
  stAlarm : string;
  stAlarm1 : string;
  stAlarm2 : string;
  stAlarm3 : string;
  stAlarm4 : string;
  stAlarm5 : string;
  stAlarm6 : string;
  stAlarm7 : string;
  stAlarm8 : string;
  stPatrolType : string;
begin
  if Pos('Card list end',aData) > 0 then
  begin
    Gauge_CardList.Visible := False;
    btn_SearchCancel.Visible := False;
    cmb_Device1.Enabled := True;
    btn_CardPermitSearch.Enabled := True;
    cardPermitTableToList(sg_cardPermit,cmb_Device1.Text);
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

  nStartPos := PosIndex(' ',aData,5);
  nEndPos := PosIndex(' ',aData,6);
  stAlarmAreaGrade := copy(aData,nStartPos + 1,nEndPos - nStartPos - 1);
  stAlarmAreaGrade := HexToBinary(stAlarmAreaGrade);

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
  if stDoorGrade[6] = '1' then stDoor3 := 'Y'
  else stDoor3 := 'N';
  if stDoorGrade[5] = '1' then stDoor4 := 'Y'
  else stDoor4 := 'N';
  if stDoorGrade[4] = '1' then stDoor5 := 'Y'
  else stDoor5 := 'N';
  if stDoorGrade[3] = '1' then stDoor6 := 'Y'
  else stDoor6 := 'N';
  if stDoorGrade[2] = '1' then stDoor7 := 'Y'
  else stDoor7 := 'N';
  if stDoorGrade[1] = '1' then stDoor8 := 'Y'
  else stDoor8 := 'N';
  if stAlarmGrade[8] = '1' then stAlarm := 'Y'
  else stAlarm := 'N';
  if stAlarmGrade[5] = '1' then stPatrolType := 'V'
  else stPatrolType := ' ';

  if stAlarmAreaGrade[8] = '1' then stAlarm1 := 'Y'
  else stAlarm1 := 'N';
  if stAlarmAreaGrade[7] = '1' then stAlarm2 := 'Y'
  else stAlarm2 := 'N';
  if stAlarmAreaGrade[6] = '1' then stAlarm3 := 'Y'
  else stAlarm3 := 'N';
  if stAlarmAreaGrade[5] = '1' then stAlarm4 := 'Y'
  else stAlarm4 := 'N';
  if stAlarmAreaGrade[4] = '1' then stAlarm5 := 'Y'
  else stAlarm5 := 'N';
  if stAlarmAreaGrade[3] = '1' then stAlarm6 := 'Y'
  else stAlarm6 := 'N';
  if stAlarmAreaGrade[2] = '1' then stAlarm7 := 'Y'
  else stAlarm7 := 'N';
  if stAlarmAreaGrade[1] = '1' then stAlarm8 := 'Y'
  else stAlarm8 := 'N';

  {
  stDoor1 : string;
  stDoor2 : string;
  stDoor3 : string;
  stDoor4 : string;
  stDoor5 : string;
  stDoor6 : string;
  stDoor7 : string;
  stDoor8 : string;
  stAlarm1 : string;
  stAlarm2 : string;
  stAlarm3 : string;
  stAlarm4 : string;
  stAlarm5 : string;
  stAlarm6 : string;
  stAlarm7 : string;
  stAlarm8 : string; }

  InsertIntoPermitList(sg_cardPermit,
                       stPositionCardNo,
                       stPositionNum,
                       stDoor1,
                       stDoor2,
                       stDoor3,
                       stDoor4,
                       stDoor5,
                       stDoor6,
                       stDoor7,
                       stDoor8,
                       stAlarm,
                       stAlarm1,
                       stAlarm2,
                       stAlarm3,
                       stAlarm4,
                       stAlarm5,
                       stAlarm6,
                       stAlarm7,
                       stAlarm8,
                       stValiDate,
                       'Y',
                       stPatrolType);
  InsertIntoTB_CARDPERMIT(aEcuID,stPositionCardNo,'L', stDoor1, stDoor2,stDoor3, stDoor4,stDoor5, stDoor6,stDoor7, stDoor8,
            stAlarm,stAlarm1,stAlarm2,stAlarm3,stAlarm4,stAlarm5,stAlarm6,stAlarm7,stAlarm8, stValiDate, 'Y',stPositionNum,stPatrolType);
  if chk_SearchToList.Checked then CardListAdd(stPositionCardNo,stPatrolType,stPositionNum);
  if isDigit(stPositionNum) then
  begin
    if strtoint(stPositionNum) > G_nMaxCardPositionNum then
      G_nMaxCardPositionNum := strtoint(stPositionNum);
  end;

end;

procedure TfmCardReg.DeleteDeviceCardPermit(aEcuID: string);
begin
  GridInitialize(sg_cardPermit);
  dmDataBase.DeleteTB_CARDPERMIT_DeviceID(aEcuID);
end;

function TfmCardReg.InsertIntoTB_CARDPERMIT(aEcuID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
             aAlarm,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8, aValidDate, aRcvAck,aPositionNum,aPatrolType: string): Boolean;
begin
  result := dmDataBase.InsertIntoTB_CARDPERMIT(aEcuID,aCardNo,aPermit,aDoor1,aDoor2,aDoor3,aDoor4,aDoor5,aDoor6,aDoor7,aDoor8,
             aAlarm,aAlarm1,aAlarm2,aAlarm3,aAlarm4,aAlarm5,aAlarm6,aAlarm7,aAlarm8, aValidDate, aRcvAck,aPositionNum,aPatrolType);

end;

procedure TfmCardReg.CuserMovesgCard(sg_list: TAdvStringGrid;aCardNo,aPatrolType,aPositionNum: string);
var
  i : integer;
//  bMove : Boolean;
begin
//  bMove := False;
  with sg_list do
  begin
    if rowCount < 3 then Exit;
    for i:= 1 to rowcount - 1 do
    begin
      if cells[0,i] = aCardNo then
      begin
        SelectCells(0,i,0,i);
        //SelectRows(i,1);
        if aPositionNum <> '' then
        begin
          Cells[1,i] := aPositionNum;
        end;
//        bMove := True;
        break;
      end;
    end;
  end;
//  if Not bMove then
//   InsertCardList(sg_list,aCardNo,aPatrolType,aPositionNum);
end;

procedure TfmCardReg.CardTableToList(sg_list: TAdvStringGrid);
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

procedure TfmCardReg.DeviceTableToList;
var
  bPatrolUse : Boolean;
  i : integer;
  j : integer;
  stAlarmAreaName : string;
begin
  GridInitialize(sg_DoorDevice,2,TRUE);
  GridInitialize(sg_AlarmDevice,2,TRUE);
  L_nDoorDeletePermitCheckCount := 0;
  L_nAlarmDeletePermitCheckCount := 0;

  for i := 0 to DeviceList.Count - 1 do
  begin
    if TCurrentDeviceState(DeviceList.Objects[i]).MaxDoorNo > 0 then
    begin
      for j := 1 to TCurrentDeviceState(DeviceList.Objects[i]).MaxDoorNo do
      begin
        if TCurrentDeviceState(DeviceList.Objects[i]).GetDoorUsed(j) then
        begin
          if (j = 2) and (TCurrentDeviceState(DeviceList.Objects[i]).DeviceType = KTT812) then
          begin
            if TCurrentDeviceState(DeviceList.Objects[i]).RELAY2TYPE > 0 then InsertDeviceList(sg_DoorDevice,DeviceList.Strings[i] + '-' + inttostr(j),DeviceList.Strings[i],inttostr(j));
          end else
          begin
            if j > 2 then
            begin
              if TCurrentDeviceState(DeviceList.Objects[i]).GetZoneExtentionUse(j-2) = '1' then
                 InsertDeviceList(sg_DoorDevice,DeviceList.Strings[i] + '-' + inttostr(j),DeviceList.Strings[i],inttostr(j));
            end else
              InsertDeviceList(sg_DoorDevice,DeviceList.Strings[i] + '-' + inttostr(j),DeviceList.Strings[i],inttostr(j));
          end;
        end;
      end;
    end;
    if TCurrentDeviceState(DeviceList.Objects[i]).ArmAreaSkill and
       TCurrentDeviceState(DeviceList.Objects[i]).ArmAreaUse  then
    begin
      for j := 1 to FIXARMAREANO do
      begin
        InsertDeviceList(sg_AlarmDevice,DeviceList.Strings[i]  + '-' + inttostr(j),DeviceList.Strings[i],inttostr(j));
      end;
    end else
    begin
      InsertDeviceList(sg_AlarmDevice,DeviceList.Strings[i],DeviceList.Strings[i],'0');
    end;

  end;

end;

procedure TfmCardReg.InsertDeviceList(sg_list: TAdvStringGrid;
  aData,aEcuID,aNo: string;aCheckBox:Boolean=True);
var
  nRow : integer;
  stName : string;
begin
  if aEcuID = '00' then stName := ' 주장치'
  else stName := ' 확장기' + aEcuID;
  if sg_list = sg_DoorDevice then
  begin
    stName := stName + '-' + aNo + '번문';
  end else
  begin
    if aNo <> '0' then
       stName := stName + '-' + aNo + '번구역';
  end;

  with sg_list do
  begin
    if cells[0,1] = '' then nRow := 1
    else
    begin
      AddRow;
      nRow := RowCount - 1;
    end;
    Cells[0,nRow] := stName;
    Cells[1,nRow] := aData;
    if aCheckBox then AddCheckBox(0,nRow,False,False);
    SelectRows(nRow,1);
  end;

end;

procedure TfmCardReg.sg_CardClick(Sender: TObject);
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

function TfmCardReg.GetFirstCheckListData(sg_list: TAdvStringGrid;
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

procedure TfmCardReg.PermitTableToDeviceList(aCardNo: string);
var
  i : integer;
  nIndex : integer;
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
          for i := 1 to FIXMAXDOORNO do
          begin
            if FindField('DOOR' + inttostr(i)).AsString = 'Y' then
               InsertDevicePermitList(sg_DoorPermitDevice,FindField('ECUID').AsString + '-' + inttostr(i),FindField('RCVACK').AsString,FindField('ECUID').AsString,inttostr(i));
          end;
          nIndex := DeviceList.IndexOf(FindField('ECUID').AsString);
          if nIndex > -1 then
          begin
            if Not TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaUse then
            begin
              if FindField('ALARM').AsString = 'Y' then
              begin
                InsertDevicePermitList(sg_AlarmPermitDevice,FindField('ECUID').AsString ,FindField('RCVACK').AsString,FindField('ECUID').AsString,'0');
              end;
            end else
            begin
              for i := 1 to FIXARMAREANO do
              begin
                if FindField('ALARM' + inttostr(i)).AsString = 'Y' then
                begin
                  InsertDevicePermitList(sg_AlarmPermitDevice,FindField('ECUID').AsString + '-' + inttostr(i),FindField('RCVACK').AsString,FindField('ECUID').AsString,inttostr(i));
                end;
              end;
            end;
          end;

        end;
      end;
      Next;
    end;
  end;


end;

procedure TfmCardReg.InsertDevicePermitList(sg_list: TAdvStringGrid;
  aDevice, aState,aEcuID,aNo: string;aCheckBox:Boolean=True);
var
  nRow : integer;
  stName : string;
begin
  if aEcuID = '00' then stName := ' 주장치'
  else stName := ' 확장기' + aEcuID;
  if sg_list = sg_DoorPermitDevice then
  begin
    stName := stName + '-' + aNo + '번문';
  end else
  begin
    if aNo <> '0' then
       stName := stName + '-' + aNo + '번구역';
  end;

  with sg_list do
  begin
    if cells[0,1] = '' then nRow := 1
    else
    begin
      AddRow;
      nRow := RowCount - 1;
    end;
    Cells[0,nRow] := stName;
    Cells[1,nRow] := aState;
    Cells[2,nRow] := aDevice;
    if aCheckBox then AddCheckBox(0,nRow,False,False);
    SelectRows(nRow,1);
  end;

end;

procedure TfmCardReg.btn_CardRegClick(Sender: TObject);
var
  nCardCount : integer;
  nDoorCount : integer;
  nAlarmCount : integer;
  bChkState : Boolean;
  stCardNo : string;
  stTemp : string;
  stEcuID : string;
  stDoorNo : string;
  stAlarmArea : string;
  stPositionNum : string;
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

  if ed_date.Text = '' then ed_date.Text := '000000';
  
  if length(ed_date.Text) <> 6 then
  begin
    showmessage('유효기간은 6자리입니다.');
    Exit;
  end;

  Gauge_Permit.Visible := True;
  Gauge_Permit.MaxValue := L_nCheckCount * (L_nDoorInsertPermitCheckCount + L_nAlarmInsertPermitCheckCount);
  Gauge_Permit.Progress := 0;
  btn_CardReg.Enabled := False;
  Try
    fmMain.L_bCardMemorySaving := True;

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
            stTemp := sg_DoorDevice.cells[1,nDoorCount];
            stEcuID := copy(stTemp,1,2);
            stDoorNo := copy(stTemp,4,1);
            if stDoorNo = '' then continue;
            dmDataBase.InsertIntoTB_CARDPERMIT_Door(stEcuID,stDoorNo,stCardNo,ed_date.Text,'',stPositionNum);
            Gauge_Permit.Progress := Gauge_Permit.Progress + 1;
            Application.ProcessMessages;
          end;
        end;
        for nAlarmCount := 1 to sg_AlarmDevice.RowCount - 1 do
        begin
          sg_AlarmDevice.GetCheckBoxState(0,nAlarmCount,bChkState);
          if bChkState then
          begin
            stTemp := sg_AlarmDevice.cells[1,nAlarmCount];
            stEcuID := copy(stTemp,1,2);
            stAlarmArea := '0';
            if Length(stTemp) = 4 then stAlarmArea := stTemp[4];
            dmDataBase.InsertIntoTB_CARDPERMIT_ALARM(stEcuID,stCardNo,stAlarmArea,ed_date.Text,'',stPositionNum);
            Gauge_Permit.Progress := Gauge_Permit.Progress + 1;
            Application.ProcessMessages;
          end;
        end;
      end;
    end;
    btn_CardReg.Enabled := True;
    Gauge_Permit.Visible := False;
    PermitTableToDeviceList(st_selectCard.Caption);
    cardPermitTableToList(sg_cardPermit,cmb_Device1.Text);
  Finally
    fmMain.L_bCardMemorySaving := False;
  End;
end;

procedure TfmCardReg.sg_DoorDeviceCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmCardReg.sg_DoorPermitDeviceCheckBoxClick(Sender: TObject;
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

procedure TfmCardReg.btn_CardDeleteClick(Sender: TObject);
var
  nCardCount : integer;
  bChkState : Boolean;
  nDoorCount : integer;
  nAlarmCount : integer;
  stCardNo : string;
  stTemp : string;
  stEcuID : string;
  stDoorNo : string;
  stArmArea : string;
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
  btn_CardDelete.Enabled := False;

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
          stTemp := sg_DoorPermitDevice.cells[2,nDoorCount];
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
          stTemp := sg_AlarmPermitDevice.cells[2,nAlarmCount];
          stEcuID := copy(stTemp,1,2);
          if Length(stTemp) > 3 then stArmArea := copy(stTemp,4,1)
          else stArmArea := '';
          DeleteTB_CARDPERMIT_ALARM(stEcuID,stArmArea,stCardNo);
          Gauge_Permit.Progress := Gauge_Permit.Progress + 1;
          Application.ProcessMessages;
        end;
      end;
    end;
  end;
  btn_CardDelete.Enabled := True;
  Gauge_Permit.Visible := False;
  PermitTableToDeviceList(st_selectCard.Caption);
  cardPermitTableToList(sg_cardPermit,cmb_Device1.Text);
end;


function TfmCardReg.DeleteTB_CARDPERMIT_ALARM(aEcuID,aArmArea,
  aCardNo: string): Boolean;
begin
  result := dmDataBase.DeleteTB_CARDPERMIT_ALARM(aEcuID,aArmArea, aCardNo);

  if Not IsCardGrade(aEcuID, aCardNo) then
  begin
    dmDataBase.UpdateTB_CARDPERMIT_PERMIT(aEcuID, aCardNo,'N');
  end;

end;

function TfmCardReg.DeleteTB_CARDPERMIT_Door(aEcuID, aDoorNo,
  aCardNo: string): Boolean;
begin
  result := dmDataBase.DeleteTB_CARDPERMIT_Door(aEcuID, aDoorNo,aCardNo);

  if Not IsCardGrade(aEcuID, aCardNo) then
  begin
    dmDataBase.UpdateTB_CARDPERMIT_PERMIT(aEcuID, aCardNo,'N');
  end;

end;

function TfmCardReg.IsCardGrade(aEcuID, aCardNo: string): Boolean;
begin
  result := dmDataBase.CardPermitCheck(aEcuID, aCardNo);
end;

procedure TfmCardReg.sg_AlarmDeviceCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmCardReg.sg_AlarmPermitDeviceCheckBoxClick(Sender: TObject;
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

procedure TfmCardReg.RecvCardRegist(aECUID, aDoorNo, aCmd, aCardType,
  aCardNo, aExpireDate, aRegResult, aCardAuth, aTimeMode,
  aCardIDNo,aAlarmAreaGrade,aDoorAreaGrade: string);
begin
  if st_selectCard.Caption = aCardNo then
  begin
    if aRegResult = '2' then
      SendCardStatusChange(aEcuID,aDoorNo,'Y')
    else if aRegResult = '1' then SendCardStatusChange(aEcuID,aDoorNo,'E');
  end;
  if aEcuid <> cmb_Device1.Text then Exit;
  cardPermitTableToList(sg_cardPermit,cmb_Device1.Text);
end;

procedure TfmCardReg.btn_SearchCancelClick(Sender: TObject);
begin
  inherited;
  Gauge_CardList.Visible := False;
  btn_SearchCancel.Visible := False;
  dmSocket.CardSearchCancel(cmb_Device1.Text);
  btn_CardPermitSearch.Enabled := True;
  cmb_Device1.Enabled := True;
end;

procedure TfmCardReg.SettingChange;
begin
  DeviceTableToList;
  LoadControler;
end;


procedure TfmCardReg.pan_CardDeleteClick(Sender: TObject);
var
  i : integer;
  bChkState : Boolean;
begin
  for i := sg_Card.RowCount - 1 downto 1 do
  begin
    sg_Card.GetCheckBoxState(0,i, bChkState);
    if bChkState then
    begin
      dmDataBase.DeleteTB_CARDList(sg_Card.Cells[0,i]);
      if sg_Card.RowCount > 2 then
      begin
        sg_Card.RemoveRows(i,1);
      end else
      begin
        GridInitialize(sg_Card,2,True);
      end;
    end;
  end;
  L_nCheckCount := 0;
end;

procedure TfmCardReg.SendCardStatusChange(aEcuID, aDoorNo,
  aSendState: string);
var
  nDoorCount : integer;
  nAlarmCount : integer;
  stTemp : string;
  stEcuID : string;
  stDoorNo : string;
begin
    for nDoorCount := 1 to sg_DoorPermitDevice.RowCount - 1 do
    begin
      stTemp := sg_DoorPermitDevice.cells[2,nDoorCount];
      stEcuID := copy(stTemp,1,2);
      stDoorNo := copy(stTemp,4,1);
      if stEcuID = aEcuID then
      begin
        sg_DoorPermitDevice.cells[1,nDoorCount] := aSendState;
      end;
    end;
    for nAlarmCount := 1 to sg_AlarmPermitDevice.RowCount - 1 do
    begin
      stTemp := sg_AlarmPermitDevice.cells[2,nAlarmCount];
      stEcuID := copy(stTemp,1,2);
      if stEcuID = aEcuID then
      begin
        sg_AlarmPermitDevice.cells[1,nAlarmCount] := aSendState;
      end;
    end;
end;

procedure TfmCardReg.btn_DeviceCardDeleteClick(Sender: TObject);
var
  nIndex : integer;
  nDeviceIndex : integer;
begin
  if Application.MessageBox(pchar('컨트롤러의 전체권한이 모두 삭제 됩니다. 그래도 계속 진행하시겠습니까?'),'주의',MB_OKCANCEL) = ID_CANCEL then Exit;

  DeleteDeviceCardPermit(cmb_Device1.Text);
  nIndex := DeviceList.IndexOf(cmb_Device1.Text);
  if nIndex < 0 then Exit;
  dmSocket.CardDownLoad(cmb_Device1.Text,
                      '0000000000',
                      'O',
                      'Y',
                      'Y',
                      'Y',
                      'Y',
                      'Y',
                      'Y',
                      'Y',
                      'Y',
                      'Y',
                      'Y',
                      'Y',
                      'Y',
                      'Y',
                      'Y',
                      'Y',
                      'Y',
                      'Y',
                      '000000',
                      ' ',
                      TCurrentDeviceState(DeviceList.Objects[nIndex]).CardType,
                      'N',
                      '0'
                      );
  pan_Message.Caption := '카드데이터 전체 삭제 진행 중입니다. 잠시만 기다려 주세요.';
  pan_Message.Visible := True;
  btn_DeviceCardDelete.Enabled := False;
  cmb_Device1.Enabled := False;
  ButtonEnableTimer.Enabled := True;
//
end;

procedure TfmCardReg.LoadTimerTimer(Sender: TObject);
begin
  inherited;
  LoadTimer.Enabled := False;
  DeviceCodeSearch; //기기 정보를 먼저 조회 하자.
  DoorStateSearch;
  DoorRelay2TypeSearch;
  AlarmAreaUseSearch;
  SystemZoneExtensionUseSearch;
  MaxCardCountSearch;

  DeviceTableToList;
  L_bInformationLoad := True;
end;

procedure TfmCardReg.AlarmAreaUseSearch;
var
  i,j : integer;
  bResult : Boolean;
  stEcuID : string;
  nIndex : integer;
begin
  try
    pan_Message.Visible := True;

    for i := 0 to DeviceList.Count - 1 do
    begin
      stEcuID := DeviceList.Strings[i];
      nIndex := DeviceList.IndexOf(stEcuID);
      if nIndex > -1 then
      begin
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).ArmAreaSkill and
           (dmDataBase.GetTB_DEVICERCV_Value(stEcuID,'ArmAreaUse') <> 'Y') then
        begin
          if dmSocket.DeviceConnectCheck(stEcuID) then
          begin
            pan_Message.Color := clYellow;
            pan_Message.Caption := stEcuID + '번 컨트롤러 방범구역 사용유무 체크중...';
            for j := 0 to G_nLoopCount do
            begin
              if G_bApplicationTerminate then Exit;
              bResult := dmSocket.SearchArmAreaUse(stEcuID);
              if bResult then Break;
            end;
          end;
        end;
      end;
    end;

  finally
    pan_Message.Visible := False;
  end;
end;

procedure TfmCardReg.DoorStateSearch;
var
  i,j : integer;
  bResult : Boolean;
  stEcuID : string;
  nIndex : integer;
begin
  try
    pan_Message.Visible := True;

    for i := 0 to DeviceList.Count - 1 do
    begin
      stEcuID := DeviceList.Strings[i];
      nIndex := DeviceList.IndexOf(stEcuID);
      if nIndex > -1 then
      begin
        if dmDataBase.GetTB_DEVICERCV_Value(stEcuID,'WATCH_POWER') <> 'Y' then
        begin
          if dmSocket.DeviceConnectCheck(stEcuID) then
          begin
            pan_Message.Color := clYellow;
            pan_Message.Caption := stEcuID + '번 컨트롤러 출입문 용도 체크중...';
            for j := 0 to G_nLoopCount do
            begin
              if G_bApplicationTerminate then Exit;
              bResult := dmSocket.SysInfo_Check(stEcuID,True);
              if bResult then Break;
            end;
          end;
        end;
      end;
    end;

  finally
    pan_Message.Visible := False;
  end;
end;

procedure TfmCardReg.pan_MessageResize(Sender: TObject);
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

//컨트롤러 타입을 조회 하자
procedure TfmCardReg.DeviceCodeSearch;
var
  i,j : integer;
  bResult : Boolean;
  stEcuID : string;
  nIndex : integer;
begin
  try
    pan_Message.Visible := True;

    for i := 0 to DeviceList.Count - 1 do
    begin
      stEcuID := DeviceList.Strings[i];
      nIndex := DeviceList.IndexOf(stEcuID);
      if nIndex > -1 then
      begin
        if dmDataBase.GetTB_DEVICERCV_Value(stEcuID,'DEVICE_CODE') <> 'Y' then
        begin
          if dmSocket.DeviceConnectCheck(stEcuID) then
          begin
            pan_Message.Color := clYellow;
            pan_Message.Caption := stEcuID + '번 컨트롤러 기기타입 체크중...';
            for j := 0 to G_nLoopCount do
            begin
              if G_bApplicationTerminate then Exit;
              bResult := dmSocket.DeviceCode_Check(stEcuID,True);
              if bResult then Break;
            end;
          end;
        end;
      end;
    end;

  finally
    pan_Message.Visible := False;
  end;
end;

procedure TfmCardReg.ArmAreaUseData(aECUID,aArmUse: string);
begin
  if aEcuid <> cmb_Device1.Text then Exit;
  cmb_Device1Change(cmb_Device1);

end;

procedure TfmCardReg.DoorRelay2TypeSearch;
var
  i,j : integer;
  bResult : Boolean;
  stEcuID : string;
  nIndex : integer;
begin
  try
    pan_Message.Visible := True;

    for i := 0 to DeviceList.Count - 1 do
    begin
      stEcuID := DeviceList.Strings[i];
      nIndex := DeviceList.IndexOf(stEcuID);
      if nIndex > -1 then
      begin
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).DeviceType = KTT812 then
        begin
          if dmDataBase.GetTB_DEVICERCV_Value(stEcuID,'DOOR2_RELAY') <> 'Y' then
          begin
            if dmSocket.DeviceConnectCheck(stEcuID) then
            begin
              pan_Message.Color := clYellow;
              pan_Message.Caption := stEcuID + '번 컨트롤러 출입문2 사용유무 체크중...';
              for j := 0 to G_nLoopCount do
              begin
                if G_bApplicationTerminate then Exit;
                bResult := dmSocket.SearchRelay2TypeCheck(stEcuID,True);
                if bResult then Break;
              end;
            end;
          end;
        end;
      end;
    end;

  finally
    pan_Message.Visible := False;
  end;
end;

procedure TfmCardReg.SystemZoneExtensionUseSearch;
var
  i,j : integer;
  bResult : Boolean;
  stEcuID : string;
  nIndex : integer;
begin
  try
    pan_Message.Visible := True;

    for i := 0 to DeviceList.Count - 1 do
    begin
      stEcuID := DeviceList.Strings[i];
      nIndex := DeviceList.IndexOf(stEcuID);
      if nIndex > -1 then
      begin
        if TCurrentDeviceState(DeviceList.Objects[nIndex]).ZoneExtensionSkill then
        begin
          if (dmDataBase.GetTB_DEVICERCV_Value(stEcuID,'ZONEEXTENSIONUSE1') <> 'Y') or
             (dmDataBase.GetTB_DEVICERCV_Value(stEcuID,'ZONEEXTENSIONUSE2') <> 'Y') or
             (dmDataBase.GetTB_DEVICERCV_Value(stEcuID,'ZONEEXTENSIONUSE3') <> 'Y') or
             (dmDataBase.GetTB_DEVICERCV_Value(stEcuID,'ZONEEXTENSIONUSE4') <> 'Y') or
             (dmDataBase.GetTB_DEVICERCV_Value(stEcuID,'ZONEEXTENSIONUSE5') <> 'Y') or
             (dmDataBase.GetTB_DEVICERCV_Value(stEcuID,'ZONEEXTENSIONUSE6') <> 'Y') or
             (dmDataBase.GetTB_DEVICERCV_Value(stEcuID,'ZONEEXTENSIONUSE7') <> 'Y') or
             (dmDataBase.GetTB_DEVICERCV_Value(stEcuID,'ZONEEXTENSIONUSE8') <> 'Y') then
          begin
            if dmSocket.DeviceConnectCheck(stEcuID) then
            begin
              pan_Message.Color := clYellow;
              pan_Message.Caption := stEcuID + '번 컨트롤러 존확장기능 체크중...';
              for j := 0 to G_nLoopCount do
              begin
                if G_bApplicationTerminate then Exit;
                bResult := dmSocket.SearchSystemZoneExtensionUse(stEcuID,True);
                if bResult then Break;
              end;
            end;
          end;
        end;
      end;
    end;

  finally
    pan_Message.Visible := False;
  end;
end;

procedure TfmCardReg.CardPermitSelect(aCardNo: string);
var
  i : integer;
begin
  if sg_cardPermit.RowCount < 2 then Exit;
  with sg_cardPermit do
  begin
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

procedure TfmCardReg.ButtonEnableTimerTimer(Sender: TObject);
begin
  inherited;
  ButtonEnableTimer.Enabled := False;
  cmb_Device1.Enabled := True;
  btn_DeviceCardDelete.Enabled := True;
  pan_Message.Visible := False;
end;

procedure TfmCardReg.DownLoadCount(aCurrentPos, aMaxPos: integer;
  aGuageVisible: Boolean);
begin
  btn_CardReg.Enabled := Not aGuageVisible;
  btn_CardDelete.Enabled := Not aGuageVisible;
  Gauge_Permit.Visible := aGuageVisible;
  Gauge_Permit.MaxValue := aMaxPos;
  Gauge_Permit.Progress := aCurrentPos;
end;

procedure TfmCardReg.RecvCardAllClear(aECUID: string);
begin
  if aECUID = cmb_Device1.Text then
  begin
    cmb_Device1.Enabled := True;
    ButtonEnableTimer.Enabled := False;
    btn_DeviceCardDelete.Enabled := True;
    pan_Message.Visible := False;

  end;
end;

procedure TfmCardReg.mn_CardPositionUpdateClick(Sender: TObject);
begin
  inherited;
  with sg_cardPermit do
  begin
    if cells[0,Row] = '' then Exit;
    Options := Options + [goEditing];
    SelectCells(1,Row,1,Row);
    //sg_cardPermit.MouseActions.DirectEdit := True;
  end;
end;

procedure TfmCardReg.sg_cardPermitCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
{  sg_cardPermit.MouseActions.DirectEdit := False;
  if ACol <> 1 then canEDIT := False;
  if ACol = 1 then sg_cardPermit.MouseActions.DirectEdit := True; }
end;

procedure TfmCardReg.sg_cardPermitGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  inherited;
  if acol=1 then
  begin
    sg_cardPermit.EditLink:=el1;
    aEditor:=edCustom;
  end;

end;

procedure TfmCardReg.sg_cardPermitGetEditorProp(Sender: TObject; ACol,
  ARow: Integer; AEditLink: TEditLink);
begin
  if not Assigned(AEditLink) then
    Exit;
  case acol of
    1:begin
      if odd(arow) then (aEditLink.GetEditControl as TAdvEdit).FocusColor:=clInfoBk else
                        (aEditLink.GetEditControl as TAdvEdit).FocusColor:=clWhite;
     end;
  end;
end;

procedure TfmCardReg.sg_cardPermitKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
{  with sg_cardPermit do
  begin
    if Col = 1 then
    begin
      if Length(Cells[Col,Row]) = 4 then
      begin
        ed_Focus.SetFocus;
      end;
    end;
  end;}
end;

procedure TfmCardReg.sg_cardPermitMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  bCanSelect : Boolean;
begin
  inherited;
  sg_cardPermitSelectCell(Sender,sg_CardPermit.Col,sg_CardPermit.Row,bCanSelect);

end;

procedure TfmCardReg.sg_cardPermitSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  Rect: TRect;
begin
  inherited;
  with sg_cardPermit do
  begin
    Rect := CellRect(ACol, ARow);
    if ACol = 1 then
    begin
      if cells[0,ARow] = '' then Exit;
      ed_CardPosition.Visible := True;
      ed_CardPosition.Text := cells[1,ARow];
      ed_CardPosition.Left := Left + Rect.Left + 2;
      ed_CardPosition.Top := Top + Rect.Top + 3;
      ed_CardPosition.Width := Rect.Right - Rect.Left;
      ed_CardPosition.Height := (Rect.Bottom - Rect.Top);
      ed_CardPosition.SetFocus;
      ed_CardPosition.SelectAll;
    end else
    begin
      ed_CardPosition.Visible := False;
    end;
  end;

end;

procedure TfmCardReg.ed_CardPositionKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    ed_CardPositionExit(Sender);
    sg_cardPermit.SetFocus;
  end;

end;

procedure TfmCardReg.ed_CardPositionKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Length(ed_CardPosition.Text) = 5 then
  begin
    ed_CardPositionExit(Sender);
    sg_cardPermit.SetFocus;
  end;

end;

procedure TfmCardReg.ed_CardPositionExit(Sender: TObject);
begin
  inherited;
  with sg_cardPermit do
  begin
    if isDigit(ed_CardPosition.Text) then
    begin
      Cells[1,Row] := ed_CardPosition.Text;
      dmDataBase.UpdateTB_CARDPERMIT_POSITION(cmb_Device1.Text,cells[0,Row],cells[1,Row],'Y');
      ed_CardPosition.Visible := False;
    end else
    begin
      showmessage('위치번호는 숫자만 입력 하셔야 합니다.');
    end;
  end;

end;

procedure TfmCardReg.btn_RetrySendClick(Sender: TObject);
begin
  inherited;
  dmDataBase.UpdateTB_CARDPERMIT_DeviceAllRCVACK(cmb_Device1.Text,'Y','N');
end;

procedure TfmCardReg.btn_CopyCancelClick(Sender: TObject);
begin
  inherited;
  pan_cardCopy.Visible := False;
end;

procedure TfmCardReg.btn_CopyClick(Sender: TObject);
begin
  inherited;
  pan_cardCopy.Visible := True;
end;

procedure TfmCardReg.btn_CardCopyClick(Sender: TObject);
begin
  inherited;
  btn_CardCopy.Enabled := False;
  dmDataBase.DeviceToDeviceCardPermitCopy(cmb_Device1.Text,cmb_Device2.Text);
  pan_cardCopy.Visible := False;
  btn_CardCopy.Enabled := True;
end;

procedure TfmCardReg.sg_CardGetEditorProp(Sender: TObject; ACol,
  ARow: Integer; AEditLink: TEditLink);
begin
  inherited;
  if not Assigned(AEditLink) then
    Exit;
  case acol of
    1:begin
      if odd(arow) then (aEditLink.GetEditControl as TAdvEdit).FocusColor:=clInfoBk else
                        (aEditLink.GetEditControl as TAdvEdit).FocusColor:=clWhite;
     end;
  end;

end;

procedure TfmCardReg.sg_CardGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  inherited;
  if acol=1 then
  begin
    sg_Card.EditLink:=el1;
    aEditor:=edCustom;
  end;

end;

procedure TfmCardReg.sg_CardMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  bCanSelect : Boolean;
begin
  inherited;
  sg_cardSelectCell(Sender,sg_card.Col,sg_card.Row,bCanSelect);

end;

procedure TfmCardReg.sg_CardSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  Rect: TRect;
begin
  inherited;
  with sg_card do
  begin
    L_bRealKeyExit := True;
    Rect := CellRect(ACol, ARow);
    if ACol = 1 then
    begin
      if cells[0,ARow] = '' then Exit;
      L_nSelectRow := ARow;
      ed_PositionNum.Visible := True;
      ed_PositionNum.Text := cells[1,ARow];
      ed_PositionNum.Left := Left + Rect.Left ;
      ed_PositionNum.Top := Top + Rect.Top ;
      ed_PositionNum.Width := Rect.Right - Rect.Left;
      ed_PositionNum.Height := (Rect.Bottom - Rect.Top);
      ed_PositionNum.SetFocus;
      ed_PositionNum.SelectAll;
    end else
    begin
      ed_PositionNum.Visible := False;
    end;
  end;
end;

procedure TfmCardReg.ed_PositionNumExit(Sender: TObject);
var
  i : integer;
  stDupCardNo : string;
begin
  inherited;
  if Not L_bRealKeyExit then Exit;
  L_bRealKeyExit := False;
  with sg_card do
  begin
    if isDigit(ed_PositionNum.Text) then
    begin
      if strtoint(Cells[1,L_nSelectRow]) = strtoint(ed_PositionNum.Text) then
      begin
        ed_PositionNum.Visible := False;
        Exit;
      end;
      if dmDataBase.checkTB_CARD_POSITIONNUM(cells[0,L_nSelectRow],ed_PositionNum.Text,stDupCardNo) then
      begin
        showmessage(stDupCardNo + ' 카드와 위치번호가 같습니다.');
        ed_PositionNum.Visible := False;
        Exit;
      end;
      Cells[1,L_nSelectRow] := ed_PositionNum.Text;
      dmDataBase.UpdateTB_CARD_FieldName(cells[0,L_nSelectRow],'POSITIONNUM',cells[1,L_nSelectRow]);
      for i := 0 to FIXMAXECUNO do
      begin
        dmDataBase.UpdateTB_CARDPERMIT_POSITION(FillZeroNumber(i,2),cells[0,L_nSelectRow],cells[1,L_nSelectRow],'Y');
      end;
      ed_PositionNum.Visible := False;
    end else
    begin
      showmessage('위치번호는 숫자만 입력 하셔야 합니다.');
    end;
  end;

end;

procedure TfmCardReg.ed_PositionNumKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    ed_PositionNumExit(Sender);
    sg_card.SetFocus;
    ed_PositionNum.Visible := False;
  end;

end;

procedure TfmCardReg.ed_PositionNumKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Length(ed_PositionNum.Text) >= 5 then
  begin
    ed_PositionNumExit(Sender);
    sg_card.SetFocus;
    ed_PositionNum.Visible := False;
  end; 
end;

procedure TfmCardReg.MaxCardCountSearch;
var
  i,j : integer;
  bResult : Boolean;
  stEcuID : string;
  nIndex : integer;
begin
  try
    pan_Message.Visible := True;

    for i := 0 to DeviceList.Count - 1 do
    begin
      stEcuID := DeviceList.Strings[i];
      nIndex := DeviceList.IndexOf(stEcuID);
      if nIndex > -1 then
      begin
        if dmSocket.DeviceConnectCheck(stEcuID) then
        begin
          pan_Message.Color := clYellow;
          pan_Message.Caption := stEcuID + '번 컨트롤러 최종카드번호 체크중...';
          for j := 0 to G_nLoopCount do
          begin
            if G_bApplicationTerminate then Exit;
            bResult := dmSocket.CheckMaxCardNo(stEcuID,True);
            if bResult then Break;
          end;
        end;
      end;
    end;

  finally
    pan_Message.Visible := False;
  end;
end;

function TfmCardReg.CheckList(aCardNo: string): Boolean;
var
  i : integer;
begin
  with sg_Card do
  begin
    for i := 1 to RowCount - 1 do
    begin
      if Cells[0,i] = aCardNo then
      begin
        result := True;
        Exit;
      end;
    end;
  end;
  result := False;
end;

procedure TfmCardReg.btn_RegCardCntClick(Sender: TObject);
begin
  inherited;
  btn_RegCardCnt.Enabled := False;
  dmSocket.DeviceCardRegCountSearch(cmb_Device1.Text);
end;

procedure TfmCardReg.RecvCardRegCardCNT(aECUID, aData: string);
begin
  btn_RegCardCnt.Enabled := True;
  Delete(aData,1,4);
  showmessage('카드 등록건수 : ' + inttostr(strtoint(aData)));
end;

initialization
  RegisterClass(TfmCardReg);
Finalization
  UnRegisterClass(TfmCardReg);

end.
