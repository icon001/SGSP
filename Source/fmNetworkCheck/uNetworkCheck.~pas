unit uNetworkCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Grids, AdvObj, BaseGrid, AdvGrid, ExtCtrls,
  uSubForm, CommandArray;

type
  TfmNetworkCheck = class(TfmASubForm)
    GroupBox1: TGroupBox;
    btnMonitoring: TRzBitBtn;
    btnClose: TRzBitBtn;
    sg_NetworkState: TAdvStringGrid;
    pan_Message: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    RzBitBtn1: TRzBitBtn;
    StaticText1: TStaticText;
    ed_DelayTime: TEdit;
    StaticText2: TStaticText;
    chk_CardReader: TCheckBox;
    btn_ShortCheck: TRzBitBtn;
    st_LineShortCheck: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure sg_NetworkStateResize(Sender: TObject);
    procedure StringGridInitialize(aFirst:Boolean=True);
    procedure FormCreate(Sender: TObject);
    procedure btnMonitoringClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_ShortCheckClick(Sender: TObject);
  private
    L_bNetworkCheckCancel : Boolean;
    { Private declarations }
    procedure DeviceVersionCheck;
    procedure CardReaderNetworkCheck;
    procedure ZoneExtentionCheck;
  public
    { Public declarations }
    procedure RecvLineShortCheck(aECUID, aData:string);
  end;

var
  fmNetworkCheck: TfmNetworkCheck;

implementation

uses
  uCommon,
  uSocket,
  dllFunction;
  
{$R *.dfm}

procedure TfmNetworkCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('NetworkCheck').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('NetworkCheck').Execute;
  Action := caFree;
end;

procedure TfmNetworkCheck.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmNetworkCheck.sg_NetworkStateResize(Sender: TObject);
begin
    with sg_NetworkState do
    begin
      DefaultColWidth := Width div ColCount;
    end;
end;

procedure TfmNetworkCheck.StringGridInitialize(aFirst:Boolean=True);
var
   i : integer;
begin
    with sg_NetworkState do
    begin
      Clear;
      if DeviceList.Count > 0 then
        RowCount := DeviceList.Count + 2
      else RowCount := 3;
      
      MergeCells(0,0,1,2);
      MergeCells(1,0,1,2);
      MergeCells(2,0,9,1);
      MergeCells(10,0,17,1);

      cells[0,0] := '컨트롤러번호';
      cells[1,0] := '컨트롤러상태';
      cells[2,0] := '카드리더상태';
      cells[2,1] := '1';
      cells[3,1] := '2';
      cells[4,1] := '3';
      cells[5,1] := '4';
      cells[6,1] := '5';
      cells[7,1] := '6';
      cells[8,1] := '7';
      cells[9,1] := '8';
      cells[10,0] := '존확장기상태';
      cells[10,1] := '1';
      cells[11,1] := '2';
      cells[12,1] := '3';
      cells[13,1] := '4';
      cells[14,1] := '5';
      cells[15,1] := '6';
      cells[16,1] := '7';
      cells[17,1] := '8';

      for i := 0 to DeviceList.Count - 1 do
      begin
        cells[0,i + 2] := DeviceList.strings[i];
        if aFirst then
        begin
          if TCurrentDeviceState(DeviceList.Objects[i]).Connected then
          begin
            sg_NetworkState.Cells[1,i + 2] := '성공';
            sg_NetworkState.Colors[1,i + 2] := clGreen;
          end else
          begin
            sg_NetworkState.Cells[1,i + 2] := '실패';
            sg_NetworkState.Colors[1,i + 2] := clRed;
          end;
        end else
        begin
          sg_NetworkState.Cells[1,i + 2] := '';
          sg_NetworkState.Colors[1,i + 2] := clWhite;
        end;
      end;
    end;
end;

procedure TfmNetworkCheck.FormCreate(Sender: TObject);
begin
  StringGridInitialize;
end;

procedure TfmNetworkCheck.btnMonitoringClick(Sender: TObject);
begin
  L_bNetworkCheckCancel := False;
  StringGridInitialize(False);

  DeviceVersionCheck;
  if chk_CardReader.Checked then
     CardReaderNetworkCheck;
  ZoneExtentionCheck;
end;

procedure TfmNetworkCheck.FormResize(Sender: TObject);
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

procedure TfmNetworkCheck.DeviceVersionCheck;
var
  i,j : integer;
  nDelayTime : integer;
begin
  if Not isDigit(ed_DelayTime.Text) then nDelayTime := 0
  else nDelayTime := strtoint(ed_DelayTime.Text);
  Try
    pan_Message.Visible := True;
    pan_Message.Color := clYellow;

    for i := 0 to DeviceList.Count - 1 do
    begin
      pan_Message.Caption := DeviceList.Strings[i] + '번 컨트롤러 기기 통신 체크 중입니다.';
      for j := 0 to G_nLoopCount do
      begin
        if G_bApplicationTerminate then Exit;
        if L_bNetworkCheckCancel then Exit;
        if dmSocket.DeviceVersion_Check(DeviceList.Strings[i],True,2,nDelayTime) then break;
      end;
      if TCurrentDeviceState(DeviceList.Objects[i]).Connected then
      begin
        sg_NetworkState.Cells[1,i + 2] := '성공';
        sg_NetworkState.Colors[1,i + 2] := clGreen;
      end else
      begin
        sg_NetworkState.Cells[1,i + 2] := '실패';
        sg_NetworkState.Colors[1,i + 2] := clRed;
      end;
    end;
  Finally
    pan_Message.Visible := False;
  End;
end;

procedure TfmNetworkCheck.RzBitBtn1Click(Sender: TObject);
begin
  L_bNetworkCheckCancel := True;
end;

procedure TfmNetworkCheck.CardReaderNetworkCheck;
var
  i,j : integer;
begin
  Try
    pan_Message.Visible := True;
    pan_Message.Color := clYellow;

    for i := 0 to DeviceList.Count - 1 do
    begin
      if TCurrentDeviceState(DeviceList.Objects[i]).Connected then   //통신연결 상태로 버젼 정보 미 수신시 버젼을 수신 하자.
      begin
        pan_Message.Caption := DeviceList.Strings[i] + '번 컨트롤러의 카드리더 통신상태 체크 중입니다.';
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          if L_bNetworkCheckCancel then Exit;
          if dmSocket.CardReaderStatusCheck(DeviceList.Strings[i],True) then break;
        end;

        for j := 1 to FIXMAXREADERNO do
        begin
          if TCurrentDeviceState(DeviceList.Objects[i]).GetReaderUse(j) then
          begin
            if TCurrentDeviceState(DeviceList.Objects[i]).GetReaderConnectState(j) then
            begin
              sg_NetworkState.Cells[ j + 1,i + 2] := '성공';
              sg_NetworkState.Colors[j + 1,i + 2] := clGreen;
            end else
            begin
              sg_NetworkState.Cells[j + 1,i + 2] := '실패';
              sg_NetworkState.Colors[j + 1,i + 2] := clRed;
            end;
          end;
        end;
      end;
    end;
  Finally
    pan_Message.Visible := False;
  End;

end;

procedure TfmNetworkCheck.FormShow(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('NetworkCheck').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('NetworkCheck').Execute;
  WindowState := wsMaximized;
end;

procedure TfmNetworkCheck.ZoneExtentionCheck;
var
  i,j : integer;
begin
  Try
    pan_Message.Visible := True;
    pan_Message.Color := clYellow;

    for i := 0 to DeviceList.Count - 1 do
    begin
      if TCurrentDeviceState(DeviceList.Objects[i]).Connected then   //통신연결 상태로 버젼 정보 미 수신시 버젼을 수신 하자.
      begin
        pan_Message.Caption := DeviceList.Strings[i] + '번 컨트롤러의 존확장기 통신상태 체크 중입니다.';
        for j := 0 to G_nLoopCount do
        begin
          if G_bApplicationTerminate then Exit;
          if L_bNetworkCheckCancel then Exit;
          if dmSocket.ZoneExtentionNetworkStatusCheck(DeviceList.Strings[i],True) then break;
        end;

        for j := 1 to FIXMAXZONEEXTENDNO do
        begin
          if TCurrentDeviceState(DeviceList.Objects[i]).GetZoneExtentionUse(j) = '1' then
          begin
            if TCurrentDeviceState(DeviceList.Objects[i]).GetZoneExtentionConnectState(j) then
            begin
              sg_NetworkState.Cells[ j + 9,i + 2] := '성공';
              sg_NetworkState.Colors[j + 9,i + 2] := clGreen;
            end else
            begin
              sg_NetworkState.Cells[j + 9,i + 2] := '실패';
              sg_NetworkState.Colors[j + 9,i + 2] := clRed;
            end;
          end;
        end;
      end;
    end;
  Finally
    pan_Message.Visible := False;
  End;
end;

procedure TfmNetworkCheck.btn_ShortCheckClick(Sender: TObject);
begin
  st_LineShortCheck.Caption := '';
  st_LineShortCheck.Color := clWhite;
  dmSocket.LineShortCheck;
end;

procedure TfmNetworkCheck.RecvLineShortCheck(aECUID, aData: string);
begin
  //st_LineShortCheck.Caption := aData;
  if Pos('OK',aData) > 0 then
  begin
    st_LineShortCheck.Caption := '정상';
    st_LineShortCheck.Color := clYellow;
    btnMonitoring.Enabled := True;
  end else if Pos('NG',aData) > 0 then
  begin
    st_LineShortCheck.Caption := '쇼트';
    st_LineShortCheck.Color := clRed;

  end;
end;

initialization
  RegisterClass(TfmNetworkCheck);
Finalization
  UnRegisterClass(TfmNetworkCheck);
  
end.
