unit uCdmaStateCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, Grids, BaseGrid, AdvGrid;

type
  TfmCdmaStateCheck = class(TForm)
    GroupBox1: TGroupBox;
    btnMonitoring: TRzBitBtn;
    btnClose: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    mem_state: TMemo;
    procedure btnCloseClick(Sender: TObject);
    procedure btnMonitoringClick(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SendPacket(aEcuID: string;aCmd: Char; aData: string);
  public
    DeviceID : String;
    stMessage : string;
    { Public declarations }
    procedure CdmaStateMonitoring(aData:string);
  end;

var
  fmCdmaStateCheck: TfmCdmaStateCheck;

implementation

uses
  uMain,
  uUtil,
  dllFunction,
  uSocket;

{$R *.dfm}

procedure TfmCdmaStateCheck.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCdmaStateCheck.btnMonitoringClick(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := DeviceID + '00';

  SendPacket(stDeviceID,'R','SM55' + FillzeroNumber(30,5));

end;

procedure TfmCdmaStateCheck.RzBitBtn2Click(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := DeviceID + '00';
  SendPacket(stDeviceID,'R','SM55' + FillzeroNumber(0,5));

end;

procedure TfmCdmaStateCheck.FormShow(Sender: TObject);
begin
  fmMain.L_bCdmaStateCheckShow := True;

end;

procedure TfmCdmaStateCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fmMain.L_bCdmaStateCheckShow := False;
  Action := caFree;

end;

procedure TfmCdmaStateCheck.CdmaStateMonitoring(aData: string);
begin
  mem_state.Lines.Add(aData);
end;

procedure TfmCdmaStateCheck.RzBitBtn1Click(Sender: TObject);
begin
  mem_state.Lines.Clear;
end;

procedure TfmCdmaStateCheck.SendPacket(aEcuID: string; aCmd: Char;
  aData: string);
begin
  dmsocket.DirectSendPacket(aEcuID,aCmd,aData,True);

end;

initialization
  RegisterClass(TfmCdmaStateCheck);
Finalization
  UnRegisterClass(TfmCdmaStateCheck);

end.
