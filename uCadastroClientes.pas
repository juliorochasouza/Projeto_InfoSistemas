unit uCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls, System.JSON,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ACBrMail,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, DBXJSONReflect, Data.DBXJSON,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IniFiles,
IdMessage,
IdAttachmentFile,
IdText, IdPOP3, ACBrBase, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  REST.Response.Adapter, Vcl.ComCtrls ;

type
  TfrmCadastroClientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnNovo: TButton;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    dsCliente: TDataSource;
    cdsCliente: TClientDataSet;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    dbedtCPF: TDBEdit;
    Label1: TLabel;
    cdsClienteNOME: TStringField;
    cdsClienteIDENTIDADE: TStringField;
    cdsClienteTELEFONE: TStringField;
    cdsClienteEMAIL: TStringField;
    cdsEndereco: TClientDataSet;
    cdsEnderecoCEP: TStringField;
    cdsEnderecoLOGRADOURO: TStringField;
    cdsEnderecoNUMERO: TStringField;
    cdsEnderecoCOMPLEMENTO: TStringField;
    cdsEnderecoBAIRRO: TStringField;
    cdsEnderecoCIDADE: TStringField;
    cdsEnderecoESTADO: TStringField;
    cdsEnderecoPAIS: TStringField;
    dbedtNome: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dbedtIdentidade: TDBEdit;
    Label4: TLabel;
    dbedtTelefone: TDBEdit;
    Label5: TLabel;
    dbedtEmail: TDBEdit;
    Panel3: TPanel;
    Label6: TLabel;
    dbedtPais: TDBEdit;
    dsEndereco: TDataSource;
    DBGrid2: TDBGrid;
    Label7: TLabel;
    dbedtCEP: TDBEdit;
    Label8: TLabel;
    dbedtLogradouro: TDBEdit;
    Label9: TLabel;
    dbedtNumero: TDBEdit;
    dbedtComplemento: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    dbedtBairro: TDBEdit;
    dbedtCidade: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    dbedtUF: TDBEdit;
    cdsClienteCPF: TStringField;
    cdsEnderecoCPF: TStringField;
    DBNavigator1: TDBNavigator;
    btnEnviarEmail: TButton;
    ACBrMail1: TACBrMail;
    btnConfiguracoes: TButton;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTClient1: TRESTClient;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    StatusBar1: TStatusBar;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsClienteDataChange(Sender: TObject; Field: TField);
    procedure cdsClienteBeforePost(DataSet: TDataSet);
    procedure dbedtCEPExit(Sender: TObject);
    procedure dbedtCPFKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtUFKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtCEPKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtCPFExit(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
    procedure dbedtEmailExit(Sender: TObject);
  private

    { Private declarations }
    procedure CarregaDadosVirtuais;
    procedure GravaDados;
    procedure InsereNovoDado;
    procedure AbreClientDataSets;
    procedure AlteraDados;
    procedure DeletaRegistro;
    procedure AtualizaBD;
    function isCPF(CPF: string): boolean;
    function ValidaCEP(cCep: string ; cEstado: string): Boolean;
    procedure EnvioEmailAcbr;
    procedure AjustaParametrosDeEnvio;
    procedure get_cep_endereco(pCEP: string);
    function retira_mascara(pstr: string; pun_mask: string): string;
    Function ValidaEMail(Email : String):Boolean;
  public
    { Public declarations }

  end;

var
  frmCadastroClientes: TfrmCadastroClientes;

implementation

{$R *.dfm}

uses uConfiguracoes;

procedure TfrmCadastroClientes.AbreClientDataSets;
begin
   cdsCliente.Close;
   cdsCliente.CreateDataSet;
   cdsCliente.LogChanges := False;
   cdsCliente.EmptyDataSet;
   cdsCliente.Open;

   cdsEndereco.Close;
   cdsEndereco.CreateDataSet;
   cdsEndereco.LogChanges := False;
   cdsEndereco.EmptyDataSet;
   cdsEndereco.Open;
end;

procedure TfrmCadastroClientes.AlteraDados;
begin
  cdsCliente.Edit;
  cdsEndereco.Edit;
end;

procedure TfrmCadastroClientes.AtualizaBD;
begin
  try
    // abreTransacao

    if FileExists(ExtractFilePath(Application.ExeName)+'BD\Cliente.xml') then
      if not DeleteFile(ExtractFilePath(Application.ExeName)+'BD\Cliente.xml') then
         raise Exception.Create('Erro ao Excluir o arquivo de clientes');

    if FileExists(ExtractFilePath(Application.ExeName)+'BD\Endereco.xml') then
      if not DeleteFile(ExtractFilePath(Application.ExeName)+'BD\Endereco.xml') then
         raise Exception.Create('Erro ao Excluir o arquivo de Endereço');

    cdsCliente.SaveToFile(ExtractFilePath(Application.ExeName)+'BD\Cliente.xml', dfXML);
    cdsEndereco.SaveToFile(ExtractFilePath(Application.ExeName)+'BD\Endereco.xml', dfXML);

    // fechaTransacao
  except
    // se for banco de dados
    // cancelaTransacao
  end;
end;

procedure TfrmCadastroClientes.btnAlterarClick(Sender: TObject);
begin
  AlteraDados;
  dbedtCPF.SetFocus;
end;

procedure TfrmCadastroClientes.btnCancelarClick(Sender: TObject);
begin
  if cdsCliente.State in [dsInsert,dsEdit] then
  begin
    cdsCliente.Cancel;
    cdsEndereco.Cancel;
  end;
end;

procedure TfrmCadastroClientes.btnConfiguracoesClick(Sender: TObject);
begin
  frmConfiguracao.ShowModal;
end;

procedure TfrmCadastroClientes.btnEnviarEmailClick(Sender: TObject);
begin
   try
     StatusBar1.Panels[0].Text := 'AGUARDE !!! ENVIANDO EMAIL...';
     Refresh;
     btnEnviarEmail.Enabled := False;
     EnvioEmailAcbr;
   finally
     StatusBar1.Panels[0].Text := '';
     btnEnviarEmail.Enabled := True;
   end;
end;

procedure TfrmCadastroClientes.btnExcluirClick(Sender: TObject);
begin
  DeletaRegistro;
end;

procedure TfrmCadastroClientes.btnGravarClick(Sender: TObject);
begin
  GravaDados;
  // Grava os dados no banco virtual
  AtualizaBD;
  btnNovo.SetFocus;
end;

procedure TfrmCadastroClientes.btnNovoClick(Sender: TObject);
begin

  GravaDados;
  InsereNovoDado;
  dbedtCPF.SetFocus;

end;

procedure TfrmCadastroClientes.CarregaDadosVirtuais;
begin
  cdsCliente.LoadFromFile(ExtractFilePath(Application.ExeName)+'BD\Cliente.xml');
  cdsEndereco.LoadFromFile(ExtractFilePath(Application.ExeName)+'BD\Endereco.xml');
end;

procedure TfrmCadastroClientes.cdsClienteBeforePost(DataSet: TDataSet);
begin

  try

    // Dados do Clientes
    if Trim(cdsClienteCPF.AsString) = '' then
    begin
      dbedtCPF.SetFocus;
      raise Exception.Create('O CPF deve ser informado !');
    end;

    if Trim(cdsClienteNOME.AsString) = '' then
    begin
      dbedtNome.SetFocus;
      raise Exception.Create('O Nome deve ser informado !');
    end;

    if Trim(cdsClienteIDENTIDADE.AsString) = '' then
    begin
      dbedtIdentidade.SetFocus;
      raise Exception.Create('A Identidade deve ser informada !');
    end;

    if Trim(cdsClienteTELEFONE.AsString) = '' then
    begin
      dbedtTelefone.SetFocus;
      raise Exception.Create('O Telefone deve ser informado !');
    end;

    if Trim(cdsClienteEMAIL.AsString) = '' then
    begin
      dbedtEmail.SetFocus;
      raise Exception.Create('O Email deve ser informado !');
    end;

    if Trim(cdsEnderecoPAIS.AsString) = '' then
    begin
      dbedtPais.SetFocus;
      raise Exception.Create('O País deve ser informado !');
    end;

    if Trim(cdsEnderecoCEP.AsString) = '' then
    begin
      dbedtCEP.SetFocus;
      raise Exception.Create('O CEP deve ser informado !');
    end;

    if Trim(cdsEnderecoLOGRADOURO.AsString) = '' then
    begin
      dbedtLogradouro.SetFocus;
      raise Exception.Create('O Logradouro deve ser informado !');
    end;

    if Trim(cdsEnderecoNUMERO.AsString) = '' then
    begin
      dbedtNumero.SetFocus;
      raise Exception.Create('O Número deve ser informado !');
    end;

    if Trim(cdsEnderecoBAIRRO.AsString) = '' then
    begin
      dbedtBairro.SetFocus;
      raise Exception.Create('O Bairro deve ser informado !');
    end;

    if Trim(cdsEnderecoCIDADE.AsString) = '' then
    begin
      dbedtCidade.SetFocus;
      raise Exception.Create('A Cidade deve ser informada !');
    end;

    if Trim(cdsEnderecoESTADO.AsString) = '' then
    begin
      dbedtUF.SetFocus;
      raise Exception.Create('A UF deve ser informada !');
    end;

    ShowMessage('Registro gravado com sucesso !!!');

  except
    raise Exception.Create('Erro ao gravar os dados !!!');
  end;
end;

procedure TfrmCadastroClientes.dbedtUFKeyPress(Sender: TObject; var Key: Char);
begin
  if (key in ['1','2','3','4','5','6','7','8','9','0',',']) then
    key :=#0;
end;

procedure TfrmCadastroClientes.dbedtCEPExit(Sender: TObject);
begin
  if Trim(cdsEnderecoCEP.AsString) <> '' then
  begin
     if Trim(cdsEnderecoESTADO.AsString) = '' then
     begin
       dbedtUF.SetFocus;
       raise Exception.Create('A UF deve ser Informada !');
     end;

     if ValidaCEP(Trim(cdsEnderecoCEP.AsString),cdsEnderecoESTADO.AsString) then
     begin
       dbedtCEP.SetFocus;
       raise Exception.Create('CEP inválido !');
     end;

     if MessageDlg('Deseja buscar endereço cadastrado em viacep ?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
        get_cep_endereco(cdsEnderecoCEP.AsString);
  end;
end;

procedure TfrmCadastroClientes.dbedtCEPKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['1','2','3','4','5','6','7','8','9','0',',']) then
    key :=#0;
end;

procedure TfrmCadastroClientes.dbedtCPFExit(Sender: TObject);
var
  cdsCloneCliente : TClientDataSet;

  procedure PesquisaCPF_Existente;
  begin
    if cdsCloneCliente.Locate('CPF', cdsClienteCPF.AsString, [LocaseInsensitive]) then
      begin
        dbedtCPF.SetFocus;
        ShowMessage('CPF já cadastrado para o Cliente: ' + cdsCloneCliente.FieldByName('NOME').AsString);
      end;
  end;

begin

  try

    if Trim(cdsClienteCPF.AsString) = '' then Exit;


    if not isCPF(Trim(cdsClienteCPF.AsString)) then
    begin
      dbedtCPf.SetFocus;
      raise Exception.Create('CPF Inválido !');
    end;

    cdsCloneCliente := TClientDataSet.Create(nil);
    cdsCloneCliente.CloneCursor(cdsCliente, False, False);

    if dsCliente.DataSet.State = dsInsert  then
    begin
      PesquisaCPF_Existente;
    end
    else
    begin
      if cdsClienteCPF.NewValue <> cdsClienteCPF.OldValue then
      begin
        PesquisaCPF_Existente;
      end;
    end;

  finally
    cdsCloneCliente.Free;
  end;

end;

procedure TfrmCadastroClientes.dbedtCPFKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['1','2','3','4','5','6','7','8','9','0',',']) then
    key :=#0;
end;

procedure TfrmCadastroClientes.dbedtEmailExit(Sender: TObject);
begin
  if Trim(cdsClienteEMAIL.AsString) = '' then Exit;

  if not ValidaEMail(Trim(dbedtEmail.Text)) then
  begin
    dbedtEmail.SetFocus;
    raise Exception.Create('Email inválido !');
  end;
end;

procedure TfrmCadastroClientes.dbedtNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['1','2','3','4','5','6','7','8','9','0',',']) then
    key :=#0;
end;

procedure TfrmCadastroClientes.DeletaRegistro;
begin

  if MessageDlg('Confirma e exclusão do Registro selecionado ?', mtConfirmation, [mbYes,mbNo],0) <> mrYes then Exit;

  try

    cdsCliente.Delete;
    cdsEndereco.Delete;

    AtualizaBD;

  except
    raise Exception.Create('Erro ao deletar o registro !');
  end;
end;

procedure TfrmCadastroClientes.dsClienteDataChange(Sender: TObject;
  Field: TField);
begin
  btnNovo.Enabled        := not (dsCliente.DataSet.State in [dsInsert,dsEdit]);
  btnEnviarEmail.Enabled := not (dsCliente.DataSet.State in [dsInsert,dsEdit]);
  btnCancelar.Enabled    := (dsCliente.DataSet.State in [dsInsert,dsEdit]);
  btnGravar.Enabled      := (dsCliente.DataSet.State in [dsInsert,dsEdit]);
  btnAlterar.Enabled     := not (dsCliente.DataSet.State in [dsInsert,dsEdit]);
  btnExcluir.Enabled     := not (dsCliente.DataSet.State in [dsInsert,dsEdit]);

  if ((dsCliente.DataSet.IsEmpty) or
     (Trim(cdsClienteCPF.AsString) = '') or
     (dsCliente.DataSet.State in [dsInsert,dsEdit]  ) or
     (dsEndereco.DataSet.State in [dsInsert,dsEdit])) then Exit;

  cdsEndereco.Filtered := False;
  cdsEndereco.Filter   := ' CPF = ' + cdsClienteCPF.AsString;
  cdsEndereco.Filtered := True;

end;


procedure TfrmCadastroClientes.EnvioEmailAcbr;
var
  ArqXML : String;
  MS: TMemoryStream;
  P, N: Integer;
begin

  try

    ACBrMail1.Clear;
    ACBrMail1.IsHTML := false;
    AjustaParametrosDeEnvio;
    MS := TMemoryStream.Create;
    try

      ArqXML := 'Cliente.xml';
      MS.LoadFromFile(ExtractFilePath(Application.ExeName)+'BD\Cliente.xml');
      ACBrMail1.AddAttachment(MS, ArqXML, adAttachment);


      ArqXML := 'Endereco.xml';
      MS.LoadFromFile(ExtractFilePath(Application.ExeName)+'BD\Endereco.xml');
      ACBrMail1.AddAttachment(MS, ArqXML, adAttachment);

      ACBrMail1.Send(False);

      ShowMessage('Email enviado com sucesso !!!');

    except
      on E:Exception do
      begin
        ShowMessage('Erro ao tentar enviar: ' + E.Message);
      end;

    end;


  finally
    MS.Free;
  end;
end;

procedure TfrmCadastroClientes.AjustaParametrosDeEnvio;
begin
  ACBrMail1.From := frmConfiguracao.cdsConfigEMAIL_TESTE.AsString;
  ACBrMail1.FromName := frmConfiguracao.cdsConfigEMAIL_TESTE.AsString;
  ACBrMail1.Host := frmConfiguracao.cdsConfigHOST.AsString; // troque pelo seu servidor smtp
  ACBrMail1.Username := frmConfiguracao.cdsConfigUSUARIO.AsString;
  ACBrMail1.Password := frmConfiguracao.cdsConfigSENHA.AsString;
  ACBrMail1.Port := frmConfiguracao.cdsConfigPORT.AsString; // troque pela porta do seu servidor smtp
  ACBrMail1.SetTLS := (frmConfiguracao.cdsConfigTLS.AsString = 'S');
  ACBrMail1.SetSSL := (frmConfiguracao.cdsConfigSSL.AsString = 'S');  // Verifique se o seu servidor necessita SSL
  ACBrMail1.DefaultCharset := TMailCharset(0);
  ACBrMail1.IDECharset := TMailCharset(0);
  ACBrMail1.AddAddress(frmConfiguracao.cdsConfigEMAIL_TESTE.AsString, frmConfiguracao.cdsConfigFROM.AsString);
  ACBrMail1.Subject:= frmConfiguracao.cdsConfigASSUNTO.AsString;
  ACBrMail1.Body.Add(frmConfiguracao.cdsConfigMENSAGEM.AsString);
end;

procedure TfrmCadastroClientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := '0';
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmCadastroClientes.FormShow(Sender: TObject);
begin
  AbreClientDataSets;
  CarregaDadosVirtuais;
  btnNovo.SetFocus;
end;

procedure TfrmCadastroClientes.get_cep_endereco(pCEP: string);
var URL       : String;
    CEP       : string;
begin
  CEP:= retira_mascara(Trim(pCEP), '.-');
  if CEP = '' then
    Exit;
  url:= StringReplace('https://viacep.com.br/ws/*URL*/json/','*URL*',CEP,[rfReplaceAll]);

  RESTClient1.BaseURL:=url;
  RESTRequest1.Execute;

  cdsEnderecoCEP.AsString         := FDMemTable1.FieldByName('cep').AsString;
  cdsEnderecoLOGRADOURO.AsString  := FDMemTable1.FieldByName('logradouro').AsString;
  cdsEnderecoCOMPLEMENTO.AsString := FDMemTable1.FieldByName('complemento').AsString;
  cdsEnderecoBAIRRO.AsString      := FDMemTable1.FieldByName('bairro').AsString;
  cdsEnderecoCIDADE.AsString      := FDMemTable1.FieldByName('localidade').AsString;
  cdsEnderecoESTADO.AsString      := FDMemTable1.FieldByName('uf').AsString;
end;

procedure TfrmCadastroClientes.GravaDados;
begin
  if not (cdsCliente.State in [dsInsert,dsEdit]) then Exit;

  cdsCliente.Post;
  cdsEnderecoCPF.AsString := Trim(cdsClienteCPF.AsString);
  cdsEndereco.Post;

end;

procedure TfrmCadastroClientes.InsereNovoDado;
begin
  cdsCliente.Insert;
  cdsEndereco.Insert;
end;

function TfrmCadastroClientes.isCPF(CPF: string): boolean;
var  dig10, dig11: string;
    s, i, r, peso: integer;
begin
// length - retorna o tamanho da string (CPF é um número formado por 11 dígitos)
  if ((CPF = '00000000000') or (CPF = '11111111111') or
      (CPF = '22222222222') or (CPF = '33333333333') or
      (CPF = '44444444444') or (CPF = '55555555555') or
      (CPF = '66666666666') or (CPF = '77777777777') or
      (CPF = '88888888888') or (CPF = '99999999999') or
      (length(CPF) <> 11))
     then begin
              isCPF := false;
              exit;
            end;

// try - protege o código para eventuais erros de conversão de tipo na função StrToInt
  try
{ *-- Cálculo do 1o. Digito Verificador --* }
    s := 0;
    peso := 10;
    for i := 1 to 9 do
    begin
// StrToInt converte o i-ésimo caractere do CPF em um número
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig10 := '0'
    else str(r:1, dig10); // converte um número no respectivo caractere numérico

{ *-- Cálculo do 2o. Digito Verificador --* }
    s := 0;
    peso := 11;
    for i := 1 to 10 do
    begin
      s := s + (StrToInt(CPF[i]) * peso);
      peso := peso - 1;
    end;
    r := 11 - (s mod 11);
    if ((r = 10) or (r = 11))
       then dig11 := '0'
    else str(r:1, dig11);

{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig10 = CPF[10]) and (dig11 = CPF[11]))
       then isCPF := true
    else isCPF := false;
  except
    isCPF := false
  end;
end;

function TfrmCadastroClientes.retira_mascara(pstr, pun_mask: string): string;
Var lcst_Texto : string;
    i : integer;
begin
  lcst_Texto := '';
  for i := 1 to length(pstr) do
  begin
    if Pos(pstr[i],pun_mask) = 0 then
      lcst_Texto:= lcst_Texto + pstr[i];
  end;
  Result:= lcst_Texto;
end;

function TfrmCadastroClientes.ValidaCEP(cCep, cEstado: string): Boolean;
var
 cCEP1 : Integer;
begin
  cCep := copy(cCep,1,5) + copy(cCep,7,3);
  cCEP1 := StrToInt(copy(cCep,1,3));
  Result := True;
   if Length(trim(cCep)) > 0 then
   begin
    if (StrToInt(cCep) <= 1000000.0) then
     begin
      MessageDlg('CEP tem que ser maior que [01000-000]',mtError,[mbOk],0);
      Result := False
     end
    else
    begin
      if Length(trim(copy(cCep,6,3))) < 3 then Result := False else
      if (cEstado = 'SP') and (cCEP1 >= 10 ) and (cCEP1 <= 199) then Result := True else
      if (cEstado = 'RJ') and (cCEP1 >= 200) and (cCEP1 <= 289) then Result := True else
      if (cEstado = 'ES') and (cCEP1 >= 290) and (cCEP1 <= 299) then Result := True else
      if (cEstado = 'MG') and (cCEP1 >= 300) and (cCEP1 <= 399) then Result := True else
      if (cEstado = 'BA') and (cCEP1 >= 400) and (cCEP1 <= 489) then Result := True else
      if (cEstado = 'SE') and (cCEP1 >= 490) and (cCEP1 <= 499) then Result := True else
      if (cEstado = 'PE') and (cCEP1 >= 500) and (cCEP1 <= 569) then Result := True else
      if (cEstado = 'AL') and (cCEP1 >= 570) and (cCEP1 <= 579) then Result := True else
      if (cEstado = 'PB') and (cCEP1 >= 580) and (cCEP1 <= 589) then Result := True else
      if (cEstado = 'RN') and (cCEP1 >= 590) and (cCEP1 <= 599) then Result := True else
      if (cEstado = 'CE') and (cCEP1 >= 600) and (cCEP1 <= 639) then Result := True else
      if (cEstado = 'PI') and (cCEP1 >= 640) and (cCEP1 <= 649) then Result := True else
      if (cEstado = 'MA') and (cCEP1 >= 650) and (cCEP1 <= 659) then Result := True else
      if (cEstado = 'PA') and (cCEP1 >= 660) and (cCEP1 <= 688) then Result := True else
      if (cEstado = 'AM') and ((cCEP1 >= 690) and (cCEP1 <= 692) or (cCEP1 >= 694) and

      (cCEP1 <= 698)) then Result := True else
      if (cEstado = 'AP') and (cCEP1 = 689) then Result := True else
      if (cEstado = 'RR') and (cCEP1 = 693) then Result := True else
      if (cEstado = 'AC') and (cCEP1 = 699) then Result := True else
      if ((cEstado = 'DF') or (cEstado = 'GO')) and (cCEP1 >= 000)and(cCEP1 <= 999)then
      Result := True else
      if (cEstado = 'TO') and (cCEP1 >= 770) and (cCEP1 <= 779) then Result := True else
      if (cEstado = 'MT') and (cCEP1 >= 780) and (cCEP1 <= 788) then Result := True else
      if (cEstado = 'MS') and (cCEP1 >= 790) and (cCEP1 <= 799) then Result := True else
      if (cEstado = 'RO') and (cCEP1 = 789) then Result := True else
      if (cEstado = 'PR') and (cCEP1 >= 800) and (cCEP1 <= 879) then Result := True else
      if (cEstado = 'SC') and (cCEP1 >= 880) and (cCEP1 <= 899) then Result := True else
      if (cEstado = 'RS') and (cCEP1 >= 900) and (cCEP1 <= 999) then Result := True else

      Result := False
    end;
   end;
end;

function TfrmCadastroClientes.ValidaEMail(Email : string): Boolean;
begin
 Email := Trim(UpperCase(Email));
 if Pos('@', Email) > 1 then
 begin
   Delete(Email, 1, pos('@', Email));
   Result := (Length(Email) > 0) and (Pos('.', Email) > 2);
 end
 else
   Result := False;
end;

end.
