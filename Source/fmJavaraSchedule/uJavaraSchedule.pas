unit uJavaraSchedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XiButton, ExtCtrls, AdvPanel, AdvPageControl, ComCtrls, Grids,
  BaseGrid, AdvGrid, StdCtrls, AdvObj, uSubForm, CommandArray;

type
  TfmJavaraSchedule = class(TfmASubForm)
    AdvPanelStyler1: TAdvPanelStyler;
    AdvPanel2: TAdvPanel;
    btn_Close: TXiButton;
    btn_Save: TXiButton;
    AdvPageControl1: TAdvPageControl;
    AdvTabSheet1: TAdvTabSheet;
    AdvPanel3: TAdvPanel;
    sg_Javara: TAdvStringGrid;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label13: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    cmbHolidayStartHH: TComboBox;
    cmbHolidayStartMM: TComboBox;
    cmbHolidayEndHH: TComboBox;
    cmbHolidayEndMM: TComboBox;
    cmbWeekStartHH: TComboBox;
    cmbWeekStartMM: TComboBox;
    cmbWeekEndHH: TComboBox;
    cmbWeekEndMM: TComboBox;
    cmbSaturdayStartHH: TComboBox;
    cmbSaturdayStartMM: TComboBox;
    cmbSaturdayEndHH: TComboBox;
    cmbSaturdayEndMM: TComboBox;
    cmbSundayStartHH: TComboBox;
    cmbSundayStartMM: TComboBox;
    cmbSundayEndHH: TComboBox;
    cmbSundayEndMM: TComboBox;
    LoadTimer: TTimer;
    pan_Message: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    btn_Search: TXiButton;
    procedure LoadTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure sg_JavaraCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure sg_JavaraClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    L_nCheckCount : integer;
    L_stSelectJavaraID : string;
    { Private declarations }
    procedure FormInitialize;
    procedure SystemZoneExtensionUseSearch;
    procedure DoorRelay2TypeSearch;
    procedure DoorSystemInfoSearch;
    procedure FormClear;
    procedure FormColorSetting(aColor:TColor);
    procedure TimeLoading(aEcuID,aDoorNo:string);

    procedure JavaraTableToList;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
  private
    procedure InsertJavaraList(sg_list:TAdvStringGrid;aData:string;aCheckBox:Boolean=True);
  public
    { Public declarations }
    procedure ListClick;
  end;

var
  fmJavaraSchedule: TfmJavaraSchedule;

implementation

uses
  uCommon,
  udmDataBase,
  uSocket,
  dllFunction;

{$R *.dfm}

procedure TfmJavaraSchedule.DoorRelay2TypeSearch;
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

procedure TfmJavaraSchedule.DoorSystemInfoSearch;
var
  i,j,k : integer;
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
        for j := 1 to FIXMAXDOORNO do
        begin
          if dmDataBase.GetTB_DOORSETTINGRCV_Value(stEcuID,'0',inttostr(j),'CARD_TYPE')  <> 'Y' then
          begin
            if dmSocket.DeviceConnectCheck(stEcuID) then
            begin
              if TCurrentDeviceState(DeviceList.Objects[nIndex]).GetDoorPossibility(j) then
              begin
                pan_Message.Color := clYellow;
                pan_Message.Caption := stEcuID + '번 컨트롤러 출입문' + inttostr(j) +' 타입 체크중...';
                for k := 0 to G_nLoopCount do
                begin
                  if G_bApplicationTerminate then Exit;
                  if dmSocket.DoorSystemInfo_Check(stEcuID,inttostr(j)) then break;
                end;
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

procedure TfmJavaraSchedule.LoadTimerTimer(Sender: TObject);
begin
  LoadTimer.Enabled := False;
  SystemZoneExtensionUseSearch; //출입문 사용유무 체크
  DoorRelay2TypeSearch; //KTT812 타입이면 2번 릴레이 사용 여부 체크
  DoorSystemInfoSearch;

  JavaraTableToList;

end;

procedure TfmJavaraSchedule.SystemZoneExtensionUseSearch;
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

procedure TfmJavaraSchedule.FormShow(Sender: TObject);
begin
  LoadTimer.Enabled := True;
end;

procedure TfmJavaraSchedule.JavaraTableToList;
var
  i : integer;
  j : integer;
begin
  GridInitialize(sg_Javara,2,TRUE);

  for i := 0 to DeviceList.Count - 1 do
  begin
    if TCurrentDeviceState(DeviceList.Objects[i]).MaxDoorNo > 0 then
    begin
      for j := 1 to TCurrentDeviceState(DeviceList.Objects[i]).MaxDoorNo do
      begin
        if TCurrentDeviceState(DeviceList.Objects[i]).GetDoorPossibility(j) then
        begin
          if TCurrentDeviceState(DeviceList.Objects[i]).GetDoorLockType(j) = 10 then
             InsertJavaraList(sg_Javara,DeviceList.Strings[i] + '-' + inttostr(j));
        end;
      end;
    end;
  end;
end;

procedure TfmJavaraSchedule.InsertJavaraList(sg_list: TAdvStringGrid;
  aData: string; aCheckBox: Boolean);
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

procedure TfmJavaraSchedule.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmJavaraSchedule.sg_JavaraCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
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

procedure TfmJavaraSchedule.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
  for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
  begin
    (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
  end;

end;

procedure TfmJavaraSchedule.btn_SearchClick(Sender: TObject);
var
  bChkState : Boolean;
  i :integer;
begin
  inherited;
  if L_nCheckCount = 0 then
  begin
    showmessage('자바라를 선택해 주세요.');
    Exit;
  end;
  if L_nCheckCount > 1 then
  begin
    showmessage('조회는 한개의 자바라만 선택 하셔야 합니다.');
    Exit;
  end;
  FormColorSetting(clWhite);
  for i := 1 to sg_Javara.RowCount - 1 do
  begin
    sg_Javara.GetCheckBoxState(0,i, bChkState);
    if bChkState then
    begin
      L_stSelectJavaraID := sg_Javara.Cells[0,i];
      sg_Javara.Row := i;
      dmSocket.JavaraScheduleSearch(copy(L_stSelectJavaraID,1,2),copy(L_stSelectJavaraID,4,1));
    end;
  end;
end;

procedure TfmJavaraSchedule.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  self.FindSubForm('Main').FindCommand('JAVARASCHEDULE').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('JAVARASCHEDULE').Execute;
end;

procedure TfmJavaraSchedule.FormActivate(Sender: TObject);
begin
  inherited;
  self.FindSubForm('Main').FindCommand('JAVARASCHEDULE').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('JAVARASCHEDULE').Execute;

end;

procedure TfmJavaraSchedule.ListClick;
var
  stEcuID:string;
  stDoorNo : string;
begin
  FormClear;
  FormColorSetting(clWhite);
  with sg_Javara do
  begin
    stEcuID := copy(Cells[0,Row],1,2);
    stDoorNo := '00';
    TimeLoading(stEcuID,stDoorNo);
  end;
end;

procedure TfmJavaraSchedule.FormClear;
begin
  cmbWeekStartHH.Text := '00';
  cmbWeekStartMM.Text := '00';
  cmbWeekEndHH.Text := '00';
  cmbWeekEndMM.Text := '00';
  cmbSaturdayStartHH.Text := '00';
  cmbSaturdayStartMM.Text := '00';
  cmbSaturdayEndHH.Text := '00';
  cmbSaturdayEndMM.Text := '00';
  cmbSundayStartHH.Text := '00';
  cmbSundayStartMM.Text := '00';
  cmbSundayEndHH.Text := '00';
  cmbSundayEndMM.Text := '00';
  cmbHolidayStartHH.Text := '00';
  cmbHolidayStartMM.Text := '00';
  cmbHolidayEndHH.Text := '00';
  cmbHolidayEndMM.Text := '00';
end;

procedure TfmJavaraSchedule.FormColorSetting(aColor: TColor);
begin
  cmbWeekStartHH.Color := aColor;
  cmbWeekStartMM.Color := aColor;
  cmbWeekEndHH.Color := aColor;
  cmbWeekEndMM.Color := aColor;
  cmbSaturdayStartHH.Color := aColor;
  cmbSaturdayStartMM.Color := aColor;
  cmbSaturdayEndHH.Color := aColor;
  cmbSaturdayEndMM.Color := aColor;
  cmbSundayStartHH.Color := aColor;
  cmbSundayStartMM.Color := aColor;
  cmbSundayEndHH.Color := aColor;
  cmbSundayEndMM.Color := aColor;
  cmbHolidayStartHH.Color := aColor;
  cmbHolidayStartMM.Color := aColor;
  cmbHolidayEndHH.Color := aColor;
  cmbHolidayEndMM.Color := aColor;
end;

procedure TfmJavaraSchedule.TimeLoading(aEcuID, aDoorNo: string);
begin
  with dmDataBase.TB_Javaraschedule do
  begin
    if FindKey([aEcuID,aDoorNo]) then
    begin
      cmbWeekStartHH.Text := copy(FindField('wStartTime').AsString,1,2);
      cmbWeekStartMM.Text := copy(FindField('wStartTime').AsString,3,2);
      cmbWeekEndHH.Text := copy(FindField('wEndTime').AsString,1,2);
      cmbWeekEndMM.Text := copy(FindField('wEndTime').AsString,3,2);
      cmbSaturdayStartHH.Text := copy(FindField('sStartTime').AsString,1,2);
      cmbSaturdayStartMM.Text := copy(FindField('sStartTime').AsString,3,2);
      cmbSaturdayEndHH.Text := copy(FindField('sEndTime').AsString,1,2);
      cmbSaturdayEndMM.Text := copy(FindField('sEndTime').AsString,3,2);
      cmbSundayStartHH.Text := copy(FindField('nStartTime').AsString,1,2);
      cmbSundayStartMM.Text := copy(FindField('nStartTime').AsString,3,2);
      cmbSundayEndHH.Text := copy(FindField('nEndTime').AsString,1,2);
      cmbSundayEndMM.Text := copy(FindField('nEndTime').AsString,3,2);
      cmbHolidayStartHH.Text := copy(FindField('hStartTime').AsString,1,2);
      cmbHolidayStartMM.Text := copy(FindField('hStartTime').AsString,3,2);
      cmbHolidayEndHH.Text := copy(FindField('hEndTime').AsString,1,2);
      cmbHolidayEndMM.Text := copy(FindField('hEndTime').AsString,3,2);
      if FindField('rcvack').AsString = 'Y' then FormColorSetting(clYellow);
    end;
  end;
end;

procedure TfmJavaraSchedule.sg_JavaraClick(Sender: TObject);
begin
  inherited;
  ListClick;
end;

procedure TfmJavaraSchedule.btn_SaveClick(Sender: TObject);
var
  bChkState : Boolean;
  i :integer;
  stData : string;
  stWeekstartTime : string;
  stWeekEndTime : string;
  stSaturdaystartTime : string;
  stSaturdayEndTime : string;
  stSundaystartTime : string;
  stSundayEndTime : string;
  stHolidaystartTime : string;
  stHolidayEndTime : string;
begin
  inherited;
  FormColorSetting(clWhite);

  if L_nCheckCount = 0 then
  begin
    showmessage('자바라를 선택해 주세요.');
    Exit;
  end;

  stWeekstartTime := cmbWeekStartHH.Text + cmbWeekStartMM.Text;
  stWeekEndTime := cmbWeekEndHH.Text + cmbWeekEndMM.Text;
  stSaturdaystartTime := cmbSaturdayStartHH.Text + cmbSaturdayStartMM.Text;
  stSaturdayEndTime := cmbSaturdayEndHH.Text + cmbSaturdayEndMM.Text;
  stSundaystartTime := cmbSundayStartHH.Text + cmbSundayStartMM.Text;
  stSundayEndTime := cmbSundayEndHH.Text + cmbSundayEndMM.Text;
  stHolidaystartTime := cmbHolidayStartHH.Text + cmbHolidayStartMM.Text;
  stHolidayEndTime := cmbHolidayEndHH.Text + cmbHolidayEndMM.Text;

  if (Length(stWeekstartTime) <> 4) or
     (Length(stWeekEndTime) <> 4) or
     (Length(stSaturdaystartTime) <> 4) or
     (Length(stSaturdayEndTime) <> 4) or
     (Length(stSundaystartTime) <> 4) or
     (Length(stSundayEndTime) <> 4) or
     (Length(stHolidaystartTime) <> 4) or
     (Length(stHolidayEndTime) <> 4) then
  begin
    showmessage('시간은 두자리 숫자여야 합니다.');
    Exit;
  end;
  if (Not isDigit(stWeekstartTime)) or
     (Not isDigit(stWeekEndTime)) or
     (Not isDigit(stSaturdaystartTime)) or
     (Not isDigit(stSaturdayEndTime)) or
     (Not isDigit(stSundaystartTime)) or
     (Not isDigit(stSundayEndTime)) or
     (Not isDigit(stHolidaystartTime)) or
     (Not isDigit(stHolidayEndTime)) then
  begin
    showmessage('시간은 두자리 숫자여야 합니다.');
    Exit;
  end;
  (*
  if (strtoint(stWeekstartTime) > strtoint(stWeekEndTime)) or
     (strtoint(stSaturdaystartTime) > strtoint(stSaturdayEndTime)) or
     (strtoint(stSundaystartTime) > strtoint(stSundayEndTime)) or
     (strtoint(stHolidaystartTime) > strtoint(stHolidayEndTime)) then
  begin
    showmessage('시작시간이 종료 시간보다 클 수는 없습니다.');
    Exit;
  end;  *)

  stData := stWeekstartTime + stWeekEndTime +
            ' ' + stSaturdaystartTime + stSaturdayEndTime +
            ' ' + stSundaystartTime + stSundayEndTime +
            ' ' + stHolidaystartTime + stHolidayEndTime ;


  for i := 1 to sg_Javara.RowCount - 1 do
  begin
    sg_Javara.GetCheckBoxState(0,i, bChkState);
    if bChkState then
    begin
      L_stSelectJavaraID := sg_Javara.Cells[0,i];
      sg_Javara.Row := i;
      dmSocket.RegistJavaraSchedule(copy(L_stSelectJavaraID,1,2),copy(L_stSelectJavaraID,4,1),stData);
    end;
  end;
end;

procedure TfmJavaraSchedule.FormInitialize;
var
  i : integer;
begin
  cmbWeekStartHH.Clear;
  cmbWeekEndHH.Clear;
  cmbSaturdayStartHH.Clear;
  cmbSaturdayEndHH.Clear;
  cmbSundayStartHH.Clear;
  cmbSundayEndHH.Clear;
  cmbHolidayStartHH.Clear;
  cmbHolidayEndHH.Clear;
  for i := 0 to 24 do
  begin
    cmbWeekStartHH.Items.Add(FillZeroNumber(i,2));
    cmbWeekEndHH.Items.Add(FillZeroNumber(i,2));
    cmbSaturdayStartHH.Items.Add(FillZeroNumber(i,2));
    cmbSaturdayEndHH.Items.Add(FillZeroNumber(i,2));
    cmbSundayStartHH.Items.Add(FillZeroNumber(i,2));
    cmbSundayEndHH.Items.Add(FillZeroNumber(i,2));
    cmbHolidayStartHH.Items.Add(FillZeroNumber(i,2));
    cmbHolidayEndHH.Items.Add(FillZeroNumber(i,2));
  end;
  cmbWeekStartHH.ItemIndex := 0;
  cmbWeekEndHH.ItemIndex := 0;
  cmbSaturdayStartHH.ItemIndex := 0;
  cmbSaturdayEndHH.ItemIndex := 0;
  cmbSundayStartHH.ItemIndex := 0;
  cmbSundayEndHH.ItemIndex := 0;
  cmbHolidayStartHH.ItemIndex := 0;
  cmbHolidayEndHH.ItemIndex := 0;

  cmbWeekStartMM.Clear;
  cmbWeekEndMM.Clear;
  cmbSaturdayStartMM.Clear;
  cmbSaturdayEndMM.Clear;
  cmbSundayStartMM.Clear;
  cmbSundayEndMM.Clear;
  cmbHolidayStartMM.Clear;
  cmbHolidayEndMM.Clear;
  for i := 0 to 5 do
  begin
    cmbWeekStartMM.Items.Add(inttostr(i) + '0');
    cmbWeekEndMM.Items.Add(inttostr(i) + '0');
    cmbSaturdayStartMM.Items.Add(inttostr(i) + '0');
    cmbSaturdayEndMM.Items.Add(inttostr(i) + '0');
    cmbSundayStartMM.Items.Add(inttostr(i) + '0');
    cmbSundayEndMM.Items.Add(inttostr(i) + '0');
    cmbHolidayStartMM.Items.Add(inttostr(i) + '0');
    cmbHolidayEndMM.Items.Add(inttostr(i) + '0');
  end;
  cmbWeekStartMM.ItemIndex := 0;
  cmbWeekEndMM.ItemIndex := 0;
  cmbSaturdayStartMM.ItemIndex := 0;
  cmbSaturdayEndMM.ItemIndex := 0;
  cmbSundayStartMM.ItemIndex := 0;
  cmbSundayEndMM.ItemIndex := 0;
  cmbHolidayStartMM.ItemIndex := 0;
  cmbHolidayEndMM.ItemIndex := 0;

end;

procedure TfmJavaraSchedule.FormCreate(Sender: TObject);
begin
  inherited;
  FormInitialize;
end;

end.
