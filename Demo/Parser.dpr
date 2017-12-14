program ParserTest;

{$APPTYPE CONSOLE}
{$ifdef FPC}
{$mode DELPHI}
{$endif}

uses
    SysUtils
  , Crt32
  , ExpressionParser in '..\src\ExpressionParser.pas'
  ;

var
  Calculadora: ShortString;

begin
  if ParamCount > 0
    then begin
      if (ParamStr(1) = '/?') or (ParamStr(1) = '-?')
        then begin
          ClrScr;
          WriteLn(Help(0));
        end
        else Writeln('Resultado: ', ParseF(ParamStr(1), 3, 2));
      repeat until KeyPressed;
      Halt(0);
    end;

  try
    repeat
      ClrScr;
      Write('Expressao: ');
      ReadLn(Calculadora);

      HistoryClear;

      GotoXY(1, 5);
      Writeln('Resultado: ', ParseF(Calculadora, 3, 2));

      GotoXY(1, 7);
      Writeln(HistoryShow);

      GotoXY(1, 25);
      Write('Continuar [s/N]? ');
    until UpCase(ReadKey) in [#27, 'N'];
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  HistoryClose;
end.
