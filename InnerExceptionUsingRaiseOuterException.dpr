program InnerExceptionUsingRaiseOuterException;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Unit1 in 'Unit1.pas',
  Unit2 in 'Unit2.pas',
  Unit3 in 'Unit3.pas';

var
  MObj: IUnit1;

begin
  ReportMemoryLeaksOnShutdown := True;
  try
    MObj := TUnit3.Create;
    MObj.RaiseException;
  except
    on E: Exception do
    begin
      Writeln('Basic:');
      Writeln(E.Message);
      if Assigned(E.InnerException) then
        Writeln(E.InnerException.Message);
      Writeln;
      Writeln('All Details:');
      Writeln(MObj.GetAllExceptionMessages(E));
    end;
  end;

  Write('Press ENTER ... '); Readln;
end.
