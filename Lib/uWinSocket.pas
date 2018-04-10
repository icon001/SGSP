unit uWinSocket;

interface

uses
  SysUtils, Classes,WinSock,Messages,SyncObjs,ExtCtrls,
  Forms,u_c_byte_buffer;

const wm_asynch_select= wm_User;
const k_buffer_max= 4096;
      k_tcp_ip_chunk= 1500;
      MAXSOCKCOUNT = 100;

type

  TSocketDataEvent = procedure(Sender: TObject;SockNo:integer; Buf:String;DataLen: Integer)of object;
  TSocketConnectEvent = procedure(Sender: TObject;SockNo:integer)of object;
  TSocketErrorEvent = procedure(Sender: TObject;SockNo:integer;SocketError: Integer)of object;
  TServerSocketDataEvent = procedure(Sender: TObject;aWinSocket:tSocket;ClientIP:string; Buf:String;DataLen: Integer)of object;

  TdmWinsocket = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    l_wsa_data: twsaData;
    l_c_reception_buffer: c_byte_buffer;
    FTCSDeviceSender : TCriticalSection;
    FHandle : THandle;
    FOpen: Boolean;
    FConnectPort: integer;
    FConnectIP: string;
    FWinSocket: tSocket;
    FOnSocketSendComplete: TSocketConnectEvent;
    FOnSocketDisConnected: TSocketConnectEvent;
    FOnSocketConnected: TSocketConnectEvent;
    FOnSocketRead: TSocketDataEvent;
    FOnSocketSend: TSocketDataEvent;
    FOnSocketError: TSocketErrorEvent;
    { Private declarations }
    function GetHandle: THandle;
    procedure SetConnectIP(const Value: string);
    procedure SetConnectPort(const Value: integer);
    procedure SetOpen(const Value: Boolean);
  protected
    procedure WndProc ( var Message : TMessage ); virtual;
  public
    { Public declarations }
    function HandleAllocated : Boolean;
    procedure HandleNeeded;
    procedure handle_wm_async_select(var Msg: TMessage); message wm_asynch_select;
    function PutString(aData:string):Boolean;
    function PutChar(aChar:char):integer;
  published
    property Handle : THandle read GetHandle;
    property WinSocket : tSocket read FWinSocket write FWinSocket;
    property ConnectIP : string read FConnectIP write SetConnectIP;
    property ConnectPort : integer read FConnectPort write SetConnectPort;
    property Open : Boolean read FOpen write SetOpen;
  published
    //소켓 이벤트
    property OnSocketConnected : TSocketConnectEvent read FOnSocketConnected write FOnSocketConnected;
    property OnSocketDisConnected : TSocketConnectEvent read FOnSocketDisConnected write FOnSocketDisConnected;
    property OnSocketRead : TSocketDataEvent read FOnSocketRead write FOnSocketRead;
    property OnSocketSend : TSocketDataEvent read FOnSocketSend write FOnSocketSend;
    property OnSocketSendComplete : TSocketConnectEvent read FOnSocketSendComplete write FOnSocketSendComplete;
    property OnSocketError : TSocketErrorEvent read FOnSocketError write FOnSocketError;
  end;

var
  dmWinsocket: TdmWinsocket;

implementation

uses
  uUtil;
  
{$R *.dfm}

{ TdmWinsocket }

function TdmWinsocket.GetHandle: THandle;
begin
  HandleNeeded;
  Result := FHandle;
end;

procedure TdmWinsocket.handle_wm_async_select(var Msg: TMessage);
// -- wParam: hSocket, lo(lParam): notification, hi(lParam): error
      procedure handle_fd_connect_notification(p_socket: Integer);
      begin
        if Assigned(FOnSocketConnected) then
        begin
          OnSocketConnected(Self,p_socket);
        end;
      end;

      procedure handle_fd_write_notification(p_socket: Integer);
      begin
        if Assigned(FOnSocketSendComplete) then
        begin
          OnSocketSendComplete(Self,p_socket);
        end;
      end;

      procedure handle_fd_read_notification(p_socket: tSocket);
        var l_remaining: Integer;
            l_pt_start_reception: Pointer;
            l_packet_bytes: Integer;
            l_eol_position: Integer;
            stTemp : String;
        begin
          if l_c_reception_buffer = nil then Exit;

          with l_c_reception_buffer do
          begin
            l_remaining:= m_buffer_size- m_write_index;

            // -- if not at least a tcp-ip chunk, increase the room
            if l_remaining < k_tcp_ip_chunk then
            begin
              // -- reallocate
              double_the_capacity;
              l_remaining:= m_buffer_size- m_write_index;
            end;

            // -- add the received data to the current buffer
            l_pt_start_reception:= @ m_oa_byte_buffer[m_write_index];

            // -- get the data from the client socket
            l_packet_bytes:= Recv(WinSocket, l_pt_start_reception^, l_remaining, 0);
            if l_packet_bytes < 0 then
            begin
              if Assigned(FOnSocketError) then
              begin
                OnSocketError(Self,p_socket,WSAGetLastError);
              end;
            end else
            begin
              m_write_index:= m_write_index+ l_packet_bytes;
              if Assigned(FOnSocketRead) then
              begin
                stTemp := ByteCopy(l_pt_start_reception,l_packet_bytes);
                OnSocketRead(Self,p_socket,stTemp,l_packet_bytes);
              end;
            end;
          end; // with g_c_reception_buffer

        end; // handle_fd_read_notification

      procedure handle_fd_close_notification(p_socket: Integer);
      var l_status: Integer;
          l_linger: TLinger;
          l_absolute_linger: array[0..3] of char absolute l_linger;
      begin
        if WSAIsBlocking
          then
            begin
              WSACancelBlockingCall;
            end;

        ShutDown(p_socket, 2);
        l_linger.l_onoff:= 1;
        l_linger.l_linger:= 0;

        SetSockOpt(p_socket, Sol_Socket, So_Linger, pAnsichar(AnsiString(l_absolute_linger)), sizeof(l_linger));  //l_absolute_linger[0] -> AnsiString(l_absolute_linger) 으로 변경

        l_status:= CloseSocket(p_socket);
        if l_status <> 0 then
        begin
          if Assigned(FOnSocketDisConnected) then
          begin
            OnSocketDisConnected(Self,p_socket);
          end;
        end;
      end; // handle_fd_close_notification
var
  l_param: Integer;
  l_error, l_notification: Integer;
  l_socket_handle: Integer;
begin
    l_param:= Msg.lParam;
    l_socket_handle:= Msg.wParam;

    // -- extract the error and the notification code from l_param
    l_error:= wsaGetSelectError(l_param);
    l_notification:= wsaGetSelectEvent(l_param);

    if l_error <= wsaBaseErr then
    begin
        case l_notification of
          FD_CONNECT: handle_fd_connect_notification(l_socket_handle);
          FD_ACCEPT: {display_bug_stop('no_client_accept')} ;
          FD_WRITE: handle_fd_write_notification(l_socket_handle);
          FD_READ: handle_fd_read_notification(l_socket_handle);
          FD_CLOSE: handle_fd_close_notification(l_socket_handle);
        end // case
    end else
    begin
      if l_notification= FD_CLOSE then handle_fd_close_notification(l_socket_handle)
      else
      begin
        if Assigned(FOnSocketError) then
        begin
          OnSocketError(Self,l_socket_handle,WSAGetLastError);
        end;
      end;
    end; 
end;

function TdmWinsocket.HandleAllocated: Boolean;
begin
  Result := ( FHandle <> 0 );
end;

procedure TdmWinsocket.HandleNeeded;
begin
  if not HandleAllocated
   then FHandle := AllocateHWND ( WndProc );
end;

function TdmWinsocket.PutString(aData: string): Boolean;
var
  l_result: Integer;
  buf: array of Byte;
  nLen : integer;
  i : integer;
begin
  Try
    FTCSDeviceSender.Enter;
    result := False;
    if Not Open then Exit;
    nLen := Length(aData);
    SetLength(buf, nLen);
    for i := 1 to nLen do
    begin
      buf[i-1] := ord(aData[i]);
    end;

    Try
      l_result:= Send(WinSocket,buf[0], nLen, 0);

      if l_result < 0 then
      begin
        if Assigned(FOnSocketError) then
        begin
          OnSocketError(Self,WinSocket,WSAGetLastError);
        end;
        Exit;
      end;
    Except
      Exit;
    End;
    result := True;
  Finally
    FTCSDeviceSender.Leave;
  End;
end;

procedure TdmWinsocket.SetConnectIP(const Value: string);
begin
  FConnectIP := Value;
end;

procedure TdmWinsocket.SetConnectPort(const Value: integer);
begin
  FConnectPort := Value;
end;

procedure TdmWinsocket.SetOpen(const Value: Boolean);
var
  l_result : Integer;
  l_error: Integer;
  l_version : Word;
  l_socket_address_in: tSockAddrIn;
  l_ip_z: array[0..255] of char;
  rset: TFDSet;
  t: TTimeVal;
  rslt: integer;
  stConnectIP : string;
begin
  if FOpen = Value then Exit;
  stConnectIP := ConnectIP;
  FOpen := Value;
  if Value then
  begin
    l_version:= $0101;
    l_result := wsaStartup(l_version, l_wsa_data);
    if l_result <> 0 then
    begin
      Open := False;
      Exit;  //소켓생성 실패 시에 Open False
    end;
    WinSocket:= Socket(PF_INET, SOCK_STREAM, IPPROTO_IP);
    if WinSocket = INVALID_SOCKET then
    begin
      Open := False;
      Exit;  //소켓생성 실패 시에 Open False
    end;
    l_result:= wsaAsyncSelect(WinSocket, Handle,
        wm_asynch_select,
        FD_CONNECT+ FD_READ+ FD_WRITE+ FD_CLOSE);

    FillChar(l_socket_address_in, sizeof(l_socket_address_in), 0);
    with l_socket_address_in do
    begin
      sin_family:= pf_Inet;
      // -- the requested service
      sin_port:= hToNs(ConnectPort);
      // -- the server IP address
      if Not IsIPTypeCheck(ConnectIP) then
      begin
        stConnectIP := GetIpFromDomain(ConnectIP);
      end;
      StrPCopy(l_ip_z, stConnectIP);
      sin_addr.s_Addr:= inet_addr(PAnsichar(AnsiString(l_ip_z)));
    end; // with m_socket_address_in
    l_result:= Connect(WinSocket, l_socket_address_in,
        sizeof(l_socket_address_in));
    if l_result<> 0 then
    begin
      l_error:= WSAGetLastError;
      if l_error <> wsaEWouldBlock then
      begin
        Open := False;
        Exit;  //소켓생성 실패 시에 Open False
      end else
      begin
      end;
    end;
  end else
  begin
    if WinSocket <> INVALID_SOCKET then
    begin
      l_result:= CloseSocket(WinSocket);
      if l_result = 0 then
      begin
        if Assigned(FOnSocketDisConnected) then
        begin
          OnSocketDisConnected(Self,WinSocket);
        end;
        WinSocket:= INVALID_SOCKET;
      end;
    end;
  end;
end;

procedure TdmWinsocket.WndProc(var Message: TMessage);
begin
  Dispatch ( Message );
end;

procedure TdmWinsocket.DataModuleCreate(Sender: TObject);
begin
  FHandle := 0;
  WinSocket := Invalid_Socket;
  FTCSDeviceSender := TCriticalSection.Create;
  l_c_reception_buffer:= c_byte_buffer.create_byte_buffer('reception_buffer', k_buffer_max);
end;

procedure TdmWinsocket.DataModuleDestroy(Sender: TObject);
begin
  Open := False;
  l_c_reception_buffer.Free;
  l_c_reception_buffer:= Nil;

  if HandleAllocated
   then DeAllocateHWND ( FHandle );
  FTCSDeviceSender.Free;
end;

function TdmWinsocket.PutChar(aChar: char): integer;
begin
  result:= Send(WinSocket,aChar, 1, 0);
end;

end.
