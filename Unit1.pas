unit Unit1;

interface

uses
  System.SysUtils;

type
  IUnit1 = interface
    ['{0A920B4E-BB12-4E2E-8AB3-BF7A6F68B5B3}']
    procedure RaiseException(const AMessage: string = '');
    function GetAllExceptionMessages(const AException: Exception;
      const ALevel: Integer = 0
    ): string;
  end;

  TUnit1 = class(TInterfacedObject, IUnit1)
  private
    function GetAllExceptionMessages(const AException: Exception;
      const ALevel: Integer = 0
    ): string;
  protected
    procedure RaiseException(const AMessage: string = ''); virtual;
  end;

implementation

{ TUnit1 }

procedure TUnit1.RaiseException(const AMessage: string = '');
var
  LMessage: string;
begin
  LMessage := Trim(AMessage);
  if LMessage = '' then
    LMessage := 'Error from Unit1.';
  raise Exception.Create(LMessage);
end;

function TUnit1.GetAllExceptionMessages(const AException: Exception;
  const ALevel: Integer = 0
): string;
const
  CIndent = ' ';
var
  LInnerMessages: string;
begin
  if Assigned(AException.InnerException) then
    LInnerMessages := GetAllExceptionMessages(AException.InnerException, ALevel + 1);
  Result := StringOfChar(CIndent, 2 * ALevel) + AException.Message + #13#10 + LInnerMessages;
end;

end.
