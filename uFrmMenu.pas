unit uFrmMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    mnCadastros: TMenuItem;
    mnClientes: TMenuItem;
    mnUtilitarios: TMenuItem;
    mnConfiguracoes: TMenuItem;
    procedure mnClientesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnConfiguracoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses uCadastroClientes, uConfiguracoes;

procedure TfrmMenu.FormShow(Sender: TObject);
begin

  if not FileExists(ExtractFilePath(Application.ExeName)+'BD\Cliente.xml') then
    FileCreate(ExtractFilePath(Application.ExeName)+'BD\Cliente.xml');

  if not FileExists(ExtractFilePath(Application.ExeName)+'BD\Endereco.xml') then
    FileCreate(ExtractFilePath(Application.ExeName)+'BD\Endereco.xml');

end;

procedure TfrmMenu.mnClientesClick(Sender: TObject);
begin
  frmCadastroClientes.ShowModal;
end;

procedure TfrmMenu.mnConfiguracoesClick(Sender: TObject);
begin
  frmConfiguracao.ShowModal;
end;

end.
