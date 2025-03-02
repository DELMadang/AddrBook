unit uGlobal;

interface

uses
  System.SysUtils,
  system.Generics.Collections,
  System.Classes;

type
  TGlobal = class
  strict private
    type
      TPath = class
      private
        FItems: TDictionary<string, string>;
        FRoot: string;

        function  GetPath(const AName: string): string;
        procedure SetPath(const AName, Value: string);
      public
        constructor Create;
        destructor Destroy; override;

        property Path[const AName: string]: string read GetPath write SetPath; default;
        property Root: string read FRoot;
      end;
    class var
      FPath: TPath;

    class constructor Create;
    class destructor Destroy;
  public
    class property Path: TPath read FPath;
  end;

implementation

uses
  System.IOUtils;

{ TGlobal.TPath }

constructor TGlobal.TPath.Create;
begin
  FRoot := ExtractFilePath(ParamStr(0));
end;

destructor TGlobal.TPath.Destroy;
begin
  FPath.Free;

  inherited;
end;

function TGlobal.TPath.GetPath(const AName: string): string;
begin
  Result := '';
  if not FItems.TryGetValue(AName.ToUpper, Result) then
    raise Exception.Create('지정된 이름을 찾을 수 없습니다');
end;

procedure TGlobal.TPath.SetPath(const AName, Value: string);
begin
  FItems.AddOrSetValue(AName.ToUpper, Value);
end;

{ TGlobal }

class constructor TGlobal.Create;
begin
  FPath := TPath.Create;
  FPath['data'] := 'data';
end;

class destructor TGlobal.Destroy;
begin
  FPath.Free;
end;

end.
