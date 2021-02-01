object frmCadastroClientes: TfrmCadastroClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Clientes'
  ClientHeight = 668
  ClientWidth = 936
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 649
    Align = alLeft
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 668
    object btnNovo: TButton
      Left = 24
      Top = 16
      Width = 153
      Height = 57
      Caption = 'Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnAlterar: TButton
      Left = 24
      Top = 96
      Width = 153
      Height = 57
      Caption = 'Alterar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnGravar: TButton
      Left = 24
      Top = 176
      Width = 153
      Height = 57
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnGravarClick
    end
    object btnCancelar: TButton
      Left = 24
      Top = 335
      Width = 153
      Height = 57
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object btnExcluir: TButton
      Left = 24
      Top = 256
      Width = 153
      Height = 57
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnExcluirClick
    end
    object btnEnviarEmail: TButton
      Left = 24
      Top = 415
      Width = 153
      Height = 57
      Caption = 'Enviar Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btnEnviarEmailClick
    end
    object btnConfiguracoes: TButton
      Left = 24
      Top = 491
      Width = 153
      Height = 57
      Caption = 'Configura'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = btnConfiguracoesClick
    end
  end
  object Panel2: TPanel
    Left = 201
    Top = 0
    Width = 735
    Height = 649
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 668
    DesignSize = (
      735
      649)
    object GroupBox1: TGroupBox
      Left = 6
      Top = 19
      Width = 718
      Height = 241
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Dados '
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 22
        Width = 54
        Height = 13
        Caption = 'CPF / CNPJ'
      end
      object Label2: TLabel
        Left = 175
        Top = 19
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label3: TLabel
        Left = 535
        Top = 22
        Width = 52
        Height = 13
        Caption = 'Identidade'
      end
      object Label4: TLabel
        Left = 16
        Top = 66
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label5: TLabel
        Left = 175
        Top = 66
        Width = 24
        Height = 13
        Caption = 'Email'
      end
      object Label6: TLabel
        Left = 532
        Top = 192
        Width = 19
        Height = 13
        Caption = 'Pa'#237's'
      end
      object Label7: TLabel
        Left = 59
        Top = 144
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label8: TLabel
        Left = 196
        Top = 141
        Width = 55
        Height = 13
        Caption = 'Logradouro'
      end
      object Label9: TLabel
        Left = 599
        Top = 144
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label10: TLabel
        Left = 16
        Top = 192
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object Label11: TLabel
        Left = 96
        Top = 192
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label12: TLabel
        Left = 280
        Top = 192
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label13: TLabel
        Left = 16
        Top = 144
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object dbedtCPF: TDBEdit
        Left = 16
        Top = 38
        Width = 153
        Height = 21
        Color = clInfoBk
        DataField = 'CPF'
        DataSource = dsCliente
        TabOrder = 0
        OnExit = dbedtCPFExit
        OnKeyPress = dbedtCPFKeyPress
      end
      object dbedtNome: TDBEdit
        Left = 175
        Top = 38
        Width = 354
        Height = 21
        CharCase = ecUpperCase
        Color = clInfoBk
        DataField = 'NOME'
        DataSource = dsCliente
        TabOrder = 1
      end
      object dbedtIdentidade: TDBEdit
        Left = 535
        Top = 38
        Width = 169
        Height = 21
        CharCase = ecUpperCase
        Color = clInfoBk
        DataField = 'IDENTIDADE'
        DataSource = dsCliente
        TabOrder = 2
      end
      object dbedtTelefone: TDBEdit
        Left = 16
        Top = 82
        Width = 153
        Height = 21
        Color = clInfoBk
        DataField = 'TELEFONE'
        DataSource = dsCliente
        TabOrder = 3
      end
      object dbedtEmail: TDBEdit
        Left = 175
        Top = 82
        Width = 530
        Height = 21
        Color = clInfoBk
        DataField = 'EMAIL'
        DataSource = dsCliente
        TabOrder = 4
        OnExit = dbedtEmailExit
      end
      object Panel3: TPanel
        Left = 14
        Top = 113
        Width = 690
        Height = 20
        Caption = 'E N D E R E '#199' O'
        TabOrder = 5
      end
      object dbedtPais: TDBEdit
        Left = 531
        Top = 207
        Width = 174
        Height = 21
        Color = clInfoBk
        DataField = 'PAIS'
        DataSource = dsEndereco
        TabOrder = 13
      end
      object dbedtCEP: TDBEdit
        Left = 60
        Top = 160
        Width = 130
        Height = 21
        Color = clInfoBk
        DataField = 'CEP'
        DataSource = dsEndereco
        TabOrder = 7
        OnExit = dbedtCEPExit
        OnKeyPress = dbedtCEPKeyPress
      end
      object dbedtLogradouro: TDBEdit
        Left = 196
        Top = 160
        Width = 394
        Height = 21
        Color = clInfoBk
        DataField = 'LOGRADOURO'
        DataSource = dsEndereco
        MaxLength = 100
        TabOrder = 8
      end
      object dbedtNumero: TDBEdit
        Left = 599
        Top = 160
        Width = 105
        Height = 21
        Color = clInfoBk
        DataField = 'NUMERO'
        DataSource = dsEndereco
        TabOrder = 9
        OnKeyPress = dbedtNumeroKeyPress
      end
      object dbedtComplemento: TDBEdit
        Left = 16
        Top = 208
        Width = 74
        Height = 21
        Color = clInfoBk
        DataField = 'COMPLEMENTO'
        DataSource = dsEndereco
        TabOrder = 10
      end
      object dbedtBairro: TDBEdit
        Left = 96
        Top = 207
        Width = 178
        Height = 21
        Color = clInfoBk
        DataField = 'BAIRRO'
        DataSource = dsEndereco
        TabOrder = 11
      end
      object dbedtCidade: TDBEdit
        Left = 280
        Top = 207
        Width = 245
        Height = 21
        Color = clInfoBk
        DataField = 'CIDADE'
        DataSource = dsEndereco
        TabOrder = 12
      end
      object dbedtUF: TDBEdit
        Left = 16
        Top = 160
        Width = 34
        Height = 21
        CharCase = ecUpperCase
        Color = clInfoBk
        DataField = 'ESTADO'
        DataSource = dsEndereco
        TabOrder = 6
        OnKeyPress = dbedtUFKeyPress
      end
    end
    object DBGrid1: TDBGrid
      Left = 6
      Top = 297
      Width = 718
      Height = 248
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clInfoBk
      DataSource = dsCliente
      DrawingStyle = gdsGradient
      GradientStartColor = clInfoBk
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 346
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF'
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDENTIDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 6
      Top = 551
      Width = 718
      Height = 73
      Anchors = [akLeft, akRight, akBottom]
      Color = clInfoBk
      DataSource = dsEndereco
      DrawingStyle = gdsGradient
      GradientStartColor = clInfoBk
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'LOGRADOURO'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUMERO'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPLEMENTO'
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BAIRRO'
          Width = 500
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CIDADE'
          Width = 500
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CEP'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAIS'
          Width = 200
          Visible = True
        end>
    end
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 266
      Width = 716
      Height = 25
      DataSource = dsCliente
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 649
    Width = 936
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    ExplicitLeft = 480
    ExplicitTop = 344
    ExplicitWidth = 0
  end
  object dsCliente: TDataSource
    AutoEdit = False
    DataSet = cdsCliente
    OnDataChange = dsClienteDataChange
    Left = 337
    Top = 296
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = cdsClienteBeforePost
    Left = 337
    Top = 344
    object cdsClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsClienteIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
    end
    object cdsClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
    object cdsClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsClienteCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
  end
  object cdsEndereco: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 417
    Top = 344
    object cdsEnderecoCEP: TStringField
      FieldName = 'CEP'
    end
    object cdsEnderecoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 200
    end
    object cdsEnderecoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 30
    end
    object cdsEnderecoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object cdsEnderecoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object cdsEnderecoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object cdsEnderecoESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object cdsEnderecoPAIS: TStringField
      FieldName = 'PAIS'
      Size = 100
    end
    object cdsEnderecoCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
  end
  object dsEndereco: TDataSource
    AutoEdit = False
    DataSet = cdsEndereco
    Left = 417
    Top = 296
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 504
    Top = 350
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 672
    Top = 352
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 672
    Top = 408
  end
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://viacep.com.br/ws/31110720/json'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 672
    Top = 472
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 776
    Top = 416
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 776
    Top = 360
  end
end
