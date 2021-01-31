program prjSistemaInfo;

uses
  Vcl.Forms,
  uFrmMenu in 'uFrmMenu.pas' {frmMenu},
  uCadastroClientes in 'uCadastroClientes.pas' {frmCadastroClientes},
  uConfiguracoes in 'uConfiguracoes.pas' {frmConfiguracao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmCadastroClientes, frmCadastroClientes);
  Application.CreateForm(TfrmConfiguracao, frmConfiguracao);
  Application.Run;
end.
