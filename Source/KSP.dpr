program KSP;

uses
  ShareMem,
  Forms,
  uMain in 'fmMain\uMain.pas' {fmMain},
  uSubForm in '..\Lib\uSubForm.pas' {fmASubForm},
  uSocket in '..\Lib\uSocket.pas' {dmSocket: TDataModule},
  uCommon in '..\Lib\uCommon.pas' {dmCommon: TDataModule},
  dllFunction in '..\Lib\dllFunction.pas',
  uCheckValiable in '..\Lib\uCheckValiable.pas',
  uUtil in '..\Lib\uUtil.pas',
  uProgConfig in 'fmProgConfig\uProgConfig.pas' {fmProgConfig},
  uNetConfig in 'fmNetConfig\uNetConfig.pas' {fmNetConfig},
  uLogin in 'fmLogin\uLogin.pas' {fmLogin},
  uPWConfig in 'fmPWConfig\uPWConfig.pas' {fmPWConfig},
  uConnectStatusMsg in 'fmConnectStatusMsg\uConnectStatusMsg.pas' {fmConnectStatusMsg},
  udmDataBase in '..\Lib\udmDataBase.pas' {dmDataBase: TDataModule},
  uCurrentDeviceSetting in 'fmCurrentDeviceSetting\uCurrentDeviceSetting.pas' {fmCurrentDeviceSetting},
  uSregConfig in 'fmSregConfig\uSregConfig.pas' {fmsRegTConfig},
  uCardReg in 'fmCardReg\uCardReg.pas' {fmCardReg},
  uHoliday in 'fmHoliday\uHoliday.pas' {Form_Holiday},
  uWatchCode in 'fmWatchCode\uWatchCode.pas' {fmWatchCode},
  uAlarmEvent in 'fmAlarmEvent\uAlarmEvent.pas' {fmAlarmEvent},
  uCardEvent in 'fmCardEvent\uCardEvent.pas' {fmCardEvent},
  uSchedule in 'fmSchedule\uSchedule.pas' {fmSchedule},
  uFTPFirmware in 'fmFTPFirmware\uFTPFirmware.pas' {fmFTPFirmware},
  FileInfo in '..\Lib\FileInfo.pas',
  uFirmware in 'fmFirmware\uFirmware.pas' {fmFirmware},
  uLinkusStateCheck in 'fmLinkusstatecheck\uLinkusStateCheck.pas' {fmLinkusStateCheck},
  uCdmaStateCheck in 'fmCdmaStateCheck\uCdmaStateCheck.pas' {fmCdmaStateCheck},
  uDVRStateCheck in 'fmDVRStateCheck\uDVRStateCheck.pas' {fmDVRStateCheck},
  uZoneExtentionVersion in 'fmZoneExtentionVersion\uZoneExtentionVersion.pas' {fmZoneExtentionVersion},
  uDeviceVersion in 'fmDeviceVersion\uDeviceVersion.pas' {fmDeviceVersion},
  u812Firmware in 'fm812Firmware\u812Firmware.pas' {fm812Firmware},
  systeminfos in '..\Lib\systeminfos.pas',
  uCopy in 'fmCopy\uCopy.pas' {fmCopy},
  uCurrentState in '실시간송수신현황조회\uCurrentState.pas' {fmCurrentState},
  uAccessEvent in 'fmAccessEvent\uAccessEvent.pas' {fmAccessEvent},
  udmDBBackupAndRecovery in '..\Lib\udmDBBackupAndRecovery.pas' {dmDBBackupAndRecovery: TDataModule},
  uJavaraSchedule in 'fmJavaraSchedule\uJavaraSchedule.pas' {fmJavaraSchedule},
  uNetworkCheck in 'fmNetworkCheck\uNetworkCheck.pas' {fmNetworkCheck},
  uCardReaderVersion in 'fmCardReaderVersion\uCardReaderVersion.pas' {fmCardReaderVersion},
  uTCPIPDetail in 'fmTCPIPDetail\uTCPIPDetail.pas' {fmTCPIPDetail},
  u_c_log in '..\Lib\Winsockclasses\u_c_log.pas',
  u_c_basic_object in '..\Lib\Winsockclasses\u_c_basic_object.pas',
  u_c_byte_buffer in '..\Lib\Winsockclasses\u_c_byte_buffer.pas',
  u_c_display in '..\Lib\Winsockclasses\u_c_display.pas',
  u_winsock in '..\Lib\Winsocket\u_winsock.pas',
  u_types_constants in '..\Lib\Winsockunits\u_types_constants.pas',
  u_characters in '..\Lib\Winsockunits\u_characters.pas',
  u_dir in '..\Lib\Winsockunits\u_dir.pas',
  u_display_hex_2 in '..\Lib\Winsockunits\u_display_hex_2.pas',
  u_file in '..\Lib\Winsockunits\u_file.pas',
  u_strings in '..\Lib\Winsockunits\u_strings.pas',
  uWinSocket in '..\Lib\uWinSocket.pas' {dmWinsocket: TDataModule},
  uDescript in '..\Lib\uDescript.pas',
  uMessage in 'fmMessage\uMessage.pas' {fmMessage},
  uICUGCU300FirmwareDownload in 'fmICUGCU300FirmwareDownload\uICUGCU300FirmwareDownload.pas' {fmICUGCU300FirmwareDownload},
  uICU300FirmwareData in '..\Lib\GCUICU300Firmware\uICU300FirmwareData.pas' {dmICU300FirmwareData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'KTTelecop Support Tool';
  Application.CreateForm(TdmDataBase, dmDataBase);
  Application.CreateForm(TdmSocket, dmSocket);
  Application.CreateForm(TdmCommon, dmCommon);
  Application.CreateForm(TdmICU300FirmwareData, dmICU300FirmwareData);
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
