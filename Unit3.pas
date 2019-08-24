unit Unit3;

interface

uses
  Unit2;

type
  TUnit3 = class(TUnit2)
  protected
    procedure RaiseException(const AMessage: string = ''); override;
  end;

implementation

uses
  System.SysUtils;

{ TUnit3 }

procedure TUnit3.RaiseException(const AMessage: string);
var
  LMessage: string;
begin
  LMessage := Trim(AMessage);
  if LMessage = '' then
    LMessage := 'Error from Unit3.';

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

