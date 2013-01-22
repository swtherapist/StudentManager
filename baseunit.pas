unit baseunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs;

type

  { TBaseForm }

  TBaseForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
  private
    { private declarations }
  public
    { public declarations }
  end;

const
  ESC_KEY = #27;
var
  BaseForm: TBaseForm;

implementation

{$R *.lfm}

{ TBaseForm }

procedure TBaseForm.FormCreate(Sender: TObject);
begin
  KeyPreview := True;
end;

procedure TBaseForm.FormKeyPress(Sender: TObject; var Key: char);
begin
  if Key = ESC_KEY then
  begin
    Key := #0;
    if MessageDlg(Caption, '종료할까요?', mtInformation, mbYesNo, 0) = mrYes then
      Close;
  end;
end;

initialization
  RegisterClass(TBaseForm);

end.

