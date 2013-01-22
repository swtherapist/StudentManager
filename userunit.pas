unit userunit;

{$mode objfpc}{$H+}

interface

uses
  baseunit, db, Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls, DBGrids;

type

  { TUserForm }

  TUserForm = class(TBaseForm)
    CheckBox1: TCheckBox;
    Datasource1: TDatasource;
    DBGrid1: TDBGrid;
    edUserID: TLabeledEdit;
    edUserID1: TLabeledEdit;
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


initialization
  RegisterClass(TUserForm);

end.

