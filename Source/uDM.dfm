object DM: TDM
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 80
    Top = 64
  end
end
