unit uConfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Datasnap.DBClient;

type
  TfrmConfiguracao = class(TForm)
    gbxEmail: TGroupBox;
    dbedtUsuario: TDBEdit;
    Label1: TLabel;
    dbedtSenha: TDBEdit;
    Label2: TLabel;
    dbedtHost: TDBEdit;
    Label3: TLabel;
    dbedtPort: TDBEdit;
    Label4: TLabel;
    btnCancelar: TButton;
    btnGravar: TButton;
    btnAlterar: TButton;
    dsConfiguracao: TDataSource;
    cdsConfig: TClientDataSet;
    cdsConfigUSUARIO: TStringField;
    cdsConfigSENHA: TStringField;
    cdsConfigHOST: TStringField;
    cdsConfigPORT: TIntegerField;
    cdsConfigEMAIL_TESTE: TStringField;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit1: TDBEdit;
    cdsConfigASSUNTO: TStringField;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    cdsConfigMENSAGEM: TStringField;
    lblTipoAutenticacao: TLabel;
    cdsConfigTLS: TStringField;
    cdsConfigSSL: TStringField;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    cdsConfigFROM: TStringField;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dsConfiguracaoDataChange(Sender: TObject; Field: TField);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracao: TfrmConfiguracao;

implementation

{$R *.dfm}

procedure TfrmConfiguracao.btnAlterarClick(Sender: TObject);
begin
   cdsConfig.Edit;
   dbedtUsuario.SetFocus;
end;

procedure TfrmConfiguracao.btnCancelarClick(Sender: TObject);
begin
   cdsConfig.Cancel;
end;

procedure TfrmConfiguracao.btnGravarClick(Sender: TObject);
begin
   cdsConfig.Post;

   if FileExists(ExtractFilePath(Application.ExeName)+'BD\Config.xml') then
    if not DeleteFile(ExtractFilePath(Application.ExeName)+'BD\Config.xml') then
       raise Exception.Create('Erro ao Gravar a Configuração');

   cdsConfig.SaveToFile(ExtractFilePath(Application.ExeName)+'BD\Config.xml', dfXML);

end;

procedure TfrmConfiguracao.dsConfiguracaoDataChange(Sender: TObject;
  Field: TField);
begin
   btnAlterar.Enabled  := not (dsConfiguracao.State in [dsInsert,dsEdit]);
   btnGravar.Enabled   := (dsConfiguracao.State in [dsInsert,dsEdit]);
   btnCancelar.Enabled := (dsConfiguracao.State in [dsInsert,dsEdit]);
end;

procedure TfrmConfiguracao.FormCreate(Sender: TObject);
begin
  cdsConfig.Close;
  cdsConfig.CreateDataSet;
  cdsConfig.LogChanges := False;
  cdsConfig.EmptyDataSet;
  cdsConfig.Open;

  if not FileExists(ExtractFilePath(Application.ExeName)+'BD\Config.xml') then
  begin
    cdsConfig.SaveToFile(ExtractFilePath(Application.ExeName)+'BD\Config.xml', dfXML);
  end;

  cdsConfig.LoadFromFile(ExtractFilePath(Application.ExeName)+'BD\Config.xml');

end;

procedure TfrmConfiguracao.FormShow(Sender: TObject);
begin
  btnAlterar.SetFocus;

end;

end.
