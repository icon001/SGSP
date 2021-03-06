unit uDeviceVersion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, Buttons, ExtCtrls, AdvPanel, RzButton,
  uSubForm, CommandArray, AdvObj;

type
  TfmDeviceVersion = class(TfmASubForm)
    AdvPanel1: TAdvPanel;
    sg_DeviceVer: TAdvStringGrid;
    btnClose: TRzBitBtn;
    btn_csvSave: TRzBitBtn;
    SaveDialog1: TSaveDialog;
    SearchTimer1: TTimer;
    pan_Message: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_csvSaveClick(Sender: TObject);
    procedure SearchTimer1Timer(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    procedure DeviceVersionCheck;
  public
    { Public declarations }
    procedure DeviceVersionSearch;
  end;

var
  fmDeviceVersion: TfmDeviceVersion;

implementation

uses
  uCommon,
  uUtil,
  dllFunction,
  uSocket,
  uMain;

{$R *.dfm}

procedure TfmDeviceVersion.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDeviceVersion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fmMain.L_bDeviceVersionShow := False;
  Action := caFree;
end;

procedure TfmDeviceVersion.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
  SearchTimer1.Enabled := True;
end;

procedure TfmDeviceVersion.FormShow(Sender: TObject);
begin
  inherited;
  fmMain.L_bDeviceVersionShow := True;

end;

procedure TfmDeviceVersion.btn_csvSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='컨트롤러 버젼정보';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_DeviceVer.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault; 
end;

procedure TfmDeviceVersion.DeviceVersionSearch;
var
  i,j : integer;
begin
  GridInitialize(sg_DeviceVer);
  sg_DeviceVer.RowCount := DeviceList.Count + 1;

  for i := 0 to DeviceList.Count - 1 do
  begin
    sg_DeviceVer.Cells[0,i+1] := DeviceList.Strings[i];
    if isdigit(TCurrentDeviceState(DeviceList.Objects[i]).DeviceType) then
      sg_DeviceVer.Cells[1,i+1] := DeviceTypeNameList[strtoint(TCurrentDeviceState(DeviceList.Objects[i]).DeviceType)];
    sg_DeviceVer.Cells[2,i+1] := TCurrentDeviceState(DeviceList.Objects[i]).DeviceVersion;
  end;

end;

procedure TfmDeviceVersion.SearchTimer1Timer(Sender: TObject);
begin
  inherited;
  SearchTimer1.Enabled := False;
  DeviceVersionCheck;
  DeviceVersionSearch;

end;

procedure TfmDeviceVersion.FormResize(Sender: TObject);
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

procedure TfmDeviceVersion.DeviceVersionCheck;
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
        if TCurrentDeviceState(DeviceList.Objects[i]).DeviceVersion = '' then
        begin
          pan_Message.Caption := DeviceList.Strings[i] + '번 컨트롤러 기기 버젼 체크 중입니다.';
          for j := 0 to G_nLoopCount do
          begin
            if G_bApplicationTerminate then Exit;
            if dmSocket.DeviceVersion_Check(DeviceList.Strings[i],True) then break;
          end;
        end;
      end;
    end;
  Finally
    pan_Message.Visible := False;
  End;

end;

initialization
  RegisterClass(TfmDeviceVersion);
Finalization
  UnRegisterClass(TfmDeviceVersion);

end.
