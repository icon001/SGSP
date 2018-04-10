unit uTCPIPDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzButton,uSubForm;

type
  TfmTCPIPDetail = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label218: TLabel;
    ed_DDNSQuryServerIP: TEdit;
    ed_DDNSQuryServerPort: TEdit;
    Label495: TLabel;
    ed_DDNSServerPort: TEdit;
    Label496: TLabel;
    ed_DDNSServerIP: TEdit;
    Label492: TLabel;
    Label493: TLabel;
    ed_TCPIPIP: TEdit;
    Label497: TLabel;
    ed_TCPIPPort: TEdit;
    ed_TCPIPServerPort: TEdit;
    Label494: TLabel;
    btn_Reg: TRzBitBtn;
    btn_Search: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    procedure btn_SearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_RegClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    FECUID: string;
    { Private declarations }
    procedure SearchDDNSQuery;
    procedure SearchDDNSServer;
    procedure SearchEventServer;
    procedure SearchServerPort;
    procedure RegistDDNSQuery;
    procedure RegistDDNSServer;
    procedure RegistEventServer;
    procedure RegistServerPort;

    Function  MDIForm(FormName:string):TForm;
  public
    { Public declarations }
    procedure RcvKTTDDNSQueryCheck(aData:string);
    procedure RcvKTTDDNSServerCheck(aData:string);
    procedure RcvKTTEventServerCheck(aData:string);
    procedure RcvKTTServerPortCheck(aData:string);
    property ECUID : string read FECUID write FECUID;
  end;

var
  fmTCPIPDetail: TfmTCPIPDetail;

implementation
uses
  uCurrentDeviceSetting,
  uCommon,
  uSocket,
  dllFunction;
{$R *.dfm}

procedure TfmTCPIPDetail.btn_SearchClick(Sender: TObject);
begin
  if Not dmSocket.SocketConnected then Exit;
  SearchDDNSQuery;
  SearchDDNSServer;
  SearchEventServer;
  SearchServerPort;
end;

procedure TfmTCPIPDetail.SearchDDNSQuery;
var
  i : integer;
begin
  ed_DDNSQuryServerIP.Color := clWhite;
  ed_DDNSQuryServerPort.Color := clWhite;

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    if dmSocket.DDNSQueryServer_Check then break;
  end;
end;

procedure TfmTCPIPDetail.SearchDDNSServer;
var
  i : integer;
begin
  ed_DDNSServerIP.Color := clWhite;
  ed_DDNSServerPort.Color := clWhite;

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    if dmSocket.DDNSServer_Check then break;
  end;

end;

procedure TfmTCPIPDetail.SearchEventServer;
var
  i : integer;
begin
  ed_TCPIPIP.Color := clWhite;
  ed_TCPIPPort.Color := clWhite;

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    if dmSocket.EventServer_Check then break;
  end;
end;

procedure TfmTCPIPDetail.SearchServerPort;
var
  i : integer;
begin
  ed_TCPIPServerPort.Color := clWhite;
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    if dmSocket.TCPServerPort_Check then break;
  end;
end;

procedure TfmTCPIPDetail.FormShow(Sender: TObject);
var
  fmDeviceSetting :TForm;
begin
  fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
  if fmDeviceSetting <> nil then
  begin
    TfmCurrentDeviceSetting(fmDeviceSetting).L_bTcpIpDetailShow := True;
  end;
  btn_SearchClick(btn_Search);
end;

procedure TfmTCPIPDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  fmDeviceSetting :TForm;
begin
  fmDeviceSetting := MDIForm('TfmCurrentDeviceSetting');
  if fmDeviceSetting <> nil then
  begin
    TfmCurrentDeviceSetting(fmDeviceSetting).L_bTcpIpDetailShow := False;
  end;
end;

procedure TfmTCPIPDetail.RcvKTTDDNSQueryCheck(aData: string);
begin
  aData := Trim(aData);
  ed_DDNSQuryServerIP.Text := FindCharCopy(aData,0,' ');
  ed_DDNSQuryServerPort.Text := FindCharCopy(aData + ' ',1,' ');

  ed_DDNSQuryServerIP.Color := clYellow;
  ed_DDNSQuryServerPort.Color := clYellow;

end;

procedure TfmTCPIPDetail.RcvKTTDDNSServerCheck(aData: string);
begin
  aData := Trim(aData);
  ed_DDNSServerIP.Text := FindCharCopy(aData,0,' ');
  ed_DDNSServerPort.Text := FindCharCopy(aData + ' ',1,' ');

  ed_DDNSServerIP.Color := clYellow;
  ed_DDNSServerPort.Color := clYellow;
end;

procedure TfmTCPIPDetail.RcvKTTEventServerCheck(aData: string);
begin
  aData := Trim(aData);

  ed_TCPIPIP.Text := FindCharCopy(aData,0,' ');
  ed_TCPIPPort.Text := FindCharCopy(aData + ' ',1,' ');

  ed_TCPIPIP.Color := clYellow;
  ed_TCPIPPort.Color := clYellow;

end;

procedure TfmTCPIPDetail.RcvKTTServerPortCheck(aData: string);
begin
  aData := Trim(aData);
  ed_TCPIPServerPort.Text := aData;

  ed_TCPIPServerPort.Color := clYellow;

end;

procedure TfmTCPIPDetail.btn_RegClick(Sender: TObject);
begin
  if Not dmSocket.SocketConnected then Exit;
  if ed_DDNSQuryServerIP.Text = '' then
  begin
    showmessage('DDNSQueryServer IP를 입력하세요.');
    Exit;
  end;
  if ed_DDNSQuryServerPort.Text = '' then
  begin
    showmessage('DDNSQueryServer Port를 입력하세요.');
    Exit;
  end;
  if ed_DDNSServerIP.Text = '' then
  begin
    showmessage('DDNSServer IP를 입력하세요.');
    Exit;
  end;
  if ed_DDNSServerPort.Text = '' then
  begin
    showmessage('DDNSServer Port를 입력하세요.');
    Exit;
  end;
  if ed_TCPIPIP.Text = '' then
  begin
    showmessage('EventServer IP를 입력하세요.');
    Exit;
  end;
  if ed_TCPIPPort.Text = '' then
  begin
    showmessage('EventServer Port를 입력하세요.');
    Exit;
  end;
  if ed_TCPIPServerPort.Text = '' then
  begin
    showmessage('수신 Server Port를 입력하세요.');
    Exit;
  end;

  RegistDDNSQuery;
  RegistDDNSServer;
  RegistEventServer;
  RegistServerPort;  
end;

procedure TfmTCPIPDetail.RegistDDNSQuery;
var
  i : integer;
begin
  ed_DDNSQuryServerIP.Color := clWhite;
  ed_DDNSQuryServerPort.Color := clWhite;

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    if dmSocket.DDNSQueryServer_Registration(ed_DDNSQuryServerIP.Text,ed_DDNSQuryServerPort.Text) then break;
  end;
end;

procedure TfmTCPIPDetail.RegistDDNSServer;
var
  i : integer;
begin
  ed_DDNSServerIP.Color := clWhite;
  ed_DDNSServerPort.Color := clWhite;

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    if dmSocket.DDNSServer_Registration(ed_DDNSServerIP.Text,ed_DDNSServerPort.Text) then break;
  end;
end;

procedure TfmTCPIPDetail.RegistEventServer;
var
  i : integer;
begin
  ed_TCPIPIP.Color := clWhite;
  ed_TCPIPPort.Color := clWhite;

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    if dmSocket.EventServer_Registration(ed_TCPIPIP.Text,ed_TCPIPPort.Text) then break;
  end;
end;

procedure TfmTCPIPDetail.RegistServerPort;
var
  i : integer;
begin
  ed_TCPIPServerPort.Color := clWhite;

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    if dmSocket.ServerPort_Registration(ed_TCPIPServerPort.Text) then break;
  end;
end;

procedure TfmTCPIPDetail.RzBitBtn1Click(Sender: TObject);
begin
  ed_DDNSQuryServerIP.Text := '121.170.197.180';
  ed_DDNSQuryServerPort.Text := '9301';
  ed_DDNSServerIP.Text := '121.170.197.180';
  ed_DDNSServerPort.Text := '9300';
  ed_TCPIPIP.Text := '121.170.197.175';
  ed_TCPIPPort.Text := '7001';
  ed_TCPIPServerPort.Text := '4101';

end;

function TfmTCPIPDetail.MDIForm(FormName: string): TForm;
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  result := nil;
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        result := Screen.Forms[i];
        Exit;
      end;
    end;
  end;
end;

end.
