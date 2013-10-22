unit DemoLibrary_Invk;

{----------------------------------------------------------------------------}
{ This unit was automatically generated by the RemObjects SDK after reading  }
{ the RODL file associated with this project .                               }
{                                                                            }
{ Do not modify this unit manually, or your changes will be lost when this   }
{ unit is regenerated the next time you compile the project.                 }
{----------------------------------------------------------------------------}

{$I RemObjects.inc}

interface

uses
  {vcl:} Classes,
  {RemObjects:} uROXMLIntf, uROServer, uROServerIntf, uROClasses, uROTypes, uROClientIntf,
  {Generated:} DemoLibrary_Intf;

type
  TSeekOrigin = Classes.TSeekOrigin; // fake declaration
  TDemoService_Invoker = class(TROInvoker)
  private
  protected
  public
    constructor Create; override;
  published
    procedure Invoke_GetSum(const __Instance:IInterface; const __Message:IROMessage; const __Transport:IROTransport; out __oResponseOptions:TROResponseOptions);
    procedure Invoke_GetServerTime(const __Instance:IInterface; const __Message:IROMessage; const __Transport:IROTransport; out __oResponseOptions:TROResponseOptions);
    procedure Invoke_GetDemoStruct(const __Instance:IInterface; const __Message:IROMessage; const __Transport:IROTransport; out __oResponseOptions:TROResponseOptions);
  end;

implementation

uses
  {RemObjects:} uRORes, uROClient;

{ TDemoService_Invoker }

constructor TDemoService_Invoker.Create;
begin
  inherited Create;
  FAbstract := False;
end;

procedure TDemoService_Invoker.Invoke_GetSum(const __Instance:IInterface; const __Message:IROMessage; const __Transport:IROTransport; out __oResponseOptions:TROResponseOptions);
{ function GetSum(const A: Integer; const B: Integer): Integer; }
var
  A: Integer;
  B: Integer;
  lResult: Integer;
begin
  CheckRoles(__Instance, GetDefaultServiceRoles);
  try
    __Message.Read('A', TypeInfo(Integer), A, []);
    __Message.Read('B', TypeInfo(Integer), B, []);

    lResult := (__Instance as IDemoService).GetSum(A, B);

    __Message.InitializeResponseMessage(__Transport, 'DemoLibrary', 'DemoService', 'GetSumResponse');
    __Message.Write('Result', TypeInfo(Integer), lResult, []);
    __Message.Finalize;
    __Message.UnsetAttributes(__Transport);

  finally
  end;
end;

procedure TDemoService_Invoker.Invoke_GetServerTime(const __Instance:IInterface; const __Message:IROMessage; const __Transport:IROTransport; out __oResponseOptions:TROResponseOptions);
{ function GetServerTime: DateTime; }
var
  lResult: DateTime;
begin
  CheckRoles(__Instance, GetDefaultServiceRoles);
  try
    lResult := (__Instance as IDemoService).GetServerTime;

    __Message.InitializeResponseMessage(__Transport, 'DemoLibrary', 'DemoService', 'GetServerTimeResponse');
    __Message.Write('Result', TypeInfo(DateTime), lResult, [paIsDateTime]);
    __Message.Finalize;
    __Message.UnsetAttributes(__Transport);

  finally
  end;
end;

procedure TDemoService_Invoker.Invoke_GetDemoStruct(const __Instance:IInterface; const __Message:IROMessage; const __Transport:IROTransport; out __oResponseOptions:TROResponseOptions);
{ function GetDemoStruct(const Count: Integer): DemoArray; }
var
  Count: Integer;
  lResult: DemoLibrary_Intf.DemoArray;
  __lObjectDisposer: TROObjectDisposer;
begin
  CheckRoles(__Instance, GetDefaultServiceRoles);
  lResult := nil;
  try
    __Message.Read('Count', TypeInfo(Integer), Count, []);

    lResult := (__Instance as IDemoService).GetDemoStruct(Count);

    __Message.InitializeResponseMessage(__Transport, 'DemoLibrary', 'DemoService', 'GetDemoStructResponse');
    __Message.Write('Result', TypeInfo(DemoLibrary_Intf.DemoArray), lResult, []);
    __Message.Finalize;
    __Message.UnsetAttributes(__Transport);

  finally
    __lObjectDisposer := TROObjectDisposer.Create(__Instance);
    try
      __lObjectDisposer.Add(lResult);
    finally
      __lObjectDisposer.Free();
    end;
  end;
end;

initialization
end.