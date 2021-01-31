unit uRequisicao;

interface

uses IdHTTP, IdSSLOpenSSL, Classes, System.JSON;

type
  THttpResponse = record
    ResponseCode: integer;
    ResponseStr: string;
  end;
  TRequisicao = class(TObject)
  private
    LHandler: TIdSSLIOHandlerSocketOpenSSL;
    UserAgent: string;

    function getHttpClientInstance: TIdHttp;
  public
    constructor create;
    Destructor  Destroy; override;

    function GET(servico: string): TJSONObject;
  end;

implementation

uses
  SysUtils, Dialogs, IdGlobal;

{ TRequisicao }

constructor TRequisicao.create;
begin
 Self.UserAgent:= 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
end;

destructor TRequisicao.Destroy;
begin
  Self.LHandler.Free;
  inherited;
end;

function TRequisicao.GET(servico: string): TJSONObject;
var Respota : TStringStream;
    HTTP: TIdHTTP;
begin
  Respota := TStringStream.Create('');
  try
    HTTP:= getHttpClientInstance;
    HTTP.Request.UserAgent:= Self.UserAgent;
    try
      HTTP.GET(servico, Respota);
      if (HTTP.ResponseCode = 200) and
         (not(Utf8ToAnsi(Respota.DataString) = '{'#$A'  "erro": true'#$A'}')) then
        Result:= TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( Utf8ToAnsi(Respota.DataString)), 0) as TJSONObject;
    except on e : exception do
      begin
        Result:= nil;
        raise Exception.Create(e.message);
      end;
    end;
  finally
    FreeAndNil(Respota);
  end;
end;

function TRequisicao.getHttpClientInstance: TIdHttp;
  function createSSLHandlerIfRequired(var httpClient: TIdHttp): boolean;
  begin
    // Create an SSL Handler if we need to.
    Self.LHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    if Assigned(Self.lHandler) then httpClient.IOHandler := LHandler;
  end;
begin
  Result := TIdHttp.Create(nil);
  Result.ConnectTimeout := 5000;
  Result.ReadTimeout := 5000;
  Result.MaxAuthRetries := 0;
  Result.HTTPOptions := [hoInProcessAuth];
  createSSLHandlerIfRequired(Result);
  Result.Request.CustomHeaders.Clear;
  Result.Request.BasicAuthentication := true;
end;

end.
