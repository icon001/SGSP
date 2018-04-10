program zReg;

uses
  Forms,
  uMain in 'uMain.pas' {MainForm},
  uLomosUtil in 'uLomosUtil.pas',
  systeminfos in 'systeminfos.pas',
  uFunction in 'uFunction.pas',
  UStateIndicate in 'UStateIndicate.pas' {fmStateIndicate},
  FileInfo in 'FileInfo.pas',
  DoorSchReg in 'DoorSchReg.pas' {DoorscheduleRegForm},
  uCommon in 'uCommon.pas' {DataModule1: TDataModule},
  uProcess in 'uProcess.pas' {fmPrograss},
  uMonitorMain in 'uMonitorMain.pas' {fmMonitorMain},
  LBSDisplayCtrl in 'LBSDisplayCtrl.pas',
  uLogin in 'uLogin.pas' {fmLogin},
  uConfig in 'uConfig.pas' {fmConfig},
  uDeviceRegMessage in 'uDeviceRegMessage.pas' {fmDeviceRegMessage},
  uSelect in 'uSelect.pas' {fmSelect};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDoorscheduleRegForm, DoorscheduleRegForm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfmSelect, fmSelect);
  Application.Run;
end.
