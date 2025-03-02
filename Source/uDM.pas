unit uDM;

interface

uses
  System.SysUtils,
  System.Classes,

  Data.DB,

  FireDAC.Phys,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.Intf,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.ExprFuncs,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
  private
    /// <summary>
    ///  새 데이터베이스 파일을 생성한다
    /// </summary>
    procedure CreateDatabase(const AFileName: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  uGlobal;

{ TDM }

constructor TDM.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TDM.Destroy;
begin

  inherited;
end;

procedure TDM.CreateDatabase(const AFileName: string);
const
  CREATE_SQL = '''
  CREATE TABLE ADDRBOOK (
    SEQ int primary key,    -- 일련번호
    NAME varchar(60),       -- 성명
    GRP_CD varchar(10),     -- 그룹코드
    MOBILE varchar(20),     -- 휴대전화번호
    EMAIL varchar(60),      -- 이메일주소
    ZIP_CD varchar(5),      -- 우편번호
    ADDR1 varchar(80),      -- 주소
    ADDR2 varchar(80),      -- 상세주소
    UDF1 varchar(80),       -- 사용자 정의컬럼1
    UDF2 varchar(80),       -- 사용자 정의컬럼2
    UDF3 varchar(80),       -- 사용자 정의컬럼3
    DEL_YN varchar(1)       -- 삭제여부
    REGDT datetime,         -- 등록일자
    MODDT datetime,         -- 수정일자
  );
  CREATE INDEX IDX_NAME on ADDRBOOK(NAME);  -- 성명 인덱스
  ''';
begin

end;

initialization
  DM := TDM.Create(nil);
finalization
  DM.Free;
end.
