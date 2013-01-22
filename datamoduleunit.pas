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
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.lfm}

end.

