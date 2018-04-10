unit udmDBBackupAndRecovery;

interface

uses
  SysUtils, Classes,Forms;

type
  TdmDBBackupAndRecovery = class(TDataModule)
  private
    { Private declarations }
    Function InsertIntoTB_DEVICE_Value(aFieldName,aData:string):Boolean;
    Function InsertIntoTB_DOORSETTINGINFO_Value(aFieldName,aData:string):Boolean;
    Function InsertIntoTB_READERSETTING_Value(aFieldName,aData:string):Boolean;
    Function InsertIntoTB_ZONESETTING_Value(aFieldName,aData:string):Boolean;
    Function InsertIntoTB_CARDPERMIT_Value(aFieldName,aData:string):Boolean;

  public
    { Public declarations }
    procedure DeviceTabletoFile(aFilename:string);
    procedure DeviceRcvTabletoFile(aFilename:string);
    procedure CardPermitTabletoFile(aFilename:string);
    Function FileToInsertDeviceTable(afilename:string):integer;
  end;

var
  dmDBBackupAndRecovery: TdmDBBackupAndRecovery;

implementation

uses
     udmDataBase,
     uCommon;

{$R *.dfm}

{ TdmDBBackupAndRecovery }

procedure TdmDBBackupAndRecovery.CardPermitTabletoFile(aFilename: string);
var
  st :string;
  slTempList: Tstringlist;
  i : integer;
  stFieldName : string;
  stFieldData : string;
  stData : string;
begin
  Try
    slTempList := TStringList.Create;
    slTempList.Clear;
    slTempList.Add('Ver,1');
    slTempList.Add('Table,TB_CARDPERMIT');
    with dmDataBase.TB_CARDPERMIT do
    begin
      stData := 'Field';
      for i:= 0 to FieldCount - 1 do
      begin
        stFieldName := Fields.Fields[i].FieldName;
        if stData <> '' then stData := stData + ',';
        stData := stData + stFieldName;
      end;
      slTempList.Add(stData);
      First;
      While Not Eof do
      begin
        stData := 'Data';
        for i:= 0 to FieldCount - 1 do
        begin
          stFieldData := Fields.Fields[i].AsString;
          if stData <> '' then stData := stData + ',';
          stData := stData + stFieldData;
        end;
        slTempList.Add(stData);
        Next;
      end;
    end;
    slTempList.SaveToFile(aFilename);
  Finally
    slTempList.Free;
  End;

end;

procedure TdmDBBackupAndRecovery.DeviceRcvTabletoFile(aFilename: string);
var
  st :string;
  slTempList: Tstringlist;
  i : integer;
  stFieldName : string;
  stFieldData : string;
  stData : string;
begin
  Try
    slTempList := TStringList.Create;
    slTempList.Clear;
    slTempList.Add('Ver,1');
    slTempList.Add('Table,TB_DEVICERCV');
    with dmDataBase.TB_DEVICERCV do
    begin
      stData := 'Field';
      for i:= 0 to FieldCount - 1 do
      begin
        stFieldName := Fields.Fields[i].FieldName;
        if stData <> '' then stData := stData + ',';
        stData := stData + stFieldName;
      end;
      slTempList.Add(stData);
      First;
      While Not Eof do
      begin
        stData := 'Data';
        for i:= 0 to FieldCount - 1 do
        begin
          stFieldData := Fields.Fields[i].AsString;
          if stData <> '' then stData := stData + ',';
          stData := stData + stFieldData;
        end;
        slTempList.Add(stData);
        Next;
      end;
    end;
    slTempList.Add('Table,TB_DOORSettingInfoRCV');
    with dmDataBase.TB_DOORSettingInfoRCV do
    begin
      stData := 'Field';
      for i:= 0 to FieldCount - 1 do
      begin
        stFieldName := Fields.Fields[i].FieldName;
        if stData <> '' then stData := stData + ',';
        stData := stData + stFieldName;
      end;
      slTempList.Add(stData);
      First;
      While Not Eof do
      begin
        stData := 'Data';
        for i:= 0 to FieldCount - 1 do
        begin
          stFieldData := Fields.Fields[i].AsString;
          if stData <> '' then stData := stData + ',';
          stData := stData + stFieldData;
        end;
        slTempList.Add(stData);
        Next;
      end;
    end;
    slTempList.Add('Table,TB_READERSETTINGRCV');
    with dmDataBase.TB_READERSETTINGRCV do
    begin
      stData := 'Field';
      for i:= 0 to FieldCount - 1 do
      begin
        stFieldName := Fields.Fields[i].FieldName;
        if stData <> '' then stData := stData + ',';
        stData := stData + stFieldName;
      end;
      slTempList.Add(stData);
      First;
      While Not Eof do
      begin
        stData := 'Data';
        for i:= 0 to FieldCount - 1 do
        begin
          stFieldData := Fields.Fields[i].AsString;
          if stData <> '' then stData := stData + ',';
          stData := stData + stFieldData;
        end;
        slTempList.Add(stData);
        Next;
      end;
    end;
    slTempList.Add('Table,TB_ZONESETTINGRCV');
    with dmDataBase.TB_ZONESETTINGRCV do
    begin
      stData := 'Field';
      for i:= 0 to FieldCount - 1 do
      begin
        stFieldName := Fields.Fields[i].FieldName;
        if stData <> '' then stData := stData + ',';
        stData := stData + stFieldName;
      end;
      slTempList.Add(stData);
      First;
      While Not Eof do
      begin
        stData := 'Data';
        for i:= 0 to FieldCount - 1 do
        begin
          stFieldData := Fields.Fields[i].AsString;
          if stData <> '' then stData := stData + ',';
          stData := stData + stFieldData;
        end;
        slTempList.Add(stData);
        Next;
      end;
    end;
    slTempList.SaveToFile(aFilename);
  Finally
    slTempList.Free;
  End;

end;

procedure TdmDBBackupAndRecovery.DeviceTabletoFile(aFilename: string);
var
  st :string;
  slTempList: Tstringlist;
  i : integer;
  stFieldName : string;
  stFieldData : string;
  stData : string;
begin
  Try
    slTempList := TStringList.Create;
    slTempList.Clear;
    slTempList.Add('Ver,1');
    slTempList.Add('Table,TB_DEVICE');
    with dmDataBase.TB_DEVICE do
    begin
      stData := 'Field';
      for i:= 0 to FieldCount - 1 do
      begin
        stFieldName := Fields.Fields[i].FieldName;
        if stData <> '' then stData := stData + ',';
        stData := stData + stFieldName;
      end;
      slTempList.Add(stData);
      First;
      While Not Eof do
      begin
        stData := 'Data';
        for i:= 0 to FieldCount - 1 do
        begin
          stFieldData := Fields.Fields[i].AsString;
          if stData <> '' then stData := stData + ',';
          stData := stData + stFieldData;
        end;
        slTempList.Add(stData);
        Next;
      end;
    end;
    slTempList.Add('Table,TB_DOORSettingInfo');
    with dmDataBase.TB_DOORSettingInfo do
    begin
      stData := 'Field';
      for i:= 0 to FieldCount - 1 do
      begin
        stFieldName := Fields.Fields[i].FieldName;
        if stData <> '' then stData := stData + ',';
        stData := stData + stFieldName;
      end;
      slTempList.Add(stData);
      First;
      While Not Eof do
      begin
        stData := 'Data';
        for i:= 0 to FieldCount - 1 do
        begin
          stFieldData := Fields.Fields[i].AsString;
          if stData <> '' then stData := stData + ',';
          stData := stData + stFieldData;
        end;
        slTempList.Add(stData);
        Next;
      end;
    end;
    slTempList.Add('Table,TB_READERSETTING');
    with dmDataBase.TB_READERSETTING do
    begin
      stData := 'Field';
      for i:= 0 to FieldCount - 1 do
      begin
        stFieldName := Fields.Fields[i].FieldName;
        if stData <> '' then stData := stData + ',';
        stData := stData + stFieldName;
      end;
      slTempList.Add(stData);
      First;
      While Not Eof do
      begin
        stData := 'Data';
        for i:= 0 to FieldCount - 1 do
        begin
          stFieldData := Fields.Fields[i].AsString;
          if stData <> '' then stData := stData + ',';
          stData := stData + stFieldData;
        end;
        slTempList.Add(stData);
        Next;
      end;
    end;
    slTempList.Add('Table,TB_ZONESETTING');
    with dmDataBase.TB_ZONESETTING do
    begin
      stData := 'Field';
      for i:= 0 to FieldCount - 1 do
      begin
        stFieldName := Fields.Fields[i].FieldName;
        if stData <> '' then stData := stData + ',';
        stData := stData + stFieldName;
      end;
      slTempList.Add(stData);
      First;
      While Not Eof do
      begin
        stData := 'Data';
        for i:= 0 to FieldCount - 1 do
        begin
          stFieldData := Fields.Fields[i].AsString;
          if stData <> '' then stData := stData + ',';
          stData := stData + stFieldData;
        end;
        slTempList.Add(stData);
        Next;
      end;
    end;
    slTempList.Add('Table,TB_CARDPERMIT');
    with dmDataBase.TB_CARDPERMIT do
    begin
      stData := 'Field';
      for i:= 0 to FieldCount - 1 do
      begin
        stFieldName := Fields.Fields[i].FieldName;
        if stData <> '' then stData := stData + ',';
        stData := stData + stFieldName;
      end;
      slTempList.Add(stData);
      First;
      While Not Eof do
      begin
        stData := 'Data';
        for i:= 0 to FieldCount - 1 do
        begin
          stFieldData := Fields.Fields[i].AsString;
          if stData <> '' then stData := stData + ',';
          stData := stData + stFieldData;
        end;
        slTempList.Add(stData);
        Next;
      end;
    end;
    slTempList.SaveToFile(aFilename);
  Finally
    slTempList.Free;
  End;

end;

Function TdmDBBackupAndRecovery.FileToInsertDeviceTable(
  afilename: string):integer;
var
  slFileList : TStringList;
  slTempList : TStringList;
  i : integer;
  stTableName : string;
  stFieldName : string;
begin
  result := -1;
  Try
    slFileList := TStringList.Create;
    slTempList := TStringList.Create;

    slFileList.LoadFromFile(aFileName);
    slTempList.Delimiter := ',';
    slTempList.DelimitedText := slFileList.Strings[0];
    if UpperCase(slTempList.Strings[0]) <> 'VER' then Exit;
    slFileList.Delete(0);

    for i := 0 to slFileList.Count - 1 do
    begin
      if G_bApplicationTerminate then Exit;
      slTempList.Delimiter := ',';
      slTempList.DelimitedText := slFileList.Strings[i];
      if UpperCase(slTempList.Strings[0]) = 'TABLE' then
      begin
        stTableName := slTempList.Strings[1];
      end else if UpperCase(slTempList.Strings[0]) = 'FIELD' then
      begin
        stFieldName := slFileList.Strings[i];
      end else if UpperCase(slTempList.Strings[0]) = 'DATA' then
      begin
        if UpperCase(stTableName) = 'TB_DEVICE' then
        begin
          InsertIntoTB_DEVICE_Value(stFieldName,slFileList.Strings[i]);
        end else if UpperCase(stTableName) = 'TB_DOORSETTINGINFO' then
        begin
          InsertIntoTB_DOORSETTINGINFO_Value(stFieldName,slFileList.Strings[i]);
        end else if UpperCase(stTableName) = 'TB_READERSETTING' then
        begin
          InsertIntoTB_READERSETTING_Value(stFieldName,slFileList.Strings[i]);
        end else if UpperCase(stTableName) = 'TB_ZONESETTING' then
        begin
          InsertIntoTB_ZONESETTING_Value(stFieldName,slFileList.Strings[i]);
        end else if UpperCase(stTableName) = 'TB_CARDPERMIT' then
        begin
          InsertIntoTB_CARDPERMIT_Value(stFieldName,slFileList.Strings[i]);
        end;
      end;
      Application.ProcessMessages;
    end;
  Finally
    slFileList.Free;
    slTempList.Free;
  End;
  result := 1;
end;

function TdmDBBackupAndRecovery.InsertIntoTB_CARDPERMIT_Value(aFieldName,
  aData: string): Boolean;
var
  slFieldNameList : TStringList;
  slDataList : TStringList;
  i : integer;
  nKeyIndex1 : integer;
  nKeyIndex2 : integer;
  nKeyIndex3 : integer;
  stKey1 : string;
  stKey2 : string;
  stKey3 : string;
  stData : string;
begin
  result := False;
  Try
    aFieldName := stringReplace(aFieldName,' ',SOH,[rfReplaceAll]);
    aData := stringReplace(aData,' ',SOH,[rfReplaceAll]);
    
    slFieldNameList := TStringList.Create;
    slDataList := TStringList.Create;

    slFieldNameList.Delimiter := ',';
    slFieldNameList.DelimitedText := aFieldName;

    slDataList.Delimiter := ',';
    slDataList.DelimitedText := aData;

    if slFieldNameList.Count > slDataList.Count then Exit;
    nKeyIndex1 := slFieldNameList.IndexOf('ECUID');
    nKeyIndex2 := slFieldNameList.IndexOf('CARDNO');
    if (nKeyIndex1 < 0) or
       (nKeyIndex2 < 0) then
    begin
      Exit;
    end;

    stKey1 := slDataList.Strings[nKeyIndex1];
    stKey2 := slDataList.Strings[nKeyIndex2];
    stKey1 := stringReplace(stKey1,SOH,' ',[rfReplaceAll]);
    stKey2 := stringReplace(stKey2,SOH,' ',[rfReplaceAll]);
    dmDataBase.InsertIntoTB_CARDPERMIT(stKey1,stKey2,'','','','','','','','','','','','','','','','','','', '', '','','');
    for i := 1 to slFieldNameList.Count - 1 do
    begin
      if G_bApplicationTerminate then Exit;
      if (i <> nKeyIndex1) and
         (i <> nKeyIndex2) then
      begin
        stData := slDataList.Strings[i];
        stData := stringReplace(stData,SOH,' ',[rfReplaceAll]);
        dmDataBase.UpdateTB_CARDPERMIT_FieldName(stKey1,stKey2,slFieldNameList.Strings[i],stData);
      end;
    end; 
    result := True;
  Finally
    slFieldNameList.Free;
    slDataList.Free;
  End;
end;

function TdmDBBackupAndRecovery.InsertIntoTB_DEVICE_Value(aFieldName,
  aData: string): Boolean;
var
  slFieldNameList : TStringList;
  slDataList : TStringList;
  i : integer;
  nKeyIndex : integer;
  stKey : string;
  stData : string;
begin
  result := False;
  Try
    aFieldName := stringReplace(aFieldName,' ',SOH,[rfReplaceAll]);
    aData := stringReplace(aData,' ',SOH,[rfReplaceAll]);
    
    slFieldNameList := TStringList.Create;
    slDataList := TStringList.Create;

    slFieldNameList.Delimiter := ',';
    slFieldNameList.DelimitedText := aFieldName;

    slDataList.Delimiter := ',';
    slDataList.DelimitedText := aData;

    if slFieldNameList.Count > slDataList.Count then Exit;

    nKeyIndex := slFieldNameList.IndexOf('ECU_ID');
    if nKeyIndex < 0 then
    begin
      Exit;
    end;

    stKey := slDataList.Strings[nKeyIndex];
    stKey := stringReplace(stKey,SOH,' ',[rfReplaceAll]);
    for i := 1 to slFieldNameList.Count - 1 do
    begin
      if G_bApplicationTerminate then Exit;
      if i <> nKeyIndex then
      begin
        stData := slDataList.Strings[i];
        stData := stringReplace(stData,SOH,' ',[rfReplaceAll]);
        dmDataBase.UpdateTB_DEVICE_FieldName(stKey,slFieldNameList.Strings[i],stData);
        dmDataBase.UpdateTB_DEVICERCV_FieldName(stKey,slFieldNameList.Strings[i],'U');
      end;
    end; 
    result := True;
  Finally
    slFieldNameList.Free;
    slDataList.Free;
  End;
end;

function TdmDBBackupAndRecovery.InsertIntoTB_DOORSETTINGINFO_Value(
  aFieldName, aData: string): Boolean;
var
  slFieldNameList : TStringList;
  slDataList : TStringList;
  i : integer;
  nKeyIndex1 : integer;
  nKeyIndex2 : integer;
  nKeyIndex3 : integer;
  stKey1 : string;
  stKey2 : string;
  stKey3 : string;
  stData : string;
begin
  result := False;
  Try
    aFieldName := stringReplace(aFieldName,' ',SOH,[rfReplaceAll]);
    aData := stringReplace(aData,' ',SOH,[rfReplaceAll]);
    
    slFieldNameList := TStringList.Create;
    slDataList := TStringList.Create;

    slFieldNameList.Delimiter := ',';
    slFieldNameList.DelimitedText := aFieldName;

    slDataList.Delimiter := ',';
    slDataList.DelimitedText := aData;

    if slFieldNameList.Count > slDataList.Count then Exit;

    nKeyIndex1 := slFieldNameList.IndexOf('ECU_ID');
    nKeyIndex2 := slFieldNameList.IndexOf('ECU_EXTEND');
    nKeyIndex3 := slFieldNameList.IndexOf('DOORNO');
    if (nKeyIndex1 < 0) or
       (nKeyIndex2 < 0) or
       (nKeyIndex3 < 0) then
    begin
      Exit;
    end;

    stKey1 := slDataList.Strings[nKeyIndex1];
    stKey2 := slDataList.Strings[nKeyIndex2];
    stKey3 := slDataList.Strings[nKeyIndex3];
    stKey1 := stringReplace(stKey1,SOH,' ',[rfReplaceAll]);
    stKey2 := stringReplace(stKey2,SOH,' ',[rfReplaceAll]);
    stKey3 := stringReplace(stKey3,SOH,' ',[rfReplaceAll]);

    for i := 1 to slFieldNameList.Count - 1 do
    begin
      if G_bApplicationTerminate then Exit;
      if (i <> nKeyIndex1) and
         (i <> nKeyIndex2) and
         (i <> nKeyIndex3) then
      begin
        stData := slDataList.Strings[i];
        stData := stringReplace(stData,SOH,' ',[rfReplaceAll]);
        dmDataBase.UpdateTB_DOORSETTING_FieldName(stKey1,stKey3,slFieldNameList.Strings[i],stData);
        dmDataBase.UpdateTB_DOORSETTINGRCV_FieldName(stKey1,stKey3,slFieldNameList.Strings[i],'U');
      end;
    end; 
    result := True;
  Finally
    slFieldNameList.Free;
    slDataList.Free;
  End;
end;

function TdmDBBackupAndRecovery.InsertIntoTB_READERSETTING_Value(
  aFieldName, aData: string): Boolean;
var
  slFieldNameList : TStringList;
  slDataList : TStringList;
  i : integer;
  nKeyIndex1 : integer;
  nKeyIndex2 : integer;
  nKeyIndex3 : integer;
  stKey1 : string;
  stKey2 : string;
  stKey3 : string;
  stData : string;
begin
  result := False;
  Try
    aFieldName := stringReplace(aFieldName,' ',SOH,[rfReplaceAll]);
    aData := stringReplace(aData,' ',SOH,[rfReplaceAll]);
    
    slFieldNameList := TStringList.Create;
    slDataList := TStringList.Create;

    slFieldNameList.Delimiter := ',';
    slFieldNameList.DelimitedText := aFieldName;

    slDataList.Delimiter := ',';
    slDataList.DelimitedText := aData;

    if slFieldNameList.Count > slDataList.Count then Exit;

    nKeyIndex1 := slFieldNameList.IndexOf('ECU_ID');
    nKeyIndex2 := slFieldNameList.IndexOf('ECU_EXTEND');
    nKeyIndex3 := slFieldNameList.IndexOf('READERNO');
    if (nKeyIndex1 < 0) or
       (nKeyIndex2 < 0) or
       (nKeyIndex3 < 0) then
    begin
      Exit;
    end;

    stKey1 := slDataList.Strings[nKeyIndex1];
    stKey2 := slDataList.Strings[nKeyIndex2];
    stKey3 := slDataList.Strings[nKeyIndex3];
    stKey1 := stringReplace(stKey1,SOH,' ',[rfReplaceAll]);
    stKey2 := stringReplace(stKey2,SOH,' ',[rfReplaceAll]);
    stKey3 := stringReplace(stKey3,SOH,' ',[rfReplaceAll]);

    for i := 1 to slFieldNameList.Count - 1 do
    begin
      if G_bApplicationTerminate then Exit;
      if (i <> nKeyIndex1) and
         (i <> nKeyIndex2) and
         (i <> nKeyIndex3) then
      begin
        stData := slDataList.Strings[i];
        stData := stringReplace(stData,SOH,' ',[rfReplaceAll]);
        dmDataBase.UpdateTB_READERSETTING_FieldName(stKey1,stKey2,stKey3,slFieldNameList.Strings[i],stData);
        dmDataBase.UpdateTB_READERSETTINGRCV_FieldName(stKey1,stKey2,stKey3,slFieldNameList.Strings[i],'U');
      end;
    end; 
    result := True;
  Finally
    slFieldNameList.Free;
    slDataList.Free;
  End;
end;

function TdmDBBackupAndRecovery.InsertIntoTB_ZONESETTING_Value(aFieldName,
  aData: string): Boolean;
var
  slFieldNameList : TStringList;
  slDataList : TStringList;
  i : integer;
  nKeyIndex1 : integer;
  nKeyIndex2 : integer;
  nKeyIndex3 : integer;
  stKey1 : string;
  stKey2 : string;
  stKey3 : string;
  stData : string;
begin
  result := False;
  Try
    aFieldName := stringReplace(aFieldName,' ',SOH,[rfReplaceAll]);
    aData := stringReplace(aData,' ',SOH,[rfReplaceAll]);
    
    slFieldNameList := TStringList.Create;
    slDataList := TStringList.Create;

    slFieldNameList.Delimiter := ',';
    slFieldNameList.DelimitedText := aFieldName;

    slDataList.Delimiter := ',';
    slDataList.DelimitedText := aData;

    if slFieldNameList.Count > slDataList.Count then Exit;

    nKeyIndex1 := slFieldNameList.IndexOf('ECU_ID');
    nKeyIndex2 := slFieldNameList.IndexOf('ECU_EXTEND');
    nKeyIndex3 := slFieldNameList.IndexOf('ZONENO');
    if (nKeyIndex1 < 0) or
       (nKeyIndex2 < 0) or
       (nKeyIndex3 < 0) then
    begin
      Exit;
    end;

    stKey1 := slDataList.Strings[nKeyIndex1];
    stKey2 := slDataList.Strings[nKeyIndex2];
    stKey3 := slDataList.Strings[nKeyIndex3];
    stKey1 := stringReplace(stKey1,SOH,' ',[rfReplaceAll]);
    stKey2 := stringReplace(stKey2,SOH,' ',[rfReplaceAll]);
    stKey3 := stringReplace(stKey3,SOH,' ',[rfReplaceAll]);

    for i := 1 to slFieldNameList.Count - 1 do
    begin
      if G_bApplicationTerminate then Exit;
      if (i <> nKeyIndex1) and
         (i <> nKeyIndex2) and
         (i <> nKeyIndex3) then
      begin
        stData := slDataList.Strings[i];
        stData := stringReplace(stData,SOH,' ',[rfReplaceAll]);
        dmDataBase.UpdateTB_ZONESETTING_FieldName(stKey1,stKey2,stKey3,slFieldNameList.Strings[i],stData);
        dmDataBase.UpdateTB_ZONESETTINGRCV_FieldName(stKey1,stKey2,stKey3,slFieldNameList.Strings[i],'U');
      end;
    end; 
    result := True;
  Finally
    slFieldNameList.Free;
    slDataList.Free;
  End;
end;

end.
