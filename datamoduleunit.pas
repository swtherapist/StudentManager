unit datamoduleunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, pqconnection, sqldb, FileUtil;

type

  { TDM }

  TDM = class(TDataModule)
    PQConnection: TPQConnection;
    SQLQuery: TSQLQuery;
    SQLScript: TSQLScript;
    SQLTransaction: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.lfm}

{ TDM }

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  PQConnection.HostName     := 'localhost';
  PQConnection.DatabaseName := 'Student_DB';
  PQConnection.UserName     := 'student_manager';
  PQConnection.Password     := 'abcd1234';
  PQConnection.Connected    := True;
  //SQLTransaction.Active     := True;
end;

end.

