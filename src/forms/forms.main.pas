unit Forms.Main;

{$mode objfpc}{$H+}

interface

uses
{$IFDEF Windows}
  Windows,
{$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnLoad: TButton;
    memMain: TMemo;
    panMemo: TPanel;
    procedure btnLoadClick(Sender: TObject);
  private

  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.btnLoadClick(Sender: TObject);
var
  resShellScript: TResourceStream;
  ssShellScript: TStringStream;
  sShellScript: String;
begin
  resShellScript:= TResourceStream.Create(HINSTANCE, 'SHELLSCRIPT', RT_RCDATA);
  try
    ssShellScript:= TStringStream.Create;
    try
      ssShellScript.CopyFrom(resShellScript, resShellScript.Size);
      sShellScript:= ssShellScript.DataString;
      memMain.Lines.Text:= sShellScript;
    finally
      ssShellScript.Free;
    end;
  finally
    resShellScript.Free;
  end;
end;

end.

