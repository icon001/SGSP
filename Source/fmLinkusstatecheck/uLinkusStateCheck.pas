unit uLinkusStateCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, Grids, BaseGrid, AdvGrid, AdvObj,uSubForm,
  CommandArray;

type
  TfmLinkusStateCheck = class(TfmASubForm)
    GroupBox1: TGroupBox;
    btnMonitoring: TRzBitBtn;
    btnClose: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    sg_Monitoring: TAdvStringGrid;
    RzBitBtn3: TRzBitBtn;
    SaveDialog1: TSaveDialog;
    procedure btnCloseClick(Sender: TObject);
    procedure btnMonitoringClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure SendPacket(aEcuID: string;aCmd: Char; aData: string);
  public
    DeviceID : String;
    stMessage : string;
    { Public declarations }
    procedure LinkusStateMonitoring(aData,aGubun:string);
  end;

var
  fmLinkusStateCheck: TfmLinkusStateCheck;

implementation

uses
  uMain,
  uUtil,
  dllFunction,
  uSocket;

{$R *.dfm}

procedure TfmLinkusStateCheck.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLinkusStateCheck.btnMonitoringClick(Sender: TObject);
begin

  SendPacket('00','R','SM50' + FillzeroNumber(30,5));
  Delay(100);
  SendPacket('00','R','SM55' + FillzeroNumber(30,5));
  Delay(100);
  SendPacket('00','R','SM57' + FillzeroNumber(30,5));

end;

procedure TfmLinkusStateCheck.RzBitBtn2Click(Sender: TObject);
begin
  SendPacket('00','R','SM50' + FillzeroNumber(0,5));
  Delay(100);
  SendPacket('00','R','SM55' + FillzeroNumber(0,5));
  Delay(100);
  SendPacket('00','R','SM57' + FillzeroNumber(0,5));

end;

procedure TfmLinkusStateCheck.FormShow(Sender: TObject);
begin
  fmMain.L_bLinkusStateCheckShow := True;

end;

procedure TfmLinkusStateCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fmMain.L_bLinkusStateCheckShow := False;
  Action := caFree;
end;

procedure TfmLinkusStateCheck.LinkusStateMonitoring(aData,aGubun: string);
var
  stGubun : string;
  nTopRow : integer;
  nRowCount : integer;
begin
  with sg_Monitoring do
  begin
    if aGubun = '01' then stGubun := '전용/국선'
    else if aGubun = '04' then stGubun := 'WCDMA'
    else if aGubun = '06' then stGubun := 'TCP/IP'
    else stGubun := aGubun;
(*    if RowCount >= 1000 then  rowCount := 999;
    if Cells[1,1] <> '' then InsertRows(1,1);
    Cells[0,1] := stGubun;
    Cells[1,1] := aData;
    if Pos('TX',aData) > 0 then RowColor[1] := $003CC7FF
    else if Pos('RX',aData) > 0 then RowColor[1] := clSilver
    else RowColor[1] := clWhite; *)
    if RowCount >= 1000 then  RemoveRows(1,1);
    if Cells[1,1] <> '' then AddRow;
    Cells[0,RowCount - 1] := stGubun;
    Cells[1,RowCount - 1] := aData;
    if Pos('TX',aData) > 0 then RowColor[RowCount - 1] := clSilver
    else RowColor[RowCount - 1] := clWhite;
    nRowCount := Height div FixedRowHeight;
    if (RowCount - 1) < nRowCount then nTopRow := 1
    else nTopRow := RowCount - nRowCount + 1;
    TopRow := nTopRow;
  end;
end;

procedure TfmLinkusStateCheck.RzBitBtn1Click(Sender: TObject);
begin
  GridInitialize(sg_Monitoring);
end;

procedure TfmLinkusStateCheck.SendPacket(aEcuID: string; aCmd: Char;
  aData: string);
begin
  dmsocket.DirectSendPacket(aEcuID,aCmd,aData,True);
end;

procedure TfmLinkusStateCheck.RzBitBtn3Click(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='관제모니터링(' + FormatDateTime('yyyy-mm-dd',now) + ')';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_Monitoring.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

initialization
  RegisterClass(TfmLinkusStateCheck);
Finalization
  UnRegisterClass(TfmLinkusStateCheck);

end.
