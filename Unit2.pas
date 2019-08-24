unit Unit2;

interface

uses
  Unit1;

type
  TUnit2 = class(TUnit1)
  protected
    procedure RaiseException(const AMessage: string = ''); override;
  end;

implementation

uses
  System.SysUtils;

{ TUnit2 }

procedure TUnit2.RaiseException(const AMessage: string);
var
  LMessage: string;
begin
  LMessage := Trim(AMessage);
  if LMessage = '' then
    LMessage := 'Error from Unit2.';

  try
    inherited RaiseException(AMessage);
  except
    on E: Exception do
    begin
      E{xception}.RaiseOuterException(Exception.Create(LMessage));
    end;
  end;
end;

end.

