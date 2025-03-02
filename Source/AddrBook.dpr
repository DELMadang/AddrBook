program AddrBook;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  uGlobal in 'uGlobal.pas',
  uAbout in 'uAbout.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
