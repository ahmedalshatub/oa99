program OA99_Demo;

{$R 'xpstyle.res' 'xpstyle.rc'}

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  AvzScanner in 'AvzScanner.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.