unit uAbout;

interface

uses
  System.SysUtils,
  System.Variants,
  System.Classes,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs;

type
  TfrmAbout = class(TForm)
  private
  public
    class procedure Execute; static;
  end;

implementation

{$R *.dfm}

{ TfrmAbout }

class procedure TfrmAbout.Execute;
var
  LForm: TfrmAbout;
begin
  LForm := TfrmAbout.Create(nil);
  try
    LForm.Position := poMainFormCenter;
    LForm.ShowModal;
  finally
    LForm.Free;
  end;
end;

end.
