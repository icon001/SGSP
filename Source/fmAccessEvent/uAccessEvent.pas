unit uAccessEvent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids,
  AdvObj;

type
  TfmAccessEvent = class(TfmASubForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    AdvStringGrid1: TAdvStringGrid;
    btn_stop: TSpeedButton;
    btn_start: TSpeedButton;
    btn_Clear: TSpeedButton;
    btn_FileSave: TSpeedButton;
    SaveDialog1: TSaveDialog;
    SearchTimer: TTimer;
    lb_ECUID: TLabel;
    ed_ecuid: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StringGrideResize(Gride:TStringGrid);
    procedure AdvStringGrid1Resize(Sender: TObject);
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure btn_startClick(Sender: TObject);
    procedure btn_stopClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure SearchTimerTimer(Sender: TObject);
  private
    { Private declarations }
    DisplayList : TStringList;
    bClear : Boolean;
    bStart : Boolean;
    procedure BatchDisplay(aData: string);


  public
    { Public declarations }
    procedure DisplayStringGrid(aCmd,aTxRx,aIP,aECUID,aData:string);
    procedure CloseForm;

    procedure RecvCardAccessEvent(aECUID, aDoorNo,
      aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
      aAccessResult, aDoorState, aATButton, aCardNo:string);
    procedure RcvExitButtonEvent(aECUID, aDoorNo,
      aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
      aAccessResult, aDoorState, aATButton, aCardNo:string);
  end;

var
  fmAccessEvent: TfmAccessEvent;

implementation

uses
  uCommon,
  dllFunction,
  uUtil;
  
{$R *.dfm}



procedure TfmAccessEvent.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'CURRENTSTATE';

  DisplayList := TStringList.Create;

  SearchTimer.Enabled := True;

end;

procedure TfmAccessEvent.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
var
  stCmd : string;
  stData : string;
  stTxRx : string;
  stIP : string;
  stECUID : string;
begin
  stCmd := Params.Values['Cmd'];
  stData := Params.Values['Data'];
  stTxRx := Params.Values['TxRx'];
  stIP := Params.Values['IP'];
  stECUID := Params.Values['ECUID'];

  DisplayStringGrid(stCmd,stTxRx,stIP,stECUID,stData);


end;

procedure TfmAccessEvent.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SearchTimer.Enabled := False;
  if G_bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('ACCESSEVENT').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('ACCESSEVENT').Execute;
  Action := caFree;
  DisplayList.Clear;
  DisplayList.Free;
  SearchTimer.Free;
end;

procedure TfmAccessEvent.FormShow(Sender: TObject);
begin

  self.FindSubForm('Main').FindCommand('ACCESSEVENT').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('ACCESSEVENT').Execute;

//  StringGrideResize(AdvStringGrid1);
  btn_ClearClick(Self);
  btn_StartClick(Self);

end;

procedure TfmAccessEvent.StringGrideResize(Gride:TStringGrid);
var
  nTotWidth,nColCnt,nColWidth : integer;
  i : integer;
begin
  with Gride do
  begin
    ColCount := 6;

    nTotWidth := Width - 20;

    ColWidths[0] := 100;
    ColWidths[1] := 50;
    ColWidths[2] := 50;
    ColWidths[3] := 100;
    ColWidths[4] := 50;
    ColWidths[5] := nTotWidth - 370;

  end;
end;

procedure TfmAccessEvent.AdvStringGrid1Resize(Sender: TObject);
begin
//  StringGrideResize(AdvStringGrid1);
end;

procedure TfmAccessEvent.StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  DataInCell : string;
  nLeft,nTop : integer;
begin
  if (AROW < (Sender as TStringGrid).FixedRows) then
  begin

    DataInCell := (Sender as TStringGrid).Cells[Acol,Arow];

    with (Sender as TStringGrid).Canvas do
    begin
      FillRect(Rect);  //켄버스를 칠한다.(기본값은 흰색)

      if DataInCell <> '' then
      begin
        nLeft := ((Rect.Right-Rect.Left) - TextWidth(DataInCell)) div 2;
        nTop := ((Rect.Bottom-Rect.Top) - TextHeight(DataInCell)) div 2;
        TextRect(Rect, Rect.Left + nLeft, Rect.Top + nTop, DataInCell);  //문자를 뿌려준다.. 기본은 검정색
      end;

    End;
  End
  else if Acol <> 5 then
  begin
    DataInCell := (Sender as TStringGrid).Cells[Acol,Arow];

    with (Sender as TStringGrid).Canvas do
    begin
      FillRect(Rect);  //켄버스를 칠한다.(기본값은 흰색)

      if DataInCell <> '' then
      begin

        nLeft := ((Rect.Right-Rect.Left) - TextWidth(DataInCell)) div 2;
        nTop := ((Rect.Bottom-Rect.Top) - TextHeight(DataInCell)) div 2;
        TextRect(Rect, Rect.Left + nLeft, Rect.Top + nTop, DataInCell);  //문자를 뿌려준다.. 기본은 검정색
      end;

    End;

  end;
end;

procedure TfmAccessEvent.FormActivate(Sender: TObject);
begin
//  AdvStringGrid1.OnDrawCell:=StringGrideDrawCell;
end;

procedure TfmAccessEvent.btn_ClearClick(Sender: TObject);
var
  i:integer;
begin
  bClear := True;
  GridInitialize(AdvStringGrid1);


end;

procedure TfmAccessEvent.DisplayStringGrid(aCmd, aTxRx,aIP,aECUID, aData: string);
var
  stDisplay : string;
begin
  if Not bStart then Exit;

end;

procedure TfmAccessEvent.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='출입현황 조회(' + FormatDateTime('yyyy-mm-dd',now) + ')';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    AdvStringGrid1.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmAccessEvent.btn_startClick(Sender: TObject);
begin
  bStart := True;
  btn_start.Enabled := False;
  btn_stop.Enabled := True;
end;

procedure TfmAccessEvent.btn_stopClick(Sender: TObject);
begin
  bStart := False;
  btn_start.Enabled := True;
  btn_stop.Enabled := False;

end;

procedure TfmAccessEvent.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;

end;

procedure TfmAccessEvent.CloseForm;
begin
  Close;
end;

procedure TfmAccessEvent.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  if DisplayList.Count > 0 then
  begin
    BatchDisplay(DisplayList.Strings[0]);
    DisplayList.Delete(0);
  end;
  SearchTimer.Enabled := True;
end;

procedure TfmAccessEvent.BatchDisplay(aData:string);
var
  stECUID, stDoorNo, stReaderNo:string;
  stInOut, stTime, stCardMode, stDoorMode, stChangeState, stAccessResult:string;
  stDoorState, stATButton, stCardNo : string;
  stAccessResultName,stInOutName,stCardModeName : string;
  stDoorModeName,stChangeStateName,stDoorStateName : string;
  nPos : integer;
  stButtonName : string;
begin
  nPos := PosIndex(';',aData,1);
  stECUID := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stDoorNo := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stReaderNo := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stInOut := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stTime := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stCardMode := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stDoorMode := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stChangeState := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stAccessResult := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stDoorState := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stATButton := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stCardNo := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);

  //여기에서 화면에 뿌려주자.
  with AdvStringGrid1 do
  begin
    if Trim(ed_ecuid.Text) <> '' then
    begin
      if pos(stEcuID,ed_ecuid.Text) = 0 then Exit;
    end;
    if RowCount >= 10000 then  rowCount := 9999;
    
    if Not bClear then InsertRows(1,1);
    bClear := False;

    Cells[0,1] := strToTimeFormat(stTime);
    Cells[1,1] := stEcuID ;
    Cells[2,1] :=  stDoorNo ;
    Cells[3,1] :=  stReaderNo ;
    Cells[4,1] :=  stCardNo ;
    case stAccessResult[1] of
      #$30:  stAccessResultName := '해당사항없음';
      #$31:  stAccessResultName := '출입승인';
      #$32:  stAccessResultName := '방범카드조작'; //방범카드조작(*)
      #$33:  stAccessResultName := '방범경계승인'; //방범카드조작(*)
      #$34:  stAccessResultName := '방범해제승인'; //방범카드조작(*)
      #$41:  stAccessResultName := '미등록카드';
      #$42:  stAccessResultName := '출입불가';
      #$43:  stAccessResultName := '방범불가'; //미등록카드(*)
      #$44:  stAccessResultName := '경계모드출입불가';
      #$45:  stAccessResultName := '출입제한시간';
      #$46:  stAccessResultName := '유효기간만료';
      else  stAccessResultName := stAccessResult;
    end;
    Cells[5,1] :=  stAccessResultName ;
    stButtonName := Ascii2Hex(stATButton) ;
    if stButtonName = '30' then stButtonName := '퇴실'
    else if stButtonName = '31' then stButtonName := '출근'
    else if stButtonName = '32' then stButtonName := '퇴근'
    else if stButtonName = '34' then stButtonName := '외출'
    else if stButtonName = '35' then stButtonName := '복귀'
    else if stButtonName = '61' then stButtonName := '경해'
    else if stButtonName = '63' then stButtonName := '재중'
    else if stButtonName = '7F' then stButtonName := '';
    Cells[6,1] := stButtonName ;
    case stInOut[1] of
      '0' : stInOutName := '내부';
      '1' : stInOutName := '외부';
      else stInOutName := '내부';
    end;
    Cells[7,1] :=  stInOutName ;
    case stCardMode[1] of
      '0': stCardModeName := 'Positive';
      '1': stCardModeName := 'Negative';
      '2': stCardModeName := 'Positive(2)';
      '3': stCardModeName := 'Negative(3)';
      else   stCardModeName := stCardMode;
    end;
    Cells[8,1] :=  stCardModeName ;
    case stDoorMode[1] of
      '0': stDoorModeName := '운영모드';
      '1': stDoorModeName := '개방모드';
      '2': stDoorModeName := '폐쇄모드';
      else   stDoorModeName := stDoorMode;
    end;
    Cells[9,1] :=  stDoorModeName ;
    case stChangeState[1] of
      'C': stChangeStateName := '카드';
      'P': stChangeStateName := '전화';
      'R': stChangeStateName := '원격제어';
      'B': stChangeStateName := '버튼';
      'S': stChangeStateName := '스케쥴';
      else stChangeStateName := stChangeState;
    end;
    Cells[10,1] :=  stChangeStateName ;
    case stDoorState[1]of
      'C': stDoorStateName := '닫힘';
      'O': stDoorStateName := '열림';
      else stDoorStateName := stDoorState;
    end;
    Cells[11,1] :=  stDoorStateName ;
    if Not isDigit(stAccessResult) then RowColor[1] := clYellow;

  end;
end;

procedure TfmAccessEvent.RecvCardAccessEvent(aECUID, aDoorNo, aReaderNo,
  aInOut, aTime, aCardMode, aDoorMode, aChangeState, aAccessResult,
  aDoorState, aATButton, aCardNo:string);
var
  stDisplay : string;
begin
  if Not bStart then Exit;
  stDisplay := aECUID + ';';
  stDisplay := stDisplay + aDoorNo + ';';
  stDisplay := stDisplay + aReaderNo + ';';
  stDisplay := stDisplay + aInOut + ';';
  stDisplay := stDisplay + aTime + ';';
  stDisplay := stDisplay + aCardMode + ';';
  stDisplay := stDisplay + aDoorMode + ';';
  stDisplay := stDisplay + aChangeState + ';';
  stDisplay := stDisplay + aAccessResult + ';';
  stDisplay := stDisplay + aDoorState + ';';
  stDisplay := stDisplay + aATButton + ';';
  stDisplay := stDisplay + aCardNo + ';';
  DisplayList.Add(stDisplay);

end;

procedure TfmAccessEvent.RcvExitButtonEvent(aECUID, aDoorNo, aReaderNo,
  aInOut, aTime, aCardMode, aDoorMode, aChangeState, aAccessResult,
  aDoorState, aATButton, aCardNo: string);
var
  stDisplay : string;
begin
  if Not bStart then Exit;
  stDisplay := aECUID + ';';
  stDisplay := stDisplay + aDoorNo + ';';
  stDisplay := stDisplay + aReaderNo + ';';
  stDisplay := stDisplay + aInOut + ';';
  stDisplay := stDisplay + aTime + ';';
  stDisplay := stDisplay + aCardMode + ';';
  stDisplay := stDisplay + aDoorMode + ';';
  stDisplay := stDisplay + aChangeState + ';';
  stDisplay := stDisplay + aAccessResult + ';';
  stDisplay := stDisplay + aDoorState + ';';
  stDisplay := stDisplay + aATButton + ';';
  stDisplay := stDisplay + '퇴실버튼' + ';';
  DisplayList.Add(stDisplay);

end;

initialization
  RegisterClass(TfmAccessEvent);
Finalization
  UnRegisterClass(TfmAccessEvent);

end.
