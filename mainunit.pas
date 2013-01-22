unit mainunit;

{$mode objfpc}{$H+}

interface

uses
  baseunit, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  Menus, ComCtrls;

type

  { TMainForm }

  TMainForm = class(TBaseForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem2: TMenuItem;
    mmStudentInsert: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    mmUser: TMenuItem;
    StatusBar1: TStatusBar;
    procedure mmStudentInsertClick(Sender: TObject);
    procedure mmUserClick(Sender: TObject);
  private
    { private declarations }
    function GetForm( AFromClassName: String): TForm;
  public
    { public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.mmUserClick(Sender: TObject);
begin
  //사용자관리
  GetForm('TUserForm').Show();
end;

procedure TMainForm.mmStudentInsertClick(Sender: TObject);
begin
  //학생등록
  GetForm('TStudentInsertForm').Show();
end;

function TMainForm.GetForm(AFromClassName: String): TForm;
var
  MyForm: TForm;
  i: Integer;
begin

  for i:=0 to Screen.FormCount -1 do
  begin
    if(Screen.Forms[i].ClassNameIs(AFromClassName))then
    begin
      Result:=Screen.Forms[i];
      Exit;
    end;
  end;

  Application.CreateForm( TComponentClass( GetClass( AFromClassName )), MyForm );
  Result:=MyForm;

end;

end.

