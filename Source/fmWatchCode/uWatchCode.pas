unit uWatchCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ExtCtrls, StdCtrls, Grids, BaseGrid, AdvGrid,
  uSubForm, CommandArray;

type
  TfmWatchCode = class(TfmASubForm)
    PageControl1: TPageControl;
    tab_WatchCode: TTabSheet;
    tab_DetailCode: TTabSheet;
    Panel1: TPanel;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Cancel: TSpeedButton;
    btn_Close: TSpeedButton;
    Panel2: TPanel;
    sg_WatchCode: TAdvStringGrid;
    Splitter1: TSplitter;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    lb_CompanyCode: TLabel;
    lb_CompanyName: TLabel;
    ed_WatchCode: TEdit;
    ed_WatchCodeName: TEdit;
    Splitter2: TSplitter;
    Panel4: TPanel;
    Panel5: TPanel;
    sg_Detailcode: TAdvStringGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ed_DetailCode: TEdit;
    ed_DetailCodeName: TEdit;
    Label3: TLabel;
    cmb_WatchCode: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure sg_WatchCodeClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure sg_DetailcodeClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    L_stState : string;
    { Private declarations }
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure FormClear(aActivePage:integer);
    procedure LoadWatchCode;
    procedure LoadWatchCodeComboBox;
    procedure LoadWatchDetailCode;
  private
    function DeleteWatchCode(aWatchCode:string):Boolean;
    function DeleteDetailWatchCode(aWatchCode:string):Boolean;
    function DeleteDetailCode(aWatchCode,aDetailCode:string):Boolean;
  private
    function memoryWatchCodeDelete(aWatchCode:string):Boolean;
    function memoryWatchCodeInsert(aWatchCode,aWatchCodeName:string):Boolean;
    function memoryWatchCodeUpdate(aWatchCode,aWatchCodeName:string):Boolean;
  private
    function DupCheckWachCode(aWatchCode:string):Boolean;
    function DupCheckDetailCode(aDetailCode:string):Boolean;
    function WatchCodeTableToFile:Boolean;
    function DetailWatchCodeTableToFile:Boolean;
    function DetailCodeTableToFileDownLoad(aFileName,aWatchCode:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmWatchCode: TfmWatchCode;

implementation
uses
  uCommon,
  udmDataBase,
  dllFunction;
{$R *.dfm}

{ TfmWatchCode }

procedure TfmWatchCode.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_Insert.Enabled := False;
    btn_update.Enabled := false;
    btn_Save.Enabled := True;
    btn_delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    if IsInsertGrade then  btn_Insert.Enabled := True;
    btn_Update.Enabled := False;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    btn_Insert.Enabled := False;
    btn_Update.Enabled := False;
    btn_Save.Enabled := True;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    btn_Insert.Enabled := True;
    btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmWatchCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    // 감시형태코드관리
    ed_WatchCode.Enabled := True;
    ed_WatchCodeName.Enabled := True;
    // 세부항목코드관리
    cmb_WatchCode.Enabled := True;
    ed_DetailCode.Enabled := True;
    ed_DetailCodeName.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    // 감시형태코드관리
    ed_WatchCode.Enabled := False;
    ed_WatchCodeName.Enabled := False;
    // 세부항목코드관리
    cmb_WatchCode.Enabled := False;
    ed_DetailCode.Enabled := False;
    ed_DetailCodeName.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    // 감시형태코드관리
    ed_WatchCode.Enabled := False;
    ed_WatchCodeName.Enabled := False;
    // 세부항목코드관리
    cmb_WatchCode.Enabled := False;
    ed_DetailCode.Enabled := False;
    ed_DetailCodeName.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    // 감시형태코드관리
    ed_WatchCode.Enabled := False;
    ed_WatchCodeName.Enabled := True;
    // 세부항목코드관리
    cmb_WatchCode.Enabled := False;
    ed_DetailCode.Enabled := False;
    ed_DetailCodeName.Enabled := True;
  end;
end;

procedure TfmWatchCode.LoadWatchCode;
var
  nRow : integer;
begin
  FormEnable('SEARCH');
  ButtonEnable('SEARCH');
  
  GridInitialize(sg_WatchCode);
  nRow := 1;
  with dmDataBase.TB_WATCHCODE do
  begin
    sg_WatchCode.RowCount := RecordCount + 1;
    First;
    While Not Eof do
    begin
      with sg_WatchCode do
      begin
        cells[0,nRow] := FindField('WATCHCODE').AsString;
        cells[1,nRow] := FindField('WATCHNAME').AsString;
      end;
      inc(nRow);
      Next;
    end;
  end;
  sg_WatchCodeClick(sg_WatchCode);
end;

procedure TfmWatchCode.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  LoadWatchCode;
  LoadWatchCodeComboBox;
  LoadWatchDetailCode;
end;

procedure TfmWatchCode.LoadWatchDetailCode;
var
  nRow : integer;
  stWatchCode : string;
begin
  FormEnable('SEARCH');
  ButtonEnable('SEARCH');
  GridInitialize(sg_Detailcode);
  nRow := 1;
  with dmDataBase.TB_DETAILCODE do
  begin
    sg_Detailcode.RowCount := RecordCount + 1;
    First;
    While Not Eof do
    begin
      with sg_Detailcode do
      begin
        stWatchCode := FindField('WATCHCODE').AsString;
        if strtoint(stWatchCode) < ZoneStatusList.count then
        begin
          cells[0,nRow] := ZoneStatusList.Strings[strtoint(stWatchCode)];
          cells[1,nRow] := FindField('DETAILCODE').AsString;
          cells[2,nRow] := FindField('DETAILNAME').AsString;
        end;
      end;
      inc(nRow);
      Next;
    end;
    sg_Detailcode.SortByColumn(0);
  end;
  sg_DetailcodeClick(sg_Detailcode);
end;

procedure TfmWatchCode.LoadWatchCodeComboBox;
begin
  cmb_WatchCode.Items.Clear;
  with dmDataBase.TB_WATCHCODE do
  begin
    First;
    While Not Eof do
    begin
      with sg_WatchCode do
      begin
        cmb_WatchCode.Items.Add(FindField('WATCHCODE').AsString + '.' + FindField('WATCHNAME').AsString);
      end;
      Next;
    end;
  end;
end;

procedure TfmWatchCode.sg_WatchCodeClick(Sender: TObject);
begin
  L_stState := 'CLICK';
  FormEnable(L_stState);
  ButtonEnable(L_stState);
  FormClear(0);
  with sg_WatchCode do
  begin
    ed_WatchCode.Text := cells[0,row];
    ed_WatchCodeName.Text := cells[1,row];  
  end;
end;

procedure TfmWatchCode.FormClear(aActivePage:integer);
begin
  if aActivePage = 0 then
  begin
    // 감시형태코드관리
    ed_WatchCode.Text := '';
    ed_WatchCodeName.Text := '';
  end else
  begin
    // 세부항목코드관리
    cmb_WatchCode.ItemIndex := -1;
    ed_DetailCode.Text := '';
    ed_DetailCodeName.Text := '';
  end;

end;

procedure TfmWatchCode.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmWatchCode.sg_DetailcodeClick(Sender: TObject);
begin
  L_stState := 'CLICK';
  FormEnable(L_stState);
  ButtonEnable(L_stState);
  FormClear(1);
  with sg_Detailcode do
  begin
    //cmb_WatchCode.Text := cells[0,row];
    cmb_WatchCode.ItemIndex := cmb_WatchCode.Items.IndexOf(cells[0,row]);
    ed_DetailCode.Text := cells[1,row];
    ed_DetailCodeName.Text := cells[2,row];
  end;
end;

procedure TfmWatchCode.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage = tab_WatchCode then
  begin
    sg_WatchCodeClick(sg_WatchCode);
  end else
  begin
    LoadWatchCodeComboBox;
    sg_DetailcodeClick(sg_Detailcode);
  end;
end;

procedure TfmWatchCode.btn_InsertClick(Sender: TObject);
begin
  L_stState := 'INSERT';
  FormEnable(L_stState);
  ButtonEnable(L_stState);
  FormClear(PageControl1.ActivePageIndex);

end;

procedure TfmWatchCode.btn_UpdateClick(Sender: TObject);
begin
  L_stState := 'UPDATE';
  FormEnable(L_stState);
  ButtonEnable(L_stState);

end;

procedure TfmWatchCode.btn_CancelClick(Sender: TObject);
begin
  L_stState := 'CANCEL';
  FormEnable(L_stState);
  ButtonEnable(L_stState);

  LoadWatchCode;
  LoadWatchCodeComboBox;
  LoadWatchDetailCode;

end;

procedure TfmWatchCode.btn_DeleteClick(Sender: TObject);
begin
  if PageControl1.ActivePage = tab_WatchCode then
  begin
    DeleteWatchCode(ed_WatchCode.Text);
    DeleteDetailWatchCode(ed_WatchCode.Text);
    memoryWatchCodeDelete(ed_WatchCode.Text);
    WatchCodeTableToFile;
    DetailWatchCodeTableToFile;
    LoadWatchCode;
    LoadWatchCodeComboBox;
    LoadWatchDetailCode;
  end else
  begin
    DeleteDetailCode(copy(cmb_WatchCode.Text,1,1),ed_DetailCode.Text);
    DetailWatchCodeTableToFile;
    LoadWatchDetailCode;
  end;

end;

function TfmWatchCode.DeleteDetailCode(aWatchCode,
  aDetailCode: string): Boolean;
begin
  result := dmDataBase.DeleteTB_DETAILCODE(aWatchCode,aDetailCode);
end;

function TfmWatchCode.DeleteWatchCode(aWatchCode: string): Boolean;
begin
  result := dmDataBase.DeleteTB_WATCHCODE(aWatchCode);
end;

function TfmWatchCode.DeleteDetailWatchCode(aWatchCode: string): Boolean;
begin
  result := dmDataBase.DeleteTB_DETAILCODE_WatchCode(aWatchCode);
end;

function TfmWatchCode.memoryWatchCodeDelete(aWatchCode: string): Boolean;
var
  i : integer;
  stTemp : string;
begin
  result := False;

  for i := 0 to ZoneStatusList.Count - 1 do
  begin
    stTemp := ZoneStatusList.Strings[i];
    if copy(stTemp,1,1) = aWatchCode then
    begin
      ZoneStatusList.Delete(i);
      result := True;
    end;
  end;
end;

function TfmWatchCode.WatchCodeTableToFile: Boolean;
var
  stFileName : string;
  TempList : TStringList;
begin
  stFileName := ExtractFileDir(Application.ExeName) + '\존구분.txt';
  DeleteFile(stFileName);
  Try
    TempList := TStringList.Create;

    with dmDataBase.TB_WATCHCODE do
    begin
      First;
      While Not Eof do
      begin
        TempList.Add(FindField('WATCHCODE').AsString + '.' + FindField('WATCHNAME').AsString);
        Next;
      end;
      TempList.SaveToFile(stFileName);
    end;

  Finally
    TempList.Free;
  End;
end;


function TfmWatchCode.DetailWatchCodeTableToFile: Boolean;
var
  stFileName : string;
begin

  DeleteFile(stFileName);
  Try
    with dmDataBase.TB_WATCHCODE do
    begin
      First;
      While Not Eof do
      begin
        stFileName := ExtractFileDir(Application.ExeName) + '\' + FindField('WATCHCODE').AsString + '.' + FindField('WATCHNAME').AsString + '.txt';
        DetailCodeTableToFileDownLoad(stFileName,FindField('WATCHCODE').AsString);
        Next;
      end;
    end;

  Finally
  End;
end;

function TfmWatchCode.DetailCodeTableToFileDownLoad(aFileName,
  aWatchCode: string): Boolean;
var
  TempList : TStringList;
begin
  Try
    TempList := TStringList.Create;

    with dmDataBase.TB_DETAILCODE do
    begin
      First;
      While Not Eof do
      begin
        if FindField('WATCHCODE').AsString = aWatchCode then
        begin
          TempList.Add(FindField('DETAILCODE').AsString + ',' + FindField('DETAILNAME').AsString) ;
        end;
        Next;
      end;
      TempList.SaveToFile(aFileName);
    end;

  Finally
    TempList.Free;
  End;
end;


procedure TfmWatchCode.btn_SaveClick(Sender: TObject);
begin
  if PageControl1.ActivePage = tab_WatchCode then
  begin
    if L_stState = 'INSERT' then
    begin
      if DupCheckWachCode(ed_WatchCode.Text) then
      begin
        showmessage('이미 정의된 구분코드가 존재합니다.');
        Exit;
      end;
      memoryWatchCodeInsert(ed_WatchCode.Text,ed_WatchCodeName.Text);
      dmDataBase.InsertIntoTB_WATCHCODE(ed_WatchCode.Text,ed_WatchCodeName.Text);
      WatchCodeTableToFile;
    end else if L_stState = 'UPDATE' then
    begin
      memoryWatchCodeUpdate(ed_WatchCode.Text,ed_WatchCodeName.Text);
      dmDataBase.InsertIntoTB_WATCHCODE(ed_WatchCode.Text,ed_WatchCodeName.Text);
      WatchCodeTableToFile;
    end;
    LoadWatchCode;
    LoadWatchCodeComboBox;
  end else
  begin
    if L_stState = 'INSERT' then
    begin
      if DupCheckDetailCode(ed_DetailCode.Text) then
      begin
        showmessage('이미 정의된 STATUS가 존재합니다.');
        Exit;
      end;
      dmDataBase.InsertIntoTB_DETAILCODE(copy(cmb_WatchCode.Text,1,1),ed_DetailCode.Text,ed_DetailCodeName.Text);
      DetailWatchCodeTableToFile;
    end else if L_stState = 'UPDATE' then
    begin
      dmDataBase.InsertIntoTB_DETAILCODE(copy(cmb_WatchCode.Text,1,1),ed_DetailCode.Text,ed_DetailCodeName.Text);
      DetailWatchCodeTableToFile;
    end;
    LoadWatchDetailCode;
  end;

end;

function TfmWatchCode.memoryWatchCodeInsert(aWatchCode,
  aWatchCodeName: string): Boolean;
begin
  ZoneStatusList.Add(aWatchCode + '.' + aWatchCodeName);
end;

function TfmWatchCode.DupCheckWachCode(aWatchCode: string): Boolean;
begin
  result := False;
  with dmDataBase.TB_WATCHCODE do
  begin
    if FindKey([aWatchCode]) then result := True;
  end;
end;

function TfmWatchCode.DupCheckDetailCode(aDetailCode: string): Boolean;
begin
  result := False;
  with dmDataBase.TB_DETAILCODE do
  begin
    First;
    While Not Eof do
    begin
      if FindField('DETAILCODE').AsString = aDetailCode then
      begin
        result := True;
        Exit;
      end;
      Next;
    end;
  end;

end;


function TfmWatchCode.memoryWatchCodeUpdate(aWatchCode,
  aWatchCodeName: string): Boolean;
var
  i : integer;
begin
  result := False;
  for i := 0 to ZoneStatusList.Count - 1 do
  begin
    if copy(ZoneStatusList.Strings[i],1,1) = aWatchCode then
    begin
      ZoneStatusList.Strings[i] := aWatchCode + '.' + aWatchCodeName;
      result := True;
      Exit;
    end;
  end;
end;


end.
