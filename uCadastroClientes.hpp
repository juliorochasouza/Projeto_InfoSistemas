// CodeGear C++Builder
// Copyright (c) 1995, 2015 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'uCadastroClientes.pas' rev: 29.00 (Windows)

#ifndef UcadastroclientesHPP
#define UcadastroclientesHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <Winapi.Windows.hpp>
#include <Winapi.Messages.hpp>
#include <System.SysUtils.hpp>
#include <System.Variants.hpp>
#include <System.Classes.hpp>
#include <Vcl.Graphics.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Data.DB.hpp>
#include <Vcl.Grids.hpp>
#include <Vcl.DBGrids.hpp>
#include <Datasnap.DBClient.hpp>
#include <Vcl.Mask.hpp>
#include <Vcl.DBCtrls.hpp>

//-- user supplied -----------------------------------------------------------

namespace Ucadastroclientes
{
//-- forward type declarations -----------------------------------------------
class DELPHICLASS TfrmCadastroClientes;
//-- type declarations -------------------------------------------------------
class PASCALIMPLEMENTATION TfrmCadastroClientes : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Extctrls::TPanel* Panel1;
	Vcl::Extctrls::TPanel* Panel2;
	Vcl::Stdctrls::TButton* btnNovo;
	Vcl::Stdctrls::TGroupBox* GroupBox1;
	Vcl::Dbgrids::TDBGrid* DBGrid1;
	Data::Db::TDataSource* dsCliente;
	Datasnap::Dbclient::TClientDataSet* cdsCliente;
	Vcl::Stdctrls::TButton* btnAlterar;
	Vcl::Stdctrls::TButton* btnGravar;
	Vcl::Stdctrls::TButton* btnCancelar;
	Vcl::Stdctrls::TButton* btnExcluir;
	Vcl::Dbctrls::TDBEdit* dbedtCPF;
	Vcl::Stdctrls::TLabel* Label1;
	Data::Db::TStringField* cdsClienteNOME;
	Data::Db::TStringField* cdsClienteIDENTIDADE;
	Data::Db::TStringField* cdsClienteTELEFONE;
	Data::Db::TStringField* cdsClienteEMAIL;
	Datasnap::Dbclient::TClientDataSet* cdsEndereco;
	Data::Db::TSmallintField* cdsEnderecoCPF;
	Data::Db::TSmallintField* cdsClienteCPF;
	Data::Db::TStringField* cdsEnderecoCEP;
	Data::Db::TStringField* cdsEnderecoLOGRADOURO;
	Data::Db::TStringField* cdsEnderecoNUMERO;
	Data::Db::TStringField* cdsEnderecoCOMPLEMENTO;
	Data::Db::TStringField* cdsEnderecoBAIRRO;
	Data::Db::TStringField* cdsEnderecoCIDADE;
	Data::Db::TStringField* cdsEnderecoESTADO;
	Data::Db::TStringField* cdsEnderecoPAIS;
	Vcl::Dbctrls::TDBEdit* dbedtNome;
	Vcl::Stdctrls::TLabel* Label2;
	Vcl::Stdctrls::TLabel* Label3;
	Vcl::Dbctrls::TDBEdit* dbedtIdentidade;
	Vcl::Stdctrls::TLabel* Label4;
	Vcl::Dbctrls::TDBEdit* dbedtTelefone;
	Vcl::Stdctrls::TLabel* Label5;
	Vcl::Dbctrls::TDBEdit* dbedtEmail;
	Vcl::Extctrls::TPanel* Panel3;
	Vcl::Stdctrls::TLabel* Label6;
	Vcl::Dbctrls::TDBEdit* dbedtPais;
	Data::Db::TDataSource* dsEndereco;
	Vcl::Dbgrids::TDBGrid* DBGrid2;
	Vcl::Stdctrls::TLabel* Label7;
	Vcl::Dbctrls::TDBEdit* dbedtCEP;
	Vcl::Stdctrls::TLabel* Label8;
	Vcl::Dbctrls::TDBEdit* dbedtLogradouro;
	Vcl::Stdctrls::TLabel* Label9;
	Vcl::Dbctrls::TDBEdit* dbedtNumero;
	Vcl::Dbctrls::TDBEdit* dbedtComplemento;
	Vcl::Stdctrls::TLabel* Label10;
	Vcl::Stdctrls::TLabel* Label11;
	Vcl::Dbctrls::TDBEdit* dbedtBairro;
	Vcl::Dbctrls::TDBEdit* dbedtCidade;
	Vcl::Stdctrls::TLabel* Label12;
	Vcl::Stdctrls::TLabel* Label13;
	Vcl::Dbctrls::TDBEdit* DBEdit1;
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall FormCloseQuery(System::TObject* Sender, bool &CanClose);
	void __fastcall btnNovoClick(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall btnGravarClick(System::TObject* Sender);
	void __fastcall btnAlterarClick(System::TObject* Sender);
	void __fastcall btnExcluirClick(System::TObject* Sender);
	void __fastcall btnCancelarClick(System::TObject* Sender);
	void __fastcall dsClienteDataChange(System::TObject* Sender, Data::Db::TField* Field);
	
private:
	void __fastcall CarregaDadosVirtuais(void);
	void __fastcall GravaDados(void);
	void __fastcall InsereNovoDado(void);
	void __fastcall AbreClientDataSets(void);
	void __fastcall AlteraDados(void);
	void __fastcall DeletaRegistro(void);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TfrmCadastroClientes(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrmCadastroClientes(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrmCadastroClientes(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TfrmCadastroClientes(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE TfrmCadastroClientes* frmCadastroClientes;
}	/* namespace Ucadastroclientes */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_UCADASTROCLIENTES)
using namespace Ucadastroclientes;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// UcadastroclientesHPP
