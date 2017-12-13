program ParserTest;

{$APPTYPE CONSOLE}

{$ifdef FPC}
{$mode DELPHI}
{$endif}

uses
  SysUtils,
  crt32,
  ExpressionParser in '..\src\ExpressionParser.pas';

var
   Calculadora:ShortString;
   Parser: TParser;

begin
     if paramcount>0
        then begin
                  if (ParamStr(1)='/?') or (ParamStr(1)='-?')
                     then begin
                               clrscr;
                               Writeln(Parser.Help(0));
                          end
                     else Writeln('Resultado: ',Parser.ParseF(ParamStr(1),3,2));
                  repeat until keypressed;
                  Halt(0);
             end;

     try
        repeat
              clrscr;
              Write('Expressao: ');
              readln(Calculadora);

              Parser.Clear;

              GotoXY(1,5);
              Writeln('Resultado: ',Parser.ParseF(Calculadora,3,2));

              GotoXY(1,7);
              Writeln(Parser.HistoryShow);

              GotoXY(1,25);
              Write('Continuar [s/N]? ');
        until UpCase(ReadKey) IN [#27,'N'];
     except
        on E: Exception do
           Writeln(E.ClassName, ': ', E.Message);
     end;
end.
