unit userunit;

{$mode objfpc}{$H+}

interface

uses
  baseunit, db, sqldb, Classes, SysUtils, FileUtil, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, StdCtrls, DBGrids, Buttons, ComCtrls;

type

  { TUserForm }

  TUserForm = class(TBaseForm)
    btAdd: TBitBtn;
    btDelete: TBitBtn;
    btQuery: TBitBtn;
    edUserAuth: TCheckBox;
    Datasource1: TDatasource;
    DBGrid1: TDBGrid;
    edUserID: TLabeledEdit;
    edUserID1: TLabeledEdit;
    edUserName: TLabeledEdit;
    SQLQuery1: TSQLQuery;
    StatusBar1: TStatusBar;
    procedure btAddClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btQueryClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SQLQuery1AfterOpen(DataSet: TDataSet);
    procedure SQLQuery1AfterScroll(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  UserForm: TUserForm;

implementation

{$R *.lfm}


{ TUserForm }

uses datamoduleunit;

procedure TUserForm.btAddClick(Sender: TObject);
var
  sql: String;
  lsUserName, lsUserID, lsUserAuth: String;
begin
  //add
  lsUserID   := edUserID.Text;
  lsUserName := edUserName.Text;
  if edUserAuth.Checked then
    lsUserAuth := '1'
  else
    lsUserAuth := '0';

  sql := Format(
  ' INSERT INTO TB_USER (USER_ID, USER_NAME, USER_AUTH) ' +
  '  VALUES ( ''%s'', ''%s'', ''%s'' )', [lsUserID, lsUserName, lsUserAuth]);

  if DM.PQConnection.Connected = False then
    Exit;
  DM.SQLQuery.SQL.Text:= sql;
  DM.SQLQuery.ExecSQL;
  DM.SQLTransaction.Commit;;

  //DM.SQLScript.Script.Text := sql;
  //DM.SQLScript.Execute;

end;

procedure TUserForm.btDeleteClick(Sender: TObject);
var
  sql: String;
begin
  //delete
  if MessageDlg(edUserID.Text + '을(를) 삭제할까요?', mtConfirmation, mbYesNo, 0) <> mrYes then Exit;

  sql :=
  ' DELETE FROM TB_USER ' +
  '  WHERE USER_ID = ' + QuotedStr(edUserID.Text);

  DM.SQLScript.Script.Text := sql;
  DM.SQLScript.ExecuteScript;

end;

procedure TUserForm.btQueryClick(Sender: TObject);
begin
  SQLQuery1.Active:= False;
  SQLQuery1.Active:= True;
end;

procedure TUserForm.DBGrid1CellClick(Column: TColumn);
var
  lsUserID: String;
begin
  if not SQLQuery1.Active then Exit;
  lsUserID:= SQLQuery1.FindField('USER_ID').Text;

  StatusBar1.SimpleText := lsUserID;
end;

procedure TUserForm.SQLQuery1AfterOpen(DataSet: TDataSet);
begin
  DBGrid1.Columns.Items[0].Width:= 64;
  DBGrid1.Columns.Items[1].Width:= 200;
  DBGrid1.Columns.Items[2].Width:= 120;
  DBGrid1.Columns.Items[3].Width:= 120;
  DBGrid1.Columns.Items[4].Width:= 64;
end;

procedure TUserForm.SQLQuery1AfterScroll(DataSet: TDataSet);
var
  lsUserID: String;
begin
  lsUserID:= SQLQuery1.FindField('USER_ID').Text;

  StatusBar1.SimpleText := lsUserID;
end;

initialization
  RegisterClass(TUserForm);

end.

