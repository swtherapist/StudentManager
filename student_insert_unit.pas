unit student_insert_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, baseunit;

type
  TStudentInsertForm = class(TBaseForm)
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  StudentInsertForm: TStudentInsertForm;

implementation

{$R *.lfm}

initialization
  RegisterClass(TStudentInsertForm);

end.

