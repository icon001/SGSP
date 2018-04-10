unit uDVRStateCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, Grids, BaseGrid, AdvGrid;

type
  TfmDVRStateCheck = class(TForm)
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
    procedure DVRStateMonitoring(aData:string);
  end;

var
  fmDVRStateCheck: TfmDVRStateCheck;

implementation

uses
  uMain,
  uUtil,
  dllFunction,
  uSocket;

{$R *.dfm}

procedure TfmDVRStateCheck.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDVRStateCheck.btnMonitoringClick(Sender: TObject);
begin
  SendPacket('00','R','SM65' + FillzeroNumber(30,5));

end;

procedure TfmDVRStateCheck.RzBitBtn2Click(Sender: TObject);
begin
  SendPacket('00','R','SM65' + FillzeroNumber(0,5));

end;

procedure TfmDVRStateCheck.FormShow(Sender: TObject);
begin
  fmMain.L_bDVRStateCheckShow := True;

end;

procedure TfmDVRStateCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fmMain.L_bDVRStateCheckShow := False;
  Action := caFree;

end;

procedure TfmDVRStateCheck.DVRStateMonitoring(aData: string);
begin
  mem_state.Lines.Add(aData);
end;

procedure TfmDVRStateCheck.RzBitBtn1Click(Sender: TObject);
begin
  mem_state.Lines.Clear;
end;

procedure TfmDVRStateCheck.SendPacket(aEcuID: string; aCmd: Char;
  aData: string);
begin
  dmsocket.DirectSendPacket(aEcuID,aCmd,aData,True);

end;

initialization
  RegisterClass(TfmDVRStateCheck);
Finalization
  UnRegisterClass(TfmDVRStateCheck);

end.
