unit uAlarmEvent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids,
  AdvObj;

type
  TfmAlarmEvent = class(TfmASubForm)
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

    procedure RecvAlarmEvent(aECUID, aTime, aSubCLass,
                    aSubAddr, aZone, aMode, aStatus, aLoop, aState, aOper:string);
  end;

var
  fmAlarmEvent: TfmAlarmEvent;

implementation

uses
  uCommon,
  dllFunction;
  
{$R *.dfm}



procedure TfmAlarmEvent.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'CURRENTSTATE';

  DisplayList := TStringList.Create;

  SearchTimer.Enabled := True;

end;

procedure TfmAlarmEvent.CommandArrayCommandsTCommand0Execute(
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

procedure TfmAlarmEvent.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SearchTimer.Enabled := False;
  if G_bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('ALARMEVENT').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('ALARMEVENT').Execute;
  Action := caFree;
  DisplayList.Clear;
  DisplayList.Free;
  SearchTimer.Free;
end;

procedure TfmAlarmEvent.FormShow(Sender: TObject);
begin

  self.FindSubForm('Main').FindCommand('ALARMEVENT').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('ALARMEVENT').Execute;

//  StringGrideResize(AdvStringGrid1);
  btn_ClearClick(Self);
  btn_StartClick(Self);

end;

procedure TfmAlarmEvent.StringGrideResize(Gride:TStringGrid);
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

procedure TfmAlarmEvent.AdvStringGrid1Resize(Sender: TObject);
begin
//  StringGrideResize(AdvStringGrid1);
end;

procedure TfmAlarmEvent.StringGrideDrawCell(Sender: TObject; ACol,
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

procedure TfmAlarmEvent.FormActivate(Sender: TObject);
begin
//  AdvStringGrid1.OnDrawCell:=StringGrideDrawCell;
end;

procedure TfmAlarmEvent.btn_ClearClick(Sender: TObject);
var
  i:integer;
begin
  bClear := True;
  GridInitialize(AdvStringGrid1);


end;

procedure TfmAlarmEvent.DisplayStringGrid(aCmd, aTxRx,aIP,aECUID, aData: string);
var
  stDisplay : string;
begin
  if Not bStart then Exit;

end;

procedure TfmAlarmEvent.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='알람발생현황 조회(' + FormatDateTime('yyyy-mm-dd',now) + ')';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    AdvStringGrid1.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmAlarmEvent.btn_startClick(Sender: TObject);
begin
  bStart := True;
  btn_start.Enabled := False;
  btn_stop.Enabled := True;
end;

procedure TfmAlarmEvent.btn_stopClick(Sender: TObject);
begin
  bStart := False;
  btn_start.Enabled := True;
  btn_stop.Enabled := False;

end;

procedure TfmAlarmEvent.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;

end;

procedure TfmAlarmEvent.CloseForm;
begin
  Close;
end;

procedure TfmAlarmEvent.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  if DisplayList.Count > 0 then
  begin
    BatchDisplay(DisplayList.Strings[0]);
    DisplayList.Delete(0);
  end;
  SearchTimer.Enabled := True;
end;

procedure TfmAlarmEvent.BatchDisplay(aData:string);
var
  stECUID, stTime, stSubCLass, stSubAddr : string;
  stZone, stMode, stStatus, stLoop, stState, stOper : string;
  nPos : integer;
begin
  nPos := PosIndex(';',aData,1);
  stECUID := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stTime := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stSubCLass := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stSubAddr := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stZone := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stMode := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stStatus := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stLoop := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stState := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stOper := copy(aData,1,nPos - 1);
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
    Cells[2,1] :=  stSubCLass ;
    Cells[3,1] :=  stSubAddr ;
    Cells[4,1] :=  stZone ;
    case UpperCase(stMode)[1] of
      'A' : stMode := '경계';
      'D' : stMode := '해제';
    end;
    Cells[5,1] :=  stMode ;
    Cells[6,1] :=  stStatus ;
    Cells[7,1] :=  stLoop ;
    case UpperCase(stState)[1] of
      'P' : stState := '오픈';
      'S' : stState := '쇼트';
      'N' : stState := '정상';
    end;
    Cells[8,1] :=  stState ;
    Cells[9,1] :=  stOper ;

//    if Not isDigit(stAccessResult) then RowColor[1] := clYellow;

  end;
end;


procedure TfmAlarmEvent.RecvAlarmEvent(aECUID, aTime, aSubCLass, aSubAddr,
  aZone, aMode, aStatus, aLoop, aState, aOper: string);
var
  stDisplay : string;
begin
  if Not bStart then Exit;
  stDisplay := aECUID + ';';
  stDisplay := stDisplay + aTime + ';';
  stDisplay := stDisplay + aSubCLass + ';';
  stDisplay := stDisplay + aSubAddr + ';';
  stDisplay := stDisplay + aZone + ';';
  stDisplay := stDisplay + aMode + ';';
  stDisplay := stDisplay + aStatus + ';';
  stDisplay := stDisplay + aLoop + ';';
  stDisplay := stDisplay + aState + ';';
  stDisplay := stDisplay + aOper + ';';
  DisplayList.Add(stDisplay);

end;

initialization
  RegisterClass(TfmAlarmEvent);
Finalization
  UnRegisterClass(TfmAlarmEvent);

end.
