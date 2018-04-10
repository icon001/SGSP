object dmSocket: TdmSocket
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 144
  Top = 102
  Height = 150
  Width = 215
  object Commport: TApdWinsockPort
    WsLocalAddresses.Strings = (
      '192.168.0.106'
      '192.168.101.3'
      '192.168.10.3')
    WsLocalAddressIndex = 0
    WsPort = 'telnet'
    WsSocksServerInfo.Port = 0
    WsTelnet = False
    AutoOpen = False
    Baud = 38400
    BufferFull = 3072
    BufferResume = 1024
    DeviceLayer = dlWinsock
    TraceAllHex = True
    TraceName = 'APRO.TRC'
    LogAllHex = True
    LogName = 'APRO.LOG'
    PromptForPort = False
    RTS = False
    TapiMode = tmOff
    UseMSRShadow = False
    OnWsAccept = CommportWsAccept
    OnWsConnect = CommportWsConnect
    OnWsDisconnect = CommportWsDisconnect
    OnWsError = CommportWsError
    OnTriggerAvail = CommportTriggerAvail
    OnTriggerOutSent = CommportTriggerOutSent
    Left = 47
    Top = 12
  end
  object SendTimer: TTimer
    Interval = 100
    OnTimer = SendTimerTimer
    Left = 84
    Top = 12
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocketConnect
    OnDisconnect = ClientSocketDisconnect
    OnRead = ClientSocketRead
    OnError = ClientSocketError
    Left = 152
    Top = 16
  end
  object IdTCPClient: TIdTCPClient
    MaxLineAction = maException
    ReadTimeout = 1000
    OnDisconnected = IdTCPClientDisconnected
    OnConnected = IdTCPClientConnected
    Port = 0
    Left = 48
    Top = 64
  end
end
