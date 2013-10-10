unit DemoService_Impl;

{----------------------------------------------------------------------------}
{ This unit was automatically generated by the RemObjects SDK after reading  }
{ the RODL file associated with this project .                               }
{                                                                            }
{ This is where you are supposed to code the implementation of your objects. }
{----------------------------------------------------------------------------}

{$I RemObjects.inc}

interface

uses
  {vcl:} Classes, SysUtils, 
  {RemObjects:} uROXMLIntf, uROClientIntf, uROTypes, uROServer, uROServerIntf, uROSessions,
  {Required:} uRORemoteDataModule,
  {Generated:} DemoLibrary_Intf;

type
  { TDemoService }
  TDemoService = class(TRORemoteDataModule, IDemoService)
  private
  protected
    { IDemoService methods }
    function GetSum(const A: Integer; const B: Integer): Integer;
    function GetServerTime: DateTime;
    function GetDemoStruct(const Count: Integer): DemoArray;
  end;

implementation

{$IFDEF DELPHIXE2UP}
{%CLASSGROUP 'System.Classes.TPersistent'}
{$ENDIF}

{$IFNDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}
uses
  {Generated:} DemoLibrary_Invk;

procedure Create_DemoService(out anInstance : IUnknown);
begin
  anInstance := TDemoService.Create(nil);
end;

{ DemoService }
function TDemoService.GetSum(const A: Integer; const B: Integer): Integer;
begin
  Result := A + B;
end;

function TDemoService.GetDemoStruct(const Count: Integer): DemoArray;
var
  i: Integer;
begin
  Result := DemoArray.Create;

  for i := 1 to Count do
  begin
    With Result.Add do
    begin
      Field1 := 'String-'+IntToStr(i);
      Field2 := i;
      Field3 := i + 0.5;
    end;
  end;
end;

function TDemoService.GetServerTime: DateTime;
begin
  Result := now;
end;

var
  fClassFactory: IROClassFactory;
initialization
  fClassFactory := TROClassFactory.Create('DemoService', {$IFDEF FPC}@{$ENDIF}Create_DemoService, TDemoService_Invoker);
  // RegisterForZeroConf(fClassFactory,'_DemoService_rosdk._tcp.');

finalization
  UnRegisterClassFactory(fClassFactory);
  fClassFactory := nil;

end.
