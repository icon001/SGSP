unit uHoliday;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, PlannerMonthView, StdCtrls, DB, dbisamtb, RzButton,
  RzRadChk, RzDBChk, Mask, RzEdit, RzDBEdit, Grids, DBGrids, RzDBGrid,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDCustomHeaderPanel,
  LMDHeaderPanel, LMDControl, LMDBaseControl, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, RzCmboBx, ComCtrls, BaseGrid,
  AdvGrid, Buttons, DBAdvGrid, Gauges, uSubForm, CommandArray, AdvObj;

type
  TForm_Holiday = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    cmb_Door: TRzComboBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    btnSend: TRzBitBtn;
    btn_Delete: TRzBitBtn;
    btn_DeleteAll: TRzBitBtn;
    Label2: TLabel;
    sg_schedule: TAdvStringGrid;
    ed_mm: TEdit;
    ed_Day: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Gauge1: TGauge;
    cmb_HolidayType: TComboBox;
    btn_Search: TRzBitBtn;
    btnClose: TRzBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MonthDaySelect(Sender: TObject; SelDate: TDateTime);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_DeleteAllClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sg_scheduleClick(Sender: TObject);
    procedure ed_mmKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_DoorClick(Sender: TObject);
    procedure cmb_DoorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sg_scheduleMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    L_stSelectEcuID : string;
    L_stSelectDoorNo : string;
    L_nOldCol : integer;
    L_nOldRow : integer;
    L_OldColor : TColor;
    L_bClose : Boolean;
    { Private declarations }
    procedure ScheduleDoorTableToComboBox;
    Function Holiday_DownLoad(aCmd,aEcuID,aDoorNo,aHoliday,aHolidayType:string):Boolean;
    procedure HolidayShow(aMonth,aDate,aType:string);
    function HolidaySearch(aEcuID,aDoorNo,aDate:string):string;

    procedure InitializeGrid;
  public
    ECUList : TStringList;
    DeviceID : String;
    { Public declarations }
    Procedure LoadHoliday(aData:String);
    procedure RecvHoliday(aECUID,aDoorNo,aMonth,aDate:string);
  end;

var
  Form_Holiday: TForm_Holiday;

implementation

uses
  uCommon,
  uMain,
  udmDataBase,
  dllFunction, uSocket;

{$R *.dfm}

procedure TForm_Holiday.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_Holiday.btnSendClick(Sender: TObject);
var
  j : integer;
  stEcuID : string;
  stDoorNo : string;
  stSendType : string;
  stHolidayResult : string;
begin
    btnSend.Enabled := False;
    stSendType := inttostr(cmb_HolidayType.ItemIndex + 3);
    if cmb_Door.ItemIndex = 0 then   //전체 다운로드이면 루프를 돌면서 전부다 다운로드시킴
    begin
      Gauge1.Visible := True;
      Gauge1.MaxValue := cmb_Door.Count - 1;
      Gauge1.Progress := 0;
      for j:=1 to cmb_Door.Count - 1 do
      begin
        if L_bClose then Exit;
        stEcuID := copy(cmb_Door.Items.Strings[j],1,2);
        stDoorNo := copy(cmb_Door.Items.Strings[j],4,1);
        stHolidayResult := HolidaySearch(stEcuID,stDoorNo, ed_mm.Text + '00');
        if stHolidayResult <> '' then
        begin
          if isDigit(ed_day.Text) then
          begin
            stHolidayResult[strtoint(ed_day.Text) + 2] := stSendType[1];
          end;
          //Holiday_DownLoad('A',stEcuID,stDoorNo,ed_mm.Text + ed_day.Text,stSendType);
          Holiday_DownLoad('A',stEcuID,stDoorNo,stHolidayResult,stSendType);
        end;
        Gauge1.Progress := j;
      end;
      btnSend.Enabled := True;
      Gauge1.Visible := False;
    end else
    begin
      stEcuID := copy(cmb_Door.Text,1,2);
      stDoorNo := copy(cmb_Door.Text,4,1);
      Holiday_DownLoad('A',stEcuID,stDoorNo,ed_mm.Text + ed_day.Text,stSendType);
    end;
end;

function TForm_Holiday.Holiday_DownLoad(aCMD,aEcuID,aDoorNo,
  aHoliday,aHolidayType: string): Boolean;
var
  nLoop : integer;
  bResult : Boolean;
begin
    for nLoop := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      bResult := dmSocket.registHoliday(aEcuID, aDoorNo,aCMD, aHoliday,aHolidayType);
      if bResult then break;
    end;
    result := bResult;
end;

procedure TForm_Holiday.FormShow(Sender: TObject);
Var
  i : Integer;

begin
  ScheduleDoorTableToComboBox;

  InitializeGrid;
  ed_mm.Text := FormatDateTime('mm',now);
  ed_day.Text := formatdateTime('dd',now);

  self.FindSubForm('Main').FindCommand('HOLIDAYVIEW').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('HOLIDAYVIEW').Execute;

end;

procedure TForm_Holiday.FormActivate(Sender: TObject);
begin
//  Form_Main.bHolidayShow := True;
end;

procedure TForm_Holiday.HolidayShow(aMonth,aDate,aType: string);
var
  nMonth,nDate : integer;
begin
  nMonth := strtoint(aMonth);
  nDate := strtoint(aDate);
  case aType[1] of
    '0' :
      begin
        if (nMonth mod 2) = 0 then sg_schedule.Colors[nDate,nMonth] := rgb(230,230,220)
        else sg_schedule.Colors[nDate,nMonth] := clWhite;
      end;
    '1' :
      begin
        sg_schedule.Colors[nDate,nMonth] := clRed;
        if (L_nOldCol = nDate) and (L_nOldRow = nMonth) then
        begin
          L_OldColor := clRed;
        end;
      end;
    '2' :
      begin
        sg_schedule.Colors[nDate,nMonth] := clGreen;
        if (L_nOldCol = nDate) and (L_nOldRow = nMonth) then
        begin
          L_OldColor := clGreen;
        end;
      end;
    '3' :
      begin
        sg_schedule.Colors[nDate,nMonth] := clPurple;
        if (L_nOldCol = nDate) and (L_nOldRow = nMonth) then
        begin
          L_OldColor := clPurple;
        end;
      end;
    '4' :
      begin
        sg_schedule.Colors[nDate,nMonth] := clLime;
        if (L_nOldCol = nDate) and (L_nOldRow = nMonth) then
        begin
          L_OldColor := clLime;
        end;
      end;
    '5' :
      begin
        sg_schedule.Colors[nDate,nMonth] := clYellow;
        if (L_nOldCol = nDate) and (L_nOldRow = nMonth) then
        begin
          L_OldColor := clYellow;
        end;
      end;
    else
      begin
        sg_schedule.Colors[nDate,nMonth] := clGreen;
      end;
  end;
//  if aType = '1' then


end;

procedure TForm_Holiday.MonthDaySelect(Sender: TObject;
  SelDate: TDateTime);
begin
  //Edit_HoliDay.Text := FormatDateTime('DD',Month.Date);
end;

procedure TForm_Holiday.btn_SearchClick(Sender: TObject);
var
  stEcuID : string;
  stDoorNo : string;
  i : integer;
begin
  if cmb_Door.itemIndex = 0 then
  begin
    showmessage('조회는 각 문별에 한해서 조회 가능합니다.');
    Exit;
  end;
  InitializeGrid;
  btn_Search.Enabled := False;
  stEcuID := copy(cmb_Door.Text,1,2);
  stDoorNo := copy(cmb_Door.Text,4,1);

  Gauge1.Visible := True;
  Gauge1.MaxValue := 12;
  Gauge1.Progress := 0;
  for i := 1 to 12 do
  begin
    HolidaySearch(stEcuID,stDoorNo, FillZeroNumber(i,2) + '00');
    Gauge1.Progress := i;
  end;
  Gauge1.Visible := False;
end;

procedure TForm_Holiday.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  L_bClose := True;  
  self.FindSubForm('Main').FindCommand('HOLIDAYVIEW').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('HOLIDAYVIEW').Execute;
  Action := caFree;
end;

function TForm_Holiday.HolidaySearch(aEcuID, aDoorNo, aDate: string):string;
var
  nLoop : integer;
  i : integer;
//  bResult : Boolean;
begin
//  for i:=3 to 5 do
  begin
    for nLoop := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      result := dmSocket.Holiday_Search(aEcuID, aDoorNo, aDate,'3');//inttostr(i));
      if result <> '' then break;
    end;
  end;
end;

procedure TForm_Holiday.btn_DeleteClick(Sender: TObject);
var
  stEcuID:string;
  stDoorNo : string;
  j : integer;
  stSendType : string;
begin
    btn_Delete.Enabled := False;
//    InitializeGrid;
    stSendType := inttostr(cmb_HolidayType.ItemIndex + 3);

    if cmb_Door.ItemIndex = 0 then   //전체 다운로드이면 루프를 돌면서 전부다 다운로드시킴
    begin
      Gauge1.Visible := True;
      Gauge1.MaxValue := cmb_Door.Count - 1;
      Gauge1.Progress := 0;
      for j:=1 to cmb_Door.Count - 1 do
      begin
        stEcuID := copy(cmb_Door.Items.Strings[j],1,2);
        stDoorNo := copy(cmb_Door.Items.Strings[j],4,1);
        Holiday_DownLoad('D',stEcuID,stDoorNo,ed_mm.Text + ed_day.Text,stSendType);
        Gauge1.Progress := j;
      end;
      btn_Delete.Enabled := True;
      Gauge1.Visible := False;
    end else
    begin
      stEcuID := copy(cmb_Door.text,1,2);
      stDoorNo := copy(cmb_Door.text,4,1);
      Holiday_DownLoad('D',stEcuID,stDoorNo,ed_mm.Text + ed_day.Text,stSendType);
    end;
end;

procedure TForm_Holiday.btn_DeleteAllClick(Sender: TObject);
var
  stEcuID : string;
  stDoorNo :string;
  j : integer;
  stSendType : string;
begin
    btn_DeleteAll.Enabled := False;
    InitializeGrid;
    stSendType := inttostr(cmb_HolidayType.ItemIndex + 3);

    if cmb_Door.ItemIndex = 0 then   //전체 다운로드이면 루프를 돌면서 전부다 다운로드시킴
    begin
      for j:=1 to cmb_Door.Count - 1 do
      begin
        stEcuID := copy(cmb_Door.Items.Strings[j],1,2);
        stDoorNo := copy(cmb_Door.Items.Strings[j],4,1);
        Holiday_DownLoad('W',stEcuID,stDoorNo,ed_mm.Text + ed_day.Text,stSendType);
      end;
    end else
    begin
      stEcuID := copy(cmb_Door.text,1,2);
      stDoorNo := copy(cmb_Door.text,4,1);
      Holiday_DownLoad('W',stEcuID,stDoorNo,ed_mm.Text + ed_day.Text,stSendType);
    end;
end;

procedure TForm_Holiday.LoadHoliday(aData: String);
var
  stDate : string;
  stMonth : string;
  i : integer;
begin
  //r01  0110000000001000000000000000000000
  stMonth := copy(aData,6,2);
  stDate := copy(aData,8,31);
  for i:= 1 to 31 do
  begin
    //if Copy(stDate,i,1) = '1' then
    HolidayShow(stMonth,FillzeroNumber(i,2),stDate[i]);
  end;
  btn_Search.Enabled := True;
  btnSend.Enabled := True;
  btn_Delete.Enabled := True;
  btn_DeleteAll.Enabled := True;
end;

procedure TForm_Holiday.InitializeGrid;
var
  i : integer;
  nRow : integer;
begin
  with sg_schedule do
  begin
    Clear;
    Cells[0,0] := '월';
    for i := 1 to 31 do
    begin
      Cells[i,0] := inttostr(i);
    end;
    for i:= 1 to 12 do
    begin
      if (i mod 2) = 0 then
      begin
        RowColor[i] := rgb(230,230,220);
{        .rgbBlue := Byte(230);
        RowColor[i].rgbGreen := Byte(230);
        RowColor[i].rgbRed := Byte(220);  }
      end;
      Cells[0,i] := inttostr(i);
    end;
    L_OldColor := clWindow;
    nRow := Row;
    if (nRow mod 2)=0 then L_OldColor := rgb(230,230,220);

  end;
end;

procedure TForm_Holiday.SpeedButton1Click(Sender: TObject);
begin
  sg_schedule.Colors[1,1] := clRed;
end;

procedure TForm_Holiday.sg_scheduleClick(Sender: TObject);
var
  stDate : string;
begin
  ed_mm.Text := FillZeroNumber(sg_schedule.Row,2);
  ed_day.Text := FillZeroNumber(sg_schedule.Col,2);
  {
  stDate := '2000-' + FillZeroNumber(sg_schedule.Row,2) + '-' + FillZeroNumber(sg_schedule.Col,2);
  Try
    dt_Month.Date := strtoDate(stDate);
  Except
    Exit;
  end; }
end;

procedure TForm_Holiday.ed_mmKeyPress(Sender: TObject; var Key: Char);
var
  nOrd : integer;
begin

  nOrd := Ord(Key);

  if nOrd = 8 then Exit;
  if (nOrd < 48) then Key := #0;
  if (nOrd > 57) then Key := #0;

end;

procedure TForm_Holiday.ScheduleDoorTableToComboBox;
var
  i : integer;
  nIndex : integer;
begin
  cmb_Door.Items.Clear;
  cmb_Door.Items.add('전체');
  cmb_Door.ItemIndex := 0;
  with dmDataBase.TB_DEVICE do
  begin
    First;
    while Not Eof do
    begin
      if FindField('DEVICEUSE').AsString = 'Y' then
      begin
        nIndex := DeviceList.IndexOf(FindField('ECU_ID').AsString);
        if nIndex > -1 then
        begin
          for i := 1 to TCurrentDeviceState(DeviceList.Objects[nIndex]).MaxDoorNo do
          begin
            //if dmDataBase.CheckTB_DOORType(FindField('ECU_ID').AsString,'0',inttostr(i)) <> '0' then
            cmb_Door.Items.add(FindField('ECU_ID').AsString + '-' + inttostr(i));
          end;
        end;
      end;
      Next;
    end;
  end;
end;

procedure TForm_Holiday.RecvHoliday(aECUID,aDoorNo, aMonth, aDate: string);
var
  i : integer;
begin
  if L_stSelectEcuID <> '' then
  begin
    if L_stSelectEcuID <> aEcuID then Exit;
    if L_stSelectDoorNo <> aDoorNo then Exit;
  end;

  for i:= 1 to 31 do
  begin
    //if Copy(aDate,i,1) = '1' then
    HolidayShow(aMonth,FillzeroNumber(i,2),aDate[i]);
  end;
  btn_Search.Enabled := True;
  btnSend.Enabled := True;
  btn_Delete.Enabled := True;
  btn_DeleteAll.Enabled := True;
end;

procedure TForm_Holiday.cmb_DoorClick(Sender: TObject);
begin
  L_stSelectEcuID := '';
  L_stSelectDoorNo := '';
  if cmb_Door.ItemIndex <> 0 then
  begin
    L_stSelectEcuID := copy(cmb_Door.Text,1,2);
    L_stSelectDoorNo := copy(cmb_Door.Text,4,1);
  end;

end;

procedure TForm_Holiday.cmb_DoorChange(Sender: TObject);
begin
  InitializeGrid;

end;

procedure TForm_Holiday.FormCreate(Sender: TObject);
begin
  inherited;
  L_nOldCol := -1;
  L_nOldRow := -1;
  L_OldColor := clWhite;
  L_bClose := False;
end;

procedure TForm_Holiday.sg_scheduleMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Try
    if (L_nOldCol = -1) and (L_nOldRow = -1) then Exit;
    sg_schedule.Colors[L_nOldCol,L_nOldRow] := L_OldColor;
  Finally
    L_nOldCol := sg_schedule.Col;
    L_nOldRow := sg_schedule.Row;
    L_OldColor := sg_schedule.Colors[sg_schedule.Col,sg_schedule.Row];
    //sg_schedule.Colors[sg_schedule.Col,sg_schedule.Row] := clBlue;
  End;

end;



initialization
  RegisterClass(TForm_Holiday);
Finalization
  UnRegisterClass(TForm_Holiday);

end.
