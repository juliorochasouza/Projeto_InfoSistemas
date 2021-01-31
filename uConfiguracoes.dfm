object frmConfiguracao: TfrmConfiguracao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o'
  ClientHeight = 462
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbxEmail: TGroupBox
    Left = 8
    Top = 8
    Width = 441
    Height = 404
    Caption = ' Email '
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 34
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
    end
    object Label2: TLabel
      Left = 16
      Top = 61
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object Label3: TLabel
      Left = 16
      Top = 88
      Width = 26
      Height = 13
      Caption = 'Host:'
    end
    object Label4: TLabel
      Left = 16
      Top = 115
      Width = 24
      Height = 13
      Caption = 'Port:'
    end
    object Label15: TLabel
      Left = 16
      Top = 198
      Width = 126
      Height = 13
      Caption = 'Para e-Mail (AddAddress):'
      Color = clBtnFace
      ParentColor = False
    end
    object Label16: TLabel
      Left = 16
      Top = 288
      Width = 160
      Height = 13
      Caption = 'Mensagem (Alt Body modo texto)'
      Color = clBtnFace
      ParentColor = False
    end
    object Label17: TLabel
      Left = 16
      Top = 243
      Width = 90
      Height = 13
      Caption = 'Assunto (Subject):'
      Color = clBtnFace
      ParentColor = False
    end
    object lblTipoAutenticacao: TLabel
      Left = 175
      Top = 110
      Width = 90
      Height = 13
      Caption = 'Tipo Autentica'#231#227'o:'
      Color = clBtnFace
      ParentColor = False
    end
    object Label5: TLabel
      Left = 16
      Top = 155
      Width = 39
      Height = 13
      Caption = 'Contato'
      Color = clBtnFace
      ParentColor = False
    end
    object dbedtUsuario: TDBEdit
      Left = 81
      Top = 29
      Width = 336
      Height = 21
      Color = clInfoBk
      DataField = 'USUARIO'
      DataSource = dsConfiguracao
      TabOrder = 0
    end
    object dbedtSenha: TDBEdit
      Left = 81
      Top = 56
      Width = 336
      Height = 21
      Color = clInfoBk
      DataField = 'SENHA'
      DataSource = dsConfiguracao
      PasswordChar = '#'
      TabOrder = 1
    end
    object dbedtHost: TDBEdit
      Left = 81
      Top = 83
      Width = 336
      Height = 21
      Color = clInfoBk
      DataField = 'HOST'
      DataSource = dsConfiguracao
      TabOrder = 2
    end
    object dbedtPort: TDBEdit
      Left = 81
      Top = 110
      Width = 65
      Height = 21
      Color = clInfoBk
      DataField = 'PORT'
      DataSource = dsConfiguracao
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 216
      Width = 400
      Height = 21
      Color = clInfoBk
      DataField = 'EMAIL_TESTE'
      DataSource = dsConfiguracao
      TabOrder = 4
    end
    object DBEdit2: TDBEdit
      Left = 17
      Top = 261
      Width = 400
      Height = 21
      Color = clInfoBk
      DataField = 'ASSUNTO'
      DataSource = dsConfiguracao
      TabOrder = 5
    end
    object DBMemo1: TDBMemo
      Left = 17
      Top = 307
      Width = 399
      Height = 87
      Color = clInfoBk
      DataField = 'MENSAGEM'
      DataSource = dsConfiguracao
      TabOrder = 6
    end
    object DBCheckBox1: TDBCheckBox
      Left = 175
      Top = 129
      Width = 45
      Height = 17
      Caption = 'TLS'
      DataField = 'TLS'
      DataSource = dsConfiguracao
      TabOrder = 7
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 237
      Top = 129
      Width = 45
      Height = 17
      Caption = 'SSL'
      DataField = 'SSL'
      DataSource = dsConfiguracao
      TabOrder = 8
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 173
      Width = 400
      Height = 21
      Color = clInfoBk
      DataField = 'FROM'
      DataSource = dsConfiguracao
      TabOrder = 9
    end
  end
  object btnCancelar: TButton
    Left = 296
    Top = 419
    Width = 129
    Height = 36
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = btnCancelarClick
  end
  object btnGravar: TButton
    Left = 161
    Top = 419
    Width = 129
    Height = 36
    Caption = 'Gravar'
    TabOrder = 2
    OnClick = btnGravarClick
  end
  object btnAlterar: TButton
    Left = 26
    Top = 419
    Width = 129
    Height = 36
    Caption = 'Alterar'
    TabOrder = 3
    OnClick = btnAlterarClick
  end
  object dsConfiguracao: TDataSource
    AutoEdit = False
    DataSet = cdsConfig
    OnDataChange = dsConfiguracaoDataChange
    Left = 344
    Top = 120
  end
  object cdsConfig: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 120
    object cdsConfigUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 100
    end
    object cdsConfigSENHA: TStringField
      FieldName = 'SENHA'
      Size = 50
    end
    object cdsConfigHOST: TStringField
      FieldName = 'HOST'
      Size = 100
    end
    object cdsConfigPORT: TIntegerField
      FieldName = 'PORT'
    end
    object cdsConfigEMAIL_TESTE: TStringField
      FieldName = 'EMAIL_TESTE'
      Size = 100
    end
    object cdsConfigASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      Size = 50
    end
    object cdsConfigMENSAGEM: TStringField
      FieldName = 'MENSAGEM'
      Size = 1000
    end
    object cdsConfigTLS: TStringField
      FieldName = 'TLS'
      Size = 1
    end
    object cdsConfigSSL: TStringField
      FieldName = 'SSL'
      Size = 1
    end
    object cdsConfigFROM: TStringField
      FieldName = 'FROM'
      Size = 100
    end
  end
end
